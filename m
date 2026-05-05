Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0D203BF693
	for <devicetree@vger.kernel.org>; Tue,  5 May 2026 05:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777958984; cv=pass; b=Vn4DlgYT+AP/Gr0lTQFwAXdCvm+/9iQrJL41atkAK89QOaetsGwJn0MR7pe+u/5QkZOH7RE37spF9gcBkfZ3ChyzDQEjqJdaXdz+kEv9GgoSA6Fbzgo6icutaCzWzplxl4UyTFyM5yIbR6hbvwYLumegaWqfGexv8VreMujo3HM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777958984; c=relaxed/simple;
	bh=V6Zurul8OIpaOamfisEiMCOrAsq2ljuPtO2RRKE9ogE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bhKIc1/3eFYECnCPNwZ9I06D2TXM86OO5ztI+t5SGglscWsvoGXRQlTtAhDwI9xe1JIZl+mOlNHf2410mP62x2TOL3BY9GYiz91fr+tvLBPeLnJh/sSziyu4/i3LZ8jgsYwVLTyGqCMrwgC/QXGfD6o1eO3P66NCS4rKLjcS99s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y84FU50h; arc=pass smtp.client-ip=74.125.82.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y84FU50h"
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-12c19d23b19so7039116c88.0
        for <devicetree@vger.kernel.org>; Mon, 04 May 2026 22:29:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777958982; cv=none;
        d=google.com; s=arc-20240605;
        b=YOL43UNExesX8fw30cY1rqth8aYj4X0x6Bi58n5y5H/B+L/9QaxUM8UKggYfIASIC0
         bI2v5NCjyrb9yRI2KJ2LnGU1kvSS58yiiGr5eASGGO+okxFQ4bqkxzr7SQJaB4t61QDO
         XDcuBPSCQv5lJSzinRoumQo70P0uxOrmrkLhmMc1/MaoAh+38R1V0biCqlfai6ZXm5PJ
         wXeMlpGcUHGKCiNfEZDSNlnGyTzh3uDaSKCowJesbnK1i8HBlp84EM4dctkZqmKn+ykG
         w5XW/B7yFylXmWiRsoGulU+lTmTzQY8UbglJN6zoGPwRVcWue0Y051BcsFsjay3fH8Ni
         Fjeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BZApAq4QIa2b+bU+TsGN5Lrz7zDguSXpX0ChfXxim/U=;
        fh=VRNxptYs+qYUQ94ebTXcb/rmZnaxOq6DlMFkdvq2ppI=;
        b=UpSZ/xewfOnlXBwzZV991lWpjRkOEpziweoiNVv79K+zg2Jfge/ttOP7Hy0n2W5gtj
         CULMyV/STCWp4UevPTxVvpX58cj3i5/E2UScnN29dNZ6SF7r39dN6jJpw2kcMpxU5Jyv
         U837vw6b8J1POJWhDc6eclCVWi0d4wv4jqqRqtVf2P/wnbsuK4JmcdKuj0POJcIXTozV
         J0/HLr0W1GYgpz+mLabHwmWwM/VScoCcZwX3QcZKZsDhE6//+PwCj06E8IYaakl5AFCK
         Ms5CjVa62QwxtbosXjKkgkFtSJVjlvQ1oSeouvJu6eGCgSYvN9ZiX3aYdR7LGj3QMuJv
         fRdQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777958982; x=1778563782; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BZApAq4QIa2b+bU+TsGN5Lrz7zDguSXpX0ChfXxim/U=;
        b=Y84FU50hfQe/MtMC4bS0CsgqkSV/29O1v1Y4QHOjE7ff57FC/bGbUP2h7sYq3Lq/RV
         kCXGlEdEmzjeOY+FSNG/mee0AkrtxQJ+mhrrsswjP98DT4NnBWXSWj8ABQOWt+K/497M
         seDe+PuoH6/UOoMr4TuRITx79L/l47el6YVaaSTDg7eICPQWzxkHtjF68FvKKXa0zc3c
         NIzDpoCJYeucD4Cdu6hNdp7Q/tdz36yv3P9FUh6Y3metdK3xjgzjKWf+8I0JCz33G/Qj
         XtiCahmRNPyslapIwqwQxHar8+8Qo3M/X+94kiA+D3snGff6J963rDK9rFxuCytLyCdF
         sZKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777958982; x=1778563782;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BZApAq4QIa2b+bU+TsGN5Lrz7zDguSXpX0ChfXxim/U=;
        b=GHNOQCXoVTv7rVCHLr9LWNBbSmpFxOmMZ07HYvcZ16XWaDEh4az9ZLxH4QQ0z1+91k
         XTKH0EPOZYq18KcH0xWV1Vjy3b+Bsy+Mh2THcr+Rd2RMRzdmvXzvgFZibTx2dYc8k1ss
         u/Cx/pI2wER+dBlu1mesfXzTsIKvubaiaAujLHTQ+2U1110v4z3o7lbJ8oSCIjOiR+sx
         YGHNhQjTNyd7lZZm0n8dDF5CerMw7lmsolc2yKDFiQ3JX498YMCkw0fj77IAGMbZApOJ
         iu3FhHzaM1XtVZT/aSAIAaR2BMGhXSL49rV7JWSe1s8n9/5XTRJovxutIH/TzFCG2klF
         7qHw==
