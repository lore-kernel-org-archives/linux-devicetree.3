Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B94A63F823E
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 10:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784197427; cv=none; b=oMiPXiR7R/hcV8sEebRQ30BXz/r5u09uyoDHQ+J1svZDvqzLJk901uIPv/o0O2fwo/7llexdRd6yWPnSoByg5vKchra9b8T1ysaiUq12e3lELUt+v2fxsCY8VAojGvxuSPTagG3PtVhrXiMmt6lWVFUuXuuBhrG7Mmk7X5lljlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784197427; c=relaxed/simple;
	bh=HzM3jRy1t3RLcxqCi6zSUzbn9Ck7fDgZ3MhrG+BERWM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=MHMDL0M0WyCZ8sFF0BmBDXGvWuqP5C2MKsyHRcib4mfEVwjrbrs8GwOaqVvkW5HbOwz8im99rN8ZN6es/ctfIvEERMbYbPelO+17A3QHH1patN1BQEI9lJ+ZJsMFHekLmnjmfSzy+M3KAGn+tFGqO5ndGuRE3OLJNFp9j92vnuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=b0gPzyXz; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=C46zzNhh; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="b0gPzyXz";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="C46zzNhh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784197424;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Q8zisv8v+OCz5mSkB0tHa1MIv/FMnNErmwivzO7LfPs=;
	b=b0gPzyXz/pQ++Y9ChK3wo4/EwPkjnHz3p19Vp922Kpu834YCCedh2gqR57OjYGwAvH+VMu
	P2YQaiNXciearS2qEDosORUtJYXiuz5wO6axYwkQNjQ3vpY5PnIFSIG90xLgasPLLKCHon
	Jx+XA6eT3/IXzvLc2EQf/yaMbZpocxU=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-615-BVPSCKdNOlu7NYAdImgZxg-1; Thu, 16 Jul 2026 06:23:43 -0400
X-MC-Unique: BVPSCKdNOlu7NYAdImgZxg-1
X-Mimecast-MFC-AGG-ID: BVPSCKdNOlu7NYAdImgZxg_1784197422
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-493bd52dae6so42927575e9.0
        for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 03:23:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1784197422; x=1784802222; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q8zisv8v+OCz5mSkB0tHa1MIv/FMnNErmwivzO7LfPs=;
        b=C46zzNhhQJ4t49JQQYs6PJIYtpBvVJWKeZ7mJW+Iog+Qa07K/asTim83vY4gRdCFIK
         qSKvCsoj/KQQ7muWdI8mgcI5oJZpmx8fgVA3JbhQNv+XbQgUQ6BvbxNwMb2V13dkt6gL
         6EuoI++fn88ClhjgI6Kbqtn5MxsyQBg4PqmUhL0rajMaZPgmLj/VG6ipZh4Ze9XmwVwY
         lovF4QgfMy94uZ9Gz9XRFoS+AUOyN/lL5WmR8WyEECT7almIxVF17b7TO7ZwjVdduY2s
         jtbJQlNyFo8/JS1OEmFj+OEVkwLDuQOQH2SYS6+daUcJ7CEj2wE3gQ/6txmtc+VaZSQ+
         yjoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784197422; x=1784802222;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Q8zisv8v+OCz5mSkB0tHa1MIv/FMnNErmwivzO7LfPs=;
        b=IBZVRamqmpZONdOVkI+QuJpSZKQTcw5iOM055SvFvy4OXeZduzF2uISbf2+yJ0a5m0
         MSQXqq6exnOM2POVIldW67kEexjiq4aGPlmoor4NOmw2Vnif4s9DFm7I/85gbQ8Pkv2T
         u9hqE7OrwGcA7ABuiAu2RPZZ3rniuial09o8Hq+5j/qjNggcAD2GUAoeFePCN1oie6V3
         5HTBjKoV+K5MGUWybpXEMzuYBJjWyoLI7pMNqC1EbMEauBYrwShE/j8FFYF4f09FKuMk
         /Xb+4lN02nLpX51uETFot9YRj/KkXJAVw2pzJRtAk1U7EB+yrDM5u7bHx4vqUsryl8mI
         0KKQ==
