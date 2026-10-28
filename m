Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793191516;
	b=pU5I7JbFuGw6ekrTX1YLbRGVVoqjPjmPU+FDoWxnlzi319xFIiUqXoeWBcKiAzYc96sr
	 m9yLyrt4gXNNKCnNXPzJ/ppnfp0SoXwr9ZXJRo2gUUbwrjzGgOwTkwdmZzFrMz/I89irA
	 4P3lMD3V2FvLW74fxTAX1HSyBqx9Ie0A2ECBhlabKQNtn/CGlDGzNIjWn+tdKwzA9FL9J
	 d7DBsLd2Idd1CZAMTR0FuccY85O9ukeGn532w3crSse3HYwLQdhP7hbqX0S4qk9awPmDp
	 /NoP3Pkt4U7v3UipLeGaUGzm1Pj2yMAH9jBSQx91aWyX2gVBHXAYP65lwTPePZVMaWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793191516;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=5KmPEv9BbYq9ivb9/xdVcH9aF3UwmKIrOH5Phn5qMjw=;
	b=G9OtqS866NSTef8caJfJAR98ugOx+OHI4EBvT8E9/iTROo+FnpEgdgfqPbq54dwHyfBG
	 J8PV37CauXrlDyxvlga/c6EhH/7CNITEYJbPACdXxtRe2y23pAA7svBg7vWrwmHfuHBku
	 JhvaJAw9xy8c3VOTBXlHyY5KxPswzOg7thCXv/i8pZgDKyJHncUZHgToDP34AUypZL+et
	 r01X9SqwWNe6xyKJYmf2VfcJJJy4u/qTAzuXQ8cqy4L/zk75ZRlad952kqtoV9kV5epbw
	 y5WbSD9aRirv/N9Cw3paYNOV4lMPwgLedbmW/BeSHKEYyPbT352s++xxGoazsYTnJgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=I44WwHAm;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gfKPZVyu;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47A28606A323
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 12:45:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47A28606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=I44WwHAm;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gfKPZVyu
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SBdv5d2082338
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 12:45:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5KmPEv9BbYq9ivb9/xdVcH9aF3UwmKIrOH5Phn5qMjw=; b=I44WwHAm/HLXf4JB
	acZzXtlzC8FLWO1unDttC4szXJESyC1+HmHFlL7YVwzPx0Ag0hCwCgPj4APu6nHh
	BgER+kq3w+iwcSyxMx39ox2lMIFtn/p0AHLbosPkVycMa59y1x/+5UM8xr/Mycb3
	/PUbTf33jTnuAbaUzrhHMPVE1z5BYMiWkFflzS2JvJDbD/ewmwjffhTthAScgooc
	SIUTSZkXZ6ZPsfq6mIeDl1WZlM7Bvrncq5Qs+tEtkscTYTy1n5cKo30V9KhPDlxW
	buJZDjYLsyutXkH69rhU2lwmay9GxvzykqzZR56r8/7UoAxyu40f3FlF44qQWyMJ
	o9KI9g==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjyjpv0vk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 12:45:14 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3692c5b061bso2682773eec.1
        for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 05:45:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793191514; x=1793796314; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5KmPEv9BbYq9ivb9/xdVcH9aF3UwmKIrOH5Phn5qMjw=;
        b=gfKPZVyuum0r/qncMkIvmoa2kVw8ZnhkQz5T73XosjQNPfHIR2zbsez8sH9qRoOuUE
         9ao0MFGspvb7tOqtIMTWXGJnSxyxIo2MfYX/l7xxVY9waG87FlZZMgDiRTYKly7GzsyB
         0867373ClCSsaQfKbUUIqTOfVgfLKJDMH64cTv8yOBmWs5D5KSg6elK5X6hKq1dAt5RJ
         wMEb4ezOS7cmhSvMdvQsJ0p+Czr/+0l1IQHoRzL2IxFmLY71Jyq7nRXweOyZP9OVMPny
         8eeAGa9no/cL5CZsP4qHBsTqsVoGc3n6u2kWN7T4ErvY6XoTUxcZb5jmZFEQp0Vovvro
         IqUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793191514; x=1793796314;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5KmPEv9BbYq9ivb9/xdVcH9aF3UwmKIrOH5Phn5qMjw=;
        b=rmuZFTt5Bq8x2OihfomLyzRr6RUSlviV3Uove7vCqMA+mrwVE1Di08ywnpDUUbpD68
         8LVli4OCmThQjs9nv4eCPuCawsGk7434bjkJ4WE0ZHqFPYI6QBDtRvKtc4jk45CoYN40
         YW0S7a+/U/oUZXngS1yaS8V3lCz3CEQMKsG8+BEJtqCNJBmUHDCuhCh3dcGJ+10m67hL
         fD4vNuW43d7+zibEpe4N2KyupyKdi26eSGI+rWIoteKiC7aO44xwNPF/sH/nqYpJLaPQ
         glQvLUvM7TVdKUc2oOLnArJ+sRYhy36abb01bFM6gMt8UaYA3a1j3jkQoMPTjOV9rPGm
         TryQ==
