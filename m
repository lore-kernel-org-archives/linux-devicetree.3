Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D81D4BC016
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 16:32:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781022775; cv=none; b=ndCHk9rrpWJenLjwnfO6qm9B7xYcrGiMmWCtPTaXMGNkxdi1M/2nC6uBJE5VViSiW56HmKiRPFRGYVmT62ahKWFQ5tizJDZGuvTP79LHGYMN26Hmx7dVFtBIF9ZWqN9RvBee17sQkiX3njXPpO4iyFLNFzCTvQSxwTW8/l3CWGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781022775; c=relaxed/simple;
	bh=ncLMA11F1fiWEvmsQUhSK6p9vIDQ6T4vA50ZOxw1HOA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hG221IRXusZnChX29qgTYsc6uHORQ2ADyPXJSj44r9OzMQU+d4r+RwMWngFRVeATZ+PEXtCTrzTQHrPi8flgvTBkZugJllKcwn0eFeOjJb6WzMQOmS9eeShtuphkcR1Tv1wSQbMPfrrnTEsiSyzh+REqKpdiT9XpDNQUME4im3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hZvJE5V/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hZvJE5V/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 313291F00893;
	Tue,  9 Jun 2026 16:32:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781022774;
	bh=ncLMA11F1fiWEvmsQUhSK6p9vIDQ6T4vA50ZOxw1HOA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hZvJE5V/sTnBqsyLgN8b9FTCbuNYgkLU2cTIM2JDubJqAjNOy3WnPZS/3cC2LHEz2
	 ivRW314q68z6kST3qqjIVlBia3KlG8H5Y5hUScx+2SXXYophYoU8bsulk2iF1Z3kbt
	 dt3q6C4hYVqLfVdvJEv/fZitgl5mGtL2myY10jlIrGM7/lTHW//nxqoRHH8cPFBkoG
	 dlcqYWurOGt4YPxKxbbjn/q24P2RKh+eIGCb8sep9+Uu85xCrqP4i6hsYc9tKlWco0
	 phkuvrtkGCRKLELUURq8mYhkZwxNwEsEqzebvW9Y4v9ePCpSHQaEKUq5Wv30QSm6Pa
	 OPVz3F+4/6nLg==
Date: Tue, 9 Jun 2026 17:32:49 +0100
From: Conor Dooley <conor@kernel.org>
To: Chris Morgan <macroalpha82@gmail.com>
Cc: linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
	xsf@rock-chips.com, sre@kernel.org, simona@ffwll.ch,
	airlied@gmail.com, tzimmermann@suse.de, mripard@kernel.org,
	maarten.lankhorst@linux.intel.com, jesszhan0024@gmail.com,
	neil.armstrong@linaro.org, heiko@sntech.de, conor+dt@kernel.org,
	krzk+dt@kernel.org, robh@kernel.org,
	Chris Morgan <macromorgan@hotmail.com>
Subject: Re: [PATCH V6 1/6] dt-bindings: power: supply: sgm41542: document
 sgm41542
Message-ID: <20260609-excusable-overall-197cc08d4e43@spud>
References: <20260608175521.67449-1-macroalpha82@gmail.com>
 <20260608175521.67449-2-macroalpha82@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="e7Lp4ziyWaFrI1Cq"
Content-Disposition: inline
In-Reply-To: <20260608175521.67449-2-macroalpha82@gmail.com>


--e7Lp4ziyWaFrI1Cq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--e7Lp4ziyWaFrI1Cq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaihAMQAKCRB4tDGHoIJi
0hOeAP0TYJxzWFrb7x6TPmcnqH5OS7GiMz2Ri/7MR0sYrUyajQD/Ua/v57PBVG5t
bVA94ekDqwARoJxHC9wh7wlC2+DuCQ4=
=zwmu
-----END PGP SIGNATURE-----

--e7Lp4ziyWaFrI1Cq--
