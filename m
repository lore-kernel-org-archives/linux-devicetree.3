Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DE9344998D
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 09:15:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790241361; cv=none; b=qoSaCkMwINKLqsoBOuPwMeRRhrOrai/C5ay2M8iSyMfkSx+yP6pjalm1cjZuFB17o1eFdwA/hlq54QMk/v+DNEk6YhHDg+t63Ap1TtTGV8xNeUooacI+w1vATpPO8FhDskiFrc6Ylp2j9+5+6lPFtIq8Y1eny4kk2LusYTAqMD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790241361; c=relaxed/simple;
	bh=p7AVyvlymj6MoqX64GIarTOJfYS+ml3uliL928n+4RM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ToihMfF0wPtvMA3hL44LlofZBnx/s4HNitQLOXhKaY1ot/mQTpkRFJC9sUFwUxAxf9Wl08qPqbaqldLJQZ0Tw+tbGCgvSxYsNSvrCEAFKFFtMeEcIcC5VL18ulJUFCB9H8tuN2EvjNK02WmDhZEo7aNAcpXjH+c7KpmN/NYZky8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UBN8v8G5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UBN8v8G5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA77A1F000FF;
	Thu, 24 Sep 2026 09:15:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790241356;
	bh=PPpz8bx3oMLJ+eTe9EePAHyFnVT1JM3JeuoAb9VAH/o=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UBN8v8G53jsdf48snFCcN85b3EwP6AzLp45q11nmxZWCW5IFwS6/Hag71tyaPmdyW
	 Tyf8zLClzaof8sRSwkQiCu5Br0vBoVdMwwoM0pSqEkbFgxM5LsxN1OdM1sLON3iLJG
	 GNnbCfBeqe9uZiLjTh9iN2PB3hv5jSoOe/gaSxhjTP/SVcoCygcuoMrKFSOqUaxTOy
	 CKRja6FeC2P1/p9ruxcVX5L6vfBVk0BXMmg9h0sIYUhp51FczYlEY7qi2u0HBGsSB4
	 PnSiMnSvLajyX56/s0C5JGMwy0gmVcbgfa4CndQChI+CwxuiNjgISQ2l4X3PMKOzGo
	 4FWQ+KaC0OKEA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 6/7] ARM: tegra: lg-x3: Add haptic engine node
Reply-To: sashiko-reviews@lists.linux.dev
To: "Svyatoslav Ryhel" <clamor95@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260924090608.28734-7-clamor95@gmail.com>
References: <20260924090608.28734-1-clamor95@gmail.com>
 <20260924090608.28734-7-clamor95@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 24 Sep 2026 09:15:55 +0000
Message-Id: <20260924091555.BA77A1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] dts: missing dt-binding schema for Imagis ISA1200 haptic engine
--

commit bcc2e5a5981cf130d7fde2c4cf8724ed6f15c474
Author: Svyatoslav Ryhel <clamor95@gmail.com>

ARM: tegra: lg-x3: Add haptic engine node

This commit adds a device tree node for the Imagis ISA1200 haptic motor
driver used in the tegra30-lg-x3 device.

> diff --git a/arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi b/arch/arm/boot/=
dts/nvidia/tegra30-lg-x3.dtsi
> index 14d4f992222c6..c7ad3819c21d9 100644
> --- a/arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi
> +++ b/arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi
> @@ -1568,6 +1568,30 @@ power-sensor@40 {
>  			vs-supply =3D <&vdd_3v0_sen>;
>  		};
> =20
> +		haptic-engine@49 {
> +			compatible =3D "imagis,isa1200";
> +			reg =3D <0x49>;
> +
> +			control-gpios =3D <&gpio TEGRA_GPIO(H, 1) GPIO_ACTIVE_HIGH>;
> +
> +			pwms =3D <&pwm 3 53000>;
> +
> +			vdd-supply =3D <&vdd_3v3_vbat>;
> +			vddp-supply =3D <&vdd_1v8_vio>;
> +
> +			imagis,clk-div =3D <128>;
> +			imagis,pll-div =3D <1>;
> +
> +			imagis,mode =3D <0>; /* LRA_MODE */
> +			imagis,duty-cycle-ns =3D <1250>;
> +
> +			ldo {
> +				regulator-name =3D "vdd_vib";
> +				regulator-min-microvolt =3D <2300000>;
> +				regulator-max-microvolt =3D <2300000>;
> +			};
> +		};

[Severity: Medium]
Are the dt-binding schema and the driver for the "imagis,isa1200" compatible
string missing?

There appears to be no dt-binding schema (YAML or txt) documenting these
custom vendor properties (e.g., "imagis,clk-div", "imagis,mode") or the "ld=
o"
subnode, nor a driver that matches this compatible.

Adding undocumented properties and using magic values (e.g.,
`<0> /* LRA_MODE */` instead of a dt-binding macro) violates device tree
standards, causes `make dtbs_check` validation failures, and establishes an
unreviewed ABI.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260924090608.2873=
4-1-clamor95@gmail.com?part=3D6
