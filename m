Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A65D245020
	for <devicetree@vger.kernel.org>; Wed,  3 Jun 2026 16:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780503510; cv=none; b=cxr0vxB/cNw+1LAy0jFEcLeT0cn+OIZK37H9uVG8JMZtibg0UsDz3YCzzUQE6vroeVnUHjRSbE6zCgIv6dkO86MoVv6z/maYJL6oY9zVBEGFY4HHeJPqHhlufFP2ARuKfYfj+oNVOopetWV8C0raNUIFjVBROXJwWYuaqTQPgho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780503510; c=relaxed/simple;
	bh=FnMY/2X2xH1/8dY8P9AlyT83N8Oh+sno7ZgsmD8SOpk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CTGbz/nKW9EnfKl0cIv2pxxv9FZErCwxwcPpzydW8cadI3XrRyM3n7iygvpCTxM61m4OLzvVu1DgLTiQhOXlxRst28ALrTNNCLfkVsclKQIlnxkKBot+AEtxtOVgiRgAJtnVDlDVv7xhyvUWfZF+08eI3m4rXTP/F2fp2E/iUhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T3RU2WWB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T3RU2WWB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC6AE1F00893;
	Wed,  3 Jun 2026 16:18:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780503509;
	bh=0dkSNsGhATHahHOIk343lrdaR3d+vmGuRZtKmmqFoCY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=T3RU2WWBBp3wx7cySsyMEVkpuLZW1obU14Qhu+YzMQNM9x9IAJw4JXyzEq+SHDCij
	 amqm8vwggC2lPKJoqcFhKbWbpBaBS89u3GZxIzON14pQfK39YD8gQ9SIM7WEXJtYFX
	 rRW781Op3ArOR2TykVBdS0BP+ku6ohz6+cSFnwXjspKFGpn11lhIHwDsphzyicur6X
	 svO+3EH5STJnTE8aoI61IIOgPtA/34/fwoC5Yu92ycy6XICt4tibwO69YGtupRqYyk
	 qr3DYudwGwsHQeo0e8Y36fEs7O5g+mg5sBFweJe/BmMZj72O/n25kvjeoCeQUPEDMY
	 z5vaKPVYZNqNQ==
Date: Wed, 3 Jun 2026 17:18:24 +0100
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
Subject: Re: [PATCH 3/7] dt-bindings: riscv: cpus: Add Tenstorrent Ascalon
Message-ID: <20260603-freeload-mammary-a9ffe25027a5@spud>
References: <20260603074222.593243-1-joel@jms.id.au>
 <20260603074222.593243-4-joel@jms.id.au>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="IdNJvVaQ8NO6e5lM"
Content-Disposition: inline
In-Reply-To: <20260603074222.593243-4-joel@jms.id.au>


--IdNJvVaQ8NO6e5lM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 03, 2026 at 05:12:15PM +0930, Joel Stanley wrote:
> Add Tenstorrent Ascalon microarchitecture and the Tenstorrent Ascalon-XG
> core.
>=20
> Signed-off-by: Drew Fustini <fustini@kernel.org>
> Signed-off-by: Joel Stanley <joel@jms.id.au>

Same here.
pw-bot: changes-requested

> ---
>  Documentation/devicetree/bindings/riscv/cpus.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Document=
ation/devicetree/bindings/riscv/cpus.yaml
> index 5feeb2203050..2a57bd14569e 100644
> --- a/Documentation/devicetree/bindings/riscv/cpus.yaml
> +++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
> @@ -75,6 +75,11 @@ properties:
>                - sifive,x280
>            - const: sifive,rocket0
>            - const: riscv
> +      - items:
> +          - enum:
> +              - tenstorrent,ascalon-xg
> +          - const: tenstorrent,ascalon
> +          - const: riscv
>        - const: riscv    # Simulator only
>      description:
>        Identifies that the hart uses the RISC-V instruction set
> --=20
> 2.47.3
>=20

--IdNJvVaQ8NO6e5lM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaiBT0AAKCRB4tDGHoIJi
0t2fAP0SOH4/qoVR+yCPstssQkqd3ER8ROudAzs7kQg849IOyQD9Ft3kytAqIQto
X9BuoS8YKaqsNEy6B9lDTjX3yAXq/go=
=GqXK
-----END PGP SIGNATURE-----

--IdNJvVaQ8NO6e5lM--
