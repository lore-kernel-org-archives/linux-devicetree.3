Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BC3A47ACC7
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 13:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787664290; cv=none; b=OS/DGG5315jjcZd+RetV8BVH88b2o3x3zzi72taCFZn2LVKMpUk9351ozM6O9yofDBxIO1PE0gTW/z+/m2dRu6uZbeiIk3H6WPKH3Vfw9drx/u8zmpR1SHBJqvTEc6K3cFdUwALVUJRDRgF/+bfaSd21w7pSyrnhoQXds1tEbYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787664290; c=relaxed/simple;
	bh=2B5le9jEuyHTKB1Cl9fS57SOs8NQUZ1r3LVQI4nDmIo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=U8GbvK59gYTvrClvjqwQOWi3lNNHdSuCUnPJAHtWMy9aJ1IHCeIbq2gnVi7+JE/jDpKaYylCFyRVnWTzkgDshq2GIx9pBQ7ll88xLyXGPj8VVItDz1UVlkviv1nKn721NOasdyJeRStBNEk9cs9uDqkhLV73CCaUZBQF1AemPZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DVDrado8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DVDrado8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6D261F000E9;
	Tue, 25 Aug 2026 13:24:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787664281;
	bh=SboGtOglkseX08p5HbubradbA9Rty1Xie+Mla1YfA0M=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DVDrado8O7N0loZUlomp3GDmexsV13LBeQeuOnT+6scNKoWP/MkqRyb5/rSsS/8zs
	 z39cytCHw8iWAQcCFdRYZOJ5N+bJOAeeaHREQOYgqbE+eUOkt/xZRiBYr7gdMobmal
	 nEnw2U4RCRMbroD0AadEzgjDeyWP0IiZepRJ2ENZLt4FODWoRN4olRLNG2ba8mbAEj
	 dLabxdIK1z/EnzfK+FNFO1Misykxy26yp1/a/3HZqD3NAaQZRCed/w2MU5bZeLgXmu
	 6B5Mio7ZIlJCTzyhqqp8zNc2GqkZetqfEKqTbknNvDb11K0PKn5pwd+I0eSZAp4QCe
	 TDzRKV7r3fSUw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/4] arm64: dts: renesas: r9a08g046: Add USB2.0
 function device nodes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Tommaso Merciai" <tommaso.merciai.xr@bp.renesas.com>
Cc: robh@kernel.org, conor+dt@kernel.org, wsa+renesas@sang-engineering.com, devicetree@vger.kernel.org
In-Reply-To: <962c65901519b066b201f5f9bf15047f9aa45ffc.1787663426.git.tommaso.merciai.xr@bp.renesas.com>
References: <cover.1787663426.git.tommaso.merciai.xr@bp.renesas.com>
 <962c65901519b066b201f5f9bf15047f9aa45ffc.1787663426.git.tommaso.merciai.xr@bp.renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 25 Aug 2026 13:24:40 +0000
Message-Id: <20260825132440.E6D261F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The newly added compatible string `renesas,usbhs-r9a08g046` is not =
documented in the device tree bindings schema.
--

--- Patch [2]: [PATCH v2 2/4] arm64: dts: renesas: r9a08g046: Add USB2.0 fu=
nction device nodes ---
commit aca75e8826ebba62b782808787871b01e25c5783
Author: Biju Das <biju.das.jz@bp.renesas.com>

arm64: dts: renesas: r9a08g046: Add USB2.0 function device nodes

Add USB2.0 function device nodes to the RZ/G3L (r9a08g046) SoC DTSI.

> diff --git a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi b/arch/arm64/boot=
/dts/renesas/r9a08g046.dtsi
> index 2d8c8fd8a01cd..7cf29aed52110 100644
> --- a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
> @@ -1105,6 +1105,44 @@ usb2_phy1: usb-phy@11e90200 {
>  			status =3D "disabled";
>  		};
> =20
> +		hsusb0: usb@11e30000 {
> +			compatible =3D "renesas,usbhs-r9a08g046",
> +				     "renesas,rzg2l-usbhs";

[Severity: Low]
This isn't a bug, but it appears the newly added compatible string
renesas,usbhs-r9a08g046 is not documented in the device tree bindings
schema. Will this cause warnings during make dtbs_check?

[ ... ]

> +		hsusb1: usb@11eb0000 {
> +			compatible =3D "renesas,usbhs-r9a08g046",
> +				     "renesas,rzg2l-usbhs";

[Severity: Low]
This isn't a bug, but the same undocumented compatible string is used here
for the hsusb1 node. Should this string be added to
Documentation/devicetree/bindings/usb/renesas,usbhs.yaml?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1787663426.gi=
t.tommaso.merciai.xr@bp.renesas.com?part=3D2
