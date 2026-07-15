Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95E4E3C8708
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 09:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784108816; cv=none; b=gLqzpDJ6N9chImHFbJ7UkHHti6lsG4P+66AitDaBuILQ0owjV0MSZb7MX9NZ9BDpmwQE91uX1k0LPcZh4i7qKgh9ZAl7MCMXaLGTRdNeghxqyiM4I1hwCK/g4MJUlOZwG3XcJ18b4z5YrF12pjCM6hvpBwUpjr0IIr2d8ayqsd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784108816; c=relaxed/simple;
	bh=DVHlqR13RKKSicyNlmQLuQKCabNOtP0RQfhHOijiZ/A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TwBS+3//lWgHn2MiM2EALfVy/AgmU5ELalGULH8VLkfX5lZeUBHMqzgx9iIgIj0hw8guJu2pp0c8zGyx5WXbp7HyVgLV1PzNxOEIUw4L7xNDdwq74Wj+EOvGaXU92+Y+k2fxIGyKTmLpK2r2QjmHzMUQBn+enrBu1If+nmVlf9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C/Y5Vh9G; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BRdegl71; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C/Y5Vh9G";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BRdegl71"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66F92pwu160854
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 09:46:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5U2dKNr880n5H4mqNL7E/1ba8CM5ns5ZA6U85j4NUqA=; b=C/Y5Vh9GLv2p8A7z
	yEEjzzhODb8g3+dXWTV2EkTieNoNpUj2TyEUbLzGCt5K9SmjPep97sNqWYQ0+2/3
	GTgEsSRj3ryR2IV7N8d3N3SSWtvIuTNXTBjGMpZ+3wAEdOCrKrZo9RIGCqRmvBtI
	r+VrC6sLQLa+YKhud/sjqwB8gbG3YciBHiiIopLf2omc98QgYRBT2hCCcaDcQj9u
	SrYW6Pmi1nDfxYLYuHjJEE7Qmv3Hj5B57aQ+X+tV57251Uj9m7PwxMnKumO59C1N
	T577cEv/MEMN0sfZ4fMa7yb6lmBEqdFEMJsfsnVhw/7mJ9LFjAnXdluRFNpT/w8a
	JQlTUQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fe68wrdhy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 09:46:48 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c88aab7c1fcso12641249a12.3
        for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 02:46:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784108808; x=1784713608; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5U2dKNr880n5H4mqNL7E/1ba8CM5ns5ZA6U85j4NUqA=;
        b=BRdegl71T6wOulYbxLtNjGerfKE90f6aPhp+fenrRbdG55iLm9/P73BczLuSmAJsGb
         YgZWDzNQodcSHIZ1lfZgapMuHNLYdyVQEC0Fuxfc4OOWl5khbtxvny6VrJqHJnom6aZk
         OvkPoWHZpcosjSFWqHMPDM7VOnTIXtKPSUx3XxAMeAFi3ArlXhAISj2n7GyeMYvGplap
         xrx16hAua+ukn33pTY1KMKux5g8L5l0oI2JaXiuHQ28sNmrHcoXWZ0yxln946KKt4dgL
         Rt9uRJUO97iW4gcor8pWB4LG9OWfe4CInedtxAdnLGXRt0+0p/mPKczm82bbmulraB7E
         K5Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784108808; x=1784713608;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5U2dKNr880n5H4mqNL7E/1ba8CM5ns5ZA6U85j4NUqA=;
        b=eIOirwnHcnskPeOHjCVTKN83F5jcmI0cblkbjJHTd7Jd3UwpJBQK4FN84MXZGO4qB8
         GDV+xHceopmE60GXw2DYoDxgiwHnBwCkN+TgqmQGYyqj2Zp58HymhgRabEeqmaEMcZYD
         AyFQZL1bwWF4AQ/8Qm9Mh6A4f3Revj+nnhEeAYcZ2lHY5KQoEGPB+GFxa8Fd9rMi1HSR
         emCITukcfERlR2n2XoaFnQ9naZHiuHUQ8MUXHgSNdYkVfx8TwYN7sAtZZ1MHpKx0LBug
         96UDi1GFk2eKfF4oV+KkdghOhEUXJSZIVzyllXUej4IA5KcF5Te9skImL2Ch1HapZaqi
         mzUQ==
