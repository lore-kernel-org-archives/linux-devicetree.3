Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 298C42DB79F
	for <devicetree@vger.kernel.org>; Sun, 26 Jul 2026 06:05:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785045944; cv=none; b=AHFhJLPBqAIur5X6A4k/ISahWJpHpVUumxt+IreIN0b+DQ6t20AmSiM9dFvLLZRQVlK/Ke0EIkRSvLUy7VsA1bPE9eM0qUVsylp+aRRxMnfLcMV1azjvvDp1pit0Y0GLP/DpRrkReSLSK42ZTX3xlVArS2zPe7YKq8tknFZDsnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785045944; c=relaxed/simple;
	bh=/IkxRPrG2WwFv0UPs539QpG61ersp19e49AXKclvR8M=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=A4qSBc4c9ORL8FtoPHpZRIYsUc8+dcYdApZQoAday7BL2to6mFD7STPomMLtkGrw0OrW8B/x+47rNgSXAL3822YK3xvES43l5/eH7GzLJjyqsHrEZ1R3RkczaamSlsw5JDWZWL6hixkrGpqaefMskM8fzdb/ZUrCCgTNBq7zGPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WgGFcu0j; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WgGFcu0j"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 712191F000E9;
	Sun, 26 Jul 2026 06:05:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785045942;
	bh=qNxDKs4IyoVOCwnQ67UAtAvYZoEcxe7+LeCLj0ZkDy8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WgGFcu0jjMafY91GGeIDcnhNZW4lmu/1y7UYV7Qtwigw+nCvD1k08VILKoJ+6iNtE
	 TPblpSlfeledJmvWEF0Z6V/y0V8SySGCEW7+mzy35fniW8kqTisiI2pbDbakz+FIPg
	 C1yVOKrQX3BMG8C8yxBoINaBd5p4pciRCQQ9JoBTQfk7owg1kajTgcO1fTkvVI4PMd
	 f1g+6wzVchzeLLtZu1cTgbd7zp/yeD5iP8loKnz7ajmUn5wl4r/EaM4pK3ihdBJqwH
	 3w5+gRNzaJ4XuPMVnXV69HbPsbbAfX8BgR8nueTZmsg77bPrSSwKWbrGaXxe0jcjru
	 O7FlEMMsriovQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 05/14] media: iris: Skip DMA mask setting to core
 device when IOMMU is not mapped
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vishnu Reddy" <busanna.reddy@oss.qualcomm.com>
Cc: media-ci@linuxtv.org, conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260726-glymur-v10-5-de451559e88b@oss.qualcomm.com>
References: <20260726-glymur-v10-0-de451559e88b@oss.qualcomm.com>
 <20260726-glymur-v10-5-de451559e88b@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 26 Jul 2026 06:05:42 +0000
Message-Id: <20260726060542.712191F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

New issues:
- [High] Incorrect DMA mask configuration on legacy platforms when IOMMU is=
 missing or disabled, leading to DMA allocations outside hardware limits.

Pre-existing issues:
- [High] Use-After-Free in delayed work `sys_error_handler` due to missing =
cancellation during device removal.
- [High] Use-After-Free and locking freed memory in V4L2 file operations du=
e to `core` context being tied to `devres` instead of being reference-count=
ed.
- [High] Race condition exposing video device nodes before drvdata and crit=
ical setup are complete, leading to NULL pointer dereferences or Use-After-=
Free.
--

--- Patch [5]: [PATCH v10 05/14] media: iris: Skip DMA mask setting to core=
 device when IOMMU is not mapped ---
commit 618ea537a61c437b82cec491d04d1126e0ba8f26
Author: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Subject: media: iris: Skip DMA mask setting to core device when IOMMU is no=
t mapped

This patch modifies the probe function to only set the DMA mask on the core
device if an IOMMU is mapped. It aims to avoid unnecessary DMA mask setup w=
hen
IOMMU streams are handled by subnodes rather than the parent device.

> diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/medi=
a/platform/qcom/iris/iris_probe.c
> index 2594f5a67378a..c40c4ec44e83e 100644
> --- a/drivers/media/platform/qcom/iris/iris_probe.c
> +++ b/drivers/media/platform/qcom/iris/iris_probe.c
> @@ -310,9 +310,11 @@ static int iris_probe(struct platform_device *pdev)
> =20
>  	dma_mask =3D core->iris_platform_data->dma_mask;
> =20
> -	ret =3D dma_set_mask_and_coherent(dev, dma_mask);
> -	if (ret)
> -		goto err_vdev_unreg_enc;
> +	if (device_iommu_mapped(dev)) {
> +		ret =3D dma_set_mask_and_coherent(dev, dma_mask);
> +		if (ret)
> +			goto err_vdev_unreg_enc;
> +	}

