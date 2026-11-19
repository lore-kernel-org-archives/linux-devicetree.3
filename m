Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795124087;
	b=u84k36NqgxN/OcJiiZYWPZ9V2u/PRMXa7GKqoXUYrUkk93Qq4uNL2KKSrZWGVt508HAe
	 T2/SDnDQWBu4aTau9ZUpAsAMLqq4JqEEOaOKCFN1x3LuMSq9/ptB6RjsUa15aioazrjGs
	 KAcXyWw+2seY8fPvIx+HYXI6Td61wxZxCP4YBmAvFwseypCnltz8ko6iY0hjI2i29GRWp
	 KphJ8ZNbjxVRcvSOZnHPfUFVnAjeIOTSESFqbOEff7Q3I37Rxqu/wXGYMtGgG71ZDaKzG
	 IKW/S3/GF92qvXNvbXloSNZ2TyZw5ddCc8+SfKUEYRDrDgXxHIzS1shMHMBnvl0PSUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795124087;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:Autocrypt:
	 Content-Type:User-Agent:MIME-Version;
	bh=4PLRPYEt6tusU5aT1XxZRjXDBd+sz/kTb86+H3nHWAk=;
	b=lI51ObSuh9BNRwtUhTrYx1xRMyldEnLMMUPwUr1JZu514VEyIzqM5qJMSUeTwF8YNuwP
	 ppMP98a8k2jnmJejAnG+rOOKUnMSpgmD0QcO46x5VV0lAG/TLm/dfua8AAKCMxPcUgIRH
	 WxGPhnfWpBeyE8eS7/CV0kr9mhc9bkTkeHWaRS07cdt/K67pT6UE1l8xAtdLmgIk0tBvl
	 K/KfgIDL8mLGS8tyPCsRBLqj1lzsO4u0I1bgLqsEU8hnKdplMrUa29T9r3+RBsbvCodTv
	 j/oRO9ieSbVUjPrlpyzXIP9M9ZTce2eVXzQmP+cR7THLYw+fZn4Vpp+sEzD0YZnKMdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ndufresne.ca;
	spf=pass smtp.mailfrom=ndufresne.ca;
	dkim=pass header.d=ndufresne-ca.20260707.gappssmtp.com header.i=@ndufresne-ca.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Y8sx7kPy;
	arc=none smtp.remote-ip=209.85.219.41
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68DF0606A320
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 21:34:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68DF0606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20260707.gappssmtp.com header.i=@ndufresne-ca.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Y8sx7kPy
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-92130d3ee15so3298476d6.3
        for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 13:34:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20260707.gappssmtp.com; s=20260707; t=1795124086; x=1795728886; darn=vger.kernel.org;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4PLRPYEt6tusU5aT1XxZRjXDBd+sz/kTb86+H3nHWAk=;
        b=Y8sx7kPyic2bavNpYGzSAMzW7BhhRL2PGJcSKHRBkPf5/Trq1xstO2LrxtRD/bBuri
         Fvnk/m9NSmAqfhFe8fDYY1SicQ8Gnpgu8EX2hSZKXfxtLXTuDTUC+qsg1bf3uqONy8HX
         SOBV2hfhNRFqgHrqTQeR2YZLmxhtMM/R29gf94ENwutwWmtoODGK171+MypP9yG3YWWt
         EWRiMEQCIasBhNe2fIDCpV/UsKMtd9iMw8WYsj2BUo3UirKDUbRdh97YkUfXYe+LA+Gd
         Rn6NaLGA55uJXRF7RYkFQ6ch52AFMBbj3+QraZGCtbb0yiH+DB9bZ1ZGl2jHdJUd1x3d
         woGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795124086; x=1795728886;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4PLRPYEt6tusU5aT1XxZRjXDBd+sz/kTb86+H3nHWAk=;
        b=Lt7cMEroNrcVS9KSRQ+4ubfvyd43o9rTw6nbMeUYqbQxcf9Ac4GqLOooPIJKW1RR6V
         c9+keb0SCWCuMNuSKWHC9g7xcHKjwhWuOSxMcK8Gmm1dpDEAvtMwNIR8A9VogLD9Vx2w
         sXVdyxXOyfspMOEUJcWQo09XP8sNJUncHnPG447btqWHA704CcJoxLgs1nNdENqYdpz7
         DGkf020U/FHBfDd/m3kWBPhRus07D3kdPn4qHRzP30pfPYrjQjSgopVlxnYj/0l6CXIA
         JqwFgx/lLkmKzmSwI+XqAJEx4XenPSJABDaza7me8MmcKpx++3bWW2DU+RoVEtTzED3P
         aiPw==
