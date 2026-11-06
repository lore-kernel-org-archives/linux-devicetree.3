Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793974441;
	b=asc6NmaQu/OwpsPUkAEDuY30rNRO5toQ8+YjN+a8PaWJocpDyLCx1gqmuLahKCoSpODt
	 engSeBy6cKSEmnAh4vGY7DRs2yvbdouXa/3hkoc8MU/6M0jaCERilOomMJyHY0MelfDQg
	 kIh+XikuFUiNp37O/EUXC25cn/UyOSoOZEoEf6x76b9hOD99Id31kCYqzY/gMPWX7PZ2P
	 gqkIygyYEBzxqlRhd+HXGH08EBaizwhBMkiYfBwAjHjnm+oprDP2YaMTKdsIEP4Oy+98U
	 h/ZZCNs1GA/I0k4p+wN2TyMynXne0eZLBAkXBC95SwZSYTU8wZFJVnnECfDm+5OOLDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793974441;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=+eX9Bjxor8QyffzIZxOoWv6TcJ0VD3Bwl+yYwcGITP0=;
	b=Fxt9II/OYSH5ZdQNL+Wwbqx2W+0S2ibVV9t+RfrrqhNEVHLNzZEF7iFBlECFzMrGLGCN
	 SjvcKrPjN8bH2bbxBnQ60bd/VbAUPOCz1LfILMm7ttjDST1SCHEwIecgRTN9EP4WWxtUg
	 8sXRlJKib6RPojIejlYioV7YRhtSL6THLSaF2rc9KtZuE9J9lKq3CSMjsZNXhmjHPAK0S
	 QyHPDJkMmI90Bi1Nu3tYVQ7pj3POcMyblX92kXdgIIdloUvrHPkgeXQ8oers4Sphto7N8
	 6PQgyhZnpSiT3PFlfVZOnWaUNwcATKQhtMKTbhW05tzDGgytmrtp3uAPYS2cElk3cEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lMaxLFqz;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 151B4606A32C
	for <devicetree@vger.kernel.org>; Fri,  6 Nov 2026 14:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lMaxLFqz
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D4331F0089F;
	Fri,  6 Nov 2026 14:14:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793974440;
	bh=+eX9Bjxor8QyffzIZxOoWv6TcJ0VD3Bwl+yYwcGITP0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lMaxLFqz6Hvi8zXCvYgrR5SvhXv4PjDWrpThtMziBcJZaDsGkKayl+M+Qi4ItyPjq
	 E6whSDAY9lQXKNHUWFAEiZ+z+8Pt56DBn0d9tpIS1dMldovC0zNxIBRYMxGkgxSRYh
	 ugAOuhyfgebn+vz5xLTXEhQHFFqzBwv0nYnOu08ui8ZPTGYLabAx1cOI+i7NMiwxu/
	 V4fwH6GCktV479BIKC/6d25cEXzFFlsSXQR8B8ja9wtpoo7PH1D91lfBnDXU1sgw31
	 w7A0OV56bEuoI2jKpHcCss80Span5DuP6DpxF2/iadEZPdhsERI/AL5gB+MKvwyKWx
	 JXwy1P0e5F/DQ==
Message-ID: <sashiko-outbox-201552@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v14 7/9] arm64: dts: qcom: agatti: Add OPE node
Reply-To: sashiko-reviews@lists.linux.dev
To: "Loic Poulain" <loic.poulain@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20261106-camss-isp-ope-v14-7-49c426cd2715@oss.qualcomm.com>
References: <20261106-camss-isp-ope-v14-0-49c426cd2715@oss.qualcomm.com>
 <20261106-camss-isp-ope-v14-7-49c426cd2715@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 06 Nov 2026 14:13:59 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] arm64: dts: qcom: agatti: duplicate OPE SMMU stream IDs in
  camss and isp_ope
--

