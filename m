Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71C673B4EBC
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 10:27:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774607226; cv=none; b=b5mP7XS/AzhouW3fnKgcfXOUr9Jws0ZVnH0lfTrpNjaPX1VfHs/ztrIIhY3qde5fGZ+DqAQLkqu1BzKBCRWBlUQ+yLsxKCErG5jUCwc6ZGMRc4feMRYh+z4vniCe2/NMNzCg6j71qEXGBDG8SYFbL3IslVtHTIxpH3Puukiy2qY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774607226; c=relaxed/simple;
	bh=xKgCAgq1H7Rlg4EsTIkmGyUWOfSoJfQhQ+3PuUhY2FM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YTembZJIAGsbNzqOe5dsz36PtisGXf62hErRkWCO5fnpzyGWIAr/RIdw9SjuUIBMq6Go99G5Hnto87NyzJE+odetkO6PM+qu69wdowFaIshzOUdppYCFlAaabDGi5JOc+/f3hjdPMyi7uKI9inHuQ5PwMBlLcIdi8BSMtCNgyUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YFW8X/81; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=DMpQRaeg; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YFW8X/81";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="DMpQRaeg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774607219;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KECpU8r6JDwUuQdYjM4h2h2PS7uvjrBi9NeBGYCIlKo=;
	b=YFW8X/817aLkzc2bi5YA6qDNNskvYfjnFbInMK19fjUxWpjytedQCEywMkVqmiR+xe9iDD
	Lc5SEZBMOFe71bRbgogKCFj8eqB7Qxrf+VuO5L2FzpRz1icnxZGYQ3xOVrGrN2l3mLCUAE
	pxhoNKUACJhCGToiCG1IvOKCfm3sIlg=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-101-_9bC5aATPP2owyvUGDxnAg-1; Fri, 27 Mar 2026 06:26:57 -0400
X-MC-Unique: _9bC5aATPP2owyvUGDxnAg-1
X-Mimecast-MFC-AGG-ID: _9bC5aATPP2owyvUGDxnAg_1774607216
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-43b7ec737c1so1678206f8f.1
        for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 03:26:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1774607216; x=1775212016; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KECpU8r6JDwUuQdYjM4h2h2PS7uvjrBi9NeBGYCIlKo=;
        b=DMpQRaegMzHeZT0qbk0fafd9++ChQOmhqdfYKUGlNC0ZkDByZMNncHEQry7rboGVqw
         UZ1O5x2EzfBHIEqArYmjbsBUCeoqCpiDJNRHRVRCGe5eYxCbGCTM80jjprVe+2okeQF0
         /DYDZDsCG9ZX3Mm5uYnkqjZ3afv/U/gQ8JUJW4SCiAroJwZIP8NiJT4dOnqRMBNPWfcQ
         S5CwpPNMctGM5RXGkVA6l/DfePfdyDgFolYGFuUnkmXtH3sMZ9nQUZzAczUOEL5VI9AL
         1U00+G0scn/svwdLcpxFnRHEvfdtUDACw4G4tktPeaz2OVjUrcs+SKG3Ys+R1bZTfw4D
         ewog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774607216; x=1775212016;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KECpU8r6JDwUuQdYjM4h2h2PS7uvjrBi9NeBGYCIlKo=;
        b=q0VA4hz7aT10NhaNRfTph94qovOxHpUYjMUeHNeNeV9R+7BBVrZuq+34p0SNTLXkrX
         BlQCG/n4BNqnbvssCmGEsh07JTL09ftTySmkyZkpW5kTCcRnA9QkgF6ELnELWK3csUw1
         83jQM5SBtVKGK9araFdjzuTzQvFISytdUkEN4feM/h7m9uWr8jwFqBge/wdtCAJvondM
         nrztE6WNd0BiOdaEDUJl5KrFXtn4Alo3Yg0ogx/PklKiBua5LBnyDfo1S3ndTWF8V1vB
         pRdNHG1mJM0IWk2EPMxxxKQI15fXoGvUrBcam1eFgxw1orbiGIOWVZEJljSYQJ1cPOVv
         Qx1w==
X-Forwarded-Encrypted: i=1; AJvYcCU9IjpK04HPlM+7Ry6uijK6YQVOnISbOIeOi/LMtVBN/arZdxKiJEO18wI40kG1ERGM5Y1z9fVNfJKB@vger.kernel.org
X-Gm-Message-State: AOJu0YyL5sJsN1cwq2fv7jHi4cAYBkDs6wzj7MmlDTUm8ftFgqu74Ucc
	At3HRzFzof+DGuN+v6VbnueHKefsFpkOyOkZVZqOg02iDks+M/Uw0tkXYbwCxNstIqowQvRf94N
	VARY3Vq+zIiQpnEPExtH6DhX/rRdrJPD7PpTXg3OXltPLUUmejbCqgWb1UA9QtGYO+yRj780qrQ
	==
