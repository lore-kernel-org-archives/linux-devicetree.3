Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793722092;
	b=zLV3Rw01waIK0Vy76Z0z3cITuvFiG7NmTflgm4xIf/quodKaW/0eUdaZq5izZClKLwhv
	 nU/6xHDJIIyai2MyuuZW7u/S3PZ6uc6EteXVxW6WD6RblOJsMRXEBRvxJrC/XVdNtumnw
	 aN9RMV/zv7BE04ftfcf1ABSOMzy2/C6QCQa6gM/Ubt0K8u2D5E+xN2VuM6fpiEqBzyTIK
	 SoxxqLfCNFgWqBWF/FXR+ie2mesF1aqfq9QLY4gfeyD2j2pb4uH7ifYGmhFlqsuGHNcyI
	 n301R3vOjnPGNfSJu/xkFBYkkBlOJv7Q7UEcZ1VAZhh9ahbgTFGd03OCoLDw/C7OUKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793722092;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=15eXFobmklMF6Zz8KZABOj/NYU9Bb/gZ6f+yX2jZ//4=;
	b=CPTPisdqRgGMc3uzxUlDq3/Ld4fCLuV7sEWSunBU4nJM/AGyV/Wk80i3t4XYXCwn9GVd
	 zefN59M7aLoeUi6M/1N+n9KRNEXUGxuARC6gSAFwlI0Fg7yN8CLBW3VT8c/vNjTlob9N8
	 N2Eb/KI2tH1Fhst1lPwHw8uyHBx9hRof/Hj1djqN9Gp+Gh3eV2mfO9dlLATzblVlpnDPG
	 MDonLhJYt0VPHTTQkHFPrQoSPN0DBECH5/frSSCkK0bX+dmzdzJbY6k6jzU/4sH7UOVsH
	 U8PwX9kjrh1j1gYHYc9v6MVinSn5YmvAQAfas6QBwSgB1WuYy21LNVUG3ALELj2vPxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gjfdUDao;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D55F606A324
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 16:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gjfdUDao
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF48E1F000C1;
	Tue,  3 Nov 2026 16:08:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793722092;
	bh=15eXFobmklMF6Zz8KZABOj/NYU9Bb/gZ6f+yX2jZ//4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gjfdUDaowIUI57ChTO/LZ0zj58egmnmNU9Vm34X4RcHr7mfAYxou7Q2qz8P/K6O/H
	 bcCrdry9DVfoGCEtOcvjKu3CnAoqitXBAe2VO/TZsYp5/wNcNc5IeDxFcefFmZhq6u
	 i+jkNn4gijuul5vN6I/EDl5m+CZS6CQwt/FXGCGSZOFoqrL4M8WZ0fyscxAu+Da/kH
	 JwQ0gZdd8wnItWRo3mWWW1AgVKCoLnsC4DMZ4brVPl3cQA76q6Aswhenj8Km0V8FQ4
	 /jiWUU8wNFQJvOtBVRrZZcPyeNjaFMydv4qTR+zNUBLkakZ0YYIoxxeJeuXvATUuGY
	 CwsFzuBf5/mDQ==
Message-ID: <sashiko-outbox-195699@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 06/12] media: iris: Skip DMA mask setup when the core
 device has no IOMMU
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vikash Garodia" <vikash.garodia@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20261103-vpu_iommu_iova_handling-v6-6-e4b6ad864f8f@oss.qualcomm.com>
References: <20261103-vpu_iommu_iova_handling-v6-0-e4b6ad864f8f@oss.qualcomm.com>
 <20261103-vpu_iommu_iova_handling-v6-6-e4b6ad864f8f@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 03 Nov 2026 16:08:11 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] media: iris: missing IOMMU readiness check for context bank devi=
ces
- [Low] media: iris: commit message omits iris_reserve_iova_region() changes
--

commit 5b3d97b6ae9d000944779c5b28977e003ea98d0c
Author: Vikash Garodia <vikash.garodia@oss.qualcomm.com>

media: iris: Skip DMA mask setup when the core device has no IOMMU

This commit updates iris_probe(), iris_reserve_iova_region(), and
iris_unreserve_iova_region() to check device_iommu_mapped(dev) before
performing IOVA reservation and DMA mask configuration on the parent iris
device.

