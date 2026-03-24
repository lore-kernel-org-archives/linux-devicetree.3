Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B197F40824B
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 17:49:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774374577; cv=none; b=H7BuseIVzb7so5RrszqFR/jqQ65xBu89LNeCIIesmGog7mr7YhWaIygDeeCHFW3b1PWpDqS12Q9/gtrXoSGJg+DvCEL5CS7Z6bJ8XrfvwJQldCvz/snrM6mfowyQRJCtly4txyGG4G1/tyXI3npwhrvSM1SFNl2ZK94u6FqGlD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774374577; c=relaxed/simple;
	bh=P6CGa5PVaMof53EJnc/g5F3lxqSTKqEjKLDeUbeIEQE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HXqwc9YvanEbI2WOZFHwDAdbi2Hs8H+GXoxAZrcsjpHYdDodUQDbsGO1Bj8zdaAA+p8TGezQ4B+sIpeGpFr+ucPUcFwHFg2uh2/spUSBjdvm3Gae8xaFbAFI0lJ6TvLilAUfrbMlyaFayaS9THi2bwdn5QyZ7aR6Scgn3P/n+ME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tZ7okAZv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tZ7okAZv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D022C19424;
	Tue, 24 Mar 2026 17:49:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774374576;
	bh=P6CGa5PVaMof53EJnc/g5F3lxqSTKqEjKLDeUbeIEQE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tZ7okAZvzXoZlJdnFoy5gkgve+n0JCiGqjEdWscu0+i0fo7hEq74jtgvLdfYrETg4
	 jE/M7OEA8PvOfcUGOBonmgTUEuQT4si45Ad3dnREsJk5YOdtYTSBWqjyJNSJz+xYdG
	 UZpkDubxJBgU1R4sGJEn5RKayktuOj775WlCga6A9VHuXW7WheE6/51FSKK7kt8f6+
	 bC2JTcpHKJsqbEVp4L8RDf+Ke6WpdQESV6cUCYkoFMhGx7ETfl7QnRZlsom48Wf6Aq
	 zHHz13ycpLhT7BRd8X7flTomUeHympcSqstlni1fssQ67L87roMn7uk8NO7TGJkBBw
	 gm14L3RL++Nnw==
Date: Tue, 24 Mar 2026 17:49:31 +0000
From: Conor Dooley <conor@kernel.org>
To: Bo Gan <ganboing@gmail.com>
Cc: linux-riscv@lists.infradead.org, samuel.holland@sifive.com,
	david@redhat.com, palmer@dabbelt.com, pjw@kernel.org,
	gaohan@iscas.ac.cn, me@ziyao.cc, lizhi2@eswincomputing.com,
	hal.feng@starfivetech.com, marcel@ziswiler.com, kernel@esmil.dk,
	devicetree@vger.kernel.org
Subject: Re: [RFC PATCH v2 0/3] riscv: support EIC770X/JH7110 noncoherent
 devices with XPbmtUC
Message-ID: <20260324-marshland-stretch-cc21ae7fdc2e@spud>
References: <20260316060328.1173634-1-ganboing@gmail.com>
 <ee2b42b0-1489-478d-8c88-ced6b77824b3@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="VG78Oqy1pPQ6mjx/"
Content-Disposition: inline
In-Reply-To: <ee2b42b0-1489-478d-8c88-ced6b77824b3@gmail.com>


--VG78Oqy1pPQ6mjx/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 23, 2026 at 04:08:33PM -0700, Bo Gan wrote:
> Hi All,
>=20
> Any suggestions/comments on this?

I'll get to it at some point, just busy sorry!

--VG78Oqy1pPQ6mjx/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCacLOqwAKCRB4tDGHoIJi
0oReAP933a6p+CD1qNpOIbLbNSQ5Y9tHlbaabrnfLZrKwvMNUAD/XXmlLOeKBLgh
ipUx/vkgnh4p5eodwkoKB57ytGcaswQ=
=hzvl
-----END PGP SIGNATURE-----

--VG78Oqy1pPQ6mjx/--
