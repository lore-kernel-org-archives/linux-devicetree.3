Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0362A37E2F7;
	Thu,  6 Aug 2026 16:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786035018; cv=none; b=UOI1ZIoYOKHiCiY1S6MwcFGoRxZUzO2lUZQ1fIPpd1s8tUGA9Vx7NMRLjLrBbkGusCmHaLnd8qsuvAnRUSXO5UZPGv3ZHjOp3QBOVM7HFZB3oXF1Ktx+Tv10ffvEig6zW93/RLlqgEPCyoijk4QXbdMRoA2aEnHLsrC5dks2x2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786035018; c=relaxed/simple;
	bh=aPuc2zrAltbKZ+fdJlnFtsRY+93S9N5SzridiGPT78Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M8ey+gaUTmcgl9oOxs8JoNDShPvMje3wIwJ+3w0F4gfR59mrgYpM2KSVpBIoh0bCzHV36BtmuUxFSxLeIBW9/ItAPd/81AwelzM9dm0JVIh17Fo0BKGk7EIEb2ehLRjtFFUrTQy28a0n80Vac+r+OXdEOkQclU2eCzK5N0hjJwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OyGnuFWe; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OyGnuFWe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DEC51F00A3A;
	Thu,  6 Aug 2026 16:50:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786035010;
	bh=aPuc2zrAltbKZ+fdJlnFtsRY+93S9N5SzridiGPT78Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=OyGnuFWe/TkpxloNsc16W5dSNtg4znh+eh21NtKS/AObZgnftJ01Qitp3p7IAW2TU
	 vGWp+VGsAaEw1G3iNwYnkdjX0VKy0OXtp2rEqJ9VZE/XjnxRS5mQWmb2Wk9ht8nPyu
	 GdiaywnCBX7KYRH14hZupfjw395iK4gvTpL+yNvVtab4DaCFP1eEaF2MHv6H3mZENq
	 gDapFG6DbrdGlB/CznFnM357PU9hzNo3wOEM8x6143mcRzVFzPeeZD4EN3tXvTJyme
	 ULP4Fu/flvODpF+4SxJfsXMwMxfowJX2zQH+e5z0AMkCztGxHtOlPcuaihTH7aqZu6
	 inG7Nrx621A7Q==
Date: Thu, 6 Aug 2026 17:50:03 +0100
From: Conor Dooley <conor@kernel.org>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>, Yixun Lan <dlan@kernel.org>,
	Joel Stanley <jms@oss.tenstorrent.com>,
	Drew Fustini <dfustini@oss.tenstorrent.com>,
	Darshan Prajapati <darshan.prajapati@einfochips.com>,
	Guodong Xu <guodong@riscstar.com>,
	Michal Simek <michal.simek@amd.com>,
	Junhui Liu <junhui.liu@pigmoral.tech>,
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
	E Shattow <e@freeshell.de>, Icenowy Zheng <uwu@icenowy.me>,
	Anup Patel <anup@brainfault.org>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v3 4/5] dt-bindings: serial: snps-dw-apb-uart: Add
 StarFive JHB100 UART compatible
Message-ID: <20260806-submitter-retrace-ba05dcf14938@spud>
References: <20260806122553.182449-1-changhuang.liang@starfivetech.com>
 <20260806122553.182449-5-changhuang.liang@starfivetech.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gTvjWTvn0oJlfixR"
Content-Disposition: inline
In-Reply-To: <20260806122553.182449-5-changhuang.liang@starfivetech.com>

--gTvjWTvn0oJlfixR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--gTvjWTvn0oJlfixR
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCanS7OwAKCRB4tDGHoIJi
0qIvAQD60eZJPBahWlIn01C8IQAuZOIIppV7zo0c41CY/TyZCwEA5+TJNoLvB0BT
7JvXHXIbDZmbJI8yHggizIQFJJz0IgY=
=BpJA
-----END PGP SIGNATURE-----

--gTvjWTvn0oJlfixR--
