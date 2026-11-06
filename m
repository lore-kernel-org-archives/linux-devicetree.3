Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793975988;
	b=u+8AO0DMKhMHGLgN67+xM6/0NOJRQ0vKjId6Xl5ugpOHBBPUHeqTOZej6/YQV5hwcoWo
	 apuSgr3fXof16HIeFPTRK/pWZOu40K6bD22y1+SAG0ZK+KaIzxOigWP3UxNbeltdzbY6s
	 XsuualzuDyUn+QqSzyRPe1wHx42Fvb9dkKYAHpj7mZWZ6xrT5vzDkhtQFd0+fe0uOHFB5
	 yMJS7TyIMQvZGeMiS3bVGvjLDCFlBSZZyecFlwK40EE2tJaP/JPSZtqhVT/cjeDRFpT+o
	 eEJlCjtniGzyGPfAcBwHW6W5GCcCDMF1FtFMHHhmftXJBMvwNc0rR3ox1WzQOb2t8zw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793975988;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ApDnH3pFxBWP98MgBtsP9HN4PO7e1RUuQTYY+krhQJU=;
	b=if+VbTDbhKu1iRL1y4TORrZKUq25onhO7hg6sZTY4KxMGX208UUpAZbcFmVwsas09jhz
	 nc6RNekfULarSkzkH00zfQ8SVl0GhwHI8q1A66xupfqDq0oL9oxZAQrw97DBgrkSjWdGy
	 93pyTZLWDZ+4MHDKCJioX4zqorwQrvSK2KFc4tZsit5qdJkZ81rVwnNLVeuICnCNqxjcJ
	 CQoECrWP6Xc2zxeum6221Q9C2IBcwEJC0bz73Ohk9sHvcEHWcZCyMBdZIHaPtjCAX0qsU
	 LXYVva2IKiJWCTb++G/hJdEWnHXZEXhwTLNIQNtv5d4ckAChTI8cXJQFJjkPPHuUEKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	dkim=pass header.d=mg-crea-com.20260707.gappssmtp.com header.i=@mg-crea-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=HMuZsBwp;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 682DA606A331
	for <devicetree@vger.kernel.org>; Fri,  6 Nov 2026 14:39:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 682DA606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mg-crea-com.20260707.gappssmtp.com header.i=@mg-crea-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=HMuZsBwp
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-491971ac844so630285f8f.2
        for <devicetree@vger.kernel.org>; Fri, 06 Nov 2026 06:39:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mg-crea-com.20260707.gappssmtp.com; s=20260707; t=1793975985; x=1794580785; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ApDnH3pFxBWP98MgBtsP9HN4PO7e1RUuQTYY+krhQJU=;
        b=HMuZsBwpcfAivI2lXFwbYHDyA3Vw6WCNBWtFOSYGJZoCHxfz1OymiMRSlR/lKeaMFE
         aluqYsF1IKKMjWhqmjXTz7ptCe7e8VnCClInCxGQDoYD6iJl4CgqWh+/Zu3LCi8Ded3U
         oBYv7EuAjYNHWLeKwOx5QNNK5ZcVXBY9ijAvS7C5ca4YfusYRBQQ0V3iV7vEyBFGHEov
         MhSaNTw6GLWepT/bzLxyu8n+Ub8DR/jwgAe79rSh39mDQ75t9uatpjkgSEsxRajw2V9A
         sw3hssJwDR6o3RpVUdlTnejAC+7BirubMtZDytWchhQ7mRA7aZAQFP0h9UXHHTe2FWZU
         IcJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793975985; x=1794580785;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ApDnH3pFxBWP98MgBtsP9HN4PO7e1RUuQTYY+krhQJU=;
        b=iyAID6Q+m8NXmMg7QWHuKH83DvCD8LOEYD3h1L75tv6WTZBhPiW1VPD7oJIpIk2AMq
         ED62uvh+cr2HmRQ+VwgUka5QIS+HZqro1+BJtE10vTsKtyTVNO4/mliqFYuUZ3H/6Vv0
         tiFtAZnyi0mRSOBFFYw8JZldrPr7yEWKQdVIWhECiComrNUsNLBPm0XvjTS6jRg9lC3l
         nKAgO9YRnXGRa8N6VDMWQYkB8dLS4ObKRP1YZlkzI/XQHVVql0amk+my7HrGA2AtNoIg
         Zbbw72Mzky+qbqrcw/y/vWrLUhe/w8DUfUvbBa5O8jMxhRg1Pab1NcLjEYOlHizAmmUk
         tg1w==
X-Forwarded-Encrypted: i=1; AL+hErG7nz7UBr9ZW7gLzrUf/RvIaVIr2ACSE1qH0/R5Gtd32MLpgXlWfr0tww0g7A0zVOLdn9hzfAa5EKqH@vger.kernel.org
X-Gm-Message-State: APuU4Z+K1Qo4MMxZq9b1xNEl/p8KlivqB0U57IQ+EH7HE/SAuOAD5Nr4
	UpHuu9volKR0HMNplEXF90yDlr/ZQ2pXJixM0GwUICNGfhHGPu1Aw08TeU5vMC+KsOg=
