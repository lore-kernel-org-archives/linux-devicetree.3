Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D0DB3B71CC;
	Fri, 26 Jun 2026 15:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782488088; cv=none; b=DVK9XPI2pWFvORHRe1O6A3UG6ozhahcYS+Q/1VzKAJjq0jjpdxvU2nulw+sGOSjKg5og+71d3rTGJWwKym57bzRxaQlqE4FQt6NHUAReTp8E5i7mGeVAjoV9c8JGDnzNheuP5N//P3vHqK9gJph4Bf8bphnjCqRrLG7FhtpAWs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782488088; c=relaxed/simple;
	bh=4raHx6k80d9t62uDEOhrRCyJH4QyHo1rHRJ5kcCorvE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V5eGTTB1pMlKAoPAMwv4xCFd9WI/mvUhFRGqer8/kvlC5cDW8+Gqm1ll4JY9e3YVysCL8RVDvNuitCDQqgIzGQVIc+cBK8iMVGMrEvkzWwXKW4xrcDoAI3NVqOjG8o7u3ak7UKGhI3LWX6h+bNknD0wtw9DMgDf8Hka+AdK0das=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JHfyli1n; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JHfyli1n"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF8E71F000E9;
	Fri, 26 Jun 2026 15:34:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782488086;
	bh=4raHx6k80d9t62uDEOhrRCyJH4QyHo1rHRJ5kcCorvE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JHfyli1nhTiFFZFS3IiUukQdztwkbdyp+HJkPf5kYWilHCjz0X/6UY0aeY7rbblUn
	 F9hNj4grEhqZ/vndrjbKIju0wMUsb4ZIwFj7mpdmAjwEAB0ZlA1fxvqSQ9y+3UcPL9
	 plAQg2c5a36xB7My3M1AKEdILFpB1i3JskJxXve6k2uExcbmll3viwJ29W1w1uZvsz
	 qJWOPyF4DDhyFzKhQU9ZB0LOArv69AOkoGKkhX57EOsgLoEfGeJ+VpEwj5suy7CFkq
	 +KdPKvhbjia/fCRcdV7tl+KnYQNzUjMk61pTcrLPy8OaCFLTGwON0P6IVMJdeLNfeS
	 Ruz4r6p3pQG5g==
Date: Fri, 26 Jun 2026 16:34:43 +0100
From: Conor Dooley <conor@kernel.org>
To: Matt Coster <matt.coster@imgtec.com>
Cc: imagination@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	Alessio Belle <alessio.belle@imgtec.com>,
	Luigi Santivetti <luigi.santivetti@imgtec.com>,
	Frank Binns <frank.binns@imgtec.com>,
	Brajesh Gupta <brajesh.gupta@imgtec.com>,
	Alexandru Dadu <alexandru.dadu@imgtec.com>,
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 3/3] dt-bindings: gpu: img,powervr-*: Add maintainer
 entries
Message-ID: <20260626-reprimand-skinny-89ccde1df769@spud>
References: <20260626-maintainer-updates-v2-0-e1b3f246c44c@imgtec.com>
 <20260626-maintainer-updates-v2-3-e1b3f246c44c@imgtec.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kKRn2xEvYAQ2l8+M"
Content-Disposition: inline
In-Reply-To: <20260626-maintainer-updates-v2-3-e1b3f246c44c@imgtec.com>


--kKRn2xEvYAQ2l8+M
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

=02

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--kKRn2xEvYAQ2l8+M
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaj6cEgAKCRB4tDGHoIJi
0sOEAQCbVD9tmnP5JwHMkNN7V4GKLSyTJ34yY0KjkCoyG6oW9gD9GFvmn+/jYnUx
2s3jq/2yWmaoNEJJ3CjzliJu89pp/AY=
=VR4C
-----END PGP SIGNATURE-----

--kKRn2xEvYAQ2l8+M--
