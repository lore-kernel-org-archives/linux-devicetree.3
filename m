Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FBE429AAFA
	for <devicetree@vger.kernel.org>; Thu,  4 Jun 2026 16:44:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780591458; cv=none; b=duqjlH1RjUy7IxjgXLMtLfiUNX8JmVWi+YgI2rs9r/j9Sr7Sjz2H1+/B2M6R7GydWm5ZIQOfTyq5h9h2qsR7MhKceWlT4CIApVxqnKptofsDdzFd/eaJvZG5iTjw4qC5aNcqtMBugftmQwvNmBkrvjYt22k1Tm39hiHVygstQAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780591458; c=relaxed/simple;
	bh=xpfCQb0f0RQ9VM7+cHYIDy/L/aEeP4pps5RxAlULLvY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ttD4K04mZwYppv7pGTGXZR4KVyR8pxhA9uaznr5KLwU1lVsc2rXgZo+IEQ1apKcj6LD5xl4u1sjsdVBf7ZSx7ABgKzexz72F9RyCZbgPor7MTQcLmQQVNBMkiKBPDnOV81B5R5C2PrDk+kQql2WAcAc1ETXLZVsK63VSkzPZk0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fg5Lk2zV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fg5Lk2zV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CF6C1F00893;
	Thu,  4 Jun 2026 16:44:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780591456;
	bh=xpfCQb0f0RQ9VM7+cHYIDy/L/aEeP4pps5RxAlULLvY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fg5Lk2zVDgIbt0983DWzuNz5E9iTFH8YDgTIrfgvw3jszyYMQk3NdJl7MgcbrQgvH
	 eCoS/rOwdVYzZkXlO1bMyAEgoy0YjSPtamFqFX9RBPYfGsISVYCnR37ykDSQbbr6qH
	 bnDHers69O8hb+J1/MzVqqKD1c8y/beN0p3ChXr5iCX9YZhPcZSc/PD0YGJNfIq4dn
	 uP+RBFkij5CGf1PZQnqRF+fOdE6kmBUHI6C6T+1BXZTD0N6/6QkLEgg+vBg45gKf/6
	 GtN/lNDOckNwE5/nDaW/DjLfFDLfZ8T2vm+rzuibXH+/pf6zQE+bjZdlM4x63mx5KZ
	 Mv0n7lohQX4SA==
Date: Thu, 4 Jun 2026 17:44:12 +0100
From: Conor Dooley <conor@kernel.org>
To: Joel Stanley <joel@jms.id.au>
Cc: Paul Walmsley <pjw@kernel.org>, Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
	Anup Patel <anup@brainfault.org>, Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Nicholas Piggin <npiggin@gmail.com>,
	Michael Ellerman <mpe@kernel.org>,
	Drew Fustini <fustini@kernel.org>, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 3/7] dt-bindings: riscv: cpus: Add Tenstorrent Ascalon
Message-ID: <20260604-ravioli-expansion-cf5215234bab@spud>
References: <20260604143957.668047-1-joel@jms.id.au>
 <20260604143957.668047-4-joel@jms.id.au>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="1yPvnAK5LiPXdjaq"
Content-Disposition: inline
In-Reply-To: <20260604143957.668047-4-joel@jms.id.au>


--1yPvnAK5LiPXdjaq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--1yPvnAK5LiPXdjaq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaiGrXAAKCRB4tDGHoIJi
0gy7APwIkV8QZB6pyK9SrYi8NFGK3QBzxZergUQIMWqX2XRNpQEA0Lhw/PgdYacX
dxegYUg1eO65xisg5PDFbEbMlo3v4gk=
=LWbO
-----END PGP SIGNATURE-----

--1yPvnAK5LiPXdjaq--
