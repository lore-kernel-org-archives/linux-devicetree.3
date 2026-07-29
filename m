Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAA9044D01D
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 12:12:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785327149; cv=none; b=jdWetPwjL2b4onihLQtBUqP0pCjMg6qVvoeu2tgn6atnSRzeC4/IA8x2bPxc6RPGqopXCp3v088NiuJBs1i6tH1ZMYFivetgcde9dZKgdiBFjF9mD0NaBHj8cnb4x0tH4UCYXXbLChHsSUUdzMJDSKSIPP2Fm625xb3LhEMizdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785327149; c=relaxed/simple;
	bh=ZA5qgrzRMoB10nXIJEF0yGuIAjRJ1NIJ1Q7t7rPxt2k=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ZAZLL9UHEenMVHRpH3voS6H1TluUlW78d1VWjIemYfQBc8hMc0790BYnnvYxadGEV94vnVr5+uDLiPlBaJXbDptHji1joot8JBeN8i2I6g1rv7DzOA9175VIWPobEp/khhLH88SP8HUOArPirNP6qYsvibLFCWYYLMiTF+N1jcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KIIGFj9Q; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KIIGFj9Q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2C9B1F000E9;
	Wed, 29 Jul 2026 12:12:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785327143;
	bh=/FOaL5B/a/kWnhUGmNeJsMX//2JYa+8QEh9p0IQNOJ8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KIIGFj9QQT5HnjGM21czZk7Ki5372bDUAhCO/4qpsjrU6dlabQRua589g+13YBAaA
	 eXbmxpCZRsvH6G7PyQVp3aE1AEJyLiaVJLBkspSwGhUeQcfpnmk4MBg+WrBybf7IaV
	 j9pLOeDNWvOnjbAxaP8d4ngk9BT8OrKCvKrHINKyuAgVoX1z3fPpJSUYZwzZ1G4xPR
	 2xAaGbf/mCq90fne/UM+BspRtASIwDrmsFZSNyAaapj/Ub/D3k5qmciRaa9j9IZWDu
	 6GcFwPA/Ut9tW62ywmSe7SnkPTfILj/9XbSNEdPMn6evLp/9RGx3L710Lj1eWaXB75
	 rYfMzRVwkKatw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 8/9] arm64: dts: renesas: r9a08g046: Add USB2.0
 device nodes
Reply-To: sashiko-reviews@lists.linux.dev
To: Biju <biju.das.au@gmail.com>
Cc: conor+dt@kernel.org, wsa+renesas@sang-engineering.com, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260729115022.222340-9-biju.das.jz@bp.renesas.com>
References: <20260729115022.222340-1-biju.das.jz@bp.renesas.com>
 <20260729115022.222340-9-biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 29 Jul 2026 12:12:23 +0000
Message-Id: <20260729121223.A2C9B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Device tree nodes are not sorted by unit address in ascending order.
--

--- Patch [8]: [PATCH v5 8/9] arm64: dts: renesas: r9a08g046: Add USB2.0 de=
vice nodes ---
commit 577e5e6e2781fd99b54a7c1f671fdf2c32513f48
Author: Biju Das <biju.das.jz@bp.renesas.com>

arm64: dts: renesas: r9a08g046: Add USB2.0 device nodes

This commit adds USB2.0 device nodes to the RZ/G3L (r9a08g046) SoC DTSI.
The additions cover the USB PHY controller, OHCI/EHCI host controllers, and
USB2 PHYs for both ports.

> diff --git a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi b/arch/arm64/boot=
/dts/renesas/r9a08g046.dtsi
> --- a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
[ ... ]
> +		ohci1: usb@11e90000 {
> +			compatible =3D "generic-ohci";
[ ... ]
> +		ehci0: usb@11e10100 {
> +			compatible =3D "generic-ehci";
[ ... ]
> +		usb2_phy1: usb-phy@11e90200 {
> +			compatible =3D "renesas,usb2-phy-r9a08g046";
[ ... ]
> +		};
> +
>  		pcie: pcie@11e40000 {
>  			reg =3D <0 0x11e40000 0 0x10000>;

[Severity: Low]
This isn't a bug, but are these device tree nodes ordered correctly? Standa=
rd
device tree guidelines recommend sorting child nodes by unit address in
ascending order.

In this block, ohci1 at 11e90000 is placed before ehci0 at 11e10100, and
usb2_phy1 at 11e90200 is placed before the existing pcie node at 11e40000.

Could these nodes be reordered to strictly follow the ascending unit address
sequence (11e00000, 11e10000, 11e10100, 11e10200, 11e40000, 11e90000,
11e90100, 11e90200)?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260729115022.2223=
40-1-biju.das.jz@bp.renesas.com?part=3D8
