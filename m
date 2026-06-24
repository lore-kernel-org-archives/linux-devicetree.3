Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E68F83C8C71
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 14:30:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782311431; cv=none; b=OFdpqK+Mc7XN+tF1u/gAevmyzNzAN7M7G2jlWmEq/0UtCKB8rSrkCYO9yHbj/ByjXchww/gOsxqy9L6D3uronSzdWr66xPdx6MEjXudFSUwPq40MIaLpuLs8A4RVNb7I2+92DM+dj7rrm11sJi+4uQL4ZJxBpPQ16HGQcKaK0/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782311431; c=relaxed/simple;
	bh=jXv0pTSEmNFbM8ekGb88NGF9lNs5tNx/gJo+58GQa3E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Eyh+w+Alf9+ORHoiWAzAQX8qRynsoL7GE8Q38LgepJDu1FvfTb9mzIQii9/e6CDgdrDLxVio/yDisJsuVKFtjQ62LWcpH054tJszPP9NpQIj/zpyYlcH4OSCIxFR6thDoq/xufwWL0nrHFKuLcCvPcaT8jzHPfjTWnz/fuuqzdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Lul7uDuJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jENzmWib; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Lul7uDuJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jENzmWib"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65OANuJe3047485
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 14:30:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bJXOcydpNHnaGs81rbyZLCVSzov2xbjvTQOme0ii2Ko=; b=Lul7uDuJrI4R08lA
	oajLQeA/bJR6WsC6oxAKUB7JpeLy1eDw0DyNwgYYW5eUxIIlBlwv1RISjv/esQcr
	jgIPWWkPXtKoTCjdaT6ab2Om4fg2BBog9iOoMgqnLuMnoEvcMe5TA5AunnVtR25j
	+tn9oozY3ejp4d+vyx9oOsCpflx6oag7Xbf8JjXzR05+OuaeonsOj2/ccPs+0oSI
	OYO5Og2nphOI1vOMHJGd2xALzKfKirIbZhGLHs0ur81YwdKT/NVKDG0w/Z77ctQf
	HzqBw8LMY/Ij85/wi5nPi+JkysY4hE6RHmxO776TR5jUqM7v55WJM0lRgPWuG1/G
	47njjg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f05ar2nuc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 14:30:26 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-37d125687b6so1480108a91.1
        for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 07:30:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782311426; x=1782916226; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bJXOcydpNHnaGs81rbyZLCVSzov2xbjvTQOme0ii2Ko=;
        b=jENzmWibQYcc6bqVPLmegLPAhwK58RTtgALAPZJlHBcDIzwmxZtPPm+6y20aPOd7St
         oN1+OtDvJceV16olwBDumfllSOW9KvtJE0dRsk4Xj4F2svTkdLPAOkXTQTLZGhjRiKaV
         XJUa8ETVWsmV8q3QnTQLnS5pLLXSghJ7HJiIgTL+S/c4VWrkaY6fwjMpqbQ8C3/bKRcw
         DP2EM2ACZW5480l4ugM+cFlGkyRIPVqgGwBRxWRt9sfAviovf/v0aaYvsQiwiseEWyyD
         CGy39IwFKheEflcnlO1sGOflt50kknKFUgohrSeo5jO6mSuO99//M6mAP0kTjhpGNsFV
         8nrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782311426; x=1782916226;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bJXOcydpNHnaGs81rbyZLCVSzov2xbjvTQOme0ii2Ko=;
        b=GxxOkNUBAVE2/4Vk+7LKlvCEOyEwhrbX+ga3g28TH/Eief6xUWW8Ywjl4tXi7EVoO/
         ZOVhBMBFy/uMZM1NwTMRTw3I74f166SE7OZdTCF0MNqeHOWOwIuPAb4KU+kQQfNPar45
         Q9N05Gg55XeS8OE0XEO1U8s5Lly7GcEjjbl0PVZlkBmTotE98nDgioCP8pkDc1JQgBf8
         QPITUPc8IhfSqUC6sOds6XQro+mOtP7fyTQ7pLcYFQ/IK5objOX01cBr4N7RULIOH5Cv
         B2V0B66q/5RzP7sDSXIj3T/BZMkkZnM/3GlgcFlnQTQ4V4sYV7nMHQ7G0nNaiPdxymwW
         8fwA==
