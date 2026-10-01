Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9024F346777
	for <devicetree@vger.kernel.org>; Thu,  1 Oct 2026 10:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790851590; cv=none; b=SnLP61+lAkK4DTQDq9q6PieUgPfp76iDiiXW35tZ9I7afyH7YJvhNbL/zzh8Xl8wWLspO9jxXY4kZIih04G5TaYxjHOnlv0M6UQm+DEaoFrfkxk2SExBt4L8BA93hlRTZZ/ABGfVrlPO5OL+RQ/LEaABZ5sTIHL1a1q0Hlir2CE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790851590; c=relaxed/simple;
	bh=/vBwqvNSfoHDRaFvOQp7lMYNavSBwNhRY2hipJkiobM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=cGqbrzstlOOTyvLL5xB6/g6eKdwrI+1pQ6MsD79Zovteuqlvxm1ZBygXhbdcDnfnDnqIKLdSnemE2FYlTDRaDrEYk3tdEyvyn+B5bbF9jAh6lD4bYegogftEFhkQ/BlPROoHxvoXkHS7wEuvwIa56k/VHXmMO8bqxRtZkUDx2sc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ckY0wChe; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ckY0wChe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D68581F000FF;
	Thu,  1 Oct 2026 10:46:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790851589;
	bh=tsr+5WIbYPMzgdxaXPIHWwrmpUmDWdQGJRYtKDtCwRk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ckY0wCheV0QyneXQzhHHetoUQImM83MOO9LbtkvUjcrLwcjp5+bGcJozoY2DtW2FX
	 qudvPNLtSzZA5b2RDjyg0khGeUyePQqcnovrpIo/SRy5CYh4w+UaUvt3mZ01E+XYxV
	 KEwKlesuott1K5qWFCiZZcTu7zdlzCRX8bqBpjK6He6Ch5gFfFi5y1Z01Od5WfMAUF
	 cLoaqhh+ibWCECYLCTms3q0h4lBtX963XGB/foUNff3CxDk5/ynlLKaEYUKCaSi2oq
	 PiB73Bxg7SYhyAAfYSerGBOamYt90l/Ei0QzeUeapaXIwWhYBoCLSDdELyQu6eu51b
	 1NgpwVUkG07EA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 8/9] arm64: dts: renesas: Add DSI overlay for RZ/G3L
 SMARC EVK with ADV7535
Reply-To: sashiko-reviews@lists.linux.dev
To: Biju <biju.das.au@gmail.com>
Cc: conor+dt@kernel.org, wsa+renesas@sang-engineering.com, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20261001094041.135697-9-biju.das.jz@bp.renesas.com>
References: <20261001094041.135697-1-biju.das.jz@bp.renesas.com>
 <20261001094041.135697-9-biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 01 Oct 2026 10:46:28 +0000
Message-Id: <20261001104628.D68581F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] dts: build failure due to undefined dsi and du labels
--

commit 045dc46eb4705fb5d6a8e9c2c09ae5baac2cfba9
Author: Biju Das <biju.das.jz@bp.renesas.com>

arm64: dts: renesas: Add DSI overlay for RZ/G3L SMARC EVK with ADV7535

This commit adds a Device Tree overlay for the RZ/G3L SMARC EVK board to
support DSI-to-HDMI output via the ADV7535 transmitter. It enables the DSI
controller, display unit (DU), HDMI audio, and updates the Makefile to build
the standalone and composite DTBs.

> diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/r=
enesas/Makefile
> index 8bf155badd111..8c6a448907151 100644
> --- a/arch/arm64/boot/dts/renesas/Makefile
> +++ b/arch/arm64/boot/dts/renesas/Makefile
[ ... ]
> @@ -187,6 +187,9 @@ r9a08g045s33-smarc-pmod1-type-3a-dtbs :=3D r9a08g045s=
33-smarc.dtb r9a08g045s33-sma
>  dtb-$(CONFIG_ARCH_R9A08G045) +=3D r9a08g045s33-smarc-pmod1-type-3a.dtb
> =20
>  dtb-$(CONFIG_ARCH_R9A08G046) +=3D r9a08g046l48-smarc.dtb
> +dtb-$(CONFIG_ARCH_R9A08G046) +=3D r9a08g046l48-smarc-dsi-adv7535.dtbo
> +r9a08g046l48-smarc-dsi-adv7535-dtbs :=3D r9a08g046l48-smarc.dtb r9a08g04=
6l48-smarc-dsi-adv7535.dtbo
> +dtb-$(CONFIG_ARCH_R9A08G046) +=3D r9a08g046l48-smarc-dsi-adv7535.dtb

[Severity: Low]
Will this composite DTB rule break the build?

Running make dtbs with CONFIG_ARCH_R9A08G046 attempts to generate the
composite DTB using fdtoverlay. Since the base DTB lacks the dsi and du lab=
els
referenced in the overlay, fdtoverlay will fail with an unresolved reference
error and abort the build process.

> diff --git a/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc-dsi-adv7535.d=
tso b/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc-dsi-adv7535.dtso
> new file mode 100644
> index 0000000000000..1e1ebafe24398
> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc-dsi-adv7535.dtso
[ ... ]
> +&dsi {
> +	status =3D "okay";

[Severity: Low]
Does the base device tree define the dsi label?

It appears this label reference is missing from the base SoC device tree,
which causes the overlay application to fail when building the composite DT=
B.

> +
> +	ports {
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +
> +		port@1 {
> +			reg =3D <1>;
> +			dsi_out: endpoint {
> +				data-lanes =3D <1 2 3 4>;
> +				remote-endpoint =3D <&adv7535_in>;
> +			};
> +		};
> +	};
> +};
> +
> +&du {
> +	status =3D "okay";
> +};

[Severity: Low]
Similarly, does the base device tree define the du label?

This unresolved reference will also contribute to the build aborting during
fdtoverlay.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261001094041.1356=
97-1-biju.das.jz@bp.renesas.com?part=3D8
