Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D71A22A817;
	Mon, 20 Apr 2026 15:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776699042; cv=none; b=RSVS0KTylireCkI1vGGa6tkkSOs8c1HybpcB5lEl5dm4KSAoxA9yKh3iRAyIcnRwYyQDdUmcHA5/E1dQsaPbScghvvySMlv3seUF0mdd6Wgzu5a+YZtp4b3a1Q5GcblDuI5uBxq/kd/SdumvENqT0t2n+p5kSmYpzPKOZJgHedY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776699042; c=relaxed/simple;
	bh=MW3RsSyElgNabblIUb1Mg6MJ+SH2M6LiGmW1DzajLao=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kf1jZmKWo9JFMRP/42UOOP4RwohcCR+q3LX2WOkuQEUx7uwPm3EmoRAGBN2ZNr8FGzc/mch2AW6VJzXZ4o3SumAozy9dsxStNy/NWtUtOxn+mctnP5dCVSazxwjstiQ4k4GvkmCUROUEYcNEogvHkiNFPwJWig02IR/PIQNxVSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CMaiKEv7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CMaiKEv7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3EA3C19425;
	Mon, 20 Apr 2026 15:30:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776699041;
	bh=MW3RsSyElgNabblIUb1Mg6MJ+SH2M6LiGmW1DzajLao=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CMaiKEv7ZS7BLhkT2rfutsuWwbsIUP+7CqHrowUsuIeMLjpw8FNuWiTEcaXO9GHRj
	 y8prUI/MGvu1AkYouPPi24RYaYnvFDTbwjxAh0UduKAGI6FoJqD7I/jNt0muoFw4zs
	 2l9sPULFkdIqcPnlW1/spt3hWwyewO7U4pbW3vzw2gIrnhLJVFknG9OmN98jSFRwcX
	 5Bs3Z46LJGG4aKXQtEHH5JnLSchqYlVKBKSg3Qxq4KzfirPQyMri0BnU6Ku0OScviY
	 usBUfsO38ng56yaQgw5vbmjXrWwCXyK5pbfo6lcAkLc9ybQJo4gvtGhcYduW+Wst0t
	 zl4pjlNAjkTpQ==
Date: Mon, 20 Apr 2026 16:30:36 +0100
From: Conor Dooley <conor@kernel.org>
To: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Emil Renner Berthing <kernel@esmil.dk>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Changhuang Liang <changhuang.liang@starfivetech.com>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: dts: starfive: jh7110: Drop CAMSS node
Message-ID: <20260420-cheating-boned-565f4c8d1333@spud>
References: <20260420-starfive_camss_use-v1-1-ec326af71ca7@ideasonboard.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="uanZ6hPS9qrdKIWI"
Content-Disposition: inline
In-Reply-To: <20260420-starfive_camss_use-v1-1-ec326af71ca7@ideasonboard.com>


--uanZ6hPS9qrdKIWI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 20, 2026 at 06:48:07PM +0530, Jai Luthra wrote:
> The starfive-camss driver and bindings were dropped, as they were no
> longer being worked upon for destaging.
>=20
> Drop the relevant node as well to avoid the following build warning:
> "failed to match any schema with compatible: ['starfive,jh7110-camss']"
>=20
> Fixes: 644673fc8fb04 ("media: dt-bindings: Drop starfive,jh7110-camss fro=
m staging")
> Reported-by: Conor Dooley <conor@kernel.org>
> Closes: https://lore.kernel.org/all/20260420-very-cartel-645595ffd1c7@spu=
d/
> Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
> ---
> Ideally this patch should have gone in the original series, before the
> one that dropped the bindings which is now merged in mainline.
>=20
> I've added a Fixes tag so it gets picked in the RC cycles for 7.1.

I don't believe this fixes tag is appropriate, so I will drop it on
application. Doesn't really make sense to cite a binding patch as being
the problem with a dts.

--uanZ6hPS9qrdKIWI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaeZGmAAKCRB4tDGHoIJi
0sdxAP43lJ5khIEciJ/TwVWkyDjMFYgzFRZHg0ND+AmOYgV4ngEAvXpTvg9NuAqG
HtDd38hqYSEG+6nZy4+nt5wCmLTmQwU=
=+xQP
-----END PGP SIGNATURE-----

--uanZ6hPS9qrdKIWI--
