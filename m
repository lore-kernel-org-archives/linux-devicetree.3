Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FCBE277CA5
	for <devicetree@vger.kernel.org>; Mon,  1 Jun 2026 03:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780285019; cv=none; b=i0l5zNw0VC4Jz0velQpP05fbyz43gsSEFDThg+WniFbYVzclGEhg3nQ8E3AdLeTgN1/bVjmfd2o6+ZsGFSmKI9HLVfWI06Z9SkAjHCnuSZ+Df9pE3JmUer5ZKrZbYiCsF8vFZSrOmmYvT+P7DwWtCfX35qLfHGFdMtOEJWULCgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780285019; c=relaxed/simple;
	bh=1DrukQp3wK0gwEV6QysVx/ctZfa5SwEFhYpTIFcXvjQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LudRHTXokBuNppwkumG81SKgmzDcQ57vldaetkBYUpb/NK6BJDyxZU0b4vo08q3LqWpF+J7v3Xf24tlgXgEXuEU8CBDAkgKbPSLQ4eK0dUgBTy2C3S5BEPveZ8f+Yvj5lqvcVY0KiMfxOYqG9LaPcHpBY+DMq2oqNv1SGwi80Nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OkxK8S7K; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MNRt4d/u; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OkxK8S7K";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MNRt4d/u"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64VN8Wvj3211001
	for <devicetree@vger.kernel.org>; Mon, 1 Jun 2026 03:36:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3txQdlSFxmRAC+wtG5eZ1E/pnnW2GU9vJHnQKB5PM+c=; b=OkxK8S7K5UMKZj8g
	CdurlZWGZU7+eB2JmC6Zhu/Yzy288rmB3MUElnbsdT8id5GvdJvLuOBw456zmARv
	7NqsGXaLETG+WiUHSGFPbJV+ufP8gD2KUS7Pv83M4WKrIiA4w1yYDRz56wcspzWx
	dFTR5nuiDXhH+xyGHUYyw95J9zIRDtfCoilZgEHpQEw8RobYIRSthdqZh3Hd3sf6
	FQTHh6hcV0SR5Sww1akzWyq2hlH6k4S2T0LPHXCEgUpwf88pc2sHMg+CuX49zjhi
	/xXxCDtVACmHNYhgV7UFVYmtyq8oNKLQVtO57R5D9ciF24DWYl9r+4oX8Yq5z0dC
	YV7jZQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4efr98ddea-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 01 Jun 2026 03:36:56 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2bf11699875so38617055ad.1
        for <devicetree@vger.kernel.org>; Sun, 31 May 2026 20:36:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780285016; x=1780889816; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3txQdlSFxmRAC+wtG5eZ1E/pnnW2GU9vJHnQKB5PM+c=;
        b=MNRt4d/uK2wivPDwyCl+0RVP40a/pXj4/zjwQJPUx13XKSR9pMvtSTZuxl3IiQqt1n
         d/3dN2NB8FCilqlL2GC8+YOdjvUlSy6MdxOOrOmQarOMctE+w4y+aes+DSTq/CJERkY6
         b6+/91CiZ+ADCYJWaPQj64eYl5cC3I8KVKA2k74iTXFsVLK8BJ1GhlRTY+bNDvvAg7Py
         YyppOgfQpX2W/N/KMgU2Qzs79pi8a0NgXTzPxNcjYuCsGUJ4wv6leas1cPrt5nJmhiXj
         5VKznM53zdGCUTjAspzUlz1NM/nWNja6ndJQOuDx1zPr6VITu3YeCaVYFTzJ9b4vXvsp
         jKtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780285016; x=1780889816;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3txQdlSFxmRAC+wtG5eZ1E/pnnW2GU9vJHnQKB5PM+c=;
        b=R8dTT1+Ij3mqdY7T1CUHAFUAjZwqA4k+AinORzd06EL2pDjucOOlbvOKxX+2eIKMi1
         fqxxKy2x/UHEjMFMPnJzioVlSMWhOa6VdgNksfkLXpVMAHfpMpluMxTT/LtflW+MrYti
         E0oX7yamLxNKs/bYaDEHNyrLt+yKuwpcPgJp2dzl8Q6kOIZmJLUyKRFBqBpzF3B/8e0V
         JMvlpHVycWVXyN0I17yoIte8ixRm0PUsifRqYsgv/Gw6AxBtwj14y55Gjj5FncZyKNs+
         I06Ah8M3gg51HgwMeCuPZJL23EUJRfMRZ+ARYnqHm4QZv1x8/Jd+v8jXuQZzWJYTDlK6
         Msmw==
