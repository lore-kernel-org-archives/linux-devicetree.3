Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAC7C23C503
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 12:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783601864; cv=none; b=gbBONnInGytPVTK0PbgrdR4Krs057epIjlmkZTsCN8hyfefF2sfhEXA5ttorsnt0owcxtJuP0jVAmMhe2PxHnWGRvGgDA8K1BigOyypCTsh1p56SX5oMEXcwQMaEldNWA+u4auPBFhq569gDBTDh1wZYReTpC2rd7DHo5XCfAP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783601864; c=relaxed/simple;
	bh=ifesM6qNYl1HOSZOWyC8ob8xp3pM33FCRPoskANMdr8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=su7agaSM9XRX1+OEQW0neEuuDTHtlxIncUnS+97yhdJVZk7Eg13HghJNpwPS9ERxwzEm3+aIyxXCCEjVCh/icQ+mxCca972Os8fVsccv/eDToUie7iQxs+vP6sLkdC0sGOIFypEoS2IPrriEc7r6ZtkMs8tu8+Av+zgCNg6vD4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AKvrgckw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AKvrgckw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41F821F000E9;
	Thu,  9 Jul 2026 12:57:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783601862;
	bh=y5thcenuAGFrbTJ44sALWpfR/eihHupFIagGGzOY/j8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AKvrgckwyCRc837V2ktE0nYzM0ShEgGn2wCOPXa4WbYvcOKBPRKf5yUnqWhVXO55L
	 JHLLygF3Nbw1mwAAJBe/vmfdn9oz/tdUeZvKnGmjuOEbUpj4fBkvlOmDGTRHqVJMyr
	 Xd0f0JnJFWb2UaAm8LmRbNNObmn4PZJaxt1V4kMEP2HkK8CFJ8Ob0HeM6Bfy/l8j7Z
	 GfQOt3R1vfeSlTSBWGbSo+f8qkZwdt9IMxrjEG1xoFIeyGwPV8HCmD4oIOg/kl2UOL
	 0fDVmoxJHx+vqJNGE1wz8144l/cacVp4QXxTqaTlRS4a1+AfT/BQCudr5YZQBLrQSI
	 zMDYM3l5/4L9A==
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH 02/11] media: iris: Add hooks to initialize and tear
 down context banks
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vikash Garodia" <vikash.garodia@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260709-vpu_iommu_iova_handling-v1-2-72bb62cb2dfd@oss.qualcomm.com>
References: <20260709-vpu_iommu_iova_handling-v1-0-72bb62cb2dfd@oss.qualcomm.com>
 <20260709-vpu_iommu_iova_handling-v1-2-72bb62cb2dfd@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 09 Jul 2026 12:57:41 +0000
Message-Id: <20260709125742.41F821F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The `iris_core` structure is allocated with `devm_kzalloc` but ref=
erenced by video devices that can outlive the device unbind process.
- [High] Missing cancellation of the `sys_error_handler` delayed work in `i=
ris_remove`.
- [High] Hardware and queues are deinitialized before userspace access is r=
evoked in `iris_remove`.
--

--- Patch [2]: [RFC PATCH 02/11] media: iris: Add hooks to initialize and t=
ear down context banks ---
commit 746928806b2d799681dddbd3d539730ff7f9d31a
Author: Vikash Garodia <vikash.garodia@oss.qualcomm.com>

media: iris: Add hooks to initialize and tear down context banks

This commit adds platform hooks to set up and tear down context bank
devices. It updates the platform data structure to include these hooks
and modifies the probe and remove functions to call them.

> diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/medi=
a/platform/qcom/iris/iris_probe.c
> index c2dcb50a27824..0bce4fb1786bc 100644
> --- a/drivers/media/platform/qcom/iris/iris_probe.c
> +++ b/drivers/media/platform/qcom/iris/iris_probe.c
[ ... ]
> @@ -207,6 +221,8 @@ static void iris_remove(struct platform_device *pdev)
> =20
>  	v4l2_device_unregister(&core->v4l2_dev);
> =20
> +	iris_deinit_cb_devs(core);
> +

[Severity: High]
This is a pre-existing issue, but are the hardware and queues deinitialized
before userspace access is revoked?

iris_core_deinit(core) is called before video_unregister_device() (higher up
in this function). Because the video device is still registered, userspace
can concurrently call open().

iris_open() calls iris_core_init(), which sees IRIS_CORE_DEINIT and
re-allocates the DMA queues and powers on the hardware. When iris_remove()
completes, devres frees core, but the newly allocated DMA memory is leaked.

Furthermore, the successfully opened file descriptor will now operate on a
freed core structure, leading to a use-after-free.

[Severity: High]
This is a pre-existing issue, but should the sys_error_handler delayed work
be canceled here?

The delayed work sys_error_handler is scheduled by the HFI interrupt handler
when a system error occurs. Because the interrupt is devm-managed, it
remains active throughout iris_remove().

If the interrupt fires and schedules the work during unbind, the work will
execute asynchronously after iris_remove() completes and devres frees core.
The work handler iris_sys_error_handler() will then dereference the freed
core structure.

>  	mutex_destroy(&core->lock);
>  }
> =20
> @@ -273,10 +289,14 @@ static int iris_probe(struct platform_device *pdev)
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
>  	ret =3D iris_register_video_device(core, DECODER);

[Severity: High]
This is a pre-existing issue, but can the core structure outlive its
allocation?

The core structure is allocated with devm_kzalloc() earlier in probe, which
ties its lifetime to the device unbind process. However,
video_unregister_device() does not force-close active file descriptors.

If a user-space application holds the video node open while the driver is
unbound, devres will free the core structure. When the user application lat=
er
calls close(), V4L2 invokes iris_close():

drivers/media/platform/qcom/iris/iris_vidc.c:iris_close() {
    struct iris_inst *inst =3D iris_get_inst(filp);
    ...
    iris_remove_session(inst);
}

This path attempts to acquire core->lock on the already freed core object.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260709-vpu_iommu_=
iova_handling-v1-0-72bb62cb2dfd@oss.qualcomm.com?part=3D2
