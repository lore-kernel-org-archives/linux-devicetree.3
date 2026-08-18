Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6461E334C1D
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 14:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787063725; cv=none; b=oULFRY5a7UKeQguwIVDsva38FyZH8j+8dwcdmepeUzxGFcahIdouOF8WRWW/NBTkkijiGIl1VGiEG3ogVp/bP8VbUd3dGSdDxlKihIblzRRrihmnGvYQ/fCCu7ILfYqi/qQHVDETbO7zV4bogPSU2jpnzx+cJHNaVNhBQNfDkfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787063725; c=relaxed/simple;
	bh=/c/j5eEatpqZqtyYWi5g2K+mRVYq8eekmfkbRnG8a3s=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ZyJ0GUNC61+3yjApaoDglLnfl5fBJLW4pYr3o505Ne052adSE8WaOXXd6z/Mt7GHZk7u41xrLzoI/aeR7EvMUnzk4c4G+Gl6W7BcRN/nfB8/uVWgI7ejwxlinwrSx8cO4pbLoTyZy55B4hc09GO9JkfmlTtPDodygjiwLH6nCKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NI1TbJVe; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NI1TbJVe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A79391F000E9;
	Tue, 18 Aug 2026 14:35:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787063724;
	bh=XB/xQQs25Kz477dnNGLtrtE8I3XX6QEbne97u08C9jQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NI1TbJVeKoCfgosMFtzsUIAColk7n2Lr7vBfoVYonS1M/brzsRANKfqSd0tNMHcnb
	 +OFPCOLO90M5djiXNomS/CjUWn9Y/RgRzW4pm+W+8BOL9SrzujzkmXZsbvQAzju94e
	 sjzN2HZT4QGSkSppj99cnIzp5s01uRB/IaDJAdJWn/rCpHfUDsLvsrlb2WeBTDeyGA
	 hbasNWAJeFxaCc+16VeqP05w5lp1z/JDxZOrzvWT9sp9li6k+VIJiriysGMl/W9LlA
	 gGmyS810x5XZgiumMI8q/3IsShpSEaJmw6/DXnGMI6gzNW1///OoQT4r6D6wg1238n
	 muExLpU4Q5z1g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/3] arm64: dts: renesas: r9a08g046: Add USB2.0
 placeholder nodes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Tommaso Merciai" <tommaso.merciai.xr@bp.renesas.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, wsa+renesas@sang-engineering.com
In-Reply-To: <aec1fce5558c6c88725fe710a2f9e4b1eb9e8d64.1787062965.git.tommaso.merciai.xr@bp.renesas.com>
References: <cover.1787062965.git.tommaso.merciai.xr@bp.renesas.com>
 <aec1fce5558c6c88725fe710a2f9e4b1eb9e8d64.1787062965.git.tommaso.merciai.xr@bp.renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 18 Aug 2026 14:35:23 +0000
Message-Id: <20260818143523.A79391F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] Placeholder DT nodes omit mandatory properties (e.g. `compatible=
`), causing schema validation failures.
- [Low] Newly added USB device tree nodes are not sorted by unit-address.
--

--- Patch [1]: [PATCH 1/3] arm64: dts: renesas: r9a08g046: Add USB2.0 place=
holder nodes ---
commit cc298f15a0f37ec626ccaf22949b2e2fb488034f
Author: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

arm64: dts: renesas: r9a08g046: Add USB2.0 placeholder nodes

This commit adds placeholder USB2.0 devicetree nodes to the RZ/G3L SoC DTSI.
It resolves build errors caused by the shared SMARC Carrier-II board file
enabling these nodes. The nodes currently only contain the reg property.

> diff --git a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi b/arch/arm64/boot=
/dts/renesas/r9a08g046.dtsi
> index c63a857f0e5b0..5951a68c981cb 100644
> --- a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi

[ ... ]

> @@ -1001,6 +1001,31 @@ queue3 {
>  			};
>  		};
> =20
> +		ohci0: usb@11e10000 {
> +			reg =3D <0 0x11e10000 0 0x100>;
> +			/* placeholder */
> +		};

[Severity: Medium]
Will these placeholder nodes cause devicetree schema validation failures?

Since they omit mandatory properties like compatible strings, compiling the
devicetree with dtbs_check enabled might produce structurally invalid nodes.
Because the shared board file enables them, they could be treated as malfor=
med
active devices. Could the basic required properties be included now?

> +
> +		ohci1: usb@11e90000 {
> +			reg =3D <0 0x11e90000 0 0x100>;
> +			/* placeholder */
> +		};
> +
> +		ehci0: usb@11e10100 {

[Severity: Low]
This isn't a bug, but should these nodes be sorted by their unit-address?

The ohci1 node at usb@11e90000 is placed before ehci0 at usb@11e10100, which
breaks the ascending numerical address ordering convention. Sorting them as
usb@11e10000, usb@11e10100, usb@11e30000, pcie@11e40000, usb@11e90000, and
usb@11e90100 might be preferred.

> +			reg =3D <0 0x11e10100 0 0x100>;
> +			/* placeholder */
> +		};
> +
> +		ehci1: usb@11e90100 {
> +			reg =3D <0 0x11e90100 0 0x100>;
> +			/* placeholder */
> +		};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1787062965.gi=
t.tommaso.merciai.xr@bp.renesas.com?part=3D1
