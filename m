Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 168163E63A2
	for <devicetree@vger.kernel.org>; Fri, 20 Mar 2026 18:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774030691; cv=none; b=VvYjo/V91mVGDqgTNsU5+t43CNTyTcvT62bgRPvITyZKemo+T3p58mn/l5ZvmuK1KdG3n5eWG9Dor59ho8iE6zdPjqESyeWNLGWhqv2KXostJOT9y4hLStCrIpi2EP60+8i3mL+wNR1nGbHiQrVlY2LxqSJXrgMGktpps1mMuig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774030691; c=relaxed/simple;
	bh=TveWmGtGF+NJQXSywEPJlwFGnrefgR4bV3UdzJamrTs=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=t8162q2XLF2yUuRimjPXQ9fDY4JPraNVASy7l1wsyF4s5up/ofOO6hgD3gr93YGpcwMLbpsJJLEOacGBK0sCL6qtAn1qGZgZl8Kzk5TqKlh9EL9qZZAbIuWlvWLclvibgA88w+EN2w6TcUpvUaJbV/9crFQy7+4XzeVqAeYeGoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cXBmeHio; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cXBmeHio"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-48538c5956bso20197225e9.0
        for <devicetree@vger.kernel.org>; Fri, 20 Mar 2026 11:18:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774030688; x=1774635488; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gzgXZ3NiL5XfSi1Gl8c37CbUSVUYSABbSljKRuEeP+I=;
        b=cXBmeHioXEbh2o1U349rQL9HP8fHUf5F6ct2aryUjcp6BLhjFmXWqCLBzVBW5Wi13K
         iyEByVAbaHragCM875vXbtWe+wbIEkVy+Dr0GedhQQBFmLG6tHOHFpIdJhNx/YWewQJL
         kWIQkHfpxloYpwmcUa0VnRAXa4POJbbtNmgl3dKqau52ue/ff17waWkNVMUGZM8yLqVO
         b08Z08s5E1l3J4cdExrI5r6zh4I0MD80+DgnU3gRwOcpFW+XMWL3A/Oxm8UWhy3YOs11
         X6B0gr0frgGK2iImaYYTVxeAYy3q8wmoxP5XN8pto8bODYelG+ypInnO8l/TYzYOloVs
         t+kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774030688; x=1774635488;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gzgXZ3NiL5XfSi1Gl8c37CbUSVUYSABbSljKRuEeP+I=;
        b=fGoMyqvVaWwVrF/EJk9rUycnNeuGKogkkFztY8d5JUgzmL7g7IJJEms6Q7jxTgLVC9
         h+VeYEwKaK+RGXKZuFA6tQOXpz2Ejs8RDps0ny9jaAl/gCijpOXQyygIWb8KHYniCqvX
         +GWzrJ5n9T7urmEP3oEGWTAlfYPIaxy41xaThVKtJ2ko15GagjbLfFqX2+iHX69uzCMY
         ncVEkS6mk0ckbwS909eId+Jo8z71QI5//mH7sinfPBzRwar9SSGPQPUIq52Frd54kFiQ
         dd9F218MaG3iNKZGGfVy1wsPinBYqopNJ1O+ZzII5QPSpqdJvYoR4Zw0wYQJML8HWcQT
         S/9w==
X-Forwarded-Encrypted: i=1; AJvYcCWh5Rtqg5PidZrcuas80yZXHmzzMQDnBYTzwbinRAjgXAZ+grN3wLhYyy/UYSXXT7Cmq+l2mtRIwCrA@vger.kernel.org
X-Gm-Message-State: AOJu0Yzl9tQFjU6ncaU57D6Uz7AceW0KjnuzI9t/o55T8Cq0i6XVN4mo
	O0cbkixobdlhOpZdQjMp4J3TGbuG5dVj43H4+MvkR5MDbjFpnbnSKJN3
X-Gm-Gg: ATEYQzw4vIoR5yNfR4lH9YOYFXEcvVZdUlY+l0vYojDXHR/XtAq6xlm5vz7p84Sqe4/
	D/eElAYhglfnfLEGd1n+i9P2QXNwWzJjJC/hQdJL6pDtsFeSEgQfrnnmvikKJHrBoKdkfk1uEsS
	QpBsHLW2ofLGSblQsr88y3+T+UKxxh58HIsZR2gfgX5wZQa0xKRkvF401wfCiZr8GXcxOPLVJo5
	v4qCLqZaYX2xZNi59TRVnHirVlBG7ZU5kAyGLDLm/dzKqZTBN1WKtFmZwudmUqNFxcwJ/I61x/d
	mDH8C2zkwIQdpWYw8r4/yyfWGkObDsYlCIi+gXs1F5sXFT/mCZ4fKgEStbNGXV53RA0wzjF95e5
	yslwcBdA8yEs5BDQhEl3JFVW2TAC9SGUPo83kt25IDERNkuerwe/QzHP+TwMngmmgppi2uTpbVM
	qx1h+BClVTJJ6xfc1uMvWnDAm7XI4kLtbPjo0t+IturGG3FxCXWROr6Ck=