X-Forwarded-Encrypted: i=1; AFNElJ8gQbAVwFguq5vS01WIdRQLkoD1PaOOO2VNq0AqbamSHW3PG25/tuu1moJ/As8r+Qxz2QaUOUuG3AOC@vger.kernel.org
X-Gm-Message-State: AOJu0YyuP6NwqfFrJQ24ZeNo94FJk2vP2oGFCxJEI91GpereO/2ctt0n
	h/MUTBozMgWNpNlFwVYCWhAorq92E2aiNOLcM3npFzF9twXKnbcgMrwRf6woX2yF7HEN6c/wn6D
	NPfTbBFyF5C73mgza4dv/S6TEgKD8aHzC2al8Vx88WcAQK8v96kVbqXXMtjL7vsVhBkB3CaRJ
X-Gm-Gg: Acq92OG6ZL74c+Uy1cBNqRNHFuRY3F0ooS9q/ufNEsXUKr6hyDuhAfhM/zZxWODxrUJ
	2Uk/8Ip9cCwnuL4XgI0xuUUXzINZoXHK5/0z+rXpDvjgToHOGdPAlHi+NGORcFFDHR1rnUwGNHv
	c7aVovq/HteFxTN+PYS+gyBp6pJQs18kdVYf1X/+mQx11xgHqY1M2ldcoKMv0xuhLF0eTuvRPVw
	+3uSXDERszwgAwnTw89SN1DbZTIVHLGaJNyz77Nd3E6RaNiTcC4t3TUKaIAihSnMpAaIzokgeGd
	ItbgO0teu1O/oNQ35vklWP2l3FEKjgnD92KTeRuDXGuzM4IZKRZd2P9qSw5RqBvYqsZTASsaSDT
	Gin1Y6h496joPdtOukI30G7ydlKrQcOEZ10YkQYIjBBV6zVVq9sN6IdVK8Z0=
X-Received: by 2002:a17:902:ce07:b0:2bc:ac76:c1d0 with SMTP id d9443c01a7336-2bf3795d52amr80095785ad.17.1780285015991;
        Sun, 31 May 2026 20:36:55 -0700 (PDT)
X-Received: by 2002:a17:902:ce07:b0:2bc:ac76:c1d0 with SMTP id d9443c01a7336-2bf3795d52amr80095275ad.17.1780285015375;
        Sun, 31 May 2026 20:36:55 -0700 (PDT)
Received: from [10.218.5.114] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf239e5c83sm89026105ad.16.2026.05.31.20.36.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 31 May 2026 20:36:54 -0700 (PDT)
Message-ID: <e3b50b6c-cea3-438a-b9b4-f95381d1a37d@oss.qualcomm.com>
Date: Mon, 1 Jun 2026 09:06:49 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/5] clk: qcom: dispcc-qcm2290: Add support for
 Qualcomm Shikra DISPCC
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260528-shikra-dispcc-gpucc-v2-0-953f246a0fbb@oss.qualcomm.com>
 <20260528-shikra-dispcc-gpucc-v2-4-953f246a0fbb@oss.qualcomm.com>
 <qumelrcom3wxzgcibou6vmw2jc5tushr4z2tvmudflgpiqin7w@raf436u5gksb>
 <937bc3b3-bd38-4df4-bee9-c68e83de3ff6@oss.qualcomm.com>
 <dduromih2zmmmqocijyxevabmoioly7lujcvhwucepkz2fjqsu@pogjkd7ugctv>
