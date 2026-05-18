Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A67CE481230;
	Mon, 18 May 2026 16:44:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779122657; cv=none; b=CLocxm2O9l/3kxfB1y74JxbITPZUihPqBtIawdoYCcjUDzB07TNM9C7akBTTHBQzBPiFwNj0Y53KBJTPhBPY/o08olmvNez8DMIQR3cK9uUz1W/Jh4Llo11MdUH1pdSJbeg6+5WivQ395n+DShRgAVqMjlPpRzlH1AGceVsM2oA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779122657; c=relaxed/simple;
	bh=athY6V+ZJb/6Rqv375n3b6enOO/UaiPW+e5aLq34/yk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RBkP6nQxpInWDzIkNMj/VivQl9NiubumRvepePyt46XeqquDSTMcz6HOYQNDSxR8gdSrGwT+Vn7FHT3USZ9HyvoybIOS6V5h70LXdxxskr+lBJGyN99Ja5OHkmSq48Co+q3ds5L+2NAqBdjuOYbMYyNgS86GMfEtUipLo6sFrLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y12bMgJZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y12bMgJZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 041AEC2BCC6;
	Mon, 18 May 2026 16:44:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779122657;
	bh=athY6V+ZJb/6Rqv375n3b6enOO/UaiPW+e5aLq34/yk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Y12bMgJZ4dqS2JON4td34dAuCUrQqgBrVog9wC7ZBC+kYdQ4ITvEzGkhVf2daOU1a
	 lNSRNknm5faRJxr1mMtrd6sUyM4PpuZWIgr36CGKlak9X7PZza58AZLuyhOpc3ZrD0
	 KmU6y5vfgceC9E6Gp62LdAXjJBrwnEIITi5c6LWIeKqdIWygqPUFt/Pg9xsjqoFSe1
	 kkcD7veioPIDyZP4irTqeQzdJjznpW3Hjki8sgGTjDk6qpD2wwjCyEX5kvERMYrjNz
	 YTRjLxQkbX/XC3sBXt+icI+ID1DKMd0ac2zSzR5DcUzmi8yGxs64T6N9AwkesaPXpl
	 OJpS+HgRcsiHw==
Date: Mon, 18 May 2026 17:44:12 +0100
From: Conor Dooley <conor@kernel.org>
To: Otto =?iso-8859-1?Q?Pfl=FCger?= <otto.pflueger@abscue.de>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>, Lee Jones <lee@kernel.org>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 2/3] dt-bindings: mfd: sprd,sc2731: Include SC2730
 regulator bindings
Message-ID: <20260518-grading-activist-4b843b8bc487@spud>
References: <20260518-sc2730-regulators-v2-0-9a5b3a7b1e49@abscue.de>
 <20260518-sc2730-regulators-v2-2-9a5b3a7b1e49@abscue.de>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="DGEVYOoJMmDh5oG/"
Content-Disposition: inline
In-Reply-To: <20260518-sc2730-regulators-v2-2-9a5b3a7b1e49@abscue.de>


--DGEVYOoJMmDh5oG/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--DGEVYOoJMmDh5oG/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCagtB3AAKCRB4tDGHoIJi
0kKCAP4kS4P1iSjZhWzF1CJrj50sH+HZJ4PoSsAg3U5NnVJ7EgEA6cchr3XMglr2
0GQm7djvobAkvNeWAoMWN6g8jZ08fAQ=
=RBSN
-----END PGP SIGNATURE-----

--DGEVYOoJMmDh5oG/--
