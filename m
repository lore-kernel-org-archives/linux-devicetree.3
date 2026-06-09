Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01DE639D3D0
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 09:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780996518; cv=none; b=b63AfdvSl/V2G02waMoYPzwarhaOQ8K7HLSxwOSr4mqmEvXPoBZrrtwMn2vIDFYhI8xRnQ2W4M/a4rYEgVdM8urDCSG6+OpXghLD+/dc1z7MwSE+CVfGFgw5kcBtax9yFNAEX+kQEeizMKHr/r8jIvrpenT7j/sybZssQlL78zU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780996518; c=relaxed/simple;
	bh=2cVI7mOZk5wgdxeQHKFvOR4E4aQvBl/bXi6sFFQMiJY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q3EHmAr7u1nYpauERpkvjsgtkCSDCipnlNaJf12e9tX5tMy1gRFAcJwxGlbH+G2p7bcEXzDBbwlAUg3eDpUh+KIVFLYTNeZ+fenNf4WGqPvtocjZdUoWcxY4oHE75btNbQjp74w5V2TYYMh4rnpl01o8aeqmMerahIDhqCwYmJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n6s7jDz5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dSau7YC6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n6s7jDz5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dSau7YC6"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6597rafW1923149
	for <devicetree@vger.kernel.org>; Tue, 9 Jun 2026 09:15:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RXkV4swW0PJks3vA3tB1AehUp80hU3W42XTBNT06mrM=; b=n6s7jDz5R69ldOfr
	4kC6tQXJcFjA1c2x6V8dBQ25PU0K7R6FRyFxxFdI7GJYl7HKa9xpw0mx4whuStP+
	JFEf+5lTai4WG1n75fHdqBKpUssomCBm5LZH4x2doWBvaxx1BxnNkIk5kfZLNqoP
	HV2KLjbsXf+jH8HSE8r+RGMZc15Hz3Qtd9DBtih+GbYcrEldT46MLj07H3654cdN
	agBX01gKK5v7yxh8eTTf4mRu34D8lXof5yOydcEJYnxPKEAMjLMMilcse3d8HkzX
	kT54CEZaSKcQvDi9GSuNXTswMDtIXhaEz/9Cqw6RHb5B9pwS0qy3kZhYHeVmoiO+
	eCe1lg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epee4gekg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 09:15:15 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51768e1d798so13517751cf.1
        for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 02:15:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780996515; x=1781601315; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RXkV4swW0PJks3vA3tB1AehUp80hU3W42XTBNT06mrM=;
        b=dSau7YC6lb8d2B3IXFpRs48Gv94hr2kRRrfrSlf1FuEbTORju5TbqS0JG3IgI0cQkm
         1uqFb3KJuJvL4k2bl4dYaa10cHdFNpK1zol5HvBnSyCaNjdT3qGAZOouGQn5iGzCiBeH
         r2ByvxufZ/nFYp2HHrE/lotaLAihVsa4RjBjfizmnVEd4haBmHmzmnPLQzLWSqQ3drlL
         d7Q8UxTYn/1wRk2zaZDCitWngm9k9lScaYJRaTv8zRacYu2l5ty1riyMFGLFhpQtRFXz
         w5L9wbqvJpu+lLg3OEUtYbHgo3RvCYcDEsSBS+oCJTPKiOO+yEKhWYZ0FCtOrO97g8gj
         f7JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780996515; x=1781601315;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RXkV4swW0PJks3vA3tB1AehUp80hU3W42XTBNT06mrM=;
        b=NJLC2JFXXn+9lgXmrvg1EtkWdxjZp2E2AHZJPn2F042CVnwt8fzVIXozo/DZs/T1RM
         UZFqOGu43BFX/2JdDYMgHTi2vv9kqB/5TZ82bcROIi47Eo+pvNfjkHx4pKE+setwmdQQ
         Mag+RwW9oilSQBSkwSS/L0OETumGSVRn2ZsLP/guq/sryOeX483TKCJ9vIjn7prX+jE5
         7XRgPXMRtVrgUDFzvlvJlk4sfEHLA+DXEtdeBNkWMJA26mSAUL5I93hZedh0y6k1egPi
         4XbLZaYHslCpRGN1JUpK52B2OtynW7bcS9GlZFq4zoeEXTzqVweRdMqvTbEwxZR0UPpH
         SqWQ==
