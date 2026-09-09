Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25C95559CA5
	for <devicetree@vger.kernel.org>; Wed,  9 Sep 2026 15:22:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788967322; cv=none; b=fmpgVfkXQyeduj3ZGXV7jcrhYD1TnQPD+xxfw6G5l+R0bc+dnheJYYRjl7x5yEHZmplDQ4jerHA/4ntoVeLV1y0ytljd3WLsHU0gPV3TPMzfpVRIF/fCvSH22jEfIvXew+8VDhORvAqa5APszUlbdj00h9cG0WbkNzZrmAf9SiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788967322; c=relaxed/simple;
	bh=66PPZEelfrL3sfG5TzISe4D7p1cEklvPsLJpZIRNBI8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=NOskJZlwrfkwO8dYK06GxKk5VkwF6KwAMrtsI5+QbLb95yAbv33311ag3rf1nWyZ0gq/K6W5VBj2HH846f8C76sKpfLbY81qQ79aRtz4H/gv31xJa5Xjjkd4Q+INeZvmso2r4fUgtFT8pWqez/DX3RLo9iGPeGVR/JogHgAkUAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f2XPzzZm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f2XPzzZm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B20391F00A3D;
	Wed,  9 Sep 2026 15:22:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788967321;
	bh=yoNmHMzwFlrrtCPhFT0DvERq+Y8A1fMlb+seNXFok94=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=f2XPzzZmZ17FaScX7LEByeijffqZaYVG1iYNhvgS7Ytu2yZAL5C/SkA4dUzqBBZbt
	 1lI0YsuM56Tyq0gYnO7+LLieYirxs+cW+qu3MD1wTQgEZKCqwYrd7WpkJY7E1XCycp
	 W5fib6y9eZrbvfay5b+hmk67WJ/NcRUP62cmbIXGWm+YG5ZxDpLUT3lXj3jyTuWM38
	 JR9SuA+jIh7og/UuAObVPPxp8KhdmTkbHJB7eZWhawe5sPXYeGNTvi1x+9E1nzjSQG
	 wavPaF2U54Fb/Jb9w+rCT25xPIbszynkf58T1sbGvDthE2uD7wJ8ORoOkqBBOOU6F9
	 EzhBk4R2hiOZQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 10/13] arm64: dts: qcom: lemans: Add Iris context
 bank subnodes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vikash Garodia" <vikash.garodia@oss.qualcomm.com>
Cc: media-ci@linuxtv.org, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260909-vpu_iommu_iova_handling-v3-10-2fe43ae45495@oss.qualcomm.com>
References: <20260909-vpu_iommu_iova_handling-v3-0-2fe43ae45495@oss.qualcomm.com>
 <20260909-vpu_iommu_iova_handling-v3-10-2fe43ae45495@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 09 Sep 2026 15:22:00 +0000
Message-Id: <20260909152200.B20391F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Missing IOMMU configuration for child context bank devices causes =
SMMU translation faults
--

commit a2c4ab829f603d5afbc86327c3483e445b4cefed
Author: Vikash Garodia <vikash.garodia@oss.qualcomm.com>

arm64: dts: qcom: lemans: Add Iris context bank subnodes

This commit moves the iommus property from the parent video-codec node
to specific subnodes (non-pixel and pixel) to restrict the addressable
range for the non-pixel stream. The intent is to prevent unhandled SMMU
page faults by ensuring allocations avoid the low 600MB of IOVA space.

> diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/q=
com/lemans.dtsi
> index 695eae1b72569..afed5e43b4fcd 100644
> --- a/arch/arm64/boot/dts/qcom/lemans.dtsi
> +++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
[ ... ]
> @@ -4962,12 +4962,23 @@ &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_O=
NLY>,
>  			resets =3D <&gcc GCC_VIDEO_AXI0_CLK_ARES>;
>  			reset-names =3D "bus";
> =20
> -			iommus =3D <&apps_smmu 0x0880 0x0400>,
> -				 <&apps_smmu 0x0887 0x0400>;
>  			dma-coherent;
> =20
> +			#address-cells =3D <1>;
> +			#size-cells =3D <1>;
> +			dma-ranges =3D <0x0 0x0 0x0 0xe0000000>;
> =20
>  			status =3D "disabled";
> =20
> +			non-pixel {
> +				iommus =3D <&apps_smmu 0x0880 0x0400>;
> +				iommu-ranges =3D <0x25800000 0xba800000>;
> +			};
> +
> +			pixel {
> +				iommus =3D <&apps_smmu 0x0887 0x0400>;
> +			};

[Severity: High]
Because these subnodes lack a compatible string, do they ever bind to a
driver?=20

If they don't bind, the driver core's really_probe() is skipped, meaning
platform_dma_configure() and of_dma_configure() are not executed
automatically.

In the iris driver code, iris_create_cb_dev() instantiates these subnodes
dynamically via platform_device_register_full():

drivers/media/platform/qcom/iris/iris_probe.c:iris_create_cb_dev() {
    ...
    pdev =3D platform_device_register_full(&plat_dev_info);
    of_node_put(child_of_node);
    if (IS_ERR(pdev))
        return ERR_CAST(pdev);
    ...
}

Unlike the venus driver which explicitly calls of_dma_configure() for
driverless firmware nodes, the iris driver appears to omit explicit IOMMU
configuration on these newly created devices.=20

When the driver later allocates DMA buffers using core->np_dev or core->p_d=
ev,
will those allocations bypass the IOMMU due to the missing iommu_fwspec
attachment?

Could this result in the DMA memory being allocated using direct physical
addresses instead of IOVAs, triggering the very SMMU translation faults this
patch aims to fix?

> +
>  			iris_opp_table: opp-table {
>  				compatible =3D "operating-points-v2";
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260909-vpu_iommu_=
iova_handling-v3-0-2fe43ae45495@oss.qualcomm.com?part=3D10
