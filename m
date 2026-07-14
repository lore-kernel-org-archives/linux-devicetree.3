Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69F913F8222
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 08:32:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784017934; cv=none; b=J2uSatiuJB6fFO051XlQB2xjYZRPfYCrHeMdpHdkTN9hsPj9/wdKVwfom/hL5VY1VX1AhJo0AV6E+X0c0V7dxeORs1TsMcnemEp/4+0FLPzHPajnGtz8x4g9U5jnQH6qXO6X1AseyI/xtu+nj4TkBoWz+o5igD1fVkmkmqNmllw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784017934; c=relaxed/simple;
	bh=BNx/cHZjW+rS8Q0g1cL/miwCM3f1tAwoVC1y8S6rPC8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qVPy7V7Vsa2hsGP+0aQPwAGP3jX6KUxTmiUj5el33HBgqoM3stJ5gRhoIqASAvw92dYG4AcYSxOoNQYodjF8r/S9l2Y0SkpJ+FEK1bi3vkKab71N1zfikVFgpgQkydj3IVbSCV5nNUa7UPzC3o70vyaqec7BuW7GhMfVpbj6/0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lMkwNLts; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J9mxLuGc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lMkwNLts";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J9mxLuGc"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66E6SZqn4005247
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 08:32:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	w75jmxwiFCr7ZyNjRYRnD2Hm0xsHXlUYAtWIPAxB/HM=; b=lMkwNLtsH1RglDoL
	P1957EJSlyfKvaozt+JP44IRJI5mL2BvDVIgpcgX5AskFCdvfn9OxCs4lwL1jwj1
	IGPB5GCNAynYZUvx932/BIca71ykrUbY3ENbOLPthTsyD9EPVqAIM1xNc8Ixan4X
	kfci8NnUFqt3znAzoX34dxrD4lQdOqQ/NHVfYvLdNy3+evbe/b1oYE1R+2OBA2Gb
	RZFtWIHyZQjDPJPD+DLW/HtMXDvPVBvIZRGBtCU5RL+U+sl7wwbch+ul3FcsQem/
	SCZfILDZkHeCENbalt7mujhh5qg65EEy24eJmGPWOzTLaApZZR8Kq74eitlO0z0E
	74lPsg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fd44ctu5j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 08:32:05 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c2af04aeeso9558061cf.0
        for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 01:32:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784017924; x=1784622724; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w75jmxwiFCr7ZyNjRYRnD2Hm0xsHXlUYAtWIPAxB/HM=;
        b=J9mxLuGcIu+/DeG7YSSVGm5bKqE+yj98R/Fj0xx/1mjufbfNNWSuAwXraNhKN2ykO4
         tvGoYPb86DiDF05Acffve7Q1+i5g/Huz6KclUa/gG5FkkSXQHQRhj3MuwkCeBdWQJpDQ
         JUiMpIvjahryasQjRija8KXsdj+NJcTYFMbEk32aSkox1Eujiho8O57qqg+oZ47bNOZO
         GrNUm2zVRd8COu8g0+slX864U9FwhsmCDLxcwhzgmRzH8uF4n7IVE3NW+K/Fp//OGmc7
         2joo7FKd+1XJYKvwDYnvvNtlLRBfP1ZbA6izfs7yF20rkkdhBHTF7l1e78fwzxrj06RE
         DL/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784017924; x=1784622724;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w75jmxwiFCr7ZyNjRYRnD2Hm0xsHXlUYAtWIPAxB/HM=;
        b=Z5C8nJxs8WzAXIu8qQ0WbLCpgGobU0g/wGyPb3g83slx6gnuF8FuBJAwm9+hCcvZaR
         ZBjuoio40wNpNBZIUumauDJ/NTLay+58qqMDpUG4Xd+2luVyxkxmQCcBC4h6WEaovd6k
         HyBhh16h92WONGb51mOX6OMTTsCIY4iJ3IcWmHLKrp93H3y7GTgGwYhPJ2mNav4+GXXT
         TDtqB0/QGcAxxfQdPkzDEM48BIE8hg/USLsZoib3CGlGZPcDwcMUar3ls2iMDqR+9mO3
         4G0FrDwSKIE2H+PZtYt28Z1/tBXbttQd4YFHSqPsJxxw1hWjQNgWt7Klv54yYCxpi5mK
         zUTg==
