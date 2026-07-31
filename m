Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4274D47A0D4
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 18:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785523432; cv=none; b=Om1ahBjVZqI9msv/EWzSpwmwBsYqwbx1UTkbJHRArKu4D4rNjRq0Vv6bFevWj08EJSg9WTjo0ueUlkqn1aTepF11SuHv21K4n6wNreS6jm4PhOwnVh8tm+wVPNI2AC667iIdx9iTY+ZsUGrbipN0hHti42Ovuz4C4xg7A5KTcLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785523432; c=relaxed/simple;
	bh=nrwQH2kvBmzxSvSNBmzwHzhfvbe6lZZDoxtl22EBbN0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=WmArcb0FZPLGCxvoMxZO2KwGzLqyFbappsaopPM3FdDC/UlSUiMLl8Rx1d8aEP62MQL+HSQKpWsKCDi0fKU3Htz8RZ4VDeooY+AzSwh5+hO0AbjmSJXw06SaJy7YFA4/KNYOGbKWKTVwYV9NKejGq5TVBchk0MBr3IYkpP00ePI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RzTih+y2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RzTih+y2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7ADE1F00AC4;
	Fri, 31 Jul 2026 18:43:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785523429;
	bh=DJm7usT5xW5aQxaB6/8MOzRk859amRXmlDADFIa0GpI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RzTih+y207RmvfpZg8dIxnstVAb/8KzqCEih6IBVosSwYt5N9Uz0+2e/xrecbkmJz
	 5bDe0PP/DeJUULE8dFSKQniRmOcJgRX6DX+pNCW2tbG5S9S+bPl9qgUgoLoM5sLmUv
	 EBYwDl0FzNeoIkb3PJHJawqftnWNYCdemevnzuGCnwqlvpfJHC+w7xaUUVUPlzoiO5
	 Ekdf3mrkTkfprie0T6JoclppZVmu4JeS81b2ogJeWgRHHaJCBdvri21gBzN1j8Ucx4
	 Nw+hIeCsAeQcVSZETMzOSej5gYR/nXyjIcqexDVyPOGL9Nrfe9fAjsx/7mehsw5J6l
	 xdHfqe6LeHKaw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 06/12] media: iris: Skip DMA mask setup when the core
 device has no IOMMU
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vikash Garodia" <vikash.garodia@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20260731-vpu_iommu_iova_handling-v2-6-da52b5228dbd@oss.qualcomm.com>
References: <20260731-vpu_iommu_iova_handling-v2-0-da52b5228dbd@oss.qualcomm.com>
 <20260731-vpu_iommu_iova_handling-v2-6-da52b5228dbd@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 31 Jul 2026 18:43:49 +0000
Message-Id: <20260731184349.A7ADE1F00AC4@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [High] Silent DMA allocation fallback causing hardware breakage on update=
d device trees.

Pre-existing issues:
- [High] Race condition exposing uninitialized device leading to NULL point=
er dereference or DMA misconfiguration.
--

--- Patch [6]: [PATCH v2 06/12] media: iris: Skip DMA mask setup when the c=
ore device has no IOMMU ---
commit 91265093c9bc3bb22f1e175614f1dde24649bf5b
Author: Vikash Garodia <vikash.garodia@oss.qualcomm.com>

media: iris: Skip DMA mask setup when the core device has no IOMMU

This commit skips calling dma_set_mask_and_coherent() on the parent iris
device if it has no IOMMU mapped. It sets the DMA mask only when
device_iommu_mapped() reports an IOMMU on the core device, preventing
probe failures on newer platforms where "iommus" is on context bank subnode=
s.

Cc: stable@vger.kernel.org

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
Does this change introduce a silent DMA allocation fallback that could
cause SMMU faults or memory corruption at runtime?

If the new device tree bindings are used (where the "iommus" property is
moved to context bank subnodes), device_iommu_mapped(dev) returns false
and probe skips dma_set_mask_and_coherent().

However, if no platform actually implements the .init_cb_devs hook,
iris_init_cb_devs() will silently return success without creating the
context bank subdevices:

drivers/media/platform/qcom/iris/iris_probe.c:iris_init_cb_devs() {
	if (core->iris_platform_data->vpu_ops->init_cb_devs)
		return core->iris_platform_data->vpu_ops->init_cb_devs(core);

	return 0;
}

When DMA allocations occur, iris_get_cb_dev() falls back to the parent
core device which now has no IOMMU and an unconfigured DMA mask:

drivers/media/platform/qcom/iris/iris_resources.c:iris_get_cb_dev() {
	...
	return dev ? dev : core->dev;
}

[Severity: High]
This isn't a bug introduced by this patch, but there is a race condition
where device nodes are exposed to userspace before critical hardware setup
like DMA masks and PM runtime initialization occurs.

Earlier in iris_probe(), the video devices are registered:

drivers/media/platform/qcom/iris/iris_probe.c:iris_probe() {
	...
	ret =3D iris_register_video_device(core, DECODER);
	...
	ret =3D iris_register_video_device(core, ENCODER);
	...
}

Inside iris_register_video_device(), video_register_device() makes the
device accessible to userspace before video_set_drvdata() sets the driver
data:

drivers/media/platform/qcom/iris/iris_probe.c:iris_register_video_device() {
	...
	ret =3D video_register_device(vdev, VFL_TYPE_VIDEO, -1);
	if (ret)
		goto err_vdev_release;

	video_set_drvdata(vdev, core);
	...
}

If a userspace application like udev immediately opens the device,
iris_open() will retrieve a NULL pointer and trigger a NULL pointer
dereference when accessing core->dev:

drivers/media/platform/qcom/iris/iris_vidc.c:iris_open() {
	struct iris_core *core =3D video_drvdata(filp);
	...
	ret =3D pm_runtime_resume_and_get(core->dev);
	...
}

Even if video_set_drvdata() completes in time, iris_probe() registers the
video devices before executing dma_set_mask_and_coherent() and
devm_pm_runtime_enable(). Could this allow iris_open() to initiate PM/DMA
operations on an uninitialized hardware state?

> =20
>  	dma_set_max_seg_size(&pdev->dev, DMA_BIT_MASK(32));
>  	dma_set_seg_boundary(&pdev->dev, DMA_BIT_MASK(32));

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260731-vpu_iommu_=
iova_handling-v2-0-da52b5228dbd@oss.qualcomm.com?part=3D6
