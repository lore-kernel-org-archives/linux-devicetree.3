Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 058C63806B8
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 13:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780925880; cv=none; b=msPCnqB/26BQDkq4bTO6d8sLTAjA7MP7TJCSf/b78Jp3oTUZuKwIF8Bd/NhkB2AArBapNbxqoY92U2kto3y24SDBON1NK3ZSDOIRZc2JyhxRlUIFQVM4UbWkmKuR410aLfed56o6EGnzYkjK92FdKgVPrKU+10LFD9BRX3uA808=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780925880; c=relaxed/simple;
	bh=bGxBOEX5vtxnGJu0C1CO9jYwtrMiWuaWtlMe7HyJXGA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kjFO65Zw25FB9DLujSLV+zvyz6+1nR0vicH6cA48qzo+Q/rWiazLaq963wKaKIxMNOEaF49DoasSK2Sr/zi0KGDB+GZnaecTJHaGrsUdCxwuiQWrAnCoE3q9tQcndOjEN1bjL/ubqQMfDNlhvYgrg3cT1b50OnCsoQP9Ic552mM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eyKTTGh+; arc=none smtp.client-ip=74.125.82.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eyKTTGh+"
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-1363e78746eso4593494c88.1
        for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 06:37:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780925878; x=1781530678; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZwULGS4h8PnN6MHIOVwi83xoDC88zB8a4vjNWuQ1Pus=;
        b=eyKTTGh+N3J9QFmqiaXWFifUY9vAzMf5mh6lI/YpLaCYY5NDCmGWLkcL5mebOt1Syl
         XfMUwh6qAYGAW13R7pOqddXUk4mVYZJfB1jHC/3H881rGNgiK6woLPDvZ471iswhAtD0
         Picyy3FBYn6nKNsMX0pgjwM0PRiLe4mH53wda45FJFv0EmYjNLNQO6X8jHNM/vbvhx2l
         JIrpLNyEbMURMJH27cCpPpqk1N8fc+WzQqGukA163WSvEHZ1a+iHD4+S4ImKr2LY4Frx
         7G/2Ku7JDJrRhJkdtnCyxhesrViRSHHz/l7Ii1UBIcWb9W1IHupjKUhNW0+W+RwPNgjI
         BCKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780925878; x=1781530678;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZwULGS4h8PnN6MHIOVwi83xoDC88zB8a4vjNWuQ1Pus=;
        b=QC0vg0FVxKZBnSM7zBq725rHf4C8SGZJCLyfiPhDxB80QTUBSVE8zMxX2aOz6qWpZA
         yFHDe9WQc+K48QTMjzPtFG+NA+0XtxvK6UlZvghUR2QsSR5aD6nqrQCScdnU/uRaDSAd
         mi81NucjtMFaxz+d0Uz5z0UF95GhasqxR+kx5x6bV9Ig/tiC2xg624tE4QUUkGicjatQ
         WYIUPN/wX6mNkhgHHKX7EAfhb/pYqbVZhzL4c3wto9qg81cE/6bp+dA+baeClA7xbSK/
         QVGZxxkz2xpe4/icsgngUlF0JRLDrH7Rd2fxYE7wgD7KWj3WNAO/QFYLZH9mYgIj2Dho
         6R9w==
X-Forwarded-Encrypted: i=1; AFNElJ/8t91PUdZnGrCW48S/foa+RUpi6LBfrQSBH5O8FriP9odm3bkNrrQyejwcyRNllIbtTAGJjmU24s7O@vger.kernel.org
X-Gm-Message-State: AOJu0Yxit5CFqpqQ9yRneqfch2NTASynj13iwbLgfYp/SPuAP19rM2Bw
	ys+PgQbhpYOwiJgzCoK8c5HmAkOv7gST3ckBeIDaXv9xzuNHFXGNQUyT
X-Gm-Gg: Acq92OGZN7FC8iDb7yhsYAd/6Oap/ugUPSHPDUB8amgG3kqckO1/OqspuEu5HiEEI0Z
	Mtxmlnk7toHniVA40+kUmdwb0TuLmLihNP025ua7D9sOKEnu9mmPJJBicaSY1lWIOzepUaQM43G
	e55QADvKLqUndTuqWPwuptH83ces83hsbmwznvsr7lR6nPhuyGYstipTw8Rnxzgu+pC4K0kDj5+
	leA3L7LShOJAs6ZrjWWiksrPY9iovTL4aQhfAGICs8dhYQMRB4V2l4O0PKe3KHa/syUEqaxu0oM
	LF8BlJYSEylrMIEQb/OkEhAUUD1CUwe98kfRUbEJXwbempSl1fzSRPEMmvrs2lubL9gVU1SaGy4
	s2fxQsDgVN7m1HpLJH+SG25Dt0R3+ZlXxhxFgT9otNWxi3prAQMbZFvi0bt9Nru2X7uGB+Zk+od
	hyx5fcG5S5Leo8yQXPTAmKGH/ItdY4/Q3gaHtgT8RgZ3wnhVMqVi7TRGiuvIpF
X-Received: by 2002:a05:7022:fd0c:b0:138:3d7:e8b1 with SMTP id a92af1059eb24-13806699169mr6430796c88.10.1780925877674;
        Mon, 08 Jun 2026 06:37:57 -0700 (PDT)
