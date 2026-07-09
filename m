Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4634B3F0AA4
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 08:36:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783586205; cv=none; b=h2gMUbx04FF0eAkDySqletTEIrCQVBGV8CbbYLdbAFP3cy9TgBzbDz/Y1t7QNqGskOFkfxwXh7mBRpgSfNHrTDdinlCXlOTRTVglL92WoDdIPG4Qpu54ISjnXfuoh6WzHfJUOJw0X5fi6TqjykxSRpq4uMBWDLx1FDDW8V6z3q0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783586205; c=relaxed/simple;
	bh=YBPLfOsNcJbvbxpIYv9Wi5R2neDQ3TcN4Xp20ISTfGA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pFR2uf6F1fHQuNds8z72hIToYZoWsJiMzmMlsuPqaAxMDZL7JSCX5d+PHHV7j+Hcu7bRiW3G9lUKLm9OXMMbcsT4rTgyhfpwAGfEtXtTADPpflMMhhqik7IztERV9w/g5xlULLmpf3K2In6i/zrJxdGRL5taTPP+QHTf+JNKqrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NmclpFHR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e3J6yJRm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NmclpFHR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e3J6yJRm"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669604Jd712298
	for <devicetree@vger.kernel.org>; Thu, 9 Jul 2026 08:36:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BKOllJBuk8y7kLwqvee6fdcW/sZLliQuusFSU9WY19s=; b=NmclpFHRw4vuIRLy
	9OCUX9Es/1etyw2n1MKhZyVjPFobNyW8UhBIKoJQKIz92SS5KZajM+XACEPRWduy
	Bh49RGObIyA6OIQSSUSqspFCEQjo1wlwCca3V7PSPm52k8r+D0dfL95xtrVwCPWE
	n5Dk6LMBd+iNd80hoqES9Q68kPRu4QAUmJcdwmEVI+I5X3brNBBx2GlfLznpybFG
	M9mee0tMrUt2lSBw1Gomq4FtzmKKoE2TEkmIlVltjGVlI0VF5Sy3oAJzJptMvTS1
	L83Sm/qAJmkf2RbN2ADiRI3/oI7KJlENHRXWu141HiDFkdRdBhlQs5+LmHYIzVKA
	CKlFag==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fa55vguk5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 08:36:43 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ccd1958e8fso21755105ad.2
        for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 01:36:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783586203; x=1784191003; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BKOllJBuk8y7kLwqvee6fdcW/sZLliQuusFSU9WY19s=;
        b=e3J6yJRmiwLcCNQRO3JPf/BHLwb01/uA7obiWuh3L1Eqv/vw2kXe57Ket3p4AhKBGf
         LisicNsUYs7dwCIJjTel6JYuob63di9FV64b7FDQVs3h5hUIVMnrr6nu6Zqq94LGdsFO
         BNsVhbvAwTU07R6BI2cAFmIL+YkCZW6iLwi8FIl9HOZRw5cyiuH9aJyQi6XWD70VCYQw
         VsMeo2QZR8VPmhUpD8QAWSci1z3JXQN8Z0mv5ZleqbQsJR1/jZ+DG/vntrluxA/QOgT5
         A5EaOQvDx/cBZvQ22k/a7w5jnNSa3Vcu3I7yOBRFnEAEhZ54/N2p8Za5aJjo/hlKobXU
         FQTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783586203; x=1784191003;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BKOllJBuk8y7kLwqvee6fdcW/sZLliQuusFSU9WY19s=;
        b=NIPlTnupraLwq+2azptoXll5bAGqAcjuuYlXvtpW11ygFZFwEZ1sFLOdaikX9itkR6
         kIrrDddAsjdvPOX7VdWuepdxFZKK1DDib4fRonJBUoIo5ibura7r4WLYQTKfnNQH8UrJ
         0LvArwd5dNJLxf8/cNC9xSu0LvEXEsrDzlWm1BRPPkJ7jXgojMLgIlGK8yMdiOfJ5Q3z
         8I3AAJafDkejWQyX/uOIEBxKHLawO3G9sb6fgetQk3oRC5mDY0G9uKKkXn9zgOabK1S5
         EBbEzL01MiTrMyg9bqRPII8lyEWrZxZVLuqk/vRBFPzQHjbY8lNaKTu8rUQtV1N2lQBr
         dFrA==
