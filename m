Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B79253624B5
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 10:03:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774605832; cv=none; b=dRtx9g3uaFphTOh6yGGouI+nv0VZNTGavtvp6Ut5eC5WVLUeUNi4y9m+sxyolejfBvbc6/27vZUvbbfMRisIbTLeoVM6meuulRznBHiRH+hLZWBLYT2afCnxS67kotHh2Ah6K9PaYxiKHaPT4GSkoV3gkYSrxNVufYsQb+k3rM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774605832; c=relaxed/simple;
	bh=0rr/UEeo0TMmIJU9QMyRPaO1a687PDumtUJTgtPEemE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XLtEKn97vPavdqIBl/S+RRVXwZ8uwYBRurptvbQ7C2Snwe6SwzvIsrP2vu3WklFBbxb4hrP/l3MRctzNdnByMwz3Q47txyveDnoa+T4S86a8LhHL687gj5BmBvIV4muux2ySCnhknzK0uHdcDAbPR53LQTL5zT/oOsLmPi0YCM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=L3RkILIG; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=o3qRk3+R; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="L3RkILIG";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="o3qRk3+R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774605828;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=D9R6BU4srEtZ6rG282o5j+KlNvkju7lVwFa2WfTjPDk=;
	b=L3RkILIG2ZCd1RMHWyjJcTdijss7HRlxOiafRWcu0aBqt6gjyPggwbwlsdKtHler0ktv3S
	hT+17E/oNvtH6Uq5/v8PrSltqzJj2YUR/UfRuQo6Q0lKTNMFct0bbhv9k+kFyPdI5f4QWV
	Xl9adIDCOQYOw9fjjj/KNxgPUH6IU+s=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-494-aWWs4D1ZMXS56oC9ekppyQ-1; Fri, 27 Mar 2026 06:03:47 -0400
X-MC-Unique: aWWs4D1ZMXS56oC9ekppyQ-1
X-Mimecast-MFC-AGG-ID: aWWs4D1ZMXS56oC9ekppyQ_1774605826
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-486f89b7f69so17373755e9.0
        for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 03:03:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1774605826; x=1775210626; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=D9R6BU4srEtZ6rG282o5j+KlNvkju7lVwFa2WfTjPDk=;
        b=o3qRk3+RM3aobyfPBHBPURwyi0Ib+TK8U4hhKBw9bBSjSThh683vb9LrTr+LW1NVK/
         9z7DUKnLZjfDPjbW4jsHNh7TKz9ZSeTrM0/r8eiOVMl8Gi3cDCTXfgJJi9rYEtDOM5Cp
         QUSXgNGBQr+WayH7EHr6yiJAhl330GJgf+WdShTfpdTCYijnE4mVV8HRpmInOhfQLBBs
         SrhKbj5GnPq5tbTwlWJ/Y6AKdG5sb3oof1dbI7WNRrURq4jumYG+M3ePwsQD7Q4s0iiP
         DmrcnqceMbaX8d5nRxnEws9lAb3jsNyW70lTJHyrKgx8kiF5ypQqV9WCXerZzr+aYlkx
         /sFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774605826; x=1775210626;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D9R6BU4srEtZ6rG282o5j+KlNvkju7lVwFa2WfTjPDk=;
        b=KFJzplJ0ULgpjrbCqeTG5szekKd5TGw+s28IsdvR56NnSJiT/NnRPqpPDtskkaK8Vc
         UDJBs3ljZg8JVp4COHlb5DO41s4YQtmeGOfRt2j87rWDafJaCu5GjZXQCpSragI52snv
         8ttJvZ3g6d2pfg18dZk1WPrQpi3WQxerKzB6gF45qQlRJEdNq5NqmA/c+inywgWOUpRU
         /rH2uJnoZvKSLkGhOnDG240mQ98FTZjp2Qk+83ZgnY7oIkMYR9fwH4+8l4ieFR8weDWj
         378ZyeCqMwFT5mh21RRGEghXoSw2+7kwV1Av3cBEjE9WppvES37G1Qk+ejt5JNHKlUDV
         Y+gw==
