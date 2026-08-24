Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9065D3F7882;
	Mon, 24 Aug 2026 10:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.200.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787567997; cv=none; b=XZP+u2Fjyh1iSDVlt/FQ5DU7MTTKfEWNusi40/vt/90yiiME/QKcVBeuTkpeXTGgb8yZIg0tfaj97GAeIaZiojZYlAeJnECOhvjdXjW4awidqLk0ke4Gcf2O3nkyiv7u97Twtu7Mu2E/QR+Hvnby9In+dMyFugP895Y1v/yx2cc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787567997; c=relaxed/simple;
	bh=900P2PC+wSu8Wlib/tD7n7W4V8IlZK1JlyraA+1xLwU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J69Yaoiobs4kCGUdwZFsvpTonmqhr8yxLjAEpuzvejgstg48KcMWceUZ2mM8NitoXgLwIpmtqI8GJrSw5ytPymKJLD0r5LHp8ybswYioGPvX1SFiy3Gg99I7F3SYcHdMEc1akwjIyYK0WPnVtiN99Yqw8zh6HM3hxMXCdr7yqJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.200.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 890CC201917;
	Mon, 24 Aug 2026 12:39:53 +0200 (CEST)
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mkl@pengutronix.de>)
	id 1wyS5p-0035gX-1U;
	Mon, 24 Aug 2026 12:39:53 +0200
Received: from pengutronix.de (p4ffb23c7.dip0.t-ipconnect.de [79.251.35.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id 26F6358B2AD;
	Mon, 24 Aug 2026 10:39:53 +0000 (UTC)
Date: Mon, 24 Aug 2026 12:39:52 +0200
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Zi-Yu Chen <zychennvt@gmail.com>
Cc: arnd@arndb.de, olof@lixom.net, soc@lists.linux.dev, 
	ychuang3@nuvoton.com, schung@nuvoton.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 RESEND] arm64: dts: nuvoton: ma35d1: add CAN nodes
Message-ID: <20260824-smooth-jolly-sponge-ba4b95-mkl@pengutronix.de>
References: <20260708082457.460710-1-zychennvt@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="orpiuns42rsyvflb"
Content-Disposition: inline
In-Reply-To: <20260708082457.460710-1-zychennvt@gmail.com>


--orpiuns42rsyvflb
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 RESEND] arm64: dts: nuvoton: ma35d1: add CAN nodes
MIME-Version: 1.0

On 08.07.2026 16:24:57, Zi-Yu Chen wrote:
> Add controller nodes for the four Bosch M_CAN blocks found on the
> Nuvoton MA35D1 SoC.
>
> Additionally, configure pinctrl and enable CAN1 and CAN3 on the
> MA35D1 SOM board. Also, update the APLL frequency to 200MHz to ensure
> the CAN controllers receive the required input clock for 50MHz operation.

50 MHz is an unusual CAN clock frequency. Better use a multiple of 40
MHz. Within the limits of the m_can IP core, the higher the multiple the
better.

regards,
Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--orpiuns42rsyvflb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSl+MghEFFAdY3pYJLMOmT6rpmt0gUCaowfdgAKCRDMOmT6rpmt
0mIAAPsFglUP+fkdaOYrAYAkWdF9FEg7F4iWq6H/hk8EI1q70AD9EjWExtou8CWm
bUAesYOpNW53On7fiKeR6VuPs+71UAw=
=L8lk
-----END PGP SIGNATURE-----

--orpiuns42rsyvflb--
