Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C22EE25B0B6
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 03:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789701197; cv=none; b=p+RmXfd6Y65SvpX8+T/DY4turKD3w+hzIQ/y136IeKQskbq82A6Mgac/huO/9H4p/teXnsUgNe+J6WdfALVcj6bUgP1Tz/K64Bmr0LaOP/UdU4gma6adQBAW16LcYebCVhQKw5WQHTydW6u9mWZIRdu+w/ORVc8HpaU1dlqIFG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789701197; c=relaxed/simple;
	bh=yD8cO48bEP2c+ZrrQIKnTg1ZSU2UDTi38jGZ5K8avnc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=LnQSjUkSSJ/vOB6ykCqXUZ2TXPEAzP2u+7Oo3wVE+k+LGP+R+2KWjXa4KbdtCuCoHp6ND9tJU2zAHxbjAdNKcFp4H+m1zJgQ2vVsrtQ53SiP5x60lSguDP6/fO+oYq6aqHBSSZ4RkV2Ygiz6s1aonCGvwVtB6h8NoNkgFb79jJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YOV1ROvV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YOV1ROvV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B15211F000FF;
	Fri, 18 Sep 2026 03:13:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789701194;
	bh=oHoa8mBzUg4+1mcj7snDJWPyEN/yFQ+pya4QRdtQYHA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YOV1ROvVVg/2q4EbQTk6GpQZnOKUa7F7LCtkXF3/4NRKQKVfGkB+q9tUrU4slPmPq
	 qhuEap8NIgM81uYGwHA/FfNpP/RDzF2Oqw6KbRj+tPOWV3hNRjKSyHt2t4qq5ij5UX
	 VQXsGT5ZUC8pPDHzsvkiv4kOkDWq8u+WYqkQul2ukNbM/mY8o2wQOAoh+u0YS7sHle
	 LCd83taefdbu0rc9vG37xG/DEMWLOozGkuxjHqHFQmHH/S/6EWEFltaeGeYazHoVBb
	 HdDf9NlcWpFT79aQUpLo1j7hLjGr9ryKom80w7hmLC0CHJcyiNhbHRLij18z87akE3
	 IeptyFiSe/rjQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 4/7] drm/verisilicon: add DC8000 (DCUltraLite)
 display controller support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Joey Lu" <a0987203069@gmail.com>
Cc: robh@kernel.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260918030125.315978-5-a0987203069@gmail.com>
References: <20260918030125.315978-1-a0987203069@gmail.com>
 <20260918030125.315978-5-a0987203069@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 18 Sep 2026 03:13:13 +0000
Message-Id: <20260918031313.B15211F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] drm/verisilicon: missing IRQ acknowledgment causes interrupt storm
- [High] drm/verisilicon: wrong register configured in vs_dc8000_panel_enab=
le_ex
- [High] drm/verisilicon: reversed VALID bit logic causes incomplete state =
latching
--

commit 091826cd38f41f7f76fdaab38a3712b19c6f3f16
Author: Joey Lu <a0987203069@gmail.com>

drm/verisilicon: add DC8000 (DCUltraLite) display controller support

This patch adds support for the DC8000 display controller to the
verisilicon DRM driver. It introduces a new vs_dc_funcs implementation
for the DC8000 generation.

> diff --git a/drivers/gpu/drm/verisilicon/vs_dc8000.c b/drivers/gpu/drm/ve=
risilicon/vs_dc8000.c
> new file mode 100644
> index 0000000000000..df7bd5bdd7f2a
> --- /dev/null
> +++ b/drivers/gpu/drm/verisilicon/vs_dc8000.c
> @@ -0,0 +1,92 @@

[ ... ]

> +static void vs_dc8000_panel_enable_ex(struct vs_dc *dc, unsigned int out=
put)
> +{
> +	regmap_set_bits(dc->regs, VSDC_FB_CONFIG(output),
> +			VSDC_FB_CONFIG_RESET);
> +}
> +
> +static void vs_dc8000_panel_disable_ex(struct vs_dc *dc, unsigned int ou=
tput)
> +{
> +	regmap_clear_bits(dc->regs, VSDC_FB_CONFIG(output),
> +			  VSDC_FB_CONFIG_RESET);
> +}

[Severity: High]
The commit message mentions that panel output starts as soon as
PANEL_CONFIG.RUNNING is set. However, does this code configure the wrong
register?

It sets and clears the VSDC_FB_CONFIG_RESET bit in the framebuffer
configuration register instead of the panel configuration register, which m=
ight
leave the panel hardware unstarted and the framebuffer held in reset.

> +static void vs_dc8000_crtc_begin(struct vs_dc *dc, unsigned int output)
> +{
> +	regmap_set_bits(dc->regs, VSDC_FB_CONFIG(output),
> +			VSDC_FB_CONFIG_VALID);
> +}
> +
> +static void vs_dc8000_crtc_flush(struct vs_dc *dc, unsigned int output)
> +{
> +	regmap_clear_bits(dc->regs, VSDC_FB_CONFIG(output),
> +			  VSDC_FB_CONFIG_VALID);
> +}

[Severity: High]
Is the VALID bit logic reversed here?=20

Setting VSDC_FB_CONFIG_VALID in vs_dc8000_crtc_begin() asserts to hardware
that the configuration is ready before new plane updates are written, and
clearing it in vs_dc8000_crtc_flush() marks the completed configuration as
invalid.=20

Can this reversed signaling cause the hardware to latch an incomplete state
during atomic updates?

[ ... ]

> +static u32 vs_dc8000_irq_ack(struct vs_dc *dc)
> +{
> +	u32 hw_irqs, unified =3D 0, known =3D 0;
> +	unsigned int i;
> +
> +	regmap_read(dc->regs, VSDC_DISP_IRQ_STA, &hw_irqs);
> +
> +	for (i =3D 0; i < VSDC_MAX_OUTPUTS; i++) {
> +		known |=3D VSDC_DISP_IRQ_VSYNC(i);
> +		if (hw_irqs & VSDC_DISP_IRQ_VSYNC(i))
> +			unified |=3D VSDC_IRQ_VSYNC(i);
> +	}
> +
> +	drm_WARN_ONCE(&dc->drm_dev->base, hw_irqs & ~known,
> +		      "Unknown hardware IRQ bits: %#x\n", hw_irqs & ~known);
> +
> +	return unified;
> +}

[Severity: High]
Does this function fail to clear the pending hardware interrupts?=20

It reads VSDC_DISP_IRQ_STA to check pending interrupts but does not write b=
ack
to clear them. For hardware without a dedicated ACK register, the status
register usually acts as a write-1-to-clear mechanism.=20

Can failing to write back leave the interrupt asserted in the hardware and
cause an infinite interrupt storm when the VBLANK interrupt fires?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260918030125.3159=
78-1-a0987203069@gmail.com?part=3D4
