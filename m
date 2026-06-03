Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 099FD383990
	for <devicetree@vger.kernel.org>; Wed,  3 Jun 2026 09:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780478209; cv=none; b=ZSyAg+sHL1TvhqezuDKjE+XbmOmWgnyNWVpx21t2JCOmEzLDVxAi8ZJeC1JkIuWNA131q6oPXNDWviZtjT1YUR3YGOYNSZGi5L11G0bY2HE8p2ITjuLZdwxitOupRcYyJ8A8dld9VGuTSzlhExMSKjdnS2x7/a8oY4NQUvEuinU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780478209; c=relaxed/simple;
	bh=S0Dp3roNTafspkw5dXHraXdzk0Q2pledRTqXBt74W9A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jGnJG9EScfSq9/P15R7ZcpV9RfRDJoCyxpmBqeKLK+G+DppvZNkqUrnqKA+RxNBo3Te5AelfBGMParddDP9t/Wr/gKdk6WcolmP+Zt0+l+FkrSHmZVIoouU+IcpodWwE7i/XON5wAme5ST+qgYJwzqggAu0TRem5dcuiFLFedNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XfY1Ggja; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XfY1Ggja"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 113121F00893;
	Wed,  3 Jun 2026 09:16:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780478206;
	bh=S0Dp3roNTafspkw5dXHraXdzk0Q2pledRTqXBt74W9A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XfY1Ggja5PfDw5V3R1IhEm11y6Fmp/WnqGZdWUa1emZlRg47O5AdZguDyh7S7ggZp
	 /LjEQZQfpwtlc/QwrYc+stfBK6CQNK6mk2x5UFeii24djZg4jebTkmvFZP6YLEV+p+
	 t0dw881j28wB9q2qs9F8SGZtjxMIOwtp3dUUUB5lod8uFfqPwnztaK02qhHX5u6X16
	 kRkthDlFAk8lUo4xJ/dwdn1MYngL4CaTUVyHyJ6AUyAUGYorjBQdqjli8X5WeFnOrP
	 a6L4FFvZ/uGo0gE//ZnqQQViOgeefKUHAztZv1ap/BFCT2WZj2KnsqWg83zJpQiwY+
	 McS90bsay30BQ==
Date: Wed, 3 Jun 2026 10:16:42 +0100
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
Subject: Re: [PATCH 7/7] riscv: dts: tenstorrent: Add Atlantis platform
Message-ID: <20260603-selective-labored-f9afc652ac7b@spud>
References: <20260603074222.593243-1-joel@jms.id.au>
 <20260603074222.593243-8-joel@jms.id.au>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="v38FfJYRf01Nq9M/"
Content-Disposition: inline
In-Reply-To: <20260603074222.593243-8-joel@jms.id.au>


--v38FfJYRf01Nq9M/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 03, 2026 at 05:12:19PM +0930, Joel Stanley wrote:
> Add initial support for the Tenstorrent Atlantis platform, based on the
> Atlantis SoC featuring 8x RVA23-compliant Tenstorrent Ascalon-XG cores.
>=20
> The evb machine represents an internal bringup vehicle with just the
> interrupt controllers and a UART. This will be replaced in time with a
> full featured machine once details are available.
>=20
> Signed-off-by: Drew Fustini <fustini@kernel.org>
> Signed-off-by: Joel Stanley <joel@jms.id.au>

Signoff chain here, and elsewhere is not right.
What did Drew do? Are they the author or is there a missing
Co-developed-by?

--v38FfJYRf01Nq9M/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCah/w5gAKCRB4tDGHoIJi
0nXSAP9ril9N3Rwg+mCFumbafIDvR95k++C9ZqZMpl6sHtK68wEA8GkzsDBwpHkf
vShF75TGDsjz/1/VJFL0KRKfrFt3Xwc=
=/UR0
-----END PGP SIGNATURE-----

--v38FfJYRf01Nq9M/--