X-Gm-Gg: AYBFou3/LmVUwSWDc49hfvdv5k5VSxWrhzRcA3Ofwvk8Je09So3zUyZ/c+1GVrEBzx0
	mVH+VNMLz+So2ty0iaf+C9I/MHohG3KUiqtq55OVI+sqkpr4OLt8pKK71Q4nYtdKrYDLmqScRpS
	K6v8gKeMqtdfU25lFEsTTvGHo78ysR2ll//NT3JZHSUuV+BOPInvBMCMWzGLv3bJUYUfrVgaRZH
	N3dNxgOvTt4FPNYh1tLub+eHpuSkCP6kupjbGt1d/tmt0EchT57H9DSjggVxcuedYHq5muWajUt
	FBB8mriQF0FaUub622D/7vKI5ypCk1qMKQYhrPJuTDsVWjHiV6DUmj9sgyOpFb2nxOWB/Vzcg4g
	4XR8vwbXV8Wq1PpRKB9p4DDnIb0Ln0PyAYbV8mR81jQb7XhGMjZowdg+phqkd9jcXEWHlF90XHR
	4jwrudnTtsbR4840OpRjYYsIurNtSPKzXMz2bCJylnXsSRzEy5/Cb/Tpsjww8iakO3qfjHmL2jM
	h/anaWLg4bsPPBOfgo5MPotpcRGiAH4pHSATwkQOVJF9nctyF89sG3LxqW3Gwr13/9l/TBtUI8A
	nhXR3QIs61fS0A5i3/XcrP3ZfplQ7uQc2ixhN7Eo51pMeO7fiqccR67I2KeEIvY=
X-Received: by 2002:a05:6000:1861:b0:493:803e:800f with SMTP id ffacd0b85a97d-493803e802cmr1981879f8f.29.1793975985393;
        Fri, 06 Nov 2026 06:39:45 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:9d2:5a71:30ce:e69c:9ae:c94a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d6d6382dsm3633050f8f.19.2026.11.06.06.39.44
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 06 Nov 2026 06:39:45 -0800 (PST)
From: Olivier Louvignes <olivier@mgcrea.io>
To: Paul Cercueil <paul@crapouillou.net>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"H . Nikolaus Schaller" <hns@goldelico.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/5] drm/ingenic: Add a driver for the X1600 display controller
Date: Fri,  6 Nov 2026 15:38:27 +0100
Message-ID: <20261106143827.15926-1-olivier@mgcrea.io>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <0a2e8ea782fa819a547e0a3075303bd74a7fde72.camel@crapouillou.net>
References: <20261106112000.1612-4-olivier@mgcrea.io> <0a2e8ea782fa819a547e0a3075303bd74a7fde72.camel@crapouillou.net>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Paul,

On Fri, Nov 06, 2026 at 02:34:08PM +0100, Paul Cercueil wrote:
> > +	struct drm_display_mode *mode = &crtc->state->adjusted_mode;
>
> This bothers me a bit, shouldn't it be using 'crtc_state'?

Yes. v4 takes the mode from crtc_state.

> > +	writel(readl(lcd->base + X1600_LCD_ST), lcd->base +
> > X1600_LCD_CLR_ST);
>
> Not fond of the writel(readl()) nesting here.

OK, a local in v4, here and in probe.

> > +	writel(val, lcd->base + X1600_LCD_DISP_COM);
>
> This whole block above looks like out of place. Why not do it in
> x1600_lcd_encoder_atomic_mode_set()?
>
> Bonus point, you wouldn't need the 'bus_flags' and 'color_order' variables.

The controller only takes register writes while its clock runs, and the
clock is off when atomic_mode_set() is called: on a full modeset the
CRTC's atomic_disable() has stopped it, and atomic_enable() starts it
again afterwards. I checked it on the R1: with the clock gated (CLKGR0
bit 23), every register reads 0x80, and a write to TFT_HSYNC is lost,
the register still holds the old value once the clock is back.

So moving the block means starting the clock in atomic_mode_set() too,
or leaving it running while the CRTC is off. I'd rather keep the writes
in atomic_enable(), next to clk_prepare_enable(), and look the bus
format up in the new connector state there, so the two fields go
anyway. Would that work for you?

> > +	if (pixels > X1600_LCD_MAX_PIXELS)
> > +		return MODE_MEM;
>
> The max resolution is 1280x720 so you should check mode->hdisplay / mode-
> >vdisplay individually. Otherwise bogus resolutions like 1920x480 would be
> accepted.

Right for 1920x480, but 720 per side would refuse the R1's own panel,
which is 480x800 in portrait. The manual only says "frame size up to
720p". v4 can bound each side by 1280 and keep the 1280x720 pixel count,
would that do?

> > +		spin_lock(&lcd->drm.event_lock);
>
> spin_lock() can sleep with CONFIG_PREEMPT_RT so it looks wrong in an IRQ
> handler. I *think* you don't need to lock it here anyway, as the spinlock is
> locked in other places using spin_lock_irq().

On PREEMPT_RT the handler doesn't run in hard IRQ context:
force_irqthreads() is always true there, and the IRQ is requested
without IRQF_NO_THREAD, so the handler runs in a thread, where a
spinlock_t is fine (Documentation/locking/locktypes.rst).

And it needs the lock: drm_crtc_send_vblank_event() wants the caller to
hold event_lock, and lcd->event is shared with queue_event() and
atomic_disable(). Their spin_lock_irq() only keeps the handler off the
CPU they run on. armada, omapdrm and malidp take event_lock the same way
in their handlers. So I'd keep it.

> You enable it later in the probe, so you could just use devm_clk_get_enabled()
> here.

Probe only enables it to stop what the boot loader left running, and
disables it again before drm_dev_register(). From then on atomic_enable()
and atomic_disable() gate it. devm_clk_get_enabled() would keep it
running for as long as the driver is bound, display off included.

> I saw a patch from Maxime replacing these - you should be calling
> drm_mode_config_create_initial_state(drm) here (and handle the error).

Will do, it's in drm-misc-next already.

I'll leave v3 a few more days for the drm-misc side before sending v4.

Thanks for the review,
Olivier
