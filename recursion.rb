

def range(first,last)
    #new_arr = [] 
    return [] if  last < first
    return [first] if last-1 == first
    [first] + range(first+1, last)
end


def exp(b, n)
    return 1 if n == 0
    return b if n == 1
    b * exp(b, n-1) 
end


def exp2(b, n)
    return 1 if n == 0
    return b if n == 1

    if n.even?
        exp2(b, n/2) * exp2(b, n/2)
    else
        b * (exp2(b, (n-1)/2) * exp2(b, (n-1)/2))
    end
end

def dup(arr, new_arr=[])
    if arr.is_a?(Array)
        new_arr << arr[0] unless arr[0] == nil
        dup(arr[1..-1],new_arr)
    end
    new_arr
end

def iter_fib(n)
    fib = [0, 1]
    return fib[n-1] if n <= 2
    i = 1
    while i < n-1
        fib << fib[i] + fib[i-1]
        i += 1
    end
    fib
end


def rec_fib(n)
    return nil if n <= 0
    return [0] if n == 1
    return [0,1] if n == 2

    fib = rec_fib(n-1)
    fib << fib[-1] + fib[-2]
end


def binary_search(arr,target)
    
    mid_idx = arr.length % 2 == 0 ?  arr.length / 2 : (arr.length-1)/2
    return mid_idx if arr[mid_idx] == target 
    
    if arr[mid_idx] > target
        binary_search(arr[0...mid_idx], target)  
    elsif arr[mid_idx] < target
        binary_search(arr[mid_idx+1..-1], target) ? (mid_idx+1) + binary_search(arr[mid_idx+1..-1], target) : nil
    end
end

def merge_sort(arr)
    return [] if arr.length == 0
    return arr if arr.length == 1
    left_side = arr[0...arr.length/2]
    right_side = arr[arr.length/2..-1]
    left_previous = merge_sort(left_side)
    right_previous = merge_sort(right_side)
    sort(left_previous, right_previous) 

end

def sort(arr_1,arr_2)
    i, j = 0, 0
    new_arr = []
    while true
        if arr_1[i] > arr_2[j]
            new_arr << arr_2[j]
            j += 1
        else 
            new_arr << arr_1[i]
            i += 1
        end
        break if i == arr_1.length || j == arr_2.length
    end
    i == arr_1.length ? new_arr.push(*arr_2[j..-1]) : new_arr.push(*arr_1[i..-1])
    new_arr
end
# p merge_sort([38,27,43,3,9,82,10])
#p sort([1,3,4], [2,7,8])
=begin
     while new_arr.length < (arr_1.length + arr_2.length)
        p "arr_1 at i #{arr_1[i]} arr_2 at j #{arr_2[j]}"
        
        if i >= 0 && i < arr.length
            if arr_1[i] > arr_2[j]
                new_arr << arr_2[j]
                j += 1
            elsif arr_1[i] < arr_2[j]
                new_arr << arr_1[i]
                i += 1
            else 
                new_arr.push(arr_1[i], arr_2[j])
                i += 1
                j += 1
            end
        else 
            if i >= arr_1.length
                new_arr.push(arr_2[j])
                j += 1
            elsif j >= arr_2.length
                new_arr.push(arr_1[i])
                i += 1
            end
        end
=end


def subsets(arr)
    return [[]] if arr.length == 0
    prev = subsets(arr[0..-2])
    others = prev.map { |subarr| subarr += [arr.last] }
    prev + others
end

# p subsets([1,2,3]) 

def permutations(array)
    return [array] if array.length == 1
    prev = permutations(array[0...-1])
    last = [array.last]
    prev + last
end

p permutations([1, 2, 3])
p [1].permutation.to_a
