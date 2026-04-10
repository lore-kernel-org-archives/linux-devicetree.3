Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 570143DC4DF;
	Fri, 10 Apr 2026 17:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775842986; cv=none; b=bQ6R88k91n67zgQyk5gQIRcPP4l+h/3K9LE3lMGI7KUBeSZ6JQoCdOOQLMg13cwhfhu3VbO4/50u3NrnQs87Y2DmywEuHfrQp7hQAb/TqUJ1XQBr60xOMRfR3KfQ3fLspzWoCmsPTprJDCPNSkis/KjvBSze8cEzb1XimwBIl7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775842986; c=relaxed/simple;
	bh=NLB9LEMY5pWWZ3n8brg3UOx+BxMKZY6/dSsFdTIeHf4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OBdCSWmqdttolPRES0OKa/+XR37RWOOtlBIylb1H6P4+Euc9vBpSFac2+GEUpJJVe2DYH3pteApWRo5O6G9P0T/nUKUcNbSdaNc1cUcyxEMj54bIcQJI4uC4bWMoTpU1peJCC7J+o+zHkTm1w8D8lx/zuo1zAsSE1ou/FeQ8hGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kM0uuTbp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kM0uuTbp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3827EC19421;
	Fri, 10 Apr 2026 17:43:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775842986;
	bh=NLB9LEMY5pWWZ3n8brg3UOx+BxMKZY6/dSsFdTIeHf4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kM0uuTbp2GWgXAjoEz2Ob8KFuviqYXbnI4rc2/9F+ozZWXlcGA+xqSWmjw0a90nlI
	 fOBysVnEAYoeg3Rjpm+Yrci0iXek1GOmFx/G1rKn6E8e37a4CAohI+GiuwEaYZaOIx
	 nDRL714NfwzMxRlaWD1rjV6RyoWPl8Y/uDPBfm9+GtwQBm3EVxKqckTovwdZhYcZHp
	 Rhr2XO+22Wzmx5H3l5tffjuZQaW7aC+fuvq4ytpTPRhXk0gmUwg2XLCiTOHDV8DBxE
	 ggBJWIc3FqmR0xA/PoZlLE1XC8qGTiAyoGgjBkScK73AdQa0mqYlI5k2oKgPRrKUlr
	 mi9VnMzYXtkjA==
Date: Fri, 10 Apr 2026 18:43:01 +0100
From: Conor Dooley <conor@kernel.org>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Ley Foon Tan <leyfoon.tan@starfivetech.com>
Subject: Re: [PATCH v1 1/5] dt-bindings: interrupt-controller: Convert the
 word "jh8100" to "jhb100"
Message-ID: <20260410-rockstar-monologue-b3f64fe20226@spud>
References: <20260410090106.622781-1-changhuang.liang@starfivetech.com>
 <20260410090106.622781-2-changhuang.liang@starfivetech.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rRj6akklFzTXY1lx"
Content-Disposition: inline
In-Reply-To: <20260410090106.622781-2-changhuang.liang@starfivetech.com>


--rRj6akklFzTXY1lx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 10, 2026 at 02:01:02AM -0700, Changhuang Liang wrote:
> The StarFive JH8100 SoC was discontinued before production. The
> newly taped-out JHB100 SoC uses the same interrupt controller IP.
>=20
> Rename the binding file, compatible string, and MAINTAINERS entry
> from "jh8100" to "jhb100". In JHB100 SoC, The clocks and resets are
> not operated by users, but they exist in the hardware. Mark them as
> optional.

Content looks fine, I think the commit message should be changed to
something like "repurpose binding for unreleased jh8100 for jhb100".

W/ something along those lines
Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

>=20
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> ---
>  ...ve,jh8100-intc.yaml =3D> starfive,jhb100-intc.yaml} | 12 ++++--------
>  MAINTAINERS                                          |  2 +-
>  2 files changed, 5 insertions(+), 9 deletions(-)
>  rename Documentation/devicetree/bindings/interrupt-controller/{starfive,=
jh8100-intc.yaml =3D> starfive,jhb100-intc.yaml} (81%)
>=20
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/starf=
ive,jh8100-intc.yaml b/Documentation/devicetree/bindings/interrupt-controll=
er/starfive,jhb100-intc.yaml
> similarity index 81%
> rename from Documentation/devicetree/bindings/interrupt-controller/starfi=
ve,jh8100-intc.yaml
> rename to Documentation/devicetree/bindings/interrupt-controller/starfive=
,jhb100-intc.yaml
> index ada5788602d6..576b1d6c7973 100644
> --- a/Documentation/devicetree/bindings/interrupt-controller/starfive,jh8=
100-intc.yaml
> +++ b/Documentation/devicetree/bindings/interrupt-controller/starfive,jhb=
100-intc.yaml
> @@ -1,13 +1,13 @@
>  # SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>  %YAML 1.2
>  ---
> -$id: http://devicetree.org/schemas/interrupt-controller/starfive,jh8100-=
intc.yaml#
> +$id: http://devicetree.org/schemas/interrupt-controller/starfive,jhb100-=
intc.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
> =20
>  title: StarFive External Interrupt Controller
> =20
>  description:
> -  StarFive SoC JH8100 contain a external interrupt controller. It can be=
 used
> +  StarFive SoC JHB100 contain a external interrupt controller. It can be=
 used
>    to handle high-level input interrupt signals. It also send the output
>    interrupt signal to RISC-V PLIC.
> =20
> @@ -16,7 +16,7 @@ maintainers:
> =20
>  properties:
>    compatible:
> -    const: starfive,jh8100-intc
> +    const: starfive,jhb100-intc
> =20
>    reg:
>      maxItems: 1
> @@ -40,8 +40,6 @@ properties:
>  required:
>    - compatible
>    - reg
> -  - clocks
> -  - resets
>    - interrupts
>    - interrupt-controller
>    - "#interrupt-cells"
> @@ -51,10 +49,8 @@ additionalProperties: false
>  examples:
>    - |
>      interrupt-controller@12260000 {
> -      compatible =3D "starfive,jh8100-intc";
> +      compatible =3D "starfive,jhb100-intc";
>        reg =3D <0x12260000 0x10000>;
> -      clocks =3D <&syscrg_ne 76>;
> -      resets =3D <&syscrg_ne 13>;
>        interrupts =3D <45>;
>        interrupt-controller;
>        #interrupt-cells =3D <1>;
> diff --git a/MAINTAINERS b/MAINTAINERS
> index d238590a31f2..a2961727e3d1 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -25312,7 +25312,7 @@ F:	drivers/phy/starfive/phy-jh7110-usb.c
>  STARFIVE JH8100 EXTERNAL INTERRUPT CONTROLLER DRIVER
>  M:	Changhuang Liang <changhuang.liang@starfivetech.com>
>  S:	Supported
> -F:	Documentation/devicetree/bindings/interrupt-controller/starfive,jh810=
0-intc.yaml
> +F:	Documentation/devicetree/bindings/interrupt-controller/starfive,jhb10=
0-intc.yaml
>  F:	drivers/irqchip/irq-starfive-jh8100-intc.c
> =20
>  STATIC BRANCH/CALL
> --=20
> 2.25.1
>=20
>=20

--rRj6akklFzTXY1lx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCadk2pQAKCRB4tDGHoIJi
0mtsAQCrrB/xGtsUkGetT8r+sJWjMb0UXBmk5RE78eS0ExnF2gEAuBq+zals99Os
7hG4LWCkEqAnm13kvHiVVo0Q+TYggQ0=
=D8//
-----END PGP SIGNATURE-----

--rRj6akklFzTXY1lx--
