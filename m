Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98A2537107E
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 22:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790030247; cv=none; b=nLkKn6Ath+Z+v/I82GfmKSPLgjqFm7jM1ddOUJDo7S4HODUhNkei047reFO1lb9z0yevtKzAa8QqCZShZv3BuFgzCicih4BN5Uygz+ENjD1bBjRcMYrexdSdbmEliN8UOAB5QqwcIvvdX6ysUFE6p4+ug+03S8sEahgVEi5MRlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790030247; c=relaxed/simple;
	bh=ZxfmK4yAqRJqkLeqdTugKT5LbR9FmhytjJJvh/mOeMs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=dzpaZN0gu2lzPZbp1+OGd61PqC4MPMSb7n1WMmFHqCsEqtwukVMOn2CU6Cwwe+KXEovEkwhE8Xzj2dXRQWd69xq7/69QrjXiWYaSJZnVy1AjmlGjvctVw8wgctFo67zb5sOlLkxYea61npHJj22Gx3PjCHsmiwj/evMNlHREq9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Js+QVHtj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Js+QVHtj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC3461F000FF;
	Mon, 21 Sep 2026 22:37:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790030240;
	bh=DC+//azG1rZhhLd4/I3NVZ2dBZHEPrINJKFRdD27rTU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Js+QVHtjrv7OjAegyrEFTBaP0w92jntjus6Plv0pvYvvbrmjI3Fwe+7trs+ahMA2i
	 qe5NzXBbkEY2TYYhn/OT52v/MZkG0ut8dAcgocXXRIoLuEY6bj6C9cFGL91HOWKLSU
	 JzU6WOwql3a9v4y6LJrJ/qYk7/Wvoa2xpGhJwQy4lzlRcloUzD06IZDXV/KkJGzWpz
	 WESxDilO2Vcs4nmry+WCoHWEo69CDbBy/ea076ccO1C1wwJbW3n20BnMj6BIxlUh1O
	 UAhiz06HgUTeyK16EAALk7Two9iuoy1qpdAkjmfnZ7h7YlKCLAHHciH499yV46SSbW
	 y+gJux8h7KnNQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/3] arm64: dts: renesas: r9a09g047: Add USB2.0
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Tommaso Merciai" <tommaso.merciai.xr@bp.renesas.com>
Cc: wsa+renesas@sang-engineering.com, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <d281677b5759f15ced1f59fdcb3eb7ca29c72dd5.1790005703.git.tommaso.merciai.xr@bp.renesas.com>
References: <cover.1790005703.git.tommaso.merciai.xr@bp.renesas.com>
 <d281677b5759f15ced1f59fdcb3eb7ca29c72dd5.1790005703.git.tommaso.merciai.xr@bp.renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 21 Sep 2026 22:37:19 +0000
Message-Id: <20260921223719.AC3461F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] dts: nodes not sorted by unit address
--

commit db8934356239e961e6360c8c46e87d977245ad6d
Author: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

arm64: dts: renesas: r9a09g047: Add USB2.0 support

The Renesas RZ/G3E (R9A09G047) SoC supports one channel with OTG/DRD and one
channel with host interface. This commit adds the EHCI, OHCI, USB2.0 PHY,
and reset control nodes for USB2.0 channels in the R9A09G047 SoC DTSI.

> diff --git a/arch/arm64/boot/dts/renesas/r9a09g047.dtsi b/arch/arm64/boot=
/dts/renesas/r9a09g047.dtsi
> index 72120e2abf8b4..56ceedfb8ae88 100644
> --- a/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
> @@ -1773,6 +1773,130 @@ usb3_phy: usb-phy@15870000 {
>  			status =3D "disabled";
>  		};
> =20
> +		ohci0: usb@15800000 {

[Severity: Low]
This isn't a bug, but should the newly added nodes be sorted by unit addres=
s?
The ohci0 node at address 15800000 is being placed after the existing usb3_=
phy
node at 15870000.

> +			compatible =3D "generic-ohci";
> +			reg =3D <0 0x15800000 0 0x100>;

[ ... ]

> +		ohci1: usb@15810000 {
> +			compatible =3D "generic-ohci";
> +			reg =3D <0 0x15810000 0 0x100>;

[ ... ]

> +			power-domains =3D <&cpg>;
> +			status =3D "disabled";
> +		};
> +
> +		ehci0: usb@15800100 {

[Severity: Low]
Similarly, should ehci0 at address 15800100 be placed before ohci1 at 15810=
000
to maintain unit address sorting among the newly added nodes?

> +			compatible =3D "generic-ehci";
> +			reg =3D <0 0x15800100 0 0x100>;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1790005703.gi=
t.tommaso.merciai.xr@bp.renesas.com?part=3D2
