Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 561E23EAC89;
	Mon, 29 Jun 2026 15:26:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782746809; cv=none; b=AY3rd8yiAn6nTk0dcGV41g1I9VmyRhTVONNZZYeKN2X+X6NxwRIKn4YgGUqs7KcGXnhJ1ZesaRtfPolEBIL3/ceDdRT903IPWQJUK8gWExqLVuorv8O6PbFiDSPDzrUzP5o1l3OATQLnqjvWrStQyyy+wiyGFHqFWDT6qdX9nck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782746809; c=relaxed/simple;
	bh=DASQGYICKZHhLoVSGta/Peqo2uesJheDohHXOfCwpys=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hc+pnyZxaVhkHFTMIUAxhoPyBPIsQo2VwHoqnp9Ut5yhRnBEsHJJwAphWRHhc/QCmH1Lz1vVojN5gvaLsgDPC9wrNkgYVCqZeDSm12LEDa6tPBfyGjNFo5jH2t2tHeL2vRN8l3ByBdhFiikn7UEyohtKg9/rnLF6jcQyJd+cz74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kIQ37Fhi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kIQ37Fhi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF75A1F000E9;
	Mon, 29 Jun 2026 15:26:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782746808;
	bh=1DD1v7WAUfTa8LEsmdnXmo8TZcmGZDr0zVXhLE2Z5xY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kIQ37Fhi2asFeMqWXXsLFHsaVl4ib20zlyAFLNPHlXv0muZuUzgETqBfuj/Xy0YSa
	 WJJts9i1xfRTBqy+zfHF5JnBJTN/zs0dNJNhfZhaGXZ8Z19wG+JNMOIwlQY1iqmiff
	 PIziNckrvryuyZfyUnkqvaVrPWY2MHnD/UBExEufw9TxRtRGGQbL03J5eqvKCl69E3
	 pDJ3L5POMusd4aiY7cHf4gavA7VhI/eO9NRlRTEBLytFyr1ZY95b2cvcTvDYFIdKTd
	 hDbN0ncM+iPhk21ehxXhUZxcdXehe4d2QrzD7j+JKWClC5ai3hdfGDw94kMdZ2sphP
	 o+cmD1krgsh/A==
Date: Mon, 29 Jun 2026 16:26:43 +0100
From: Conor Dooley <conor@kernel.org>
To: yc_hsieh@aspeedtech.com
Cc: Corey Minyard <corey@minyard.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	openipmi-developer@lists.sourceforge.net,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org
Subject: Re: [PATCH 3/4] dt-bindings: ipmi: Add optional LPC properties to
 ASPEED BT devices
Message-ID: <20260629-bogus-vocation-db32e55a595f@spud>
References: <20260629-aspeed-bt-bmc-multichannel-v1-0-fc23ee337f7a@aspeedtech.com>
 <20260629-aspeed-bt-bmc-multichannel-v1-3-fc23ee337f7a@aspeedtech.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="JftmSqqify0j7mOM"
Content-Disposition: inline
In-Reply-To: <20260629-aspeed-bt-bmc-multichannel-v1-3-fc23ee337f7a@aspeedtech.com>

--JftmSqqify0j7mOM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 29, 2026 at 02:49:00PM +0800, Yu-Che Hsieh via B4 Relay wrote:
> From: Yu-Che Hsieh <yc_hsieh@aspeedtech.com>
>=20
> Allocating IO and IRQ resources to LPC devices is in-theory an operation
>=20
> for the host, however ASPEED systems describe these resources through
>=20
> BMC-internal configuration, as already supported by the ASPEED KCS BMC
>=20
> binding.
>=20
> Add aspeed,lpc-io-reg and aspeed,lpc-interrupts to the ASPEED BT BMC
>=20
> binding so firmware can describe the host LPC IO address and SerIRQ
>=20
> configuration using the same properties as KCS devices.
>=20
> Signed-off-by: Yu-Che Hsieh <yc_hsieh@aspeedtech.com>
> ---
>  .../bindings/ipmi/aspeed,ast2400-ibt-bmc.yaml       | 21 +++++++++++++++=
++++++
>  1 file changed, 21 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/ipmi/aspeed,ast2400-ibt-bm=
c.yaml b/Documentation/devicetree/bindings/ipmi/aspeed,ast2400-ibt-bmc.yaml
> index c4f7cdbbe16b..1803c6bbae93 100644
> --- a/Documentation/devicetree/bindings/ipmi/aspeed,ast2400-ibt-bmc.yaml
> +++ b/Documentation/devicetree/bindings/ipmi/aspeed,ast2400-ibt-bmc.yaml
> @@ -25,6 +25,24 @@ properties:
>    interrupts:
>      maxItems: 1
> =20
> +  aspeed,lpc-io-reg:
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    maxItems: 1
> +    description: |
> +      The host CPU LPC IO address for the BT device.
> +
> +  aspeed,lpc-interrupts:
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    minItems: 2
> +    maxItems: 2
> +    description: |
> +      A 2-cell property expressing the LPC SerIRQ number and the interru=
pt
> +      level/sense encoding (specified in the standard fashion).
> +
> +      Note that the generated interrupt is issued from the BMC to the ho=
st, and
> +      thus the target interrupt controller is not captured by the BMC's
> +      devicetree.

Why can these two properties not just be an additional reg and
interrupts entry?


Cheers,
Conor.

> +
>  required:
>    - compatible
>    - reg
> @@ -35,10 +53,13 @@ additionalProperties: false
>  examples:
>    - |
>      #include <dt-bindings/clock/aspeed-clock.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> =20
>      bt@1e789140 {
>          compatible =3D "aspeed,ast2400-ibt-bmc";
>          reg =3D <0x1e789140 0x18>;
>          interrupts =3D <8>;
>          clocks =3D <&syscon ASPEED_CLK_GATE_LCLK>;
> +        aspeed,lpc-io-reg =3D <0xe4>;
> +        aspeed,lpc-interrupts =3D <10 IRQ_TYPE_LEVEL_LOW>;
>      };
>=20
> --=20
> 2.34.1
>=20
>=20

--JftmSqqify0j7mOM
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCakKOswAKCRB4tDGHoIJi
0psAAP9G4epdhbKfSpCHpiVzmew6DQEbokTKpL+98RgnG2LBKQD/U3BgoLrNNiQx
n3K2bKbjCnRtMLKQG2R8sbPvLE9VbwM=
=ygXE
-----END PGP SIGNATURE-----

--JftmSqqify0j7mOM--