X-Forwarded-Encrypted: i=1; AFNElJ9SAtFziXCV0dFsNPWkwY5oLnA9XrfLE1we5UnTnKQG2ocv4409ve5kh+n56n34RB7nCPcvH7FYsJg1@vger.kernel.org
X-Gm-Message-State: AOJu0YwYc119azoJ8ywfSk5x/9gIPXhXwiEC9WF7OK0BU2tQKEkqYCqT
	eIp3MJKNCYbJI89iLspPVs7/wy1lA0EgUVCll651pIbt8LDqdO/O1WbOQQmajNQTsMHZXqT2s2V
	k0S+QkwtuQ1IRHotGQyVB1qO4xirQxeeDud70JD0okIsiQZL72/jHlQF2KLrEGVdc
X-Gm-Gg: Acq92OEscL9LruVEvtmclVUwvy9DRV1eoW4TdctcTZqlrVUd9SW1Eu+g+ryqpRLrQoy
	P1Z8cRzu2XoxedLCDrCbHWxLA1g2Jzy2h6biBuS8YGjn5QsAPdyNXvhBaoV72YjYaDdhrpGu8US
	qPlbvjymtt6IwB7tIZCs46dE1vMc+Qnd0CBiklfJyfbYEPogHJGscI5nox9OrRzKoYHAUSWSOka
	7g9Qs69Xa1zTDEFaUrD6oqd0v91X6N2e+/dlz3s5PwE8qt+nTxn0m4joIWdvgKkB2iLmmk3st+W
	Fj4DvlezURgTckvYg0X1VZHC1j52Sthp7ryxcUxPPSmf24FZNk5/D+zdqb/Vfc+hX3ghrSh2c39
	Nt0fChz5xRLeQ/FXtu18TTrnP/IDS7yQLjmGnQkSzLTKzQGN2at5tQ3rx
X-Received: by 2002:a05:622a:228e:b0:517:8999:6c4b with SMTP id d75a77b69052e-51795bbf777mr160228121cf.7.1780996515238;
        Tue, 09 Jun 2026 02:15:15 -0700 (PDT)
X-Received: by 2002:a05:622a:228e:b0:517:8999:6c4b with SMTP id d75a77b69052e-51795bbf777mr160227661cf.7.1780996514622;
        Tue, 09 Jun 2026 02:15:14 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf055307a35sm999893966b.52.2026.06.09.02.15.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 02:15:13 -0700 (PDT)
Message-ID: <3a0890b2-f9c3-439b-a392-fd13e3da850d@oss.qualcomm.com>
Date: Tue, 9 Jun 2026 11:15:11 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/3] ASoC: qcom: lpass-va-macro: Add shikra compatible
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260608172023.2965292-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20260608172023.2965292-4-mohammad.rafi.shaik@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260608172023.2965292-4-mohammad.rafi.shaik@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=PIs/P/qC c=1 sm=1 tr=0 ts=6a27d9a3 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=k1sLU3CPmF0_vJ11zi8A:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: YQhgpFGVnMymoj0qEbdfrreTdFIUH_N_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDA4NSBTYWx0ZWRfXy9hKHqd+CSg4
 cj+A6/8jsMv0teegnanibIA5bxmRxGDjtjxvmENShNWfw4t2vRR0gdOm0kw4svRXFbRAK48jnal
 FUyqTX7PySsfa7upWs6aqLeZoU9scjneCFG5fHo2NEWV3YliHFlJHKpPOokjTwE0DvJRGHRLMcd
 2KoE/wdD0puRP4brctB4j6+V0tLYrJi+d046qEhPT4qw8Jxgn/c2RpXTDqwGFKH6MJh5xnUOWN4
 ArPaIH1cdKqQAGVj/YVYj7O32xWLQNCW3mWLC4donA6l+RYU+0m1WCVEQPfgE4HW6M0BHsbP9Kj
 8QJi6m2ORuPsCtxQF9cswF2ZGVuWiiZIhGm7IXbVwwyXFQ6BvQuZ8nWTWRiHWtJVLpJpnBAtRoz
 ycvcKLWgOKm97MQy4QI4ynopGCeqokV7zNc1Kn8uYBu8XoiPSnEWWQm7iZaUgvI9ocwMUZ76VOD
 Qn4cG+tlePpx2w0R/XQ==