X-Forwarded-Encrypted: i=1; AFNElJ+auJ5GTGmszZzmraI7wQ1AfI4lXPuHfunZhr6Zxkn8QGjXd2Zd7z1CbA3DxCr8Z77c4g0QE3kdqYo8@vger.kernel.org
X-Gm-Message-State: AOJu0Ywy7d4xBCNGxGKp1dsgKY6sYuv8hTFK6v0mJpu2PVoFAtXoDdXc
	UNTH8OZlAi+OaOyJl8MKbPwM78vmX4fxv5CgVpbwwvHeMxQsj4GgqMYOo2gwtBfSpuCNJ5NPhji
	nkG5HCv52eTMh6I7hANblECn+Vierp/A=
X-Gm-Gg: AeBDietGcPVqoJtFiZ/H5raYYoqDJ1hjMYLhi9uF5o5ZyxuWYPO6wOEUha1O7FWYS5R
	ikHHK+K3nJXv2EI1ha8OU6zIyVxgLQj6zCynS/COzr4JUjPhZvMTiZI7sPHmo5ipeUsh5jEkuhp
	hE4oGzFdDYA6UFHDSCUVaGAntXeo940d3BhlA81Pn5oTs2CiT0Dgir+4X0xbnq8f8x7xNX7XD8P
	dFyTFNyyYeo8VCPlNToD7+la9N3U/X57TDJTH2O/Mfx90gZKANKsh1MYBojk7JGfWYL4wtfivRb
	5zw5o8AFkbtfStyZM6cNB6LKiS9WSw==
X-Received: by 2002:a05:7301:678f:b0:2cf:3de7:22ad with SMTP id
 5a478bee46e88-2efba28ad10mr6432810eec.27.1777958981772; Mon, 04 May 2026
 22:29:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260406081330.30362-1-clamor95@gmail.com> <20260406081330.30362-2-clamor95@gmail.com>
 <20260416214025.GG1824072@killaraus.ideasonboard.com>
In-Reply-To: <20260416214025.GG1824072@killaraus.ideasonboard.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Tue, 5 May 2026 08:29:30 +0300
X-Gm-Features: AVHnY4IqOphoy4i60hIX9XKC-SiiHCkMxyeKQqhZZfL3LpieJyG94SWDZIgtJGg
Message-ID: <CAPVz0n0uEsJg94GUky8cF7LNpejfpYxY9vLCY1iv5HYoxE_WeQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] dt-bindings: media: mt9m114: document common video
 device properties
To: Sakari Ailus <sakari.ailus@linux.intel.com>, Rob Herring <robh@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D1=82, 17 =D0=BA=D0=B2=D1=96=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 00:4=
0 Laurent Pinchart
<laurent.pinchart@ideasonboard.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Mon, Apr 06, 2026 at 11:13:30AM +0300, Svyatoslav Ryhel wrote:
> > Document common video interface device properties, such as rotation and
> > orientation.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>
> > ---
> >  .../devicetree/bindings/media/i2c/onnn,mt9m114.yaml          | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> >
> > diff --git a/Documentation/devicetree/bindings/media/i2c/onnn,mt9m114.y=
aml b/Documentation/devicetree/bindings/media/i2c/onnn,mt9m114.yaml
> > index e896f4db2421..2b39614f5cbf 100644
> > --- a/Documentation/devicetree/bindings/media/i2c/onnn,mt9m114.yaml
> > +++ b/Documentation/devicetree/bindings/media/i2c/onnn,mt9m114.yaml
> > @@ -15,6 +15,9 @@ description: |-
> >    an I2C interface and outputs image data over a 8-bit parallel or 1-l=
ane MIPI
> >    CSI-2 connection.
> >
> > +allOf:
> > +  - $ref: /schemas/media/video-interface-devices.yaml#
> > +
> >  properties:
> >    compatible:
> >      enum:
> > @@ -90,7 +93,7 @@ required:
> >    - vaa-supply
> >    - port
> >
> > -additionalProperties: false
> > +unevaluatedProperties: false
> >
> >  examples:
> >    - |
>
> --
> Regards,
>
> Laurent Pinchart

I am looping in Sakari since they are i2c media devices maintainer and
this patch touches i2c camera binding (get_maintainer for some reason
did not include them).

Hello Sakari, Rob!

This patch hangs in the LKML for quite a while, and if no one has any
objections may it be applied?

Best regards,
Svyatoslav R.
