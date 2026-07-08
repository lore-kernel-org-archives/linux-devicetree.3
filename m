Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F93B3AC0FA
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 01:00:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783472408; cv=none; b=sddLVZCLOdsFKAnIXGIFMKsUh8c9XesNlY9uIVaaaJfoFlxsyy3BIKBBJSyUndjJpHBqRd0sctz1UEQlychJLlknkATH0+I7gxNnVWX/Udp8pJ0ymiQqn3w3Au0+9MTcWa4rcRYluJIhQI+NdXvT6KLjxSOsgpjcEYP8sge5oq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783472408; c=relaxed/simple;
	bh=BZbhaMPnisUMddABItlKTG8B4ODkGaT0d6sfHHdA5kc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=BvZUhMjRL6x4mW1h12aoHOXqEPUvEcmgFoXVjgYtgYKKXbru31ejzZyij7tdD5UFiOJzosT10BWVgaX3t5NQ4gNkdn8iXKHju3jciHbceJfGv+140REmq51EVZAbwN1oqMURmjjNli0bj/Bv0ibZpwolSUrYzFY0KRMe8WmlNuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=le1sHrL8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="le1sHrL8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC95A1F000E9;
	Wed,  8 Jul 2026 01:00:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783472407;
	bh=iDjx24G5vExz3yhf//bp/DdDgJyRH1q3i27FADJxGjA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=le1sHrL8jJxP9uhIGlJx+SsPcNSGjoMiA9whG1le5lqGmcbJZzcbnMRERfKRqU6bY
	 fRte0Pv6Tb4YbS+AEFtejfIlxxN/U1PPzOWXyoUl8HIozLDNKPgYeOR7RRU5kHHoDa
	 qXda1G0oruv6YvbHrsF+nyfE93YGZO+pp+onihng8Qot2yFRXap+oRpXHcigeuUq3c
	 5PPN9XCl6PVFKJW6XBB/Brav2LvAVtnLUKghgOCNX3o1CvxWlEVKvFEr+RQoaqhxH3
	 hjNa0aJO7FvOxJzypP1k1zuXsJHx3WUOV4fCWV8AI0Fsz7O0ST+vUnhwIqXaOKxvMU
	 KEmQlhEmAQVgQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 03/11] arm64: dts: qcom: x1e80100: Add CAMSS block
 definition
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?QnJ5YW4gTydEb25vZ2h1ZQ==?= <bryan.odonoghue@linaro.org>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260708-x1e-camss-csi2-phy-dtsi-v4-3-572348ad1b2a@linaro.org>
References: <20260708-x1e-camss-csi2-phy-dtsi-v4-0-572348ad1b2a@linaro.org>
 <20260708-x1e-camss-csi2-phy-dtsi-v4-3-572348ad1b2a@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 08 Jul 2026 01:00:06 +0000
Message-Id: <20260708010006.DC95A1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Phantom standalone PHY child nodes inside the `camss` node violate=
 the CAMSS driver architecture and trap essential power domains, risking sy=
stem hangs.
- [Medium] The commit message claims '2 x CSID', but the patch actually map=
s and exposes 3 CSID blocks.
--

--- Patch [3]: [PATCH v4 03/11] arm64: dts: qcom: x1e80100: Add CAMSS block=
 definition ---
commit 9011a44664267ff0299bfa7f7504bc4b9b3c798b
Author: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

arm64: dts: qcom: x1e80100: Add CAMSS block definition

This commit adds the device tree node to describe the x1e80100 CAMSS block,
including CSIPHY, TPG, CSID, and IFE components.

> 2 x CSID

[Severity: Medium]
Is this description accurate?

The commit message states there are 2 x CSID blocks, but the device tree
addition maps 3 CSID instances (csid0, csid1, and csid2). Should the commit
message be updated to reflect the 3 instances?

> diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qc=
om/hamoa.dtsi
> index 6a14d7c9a7ec4..e043095f2da74 100644
> --- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
> +++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
[ ... ]
> @@ -5629,6 +5630,368 @@ cci1_i2c1: i2c-bus@1 {
[ ... ]
> +		camss: isp@acb7000 {
> +			compatible =3D "qcom,x1e80100-camss";
> +
> +			reg =3D <0 0x0acb7000 0 0x2000>,
> +			      <0 0x0acb9000 0 0x2000>,
> +			      <0 0x0acbb000 0 0x2000>,
> +			      <0 0x0acc6000 0 0x1000>,
> +			      <0 0x0acca000 0 0x1000>,
> +			      <0 0x0acb6000 0 0x1000>,
> +			      <0 0x0ace4000 0 0x1000>,
> +			      <0 0x0ace6000 0 0x1000>,
> +			      <0 0x0ace8000 0 0x1000>,
> +			      <0 0x0acec000 0 0x4000>,
[ ... ]
> +			phys =3D <&csiphy0 PHY_TYPE_DPHY>,
> +			       <&csiphy1 PHY_TYPE_DPHY>,
> +			       <&csiphy2 PHY_TYPE_DPHY>,
> +			       <&csiphy4 PHY_TYPE_DPHY>;
> +			phy-names =3D "csiphy0",
> +				    "csiphy1",
> +				    "csiphy2",
> +				    "csiphy4";
[ ... ]
> +			csiphy0: phy@ace4000 {
> +				compatible =3D "qcom,x1e80100-csi2-phy";
> +				reg =3D <0 0x0ace4000 0 0x2000>;
> +
> +				clocks =3D <&camcc CAM_CC_CSIPHY0_CLK>,
> +					 <&camcc CAM_CC_CSI0PHYTIMER_CLK>,
> +					 <&camcc CAM_CC_CORE_AHB_CLK>;
> +				clock-names =3D "core",
> +					      "timer",
> +					      "ahb";
> +
> +				operating-points-v2 =3D <&csiphy_mxc_opp_table>;
> +
> +				interrupts =3D <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>;
> +
> +				power-domains =3D <&camcc CAM_CC_TITAN_TOP_GDSC>,
> +						<&rpmhpd RPMHPD_MMCX>,
> +						<&rpmhpd RPMHPD_MXC>;
> +				power-domain-names =3D "top",
> +						     "mmcx",
> +						     "mx";

[Severity: High]
Will this cause a system hang when attempting to access the CSIPHY hardware?

It looks like the upstream CAMSS driver directly maps these PHY registers in
the parent camss node's reg block, and does not use the generic PHY framewo=
rk
defined by the phys and phy-names properties.

Since no driver binds to the qcom,x1e80100-csi2-phy compatible string, these
child nodes appear to be dead code that trap the RPMHPD_MMCX and RPMHPD_MXC
power domains.=20

If these power domains are never enabled by a PHY driver, could probing the
CAMSS driver and accessing the CSIPHY registers result in unpowered hardware
and a bus hang?

Also, does the reg property here (0x0ace4000) improperly overlap with the
parent node's reg claim?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260708-x1e-camss-=
csi2-phy-dtsi-v4-0-572348ad1b2a@linaro.org?part=3D3