Content-Language: en-US
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
In-Reply-To: <dduromih2zmmmqocijyxevabmoioly7lujcvhwucepkz2fjqsu@pogjkd7ugctv>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=BaDoFLt2 c=1 sm=1 tr=0 ts=6a1cfe58 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=FgJNp3MjKRr4f5UNy7IA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: qXVCjdQALOmQBiiIShMrbSaSu9HX4plQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDAzMyBTYWx0ZWRfX1pA1DZAkmOwm
 jz82cLj49+7mNSgkzsEhnGW6LWhelySATacPwEPUUSWAs7vmTBOhu9bcwKO8i8wQE6QZCRTJoKL
 Gs1wzcPruOp4sVZUPLvXYjwVE0Qz3Kh3iFsC1Vdacmh7+smMxqlGidVWVa6Wy2Rm9oDUbzyVRiG
 +P+HxRDQy0DJzBHteDFKRe01YRysWWXWyTIOrSmZn+PRDLFiyGUi0MIUSjdYecal7jMbZKCuXCP
 EJus+kd6p99yN/gPNhFiugv16LComY4hnM8YecyJlTuYViHXQX9XmimAYsXmKGIYfSUnqQbo2WF
 F+qDChxezxshSLr84RhPoUbdp0jkjxFa1B8gp4Ca2GplPWMXxaN0IKDdIsXphXx1GdlCitW3CgF
 3Wu60Wai03EsnWWpUIISHA019jfra4y+5lJd+uBBtmIsX0AmlDq829h5GVg00yMPSZoU+1peHzx
 c68Ejt9Z+ZwM6tMiLuA==
X-Proofpoint-ORIG-GUID: qXVCjdQALOmQBiiIShMrbSaSu9HX4plQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_01,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 phishscore=0 malwarescore=0 impostorscore=0
 adultscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606010033



