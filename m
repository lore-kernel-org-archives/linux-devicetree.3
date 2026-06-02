Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 978613EDE67;
	Tue,  2 Jun 2026 17:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780420235; cv=none; b=DuFwpjB7fdFQtiWNaXUvotqZtb5+SfmYw34ovgMykfPQabvd6PtFpzFX1SEFcmBpXbIFXT8++OjjmVYYnZZJbq9Rg7YKdbtbpx5QeZ0qXKJktAxVIJjHyF6po2FJqWG2g+J/b3EoujE9kpOMN7rv8veE01ymG2uUJ4csT1AU6/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780420235; c=relaxed/simple;
	bh=iqDCkkZHRgIwxenGQ3uxwpZE1rmCnXlYDR4oQYFN08g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bCBlhQBlQQjJx9cBYKKmp2q2B+o+ieN5mGcO8+BSPsTEWeTReRo0FbEARU5i3gbapAB3ENGtaU2OZQWg9G/IUhSWVqg4/f2Ohd4rafunKiaA2rJLBam0OVnqhvpmlxQukN6UiFeGol0V3CEF4O/ueNY2mvsc2KU9eHGNEB38oAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LAd3CSwk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LAd3CSwk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FCDD1F00893;
	Tue,  2 Jun 2026 17:10:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780420234;
	bh=i/en7+8HojSHi0MvEHGr86FSHPB5AGR4O71fxPEOlyE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LAd3CSwk9yVv/liyVbi2R3k1568YMkE3t58cyMLeXYOUYU6009lirHYfRR4HSWDyM
	 Yjg+6Fdju5QzBVbvyg3lexS/BqDBzqWqkmzJCvPt9UGWSPCpd2S6iooU4lXt7JH+rI
	 Gjy991apsysCaFo9p0WTzVHkc5GkYqTjtoWRN3e9twwWGg8Jsjn3tZ4z8VDiJYWuDx
	 XuVsyFvle7yACeSRAdPmUk55pfAXZgQH7vEjMODbxB+s8Wg9WBmRNlwaE+z7N1/9VU
	 yf1LM7YvajrGa8Cw+RjBz0AR69lY6eZuQ4FbAbFpkhXzuY8HRCCE6CB2jovJwEGX7x
	 9+Ra5c+7gUW1Q==
Date: Tue, 2 Jun 2026 18:10:30 +0100
From: Conor Dooley <conor@kernel.org>
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: linux-phy@lists.infradead.org, Ioana Ciornei <ioana.ciornei@nxp.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Tanjeff Moos <tanjeff.moos@westermo.com>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 phy-next 13/15] dt-bindings: phy: lynx-10g: initial
 document
Message-ID: <20260602-reviving-aging-a7d066d2448b@spud>
References: <20260529171509.1163787-1-vladimir.oltean@nxp.com>
 <20260529171509.1163787-14-vladimir.oltean@nxp.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="n43cmaynV/qxZXqy"
Content-Disposition: inline
In-Reply-To: <20260529171509.1163787-14-vladimir.oltean@nxp.com>


