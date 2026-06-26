Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AADA197A7D;
	Fri, 26 Jun 2026 15:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782489461; cv=none; b=JNKIR1YE5NU4lnFpOZvoBB7Qygb7CvsfayByLPjOcNF3AqULlRCBZSYAg7yHiTCwC3n/lh2ZpvgNQLEp4d06JNobqWIEAqDJifKJ1xYS7d5d9BqDCu4mO/GyNEQ49MTbtr+kEU4pzi+cNOc+fkZdMsVkx1nL5Q9xwGDBIFtl29g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782489461; c=relaxed/simple;
	bh=mgPewDfMa2EsuaxIqebyRmPsLjNJjJ+AHtg/xB2OoG8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DpOVO7ZsbZKuOa7fmTotswfCwfJqiFS+xKPc1DV2QZ/srQ9qml1ReQtZnRIKtXAav92I3VknibG+BmQ1kBIWfsuxeclmmbM9i4CDeC32JqDT3SQ/rLZkikup86hoLlJlOHtkfKmziwyeCGyhTDoKMrHHFKBoZasIiRrRB878wsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cG8fnMlh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cG8fnMlh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F3BE1F000E9;
	Fri, 26 Jun 2026 15:57:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782489459;
	bh=jFfWRr8y10hg154czzuGpyS/bv0IkGNIbDUnL8w6ntM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cG8fnMlh5cSaCm6wDuGl7LW8U1Hvl7MIY0LWTf1iUwzgGY0HXwae87bJrMgB03beF
	 9k5X9jAL9jaqg5Mjfxa/vHbjOJ0Mma91LHO4EJuyuLyE+a/JoFg3iNZ7OK9OXmxpdU
	 qCqYnJPCbrcYy9T77vcBimSDkfu43RnH3nZYov2RjuADQRmef5q5XCYYVlV1QptmMJ
	 MGmwZMTydrJB//WwlIaT1wQd6b7wjw5828Z8rPa8TrNyrsPKswiPZ3W9bFP8QDFNmn
	 xtsz3ndB1aKkSZXMUieAGd4xRKIvdiyo/djap16CuCFx5ipHP7UAYiFlW1/IM66rQY
	 RauCwSmJnV6ig==
Date: Fri, 26 Jun 2026 16:57:35 +0100
From: Conor Dooley <conor@kernel.org>
To: Gregor Herburger <gregor.herburger@linutronix.de>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Eric Anholt <eric@anholt.net>,
	Stefan Wahren <wahrenst@gmx.net>,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 2/4] dt-bindings: raspberrypi,bcm2835-firmware: Include
 'reboot-mode.yaml'
Message-ID: <20260626-quaking-shove-fcc9d8057ae0@spud>
References: <20260626-rpi-tryboot-v1-0-490b1c4c4970@linutronix.de>
 <20260626-rpi-tryboot-v1-2-490b1c4c4970@linutronix.de>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="k5rMmSOE0G84CTzG"
Content-Disposition: inline
In-Reply-To: <20260626-rpi-tryboot-v1-2-490b1c4c4970@linutronix.de>


--k5rMmSOE0G84CTzG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 26, 2026 at 09:35:05AM +0200, Gregor Herburger wrote:
> The Raspberry Pi firmware allows to set a reboot mode called tryboot
> that allows to try booting from a different partition to allow updating
> of the boot partition. Allow reboot mode properties by referencing the
> reboot-mode schema.
>=20
> Signed-off-by: Gregor Herburger <gregor.herburger@linutronix.de>
> ---
>  .../devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml    | 5=
 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm283=
5-firmware.yaml b/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm=
2835-firmware.yaml
> index 983ea80eaec97..30b490e0d9fb3 100644
> --- a/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmw=
are.yaml
> +++ b/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmw=
are.yaml
> @@ -133,11 +133,14 @@ properties:
>      required:
>        - compatible
> =20
> +allOf:
> +  - $ref: /schemas/power/reset/reboot-mode.yaml#
> +
>  required:
>    - compatible
>    - mboxes
> =20
> -additionalProperties: false
> +unevaluatedProperties: false

I think you should keep additionalProperties: false and add
mode-normal: true
mode-tryboot: true

(I don't know if the latter works though, you may need to have a $ref to
uint32-array).

What you've done permits freeform reboot modes, but I think only normal
and tryboot are valid?

--k5rMmSOE0G84CTzG
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaj6hbgAKCRB4tDGHoIJi
0rCiAQDDg0pspsj14SGLKGCowwFULn0NgShcWSuAfhQG5rzqzQD/Ymt/dEAL4KnG
ZR+Qf/2INUCS21KV8pjjudsiq+YmlQw=
=E7wz
-----END PGP SIGNATURE-----

--k5rMmSOE0G84CTzG--
