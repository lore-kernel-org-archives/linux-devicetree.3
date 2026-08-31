Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DF053C583A
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 09:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788167051; cv=none; b=aADFN9NbKJoKyDcCO32NGLIev37uDfVwuGE8BGqpd5vlawsiUTjHVdkvJaa3Qo9HvJxRuqrUt6Xw2ysm8eyslkIA5AcfSrU2n1sMEroCmVl/716tTUV5ZH851qY8TdXe6vq14NzOaY7+N+CFRzpu7tufsOyd+pgo2jjnsz9ZIXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788167051; c=relaxed/simple;
	bh=BmY6BHNkSB0EkQQqornh0/4pFZwF1Rc+NXq5JAh3F7o=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=kMKSzSEtL30pT/0qwv43B+/qiaZX6HWPbVOJlG+2a1Sr8ngA/eklNh98uj7Dqs+nfJ7qbyKgB3rYNGlpYLUVBVFo4cqlKWUmFImBK1J6hoAuEFlkgq8KLPrO5ZlAsu9cYOxZCqH8Jjzaj0IlT2oAnbu6y+0kU/CYXneP5ioTE1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B4COrrsK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B4COrrsK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DE9A1F000E9;
	Mon, 31 Aug 2026 09:04:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788167049;
	bh=wat78JNkyz0OER2vscKBUuvp5of4hCaGOp4QHI3cFzY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=B4COrrsKLCsidzfvcVD5spF9oOvGnfCMb+5XWnhMLz/4CTc2vanvOGSmispdKh1Xs
	 pAwSwGMxX+0F/eHV0dVJwWgPjsL7Y8SclPSow45W5gLwVldGx/2JW6Qxv2UGAQZrRh
	 unDz5qiRNAMberxLe0vcKvTUxrAX6S6pFRg8hLPMMce5raaO+Qg2ImC98xkAya3FMY
	 hYnKb+4gMiu+wtbcfzC68NOWXaeZIyvyd5A7S72owbiBmgQfLtSBKs0amIZ5Atcydl
	 xY5rbcdpMVYpFDueg01n1iA5HeRHIZAzFn3xlNEf35tgNod/bm88pkdx02hZSRzwCx
	 qtMZZ102Sq5Yg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v11 11/14] accel/rocket: select the per-core clock and
 reset counts from match data
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jiaxing Hu" <gahing@gahingwoo.com>
Cc: dri-devel@lists.freedesktop.org, conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260831081956.84871-12-gahing@gahingwoo.com>
References: <20260831081956.84871-1-gahing@gahingwoo.com>
 <20260831081956.84871-12-gahing@gahingwoo.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 31 Aug 2026 09:04:08 +0000
Message-Id: <20260831090409.2DE9A1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [High] Missing NULL check for the return value of of_device_get_match_dat=
a(), leading to a guaranteed kernel panic on manual sysfs bind.

Pre-existing issues:
- [High] The driver tracks cores in an array using `num_cores` as both the =
array length and the probe index, causing resource leaks and array slot ove=
rwrites on out-of-order unbinds.
- [High] Devres memory leak of `struct rocket_device` and its children on p=
robe deferral and manual unbind.
--

commit d68f29f9366dd1f885e0585ee67c1b358bda44b6
Author: Jiaxing Hu <gahing@gahingwoo.com>

accel/rocket: select the per-core clock and reset counts from match data

This patch introduces a soc_data structure to provide per-SoC clock and
reset counts from the device match data. This enables supporting the
RK3576, which has different counts compared to the RK3588.

> diff --git a/drivers/accel/rocket/rocket_core.c b/drivers/accel/rocket/ro=
cket_core.c
> index 5dd260bacbff6..b202d15816a39 100644
> --- a/drivers/accel/rocket/rocket_core.c
> +++ b/drivers/accel/rocket/rocket_core.c
> @@ -23,7 +23,7 @@ int rocket_core_init(struct rocket_core *core)
> =20
>  	core->resets[0].id =3D "srst_a";
>  	core->resets[1].id =3D "srst_h";
> -	err =3D devm_reset_control_bulk_get_exclusive(&pdev->dev, ARRAY_SIZE(co=
re->resets),
> +	err =3D devm_reset_control_bulk_get_exclusive(&pdev->dev, core->soc->nu=
m_resets,
>  						    core->resets);

[Severity: High]
Does this code crash with a NULL pointer dereference if a user with root
privileges force-binds the driver to a device using the sysfs bind interfac=
e?

The sysfs interface bypasses the device tree match, causing
of_device_get_match_data() (called in rocket_probe()) to return NULL, which
is then unconditionally dereferenced here as core->soc->num_resets.

[ ... ]

> diff --git a/drivers/accel/rocket/rocket_drv.c b/drivers/accel/rocket/roc=
ket_drv.c
> index 8bbbce594883e..6e7dc91c5faac 100644
> --- a/drivers/accel/rocket/rocket_drv.c
> +++ b/drivers/accel/rocket/rocket_drv.c
> @@ -176,6 +176,7 @@ static int rocket_probe(struct platform_device *pdev)
> =20
>  	rdev->cores[core].rdev =3D rdev;
>  	rdev->cores[core].dev =3D &pdev->dev;
> +	rdev->cores[core].soc =3D of_device_get_match_data(&pdev->dev);
>  	rdev->cores[core].index =3D core;
> =20
>  	rdev->num_cores++;

[Severity: High]
This is a pre-existing issue, but does decrementing rdev->num_cores during
an out-of-order unbind in rocket_remove() leak resources and corrupt memory?

If a system has multiple cores (e.g., RK3588 has 3 RKNN cores) and a user
manually unbinds a lower-indexed core via sysfs before a higher-indexed
core, rdev->num_cores is decremented.

When the higher-indexed core is later unbound, find_core_for_dev() fails to
find it because the search space core < rdev->num_cores shrank, skipping
its teardown. A subsequent bind will then overwrite the active core's slot
at rdev->cores[rdev->num_cores].

[Severity: High]
This is also a pre-existing issue, but does probe deferral or manual unbind
permanently leak the struct rocket_device and its children?

During the first core probe, rocket_device_init() allocates rdev using
devm_drm_dev_alloc() tied to the global drm_dev.

If the core probe subsequently fails (e.g., -EPROBE_DEFER) or is manually
unbound, rocket_device_fini() unregisters the DRM device and rdev is set to
NULL. However, the devres allocations remain bound to the long-lived drm_dev
and persist indefinitely, leaking memory on every cycle.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260831081956.8487=
1-1-gahing@gahingwoo.com?part=3D11
