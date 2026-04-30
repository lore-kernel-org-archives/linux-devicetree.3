Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C91611A9FA0;
	Thu, 30 Apr 2026 01:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777511202; cv=none; b=l3Jx2HWV/RDoGtCpK0cVjifYrHGED1ceaxujAFD3aXYh9DnjjvfwQqhKvwmz3JBoazaRQITw+NDxD5cw96oUtSazv0/jq3pTSN8aTFVgQNF/nTitio4BBbd80q1NrQEu8q7dJsXplHhyVUprUEnOYae58fGMlH+UPbx86iY8v3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777511202; c=relaxed/simple;
	bh=tsEXakmKd45gMb7T8cVBykjOACgx6A8C3+eSqryUw5I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RhILHO3S9yQUXw5cWUTdPtmqpZnJy9DKnhsPxfmsORddsEf6a8NSpJ7EmtSKXBpdMh7SRxadtDXQsufsT4UNzGN13u4pdYzWejQqMPENNwk5/wHktGHkeOzbfBYJQ0d4gLoHv2Pd8tW3mR+BqPFbFctmJqbhM6b0YpPqVczzEvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DYr4zl9w; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DYr4zl9w"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4586BC19425;
	Thu, 30 Apr 2026 01:06:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777511202;
	bh=tsEXakmKd45gMb7T8cVBykjOACgx6A8C3+eSqryUw5I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DYr4zl9wEOuZ5kUjwqY2+9I9YNggSFzwgVTOf/6KxX+ddEx9BrKwCUDo3jNNp3yll
	 p5MA65QQKck8q9omSSJa1L9QbEhJPqVZ8N4cKRQI2IEhiFjLky9gn9eZoWqRWO3orp
	 w97gPL1N1bHpFpoxAfuNCSSXX6ja1StPWSC375+w4Cue66QTsq7/xg4ssC9oQYfhZi
	 qyvdGCiQTXXX/56a6Ycw3716ucAs7kYhc60HJwjrfjZjPCUSX0/7vTPYFCUbW49bnw
	 geIVOuzGkQCKp7ihErLQBYSN5vAn7QeEYdsPGbdDtt5WFL0zmh84osW/vHdNZs5tyv
	 B/ruD6fHjIryQ==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 29B881AC585D; Thu, 30 Apr 2026 02:06:39 +0100 (BST)
Date: Thu, 30 Apr 2026 10:06:39 +0900
From: Mark Brown <broonie@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, KancyJoe <kancy2333@outlook.com>
Subject: Re: [PATCH 2/2] regulator: add SGM3804 Dual Output driver
Message-ID: <afKrH4fdv1jXxLgk@sirena.co.uk>
References: <20260428-topic-sm8650-ayaneo-pocket-s2-sgm3804-v1-0-1d8dc7620256@linaro.org>
 <20260428-topic-sm8650-ayaneo-pocket-s2-sgm3804-v1-2-1d8dc7620256@linaro.org>
 <afFS3W5hokXy3T7x@sirena.co.uk>
 <7d2fd0d7-2ac2-43d8-be5c-4f9fcd7908bb@linaro.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="JN/cpNFVG9seBCzi"
Content-Disposition: inline
In-Reply-To: <7d2fd0d7-2ac2-43d8-be5c-4f9fcd7908bb@linaro.org>
X-Cookie: 667:


--JN/cpNFVG9seBCzi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Apr 29, 2026 at 10:05:33AM +0200, Neil Armstrong wrote:
> On 4/29/26 02:37, Mark Brown wrote:
> > On Tue, Apr 28, 2026 at 03:52:06PM +0200, Neil Armstrong wrote:

> > > +// SPDX-License-Identifier: GPL-2.0-only
> > > +/*
> > > + * SGMicro SGM3804 regulator Driver
> > > + *
> > > + * Copyright (C) 2025 Kancy Joe <kancy2333@outlook.com>
> > > + * Copyright (C) 2026 Linaro Limited
> > > + * Author: Neil Armstrong <neil.armstrong@linaro.org>
> > > + */

> > Please make the entire comment a C++ one so things look more
> > intentional.  The authorship overall appears a bit confused?

> Sorry, what's confusing here ?

At various times both you and Kancy Joe are listed as authors of the
driver, but rarely both of you simulataneously.  I can't tell what your
roles were here.

--JN/cpNFVG9seBCzi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnyqx4ACgkQJNaLcl1U
h9AawAgAhk37UM7dRk5B61iR+DPgcKvtEBajvsyoiZ+DvaFb5Tx4SkhFfa60KEOv
ZI1/r5BIKY/TloMoujjWVzYktY7cCq+rKBab+GvSWU9Z8TCiZ17py20/LgvF7PvP
QRz0k+VOlltuDpd5n1Nzn2cSnG5nGVyqoq+jW2kvr3usNpxSc/gsuHczEf0QdKpY
a0vFiQJ4OC55licuOvEj07ZbCtJPah96un8ewIjG59kzjDxnwKWeNXoI9V0UuhzU
7NCo8cY1RottCmehWKW4flVLn/sjJb1P/FAaQLZo/j18M1n7GycPhouRDdIETKbF
i0Il++uTCgn7YuWy5QRkEvtr7vZHOg==
=NW/G
-----END PGP SIGNATURE-----

--JN/cpNFVG9seBCzi--
