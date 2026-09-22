Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E4354E7817
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 20:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790109520; cv=none; b=FVSpGKvkugv6/AbO4HtttgAhM7tjATm3TZCwg9BEFTgiOkwOVdo21y4FhbpgBfLBwBjEuIjyGFgIH+zVI8XMkgYoksaDF4iMartdLAGMSwvHaO0khE6b8gz+ByCY5bgKeSij7JiCcelmwfNwmAhDYqzjsvbVeziT6+KwhwvSv54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790109520; c=relaxed/simple;
	bh=/A3CyaXloDlh9l+Nvn2pGDbcv4Wki9UowrBMT7h18tc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=uBvUaJlQNwYjoAz6eK7+YbEr438e/7g9dQLl/kIJegudQ68nlQoEGZqmvDgUTGmN7LVlo+Q7DPDXQCUUXe9NGvpQeXyJugFoZ/MMHcAED3WsxN7vQ/4gwPc2rVl5yz7bGYM7NubMngFpnKMKXgq3SxGjCDcGnbh8vQAklMtbFQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hYRDEnvY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hYRDEnvY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7BE11F0089C;
	Tue, 22 Sep 2026 20:38:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790109499;
	bh=PlVINrVivQz7mun7Qi5KY9+vpGv02Qtezb6v08vx0cY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hYRDEnvYaWeTvyh73cFclGNaogQ6XD0IP42w0/iIu1RAolvgAwYYHBivWSajgQVgI
	 lnDOiRSiv2GLAdKS5rXQrr9ygLduHtOSBDfbMzuclwtAJGVO4iBOSByf8Goo6TC2hl
	 UTj7QfjwQm2KZ6oOYTbMVGgwGHOlN9CAB0u/WCyaiGFIXT68WDwZOa4v3pgwzdZvGn
	 hHrhrX0nf6h7tdsi7Ve+sZNkoC0p+NRw2ki1rWkg519Ijum3x72Bo6cez8IS56L5S8
	 o48C872P0jZMa1GdSvvGvEjfsyMVdKMVFCg8+SWALNyqkvYCg1VO2QHTaTf2gcF4Fn
	 9sWjjF0PbDHVg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/4] arm64: dts: qcom: Introduce Hawi SoC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mukesh Ojha" <mukesh.ojha@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260923-hawi-dt-post-v1-3-e41473b6298b@oss.qualcomm.com>
References: <20260923-hawi-dt-post-v1-0-e41473b6298b@oss.qualcomm.com>
 <20260923-hawi-dt-post-v1-3-e41473b6298b@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 22 Sep 2026 20:38:18 +0000
Message-Id: <20260922203818.E7BE11F0089C@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] dt: pcie iommu-map property missing mask cell
--

commit b9bce85781ff89249270f3214ceed073984ef78e
Author: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

arm64: dts: qcom: Introduce Hawi SoC

This commit introduces the device tree definition for the Qualcomm Hawi SoC.
It adds a large number of nodes including CPUs, interrupts, timers, reserved
memory, interconnects, SMMU, PCIe, USB, thermal zones, and remoteprocs.

> diff --git a/arch/arm64/boot/dts/qcom/hawi.dtsi b/arch/arm64/boot/dts/qco=
m/hawi.dtsi
> new file mode 100644
> index 0000000000000..c7ae8133b9cdc
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/hawi.dtsi

[ ... ]

> @@ -2957,8 +2957,8 @@
> =20
>  			operating-points-v2 =3D <&pcie0_opp_table>;
> =20
> +			iommu-map =3D <0 &apps_smmu 0x1000 0x1>,
> +				    <0x100 &apps_smmu 0x1001 0x1>;

[Severity: High]
Are we missing a mask cell for the SMMU specifier in this iommu-map propert=
y?

The apps_smmu node defines #iommu-cells =3D <2>, which means the iommu-map
array requires 5 cells per tuple (rid-base, phandle, iommu-base-high,=20
iommu-base-low, length). Providing only 4 cells per tuple can cause the
parser to misalign the tuples, treating the length as part of the iommu-base
mask and stealing the next tuple's rid-base for the length. This completely
breaks parsing of the IOMMU specifier and results in broken PCIe DMA
translation.

> +
> +			interrupt-map =3D <0 0 0 1 &intc 0 0 GIC_ESPI 213 IRQ_TYPE_LEVEL_HIGH=
>,

[ ... ]

> @@ -3139,8 +3139,8 @@
> =20
>  			operating-points-v2 =3D <&pcie1_opp_table>;
> =20
> +			iommu-map =3D <0 &apps_smmu 0x1080 0x1>,
> +				    <0x100 &apps_smmu 0x1081 0x1>;

[Severity: High]
Is this iommu-map array similarly missing a mask cell for the SMMU
specifier?

As with the pcie0 node above, providing 4 cells per tuple when 5 are
expected can cause parsing issues that break the IOMMU specifier.

> +
> +			interrupt-map =3D <0 0 0 1 &intc 0 0 GIC_ESPI 106 IRQ_TYPE_LEVEL_HIGH=
>,

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260923-hawi-dt-po=
st-v1-0-e41473b6298b@oss.qualcomm.com?part=3D3
