Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA4BE2C0296
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 06:15:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778480110; cv=none; b=UQstrOTnCMGKNe/ZiQVWJhjRufPqSy9fw1mitf5Ci9DxHthe7GkQdisilqgAvnsbqNaSYdKoa8p1g17jV/Jxso7BzTtu8vnNkgXdtkT2+xzVf5zwvGbX87hqDfsUlf/gZPn2tbyKkdn9AcEgESdefiueHHEiObyTAIi4d58s9sk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778480110; c=relaxed/simple;
	bh=Xhm4/QggtVtSIk/ZUkSKW4bMk6HNUwYAZCQ6qZ1qW2Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WKLfxcWlMj6Q8DnuyB2n7X1HfJKUQnUmnAFbHqhIxbQ1RsjD42IB2cSuL7dWTsleUyDtmm70ByekYABEaTSpOJsT5NYuqNJk+2+8MFbbvoQ+Jdurb8YL0JuWOo7HgxdyZYT7USp5SSzOrFUdDj8t+wrCVMMtTmIC84QAzSNoUWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fJoiUuKm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UAuebPUv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fJoiUuKm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UAuebPUv"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64B61lb7250813
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 06:15:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VoMHz/A+lBn+MtT7l9ALIG1gozQr9HocMIO5xiqHdEA=; b=fJoiUuKmldxj9O88
	CC5hM7XUkoRTR1R6W4eHbXduq6xlJeyx3J4/t4E6YMCk77dhMrVcALNLZ+KG1dxP
	GtM0KRs+PyHWa90NBfWdqjeHxu6KL9k/8l78JJJlMvaTzleBipbeuGyXpZHu1iRZ
	WO6horGCuuh6FiyJ5aatmS9kA/5YoMRioGrT5HihSYU9+io21q7KlaaCntKc3cFJ
	fNs/We9Rwbrym321NoRVkhi8jIIo6+j8LlSH0qlZCm4gsRJJfm9gmWRwJPww/gu7
	vyK3fPRaq/xkPsT67Dt6rwj1Xi9shVzakCou7UdcLFkj8bjhd65JGsy6mH/R35E9
	Asfi6A==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e1uvsmvwq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 06:15:07 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2babbeff9e4so45909505ad.0
        for <devicetree@vger.kernel.org>; Sun, 10 May 2026 23:15:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778480107; x=1779084907; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VoMHz/A+lBn+MtT7l9ALIG1gozQr9HocMIO5xiqHdEA=;
        b=UAuebPUvd/ucOheuXK4QMxCzSILSwF9o8/vIO+GUdVWJWbw7tck4TH9IqMI105c+0S
         aW9cXuTQUyPKfUreUV4jrn0FcGf3PFiz0gLHhxBujslF4IRxh1I8F8kqJp6Re+ReYHYF
         N+bfhjzbWSzWnFbIeOFRBTTdXmiRW/QEgNKgzryJrC8LXAAl0EAKkIFv4THmHGOylGPX
         sRAJFvdUvQJywwopXMeI2mZapx2chZ73zhCRt9OzDmGiPa+/vqTOyhfP8E2Jw0EJeh9D
         QPJjRKrMJ1EiLDckxUGWD7yHVjLBMArs68U41oeVteEbJ2fnY57P2MhzWepElC8BSyap
         lXXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778480107; x=1779084907;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VoMHz/A+lBn+MtT7l9ALIG1gozQr9HocMIO5xiqHdEA=;
        b=NU+t8ULOpD2W1S3VQlMB+H4eMBEaVsnKOdplGcuZ1a9QS9gFn/eXv1y4pabObAOrci
         ttyVefc15tipF6jsvXWq83PLwKnmZp7lTr2QwYU8eS5tF1cCRl4WpEr7HEwV9NsEXnMi
         wMCOVvxtJ8+k2GpBNNlIBXn1l8QQ7RVrRIFeeDX8yn86J47u57Rouaygb4a7D2LUEaJF
         NNDkYIvRS3kMo5eQENHqiM1csxsP/tOC9C/xfLUT1CUa41E56kjE+6jKXJNabpk74YyW
         3szCGKDDTXr7WXeNZZXdT7bGZNMRU5fWEaZ3swPfhRphyiug2QK7kmaz9vy4T76nXRYM
         kX5A==
X-Forwarded-Encrypted: i=1; AFNElJ+n7j5mkJQJSfqLNb2BB5yKn7bsc8nDVWwxRxG071gY9M8hVZt0SfX5LuZV/+7bY/EpgdEHEldnv7Bz@vger.kernel.org
X-Gm-Message-State: AOJu0Yyd+H2E6Eto7np36T/DPgGn7dTJMj2ezNkV/NF2MHCXYoMM+RmO
	PDBKiDEY+NBc2X+ZS6+EZWS/WHvpJB7ClZP2y8F99qRKo/55qXuXxNtwjYtoeXsTIjhwWIyWk0D
	VbQkms1WQn1KjUZkNiYN3HUVei2yg+wB1yKrLKBL7jLo5YF8eCGZkdoghZaWj1DNQ
