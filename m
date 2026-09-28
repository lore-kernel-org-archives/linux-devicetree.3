Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A1F947CA87
	for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 21:02:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790629342; cv=none; b=F4Z3OPenKHYZFaS+kP7WyhMgLG+cFbhH0OPeiW8XNH2gzxlsb2xrrfKKyUDsI6X62VDHBnU2SVHQk54SgBYXvnBB9tLgG4Ycb6h/6zovz+9qflGlu5XGQ0btrW8q3pLSzb9ytaWuygrk7N3Ojwfqp5/w4rbumoHcGISOdj++sho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790629342; c=relaxed/simple;
	bh=Zw+zAcs16oKZvk6JoSl2rJ93PVu3KoL9hyLA52LCXLk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=TqTpLSJjfKs4dyqYWLL5q+8MkcvmPYWX6dXHESNVUYEXHOtJ1VwJmz2zd/pbecILNB3AO4rKWlRJPpn9TK7t9n+q82XLssbS8Fj+Zlotec0fOxkTt35jj0/bHNt2AlI/BCA26r0Rv18MCuy7EFodH/zdxM5+NgCajiolT4ZxZd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VxdnNfEq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VxdnNfEq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DCB41F000FF;
	Mon, 28 Sep 2026 21:02:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790629336;
	bh=95K45wJ6O1sdAaoiUDupZDvBEQ3/aG8rFXioxJppjfg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VxdnNfEqZ6cWG0HeuY1WYd8ldBmXTCDIpAXVhEzPfAFyPM62HbBe11/ucqTUmIRuM
	 FuoQNeaGLJH42Ptn/YZkZQJhrxqfPZdSBwTyYTP2MCIhMxbBU7c1G5AZkyCI/MshIc
	 Tk42oTwqZPM/g8CN6HSy9oCbor/FI0+w0kT7V5qLf4FBMu9kdt89wuckH9tPGcydVE
	 Gr6pRkXxLIuZPqjh0wS/CvNWV6ERXvhKMCKFh7SAz0uMAbu/avFVd3bVPXf/hxxYQt
	 AxFJoBVM+JLFeFDQZW/aE+iZ/WvhhwBE2PGDefxMlCJcnMOnX9g/Bv1SF/MmIuShdQ
	 G4QKu8LbG3TKg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 2/5] riscv: dts: spacemit: k3: add USB3 B and C
 controllers for Pico-ITX board
Reply-To: sashiko-reviews@lists.linux.dev
To: "Aurelien Jarno" <aurelien@aurel32.net>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260928205012.3689405-3-aurelien@aurel32.net>
References: <20260928205012.3689405-1-aurelien@aurel32.net>
 <20260928205012.3689405-3-aurelien@aurel32.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 28 Sep 2026 21:02:16 +0000
Message-Id: <20260928210216.7DCB41F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] dt-bindings: missing required phys properties in usb3b and usb3c no=
des
--

commit 89b216baa5d6be0e4a7be800d568bba679087495
Author: Aurelien Jarno <aurelien@aurel32.net>

riscv: dts: spacemit: k3: add USB3 B and C controllers for Pico-ITX board

This commit adds the USB3 controller nodes (B and C) to the SpacemiT K3 SoC
device tree. It also enables them and adds the corresponding USB2 PHY nodes
for the Pico-ITX board.

> diff --git a/arch/riscv/boot/dts/spacemit/k3.dtsi b/arch/riscv/boot/dts/s=
pacemit/k3.dtsi
> index 1af47b7f1c8af..cf1c8b572c86b 100644
> --- a/arch/riscv/boot/dts/spacemit/k3.dtsi
> +++ b/arch/riscv/boot/dts/spacemit/k3.dtsi

[ ... ]

> @@ -441,6 +441,66 @@ soc: soc {
>  		dma-noncoherent;
>  		ranges;
> =20
> +		usb3b: usb@81400000 {
> +			compatible =3D "spacemit,k3-dwc3";
> +			reg =3D <0x0 0x81400000 0x0 0x10000>;
> +			interrupts =3D <125 IRQ_TYPE_LEVEL_HIGH>;

[Severity: Low]
Does omitting the phys and phy-names properties here cause a devicetree
validation regression?

The SoC devicetree fails dtbs_check validation against the binding schema
(spacemit,k1-dwc3.yaml), which unconditionally requires the phys and
phy-names properties.

Should this node define its hardwired connection to usb3b_u2phy via the
phys and phy-names properties here, instead of omitting these SoC-internal
hardwired connections from k3.dtsi and forcing downstream boards to
redundantly define the SoC hardware topology?

> +			interrupt-parent =3D <&saplic>;
> +			clocks =3D <&syscon_apmu CLK_APMU_USB3_PORTB_BUS>;

[ ... ]

> +		usb3c: usb@81700000 {
> +			compatible =3D "spacemit,k3-dwc3";
> +			reg =3D <0x0 0x81700000 0x0 0x10000>;
> +			interrupts =3D <148 IRQ_TYPE_LEVEL_HIGH>;

[Severity: Low]
Similarly, does this node also need to define its hardwired connection to
usb3c_u2phy via the phys and phy-names properties to avoid the same schema
validation regression?

> +			interrupt-parent =3D <&saplic>;
> +			clocks =3D <&syscon_apmu CLK_APMU_USB3_PORTC_BUS>;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260928205012.3689=
405-1-aurelien@aurel32.net?part=3D2
