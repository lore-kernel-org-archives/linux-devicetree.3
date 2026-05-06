Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D928A13B58C;
	Wed,  6 May 2026 17:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778088701; cv=none; b=EMAthwcVVlbb0EOujUPQ30qcrZ+d/NwRbq2z4grd7jhqZE+quKMm8cjSH3I7dxq0ps2EH7Fzh9nmq2gwaipghhvc0vnb1r9T1Gyar4Ho4CFv5ZkYloefnSEbeg3Zs1onL6vdPDFvAaN2QI9TEY2xtumeEWMT7TlDwPDVGX2XVbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778088701; c=relaxed/simple;
	bh=IXW/gs6w5MDeR9oMEXijuhUMUHTh6E+zU+M+iFLMlpU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XnhrJ2RCPyPX57g9jRsbNxa3iGLYyUDVsJbLCxGgsBQqYDO+4g5/v24N+NP7czmah6uFiqXKSEJY4m7TLx5sDxILRbXqapq2qqs/PJTOrioW8rMqWiM4PXc4WxtmgGWQ5b8FzwicFkW6ZR7SqoYArRAO8taNbcExcfdNN63MA4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dx4isqLg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dx4isqLg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21E85C2BCB0;
	Wed,  6 May 2026 17:31:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778088701;
	bh=IXW/gs6w5MDeR9oMEXijuhUMUHTh6E+zU+M+iFLMlpU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dx4isqLgc1x044bHqO4HPhxPHkU5q1I21A0oaqtU2HF+Qa84+yMomcDCGJSrY6DCM
	 Zb9Tzppb8RpJElwMjzQywDASxzwAiwwct4qwAhHBN/TZCbPCirZbvLIMkWVFB0dZK0
	 Q1h6UUI7HDoETh2igqwGdFUSasl4gESt2HcrFSyNi+2ElnAqA6SsgivETY/ljf/59z
	 n2YyKpEG9jUDsUJ5geeKAAeGL1QEjWKTc4zP3MIRPjGb9oZPBuLHRu4SI36cxq54bQ
	 OHCyMLHWA0RlzmbzCY2422zCZp6NLoN7VZWr+1mKDzUaCSBcL25H5ooE6cD4WrkFn/
	 jGaeq/kaWyDAw==
Date: Wed, 6 May 2026 18:31:37 +0100
From: Conor Dooley <conor@kernel.org>
To: Andrew Rembrandt <kernel@rembrandt.dev>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linusw@kernel.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: arm: st,nomadik: Convert to DT schema
Message-ID: <20260506-turmoil-chef-81946165534a@spud>
References: <20260506170236.2610955-1-kernel@rembrandt.dev>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="RGBws5Tk3qhVLKYL"
Content-Disposition: inline
In-Reply-To: <20260506170236.2610955-1-kernel@rembrandt.dev>


--RGBws5Tk3qhVLKYL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 06, 2026 at 07:02:36PM +0200, Andrew Rembrandt wrote:
> Convert the ST Nomadik boards binding from free-form text to DT schema.
>=20
> The binding documents the Nomadik NHK15/USB-S8815 platform compatibles
> and keeps the existing example.
>=20
> Signed-off-by: Andrew Rembrandt <kernel@rembrandt.dev>
> ---
>  .../devicetree/bindings/arm/st,nomadik.yaml   | 36 ++++++++++++++++++
>  .../devicetree/bindings/arm/ste-nomadik.txt   | 38 -------------------
>  MAINTAINERS                                   |  2 +-
>  3 files changed, 37 insertions(+), 39 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/arm/st,nomadik.yaml
>  delete mode 100644 Documentation/devicetree/bindings/arm/ste-nomadik.txt
>=20
> diff --git a/Documentation/devicetree/bindings/arm/st,nomadik.yaml b/Docu=
mentation/devicetree/bindings/arm/st,nomadik.yaml
> new file mode 100644
> index 000000000000..9a6d1458cad3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/st,nomadik.yaml
> @@ -0,0 +1,36 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/arm/st,nomadik.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: ST Nomadik SoC based Boards
> +
> +maintainers:
> +  - Linus Walleij <linusw@kernel.org>
> +
> +description: |
> +  Boards using the Nomadik SoC platform
> +
> +properties:
> +  $nodename:
> +    const: '/'
> +  compatible:
> +    oneOf:
> +      - const: st,nomadik-nhk-15
> +      - const: calaosystems,usb-s8815
> +
> +additionalProperties: true
> +
> +examples:
> +  - |
> +    usb-s8815 {
> +        ethernet-gpio {
> +            gpios =3D <&gpio3 19 0x1>;
> +            interrupts =3D <19 0x1>;
> +            interrupt-parent =3D <&gpio3>;
> +        };
> +        mmcsd-gpio {
> +            gpios =3D <&gpio3 16 0x1>;
> +        };
> +    };

This example should just be removed, it has nothing to do with what's in
the binding above. The text binding describes it as a "required node",
but no node by the name appears in the kernel sources.

With it gone,
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

pw-bot: changes-requested

Cheers,
Conor.

--RGBws5Tk3qhVLKYL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaft6+QAKCRB4tDGHoIJi
0uk7AQDoPwVpfTCEtPu/YLhKAFhJCyzqRG9Psyh7SjBjLJQSDQD9GvcsDxGN1a6P
GpyjKA5lv3Ffwr4tM+0mwUmH6KsHywQ=
=37OC
-----END PGP SIGNATURE-----

--RGBws5Tk3qhVLKYL--
