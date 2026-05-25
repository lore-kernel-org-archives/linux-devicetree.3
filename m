Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3FD53F65EF;
	Mon, 25 May 2026 16:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779727450; cv=none; b=AnlkIt9NxtopeeTL+vanxrNwlbyWLcgn/M8h8ZenkuXANVjIOudKX4P8YSEEtJXAg/MAjzzQkh1V5QZA4+SaJatFp8wAbXcN217Ks9lsrgSVRs0Hz6gtj5EEBdmFPXZ+pI1UFLgbyBSrbsBCq7Con4oiYCl9C5VrzNKhc33h0RU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779727450; c=relaxed/simple;
	bh=tO7fW2LGUXn9/HkiBLsRW5N7PQ8fXp/YzIY+daHOCio=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LsY+KydvgMixwNE/9LyaIRBtYmHUDuIGa0Bk77zrqBhA35VcAJlM1FL2TsAdR/6fijLojIe7a4pCM6JxZoR3GuEDTadnyGPMC6k2OAavUphcihdV+xCjVSZKqM6P4WkXo9ulU2B2XZvpaHBN7QjBGl8ilnPH80CZesln99WL3yQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JlwcdPAo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JlwcdPAo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40A271F000E9;
	Mon, 25 May 2026 16:44:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779727449;
	bh=tO7fW2LGUXn9/HkiBLsRW5N7PQ8fXp/YzIY+daHOCio=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JlwcdPAo5c+7060iBYc52PQFB7bK7SwT1wh3VKcJ3likegWgKvo+PHUYeIjJY9Sz4
	 7ZXgrxrOErpKAKMu8G4SAt+PNVnhepFAoD31kBYkIhuLbijpb6MfTYXjVsOkdF393k
	 r3P0kgj5wWRXE3+HzKkZcBCvUbevP8V4+GGoPuKFWAkyRRacj+k7DSb5GGQurWcrx0
	 OKAEumfZYUMP2lvlGAt6uQxg+m5SLCfojSmhtAbKdQ5DLkZcL18w0iOQgmfxU05jQk
	 AZs0thoY8N8Hgbk+d1+17FdE7+Dl7xrCxI2RZpPV7EgyZCD8MkBoGzZweJrPQp8sn/
	 3p0ZHmVbOokMQ==
Date: Mon, 25 May 2026 17:44:05 +0100
From: Conor Dooley <conor@kernel.org>
To: Patrick Barsanti <patrick.barsanti@amarulasolutions.com>
Cc: devicetree@vger.kernel.org, linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org, heiko@sntech.de, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org,
	linux-amarula@amarulasolutions.com, michael@amarulasolutions.com,
	dario.binacchi@amarulasolutions.com
Subject: Re: [PATCH 2/3] dt-bindings: arm: rockchip: Add Axelera AI Metis
 Compute Board
Message-ID: <20260525-reissue-skating-4c793410f13f@spud>
References: <20260522174918.61523-1-patrick.barsanti@amarulasolutions.com>
 <20260522174918.61523-3-patrick.barsanti@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="d+u3A4lLNjXzR4af"
Content-Disposition: inline
In-Reply-To: <20260522174918.61523-3-patrick.barsanti@amarulasolutions.com>


--d+u3A4lLNjXzR4af
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--d+u3A4lLNjXzR4af
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCahR8VQAKCRB4tDGHoIJi
0pQEAQDVcm6ZnIRuwd7ED+X8Y/Ft/5cLD8RvyVggayLwr0ICOAEAwf8JqLhNhh43
eNsAS4TG5PLpr9x4TfpOW4rTm1SKGQY=
=yipe
-----END PGP SIGNATURE-----

--d+u3A4lLNjXzR4af--