X-Forwarded-Encrypted: i=1; AHgh+RpaKUQf34NWF65MQM1lM4/KZu4rGLqowkr7gDmFhj3ffM1Qrk8k9s/CWkjAVBpG8Yo7hk6eBl15MQ3i@vger.kernel.org
X-Gm-Message-State: AOJu0YxLO2GWNG5jYqXTnqKKF5GbKg3OySdU588ves+DfZq+Chedd0tt
	QmeyF42XIEBXGfSyC1q2HK9Eu8H60vq5V5H724+uBDcEX6NfNO6Wp5V5DGBI2M5BL4Aob54MZIw
	e4/9oz0OT1jEPHwfJAyVJYuz05qvpfRQJ4UouQymgE9N16ZeIn2/JFFvKSkO6ndw1
X-Gm-Gg: AfdE7cl3DvdAAemmQ2D2OqFf4tUsChSzKtwZwwwCJd4HynC+7E9rWl9VN/AJk7ea9Q7
	o9b6mUb5iLj0WcV9L12OaWPDniLITdh4K+bIAfwjr6xyQoqZZgTYg2ptCfh9f5iR5CRf+KUtZ9a
	nWQT/DWZdp9g48aB9sqAVzFYoPTOlUz58jsLKsQ8JCzRJ9XWIxZorgRLYDpEg6uNVP+rJgVA02H
	msKCa+8wiOztGFOBEe5xetc78MO9nN2k1TARcIZ1DMuqP0rmgwkb8iVmlzXq9CMGOBJ6/S1g5b0
	wchGjGARj/t/BZ88+lYPHRpNDqNRN+knxly1ZVmel4mmC3NNJx46/jwCxBMR0XycNAi8XQego2t
	IcVmgYoOa4EdZNGdGUc5HJnZBuFgmD+oP+F7SiayXn+jA
X-Received: by 2002:a17:90b:1805:b0:36d:ae6a:22f0 with SMTP id 98e67ed59e1d1-37dd0db4070mr7924155a91.14.1782311425610;
        Wed, 24 Jun 2026 07:30:25 -0700 (PDT)
X-Received: by 2002:a17:90b:1805:b0:36d:ae6a:22f0 with SMTP id 98e67ed59e1d1-37dd0db4070mr7924022a91.14.1782311424721;
        Wed, 24 Jun 2026 07:30:24 -0700 (PDT)
Received: from [10.204.101.214] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37de3ce55dfsm3162887a91.10.2026.06.24.07.30.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Jun 2026 07:30:24 -0700 (PDT)
Message-ID: <bdae4575-f5cb-4c74-bd96-ec8c1b0c540f@oss.qualcomm.com>
Date: Wed, 24 Jun 2026 20:00:18 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 12/16] media: iris: implement support for the Agatti
 platform
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
References: <20260616-iris-ar50lt-v5-0-583b42770b6a@oss.qualcomm.com>
 <20260616-iris-ar50lt-v5-12-583b42770b6a@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260616-iris-ar50lt-v5-12-583b42770b6a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: bspcAqpyzrBgmca8tksiOBCS0zQEtaN3
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDEyMCBTYWx0ZWRfXzc5zSZKHHK6v
 SBFHbZwxVVPPUxA2SyKVPfPzM/dyTlyWvZCLyTTQrgn55zWrIYXq5fvssIg4jvGp0Kgs1ukoMp1
 TQY3XTG+bvnWcA/rwj6NNTQVp7HQ7Z8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDEyMCBTYWx0ZWRfXw3KRRPjeRJ1p
 Lxrux+w7cVub6htGvePy10LDnzkXkKUmBDLj3vXmQuydmXhUhYVDI/BWCJS8w2PfSJiQWX4snf8
 uFFDoR8RLOTyb3CjOUv/sRclgil38W+14Gxqsik/uN/bqhqgioH7YszUvsnDa8XSAbI+tUVZTCu
 GKZkmPESB1+d2+69GEO3MNONlEaUqFEfWijfAi6zDIbMYofGy/JbfPd2x/vtqepwlAl37QVo24H
 jY1Zwctndyp/HJQuU1OE1x+4PDmeQtDxJPjJMNrHlKFbAuEVx2x3i1c8YeSKHTpoTW+d1KPzIPS
 BTQc9i/7rsHtXPdluydWvuBbVUTb9hZHyEsTCZj1HWVbpQN8ngX0kRHQkpsUes8Yz4pKQF1b7tw
 K1T103ji4shDBfDQCQ+gmiuRhLpkpQ==
X-Proofpoint-GUID: bspcAqpyzrBgmca8tksiOBCS0zQEtaN3
X-Authority-Analysis: v=2.4 cv=EuLiaycA c=1 sm=1 tr=0 ts=6a3bea02 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=S-oV5pMvw9Cc1cVx9MoA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_03,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0 malwarescore=0
 phishscore=0 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606240120



