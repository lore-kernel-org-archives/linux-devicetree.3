Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 435F633D6D7
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 12:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780920540; cv=none; b=p6+NRgCUuhx/Ix2IodyVNMbhw1U81w3e21BWuCrxHv8Z3YExB5V93PRCX8FhcJHnzygVbamwVERjxjf5JNi7q7DJpeag8WJMpmPLYbrH7ECqc7OfbPy01LfZXTX5PULUnw/akne50RfEvBrapEIBW6RgD6tT1QegI+4alH2PDbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780920540; c=relaxed/simple;
	bh=XiYzvzrRYBA/JuO/QX1C2PuSDfSlMv273Z2HFb4Zwn8=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=WdBrKg50QTt78pRi3i5DhRaCsPhNKve04rHLqzIEA/G5JY9eoY4xhNQ8XEt6BgmdaRrA4bIhQmmGfOtZElCko8K4+pvE0DF6By7tXXOdi4jhAHhOGJazq7IoqZUKgUR62L00JZF9NabHQLsFpzco13I/KtkjV8+ry/rVKAfD2b4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kJ8GQ3tg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B05Ywc79; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kJ8GQ3tg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B05Ywc79"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658BBvtE3459841
	for <devicetree@vger.kernel.org>; Mon, 8 Jun 2026 12:08:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	P1bf8K6eKadkefRImKNtRwUweNjPVdl7MQY80nf/beo=; b=kJ8GQ3tgWSIXFx5V
	KaDA7I/oOXBKaOphO2BEwWl4O43NK6C5fXG5css4cuSRahXZQSJ7M6LWA277yIDd
	vbFE/fQlTgh0DwkBIeMjVSxKWJZwTKhNd2cGt3LYOQWetGsihMiFA674NBDuGdCn
	T2CmXqOpD8SBQVd3uM2A/tB1Q81u1AgfC7zhS19jaFSef5M3RcfoqzgvFgSXzL3u
	rxPnzF+YFcDvyPHfZmKGAab09QR2AlL/UuW3hjvycuKtOUubr7pKL9dgJXEnOty2
	3j572mDq302uwdlBIPUzM9FwVws0EnmW5cTyWuN+wu2R4kaF6A2RjTNYf8Nd5UCT
	fGYTMw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4enun8gh5d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 12:08:58 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2bf08c2a24bso40911555ad.2
        for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 05:08:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780920537; x=1781525337; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=P1bf8K6eKadkefRImKNtRwUweNjPVdl7MQY80nf/beo=;
        b=B05Ywc79KY3V9P+NLPC3WSuENgYyZrOnUxpXLRK0HW/SabHTJpmUbQ4nJ4OvfXvO9n
         4/RtgXaUy/bRBR+CML0KfE8l4SW0lFoN7Gm/z3v93nWYMvCQNPixTjyBWQL7bwnqFCa4
         22nFh64n8QCrbg2HRgYzaJb6dDFG8+HvKFg4u6tbx/VyXlxYzf3c41r4TEXf0DMXf5wY
         RG53/7QrEiA63dMXQc0frQfVHIFbpgTJ2Jg3ITS+yn9JXxXl6TokDHrgcRpR7N1YGs7M
         4zvdVyPy2JikIr6VVfT+OTd4dbhx4wTPPYzLQBqRsQ6ah0ASk08pv54isw1u2znLOiXc
         uJXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780920537; x=1781525337;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P1bf8K6eKadkefRImKNtRwUweNjPVdl7MQY80nf/beo=;
        b=HTW5N+7DaLXQFFnarTEU1ecog+jC+NRzcEOhvel7lk3X2wVXz/kJylFr5LfjjjYC+W
         3lrD3hdHBJTC0Wm95qlhfOQWgqwDP+y5Akg8aXiKZm9w7wvHQ4MvkVDhCF+Ne+U0COWs
         fa0+Uk2l4hE6fAmwQj5aTexcZRvmgc1XcZo26hqlN/Qcq8e1CMDnSITzCK3TE6o6i283
         rtDyCC0Up4Ix8+2Y3Rsbj1a9cbxD6DzJJ62pkVrB+TZdNNyIIXQ6rW4QCnrBGJyhSJsf
         vYYDh56uuL4+dfVHssu1rPyn+KQszUi/7ZaBSqsbr0MdPbCtc2BRlxEvzOgRQhLW1jh+
         es/Q==
