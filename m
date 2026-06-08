Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17CC5378833
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 05:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780897173; cv=none; b=NRiMl+Epp66vyZVwGfwh4CBLklvnefBDBjiqC0YwY7k235AGxHLdewXLfhldk6yGFWYHVw2JH0ddyj1ptN7b+qLgIdbXUGx/7RD8MSs+5CbCBPFmjVDTuzFrgIc1h2cZiVNKxTC7U6Fi+rDtRYzrf/qu+Kof2W5PXDDxKDloYNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780897173; c=relaxed/simple;
	bh=cMCkxruPB0+/BzQoZuFiIbm/OEHgsUhSYjlGeEC+JAM=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=po1tUfbpknFKeEsAnnxSEy+TxlxcSHvxjh03d03Gm2fM+gS27TZi1YpaGq1iga0+kNlNz9fu48IkjhpkeTdJObmvbupgpmLzvq0cLdftZ1kZZU36fSAsBSZZnlFwivOCQ3KHch4+y3eTB3a/0Xce3alHnwnAZitpyxEc4jejDoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Aux8Bjki; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f4JQ9de1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Aux8Bjki";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f4JQ9de1"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6580F3uM1471433
	for <devicetree@vger.kernel.org>; Mon, 8 Jun 2026 05:39:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0HUAabhh/cNwlZD3LTk55FqmkLMmZVgRrQqnCafWe2g=; b=Aux8BjkioW1WDjDC
	fiEEiqjE79eRs9GyMm9EA+dmldhCR5bCbUFu+lz8UOy9hlUWW88+WrcujAF365p8
	Lqf9vwGHMkWekA/kQtBM3bO20YYIdLDkn+ZaCpSRTeV+eAJ2MYbZKDoVjeihkzOM
	tFMGttspDZOdqccrwqmKzNqmaJ8KapXcE3qFy+eHM8etnIJ3Xhq1Mp1ME7CJ+glT
	RaZomr6hDzH+JydZ5acKIPaEWfMuBZ/Rw7ckBOEYXzmPlog2TstOQNY5FhEO/eU2
	UOZsxN3N0Vq+KqN1i15kIfW6wECKDBytGdpmiZnKW2HgOuidvcZzNn+ROL56jzC2
	qaIVRw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emcqgwpu5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 05:39:31 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-36bbcd40642so2864103a91.0
        for <devicetree@vger.kernel.org>; Sun, 07 Jun 2026 22:39:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780897170; x=1781501970; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0HUAabhh/cNwlZD3LTk55FqmkLMmZVgRrQqnCafWe2g=;
        b=f4JQ9de1o+A8hrutcn4BXxXC+QrVb+3ks+9ZzKPxEyTgwfQwIaiFdASax9qigdrMNh
         wnqBgBu9zyN4AO7ZqqShh2FZlj4UZ+MeZXSTsC8dkG/TPk+w+XD1IkPQqOMlSPXeb/k5
         riORXHd3wCWXkZLrb8b+YCkODTg3jYBvFhx/F4LSBVwjxGfXAk5bur0LtTUr+lfDtKhA
         gnojzVeiWQfo2fCuv5Sjo9JJR3GS+lNVhuoposaPUOtjHIvcartK9tcBYzMX0bc7oOwZ
         nTitc+GBagUil498DZ/rAJIS2nu/bkTJ83m6cc7Y11IFqdq29b6zfDLiorfQ7VRzpmA7
         E/vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780897170; x=1781501970;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0HUAabhh/cNwlZD3LTk55FqmkLMmZVgRrQqnCafWe2g=;
        b=ICjYtt4BDTlZZ7HzSu5WLbMlcom3HNg5M3aA/2KkcBkWtfW/VdIhl+seGaH7SjSdHs
         YhqpqcYOYTBrIpbTEbWv9tpHEaTsyYqJtjHc/xnRfCRxdD2dGPz4GuJaUnevLRwynX1K
         LH0NOZrweBRA0/bc2wvDMY+8n0qwa03bkk6h7kySw8tfN1yr2HE5fx/gDwBzo7dSmLyV
         oppBgaKxk0YfB9aOAzKDPWgKd7xEosghJy2AsRyn896CuJpdNI1+B1t5R3wUuK30FaOY
         3Ke2IKvzsgR/Cfnl2DnzEMkmgK7C6R7tuBtVV8cx1nOLTzpoQvlRyuZqDghcVhYLmi1x
         ENLQ==
