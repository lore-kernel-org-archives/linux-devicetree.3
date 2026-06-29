Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B8693B71DB
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 10:13:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782728012; cv=none; b=N8/tMuIVYfP92Xt1kGqmQCKHDrw7LszrTe/RVzVdA0idKifNzwELB9SmofotpvtWa8oguIKcCq7kSnClS61jwzffcqb3w936iYYz9taxxHtP8PLEw71I5ryEI7x1l85bwnw0n+Eceb++wsBCacMYKIVB91C2z1bIr3pxqAVyCnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782728012; c=relaxed/simple;
	bh=q5jIXaSxCjuxSv6Etj3isb1WoEQFQTRoZE/y/N6SYms=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ISHkSvKGe3cYl4+VAkppO4d7jS/vg31dFgX3BUoxAT98C6Db+I2FvLTfFgCA0zD+ipAAUO5px/gKnPtB9n5feleSiHON/4K7s7+S1UAMnwPzLYn6Nipho5/8H7+zWIMW7wiXFMN22Cvxs059nJOz/6Uc40voEwjegMdVuAsNXtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=D/drcOTe; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ux9Rdt89; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="D/drcOTe";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ux9Rdt89"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1782728009;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xm3lnF8OGUYYjPMf1XDMCVfIs1+U/YDcq+T0Pc20cjo=;
	b=D/drcOTeMth0uxGeaihuQGZll0SbVNu1KnCSULdUvTTXQsOTWRwmd5jy4pze52WFojNaxt
	Pj1NhNsxLvrktmTumR+743cBkwIR9k8WTDAvY4S3tQsuZIm8OjugToUnH/41CsOv7WzE2B
	ClfntYZcTybKiZWqJQXkJngRp60KFm8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-208-Q6l_E293PceDSfvbfQTBCQ-1; Mon, 29 Jun 2026 06:13:27 -0400
X-MC-Unique: Q6l_E293PceDSfvbfQTBCQ-1
X-Mimecast-MFC-AGG-ID: Q6l_E293PceDSfvbfQTBCQ_1782728007
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-492488f8583so33564985e9.2
        for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 03:13:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1782728006; x=1783332806; darn=vger.kernel.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=xm3lnF8OGUYYjPMf1XDMCVfIs1+U/YDcq+T0Pc20cjo=;
        b=Ux9Rdt898vLTFDGDzWsLNWO4o4J1o8nxzfpHYj6NOtDnZd/diBY0W2dXGGqa8rFMp4
         QLKY6O/kLwAlCmQsaFgMAcdMF/tLObMfLleAkntkI/XlRW8qDX3lbSD70tn+1OAhoW2U
         YoPd5Hl1hz23MiXcS+9ww0IbpeXcouaBqTiLqzA79a7XMNfVB77x/zWgkMqpdPLhOEx7
         g/1SL+6rHg3BZoMWDfgpQvavhOwdfNN/oOrf2UyZU+prnFtQilqckM2ZSQPuJDm50iW8
         ZRKfeWDf694WLZ+R3goW5oP92Jrz0Ev90kTAfaKdbLXnN+3n/xYZYNYwqJhasXfnB2L+
         appg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782728006; x=1783332806;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xm3lnF8OGUYYjPMf1XDMCVfIs1+U/YDcq+T0Pc20cjo=;
        b=Nbe6O6pFHBL/C8eabnLe/2jYBbUDORW9v0hR3lf2hZSLUy2rcuif1+JownnmaK5/nb
         zA+1WGoTXJpR0XCCLAlHlERwNOm5PCNuErxrTtjxlz7Oabjw5TI302RXTUrejxKkxRVV
         pWq0Kteoy3qf4RHP92YQAZtE8EYjzPtpcTvLpXLI24gbtZ2DVbS5wiVNP0pvKbqHmlku
         aflmwXUNyY0cwNEEb3zSELOZXdpC9cfImoSs6VP7yT8ik12+sWDzMJZ/hGWfiX1R9o69
         wrWDr80kP2HvCdX1lbHt0ShCeu8DecTIbSFXeOTm4cWoVpL0V4ntUhCnR/TkthxKapHS
         a69w==
X-Forwarded-Encrypted: i=1; AFNElJ8Ch29govI78kVFwJDrWV+zXLBhwPCCEXUKCf5wV4zS26cA2F1+x8oLzC7u390ISA0jmwv+sAFFqtX4@vger.kernel.org
X-Gm-Message-State: AOJu0YwCihAgZgnQVroeJGI9G7FIoZRitoH2t8okfoOcjxeK2hs8ZGmA
	CYVsWUArQg6dnrBM9OOX+GWrIVaADsPZxAlzCOcqH1ILn5nyswt+PEBn/i3uvvG03Wkp1XebIMK
	LV3TWIWOhKoq04We2V7mbKcGhylcHHhuwmj1eNx2YHK+kvPCO8aX1UlSRdwRqRRg=
