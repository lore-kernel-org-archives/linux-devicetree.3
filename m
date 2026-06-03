Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF8DF2F7EE8
	for <devicetree@vger.kernel.org>; Wed,  3 Jun 2026 16:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780503467; cv=none; b=TflxQdR8kcm4Uw4SkJCEGliWcCUS3lcJvDJ6tUarPTzIaYci/XH49/Xgh1gdzro7giobZDAWdPbVxCXP9UZ2z/NH3cv5eW3Y+mekNOvr2l2ohsl5cuR+A256q6Ho+6mkaLyC8iuGDHXSbSnznI+wtAmN0f8/DFz/Dr+znG2U1Sc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780503467; c=relaxed/simple;
	bh=83i4RhRSci6f26Cf3BeQQbJGmB1+ThjsDf2TJdq/nw8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=far+tO5p8lggJCxvh8eGxktq25vbOJ8eVb/9SpOgV44D1kjnRFzuDT3LHNz8Zpk8iTXHTiLHRWqVkpi17oa1CO9YmaoG/5L+tguww8Gs7872Nh/VrjAbFoYA2AQX2/G157/qrKq1C+vGuxtB4P2kPn+OKJwU+3wIJ0WgyBroXXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZWSldL2Z; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZWSldL2Z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F6471F00898;
	Wed,  3 Jun 2026 16:17:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780503465;
	bh=oZrCq03vD+W7CnEX3l5q3h1hepjeCf4/ygYLn31YoL4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZWSldL2ZiXpFW3jwjJWtQr8OT0DAL9K4RRNxBR4xKm/e2Kcq0duqn2px+j2OJY6WA
	 T4irrP12C31C6lOEKygjx89UUlWKbyTGW468vBkYLu7JElqNGmPv1mzfA/8jU+l15S
	 wGD7/nkus/x57oVnzeVn4TSrA7yEzMJvWntb6cGJZdpU+VF0JEpCRax/rt2J3F+VnD
	 WBRLAXI0ahZy+hC15GMTwgqAj6y53/StyS2WMj1pOPx3GhCDVWmGgC5JK9Ty20ZIMt
	 8a0jwaB/wZdGoUPiPsUsHVytBiX82xFbf432yLUjC9DbqwG04cdZbxSsqwVwUO+tm9
	 jWfJX8GK3Np+g==
Date: Wed, 3 Jun 2026 17:17:41 +0100
From: Conor Dooley <conor@kernel.org>
To: Joel Stanley <joel@jms.id.au>
Cc: Paul Walmsley <pjw@kernel.org>, Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Anup Patel <anup@brainfault.org>, Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Nicholas Piggin <npiggin@gmail.com>,
	Michael Ellerman <mpe@kernel.org>,
	Drew Fustini <fustini@kernel.org>, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 6/7] dt-bindings: riscv: Add Tenstorrent Atlantis platform
Message-ID: <20260603-enrich-primal-69483cc92b84@spud>
References: <20260603074222.593243-1-joel@jms.id.au>
 <20260603074222.593243-7-joel@jms.id.au>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qgBMOnVz6MeZyK6M"
Content-Disposition: inline
In-Reply-To: <20260603074222.593243-7-joel@jms.id.au>


--qgBMOnVz6MeZyK6M
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 03, 2026 at 05:12:18PM +0930, Joel Stanley wrote:
> Add compatible for the Tenstorrent Atlantis platform.
>=20
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> Signed-off-by: Drew Fustini <fustini@kernel.org>

This one has weird signoff stuff.
pw-bot: changes-requested

> ---
>  Documentation/devicetree/bindings/riscv/tenstorrent.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/riscv/tenstorrent.yaml b/D=
ocumentation/devicetree/bindings/riscv/tenstorrent.yaml
> index e15359b2aab6..7fb640e38455 100644
> --- a/Documentation/devicetree/bindings/riscv/tenstorrent.yaml
> +++ b/Documentation/devicetree/bindings/riscv/tenstorrent.yaml
> @@ -22,6 +22,10 @@ properties:
>          items:
>            - const: tenstorrent,blackhole-card
>            - const: tenstorrent,blackhole
> +      - description: Tenstorrent Atlantis
> +        items:
> +          - const: tenstorrent,atlantis-evb
> +          - const: tenstorrent,atlantis
> =20
>  additionalProperties: true
> =20
> --=20
> 2.47.3
>=20

--qgBMOnVz6MeZyK6M
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaiBTpQAKCRB4tDGHoIJi
0iDiAQCisvgMhNdE+uYp81bLvRKeSjsd8VI9jc5Zm9HN+H6hPQEA5o/26XX+Vw+S
yTEQhDEp765BindUwHoJq/KTinlwfQ0=
=LejP
-----END PGP SIGNATURE-----

--qgBMOnVz6MeZyK6M--
