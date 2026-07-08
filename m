Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F57126B0A9;
	Wed,  8 Jul 2026 17:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783531423; cv=none; b=aqpd1ghBYyEEw0vE13uZIF0EeF9B2G9Nt/v6JHZH0qhHYOlbUnMNyyp/zpZi4JwjgnlVioV1MDD4pB7DbPcTJYrdKaJDxYwR7lZyXITK8F8xwZ/ur5qLYFbIIjQ0XrWrjFIX/jFyMqrYk8ToP6hjqEp0GXa3UwtXcT9MH702+cE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783531423; c=relaxed/simple;
	bh=bBgNLGVNsB1fJsFCTqLzYxXYGVGN3oHzTVfLH7qOKDM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FR6lRr8bakcQp2knGgoYwsxbrDfsRHPZ0msDS1MlikPsqtzcbBlEwXjEdpvGbhMNweWw3p8MTNFIuJiFSHDKy24M3cXdX/PtKbWjKkxVm1OJxxx1RCV7VGnZIocwJlTP2IkYvLOiAfxbCX7LwUzx6CL/+qz56tuJ0PJTcPQMo2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SEjhNR9J; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SEjhNR9J"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91DD91F000E9;
	Wed,  8 Jul 2026 17:23:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783531422;
	bh=+PrrRsYnh8HgeKwD8LeMPX+IopNgbVL9Xpwx9+ev7nQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=SEjhNR9J5TDpWhC9LGqqEpcORxWeRVOS4nrtq9fubYSZCb9ypg2k8jTxtzqewRCqF
	 UrB9umMF7wyvOmMzHcHI9+5Nzo4OCh5KmUXnlBldBCqueU5iECf/6+IWyMnOPu3v3x
	 v6O2ORiuClSCH/0YjLpSXg2ZeCIv09cCqUMXu0ciFYgyJV/fjsoNDQEyGor1N22HiZ
	 44WZYsoI3EoyrAUCckCCyVS0kLixLaW2+tDV1lHYwyhQeHHxjs8kRBsYLfwZ1S91Y8
	 ThkwKG2pO82UGSGtZXamLMmXxxG/LpTG4kFgdXfAn87yllUmfZErKn0DlpfrirqTUD
	 uvXSKhtZD8qlA==
Date: Wed, 8 Jul 2026 18:23:37 +0100
From: Mark Brown <broonie@kernel.org>
To: Robert Marko <robert.marko@sartura.hr>
Cc: conor@kernel.org, nicolas.ferre@microchip.com, claudiu.beznea@tuxon.dev,
	robh@kernel.org, krzk+dt@kernel.org, alexandre.belloni@bootlin.com,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, daniel.machon@microchip.com,
	luka.perkov@sartura.hr
Subject: Re: [PATCH 1/4] spi: atmel-quadspi: add controller init callback
Message-ID: <550f7779-8188-45db-8de3-c25eda948cbb@sirena.org.uk>
References: <20260708165201.624271-1-robert.marko@sartura.hr>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6TE0aoWDj9Btiv3j"
Content-Disposition: inline
In-Reply-To: <20260708165201.624271-1-robert.marko@sartura.hr>
X-Cookie: The other line moves faster.


--6TE0aoWDj9Btiv3j
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jul 08, 2026 at 06:51:08PM +0200, Robert Marko wrote:
> Allow controller variants to provide a custom initialization callback
> through their capability data.

This doesn't apply against current code (specifically the DT patch).

As mentioned in submitting-patches.rst when submitting a patch series
you should supply a cover letter for that patch series which describes
the overall content of the series.  This helps people understand what
they are looking at and how things fit together.

--6TE0aoWDj9Btiv3j
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpOh5gACgkQJNaLcl1U
h9Dk8gf/ZWiafVMit4ybyk/QcKkGlLhMiMcvBEq9FzlhkcJu5qqJpsM70pjK6CX/
SlOTKs+luGUtZWRU8T0r2vjmQAghwTKWWo4iyvgSdGPYru8m+agD6/7CEi5BXLez
QZ3VBNcvSSBEJZuLtN9HLLDn95JR05wXBatohjN1cJIgodkeV4IRq8dtoqb6FUe8
OC3mPNq1Yohsip/UUixj1LeRWgBxoxi/F1gJgi0ss5C3w9bwbYvWNqob9YRumcK9
CCjEbYDYc5MSNnETmKtB5E5Vpe1K+1cYUGuvvE7k9BETM/kX5lkykPBqjGP6IBc4
Ly+sgd7CsD/vZXZvsuNkNsyE4hphog==
=EpTC
-----END PGP SIGNATURE-----

--6TE0aoWDj9Btiv3j--
