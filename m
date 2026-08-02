Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A36A93A8749
	for <devicetree@vger.kernel.org>; Sun,  2 Aug 2026 13:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785676124; cv=none; b=LHIqcdbWA0dUHsw+d9FTQHPkaTGJwuiQ4CO8vvMmU84wXJqTQJjCxAFpE7YBDPPspd7jjvPqXvWeWQudOak8ZkiLmdINMhs5GRbGkgSITzgl6bWitAvfBpoNxL4dRPpXcwLgP3xVrzJTORGsc6Eq76UIis7R81EaN1HEzA+/pNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785676124; c=relaxed/simple;
	bh=Zjr/GgkfQN8HSlBsnDUe5c06WaWL49Nm33OUy/WRiT8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gp6ANPZ/CgA1IqFznXbzv0O6nOUCHJvCtJOes6Z0SVtFiKM6K7etIW2oSauJ28CECMIyDJJ/U3FvLYh85U3nUVGbUyQfKATb9z7w9ZRwC/4GGjjj2VoQXa7asgg4UL4AXim/12ZJDocCv09chf0RsH3gB54A/YlsPxrEr9bg/5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=msWveZee; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VkvMHkWI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="msWveZee";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VkvMHkWI"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 672B6nxX1791302
	for <devicetree@vger.kernel.org>; Sun, 2 Aug 2026 13:08:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tzTlSswQ+tryVfPWA7dtL2qCpFKJCmXOg6f/dfXV+1U=; b=msWveZeeBOmevEEl
	3Qxgw9QqSsnoiPZYLFrAHsscSg8Y2oNOqCrfEpoamkM7s/YRIouQc4PQ17SQDQvU
	FtBFsX27tCD3hmfHEAkwCxKFUU2ikf1kS0T5yythTfKNf2PYKrDxnEWiDkoMbWRe
	hPUZn8JopYtuCSt7peBqsZn0L8UK8UMTVHO019GeTnN/aoSHoCuWYALoWjLJcJhU
	jGLSmF+BdYdSEfvsdiOH9TNsH86F7LW7dT4raBQOYz1pyPF1wjKvcNVxLshWpngp
	f36vx84ysR1Sl72bbEbzRfVAQJ+Ido0vARdYQdKI4dcnZqEYq43kGoojvsXG+qn6
	pQOZ1A==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fs8tx2wkb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 02 Aug 2026 13:08:41 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5283fa0656dso40560881cf.1
        for <devicetree@vger.kernel.org>; Sun, 02 Aug 2026 06:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785676121; x=1786280921; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tzTlSswQ+tryVfPWA7dtL2qCpFKJCmXOg6f/dfXV+1U=;
        b=VkvMHkWI+Gw33HRuOyHYtimn4Tffq5hm15SF8rfxGHBMRNvh6lUyiGEWcjTARKfpyH
         RW0etXmOet5pAokw5VqV/9n3wpnnmWePDnX2BHF89XLpOhGn1BBXsxc4EFSzwF4J5Zzi
         8rBcMfDgk/ZTTZ+7QeT70b1OmRBoRGO9aYDsEsGae4cqqiw2No0AiWjjMcYJO0ZJLP/A
         qMIMo6VqjTr0YgkqFsN+aPVh5tJ5Cj3WwJu+4VSf3WtgeJ+pKnHDoYUuz/ZrkqUFn3RA
         YX2A0VpAI82nvq8bAua4vdQl0n4Pfxsp/H+W0P8ve+9slu0fPtFjfRD2g21tcZ9kc51U
         oMWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785676121; x=1786280921;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tzTlSswQ+tryVfPWA7dtL2qCpFKJCmXOg6f/dfXV+1U=;
        b=GTMFoxJROpIBvWG+UOo9Z8JrY2rK6x44AD1bid/AdpdpwHXJVxU9398IJ5ob7FxysN
         pVohDvoOTp5MoAzEUSYq9ZXggsSJ/i9tz4+mj6RVKwgj3vayBK7NbNLXH1b83a9ny63a
         efitRlIKTznnF+/bQuZjuxUSBfOqG/3qsNUejngyhlZWVSbO8wUJsHxX7FUmXK8/4cVq
         7MHpFd/LH6/0AAdTt+IRDZjbyzH9DwLfLMJ64h+6/Q0qhX16LklmhWFDZUHvvg5+2XkX
         WcJQyLTYC7aY2F911YVsPbOsKrMBniz3ajhvmJtz3Docy1vB5F6VGPTEhB7FKRmd5cvf
         jt3w==
X-Forwarded-Encrypted: i=1; AHgh+Rp0X0F1zo8O/9Bfh+rCH2ULa9JFA04323er5/4WqHs09a/c8hmNeJTn80ASP3EP8L5Y6TknebrMdjLT@vger.kernel.org
X-Gm-Message-State: AOJu0YwvHN+P0c68z/oYrbFVe48kRfj+QsEyKA3cy6r7vAbbfPaUHaA7
	lP8wHMtuH7pV8+vT8FL6gKuMhFiNp/XxXtqgz/UeUCccbRnD6xmZgcRf0URv40jMlXQN3ilJyqC
	QrXbIBVpKWoDuTOiP7O3WWV38QcWYERIwiQMvclrpfPZ7b/jmoKf6LviklYMd60un