X-Gm-Gg: AfdE7cnTaHEeqR+EancUA+itxi5uGrbHU4NAyJi5K5dY6RHwZ57kxYKUUQKnT8Jcdro
	KLYEXwUm6RUCVfoJUGVK2lGoXgXvGyrUeHWmfyl7lJZ12J82W9ID7jywqSms9lBQG8S1kz0iXjG
	fH5KUgw7GfpiigBN6gpSY5QWKoYBAY6vbbaQqaW1TbEFANG8mSHeoNe62wgwC9e+Ia9TVfUCxcv
	WGvKU3gi45+g7+G7cXA2VzRzU9ZhAWaKYcYEouZ/XrONeQ2gUMBFEljWwdT75+c35X04IryDdJ/
	paa2opahrVthvWM+CkMrZiPtbyW43pJjAmNyKiCXRePAvfGgcDgaGT51t95VQjxc9SSTFQwnSdU
	VosIjLjYQvOghWcN2c4Sra1183dKkpu6v8Q/eacAEyqr8SlQn6NpWTsr6/F2kjfZhA+swbw==
X-Received: by 2002:a05:600c:6218:b0:492:700b:deea with SMTP id 5b1f17b1804b1-493b71a21c5mr1717655e9.13.1782728006518;
        Mon, 29 Jun 2026 03:13:26 -0700 (PDT)
X-Received: by 2002:a05:600c:6218:b0:492:700b:deea with SMTP id 5b1f17b1804b1-493b71a21c5mr1717385e9.13.1782728006067;
        Mon, 29 Jun 2026 03:13:26 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4734df60acesm11346521f8f.25.2026.06.29.03.13.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 03:13:25 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Amit Barzilai <amit.barzilai22@gmail.com>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, andy@kernel.org,
 gregkh@linuxfoundation.org, deller@gmx.de
Cc: azuddinadam@gmail.com, chintanlike@gmail.com,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org,
 linux-staging@lists.linux.dev, Amit Barzilai <amit.barzilai22@gmail.com>
Subject: Re: [PATCH v2 2/4] drm/ssd130x: Add RGB565 support to SSD133X family
In-Reply-To: <20260622152506.78627-3-amit.barzilai22@gmail.com>
References: <20260622152506.78627-1-amit.barzilai22@gmail.com>
 <20260622152506.78627-3-amit.barzilai22@gmail.com>
Date: Mon, 29 Jun 2026 12:13:24 +0200
Message-ID: <87jyrhd58b.fsf@ocarina.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Amit Barzilai <amit.barzilai22@gmail.com> writes:

Hello Amit,

Thanks for doing a re-spin and adding the SSD1351 support to the
ssd130x driver. This is much closer to what I had in mind than v1.

[...]

>  
>  const struct ssd130x_deviceinfo ssd130x_variants[] = {
> @@ -206,6 +212,7 @@ const struct ssd130x_deviceinfo ssd130x_variants[] = {
>  	[SSD1331_ID] = {
>  		.default_width = 96,
>  		.default_height = 64,
> +		.format_rgb565 = 1,
>  		.family_id = SSD133X_FAMILY,
>  	}

[...]

>  
>  	iosys_map_set_vaddr(&dst, data_array);
> -	drm_fb_xrgb8888_to_rgb332(&dst, &dst_pitch, vmap, fb, rect, fmtcnv_state);
> +	if (ssd130x->device_info->format_rgb565)
> +		drm_fb_xrgb8888_to_rgb565be(&dst, &dst_pitch, vmap, fb, rect, fmtcnv_state);
> +	else
> +		drm_fb_xrgb8888_to_rgb332(&dst, &dst_pitch, vmap, fb, rect, fmtcnv_state);
>

Since you are changing the SSD1331_ID to use .format_rgb565, what's the
value of keeping the RGB323 support ? It's not used by any other Solomon
family supported by the driver.

Ideally, we would like the driver to expose native formats besides the
virtualized XRGB8888. Geert posted some patches for SSD1301 some time ago:

https://lists.freedesktop.org/archives/dri-devel/2023-August/419937.html

but that never landed.

If that was the case, then SSD130X could expose DRM_FORMAT_XRGB8888 and
DRM_FORMAT_R1; SSD132X would expose DRM_FORMAT_XRGB8888 and DRM_FORMAT_R4 and
SSD133X expose DRM_FORMAT_XRGB8888, DRM_FORMAT_RGB332 and DRM_FORMAT_RGB565.

Given that we don't have that, I suppose that we could just get rid of the
DRM_FORMAT_RGB332 support for SSD133X and just default to DRM_FORMAT_RGB565.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

