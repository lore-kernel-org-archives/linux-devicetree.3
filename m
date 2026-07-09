Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7C623AE1A8
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 09:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783587629; cv=none; b=oNRc40LenrxvIQbZvCDcKXtuJjH4ErB3n/8oDGehuOniiVOtXKXEJSHRyQ3IbouvgznB+vylMfjmiCzSigTw472MQhu+r6kxmeAfjlZiZyn+Z2aDfK775JrOwOdhTHCvSlFF6m/kXURebLpZYDJT1FFL0MNtVuFTqHASSYWEEb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783587629; c=relaxed/simple;
	bh=Z3u6bRs5CnH6CFkloRfu1WNYogSo53cSkVJmZB2sqZI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=toqZ58GOrPJfqn81qVYsNMA9pJ7VbuOc7FmiGQ7OqJIKtYAQAZFjy2VllCy+S51BFHaCSd0jwKGJ4iBcJ1fCDk9V93icUB5SRamxKBudWT6tLnGIe9DKSfeIh4Jr3HzxbqdTHIBnIsRyNIKI9yQfXhN7ZIohlb69EfMqqBuUQDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h3tKAh07; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h3tKAh07"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E74521F00A3A;
	Thu,  9 Jul 2026 09:00:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783587628;
	bh=iiIV8DMw9GERaN2Zgb+Y1HCzKM4RiH4uE1Oc9V79VsY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=h3tKAh07YUZBRK+mWGkirAPciKe7PZiJD1FUwDgfPob63FKHUVGW1DEF2RpYSO9y/
	 0Ii4E/UDy1y2qu+oSFBjd3CGtUstK9b1/xkAgEu8jBTSTmQlSloWyYB8YQ3YoDyYhG
	 LYc3v5mXEODq7tkw1CcXOHBuG8gnn0T5QZjaeQKZOr811oLsXLggrhxSeyNu3anqRS
	 82sm25s+cOSEAmFy+2AqjNbbOKftGHjrja//nQswroNxMZSagCONd4lMYC74dSr1ID
	 S19ZqM1MXkYaPN4NMhQuNNPAMPDnb1Nap3UKMaCFrMLo2ppP5CshzvAMfpS0pBi7z9
	 jBOXHdzqxorSQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 9/9] arm64: dts: renesas: r9a08g046l48-smarc: Add
 USB2.0 support
Reply-To: sashiko-reviews@lists.linux.dev
To: Biju <biju.das.au@gmail.com>
Cc: wsa+renesas@sang-engineering.com, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260709083108.108370-10-biju.das.jz@bp.renesas.com>
References: <20260709083108.108370-1-biju.das.jz@bp.renesas.com>
 <20260709083108.108370-10-biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 09 Jul 2026 09:00:27 +0000
Message-Id: <20260709090027.E74521F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Incomplete and inconsistent USB OTG configuration for Port 0
--

--- Patch [9]: [PATCH v4 9/9] arm64: dts: renesas: r9a08g046l48-smarc: Add =
USB2.0 support ---
commit 1964bef80a134cfc6d3060cab9485db22da3e126
Author: Biju Das <biju.das.jz@bp.renesas.com>

arm64: dts: renesas: r9a08g046l48-smarc: Add USB2.0 support

This commit enables USB2.0 on the RZ/G3L SMARC board. It configures Port 0
as OTG and Port 1 as host-only, including the respective pinmuxing, VBUS
supplies, and PHY resets.

> diff --git a/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts b/arch/ar=
m64/boot/dts/renesas/r9a08g046l48-smarc.dts
> index 5289efd1a430a..6096137e193a1 100644
> --- a/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
> +++ b/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
> @@ -71,6 +71,16 @@ codec_dai: codec {
>  #endif
>  };
> =20
> +&ehci0 {
> +	dr_mode =3D "otg";

[Severity: High]
Does this configuration work properly without a peripheral controller (hsus=
b)
defined in the SoC DTSI to handle device-mode traffic?

> +	status =3D "okay";
> +};
> +
> +&ehci1 {

[ ... ]

> @@ -181,6 +205,16 @@ ssi0_pins: ssi0 {
>  			 <RZG3L_PORT_PINMUX(H, 2, 9)>, /* SSIF0_RCK */
>  			 <RZG3L_PORT_PINMUX(H, 3, 9)>; /* SSIF0_TXD */
>  	};
> +
> +	usb0_pins: usb0 {
> +		pinmux =3D <RZG3L_PORT_PINMUX(3, 0, 12)>, /* USB20_OVRCUR */
> +			 <RZG3L_PORT_PINMUX(3, 1, 12)>; /* USB20_VBUSEN */
> +	};

[Severity: High]
Is there an OTG ID pin that should be routed in this pinmux?

Without the ID pin mapped, cable insertions might not be detected for hardw=
are
role switching.

> +
> +	usb1_pins: usb1 {

[ ... ]

> @@ -241,3 +275,18 @@ &ssi0 {
>  	status =3D "okay";
>  };
>  #endif
> +
> +&usb2_phy0 {
> +	pinctrl-0 =3D <&usb0_pins>;
> +	pinctrl-names =3D "default";
> +	vbus-supply =3D <&usb0_vbus_otg>;

[Severity: High]
Because the ID pin is not mapped in usb0_pins, should this node include the
renesas,no-otg-pins property?

Without it, the PHY driver might attempt to switch roles using a floating
ID pin state. If the unmapped pin floats high, the PHY driver could
unexpectedly switch to device mode and internally disconnect the EHCI/OHCI
controllers, making Port 0 non-functional.

> +	status =3D "okay";
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260709083108.1083=
70-1-biju.das.jz@bp.renesas.com?part=3D9
