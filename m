Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 532862E62A4;
	Fri, 10 Jul 2026 15:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783696274; cv=none; b=RBtoh9JqoTffIE5W3lgZ6iQNAFewPkpccXeeRihMEFyos6qmh3gSD+imMWlarkSkKteEeeda08U36YTz5uDCztIZl2aKyC1C/wl5SGysLxpGRI/LDs8M8YtKItI3T6AynCi7pmH+w3+F+9vL3RNQFwjvnpNiVbrdnSaSPSYgAlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783696274; c=relaxed/simple;
	bh=N+bo73FsDgYGeRUjJ/0NdTtaHebHYRzVCqW9peXF2KU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lhjIB/9wBKitf4bx0GvW5doDgb1aVQXSi3ut6u1V87qba1ruJbscasS2eowwOVrsa1BgQ9KTPQrsV6pMSAgO3Nh9L6+WJEtzuxSUt6ePmytZypFgzjaihF1gY6uPkK9lAh08WD7SxziKp/fSK7aWpINpSdm3ypJZaR0M7hkv7zY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DQnE0rcD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DQnE0rcD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E77371F000E9;
	Fri, 10 Jul 2026 15:11:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783696272;
	bh=N+bo73FsDgYGeRUjJ/0NdTtaHebHYRzVCqW9peXF2KU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=DQnE0rcDKiBX4PGfTTTLtfYgsIfg95iCzdLHLqGrpDOWPummpQWg/K1OKPhK6rF5m
	 3CVJU7nMXufN5GkbySHqozVddegwSpJQtBfqBFOhj1BNk/apnaLcS8kk3Om7zVYtNF
	 pYbsPtVOZ1jhLUj/H0E63Dr1Rn0jNcQfNSdVtWZDc8cG/2g5r/lNViPXL8K4rSO5Pb
	 ssDP4UtyVo9s1xRzytuOiSOb9Gqj9vm0lrBMINOzBLd2rbFAYdsORR1LxZlFQnjvsr
	 p+WcsJmzmhj5NWXoiDMXMPcUwn0tqHh35o0Czu6X2rOTKwyEYElVYVjQJyjllHHCmB
	 iQbwgJ+KUaXjQ==
Date: Fri, 10 Jul 2026 16:11:07 +0100
From: Conor Dooley <conor@kernel.org>
To: Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, pierluigi.p@variscite.com,
	matthias.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
	Tony Luck <tony.luck@intel.com>,
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: arm: ti: Add bindings for Variscite
 VAR-SOM-AM62
Message-ID: <20260710-rewash-dripping-a2fe778e75ac@spud>
References: <cover.1783687321.git.stefano.r@variscite.com>
 <10775b12b801255546c9cdefdb153e421aedf910.1783687321.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Hva4XXWYreE104rb"
Content-Disposition: inline
In-Reply-To: <10775b12b801255546c9cdefdb153e421aedf910.1783687321.git.stefano.r@variscite.com>

--Hva4XXWYreE104rb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--Hva4XXWYreE104rb
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCalELiwAKCRB4tDGHoIJi
0mi3AP9e7YZotIexjzXQFo+xO4mLAfJgv6LSzjoZE0fCdgVqyQD+Nbe99SRnIk+3
iJOnnR480ww9jQD2dmn/FPMmVvG6qgc=
=vrLM
-----END PGP SIGNATURE-----

--Hva4XXWYreE104rb--
