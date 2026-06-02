Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E08A2E63C;
	Tue,  2 Jun 2026 17:14:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780420453; cv=none; b=iKnAh4psUEHCQ+u4f78T3PA50nuclwBYQCjD5Fkwzv6mpWT3YYIaiitnqabfPy05agk2vsB1x2Ky4o4wKKU1wmLWGfscKAU55osk8oISJ62f09dvdsK5QaBHGTN8OQo06r+fK4SjPhY3EJxmCKePaWtOBrLGIIR15ffgA/VLwUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780420453; c=relaxed/simple;
	bh=yCyclw1XDLzYh3iyecBsuH6KsMy/DBUklWIs+kKHd9I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hdyp5LrOp20F3I7/lW48vJNbsQ7Sxarx1icCPuMlsRN7v03lztZn+lYGSgJX7SUfSrQcb3sDmEMmuPrQg2ifsX0bZixKZa8vplKTvik1tZZdp1RQ9A0wnNjpyQgftF3NUePkH8JYeB4Ghql2IdIF23c0y9IAB/lnNziLz5WDTQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Dk8IwpgR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Dk8IwpgR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2F8A1F00893;
	Tue,  2 Jun 2026 17:14:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780420451;
	bh=8Hfk+YuJU3cySOD2k3I/Y1bxSYg7Hrv/A7IKCc7Juwo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Dk8IwpgRtPfCqVjzQEVKHFWDGwNMZmE2xOUf5Ng3eI6tJudE8ASXwWo8nkx3yBX2s
	 F390wLmFC4QL0HVOCURQ5jTLEoCsBvHB/GrHyDz3fEeK3GulfH1NCT3EZdEsn+xO4e
	 HxaErS3sZcMGq5BqkaF44n221xAxJEC+vew9nD1B+cPToolICE/iKqHNq1+vbWwJGo
	 Kj3Fw0LFDOXqzUr61LaQYIWxTzjQAZQPbn772Dwvn3wVGQ/JjOc2KaQs2ZArZWnvwR
	 AdOVxAR653PPseiOBPJRD9MMWKzIrosjZp8gJVQjYq3xsyc4X9iCQhbORLYAM0Zl9Z
	 uynNkG1ULJjdg==
Date: Tue, 2 Jun 2026 18:14:07 +0100
From: Conor Dooley <conor@kernel.org>
To: Eduard Bostina <egbostina@gmail.com>
Cc: daniel.baluta@nxp.com, simona.toaca@nxp.com, goledhruva@gmail.com,
	m-chawdhry@ti.com, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: arm: omap: Convert Counter-32K to DT schema
Message-ID: <20260602-turkey-carwash-97b8641bfb3a@spud>
References: <20260528165853.15510-1-egbostina@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="iOmrs0KdPxAlP68+"
Content-Disposition: inline
In-Reply-To: <20260528165853.15510-1-egbostina@gmail.com>


--iOmrs0KdPxAlP68+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 28, 2026 at 07:58:50PM +0300, Eduard Bostina wrote:
> Convert the Texas Instruments OMAP Counter-32K bindings to DT schema.
>=20
> During the conversion, two updates were made to reflect actual hardware
> usage and resolve dtbs_check warnings:
> - 'ti,hwmods' has been made optional. While a search confirms it is no
>   longer used, it is kept to maintain backwards compatibility.
> - Added the 'ti,am4372-counter32k' compatible string, as an AM437x
>   device tree uses this instead of the generic 'ti,omap-counter32k'.
>=20
> Signed-off-by: Eduard Bostina <egbostina@gmail.com>
> ---
>  .../devicetree/bindings/arm/omap/counter.txt  | 15 -------
>  .../bindings/arm/omap/ti,omap-counter32k.yaml | 41 +++++++++++++++++++
>  2 files changed, 41 insertions(+), 15 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/arm/omap/counter.txt
>  create mode 100644 Documentation/devicetree/bindings/arm/omap/ti,omap-co=
unter32k.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/arm/omap/counter.txt b/Doc=
umentation/devicetree/bindings/arm/omap/counter.txt
> deleted file mode 100644
> index 5bd8aa091..000000000
> --- a/Documentation/devicetree/bindings/arm/omap/counter.txt
> +++ /dev/null
> @@ -1,15 +0,0 @@
> -OMAP Counter-32K bindings
> -
> -Required properties:
> -- compatible:	Must be "ti,omap-counter32k" for OMAP controllers
> -- reg:		Contains timer register address range (base address and length)
> -- ti,hwmods:	Name of the hwmod associated to the counter, which is typic=
ally
> -		"counter_32k"
> -
> -Example:
> -
> -counter32k: counter@4a304000 {
> -	compatible =3D "ti,omap-counter32k";
> -	reg =3D <0x4a304000 0x20>;
> -	ti,hwmods =3D "counter_32k";
> -};
> diff --git a/Documentation/devicetree/bindings/arm/omap/ti,omap-counter32=
k.yaml b/Documentation/devicetree/bindings/arm/omap/ti,omap-counter32k.yaml
> new file mode 100644
> index 000000000..aadb5ea1b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/omap/ti,omap-counter32k.yaml
> @@ -0,0 +1,41 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/arm/omap/ti,omap-counter32k.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Texas Instruments OMAP Counter-32K
> +
> +maintainers:
> +  - Eduard Bostina <egbostina@gmail.com>
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - const: ti,omap-counter32k
> +      - items:
> +          - const: ti,am4372-counter32k
> +          - const: ti,omap-counter32k
> +
> +  reg:
> +    maxItems: 1
> +
> +  ti,hwmods:
> +    description: Name of the hwmod associated to the counter
> +    $ref: /schemas/types.yaml#/definitions/string-array
> +    items:
> +      - const: counter_32k
> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    counter32k: counter@4a304000 {

Drop the label here if you respin. In examples, there's no reason to
have labels with no users.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

Cheers,
Conor.

> +        compatible =3D "ti,omap-counter32k";
> +        reg =3D <0x4a304000 0x20>;
> +        ti,hwmods =3D "counter_32k";
> +    };
> --=20
> 2.54.0
>=20

--iOmrs0KdPxAlP68+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCah8PXwAKCRB4tDGHoIJi
0sEDAP9MhEKrEAJcmfn2LMf4TvsUNjqXZ2NUC+RfCMLIs38RvgEAhBOuUDnYiidA
KtRKzTSmjSqoWhichCY0LpdvZHX7IA4=
=odTr
-----END PGP SIGNATURE-----

--iOmrs0KdPxAlP68+--
