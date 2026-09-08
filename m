Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D76174A3F3C
	for <devicetree@vger.kernel.org>; Tue,  8 Sep 2026 09:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788861087; cv=none; b=N8HhR6bhFmx4LHldOcCYEfMjFFG8OQLVdMXGPkS4K6Ezec5Wjhva/nc0Vv6asYvsgRdLu2R40uxBBdHLjgipUjQOP4ZYsLKTkPButOTQjLMbjMbqPJy0R7T23W0mwJFx/yzBcjNxUPWhOgVy/eRpZXw88xw/r1hyEIE66qH4hww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788861087; c=relaxed/simple;
	bh=xHpwm8lIvxuUoj0MrgH8ap1Tz/zvxBfHNRRiRhBF7yg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=KafrpL9UxH/CW4FT3PEAJs6O/Kx59mZ5xQ0AZjxoZcrcbtnm4dASN7qU7L/yTqMWGU62k5+pEJj6YaYuYyUf6jtgCIp8zp6Wb5hh5acPj4uv6W4pfoHudb5iT8nKxYj1asjjmeL18soYPg1OGX3cX0zd9zZ+FJOHM4O7gcz41R4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BCezpbCi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BCezpbCi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D71E41F00A3A;
	Tue,  8 Sep 2026 09:51:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788861085;
	bh=jY7tffJ9LHaNGoIjKsQVFalmEcoI2WQYdRQ5neqLM9E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BCezpbCiI465uEq4cmsEBOcTd9eHZgSgfbWDN1OvSNkUjx+uR3OhwdrBQzfYD9WI4
	 8wpL1sD3BxNIx5vO/7vi/jTnqyGJ3lyJL4BETkhkhZFrp3U7k+tC00ctmj5V7VZt8v
	 OrWt3HneH/NQWbbmmpVrG6cwSmK+JBXKS//Ya9g/UHhlPMjakatz0/eotij46EG6lg
	 9YuAt1xS291nTR61lrgp82qu8+74goV45KPktCUOC00abF00l1P3ZWJwkC1FmlE6Rc
	 5Y7AeW95o0qUmaWrMoN+7AhKoSLuBVaepyMXSGiSOTWnIVHK3XBExTIdizaoM1G7bY
	 ScwpIf0q8fTKg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 3/6] drm/verisilicon: introduce per-variant hardware
 ops table
Reply-To: sashiko-reviews@lists.linux.dev
To: "Joey Lu" <a0987203069@gmail.com>
Cc: conor+dt@kernel.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260908092840.225220-4-a0987203069@gmail.com>
References: <20260908092840.225220-1-a0987203069@gmail.com>
 <20260908092840.225220-4-a0987203069@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 08 Sep 2026 09:51:24 +0000
Message-Id: <20260908095124.D71E41F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:

New issues:
- [High] Variant-specific CRTC disable hook (`crtc_disable_ex`) is called a=
fter disabling the pixel clock, leading to hardware faults.
- [High] The panel disable sequence in `vs_dc8200_panel_disable_ex` reverse=
s the order of clearing CONFIG and START registers, violating the original =
sequence and hardware state machine.

Pre-existing issues:
- [High] Primary plane disable function incorrectly sets the plane enable b=
it instead of clearing it.
- [High] IRQ handler is registered before DRM device initialization is comp=
lete, causing a potential NULL pointer dereference on early interrupts.
- [High] Sleeping clock functions (`clk_prepare_enable`, `clk_disable_unpre=
pare`) are called from CRTC atomic callbacks, violating DRM atomic context =
requirements.
--

commit c35af4d919e849e303afa29d897c4d1581720138
Author: Joey Lu <a0987203069@gmail.com>

drm/verisilicon: introduce per-variant hardware ops table

This commit introduces a hardware ops table for the Verisilicon DC driver to
handle variant-specific implementations. It extracts DC8200-specific ops in=
to a
new file and updates the shared code to dispatch hardware sequences through=
 the
new function pointers. The patch aims to avoid scattering variant checks ac=
ross
the core driver.