X-Forwarded-Encrypted: i=1; AHgh+RoIygHrt2s514CXYl7osdNxAAMmpgONEV4/VfPR0btfjYQ42/V0IHv6KpQqpUfdPqweflq2G8xnnT1c@vger.kernel.org
X-Gm-Message-State: AOJu0Yxd9fjG3ESBVjGodPlj+2bG7MXR/24+aibLADeTD1Tq7x5fhSZr
	KYicjbJIeenldpgd06R0IxUJ+heDLfMW3bCQbiinSxiB5pPSL3ieSQyeBrIpa/EKky3q36Oz34a
	OHejJTSDC+fkvZwM5eUK8l/kmetfLQxmZkNqLfdBHShFbCJtP85Bwp6TKE2HSlloH
X-Gm-Gg: AfdE7cn1Q3TI3A19X9BaZcc7FeBQtaEPFED9NnnVn8jFovZtGR0hy/Mt3pzJB6hSwBg
	whjranG9EikeeSd4J5JGkH6EroIgbozdW9bqQ8ZTqN8m1Z36gFMn1TP01csiT3Y1TrBV9OZvFuu
	4VlS9/+JGfIMpjEsYZ6haxc3SxjQ8YHyA8QHP9wpw0NY9e/1NjPbBrs2VWCyqpY4mGeiSa03zWJ
	pBKMFUQxm+pPBQpoadUZy2ShCyVysSx/w8toor8dHy3lc/40p12o8CeKeqzjM9ND/9bWGwlzsiP
	V5c3egGUEP5p1T2ZdPMy/m3ExuPhKtRrzqFt8vCGUetfFEmyKa2AlqN1UY4Qnr6MMGrzPhNn1AN
	xxfjILvMyfE5+TFPtTrrAVAm/FVtUVVyL17RRfHbWFfu9
X-Received: by 2002:a05:6a21:3a43:b0:3bf:a638:4376 with SMTP id adf61e73a8af0-3c357001859mr6662617637.21.1784108808132;
        Wed, 15 Jul 2026 02:46:48 -0700 (PDT)
X-Received: by 2002:a05:6a21:3a43:b0:3bf:a638:4376 with SMTP id adf61e73a8af0-3c357001859mr6662586637.21.1784108807661;
        Wed, 15 Jul 2026 02:46:47 -0700 (PDT)
Received: from [10.219.49.235] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3118ee6091dsm109927379eec.14.2026.07.15.02.46.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jul 2026 02:46:47 -0700 (PDT)
Message-ID: <48ba26cb-ada9-4639-8b77-d8cba2b31e22@oss.qualcomm.com>
Date: Wed, 15 Jul 2026 15:16:41 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/7] ASoC: qcom: q6apm-lpass-dais: add TDM DAI
 operations
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260712134110.3306763-1-prasad.kumpatla@oss.qualcomm.com>
 <20260712134110.3306763-3-prasad.kumpatla@oss.qualcomm.com>
 <d104da3e-036f-4681-b9b1-dc3e44ea20fe@oss.qualcomm.com>
