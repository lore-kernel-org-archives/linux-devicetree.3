Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 324325867C7
	for <devicetree@vger.kernel.org>; Wed,  9 Sep 2026 15:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788967602; cv=none; b=KKIAG2qxSvatH6JCtxg/Sc/78tVV9UH1tnae4w0bE7Auc09+yQyait8OOyM/+9HvK07PRtoEUvv42daorifTahSG70b0d3/+UCpPxKc3gtBRbKRSUQqPVPA5a+5CYM01iUG6b52KxlrAbz2O6Wk8egIQT39dFhAQTyOu8zfGAf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788967602; c=relaxed/simple;
	bh=bNaR1IjuN9egLREK6OFottQEEF3ROt6A6Rlk6OmjHnM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=NFYBfW1CR2DYrtGwn5fC+D76jkemvltAvANN0O6awShp7q79/Ck80DgCd9sTrhvVZ9Yj47m+LN9fjtBQYqBcZdbwKQb7u8p81gh2i3GZX36qfCwqCZIRK9LlP7fDF2Pe2mT6hz4T3fxzEM+8127Sa5nySzLqwytDohp0KpVViPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GF31eWIb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GF31eWIb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35D481F00A3A;
	Wed,  9 Sep 2026 15:26:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788967600;
	bh=g80UKbBWaawzfcGng+WgyaOcB5f/cJOnOw9TC0C7wgg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GF31eWIb32Rw1VMxJV9vzX00YQuhsTVZ8o1ufd0Ri/ux1hdg9df+UW/nbYs+/8Ukk
	 eQ906ASGPkJEYxHUWDjyFEjRTOWOx7Q13HE/8+H0laBZ8dUwiZ4RZfhs/L+SYliVDZ
	 8evVTfbD2gAnEoewZHOyQqO8mOwC5YZJjdMNTsDfqQooDzte3fyI029x9ZU4yMOCgp
	 ZfrYz7EO116dbckKDlh47z/bG8FA74WtYwkBpKeMU4g6BLU7JQMKwIbKO9ziRQZffV
	 pwoqvESm/1y5kZ1lNilLK5agepJWx1JSSuOAUoetqdvAlecBuBDcpx3iAZs1tcy/dL
	 0SVLDf25sipcw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 12/13] arm64: dts: qcom: sm8650: Add Iris context
 bank subnodes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vikash Garodia" <vikash.garodia@oss.qualcomm.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20260909-vpu_iommu_iova_handling-v3-12-2fe43ae45495@oss.qualcomm.com>
References: <20260909-vpu_iommu_iova_handling-v3-0-2fe43ae45495@oss.qualcomm.com>
 <20260909-vpu_iommu_iova_handling-v3-12-2fe43ae45495@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 09 Sep 2026 15:26:39 +0000
Message-Id: <20260909152640.35D481F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Dynamically created sub-devices for SMMU context banks lack PM run=
time enablement, keeping the SMMU permanently active.
- [High] of_iommu_derive_resv_regions() erroneously translates IOVAs into C=
PU physical addresses.
--

commit 6e1de71c7ed4433a945133dd5bedc79a78bdd2e4
Author: Vikash Garodia <vikash.garodia@oss.qualcomm.com>

arm64: dts: qcom: sm8650: Add Iris context bank subnodes

This commit introduces subnodes for the non-pixel and pixel VPU SMMU streams
so that each stream can be associated with its respective addressable range.
It adds an iommu-ranges property to the non-pixel stream to restrict its
allocations, addressing hardware faults caused by buffers landing below the
600MB IOVA boundary.

> diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/q=
com/sm8650.dtsi
> index b679fd8afb7d5..97dad9c7f7fc4 100644
> --- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi

[ ... ]

> @@ -5287,6 +5288,15 @@ &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ON=
LY>,
>  			 */
>  			status =3D "disabled";
> =20
> +			non-pixel {
> +				iommus =3D <&apps_smmu 0x1940 0x0>;

[Severity: High]
Does adding these subnodes cause a PM runtime leak in the SMMU?

When these dummy platform devices are dynamically created for context banks=
 by
the iris driver in drivers/media/platform/qcom/iris/iris_probe.c:

iris_create_cb_dev() {
    ...
    pdev =3D platform_device_register_full(&plat_dev_info);
    ...
}

The IOMMU core intercepts them, attaches them to the SMMU, and establishes a
PM runtime device link (DL_FLAG_PM_RUNTIME). Because the driver never
explicitly calls pm_runtime_enable() on these dummy devices, their PM
runtime disable depth remains greater than zero.

The PM core interprets this as the consumer being active, forcing the
supplier (the SMMU) and its interconnect power domains to resume and stay
active permanently.

> +				iommu-ranges =3D <0x25800000 0xba800000>;

[Severity: High]
Does the use of iommu-ranges here cause the IOMMU core to reserve the wrong
address space?

When this property is parsed in drivers/iommu/of_iommu.c to compute reserved
regions:

of_iommu_derive_resv_regions() {
    ...
    maps =3D of_translate_dma_region(dev->of_node, maps, &iova, &length);
    ...
}

The function of_translate_dma_region() uses dma-ranges to translate up to a
CPU physical address, rather than preserving the intended IOVA space.

This CPU physical address is then incorrectly passed as the IOVA base to
iommu_alloc_resv_region(), which can severely break the IOVA allocator and
block valid DMA allocations on architectures with non-identity DMA offsets.

> +			};
> +
> +			pixel {
> +				iommus =3D <&apps_smmu 0x1947 0x0>;
> +			};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260909-vpu_iommu_=
iova_handling-v3-0-2fe43ae45495@oss.qualcomm.com?part=3D12
