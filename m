Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD53B38AC8C
	for <devicetree@vger.kernel.org>; Sat, 12 Sep 2026 07:03:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789196603; cv=none; b=TzzDmvIbHqzKcWOdq72xGmxTkc9MSBEy+dcS3q7y7fCgN7WP3A+SmoLvlMR5jrItfjRwg6DTJ2FUrhdYxwNpSxSyEqiIGOlfvOXMrQDlcuH5pnmv3mjKT154uEnYZR/L+xE+6JDBdDV5LQJgGCulXolzp3Gp+RvSTavwVjQWao8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789196603; c=relaxed/simple;
	bh=J71hwpUz/pvoOzkKJLCTZk46QVem5VJ/bkRl/c4P++E=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ebU7UMlpLC5iFSPMjtLP3POMrSIUzVvw4pp9tSms2uF0Wna0Sc36DVw3UNohSC36YjFxN0m4mr4Y8Mg99V3UnAvRdzeT/KGwDs73CFDTHGYDht/QlwM+RIYFRPbAp3xlEpIsj3KQybHt0r0L74GNug9/qesA/IMhLfNUs/tE70k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Jd6FQmy3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Jd6FQmy3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 696351F000FF;
	Sat, 12 Sep 2026 07:03:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789196601;
	bh=j9qx35s3quuS2FKYSk+NhNhqnpAllV5c/aAT/YY8D4o=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Jd6FQmy3121CB5OaF+Tsu6raPfsgYCdnQpdCF0R8S4vfJbEJERP39zsSYabymrN79
	 TMnvoWSOc5aqhNA08nbFB6PQbRnSXXutEHqXATI/Tv0FWTAYVtltTbps+GjpvlzhJl
	 v+G6cRLadMLkaFVMzxnJO+BdH0+9RNC6LgkoMDFtE1AwC8J5Hl1yI5xMgrGKXthy+r
	 974zRuPMe1n/oUz/kSpK1Kye6sG2A8XjekPfEQrmhZmqPKx3XGT/W1VgHcCnt9ouJB
	 RVtYO4yYMjKATG00wiF7lhJR59CSSMUTK7YbVlogw1eV+F7meaq+zv16Ma3GBdGscI
	 9e6z+a7UCqWMA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v12 01/14] accel/rocket: request the core clocks by name
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jiaxing Hu" <gahing@gahingwoo.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, robh@kernel.org
In-Reply-To: <20260912065053.1519165-2-gahing@gahingwoo.com>
References: <20260912065053.1519165-1-gahing@gahingwoo.com>
 <20260912065053.1519165-2-gahing@gahingwoo.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 12 Sep 2026 07:03:21 +0000
Message-Id: <20260912070321.696351F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Probe deferral, missing clocks, or device unbind leaks devres allo=
cations attached to the global `drm_dev`.
- [High] Incorrect core tracking logic in `rocket_remove` and `rocket_probe=
` causes active cores to be orphaned, unreachable, or silently overwritten =
upon partial unbind.
--

commit 4baecbc1d36cdb2c0321f080e879383800570708
Author: Igor Paunovic <royalnet026@gmail.com>

accel/rocket: request the core clocks by name

This patch fixes an issue where the NPU driver failed to set the .id members
of its clk_bulk_data struct before requesting them. Without IDs, clk_bulk_g=
et
defaulted to returning the first clock in the device tree for all entries. =
The
clocks are now properly requested by name as required by the DT binding.

> diff --git a/drivers/accel/rocket/rocket_core.c b/drivers/accel/rocket/ro=
cket_core.c
> index b3b2fa9ba645a..5dd260bacbff6 100644
> --- a/drivers/accel/rocket/rocket_core.c
> +++ b/drivers/accel/rocket/rocket_core.c
> @@ -28,6 +28,10 @@ int rocket_core_init(struct rocket_core *core)
>  	if (err)
>  		return dev_err_probe(dev, err, "failed to get resets for core %d\n", c=
ore->index);
> =20
> +	core->clks[0].id =3D "aclk";
> +	core->clks[1].id =3D "hclk";
> +	core->clks[2].id =3D "npu";
> +	core->clks[3].id =3D "pclk";
>  	err =3D devm_clk_bulk_get(dev, ARRAY_SIZE(core->clks), core->clks);
>  	if (err)
>  		return dev_err_probe(dev, err, "failed to get clocks for core %d\n", c=
ore->index);

[Severity: High]
This is a pre-existing issue, but does this failure path cause an unbounded
resource leak if devm_clk_bulk_get() defers probe or fails?

If rocket_core_init() fails here, rocket_probe() cleans up by calling
rocket_device_fini() and setting the global rdev pointer to NULL:

drivers/accel/rocket/rocket_drv.c:rocket_probe() {
    ...
	ret =3D rocket_core_init(&rdev->cores[core]);
	if (ret) {
		rdev->num_cores--;

		if (rdev->num_cores =3D=3D 0) {
			rocket_device_fini(rdev);
			rdev =3D NULL;
		}
	}
    ...
}

However, rdev and its cores array are allocated in rocket_device_init() usi=
ng
devm_* functions attached to drm_dev, which is a static global device:

drivers/accel/rocket/rocket_device.c:rocket_device_init() {
    ...
	rdev =3D devm_drm_dev_alloc(dev, rocket_drm_driver, struct rocket_device, =
ddev);
    ...
	rdev->cores =3D devm_kcalloc(dev, num_cores, sizeof(*rdev->cores), GFP_KER=
NEL);
    ...
}

Because drm_dev is global and persists across probe deferrals, its devres
list is never cleared. When rocket_probe() executes again, a new rdev is
allocated on the same global device, permanently leaking the previous one.

[Severity: High]
This is also a pre-existing issue, but if this failure path is hit (or if a
core is unbound via sysfs), does the core tracking logic in rocket_remove()
and rocket_probe() orphan the remaining active cores?

If a core other than the most-recently-probed one fails or unbinds,
rocket_remove() blindly decrements rdev->num_cores:

drivers/accel/rocket/rocket_drv.c:rocket_remove() {
    ...
	rocket_core_fini(&rdev->cores[core]);
	rdev->num_cores--;
    ...
}

Without shifting array elements to compact the list, active cores located
past the shrunken num_cores boundary can no longer be found for teardown or
power management:

drivers/accel/rocket/rocket_drv.c:find_core_for_dev() {
    ...
	for (unsigned int core =3D 0; core < rdev->num_cores; core++) {
		if (dev =3D=3D rdev->cores[core].dev)
			return core;
	}
    ...
}

This could cause power management callbacks to fail with -ENODEV while the
hardware is still running. Furthermore, if a new core binds later,
rocket_probe() will insert it at rdev->num_cores, which could silently
overwrite the live context of the stranded core.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260912065053.1519=
165-1-gahing@gahingwoo.com?part=3D1