>     media: iris: Skip DMA mask setup when the core device has no IOMMU
>    =20
>     Once the streams are described as context bank subnodes, the "iommus"
>     property no longer sits on the parent iris node. That device then has=
 no
>     IOMMU domain of its own and never performs DMA directly, so calling
>     dma_set_mask_and_coherent() on it is meaningless, and on a device wit=
h no
>     IOMMU it can fail and abort probe.
>    =20
>     Set the DMA mask only when device_iommu_mapped() reports an IOMMU on =
the
>     core device. Platforms that have not been converted still carry "iomm=
us"
>     on the parent node and keep the existing setup. For converted platfor=
ms
>     the mask is applied to each context bank device instead, in
>     iris_create_cb_dev().
>    =20
>     Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>     Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>     Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>     Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
>=20
> diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/medi=
a/platform/qcom/iris/iris_probe.c
> index e659461716ba4..6d7147d73d40b 100644
> --- a/drivers/media/platform/qcom/iris/iris_probe.c
> +++ b/drivers/media/platform/qcom/iris/iris_probe.c
> @@ -154,6 +154,9 @@ static void iris_unreserve_iova_region(struct device =
*dev, struct dma_iova_state
>  {
>  	unsigned int i;
> =20
> +	if (!device_iommu_mapped(dev))
> +		return;
> +
>  	for (i =3D 0; dma_iova_size(&iova_state[i]); i++)
>  		dma_iova_free(dev, &iova_state[i]);
>  }
> @@ -167,6 +170,9 @@ static int iris_reserve_iova_region(struct device *de=
v, struct dma_iova_state **
>  	unsigned int count =3D 0;
>  	int ret =3D -ENOMEM;
> =20
> +	if (!device_iommu_mapped(dev))
> +		return 0;

[Severity: Low]
This isn't a bug, but the commit title and message only describe skipping
dma_set_mask_and_coherent() in iris_probe().

Should the commit message also mention skipping the IOVA region reservation=
 in
iris_reserve_iova_region() and iris_unreserve_iova_region() when the core
device has no IOMMU (where dma_iova_try_alloc() would otherwise return false
and cause iris_probe() to fail with -ENOMEM)?

> +
>  	state =3D devm_kcalloc(dev, BITS_PER_TYPE(dma_addr_t) + 1, sizeof(*stat=
e), GFP_KERNEL);
>  	if (!state)
>  		return ret;
> @@ -433,9 +439,11 @@ static int iris_probe(struct platform_device *pdev)
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

[Severity: Medium]
Can this allow iris_probe() to succeed when the SMMU has not probed yet on
platforms converted to context bank subnodes?

On converted platforms, the parent iris node has no iommus property, so
platform_dma_configure(core->dev) sees -ENODEV from of_iommu_configure() and
treats it as non-fatal. In addition, fw_devlink does not block core->dev on
the child subnodes' iommus phandles because parse_iommus is marked optional
and descendant fwnode links use FW_DEVLINK_FLAGS_PERMISSIVE.

When iris_init_cb_devs() -> iris_create_cb_dev() registers the child context
bank devices:

drivers/media/platform/qcom/iris/iris_probe.c:iris_create_cb_dev() {
	...
	pdev =3D platform_device_register_full(&plat_dev_info);
	of_node_put(child_of_node);
	if (IS_ERR(pdev))
		return ERR_CAST(pdev);
	...
}

those child platform devices have no driver bound, and
BUS_NOTIFY_ADD_DEVICE -> iommu_bus_notifier() -> iommu_probe_device() ->
iommu_init_device() ignores the -EPROBE_DEFER returned by
dev->bus->dma_configure(&pdev->dev) when the SMMU is not ready.

With both iris_reserve_iova_region() and dma_set_mask_and_coherent() now
skipped on core->dev when !device_iommu_mapped(dev), wouldn't iris_probe()
finish and register the V4L2 video devices while neither core->dev nor
core->np_dev / core->p_dev is attached to an IOMMU domain, causing subseque=
nt
iris_open() -> iris_core_init() -> iris_hfi_queues_init() calls to run
dma_alloc_attrs() on an unmapped context bank device?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261103-vpu_iommu_=
iova_handling-v6-0-e4b6ad864f8f@oss.qualcomm.com?part=3D6
