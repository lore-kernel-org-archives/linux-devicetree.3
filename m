Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D1E931F998;
	Fri, 12 Jun 2026 16:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781282590; cv=none; b=q/46FDLbZRmACTPSb5QyOFZHMpF1YvcpF9YzxiVtWRg5YDDE3QI2Eu6KkrtdwI/MsXwes6scwGl93tqZ7cnVyBYUvUMwr/tFs6C8qpq04PYs1ObxkVdGUZPzA8r4tBbPyi1UB1uLn+QB1ADuFwvc/7WzNfxsc06p0txFLec9MW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781282590; c=relaxed/simple;
	bh=2hFyVOX9Qmybv7o9zWJHJ1lJ4C6SjaRoYYblpegTOC4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R2kmS+Z+7gYj0BbvofRrk6ACKm2NzsJpxGDZlG2EScCskEZuZ0pCfJeaYMQnNzyZuQ57zixVJ45JqIm1f96H3VhwUOi3DFZKdlplRJ0XF/66yt3me0zPcsF6teno2hD4AsFbz8BF4Zr/eID1eGcxTtsss35HoYPFI8YRw/MtaCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YiGkM6CC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YiGkM6CC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0D5B1F000E9;
	Fri, 12 Jun 2026 16:43:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781282589;
	bh=2hFyVOX9Qmybv7o9zWJHJ1lJ4C6SjaRoYYblpegTOC4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YiGkM6CC07SFtI9wZ0wjQa/gXrGWyQ+xZpvGN+3va/PktFSC1lkT4ca964e7445x3
	 6EmLTGld75Hj/5ci4q4mo3Zl0Bx34ghY265Kew/PZ/jbc+HqHxFFnbemRyN5MfaMCz
	 7NJGzqq5fj3wxOZHlCA/MTrh0peW1JEb/zbiX+tad+/qGkleQ0VSEkDJT9I+TDmPJH
	 VR3IOL4mkxGtm1t+fizrTHD1AYpjeVqyupkdSGg1Sw8Ixy0l7XU1U0sYcq/r2RpoxT
	 oA7AB0qx2H59oO4kBQuqJTjKx4GTTgpTF+QGRZ7+x3zss/D/t2np+Uk+8KVYON0BoL
	 qd3Udmhnqh3WQ==
Date: Fri, 12 Jun 2026 17:43:04 +0100
From: Conor Dooley <conor@kernel.org>
To: Alexey Charkov <alchark@flipper.net>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 1/4] dt-bindings: vendor-prefixes: Add Ugreen Group
 Limited
Message-ID: <20260612-chirping-catacomb-acb53680c4c4@spud>
References: <20260612-dh2300-mcu-v1-0-ab8db1617bc0@flipper.net>
 <20260612-dh2300-mcu-v1-1-ab8db1617bc0@flipper.net>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="LCPj24h9H5nR0ZzC"
Content-Disposition: inline
In-Reply-To: <20260612-dh2300-mcu-v1-1-ab8db1617bc0@flipper.net>


--LCPj24h9H5nR0ZzC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--LCPj24h9H5nR0ZzC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaiw3GAAKCRB4tDGHoIJi
0g1HAQCHsYPbaaUh4VsV+wWpDkVCfINVcMH7yGed6ikRWQWSCAD/fAcDGvCEesZH
Fede79+bUvv0bfmFqBdw3x7lVOY3FQg=
=XgWn
-----END PGP SIGNATURE-----

--LCPj24h9H5nR0ZzC--
