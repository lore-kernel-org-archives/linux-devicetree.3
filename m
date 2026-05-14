Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2DF038B143
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 18:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778782797; cv=none; b=bz6+toIEWAcg2/NuL5fMGXMxR/km621znsZUudI77v5G4StomjluXNpmi2e6PXMJf99poicidMuI/AgN1nRqa09IJbjgDyBOu75VhcbEoQA/NbmLuK4KClPjgOXZ4mRtEzn5KEpXkMh9jRvY/X554uUaTe5RvgHgsDfm/7zww9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778782797; c=relaxed/simple;
	bh=gTjiv2/TKYKg8TdJlS1e8VNcO9aFXlqH7uu9TXo9p7I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hPkda4W4YKG2F5c5Z6Sjzrg3T0jkDkugRBnvYASEVlqeKng3Ikdq1iYZSx77bI5/PruYAamOEJf6Tyj0CTWZ+6sTPtFEPgU5Zsh6GtHYeml7QjhKrabGi7HF6Dz0hsYj+ElKpz/oO4NiXk1CGUJClRy6IO1LKHOz+HXQtHJSpmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rRXrZDVx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rRXrZDVx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF4CEC2BCB3;
	Thu, 14 May 2026 18:19:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778782796;
	bh=gTjiv2/TKYKg8TdJlS1e8VNcO9aFXlqH7uu9TXo9p7I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rRXrZDVx7GTdXCnIwrHfDFQA0dGr35iuWoB4FubCL5S0/SggcV3ELk6ElUR9Bc7Xr
	 E9RlVLcF+sOuexxBssBK4IQcHoUpAXH5ZdNXZg+V9yPdRT16uPEin1MmUBzJj3EbjR
	 qS6dD++lzzSbVFhEkG2nioBmBS4WC8mOW2j2irA9Cp2m6ry5OkGgcDBhH23JU9LgEa
	 4V1C+ZqUZfxF858MrOZpCDuP3S9Iw2VisXNJ630nq+OV5288iS5K1bAnX+5W/HBxGy
	 dG8OXo8duFyfWRP/DzZKY6LHGoqUnv3oIL1MIYg5fTwJSAXRTbYYHfZxXwQytYuwHd
	 ZvsKB7cT12m4g==
Date: Thu, 14 May 2026 19:19:52 +0100
From: Conor Dooley <conor@kernel.org>
To: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
Cc: joel@jms.id.au, andrew@codeconstruct.com.au, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
	linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: aspeed: Add ASRock Rack B650D4U
Message-ID: <20260514-spiffy-freezable-e8c6d9042d57@spud>
References: <20260514031622.1416922-1-prasanth.padarthi10@gmail.com>
 <20260514031622.1416922-2-prasanth.padarthi10@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="URRyEgb7TO15cZW/"
Content-Disposition: inline
In-Reply-To: <20260514031622.1416922-2-prasanth.padarthi10@gmail.com>


--URRyEgb7TO15cZW/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--URRyEgb7TO15cZW/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCagYSSAAKCRB4tDGHoIJi
0pscAQCKHketvGg954MMHYLTbNRveDFA9z87ehYbOYNaP/sQhAEAwtGdaTIOTrWP
3HYqEymg57NUGfTRu+sS10wbhb6qYAE=
=8NEg
-----END PGP SIGNATURE-----

--URRyEgb7TO15cZW/--
