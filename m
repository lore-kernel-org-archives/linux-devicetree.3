Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.117.254.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795711611;
	b=3Zi88T7EIDigrKbdWiJxv637G/Ama7s7EghaYOrCjFTDwShQm2LR7266dyeDgQi7cJDY
	 ZQ5FUySjixuaJOebzOHAYdXCbFO2Ql+HZmm00BQvwZhPSmp6KQsMwA8ePy+2ihQi2Lsau
	 dqap6hpQLSy4fnM1A8rFgzGN+ZNCkirbDxAKizk7oNttvcxCNNMiBzQJbMDc4pWinKNe/
	 uWzUEQsqAQiSKrjcdVp9e4PRMkQ06r7hNHLIQP0EF1Io8RuGHtHL12joy8t4v8hzKYgRq
	 i2+cDFL5Lv3TmP8lxUf1F74Uay8ekkEL1qaoypiME4/X89FBN2Pi/MXdVcswWj7WfEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795711611;
	h=DMARC-Filter:DKIM-Signature:Received:Received:X-UD-Smtp-Session:Date:
	 From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=ssl/gQ24zAnvrKn3wfey5FZaIYLB01/ilqM+/OBq/bs=;
	b=iL4pAL7zoZbyuiR/qOIYC79HiYtbJsar3HRNPz10J2wxHJSBcrw7KhNg7UbeF6WrDpcl
	 YXofTYDdUCpBI7QVpREdqKfJqvpb/1i3IZb0YZHgKQpVVOMnhaRe7fz7FxpPipeX5sYUz
	 N9pV5q+Sr2nTFT4uuVOoEQ99q/zf48Yw8vCYdiPE2nNz1I83bpQu2Kq9pivLil2bD8XBY
	 NmPkvyW2HLQkgrmwqE4Tiuk+mesLtrqNZq0OBQI3Q/ZqX0cNeoEhaIrLrhvsWuYL7CoIm
	 XqU5TOR7HaxsoOo4FUP9WLt1e0AuWjQfmOuVpuVTgzzHw8zcF0o+6VMH+secxFBN0Sw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=sang-engineering.com;
	spf=pass smtp.mailfrom=sang-engineering.com;
	dkim=pass header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b="YV/VkjWu";
	arc=none smtp.remote-ip=194.117.254.33
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A80CE606A326
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 16:46:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A80CE606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=YV/VkjWu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=ssl/
	gQ24zAnvrKn3wfey5FZaIYLB01/ilqM+/OBq/bs=; b=YV/VkjWuivQRx4JrWSI1
	9Vn1jU94k6lIKYhilNDU6+3rqqLm/lkDcuMdIQwiNZG6WZKUhZe/Hz/Xo6iI0ekW
	X50wN/L8r6t2TCGK4y1o+aU/nZrKH/9/KZBS1knGLK1dOkLmNfnQ8X7jFb1OtN53
	onButIvAZ6VOr6TqE24bVTSqwjLk0pCMkmSTtcj3FvI97kyYy225C+AichiXrO/u
	fAqDd/jYIQvER+eBcKCKG+RU0wMTgIvUxn8vanbtHevTcO7sH8BNaMvON6oWtjQ2
	jBNg6WyGbUPFTH7Z7Y2GVUdjka61Ra6cz52K3rcEG7tZV9izmbvT5sT2XcH6Gvw7
	aA==
Received: (qmail 1637125 invoked from network); 26 Nov 2026 17:46:45 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 26 Nov 2026 17:46:45 +0100
X-UD-Smtp-Session: l3s3148p1@Ao5WsDBh8toujnv5
Date: Thu, 26 Nov 2026 17:46:44 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: khendry@reliablecontrols.com
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/3] clk: renesas: r9a06g032: Add reset controller
Message-ID: <awhicMkIysHljr04@shikoro>
References: <20261126-rzn1-miic-resets-v4-0-4f73af81d779@reliablecontrols.com>
 <20261126-rzn1-miic-resets-v4-2-4f73af81d779@reliablecontrols.com>
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
	protocol="application/pgp-signature"; boundary="xmfzo9YHvsZCNSrG"
Content-Disposition: inline
In-Reply-To: <20261126-rzn1-miic-resets-v4-2-4f73af81d779@reliablecontrols.com>

--xmfzo9YHvsZCNSrG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 26, 2026 at 08:11:06AM -0800, Kyle Hendry via B4 Relay wrote:
> From: Kyle Hendry <khendry@reliablecontrols.com>
>=20
> The rzn1 system controller has two resets that need to be cleared for the
> mii converter to work. They are not directly associated with any clocks
> so they need a reset controller to set them.
>=20
> They are documented in the PWRCTRL_SWITCHCTRL (0x4000C188) register as:
>=20
> Bit 3: RSTN_CLK25 - Active low Reset for Timestamp signal selection logic
> Bit 4: RSTN_ETH - Active low Reset for RGMII/RMII Converter (50 MHz).
>=20
> Add a reset controller and add resets for those bits.
>=20
> Signed-off-by: Kyle Hendry <khendry@reliablecontrols.com>

Kudos for adding the comment, too!

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--xmfzo9YHvsZCNSrG
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmsIYnAACgkQFA3kzBSg
KbYDpQ/+LhlHS62LFJKv8RGRxltBy3PkA2QZE6EnjtFw0TZ2Sm4r3SUQW3WSo2AH
3DtkIvxmRQvrjwUyqc/CmS17RbOA7RfxxBVquvSNzwxfpBtLHfZrgaGLYMFRUDb0
Wy1g1VNDwaPXAQemiLoTdPf0tdJkxsasiueiEQitXd10DjnQ4Tzab2RVHZmewQ1q
Cp7Jc/FbpsVG2YYfpIS8mgjqBoSdLkjRO7mCWa7vzhT1INUv14V25qcbwO9c788e
E8iJqWZhaLSNsnWrEZQrG1eTjHKW9FTJDo11d1vd41l9Bd5KlRQIdiMEs8Vafn90
NGetlPQHH8lnldJEt+TLCwak3lehhV5r6851sauXfhDjHLq8/FJFwOl2+VIwjnD/
MxAvEJJsCbt/IYyjkQZNQxuXUC47L4CjxTSRMgkHDD7W7X0ZtjnMtmM8aPlBiR+n
cYC2gGwyqcgnT7ZrpGJS0OTRhUhAIWHz3ve74Ef16IbXLlftmEIcbFuPkCHSysVT
14LnIIM94v2V4L4Q2FtYRV+Tl+MX5M3+RSZHJX0esygsLlyQJN/XgAKcdKJu62jy
EPLhNVOVqme4u+9xmK0pFiqFS8pHESfylqsX8Fqu6LrGnadqPD59rERzyU5mgvwQ
+lbMBhM4RC/JHvqusFj5YILKuwViqr33jvkYf2UZrdLShBSvxMo=
=OzO3
-----END PGP SIGNATURE-----

--xmfzo9YHvsZCNSrG--