X-Forwarded-Encrypted: i=1; AFNElJ/RkyKMGkdvOaXq9r7w3GTox+AkB4ztHWuwnlXJ0L067Stb+KGC2XcWk3N5dc9mtiSDCndCaJ4d6Z3j@vger.kernel.org
X-Gm-Message-State: AOJu0YyoaAtZ+3fBv3VpgoUBA37cI5IGiIs3Qws28Dx5GenAGtvK0rgT
	d2Ro6Y5uY8e1Uwx1vOfNRg2GfshZ9zM8nOAEZFBH6Qf5nQMa2hsQAkKcUDXSfB2borwqHc9PvIz
	13pkuzWLXUKV3+ZuvHZC6hjQhgFKrBq9n4BybErjftJYeCugLkohIssCI/wj83Hai
X-Gm-Gg: Acq92OHiyNqMrW8/LMm0adjKZ9lBxXj52ryAL49WeNjIiLw+WQ+dFuKUNGvoI/tqmmg
	8Ax4GIMiA7L+R2s5cypjWsVPmV6jGadY0ykeJy2luxWfy1epN26EN9iMd0uK0CZlA6zqYCOhGlY
	g4XVswiZ7EIAkIevwFokbfeACUKmyqG54jBBPo0ZDQF8cSlwnl/Wr+e56tAFLCxusbBW2V91Z1M
	loLxQboztmGwhArK8/3KUb+Vm4kCD+b9UIHDefj4f4E5Wakf/OfQoSZhBL4HxwbDejyk2BoxvIF
	u6SXEwB58jtbXQfhF2zqE/Ae1GuXJL0zwjNJZpKadrRIuesxiU3WIQ5QpW2ddpPrqVgIwcaSUTh
	1upmSaq2iZaVi1kyLusOfvickaV273IF+WxKXL6CHkpyzD90DRyeiiP+hZLw1M7+d
X-Received: by 2002:a17:903:1ac5:b0:2c2:8659:da2c with SMTP id d9443c01a7336-2c28659dc9bmr20889395ad.14.1780920537347;
        Mon, 08 Jun 2026 05:08:57 -0700 (PDT)
X-Received: by 2002:a17:903:1ac5:b0:2c2:8659:da2c with SMTP id d9443c01a7336-2c28659dc9bmr20888535ad.14.1780920536563;
        Mon, 08 Jun 2026 05:08:56 -0700 (PDT)
Received: from [10.206.105.200] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c1664a67b0sm183538985ad.80.2026.06.08.05.08.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2026 05:08:56 -0700 (PDT)
Message-ID: <b10d6220-08d4-bcef-44c3-6bd2c1e096bb@oss.qualcomm.com>
Date: Mon, 8 Jun 2026 17:38:48 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v7 07/12] media: iris: Add power sequence for glymur
Content-Language: en-US
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org
References: <20260603-glymur-v7-0-afaa55d11fe0@oss.qualcomm.com>
 <20260603-glymur-v7-7-afaa55d11fe0@oss.qualcomm.com>
 <g5fpxwtlajz4p6gn55pjtgb2czjkbjyjlii2zkznle6lbtdgzb@zsiafc57gaco>
 <b9a11d38-13f7-ee33-0537-2557050afdfa@oss.qualcomm.com>
In-Reply-To: <b9a11d38-13f7-ee33-0537-2557050afdfa@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDExNSBTYWx0ZWRfXxZUbGxHF/L2P
 0ANA8CCoAo5T3P8rhzxERFgzZ8RYHsmij+ZKNGQpltI2D377Mh6BRhb/x1eqi9Xy/EYzRyVNbw9
 DlxHTdcjkVSrxrjbteRZbuCCy8kLLg9rIO2Sa0ZWDosnyMAm2Wql0HJAW+giDRZs+ryY9ttE4/3
 XAzTW7C2hVxUUvqiQwNi+Mikdso+nnaXr+BsjnHb3QDAadtSzC9MLHrYHeY9XDIFIrKrWnRxXoU
 HTTg+eRHfAa4tCjZZbAutfvm9LVjdbDLznBy0usrm/wayaNLCgE5fffJJX9R+xYoHzT1jvCTnhL
 CjX/Qo/xrEM5v+PEKR5VYZmjFi8bMW77JoIiNBensGATNjh61qtuB+uXm38QRshhCnAh4iBv4t+
 9RpA3QwXarLdnB3z/jiHs8NpzwiW2iVN8A6kSIhIHuQ36dkl33EPe5kEYzn3EgNbeZrykyZePHb
 6qXEYPXq4BwsRSEjzlQ==