X-Gm-Gg: ATEYQzzOEJai89Nesia+ePiezq/VDuC8/dDtSvoUIoMuYHoi3WLyQnpzQMQDK++hHlB
	cmqqyJYjkUKob+YiTgGGLgTZPB2J0Id7p07Jl+0YnTgorkjDKnkr3H9aWFuUZopjtm18YvqvDzK
	AyVYBoIis+ptch+cbznB1FHu7HD4Dy0XYwTt3d9oVIKpURDeZLCz/j7tMgYF2GFrjDFAlZdLcJs
	L4acEsO/OACqXu7jaNZcWLbzVlT7D7TfdQ3I/xLR2wbHuvHWbfP4eug4y9v7gGGLxpPo7J9oOki
	38DUDmt8NZ1mAceu8tWJKttlQYqGXQeLlUFYD8IUEp/ggYaI5Zr18dxRpmBTNE1YBqQKC6dnrgV
	DvLh7oUTn1mXT+YzQDoso
X-Received: by 2002:a05:600c:c493:b0:486:ffa3:594 with SMTP id 5b1f17b1804b1-48727ef0b7dmr30011055e9.23.1774607215771;
        Fri, 27 Mar 2026 03:26:55 -0700 (PDT)
X-Received: by 2002:a05:600c:c493:b0:486:ffa3:594 with SMTP id 5b1f17b1804b1-48727ef0b7dmr30010515e9.23.1774607215233;
        Fri, 27 Mar 2026 03:26:55 -0700 (PDT)
Received: from [192.168.2.83] ([46.175.183.46])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48722c6b105sm157228075e9.1.2026.03.27.03.26.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Mar 2026 03:26:54 -0700 (PDT)
Message-ID: <80c6190a-5ee2-4c67-bd1f-151460a1ccac@redhat.com>
Date: Fri, 27 Mar 2026 11:26:53 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 3/5] dpll: zl3073x: add ref sync and output clock
 type helpers
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
 <20260319174826.7623-4-ivecera@redhat.com>
Content-Language: en-US
From: Petr Oros <poros@redhat.com>
In-Reply-To: <20260319174826.7623-4-ivecera@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

