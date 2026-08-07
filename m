Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70A3D37B41E
	for <devicetree@vger.kernel.org>; Fri,  7 Aug 2026 09:05:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786093538; cv=none; b=WsypBFCBjDuXgVgBGOfohrL5bw1hRFQoLNPRCV8kx9G6L3PTqYDHHIbxVu+8sCfZxwekKj037aT49IC8qU/j3fxT6pLiV87xiVTDYHzoJorCPFdKyVPHbi5ziQyBHV/chsDXtB5UB7diW3984nlflksJqBjFgXs4siNJp2897QQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786093538; c=relaxed/simple;
	bh=1oyx6BQsv8cOyTe4WPKHVtV4QFUtmwekzJ2tkUseS28=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=fSnC50jf6DEo5JPY0uAf9bauhqbTVcSCYHf5mkkBFvQjzSioHXibgSghnPlqtIeTOgmgL+G4+bewzRG3znDbp1z4+ztP+NNX8ngrceqPQB1tFzkgvmldxsOD9+l9cJMQNbLnAkxiCxfD2m/yn9Ao5ZjKXM0sui24peONn3fQjXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SGWhob0N; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SGWhob0N"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53C481F000E9;
	Fri,  7 Aug 2026 09:05:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786093536;
	bh=JewU6e6amu/VnLHYcdup0e/jD8wgR0pF8SBAAsRuaUM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SGWhob0NYwiETwz7/QwnxfI5LcbRSJw8jPNrmMOsZvNB5USVMbiHYEnd28DI3G1QX
	 CgLtivHbwZBS0NnR7Zq1n/mb4BzMfw+zNt9mRbfjEG2+rbHZy/QZf6lKiiz6mOyaKR
	 6eXNFdkEb9eBRP6mNqLOx5zgj+Jj3IffqsTAGzTI8+PdeqKcqhCkZkwTSQ5C8O2Aq9
	 ttFln6hpY1KmrIEmyIcjGK+kuCpiu/IzHThL/HsOorBiYEBkpatHbsVB56yY/WAXJt
	 q0lTAt1fPYIrm5SOuGKfQFpBBbu68PrhMW47JMHzHi5rkRGcD+kHHLEw09dcvIkQWr
	 grld5nKkaMjog==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 20/22] arm64: dts: qcom: sm6115: Reserve low IOVA range
 for Venus
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vikash Garodia" <vikash.garodia@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, media-ci@linuxtv.org, robh@kernel.org
In-Reply-To: <20260807-iris_iova_600mb_fix-v1-20-3996f67e33f9@oss.qualcomm.com>
References: <20260807-iris_iova_600mb_fix-v1-0-3996f67e33f9@oss.qualcomm.com>
 <20260807-iris_iova_600mb_fix-v1-20-3996f67e33f9@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 07 Aug 2026 09:05:35 +0000
Message-Id: <20260807090536.53C481F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [Low] The `venus-iova` node lacks required `reg` or `size` properties and=
 relies on an undocumented property, violating the `reserved-memory` schema.

Pre-existing issues:
- [High] Reference leak and parsing desync in `of_iommu_get_resv_regions` w=
hen parsing `iommu-addresses` for unmatched devices.
- [High] NULL pointer dereference in `of_iommu_get_resv_regions` if `of_tra=
nslate_dma_region` fails.
--

--- Patch [20]: [PATCH 20/22] arm64: dts: qcom: sm6115: Reserve low IOVA ra=
nge for Venus ---
commit bec476bec203ee86c0c6ea293d84bdd69fa09d6f
Author: Vikash Garodia <vikash.garodia@oss.qualcomm.com>

arm64: dts: qcom: sm6115: Reserve low IOVA range for Venus

Venus VPU reserves IOVA addresses below 0x25800000 (600MB), primarily for
secure non-pixel buffers. Add a reserved-memory IOVA reservation node
covering [0, 0x25800000] and reference it from the venus node.

Cc: stable@vger.kernel.org

> diff --git a/arch/arm64/boot/dts/qcom/sm6115.dtsi b/arch/arm64/boot/dts/q=
com/sm6115.dtsi
> index 3520802d1fed5..93f4eb8d18a71 100644
> --- a/arch/arm64/boot/dts/qcom/sm6115.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm6115.dtsi

[ ... ]

> @@ -532,6 +532,17 @@ rmtfs_mem: memory@89b01000 {
>  			qcom,client-id =3D <1>;
>  			qcom,vmid =3D <QCOM_SCM_VMID_MSS_MSA QCOM_SCM_VMID_NAV>;
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

[Severity: Low]
Will this fail devicetree validation tooling? The venus_iova node appears
to be missing the standard reg or size properties, and relies on the
undocumented iommu-addresses property, which might violate the core
reserved-memory devicetree schema.

[Severity: High]
This isn't a bug introduced by this patch, but using the iommu-addresses
property here exposes an existing reference leak and parsing desynchronizat=
ion
in drivers/iommu/of_iommu.c:of_iommu_get_resv_regions().

If the property contains a phandle that does not match dev->of_node,
the node reference is leaked:

drivers/iommu/of_iommu.c:of_iommu_get_resv_regions() {
    ...
            phandle =3D be32_to_cpup(maps++);
            np =3D of_find_node_by_phandle(phandle);

            if (np =3D=3D dev->of_node) {
    ...
}

Because the if block is skipped for unmatched devices, of_node_put(np) is
never called. Furthermore, the maps pointer is not advanced past the device=
's
address and size cells. Would this cause the next loop iteration to read the
address/size as a phandle, corrupting all subsequent parsing?

[Severity: High]
This is also a pre-existing issue, but utilizing iommu-addresses here could
trigger a NULL pointer dereference in the same parsing function.

If of_translate_dma_region() returns NULL on a translation error (such as a
bad address or missing DMA parent):

drivers/iommu/of_iommu.c:of_iommu_get_resv_regions() {
    ...
                maps =3D of_translate_dma_region(np, maps, &iova, &length);
    ...
}

The maps pointer becomes NULL and is directly dereferenced in the next
iteration of the while loop. Could this cause a kernel panic during device
probe if the devicetree configuration is malformed?

> +		};
>  	};
> =20
>  	smp2p-adsp {

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260807-iris_iova_=
600mb_fix-v1-0-3996f67e33f9@oss.qualcomm.com?part=3D20
