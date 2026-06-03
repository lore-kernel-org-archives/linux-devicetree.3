Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FDCC245020
	for <devicetree@vger.kernel.org>; Wed,  3 Jun 2026 16:19:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780503556; cv=none; b=CoTD8OBRy1pE+6zcK2SjHohRhYNzfPDftvXsOFuoMMosVU3GcVcztgRJEw5yot8oNRz5hmyQ66GASqGqHSoy+df2vXlfXcOnN5Hz+SVakpBqsO67Bd0y/rOT3n3wohxpTXHefcU6+CWIk/M7MN+BhR9rpX+/D1S2UV5WLwjNlVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780503556; c=relaxed/simple;
	bh=5gQh9cs6MPxLIuOE1u+2ja43F/HbYGeOSikbX+qxA9M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hjdkK3W2lmoFdc9hp5dNbeGJ1UEC6PAS8E+UUAmnnpaFBzsrpWu7cLV7LeaYrzjrHQLfkYv1B87m0T7+rHpZrXdfMQ7bAMFmNmfTuVEptoCOHosq1pIbhO5JszMxsg4j6SpwEqN/EQ2RqUK2fq2BE5yhlhAj4Vz85b9OEamFudg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OBzHvjOf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OBzHvjOf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E0A71F00893;
	Wed,  3 Jun 2026 16:19:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780503554;
	bh=RYDnMoFkGoMbthW/cDkhbVtgE1RhM2hvasPu/pp1fPI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=OBzHvjOfeinUk3riPEpdNHaTpETsDDcFkNtgEheKfP/+biEZ1wNMO7gb3QuSzDVAg
	 JemIRVGrGkx311d84Qx8oWMMfwjGBs2j07Z3tkvUlkYDJ73q4zATm7GQ+HiB6YnSPB
	 /KlaSBiJqV/CNSSh4vGV9rrkPuFxmX9I+FSLQULVdOr0Jn24nABnlZkxmS/dJ0iwkl
	 53QffyEuOmQnVerG6rZ4br0ztXm8aR5/P5aLGQJzSf4dSiEhES+ncohYzJgf8ZLW37
	 oSZCnR9g2j/7Q71RVoEPVfy8zrgaLhEBQa5Z6chSr+bAzdo27om75cEjDQ69ePpjSZ
	 TYPC92NBZRLVg==
Date: Wed, 3 Jun 2026 17:19:10 +0100
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
Subject: Re: [PATCH 1/7] dt-bindings: aplic: Add Tenstorrent Atlantis
 compatible
Message-ID: <20260603-landed-starting-e9ae05ee5bad@spud>
References: <20260603074222.593243-1-joel@jms.id.au>
 <20260603074222.593243-2-joel@jms.id.au>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="o6fKTAQ8s6Qwklcx"
Content-Disposition: inline
In-Reply-To: <20260603074222.593243-2-joel@jms.id.au>


--o6fKTAQ8s6Qwklcx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 03, 2026 at 05:12:13PM +0930, Joel Stanley wrote:
> Add compatible for APLIC in Tenstorrent Atlantis SoC.
>=20
> Signed-off-by: Drew Fustini <fustini@kernel.org>
> Signed-off-by: Joel Stanley <joel@jms.id.au>

And here. The contents all look fine of course.
pw-bot: changes-requested

> ---
>  .../devicetree/bindings/interrupt-controller/riscv,aplic.yaml    | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/riscv=
,aplic.yaml b/Documentation/devicetree/bindings/interrupt-controller/riscv,=
aplic.yaml
> index 0718071444d2..d4e17861eda4 100644
> --- a/Documentation/devicetree/bindings/interrupt-controller/riscv,aplic.=
yaml
> +++ b/Documentation/devicetree/bindings/interrupt-controller/riscv,aplic.=
yaml
> @@ -29,6 +29,7 @@ properties:
>        - enum:
>            - qemu,aplic
>            - spacemit,k3-aplic
> +          - tenstorrent,atlantis-aplic
>        - const: riscv,aplic
> =20
>    reg:
> --=20
> 2.47.3
>=20

--o6fKTAQ8s6Qwklcx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaiBT/gAKCRB4tDGHoIJi
0l5GAP0fvT0M06cFFeyqtsR+mNv08/sfjuufzpFb4swLyoR5vgEAwnmvpoSNybTy
zZq6Bj6p+IYUyQcI479x6VQKnYjgkwg=
=oPhm
-----END PGP SIGNATURE-----

--o6fKTAQ8s6Qwklcx--