X-Gm-Gg: Acq92OGZrEtx4rn5YpT2Jmpr3BslDd5KM1J3Ir8hLO3bSTMF9XY5yU2Y+T7ktNzYh0e
	SwKi+YqxMMGxHKcRt6LCu8iz4ou8Oc4pHT5jld73V6rgvvItYrDSNNwpcLCcxemjzUVJBSN9BjX
	howSzftbxmcrh9/vvT3XbmJJNoCH1yqJxy0wr137576LbTuTCo/5vU5DsLVp0xCmAbAoZL2olG+
	Xo7okM4IA3L9f7yK0ZF66fR8/hfffkH2n6NLuEe4IiA2juRvhf/MZgdHxtxQaNZfn0xj3soX9SO
	AOyIP1Xzuyvkmi5ioEOem9uxhQpJ/v5agXa1BuW6Ne1PYNn8LCryiSJJaLHOh/2O0zVfpbTm/mF
	jK4otavBcOsNbAm2P96ZY7vQvrt8LKLSB1okmCnCyRwKwAJIID2giso574bYewSdr
X-Received: by 2002:a17:903:8d0:b0:2b0:4f16:22f7 with SMTP id d9443c01a7336-2babd4a475amr144704785ad.16.1778480106915;
        Sun, 10 May 2026 23:15:06 -0700 (PDT)
X-Received: by 2002:a17:903:8d0:b0:2b0:4f16:22f7 with SMTP id d9443c01a7336-2babd4a475amr144704415ad.16.1778480106094;
        Sun, 10 May 2026 23:15:06 -0700 (PDT)
Received: from [10.206.105.200] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1eac3afsm96611485ad.71.2026.05.10.23.15.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 10 May 2026 23:15:05 -0700 (PDT)
Message-ID: <8b3e6cfb-cadb-58de-8235-34d56b011c3d@oss.qualcomm.com>
Date: Mon, 11 May 2026 11:44:59 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 06/16] media: iris: Add platform data field for watchdog
 interrupt mask
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
References: <20260507-iris-ar50lt-v1-0-d22cccedc3e2@oss.qualcomm.com>
 <20260507-iris-ar50lt-v1-6-d22cccedc3e2@oss.qualcomm.com>
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <20260507-iris-ar50lt-v1-6-d22cccedc3e2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDA2NiBTYWx0ZWRfXwIg2qmL5ZfID
 f8q3g2NfwVrJdhrD0uWTZxy904PRKAgJ6M22UCxsqgoXIjO8KRpYd1EwTRFzy03PvCcd1eBQJNo
 1MQkzJzB1i0YR6n2R9KIaoD5c5KZWsltFre9jGEE6wpqoLVG4iheUlQr2cpRuB9lD2Xp1f+A7GT
 vQu1zGjJWxSx1j8+8c9VwpuVvWw4oFISmBXoMbAu1sRvvKii/9bxDq9uUiGQYA7T4Vo3PKT9nLQ
 1K690TZ28rf+oG2GyPtWeOd2LKJY/IUbZPPswy1E//61gBW3EfyE8ZWOllTsw7r/KrTmN3JzVPD
 Rpmivjwe3TcxFJ1lJ4VusHeh6i4iayNz/zIMES6bukbbPtTv41n7Q5oGr3RBs8Zv6L/GDkkXfvs
 HQ7mZCWU3VDgAGgqsWXjJnpKP+rNQlIMn2woNvGwwQ5UcPZCM8GLPFLIeBgoLMONYzMZkk1xKvw
 EQFpTToiXUB/xTR++Aw==
X-Authority-Analysis: v=2.4 cv=dujrzVg4 c=1 sm=1 tr=0 ts=6a0173eb cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=qEXA0ud_6SJ4FYFEtWEA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: xhxZHQzLvPBd5cUCtEcgz9Geyp7MNLpd
X-Proofpoint-GUID: xhxZHQzLvPBd5cUCtEcgz9Geyp7MNLpd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_02,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 adultscore=0 malwarescore=0 impostorscore=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605110066


