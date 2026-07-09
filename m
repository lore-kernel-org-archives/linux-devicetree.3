Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A779233B6D0
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 14:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783607449; cv=none; b=nkcwereoR5+EcalEZNwOrXPkXZ6p7lBxUqGF72fN5d3XEf6VhGyaGHECagfweWxmWei9Bkso7iQ4hVtl00Or6QWIC5lb2Ec+om+/fe5GPERgbs0oeu9aJAXp5dDoIILWqtqD/bGBFj0i7PjZL1t6dCbA630dLF19undj0cWatZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783607449; c=relaxed/simple;
	bh=LCDgTylm0KhzXaLh4XhVz4M54wYM42mgVg8/ap8khyE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=rAjCDwBx7USFVvm7q2qmIOoZLWqVCZI1sFFzebzaq5GExTK6dARz7XwkWRNPXkTC4axpquVL0bLdwnnF6JPfZAvQumGux8JFeEDQ0xpTWbOQ9WhYbuvpnRNgxI5oRVdbCuPh9D12mnN6U6AmGJ+XkSU1P4TVfXvsVVMlkAP0nLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g76rJHvM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g76rJHvM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B5721F000E9;
	Thu,  9 Jul 2026 14:30:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783607447;
	bh=shB8RqSQ46ijNC5J6wU3IR8KtrP2rhgsTEChmJTJrMI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=g76rJHvMgOShNVXIyrb84wAh8rnOGiidfvkh85IbrZWNeuxyEFVUNnTR6YQsmR6Qt
	 d/hunmZ+6Z+WRzR0IRQfthBCS38YfxOPDPcRdlT3PENsxHFNWBKBzP6yIAKnznCPu1
	 90X0C/jGI/XnDYVFbcbbIpXRqutfra0MWnTT3/O4Up8Y5DB/3Q6Pf4pqkFrv/THg0p
	 5WEgd1Ocn5pHpL1XecRWccDjShkblkYX+8P1obCJDYrzLkiJSFDct++cLSbrWoSaOl
	 Z2W+RrETFVatKijfyMd52bi1DEzkOt9oc+xdau6xuqT1+1Dx6etzld8Z3QBr4sNXC6
	 g1E4xieKmQk9Q==
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH 08/11] arm64: dts: qcom: sm8550: Move Iris IOMMUs to
 child nodes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vikash Garodia" <vikash.garodia@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260709-vpu_iommu_iova_handling-v1-8-72bb62cb2dfd@oss.qualcomm.com>
References: <20260709-vpu_iommu_iova_handling-v1-0-72bb62cb2dfd@oss.qualcomm.com>
 <20260709-vpu_iommu_iova_handling-v1-8-72bb62cb2dfd@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 09 Jul 2026 14:30:46 +0000
Message-Id: <20260709143046.7B5721F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

New issues:
- [High] The `reservation-iris` node uses `iommu-addresses` without a `reg`=
 property. In `of_iommu_get_resv_regions`, this is parsed as an `IOMMU_RESV=
_RESERVED` region. The IOMMU subsystem explicitly reserves these regions in=
 the IOVA allocator tree (e.g., in `reserve_iova`), which prevents any DMA =
allocations from using this memory range. Instead of limiting the non-pixel=
 stream to the 0-600 MB IOVA range, this patch effectively denylists the 0-=
600 MB range, forcing all allocations to use IOVAs above 600 MB. This inver=
ts the intended hardware constraint and will cause the VPU crashes it aims =
to prevent.
- [High] The `non-pixel` and `pixel` child nodes lack `compatible` strings =
and do not bind to any platform driver. The driver registers them using `pl=
atform_device_register_full()`, but because no driver probes them, the driv=
er core never calls `platform_dma_configure()` (and thus `of_dma_configure(=
)`) for these devices. Consequently, their `dev->iommu_fwspec` and DMA ops =
remain unconfigured. When `dma_alloc_attrs()` is later called using these c=
ontext bank devices, the allocations will bypass the IOMMU (falling back to=
 direct physical memory allocations) and trigger SMMU translation faults. T=
he driver must manually invoke `of_dma_configure()` on the created child de=
vices.

Pre-existing issues:
- [High] This problem wasn't introduced by this patch, but in `of_iommu_get=
_resv_regions`, if `of_translate_dma_region()` fails (e.g., crossing a non-=
translatable boundary or encountering a malformed `dma-ranges`), it returns=
 `NULL`, which is assigned to the `maps` pointer. Because `length` is unini=
tialized, it can be non-zero, allowing the code to bypass the `if (length =
=3D=3D 0)` check. The loop condition `while (maps < end)` evaluates to true=
 (since `NULL < end`), and the next iteration immediately dereferences the =
`NULL` pointer at `be32_to_cpup(maps++)`, resulting in a kernel panic.
- [High] This problem wasn't introduced by this patch, but `of_iommu_get_re=
sv_regions` lacks bounds checking when parsing `iommu-addresses`. The loop =
blindly advances `maps` cell by cell, without skipping the address and size=
 data for unmatched phandles. If a data cell coincidentally matches `dev->o=
