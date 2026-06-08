Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96C8B32B111
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 02:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780886487; cv=none; b=UZPASkZSOgCf4408iMQUDDTcEcogtE9N8os8zKG427Magof5in6GiQH+mUTiEYMCczsMwg9RlJFO/Fk4yIH5z6v2bYQp8ihkQKxGOnzLsNwcDAkfLT3XaQEyGt75kJdrpXlq/fwhuHRHPIudg0s41lod7916lhrTWEqU4h7CNrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780886487; c=relaxed/simple;
	bh=P+Vq4deZiWLV553QIy9k7efD+BX5pJv6rClwciZFCsk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=GS4UA9D1zyKae/IVxXwmPxbCi3OYqFAkk7pMhexNcws2/9Shz+KbXB/F7Agdxg9GgG/YNXGSbfGrzDVLkcozMDc40JZmJ6VFdDDcppVp1M1+wP1aX+NjfBjLebDYBbpmFqgBl45oPFsGdATGJ1RQexpfsYC84SLcnt32GOkJj58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LNM+0Ql2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LNM+0Ql2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D1481F00893;
	Mon,  8 Jun 2026 02:41:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780886483;
	bh=mwJrXmtqejKYCngZrxBQoyTb/fGdzAiXmkGHtx6i+jA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LNM+0Ql2/hqwTH6TJmDTcqTY36jPz3KLjscM9TZ1ZipqgSYUVVZYRZykzABJOmTN0
	 313E0pon45P8+EYRtfWIzeg95ziEb0ujDniNJesOVLvGpLc8M/OOkhu4paBrXy2VZB
	 fHfugn03bZpZ4re56EbFBps7Pc1VnJvwlyK6ExmZqn2Dmf68JmMbyepcBhFWemwCww
	 t+7ltYvRjB74vaOOdSdtidfjXdZkPLhnd8TPQ8vueudXL1/kC/AKOyXN8RHV3YUSJh
	 Js1y1vkH0FrIzrxWYmMdHVxy7c7KM91x6Ljkn0jk3+d588hqC1B1LydYz/ytVWRudB
	 lBQgEMrBta3oQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 5/5] drm/verisilicon: add DCUltraLite chip identity
 to HWDB
Reply-To: sashiko-reviews@lists.linux.dev
To: "Joey Lu" <a0987203069@gmail.com>
Cc: dri-devel@lists.freedesktop.org, conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260608023237.305036-6-a0987203069@gmail.com>
References: <20260608023237.305036-6-a0987203069@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 08 Jun 2026 02:41:22 +0000
Message-Id: <20260608024123.9D1481F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] A wildcard entry in vs_chip_identities shadows subsequent specific=
 entries, making them unreachable.
- [High] The IRQ handler is registered before DRM structures are initialize=
d, which can cause a NULL pointer dereference if an interrupt fires early o=
r if initialization fails.
--

commit ef807eaf736a3cb84d7613b4d88301061b410a1b
Author: Joey Lu <a0987203069@gmail.com>

drm/verisilicon: add DCUltraLite chip identity to HWDB

This commit registers the Nuvoton MA35D1 DCUltraLite chip identity in
the hardware database. It places the entry last in the list to act as a
gate for hardware recognition.

> diff --git a/drivers/gpu/drm/verisilicon/vs_hwdb.c b/drivers/gpu/drm/veri=
silicon/vs_hwdb.c
> index 91524d16f7785..7d630a667a3f0 100644
> --- a/drivers/gpu/drm/verisilicon/vs_hwdb.c
> +++ b/drivers/gpu/drm/verisilicon/vs_hwdb.c
> @@ -129,6 +129,16 @@ static struct vs_chip_identity vs_chip_identities[] =
=3D {

[Severity: High]
This is a pre-existing issue, but does the wildcard entry at the start of
vs_chip_identities prevent specific entries from being matched?

Looking at vs_chip_identities, the first entry uses a wildcard for the
customer ID:

static struct vs_chip_identity vs_chip_identities[] =3D {
	{
		.model =3D 0x8200,
		.revision =3D 0x5720,
		.customer_id =3D ~0U,
...

In vs_fill_chip_identity(), the search loop returns on the first match:

	for (i =3D 0; i < ARRAY_SIZE(vs_chip_identities); i++) {
		if (vs_chip_identities[i].model =3D=3D model &&
		    vs_chip_identities[i].revision =3D=3D revision &&
		    (vs_chip_identities[i].customer_id =3D=3D customer_id ||
		     vs_chip_identities[i].customer_id =3D=3D ~0U)) {
...

Because the ~0U entry comes first, wouldn't it shadow the subsequent specif=
ic=20
entries for the same model and revision (like customer_id 0x310 and 0x311),
preventing their specific formats from ever being applied?

>  		.max_cursor_size =3D 64,
>  		.formats =3D &vs_formats_no_yuv444,
>  	},
> +	{
> +		.model =3D 0x0,		/* DCUltraLite */
> +		.revision =3D 0x5560,
> +		.customer_id =3D 0x305,
> +
> +		.generation =3D VSDC_GEN_DC8000,
> +		.display_count =3D 1,
> +		.max_cursor_size =3D 32,
> +		.formats =3D &vs_formats_no_yuv444,
> +	},
>  };
> =20
>  int vs_fill_chip_identity(struct regmap *regs,

[Severity: High]
This isn't a bug introduced by this patch, but is it possible for an early
interrupt to cause a NULL pointer dereference during probe?

In vs_dc_probe() from vs_dc.c, the IRQ handler is registered before DRM
structures are initialized:

	ret =3D devm_request_irq(dev, irq, vs_dc_irq_handler, 0,
			       dev_name(dev), dc);
...
	ret =3D vs_drm_initialize(dc, pdev);

If an interrupt fires during this window, the handler seems to unconditiona=
lly
dereference dc->drm_dev which is allocated later in vs_drm_initialize():

vs_drm_handle_irq() in vs_drm.c:
...
			if (dc->drm_dev->crtcs[i])
				drm_crtc_handle_vblank(&dc->drm_dev->crtcs[i]->base);

Could this lead to a panic if the hardware has a pending interrupt before D=
RM
is ready?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260608023237.3050=
36-1-a0987203069@gmail.com?part=3D5
