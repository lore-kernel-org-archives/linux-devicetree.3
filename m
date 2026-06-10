Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 846B03438AE;
	Wed, 10 Jun 2026 16:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781109830; cv=none; b=gzQF12QgdHYVTnClBNUL65ynnz/cOfY+0+AzQbjqhdgW4MVuh269YspVm/a82/h+7QHQKukyasnnN1KXp2OOa/3f44NonK65O8KSdsYiBrb+hAsgeahI/ioS6fHxVwGNVn1OQfM+Fmg2hG3H4n2se6UgzQOA0oEK0deKuDd8WGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781109830; c=relaxed/simple;
	bh=tn6N6xN8kwOSamzqhUSen4F7Pt/+IGDXXkpj3JNNU7s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o4feLmtuXvMrjE4YTQdr8amW//lTc+omGBFMAMr07n6pcbfHFlG+8e95GgIfAgX5Wb0C3fC7BETzTwOTu1Lf70tz0Uuo2P0OFNpcUhmUdbBkIlitD+iAq3JN4HZnWwmEaOiLHuXO2WFL/i5TPgiTPsUVRbbaVLm/jdj1xqIVxDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ik0bcyBp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ik0bcyBp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 965951F00898;
	Wed, 10 Jun 2026 16:43:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781109829;
	bh=tn6N6xN8kwOSamzqhUSen4F7Pt/+IGDXXkpj3JNNU7s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Ik0bcyBpjYO9UzSh7tDhhz4MK2FKmlJvsXOXxfJ9mCV9xnAcknSErdeQdKAHew7Ch
	 1cg7/1miK0DzFW3JttxeQJKAZAki8ekzy9bhksLH0UCFMMA9MaN2Rv+bFV3EPbWIdD
	 Hf1RNCYD2pTzM1MfK02oY/78sFKH7MknvgvdOwvaZaACjHuyizUfCKP44I40++rXFc
	 0/TdfLujYjdoOtct8dALQyFp79bJ0TWikrjfSpvdUiVRpSrY1ffI70+5YS19VgrlJA
	 evA781Wu4q1VeG5D6bF8pST3Ci8KLXsZmel9SBYQXIS8f5sXhlItq6HGJVJg1NUuJq
	 PwwaH8CVB4bWA==
Date: Wed, 10 Jun 2026 17:43:44 +0100
From: Conor Dooley <conor@kernel.org>
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: rockchip: Add HINLINK H28K
Message-ID: <20260610-rectal-subtype-77250f6bc6ff@spud>
References: <20260610100006.366963-1-amadeus@jmu.edu.cn>
 <20260610100006.366963-2-amadeus@jmu.edu.cn>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="R5PhvYFlf8xOfZ6z"
Content-Disposition: inline
In-Reply-To: <20260610100006.366963-2-amadeus@jmu.edu.cn>


--R5PhvYFlf8xOfZ6z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--R5PhvYFlf8xOfZ6z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaimUQAAKCRB4tDGHoIJi
0gyrAQCcJYH3VNNAIDsVLNfzgLdpTHWpQjB7Lf9MyhpkDl2BwAD/TTnRs1Pj9qhH
ThozJYZ5aQXDt/FQIikiHL0DbSk//gk=
=i2Si
-----END PGP SIGNATURE-----

--R5PhvYFlf8xOfZ6z--
