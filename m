Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16291394E93
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 08:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787558687; cv=none; b=aEv0WZGhDZ33mSQOvy6nProHco6xbpzMsZO89q24AfFFmOgKdfrBSnuqlofvFw5B7bztKzoJQ4Mtw7LVy4DNr2bhoWSaQCxe9w68R14OW5uuNon4BG6nPbCaEAXa0KcyoLvJrQTEJvJWfPqP1jg6s3rolEA99GOYH4VBMgpMBkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787558687; c=relaxed/simple;
	bh=XDNP9sGNVSgP4Ks+3cqzP4wb+3fLYzkvYqb7oZQQZuU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DicVgadoc6ynx857sxt/gKlWZn3QU1sfx83IKbMe/KCgMddmBBgF0WgwHIK77TDdixU1MOMSZB+KrOJACusMQwdKi9P9U/ET8OsLLf7NEErS1ESKhuuUt2qesusr6IS2BmYeEFWgneMSnfy+hnESiLtoMpS3FATN6CxCXvUmtMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=P8FuWRWA; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="P8FuWRWA"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-69fc9f25118so3361074a12.2
        for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 01:04:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1787558684; x=1788163484; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XDNP9sGNVSgP4Ks+3cqzP4wb+3fLYzkvYqb7oZQQZuU=;
        b=P8FuWRWAq2MHs3OI2eP9+Okl1+YHH4ViS6lJzRnnxTewsZ95u6aou5gQ4cb1eoD/v/
         G5u/kaA3SRvTik/wXFWjJxY9eXb5F6oR8foWZMyLv9rF0kYtzBW94ESdhXALNNJtqABP
         PBsWRchdV7cfhK0rswlBXwNKZ7/echGBOlJhdKUwfSogiFYkI+AITpEvPZ0TobsTw+oW
         xJ5/SSbCWTbouT4KFJ7n3RCzuuM4X+LOgvuGxowts+pkmFkjyZ+Yq9F3uJ92wpE1yM4M
         tiqp6Ti2fQJPtcZNBAEYUD8gjqMH1rLiAoG/vza6x38a00dMItANwlBGaCPSX+peDivN
         3DBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787558684; x=1788163484;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XDNP9sGNVSgP4Ks+3cqzP4wb+3fLYzkvYqb7oZQQZuU=;
        b=ZB38MZvkg6QIGh2gmekzZjnaYg/puYiNdCtdv9vGlLDPXJ0qA8LmzpAOYyzoV1zoMb
         NoqvIbZ+bKKhhp7vqli4lY8+/bZ/uKzLRWz7mWoBb2f9tXJQ+uSaSv16VbZhEXsavqXu
         XqQUPUYAVG8nCFQcHwiz6wacGbbnJUXlHDEY9EOguJbh/RH2PYj1uqvKJ65BmqdjShMY
         x5rePnefNJyw0DxsFHHjdBlwxIRNNxz/Vz8eeSSe9TTnJ5BdAfspWFRm6kzp3jP5/vl/
         TsyBpdbb6aLoZkkpNsfox+cXY2s+ukV/rTVZ7jA+D1+ax80MIFo86sVxp5x+XJVxiafb
         +YNQ==
X-Forwarded-Encrypted: i=1; AHgh+RqYTPjvkqwRaVzhma6Uc2VH8XqAsorzO+oLqPhUTdtgjxmIKFdwLkubdO0rQUJYxyUubjOIMLExvZX8@vger.kernel.org
X-Gm-Message-State: AFuF++mSaLFpXRoOjPrWDf6aqWiAnprtFZqQNTuvPDwuGp26QVPfvEHd
	UzuDqDX2CFB072S1MRLe6CFOoX8zJoS5l0URbKchxUXZjwZqj2hG2h8IOf3v5phsBvg=
X-Gm-Gg: AR+sD13h7Iz6ersc6XJU3UM6A8l69nYx670NM2NZj2wrefbJ4MaRgxS+WkhgKv5o4oM
	gWGB4Tpoqp0g9J1l64IHoObmTBGP/OGtnA2H7fOaSBICsOvY8CijR54Mdgi1wHVsKIZu/KyGMx/
	9unXn6sxfMbFLmTnAfeBpE9qIK7SzxlyJwO6gpLjQheWZbsN4YoiGe0DGmudI892D+ZRQq25VXA
	W0VD2ymDN2vu5OOjfYiJGQjX6YCdTWCj3gOdDGCtp9urKxLocuZpKTn+T3tKXeplqcf08RCodCs
	t8dMGrHuRw61xOnNnxE5n820zMWM+ISdGJZY2fm3O9uIbwmv8Lgp1MaaVizPhMOqaB/JYy31cZU
	n/6YPCMPpEDLv7xnjCcpeN4C+72Ywkx0Cywh/PmcpO3lKt11JPYXz9gGC4SHKfxe6lvJUlC8br5
	mHbzbF+WtuUcQ+OPFyxrcsATBGeBZOPQog2C7PdaPmdJgC9eBOmj1/j0ouAdKdGywvLJxlD0rfZ
	jy3YU4Fgg5aR8Qm2nof2wlUhRbK8rCHFGkHjc3k/RiObkF6fVZP