On 29-05-2026 05:04 pm, Dmitry Baryshkov wrote:
> On Fri, May 29, 2026 at 02:53:45PM +0530, Imran Shaik wrote:
>>
>>
>> On 28-05-2026 07:12 pm, Dmitry Baryshkov wrote:
>>> On Thu, May 28, 2026 at 03:37:05PM +0530, Imran Shaik wrote:
>>>> The Qualcomm Shikra Display clock controller reuses the QCM2290 DISPCC,
>>>> but has minor differences. Update the parent data of mdss ahb/mdp clocks
>>>> accordingly to the hardware clock plan and correct the GDSC *_wait_val and
>>>> flags which are applicable for both QCM2290 and Shikra SoC, and add the
>>>> support for DSI1 PHY source.
>>>>
>>>> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
>>>> ---
>>>>    drivers/clk/qcom/dispcc-qcm2290.c | 18 +++++++++++++-----
>>>>    1 file changed, 13 insertions(+), 5 deletions(-)
>>>>
>>>> diff --git a/drivers/clk/qcom/dispcc-qcm2290.c b/drivers/clk/qcom/dispcc-qcm2290.c
>>>> index 6d88d067337fa132114b0d8666931b449f86de17..19c997f3fe9f197d2c252a9dd1e8169947200f5f 100644
>>>> --- a/drivers/clk/qcom/dispcc-qcm2290.c
>>>> +++ b/drivers/clk/qcom/dispcc-qcm2290.c
>>>> @@ -2,6 +2,7 @@
>>>>    /*
>>>>     * Copyright (c) 2020, The Linux Foundation. All rights reserved.
>>>>     * Copyright (c) 2021, Linaro Ltd.
>>>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>>>>     */
>>>>    #include <linux/clk-provider.h>
>>>> @@ -32,6 +33,8 @@ enum {
>>>>    	P_GPLL0_OUT_DIV,
>>>>    	P_GPLL0_OUT_MAIN,
>>>>    	P_SLEEP_CLK,
>>>> +	P_DSI1_PHY_PLL_OUT_BYTECLK,
>>>> +	P_DSI1_PHY_PLL_OUT_DSICLK,
>>>>    };
>>>>    static const struct pll_vco spark_vco[] = {
>>>> @@ -84,7 +87,7 @@ static const struct clk_parent_data disp_cc_parent_data_1[] = {
>>>>    static const struct parent_map disp_cc_parent_map_2[] = {
>>>>    	{ P_BI_TCXO_AO, 0 },
>>>> -	{ P_GPLL0_OUT_DIV, 4 },
>>>> +	{ P_GPLL0_OUT_MAIN, 4 },
>>>
>>> Why?
>>>
>>>>    };
>>>>    static const struct clk_parent_data disp_cc_parent_data_2[] = {
>>>> @@ -101,17 +104,19 @@ static const struct parent_map disp_cc_parent_map_3[] = {
>>>>    static const struct clk_parent_data disp_cc_parent_data_3[] = {
>>>>    	{ .fw_name = "bi_tcxo" },
>>>>    	{ .hw = &disp_cc_pll0.clkr.hw },
>>>> -	{ .fw_name = "gcc_disp_gpll0_clk_src" },
>>>> +	{ .fw_name = "gcc_disp_gpll0_div_clk_src" },
>>>
>>> Do you realize that this is an undocumented ABI chance?
>>>
>>>>    };
>>>>    static const struct parent_map disp_cc_parent_map_4[] = {
>>>>    	{ P_BI_TCXO, 0 },
>>>>    	{ P_DSI0_PHY_PLL_OUT_DSICLK, 1 },
>>>> +	{ P_DSI1_PHY_PLL_OUT_DSICLK, 2 },
>>>>    };
>>>>    static const struct clk_parent_data disp_cc_parent_data_4[] = {
>>>>    	{ .fw_name = "bi_tcxo" },
>>>>    	{ .fw_name = "dsi0_phy_pll_out_dsiclk" },
>>>> +	{ .fw_name = "dsi1_phy_pll_out_dsiclk" },
>>>>    };
>>>>    static const struct parent_map disp_cc_parent_map_5[] = {
>>>> @@ -153,8 +158,8 @@ static struct clk_regmap_div disp_cc_mdss_byte0_div_clk_src = {
>>>>    static const struct freq_tbl ftbl_disp_cc_mdss_ahb_clk_src[] = {
>>>>    	F(19200000, P_BI_TCXO_AO, 1, 0, 0),
>>>> -	F(37500000, P_GPLL0_OUT_DIV, 8, 0, 0),
>>>> -	F(75000000, P_GPLL0_OUT_DIV, 4, 0, 0),
>>>> +	F(37500000, P_GPLL0_OUT_MAIN, 8, 0, 0),
>>>> +	F(75000000, P_GPLL0_OUT_MAIN, 4, 0, 0),
>>>
>>> Why? It's not mentioned in the commit message.
>>>
>>
>> As per the HW clock plan, the ahb(parent_*_2)/mdp(parent_*_3) clock RCG
>> parent must be GPLL0_OUT_MAIN (gcc_disp_gpll0_div_clk_src). Updated them
>> accordingly and mentioned the same in the commit text below:
>>
>> "Update the parent data of mdss ahb/mdp clocks accordingly to the hardware
>> clock plan"
>>
>> Will move these to indices approach, and add in a separate commit as you
>> mentioned in the other patch comment.
> 
> 
> Why are you trying to move to indices?
> 

As there is no functional impact I was of the opinion to move it to 
indices based and make it aligned with latest convention during cleanup.

>>>>    	{ }
>>>>    };
>>>> @@ -450,11 +455,14 @@ static const struct qcom_reset_map disp_cc_qcm2290_resets[] = {
>>>>    static struct gdsc mdss_gdsc = {
>>>>    	.gdscr = 0x3000,
>>>> +	.en_rest_wait_val = 0x2,
>>>> +	.en_few_wait_val = 0x2,
>>>> +	.clk_dis_wait_val = 0xf,
>>>>    	.pd = {
>>>>    		.name = "mdss_gdsc",
>>>>    	},
>>>>    	.pwrsts = PWRSTS_OFF_ON,
>>>> -	.flags = HW_CTRL,
>>>> +	.flags = HW_CTRL_TRIGGER | POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
>>>
>>> And this also needs explanation.
>>>
>>
>> Sure, will add these GDSC fixes in separate commit in next series.
> 
> With the proper justification, please.
> 

Sure.

Thanks,
Imran
