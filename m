Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61B6E403125;
	Fri, 15 May 2026 17:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778866485; cv=none; b=XvAgRNFGgpIa3mdeRc0/tKaYXpRObFvdsIJ5muOVyY6Nu5jBxvFX7GPwQMIhZ5TO/4Z0FmRHvsnv84xPMeILOeJ+Av5Dgj9Ghf4uf7Ces0UvRgwLDZOipQwQH7Fot0rQV5n6TM4lifkws2xq1I865XnTrynynPU+0CdrYdd0wF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778866485; c=relaxed/simple;
	bh=JMqgLzDQU+x0NBNFa/inAWoR0D9HxySnqFiIAcoUyNw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BZ2nNVsZboBaxzHH0JxhOx81Hy5zfMwlljqinQHNAaZkIRjgOQhqKZufOM8g8ReTC3PpooNix05wQtoOnWLRrf6TB708zUpFr7j+1gOLhCrHSBInRdrylf3UMC55a8Nj/hg5uIvX4adjGVlJARC2v0A+VYhUmc8meIqUHNzcMWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=baUGqypx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="baUGqypx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01748C2BCB0;
	Fri, 15 May 2026 17:34:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778866485;
	bh=JMqgLzDQU+x0NBNFa/inAWoR0D9HxySnqFiIAcoUyNw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=baUGqypxT5nWVLA5b0Yez0dcglKt8BUUuWimPI7/7LNcB8KXVvuAN8cFmSAypuZe0
	 HLfrtNmsYaf2CryyT6vlH3pUXdxVcAvGKCzMkz7u4RM2QmwSuIOH6Y8OPLyYzQw2KJ
	 9bZA9UyCHyvciCSa8HDVOmFn68YgfzBqTZkOy1pWPocYDBwNIYNOhQLQ4vSpsQ64rl
	 LGkYnfoRdyA3qP96cdKr/b1IqKI3wyCzI1aptMbwW1uND3zWjdEaVzsZ5KYHoHHxlF
	 ytrxU0vFEQWcIHgtoSZDJs8o2tp/Qvr3XlUCrKDzVoRM1CkUnE82UzkQNKk+JQt+nC
	 LgnoaxmUc+GiA==
Date: Fri, 15 May 2026 18:34:39 +0100
From: Conor Dooley <conor@kernel.org>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>, Sam Ravnborg <sam@ravnborg.org>,
	Simona Vetter <simona@ffwll.ch>,
	Thierry Reding <thierry.reding@gmail.com>,
	Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 1/2] dt-bindings: display: simple: Add
 AM-1280800W8TZQW-T00H
Message-ID: <20260515-shorter-crate-c51d3ff6a200@spud>
References: <20260515082232.1766586-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="VbcJbj4m7Q2qtc5C"
Content-Disposition: inline
In-Reply-To: <20260515082232.1766586-1-dario.binacchi@amarulasolutions.com>


--VbcJbj4m7Q2qtc5C
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--VbcJbj4m7Q2qtc5C
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCagdZLwAKCRB4tDGHoIJi
0sCYAP9GiMhwu5r/Vum/TUTQppvWaxo0e6a4c7nlkCNP+tnW6wEA5+LnzGTTPE/g
j6/Nryxy2t2IwctCpCedVg1fjsOw4Qw=
=fwIs
-----END PGP SIGNATURE-----

--VbcJbj4m7Q2qtc5C--
