Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 672262F2910;
	Mon, 29 Jun 2026 18:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782756919; cv=none; b=ct9V0N359HD2XwrkPBc/sMYvyiW1JFAfEN249EoisHsABue08qGSmwd6QDXLTMOxQgEhYdIHwkKfUv+Uf9E1734VVe3YsZUb7A0dDE982mm6Pio13w63ZvlQevucXz1Y/e2Hdn39Cm2sFDIBEAVPJMhiMiK2aL9PJT0Lln7UXiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782756919; c=relaxed/simple;
	bh=rPgJrpsKY/gq2QrGnJvSHgDpNq3RIsDhciRasX2nBQM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E1+Ammvf8dIiTY3ht4sxupu3rVy5NXetmCzxFp7Tr84GGJGvfhHq7Qy87PTQZ1pHkck/u4I7KpOC3tXHxxZcTWgHDrHMoUjJmVJUm9o8BdB5G1wi4FP9pQysuP86ZwLO53ILYzpPt16dVDpcFk+5CzEkKwbOqNpZnED9Uc9XwcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O76wn73i; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O76wn73i"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C7101F000E9;
	Mon, 29 Jun 2026 18:15:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782756918;
	bh=rPgJrpsKY/gq2QrGnJvSHgDpNq3RIsDhciRasX2nBQM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=O76wn73iHRoPaysrwnuzNDqa+PPiPbMT13et1MWiwdGApXzuWHlz71cXbejeEIGeP
	 AGp0xpsirWjL/yYAbPCsZYO5DkryUbB+gFHAso7yYZObHE6ChAxC4H/bc4xA9SP73x
	 78/fFUsHlZZoxgYaU/y/cMDVht9KhhZY+7i+ZmsO3SINX0dmmAHRUQJRiPxxDITgAD
	 dqlBkuJgnqvFXmdSDdQjOtUM7Cp/hen+taEg3JoMs0NKtOB+9Ip9rWaYqct5GW6uqk
	 4B1VQAHsU68yYYf7yRBvhAYcRnOv2wiAJN+x2dYHsbh2W2NsKgyBm5C1aHNefZkveH
	 UGpGg8U2meGOw==
Date: Mon, 29 Jun 2026 19:15:13 +0100
From: Mark Brown <broonie@kernel.org>
To: Otto =?iso-8859-1?Q?Pfl=FCger?= <otto.pflueger@abscue.de>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>, Lee Jones <lee@kernel.org>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Zhongfa Wang <zhongfa.wang@unisoc.com>
Subject: Re: [PATCH v6 0/3] regulator: Add support for Unisoc SC2730 PMIC
 regulators
Message-ID: <cf99b84b-5ce3-4b1f-91c4-9e8a5064fcd1@sirena.org.uk>
References: <20260620-sc2730-regulators-v6-0-bbd2db395231@abscue.de>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="95yFsMHopHmTJv9r"
Content-Disposition: inline
In-Reply-To: <20260620-sc2730-regulators-v6-0-bbd2db395231@abscue.de>


--95yFsMHopHmTJv9r
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 20, 2026 at 10:53:59AM +0200, Otto Pfl=FCger wrote:
> Add device tree bindings and a driver for the regulators found in the
> Spreadtrum/Unisoc SC2730 PMIC.

This doesn't apply against current code, please check and resend.

--95yFsMHopHmTJv9r
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpCtjAACgkQJNaLcl1U
h9CpWwf/deCeIYkEER6Q/OUOTz3nz2YacD5JkLMIBVx7h8kaxWpb5Cz2a5pX9jnI
dQq2GDETYi6re5sjTZaF6k5rpWDAwdismC/OIVXdSgiMzSHszGFXcKdN78yUXQPd
cPf7RJFXLVXiFYWmoFRGgYPHaFU8N8xqw3K3cKB0yO0eVVgElnpJyNWs+iwRy5Eu
a/2xkHXXVV/yb5ud1Qm6U3p/LPNbHJthPVTY83ZxYl1wC0WXpm24gBWOktgv1LnK
+A3sEXX4hoc/SNtHjUZ0ANUZEuVYBjGRP9E2K71vapsUaO0Mdrs7isvpZjtTuIDq
vaph9FBtvPpbE7FMOanO2j0Q6Gceww==
=ODhd
-----END PGP SIGNATURE-----

--95yFsMHopHmTJv9r--