X-Forwarded-Encrypted: i=1; AKwUvBxStDAIUDnkDc3nKcXrAIvxVpjAYqkQUQuzAwbvOK0KIph8DCG6X6B0RY1rY0JO7BnIWogDbMeGdYRI@vger.kernel.org
X-Gm-Message-State: AFq9FYIk7eJO9Jqgws53BNwbzYeSh67nnQI754XbjitpY2OkXTcJvGwA
	2J/o0nXua69Lh0w50//GniU5mVNoJ4BwV9s5vY9HjoAQ0MRRiS18ShYt2Ie+fQK5GUdYxVuO4B1
	eblO41n3mE4W/wmpjc4/tbTl+j7lFPTdqIE5lxgcPLszGjIKyJeAsz5wOfu1hPc7M
X-Gm-Gg: AYBFou1LyUNVXtwf6AtzFBbb+Z27QRsYMnv+uegMk397nZ6k2vYh70srys5g9QUBIoM
	1IhyrIl87IEjrfSl7TjSlW97WGCSgyExrbsBDs5HRcy2BWKB6yItNAom8WSRQdNPiT3uIe3sWx/
	3j30BudNYgBUCyZim2m7Zi5c31xRKen9gXC2hGt9iA+AGVsyCGQCTH2JqmMvW8qhxhmnWErRWjJ
	ZBIchQvJdKrmr/+UfoW/bza4v8Bq5MqMXm8ldVeErGAYmH2ixYJGnA1334bO+HiyxAcaCwwUWQx
	BgWQy465wUpD7+6rqZth3eDcJrFHlKVrSdMLziDlXwYMps0BpK5ESghOz51XL7I+PkI4vVLRm/X
	3UCy6w4iXeo4WLDF/mmDJBr6AK2Qk4vcAhpeJMZrLqdsnnqT24scVQRYG4WnYCdmH3D85hZvMdk
	4Ijdb2rfOh
X-Received: by 2002:a05:7301:1448:b0:369:f97f:72c1 with SMTP id 5a478bee46e88-36a20443a72mr3591392eec.36.1793191513387;
        Wed, 28 Oct 2026 05:45:13 -0700 (PDT)
X-Received: by 2002:a05:7301:1448:b0:369:f97f:72c1 with SMTP id 5a478bee46e88-36a20443a72mr3591342eec.36.1793191512698;
        Wed, 28 Oct 2026 05:45:12 -0700 (PDT)
Received: from [192.168.0.104] ([124.123.197.72])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a239644efsm10179800eec.23.2026.10.28.05.45.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 05:45:12 -0700 (PDT)
Message-ID: <dd81646e-a30b-46a9-84a1-bc39d71ec748@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 18:15:04 +0530
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] ASoC: qcom: sc8280xp: Extend hw_params for QAIF
 backends
To: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
References: <20260910-shikra-machine-v2-v2-0-9bf6bad589d8@oss.qualcomm.com>
 <20260910-shikra-machine-v2-v2-2-9bf6bad589d8@oss.qualcomm.com>
Content-Language: en-US
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
In-Reply-To: <20260910-shikra-machine-v2-v2-2-9bf6bad589d8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA1MCBTYWx0ZWRfX5tzFfnlBmBt7
 VhWuPSNGoXLuAA6/aQ5bMp4J3v68cA3LhTIjy0Tycjic87i5NzSQ9SKB6UEHrrTXOu2ni9JudlP
 gh+BmkDv/SQrpOHe8is63PNz3Je26eKB3A2Yf8JhNXYkPgY67SR2N9VjzwPO9qbVRxNw47fBTep
 B74AiCxEh1MLw/skOrfErzEzMVsakKwL+g0ml3hdNb/ifFUD6SfjNk8/wXxQ/WsjSsswapr8rhg
 7ng+OmqYIjGAmFU/OkkMEej8tKcSG1qyJSdMxs1EV9oLiP+gT8o8Ee44XLQhiI3Xs34RuUXITOP
 P5O29V26xdL/DaOZNkv+KZLoeLdatBEyNFAvFvOf80bxj9RYPzAocBoW+mTFciLyBM9a8x2yCYN
 C7xYVykQozlcbTSPqhifFalJLp+NO6sd+ZtWfIF4ubcdoWP8JQ89Is2E9DS5yt6AgSbGduVe8HV
 8BphbxS3OLOqY4dRHng==
X-Proofpoint-ORIG-GUID: IUnv-msx4HvdUnJBVxVpSFkZuC3r0_9x
X-Proofpoint-GUID: IUnv-msx4HvdUnJBVxVpSFkZuC3r0_9x
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA1MCBTYWx0ZWRfXx00ch+9I85Fy
 AosPLFG70pLJZm/hIGFQTMJqvXyHKn/7yXZMZx/PEkK3Yt7s3yw9n3lDr5UdiS46EOMoZQJIJmO
 Aipu1qF1To5RHB7y8yOdDwImPuUTux0=