On 6/16/2026 5:34 AM, Dmitry Baryshkov wrote:
> Port support for the AR50Lt video codec core (present for example on the
> Agatti platform) to the Iris driver. Unlike more recent cores this
> generation doesn't have the PIPE property (as it always has only one
> pipe). Also, unlike newer platforms, buffer sizes are requested from the
> firmware instead of being calculated by the driver.
> 
> Co-developed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/iris/Makefile          |   1 +
>   drivers/media/platform/qcom/iris/iris_hfi_gen1.c   | 227 +++++++++++++++++++++
>   .../platform/qcom/iris/iris_platform_common.h      |   6 +
>   .../platform/qcom/iris/iris_platform_vpu_ar50lt.c  | 110 ++++++++++
>   drivers/media/platform/qcom/iris/iris_probe.c      |   4 +
>   drivers/media/platform/qcom/iris/iris_vpu_buffer.c |  13 ++
>   drivers/media/platform/qcom/iris/iris_vpu_buffer.h |   1 +
>   7 files changed, 362 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/iris/Makefile b/drivers/media/platform/qcom/iris/Makefile
> index f1b204b95694..bbd1f724963e 100644
> --- a/drivers/media/platform/qcom/iris/Makefile
> +++ b/drivers/media/platform/qcom/iris/Makefile
> @@ -14,6 +14,7 @@ qcom-iris-objs += iris_buffer.o \
>                iris_hfi_queue.o \
>                iris_platform_vpu2.o \
>                iris_platform_vpu3x.o \
> +             iris_platform_vpu_ar50lt.o \
>                iris_power.o \
>                iris_probe.o \
>                iris_resources.o \
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1.c
> index ca1545d28b53..f57af31dbd9f 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen1.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1.c
> @@ -443,3 +443,230 @@ const struct iris_firmware_data iris_hfi_gen1_data = {
>   	.enc_ip_int_buf_tbl = sm8250_enc_ip_int_buf_tbl,
>   	.enc_ip_int_buf_tbl_size = ARRAY_SIZE(sm8250_enc_ip_int_buf_tbl),
>   };
> +
> +static const struct platform_inst_fw_cap iris_inst_fw_cap_gen1_ar50lt_dec[] = {
> +	{
> +		.cap_id = STAGE,
> +		.min = STAGE_1,
> +		.max = STAGE_2,
> +		.step_or_mask = 1,
> +		.value = STAGE_2,
> +		.hfi_id = HFI_PROPERTY_PARAM_WORK_MODE,
> +		.set = iris_set_stage,
> +	},
> +};
> +

<snip>

> +
> +static const u32 iris_hfi_gen2_ar50lt_dec_ip_int_buf_tbl[] = {

gen1...

> +	BUF_BIN,
> +	BUF_SCRATCH_1,
> +};
> +
> +const struct iris_firmware_data iris_hfi_gen1_ar50lt_data = {
> +	.init_hfi_ops = &iris_hfi_gen1_sys_ops_init,
> +
> +	.inst_fw_caps_dec = iris_inst_fw_cap_gen1_ar50lt_dec,
> +	.inst_fw_caps_dec_size = ARRAY_SIZE(iris_inst_fw_cap_gen1_ar50lt_dec),
> +	.inst_fw_caps_enc = inst_fw_cap_gen1_ar50lt_enc,
> +	.inst_fw_caps_enc_size = ARRAY_SIZE(inst_fw_cap_gen1_ar50lt_enc),
> +
> +	.dec_input_config_params_default =
> +		sm8250_vdec_input_config_param_default,
> +	.dec_input_config_params_default_size =
> +		ARRAY_SIZE(sm8250_vdec_input_config_param_default),
> +	.enc_input_config_params = sm8250_venc_input_config_param,
> +	.enc_input_config_params_size =
> +		ARRAY_SIZE(sm8250_venc_input_config_param),
> +
> +	.dec_ip_int_buf_tbl = iris_hfi_gen2_ar50lt_dec_ip_int_buf_tbl,
> +	.dec_ip_int_buf_tbl_size = ARRAY_SIZE(iris_hfi_gen2_ar50lt_dec_ip_int_buf_tbl),

same here

> +	.dec_op_int_buf_tbl = sm8250_dec_op_int_buf_tbl,
> +	.dec_op_int_buf_tbl_size = ARRAY_SIZE(sm8250_dec_op_int_buf_tbl),
> +

Regards,
Vikash