Content-Language: en-US
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
In-Reply-To: <d104da3e-036f-4681-b9b1-dc3e44ea20fe@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Hriazui2Ap-yHi1ZeJ-kz1wATTfHBDUc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDA5NCBTYWx0ZWRfX4Nm9qMJpF8Vh
 N5WbonTMAEuz/+dSm0c5aJdX7Y1AXNDCStoWPyExpaXXCzSUnJBeI5aoeYm55D7p2/RTXl/3HLL
 XmfX+reSlGCHPIk4BkK6o4zXKLkqcD4ncpWOqr8DYhjmwNZc1LZ+qkGAkSOdLsWekRYd/zM+p80
 8wa6usAIl9jBmWC95wZBZXhkFh0s8H2mnbWkDhEz5lyc1bTGuH53Vube/iPgbXlyrf7ypmiv1QP
 TyCgG2hKkA6QyVHs68SFFUG6xZYzl+jf694MoaAjE6HOjxL3Zyw5iD8s5pE5NBGzQnHTGxn/ZlL
 ySMjfaNFBZbeto3rDz6XHM6MyZV9gYhztSL2iz7XNxuKlzyhX9OMTRcc9w+F+dyDZIhw1wgsHSW
 spQDYf4ajs5kkO4ckWe02GqiL1+GwGb11w2SpicsjqhdyElg+ZKdF5XOHOIs5BHfnK8g+S7YB4h
 S69EARav7AExxTkiJfQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDA5NCBTYWx0ZWRfX2Bvc2hrwXUBD
 eP0B6kmguGpeyJTt9DXHQBnbxBkoQjpvnwFCvK4Lvz/wssF04Jp0U2ac/QhVDaTW+kUiMCpszR3
 PLzfHa6CzWsHA0FKpvxqsjYNHngwSVs=
X-Authority-Analysis: v=2.4 cv=LbgMLDfi c=1 sm=1 tr=0 ts=6a575708 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=1NWjRULo-yTEZTBn0VQA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: Hriazui2Ap-yHi1ZeJ-kz1wATTfHBDUc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_02,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 suspectscore=0 adultscore=0 clxscore=1015
 phishscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607150094


