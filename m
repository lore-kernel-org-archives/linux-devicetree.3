Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793722723;
	b=jIcFH5C9fFqfbyEFLtZbNHU3gFkQAkirbhlzvsweErntxeDYUVDKqU+WH1SXP5UfzQ2v
	 aerq/AZyw9W1ByrYMWep81roIDUzrYZo6vaPTHDssXy/BiDgbjNR7f5moIYVuDk2n+vea
	 FQAc3tDFC/KCy0FvXD1IiOX3jBMGStRyZO1n5QD0xtAURp9d3BKPZzmMWyvgeT9OSdIpA
	 Gqx1lnLkR6bz2GFisbfQ55cMaFYfWApQi4JWE6A4IECOmVfEhjqm18SQ6xo2Em+pG2y4B
	 G/YqUEaH9XHzFEenB9+pQ3JkbMPwFD2Xvp+z+OgMd2UNYf4Xl8sIqMwRXXZA5GUZOLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793722723;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=wNKUAlQdOzwREZZumkepuIjFMnbZ1D26aEjr/rZrSU8=;
	b=OA1yvG4oamR0p7p6riuUoGW8nGjT19X0CiopxpFPJguNLf1VMDugfVmX1DES+S317PkH
	 cU0mCYbhGxC30bjWk1wTz/MfLtXiDCpPwKx9EQPc8fxGUAEUSAV9ak0spt5uKMaj1akUn
	 yYmRimG9EIZ64slJiMMWAN1E6cYj3GoFslp+00AcAKHYGszW5reRHr6ANMeWirzpdDdZc
	 8zP1nv9Yv8dVdJZZXfeIMyRZIipHvWN6viDaSvy/KTYYFinJ9kDLamaPQCoVo0MaLzT7m
	 wCiCOT2ULd3d6esolUD7qNKNkoun9lpn/GNL3VLAXnbTZ6IcQXBtPqSlOIi+5zUEjjA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=h4bN8M0O;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 507D8606A327
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 16:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=h4bN8M0O
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E20911F000C1;
	Tue,  3 Nov 2026 16:18:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793722723;
	bh=wNKUAlQdOzwREZZumkepuIjFMnbZ1D26aEjr/rZrSU8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=h4bN8M0OQwaUlkmO640eTxsLo0zaM6GLMWcCsJZpyrWPS50Cj91CUiWr+6geBTXSe
	 qF7zH+XWALzeaGMe4GKt+etNY6zjZ8lwdp1JHo++HzmrreYiU1CQbMWqV1rpDbn8V9
	 gjf/pfCxl1sHYn2cNickghFnju8M2HrOsRLCikOcuk99O4PXvpUMnPaZQnRHy6urSI
	 hpeEtIAUL8YXReoCMQgrmKY4xdT8D0lTclwsYTq5VgLx9IGZ+dU2ehgU2kq9gzs6jq
	 UcWEPLVmG9p+a+Gm025PPuba0RHBrRBgQmnJEmybyY4htVNRm49J7bgnepZ/zJL1Cp
	 LuvGkTEbRd/kg==
Message-ID: <sashiko-outbox-195711@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 12/12] arm64: dts: qcom: sm8750: Add Iris context
 bank subnodes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vikash Garodia" <vikash.garodia@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20261103-vpu_iommu_iova_handling-v6-12-e4b6ad864f8f@oss.qualcomm.com>
References: <20261103-vpu_iommu_iova_handling-v6-0-e4b6ad864f8f@oss.qualcomm.com>
 <20261103-vpu_iommu_iova_handling-v6-12-e4b6ad864f8f@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 03 Nov 2026 16:18:42 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] media: iris: missing IOMMU and deferral check in iris_create_cb_de=
v()
--

commit 9f019e2759c9a77cf0f6ce3f5725ca965b2fadcb
Author: Vikash Garodia <vikash.garodia@oss.qualcomm.com>

arm64: dts: qcom: sm8750: Add Iris context bank subnodes

