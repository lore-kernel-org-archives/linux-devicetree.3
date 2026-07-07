Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B5AB431485;
	Tue,  7 Jul 2026 16:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783440160; cv=none; b=J7a+rkU7gk0L/RwHuJBo8UMkELjbiDl6sYUOQVOIVCh04cuW6WIrWjluYiAOqtH1Tmu9r3SivriyJCUDaLuXUSu7RSBzkGGRypeUox+gpz88KM4hGbStCBvzYbD/72YFxicg8eOicZmuiivjP2c0wsslvUTdeMA6n0VIWfryRz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783440160; c=relaxed/simple;
	bh=MuT3KM1/6ZdFHDT3p3g12qlgaRVWfvSMHunBYMPbvVA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tpKVUjVmmwg9rjj4iYxV+X7D9aKlYgz7VZNLdzxmOpFzL5gQqR0PpRxylZA/wLpLfJzsO+tLA40lSdO0hga8rY9rPkxZY+BG8r/t/a+SLY9xypS7nIlIikqePKqvUeCR2tDkv9rdVh2AIEfypGdz7j8rwi41oUSiVCeoWf0Hc4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eG3WVHPP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eG3WVHPP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 803721F000E9;
	Tue,  7 Jul 2026 16:02:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783440159;
	bh=qS/G2jnbuz6aDr3pHhkWT5dB/EtkmjXHCvwPoXLiFZA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=eG3WVHPPhvwUbO4WsW0YMnKc/lqQF/VHbOm5mgnU3GfuIPW6CppfW7CsmpuXWDbie
	 jmdC1TC0XkIDGAQNgV13b1DxYmtvOoBUY412GbEJ/W34Na1mii5JMHXzF91tRtcIc2
	 zoChLBqsCtsAlCLB0YwdBgvKpCjPtsLog/NOP/7E0BuSuUdTC7DLOgDh6v+g04pcif
	 mO0AwmcEC27eypILST4D5b5guaqkwUdb2vzujbrN28Xc352VjDZu4I8zrQfRJQ5+pa
	 4DIsXalQHHPXk/q3TcpoLZBObOB9HNQGTKoPwHk/xmkYw2BDvZiBhHV16j6XhmDuUj
	 IsljfQRFRYnBw==
Date: Tue, 7 Jul 2026 17:02:35 +0100
From: Conor Dooley <conor@kernel.org>
To: Pufan Jin <2254650260@qq.com>
Cc: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: arm: rockchip: Add EmbedFire LubanCat 4
 board
Message-ID: <20260707-extinct-hedging-ed99e6ad296d@spud>
References: <20260705135014.1004166-1-2254650260@qq.com>
 <tencent_B1442A024A02EFD704ECC0F098F663588209@qq.com>
 <20260705-palatable-hardening-48f73a84244c@spud>
 <20260705-matriarch-epic-37add5cb97b8@spud>
 <tencent_3C137FCC795067C558C9C8BD86C03C180006@qq.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lk3aXiOGRUZx46ct"
Content-Disposition: inline
In-Reply-To: <tencent_3C137FCC795067C558C9C8BD86C03C180006@qq.com>

--lk3aXiOGRUZx46ct
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 07, 2026 at 05:24:28AM +0800, Pufan Jin wrote:
> On Sun, Jul 05, 2026 at 03:38:00PM +0100, Conor Dooley wrote:
> > On Sun, Jul 05, 2026 at 03:37:00PM +0100, Conor Dooley wrote:
> > > Acked-by: Conor Dooley <conor.dooley@microchip.com>
> > > pw-bot: not-applicable
> >
> > Actually no, I just noticed you're not using your real name/a known
> > identity. un-acked until you sort that out.
>=20
> Apologies for the confusion. My real name is Jin Pufan.
> In v2 I will change the author identity to:
>=20
>     From: Pufan Jin <2254650260@qq.com>
>     Signed-off-by: Pufan Jin <2254650260@qq.com>
>=20
> (family name Jin, given name Pufan; using given-name-first Latin
> order as is customary on the list.) The Copyright line in the

> DTS will be updated to match.
>=20
> Thanks for the review, and sorry for the noise.

No worries, you can retain my ack with these changes.

Thanks,
Conor.

--lk3aXiOGRUZx46ct
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCak0jGwAKCRB4tDGHoIJi
0g/LAP4kuu9HfHTz4b2qBWOQcAxJHN0H8xq6/CHpk20mHbQfSAD+Kz5WgR2WyhuA
Gx1j08VZtnRmq5XiFsTHznuzkRH4ewo=
=ZnFp
-----END PGP SIGNATURE-----

--lk3aXiOGRUZx46ct--
