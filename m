Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8677E3E7BA6;
	Thu, 25 Jun 2026 16:13:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782403994; cv=none; b=ZWgyVyk7LM8JT+SI6+j6ZrsJVCTLXMEsz92MS+rV3y6rg+/7cZv8RgcaW3a0L0arT2puRkF9twhNwgIgvUsDcpg2/H9B9jUdmrmDnd5UNEUL6LXPv64Ks6GT5B/Xx41SD2qGpJ///DpNkz2nwoPeb68LixSjJk3+vH7y0k4bXh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782403994; c=relaxed/simple;
	bh=dLVDjtSGgBwa/acFzmAl3BQ4HgLZlUbIiGZ0Yrc1yWM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JbDMqRsckBqex7cZ83zvj83/9QeoW8x8DXEolonCdrLN6NRiBShUBh3m6ZW2bSl6NgVzHA4I8reqFnIz5hY6nWlHvqApMiQVolWtoiwpAlBUXVJ627mkmJMk2jZBVrExlTJNiV/wBWfLDvZSLYnANLHOE4nd//7SHYP4wU7r+tE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WP1MytgW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WP1MytgW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 091A01F000E9;
	Thu, 25 Jun 2026 16:13:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782403988;
	bh=dLVDjtSGgBwa/acFzmAl3BQ4HgLZlUbIiGZ0Yrc1yWM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=WP1MytgW/IiR2EVMG8BQ1WahjX6htr2rv4eg+mVfvYB+9KXptQpvy6blScZcMTz7A
	 jFRALrsSbMHGDeawJTn83C84vjZNxAKQaYKWxnnEC2n5lOQ870kDUSOsIF5wQPJnyV
	 +4QSs3BS9BKJw1cubJ5lZL0hVaCgVsLhqKr3ZPwiZ7C7fGXh5kbeRY7ME55MmWFWMH
	 P5fgDPi86q4Yu9zE5krQL9vzuXEoaoWkxwaCAg+9pZWl9j5gvzXqSuUOCXoexjfXm/
	 Y337pi0HXoyp16pPmBOddS/ofqu72scJONvKGkA0qmFpso5mfg2UfIsPRl95LOY8Yb
	 XxusdyX43r/1Q==
Date: Thu, 25 Jun 2026 17:13:04 +0100
From: Conor Dooley <conor@kernel.org>
To: cy_huang@richtek.com
Cc: Mark Brown <broonie@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Yoon Dong Min <dm.youn@telechips.com>, edward_kim@richtek.com,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] regulator: dt-bindings: rtq2208: Label mtp-sel-high
 property as deprecated
Message-ID: <20260625-buzz-commute-63cee949fedc@spud>
References: <cover.1782353659.git.cy_huang@richtek.com>
 <d111d67d40cc182a2ab8c6292e4ffff9c7dad9ba.1782353659.git.cy_huang@richtek.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Zi+74F9DJcl8r4X+"
Content-Disposition: inline
In-Reply-To: <d111d67d40cc182a2ab8c6292e4ffff9c7dad9ba.1782353659.git.cy_huang@richtek.com>


--Zi+74F9DJcl8r4X+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--Zi+74F9DJcl8r4X+
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaj1TjwAKCRB4tDGHoIJi
0gxWAQCt7oErqk6HF3XPlLuAjvw8IKW3PscWapyx1pGLjgecfwEApLHCIzYOMLln
v4d/3jhMSEbuRL+11eGsOc5VbOk9WwM=
=mS9m
-----END PGP SIGNATURE-----

--Zi+74F9DJcl8r4X+--