X-Forwarded-Encrypted: i=1; AL+hErHTPksxxQL3U8EEOg93lmKzgxzJA1vdE1sClXGBVp8IqDIm/g8/jSGUy13QSd8lwnyt6gHqSL4wl/zZ@vger.kernel.org
X-Gm-Message-State: APuU4Z9F4nONlE0CZYDAYEsylzKwKdEKnDetGNXOZ6yeWoIS+l8+86FS
	M14NyRPknGqB7M/BAH5aY2diHZGLH9IrKaQ9seiju6VTCeYCkDTtSjQ0rfO4vgxSpRQ=
X-Gm-Gg: AZFdTZftogcD0pLc26AAqGznGgVTLEQdoJhtZDqSO1Sfk7pu+mEnbQFdDfeUzGBr3J6
	/wcxi5Ym5WA2UxWa2qAUzZ4zA/z/x/nnB2FDa06SQhIFHvHquTK7xgXIkKhRfGQ1JuyySTlKrAL
	2E/uC7zk9fwPlh2YGP0+GTtLS4wVdIbK7GDHKj4m7crgzG08LU8+hYA440G8zHkS1q8/yq7ldom
	SI5gtAaVzurNEi/2q4houXBD3nqF59729iAdOTvFtEwsmXvvM2EXz2g58yRk36StL756DAFZT+T
	5K2jS2i6OZhbJxm+PaELHjOSrr41zlBjLet4EuRMHUxv17kHeU0pE1B9Y23U+D3Bc7kiErT87RS
	mqvEOTeziLgmwl4GLOviYSat4N0billR65VvCZxrfNeZnD6UdBryL9rj8Roiv1ebiJHJkLlIssC
	OiphfgYXMXQ8juteQm9Ax099Ziyoa8cDdMmYk2ZynDegZIwllaIVrqrz0gHNM4i/fUusANMa9hY
	FlvoS7UwPsMDKz5bWQufRceYOb4irxcWnDxLH1LqrU4tiMbYngbrXudjVt9+qKl9Jh3lG5/HqRz
	Ggu+yKEU11QvnpoCi20ZOXUxD/FdXBvJYZABuqk+A681PeG7ZSQOe1I=
X-Received: by 2002:a05:6214:85ce:20b0:920:fd33:dfde with SMTP id 6a1803df08f44-92134aaeb65mr13172176d6.19.1795124086320;
        Thu, 19 Nov 2026 13:34:46 -0800 (PST)
Received: from ?IPv6:2606:6d00:11:8ec9::c41? ([2606:6d00:11:8ec9::c41])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-921349b1e58sm8767676d6.12.2026.11.19.13.34.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 13:34:45 -0800 (PST)
Message-ID: <0fe8752a8e772928ed9c86b022b4770a5c65a05f.camel@ndufresne.ca>
Subject: Re: [RFC PATCH 10/28] media: mali-vpu: add firmware cache
 infrastructure
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Charvi Mehta <charvi.mehta@arm.com>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh@kernel.org>,  Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Philipp Zabel	 <p.zabel@pengutronix.de>, Vincenzo
 Frascino <vincenzo.frascino@arm.com>,  Rathinavel Sankaralingam
 <rath.sankaralingam@arm.com>, Shobhit Pandey <shobhit.pandey@arm.com>