X-Forwarded-Encrypted: i=1; AHgh+RqhaFUWE1kqAxgZwOhbt5Bc38J6RgFfS8m2ZOAKDpVAW4IWf8gBUDtxvGEF0AHmj88BqfPmq2khQF2B@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6sbQF464JbNKFnZlWc9CCqI5BdnFNqgmQvQaSGJnWwWgI5leo
	Ge6ZZSzgZt3nHO2g8aSjFGtE4u7LDQDgb2DbQxN0orHBHcMVPU4FHNjUKtL7xW83IGrGbm+Mdry
	CTciyAtdcSJPDULdTLNKBhD59qJ3LDBdM940W+UB1Ez50kB92UYF65t9jRyHLDkhz
X-Gm-Gg: AfdE7ckEvuOgQL790Jv6KfZlAQVVgzXJKsalh7koa1QIzRGM6z7YKpp1zYW2eAnl9UH
	uVh4diTfciyxyyQbq6aRUnIlDevwvYs5heHm2K0kJG3WaD3LTy6dt4ZqFcHY0zsCH1EbZHXuR04
	+hBRgGNHQ/X6nxtOWnTbLX3JgfTAyWgPe7tQ2C0bJgJPfVGQcgAEpdgyxRir+COO/j6Kv4XT9qh
	Upz1ixVhbtc4Lud3HmqT8xwRWNvz6xDmEBXf0QbJyJyByjAZYOxFbkt4ojHCpofEV/zUn4OSElF
	Q6rHFDqwSt78PY0rC1cgZHI7U4xFOl8YtjOXVUOemAnhdFgkiU0TKfOphxEfNb4+zCwKQVfpNqI
	GnizTejWvCjwB7VB5Pr4yRJMGEiPAXCTKg5jCKA==
X-Received: by 2002:a05:622a:1813:b0:51a:8691:4427 with SMTP id d75a77b69052e-51ca9eb3ad7mr167867991cf.0.1784017924463;
        Tue, 14 Jul 2026 01:32:04 -0700 (PDT)
X-Received: by 2002:a05:622a:1813:b0:51a:8691:4427 with SMTP id d75a77b69052e-51ca9eb3ad7mr167867781cf.0.1784017924003;
        Tue, 14 Jul 2026 01:32:04 -0700 (PDT)
Received: from [192.168.68.109] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-c15d3e54e83sm897380266b.42.2026.07.14.01.32.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jul 2026 01:32:03 -0700 (PDT)
Message-ID: <d104da3e-036f-4681-b9b1-dc3e44ea20fe@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 09:32:02 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/7] ASoC: qcom: q6apm-lpass-dais: add TDM DAI
 operations
To: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
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
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20260712134110.3306763-3-prasad.kumpatla@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: hgAzCoE6HJYM-LyG9naGq5vBczNDV8V8
X-Proofpoint-ORIG-GUID: hgAzCoE6HJYM-LyG9naGq5vBczNDV8V8
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDA4OCBTYWx0ZWRfX9R+UgOpr9ld3
 Pl2lumXWxsMEIJyuffm8SG/fHFEkUCm2R1hMhTSfhPnbBiK2Jpnv8YYp5UA4HGGgwkpShpak4cl
 nDSrZM6xZj+qAA2xsrA/eGWiQmOasqY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDA4OCBTYWx0ZWRfXwMvSv2jV+IM/
 mCdw5ZYWQGrYlgTmRd/6Thc2BOknnsDQ/XJot+6TfxOYyYRPBW0fruUznlDhcmn+sZHKvcBP9DR
 ArrASC3c2BTT3OK1zDse2nQcbn0zY/FmzHQ9LMxKFgNkY+kY8yBkYW6CQu+QsYD9YIJWfLmYFLS
 U0+2/A2JftWFkjdGIcAevZxE/VVJFaZtcMt0IYjhcmfjLVKsaNS/r0CWacbCo6KAY8Ek+SjhnjD
 mIKlN/Btd4wifObmIdVfKXyhCIdcdU7wfjPVSNWYo9+alaOytzgmlQkfgwvwyC39YGLuLBaN/3x
 /+VgCif2OQAWqsbhan7GLJOJV8fV+l1Cl4Jl3DmfUq0sUJJ/qQcpSIfLXqhzaJaEknnaNGuN82d
 RbwUu0YXEH9arktPG5Z3QkiuUfcDkbf1AbcTfpsVUsKdzOQpDxJJXpFKzDe1Cw3vEstgFRSPj+V
 8Bj7fsKsm4uQVnJXhKQ==