X-Proofpoint-ORIG-GUID: yJLrj19bBl62mQLKdJlCHfy9CZJvbzIU
X-Proofpoint-GUID: yJLrj19bBl62mQLKdJlCHfy9CZJvbzIU
X-Authority-Analysis: v=2.4 cv=Z7rc2nRA c=1 sm=1 tr=0 ts=6a26b0da cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=zzk4QuvOVKE_xORUXiEA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_03,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 bulkscore=0 suspectscore=0 adultscore=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080115


On 6/8/2026 11:09 AM, Vishnu Reddy wrote:
> On 6/8/2026 3:17 AM, Dmitry Baryshkov wrote:
>> On Wed, Jun 03, 2026 at 07:48:45PM +0530, Vishnu Reddy wrote:
>>> Glymur platform has two video codec cores: vcodec0 and vcodec1.
>>>
>>> Both cores share a common clock source (video_cc_mvs0_clk_src) and the
>>> same power rails. The clock dividers between the source and the branch
>>> clocks are fixed. So when both cores are running, the source clock always
>>> runs at the highest frequency requested by either core.
>>>
>>> Since both cores share the same power rails, the power corner cannot be
>>> voted independently. Scaling one core's power corner up or down would
>>> directly affect the other, leading to under or over-voting.
>>>
>>> For these reasons, both cores should voted the clock and power rail must
>>> be based on the workload of both cores.
>>>
>>> Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
>>> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>>> ---
>>>  drivers/media/platform/qcom/iris/iris_vpu3x.c      | 111 ++++++++++++++++++++-
>>>  drivers/media/platform/qcom/iris/iris_vpu_common.h |   1 +
>>>  .../platform/qcom/iris/iris_vpu_register_defines.h |  10 ++
>>>  3 files changed, 117 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/drivers/media/platform/qcom/iris/iris_vpu3x.c b/drivers/media/platform/qcom/iris/iris_vpu3x.c
>>> index 7cda94601555..f07eaf4b3be2 100644
>>> --- a/drivers/media/platform/qcom/iris/iris_vpu3x.c
>>> +++ b/drivers/media/platform/qcom/iris/iris_vpu3x.c
>>> @@ -17,14 +17,14 @@
>>>  #define NOC_HALT				BIT(0)
>>>  #define AON_WRAPPER_SPARE			(AON_BASE_OFFS + 0x28)
>>>  
>>> -static bool iris_vpu3x_hw_power_collapsed(struct iris_core *core)
>>> +static bool iris_vpu3x_hw_power_collapsed(struct iris_core *core, u32 pwr_status_bit)
>>>  {
>>>  	u32 value, pwr_status;
>>>  
>>>  	value = readl(core->reg_base + WRAPPER_CORE_POWER_STATUS);
>>> -	pwr_status = value & BIT(1);
>>> +	pwr_status = value & pwr_status_bit;
>>>  
>>> -	return pwr_status ? false : true;
>>> +	return !pwr_status;
>>>  }
>>>  
>>>  static void iris_vpu3_power_off_hardware(struct iris_core *core)
>>> @@ -32,7 +32,7 @@ static void iris_vpu3_power_off_hardware(struct iris_core *core)
>>>  	u32 reg_val = 0, value, i;
>>>  	int ret;
>>>  
>>> -	if (iris_vpu3x_hw_power_collapsed(core))
>>> +	if (iris_vpu3x_hw_power_collapsed(core, VCODEC0_POWER_STATUS))
>>>  		goto disable_power;
>>>  
>>>  	dev_err(core->dev, "video hw is power on\n");
>>> @@ -78,7 +78,7 @@ static void iris_vpu33_power_off_hardware(struct iris_core *core)
>>>  	u32 count = 0;
>>>  	int ret;
>>>  
>>> -	if (iris_vpu3x_hw_power_collapsed(core))
>>> +	if (iris_vpu3x_hw_power_collapsed(core, VCODEC0_POWER_STATUS))
>>>  		goto disable_power;
>>>  
>>>  	dev_err(core->dev, "video hw is power on\n");
>>> @@ -221,6 +221,98 @@ static void iris_vpu35_power_off_hw(struct iris_core *core)
>>>  	iris_vpu33_power_off_hardware(core);
>>>  }
>>>  
>>> +static void iris_vpu36_power_off_vcodec(struct iris_core *core, u32 core_id)
>>> +{
>>> +	u32 value, i;
>>> +	int ret;
>>> +
>>> +	if (iris_vpu3x_hw_power_collapsed(core,
>>> +					  core_id ? VCODEC1_POWER_STATUS : VCODEC0_POWER_STATUS))
>>> +		goto disable_power;
>>> +
>>> +	value = readl(core->reg_base + WRAPPER_CORE_CLOCK_CONFIG);
>>> +	if (value)
>>> +		writel(CORE_CLK_RUN, core->reg_base + WRAPPER_CORE_CLOCK_CONFIG);
>>> +
>>> +	for (i = 0; i < core->iris_platform_data->num_vpp_pipe; i++) {
>>> +		ret = readl_poll_timeout(core->reg_base + (core_id ? VCODEC1_SS_IDLE_STATUSN :
>>> +					 VCODEC_SS_IDLE_STATUSN) + 4 * i, value,
>>> +					 value & DMA_NOC_IDLE, 2000, 20000);
>> Unreadable. Extract register addresses to separate variables.
> Ack
>
>>> +		if (ret)
>>> +			goto disable_power;
>>> +	}
>>> +
>>> +	writel(core_id ? REQ_VCODEC1_POWER_DOWN_PREP : REQ_POWER_DOWN_PREP,
>>> +	       core->reg_base + AON_WRAPPER_MVP_NOC_LPI_CONTROL);
>>> +	ret = readl_poll_timeout(core->reg_base + AON_WRAPPER_MVP_NOC_LPI_STATUS, value,
>>> +				 value & (core_id ? NOC_LPI_VCODEC1_STATUS_DONE :
>>> +				 NOC_LPI_STATUS_DONE), 2000, 20000);
>>> +	if (ret)
>>> +		goto disable_power;
>>> +
>>> +	writel(0, core->reg_base + AON_WRAPPER_MVP_NOC_LPI_CONTROL);
>>> +
>>> +	writel((core_id ? VCODEC1_BRIDGE_SW_RESET | VCODEC1_BRIDGE_HW_RESET_DISABLE :
>>> +	       CORE_BRIDGE_SW_RESET | CORE_BRIDGE_HW_RESET_DISABLE),
>>> +	       core->reg_base + CPU_CS_AHB_BRIDGE_SYNC_RESET);
>>> +	writel(core_id ? VCODEC1_BRIDGE_HW_RESET_DISABLE : CORE_BRIDGE_HW_RESET_DISABLE,
>>> +	       core->reg_base + CPU_CS_AHB_BRIDGE_SYNC_RESET);
>>> +	writel(0x0, core->reg_base + CPU_CS_AHB_BRIDGE_SYNC_RESET);
>>> +
>>> +disable_power:
>>> +	dev_pm_genpd_set_hwmode(core->vcodec[core_id].dev, false);
>>> +	iris_disable_power_domain_and_clocks(core, &core->vcodec[core_id]);
>>> +}
>>> +
>>> +static void iris_vpu36_power_off_hw(struct iris_core *core)
>>> +{
>>> +	u32 num_cores = max(core->iris_platform_data->num_cores, 1);
>> Can we trust the patch authors that VPU3.6 hardware data will have at
>> least 1 core?
> On Glymur (VPU3.6), num_cores is 2. The max() guard is unnecessary.
> Will access num_cores directly.
>
>>> +	int i;
>>> +
>>> +	for (i = 0; i < num_cores; i++)
>>> +		iris_vpu36_power_off_vcodec(core, i);
>>> +}
>>> +
>>>  #define WRAPPER_DEBUG_BRIDGE_LPI_STATUS		(WRAPPER_BASE_OFFS + 0x58)
>>>  #define WRAPPER_IRIS_CPU_NOC_LPI_CONTROL	(WRAPPER_BASE_OFFS + 0x5C)
>> Lowercase hex.
> Ack

Just now I found that this change is not part of this series.
Can I take this into separate post?

>>>  #define REQ_POWER_DOWN_PREP			BIT(0)
>>> +#define REQ_VCODEC1_POWER_DOWN_PREP		BIT(1)
>>>  