On 7/14/2026 2:02 PM, Srinivas Kandagatla wrote:
>
> On 7/12/26 2:41 PM, Prasad Kumpatla wrote:
>> Add TDM DAI operations to q6apm-lpass-dais so AudioReach TDM
>> backends can be configured through the normal ASoC hw_params and DAI
>> setup flow.
>>
>> The TDM set_tdm_slot() callback validates the supported slot width and
>> slot count, stores the active slot mask in the AudioReach module
>> configuration, and leaves existing DMA, I2S and HDMI paths unchanged.
>>
>> Reuse the existing LPASS child-clock handling for TDM nodes as well as
>> MI2S nodes, since TDM backends also request optional backend clocks
>> through the machine driver set_sysclk() path.
>>
>> Signed-off-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
>> ---
>>   sound/soc/qcom/qdsp6/q6apm-lpass-dais.c | 57 +++++++++++++++++++++++++
>>   1 file changed, 57 insertions(+)
>>
>> diff --git a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
>> index 5743586ff..672189625 100644
>> --- a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
>> +++ b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
>> @@ -372,6 +372,50 @@ static int q6i2s_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
>>   	return 0;
>>   }
>>   
>> +static int q6tdm_set_tdm_slot(struct snd_soc_dai *dai, unsigned int tx_mask,
>> +			      unsigned int rx_mask, int slots, int slot_width)
>> +{
>> +	struct q6apm_lpass_dai_data *dai_data = dev_get_drvdata(dai->dev);
>> +	struct audioreach_module_config *cfg = &dai_data->module_config[dai->id];
>> +	unsigned int cap_mask;
>> +
>> +	if (slot_width != 16 && slot_width != 32) {
>> +		dev_err(dai->dev, "%s: invalid slot_width %d\n", __func__, slot_width);
>> +		return -EINVAL;
>> +	}
>> +
>> +	switch (slots) {
>> +	case 2:
>> +		cap_mask = 0x03;
>> +		break;
>> +	case 4:
>> +		cap_mask = 0x0f;
>> +		break;
>> +	case 8:
>> +		cap_mask = 0xff;
>> +		break;
>> +	case 16:
>> +		cap_mask = 0xffff;
>> +		break;
> switch (slots) {
> 	case 2:
> 	case 4:
> 	case 8:
> 	case 16:
> 		cap_mask = GENMASK(slots - 1, 0);
> 		break;
> ?

Hi Srini,

Thanks for review.

Good suggestion. The mask is derived directly from the number of
slots, so using GENMASK(slots - 1, 0) is cleaner and avoids
maintaining hardcoded values. I'll update this in the next revision.

>> +	default:
>> +		dev_err(dai->dev, "%s: invalid slots %d\n", __func__, slots);
>> +		return -EINVAL;
>> +	}
>> +
>> +	switch (dai->id) {
>> +	case PRIMARY_TDM_RX_0 ... QUINARY_TDM_TX_7:
>> +		cfg->nslots_per_frame = slots;
>> +		cfg->slot_width = slot_width;
>> +		cfg->slot_mask = ((dai->id & 0x1) ? tx_mask : rx_mask) & cap_mask;
> Should we validate the tx/rx mask here if its with in cap_mask range?
That's a good point. The current implementation silently truncates
any bits outside the valid slot range through & cap_mask. I'll add
validation to reject masks containing bits beyond the configured
number of slots and return -EINVAL instead of silently modifying
the requested configuration.

Thanks,
Prasad
>> +		break;
>> +	default:
>> +		dev_err(dai->dev, "%s: invalid dai id 0x%x\n", __func__, dai->id);
>> +		return -EINVAL;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>>   static const struct snd_soc_dai_ops q6dma_ops = {
>>   	.prepare	= q6apm_lpass_dai_prepare,
>>   	.startup	= q6apm_lpass_dai_startup,
>> @@ -401,6 +445,17 @@ static const struct snd_soc_dai_ops q6hdmi_ops = {
>>   	.trigger	= q6apm_lpass_dai_trigger,
>>   };
>>   
>> +static const struct snd_soc_dai_ops q6tdm_ops = {
>> +	.prepare	= q6apm_lpass_dai_prepare,
>> +	.startup	= q6apm_lpass_dai_startup,
>> +	.shutdown	= q6i2s_lpass_dai_shutdown,
>> +	.set_tdm_slot	= q6tdm_set_tdm_slot,
>> +	.hw_params	= q6dma_hw_params,
>> +	.set_fmt	= q6i2s_set_fmt,
>> +	.set_sysclk	= q6i2s_set_sysclk,
>> +	.trigger	= q6apm_lpass_dai_trigger,
>> +};
>> +
>>   static const struct snd_soc_component_driver q6apm_lpass_dai_component = {
>>   	.name = "q6apm-be-dai-component",
>>   	.of_xlate_dai_name = q6dsp_audio_ports_of_xlate_dai_name,
>> @@ -429,6 +484,7 @@ static int of_q6apm_parse_dai_data(struct device *dev,
>>   		case PRIMARY_MI2S_RX ... QUATERNARY_MI2S_TX:
>>   		case QUINARY_MI2S_RX ... QUINARY_MI2S_TX:
>>   		case SENARY_MI2S_RX ... SENARY_MI2S_TX:
>> +		case PRIMARY_TDM_RX_0 ... QUINARY_TDM_TX_7:
>>   			priv = &data->priv[id];
>>   			priv->mclk = of_clk_get_by_name(node, "mclk");
>>   			if (IS_ERR(priv->mclk)) {
>> @@ -490,6 +546,7 @@ static int q6apm_lpass_dai_dev_probe(struct platform_device *pdev)
>>   	cfg.q6i2s_ops = &q6i2s_ops;
>>   	cfg.q6dma_ops = &q6dma_ops;
>>   	cfg.q6hdmi_ops = &q6hdmi_ops;
>> +	cfg.q6tdm_ops = &q6tdm_ops;
>>   	dais = q6dsp_audio_ports_set_config(dev, &cfg, &num_dais);
>>   
>>   	ret = devm_snd_soc_register_component(dev, &q6apm_lpass_dai_component, dais, num_dais);
