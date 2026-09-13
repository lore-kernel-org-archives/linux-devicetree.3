Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18CF73B7B7A
	for <devicetree@vger.kernel.org>; Sun, 13 Sep 2026 19:03:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789326213; cv=none; b=H92a0YLCXadrbigw2lTD60S0J9AK3LmD7PnHvqLKcZiMfMCZePurWYX3fciTP7Llww/4pqLPj68I4sA0eheAajgQvV8pCyyiRspwP6bH5TSoG2F1QrleMqvPxKAUan7i4N0FPoTXA/gzuC0+4vPwBlRxzO7y8EPgIS7Q+1IFomo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789326213; c=relaxed/simple;
	bh=Sl2jL6jeP1SsAEtiE95QRx1XHciY/Y8fkbi9bpsJG/4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=VuTQjc3NSB3GC7kyo/9/kuq1Tjsjtoj6Rt9QOQj2v++r24MCa8PKxVaQ3gbyY+xqa1mt+FVkmJc7P3hTNJ728abD3nG12hkgEVOKVUC2jk79IcYKu++clTS1URfWz5rV13kJ+51y+7o07tiyuW2YkE2gv7dFp/5n4gWEA426EOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=acS8ahQi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="acS8ahQi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 107FD1F000FF;
	Sun, 13 Sep 2026 19:03:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789326211;
	bh=/5w6EnoLMnsTPzxs+BR3xs8/WwIxC9Qy2b31JkvgCcU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=acS8ahQiV3/d8trVJcp/k6u2/QWV1ibzHNX7xjin+v6w6VgHe2X5Mh8a/jdl3OrIc
	 CUVuAYj6lbM3/gz5Z/0Dyng3s8/Or/CtT9JCN+fbS+yIxZbpcVD3HserOz/NNpLOXg
	 UxNQIhaazu4FFuJxL8jVAzxFlNwi4HqJegIFdtOgIOEoLCianwPUpYoj7ohf1hhIzp
	 3N5gCr4NKKcfowIAbQLj2pMF1NQklO3q3+0QHwnWtJLYTqOboX2XBJB7eRsqgVp6vY
	 RW0LRgqEG+aFzLHXJLwDy9AJsHBZs4vs3VSbO4gnmkIARdEMVgkxLIGpq6rLD+ud9A
	 tvM3kZbT5GQCA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 07/13] media: iris: Skip DMA mask setup when the core
 device has no IOMMU
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vikash Garodia" <vikash.garodia@oss.qualcomm.com>
Cc: media-ci@linuxtv.org, conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260914-vpu_iommu_iova_handling-v4-7-9b9074a73c41@oss.qualcomm.com>
References: <20260914-vpu_iommu_iova_handling-v4-0-9b9074a73c41@oss.qualcomm.com>
 <20260914-vpu_iommu_iova_handling-v4-7-9b9074a73c41@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 13 Sep 2026 19:03:30 +0000
Message-Id: <20260913190331.107FD1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Race condition leading to a NULL pointer dereference because the v=
ideo device is registered before its private data and PM runtime are fully =
initialized.
--

commit 238457488dcd9147aa8709c84d5fae08c48163b9
Author: Vikash Garodia <vikash.garodia@oss.qualcomm.com>

media: iris: Skip DMA mask setup when the core device has no IOMMU

Once the streams are described as context bank subnodes, the "iommus"
property no longer sits on the parent iris node. That device then has no
IOMMU domain of its own and never performs DMA directly, so calling
dma_set_mask_and_coherent() on it is meaningless.

> diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/medi=
a/platform/qcom/iris/iris_probe.c
> index debd1f0e57038..4bdb078d83b5c 100644
> --- a/drivers/media/platform/qcom/iris/iris_probe.c
> +++ b/drivers/media/platform/qcom/iris/iris_probe.c
> @@ -352,9 +352,11 @@ static int iris_probe(struct platform_device *pdev)
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
This isn't a bug introduced by this patch, but could this sequence leave a
window for a race condition where userspace accesses the video device before
it is fully initialized?

In iris_probe.c:iris_register_video_device(), the video node is registered
before the driver data is set:

	ret =3D video_register_device(vdev, VFL_TYPE_VIDEO, -1);
	if (ret)
		goto err_vdev_release;

	video_set_drvdata(vdev, core);

This exposes the /dev/videoX node to userspace immediately. If a process
like udev opens the device right away, iris_open() in iris_vidc.c can execu=
te
before video_set_drvdata() or the remainder of iris_probe() completes.

If this happens, iris_open() calls video_drvdata() which returns a null
pointer. Passing this to pm_runtime_resume_and_get(core->dev) would then
cause a null pointer dereference.

Furthermore, exposing the device before devm_pm_runtime_enable() completes
further down in iris_probe() could leave the device in an uninitialized
state, resulting in unexpected access errors.

> =20
>  	dma_set_max_seg_size(&pdev->dev, DMA_BIT_MASK(32));
>  	dma_set_seg_boundary(&pdev->dev, DMA_BIT_MASK(32));

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260914-vpu_iommu_=
iova_handling-v4-0-9b9074a73c41@oss.qualcomm.com?part=3D7
