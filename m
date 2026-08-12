Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DCF0274B46
	for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 16:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786550904; cv=none; b=SMZ54dHHjO28/gjwBkXiy4LJlQUnbG9c2dInWoSUaI+ELID42KjlgdBluv7KVeHF1rgW22nArMjrFvJwTDKH0Y/zLKOB+PAVXLpRJdv4Xcg9UjcBCpNtCO0o6zy4zfpekn0NXYubpUMHCq8ovv0CBBmBNIdc1hzyffdBTB3mvmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786550904; c=relaxed/simple;
	bh=DNDGDXawjpnAP84v4vNSCLO6UlpUWY7yaDUajllSWRE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=X2DLG43ZPGV14lC5qiFEuVFkOE5cb1cMRCTx0GMqnq3JchgeG4ZyJ36VeO/cHkeHCEo0y7378gf+HX9RxcuktdAD/QO++BfJblwHJ1M/NsL/2IMGVtkPn15Rk2K1ZOuNeX9EumVLk+i9BHxcBL5Ap7X/9MfllVN1JxZtpanuyP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LM7imtvy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LM7imtvy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E18F91F000E9;
	Wed, 12 Aug 2026 16:08:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786550903;
	bh=ItL8oDV9G3/TQMPJpCkrCupQtCutxSo5F0Ar6YcGbj8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LM7imtvyXfCxV/VEhNfjLJY8OQ6N7nQj7YWBqjSzGkcAaiZfF4U1EMGq/Nkkv9CYh
	 kJwiVxa22+cHzHDm1ObMiIjiEp3754ghbxryO91U0GVC6gUphvkn8qbGhyFqy17hgN
	 HCvbuaQUhlwI7P7hlvicuty5ax5OfjsCazG3QcmMadAuMpY1ZUisHujcp0fn38zSLO
	 BxsEOOFUUqV5hdmFVIus544kB0jKcG4hUVPEFeTVAhMRQYcg2/9FLq5PAU5tpdYEgS
	 8YFxa4AeKAisIOwxD/kyY6ufeAqJ7X+kKcbAv0jva65aZItuZ7mUpsenPV98tAg15n
	 6jzqh09C0WRDA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 8/9] arm64: dts: renesas: r9a08g046l48-smarc: Add
 USB2.0 Host support
Reply-To: sashiko-reviews@lists.linux.dev
To: Biju <biju.das.au@gmail.com>
Cc: robh@kernel.org, wsa+renesas@sang-engineering.com, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260812141940.246223-9-biju.das.jz@bp.renesas.com>
References: <20260812141940.246223-1-biju.das.jz@bp.renesas.com>
 <20260812141940.246223-9-biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 12 Aug 2026 16:08:22 +0000
Message-Id: <20260812160822.E18F91F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [Medium] Commit message and code mismatch regarding Port 0 OTG configurat=
ion

Pre-existing issues:
- [High] Missing driver support and fallback compatible string for USB2 PHY=
 nodes
--

--- Patch [8]: [PATCH v7 8/9] arm64: dts: renesas: r9a08g046l48-smarc: Add =
USB2.0 Host support ---
commit c3aecaee03c204651cbf54effdb9c6095c67ace8
Author: Biju Das <biju.das.jz@bp.renesas.com>

arm64: dts: renesas: r9a08g046l48-smarc: Add USB2.0 Host support
   =20
Enable USB2.0 Host on the RZ/G3L SMARC board (r9a08g046l48-smarc).
   =20
> Port 0 (ehci0, ohci0, usb2_phy0) is configured as OTG with
> usb0_pins pinmux (USB20_OVRCUR, USB20_VBUSEN) and usb0_vbus_otg
> as the VBUS supply. Port 1 (ehci1, ohci1, usb2_phy1) is configured
> as host-only with usb1_pins pinmux (USB21_OVRCUR, USB21_VBUSEN),
> usb1_vbus_otg as the VBUS supply, and renesas,no-otg-pins set to
> indicate no OTG pin routing. The phyrst USB PHY reset controller is
> also enabled.

[Severity: Medium]
The commit description states Port 0 is configured as OTG, but the patch
configures ehci0 and ohci0 with dr_mode =3D "host".

I noticed the patch changelog mentions dr_mode was changed to 'host' because
the function is not enabled yet. Could the main commit description be
updated to reflect the current code?

[ ... ]

> diff --git a/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts b/arch/ar=
m64/boot/dts/renesas/r9a08g046l48-smarc.dts
> --- a/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
> +++ b/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts

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
> +	status =3D "okay";
> +};

[Severity: High]
This is a pre-existing issue, but will enabling this node result in a probe
failure that causes the EHCI and OHCI host controllers to defer indefinitel=
y?

The usb2_phy0 node defined in arch/arm64/boot/dts/renesas/r9a08g046.dtsi
uses the single compatible string "renesas,usb2-phy-r9a08g046":

usb2_phy0: usb-phy@11e10200 {
	compatible =3D "renesas,usb2-phy-r9a08g046";

This string is missing from the rcar_gen3_phy_usb2_match_table in
drivers/phy/renesas/phy-rcar-gen3-usb2.c, and the device tree lacks a
fallback string like "renesas,rzg2l-usb2-phy".

Does this node require a fallback compatible string or driver updates before
it can be successfully enabled?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260812141940.2462=
23-1-biju.das.jz@bp.renesas.com?part=3D8
