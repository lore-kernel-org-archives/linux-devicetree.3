Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A4E734040D
	for <devicetree@vger.kernel.org>; Wed,  9 Sep 2026 15:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788967459; cv=none; b=a6UiIJpHFbHoYMssnNWCNU+cv0q/B0muap9yCRLhgL6o9S6A7u5ThS60xp0NJbQoXLE3tWr66voxmOx6wOJCeyt6H7azv3s0xQRmEVzoQshf4LdQx5FXVX3CAIMA28B8e8gGzE/MVgyX+kb/cOiXeHzKnqyFzWrBtvNNz2R5qJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788967459; c=relaxed/simple;
	bh=mOoIGVeLaCOmsEPG5yDeFhgj//CHPDuEZww+NjI+qTc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=jpFSZ2MF+a+fmRZbqcVMYdTQmLOvfGa6ltjzXmCBnTO9rO6NIZsQNm6AFsPVfQDAlsZtggjHaauUONGzLv/GwEiPQKUxHgsy+svo2w788h9g0RD2PFJ1ZqTlt8u491IBI8S+0+O1KlP7J/WBk780Tb8Og2JnEScs5E+Zt364qwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TIec51Z+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TIec51Z+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C17DC1F00A3A;
	Wed,  9 Sep 2026 15:24:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788967457;
	bh=juwA0DUkwfFgs2zrE82Zf+otmrsQyx30XykTYS2Lhe4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TIec51Z+G2oL5tpEhkldo5Vush8Q7hWAky1UlIiC1twM/cL5mglglSUijbluNK2kN
	 Gf4YV1nUPdanAOX3kbYHCr5soFkbd7dteAnh4qibIh0x6aa4GNcuydAtAphAwyj98G
	 P22eV5MaHdIbBNKAQAkdO5ezjsX22QSz5qoRmTEJyEsVy1mUSXECPGqIZxWvG+JGLV
	 NA79BKR4a66n69GVLWw+Iv6/t1VxhQAHSZN0cEnfdxZTO+4n11GJQbhepg/EQfPpwY
	 Cz1bTkfSVi6pFtCBkk0kdEiYPdOwxwftB63oDD/ZWOIr/WYqvfx+e+L7W7jsKp/gbM
	 vhy+tP7p/03hA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 13/13] arm64: dts: qcom: sm8750: Add Iris context
 bank subnodes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vikash Garodia" <vikash.garodia@oss.qualcomm.com>
Cc: conor+dt@kernel.org, media-ci@linuxtv.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260909-vpu_iommu_iova_handling-v3-13-2fe43ae45495@oss.qualcomm.com>
References: <20260909-vpu_iommu_iova_handling-v3-0-2fe43ae45495@oss.qualcomm.com>
 <20260909-vpu_iommu_iova_handling-v3-13-2fe43ae45495@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 09 Sep 2026 15:24:16 +0000
Message-Id: <20260909152416.C17DC1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Moving the `iommus` property to subnodes breaks IOMMU configuratio=
n for the VPU because the `iris` driver does not configure DMA for these ch=
ild devices.
--

commit 2a638b0a96fbbd027cf960b36f77ad140f56417d
Author: Vikash Garodia <vikash.garodia@oss.qualcomm.com>

arm64: dts: qcom: sm8750: Add Iris context bank subnodes

This patch adds non-pixel and pixel subnodes to the Iris video-codec
node to restrict address ranges for specific VPU streams. It removes
the single iommus property from the main node to resolve unhandled
SMMU page faults caused by non-pixel buffers falling below the 600MB
boundary.

> diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/q=
com/sm8750.dtsi
> index eb3a6990ec30b..206ac22cab2c0 100644
> --- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
> @@ -3026,8 +3026,6 @@ iris: video-codec@aa00000 {
>  				      "vcodec0_core_freerun";
> =20
>  			dma-coherent;
> -			iommus =3D <&apps_smmu 0x1940 0>,
> -				 <&apps_smmu 0x1947 0>;
> =20
>  			interconnects =3D <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
[ ... ]
> @@ -3067,6 +3069,15 @@ &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ON=
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
> +
>  			iris_opp_table: opp-table {

[Severity: High]
Does moving the iommus property to these subnodes break IOMMU configuration
for the VPU?

Since these subnodes lack compatible strings, they will not bind to a
driver. Looking at iris_create_cb_dev() in the driver, it creates
platform devices for the child nodes but doesn't call of_dma_configure()
or attach an IOMMU domain:

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

Because no driver binds to these sub-devices, the driver core never calls
really_probe() and skips platform_dma_configure(). Since the iris driver
does not manually configure DMA either, does this leave the sub-devices
without IOMMU configuration?

This could cause DMA allocations to bypass the IOMMU and yield raw physical
addresses instead of IOVAs. When the VPU attempts to access these addresses,
the SMMU might generate context faults.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260909-vpu_iommu_=
iova_handling-v3-0-2fe43ae45495@oss.qualcomm.com?part=3D13