X-Received: by 2002:a05:600d:8449:b0:477:9890:9ab8 with SMTP id 5b1f17b1804b1-486fe8a2bafmr52731085e9.3.1774030688082;
        Fri, 20 Mar 2026 11:18:08 -0700 (PDT)
Received: from smtpclient.apple ([2001:912:1ac0:1e00:48e8:da36:b41d:78fa])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-487031790fdsm12424335e9.3.2026.03.20.11.18.07
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 20 Mar 2026 11:18:07 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.400.21\))
Subject: Re: [PATCH net-next v9 2/4] net: phy: realtek: add RTL8224 pair order
 support
From: Damien Dejean <dam.dejean@gmail.com>
In-Reply-To: <20260320082156.GX1753385@horms.kernel.org>
Date: Fri, 20 Mar 2026 19:17:56 +0100
Cc: andrew@lunn.ch,
 krzk+dt@kernel.org,
 robh@kernel.org,
 kuba@kernel.org,
 maxime.chevallier@bootlin.com,
 pabeni@redhat.com,
 netdev@vger.kernel.org,
 devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 edumazet@google.com,
 davem@davemloft.net,
 hkallweit1@gmail.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <46FAC4A6-9462-45BC-B17C-B7F5F19F0ADB@gmail.com>
References: <20260318215502.106528-1-dam.dejean@gmail.com>
 <20260318215502.106528-3-dam.dejean@gmail.com>
 <20260320082156.GX1753385@horms.kernel.org>
To: Simon Horman <horms@kernel.org>
X-Mailer: Apple Mail (2.3864.400.21)


> Le 20 mars 2026 =C3=A0 09:21, Simon Horman <horms@kernel.org> a =C3=A9cr=
it :
>=20
> Checkpatch warns that ENOSYS only means 'invalid syscall nr'.
>=20
> Looking over the implementation of of_property_read_u32() it seems to =
me
> that -EINVAL is sufficient to detect that a property is not present. =
Which
> may be appropriate here.

I added the check on -ENOSYS because in v8 Jakub commented [1] on the =
fact
that if the kernel is built with CONFIG_OF=3Dn, of_property_read_u32() =
will
return ENOSYS. If ENOSYS is not handled there, then the call will return =
an
error while it shouldn=E2=80=99t.

Damien

[1] https://lkml.org/lkml/2026/3/17/2464

>=20
> Likewise in patch 4/4.
>=20
> Using a quick grep of the tree, I do notice the same pattern as above =
is
> also present (only?) in aquantia_main.c.  So depending on the outcome =
of this
> discussion it might be appropriate to update that too.
>=20
>> +
>> + if (ret)
>> + return ret;
>> +
>> + if (order & ~1)
>> + return -EINVAL;
>> +
>> + return rtl8224_package_modify_mmd(phydev, MDIO_MMD_VEND1,
>> +  RTL8224_VND1_MDI_PAIR_SWAP,
>> +  BIT(port_offset),
>> +  order ? BIT(port_offset) : 0);
>> +}
>> +
>> +static int rtl8224_config_init(struct phy_device *phydev)
>> +{
>> + return rtl8224_mdi_config_order(phydev);
>> +}
>=20
> ...
>=20
>> @@ -2395,6 +2457,8 @@ static struct phy_driver realtek_drvs[] =3D {
>> PHY_ID_MATCH_EXACT(0x001ccad0),
>> .name =3D "RTL8224 2.5Gbps PHY",
>> .flags =3D PHY_POLL_CABLE_TEST,
>> + .probe =3D rtl8224_probe,
>> + .config_init =3D rtl8224_config_init,
>> .get_features =3D rtl822x_c45_get_features,
>> .config_aneg =3D rtl822x_c45_config_aneg,
>> .read_status =3D rtl822x_c45_read_status,
>> --=20
>> 2.47.3
>>=20

