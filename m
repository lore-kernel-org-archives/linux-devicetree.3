Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.117.254.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794391988;
	b=0r1lC7SDGAp4EPZY6Y7dvtCopHHCXsWcJ/SY+48i3s+gFyQ9LUtIKP3tnWV3ho/Uy60B
	 MMnHPDT3PSb2p59syvQ1IlCjZYQmQSuq5MNKTJ89e789mm0Jh6MYqBl7mbYz0RozU9pC6
	 5k5m5WuFxBdsNbrMKBV8CPogXSRyr0NlLXyxlnXDWOkKsjwFOGmQ3C/srqu7dlKI2QxHs
	 U/GMAsX1s5vbKYfgcDUB655oB6xK0wr+N+P4I9ia97CnX9WjEdeX5EUq9+FqwcA4jYPVK
	 gfKFLjAcUfv3hbRX1oDdz/RxWQf7zoANg37v+KgCe1E7ONydBs7zj4eUOQOEjueaToA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794391988;
	h=DMARC-Filter:DKIM-Signature:Received:Received:X-UD-Smtp-Session:Date:
	 From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=2C7a88iO2E9XdVBZbTeYDh+7SXQMlaU53ksWWdkmdz4=;
	b=y31flicyuYkStLK1mOqmqYzfRk0pZ4XvkoIDRzAWXyooiuJx1lrpWMawIEAmC6Wdb1gH
	 77GHBAPu7v08tatk2zvenifCvg8vQdtdrqltDQ8dF/5HvBHFoeOrHr7EUU7d/vXMjlwc/
	 wnSBqB7j8AaXBYOoBRq6AfGmqLH72ulKhxRzkUN2MbHpaAvz8y/06e/BsBH5XXQF6vW27
	 FWqqY08uQV6RJSyD/q7DgTbggdV2sRmBINvCBpKFcaMEOdB4VhajJ8AKHgnTdaK8IneDF
	 dWIZqI62ZdVioq0Ie522yT5nbFQ3IIW0JL9eS1Gu9Klany37gg0xScrrJgYf5FrllMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=sang-engineering.com;
	spf=pass smtp.mailfrom=sang-engineering.com;
	dkim=pass header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=IJLWBs9l;
	arc=none smtp.remote-ip=194.117.254.33
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03ED8606A8BA
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 10:13:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 03ED8606A8BA
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=IJLWBs9l
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=2C7a
	88iO2E9XdVBZbTeYDh+7SXQMlaU53ksWWdkmdz4=; b=IJLWBs9l73kgyLAhSBwi
	2VtRD0FQDYlwKBf+I6liqPKC/VCia+dXbWEeKxUrRDT2KR5VhHwRAlfderxj26QQ
	nvjyIuqgQvOsGqgapM5ZduCSppr4Xwunp7uu/ZB0b7MoaQOXef9bkSAjsZsmm0kS
	h4/DRWa1Nz/arhDLC1jpJXDamp5lMrX4EAhSwO0Y//C8DHG8Purbwhy09Vrhs1CY
	pCMg4u4JLuagjOBzQ5p2bQqOJ+C51Xz3F+Ru1Kx034fIT9crhWWo1v8r3aH11rs8
	vMCQQIgZwGDX5MGtcTCX9tLHUmsAs1DbTnDopi3D2DY38PjsyuprJDwbUZvGVDy+
	DQ==
Received: (qmail 565258 invoked from network); 11 Nov 2026 11:13:04 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 11 Nov 2026 11:13:04 +0100
X-UD-Smtp-Session: l3s3148p1@9NbJcP1fvIAujnun
Date: Wed, 11 Nov 2026 11:13:03 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Biju Das <biju.das.au@gmail.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>, linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH v25 04/11] mmc: renesas_sdhi: Add max_divider field to
 support SoC-specific clock ranges
Message-ID: <avQ_r3gSdHgXeSub@shikoro>
References: <20261028-rzg3l_sdhi-v25-0-57f16691c2ed@bp.renesas.com>
 <20261028-rzg3l_sdhi-v25-4-57f16691c2ed@bp.renesas.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="eRN2m3VJbg1fMCn0"
Content-Disposition: inline
In-Reply-To: <20261028-rzg3l_sdhi-v25-4-57f16691c2ed@bp.renesas.com>

--eRN2m3VJbg1fMCn0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 28, 2026 at 12:51:21PM +0000, Biju Das wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>=20
> RZ/G3L supports a wider clock divider range than the hardcoded 512
> used by existing SoCs. Add a max_divider field to
> renesas_sdhi_of_data and tmio_mmc_data, and use it in
> renesas_sdhi_clk_enable(), renesas_sdhi_clk_update(), and
> renesas_sdhi_set_clock() instead of the fixed value.
>=20
> While at it, check the return value of clk_round_rate() in
> renesas_sdhi_clk_enable(). A negative error code was previously
> divided and clamped into f_min; now the error is propagated and the
> clk_cd clock is disabled again.
>=20
> Default to SDHI_MAX_DIVIDER_DEFAULT (512) at probe time when
> platform data doesn't set it. This paves the way for RZ/G3L's extended
> divider support.
>=20
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--eRN2m3VJbg1fMCn0
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmr0P68ACgkQFA3kzBSg
Kbb7BA/5Af/RDYwiViUf5wT/04w1QC2xoY8WHXtYeENo5CPm+Tk6rKRQ7+TtWkd+
J6m0aeT7yt0wrdA0nyp3Qk6NWsG3hiGZ038Bnz+U49wWEXldMvkmzT5nLo8zNhRb
krzOMciSp+yr8SuQuYEDUFMiznAWbqMXD9U4pRTIhiocJVjgCuNwDsKKFgt/OjUy
0X9360dTaB227NLS/TWzmgNUmBjWCV60WCriD3fqUowyNYbp1+fT7o3npDQB9bvp
nPyWwUeowfGjvLlZMkmuolPablKvNkiG6Eow0nz7XIzkItCMQSMft8I9zbpj8c1M
Nh5+cfAmw6O2wuJnWuowov+TWBxXUoRTW4N+kA3pZAYHo2CA5oE/zXgi9pee8nMP
YjehirkupPvY8Rr/4ZRfbGau7GAxrDy11U9uGCNX92W7Mm7GgSIGDRjbBsHl2H6p
2X1r6xFf5a8S2E6IRvk2rKGKHpk0Jnz+7O29kgUrJi9v4X9TbzLephRYbQKtIRth
0g+8C6oHfRz6jKKjHSxhvqcHl9Sb08RisuIMPb2jty9l7g+4pFFNV3B7c0Nx8zrs
sWUwVq+DLUteVY+gTI+Sjd2aAkOn6nOKkrEbZbXtvVPN74eqINmkWWIbI7sDm5p5
BC96Wy00dlgSCZZ51zIJSiNZ0f7gZDs0VbpluM1xzZdjcK/yV+U=
=X5ZG
-----END PGP SIGNATURE-----

--eRN2m3VJbg1fMCn0--
