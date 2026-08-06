Received: from sender6-op-o11.zoho.com (sender6-op-o11.zoho.com [165.173.180.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 070082E54D1;
	Thu,  6 Aug 2026 19:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.180.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786044713; cv=pass; b=qV9Xhy19DSTnk2zDo7n18rKef4rRxQy6MOjN811DuQWFh/+NeiW4t/xW2/cUXLXVavnVAj1aXN+x/SRFkTei3NpGXezlwekqlrvwbAArBSDZXSEHdB9GTICfEtiTpQiNZdc9bejGAeJ0rrD53j3+2xFF/VfechN2w+nOJoSNQb4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786044713; c=relaxed/simple;
	bh=wSx2PHsXXPRUc5CoAh3zS5bdEivdseHmyBR9wGmrgWA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TapVRYdIZvck7LJOChgFxqmbuDKycgSVZEehu0VC34kZT6sz/caYGIGXCmH2b44U3qCI5vm4KObWTA7s5cU5Z4AVuvr+VjVlc8nFo/pbiFErVcdTHwYiJ6Wq2+xpE6yhrnyj1w899rY0uwVmnpwF7CgUy+zl+N3UnJpAQuWFEFs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.reichel@collabora.com header.b=aoxkuusv; arc=pass smtp.client-ip=165.173.180.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.reichel@collabora.com header.b="aoxkuusv"
ARC-Seal: i=1; a=rsa-sha256; t=1786044688; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=QbhQQK5Qr76DMi6yS8H3nY4dOLEyEBRXaMEeVxntkQIlfvcEAMpu+Zjdo/1pW9LPZfnMzBgzOZnGA2EjOrNSd3urmvMX1f/bS7fGn7Vi1IM5YZGBZsVg7t4VLGEjQJzD3BYQzK8ssM+lZpUMTAxuULrGbQT5TVuregrX8L591aE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1786044688; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=KRFUt8vbxGVxS0Eb12cKI5Ku5Kct0AiAebJDdp3PYHI=; 
	b=fLgLLitrnam1I91DwCOjV6gsXQGusQsm31qwkKELJ4t/9A5SjJ5xZHHYkWCGyBkttJL2rdzzUr0ctHf8RefWlMQJgRJ1ASu0TYItnjWwQ5I5bWcjskudyEzFJXTo/X02z/Om4NkTH2dOf7PcG6BOJI+1s9yaj6S1QeEQqQPlFA8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
	dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1786044688;
	s=zohomail; d=collabora.com; i=sebastian.reichel@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=KRFUt8vbxGVxS0Eb12cKI5Ku5Kct0AiAebJDdp3PYHI=;
	b=aoxkuusvivCzLAruUdGcjh8VDqDYVW6szKx2tBXsgvEVUbHn89bXjJrdfm0t87K7
	dKpsttje4k1J99rqBbEdy12KoFKyy0CRNWIitGKiz/wxCqx1sjPTMK81QXwmeozq7oA
	nHYS66ymcTuRxEvh9risAfgz/lQv0iMwe49Et6nQ=
Received: by mx.zohomail.com with SMTPS id 1786044685919282.93021641986775;
	Thu, 6 Aug 2026 12:31:25 -0700 (PDT)
Received: by venus (Postfix, from userid 1000)
	id AA8951808BD; Thu, 06 Aug 2026 21:31:20 +0200 (CEST)
Date: Thu, 6 Aug 2026 21:31:20 +0200
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: jason98166@gmail.com, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Guochun Huang <hero.huang@rock-chips.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/4] phy: rockchip-samsung-dcphy: factor MIPI D-PHY
 power on/off into helpers
Message-ID: <anTgZiqnol4226Le@venus>
References: <20260726-dcphy-rx-v1-v2-0-cf9cc34a412a@gmail.com>
 <Ji-6adk9LJbP87Y7X6SfOcAyVnGpO4dbHk0lBikX3NGAPz3dynWpvL8QjkVM3G3jEnwTrTV0p7nOqBxPRaH0MQ==@protonmail.internalid>
 <20260726-dcphy-rx-v1-v2-2-cf9cc34a412a@gmail.com>
 <43327fb2-0085-4d86-b408-8723d852c258@linaro.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qplt4v54nyb6hmut"
Content-Disposition: inline
In-Reply-To: <43327fb2-0085-4d86-b408-8723d852c258@linaro.org>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-0.2.10.1.5.2/286.26.37
X-ZohoMailClient: External


--qplt4v54nyb6hmut
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 2/4] phy: rockchip-samsung-dcphy: factor MIPI D-PHY
 power on/off into helpers
