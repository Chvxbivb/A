function randomSeq1 = gen_seq(KEY, numIterations, ca_positions, caRule)

    x = KEY;  % 设置初始值

    % 初始化变量（这里是热身迭代，用于确保混沌序列的复杂性）
    for i = 1:1000
        if ca_positions(mod(i, numIterations) + 1)
            % 使用CA规则进行迭代
            x = applyCARule(x, caRule);
            x = Chaoticmap(x);
        else
            x = Chaoticmap(x);  % 应用迭代公式
        end
    end

    randomSeq1 = zeros(1, numIterations, 'uint32');  % 创建一个数组来保存迭代结果

    % 迭代过程
    for i = 1:numIterations
        if ca_positions(i)
            % 使用CA规则进行迭代
            x = applyCARule(x, caRule);
            x = Chaoticmap(x);
        else
            x = Chaoticmap(x);  % 应用迭代公式
        end
        randomSeq1(i) = x;  % 保存当前迭代的结果
    end
end