X-Forwarded-Encrypted: i=1; AJvYcCWy/MucH8nxl9547fznaeUs+LL2n5z8aXRrgEWwHrs2c3ooa4WqUony8JKZPPjY8JuA0YKEvkUb1WE+@vger.kernel.org
X-Gm-Message-State: AOJu0YxUwczwP6imUYqG5D7jYMi7c35g0lZyHngHpE7INVHs7sTYIWsB
	Ffwye/axBrVv9IIac9wRR3u+HldgcsupXL48Y/0sKOIAaBYml3vG80UtrLiRCRW6XmZIC7QTdAC
	VEJKdgkW1oD+JlGjXDnzQrITSsVPTfdx55jL/y7M6YHCnAxuMWgM6NfiIuB9qZ2s=
X-Gm-Gg: ATEYQzzvlmhNnRbiu9TMUwnBfLyGm4T5HQ2oBtu22oMvI/lnpfR0ar/7fSf69ziSOnz
	YI7rgIJT7s8fhGX3a9831v8tNQBcihqsLU/+hP07dms//f5f8iQHiLMkfytbBPeEXBhxhEIQkQi
	nMta9HWEvOc/hG8cy+fbaRsIiGx+7Ie7SgSapYmRYwTXPPfFSH0f3eo2PLMpvKgnzaOPbdMa6Ry
	HyXyW6+ygwrbB+xkJGCMKesyJW/4ajbw4qPP3lHIo5YpBrVDRnMCaboCgcAN6ScnWELXqbhuiOR
	itAcBeduLLgfIu0WFFVPATJKM/llOGnu0XdO3+SaOAnZUIU/wrfx/RW75Cojtl/TRcE+R4dZdUf
	aabY6ySY5HswrpqqJmq00
X-Received: by 2002:a05:600c:19cc:b0:487:300:d9ca with SMTP id 5b1f17b1804b1-48727ee9ea9mr27018765e9.31.1774605825419;
        Fri, 27 Mar 2026 03:03:45 -0700 (PDT)
X-Received: by 2002:a05:600c:19cc:b0:487:300:d9ca with SMTP id 5b1f17b1804b1-48727ee9ea9mr27017805e9.31.1774605824738;
        Fri, 27 Mar 2026 03:03:44 -0700 (PDT)
Received: from [192.168.2.83] ([46.175.183.46])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-487271154d8sm17722575e9.9.2026.03.27.03.03.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Mar 2026 03:03:44 -0700 (PDT)
Message-ID: <34f4d05e-9ad5-468d-8c27-0b745b66afbe@redhat.com>
Date: Fri, 27 Mar 2026 11:03:42 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 1/5] dpll: zl3073x: clean up esync get/set and
 use zl3073x_out_is_ndiv()
To: Ivan Vecera <ivecera@redhat.com>, netdev@vger.kernel.org
Cc: Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>,
 Jiri Pirko <jiri@resnulli.us>, Michal Schmidt <mschmidt@redhat.com>,
 Prathosh Satish <Prathosh.Satish@microchip.com>,
 Simon Horman <horms@kernel.org>, Vadim Fedorenko
 <vadim.fedorenko@linux.dev>, linux-kernel@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 devicetree@vger.kernel.org, Pasi Vaananen <pvaanane@redhat.com>
References: <20260319174826.7623-1-ivecera@redhat.com>
 <20260319174826.7623-2-ivecera@redhat.com>
Content-Language: en-US
From: Petr Oros <poros@redhat.com>
In-Reply-To: <20260319174826.7623-2-ivecera@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