f_node`'s phandle, or if the property is truncated, `of_translate_dma_regio=
n` delegates to `__of_translate_address`, which executes `memcpy(addr, in_a=
ddr, na * 4)` and `of_read_number(prop + na, ns)` without ensuring there ar=
e `na + ns` cells remaining before `end`. This leads to an out-of-bounds re=
ad of the device tree property.
--

--- Patch [8]: [RFC PATCH 08/11] arm64: dts: qcom: sm8550: Move Iris IOMMUs=
 to child nodes ---
commit 84b6e774da5044311b95ef6d8c3458ace387439e
Author: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Subject: arm64: dts: qcom: sm8550: Move Iris IOMMUs to child nodes

This commit separates the Iris VPU IOMMUs into pixel and non-pixel child
nodes to describe their different IOVA constraints. It also attempts to
restrict the non-pixel stream to the 0-600 MB IOVA range using a memory
reservation node.

> diff --git a/arch/arm64/boot/dts/qcom/qcs8550.dtsi b/arch/arm64/boot/dts/=
qcom/qcs8550.dtsi
> --- a/arch/arm64/boot/dts/qcom/qcs8550.dtsi
> +++ b/arch/arm64/boot/dts/qcom/qcs8550.dtsi

[ ... ]

> @@ -158,5 +158,9 @@ mpss_dsm_mem: mpss-dsm-region@d4d00000 {
>  			reg =3D <0x0 0xd4d00000 0x0 0x3300000>;
>  			no-map;
>  		};
> +
> +		iris_resv: reservation-iris {
> +			iommu-addresses =3D <&iris_non_pixel 0x0 0x0 0x0 0x25800000>;
> +		};
>  	};
>  };

[Severity: High]
Does this configuration actually reserve the 0-600 MB range for the non-pix=
el
stream to use, or does it unintentionally prevent its use?

Since the reservation-iris node uses iommu-addresses without a reg property,
the IOMMU subsystem parses this as an IOMMU_RESV_RESERVED region. The IOVA
allocator explicitly denylists reserved regions to protect them, preventing
any DMA allocations from using that memory range.

Will this force all non-pixel stream allocations into higher addresses
outside the 0-600 MB range, potentially causing the VPU crashes this aims
to prevent?

[Severity: High]
This isn't a bug introduced by this patch, but does the addition of the
iommu-addresses property expose an unhandled failure path in the IOMMU core?

If address translation fails for any reason (like a malformed property),
of_translate_dma_region() returns a NULL pointer. Because the length variab=
le
is uninitialized, the code can bypass the length =3D=3D 0 check:

drivers/iommu/of_iommu.c:of_iommu_get_resv_regions() {
	...
	maps =3D of_translate_dma_region(np, maps, &iova, &length);
	if (length =3D=3D 0)
		continue;
=09
	phandle =3D be32_to_cpup(maps++);
	...
}

The loop condition while (maps < end) remains true, and the next iteration
will immediately dereference the NULL pointer at be32_to_cpup(maps++),
causing a kernel panic.=20

[Severity: High]
This is also a pre-existing issue, but does parsing the iommu-addresses
property risk an out-of-bounds read?

The loop in of_iommu_get_resv_regions() advances the maps pointer cell by
cell. If a data cell coincidentally matches a device phandle, it calls
of_translate_dma_region() which blindly delegates the copy:

drivers/of/address.c:__of_translate_address() {
	...
	memcpy(addr, in_addr, na * 4);
	...
}

If there are not enough cells remaining before the end of the property
array, could this read past the allocated bounds of the device tree
property?

> diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/q=
com/sm8550.dtsi
> --- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi

[ ... ]

> @@ -3690,10 +3694,11 @@ &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_O=
NLY>,
>  			resets =3D <&gcc GCC_VIDEO_AXI0_CLK_ARES>;
>  			reset-names =3D "bus";
> =20
> -			iommus =3D <&apps_smmu 0x1940 0>,
> -				 <&apps_smmu 0x1947 0>;
>  			dma-coherent;
> =20
> +			#address-cells =3D <2>;
> +			#size-cells =3D <2>;
> +
>  			/*
>  			 * IRIS firmware is signed by vendors, only
>  			 * enable on boards where the proper signed firmware
> @@ -3701,6 +3706,15 @@ &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ON=
LY>,
>  			 */
>  			status =3D "disabled";
> =20
> +			iris_non_pixel: non-pixel {
> +				iommus =3D <&apps_smmu 0x1940 0x0>;
> +				memory-region =3D <&iris_resv>;
> +			};
> +
> +			iris_pixel: pixel {
> +				iommus =3D <&apps_smmu 0x1947 0x0>;
> +			};
> +
>  			iris_opp_table: opp-table {
>  				compatible =3D "operating-points-v2";

[Severity: High]
Because these child nodes lack compatible strings, they do not bind to any
platform driver. When the driver registers them, is their DMA configuration
left uninitialized?

The driver core calls platform_dma_configure() automatically when a driver
probes. Without a driver binding, the device's iommu_fwspec and DMA ops
remain unconfigured:

drivers/media/platform/qcom/iris/iris_resources.c:iris_create_cb_dev() {
	...
	pdev =3D platform_device_register_full(&plat_dev_info);
	/* of_dma_configure() is not called manually here */
}

When the driver later calls dma_alloc_attrs() for these context bank
devices, will it bypass the IOMMU entirely and trigger SMMU translation
faults?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260709-vpu_iommu_=
iova_handling-v1-0-72bb62cb2dfd@oss.qualcomm.com?part=3D8