X-Gm-Gg: AR+sD11m85S6pFzWYtLTCgvuhrFBtsyQLV1b8+vqzfileq0ZKnzNnRTGricasnSAsfj
	UirSVfZYwrwXm+AxANBO0gp+LrMhtp5pd6E/zmTbFVf6MPx18ivnuVHruYgZvqHhcHz3kYI6qZw
	Dxp2oOodojOimFSjsFBVuoCXF3aRokr1oOu2annOeL1xu7lkOSZGYrGb7iqAqv/Dc1QxAYIVp+K
	6LB4fuXrPSnu19ww6SFSo95Jzb+2STAmT4kJNzcmJWuGouA21T0p1gN1x1dgnybR33nG5gKRPfb
	GEYeCGnLlXjOmTNP6+f40knHuUg0AkIrNB7GAl+tMNwELN9n74PksySbptQmRkwlSGBMJ/gBKbA
	ZRkL1/r9o8UJvT6fGygBwDAWRaI0=
X-Received: by 2002:ac8:5cc3:0:b0:51c:291:82eb with SMTP id d75a77b69052e-52b4c5877a4mr155031571cf.14.1785676120898;
        Sun, 02 Aug 2026 06:08:40 -0700 (PDT)
X-Received: by 2002:ac8:5cc3:0:b0:51c:291:82eb with SMTP id d75a77b69052e-52b4c5877a4mr155030951cf.14.1785676120464;
        Sun, 02 Aug 2026 06:08:40 -0700 (PDT)
Received: from [192.168.68.104] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49807b9441csm132440315e9.4.2026.08.02.06.08.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Aug 2026 06:08:38 -0700 (PDT)
Message-ID: <192088d6-a50f-4eaa-9aeb-41db6d2a2126@oss.qualcomm.com>
Date: Sun, 2 Aug 2026 14:08:37 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/7] ASoC: qcom: q6apm-lpass-dais: add TDM DAI
 operations
To: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260801054610.4047089-1-prasad.kumpatla@oss.qualcomm.com>
 <20260801054610.4047089-3-prasad.kumpatla@oss.qualcomm.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20260801054610.4047089-3-prasad.kumpatla@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAyMDExNSBTYWx0ZWRfXymD1Af9EKgxh
 wJz5ZYGUTAcbXVVuqfSCz3hSi/soceNDJo33Z+Vh34BVpn51aq2ETd2v3Iy7UMZSJgiV5jyBZU+
 Tn+lfqi1qQo5lRSNzNqyfjpJ5kScY1cqNUHy1IulF2hGuTC0v44I/Q0F49v3m6EY+387LuaaktO
 qz90xJNUXHEEK0kRP9gMUQ/049IUA7TqJmsNpreRBTdQTEN+GUk9iJLZJrc0rGYYnzfz8/iBtBU
 JjPsi8EKmvoDo8skHMnIcRonzBfQb1fHsCCmktD1/gJoxHB5BpFBHPOGyW1JmHcTh2ZzVkGKcHj
 W1vnj2Upi8yAJ/cC5lgbQoPcevw8CEhKCX1IExaXK6ZOvxeyggwyKTbe/A/Stq2LnL/8Z7/sIQ8
 KgdqIhC11cWDr3/SCa/nmHTQAPBV2CEl9BfraiMXSBo+/DdumQ8RsnkLItc+ewsl7cU+F9qC3tt
 JexVfA23UhBB/h5xt+Q==
X-Proofpoint-GUID: UpEPevYqhRuqBTeCXX2RZABjDIp5_6wW
X-Authority-Analysis: v=2.4 cv=T9C8ifKQ c=1 sm=1 tr=0 ts=6a6f4159 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=VHJlbi77fKg4ZXaQ5xoA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAyMDExNSBTYWx0ZWRfXy2vxk3TdO/y/
 SGLLGtZ2mUOcphd26bMFCf9thb9JS0HQe6TDUeNIhkMdhywVIRMEJ0Q8m0G+PKt404ZWJS1KDj/
 kWhjK45jdWaJPeJyD+lFWhnM2VRBejc=
X-Proofpoint-ORIG-GUID: UpEPevYqhRuqBTeCXX2RZABjDIp5_6wW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_04,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 spamscore=0 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608020115

On 8/1/26 6:46 AM, Prasad Kumpatla wrote:
> Add TDM DAI operations to q6apm-lpass-dais so AudioReach TDM
> backends can be configured through the normal ASoC hw_params and DAI
> setup flow.
> 
> The TDM set_tdm_slot() callback validates the supported slot width and
> slot count, stores the active slot mask in the AudioReach module
> configuration, and leaves existing DMA, I2S and HDMI paths unchanged.
> 
> Reuse the existing LPASS child-clock handling for TDM nodes as well as
> MI2S nodes, since TDM backends also request optional backend clocks
> through the machine driver set_sysclk() path.
> 
> Signed-off-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
> ---
lgtm,

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