X-Forwarded-Encrypted: i=1; AFNElJ9tASE607QBJg0wEe8npMjVgIhb6LxHe0ux8RWDZBRx9g0VhD3Q7QweEh1mHpWCsKWqtbU8jqO9/HkX@vger.kernel.org
X-Gm-Message-State: AOJu0YwrFKEQTqbhsoUoaK7+uqFE9cazy6pFExiRzxB4/dWYs4K7Dx55
	HHKhJfC3euvtA1SDiIkftC2sDYgtrJ8sPAcMfbPn+z/Ac++j1bbgOppbHGJi701JkRx+JPbzGoW
	KfBY/vnNYFqp3R6ntOIKES6N0Q7/HbmgHps0KFdrRsq+uENJ2QYgGNKGXIiTB7BwM
X-Gm-Gg: Acq92OH3EiHDMBxEVLXiN+OTbt/CFYHkpDlpxeQ1Aal3pnvYFcnpPxfDWqK/7JL7uhg
	ipPTS5v9W+Z9rXMfkApOdP4DapWBkM3Xb1qspoBgCJ4EXZRq7eImqf4gTrlqcXrYy3hFxUpltPP
	r+bpW50/+yLyNKLDXIPQeTkj7xjNNCLykQBdAxcEiZM+rY6Q+x2js7BQWTiFyj1HI/2TOBT0Wpp
	XNh9Kv/mr7ASCAhtqftPXxHozKtCPJ+kF0WSq82CMmlRDyfvrdu5yPR59sPBNL0FDPr1UeoZaIF
	YzLwQsbh13lQXxG7dekFuncih3dJJN2m2LxkmxA2k2d6J25s0kIn9q/SSdIBOC4EHCDsHyJkQRJ
	8PZ/glnSS8fOkBlgj9bW7Hha+ENCFkI21b8gXtKislBYEGGzjnRlrD9Q1RG9uWs2N
X-Received: by 2002:a17:90b:548e:b0:369:e4d4:79c6 with SMTP id 98e67ed59e1d1-370f0b55fbemr14256616a91.20.1780897170493;
        Sun, 07 Jun 2026 22:39:30 -0700 (PDT)
X-Received: by 2002:a17:90b:548e:b0:369:e4d4:79c6 with SMTP id 98e67ed59e1d1-370f0b55fbemr14256589a91.20.1780897170005;
        Sun, 07 Jun 2026 22:39:30 -0700 (PDT)
Received: from [10.206.105.200] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3712ef0add7sm8612386a91.0.2026.06.07.22.39.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 Jun 2026 22:39:29 -0700 (PDT)
Message-ID: <b9a11d38-13f7-ee33-0537-2557050afdfa@oss.qualcomm.com>
Date: Mon, 8 Jun 2026 11:09:22 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Subject: Re: [PATCH v7 07/12] media: iris: Add power sequence for glymur
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
Content-Language: en-US
In-Reply-To: <g5fpxwtlajz4p6gn55pjtgb2czjkbjyjlii2zkznle6lbtdgzb@zsiafc57gaco>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=dJGWXuZb c=1 sm=1 tr=0 ts=6a265593 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=XOSsvO-zd5c9LZtoon0A:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: G5O8GWsjE0YAvJNqJalhCj_sfZT9Q9D1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA0OSBTYWx0ZWRfXzNlCSrPecM7F
 BGTFLRm++rY37K8Qeb2xr9xI0emuezmf4y22bQlrNvgHdchSlBcL8LKoqyEsdic2/Wv93H0r7Ey
 XUhyqJ6uBKCVyHbUTMZFJaPcQv/yhR5ag2Vc03saA6zmX367uthxitUXwxQWEjlq2XskSDgJM3p
 zHWJqF5gmiYMzRtnm+0Xper98eQkp2aDRbwEPipOAQq4OuO6qD/pLdkTENbWLsEFMQwL5yp7CMv
 jc5/kvwzGqUL25lNsk/6QqrLzLMunKK8LCANukeS67A/ZSMwS9Blx8lGTCp/F66QfUfVTWUnS7O
 NssWvbqzlQ1mVhCt2d3rY3YIHI3kRWky9okpOzWmvIcj0Kq5wmL89Y1r4uMrBUtzoVMBwWifX3g
 j9QfnQPDyIYwi5NoXD2Yc+axZ9h444RZF/N7+zrrAvmfL14VJgn+BJLA8kHs7xfveE/2nr44C13
 rgUVt44A5Z4V7l1imMw==