X-Forwarded-Encrypted: i=1; AHgh+RredocWopN7kchig2NYpbgJMFYAZqr7XAJgrh4OSJn4UPknPfddxWn1tT2jn6l0CqhPA7iTQEdj+zus@vger.kernel.org
X-Gm-Message-State: AOJu0YwcmAVrK1gdLmvXxFgwy759ire6LEnC0fG8aYADHBcnfE2e6HUS
	LHU7oVFxzJUA15xDEdzvh7eHaW95H7HnrSH8T3Q4ZdcdgANYcHTAYke+aAtDIkjVvyKc4QSywJr
	RMM4uzVzit1E1ccRxshfBGEMnwYBpw7l0Y0rKWeDYYPxFNpTL5bZNJeIfoKL1s+gL
X-Gm-Gg: AfdE7cmhA4Tnalmk1mq9kI+wmkmNtJ4zk4slR23CGvXd/83pEiqlywpYCW3gOeOKQ22
	/xolqKjuN2czUTCrs9QzqfHtt9dye/WTZqDfeLXlcCyVTLgjZkjcl7Mrzy4tiUc7XzarnAToy9A
	Z+PVSFtqxSpHbZQywuHTEDBt3bVPkaPSYJBK1DFzFysB3sX5SuTzGmdGipFDSiFwvTCSC2omcFQ
	io7gbJv0F40MryvWkOsELF5fcKMDIQsy6fvXsCzNg8VIalVY6aR81aP6LF5CIem+/JFzCawYmXA
	zkGp/GcDqzguozaG1EIjD0Qcbg+rl5wZW8wniz7EzhqOwoFhDr+m93c7CFn0bHCOuAvmPkeYUvX
	7LgB7hQs2PKG59kaTW+23wxUNYJlsvulJAvuhskQ=
X-Received: by 2002:a17:903:3c67:b0:2cc:307c:51fc with SMTP id d9443c01a7336-2ccea3848f2mr55101285ad.21.1783586202574;
        Thu, 09 Jul 2026 01:36:42 -0700 (PDT)
X-Received: by 2002:a17:903:3c67:b0:2cc:307c:51fc with SMTP id d9443c01a7336-2ccea3848f2mr55101035ad.21.1783586202060;
        Thu, 09 Jul 2026 01:36:42 -0700 (PDT)
Received: from [10.218.18.193] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d5c804sm39971045ad.82.2026.07.09.01.36.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 01:36:41 -0700 (PDT)
Message-ID: <c02aa1ec-6ad1-4c45-9229-706e44586666@oss.qualcomm.com>
Date: Thu, 9 Jul 2026 14:06:37 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] ASoC: qcom: sc8280xp: add Shikra EVK machine
 variants
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
References: <20260611112946.954172-1-ajay.nandam@oss.qualcomm.com>
 <20260611112946.954172-3-ajay.nandam@oss.qualcomm.com>
 <cd8da4f2-e6f2-4ad0-b9c6-952af9e1aa11@kernel.org>
Content-Language: en-US
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
In-Reply-To: <cd8da4f2-e6f2-4ad0-b9c6-952af9e1aa11@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDA4MSBTYWx0ZWRfXxMg+s8p0kTa0
 8OLEL93HhRefq0Bdo3M+gysWoYKMkwduialUCvM4sOPYEihjyXQ97uoTAfOnA9Htq5OWZoYoyR9
 P5+ua8ZZVSo4/dGapyRioZjpfCDfbT+JOv8pT+m4feuCzKpg4wSJeFpiWg05osRrMVogq1E2HyV
 kmALf97JVay9Bft8T8k/36Sb5UQz5foSaAwNEaURgMdTBg1ZaUTdlMqjN+ziwINwXMtJHVWi6UL
 dUMeRtYiOgbjuTQ8+XL31ogAFIwHHPwBxB/+Xw2pQUUKixVuqT+3vc46iM3kmCJcJbxJKP8eL0q
 BBuhkqPs66kNSq1Fo5QnOT1Rh4LwSzx1IWjzqWaxin0cSO1MlwAHjokV/oN/sg8JBOBdaJXlfy4
 S/o+NZooW5G2GFAiTxxyewTm70yOUpC9sswIvg/Y50EPZ+I+/Kt6pF8raBY4ptPuq66FPADXCYQ
 U547yxYJUfodunC379A==
