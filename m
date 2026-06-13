Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB5B8377558
	for <devicetree@vger.kernel.org>; Sat, 13 Jun 2026 07:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781334677; cv=none; b=LuwbnA56tgUZQIYi3zralpKMnsyUB0v4QoMMWqrI7gGjXiiB0oB1/MeO3rLFPikLCPSiHJ3x+plyHjSo/fzcfT47YIAqz312Trux+KZbk27lEDA5GLkB6HFkPX+4+7jqA2oUgx2h9wWrq36Fqj78zPRxcee0fB7Pwtu7vzaJmog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781334677; c=relaxed/simple;
	bh=4GrBjvG/Vl2keGEwFBC1ny/2+uGkPwiPvG4aI72H7SA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=KMT9fxidauNpXdWKj7Yw0KvNZjXReBxn1LNe//m1BzSoLJP3KLgVzq2asxnQiQd2Kvf+qvxOt6RoFrZRETt4bjrfs4MytcgxIXUUfTyc6SMN6qlH96UhJ7ggSwwe8tfbNGwX1dvIvZrIMCtMPr0AVMe77GAz7jM2D9LgV3PrQDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CHOzglgA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CHOzglgA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C60751F00A3D;
	Sat, 13 Jun 2026 07:11:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781334674;
	bh=pa+lgsxKCd8yq3p2dCA5vGEyMBGTHsJTiiPLNRFutis=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CHOzglgAXMaPQQ340NvQylwUg0Uy1zjJPfyjKXCqz3s+UvbBD+oUFyp6N5s1oIAMU
	 UZD/9jq8Kjwz2jv3h5UH6i0V2KDdWtCQLG3M69kYQPqCAhrKAVN5fC6tThnDvQfGOA
	 kxXvocoa59E+Ax9sFr8ORO+tfNizqkHhgoSDl8av7EoY3bLF6Ko39/jxjCpYV80LHM
	 FC1I0qiLOwIpVNHC4uWG4/wv0ND8Lg3DuZZQ/Ew9Sa75gQtPCpRDzVVIMq60h+hKPA
	 hxZ3QQ4fk4ihdALSe5Q1PWGzUn1rcEc5hQibLkAr43wf1UOAov/f8NT6VqhZC3sLsA
	 cR+2sVyACfWTA==
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH v4 6/9] dt-bindings: npu: rockchip,rk3588-rknn-core:
 Add RK3568
Reply-To: sashiko-reviews@lists.linux.dev
To: MidG971 <midgy971@gmail.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org
In-Reply-To: <20260613070116.438906-7-midgy971@gmail.com>
References: <20260613070116.438906-7-midgy971@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 13 Jun 2026 07:11:13 +0000
Message-Id: <20260613071113.C60751F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:

Pre-existing issues:
- [Critical] Double free of `rjob->tasks` leading to memory corruption trig=
gerable from userspace.
- [Critical] Unconditional dereference of a NULL `job->domain` triggering a=
 kernel panic on early job submission failure.
- [High] Permanent PM runtime reference count leak when `iommu_attach_group=
()` fails.
- [High] Zero-initialized clock IDs cause the framework to fetch the same c=
lock repeatedly, violating hardware constraints.
- [Medium] Premature DRM device registration exposes an incomplete state to=
 userspace.
--

commit d0d76b931ac773e3e176353cdb3ac9c590c43dc3
Author: Midgy BALON <midgy971@gmail.com>

dt-bindings: npu: rockchip, rk3588-rknn-core: Add RK3568
   =20
The RK3568 carries a single core of the same NVDLA-derived NPU IP as the
RK3588.  Add its compatible.

> diff --git a/Documentation/devicetree/bindings/npu/rockchip,rk3588-rknn-c=
ore.yaml b/Documentation/devicetree/bindings/npu/rockchip,rk3588-rknn-core.=
yaml
> index caca2a4903cd1..e0b948ac47d45 100644
> --- a/Documentation/devicetree/bindings/npu/rockchip,rk3588-rknn-core.yaml
> +++ b/Documentation/devicetree/bindings/npu/rockchip,rk3588-rknn-core.yaml
[ ... ]

drivers/accel/rocket/rocket_device.c:rocket_device_init() {
    ...
    err =3D drm_dev_register(ddev, 0);
    ...
}

drivers/accel/rocket/rocket_drv.c:rocket_probe() {
    ...
    rdev->cores[core].dev =3D &pdev->dev;
    ...
}

[Severity: Medium]
This is a pre-existing issue, but does this premature registration expose an
incomplete state to userspace?

drm_dev_register() is called in rocket_device_init() before rocket_probe()
assigns rdev->cores[0].dev.

