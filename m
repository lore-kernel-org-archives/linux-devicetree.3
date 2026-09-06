Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B395A3B14B3
	for <devicetree@vger.kernel.org>; Sun,  6 Sep 2026 04:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788667737; cv=none; b=MjFiqvGdpy0As6rhAIfM06mjYW8znKsNWtm7zHJR4k8sEJzkRrf0Y3sITwb/tSg7tmWca1gXgG4Nq8KURM6U7RqD6+ZJrxZITdJT8h5++Zy/7XBm/Wl6CQQwkxCEuUBSYd+z1coB1XQlMO+uN5nLFoTKLlH8O/tO+i5RZvg0SUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788667737; c=relaxed/simple;
	bh=kCK+H85JiwvOdo387mxEooSwhxGvUBvDW8zT0GWmV0I=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=VLGwDdcmvGuWuhWeCoRs5FSwnjy52vGyjSmNpheLEyewizh88OZYaXeDlEsQonmGTd1PoXWassgGi4uZDMyGYlGY+4mAqrMktLCZmJE7LIMGgCInCOXGssiIVxh3lEP+1IWR1XepmXnekPt0x0tl/EvYrhPX+8LY/KSTXZJVQ54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IqrIO4c8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IqrIO4c8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 309AA1F00A3A;
	Sun,  6 Sep 2026 04:08:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788667733;
	bh=mz1zlM6o+K4M8nCLShoHgbxIy2Fhy08OI09upwLCSiA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IqrIO4c8JEYVagP8GPHqMNrjB4XYnM/TXeMmA5paq311zlqkpCadSBBIMaw1uYx1A
	 iCEb4EBF/mmSVlZc3wvHXStZ5cpFFuDIY7qveus0B9JTuVsslZKHrGn1Z/EpV/P0ay
	 EJ0DdUadzl68KoDOO4/Ulzl2RvuSaSH7FJO7YcrVmAgZDJgWk/TtaZ/1Nz/v1uNrNj
	 j3MVIKG3lPvW3xYi85PmAvCzwCPs2agpg/AN3eNv9vY3QUcdpstUJxs5JliFNmZkdv
	 7ekzbVNro7hFKcJkE2IWegU2zAt6bCt+JXbOV9r7cr0E2X42RD4rJvtfstwwjD3DOk
	 b0YvM78vhlAgA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 10/10] arm64: dts: qcom: ipq9574: Flatten usb
 controller node
Reply-To: sashiko-reviews@lists.linux.dev
To: "George Moussalem" <george.moussalem@outlook.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260906-ipq-flatten-usb-v2-10-dab83120b10a@outlook.com>
References: <20260906-ipq-flatten-usb-v2-0-dab83120b10a@outlook.com>
 <20260906-ipq-flatten-usb-v2-10-dab83120b10a@outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 06 Sep 2026 04:08:52 +0000
Message-Id: <20260906040853.309AA1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Devicetree Schema Violation: Incorrect ordering of `interrupt-names=
` for `qcom,snps-dwc3`.
--

commit 83a48e27af172a1417a53f107382ebfe032982cc
Author: George Moussalem <george.moussalem@outlook.com>

arm64: dts: qcom: ipq9574: Flatten usb controller node
   =20
Flatten usb controller nodes and update to using latest bindings and
flattened driver approach.

> diff --git a/arch/arm64/boot/dts/qcom/ipq9574.dtsi b/arch/arm64/boot/dts/=
qcom/ipq9574.dtsi
> index 5a5bda5f21a11..cf2eacb16c360 100644
> --- a/arch/arm64/boot/dts/qcom/ipq9574.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
[ ... ]
> @@ -780,32 +777,29 @@ usb3: usb@8af8800 {
>  			assigned-clock-rates =3D <200000000>,
>  					       <24000000>;
> =20
> -			interrupts-extended =3D <&intc GIC_SPI 134 IRQ_TYPE_LEVEL_HIGH>,
> +			interrupts-extended =3D <&intc GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>,
> +					      <&intc GIC_SPI 134 IRQ_TYPE_LEVEL_HIGH>,
>  					      <&intc GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH>,
>  					      <&intc GIC_SPI 111 IRQ_TYPE_LEVEL_HIGH>,
>  					      <&intc GIC_SPI 112 IRQ_TYPE_LEVEL_HIGH>;
> -			interrupt-names =3D "pwr_event",
> +			interrupt-names =3D "dwc_usb3",
> +					  "pwr_event",
>  					  "qusb2_phy",
>  					  "dm_hs_phy_irq",
>  					  "dp_hs_phy_irq";

[Severity: Low]
Will this ordering cause a dtbs_check validation failure?

The qcom,snps-dwc3.yaml binding strictly requires the interrupt names for
qcom,ipq9574-dwc3 to follow an exact order: dwc_usb3, pwr_event, qusb2_phy,
dp_hs_phy_irq, and dm_hs_phy_irq.

Here in usb3: usb@8a00000, dm_hs_phy_irq appears before dp_hs_phy_irq, which
preserves the legacy ordering instead of matching the updated binding.

Could the interrupt-names and their corresponding interrupts-extended mappi=
ngs
be swapped to match the schema?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260906-ipq-flatte=
n-usb-v2-0-dab83120b10a@outlook.com?part=3D10