X-Proofpoint-ORIG-GUID: G5O8GWsjE0YAvJNqJalhCj_sfZT9Q9D1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_01,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 adultscore=0 phishscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080049


On 6/8/2026 3:17 AM, Dmitry Baryshkov wrote:
> On Wed, Jun 03, 2026 at 07:48:45PM +0530, Vishnu Reddy wrote:
>> Glymur platform has two video codec cores: vcodec0 and vcodec1.
>>
>> Both cores share a common clock source (video_cc_mvs0_clk_src) and the
>> same power rails. The clock dividers between the source and the branch
>> clocks are fixed. So when both cores are running, the source clock always
>> runs at the highest frequency requested by either core.
>>
>> Since both cores share the same power rails, the power corner cannot be
>> voted independently. Scaling one core's power corner up or down would
>> directly affect the other, leading to under or over-voting.
>>
>> For these reasons, both cores should voted the clock and power rail must
>> be based on the workload of both cores.
>>
>> Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
>> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>> ---
>>  drivers/media/platform/qcom/iris/iris_vpu3x.c      | 111 ++++++++++++++++++++-
>>  drivers/media/platform/qcom/iris/iris_vpu_common.h |   1 +
>>  .../platform/qcom/iris/iris_vpu_register_defines.h |  10 ++
>>  3 files changed, 117 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/media/platform/qcom/iris/iris_vpu3x.c b/drivers/media/platform/qcom/iris/iris_vpu3x.c
>> index 7cda94601555..f07eaf4b3be2 100644
>> --- a/drivers/media/platform/qcom/iris/iris_vpu3x.c
>> +++ b/drivers/media/platform/qcom/iris/iris_vpu3x.c
>> @@ -17,14 +17,14 @@
>>  #define NOC_HALT				BIT(0)
>>  #define AON_WRAPPER_SPARE			(AON_BASE_OFFS + 0x28)
>>  
>> -static bool iris_vpu3x_hw_power_collapsed(struct iris_core *core)
>> +static bool iris_vpu3x_hw_power_collapsed(struct iris_core *core, u32 pwr_status_bit)
>>  {
>>  	u32 value, pwr_status;
>>  
>>  	value = readl(core->reg_base + WRAPPER_CORE_POWER_STATUS);
>> -	pwr_status = value & BIT(1);
>> +	pwr_status = value & pwr_status_bit;
>>  
>> -	return pwr_status ? false : true;
>> +	return !pwr_status;
>>  }
>>  
>>  static void iris_vpu3_power_off_hardware(struct iris_core *core)
>> @@ -32,7 +32,7 @@ static void iris_vpu3_power_off_hardware(struct iris_core *core)
>>  	u32 reg_val = 0, value, i;
>>  	int ret;
>>  
>> -	if (iris_vpu3x_hw_power_collapsed(core))
>> +	if (iris_vpu3x_hw_power_collapsed(core, VCODEC0_POWER_STATUS))
>>  		goto disable_power;
>>  
>>  	dev_err(core->dev, "video hw is power on\n");
>> @@ -78,7 +78,7 @@ static void iris_vpu33_power_off_hardware(struct iris_core *core)
>>  	u32 count = 0;
>>  	int ret;
>>  
>> -	if (iris_vpu3x_hw_power_collapsed(core))
>> +	if (iris_vpu3x_hw_power_collapsed(core, VCODEC0_POWER_STATUS))
>>  		goto disable_power;
>>  
>>  	dev_err(core->dev, "video hw is power on\n");
>> @@ -221,6 +221,98 @@ static void iris_vpu35_power_off_hw(struct iris_core *core)
>>  	iris_vpu33_power_off_hardware(core);
>>  }
>>  
>> +static void iris_vpu36_power_off_vcodec(struct iris_core *core, u32 core_id)
>> +{
>> +	u32 value, i;
>> +	int ret;
>> +
>> +	if (iris_vpu3x_hw_power_collapsed(core,
>> +					  core_id ? VCODEC1_POWER_STATUS : VCODEC0_POWER_STATUS))
>> +		goto disable_power;
>> +
>> +	value = readl(core->reg_base + WRAPPER_CORE_CLOCK_CONFIG);
>> +	if (value)
>> +		writel(CORE_CLK_RUN, core->reg_base + WRAPPER_CORE_CLOCK_CONFIG);
>> +
>> +	for (i = 0; i < core->iris_platform_data->num_vpp_pipe; i++) {
>> +		ret = readl_poll_timeout(core->reg_base + (core_id ? VCODEC1_SS_IDLE_STATUSN :
>> +					 VCODEC_SS_IDLE_STATUSN) + 4 * i, value,
>> +					 value & DMA_NOC_IDLE, 2000, 20000);
> Unreadable. Extract register addresses to separate variables.

Ack

>> +		if (ret)
>> +			goto disable_power;
>> +	}
>> +
>> +	writel(core_id ? REQ_VCODEC1_POWER_DOWN_PREP : REQ_POWER_DOWN_PREP,
>> +	       core->reg_base + AON_WRAPPER_MVP_NOC_LPI_CONTROL);
>> +	ret = readl_poll_timeout(core->reg_base + AON_WRAPPER_MVP_NOC_LPI_STATUS, value,
>> +				 value & (core_id ? NOC_LPI_VCODEC1_STATUS_DONE :
>> +				 NOC_LPI_STATUS_DONE), 2000, 20000);
>> +	if (ret)
>> +		goto disable_power;
>> +
>> +	writel(0, core->reg_base + AON_WRAPPER_MVP_NOC_LPI_CONTROL);
>> +
>> +	writel((core_id ? VCODEC1_BRIDGE_SW_RESET | VCODEC1_BRIDGE_HW_RESET_DISABLE :
>> +	       CORE_BRIDGE_SW_RESET | CORE_BRIDGE_HW_RESET_DISABLE),
>> +	       core->reg_base + CPU_CS_AHB_BRIDGE_SYNC_RESET);
>> +	writel(core_id ? VCODEC1_BRIDGE_HW_RESET_DISABLE : CORE_BRIDGE_HW_RESET_DISABLE,
>> +	       core->reg_base + CPU_CS_AHB_BRIDGE_SYNC_RESET);
>> +	writel(0x0, core->reg_base + CPU_CS_AHB_BRIDGE_SYNC_RESET);
>> +
>> +disable_power:
>> +	dev_pm_genpd_set_hwmode(core->vcodec[core_id].dev, false);
>> +	iris_disable_power_domain_and_clocks(core, &core->vcodec[core_id]);
>> +}
>> +
>> +static void iris_vpu36_power_off_hw(struct iris_core *core)
>> +{
>> +	u32 num_cores = max(core->iris_platform_data->num_cores, 1);
> Can we trust the patch authors that VPU3.6 hardware data will have at
> least 1 core?

On Glymur (VPU3.6), num_cores is 2. The max() guard is unnecessary.
Will access num_cores directly.

>> +	int i;
>> +
>> +	for (i = 0; i < num_cores; i++)
>> +		iris_vpu36_power_off_vcodec(core, i);
>> +}
>> +
>>  #define WRAPPER_DEBUG_BRIDGE_LPI_STATUS		(WRAPPER_BASE_OFFS + 0x58)
>>  #define WRAPPER_IRIS_CPU_NOC_LPI_CONTROL	(WRAPPER_BASE_OFFS + 0x5C)
> Lowercase hex.

Ack

>>  #define REQ_POWER_DOWN_PREP			BIT(0)
>> +#define REQ_VCODEC1_POWER_DOWN_PREP		BIT(1)
>>  
