Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B1562F7F03
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 17:24:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781112283; cv=none; b=BBHu1PTqmydxwcd1zuGqZ2VKstR8aervNCMHOk9dL6xMI3uKpH+Bo6NnpwyMNZNAlvkbVNhC+6P3wDriQG6sv6cMRgsYKu6UTFCjKloW7I+nu0XNdi0G2RsqChnNPvwyfyS3rQK05u7StC/4itB9xCjrEmkLkJOFFHQlqenKKUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781112283; c=relaxed/simple;
	bh=7sxSIWuiDdngtEpOJtIYRzsR+xkl8ex2VgVFRGD/gkM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fKAb3dz84aBoUwBay93cxyFCNxxBxr1+aI8qXlY+OZyq0mbpMxqmguNldsFFqjkTJ2phZ8ttevMrvef8nd/If2c7w9qsVdJpeueBatNYpoMfeMKvlmxSuT5fj43Q9/A14wavTSwmQXuK6KdJRXRNPHBBNsMKP8gq3F8GXZruvnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZRE+QaKA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=km1o8YRW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZRE+QaKA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="km1o8YRW"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65AFwdFF1598634
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 17:24:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MAEzp4s+Abu40cq3+C0nFejCUfG1tPM3EKMGymopLDk=; b=ZRE+QaKAZW4XA8ji
	vuDEDQDALPCXlbVSv68rakoAvORkUndKhqYeB0vk7HQvXWEhp2sqZmPAboVLsYJO
	twKWSYsl0Nx+EakTBs4e3yXyZcnExfn1v2zm5LB9Y4hgLVdrYwzfcSGhCgVITYcg
	hjxPKfDstUDxOuRM7YK9nWIlZRpmsIDEdBSpDCJgiQqyvoZTKom6CyRhrt0vMPWI
	vOt4rOrRSQWA04/kVOKg0uUdADrpLt7ok8qNojh2I17k3Bnagvw6ie+ivmSyB0TF
	MJDmQaBBg5NeSRjUqpnPHo5QeEWw1TANMZYzAiY5m0w7r1A+0xDTSIuJSs9uM+y4
	l3l8rg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epxuvkg3q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 17:24:41 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-36d98b54cf2so5071918a91.1
        for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 10:24:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781112281; x=1781717081; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MAEzp4s+Abu40cq3+C0nFejCUfG1tPM3EKMGymopLDk=;
        b=km1o8YRWJNuv9SO9ooEkYCW40FD6wCgH8hbP/DJDmBmc0WFIDlcuSbnS192vvltQ/p
         YFNr8k2gldsJTvy+j/3hcoS2b9Uy53D4xxxz21s0PNHSXUizEDne4n7NS8lfiRd8JZ21
         qV1WYs8k2ufR/6p5xpq88h29jo1ekyzedUgXBBknkcw/gXRm1qcH/UllzVQjKrUfu5qN
         TLf0ilWNZ7Ndr/C/Prb7vHebxhqf7SePmzkyMIkA2g1GZR5GMrphgwi/9ZHF0LFPG8+c
         L0rBiDZTNDiHe2ASXN3ADNscmE80xgxDGKIQvJZ1E1UrBnEBo6jkwMNK7D6uVYAtnpbW
         ZqPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781112281; x=1781717081;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MAEzp4s+Abu40cq3+C0nFejCUfG1tPM3EKMGymopLDk=;
        b=rUQXMlovudbBBwR5MlpIdIGaGNo2z+NjWDeDBOuktEWr7qKncmQz+YCpzqJYr6Rq9u
         53yGFrF7F9SatPc76ycvlOHcHrSYDJZJL/iU95+yTawcc2A8ILp0YIeiCe4eUMQwvLBm
         xIQAY9esqxASxe+KqTavWhU/urOx5Aq2qLhHbfTFM6rm0AP94wdG0FH7Kb1EMZmoRR4n
         MYHlpmEDcY3jrebs5V17xJuy9p3DN+p1j36I4xbfatEAHjTg6F4IazEu6VVVn2cQh20i
         Uf/TGEZR09oJGXVBtEFMZmq1yis7esBvcWTtHcIWuyEAlfWQ+gHZfjQu37slysdYn0yQ
         l3cQ==
X-Forwarded-Encrypted: i=1; AFNElJ/h7CECMa4a5KbaDSR2B/9BrwC9fXT1ksztRZInFj2/ZVeOb4mqxKwnb8f77baqq5SuVjliBYq2JYKC@vger.kernel.org
X-Gm-Message-State: AOJu0Ywf1O8idsgXg9ZwdHF98A1r7vcvZtC0PdIhioeo+XmeDSblB+J4
	oq19BZOzTXqgo95zjNtiw03PAxn/ovfMA17UzJoO+CibX8O1AWJZ6ABcAhz0NEy0jlfqUt1HmBP
	Hsxhoe1+yMKQnY1/KAHvBsH4QBQ7oP9h8eS1Zv1bsepeGW/NNunbil8hYXr3mFA1r
