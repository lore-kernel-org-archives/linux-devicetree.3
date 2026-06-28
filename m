Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F28D30F95F;
	Sun, 28 Jun 2026 19:19:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782674383; cv=none; b=M3aemjCMQ09pJWGvesZZ4uYP2LfK4wFx3oTb/Zvwrwp7E78vtG/dtmmbhwIL3Dyc9QQqcFVj+fDHzaU18PajYUOoWJX3Lj+EUemieJeceU/rCx7jtR1KfuPtauJ5/6j9OQCVmKwvO5DdK39fBe7RmFchKjMNvqhzwZYZW2BjgBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782674383; c=relaxed/simple;
	bh=4HtBsgoo1pkoyz9U7bxXdbavwf4UmaCm5JaH3qpl05w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pciSmW3Ez8WuLIunQZeUNqYYgI69RYiikTKchftTIq84WddM3fz5NoL/yRTILUoU+uB3ZfsP4NEcv2qDqD44Nj6HQy8eLXoJHuCFZhgG9Kxikp+WNu0b9Jn12BSdg5wf+8EuqM9iWpT7YtxGp+rdnWXioEbZGaj8xf3aM7o/Ifg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QaFpI/4s; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QaFpI/4s"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 712A81F000E9;
	Sun, 28 Jun 2026 19:19:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782674382;
	bh=4HtBsgoo1pkoyz9U7bxXdbavwf4UmaCm5JaH3qpl05w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=QaFpI/4sCso+xnOrHQuqjFzj/MK2wIM0gjspGR22goiAf1aEaBymN5YvtdztwMWsP
	 X8DuFWyQZEDYuHuv7X0jAoch3aoG8PslcRnQx1WKz5TORoHyjqwzUbAy3wGo5BXY+6
	 9JTq6kgkgjPx4QgVyidS/1r2HHBSRl72yjFAS5u/QbdCVNL2LAHGDH/5hNpKtmUuDC
	 wMuo/iXA78vNKz66xObpa8OjYJkxYO1mAef6yI+o/zfdvBWb7dwkzWlRDFTgy/c2KO
	 U/W//yVJHGLW0RmDcgF0QjYORG9izEUf04rYzEPd8xIjs9gPUuQOFe7lvuMMNNoltv
	 a97t65VOO/CYA==
Date: Sun, 28 Jun 2026 20:19:37 +0100
From: Conor Dooley <conor@kernel.org>
To: Hrushiraj Gandhi <hrushirajg23@gmail.com>
Cc: linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	heiko@sntech.de, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: rockchip: Add Vicharak Vaaman2
Message-ID: <20260628-retinal-ungreased-4c6d45e3596a@spud>
References: <20260627102633.86222-1-hrushirajg23@gmail.com>
 <20260627102633.86222-2-hrushirajg23@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="g0JoW9tTpk32mUpy"
Content-Disposition: inline
In-Reply-To: <20260627102633.86222-2-hrushirajg23@gmail.com>

--g0JoW9tTpk32mUpy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--g0JoW9tTpk32mUpy
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCakFzyAAKCRB4tDGHoIJi
0l9bAQCTqBDKp1DNzljiIyEyzuzlDZi8AwRwZlgHSHmC225+qgD+INSm2SlDd3W1
wMikkhDKqyY6H+ca0h44jK5+HqnxOAk=
=YnMO
-----END PGP SIGNATURE-----

--g0JoW9tTpk32mUpy--