X-Forwarded-Encrypted: i=1; AHgh+RovntWLgjT3sctWIBHj7FFfaoG8Pe7UqEcuvy6SdWvo4HLSUExsy8LErbrnIi9GSmFxOrC55P54PTFP@vger.kernel.org
X-Gm-Message-State: AOJu0YxKSVm+fdNOm370sI8gKpKifvTPsPUx8Ad4HZInNZCsE4yqbUT+
	Obtn1P6HNZsvFYWFii7f9HWGvLvQHFva+f2VjBuNo1rGjR18FOVaE1gu9LcTdD3Pmh1LKV2I6HC
	SXuw+5AGeIAopgaPtJ6s1PEdCSXGTx/LhYSHghk5AGc7velmfhsaaLD/0guwh2XY=
X-Gm-Gg: AfdE7clKdxNxXMRHraTSpS/E62D9qdgkHR30cRQ7dQlhkJP4lK4vS3hl3IzXDKEt17B
	ugTyo3IqsYsYVuJIjiI0Sr4MLemuGV/gGg3rN5StGSwTsO8fbq9UduK4xsh4yc7x4dTA9bT8J/M
	Kr6hB1lXdt6lv5562fFwLsWKnZN9Pn1Ah7HfNBaaCHG+wknQuNoCm6OI3YCB8x3Pgme41i1pa9U
	MVdPaeB8RfYseJuZMsnCPsQ+6xHTDCsdR0a5DCy0xgzxwn9KODMMJffj777E21ksT/LhWkmI/PR
	C8GETJ2vwIqmeIElYRyfxAvHcyOGinuCf3Xo6pPDhmtBsR4bO0iefYnbulNXs0gNEZQLd+CsWVj
	vVMozNhKJ5WQABjkrglJE8WRRBf+92KpnpBJXXuWk2uwZk6Zf+scSfFejlK0=
X-Received: by 2002:a05:600c:4ed2:b0:495:3fe8:880f with SMTP id 5b1f17b1804b1-4953fe88815mr42927305e9.4.1784197421794;
        Thu, 16 Jul 2026 03:23:41 -0700 (PDT)
X-Received: by 2002:a05:600c:4ed2:b0:495:3fe8:880f with SMTP id 5b1f17b1804b1-4953fe88815mr42926685e9.4.1784197421061;
        Thu, 16 Jul 2026 03:23:41 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49541e51f47sm44889525e9.0.2026.07.16.03.23.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 03:23:40 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Amit Barzilai <amit.barzilai22@gmail.com>, Andy Shevchenko
 <andriy.shevchenko@intel.com>, dri-devel@lists.freedesktop.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Amit Barzilai <amit.barzilai22@gmail.com>
Subject: Re: [PATCH v3 3/3] drm/ssd130x: Add SSD135X_FAMILY and SSD1351 support
In-Reply-To: <20260704080925.75113-4-amit.barzilai22@gmail.com>
References: <20260704080925.75113-1-amit.barzilai22@gmail.com>
 <20260704080925.75113-4-amit.barzilai22@gmail.com>
Date: Thu, 16 Jul 2026 12:23:39 +0200
Message-ID: <87y0fbs05w.fsf@ocarina.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Amit Barzilai <amit.barzilai22@gmail.com> writes:

Hello Amit,

Thanks for the patch. Unfortunately I think that there is still some work
to be done for this patch to land. Inline comments below.

> The Solomon SSD1351 is a 128x128 RGB color OLED controller. It shares
> the SSD133X data path: a column/row addressing window followed by a bulk
> RGB565 pixel write. Add it as a new SSD135X_FAMILY rather than a separate
> driver, reusing the SSD133X plane, CRTC and blit/clear helpers.
>

[...]

>   */
> -static int ssd130x_write_data(struct ssd130x_device *ssd130x, u8 *values, int count)
> +static int ssd130x_write_data(struct ssd130x_device *ssd130x, const u8 *values, int count)
>  {
>  	return regmap_bulk_write(ssd130x->regmap, SSD13XX_DATA, values, count);
>  }

>

This change is correct but need to be split in a separate preparatory
patch. When you do that, feel free to add my Reviewed-by tag.