MIME-Version: 1.0

Hi,

On Thu, Aug 06, 2026 at 05:17:45PM +0100, Bryan O'Donoghue wrote:
> On 26/07/2026 15:55, Jason Yang via B4 Relay wrote:
> >   static int samsung_mipi_dcphy_power_on(struct phy *phy)
> >   {
> >   	struct samsung_mipi_dcphy *samsung =3D phy_get_drvdata(phy);
> > @@ -1368,7 +1376,7 @@ static int samsung_mipi_dcphy_power_on(struct phy=
 *phy)
> >=20
> >   	switch (samsung->type) {
> >   	case PHY_TYPE_DPHY:
> > -		return samsung_mipi_dphy_power_on(samsung);
> > +		return samsung_mipi_dphy_tx_power_on(samsung);
> >   	default:
> >   		/* CPHY part to be implemented later */
> >   		return -EOPNOTSUPP;
> > @@ -1383,16 +1391,11 @@ static int samsung_mipi_dcphy_power_off(struct =
phy *phy)
> >=20
> >   	switch (samsung->type) {
> >   	case PHY_TYPE_DPHY:
> > -		samsung_mipi_dphy_lane_disable(samsung);
> > -		break;
> > +		return samsung_mipi_dphy_tx_power_off(samsung);
> >   	default:
> >   		/* CPHY part to be implemented later */
> >   		return -EOPNOTSUPP;
> >   	}
> > -
> > -	samsung_mipi_dcphy_pll_disable(samsung);
> > -
> > -	return 0;
> >   }
>=20
> This looks a bit funny.
>=20
> Do you have an int method() {} with a final path that returns no value ?
>=20
> Tooling/compilers will definitely and rightly complain about that.

int function() {
    ...

    switch(foo) {
    case 42:
        return 1;
    default:
        return 0;
    }
    /* cannot be reached */
}

Greetings,

-- Sebastian

--qplt4v54nyb6hmut
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmp04QQACgkQ2O7X88g7
+pr/lg//Ra9D/4mEe+23YNBGY2KkyTz3Kh/UKQ6OxYCuYq6/KXl3KXhmcfxSrMCw
LAY8oiDCpyYprafpHYgPB8D4G6QF1hM9jvnljK5tdlvVWl5iMnhNL7keps/ulLWV
8V9D84pJ3mQFwsyJw4f9AwuncrQDF8jULin/bnmypnMx9pP3mGgs3xDKT0jERvnq
CKWMvbQ2qjG6PA5uTV+79VAwEi9ymTwFoJQ4wtD24f1CGf3YAXdiUwfUTRLfbk8y
tHHUvlo0egFImbXOiHF1WloCw+xmB9Wj6GOItvyHiYn/zLmxACC3PaqYN3UNZToC
dIKms9WG9QGmNFiVeTBWlI0UOXFI74pF64MTsGvyBL2KB1cGnMmgX1/bV7LZaMWx
uOM14+SPi1qeixksaFXvXGCA+mnMj5TrCrZ9jSfjdWFah4qbWgBDdQx8k6BvJlIa
nrl+OYUi7gqIs5G7I7REMKl8Iv6VIwEwJ2otkuPvmBDMYgKiVrgVqdQACW3f46Nw
8ZCrOd64PS6YmkTBhbbMLl8Xgdpdcp2O3Z0Fm/Xjj4YcCAM2gOmqzpzfddjC/hy1
pITrCjZx28c28rZADa4qX2M/ajJ6YchOv7JOFKg383BS2VbspNQY+B1qIa87xmDi
lBygOAkvPexuGQ9ceVc1NSshAG/Ks/hyggKgMqNiE9UjfY58ixc=
=OkYa
-----END PGP SIGNATURE-----

--qplt4v54nyb6hmut--
