Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D202B35DA77
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 15:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782746242; cv=none; b=aYsACyi4rv7N3l7xFJhOtQQfqn5PKovmratV5TXnSifDo5KDJoSC4FXv8JuElk0wApTL/cE0joTGXiytS3vuw9lk2glctSgee0PNvaUidWZgi+cC1TIf3XwSJQjiPWTAjsocCQXJYmc0c4qyPIw6IbCIwiWRnVgoWQft8pNSHBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782746242; c=relaxed/simple;
	bh=QBd2swqnv63QuswfE0YfVh14by3uz3C66W7vLs0PN/o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hZjpozeo58TPaUmLkSKtCaowZxudsQ7s+ga1N54khf9FDdftNASblMRkOanXy8lvkTRO7LEQliTC3qh9M+61y6721FhpFizhmk7cP3GO4LIIpkwDabJNsLO1uj+bxmD8gzBiuDCMD6XXnql8SHl0SbGOwzgf+lqVWCpkxSe/Aq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jQ0aBiqG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jQ0aBiqG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 435611F000E9;
	Mon, 29 Jun 2026 15:17:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782746241;
	bh=QBd2swqnv63QuswfE0YfVh14by3uz3C66W7vLs0PN/o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jQ0aBiqGsK1DJRJ6tRvxwdYKvctt9ev/2EM5vPw+JSuBVnxo4oibfZ/jrOLXngaNp
	 mbmIuGTeSzCr8NJ5maD82SzHPGmsB6HDs0ckZNQS622mc8t6oYJbhNXwtCZ8Maxiqs
	 ca5eNabjO8DphfTMBGJu8nYxrr5rxkeYsRtXKRwHb3dr6rXAICs5lPOpKwLZENUUSe
	 RFHvTq5MJIvrcZRlNzMj7GFKcXM3/cBMs0YO0vrUXlcJe8TkjoQuQpE2N519PzOV6R
	 Qgr9YdXqV81WLL/zY0xUbagSaIK7V1V3xGTeIakA5TBOhfMK/nZFLkwoN1UyNLk11G
	 O0AkD/v4jDL+Q==
Date: Mon, 29 Jun 2026 16:17:18 +0100
From: Conor Dooley <conor@kernel.org>
To: Dinh Nguyen <dinguyen@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	muhammad.nazim.amirul.nazle.asmade@altera.com
Subject: Re: [PATCHv2 1/2] dt-bindings: net: altr,socfpga-stmmac: add more
 interrupts for Agilex5
Message-ID: <20260629-applicant-expulsion-f4094fac3142@spud>
References: <20260629114818.1746410-1-dinguyen@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="FHPI8YO7q+R+qDkf"
Content-Disposition: inline
In-Reply-To: <20260629114818.1746410-1-dinguyen@kernel.org>

--FHPI8YO7q+R+qDkf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--FHPI8YO7q+R+qDkf
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCakKMfgAKCRB4tDGHoIJi
0hcAAP9kEYpe6JdKGvAd7J+nMUswpxenFh7GiWNkm6J6ITyv8gEA7gOMoMAXDVxE
UTMOTGKU6X4PNDmaYs5JTxwhk3+J7QQ=
=4N9f
-----END PGP SIGNATURE-----

--FHPI8YO7q+R+qDkf--
