Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88ACB42315B
	for <devicetree@vger.kernel.org>; Thu,  4 Jun 2026 14:05:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780581918; cv=none; b=Dhd5zgviniYnrzDu3g5tJ37MMnu55+LCWxW0HW1F1PkjnY8E0qCVo3FeV5jKKAY44pjbz5Jl/aASfXVsQlaDVmkZlDJojpLGme8IvskboGn73aPjcG6qd07RL2Y1mexdx41v0aJFprGkDPnWpSzVrW0+hRtjoTzkDNk5+z24TCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780581918; c=relaxed/simple;
	bh=bAnzLhkiKMkeDBVab+PKNbNfUINgsorHnpnAz9SLrgA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=rLjkw1MYFyKCPKassEeI64ZbMVKQTk0krGuqemy5RpEwOmN85+x+s5Q8iZm1yvQOAbYP6hp74wKoWgHxVNCRFQSnoZ92yJL3ySjWr83F9YOxESmEUwlCrjmx8NBodtHQuUCCYaV42tVcAu9LGmjZnuu7xUFqjqIvIdJsnpJ/QJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Mc9vFNd3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Mc9vFNd3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37F6A1F00893;
	Thu,  4 Jun 2026 14:05:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780581917;
	bh=HyzMEB4wLyTrHr1jJUQMBaTFdU/TIo9sGNDdqOdOpuk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Mc9vFNd3EJLvL73JDHpEFbGZuAOznrX9VYeOzdzB8ASTIX+Vo5puPOamSGzYVAZJ1
	 CoN6Dju5/OAz4VzYsE0uRCT5F9irfUvsjPb64ajChisd0JaceMGTb3kyjgctxfz9DR
	 8aWrwV6M4CT25L1Rh8abGaXzRGBNglEU/AXn0kJTYZpXtqaAnD6z0GUNqxPzGkJ0JW
	 bgM/9MqtiMVMun8TjM5qLktElyQYrmPQhKty/glRJ+UuVA0ZqD5f2d946VSa+vJoS3
	 5J+C61VcOu1eLpNRZAI7QOdyRE5GHsjfdex88nSmQ7JSQ2MxAlo429yWqwoJydTuRT
	 P0//uSiyJYcOw==
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH v3 3/9] accel: rocket: Add RK3568 SoC support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Midgy BALON" <midgy971@gmail.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, dri-devel@lists.freedesktop.org
In-Reply-To: <20260604135255.62682-4-midgy971@gmail.com>
References: <20260604135255.62682-4-midgy971@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 04 Jun 2026 14:05:15 +0000
Message-Id: <20260604140516.37F6A1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [High] The error path for `noc_init` failure in `rocket_core_init` calls =
`rocket_job_fini()` instead of `rocket_core_fini()`, leaking an IOMMU group=
 reference and leaving PM runtime active.

Pre-existing issues:
- [High] The `core->clks` array lacks initialization of its `id` fields bef=
ore being passed to `devm_clk_bulk_get()`, causing the driver to configure =
the rate on the wrong clock in `rk3568_noc_init()`.
- [High] Failed probe leaks `struct rocket_device` and associated DRM struc=
tures because they are devm-allocated against a global persistent platform =
device.
--

commit 60f18710aa215157b0b6ac91ed70f00cc049eb2c
Author: Midgy BALON <midgy971@gmail.com>

accel: rocket: Add RK3568 SoC support

The RK3568 has a single core of the same NVDLA-derived NPU IP as the
RK3588, with a 32-bit AXI master.  Unlike the RK3588 it must be powered
on and de-idled through the PMU, and its PVTPLL clock started via SCMI,
before the NPU is reachable.  Add rk3568_soc_data with an noc_init
callback performing this bring-up.