> -/*
> - * Helper to write command (SSD13XX_COMMAND). The fist variadic argument
> - * is the command to write and the following are the command options.
> - *
> - * Note that the ssd13xx protocol requires each command and option to be
> - * written as a SSD13XX_COMMAND device register value. That is why a call
> - * to regmap_write(..., SSD13XX_COMMAND, ...) is done for each argument.
> - */
> -static int ssd130x_write_cmd(struct ssd130x_device *ssd130x, int count,
> -			     /* u8 cmd, u8 option, ... */...)
> -{
> -	va_list ap;
> -	u8 value;
> -	int ret;
> -
> -	va_start(ap, count);
> -
> -	do {
> -		value = va_arg(ap, int);
> -		ret = regmap_write(ssd130x->regmap, SSD13XX_COMMAND, value);
> -		if (ret)
> -			goto out_end;
> -	} while (--count);
> -
> -out_end:
> -	va_end(ap);
> -
> -	return ret;
> -}
> -

Please split these ssd130x_write_cmds() and ssd1330x_write_cmd() refactoring
as separate preparatory patches. This patch is changing too many things at
once, it is better to have each logical changes as a separate patch. This
makes reviewer much easier.

>  /*
>   * Write a command byte sequence from a buffer.
>   *
> - * Like ssd130x_write_cmd() but takes a pre-built byte array instead of
> - * variadic arguments, handy when the command is already in an array or
> - * when the caller wants to use sizeof() for the length.
> + * The first byte is the command opcode and the following bytes are its
> + * options/parameters.
>   */
>  static int ssd130x_write_cmds(struct ssd130x_device *ssd130x, const u8 *cmd,
>  			      size_t len)
> @@ -294,6 +296,22 @@ static int ssd130x_write_cmds(struct ssd130x_device *ssd130x, const u8 *cmd,
>  	unsigned int i;
>  	int ret;
>  
> +	/*
> +	 * The SSD135X family latches command parameters with D/C# HIGH (i.e.
> +	 * clocked in as data), unlike the other families where the opcode and
> +	 * all of its parameters are sent as commands (D/C# LOW). Send the
> +	 * opcode as a command and any following parameter bytes as data.
> +	 */
> +	if (ssd130x->device_info->family_id == SSD135X_FAMILY) {
> +		if (len == 0)
> +			return 0;
> +		ret = regmap_write(ssd130x->regmap, SSD13XX_COMMAND, cmd[0]);
> +		if (ret || len == 1)
> +			return ret;
> +
> +		return ssd130x_write_data(ssd130x, cmd + 1, len - 1);
> +	}
> +

I don't like that this logic is in the ssd130x core part of the driver. This
is supposed to be transport agonistic and should not be aware of the D/C#
behaviour that is specific to the SPI transport.

Can we move this to the ssd130x-spi driver? For example, something like the
following might work:

1. Make ssd130x_write_cmds() to just be a static inline wrapper that calls
   to regmap_raw_write(ssd130x->regmap, SSD13XX_COMMAND, cmd, len).

2. Make ssd130x_write_cmd() be a variadic wrapper around ssd130x_write_cmds().

3. Add your logic to ssd130x_spi_write() instead of ssd130x_write_cmds(), that
   way it stays in the correct layer rather than having a leaking abstraction.

Also, instead of checking for info->family_id == SSD135X_FAMILY, we could add
a dc_high_params member (or whatever name is more suitable) to the struct
ssd130x_spi_transport Then other families that might use the same can just
reuse this option instead of checking for specific families.

[...]

>  /*
>   * Run a packed command sequence.  The format is a flat byte array where each
>   * entry starts with a length byte followed by that many command bytes.  A
> @@ -415,6 +454,12 @@ static void ssd130x_reset(struct ssd130x_device *ssd130x)
>  	udelay(4);
>  	gpiod_set_value_cansleep(ssd130x->reset, 0);
>  	udelay(4);
> +	/*
> +	 * No long post-reset delay: the controller datasheets only specify
> +	 * microsecond-scale reset timing. The lengthy delay seen in some other
> +	 * drivers comes from fbtft's generic reset helper and targets slow
> +	 * parallel-bus GPIOs, which do not apply here.
> +	 */
>  }
>

I don't understand the point of this comment. You are not changing the logic
of this function nor I see how this comment is useful.

