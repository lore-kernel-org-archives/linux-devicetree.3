Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4C6B3E5564
	for <devicetree@vger.kernel.org>; Wed,  3 Jun 2026 16:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780503441; cv=none; b=SwGiOE7jx0VLalVoMkNMNpB/35bc39jRQWnO5yC67FzZRk7P+7+g0PYmgYqprAsjEpZm0o8h7U1VYKYDxIe8ETlTVGj4irqqxklMtdoYVg+HuPAE9lXBZQC40fRKvmsGGZ+tiE/ix3NQdY7h2tC1sr336QR5yfBR8PiHDscuKxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780503441; c=relaxed/simple;
	bh=STmgb4eCzuj3QUyDrbNGukfTitiuFEoTNqL7diLYpq4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jxgMYdya31+oisV9ca0ArCv5DgRyhKcxvRRvTgBwU8zER7qVar4Sswl5S0+F0Pt7N3yA/hfMZIx92xlgNQrSYrSOF9kM5Wle6DJGrsruys6QC7L9X91oQXOQphdfNDzQVJThFiRJ9mXN03IGXqHEUWyjqeH04ZqctvH8b6EQwEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cPFnGYX6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cPFnGYX6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4D2D1F00893;
	Wed,  3 Jun 2026 16:17:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780503440;
	bh=STmgb4eCzuj3QUyDrbNGukfTitiuFEoTNqL7diLYpq4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cPFnGYX6kVV8XG6BLqIDkBOCao6GfzWE+EYujXj0F9bPVTufgayrsW6wml0EvBTuq
	 lPb05VYOm4DgU3piQv6n+E8SHaWec9nrD6rvja3+QRgX4JLklmHr+xL6vrkDprZja/
	 lab+aaZx8TsP7JPoXxkenEOgeczeOcXmHCp8puokw+E2G9ln35YAzQl3e/Sn2bSf0X
	 GhEfRUM4kZSzAlQ+/zsHeWMTTHbK2ht0wGQ+cm5+ic5X7A2p0U2vChiq4vVy3qbqH7
	 VgdaKwq52yvE4NyvZwST0GumYyIr9qe2dXyG1AINQ57m1P2S/ahHOBGSKGzJJwTa30
	 qDYWaP5mgxerg==
Date: Wed, 3 Jun 2026 17:17:15 +0100
From: Conor Dooley <conor@kernel.org>
To: Joel Stanley <joel@jms.id.au>
Cc: Paul Walmsley <pjw@kernel.org>, Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Drew Fustini <fustini@kernel.org>, Anup Patel <anup@brainfault.org>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Nicholas Piggin <npiggin@gmail.com>,
	Michael Ellerman <mpe@kernel.org>, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 5/7] dt-bindings: riscv: add Smrnmi extension description
Message-ID: <20260603-deviate-steadier-9ff6a23c5e57@spud>
References: <20260603074222.593243-1-joel@jms.id.au>
 <20260603074222.593243-6-joel@jms.id.au>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yNASxG9BLdH4uAVz"
Content-Disposition: inline
In-Reply-To: <20260603074222.593243-6-joel@jms.id.au>


--yNASxG9BLdH4uAVz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--yNASxG9BLdH4uAVz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaiBTiwAKCRB4tDGHoIJi
0kbSAP9kgT70mva4v9V2xH/K4hakrtleDSRqYCgMGRnprAgEIQEAr9YGD/YVGhxM
pOWj8Tps+sLahUnos02ypNnRWaqJ5Qs=
=2eh+
-----END PGP SIGNATURE-----

--yNASxG9BLdH4uAVz--