> Add ZL_REF_SYNC_CTRL_MODE_REFSYNC_PAIR and ZL_REF_SYNC_CTRL_PAIR
> register definitions.
>
> Add inline helpers to get and set the sync control mode and sync pair
> fields of the reference sync control register:
>
>    zl3073x_ref_sync_mode_get/set() - ZL_REF_SYNC_CTRL_MODE field
>    zl3073x_ref_sync_pair_get/set() - ZL_REF_SYNC_CTRL_PAIR field
>
> Add inline helpers to get and set the clock type field of the output
> mode register:
>
>    zl3073x_out_clock_type_get/set() - ZL_OUTPUT_MODE_CLOCK_TYPE field
>
> Convert existing esync callbacks to use the new helpers.
>
> Signed-off-by: Ivan Vecera <ivecera@redhat.com>
> ---
>   drivers/dpll/zl3073x/dpll.c | 24 ++++++++-----------
>   drivers/dpll/zl3073x/out.h  | 22 ++++++++++++++++++
>   drivers/dpll/zl3073x/ref.h  | 46 +++++++++++++++++++++++++++++++++++++
>   drivers/dpll/zl3073x/regs.h |  2 ++
>   4 files changed, 80 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/dpll/zl3073x/dpll.c b/drivers/dpll/zl3073x/dpll.c
> index 79ef62d69a32d..276f0a92db0b1 100644
> --- a/drivers/dpll/zl3073x/dpll.c
> +++ b/drivers/dpll/zl3073x/dpll.c
> @@ -137,7 +137,7 @@ zl3073x_dpll_input_pin_esync_get(const struct dpll_pin *dpll_pin,
>   	esync->range = esync_freq_ranges;
>   	esync->range_num = ARRAY_SIZE(esync_freq_ranges);
>   
> -	switch (FIELD_GET(ZL_REF_SYNC_CTRL_MODE, ref->sync_ctrl)) {
> +	switch (zl3073x_ref_sync_mode_get(ref)) {
>   	case ZL_REF_SYNC_CTRL_MODE_50_50_ESYNC_25_75:
>   		esync->freq = ref->esync_n_div == ZL_REF_ESYNC_DIV_1HZ ? 1 : 0;
>   		esync->pulse = 25;
> @@ -173,8 +173,7 @@ zl3073x_dpll_input_pin_esync_set(const struct dpll_pin *dpll_pin,
>   	else
>   		sync_mode = ZL_REF_SYNC_CTRL_MODE_50_50_ESYNC_25_75;
>   
> -	ref.sync_ctrl &= ~ZL_REF_SYNC_CTRL_MODE;
> -	ref.sync_ctrl |= FIELD_PREP(ZL_REF_SYNC_CTRL_MODE, sync_mode);
> +	zl3073x_ref_sync_mode_set(&ref, sync_mode);
>   
>   	if (freq) {
>   		/* 1 Hz is only supported frequency now */
> @@ -578,7 +577,7 @@ zl3073x_dpll_output_pin_esync_get(const struct dpll_pin *dpll_pin,
>   	const struct zl3073x_synth *synth;
>   	const struct zl3073x_out *out;
>   	u32 synth_freq, out_freq;
> -	u8 clock_type, out_id;
> +	u8 out_id;
>   
>   	out_id = zl3073x_output_pin_out_get(pin->id);
>   	out = zl3073x_out_state_get(zldev, out_id);
> @@ -601,8 +600,7 @@ zl3073x_dpll_output_pin_esync_get(const struct dpll_pin *dpll_pin,
>   	esync->range = esync_freq_ranges;
>   	esync->range_num = ARRAY_SIZE(esync_freq_ranges);
>   
> -	clock_type = FIELD_GET(ZL_OUTPUT_MODE_CLOCK_TYPE, out->mode);
> -	if (clock_type != ZL_OUTPUT_MODE_CLOCK_TYPE_ESYNC) {
> +	if (zl3073x_out_clock_type_get(out) != ZL_OUTPUT_MODE_CLOCK_TYPE_ESYNC) {
>   		/* No need to read esync data if it is not enabled */
>   		esync->freq = 0;
>   		esync->pulse = 0;
> @@ -635,8 +633,8 @@ zl3073x_dpll_output_pin_esync_set(const struct dpll_pin *dpll_pin,
>   	struct zl3073x_dpll_pin *pin = pin_priv;
>   	const struct zl3073x_synth *synth;
>   	struct zl3073x_out out;
> -	u8 clock_type, out_id;
>   	u32 synth_freq;
> +	u8 out_id;
>   
>   	out_id = zl3073x_output_pin_out_get(pin->id);
>   	out = *zl3073x_out_state_get(zldev, out_id);
> @@ -648,15 +646,13 @@ zl3073x_dpll_output_pin_esync_set(const struct dpll_pin *dpll_pin,
>   	if (zl3073x_out_is_ndiv(&out))
>   		return -EOPNOTSUPP;
>   
> -	/* Select clock type */
> +	/* Update clock type in output mode */
>   	if (freq)
> -		clock_type = ZL_OUTPUT_MODE_CLOCK_TYPE_ESYNC;
> +		zl3073x_out_clock_type_set(&out,
> +					   ZL_OUTPUT_MODE_CLOCK_TYPE_ESYNC);
>   	else
> -		clock_type = ZL_OUTPUT_MODE_CLOCK_TYPE_NORMAL;
> -
> -	/* Update clock type in output mode */
> -	out.mode &= ~ZL_OUTPUT_MODE_CLOCK_TYPE;
> -	out.mode |= FIELD_PREP(ZL_OUTPUT_MODE_CLOCK_TYPE, clock_type);
> +		zl3073x_out_clock_type_set(&out,
> +					   ZL_OUTPUT_MODE_CLOCK_TYPE_NORMAL);
>   
>   	/* If esync is being disabled just write mailbox and finish */
>   	if (!freq)
> diff --git a/drivers/dpll/zl3073x/out.h b/drivers/dpll/zl3073x/out.h
> index edf40432bba5f..660889c57bffa 100644
> --- a/drivers/dpll/zl3073x/out.h
> +++ b/drivers/dpll/zl3073x/out.h
> @@ -42,6 +42,28 @@ const struct zl3073x_out *zl3073x_out_state_get(struct zl3073x_dev *zldev,
>   int zl3073x_out_state_set(struct zl3073x_dev *zldev, u8 index,
>   			  const struct zl3073x_out *out);
>   
> +/**
> + * zl3073x_out_clock_type_get - get output clock type
> + * @out: pointer to out state
> + *
> + * Return: clock type of given output (ZL_OUTPUT_MODE_CLOCK_TYPE_*)
> + */
> +static inline u8 zl3073x_out_clock_type_get(const struct zl3073x_out *out)
> +{
> +	return FIELD_GET(ZL_OUTPUT_MODE_CLOCK_TYPE, out->mode);
> +}
> +
> +/**
> + * zl3073x_out_clock_type_set - set output clock type
> + * @out: pointer to out state
> + * @type: clock type (ZL_OUTPUT_MODE_CLOCK_TYPE_*)
> + */
> +static inline void
> +zl3073x_out_clock_type_set(struct zl3073x_out *out, u8 type)
> +{
> +	FIELD_MODIFY(ZL_OUTPUT_MODE_CLOCK_TYPE, &out->mode, type);
> +}
> +
>   /**
>    * zl3073x_out_signal_format_get - get output signal format
>    * @out: pointer to out state
> diff --git a/drivers/dpll/zl3073x/ref.h b/drivers/dpll/zl3073x/ref.h
> index 06d8d4d97ea26..09fab97a71d7e 100644
> --- a/drivers/dpll/zl3073x/ref.h
> +++ b/drivers/dpll/zl3073x/ref.h
> @@ -106,6 +106,52 @@ zl3073x_ref_freq_set(struct zl3073x_ref *ref, u32 freq)
>   	return 0;
>   }
>   
> +/**
> + * zl3073x_ref_sync_mode_get - get sync control mode
> + * @ref: pointer to ref state
> + *
> + * Return: sync control mode (ZL_REF_SYNC_CTRL_MODE_*)
> + */
> +static inline u8
> +zl3073x_ref_sync_mode_get(const struct zl3073x_ref *ref)
> +{
> +	return FIELD_GET(ZL_REF_SYNC_CTRL_MODE, ref->sync_ctrl);
> +}
> +
> +/**
> + * zl3073x_ref_sync_mode_set - set sync control mode
> + * @ref: pointer to ref state
> + * @mode: sync control mode (ZL_REF_SYNC_CTRL_MODE_*)
> + */
> +static inline void
> +zl3073x_ref_sync_mode_set(struct zl3073x_ref *ref, u8 mode)
> +{
> +	FIELD_MODIFY(ZL_REF_SYNC_CTRL_MODE, &ref->sync_ctrl, mode);
> +}
> +
> +/**
> + * zl3073x_ref_sync_pair_get - get sync pair reference index
> + * @ref: pointer to ref state
> + *
> + * Return: paired reference index
> + */
> +static inline u8
> +zl3073x_ref_sync_pair_get(const struct zl3073x_ref *ref)
> +{
> +	return FIELD_GET(ZL_REF_SYNC_CTRL_PAIR, ref->sync_ctrl);
> +}
> +
> +/**
> + * zl3073x_ref_sync_pair_set - set sync pair reference index
> + * @ref: pointer to ref state
> + * @pair: paired reference index
> + */
> +static inline void
> +zl3073x_ref_sync_pair_set(struct zl3073x_ref *ref, u8 pair)
> +{
> +	FIELD_MODIFY(ZL_REF_SYNC_CTRL_PAIR, &ref->sync_ctrl, pair);
> +}
> +
>   /**
>    * zl3073x_ref_is_diff - check if the given input reference is differential
>    * @ref: pointer to ref state
> diff --git a/drivers/dpll/zl3073x/regs.h b/drivers/dpll/zl3073x/regs.h
> index 5ae50cb761a97..d425dc67250fe 100644
> --- a/drivers/dpll/zl3073x/regs.h
> +++ b/drivers/dpll/zl3073x/regs.h
> @@ -213,7 +213,9 @@
>   #define ZL_REG_REF_SYNC_CTRL			ZL_REG(10, 0x2e, 1)
>   #define ZL_REF_SYNC_CTRL_MODE			GENMASK(2, 0)
>   #define ZL_REF_SYNC_CTRL_MODE_REFSYNC_PAIR_OFF	0
> +#define ZL_REF_SYNC_CTRL_MODE_REFSYNC_PAIR	1
>   #define ZL_REF_SYNC_CTRL_MODE_50_50_ESYNC_25_75	2
> +#define ZL_REF_SYNC_CTRL_PAIR			GENMASK(7, 4)
>   
>   #define ZL_REG_REF_ESYNC_DIV			ZL_REG(10, 0x30, 4)
>   #define ZL_REF_ESYNC_DIV_1HZ			0

LGTM.

Reviewed-by: Petr Oros <poros@redhat.com>