Date: Thu, 19 Nov 2026 16:34:43 -0500
In-Reply-To: <20261119153758.1426673-11-charvi.mehta@arm.com>
References: <20261119153758.1426673-1-charvi.mehta@arm.com>
	 <20261119153758.1426673-11-charvi.mehta@arm.com>
Autocrypt: addr=nicolas@ndufresne.ca; prefer-encrypt=mutual;
 keydata=mDMEaCN2ixYJKwYBBAHaRw8BAQdAM0EHepTful3JOIzcPv6ekHOenE1u0vDG1gdHFrChD
 /e0J05pY29sYXMgRHVmcmVzbmUgPG5pY29sYXNAbmR1ZnJlc25lLmNhPoicBBMWCgBEAhsDBQsJCA
 cCAiICBhUKCQgLAgQWAgMBAh4HAheABQkJZfd1FiEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrjo
 CGQEACgkQ2UGUUSlgcvQlQwD/RjpU1SZYcKG6pnfnQ8ivgtTkGDRUJ8gP3fK7+XUjRNIA/iXfhXMN
 abIWxO2oCXKf3TdD7aQ4070KO6zSxIcxgNQFtDFOaWNvbGFzIER1ZnJlc25lIDxuaWNvbGFzLmR1Z
 nJlc25lQGNvbGxhYm9yYS5jb20+iJkEExYKAEECGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4
 AWIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaCyyxgUJCWX3dQAKCRDZQZRRKWBy9ARJAP96pFmLffZ
 smBUpkyVBfFAf+zq6BJt769R0al3kHvUKdgD9G7KAHuioxD2v6SX7idpIazjzx8b8rfzwTWyOQWHC
 AAS0LU5pY29sYXMgRHVmcmVzbmUgPG5pY29sYXMuZHVmcmVzbmVAZ21haWwuY29tPoiZBBMWCgBBF
 iEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrGYCGwMFCQll93UFCwkIBwICIgIGFQoJCAsCBBYCAw
 ECHgcCF4AACgkQ2UGUUSlgcvRObgD/YnQjfi4+L8f4fI7p1pPMTwRTcaRdy6aqkKEmKsCArzQBAK8
 bRLv9QjuqsE6oQZra/RB4widZPvphs78H0P6NmpIJ
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-n9uFvmouF7zu3p1k930u"
User-Agent: Evolution 3.62.1 (3.62.1-1.fc45) 
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

--=-n9uFvmouF7zu3p1k930u
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Before I move on, since I think you have enough early feedback,

Le jeudi 19 novembre 2026 =C3=A0 15:37 +0000, Charvi Mehta a =C3=A9crit=C2=
=A0:
> +=09n =3D snprintf(name, name_sz, "arm/mali-vpu/v%u/%s%s.fwb",
> +=09=09=C2=A0=C2=A0=C2=A0=C2=A0 key->fw_ver_major, codec, role_str);

Your firmware will have to be published into linux-firmware project for you=
r
driver to be accepted upstream. Depending on the state, feedback and clarit=
y of
your driver, I may or may not ask to ship some HW to verify your work. No
immediate action needed. Since you only offered a generic DT binding, its n=
ot
clear what upstream SoC can actually make use of this driver. Some informat=
ion
about this would be appreciated in your next cover letter.

Nicolas

--=-n9uFvmouF7zu3p1k930u
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCav9rcwAKCRDZQZRRKWBy
9GkqAQDLRsHeO/IVaaYhuSlkJJ24RnPJjWX8LIvZrnkoUg8JcwEA46uq+Ds3k1yE
6EXC6M9FaZzEw7VAybZv0GKKCISBOAU=
=n32o
-----END PGP SIGNATURE-----

--=-n9uFvmouF7zu3p1k930u--
