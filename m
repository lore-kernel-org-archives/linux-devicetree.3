Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D65D3D5256;
	Mon,  4 May 2026 12:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777899034; cv=none; b=HegpwzHK8AaNKwgl33XgByxkrwg5GqWwgI8f4KB4sxrpZ6vpwgyHgMDcNc1ac5spiPoBrSTcNgUJm4fXOYfB1qQpnGI6h8rnZTGL/+SkEr3KLiRVhIQgUGKC36aTmCfOaEK/F+QUbAvzfPk+ILbVrZy76OgsONeloQVToeRNNLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777899034; c=relaxed/simple;
	bh=gsJKrPB0+qOMXfXkEQ4x5BG8QKYpKvbp0hmbuZ3i94c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HtaxEJdhCfAu/HVomcQrAm7i2YsOZoh+3/IFbmTSgSE60S4TVLi2eX/g814F/wDGryAuZqbC9QTneDxvcU14vHLobrCAlrVVhm+6u4+JeeLXQxd8umHdk7DpeLElaNyMrezq1ErWJt8D2yomLLw9klIdbeMu8InKwDxn0FY9ESc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y6lCQumQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y6lCQumQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AD5AC2BCB8;
	Mon,  4 May 2026 12:50:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777899034;
	bh=gsJKrPB0+qOMXfXkEQ4x5BG8QKYpKvbp0hmbuZ3i94c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Y6lCQumQV28A30Ja5Snu30wBbSIuklbA8RW5W3awazS24uLJXl1LDCule6JjpOBGS
	 7yHxKo2rvCaKA+h0jEPAw7TljN9udS00HB0sOOSe4byqWPcxqdDw5r4kUFOYZ+iJvv
	 jB1KcqMM4rcfgZYGAeOM7Su/SBv4xrgmMxodkbWwRKqTcbmFhZgF85z2e5SSinic27
	 dn/4Ykcerc2wNKAjY7Dnc0PDJJGsYkKngZsRPnzbrRZ3jEw6ZbMGLuBCPrjFxtrKfj
	 LBqYMOJ4mJ/Kn3yWT9r2cMJJO/+L0vAOdgnku4mpSTfMYCghgo082SmOwBvK7kefWo
	 qL9j9+xmx0gOg==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 8BBD61AC5867; Mon, 04 May 2026 13:50:30 +0100 (BST)
Date: Mon, 4 May 2026 21:50:30 +0900
From: Mark Brown <broonie@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, KancyJoe <kancy2333@outlook.com>
Subject: Re: [PATCH v2 2/2] regulator: add SGM3804 Dual Output driver
Message-ID: <afiWFuSDOz5XrZp9@sirena.co.uk>
References: <20260430-topic-sm8650-ayaneo-pocket-s2-sgm3804-v2-0-76108c65a560@linaro.org>
 <20260430-topic-sm8650-ayaneo-pocket-s2-sgm3804-v2-2-76108c65a560@linaro.org>
 <afMwIVRDxl11Ty_P@sirena.co.uk>
 <150cdb85-d0ac-4802-a09b-9dab1b9b805a@linaro.org>
 <afPp8DXSLQIkQNaK@sirena.co.uk>
 <2dca0303-b296-4abd-a716-89e08e71a915@linaro.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/Xz/a2qk3e/tAAVf"
Content-Disposition: inline
In-Reply-To: <2dca0303-b296-4abd-a716-89e08e71a915@linaro.org>
X-Cookie: Alex Haley was adopted!


--/Xz/a2qk3e/tAAVf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, May 04, 2026 at 08:55:45AM +0200, Neil Armstrong wrote:

> Do you want me to also switch _all_ comments to C++ style ?

No, just this one block that mixes the same style in one comment block.

--/Xz/a2qk3e/tAAVf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmn4lhUACgkQJNaLcl1U
h9AH8Af/QrAHVG/cMk0KYzuW6jWCyUB6SXrGp5qfg6vjjsBuYcRSs4SilJf8Bl7V
8dVRor29VtStyAItkDqbiJuV3OjoIxFuxZb5NMDYhjMbsHg4ZUh4Keta3ELezwLu
KkdZEXol68AuZ1uBoqlI+ICfNHV1bizQi9SbLywUKP2J0X7c76Ok5/p9pZsqqE/Q
P1cPl4qAB3uDqdiEvboqPSTQAo+NVaBEEGbksG4TPmaUwTrVRDbT8wCynQoJHBTt
82YRAYcFdz45bQ27no0RzVUCuLKm4MYyjGmnRyJ+k8E1YvwHTv6IRNZqs4vvQvxw
taEqxWKskgxCtNA5NsVJK/CnCA00Mg==
=cK7D
-----END PGP SIGNATURE-----

--/Xz/a2qk3e/tAAVf--