X-Authority-Analysis: v=2.4 cv=KfDidwYD c=1 sm=1 tr=0 ts=6a4f5d9b cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=o361_NEKw5eckzBeyt0A:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDA4MSBTYWx0ZWRfX9L2LOFmIWnkY
 ywI5mnEYmYxLADk9YGW5MSZ3OMZwIbjpEh7tP1wxuGIiMiTDcyaWT+t9zH0B5nS0jSiUlGUlZIR
 1mAPsmO5Oa7AB5/fnPvdAsd2lLdXegM=
X-Proofpoint-ORIG-GUID: rDNf-xhJSmC0Z4-P15eI-6rPmFHluXaO
X-Proofpoint-GUID: rDNf-xhJSmC0Z4-P15eI-6rPmFHluXaO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_01,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090081



On 6/19/2026 3:04 AM, Srinivas Kandagatla wrote:
> 
> 
> On 6/11/26 12:29 PM, Ajay Kumar Nandam wrote:
>> Add machine-driver support for Qualcomm Shikra EVK variants by matching
>> dedicated compatible strings and applying board-specific audio behavior.
>>
>> Shikra platforms are available as CQM, CQS, and IQS variants with
>> different audio components and processing architectures:
>>
>> - CQM/CQS use an I2S-based path with WSA885x amplifiers and
>>    PM4125 + Rouleur codec components.
>> - CQM runs in DSP-bypass mode, where the complete audio pipeline runs
>>    on CPU only and no DSP is involved.
> 
> This patch is doing too many things you need to seperate them in to
> seperate patches.
> 

ACK, will create multiple logical patches in the next version.