X-Proofpoint-ORIG-GUID: YQhgpFGVnMymoj0qEbdfrreTdFIUH_N_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_02,2026-06-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 suspectscore=0 adultscore=0 spamscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606090085

On 6/8/26 7:20 PM, Mohammad Rafi Shaik wrote:
> Add shikra specific VA macro data and register programming needed by
> the LPASS codec v4.0 implementation.
> 
> This adds a shikra regmap/default table covering the ADPT register
> range, wires new match data flags (bypass FS control and ADPT block
> presence), and enables the ADPT control programming path during TX
> decimator bring-up.
> 
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> ---

[...]

> +/* ADPT control registers - Shikra adaptive filter blocks */
> +#define CDC_VA_CDC_ADPT0_ADPT_CTRL		(0x0800)
> +#define CDC_VA_CDC_ADPT0_ADPT_GAIN_0		(0x0804)
> +#define CDC_VA_CDC_ADPT0_ADPT_GAIN_1		(0x0808)
> +#define CDC_VA_CDC_ADPT0_DH_FSM_CTRL		(0x080C)
> +#define CDC_VA_CDC_ADPT0_CUTOFF_FSM_CTRL_0	(0x0810)
> +#define CDC_VA_CDC_ADPT0_CUTOFF_FSM_CTRL_1	(0x0814)
> +#define CDC_VA_CDC_ADPT0_CUTOFF_FSM_CTRL_2	(0x0818)
> +#define CDC_VA_CDC_ADPT0_CUTOFF_FSM_CTRL_3	(0x081C)
> +#define CDC_VA_CDC_ADPT0_CUTOFF_FSM_CTRL_4	(0x0820)
> +#define CDC_VA_CDC_ADPT0_CUTOFF_FSM_CTRL_5	(0x0824)

Please use lowercase hex and drop the parentheses

[...]

> +static const struct reg_default va_shikra_defaults[] = {
> +	/* VA macro */
> +	{ CDC_VA_CLK_RST_CTRL_MCLK_CONTROL, 0x00},
> +	{ CDC_VA_CLK_RST_CTRL_FS_CNT_CONTROL, 0x00},
> +	{ CDC_VA_CLK_RST_CTRL_SWR_CONTROL, 0x00},

lowercase hex likewise, please keep a consistent space before the closing
curly bracket

[...]

> +		if (va->bypass_fs_control)
> +			regmap_update_bits(regmap, CDC_VA_CLK_RST_CTRL_FS_CNT_CONTROL,
> +					   0x80, 0x80);

regmap_set_bits()

[...]

>  	case SND_SOC_DAPM_POST_PMU:
> +		if (va->has_adpt_block)
> +			snd_soc_component_update_bits(comp, adapt_ctrl, 0xFF, 0x00);

Can you define these magic numbers?

[...]

> +	va->regmap = devm_regmap_init_mmio(dev, base,
> +					   data->regmap_config ? data->regmap_config
> +						: &va_regmap_config);

data->regmap_config ?: &va_regmap_config

Konrad
