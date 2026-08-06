Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E473427F82
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 10:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786013287; cv=none; b=HU+8/0e5C2/IhIrKQf5B8SUJDT10Q7BQwpyzxQWImN265rYYIMk19oq5/px+s8tNx84rxSQQQ4eohmXFvoHfl6bvEL1ZjhvciFmMXM8Et5kfnsMzXZJTGPobvCgYop8J5i6jmFxgw2Si2Fdt02iALIBDIUPjvFjhzWV4bLgytmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786013287; c=relaxed/simple;
	bh=jAmZo8qMeNe6EM9XUIleu557pCqReOOdyWRUWOavMxo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=b6wq7eIirGRm4C5/ja4BICtkgqMckJp+4Cc5tb/djyItvJajz3KIo/S1iL6e02KB5nst/UHaJpWVJp5fFFKA66wT3ggZMcSsAqhlzaJW2OylPOKoWpUn3Wa2zKexkt5vI04AZ+SovtzowFhsL35VX5haTcOvyP1Hd2LlOHztfLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PYxL+8Y3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PYxL+8Y3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B9181F000E9;
	Thu,  6 Aug 2026 10:48:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786013284;
	bh=eeTckUPtxcLF55Cbb1Z8tBtqNbZFaw40dB+0uGaOIF4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PYxL+8Y3e30jrfY3Mz/IMLLSH5Bc8Jn4X8xv57T7Mk/bK8Ws++weEb/FU1ad5UXCy
	 q/7hLu1LMjMNVew09jv8V+b1AnxkAJFycHgs5iQ3DVosLxpu8ey7GzGmGlpXLfTtuF
	 uEnU2Csf+IJXePzsqZJy4aBKT0huQ2eQx41ztEZkGoragl7+y3+Y+3R7/c5ISRhWOu
	 Q/eFn0zQq+ouGlTZ8veyjzjkN+S7LsEwkvaLn6m0y6o4G8ITJmrhuaU9KDtyTfeeS6
	 A0IFuBC8eSIfW2zz/2qQ6n/C+NfnPGF+gAJwEQhVpGj8lmwEmoLjqEm+Mj83mFxhYP
	 oogq00EfbOygg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 10/10] arm64: dts: renesas: r9a08g046l48-smarc: Add
 USB2.0 support
Reply-To: sashiko-reviews@lists.linux.dev
To: Biju <biju.das.au@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, wsa+renesas@sang-engineering.com
In-Reply-To: <20260806102236.149159-11-biju.das.jz@bp.renesas.com>
References: <20260806102236.149159-1-biju.das.jz@bp.renesas.com>
 <20260806102236.149159-11-biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 06 Aug 2026 10:48:03 +0000
Message-Id: <20260806104804.7B9181F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Port 0 is configured as OTG but uses host-only pinmux assignments,=
 omitting the OTG_ID and VBUS detection pins.
- [High] The `hsusb` (USB 2.0 peripheral controller) is not enabled, which =
breaks the intended USB OTG (dual-role) functionality on Port 0.
--

--- Patch [10]: [PATCH v6 10/10] arm64: dts: renesas: r9a08g046l48-smarc: A=
dd USB2.0 support ---
commit 1cbadfb3da8608db303bdf06f3c33654c1b1550b
Author: Biju Das <biju.das.jz@bp.renesas.com>

arm64: dts: renesas: r9a08g046l48-smarc: Add USB2.0 support
   =20
Enable USB2.0 on the RZ/G3L SMARC board (r9a08g046l48-smarc). Port 0
(ehci0, ohci0, usb2_phy0) is configured as OTG and Port 1 is configured
as host-only. The phyrst USB PHY reset controller is also enabled.

> diff --git a/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts b/arch/ar=
m64/boot/dts/renesas/r9a08g046l48-smarc.dts
> --- a/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
> +++ b/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
> @@ -71,6 +71,16 @@ codec_dai: codec {
>  #endif
>  };
> =20
> +&ehci0 {
> +	dr_mode =3D "otg";
> +	status =3D "okay";
> +};

[Severity: High]
Port 0 is explicitly configured for OTG, which requires both a host
controller and a peripheral controller. However, the device tree for the
RZ/G3L SoC appears to lack the hsusb peripheral controller node.

If the PHY attempts to switch to peripheral mode when a device cable is
attached, will this silently fail to operate in device mode because there
is no USB gadget controller instantiated to handle the traffic?

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
This pinmux defines the OTG port configuration, but it seems to omit the
OTG_ID and VBUS detection pins. Since renesas,no-otg-pins is not
specified for usb2_phy0 later in the patch, the PHY driver expects
hardware role detection based on the ID pin.

Without the OTG_ID pin configured, can the physical PHY accurately detect
role changes? Could leaving this unconfigured cause the pin state to float,
preventing role switching entirely or causing spurious role changes that
break USB functionality?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260806102236.1491=
59-1-biju.das.jz@bp.renesas.com?part=3D10
