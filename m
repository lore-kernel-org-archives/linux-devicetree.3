Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75E9230D3F7
	for <devicetree@vger.kernel.org>; Thu,  4 Jun 2026 22:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780611679; cv=none; b=mJ8p+eIaMvWBkhkHt6kaNqF3BPHNa1/OfEB7S5dllV3bp+H3nusOmLE49oxn38JlwBr14ZQUyC74NaLU4g/nngc2wgxVwU5+IYL/S3niZNz9ZxMfrtsgiMPo/LnyVCSioptMVeHIGOhP4gPMr9skB4WgkQ0fojc2TVquBCjz3qA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780611679; c=relaxed/simple;
	bh=oYZlqwd8hFWKSocUhJlgSJ7xFmpzm2/GN+ykjS4p8Eg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=X4NxQSNjpdt+UdTldtTXyctMyEg9BJt68Tj+lFbIjvkLEfpWTbUEQpkBvZO2+A2+PmALkdlUMsdralJeVwCLuOEuDZFkj9RR4bA7+JCBGHyF2d9Ub0CTBSmmlLDot1mcDuLRFEC8nFOT1rZGHEFKW9VBri3I2aRwGeNEFO2AIVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HqoyxHFf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HqoyxHFf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C1AD1F00893;
	Thu,  4 Jun 2026 22:21:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780611677;
	bh=IT2ZBvL2+SQRTUJWr4mtcwRJX9zqindxMn9K33e+3L8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HqoyxHFfQHG9Pd3ryU7LvFVekT/RHqDLrjtv3jGlYEAiziztAPbn8Y9Kg/QRyzDqz
	 g2a27UovNeGSP2jw1hOCmiV3B/GhSSvh8cDC2Nqr9ARYipZGWnUO3mz4W9VFBjGH1T
	 nAsFoOpfueHcieCXF1MbNsc3DUPbC8pVzY/aOzLdlGqnHtPM7wEBSIZ3Y+6re7yP5M
	 0gERGAF+B9JgvxrQXofi0QqYRbQz3fVSyUXYI4F6BkVtJY7TfgYvINDbKiQ/xgPfpW
	 Qi/nCBa39kZxxNyPPkPAUH//VSn/VOH2eZwjOHLRdfUbL4mFSylshotTK5Ou2bsCT8
	 3pDoslPWOMyoA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V5 4/6] drm/panel: anbernic-td4310: Add RG Vita Pro
 panel
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chris Morgan" <macroalpha82@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260604220802.119107-5-macroalpha82@gmail.com>
References: <20260604220802.119107-5-macroalpha82@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 04 Jun 2026 22:21:17 +0000
Message-Id: <20260604222117.8C1AD1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The driver calls an undefined function `devm_drm_panel_add()`, cau=
sing a compilation failure. Furthermore, the driver lacks a `.remove` callb=
ack (or a devres action) to call `drm_panel_remove()`. If the build error i=
s fixed by trivially substituting the standard `drm_panel_add()`, it will r=
esult in a Use-After-Free vulnerability.
--

commit 15ea49b70a00236df8f23333ccc634c4fbaf642e
Author: Chris Morgan <macromorgan@hotmail.com>

drm/panel: anbernic-td4310: Add RG Vita Pro panel

This commit adds support for the TD4310 controller IC DSI panel used in the
Anbernic RG Vita-Pro.

> diff --git a/drivers/gpu/drm/panel/panel-anbernic-td4310.c b/drivers/gpu/=
drm/panel/panel-anbernic-td4310.c
> new file mode 100644
> index 0000000000000..84963671e3f94
> --- /dev/null
> +++ b/drivers/gpu/drm/panel/panel-anbernic-td4310.c

[ ... ]

> +static int panel_anbernic_td4310_probe(struct mipi_dsi_device *dsi)
> +{

[ ... ]

> +	ret =3D drm_panel_of_backlight(&ctx->panel);
> +	if (ret)
> +		return ret;
> +
> +	devm_drm_panel_add(dev, &ctx->panel);

[Severity: High]
Does devm_drm_panel_add() exist in the kernel? It looks like this might
cause a build failure due to an undefined function.

If this is resolved by simply replacing it with drm_panel_add(), could it
result in a use-after-free on unbind? Because the panel is allocated with
devm_drm_panel_alloc() earlier, its memory will be automatically freed when
the device is unbound. If drm_panel_remove() is never called, the freed
panel would remain in the global DRM panel list, risking memory corruption
when other components traverse the list.

[ ... ]

> +static struct mipi_dsi_driver anbernic_panel_td4310_driver =3D {
> +	.driver =3D {
> +		.name =3D "panel-anbernic-td4310",
> +		.of_match_table =3D panel_anbernic_td4310_of_match,
> +	},
> +	.probe	=3D panel_anbernic_td4310_probe,
> +};

[Severity: High]
Would it make sense to add a .remove callback here to call
drm_panel_remove(), or perhaps register a custom devm action during probe,
to ensure the panel is properly unregistered from the subsystem on teardown?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260604220802.1191=
07-1-macroalpha82@gmail.com?part=3D4