On 5/7/2026 12:12 PM, Dmitry Baryshkov wrote:
> @@ -124,6 +127,7 @@ const struct iris_platform_data sm8250_data = {
>  	.tz_cp_config_data = tz_cp_config_vpu2,
>  	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu2),
>  	.num_vpp_pipe = 4,
> +	.wd_intr_mask = WRAPPER_INTR_STATUS_A2HWD_BMSK,
>  	.max_session_count = 16,
>  	.max_core_mbpf = NUM_MBS_8K,
>  	.max_core_mbps = ((7680 * 4320) / 256) * 60,
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c b/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
> index 829dc37b4058..6e63f279efbe 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
> +++ b/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
> @@ -17,6 +17,8 @@
>  #include "iris_platform_sm8650.h"
>  #include "iris_platform_sm8750.h"
>  
> +#define WRAPPER_INTR_STATUS_A2HWD_BMSK		BIT(3)
> +
>  const struct iris_firmware_desc iris_vpu30_p4_s6_gen2_desc = {
>  	.firmware_data = &iris_hfi_gen2_data,
>  	.get_vpu_buffer_size = iris_vpu_buf_size,
> @@ -106,6 +108,7 @@ const struct iris_platform_data qcs8300_data = {
>  	.tz_cp_config_data = tz_cp_config_vpu3,
>  	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu3),
>  	.num_vpp_pipe = 2,
> +	.wd_intr_mask = WRAPPER_INTR_STATUS_A2HWD_BMSK,
>  	.max_session_count = 16,
>  	.max_core_mbpf = ((4096 * 2176) / 256) * 4,
>  	.max_core_mbps = (((3840 * 2176) / 256) * 120),
> @@ -135,6 +138,7 @@ const struct iris_platform_data sm8550_data = {
>  	.tz_cp_config_data = tz_cp_config_vpu3,
>  	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu3),
>  	.num_vpp_pipe = 4,
> +	.wd_intr_mask = WRAPPER_INTR_STATUS_A2HWD_BMSK,
>  	.max_session_count = 16,
>  	.max_core_mbpf = NUM_MBS_8K * 2,
>  	.max_core_mbps = ((7680 * 4320) / 256) * 60,
> @@ -172,6 +176,7 @@ const struct iris_platform_data sm8650_data = {
>  	.tz_cp_config_data = tz_cp_config_vpu3,
>  	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu3),
>  	.num_vpp_pipe = 4,
> +	.wd_intr_mask = WRAPPER_INTR_STATUS_A2HWD_BMSK,
>  	.max_session_count = 16,
>  	.max_core_mbpf = NUM_MBS_8K * 2,
>  	.max_core_mbps = ((7680 * 4320) / 256) * 60,
> @@ -201,6 +206,7 @@ const struct iris_platform_data sm8750_data = {
>  	.tz_cp_config_data = tz_cp_config_vpu3,
>  	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu3),
>  	.num_vpp_pipe = 4,
> +	.wd_intr_mask = WRAPPER_INTR_STATUS_A2HWD_BMSK,
>  	.max_session_count = 16,
>  	.max_core_mbpf = NUM_MBS_8K * 2,
>  	.max_core_mbps = ((7680 * 4320) / 256) * 60,
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
> index 59e4d68d042f..b8300195a43b 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
> +++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
> @@ -109,11 +109,11 @@ void iris_vpu_raise_interrupt(struct iris_core *core)
>  
>  void iris_vpu_clear_interrupt(struct iris_core *core)
>  {
> +	u32 wd_intr_mask = core->iris_platform_data->wd_intr_mask;
>  	u32 intr_status, mask;
>  
>  	intr_status = readl(core->reg_base + WRAPPER_INTR_STATUS);
> -	mask = (WRAPPER_INTR_STATUS_A2H_BMSK |
> -		WRAPPER_INTR_STATUS_A2HWD_BMSK |
> +	mask = (WRAPPER_INTR_STATUS_A2H_BMSK | wd_intr_mask |
>  		CTRL_INIT_IDLE_MSG_BMSK);
>  
>  	if (intr_status & mask)
> @@ -124,7 +124,9 @@ void iris_vpu_clear_interrupt(struct iris_core *core)
>  
>  int iris_vpu_watchdog(struct iris_core *core, u32 intr_status)
>  {
> -	if (intr_status & WRAPPER_INTR_STATUS_A2HWD_BMSK) {
> +	u32 wd_intr_mask = core->iris_platform_data->wd_intr_mask;
> +
> +	if (intr_status & wd_intr_mask) {
>  		dev_err(core->dev, "received watchdog interrupt\n");
>  		return -ETIME;
>  	}
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_register_defines.h b/drivers/media/platform/qcom/iris/iris_vpu_register_defines.h
> index 72168b9ffa73..4fffa094c52f 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu_register_defines.h
> +++ b/drivers/media/platform/qcom/iris/iris_vpu_register_defines.h
> @@ -41,7 +41,6 @@
>  #define MSK_CORE_POWER_ON			BIT(1)
>  
>  #define WRAPPER_INTR_STATUS			(WRAPPER_BASE_OFFS + 0x0C)
> -#define WRAPPER_INTR_STATUS_A2HWD_BMSK		BIT(3)
>  #define WRAPPER_INTR_STATUS_A2H_BMSK		BIT(2)
>  
>  #define WRAPPER_INTR_MASK			(WRAPPER_BASE_OFFS + 0x10)

Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>