This commit moves the iommus property from the sm8750 iris video-codec node
into new non-pixel and pixel child subnodes with per-stream iommu-ranges,
along with a 1:1 dma-ranges mapping on the parent node.

> diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/q=
com/sm8750.dtsi
> index cf947acc57602..eca9944ff2228 100644
> --- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
> @@ -3246,8 +3246,6 @@ iris: video-codec@aa00000 {
>  				      "vcodec0_core_freerun";
> =20
>  			dma-coherent;
> -			iommus =3D <&apps_smmu 0x1940 0>,
> -				 <&apps_smmu 0x1947 0>;
> =20
>  			interconnects =3D <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
>  					 &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
> @@ -3280,6 +3278,10 @@ &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ON=
LY>,
>  				      "core",
>  				      "vcodec0_core";
> =20
> +			#address-cells =3D <1>;
> +			#size-cells =3D <1>;
> +			dma-ranges =3D <0x0 0x0 0x0 0xe0000000>;
> +
>  			/*
>  			 * IRIS firmware is signed by vendors, only
>  			 * enable in boards where the proper signed firmware
> @@ -3287,6 +3289,15 @@ &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ON=
LY>,
>  			 */
>  			status =3D "disabled";
> =20
> +			non-pixel {
> +				iommus =3D <&apps_smmu 0x1940 0x0>;
> +				iommu-ranges =3D <0x25800000 0xba800000>;
> +			};
> +
> +			pixel {
> +				iommus =3D <&apps_smmu 0x1947 0x0>;
> +			};

[Severity: High]
With the iommus property moved from the parent video-codec@aa00000 node into
the driverless non-pixel and pixel child subnodes, what happens if qcom-iris
probes before apps_smmu is ready or if IOMMU attachment fails on the child
devices?

Previously, the parent video-codec device had the iommus property directly,
so really_probe() -> platform_dma_configure() -> of_dma_configure_id() ran
before iris_probe() and propagated -EPROBE_DEFER if apps_smmu had not probed
yet.

Now, the child context bank devices are registered dynamically via
iris_probe() -> iris_init_cb_devs() -> iris_create_cb_dev():

drivers/media/platform/qcom/iris/iris_probe.c:iris_create_cb_dev() {
	...
	pdev =3D platform_device_register_full(&plat_dev_info);
	of_node_put(child_of_node);
	if (IS_ERR(pdev))
		return ERR_CAST(pdev);
	...
	return &pdev->dev;
}

Because these child platform devices have no driver bound, their DMA and
IOMMU configuration happens inside the bus notifier path:

platform_device_register_full()
  -> device_add()
    -> iommu_bus_notifier()
      -> iommu_probe_device()
        -> iommu_init_device()

In drivers/iommu/iommu.c:iommu_init_device(), the return value of
dev->bus->dma_configure(dev) is ignored:

	if (!dev->iommu->fwspec && !dev->driver && dev->bus->dma_configure) {
		mutex_unlock(&iommu_probe_device_lock);
		dev->bus->dma_configure(dev);
		mutex_lock(&iommu_probe_device_lock);
	}

When of_iommu_configure() returns -EPROBE_DEFER inside
drivers/of/device.c:of_dma_configure_id(), it clears dev->dma_range_map and
returns before calling arch_setup_dma_ops():

	ret =3D of_iommu_configure(dev, np, id);
	if (ret =3D=3D -EPROBE_DEFER) {
		/* Don't touch range map if it wasn't set from a valid dma-ranges */
		if (set_map)
			dev->dma_range_map =3D NULL;
		kfree(map);
		return -EPROBE_DEFER;
	}

Since iommu_init_device() and iommu_bus_notifier() discard that error,
platform_device_register_full() still succeeds. Can iris_probe() then
complete and register V4L2 devices while core->np_dev and core->p_dev have
no IOMMU attached, a NULL dma_range_map, and unconfigured DMA ops?

Should iris_create_cb_dev() verify that IOMMU configuration succeeded (or
propagate probe deferral) before returning the child device?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261103-vpu_iommu_=
iova_handling-v6-0-e4b6ad864f8f@oss.qualcomm.com?part=3D12
