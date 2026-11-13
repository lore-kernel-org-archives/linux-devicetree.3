Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794587985;
	b=afQ55sbO0c0zc13d7gLEviscxzpB6KyMje0dONbfn46/HpAwZjey35beTHrm3t3Cjr35
	 eVnLxvIngUm6DU7kGY5EZZyTN1xNHz/AylCBm7K/oqaeylztH2ZvQ/Ao8rh+2AnY1RfYD
	 sy3T8PxbEMRctMFNa63BlBnQv+N31h+3YJdF47/w2wAMSgnJn+WMShsK5w1/UXDVEWobA
	 tsQtXIJ4e/8NurJluGohqzeAAmZ36WGa5uJpjaFyvTCVeku6slf2KUJ5utRViRvAMhzcH
	 2Rw7RMF5SmWTSfZNzlvEblPyipgBK8tQqMVNDmYJFBy7iF5AvC+JMwf1Ot4OGrj5blA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794587985;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=i4h4HKH2GS6z/2Zf2rK+27RgIC+Lc8U/1I7bo+I9VMw=;
	b=VHTC2VNmyCQtQ5UAHWMpb/X3yGlwoDWYx8Lub6wONMkvpK1HRJZvTnFInWsD4re5u0yc
	 E1dCDixs+6LRXnbRkQ0jxtsTfhU7Yl8yTqQWibEmNrJgyAzJM7XgaHDUimEjhEsJrmNBP
	 pH5zVOvMwIuBX+VvvChO4uRfzhbagsmXTH/rsxHP/DM9pUv1VENn9yjaQCIPvbgq0e1gW
	 ilu2kA79qs4mxoG4oNnNkIHusxRfDj2RnBVOS8zxdrgva9ymGU8mNnF9zf4CgiI/EKNbN
	 KUM/40r19pB9iQq759j756FkCxMDccEJZEEUZp4w7W3/cYgYxigDMrc90fVQwlBCBsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ALcdOMa6;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DB4260A3810
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 16:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ALcdOMa6
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5441F1F000C4;
	Fri, 13 Nov 2026 16:39:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794587984;
	bh=i4h4HKH2GS6z/2Zf2rK+27RgIC+Lc8U/1I7bo+I9VMw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ALcdOMa6hO/4+zWLRKfVReliozd0tV/nS9K95tTPfpcs6jwGWaXax15MSQuOIavnj
	 qunIL02zx109VSLtNnbtWw+r9w0Vrp2RW7MoY/Er/82U7h9d8jVg0DuWp23xv6ODIL
	 kGT+GnkrDgOZk3Vzj2TXWov7hvB4Z7ORfalKUFrJGAnK7lJXyriIXX11n/1+0bKsWh
	 9+lzq7Xfsvjc8V1oSNJDkJTggHECANVW7OlKDCbACoVxsmfRWfKIxsHkvGKMLVWzDT
	 dVxyy9tiadUdc/liRi9RsEC2CCRARNJW6f+KW66YKuTLiYc9qsH4o08ZOdStrZ/pK9
	 iDq/PAxMY08Rw==
Message-ID: <sashiko-outbox-213216@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 10/10] ARM: tegra: Add CSI node for Tegra114
Reply-To: sashiko-reviews@lists.linux.dev
To: "Svyatoslav Ryhel" <clamor95@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20261113161819.36847-11-clamor95@gmail.com>
References: <20261113161819.36847-1-clamor95@gmail.com>
 <20261113161819.36847-11-clamor95@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 13 Nov 2026 16:39:43 +0000
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
- [High] ARM: dts: tegra114: undefined TEGRA114_CLK_CSIA_PAD and
  TEGRA114_CLK_CSIB_PAD in csi@800
--

commit f51e7b055195911c3530d9e3bca74397442d3256
Author: Svyatoslav Ryhel <clamor95@gmail.com>

ARM: tegra: Add CSI node for Tegra114

This commit adds the CSI child node under the VI node in the Tegra114
device tree and shrinks the VI node's reg range to accommodate it.

> diff --git a/arch/arm/boot/dts/nvidia/tegra114.dtsi b/arch/arm/boot/dts/n=
vidia/tegra114.dtsi
> index a5958f3a965b2..0d1328c4d3c8e 100644
> --- a/arch/arm/boot/dts/nvidia/tegra114.dtsi
> +++ b/arch/arm/boot/dts/nvidia/tegra114.dtsi
> @@ -53,7 +53,7 @@ host1x@50000000 {
> =20
>  		vi@54080000 {
>  			compatible =3D "nvidia,tegra114-vi";
> -			reg =3D <0x54080000 0x00040000>;
> +			reg =3D <0x54080000 0x00000800>;
>  			interrupts =3D <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>;
>  			clocks =3D <&tegra_car TEGRA114_CLK_VI>;
>  			resets =3D <&tegra_car 20>;
> @@ -64,6 +64,38 @@ vi@54080000 {
>  			iommus =3D <&mc TEGRA_SWGROUP_VI>;
> =20
>  			status =3D "disabled";
> +
> +			#address-cells =3D <1>;
> +			#size-cells =3D <1>;
> +
> +			ranges =3D <0x0 0x54080000 0x4000>;
> +
> +			csi@800 {
> +				compatible =3D "nvidia,tegra114-csi";
> +				reg =3D <0x800 0x200>;
> +				clocks =3D <&tegra_car TEGRA114_CLK_CSI>,
> +					 <&tegra_car TEGRA114_CLK_CSIA_PAD>,
> +					 <&tegra_car TEGRA114_CLK_CSIB_PAD>,
> +					 <&tegra_car TEGRA114_CLK_CILAB>,
> +					 <&tegra_car TEGRA114_CLK_CILCD>,
> +					 <&tegra_car TEGRA114_CLK_CILE>;
> +				clock-names =3D "csi", "csia-pad", "csib-pad",
> +					      "cilab", "cilcd", "cile";

[Severity: High]
Are TEGRA114_CLK_CSIA_PAD and TEGRA114_CLK_CSIB_PAD defined?

include/dt-bindings/clock/tegra114-car.h does not define either macro, and
tegra114_periph_clk_init() in drivers/clk/tegra/clk-tegra114.c does not
register the csia_pad or csib_pad clock gates.  Leaving these macros
undefined causes dtc to fail with a syntax error when building any
Tegra114 device tree.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261113161819.3684=
7-1-clamor95@gmail.com?part=3D10
