Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6398E44A403
	for <devicetree@vger.kernel.org>; Fri,  7 Aug 2026 08:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786093196; cv=none; b=Byp6J9h7Jsr6wamh1H2m9sazE4tPStlNAhZeuxaBWqfZFR6tn7QJsLU4wBQLEy+Hsox8bXazcHaMaOgABO7l3imjpMTZ9K5ryu+i5kh1OOruDYxI8mXlwWbvbaVODh0Ogpxfm6Sg3Wa9Kvr2UFPdN+ZVbIRxrffN5YQCzAjLHRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786093196; c=relaxed/simple;
	bh=cJERfgpx+SbLAGlw1FUDI6cW91+mDZohk8isFSOLn3M=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=mqvmHwKVZfT4PLbHWSofegXGp/bIoSkhqxbm4Tc3jYAw/lr0jDhdDeL1ARrQIy8xxcxKQgngYBJ+E/al9TGorXqPOWN4xE5V2Tvj66BjXcPOwFRJdgkU6GxdzQ9PvJcT16Xpef0GdHyFFMmmfGhgmdscLgw4Y0neGoS56BIcl0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X0taUyZg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X0taUyZg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B65CA1F000E9;
	Fri,  7 Aug 2026 08:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786093195;
	bh=7Ju1Sitoenr2fAQDlWkvwV7V3fpYQIw95eHvLVkcuRM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=X0taUyZg8+QpcytcpzvYaBzR++2r7GpZ7cXVh+sto9rzjM+WwvnhdAnXq8ZfMf0sV
	 vIiP4JvOXWiNcf5xmJDUd57T4hJPR1/Ot8VkSFxtKBKKG7pU1Rk+IX/GUSdW28tDBB
	 IUuLw6H+92sdl5EwHRU7T0B93li25ptNgHNw3oY6AIKoewaRGVDE5pKHN84K6u9kMA
	 a6f31XIVShP+YFnloiAO3ZJ0oFQFa060cChr1gcxZ8uyJ1zLonP6FLXMGw7mAgHjt2
	 baKSio6oiDgGdahpEc1NgI0Z0MvVyTg9FjZ1hi7rcaUgWFokM7jTYQMFMpDjdrS2nx
	 1hbcIvrwFjZnA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 17/22] arm64: dts: qcom: sc7180: Reserve low IOVA range
 for Venus
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vikash Garodia" <vikash.garodia@oss.qualcomm.com>
Cc: conor+dt@kernel.org, media-ci@linuxtv.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260807-iris_iova_600mb_fix-v1-17-3996f67e33f9@oss.qualcomm.com>
References: <20260807-iris_iova_600mb_fix-v1-0-3996f67e33f9@oss.qualcomm.com>
 <20260807-iris_iova_600mb_fix-v1-17-3996f67e33f9@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 07 Aug 2026 08:59:53 +0000
Message-Id: <20260807085954.B65CA1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Flawed iteration and error handling in of_iommu_get_resv_regions()=
 causes parser corruption and NULL pointer dereference.
--

--- Patch [17]: [PATCH 17/22] arm64: dts: qcom: sc7180: Reserve low IOVA ra=
nge for Venus ---
commit dbfbcf45d9c413275eb757edbb4fc53e7e4ee11b
Author: Vikash Garodia <vikash.garodia@oss.qualcomm.com>

arm64: dts: qcom: sc7180: Reserve low IOVA range for Venus

This commit adds a reserved-memory IOVA node for the Venus VPU covering
the first 600MB. It references this node in the venus video-codec to keep
IOMMU allocations above this boundary and prevent spontaneous reboots
caused by unhandled SMMU page faults.

> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/q=
com/sc7180.dtsi
> index 70fbfb31d4a4d..4ea2dfe311039 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> @@ -692,6 +692,17 @@ rmtfs_mem: memory@94600000 {
>  			qcom,client-id =3D <1>;
>  			qcom,vmid =3D <QCOM_SCM_VMID_MSS_MSA>;
>  		};
> +
> +		/*
> +		 * The Venus VPU reserves IOVA below 0x25800000 (600MB),
> +		 * primarily for non-pixel buffers using different Stream IDs.
> +		 * DMA into that range triggers unhandled SMMU faults and
> +		 * spontaneous reboots, so reserve it to keep IOMMU
> +		 * allocations above this boundary.
> +		 */
> +		venus_iova: venus-iova {
> +			iommu-addresses =3D <&venus 0x0 0x0 0x0 0x25800000>;

[Severity: High]
This isn't a bug introduced by this patch, but adding this iommu-addresses
property exposes a pre-existing flaw in how drivers/iommu/of_iommu.c handles
parsing in of_iommu_get_resv_regions().

If a phandle does not match dev->of_node:

drivers/iommu/of_iommu.c:of_iommu_get_resv_regions() {
    ...
    while (maps < end) {
        ...
        phandle =3D be32_to_cpup(maps++);
        np =3D of_find_node_by_phandle(phandle);

        if (np =3D=3D dev->of_node) {
    ...
}

Does the code fail to advance the maps pointer past the current entry's
address and size cells, corrupting subsequent parsing?

Additionally, if of_translate_dma_region() fails, it returns NULL:

drivers/iommu/of_iommu.c:of_iommu_get_resv_regions() {
    ...
                maps =3D of_translate_dma_region(np, maps, &iova, &length);
                if (length =3D=3D 0) {
                    dev_warn(dev, "Cannot reserve IOVA region of 0 size\n");
                    continue;
                }
    ...
}

Could this leave length and iova uninitialized and set maps to NULL, leading
to a NULL pointer dereference on the next loop iteration?

> +		};
>  	};

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260807-iris_iova_=
600mb_fix-v1-0-3996f67e33f9@oss.qualcomm.com?part=3D17