> diff --git a/drivers/accel/rocket/rocket_core.c b/drivers/accel/rocket/ro=
cket_core.c
> index 09c445af7de73..a8de876365873 100644
> --- a/drivers/accel/rocket/rocket_core.c
> +++ b/drivers/accel/rocket/rocket_core.c
> @@ -88,6 +88,15 @@ int rocket_core_init(struct rocket_core *core)
>  		return err;
>  	}
> =20
> +	if (core->soc_data->noc_init) {
> +		err =3D core->soc_data->noc_init(core);
> +		if (err) {
> +			pm_runtime_put_sync(dev);
> +			rocket_job_fini(core);

[Severity: High]
If noc_init() fails, should this call rocket_core_fini() instead of
rocket_job_fini()?

Calling rocket_job_fini() here bypasses the rest of the teardown that
rocket_core_fini() handles. This leaves the PM runtime enabled and
autosuspend incorrectly configured, and skips iommu_group_put() which
leaks the IOMMU group reference.

> +			return err;
> +		}
> +	}
> +
>  	version =3D rocket_pc_readl(core, VERSION);

[ ... ]

> diff --git a/drivers/accel/rocket/rocket_drv.c b/drivers/accel/rocket/roc=
ket_drv.c
> index c18840e5aff76..5a72d0b5f4dff 100644
> --- a/drivers/accel/rocket/rocket_drv.c
> +++ b/drivers/accel/rocket/rocket_drv.c

[ ... ]

> @@ -217,12 +219,63 @@ static void rocket_remove(struct platform_device *p=
dev)
>  	}
>  }
> =20
> +/*
> + * On RK3568 the NPU NOC bus is gated and idle out of reset and must be
> + * powered on and de-idled through the PMU before the NPU is reachable. =
 PMU
> + * registers use a write-mask protocol: the upper 16 bits enable writes =
to the
> + * matching lower 16 bits.
> + *
> + * The NPU's high-speed clock is a PVTPLL managed by TF-A via SCMI and m=
ust be
> + * running before the NOC acknowledges the de-idle request.  Force a rea=
l SCMI
> + * rate change (an intermediate rate defeats the clock framework's
> + * unchanged-rate shortcut) now that the power domain is on and clocks e=
nabled.
> + */
> +#define ROCKET_RK3568_SCMI_CLK	2
> +
> +static int rk3568_noc_init(struct rocket_core *core)
> +{
> +	struct regmap *pmu;
> +	unsigned int val;
> +	int ret;
> +
> +	clk_set_rate(core->clks[ROCKET_RK3568_SCMI_CLK].clk, 600000000UL);
> +	clk_set_rate(core->clks[ROCKET_RK3568_SCMI_CLK].clk, 1000000000UL);

[Severity: High]
This is a pre-existing issue, but does core->clks actually contain the corr=
ect
SCMI clock here?

Looking at rocket_core_init(), devm_clk_bulk_get() is called without first
initializing the .id fields of the core->clks array:

drivers/accel/rocket/rocket_core.c:rocket_core_init() {
    ...
    err =3D devm_clk_bulk_get(dev, ARRAY_SIZE(core->clks), core->clks);
    ...
}

Because the IDs are uninitialized (NULL), clk_get() will repeatedly return =
the
very first clock of the device. Does this mean these clk_set_rate() calls a=
re
erroneously forcing a rate change on the wrong clock while leaving the PVTP=
LL
unconfigured?

[ ... ]

[Severity: High]
This is a pre-existing issue, but could probe failures (such as noc_init
returning an error) cause an unbounded memory leak?

In rocket_probe(), the global drm_dev is passed to rocket_device_init():

drivers/accel/rocket/rocket_drv.c:rocket_probe() {
    ...
    rdev =3D rocket_device_init(drm_dev, &rocket_drm_driver, soc_data);
    ...
}

Inside rocket_device_init(), memory is allocated against this global
device's devres list:

drivers/accel/rocket/rocket_device.c:rocket_device_init() {
    ...
    rdev =3D devm_drm_dev_alloc(dev, rocket_drm_driver, struct rocket_devic=
e, ddev);
    ...
}

If probe fails, rocket_probe() calls rocket_device_fini() to unregister
the DRM device. However, it does not free the devm-allocated memory
because the allocations are tied to the global drm_dev that persists until
module unload. Does this mean every deferred probe or bind/unbind action
allocates new memory on the global devres list?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260604135255.6268=
2-1-midgy971@gmail.com?part=3D3