> diff --git a/drivers/gpu/drm/verisilicon/vs_crtc.c b/drivers/gpu/drm/veri=
silicon/vs_crtc.c
> --- a/drivers/gpu/drm/verisilicon/vs_crtc.c
> +++ b/drivers/gpu/drm/verisilicon/vs_crtc.c
> @@ -30,6 +53,9 @@ static void vs_crtc_atomic_disable(struct drm_crtc *crt=
c,
>  	drm_crtc_vblank_off(crtc);
> =20
>  	clk_disable_unprepare(dc->pix_clk[output]);

[Severity: High]
This is a pre-existing issue, but calling clk_disable_unprepare() here
sleeps in an atomic context, which is forbidden during non-blocking commits
and can lead to system instability.

> +
> +	if (dc->funcs->crtc_disable_ex)
> +		dc->funcs->crtc_disable_ex(dc, output);

[Severity: High]
Will this sequence cause hardware faults? The pixel clock is disabled
via clk_disable_unprepare() right before calling the variant-specific
crtc_disable_ex() callback.

If follow-up implementations of crtc_disable_ex() attempt to access hardware
registers within the now-disabled pixel clock domain, it could trigger an
asynchronous external abort or bus error when userspace disables the displa=
y.
Should the callback be invoked before disabling the clock?

>  }
> =20
>  static void vs_crtc_atomic_enable(struct drm_crtc *crtc,
> @@ -42,6 +68,9 @@ static void vs_crtc_atomic_enable(struct drm_crtc *crtc,
>  	drm_WARN_ON(&dc->drm_dev->base,
>  		    clk_prepare_enable(dc->pix_clk[output]));

[Severity: High]
This is a pre-existing issue, but does calling clk_prepare_enable()
from vs_crtc_atomic_enable() violate the DRM atomic context requirements?

The clock framework functions clk_prepare_enable() and clk_disable_unprepar=
e()
can sleep. Since CRTC atomic enable, disable, and update callbacks run in an
atomic context during non-blocking commits, this can cause scheduling while
atomic warnings and system instability during userspace modesets.

> +	if (dc->funcs->crtc_enable_ex)
> +		dc->funcs->crtc_enable_ex(dc, output);
> +
>  	drm_crtc_vblank_on(crtc);
>  }

[ ... ]

> diff --git a/drivers/gpu/drm/verisilicon/vs_dc8200.c b/drivers/gpu/drm/ve=
risilicon/vs_dc8200.c
> --- /dev/null
> +++ b/drivers/gpu/drm/verisilicon/vs_dc8200.c
> @@ -0,0 +1,121 @@

[ ... ]

> +static void vs_dc8200_panel_disable_ex(struct vs_dc *dc, unsigned int ou=
tput)
> +{
> +	regmap_clear_bits(dc->regs, VSDC_DISP_PANEL_CONFIG(output),
> +			  VSDC_DISP_PANEL_CONFIG_RUNNING);
> +	regmap_clear_bits(dc->regs, VSDC_DISP_PANEL_START,
> +			  VSDC_DISP_PANEL_START_MULTI_DISP_SYNC |
> +			  VSDC_DISP_PANEL_START_RUNNING(output));

[Severity: High]
Does this reverse the original tear-down sequence?

In the original vs_bridge_atomic_disable() code, VSDC_DISP_PANEL_START_RUNN=
ING
was cleared before clearing VSDC_DISP_PANEL_CONFIG_RUNNING.

Here in vs_dc8200_panel_disable_ex(), VSDC_DISP_PANEL_CONFIG_RUNNING is
cleared first. Modifying or clearing a pipeline's configuration while it is
actively sending pixels could put the hardware into an invalid state and
cause synchronization errors.

> +
> +	regmap_set_bits(dc->regs, VSDC_DISP_PANEL_CONFIG_EX(output),
> +			VSDC_DISP_PANEL_CONFIG_EX_COMMIT);
> +}

[ ... ]

> +static void vs_dc8200_primary_plane_disable_ex(struct vs_dc *dc, unsigne=
d int output)
> +{
> +	regmap_set_bits(dc->regs, VSDC_FB_CONFIG_EX(output),
> +			VSDC_FB_CONFIG_EX_FB_EN);

[Severity: High]
This is a pre-existing issue, but does this function actually enable the pl=
ane
instead of disabling it?

The code uses regmap_set_bits() to write a 1 to VSDC_FB_CONFIG_EX_FB_EN, wh=
ich
sets the enable bit. This could leave the primary plane active on the screen
when userspace expects it to be hidden via vs_dc8200_primary_plane_disable_=
ex().

> +
> +	vs_dc8200_plane_commit(dc, output);
> +}

[ ... ]

> +static u32 vs_dc8200_irq_ack(struct vs_dc *dc)
> +{
> +	u32 hw_irqs, unified =3D 0, known =3D 0;
> +	unsigned int i;
> +
> +	regmap_read(dc->regs, VSDC_TOP_IRQ_ACK, &hw_irqs);
> +
> +	for (i =3D 0; i < VSDC_MAX_OUTPUTS; i++) {
> +		known |=3D VSDC_TOP_IRQ_VSYNC(i);
> +		if (hw_irqs & VSDC_TOP_IRQ_VSYNC(i))
> +			unified |=3D VSDC_IRQ_VSYNC(i);
> +	}
> +
> +	drm_WARN_ONCE(&dc->drm_dev->base, hw_irqs & ~known,
> +		      "Unknown hardware IRQ bits: %#x\n", hw_irqs & ~known);

[Severity: High]
This is a pre-existing issue, but could this drm_WARN_ONCE() trigger a NULL
pointer dereference during boot?

In vs_dc_probe(), the IRQ handler is requested via devm_request_irq() before
vs_drm_initialize() is called to allocate the DRM device. If a residual boot
interrupt fires during this window, vs_dc_irq_handler() will run and call
vs_dc8200_irq_ack() while dc->drm_dev is still NULL, causing the warning ma=
cro
to dereference NULL.

> +
> +	return unified;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260908092840.2252=
20-1-a0987203069@gmail.com?part=3D3
