Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B74C832ED40;
	Mon, 20 Apr 2026 15:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776699399; cv=none; b=W88W/NwI32+WViD/gNpilkHwCZSi3X0L5VOYViBKSgkGY35wc2D41fDOcCjIjLaS5apEHAYP+W2P4Cban+GT5DA6IZ+z0PzP6M9X4DEIPsDWvM1kRHEt3dEo75Rk5+HbOFwjKwa/jFQSXHXhgpR/KIvUiJifJBmPtjtAKYEk8A4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776699399; c=relaxed/simple;
	bh=AzFmS5Tnu8sMhg8eDHy3LPsdHF0AOqqG0otqcA9EY1E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=urbwvfMceKcPCXVPiaup2Q0gTsJLGEnyjuhV5ps28wySGF4lG3bDiOepXzfiFT5OtjYr+lEvQmTgcLmuAiqVncyRyCMf3OHSxfqo489nsDeUYA6DSanZLULNsdvM5HL/j+woV9rtLhSPPmV7TjUsO90CMa7PvYSLHmz/7SFNLwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aRrAXzKA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aRrAXzKA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C507C19425;
	Mon, 20 Apr 2026 15:36:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776699399;
	bh=AzFmS5Tnu8sMhg8eDHy3LPsdHF0AOqqG0otqcA9EY1E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aRrAXzKAS0bBFun9CQKrTyofiR5UlWY17F+ckg075QcTe2r9+vjrfK++RzMggttkV
	 q1NTwF7XAvZjmFfZLPpUmtgMYHiDG2drOziCXgfLcWd0Y6nEvjujmTwVZmr5hMl1wU
	 CpaQ6uFIbL/EpyQ6i/wUmfEaRC4/BNEMMkieXlqICQmUyLAF5aakdEG77cGbUkLmqz
	 xjBh+OUX0oJ5Fa5DT38dIq0PLIc5seAMFXqe/ETiWMO5q9VvdUgynajX2MEWNsqgBM
	 AuMqXg2f+PdpqyrfovuxaJ/zCNSe3WpEcIJstH9jBILV0URQE+p5fot3kNejTRHC7U
	 FmdZfQNqOrUaQ==
Date: Mon, 20 Apr 2026 16:36:35 +0100
From: Conor Dooley <conor@kernel.org>
To: Colin Huang <u8813345@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	colin.huang2@amd.com
Subject: Re: [PATCH v2 1/3] dt-bindings: arm: aspeed: add Anacapa EVT1 EVT2
 board
Message-ID: <20260420-garnet-goal-4a284a8818fc@spud>
References: <20260409-anacapa-devlop-phase-devicetree-v2-0-68f328671653@gmail.com>
 <20260409-anacapa-devlop-phase-devicetree-v2-1-68f328671653@gmail.com>
 <20260409-foster-stability-f77b38c6f7a0@spud>
 <CAPBH0A_K39218+=QHJuEY+SbFk-nCnM=Z8RQMdHBK7SkCj2QtQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rT7U0ER3rzaPGzgy"
Content-Disposition: inline
In-Reply-To: <CAPBH0A_K39218+=QHJuEY+SbFk-nCnM=Z8RQMdHBK7SkCj2QtQ@mail.gmail.com>


--rT7U0ER3rzaPGzgy
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 20, 2026 at 01:41:30PM +0800, Colin Huang wrote:
> Conor Dooley <conor@kernel.org> =E6=96=BC 2026=E5=B9=B44=E6=9C=889=E6=97=
=A5=E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=8811:36=E5=AF=AB=E9=81=93=EF=BC=9A
> >
> > On Thu, Apr 09, 2026 at 07:40:26PM +0800, Colin Huang wrote:
> > > Document Anacapa BMC EVT1 and EVT2 compatibles.
> > >
> > > Signed-off-by: Colin Huang <u8813345@gmail.com>
> >
> > Acked-by: Conor Dooley <conor.dooley@microchip.com>
> > pw-bot: not-applicable
>=20
> Hi
>   Could anyone let me know, what is my next step which I need to do?
>   I can't find the changed in for-next branch of
> https://git.kernel.org/pub/scm/linux/kernel/git/bmc/linux.git .
>   Thanks.

You wait for the merge window to end and the maintainer to apply your
patches.

--rT7U0ER3rzaPGzgy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHQEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaeZIAgAKCRB4tDGHoIJi
0gyRAPih4zXoYopFmAszf/ozsfmpEp1cZspkWl07OnahV3yqAQCD9Sal/PjSSKtW
PGb84+0XAkYu+zzoDJlWPigE0ykYBw==
=g4DA
-----END PGP SIGNATURE-----

--rT7U0ER3rzaPGzgy--
