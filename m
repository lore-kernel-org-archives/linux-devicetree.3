Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F6FA1684B0;
	Thu, 25 Jun 2026 16:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782405224; cv=none; b=DwTgUPWumWMuYS+d/5SYRjdoY/njcFxTsCf3SudjIp0WnTcXbcBIZXwBFEFR6EwiHTWN/3zf4SS/Q3z4smekrYGptwgFLGb1pd0kN4ItayxkDDNlL8ypr7MIFZvdk1UxmxU8kWR6T4fTHIZfTU5JYCnW6C3E12Qgz+HpDHN+MOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782405224; c=relaxed/simple;
	bh=qeQbxaCZ4s/NUKwWSGez8Xk9aQAx/mIYQJQbF9Bnz+A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B3bS1k7a8phcAsRTqcCbQlGqP778mEy3E+VdSIN7b0YLccsCX2TCvjnU70k+LEj7qfknQa7985ahmhZCVn3/pLSYb27x0P4L6qUZu7k6LUfUJBhRkkkHD/bl+TOZyuSAkZYqXdH0llEnkUEXRQdRZ550JGKCW1BInYRieh70cvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hn3dEhhe; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hn3dEhhe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A12F51F000E9;
	Thu, 25 Jun 2026 16:33:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782405222;
	bh=pF7r8Suuyxl8sdpT4nHSKElQ5U8ikQ1Lgh9G42/RStA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hn3dEhhe9wK6t3XUN2k9ekg/GGphBH8ltK7YWwVS/yHZNbG+jVBzSNcWb0I5j0rXv
	 NfPHB2F+y74Kf3IiTUWbgZQqkb8fUr9rThrg8j75y85wWlITxDWHA3DdUCWdYpU6Ec
	 HvQd85bR62cl0BnRzBI5GIfm9Uq0ugu0fUh3D7IXl5XZK/kUNfI+7JWSpWGXAcKpDp
	 Ksd54/0tPLVy89wCo+mmBOOcZjoPgQPQl5f7X7k8CUSmgBR6C4x/+8KEKBHkCnPEtk
	 JLT+QsAlUAKa9MLIP4G1HjwKKWssuVdLdu9Cvp8Pzs0G/sFAztT9sSMp2H3wxf9pGj
	 Id2enASFb1aGw==
Date: Thu, 25 Jun 2026 17:33:37 +0100
From: Conor Dooley <conor@kernel.org>
To: Joey Lu <a0987203069@gmail.com>
Cc: zhengxingda@iscas.ac.cn, maarten.lankhorst@linux.intel.com,
	mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
	simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, ychuang3@nuvoton.com, schung@nuvoton.com,
	yclu4@nuvoton.com, dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/7] dt-bindings: display: verisilicon,dc: generalize
 for single-output variants
Message-ID: <20260625-bobbing-annotate-d1c4d6874ee2@spud>
References: <20260625094449.708386-1-a0987203069@gmail.com>
 <20260625094449.708386-2-a0987203069@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+TtTxxYr7EzNj57c"
Content-Disposition: inline
In-Reply-To: <20260625094449.708386-2-a0987203069@gmail.com>


--+TtTxxYr7EzNj57c
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 25, 2026 at 05:44:43PM +0800, Joey Lu wrote:
> The verisilicon,dc binding was originally written for the T-Head TH1520
> SoC carrying a DC8200, and hard-codes five clocks, three resets and two
> output ports.
>=20
> Add the Nuvoton MA35D1 DCUltraLite (nuvoton,ma35d1-dcu) to the binding.
> The DCUltraLite uses only two clocks (core, pix0) and one reset (core),
> with a single output port.
>=20
> Use allOf/if blocks to express per-variant constraints rather than
> hard-coding the DC8200 topology at the top level.  Each compatible's
> block constrains the clock and reset item counts; the nuvoton block
> additionally overrides clock-names to the two names it actually uses.
>=20
> Signed-off-by: Joey Lu <a0987203069@gmail.com>
> ---
>  .../bindings/display/verisilicon,dc.yaml      | 57 +++++++++++++++++++
>  1 file changed, 57 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/display/verisilicon,dc.yam=
l b/Documentation/devicetree/bindings/display/verisilicon,dc.yaml
> index 9dc35ab973f2..1e751f3c7ce8 100644
> --- a/Documentation/devicetree/bindings/display/verisilicon,dc.yaml
> +++ b/Documentation/devicetree/bindings/display/verisilicon,dc.yaml
> @@ -17,6 +17,7 @@ properties:
>      items:
>        - enum:
>            - thead,th1520-dc8200
> +          - nuvoton,ma35d1-dcu
>        - const: verisilicon,dc # DC IPs have discoverable ID/revision reg=
isters
> =20
>    reg:
> @@ -77,6 +78,62 @@ required:
>    - clock-names
>    - ports
> =20
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: thead,th1520-dc8200
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 5
> +          maxItems: 5
> +
> +        clock-names:
> +          minItems: 5
> +          maxItems: 5

All the maxItems here repeat the maximum constraint and do nothing.

Since you didn't change the minimum constraint at the top level, your
minItems also do nothing.

> +
> +        resets:
> +          minItems: 3
> +          maxItems: 3
> +
> +        reset-names:
> +          minItems: 3
> +          maxItems: 3
> +
> +      required:
> +        - resets
> +        - reset-names

Both conditional sections have this, but the original binding doesn't
require these for the thead device. This is a functional change
therefore and shouldn't be in a patch calling itself "generalise for
single ended variants".

FWIW, adding your new compatible shouldn't really be in a patch with
that subject either, it really should say "add support for nuvoton
ma35d1" or something.

> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: nuvoton,ma35d1-dcu
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 2

Anything that updates the minimum constraint should be done at the top
level of this schema. The conditional section should then tighten the
constraint, in this case that means only having maxItems.

> +          maxItems: 2
> +
> +        clock-names:
> +          items:
> +            - const: core
> +            - const: pix0

Does this even work when the top level schema thinks clock 2 should be
called axi?

> +
> +        resets:
> +          minItems: 1
> +          maxItems: 1
> +
> +        reset-names:
> +          items:
> +            - const: core

This is just maxItems: 1.

pw-bot: changes-requested

Thanks,
Conor.

> +
> +      required:
> +        - resets
> +        - reset-names
> +
>  additionalProperties: false
> =20
>  examples:
> --=20
> 2.43.0
>=20

--+TtTxxYr7EzNj57c
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaj1YYQAKCRB4tDGHoIJi
0ou2AP9dpj8bbLX3OZ2Ey8Fy9rGzWYngUkF98tUBkf7J4UsmBQEAp5PDIWO4HZ83
JVms9+NVKX7pGBsDAler0gcdWCFEbAg=
=Df/b
-----END PGP SIGNATURE-----

--+TtTxxYr7EzNj57c--