As a result, the device node is briefly visible to userspace while its core
structures remain partially uninitialized.

If userspace attempts to open the DRM device during this window, rocket_ope=
n()
passes the NULL rdev->cores[0].dev to rocket_iommu_domain_create().

While the IOMMU framework safely catches the NULL device and returns -ENODE=
V,
this still causes a spurious open() failure for userspace applications rely=
ing
on udev events.


drivers/accel/rocket/rocket_job.c:rocket_job_run() {
    ...
	ret =3D pm_runtime_get_sync(core->dev);
	if (ret < 0)
		return fence;
    ...
		ret =3D iommu_attach_group(job->domain->domain, core->iommu_group);
		if (ret < 0)
			return fence;
    ...
}

[Severity: High]
This is a pre-existing issue, but does this cause a permanent PM runtime
reference count leak when iommu_attach_group() fails?

In rocket_job_run(), pm_runtime_get_sync() increments the PM usage count to=
 wake
up the NPU.

If the subsequent iommu_attach_group() fails, the driver returns the alloca=
ted
fence and exits early without calling pm_runtime_put().

Because the driver exits before assigning core->in_flight_job, the subseque=
nt
timeout handler rocket_reset() will also skip the manual
pm_runtime_put_noidle().

This causes a permanent PM runtime reference count leak, preventing the NPU
hardware from ever entering runtime suspend.


drivers/accel/rocket/rocket_core.c:rocket_core_init() {
    ...
    err =3D devm_clk_bulk_get(dev, ARRAY_SIZE(core->clks), core->clks);
    ...
}

[Severity: High]
This is a pre-existing issue, but do these zero-initialized clock IDs cause=
 the
framework to fetch the same clock repeatedly?

In rocket_core_init(), the driver declares an array of clk_bulk_data but ne=
ver
initializes the .id fields, leaving them implicitly NULL.

When devm_clk_bulk_get() is called, the clock framework handles the NULL ID=
s by
returning the first clock defined in the device tree for the device on all =
four
iterations.

Consequently, rocket_device_runtime_resume() enables the exact same clock f=
our
times, while the remaining required clocks are left disabled.

This violates physical hardware state requirements and causes unclocked NPU
register accesses.


drivers/accel/rocket/rocket_job.c:rocket_copy_tasks() {
    ...
fail:
	kvfree(rjob->tasks);
	return ret;
}

drivers/accel/rocket/rocket_job.c:rocket_job_cleanup() {
    ...
	kvfree(job->tasks);
    ...
}

[Severity: Critical]
This is a pre-existing issue, but does this lead to a double free of rjob->=
tasks
that can be triggered from userspace?

In rocket_copy_tasks(), if copy_from_user() fails, kvfree(rjob->tasks) is
called, but the pointer rjob->tasks is not cleared.

The function returns an error to rocket_ioctl_submit_job(), which jumps to
out_cleanup_job and invokes rocket_job_put().

When the reference count drops, rocket_job_cleanup() is executed,
unconditionally calling kvfree(job->tasks) again on the already freed memory
block.

Since the IOCTL input is fully controlled by userspace, an unprivileged att=
acker
can trigger a double free by submitting an invalid task pointer.


drivers/accel/rocket/rocket_job.c:rocket_ioctl_submit_job() {
    ...
	rjob =3D kzalloc_obj(*rjob);
    ...
	ret =3D rocket_copy_tasks(dev, file, job, rjob);
	if (ret)
		goto out_cleanup_job;
    ...
}

drivers/accel/rocket/rocket_drv.c:rocket_iommu_domain_put() {
    ...
    kref_put(&domain->kref, rocket_iommu_domain_destroy);
    ...
}

[Severity: Critical]
This is a pre-existing issue, but does this unconditionally dereference a N=
ULL
job->domain, triggering a kernel panic on early job submission failure?

In rocket_ioctl_submit_job(), rjob is allocated via kzalloc_obj(), leaving
rjob->domain initialized to NULL.

If a failure occurs before the domain is assigned, such as an invalid task
pointer in rocket_copy_tasks() or a bad BO handle in drm_gem_objects_lookup=
(),
the driver jumps to the cleanup path.

The cleanup handler, rocket_job_cleanup(), unconditionally passes the NULL
domain to rocket_iommu_domain_put(), which invokes kref_put(&domain->kref, =
...).

Computing &domain->kref yields an offset address, and refcount_dec_and_test=
()
immediately dereferences this invalid address, resulting in a kernel panic =
that
can be triggered by unprivileged userspace.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260613070116.4389=
06-1-midgy971@gmail.com?part=3D6