X-Received: by 2002:a17:907:6d15:b0:c24:4128:c19d with SMTP id a640c23a62f3a-c246a2e9378mr2551285366b.4.1787558684110;
        Mon, 24 Aug 2026 01:04:44 -0700 (PDT)
Received: from localhost (p200300f65f19a904efa8a94b704adaa2.dip0.t-ipconnect.de. [2003:f6:5f19:a904:efa8:a94b:704a:daa2])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-c249606b683sm1251855166b.5.2026.08.24.01.04.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 01:04:43 -0700 (PDT)
Date: Mon, 24 Aug 2026 10:04:42 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: "biju.das.au" <biju.das.au@gmail.com>, 
	"sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>, "robh@kernel.org" <robh@kernel.org>, 
	wsa+renesas <wsa+renesas@sang-engineering.com>, "conor+dt@kernel.org" <conor+dt@kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-pwm@vger.kernel.org" <linux-pwm@vger.kernel.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH v6 02/11] dt-bindings: pwm: rzg2l-gpt: Document
 renesas,poegs property
Message-ID: <aov6v5dObK-zJfRj@monoceros>
References: <20260604095647.108654-3-biju.das.jz@bp.renesas.com>
 <20260604100619.75EC51F00893@smtp.kernel.org>
 <aliM3iVA1LY7tW38@monoceros>
 <CADT+UeB-gV8QnuwpTUrHV-GvYPwebYg=RE68PcApZkACO4ENDw@mail.gmail.com>
 <TY3PR01MB11346EDD83D9CA3F3252D48F586A22@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yhelts2hapldhig7"
Content-Disposition: inline
In-Reply-To: <TY3PR01MB11346EDD83D9CA3F3252D48F586A22@TY3PR01MB11346.jpnprd01.prod.outlook.com>


--yhelts2hapldhig7
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v6 02/11] dt-bindings: pwm: rzg2l-gpt: Document
 renesas,poegs property
MIME-Version: 1.0

Hello Biju,

On Sat, Aug 22, 2026 at 07:54:26AM +0000, Biju Das wrote:
> > -----Original Message-----
> > From: Biju Das <biju.das.au@gmail.com>
> > Sent: 10 August 2026 09:43
> > Subject: Re: [PATCH v6 02/11] dt-bindings: pwm: rzg2l-gpt: Document ren=
esas,poegs property
> >=20
> > Hi Uwe,
> >=20
> > I have clarified the use case with Rob on [1], and he acked on [2] .
> > See the details below
> >=20
> > [1]
> > https://lore.kernel.org/all/OS0PR01MB5922756F1836AAABFF62C04786049@OS0P=
R01MB5922.jpnprd01.prod.outlook.co
> > m/
> > [2] https://lore.kernel.org/all/20221215205843.4074504-3-biju.das.jz@bp=
=2Erenesas.com/
>=20
> Is it ok, if I drop the POEG support as few SoCs such as RZ/T2H and RZ/G3=
L needs PWM
> and this patch series is blocking them. Later I will send patch for POEG.
> Please let me know.

You can also reorder to have the important bits first in the series. I
can also apply partially then if I'm happy with the base support and
there are still questions for POEG.

Best regards
Uwe

--yhelts2hapldhig7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmqL+xcACgkQj4D7WH0S
/k5q7gf9EXjSbZmnkiK66pzWl5IRYULgilZsieiRyqDExXbIofVEhxYmfRjlv8Qk
SNFUgIMRCOAK2BE+7iwPlJvCP3gMCnx/47ZEZmz3sykbgdgjyW96YPL12tsHpAC9
wgtHAEdKLvn1WrkVQB4N0LCsnbs5zXoc1BdR+w5vOZLzW4RgdNRQuizJ80czjdQ7
dV6vq981FKkyftinsY+e4bLH6Jlk+QaLLSc8gQ3CW4Zf2J1V1N4OFvAPryGKQ388
TvYs6OWt5RRFAfUTYYomIvwA9H30Olp9uh8weGokQ+/wvCHFqQm7bddVNQIwq7YM
x26KbVqXuLL5WSvfqVs02DuzCdv5yA==
=b9qz
-----END PGP SIGNATURE-----

--yhelts2hapldhig7--
