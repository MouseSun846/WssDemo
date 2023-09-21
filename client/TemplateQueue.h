//
// Created by root on 4/27/23.
//

#ifndef MAS_TEMPLATEQUEUE_H
#define MAS_TEMPLATEQUEUE_H
#include <queue>
#include <mutex>
#include <condition_variable>
#include <memory>
#include <atomic>

template<typename T>
class TemplateQueue
{
private:
    mutable std::mutex mut;
    std::queue<std::shared_ptr<T> > data_queue;
    std::condition_variable data_cond;
    std::atomic_bool m_isActive;
public:
    TemplateQueue()
    {
        m_isActive = true;
    }

    void SetIsActive(bool isActive) {
        m_isActive = isActive;
    }

    void SetIsActiveAndNotify(bool isActive) {
        m_isActive = isActive;
        data_cond.notify_one();
    }

    void WaitAndPop(T& value)
    {
        std::unique_lock<std::mutex> lk(mut);
        data_cond.wait(lk,[this]{return !data_queue.empty();});
        value=std::move(*data_queue.front());
        data_queue.pop();
    }

    bool WaitActiveAndPop(T& value)
    {
        std::unique_lock<std::mutex> lk(mut);
        data_cond.wait(lk,[this]{return !data_queue.empty() || !m_isActive.load();});
        if(m_isActive.load()) {
            value=std::move(*data_queue.front());
            data_queue.pop();
            return true;
        }
        return false;        
    }    

    bool TryPop(T& value)
    {
        std::lock_guard<std::mutex> lk(mut);
        if(data_queue.empty())
            return false;
        value=std::move(*data_queue.front());
        data_queue.pop();
        return true;
    }

    std::shared_ptr<T> WaitAndPop()
    {
        std::unique_lock<std::mutex> lk(mut);
        data_cond.wait(lk,[this]{return !data_queue.empty();});
        std::shared_ptr<T> res=data_queue.front();
        data_queue.pop();
        return res;
    }

    std::shared_ptr<T> TryPop()
    {
        std::lock_guard<std::mutex> lk(mut);
        if(data_queue.empty())
            return std::shared_ptr<T>();
        std::shared_ptr<T> res=data_queue.front();
        data_queue.pop();
        return res;
    }

    void Push(T new_value)
    {
        std::shared_ptr<T> data(std::make_shared<T>(std::move(new_value)));
        std::lock_guard<std::mutex> lk(mut);
        data_queue.push(data);
        data_cond.notify_one();
    }

    bool Empty() const
    {
        std::lock_guard<std::mutex> lk(mut);
        return data_queue.empty();
    }

    size_t Size() const {
        std::lock_guard<std::mutex> lk(mut);
        return data_queue.size();
    }

};

#endif //MAS_TEMPLATEQUEUE_H
