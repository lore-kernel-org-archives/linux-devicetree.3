Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 392CC33BBB9
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 17:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783012397; cv=none; b=NooLuQwoTZ7nB+XuNde7taiG6gkluAoHj6pZKqXfofNtQMVFseFpnrGs/g1CzuDOnnn2CaZKqEaZ8vU1/f/FCPcNxBYAEwAIyTLrbiayxirOsftx0odIP8QUT5TVBEYKR/72LbjZ+noynharAW2oK4uFfAUgl6yJA855iIroFEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783012397; c=relaxed/simple;
	bh=3Sq9NWqk01Qd02Xox+Vg48FcS2H1D32g83iH80vVLdI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=q/f9OhtDEGQYwUP52tmM+D9oC/oDQh1GD4VulQnpB4l4Usm1KxyRmpAPid/BMSta0TeF3yoratguw7yImmNObaVhAd7cqHOXdWs+sUG6XPFMgT3/60PCT1+5iRqO2eL/fHd8n4U6nSEIp64JhUwKAKjqWw9yPOgWRIWUS8nh3mI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZJMIY6d7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZJMIY6d7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 921CF1F000E9;
	Thu,  2 Jul 2026 17:13:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783012395;
	bh=TAI6xvac09OQ43TUmX5+W2G1+KX9IUL/XqE5ktb7LyY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZJMIY6d7dG5yb8G7DqRxMT4WA7wxMH3lYSQcKo+zYqu0z+YEZoAdecvZNNLS9USVv
	 +gIKHY+APiMXsznjisRiQjGbaaBl5upJ8J3NyFuKdE9yfYnCfQDSlaHghyj5ijXQKG
	 OnbVG6Kzye6hHWFnoKXjeK/84801Pw7Qq/f6KiZgU9qprRwQbH0xDe0SqYkQeddhh/
	 z19nPk/zSpf7+iC/SaI4jdlPpBtBocapNVF7M34qeSF/tpLZi4fZkDMZYGPehWTeFI
	 G2cCZyo2Le7O0cKA6LSbww97I+DYXhPlFlysC6BjusUQmc+GuijcSCuUuDuA0p7cl3
	 qXNmRvgcNjhag==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] ARM: dts: aspeed: Add NVIDIA VR-NVL BMC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jacky Huang" <jackyhuang@nvidia.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260702165524.2168091-3-jackyhuang@nvidia.com>
References: <20260702165524.2168091-1-jackyhuang@nvidia.com>
 <20260702165524.2168091-3-jackyhuang@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 02 Jul 2026 17:13:13 +0000
Message-Id: <20260702171315.921CF1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Incorrect USB node hierarchy for `cp2112a` and `cp2112b` prevents =
GPIO controller registration.
- [Low] Incorrect `compatible` strings are used for I2C GPIO expanders `exp=
7` and `exp18` given their specified I2C hardware addresses.
--

commit a02cef965c4453f472b6eb79d68aef51b62a7f10
Author: Jacky Huang <jackyhuang@nvidia.com>

ARM: dts: aspeed: Add NVIDIA VR-NVL BMC

This commit adds the device tree for the Aspeed AST2600 BMC for NVIDIA's
Vera Rubin NVL compute platform. It configures the on-board components,
including network interfaces, USB hubs, and multiple I2C devices.

Link: https://lore.kernel.org/all/20260629105202.1417679-1-jackyhuang@nvidi=
a.com/

> diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-vr-nvl-bmc.dts b/=
arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-vr-nvl-bmc.dts
> new file mode 100644
> index 0000000000000..f035e9b28f64b
> --- /dev/null
> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-vr-nvl-bmc.dts
> @@ -0,0 +1,901 @@
[ ... ]
> +				device@1 {
> +					reg =3D <1>;
> +					#address-cells =3D <2>;
> +					#size-cells =3D <0>;
> +
> +					cp2112a: interface@1 {
> +						reg =3D <1 1>;
> +						gpio-controller;
> +						#gpio-cells =3D <2>;
> +						interrupt-controller;
> +						#interrupt-cells =3D <2>;
> +					};
> +				};

[Severity: High]
Will placing these GPIO controller properties inside the interface subnode
cause them to be ignored by the USB OF core?

Since cp2112 devices expose a single HID interface, the kernel's
usb_of_has_combined_node() assigns the parent device node to the interface
and skips subnodes. This setup might prevent the hid-cp2112 driver from
finding these properties and registering the GPIO controllers.

Should these properties be placed directly on the device node, similar to
how cp2112c is configured in this same file?

[ ... ]
> +				device@1 {
> +					reg =3D <1>;
> +					#address-cells =3D <2>;
> +					#size-cells =3D <0>;
> +
> +					cp2112b: interface@1 {
> +						reg =3D <1 1>;
> +						gpio-controller;
> +						#gpio-cells =3D <2>;
> +						interrupt-controller;
> +						#interrupt-cells =3D <2>;
> +					};
> +				};

[Severity: High]
Is this interface subnode for cp2112b susceptible to the same OF node
combining regression mentioned above?

[ ... ]
> +	exp7: gpio@75 {
> +		compatible =3D "nxp,pca9555";
> +		reg =3D <0x75>;
> +		interrupt-parent =3D <&gpio1>;
> +		interrupts =3D <ASPEED_GPIO(B, 6) IRQ_TYPE_LEVEL_LOW>;

[Severity: Low]
Does the compatible string nxp,pca9555 match the hardware at I2C address
0x75?

The PCA9555 has a fixed internal slave address prefix that restricts it to
I2C addresses 0x20 through 0x27. An I2C device at address 0x75 is typically
a PCA9539.

While the shared gpio-pca953x driver probes this successfully either way,
should the compatible string be updated to accurately describe the hardware?

[ ... ]
> +	exp18: gpio@38 {
> +		compatible =3D "nxp,pca9554";
> +		reg =3D <0x38>;
> +		interrupt-parent =3D <&gpio1>;
> +		interrupts =3D <ASPEED_GPIO(B, 6) IRQ_TYPE_LEVEL_LOW>;

[Severity: Low]
Is nxp,pca9554 the correct compatible string for a device at I2C address
0x38?

Similar to the pca9555 above, the base PCA9554 is restricted to addresses
0x20 through 0x27. An address of 0x38 typically corresponds to a PCA9554A.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260702165524.2168=
091-1-jackyhuang@nvidia.com?part=3D2
