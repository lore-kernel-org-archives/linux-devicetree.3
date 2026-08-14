Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CDC33C9ED9;
	Fri, 14 Aug 2026 15:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786721920; cv=none; b=qakDt6jVz59I3+RHg0z/eCiJkAOAb9amtZx2bp42/fNPGAqCqnZT6QM4BXWZlIArzMMXXmfa/MYbT8Q6ms/AgaIHH3TfF/NLU2xVv24CEUhatWQxuX5AJLu2YVZl9q5Ud4LY0Ls1gzn8VtutVMXv5x8wB+H9gKXweMvUgDm+qA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786721920; c=relaxed/simple;
	bh=VYCsYcoKAQarcFZS1n6H5PPwHdRgjJp4Rg53VulkzTI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BoTTBVTOXy0ave2XDF2FMKxPf6e5xHaSxFCfXcjmZhVbMoLihSYMEwQhkxOqAcAFrRPYcp8w3YDRWErR3UI4jtG3wbMBJdoU/jYaFhqShRvVzSFCrWwKAY10KOJQiyUnbm93D1g8nBqaxbRd+g7oZJsXZb6z3uIdaLV6hl0V/6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fzg4PSI9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fzg4PSI9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CF8C1F000E9;
	Fri, 14 Aug 2026 15:38:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786721919;
	bh=2zDsdfvqyAQGNQFpULwmV74pld1nNrSo0Q52aSj3naM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fzg4PSI9SdrWRn6jAIQSbkKwFucvq0bVzHIsg4DRzhiAXdrkzVna9PG5F6kkhfrAn
	 QHgTltd//bEtUfJ35JFWt5f2dzI5Wzf9UFDEXuwvTJ+noHEgbkbtj1hTiueaySVT7+
	 qop6gUunUCoBLG83gO2Fh1J1BuG8iFqev9lqnZN+/WJK3i8wm16z4fPLQp4cAJFLjG
	 l4h5JA8+cMGGeIkAVTCsgWCXYSsIviM9Tej7jZXsSiu+4F1WeaZmoAvsyLJY23P2SS
	 28PhBWOF8pBHz/iPLv60IvPqpGE9BjIOPasGi2+J8O+TZxrdObj3qinONq1xkDuvaf
	 u/3WlPWty5/Zw==
Date: Fri, 14 Aug 2026 16:38:34 +0100
From: Conor Dooley <conor@kernel.org>
To: Shubham Patil <shubhamsanjay.patil@amd.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-i3c@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: i3c: xlnx: Add IBI and hot-join
 capability properties
Message-ID: <20260814-cubical-transpire-413101a0c4c2@spud>
References: <20260814115155.3974988-1-shubhamsanjay.patil@amd.com>
 <20260814115155.3974988-2-shubhamsanjay.patil@amd.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+DtxFDk3UUG+rw01"
Content-Disposition: inline
In-Reply-To: <20260814115155.3974988-2-shubhamsanjay.patil@amd.com>

--+DtxFDk3UUG+rw01
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 14, 2026 at 05:21:53PM +0530, Shubham Patil wrote:
> In-Band Interrupt and Hot-Join are synthesis-time options of the AXI I3C
> IP. Describe them with two boolean properties.
>=20
> A Hot-Join request is acknowledged by the IBI machinery, so a hot-join
> capable design is always IBI capable as well. Both events are reported
> through the controller interrupt, which is therefore required whenever
> the capability is present.
>=20
> Signed-off-by: Shubham Patil <shubhamsanjay.patil@amd.com>
> ---
>  .../bindings/i3c/xlnx,axi-i3c-1.0.yaml        | 23 +++++++++++++++++++
>  1 file changed, 23 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/i3c/xlnx,axi-i3c-1.0.yaml =
b/Documentation/devicetree/bindings/i3c/xlnx,axi-i3c-1.0.yaml
> index 2caa245a8656..07e3d0b4d767 100644
> --- a/Documentation/devicetree/bindings/i3c/xlnx,axi-i3c-1.0.yaml
> +++ b/Documentation/devicetree/bindings/i3c/xlnx,axi-i3c-1.0.yaml
> @@ -32,13 +32,34 @@ properties:
>    interrupts:
>      maxItems: 1
> =20
> +  xlnx,ibi-capable:
> +    type: boolean
> +    description:
> +      The IP is synthesized with In-Band Interrupt support. IBIs are rep=
orted
> +      through the controller interrupt.
> +
> +  xlnx,hj-capable:

tbh, I'd prefer if these were spelt out a little bit more, characters
are cheap. Not a big deal though.

> +    type: boolean
> +    description:
> +      The IP is synthesized with Hot-Join support. A Hot-Join request is
> +      acknowledged by the same machinery as an In-Band Interrupt.
> +
>  required:
>    - compatible
>    - reg
>    - clocks
> =20
> +dependencies:
> +  xlnx,hj-capable: ["xlnx,ibi-capable"]
> +
>  allOf:
>    - $ref: i3c.yaml#
> +  - if:
> +      required:
> +        - xlnx,ibi-capable
> +    then:
> +      required:
> +        - interrupts

Why is one dependency expressed this way, and the other expressed using
the dependencies property? Can the interrupts property be handled that
way too?

Cheers,
Conor.

> =20
>  unevaluatedProperties: false
> =20
> @@ -54,5 +75,7 @@ examples:
>          interrupts =3D <GIC_SPI 89 IRQ_TYPE_LEVEL_HIGH>;
>          #address-cells =3D <3>;
>          #size-cells =3D <0>;
> +        xlnx,ibi-capable;
> +        xlnx,hj-capable;
>      };
>  ...
> --=20
> 2.34.1
>=20

--+DtxFDk3UUG+rw01
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCan82egAKCRB4tDGHoIJi
0iQrAQCs8qebR4quXdJpbjsXqfeQ608+ln1zNqvEfX7zedYCOAD/cYD8S+Ph/N6i
2fWFRkepRMirbphPDInTh0ZEKaL38Aw=
=GetW
-----END PGP SIGNATURE-----

--+DtxFDk3UUG+rw01--