commit 9d7482129728d89f99954ecd37376475c831380d
Author: Loic Poulain <loic.poulain@oss.qualcomm.com>

arm64: dts: qcom: agatti: Add OPE node

This commit adds the Offline Processing Engine (OPE) device tree node and i=
ts
OPP table for the Agatti (QCM2290) platform.

> diff --git a/arch/arm64/boot/dts/qcom/agatti.dtsi b/arch/arm64/boot/dts/q=
com/agatti.dtsi
> index d9f4cbfd2861c..8f2b451b8f6e8 100644
> --- a/arch/arm64/boot/dts/qcom/agatti.dtsi
> +++ b/arch/arm64/boot/dts/qcom/agatti.dtsi
> @@ -1990,6 +1990,83 @@ port@1 {
>  			};
>  		};
> =20
> +		isp_ope: isp@5c42000 {
> +			compatible =3D "qcom,qcm2290-camss-ope";
> +
> +			reg =3D <0x0 0x5c42000 0x0 0x400>,
> +			      <0x0 0x5c42400 0x0 0x200>,
> +			      <0x0 0x5c42600 0x0 0x200>,
> +			      <0x0 0x5c42800 0x0 0x4400>,
> +			      <0x0 0x5c46c00 0x0 0x190>,
> +			      <0x0 0x5c46d90 0x0 0xa00>;
> +			reg-names =3D "cdm",
> +				    "top",
> +				    "qos",
> +				    "pipeline",
> +				    "bus_read",
> +				    "bus_write";
> +
> +			clocks =3D <&gcc GCC_CAMSS_AXI_CLK>,
> +				 <&gcc GCC_CAMSS_OPE_CLK>,
> +				 <&gcc GCC_CAMSS_OPE_AHB_CLK>,
> +				 <&gcc GCC_CAMSS_NRT_AXI_CLK>,
> +				 <&gcc GCC_CAMSS_TOP_AHB_CLK>;
> +			clock-names =3D "axi",
> +				      "core",
> +				      "iface",
> +				      "nrt",
> +				      "top";
> +
> +			interrupts =3D <GIC_SPI 209 IRQ_TYPE_EDGE_RISING>;
> +
> +			interconnects =3D <&bimc MASTER_APPSS_PROC RPM_ACTIVE_TAG
> +					 &config_noc SLAVE_CAMERA_CFG RPM_ACTIVE_TAG>,
> +					<&mmnrt_virt MASTER_CAMNOC_SF RPM_ALWAYS_TAG
> +					 &bimc SLAVE_EBI1 RPM_ALWAYS_TAG>;
> +			interconnect-names =3D "config",
> +					     "data";
> +
> +			iommus =3D <&apps_smmu 0x800 0x0>,
> +				 <&apps_smmu 0x820 0x0>,
> +				 <&apps_smmu 0x840 0x0>;

[Severity: Medium]
Should the OPE SMMU stream IDs (0x800, 0x820, and 0x840) be removed from the
sibling camss node when adding isp_ope?

arch/arm64/boot/dts/qcom/agatti.dtsi:camss {
    ...
			iommus =3D <&apps_smmu 0x400 0x0>,
				 <&apps_smmu 0x800 0x0>,
				 <&apps_smmu 0x820 0x0>,
				 <&apps_smmu 0x840 0x0>;
    ...
}

When camss is enabled (for example via qrb2210-rb1-vision-mezzanine.dtso),
having both nodes claim stream IDs 0x800, 0x820, and 0x840 causes
arm_smmu_device_group() to merge camss and isp_ope into a single iommu_group
and shared DMA domain instead of isolating them.  In addition, when isp_ope=
 is
probed before camss, arm_smmu_device_group() returns the existing group fou=
nd
on 0x800 without setting smmu->s2crs[idx].group for camss's VFE stream ID
0x400.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261106-camss-isp-=
ope-v14-0-49c426cd2715@oss.qualcomm.com?part=3D7