[...]
  
> +/*
> + * Write a run of pixel data to the controller's display RAM. The SSD135X
> + * family requires an explicit Write RAM command once the address window has
> + * been set, before any pixel data is accepted; the SSD133X family enters data
> + * mode implicitly after the column/row range is programmed.
> + */
> +static int ssd133x_write_pixels(struct ssd130x_device *ssd130x,
> +				u8 *data_array, unsigned int count)
> +{
> +	if (ssd130x->device_info->family_id == SSD135X_FAMILY) {
> +		int ret;
> +
> +		ret = ssd130x_write_cmd(ssd130x, 1, SSD135X_WRITE_RAM);
> +		if (ret < 0)
> +			return ret;
> +	}
> +
> +	return ssd130x_write_data(ssd130x, data_array, count);
> +}
> +
>  static int ssd133x_update_rect(struct ssd130x_device *ssd130x,
>  			       struct drm_rect *rect, u8 *data_array,
>  			       unsigned int pitch)
> @@ -826,7 +927,7 @@ static int ssd133x_update_rect(struct ssd130x_device *ssd130x,
>  		return ret;
>  
>  	/* Write out update in one go since horizontal addressing mode is used */
> -	ret = ssd130x_write_data(ssd130x, data_array, pitch * rows);
> +	ret = ssd133x_write_pixels(ssd130x, data_array, pitch * rows);
>  
>  	return ret;
>  }
> @@ -896,7 +997,7 @@ static void ssd133x_clear_screen(struct ssd130x_device *ssd130x, u8 *data_array)
>  	memset(data_array, 0, pitch * ssd130x->height);
>  
>  	/* Write out update in one go since horizontal addressing mode is used */
> -	ssd130x_write_data(ssd130x, data_array, pitch * ssd130x->height);
> +	ssd133x_write_pixels(ssd130x, data_array, pitch * ssd130x->height);
>  }
>  

Instead of ssd133x_write_pixels() and having per family logic in the primary
place update path, I prefer to have a little bit more of code duplication
and add an .atomic_update, .atomic_disable, etc for the SSD1351.

Yes, I know that your current approach reduces code duplication but also
makes it harder to change the primary plane update path for a family without
affecting another one. This is particularly important in my opinion, given
that contributors usually just test on their display family when posting
the patches. So I prefer to have per family callbacks if possible.

[...]

>  static const struct drm_encoder_funcs ssd130x_encoder_funcs = {
> @@ -1897,15 +2037,25 @@ struct ssd130x_device *ssd130x_probe(struct device *dev, struct regmap *regmap)
>  	if (ret)
>  		return ERR_PTR(ret);
>  
> -	bl = devm_backlight_device_register(dev, dev_name(dev), dev, ssd130x,
> -					    &ssd130xfb_bl_ops, NULL);
> -	if (IS_ERR(bl))
> -		return ERR_PTR(dev_err_probe(dev, PTR_ERR(bl),
> -					     "Unable to register backlight device\n"));
> +	/*
> +	 * The backlight update path drives contrast through the
> +	 * SSD13XX_CONTRAST command (0x81), which the SSD135X family does not
> +	 * implement; the brightness byte would be interpreted as a command
> +	 * opcode instead. Do not register a backlight device for this family
> +	 * until the backlight path is family-aware.
> +	 */
> +	if (ssd130x->device_info->family_id != SSD135X_FAMILY) {
> +		bl = devm_backlight_device_register(dev, dev_name(dev), dev,
> +						    ssd130x, &ssd130xfb_bl_ops,
> +						    NULL);
> +		if (IS_ERR(bl))
> +			return ERR_PTR(dev_err_probe(dev, PTR_ERR(bl),
> +						     "Unable to register backlight device\n"));
>
> -	bl->props.brightness = ssd130x->contrast;
> -	bl->props.max_brightness = MAX_CONTRAST;
> -	ssd130x->bl_dev = bl;
> +		bl->props.brightness = ssd130x->contrast;
> +		bl->props.max_brightness = MAX_CONTRAST;
> +		ssd130x->bl_dev = bl;
> +	}

Again I wonder if is better to have a device_info member to decide whether to
register the backlight, instead of harcoding the check for a specific family.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

