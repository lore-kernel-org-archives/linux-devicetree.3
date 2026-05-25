Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7B513F5BED;
	Mon, 25 May 2026 16:43:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779727424; cv=none; b=XS7J60Fmoqw1TGloRhSRW5cdYk9nLa4PIZ2qQVP55yRcIZHMEg8+W7mpjnFaLmWGKgkPs3EiX0byGH2mSgGxhYlWgNV6HqRUJRydW09MlWszYq2vcCCY5i5PZu/l1wFw0mc+gQzvCr0EiGx2/aNWAgbzd9A5k8t+FD23SYJzkAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779727424; c=relaxed/simple;
	bh=OgsDFyP42Vfjuq6OtI+aOC2Wv89vd3+bjandhQMxepc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k+DgeSi8VGe+W2iGgdsxgp6mrIQ8wPMttACjUnDKB1Opj6IJV2iv/nandcrPe9ukYw0goRjvmxeQ4mml3CJqQuVpjzQmdWBI0j4BEFYtK+N9rJuW07kJ9jNpiHofHL7XbJYrwjnJ/htmBH7OMUQoxwiaeh/T/LCDd2i1kApUYnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fCu7yDOZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fCu7yDOZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49BDB1F000E9;
	Mon, 25 May 2026 16:43:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779727423;
	bh=OgsDFyP42Vfjuq6OtI+aOC2Wv89vd3+bjandhQMxepc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fCu7yDOZyggX2FSu9uIyU4+X5Ymjl/iMEyoZv8QPH1Z3OXcUm6cVj28CSPbofYdLr
	 6Wqry44T1/Clwkp0BN0PiKHJUJ4Y25k8zM4vhNq56r9rfD20AEqN6603p92ljAkR6P
	 PJPJ5v77+6b+gpB7PX7+WpFThAmRejKMZjGzFgMRpEY5gZjj1I0vztjFmwUtvKstqH
	 6rH51B0E0CgZ5b0792IZZj3K/AxIhCNz1nwjvEUc1T8e8ocdrilHSGPUSflb4G1HDe
	 Ng+Hl56lVmKNybXf8qTJqwgQzZQbXqVExMnD30v3KGAiEcVCdJa4v7jBnc0y167rER
	 nv3Fodai6UA+g==
Date: Mon, 25 May 2026 17:43:39 +0100
From: Conor Dooley <conor@kernel.org>
To: Patrick Barsanti <patrick.barsanti@amarulasolutions.com>
Cc: devicetree@vger.kernel.org, linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org, heiko@sntech.de, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org,
	linux-amarula@amarulasolutions.com, michael@amarulasolutions.com,
	dario.binacchi@amarulasolutions.com
Subject: Re: [PATCH 1/3] dt-bindings: vendor-prefixes: Add Axelera AI
Message-ID: <20260525-prototype-dingbat-1aa80f9a112e@spud>
References: <20260522174918.61523-1-patrick.barsanti@amarulasolutions.com>
 <20260522174918.61523-2-patrick.barsanti@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yU57OYvm+3N+PKUP"
Content-Disposition: inline
In-Reply-To: <20260522174918.61523-2-patrick.barsanti@amarulasolutions.com>


--yU57OYvm+3N+PKUP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

With the changed company name
Acked-by: Conor Dooley <conor.dooley@microchip.com>

pw-bot: changes-requested

--yU57OYvm+3N+PKUP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCahR8OwAKCRB4tDGHoIJi
0pziAP4xs1iS8eMho7n65WZfzFGlOikZNpNfbCAqCzQB4jjgYwD+KNZpr8CllB8D
wuCtPYseppNZoAc4eOeohE6q3dAU7AQ=
=5Eju
-----END PGP SIGNATURE-----

--yU57OYvm+3N+PKUP--
