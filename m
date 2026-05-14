Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ECA233689B
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 18:09:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778782181; cv=none; b=B2MC8YwIeOR5sbnG0H6Y4ebEt/XJEAYUyTUiaqKxVAiznNyk2hI1etwi7vz5tK+Qk79XPJJS0KR1rn5eagiy2BJTPp51va0BlE5tgw30epuYDZFgeR39SHC88rVB9ULyeSAccf1CqXgLPQyNI7qJa8Sj3nyElswolVUvKPYaO68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778782181; c=relaxed/simple;
	bh=qIeoSKyADr4Wu0dNxCKwUj5mO/2tRBSB8gSM4qMI6+A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=USwPqmJbPQqKcXCc2KwAm2OJtB+tP3OvooLnY2DsvU9mI4aUEs1f4/KWAKs/6k8JN6V3H8GrAbm9FG7SwyKVD6HDWYFhfHr+2oImGKsO7X3+6gEylMCoWCBqnI5rEmNcTqKOQBkX2bxqZR3VBteFsuKbEXJNLvz6eUwbvIHhrrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YFQubSlR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YFQubSlR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0692BC2BCB3;
	Thu, 14 May 2026 18:09:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778782181;
	bh=qIeoSKyADr4Wu0dNxCKwUj5mO/2tRBSB8gSM4qMI6+A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YFQubSlRM5X6zEXMEWCbNbJimRnRT7sqJbJ35k0XGtz8zEmn9XaadtOdDiKlcvn68
	 HJhWWx/uTMPz6ztbtfoLDoAWvKqA1sXr1DqogHUO7cLsTI4uWWyeOwJMsBc121zWc2
	 +vxV3fyQJEr3VvIRC568lySaLq/fyUwZc6IrgpGaFODyHfoJMiDG5B64uom7dGwR3+
	 aTYuujDOHOFR3HodV3GS1IZdXdFa31MgU8t71suCrN0QRD1w31UqcwQVxTYnyq/lMF
	 btbAwwT7Og8EWPPLgjyINlHHNeXzdpp4IpY/hZi89QFZ3qKJDz6nGuKXPI3ovgDQaU
	 V+WTDCn9vhHvA==
Date: Thu, 14 May 2026 19:09:36 +0100
From: Conor Dooley <conor@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Felix Fietkau <nbd@nbd.name>,
	John Crispin <john@phrozen.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2 1/2] dt-bindings: arm64: dts: airoha: Add an7583 entry
Message-ID: <20260514-throbbing-doorframe-25c289ab0b71@spud>
References: <20260513-airoha-7583-v2-0-ee0d82b37ce7@kernel.org>
 <20260513-airoha-7583-v2-1-ee0d82b37ce7@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="OsViCA6T3TKoo08k"
Content-Disposition: inline
In-Reply-To: <20260513-airoha-7583-v2-1-ee0d82b37ce7@kernel.org>


--OsViCA6T3TKoo08k
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--OsViCA6T3TKoo08k
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCagYP4AAKCRB4tDGHoIJi
0otaAP9ciIZ3isHJRWPYjZZYBPnIzFu2RLtFlNV+1P/ZjFFC6QD/fZs0VecbfXkP
6XvIhQzrBcqPD5u1MNqPO5JSqKNoqwU=
=y/u2
-----END PGP SIGNATURE-----

--OsViCA6T3TKoo08k--
