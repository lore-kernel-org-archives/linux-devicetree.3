Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 581123E3D9F;
	Thu, 25 Jun 2026 16:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782404573; cv=none; b=l+VxYbpIRhkyAwSbbGHABk6lFhjk4IoxFMlnKjj9XcJLy2Sh+nrbTWXUhCX9u9EETK/eukgCWHSxfKshzTHMZFguB+rBQBaZM1vYq5oSPwIyYYNmykaF6ryjGpk88K+fCXoI5XKEiPjUEkKCysRjqplOpvI0fBga+Qkoe7Cz0n0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782404573; c=relaxed/simple;
	bh=LGgFtg9jVS4GhMzavMNyBt9FDJxaR40jKV4yOVGIV/g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R5RtKOjjJxzma54S9k5Y232PSNmIg8TsapyY0cG1AiiHfcPhpCSz6q8Z9E/ULrMlPhqM2TYeM2orJgNYujQVIwNvW6s0Y+JH4hNgiVtJ27IOTs076d9tbXczLeuhDiHCy9FELxF8GIf2O+IT4y/gkiJzp2vyyFqzLu3WLJzdkyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nXnV4RWV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nXnV4RWV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 217B41F000E9;
	Thu, 25 Jun 2026 16:22:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782404572;
	bh=LGgFtg9jVS4GhMzavMNyBt9FDJxaR40jKV4yOVGIV/g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nXnV4RWVzF6XZ5HHLjv9UMTwfl/DCoRbm2IWVcLkdXsym2EePqYLW3OnoKIIirsQp
	 PL9mhC1W9rWCWpFCEceq5K4K9OH4EDH3N2DpPO4RhLEyQwGss9CVa7GrgNyJSSWedZ
	 Vi6M8Aal7SMHDKdPrAQD0eAaQ+4nY6kqpwHA1KLXymPIuBjVefwDPXj8ZoKaNzMGWC
	 3qFPCc4ukr8ZgpU06ATN36RaFbX13bQRehkxKLfBGkztjhzz76VoDkxu1y7ih31osl
	 uSUb8k312vLSnvNqhDH2bhgL76Vo1qF8IbppgWnhEzA3IZEk9/ZelzbwEoW2a8pKuz
	 kvKeamNFn8rOA==
Date: Thu, 25 Jun 2026 17:22:48 +0100
From: Conor Dooley <conor@kernel.org>
To: Nathan Morrisson <nmorrisson@phytec.com>
Cc: nm@ti.com, vigneshr@ti.com, kristo@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, upstream@lists.phytec.de
Subject: Re: [PATCH 1/2] dt-bindings: arm: ti: Add bindings for PHYTEC AM67x
 based hardware
Message-ID: <20260625-pliable-dose-38419101d654@spud>
References: <20260625160214.4001298-1-nmorrisson@phytec.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/ssOFjh6MDidAPni"
Content-Disposition: inline
In-Reply-To: <20260625160214.4001298-1-nmorrisson@phytec.com>


--/ssOFjh6MDidAPni
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--/ssOFjh6MDidAPni
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaj1V2AAKCRB4tDGHoIJi
0nq3AQCwiV+35/MQQs4CaxZUUDygIeQm11HT36LX1TAy3FQdfwEA8/Ow7EUXLXg7
6AudMx/BQBTw/DifXISY2cDThpX0EQI=
=2GgM
-----END PGP SIGNATURE-----

--/ssOFjh6MDidAPni--
