Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27EEC173;
	Wed, 29 Apr 2026 00:44:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777423498; cv=none; b=JomWqKFmnIVc3JQFMujihMwlkInXRw6RYsqNw1hEyFJFuEdg/wjYOYrodEpkB7DBimJN+R0W3Jer/eQq0k17w3F4799B1xv3/SyuBidUJcPDvFSd5Lbvkr5mQTH15nvFaYKZ3JlQV83bXi/sFuFq7aPc7DRQch+fO1aFdfeOqtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777423498; c=relaxed/simple;
	bh=yiFcOOyynAfw7inY5wTOGyKpaHRrGryvrKmK1RaFMxE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ODIUhyBTarW5677ohi2myKLHSjewzJqKoKiE+0/+MrNf3oOpD2Xr+6RhKptlzC41XjUPWZHSvAhPfjbq/3aXaWYD8A7hRUFjf4BnxvJwyFG8u2HZAJFlpf3iwipDQv3pJzEBrFJ+8Kmetqxxv24EvKqvMldjAcRlx3wgF9Pqpco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W4mev9sE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W4mev9sE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DD83C2BCAF;
	Wed, 29 Apr 2026 00:44:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777423497;
	bh=yiFcOOyynAfw7inY5wTOGyKpaHRrGryvrKmK1RaFMxE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=W4mev9sEVh8yqV0xfec9Mik5A1LVfXMVMN2zsMaBztdjKN06fBxdAPP0a/VYQu9XZ
	 dvTNicmmtASe93piOZAq+XgdylFDvgjCPCmvL8BTwJFx/xi/29ts3vYouGVrxQEPLo
	 lWMyJu+/WfB2KA/cFQBm5WqzyxroV6DOd8qgZ6Fbo6T2higERtu8g94TiZfr6nXuV7
	 0FormrZOYwzHpkPNKdKbEZVIQiDKRwIiTif9oTVeJ/9Nv97mQAcE7LkSdo+rSgU4k+
	 P8pbMRVeALQcRbMOcbxbehS6s5BWbHE4HHEW74aREZl+Adj8JcfJIAL0SBS+C3DumS
	 e7NrsaExBW/Xw==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id BFAD51AC584A; Wed, 29 Apr 2026 01:44:55 +0100 (BST)
Date: Wed, 29 Apr 2026 09:44:55 +0900
From: Mark Brown <broonie@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, KancyJoe <kancy2333@outlook.com>
Subject: Re: [PATCH 2/2] regulator: add SGM3804 Dual Output driver
Message-ID: <afFUh21CNpv17-kN@sirena.co.uk>
References: <20260428-topic-sm8650-ayaneo-pocket-s2-sgm3804-v1-0-1d8dc7620256@linaro.org>
 <20260428-topic-sm8650-ayaneo-pocket-s2-sgm3804-v1-2-1d8dc7620256@linaro.org>
 <afFS3W5hokXy3T7x@sirena.co.uk>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="uklneQcn17RsOany"
Content-Disposition: inline
In-Reply-To: <afFS3W5hokXy3T7x@sirena.co.uk>
X-Cookie: Who's on first?


--uklneQcn17RsOany
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Apr 29, 2026 at 09:37:49AM +0900, Mark Brown wrote:
> On Tue, Apr 28, 2026 at 03:52:06PM +0200, Neil Armstrong wrote:

> > +       ret = regulator_set_active_discharge_regmap(rdev,
> > +                                                   ctx->active_discharge[rdev_get_id(rdev)]);

> It seems like this should be a regcache sync then only the enable and
> disable operations need to be custom?  There is a register cache and it
> covers these registers, without it the _active_discharge wouldn't work
> since it does a regmap_update_bits() and all the registers are marked
> unreadable.

Actually I'm not clear how the cache works here since everything
writable is also marked as volatile but no register is readable.

--uklneQcn17RsOany
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnxVIcACgkQJNaLcl1U
h9Ddngf+JdquHuOK9O0IBx45sZqn+I2WCQCo7UXN/8V11gR5FIpxvM24j7Bv9L01
zoHwYy3YPWY9iFckvcuewJAjrLdeOWjEp3SGLkrejTHEi+B6peGsetp75I8rXILT
r0770icC2NQmTL1iudiBh/1rHVSPCmn+QF6PNxAtvGu7rwK3JDLktqvU6KS/KSrW
pMb5pSybZRP1YUSl/eqrkVClfxu7FyWTLgKz5yS+SiJF16cI7yiEUYWqOga3pwJh
9prShbpaHSpjzeCTLm/zWH8nsyLa5QKSNywQo3q4xYZ5+L9UA/evzM8FBEJ4eK4w
alk5Orqz3w5qhNQf1scgHBLwon3O0Q==
=0eCB
-----END PGP SIGNATURE-----

--uklneQcn17RsOany--