Received: from arch.localdomain ([2409:8a28:a54:e741:3a5a:3245:d3dc:4b5d])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-137f5539432sm14333495c88.9.2026.06.08.06.37.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 06:37:57 -0700 (PDT)
From: Jun Yan <jerrysteve1101@gmail.com>
To: sashiko-bot@kernel.org
Cc: conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	dmitry.torokhov@gmail.com,
	jerrysteve1101@gmail.com,
	linux-input@vger.kernel.org,
	robh@kernel.org,
	sashiko-reviews@lists.linux.dev
Subject: Re: [PATCH 8/8] Input: cap11xx - add support for CAP1114
Date: Mon,  8 Jun 2026 21:37:49 +0800
Message-ID: <20260608133749.555523-1-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260606152056.B77161F00893@smtp.kernel.org>
References: <20260606152056.B77161F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> Thank you for your contribution! Sashiko AI review found 3 potential issue(=
> s) to consider:
> - [High] Buffer overflow when reading the 'microchip,calib-sensitivity' dev=
> ice tree property for devices with >8 channels.
> - [High] Failure to mask `STATUS1` before ORing `STATUS2` can cause phantom=
>  key presses for channels 7 and 8.
> - [Low] Bitmask calculation for 'microchip,signal-guard' truncates settings=
>  for channels 8 and above.
> --
> 
> commit 8885b1d0f98cb8d5ca53ba5fd9a458743481d5be
> Author: Jun Yan <jerrysteve1101@gmail.com>
> 
> Input: cap11xx - add support for CAP1114
> 
> CAP1114 is a 14-channel capacitive touch sensor with 11 LED outputs
> and hardware reset support. The CAP1114 uses two separate control registers
> for LED output management and requires two button status registers for touch
> input state reporting.
> 
> > diff --git a/drivers/input/keyboard/cap11xx.c b/drivers/input/keyboard/ca=
> p11xx.c
> > index 408880cf65167..2aba3b508947d 100644
> > --- a/drivers/input/keyboard/cap11xx.c
> > +++ b/drivers/input/keyboard/cap11xx.c
> 
> [ ... ]
> 
> > @@ -311,6 +337,20 @@ static irqreturn_t cap11xx_thread_func(int irq_num, =
> void *data)
> >  	if (ret < 0)
> >  		goto out;
> > =20
> > +	if (priv->model->num_channels > 8) {
> > +		unsigned int status2;
> > +
> > +		ret =3D regmap_read(priv->regmap, priv->model->sensor_input_reg_base +=
>  1, &status2);
> > +		if (ret < 0)
> > +			goto out;
> > +
> > +		/*
> > +		 * CAP1114 STATUS1 register only contains data for the first 6 channel=
> s.
> > +		 * the remaining channels is stored in STATUS2.
> > +		 */
> > +		status |=3D FIELD_PREP(GENMASK(13, 6), status2);
> 
> [Severity: High]
> If the hardware sets reserved bits 6 or 7 in the first status register to 1,
> will they be preserved and incorrectly reported as touch events for channels
> 7 and 8?
> 
> Since the status variable (which holds STATUS1) is not masked before this OR
> operation, any reserved bits set in STATUS1 could overlap with the shifted
> status2 values.
> 
> Should the status variable be masked to clear bits 6 and 7 before ORing in
> status2?
> 

Thanks. Will mask bits 6/7 via status &= GENMASK(5, 0) after reading STATUS1 in v2.

> > +	}
> > +
> >  	for (i =3D 0; i < priv->idev->keycodemax; i++)
> 
> [ ... ]
> 
> > @@ -572,6 +625,14 @@ static const struct cap11xx_hw_model cap1106_model =
> =3D {
> >  	.has_repeat_en =3D true,
> >  };
> > =20
> > +static const struct cap11xx_hw_model cap1114_model =3D {
> > +	.product_id =3D 0x3a,
> > +	.led_output_control_reg_base =3D CAP1114_REG_LED_OUTPUT_CONTROL1,
> > +	.sensor_input_reg_base =3D CAP1114_REG_BUTTON_STATUS1,
> > +	.num_channels =3D 14, .num_leds =3D 11, .num_sensor_thresholds =3D 8,
> 
> [Severity: High]
> Does configuring num_channels to 14 cause a buffer overflow when parsing the
> device tree?
> 
> In struct cap11xx_priv, calib_sensitivities is defined as a fixed 8-element
> array:
> 
> struct cap11xx_priv {
>         ...
>         u32 calib_sensitivities[8];
>         u32 keycodes[];
> };
> 
> When cap11xx_init_keys() parses the microchip,calib-sensitivity property, it
> requests num_channels elements:
> 
> of_property_read_u32_array(node, "microchip,calib-sensitivity",
>                            priv->calib_sensitivities,
>                            priv->model->num_channels)
> 
> If the device tree provides 14 elements, won't this write 56 bytes into the
> 32-byte array, overflowing into the adjacent keycodes flexible array?
> 
> [Severity: Low]
> Additionally, does setting num_channels to 14 cause truncation in the
> microchip,signal-guard bitmask logic?
> 
> In cap11xx_init_keys(), priv->signal_guard_inputs_mask is typed as a u8, but
> the initialization loop runs up to num_channels:

I will exclude CAP1114 from using microchip,calib-sensitivity and microchip,
signal-guard in the dt-bindings to resolve these two issues in V2.

> 
> if (u32_val)
>         priv->signal_guard_inputs_mask |=3D 0x01 << i;
> 
> For i >=3D 8, does the shifted bit exceed the 8-bit width and get silently
> truncated to 0 during the assignment?
> 
> > +	.has_grouped_sensors =3D true,
> > +};
> > +
> 
> --=20
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260606150458.2506=
> 06-1-jerrysteve1101@gmail.com?part=3D8

