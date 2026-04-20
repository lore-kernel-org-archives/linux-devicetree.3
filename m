Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F01C533AD9A;
	Mon, 20 Apr 2026 16:09:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776701365; cv=none; b=Vd+h8jyYPy5EFA4nXNcz7wkrKNIsfWGuj5DgW2kXpwebC0caz60oJTK7AihSFMF2VsqakIlG65/Y87qGAjSsK84Rca6iCM5pc7LN7qgKeZAcJONwlOycxgrVLZbQUesXzUAYm+71DAqb31QHHuxtm1GAJPuRwwhGgFAZjzrvaas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776701365; c=relaxed/simple;
	bh=N7X3thVr7Aj6OO/j5V7YIiSdv1Ezp1OC5G5e8lLAhrM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DDG8m0jkpugcahU1zI4ciCv7rBj1tgnKgAtFy8Cip8oBi5ZA/F073XQRVrt6ijo/jZhWjkYmtsf4drIKJxyZbg4pMchErTSJYk4GRfmliZrQHu5HYh+xBMDuru9hjNrumPhF6TAnsxEzZKI8d8AzHkL6+aJnOCrAl7c7mNLsiyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rZsw0v2y; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rZsw0v2y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C31D5C19425;
	Mon, 20 Apr 2026 16:09:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776701364;
	bh=N7X3thVr7Aj6OO/j5V7YIiSdv1Ezp1OC5G5e8lLAhrM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rZsw0v2y+SswDOsApU24v+OL8rK90IOlGv77AU807DfHRlkKBJZmtgDSsCfutYIqU
	 tx1NXi7RTF24AuBeEitm8Bx9FuWEmtKQ1RyLZ3LNwPpSkOfw1HvpfXabjwJFg/8B2c
	 XI2QzhPsDr0+tQyNUBXtvYEolrye7v6uLcCtR2ERlwbLofcjGKQuTOQEGW2+MokRuI
	 yy+CbWvjSsR3m/NT0za4tX7zARTFUz33a5lr0oUhLXEcTzBRXrFT1usIhBTyaaks6Z
	 wsfDmFfJwXGLQ940ZTRudRpaQs42l+9HBfNgz3Cs2jwP/2H1gZ37vf7CRX6j0/+oRb
	 +zIk7GiSzRAwA==
Date: Mon, 20 Apr 2026 17:09:19 +0100
From: Conor Dooley <conor@kernel.org>
To: Nick Hu <nick.hu@sifive.com>
Cc: Daniel Lezcano <daniel.lezcano@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Anup Patel <anup@brainfault.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: timer: Remove sifive,fine-ctr-bits property
Message-ID: <20260420-flyover-smoked-8aa5c34279c4@spud>
References: <20260419-clintv2-remove-fine-ctr-v1-1-7527f4d45850@sifive.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vR2BNAp44kW2n+kv"
Content-Disposition: inline
In-Reply-To: <20260419-clintv2-remove-fine-ctr-v1-1-7527f4d45850@sifive.com>


--vR2BNAp44kW2n+kv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 19, 2026 at 11:18:55PM -0700, Nick Hu wrote:
> The counter width can be inferred from the compatible string, making the
> explicit "sifive,fine-ctr-bits" property redundant. Remove the property
> to simplify the bindings.

And there are no users of this, because the only permitted compatible
string combination contains {}.
Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

>=20
> Fixes: 0f920690a82c ("dt-bindings: timer: Add SiFive CLINT2")
> Suggested-by: Conor Dooley <conor+dt@kernel.org>
> Link: https://lore.kernel.org/linux-riscv/20260330-relative-hardened-5ce3=
5fe1ef57@spud/
> Signed-off-by: Nick Hu <nick.hu@sifive.com>
> ---
>  .../devicetree/bindings/timer/sifive,clint.yaml          | 16 ----------=
------
>  1 file changed, 16 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/timer/sifive,clint.yaml b/=
Documentation/devicetree/bindings/timer/sifive,clint.yaml
> index 3c16b260db04..051edb1da0d7 100644
> --- a/Documentation/devicetree/bindings/timer/sifive,clint.yaml
> +++ b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
> @@ -72,22 +72,6 @@ properties:
>      minItems: 1
>      maxItems: 4095
> =20
> -  sifive,fine-ctr-bits:
> -    maximum: 15
> -    description: The width in bits of the fine counter.
> -
> -if:
> -  properties:
> -    compatible:
> -      contains:
> -        const: sifive,clint2
> -then:
> -  required:
> -    - sifive,fine-ctr-bits
> -else:
> -  properties:
> -    sifive,fine-ctr-bits: false
> -
>  additionalProperties: false
> =20
>  required:
>=20
> ---
> base-commit: c1f49dea2b8f335813d3b348fd39117fb8efb428
> change-id: 20260409-clintv2-remove-fine-ctr-d5caeda27863
>=20
> Best regards,
> --=20
> Nick Hu <nick.hu@sifive.com>
>=20

--vR2BNAp44kW2n+kv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaeZPrwAKCRB4tDGHoIJi
0jyYAQCSy47nKECre6NxjHKLdkqjOYzUHJxy6oPNAnyL32w/VwD+IiuoWIry8JLL
agr6bn+8fw4Uc4Mzc5BGzDqZRWmJaQ8=
=rp8K
-----END PGP SIGNATURE-----

--vR2BNAp44kW2n+kv--
