Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABBB04204E
	for <devicetree@vger.kernel.org>; Wed,  3 Jun 2026 19:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780515423; cv=none; b=U5IV+JPWyh7MqyDTyKVyCC8yTA1g9qIDHICdDF02Tf7WrzoUb2gBp1JsKLWeJQt5bps8eKNp3LAkHCaCGLIBNcfDZPR+AUo45FW4jTdW3ZcvanaMzj1kLxuEwl3GTFa3gQbJnBKRDumyNWM9DHf9Jy5IAE1qnZo0IH/FOTQVv/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780515423; c=relaxed/simple;
	bh=s3qnc/SJWDZVqy5joLNzLjwUlB1aBEwjBqBmT0FU8gY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lnFPVYx6jEdiFJLYF6ZLyxuvpK7/gNrCPahdy0BTpl+/lBKauk4MfshSudwN0gW2bDerXhQNE3BFPBz5w6hXKTZQr9doJz6nFIC26b21W94YItBpoy0fEZDu7E5CP3gfIoyo6UZXXZUK3/XSSOaXet0EPDoMIdXddxIfvVy7abQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SZQWscm7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SZQWscm7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E76581F00893;
	Wed,  3 Jun 2026 19:37:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780515422;
	bh=s3qnc/SJWDZVqy5joLNzLjwUlB1aBEwjBqBmT0FU8gY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=SZQWscm7L2vXrJbDhlkoQkeUJkLEDBlD2comFRsfLCkSwI+Z+b93Gc3jB8oSWL+ja
	 KbUxFtO6lhSwuUFQuX2tV9SnHqBa2Tqnbw4JTfVwWubAk+00Ov/AGKLPLA9oxjTiX0
	 t2rzWJB4uXUI9AtBjyJXATFh/zjnuU4rUJib3XMYXiSL+DK0u4slD/t/+koMtZvwnk
	 4xLDBD97wwdk1+NmYJTbJHhfXbVUlfyyouFXnADc5KHBKJD4eLjMiONgmkdTCxEe7g
	 PAzuw/w5SM2VttqKq2rhxjUcgurCWykKo8Mgmwz+C5pR/M0lvbeqdbFWjgJ0MyXhwV
	 yNMh/r+aFanKw==
Date: Wed, 3 Jun 2026 12:37:00 -0700
From: Drew Fustini <fustini@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: Joel Stanley <joel@jms.id.au>, Paul Walmsley <pjw@kernel.org>,
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Anup Patel <anup@brainfault.org>, Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Nicholas Piggin <npiggin@gmail.com>,
	Michael Ellerman <mpe@kernel.org>, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 6/7] dt-bindings: riscv: Add Tenstorrent Atlantis platform
Message-ID: <aiCCXO0XFfFSdLQB@gen8>
References: <20260603074222.593243-1-joel@jms.id.au>
 <20260603074222.593243-7-joel@jms.id.au>
 <20260603-enrich-primal-69483cc92b84@spud>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="PKkjq6arGK0OljzM"
Content-Disposition: inline
In-Reply-To: <20260603-enrich-primal-69483cc92b84@spud>


--PKkjq6arGK0OljzM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 03, 2026 at 05:17:41PM +0100, Conor Dooley wrote:
> On Wed, Jun 03, 2026 at 05:12:18PM +0930, Joel Stanley wrote:
> > Add compatible for the Tenstorrent Atlantis platform.
> >=20
> > Signed-off-by: Joel Stanley <joel@jms.id.au>
> > Signed-off-by: Drew Fustini <fustini@kernel.org>
>=20
> This one has weird signoff stuff.
> pw-bot: changes-requested

Sorry about that. At one point, I was going to send the series so my SoB
got added. It should be dropped from all of these patches authored by
Joel.

Thanks,
Drew

--PKkjq6arGK0OljzM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSy8G7QpEpV9aCf6Lbb7CzD2SixDAUCaiCCVwAKCRDb7CzD2Six
DFzjAQDsnxKEvbM+HmKWbwYeRsAEhTUoAXLpfl47EcMzOmajiAEA5LQwNiBUIk0f
x+ZN3WrLFvotRZClG34vhMQZHQU9FQg=
=T1bm
-----END PGP SIGNATURE-----

--PKkjq6arGK0OljzM--
