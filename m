Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDFF831AA8F;
	Wed, 24 Jun 2026 16:36:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782318996; cv=none; b=DCprzAbAVtmg/Zm8eBj36Lqx5QMslG3Sw2ANn2/hK9chdMQYuTcxjOthyKPZJtLG897DBzFvJ0YF4dlR8ClX6DvWoENV19BvYoSvp7L9UfJSTfBW//vM7a7dIHYECAqL9bZmybpxJxS6GA9I4blsQtba0h/WRjIFekAqgWls1WI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782318996; c=relaxed/simple;
	bh=4qj0AmUnwcDMOIIQ9Wf/AoscdN84qRBVganyN4YGf3I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HeqHE232WbLmEi4NVjWyIFBsfhITVyKorRyNa2D6jH5JG4wGzpqilZn0xLpixbAcJyZUw+m1zqDkAJ/whMsYG4zp74ntdNZxYMp5Y7YFEdUJ/vFlkMsxG27w/DsmqxcKZNbuEC9tJE44u9c77EuAGaxgQPoPXjiUG6mZvUEIINo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BqIhwCwM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BqIhwCwM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C5311F00A3A;
	Wed, 24 Jun 2026 16:36:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782318993;
	bh=4qj0AmUnwcDMOIIQ9Wf/AoscdN84qRBVganyN4YGf3I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BqIhwCwMkO7RhB+snlRAdSwJzSPtFtyp5yyRt97HyMthHMwXf0pY08+btM5Wbqm7y
	 QFsHsUpvd2a1LT7/0Tn8+ITuPYio+EmiDejRME/QhXPiKws9b/OqJ/uf5BAFg4XIy4
	 pxQlnvx3S0yDq8JY3lHXYX1bdrYuIFRIu3ier0H0E60fnTMrCa+XP1dNy3on5F5mF9
	 lq4WupW4yraAcekoKnCVULQzfh3XnSnhR2VkwSqqq9s3V3wN0hd84pZYv6Eo+x8Rz8
	 o35ZwHoViZ9hkk4lB794Su3LVUkDaFa5OZms+iroPXj3k/R900Bs+Xdxha84JnVEzU
	 Q58Gsn4/WAZxQ==
Date: Wed, 24 Jun 2026 17:36:30 +0100
From: Conor Dooley <conor@kernel.org>
To: Swark Yang <syang@axiado.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Harshit Shah <hshah@axiado.com>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: arm: axiado: add AX3005 EVK
Message-ID: <20260624-dweeb-surging-e4d9a09b763d@spud>
References: <20260624-upstream-axiado-ax3005-upstream-v1-0-c05bd0bc9124@axiado.com>
 <20260624-upstream-axiado-ax3005-upstream-v1-1-c05bd0bc9124@axiado.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="XPet7htPfyKjHq6e"
Content-Disposition: inline
In-Reply-To: <20260624-upstream-axiado-ax3005-upstream-v1-1-c05bd0bc9124@axiado.com>


--XPet7htPfyKjHq6e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--XPet7htPfyKjHq6e
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCajwHjgAKCRB4tDGHoIJi
0p9bAQCQQESqfdT8st6eXeByVrp1SEgUqGhBTc5t+/SVXNk/PQEAhiI3rvPuEr29
/Xr6hJ7m23s10O3QuVZsgLVISCJjiw8=
=OioU
-----END PGP SIGNATURE-----

--XPet7htPfyKjHq6e--