X-Authority-Analysis: v=2.4 cv=P84KQCAu c=1 sm=1 tr=0 ts=6a55f405 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=VHJlbi77fKg4ZXaQ5xoA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 malwarescore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 bulkscore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607140088



On 7/12/26 2:41 PM, Prasad Kumpatla wrote:
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
>  sound/soc/qcom/qdsp6/q6apm-lpass-dais.c | 57 +++++++++++++++++++++++++
>  1 file changed, 57 insertions(+)
> 
> diff --git a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
> index 5743586ff..672189625 100644
> --- a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
> +++ b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
> @@ -372,6 +372,50 @@ static int q6i2s_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
>  	return 0;
>  }
>  
> +static int q6tdm_set_tdm_slot(struct snd_soc_dai *dai, unsigned int tx_mask,
> +			      unsigned int rx_mask, int slots, int slot_width)
> +{
> +	struct q6apm_lpass_dai_data *dai_data = dev_get_drvdata(dai->dev);
> +	struct audioreach_module_config *cfg = &dai_data->module_config[dai->id];
> +	unsigned int cap_mask;
> +
> +	if (slot_width != 16 && slot_width != 32) {
> +		dev_err(dai->dev, "%s: invalid slot_width %d\n", __func__, slot_width);
> +		return -EINVAL;
> +	}
> +
> +	switch (slots) {
> +	case 2:
> +		cap_mask = 0x03;
> +		break;
> +	case 4:
> +		cap_mask = 0x0f;
> +		break;
> +	case 8:
> +		cap_mask = 0xff;
> +		break;
> +	case 16:
> +		cap_mask = 0xffff;
> +		break;

switch (slots) {
	case 2:
	case 4:
	case 8:
	case 16:
		cap_mask = GENMASK(slots - 1, 0);
		break;
?
> +	default:
> +		dev_err(dai->dev, "%s: invalid slots %d\n", __func__, slots);
> +		return -EINVAL;
> +	}
> +
> +	switch (dai->id) {
> +	case PRIMARY_TDM_RX_0 ... QUINARY_TDM_TX_7:
> +		cfg->nslots_per_frame = slots;
> +		cfg->slot_width = slot_width;
> +		cfg->slot_mask = ((dai->id & 0x1) ? tx_mask : rx_mask) & cap_mask;

Should we validate the tx/rx mask here if its with in cap_mask range?
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
> @@ -401,6 +445,17 @@ static const struct snd_soc_dai_ops q6hdmi_ops = {
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
> @@ -429,6 +484,7 @@ static int of_q6apm_parse_dai_data(struct device *dev,
>  		case PRIMARY_MI2S_RX ... QUATERNARY_MI2S_TX:
>  		case QUINARY_MI2S_RX ... QUINARY_MI2S_TX:
>  		case SENARY_MI2S_RX ... SENARY_MI2S_TX:
> +		case PRIMARY_TDM_RX_0 ... QUINARY_TDM_TX_7:
>  			priv = &data->priv[id];
>  			priv->mclk = of_clk_get_by_name(node, "mclk");
>  			if (IS_ERR(priv->mclk)) {
> @@ -490,6 +546,7 @@ static int q6apm_lpass_dai_dev_probe(struct platform_device *pdev)
>  	cfg.q6i2s_ops = &q6i2s_ops;
>  	cfg.q6dma_ops = &q6dma_ops;
>  	cfg.q6hdmi_ops = &q6hdmi_ops;
> +	cfg.q6tdm_ops = &q6tdm_ops;
>  	dais = q6dsp_audio_ports_set_config(dev, &cfg, &num_dais);
>  
>  	ret = devm_snd_soc_register_component(dev, &q6apm_lpass_dai_component, dais, num_dais);

