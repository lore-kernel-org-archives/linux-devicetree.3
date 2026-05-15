Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F457380FDD;
	Fri, 15 May 2026 17:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778864805; cv=none; b=C/LZJC5QENmn58nlHNx2w+DN4m5iZUbtE7cw6oPVQm5Q2ixMF+9prf2VldAZZegRI/zhMIH7fDw8619UGjWHPQMPp0yVwKdB9WaVBN/Xmn9XIhwF+dRPEm8lbBXSIdKs7vQX+TK13RfQVVVElRSC7JoDClisne22rYllNJYQqFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778864805; c=relaxed/simple;
	bh=zWQRUJIKT1aqb07o+/hFUP5/KdANfhYWpKOZj1o+kdQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K6gAf65KkNOSZP/tMXhK7f+kmva5yAHo35RXia/nkrEgUeO4acNkkhSYWwZAfytkCHeP+nooR6Y7Qh2tHcgnUtbg2MOxBlZN+GhPDjHbRPDfCfr6OtDMCMOrOun75OkFQWkJoOUdk+DBSVbeOg5nTaxpEATrb1h7wNPsd9nqBuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DLcoQXa7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DLcoQXa7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5D82C2BCB0;
	Fri, 15 May 2026 17:06:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778864805;
	bh=zWQRUJIKT1aqb07o+/hFUP5/KdANfhYWpKOZj1o+kdQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DLcoQXa7UjTxlCKYyflekX2QmxiH2GncNr7gtg4i3zgPzOaWwlOIg1Bz1lwb5pFeO
	 o7H8XUtl+vC8+65PmYMoBiJgeBUEPlYvWp5aq+6HHuLZbPCE6MJIo1ulfFBsigSFQ7
	 xdZ7WsAv2/WZMRQ7QBXPDUvgeDcz3jskKTPvV4U6ktopODnkj6fjEfeK7V2mrOVyiH
	 mrSiz16borQn6HA16zQV9XZf2ne0M3k/YxDe8vHu2mX4muxwk77E8Mq2YdTxi+Xrhf
	 DzdrWiYyXJjcaA7fVdiz+CYpHIvHDH1X2/NE/hRhT/qjag8ocL8WUxB1TtU9sHdpA0
	 /0YGnXZ3Z3fxA==
Date: Fri, 15 May 2026 18:06:40 +0100
From: Conor Dooley <conor@kernel.org>
To: Judith Mendez <jm@ti.com>
Cc: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Andrew Davis <afd@ti.com>,
	Bryan Brattlof <bb@ti.com>, Jason Kridner <jkridner@gmail.com>,
	Robert Nelson <robertcnelson@gmail.com>
Subject: Re: [PATCH v4 1/3] dt-bindings: arm: ti: Add am62l3-beaglebadge
Message-ID: <20260515-sullen-sleeve-bc9ddd269c57@spud>
References: <20260515153541.294698-1-jm@ti.com>
 <20260515153541.294698-2-jm@ti.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rRpJUo2i1i6la6sp"
Content-Disposition: inline
In-Reply-To: <20260515153541.294698-2-jm@ti.com>


--rRpJUo2i1i6la6sp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--rRpJUo2i1i6la6sp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCagdSoAAKCRB4tDGHoIJi
0nGrAQCAO3Ahol1n4Drt92tLo3bQvP7AxyobptY2zybG2HijFQEA5HBW4d2rAW/d
8Svm3p4NOpn+a/IbymID83PeVxrwCwU=
=VuMw
-----END PGP SIGNATURE-----

--rRpJUo2i1i6la6sp--