X-Gm-Gg: Acq92OFayFAMzOv9WNBissoqagud/OPfQdBgjz7jbLIF7PVobOaJhmF47yGK9WGcRR7
	0Q4Xvw/evLpp35q6uVPcbfDuyRKpdnqQym0ZbKmdEoAJAvIIdiq60J+6o7otQJakD1xee2BRuFQ
	lf/sxvEKhf6ysS6BbdVzpfg4017M+qErPRoIBKPU4Ec7p957K7+1kQ10XZ1VdhJgdaHcBk+xF9O
	g4T0VALusBd6jIlWpZt4HRaqp3FusjRI12eSFCzoPhgwqH4aZ4jl+zWz8IMSq7C5aw3HjYrvq1x
	Ym0VYwg40H84SnmF/b0PG9GDrHp88ec5bEl9O9rh5drX1uc71sXJCL0RU/09MEtOMhfxssO2Mg9
	tdEKCfx4IZfIpVOkDcxQQ9YY5w8Ai/v91bnFsYa/V3vpFttynnje9b4uuXojU
X-Received: by 2002:a17:90a:d44f:b0:368:6998:b4a9 with SMTP id 98e67ed59e1d1-370eed08e71mr25719004a91.11.1781112280689;
        Wed, 10 Jun 2026 10:24:40 -0700 (PDT)
X-Received: by 2002:a17:90a:d44f:b0:368:6998:b4a9 with SMTP id 98e67ed59e1d1-370eed08e71mr25718979a91.11.1781112280212;
        Wed, 10 Jun 2026 10:24:40 -0700 (PDT)
Received: from [192.168.0.195] ([49.204.30.116])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3772c4567ecsm308907a91.7.2026.06.10.10.24.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2026 10:24:39 -0700 (PDT)
Message-ID: <4fb85204-a19b-4a8b-9f37-b841673d57b4@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 22:54:26 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/12] clk: qcom: gcc-mdm9607: Fix halt_reg for
 gcc_apss_axi_clk
To: Stephan Gerhold <stephan.gerhold@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260609-qcom-clk-mdm9607-fixes-v1-0-5e9717faf842@linaro.org>
 <20260609-qcom-clk-mdm9607-fixes-v1-5-5e9717faf842@linaro.org>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20260609-qcom-clk-mdm9607-fixes-v1-5-5e9717faf842@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: JVJeThokjE3ps7IMYuoC_-0jtozIAVPO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDE2NCBTYWx0ZWRfXwamJfq6Ts5kE
 xH/G+80dx/1yjYgnp4ShWWnqQOeEU8rgyH6Q6x51t7Z7FoZfK8mXj/HiUTlNhODCI52DCoL7Ru+
 zy4SDHoWebC+PLssxbKiGockqFL8Jm4z+ygknzqDp61X6NRwOjDBi1E1Iw5ZDRUQ2yQLzn8dyL/
 I5HvNERqLjOfh6lIaXGvrLR4FoXcQWQyOFk6GTSP8yc7UnFjjSv5ZP+gpp0KrtCpz7w9hMeIJfL
 svViTv6NnktB5TfKZdmhzjhfpF339KbA7iGFk2Nk3DXoHS7DAW4KzJEp5hZPnRqBlmDNFit97N2
 C4UoJq+7F3RVwaK/m5Q8PKBn4dIO48puvOL8BzfJH4FNCCxkHthVFB+ennn468JA9gdzZK+B7kC
 B62yogjIqTgOrCWDkFIWfMmzGW6Y+ATpCca9EiFgt/BjoS5AT7m1ZiMo6SaehMgVSp0T6mDVNtp
 b4qMAGUjJZgVZKWQYeA==
X-Authority-Analysis: v=2.4 cv=Co+PtH4D c=1 sm=1 tr=0 ts=6a299dd9 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=wot0Jldcyx0dIQi3j0aq2Q==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=kpey41sLADR_CTz9gPIA:9 a=QEXdDO2ut3YA:10 a=w9sP1k96Qs4A:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: JVJeThokjE3ps7IMYuoC_-0jtozIAVPO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 spamscore=0 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100164



On 6/9/2026 7:44 PM, Stephan Gerhold wrote:
> --- a/drivers/clk/qcom/gcc-mdm9607.c
> +++ b/drivers/clk/qcom/gcc-mdm9607.c
> @@ -1463,7 +1463,7 @@ static struct clk_branch gcc_apss_ahb_clk = {
>  };
>  
>  static struct clk_branch gcc_apss_axi_clk = {
> -	.halt_reg = 0x4601c,
> +	.halt_reg = 0x46020,
>  	.halt_check = BRANCH_HALT_VOTED,
>  	.clkr = {
>  		.enable_reg = 0x45004,

Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>

-- 
Thanks,
Taniya Das

