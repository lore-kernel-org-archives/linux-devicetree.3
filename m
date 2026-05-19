Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E31C626CE32
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 06:41:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779172893; cv=none; b=SpB/QYg+gqt6+BDdJ8IKHcEpGStkVcB8Y8RHisdQ/G1HoekNqcc5+Tv6pdPdfjf6c5BcA10VeEJ7zvEtPLb7V1XWYmrL4MmA+BOK3I8Si6rpwpbZlL2y/6S3f4l2MqXJ6gOKA24W3E8OhkmJ1JYwIGSqgw/S/m/PrhYAolG32RQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779172893; c=relaxed/simple;
	bh=dbBP/3bSfWVftwApM6Ymvu9hzp2Dd6scGVOhPocmNWg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=If3VHnz4V12rqWEeGu7Fdk5EGNpi0bKaOrRAcHy91XgwC/5VW9s1mj0DzzwK9SiVGAQruuG8RDR9nWTxqspjIARS5RCo+83J+4jf39ZepHIJiTKXn5O6WmJ7wNR8hzPlr9QHCnRsy4QrbwNqBUxRRUKGn9fJ/wLklLDgx/3B1hQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l4iHhIHW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l4iHhIHW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E0EFC2BCB3;
	Tue, 19 May 2026 06:41:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779172892;
	bh=dbBP/3bSfWVftwApM6Ymvu9hzp2Dd6scGVOhPocmNWg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=l4iHhIHW5yqLJk3EoqAn3m7SzBKE5Y4CenkvnT5U9/+S2w1oQyfh6XS9MmTHmvHFU
	 CpkXJWAdiOF9lOE9xvWZXVwRAatp/syeuzZTOpAAmFdIRg5a0xXe+xAWL3gDitGoqi
	 QsOybDK3EN5YOQCk/kyLcLMhgmNvQ86hlJ8VeWL7uqz8DkHIQ4nUtx5hAPdd/CKhwb
	 cAEXORq0x47dAglanfOLFcxVBbgEQ77UllMZVIDYxwaupHoaPPvXsGLjtO4CbcNgmK
	 kd3i/hdoN6g4L6H5vNy9tbaKd4haT4se2YxKJDYLT77PhT2oe/9erwKeNsz/gvfSWK
	 3bHCHmFkHCoZg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/4] drm/verisilicon: introduce per-variant hardware
 ops table
Reply-To: sashiko-reviews@lists.linux.dev
To: "Joey Lu" <a0987203069@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260519055114.1886525-4-a0987203069@gmail.com>
References: <20260519055114.1886525-4-a0987203069@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 19 May 2026 06:41:31 +0000
Message-Id: <20260519064132.0E0EFC2BCB3@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] The newly added `crtc_disable` hook is invoked after the pixel clo=
ck is disabled, which will cause bus errors.
- [High] The register clearing sequence in `vs_dc8200_bridge_disable` is in=
verted compared to the original code, causing a functional regression.
- [Medium] Unconditional assignment of `dc->funcs` without verifying hardwa=
re identity, contradicting the commit message.
--

commit 9ad7489590b539e39997172552aadb2d24ac579b
Author: Joey Lu <a0987203069@gmail.com>

drm/verisilicon: introduce per-variant hardware ops table

This commit refactors hardware-specific operations into a vs_dc_funcs
vtable to support multiple IP variants without scattering if/else branches,
extracting DC8200-specific operations into vs_dc8200.c.

> diff --git a/drivers/gpu/drm/verisilicon/vs_crtc.c b/drivers/gpu/drm/veri=
silicon/vs_crtc.c
> index 9080344398ca2..a87caa6f73bac 100644
> --- a/drivers/gpu/drm/verisilicon/vs_crtc.c
> +++ b/drivers/gpu/drm/verisilicon/vs_crtc.c

[ ... ]

> @@ -30,6 +53,9 @@ static void vs_crtc_atomic_disable(struct drm_crtc *crt=
c,
>  	drm_crtc_vblank_off(crtc);
> =20
>  	clk_disable_unprepare(dc->pix_clk[output]);
> +
> +	if (dc->funcs->crtc_disable)
> +		dc->funcs->crtc_disable(dc, output);
>  }

Will calling the crtc_disable hook here cause bus errors? It looks like
clk_disable_unprepare() disables the pixel clock before we call into the
hardware-specific teardown function, which likely accesses MMIO registers
while the clock is off. Symmetrically, vs_crtc_atomic_enable() invokes
crtc_enable after the clock is prepared and enabled.

> diff --git a/drivers/gpu/drm/verisilicon/vs_dc.c b/drivers/gpu/drm/verisi=
licon/vs_dc.c
> index dad9967bc10b8..c949570241890 100644
> --- a/drivers/gpu/drm/verisilicon/vs_dc.c
> +++ b/drivers/gpu/drm/verisilicon/vs_dc.c

[ ... ]

> @@ -136,6 +134,8 @@ static int vs_dc_probe(struct platform_device *pdev)
>  	dev_info(dev, "Found DC%x rev %x customer %x\n", dc->identity.model,
>  		 dc->identity.revision, dc->identity.customer_id);
> =20
> +	dc->funcs =3D &vs_dc8200_funcs;
> +
>  	if (port_count > dc->identity.display_count) {
>  		dev_err(dev, "too many downstream ports than HW capability\n");
>  		ret =3D -EINVAL;

The commit message states "After vs_fill_chip_identity() confirms a DC8200
(or compatible) identity, vs_dc_probe() assigns dc->funcs =3D &vs_dc8200_fu=
ncs".

However, this assignment happens unconditionally without checking
dc->identity.model. Could this apply the wrong operations if probed with a
different hardware variant?

> diff --git a/drivers/gpu/drm/verisilicon/vs_dc8200.c b/drivers/gpu/drm/ve=
risilicon/vs_dc8200.c
> new file mode 100644
> index 0000000000000..db9e1b3cd9032
> --- /dev/null
> +++ b/drivers/gpu/drm/verisilicon/vs_dc8200.c

[ ... ]

> +static void vs_dc8200_bridge_disable(struct vs_dc *dc, unsigned int outp=
ut)
> +{
> +	regmap_clear_bits(dc->regs, VSDC_DISP_PANEL_CONFIG(output),
> +			  VSDC_DISP_PANEL_CONFIG_RUNNING);
> +	regmap_clear_bits(dc->regs, VSDC_DISP_PANEL_START,
> +			  VSDC_DISP_PANEL_START_MULTI_DISP_SYNC |
> +			  VSDC_DISP_PANEL_START_RUNNING(output));

Is this register clearing sequence inverted compared to the original code?=
=20

The commit message says "No functional change for DC8200 platforms", but
the original code in vs_bridge_atomic_disable() cleared VSDC_DISP_PANEL_STA=
RT
before clearing VSDC_DISP_PANEL_CONFIG:

    regmap_clear_bits(dc->regs, VSDC_DISP_PANEL_START,
              VSDC_DISP_PANEL_START_MULTI_DISP_SYNC |
              VSDC_DISP_PANEL_START_RUNNING(output));
    regmap_clear_bits(dc->regs, VSDC_DISP_PANEL_CONFIG(output),
              VSDC_DISP_PANEL_CONFIG_RUNNING);

Could reversing this order violate display hardware teardown constraints and
result in display glitches or pipeline lockups?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260519055114.1886=
525-1-a0987203069@gmail.com?part=3D3