--srini
>  sound/soc/qcom/qdsp6/q6apm-lpass-dais.c | 60 +++++++++++++++++++++++++
>  1 file changed, 60 insertions(+)
> 
> diff --git a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
> index e68e8b000e07..e204fd59e512 100644
> --- a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
> +++ b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
> @@ -358,6 +358,53 @@ static int q6i2s_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
>  	return 0;
>  }
>  
> +static int q6tdm_set_tdm_slot(struct snd_soc_dai *dai,
> +			      unsigned int tx_mask,
> +			      unsigned int rx_mask,
> +			      int slots, int slot_width)
> +{
> +	struct q6apm_lpass_dai_data *dai_data = dev_get_drvdata(dai->dev);
> +	struct audioreach_module_config *cfg = &dai_data->module_config[dai->id];
> +	unsigned int cap_mask, slot_mask;
> +
> +	if (slot_width != 16 && slot_width != 32) {
> +		dev_err(dai->dev, "%s: invalid slot_width %d\n", __func__, slot_width);
> +		return -EINVAL;
> +	}
> +
> +	switch (slots) {
> +	case 2:
> +	case 4:
> +	case 8:
> +	case 16:
> +		cap_mask = GENMASK(slots - 1, 0);
> +		break;
> +	default:
> +		dev_err(dai->dev, "%s: invalid slots %d\n", __func__, slots);
> +		return -EINVAL;
> +	}
> +
> +	switch (dai->id) {
> +	case PRIMARY_TDM_RX_0 ... QUINARY_TDM_TX_7:
> +		slot_mask = (dai->id & 0x1) ? tx_mask : rx_mask;
> +		if (slot_mask & ~cap_mask) {
> +			dev_err(dai->dev, "%s: invalid slot mask 0x%x for %d slots\n",
> +				__func__, slot_mask, slots);
> +			return -EINVAL;
> +		}
> +
> +		cfg->nslots_per_frame = slots;
> +		cfg->slot_width = slot_width;
> +		cfg->slot_mask = slot_mask;
> +		break;
> +	default:
> +		dev_err(dai->dev, "%s: invalid dai id 0x%x\n", __func__, dai->id);
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
>  static const struct snd_soc_dai_ops q6dma_ops = {
>  	.prepare	= q6apm_lpass_dai_prepare,
>  	.startup	= q6apm_lpass_dai_startup,
> @@ -387,6 +434,17 @@ static const struct snd_soc_dai_ops q6hdmi_ops = {
>  	.trigger	= q6apm_lpass_dai_trigger,
>  };
>  
> +static const struct snd_soc_dai_ops q6tdm_ops = {
> +	.prepare	= q6apm_lpass_dai_prepare,
> +	.startup	= q6apm_lpass_dai_startup,
> +	.shutdown	= q6i2s_lpass_dai_shutdown,
> +	.set_tdm_slot	= q6tdm_set_tdm_slot,
> +	.hw_params	= q6dma_hw_params,
> +	.set_fmt	= q6i2s_set_fmt,
> +	.set_sysclk	= q6i2s_set_sysclk,
> +	.trigger	= q6apm_lpass_dai_trigger,
> +};
> +
>  static const struct snd_soc_component_driver q6apm_lpass_dai_component = {
>  	.name = "q6apm-be-dai-component",
>  	.of_xlate_dai_name = q6dsp_audio_ports_of_xlate_dai_name,
> @@ -415,6 +473,7 @@ static int of_q6apm_parse_dai_data(struct device *dev,
>  		case PRIMARY_MI2S_RX ... QUATERNARY_MI2S_TX:
>  		case QUINARY_MI2S_RX ... QUINARY_MI2S_TX:
>  		case SENARY_MI2S_RX ... SENARY_MI2S_TX:
> +		case PRIMARY_TDM_RX_0 ... QUINARY_TDM_TX_7:
>  			priv = &data->priv[id];
>  			priv->mclk = of_clk_get_by_name(node, "mclk");
>  			if (IS_ERR(priv->mclk)) {
> @@ -479,6 +538,7 @@ static int q6apm_lpass_dai_dev_probe(struct platform_device *pdev)
>  	cfg.q6i2s_ops = &q6i2s_ops;
>  	cfg.q6dma_ops = &q6dma_ops;
>  	cfg.q6hdmi_ops = &q6hdmi_ops;
> +	cfg.q6tdm_ops = &q6tdm_ops;
>  	dais = q6dsp_audio_ports_set_config(dev, &cfg, &num_dais);
>  
>  	return devm_snd_soc_register_component(dev, &q6apm_lpass_dai_component, dais, num_dais);