> Return -EOPNOTSUPP early in esync_get callbacks when esync is not
> supported instead of conditionally populating the range at the end.
> This simplifies the control flow by removing the finish label/goto
> in the output variant and the conditional range assignment in both
> input and output variants.
>
> Replace open-coded N-div signal format switch statements with
> zl3073x_out_is_ndiv() helper in esync_get, esync_set and
> frequency_set callbacks.
>
> Signed-off-by: Ivan Vecera <ivecera@redhat.com>
> ---
>   drivers/dpll/zl3073x/dpll.c | 64 ++++++++++++-------------------------
>   1 file changed, 20 insertions(+), 44 deletions(-)
>
> diff --git a/drivers/dpll/zl3073x/dpll.c b/drivers/dpll/zl3073x/dpll.c
> index a29f606318f6d..79ef62d69a32d 100644
> --- a/drivers/dpll/zl3073x/dpll.c
> +++ b/drivers/dpll/zl3073x/dpll.c
> @@ -131,6 +131,12 @@ zl3073x_dpll_input_pin_esync_get(const struct dpll_pin *dpll_pin,
>   	ref_id = zl3073x_input_pin_ref_get(pin->id);
>   	ref = zl3073x_ref_state_get(zldev, ref_id);
>   
> +	if (!pin->esync_control || zl3073x_ref_freq_get(ref) == 1)
> +		return -EOPNOTSUPP;
> +
> +	esync->range = esync_freq_ranges;
> +	esync->range_num = ARRAY_SIZE(esync_freq_ranges);
> +
>   	switch (FIELD_GET(ZL_REF_SYNC_CTRL_MODE, ref->sync_ctrl)) {
>   	case ZL_REF_SYNC_CTRL_MODE_50_50_ESYNC_25_75:
>   		esync->freq = ref->esync_n_div == ZL_REF_ESYNC_DIV_1HZ ? 1 : 0;
> @@ -142,17 +148,6 @@ zl3073x_dpll_input_pin_esync_get(const struct dpll_pin *dpll_pin,
>   		break;
>   	}
>   
> -	/* If the pin supports esync control expose its range but only
> -	 * if the current reference frequency is > 1 Hz.
> -	 */
> -	if (pin->esync_control && zl3073x_ref_freq_get(ref) > 1) {
> -		esync->range = esync_freq_ranges;
> -		esync->range_num = ARRAY_SIZE(esync_freq_ranges);
> -	} else {
> -		esync->range = NULL;
> -		esync->range_num = 0;
> -	}
> -
>   	return 0;
>   }
>   
> @@ -582,8 +577,8 @@ zl3073x_dpll_output_pin_esync_get(const struct dpll_pin *dpll_pin,
>   	struct zl3073x_dpll_pin *pin = pin_priv;
>   	const struct zl3073x_synth *synth;
>   	const struct zl3073x_out *out;
> +	u32 synth_freq, out_freq;
>   	u8 clock_type, out_id;
> -	u32 synth_freq;
>   
>   	out_id = zl3073x_output_pin_out_get(pin->id);
>   	out = zl3073x_out_state_get(zldev, out_id);
> @@ -592,17 +587,19 @@ zl3073x_dpll_output_pin_esync_get(const struct dpll_pin *dpll_pin,
>   	 * for N-division is also used for the esync divider so both cannot
>   	 * be used.
>   	 */
> -	switch (zl3073x_out_signal_format_get(out)) {
> -	case ZL_OUTPUT_MODE_SIGNAL_FORMAT_2_NDIV:
> -	case ZL_OUTPUT_MODE_SIGNAL_FORMAT_2_NDIV_INV:
> +	if (zl3073x_out_is_ndiv(out))
>   		return -EOPNOTSUPP;
> -	default:
> -		break;
> -	}
>   
>   	/* Get attached synth frequency */
>   	synth = zl3073x_synth_state_get(zldev, zl3073x_out_synth_get(out));
>   	synth_freq = zl3073x_synth_freq_get(synth);
> +	out_freq = synth_freq / out->div;
> +
> +	if (!pin->esync_control || out_freq == 1)
> +		return -EOPNOTSUPP;
> +
> +	esync->range = esync_freq_ranges;
> +	esync->range_num = ARRAY_SIZE(esync_freq_ranges);
>   
>   	clock_type = FIELD_GET(ZL_OUTPUT_MODE_CLOCK_TYPE, out->mode);
>   	if (clock_type != ZL_OUTPUT_MODE_CLOCK_TYPE_ESYNC) {
> @@ -610,11 +607,11 @@ zl3073x_dpll_output_pin_esync_get(const struct dpll_pin *dpll_pin,
>   		esync->freq = 0;
>   		esync->pulse = 0;
>   
> -		goto finish;
> +		return 0;
>   	}
>   
>   	/* Compute esync frequency */
> -	esync->freq = synth_freq / out->div / out->esync_n_period;
> +	esync->freq = out_freq / out->esync_n_period;
>   
>   	/* By comparing the esync_pulse_width to the half of the pulse width
>   	 * the esync pulse percentage can be determined.
> @@ -623,18 +620,6 @@ zl3073x_dpll_output_pin_esync_get(const struct dpll_pin *dpll_pin,
>   	 */
>   	esync->pulse = (50 * out->esync_n_width) / out->div;
>   
> -finish:
> -	/* Set supported esync ranges if the pin supports esync control and
> -	 * if the output frequency is > 1 Hz.
> -	 */
> -	if (pin->esync_control && (synth_freq / out->div) > 1) {
> -		esync->range = esync_freq_ranges;
> -		esync->range_num = ARRAY_SIZE(esync_freq_ranges);
> -	} else {
> -		esync->range = NULL;
> -		esync->range_num = 0;
> -	}
> -
>   	return 0;
>   }
>   
> @@ -660,13 +645,8 @@ zl3073x_dpll_output_pin_esync_set(const struct dpll_pin *dpll_pin,
>   	 * for N-division is also used for the esync divider so both cannot
>   	 * be used.
>   	 */
> -	switch (zl3073x_out_signal_format_get(&out)) {
> -	case ZL_OUTPUT_MODE_SIGNAL_FORMAT_2_NDIV:
> -	case ZL_OUTPUT_MODE_SIGNAL_FORMAT_2_NDIV_INV:
> +	if (zl3073x_out_is_ndiv(&out))
>   		return -EOPNOTSUPP;
> -	default:
> -		break;
> -	}
>   
>   	/* Select clock type */
>   	if (freq)
> @@ -728,9 +708,9 @@ zl3073x_dpll_output_pin_frequency_set(const struct dpll_pin *dpll_pin,
>   	struct zl3073x_dev *zldev = zldpll->dev;
>   	struct zl3073x_dpll_pin *pin = pin_priv;
>   	const struct zl3073x_synth *synth;
> -	u8 out_id, signal_format;
>   	u32 new_div, synth_freq;
>   	struct zl3073x_out out;
> +	u8 out_id;
>   
>   	out_id = zl3073x_output_pin_out_get(pin->id);
>   	out = *zl3073x_out_state_get(zldev, out_id);
> @@ -740,12 +720,8 @@ zl3073x_dpll_output_pin_frequency_set(const struct dpll_pin *dpll_pin,
>   	synth_freq = zl3073x_synth_freq_get(synth);
>   	new_div = synth_freq / (u32)frequency;
>   
> -	/* Get used signal format for the given output */
> -	signal_format = zl3073x_out_signal_format_get(&out);
> -
>   	/* Check signal format */
> -	if (signal_format != ZL_OUTPUT_MODE_SIGNAL_FORMAT_2_NDIV &&
> -	    signal_format != ZL_OUTPUT_MODE_SIGNAL_FORMAT_2_NDIV_INV) {
> +	if (!zl3073x_out_is_ndiv(&out)) {
>   		/* For non N-divided signal formats the frequency is computed
>   		 * as division of synth frequency and output divisor.
>   		 */

LGTM,

Reviewed-by: Petr Oros <poros@redhat.com>