X-Authority-Analysis: v=2.4 cv=JodkP84C c=1 sm=1 tr=0 ts=6ae1ee5a cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ud/Gc3SFmwde3Mv7YyqU3w==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=fOOVHHMWt1wa0l6bWdMA:9 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 spamscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280050

> diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
> index 4d48e1012cd4..452296a9e67d 100644
> --- a/sound/soc/qcom/sc8280xp.c
> +++ b/sound/soc/qcom/sc8280xp.c
> @@ -67,6 +67,7 @@ struct qcom_snd_soc_common {
>   	const struct snd_kcontrol_new *controls;
>   	int num_controls;
>   	unsigned int codec_dai_fmt;
> +	unsigned int cpu_dai_fmt;
>   	bool codec_sysclk_set;
>   	bool mi2s_mclk_enable;
>   	bool mi2s_bclk_enable;
> @@ -126,9 +127,15 @@ static int sc8280xp_tdm_hw_params(struct snd_pcm_substream *substream,
>   	if (!cpu_cfg.slots)
>   		return 0;
>   
> -	ret = snd_soc_dai_set_fmt(cpu_dai, SND_SOC_DAIFMT_BP_FP);
> -	if (ret && ret != -ENOTSUPP)
> -		return ret;
> +	if (data->priv->cpu_dai_fmt) {

Could this be simplified by selecting the format first and keeping a single call and error path?
Same in sc8280xp_snd_hw_params().

fmt = data->priv->cpu_dai_fmt ?: SND_SOC_DAIFMT_BP_FP;
ret = snd_soc_dai_set_fmt(cpu_dai, fmt);
	if (ret && ret != -ENOTSUPP)
		return ret;

> +		ret = snd_soc_dai_set_fmt(cpu_dai, data->priv->cpu_dai_fmt);
> +		if (ret && ret != -ENOTSUPP)
> +			return ret;
> +	} else {
> +		ret = snd_soc_dai_set_fmt(cpu_dai, SND_SOC_DAIFMT_BP_FP);
> +		if (ret && ret != -ENOTSUPP)
> +			return ret;
> +	}
>   
>   	if (data->priv->codec_dai_fmt) {
>   		for_each_rtd_codec_dais(rtd, i, codec_dai) {
> @@ -234,6 +241,7 @@ static int sc8280xp_be_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
>   	case TX_CODEC_DMA_TX_1:
>   	case TX_CODEC_DMA_TX_2:
>   	case TX_CODEC_DMA_TX_3:
> +	case VA_CODEC_DMA_TX_1:
>   		channels->min = 1;
>   		break;
>   	default:
> @@ -260,9 +268,16 @@ static int sc8280xp_snd_hw_params(struct snd_pcm_substream *substream,
>   	case QUINARY_MI2S_RX ... QUINARY_MI2S_TX:
>   	case SENARY_MI2S_RX ... SENARY_MI2S_TX:
>   	case LPI_MI2S_RX_0 ... LPI_MI2S_TX_4:
> -		ret = snd_soc_dai_set_fmt(cpu_dai, SND_SOC_DAIFMT_BP_FP);
> -		if (ret && ret != -ENOTSUPP)
> -			return ret;
> +	case AIF_MI2S_RX_0 ... AIF_MI2S_TX_12:
> +		if (data->priv->cpu_dai_fmt) {
> +			ret = snd_soc_dai_set_fmt(cpu_dai, data->priv->cpu_dai_fmt);
> +			if (ret && ret != -ENOTSUPP)
> +				return ret;
> +		} else {
> +			ret = snd_soc_dai_set_fmt(cpu_dai, SND_SOC_DAIFMT_BP_FP);
> +			if (ret && ret != -ENOTSUPP)
> +				return ret;
> +		}
>   
>   		if (data->priv->codec_dai_fmt) {
>   			ret = snd_soc_dai_set_fmt(codec_dai,
> @@ -296,6 +311,7 @@ static int sc8280xp_snd_hw_params(struct snd_pcm_substream *substream,
>   		}
>   		break;
>   	case PRIMARY_TDM_RX_0 ... QUINARY_TDM_TX_7:
> +	case AIF_TDM_RX_0 ... AIF_TDM_TX_12:
>   		return sc8280xp_tdm_hw_params(substream, params);
>   	default:
>   		break;
> @@ -382,7 +398,7 @@ static void sc8280xp_add_be_ops(struct snd_soc_card *card)
>   	int i;
>   
>   	for_each_card_prelinks(card, i, link) {
> -		if (link->no_pcm == 1) {
> +		if (link->no_pcm == 1 || link->num_codecs > 0) {

Can num_codecs > 0 also match DPCM frontends using the dummy codec?
If so, would this unintentionally apply the BE ops/fixup to existing frontend links?

Thanks,
Prasad

