Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793722866;
	b=ypR0sxq9jvJy+/7cqcz9QzamGjOm6DjlDkNE1HTBkWlIC3LdYnNq0CRYpD2k6SjJMbVq
	 q6NAgxO0eafOO6oKnTeyFj/G+IpLVO2DqADY97umXEzefKClDSSNVuu3rvKZA7in0hOOQ
	 PoZdkcBVey5GrjdN617NSNDJVuOlBQyRxpWomPRpVMfvDA2/Fg4OtwrBlADN+gBG5SCjr
	 6OcKXWQSnvGXrPaDrYGYRKpJctDyA7wSN8fShGkw6p24Bdjmh3tCFfC6ZBiVDyCWAqjVL
	 +vDQGWpCIIkv+cdnXorHSfK1Mn5hr8MNefTQ8KruAgXsKpi16H7+6nb/0lU4aCf8yCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793722866;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=9qUdcRCfFWv6324qVPO1fXVCslRlkMZSb6BS8J+iLlQ=;
	b=iMha+XFC8+OqNkvk5LA44AaWmMiuoQMyU71rJYrCBKaEc4ET9LCGEvKht3dh4Zl0rTob
	 kVQvPKBEyBs2SH8+MQ1aro75ZxlZNzaTndXujKVCNWxOEZ0Jo4LUhwif41DY53RwsRWv4
	 gFwRrAvRWIRDNcjn1DONb5XSOmq9JcOfMQGBNcFG0QK1STIKekmkhpC3qyNYExuObhCsu
	 8lfssx5oqONj9d4UTgolVerH0yGr9f9NEAFxMRYHW2PPyQPk1dSZsj5hV+aZjIy0DkG73
	 5afMs6e1U32JQlOFwEkdP4h5Tes/ISVeU24P16LiC+sHYwWTlGfng5N0dHbGfUcG+2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="L/QXahyo";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D44FC606A327
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 16:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=L/QXahyo
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 244841F000C1;
	Tue,  3 Nov 2026 16:21:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793722865;
	bh=9qUdcRCfFWv6324qVPO1fXVCslRlkMZSb6BS8J+iLlQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=L/QXahyoRekzs7ve3YvXIL6PzDBVk5CJKvEy8JlSSznbCEIrfOpKh+NqMewgRy7W5
	 obZDf48UXUYoNF3UkArU6S5ru4kSVRWEbk+a5OPvUzn6ihkQT28FUw2+Os9p2+QQt0
	 ZJWGB4BXys1rVOVxRcYj5GDR40LeQwQlEpwJoecYUAEeeYSFYEyVk8jwAIGIs7IZ1A
	 nseax33HgFeoicEXc7vJqYCceOPe35qAbfQ/s6jhKhk/kjBOdrYUl8ZLD3j3vf4nbK
	 l7kTwaMfXpUp4W4Up6a9AzwbGu9+TcV4wy2QhXjAYnortLgY88Oq8XvyVPulNk70F7
	 PzG8MMqTnCF0A==
Message-ID: <sashiko-outbox-195714@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 11/12] arm64: dts: qcom: sm8650: Add Iris context
 bank subnodes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vikash Garodia" <vikash.garodia@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20261103-vpu_iommu_iova_handling-v6-11-e4b6ad864f8f@oss.qualcomm.com>
References: <20261103-vpu_iommu_iova_handling-v6-0-e4b6ad864f8f@oss.qualcomm.com>
 <20261103-vpu_iommu_iova_handling-v6-11-e4b6ad864f8f@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 03 Nov 2026 16:21:04 +0000
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
- [High] media: iris: missing IOMMU readiness check in iris_create_cb_dev()
--

commit b47d404291c07cfcdeb8c7a25de5057ab9c274a2
Author: Vikash Garodia <vikash.garodia@oss.qualcomm.com>

arm64: dts: qcom: sm8650: Add Iris context bank subnodes

This commit moves the iommus property on the SM8650 video-codec node into
dedicated non-pixel and pixel child subnodes so that the non-pixel stream c=
an
specify its own restricted iommu-ranges. It also adds address-cells,
size-cells, and dma-ranges to the parent video-codec node.

> diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/q=
com/sm8650.dtsi
> index 86fbb0fd6472d..fd82b83c228ef 100644
> --- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
> @@ -5274,11 +5274,12 @@ &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_O=
NLY>,
>  				      "xo",
>  				      "core";
> =20
> -			iommus =3D <&apps_smmu 0x1940 0>,
> -				 <&apps_smmu 0x1947 0>;
> -
>  			dma-coherent;
> =20
> +			#address-cells =3D <1>;
> +			#size-cells =3D <1>;
> +			dma-ranges =3D <0x0 0x0 0x0 0xe0000000>;
> +
>  			/*
>  			 * IRIS firmware is signed by vendors, only
>  			 * enable on boards where the proper signed firmware
> @@ -5286,6 +5287,15 @@ &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ON=
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
When moving the iommus property from the parent video-codec node to the
driverless non-pixel and pixel child subnodes, could iris_probe() succeed
before apps_smmu has probed, leaving the context bank devices without DMA or
IOMMU configuration?

With iommus on the child subnodes rather than the parent node,
__fw_devlink_link_to_suppliers() only creates DL_FLAG_SYNC_STATE_ONLY proxy
links on the parent video-codec device, and parse_iommus in
drivers/of/property.c is marked optional unless fw_devlink.strict=3D1. As a
result, really_probe() on the parent video-codec device no longer defers on
apps_smmu in device_links_check_suppliers() or platform_dma_configure().

When iris_probe() subsequently creates the child devices via
iris_init_cb_devs() -> iris_create_cb_dev(), platform_device_register_full()
triggers the bus notifier path:

  platform_device_register_full()
    device_add()
      bus_notify(BUS_NOTIFY_ADD_DEVICE)
        iommu_bus_notifier()
          iommu_probe_device()
            iommu_init_device()
              platform_dma_configure()
                of_dma_configure_id()
                  of_iommu_configure()

If apps_smmu has not registered yet (for instance when CONFIG_ARM_SMMU=3Dm =
or
during asynchronous probing), of_iommu_configure() returns -EPROBE_DEFER,
which causes of_dma_configure_id() to free the range map, clear
dev->dma_range_map, skip arch_setup_dma_ops(), and return -EPROBE_DEFER.
However, iommu_init_device() and iommu_bus_notifier() ignore that return
value, so platform_device_register_full() still succeeds:

  drivers/media/platform/qcom/iris/iris_probe.c:iris_create_cb_dev() {
      ...
      pdev =3D platform_device_register_full(&plat_dev_info);
      of_node_put(child_of_node);
      if (IS_ERR(pdev))
          return ERR_CAST(pdev);

      dma_set_max_seg_size(&pdev->dev, DMA_BIT_MASK(32));
      dma_set_seg_boundary(&pdev->dev, DMA_BIT_MASK(32));

      return &pdev->dev;
  }

Because no driver binds to the non-pixel or pixel platform devices,
really_probe() -> platform_dma_configure() never runs for them, and
iris_probe() registers the V4L2 video nodes while core->np_dev and
core->p_dev have no IOMMU group, dma_range_map, or DMA ops configured.

Should iris_create_cb_dev() check device_iommu_mapped(&pdev->dev) (or verify
that IOMMU/DMA setup completed) and unregister pdev while returning
-EPROBE_DEFER if the SMMU is not ready yet?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261103-vpu_iommu_=
iova_handling-v6-0-e4b6ad864f8f@oss.qualcomm.com?part=3D11