[Severity: High]
Does this skip the DMA mask configuration on legacy platforms if the IOMMU =
is
simply disabled or missing (e.g., via the iommu=3Doff kernel parameter)?

If device_iommu_mapped() is false, the required hardware DMA mask is skippe=
d.
However, on legacy platforms, core->np_dev is NULL, so core->dev is still
used as a fallback for DMA allocations:

drivers/media/platform/qcom/iris/iris_hfi_queue.c:iris_hfi_queues_init() {
    ...
	struct device *dev =3D core->np_dev ? core->np_dev : core->dev;
	...
	core->iface_q_table_vaddr =3D dma_alloc_attrs(dev, queue_size,
    ...
}

Without the mask being set, dma_alloc_attrs() will use the platform's defau=
lt
32-bit mask. Can this allow allocations in physical memory regions the
hardware cannot address, leading to DMA corruption or hardware faults?

> =20
>  	dma_set_max_seg_size(&pdev->dev, DMA_BIT_MASK(32));
>  	dma_set_seg_boundary(&pdev->dev, DMA_BIT_MASK(32));

[Severity: High]
This isn't a bug introduced by this patch, but does iris_remove() fail to=20
cancel the sys_error_handler delayed work?

drivers/media/platform/qcom/iris/iris_probe.c:iris_remove() {
	...
	iris_core_deinit(core);

	video_unregister_device(core->vdev_dec);
	video_unregister_device(core->vdev_enc);

	v4l2_device_unregister(&core->v4l2_dev);

	iris_deinit_cb_devs(core);

	mutex_destroy(&core->lock);
}

The driver initializes a delayed work sys_error_handler which can be schedu=
led
dynamically. During device unbind, iris_remove() is called but does not
explicitly cancel this work.

Because the iris_core structure is allocated with devm_kzalloc(), it is
automatically freed by devres when iris_remove() returns.

If the delayed work fires after the device is unbound, it accesses the freed
core structure:

drivers/media/platform/qcom/iris/iris_probe.c:iris_sys_error_handler() {
	struct iris_core *core =3D
			container_of(work, struct iris_core, sys_error_handler.work);

	iris_core_deinit(core);
	...
}

Can this lead to a Use-After-Free if hardware errors race with unbind event=
s?

[Severity: High]
This isn't a bug introduced by this patch, but is the driver context
vulnerable to a Use-After-Free during V4L2 file release?

Because core is allocated via devm_kzalloc() in probe, its lifetime is tied
to the device bind cycle. If a userspace process holds the file descriptor
open and the driver is unbound, iris_remove() returns and devres frees the
core structure.

When the user later closes the file, the VFS calls iris_close():

drivers/media/platform/qcom/iris/iris_vidc.c:iris_close() {
    ...
	iris_remove_session(inst);
    ...
}

Which in turn accesses the lock inside the freed core structure:

drivers/media/platform/qcom/iris/iris_vidc.c:iris_remove_session() {
	struct iris_core *core =3D inst->core;
	...
	mutex_lock(&core->lock);
	...
}

Should the core structure be reference-counted rather than tied to devres to
prevent this from being triggered by unprivileged userspace holding an open
file descriptor?

[Severity: High]
This isn't a bug introduced by this patch, but does
iris_register_video_device() expose the video device node to userspace befo=
re
drvdata is fully initialized?

drivers/media/platform/qcom/iris/iris_probe.c:iris_register_video_device() {
    ...
	ret =3D video_register_device(vdev, VFL_TYPE_VIDEO, -1);
	if (ret)
		goto err_vdev_release;

	video_set_drvdata(vdev, core);
    ...
}

video_register_device() immediately exposes the /dev/videoX node to userspa=
ce.
If a concurrent open() wins the race, it will read a NULL core:

drivers/media/platform/qcom/iris/iris_vidc.c:iris_open() {
	struct iris_core *core =3D video_drvdata(filp);
    ...
	ret =3D pm_runtime_resume_and_get(core->dev);
    ...
}

Can this lead to a NULL pointer dereference?

Additionally, since iris_probe() continues with fallible setup operations
(like setting the DMA mask) after registering the video device, if probe fa=
ils
later, a successful concurrent open() will retain a reference to the freed
core, leading to a Use-After-Free.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260726-glymur-v10=
-0-de451559e88b@oss.qualcomm.com?part=3D5