>> - CQS uses modem-DSP based audio processing.
>> - IQS uses a third-party MAX98091 codec with modem-DSP support.
>>
>> Introduce variant-specific handling so codec controls, DAPM widgets, and
>> clock programming match the board design and avoid invalid clock setup on
>> variants where it is not applicable.
>>
>> Co-developed-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
>> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
>> Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
>> ---
>>   sound/soc/qcom/common.c   |  2 ++
>>   sound/soc/qcom/sc8280xp.c | 58 +++++++++++++++++++++++++++++++++++++--
>>   sound/soc/qcom/sdw.c      |  3 ++
>>   3 files changed, 61 insertions(+), 2 deletions(-)
>>
>> diff --git a/sound/soc/qcom/common.c b/sound/soc/qcom/common.c
>> index f42c98ded..32d6c09b2 100644
>> --- a/sound/soc/qcom/common.c
>> +++ b/sound/soc/qcom/common.c
>> @@ -3,6 +3,7 @@
>>   // Copyright (c) 2018, The Linux Foundation. All rights reserved.
>>   
>>   #include <dt-bindings/sound/qcom,q6afe.h>
>> +#include <dt-bindings/sound/qcom,qaif.h>
>>   #include <linux/module.h>
>>   #include <sound/jack.h>
>>   #include <linux/input-event-codes.h>
>> @@ -430,6 +431,7 @@ int qcom_snd_wcd_jack_setup(struct snd_soc_pcm_runtime *rtd,
>>   	}
>>   
>>   	switch (cpu_dai->id) {
>> +	case QAIF_CDC_DMA_RX0:
>>   	case TX_CODEC_DMA_TX_0:
>>   	case TX_CODEC_DMA_TX_1:
>>   	case TX_CODEC_DMA_TX_2:
>> diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
>> index e5d23e244..4c985f81c 100644
>> --- a/sound/soc/qcom/sc8280xp.c
>> +++ b/sound/soc/qcom/sc8280xp.c
>> @@ -37,6 +37,25 @@ static struct snd_soc_dapm_widget sc8280xp_dapm_widgets[] = {
>>   	SND_SOC_DAPM_SPK("DP7 Jack", NULL),
>>   };
>>   
>> +static struct snd_soc_dapm_widget shikra_cqm_dapm_widgets[] = {
>> +	SND_SOC_DAPM_HP("Headphone Jack", NULL),
>> +	SND_SOC_DAPM_MIC("Mic Jack", NULL),
>> +};
>> +
>> +static const struct snd_soc_dapm_widget shikra_iqs_dapm_widgets[] = {
>> +	SND_SOC_DAPM_HP("Headphone", NULL),
>> +	SND_SOC_DAPM_MIC("Headset Mic", NULL),
>> +	SND_SOC_DAPM_MIC("Int Mic", NULL),
>> +	SND_SOC_DAPM_SPK("Speaker", NULL),
>> +};
>> +
>> +static const struct snd_kcontrol_new shikra_iqs_controls[] = {
>> +	SOC_DAPM_PIN_SWITCH("Headset Mic"),
>> +	SOC_DAPM_PIN_SWITCH("Headphone"),
>> +	SOC_DAPM_PIN_SWITCH("Int Mic"),
>> +	SOC_DAPM_PIN_SWITCH("Speaker"),
>> +};
>> +
>>   struct snd_soc_common {
>>   	const char *driver_name;
>>   	const struct snd_soc_dapm_widget *dapm_widgets;
>> @@ -49,6 +68,7 @@ struct snd_soc_common {
>>   	bool codec_sysclk_set;
>>   	bool mi2s_mclk_enable;
>>   	bool mi2s_bclk_enable;
>> +	bool dsp_bypass;
> How is this related to this patch?

will make this into seperate patch in the next version.

> 
>>   };
>>   
>>   struct sc8280xp_snd_data {
>> @@ -219,6 +239,10 @@ static int sc8280xp_snd_hw_params(struct snd_pcm_substream *substream,
>>   	int mclk_freq = sc8280xp_get_mclk_freq(params);
>>   	int bclk_freq = sc8280xp_get_bclk_freq(params);
>>   
>> +    /* Skip DSP configuration when operating in CPU-only (bypass) mode */
>> +	if (data->snd_soc_common_priv->dsp_bypass)
>> +		return 0;
>> +
> This has nothing to do with what this patch is doing.
> 
>>   	switch (cpu_dai->id) {
>>   	case PRIMARY_MI2S_RX ... QUATERNARY_MI2S_TX:
>>   	case QUINARY_MI2S_RX ... QUINARY_MI2S_TX:
>> @@ -239,7 +263,7 @@ static int sc8280xp_snd_hw_params(struct snd_pcm_substream *substream,
>>   					       SND_SOC_CLOCK_IN);
>>   
>>   		if (data->snd_soc_common_priv->codec_sysclk_set)
>> -			snd_soc_dai_set_sysclk(cpu_dai,
>> +			snd_soc_dai_set_sysclk(codec_dai,
> this is not related to shikra support

ACK

> 
>>   					       0, mclk_freq,
>>   					       SND_SOC_CLOCK_IN);
>>   		break;
>> @@ -284,7 +308,7 @@ static void sc8280xp_add_be_ops(struct snd_soc_card *card)
>>   	int i;
>>   
>>   	for_each_card_prelinks(card, i, link) {
>> -		if (link->no_pcm == 1) {
>> +		if (link->no_pcm == 1 || link->num_codecs > 0) {
> 
> Looks like you are mixing multiple changes in single patch, please
> seperate them.

ACK

Regards
Ajay Kumar Nandam

> 
>>   			link->init = sc8280xp_snd_init;
>>   			link->be_hw_params_fixup = sc8280xp_be_hw_params_fixup;
>>   			link->ops = &sc8280xp_be_ops;
>> @@ -375,6 +399,33 @@ static struct snd_soc_common sc8280xp_priv_data = {
>>   	.num_dapm_widgets = ARRAY_SIZE(sc8280xp_dapm_widgets),
>>   };
>>   
>> +static const struct snd_soc_common shikra_cqm_priv_data = {
>> +	.driver_name = "shikra",
>> +	.dapm_widgets = shikra_cqm_dapm_widgets,
>> +	.num_dapm_widgets = ARRAY_SIZE(shikra_cqm_dapm_widgets),
>> +	.dsp_bypass = true,
>> +};
>> +
>> +static const struct snd_soc_common shikra_cqs_priv_data = {
>> +	.driver_name = "shikra",
>> +	.dapm_widgets = shikra_cqm_dapm_widgets,
>> +	.num_dapm_widgets = ARRAY_SIZE(shikra_cqm_dapm_widgets),
>> +	.mi2s_bclk_enable = true,
>> +	.codec_sysclk_set = true,
>> +};
>> +
>> +static const struct snd_soc_common shikra_iqs_priv_data = {
>> +	.driver_name = "shikra",
>> +	.dapm_widgets = shikra_iqs_dapm_widgets,
>> +	.num_dapm_widgets = ARRAY_SIZE(shikra_iqs_dapm_widgets),
>> +	.controls = shikra_iqs_controls,
>> +	.num_controls = ARRAY_SIZE(shikra_iqs_controls),
>> +	.codec_dai_fmt = SND_SOC_DAIFMT_CBP_CFP |
>> +			 SND_SOC_DAIFMT_NB_NF |
>> +			 SND_SOC_DAIFMT_I2S,
>> +	.codec_sysclk_set = true,
>> +	.mi2s_bclk_enable = true,
>> +};
>> +
>>   static struct snd_soc_common sm8450_priv_data = {
>>   	.driver_name = "sm8450",
>>   	.dapm_widgets = sc8280xp_dapm_widgets,
>> @@ -408,6 +459,9 @@ static const struct of_device_id snd_sc8280xp_dt_match[] = {
>>   	{.compatible = "qcom,qcs9075-sndcard", .data = &qcs9100_priv_data},
>>   	{.compatible = "qcom,qcs9100-sndcard", .data = &qcs9100_priv_data},
>>   	{.compatible = "qcom,sc8280xp-sndcard", .data = &sc8280xp_priv_data},
>> +	{.compatible = "qcom,shikra-cqm-sndcard", .data = &shikra_cqm_priv_data},
>> +	{.compatible = "qcom,shikra-cqs-sndcard", .data = &shikra_cqs_priv_data},
>> +	{.compatible = "qcom,shikra-iqs-sndcard", .data = &shikra_iqs_priv_data},
>>   	{.compatible = "qcom,sm8450-sndcard", .data = &sm8450_priv_data},
>>   	{.compatible = "qcom,sm8550-sndcard", .data = &sm8550_priv_data},
>>   	{.compatible = "qcom,sm8650-sndcard", .data = &sm8650_priv_data},
>> diff --git a/sound/soc/qcom/sdw.c b/sound/soc/qcom/sdw.c
>> index 6576b47a4..0be743cec 100644
>> --- a/sound/soc/qcom/sdw.c
>> +++ b/sound/soc/qcom/sdw.c
>> @@ -4,6 +4,7 @@
>>   
>>   #include <dt-bindings/sound/qcom,lpass.h>
>>   #include <dt-bindings/sound/qcom,q6afe.h>
>> +#include <dt-bindings/sound/qcom,qaif.h>
>>   #include <linux/module.h>
>>   #include <sound/soc.h>
>>   #include "sdw.h"
>> @@ -41,6 +42,8 @@ static bool qcom_snd_is_sdw_dai(int id)
>>   	switch (id) {
>>   	case LPASS_CDC_DMA_TX3:
>>   	case LPASS_CDC_DMA_RX0:
>> +	case QAIF_CDC_DMA_VA_TX0:
>> +	case QAIF_CDC_DMA_RX0:
>>   		return true;
>>   	default:
>>   		break;
> 