--n43cmaynV/qxZXqy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 29, 2026 at 08:15:07PM +0300, Vladimir Oltean wrote:
> Add a schema for the 10G Lynx SerDes. This is very similar to the modern
> form of the 28G Lynx SerDes, which is very much the intention.
>=20
> We allow both forms of #phy-cells =3D <1> in the top-level provider
> and #phy-cells =3D <0> in the per-lane provider for more flexibility to
> consumers, and because the kernel code is shared with the 28G Lynx which
> already has that support for compatibility reasons.
>=20
> Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
> ---
> Cc: devicetree@vger.kernel.org
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Rob Herring <robh@kernel.org>
>=20
> v1->v2:
> - move patch later in series, right before driver
> - deliberately ignoring this Sashiko feedback:
>   https://lore.kernel.org/linux-phy/20260529125017.ifqunh52gdzhthdg@skbuf/
> ---
>  .../devicetree/bindings/phy/fsl,lynx-10g.yaml | 131 ++++++++++++++++++
>  1 file changed, 131 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/fsl,lynx-10g.ya=
ml
>=20
> diff --git a/Documentation/devicetree/bindings/phy/fsl,lynx-10g.yaml b/Do=
cumentation/devicetree/bindings/phy/fsl,lynx-10g.yaml
> new file mode 100644
> index 000000000000..993f076bba4e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/fsl,lynx-10g.yaml
> @@ -0,0 +1,131 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/phy/fsl,lynx-10g.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Freescale Lynx 10G SerDes PHY
> +
> +maintainers:
> +  - Vladimir Oltean <vladimir.oltean@nxp.com>
> +
> +description:
> +  The 10G Lynx is a multi-protocol SerDes block which handles networking=
, PCIe,
> +  SATA and other high-speed interfaces. It is present on most QorIQ and
> +  Layerscape SoCs. The register map is common, but the integration is
> +  SoC-specific, with the differences consisting in register endianness, =
the
> +  number of lanes, protocol converters available per lane and their loca=
tion in
> +  the PCCR registers. Some SoCs have multiple SerDes blocks and those di=
ffer in
> +  their protocol capabilities per lane.
> +
> +properties:
> +  compatible:
> +    description:
> +      There is intentionally no generic fsl,lynx-10g compatible string d=
ue to
> +      the hardware inability to report its capabilities, despite having a
> +      common register map.

I think you can probably drop this from the diff, and put it in the
commit message.

> +    enum:
> +      - fsl,ls1028a-serdes
> +      - fsl,ls1046a-serdes1
> +      - fsl,ls1046a-serdes2
> +      - fsl,ls1088a-serdes1
> +      - fsl,ls1088a-serdes2
> +      - fsl,ls2088a-serdes1
> +      - fsl,ls2088a-serdes2
> +
> +  reg:
> +    maxItems: 1
> +
> +  big-endian: true

This isn't a required property, but should it be made required for the
specific compatibles that are big endian? Or are we not that lucky, and
devices can be either?

Cheers,
Conor.

> +
> +  "#phy-cells":
> +    const: 1
> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 0
> +
> +patternProperties:
> +  "^phy@[0-7]$":
> +    type: object
> +    description: SerDes lane (single RX/TX differential pair)
> +
> +    properties:
> +      reg:
> +        minimum: 0
> +        maximum: 7
> +        description: Lane index as seen in register map
> +
> +      "#phy-cells":
> +        const: 0
> +
> +    required:
> +      - reg
> +      - "#phy-cells"
> +
> +    additionalProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - "#phy-cells"
> +  - "#address-cells"
> +  - "#size-cells"
> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - fsl,ls1028a-serdes
> +              - fsl,ls1046a-serdes1
> +              - fsl,ls1046a-serdes2
> +              - fsl,ls1088a-serdes1
> +              - fsl,ls1088a-serdes2
> +    then:
> +      patternProperties:
> +        "^phy@[0-7]$":
> +          properties:
> +            reg:
> +              minimum: 0
> +              maximum: 3
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    soc {
> +      #address-cells =3D <2>;
> +      #size-cells =3D <2>;
> +
> +      serdes@1ea0000 {
> +        compatible =3D "fsl,ls1028a-serdes";
> +        reg =3D <0x0 0x1ea0000 0x0 0xffff>;
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +        #phy-cells =3D <1>;
> +
> +        phy@0 {
> +          reg =3D <0>;
> +          #phy-cells =3D <0>;
> +        };
> +
> +        phy@1 {
> +          reg =3D <1>;
> +          #phy-cells =3D <0>;
> +        };
> +
> +        phy@2 {
> +          reg =3D <2>;
> +          #phy-cells =3D <0>;
> +        };
> +
> +        phy@3 {
> +          reg =3D <3>;
> +          #phy-cells =3D <0>;
> +        };
> +      };
> +    };
> --=20
> 2.34.1
>=20

--n43cmaynV/qxZXqy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCah8OhgAKCRB4tDGHoIJi
0jTqAP9uJkBzy69VGT2auMd4hx6xT/BKOZEXAUBGygySolIGXAD+JF9xbx2hIJkG
SxA0ONlLt2s32aARx9lck5Xxwud3SQc=
=EkQN
-----END PGP SIGNATURE-----

--n43cmaynV/qxZXqy--
