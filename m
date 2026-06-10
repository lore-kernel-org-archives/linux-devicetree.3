Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D72C332EAC;
	Wed, 10 Jun 2026 16:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781109212; cv=none; b=Kqmqexi4mhF7E754gh5ixx/aK67TE58i3F6N1xTJ2OvjPhOcGj2OT2AUfP98ZXSdwFqWu9hZwKTiqj4UuOZ8UO7hBrExcls1xo4R9zMcJN0eYXzZrtWhd6ZawxazzAqk3l2+flPB0qet8alLX8xuquaUm/LZtPXsSn4nuVSsb68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781109212; c=relaxed/simple;
	bh=qws8KeUV0f7eJ74CsFNYE5x8D+8Iurc9zlmEqbIBTIA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b/2xlOWW08z1EShwqTj+jBpvfSFvGLbOocooeTMo9smCBOBx4dzk6oJhUQ5My96BDoaEBx3+skhsdpUuwtDgkaBmdWgCu0b/E9geFk9SFHTCexdpH1DNRrwByUkuD7BluSvnV0iXf/RNb6uP5OXOOwKWKkK8QuNggsCN2qz/cbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VEI0W6wN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VEI0W6wN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDFA61F00893;
	Wed, 10 Jun 2026 16:33:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781109211;
	bh=qws8KeUV0f7eJ74CsFNYE5x8D+8Iurc9zlmEqbIBTIA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VEI0W6wN+zP2GlruuGOlP/StJUzT+xnRHu6ml3a5d6O5TILmGS05gnLL61kVXE/Eu
	 ANRUjZf/z1bCvX43kxc0eBDyJbe3tEGtXLFptSmMEc5AuctYKtf7Mlphqw+5NF5Grg
	 x9aFISqVu7FDmG0+BB2GWD2IM7rerZEhZdHzC3e3ObAAXYQHUL8t5adRTOiBcw0QTA
	 g4viCYJtdTyka6JtakdcyXXTpLxg27tVaPq1jHfNWesgKO+dI1wK//Spe8iJfQEfV7
	 mIcEsk1zdZX+ED+5BMldITShkyCFPkwN1EhHm/QeYzqlNMKusjJphc/djePvCR2ENr
	 aWieECpKi5aAw==
Date: Wed, 10 Jun 2026 17:33:25 +0100
From: Conor Dooley <conor@kernel.org>
To: Daniele Briguglio <hello@superkali.me>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 2/3] dt-bindings: arm: rockchip: Add Youyeetoo YY3588
Message-ID: <20260610-synergy-stipend-f53ec049246b@spud>
References: <20260610-yy3588-board-v1-0-4bb7176b6826@superkali.me>
 <20260610-yy3588-board-v1-2-4bb7176b6826@superkali.me>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wnsuCdlmRqXDLuMf"
Content-Disposition: inline
In-Reply-To: <20260610-yy3588-board-v1-2-4bb7176b6826@superkali.me>


--wnsuCdlmRqXDLuMf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--wnsuCdlmRqXDLuMf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaimR1QAKCRB4tDGHoIJi
0ofeAP99O0OxPFOWRn3QkTaBKHnpHFy/Nnpamnd3keTsXrrFngEAnmavcg8SYfTB
+pmd6v7amXOOjN2mSoi7mLd6wzjWzgc=
=pgbH
-----END PGP SIGNATURE-----

--wnsuCdlmRqXDLuMf--
