Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14A543E2ABA
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 03:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789701127; cv=none; b=dq1XnBg7JIuC5FEh1ebdww5PmIIONcKBgsKaSkF5zViDcRuDka914nyRaUiCLmt8QoucajdbphJEiSq0ooT7IPOK0Za6hf7aslKhIgaNoiBtBP5lwURHyxBbEZEGYFza24xmTd1ymtq4kxbLHIWAW0q0U2c8Z5F56CllieP5v6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789701127; c=relaxed/simple;
	bh=+25l0fdCaiAcdyPgFNdOm4jzq3GEPOAAjFRhsIUbdBM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=C6yOeMs7e8JI3SuZcVonvGe8nCL+2lRzwrh21xHYE1QRWL3fh2qQfqCidI0kI6O6sAAf+xubBBOo+y3UiLmhYp8d6sjG/4MY6yfSc2QzLktFMqJ55Cv1CSVjluLs0KPlIFU9CHjQJASr2hQpyA0ke7HzMTBwp4VdM/3c7oJ9rHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A/Ued68j; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A/Ued68j"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7058F1F000FF;
	Fri, 18 Sep 2026 03:12:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789701122;
	bh=sgQfCkPRWWK+FybalF8pgOWHGJEjtz/k8VSRJa/Hg3I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=A/Ued68jfEmPUqBF1LjwjteqktCDZgnXZKOGFibt2nJ4srMm++i8zXkJUvfafsJRM
	 Di5HpGxfCuFXelmCp/a40iD7lDPQpkga6P6YMujtyrBfV1Oe68ftLJYIj017x5XTI4
	 eyxHsIo1PZd3+csDGM/cj09pqeWkgAE4MVwifyA95DBthO/Vwvs4uUoWYEfufWWere
	 zyU4jLUWFjQxMkAjDezxgUmgAuRnuzFOECwgsicQO8lIWMKRO2eZ/QNxw5NCYigqvP
	 nBZGsVGAA4UYQhnpQ6dPScGJMux44VEf52uaXyBupnV5CaDmN+NjvuctW3x0oXrF6m
	 MKuSSuzB4p/yw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 3/7] drm/verisilicon: introduce per-variant hardware
 ops table
Reply-To: sashiko-reviews@lists.linux.dev
To: "Joey Lu" <a0987203069@gmail.com>
Cc: dri-devel@lists.freedesktop.org, conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260918030125.315978-4-a0987203069@gmail.com>
References: <20260918030125.315978-1-a0987203069@gmail.com>
 <20260918030125.315978-4-a0987203069@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 18 Sep 2026 03:12:02 +0000
Message-Id: <20260918031202.7058F1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] drm: access after clock disable in vs_crtc_atomic_disable()
--

commit 4d2b1621cdee94c9390817d0548d0b254e003aa6
Author: Joey Lu <a0987203069@gmail.com>

drm/verisilicon: introduce per-variant hardware ops table

This commit introduces a per-variant hardware operations table (vs_dc_funcs)
for the Verisilicon display controller driver. It extracts DC8200-specific
hardware operations and updates shared code to dispatch through this vtable
to better support different hardware variants.

> diff --git a/drivers/gpu/drm/verisilicon/vs_crtc.c b/drivers/gpu/drm/veri=
silicon/vs_crtc.c
> index c24c1588cbe69..6033662dd9221 100644
> --- a/drivers/gpu/drm/verisilicon/vs_crtc.c
> +++ b/drivers/gpu/drm/verisilicon/vs_crtc.c

[ ... ]

> @@ -30,6 +53,9 @@ static void vs_crtc_atomic_disable(struct drm_crtc *crt=
c,
>  	drm_crtc_vblank_off(crtc);
> =20
>  	clk_disable_unprepare(dc->pix_clk[output]);
> +
> +	if (dc->funcs->crtc_disable_ex)
> +		dc->funcs->crtc_disable_ex(dc, output);

[Severity: High]
Does this access hardware registers after their clock is gated?

In vs_crtc_atomic_disable(), the pixel clock is disabled via
clk_disable_unprepare() just before calling the hardware-specific disable
hook crtc_disable_ex(). If the hook accesses the hardware block after its
clock is already powered down, it typically leads to asynchronous external
aborts, system hangs, or MMIO bus faults.

Should the clock be kept enabled until after crtc_disable_ex() finishes,
similar to how vs_crtc_atomic_enable() properly enables the clock before
calling crtc_enable_ex()?

>  }
> =20
>  static void vs_crtc_atomic_enable(struct drm_crtc *crtc,

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260918030125.3159=
78-1-a0987203069@gmail.com?part=3D3
