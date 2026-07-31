Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60D984457B2
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 18:36:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785522999; cv=none; b=IVHDd1tS9R2S97/oS/yEwHczdXAxC9Z9OnrWbx190xulKYXG2Mqrk/0wWDFg4cfk3ZyNGp0ZhfWAieqOKG9IXnTpFqSV6dQy0Uo8uqR6CgDrY+KLPrTzaKhR+ekX5W09OvJaXuLI91uE9lvj0xngYxks9n83EMUBR/FyGXlmIPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785522999; c=relaxed/simple;
	bh=k2TtkHRpO3urTcdUk0rnJP1AYaJWCvETJ3Pcsu34J8I=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=EJv7RbBzQcSysz5jQKRpuwTrMfK2736T5rJoPpkLR7ycvzmk0ubf9BwTyPcxU3oF5pWXkByEHx9IZhmWBjsdvCZlKipEBuYJTMiMzFmYd/JvxmVe8O4IkaWYv0ZGBAXCDl6g9luJcHHvEfwDYUDSCRVUtRTvcQZyJQmjRhZ84jc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Jmm/CE1R; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Jmm/CE1R"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A02401F00AC4;
	Fri, 31 Jul 2026 18:36:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785522998;
	bh=LwVNgn/eIZEKU4M7POpSaukuiMGhhVUSK10KXTuVgoU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Jmm/CE1RVicKqwcUmYIkcN11nPT0XdIOol9+gh6+yG9KpZGzAq42KI+25+ixt8Kjm
	 XwZ5AbimA72rm+LZgZD0/OnWKAJg6aUScVAUXNQLQbVWd5nwm6S4D/zABZX2S1RBc5
	 ZJxhGTWV3fMU2e7ycRwh24qysM8NPO1jt37qk2jeAb2oLaa0nrjovyawwMxV1FGIUe
	 Z1cmAHCLjVEN7Xnh6RHy2diSP/eN1XEjPyx8iSuSp1rHVi6LQtXojpSoUCYua79vGk
	 5hk9bnlTdIcuvTStkyHTeVlzU+R6DmYLooOVamyvDxbRDxUQopCAsbAx9m4YTThPLI
	 YRDIy+O5qpmAA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 03/12] media: iris: Add platform hooks for context
 bank device setup
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vikash Garodia" <vikash.garodia@oss.qualcomm.com>
Cc: media-ci@linuxtv.org, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260731-vpu_iommu_iova_handling-v2-3-da52b5228dbd@oss.qualcomm.com>
References: <20260731-vpu_iommu_iova_handling-v2-0-da52b5228dbd@oss.qualcomm.com>
 <20260731-vpu_iommu_iova_handling-v2-3-da52b5228dbd@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 31 Jul 2026 18:36:37 +0000
Message-Id: <20260731183637.A02401F00AC4@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

Pre-existing issues:
- [High] V4L2 state object `core` is allocated with `devm_kzalloc`, leading=
 to UAF if file descriptors are kept open after device unbind.
- [High] Hardware deinitialization occurs before video devices are unregist=
ered, allowing a race with new `open()` calls.
- [High] Video device exposed to userspace before driver data is fully init=
ialized, causing a TOCTOU race condition.
- [High] The `sys_error_handler` delayed work is never explicitly cancelled=
 during module removal, leading to a potential Use-After-Free.
--

--- Patch [3]: [PATCH v2 03/12] media: iris: Add platform hooks for context=
 bank device setup ---
commit a925a8b5dc58a6c33e49594b0c98c79bb206b111
Author: Vikash Garodia <vikash.garodia@oss.qualcomm.com>

media: iris: Add platform hooks for context bank device setup
   =20
The VPU issues DMA through several SMMU streams, and the hardware does
not give every stream the same addressable range. The non-pixel stream
is restricted to use 0-600MB of IOVA space, while the pixel stream can
address the full range. Keeping each stream inside its own range needs a
separate IOMMU domain per stream, which in turn needs a separate struct
device per stream, since the IOMMU core attaches a domain per device.

> diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/medi=
a/platform/qcom/iris/iris_probe.c
> index c2dcb50a27824..2594f5a67378a 100644
> --- a/drivers/media/platform/qcom/iris/iris_probe.c
> +++ b/drivers/media/platform/qcom/iris/iris_probe.c

[ ... ]

> @@ -150,6 +151,20 @@ static int iris_init_resources(struct iris_core *cor=
e)
>  	return iris_init_resets(core);
>  }
> =20
> +static int iris_init_cb_devs(struct iris_core *core)
> +{
> +	if (core->iris_platform_data->vpu_ops->init_cb_devs)
> +		return core->iris_platform_data->vpu_ops->init_cb_devs(core);
> +
> +	return 0;
> +}
> +
> +static void iris_deinit_cb_devs(struct iris_core *core)
> +{
> +	if (core->iris_platform_data->vpu_ops->deinit_cb_devs)
> +		core->iris_platform_data->vpu_ops->deinit_cb_devs(core);
> +}
> +
>  static int iris_register_video_device(struct iris_core *core, enum domai=
n_type type)
>  {

[Severity: High]
This isn't a bug introduced by this patch, but is it possible for userspace
to open the device before the driver data is fully initialized?

Looking at iris_register_video_device(), video_register_device() is called
before video_set_drvdata():

	ret =3D video_register_device(vdev, VFL_TYPE_VIDEO, -1);
	if (ret)
		goto err_vdev_release;

	video_set_drvdata(vdev, core);

If a rapid concurrent open() happens from userspace, iris_open() will be
invoked. It will call video_drvdata(filp) which returns NULL, and then
attempt pm_runtime_resume_and_get(core->dev), resulting in a NULL pointer
dereference.

[ ... ]

> @@ -207,6 +222,8 @@ static void iris_remove(struct platform_device *pdev)
> =20
>  	v4l2_device_unregister(&core->v4l2_dev);
> =20
> +	iris_deinit_cb_devs(core);
> +
>  	mutex_destroy(&core->lock);
>  }

[Severity: High]
This is a pre-existing issue, but does this teardown sequence leave a race
condition with new open() calls?

In iris_remove(), the driver unloads firmware and powers off the VPU via
iris_core_deinit(core) before video_unregister_device() is called.

If a concurrent open() happens before the video devices are unregistered,
iris_open() will call iris_core_init(core), powering the hardware back on.
Once iris_remove() finishes and returns, the device is unbound and core is
freed, but the hardware is erroneously left powered on, which can corrupt
the system state.

[Severity: High]
This is another pre-existing issue, but can the sys_error_handler delayed
work execute after the device is unbound?

The delayed work sys_error_handler is scheduled on HFI/hardware errors, but
it is never explicitly cancelled during module removal.

If a fatal hardware error triggers an interrupt just before or during
unbind, the work could be scheduled. When iris_remove() finishes, core is
freed by the devres subsystem. The delayed work will then run,
dereferencing the freed memory. Is a call to cancel_delayed_work_sync()
needed here?

[ ... ]

> @@ -273,10 +290,14 @@ static int iris_probe(struct platform_device *pdev)
> =20
>  	iris_session_init_caps(core);
> =20
> -	ret =3D v4l2_device_register(dev, &core->v4l2_dev);
> +	ret =3D iris_init_cb_devs(core);
>  	if (ret)
>  		return ret;
> =20
> +	ret =3D v4l2_device_register(dev, &core->v4l2_dev);
> +	if (ret)
> +		goto err_cb_deinit;
> +

[Severity: High]
This is a pre-existing issue, but is the V4L2 state object core safely
managed if file descriptors are kept open after device unbind?

The core structure is allocated with devm_kzalloc() in iris_probe(),
meaning it will be automatically freed when the device is unbound via
sysfs.

However, if a userspace process currently holds an open file descriptor,
the character device stays alive. Calling close() or an ioctl() later will
invoke driver callbacks (like iris_close()) which dereference inst->core,
resulting in a use-after-free crash since the memory was already freed by
device resource management.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260731-vpu_iommu_=
iova_handling-v2-0-da52b5228dbd@oss.qualcomm.com?part=3D3
