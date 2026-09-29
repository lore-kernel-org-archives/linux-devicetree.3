Received: from mail-oa2-f35.google.com (mail-oa2-f35.google.com [74.125.231.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CEF4526AB8
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 13:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.99
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790686942; cv=pass; b=HSPS4X0KdiGWAiwBnbIdHeAm2Mqh5OYHJ8XbSLlkZIfdPOyIMq7nzhh0/CyBnMLleqsbpu81CoITtRTlMaCyTkMHefz5atz7ywH2v4hZvuW0b1xHQxZCpvLuUAP/wItFWXNY6XN/cjbPlAw5rHgZULOOUA4pq15jJZgz1+vEj+o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790686942; c=relaxed/simple;
	bh=h/dEkLgDNm8kwSpMuXoRiZdMMmblme/cWbeX4MOc2Lo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eAPQv5wZc8DQVUQz2L+8xUmCaXSlk48A52R5sJmhLR70/LlGRPk/5Ic1zox2JljlSMo9xNAYQbSO4KYQ0C148uMUpXzWqUVgt+oOlr1lDfZCsblzprIdfijpXKq0BEu6KEcDjJWWaG3JZeQIsRk8LwEYD3yYjOTR7QsgUmU85p4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TUIZq+IM; arc=pass smtp.client-ip=74.125.231.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TUIZq+IM"
Received: by mail-oa2-f35.google.com with SMTP id 586e51a60fabf-486e0f56cddso1787226fac.3
        for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 06:02:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790686939; cv=none;
        d=google.com; s=arc-20260327;
        b=bfR5uCQ1rBwkJikUzeuOXAfVQDzk0fFbTu9LAOk9Cyscz1l8dbLFQ1L0akejAEYdzr
         uexyy85iE3NS32X1ARIMtQAtoxZRzoP47bXMnmoiW7eRO3bDVpTTBhiqVciNwkz/9o/k
         qoCSBS3mFm4xsaVlCei/PgJjIcS2TO6LYFVTlasEAbw22ErEBTfwE24Ifdjdmv7FpvP2
         4FdGe1zGZ59TzLL1Jq4fLluA0ItYZofdL7ZNgt5XHefTJ1evnTn0vbPkujIN7NR44zd3
         jz/p3GJlzzc8dLexVE9ZZIB8IM10aZh5ChK7DLcTtQEY3E6bBQyjo1ujOOiQwg/LBa/F
         hfmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Zxgzqfnj/lyafXYZ5m9OtdVoRSskQx5b5evxTeWWCXQ=;
        fh=OGKHD/ny6nVphHxuYV3JPu33kbU4Wo+OsnH9VPuUUmI=;
        b=a3JSZj+xV1AARmB+LTlGtAAAS1wF0wJrP5v4xKqg1wnZOTfdgXPqMwrPzrPbXIJ5mB
         LIUtNNfQVNeYzVGiA2ner011BTW55CxUeH7J3eXQeeT8M037pQiDT9A7S7ceLMDw5Dwm
         VDxPr9/naxB1/GEo1pUIgiDbdrb5Jzfmd3dRHa8+uLgL2lO8Cx+QhYzgkUoQ2zX/KM9M
         239FcQWTxf6axH/e9gDG1oOi84e0Qi6NkkiI77orhB9tIiRcmHwUJoVsX6FV3fNR2fWR
         rrMSs1wn7uGTun1ij13y2VlmgegWZaNfj26ie+8HapuJKFS6woLTSz/8g6lFZPgjZz7L
         byIg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790686939; x=1791291739; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Zxgzqfnj/lyafXYZ5m9OtdVoRSskQx5b5evxTeWWCXQ=;
        b=TUIZq+IMOS+ndS3eucqL67M0m7y+OiQbWFd27zTC/6PhNT5CrH5RZuNVMiCzVbpszb
         j+FOWX3Sg0Xzse3tBiKEs7sUeOINwAl9iU4M1Myr6VX9WYtURYUKpxq1Zb8zAEerrrpD
         jJ+lNIWrep66qowdFgmAdTw0i9UEZ7kNvsnAbkNRXiT7ij4v41/YfUo60H0zjqFkFM1B
         u3sPNuuFAoKWla5VKgVhHFGd7qG6VVtMlLAYGZOHzHXwtzRthZNq69K4n3JxgmIWVR95
         L5OYTW7yabVcLpz0IDSegV2bjvk8Al5beMyMZ5ePwKELYOpG0RfM20EaRwRgBc7PU925
         YW0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790686939; x=1791291739;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Zxgzqfnj/lyafXYZ5m9OtdVoRSskQx5b5evxTeWWCXQ=;
        b=IdyZCPHLNHB4KEYyyUtbCfeR3u9jEEp9/4zJSS8rJNH7KCMvMZOHAgTgaSMcS//l/b
         Us5k1sX28U7rm9ieZWmCP89P7rJMM1SMA5w2A6JY7DY/X0RDHaowSsIZEXA48HbG3DVA
         V0Q9t2/BdczRnUtUPSBjf/jzdt7aeC3DnxvJ7Ksw+KsMeRQStHuFHVpXkgnpz2bEW091
         12p4Jq8VbKJZyjzQtGecI8R58tiFkfwQxntpfDba/uuXO/hmQsBpTXb6BfAFGGkTqoqG
         yJE/NJm6tbWLz+NCNoAfAzQp1wj1tMyBVnpUiVoYJq7li1ZsIgLaSXz8RVlGaQjSLsXI
         sS/g==
X-Forwarded-Encrypted: i=1; AKwUvBxgYKv3kApcikx50FzuYSvDxPYQh/B4+8QXFUGvx2G5KR2CfWxjxDRRydeP3H3e+nZS/ic8cj+i/f75@vger.kernel.org
X-Gm-Message-State: AFuF++m/Tl0R2sUasebFTTi4xxZ7Xkwyvyaz1+kAmomEMyFkUNB664Dv
	eKP3teHKtClsGDdxWpZuh0ZnRae9BXuQrig/YL8QIEEpsbfcGJvLyWteQCi8Xmqk1bkj9/XxGO2
	e9p1fOBEaqDHvUJNejUUb/4udIQoOqWM=
X-Gm-Gg: AYBFou3mRNWZSKT/rn0oA75PIyz+dspI5iV9CXvv4l/eD6qwuEP4rrot/q2eQY1SiUe
	A4Xd+CFn9NKe7Hitko5DqYP3WOIr3y2dODoRD96omT9YGKuL7cRWBAPXTAZyOUyJCCJbyuRMCWT
	W3+JjZwoODdaMddP0vXENQfO1e+pPKK1GSdqba+WodsdwTW7MV6keucQiFNQoD9JQAnP98fpu5y
	Q/U5ZmYH3N8geaAqt0QgG/2MbpuFqJBedqDUclHN6jxP4VzJbDTX0EGpcDl5XBKuUVsDtdQb14J
	0Z6krxe9Fw6zMNSS/mlIoalwoJSDIrK4mZp7F29cAWG/j+LonpwyI0YU
X-Received: by 2002:a05:6808:124e:b0:4c9:79ae:2709 with SMTP id
 5614622812f47-4d72c7397b7mr14370723b6e.41.1790686939184; Tue, 29 Sep 2026
 06:02:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260729114312.3947300-1-chou.cosmo@gmail.com>
 <20260729114312.3947300-4-chou.cosmo@gmail.com> <20260729120805.F38E71F00A3A@smtp.kernel.org>
In-Reply-To: <20260729120805.F38E71F00A3A@smtp.kernel.org>
From: Cosmo Chou <chou.cosmo@gmail.com>
Date: Tue, 29 Sep 2026 21:01:50 +0800
X-Gm-Features: AclHuK-lEiHYHxmzMLkU9wIMTNELJBsJ9PeC1ucIrEY7bGueerJBRBa8vOcsNbQ
Message-ID: <CAOeEDytOgkz-vLPCAHpVLDnx85oGA8d3vfjssO0PBBRQqUK1vA@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] ARM: dts: aspeed: bletchley: Add second source
 PCA9532 LED controllers
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 29, 2026 at 8:08=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] The alternative PCA9532 LED controllers use incorrect GPIO activ=
e polarity flags, causing the LEDs to operate inverted compared to the prim=
ary PCA9552 controllers.
> --
>
> --- Patch [3]: [PATCH v2 3/4] ARM: dts: aspeed: bletchley: Add second sou=
rce PCA9532 LED controllers ---
> commit a1677ab804733ff8d7d1bbc1ba314032d50ddf82
> Author: Cosmo Chou <chou.cosmo@gmail.com>
>
> ARM: dts: aspeed: bletchley: Add second source PCA9532 LED controllers
>
> This commit adds alternative PCA9532 LED controllers at address 0x66 to
> support boards populated with the PCA9532 instead of the primary PCA9552
> at 0x67.
>
> > diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dts=
 b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dts
> > index e1fa3a18ea5cf..3da1cf9bbb990 100644
> > --- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dts
> > +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dts
>
> [ ... ]
>
> > @@ -86,6 +87,66 @@ led-7 {
> >               };
> >       };
> >
> > +     fan_gpio_leds_alt {
> > +             compatible =3D "gpio-leds";
> > +
> > +             led-0 {
> > +                     default-state =3D "on";
> > +                     gpios =3D <&fan_leds_alt 8 GPIO_ACTIVE_HIGH>;
>
The polarity mismatch described here was a bug in leds-pca9532. It has
been fixed in mainline by:

  commit 65a38a28a0b0 ("leds: pca9532: Fix inverted GPIO output polarity")

With that fix, leds-pca9532 maps val=3D1 to high-Z and val=3D0 to driving
the pin low, matching leds-pca955x. The alternative PCA9532 nodes
therefore intentionally use the same GPIO flags as the primary PCA9552
nodes.

> [Severity: High]
> Will this GPIO active polarity cause the LED to operate inverted compared=
 to the
> primary PCA9552 controller?
>
> The leds-pca955x driver maps a raw value of 1 to High-Z and 0 to Output L=
OW,
> whereas the leds-pca9532 driver maps a raw value of 1 to Output LOW and 0=
 to
> High-Z.
>
> Because the two drivers map raw GPIO values to opposite electrical states=
, does
> this flag need to be GPIO_ACTIVE_LOW to produce the same physical state w=
hen
> logically ON?
>
> > +                     label =3D "fan0_blue";
> > +                     retain-state-shutdown;
> > +             };
> > +
>
> [ ... ]
>
> > @@ -162,6 +223,24 @@ led-1 {
> >               };
> >       };
> >
> > +     sled1_gpio_leds_alt {
> > +             compatible =3D "gpio-leds";
> > +
> > +             led-0 {
> > +                     default-state =3D "keep";
> > +                     gpios =3D <&sled1_leds_alt 0 GPIO_ACTIVE_LOW>;
>
> [Severity: High]
> Similar to the fan LEDs above, does this polarity need to be GPIO_ACTIVE_=
HIGH
> for the PCA9532 to output the same physical LOW state when logically ON?
>
> The current GPIO_ACTIVE_LOW flag appears to be copied from the primary PC=
A9552
> node, but due to the inverted semantics of the leds-pca9532 driver, this =
might
> result in inverted electrical signals.
>
> Does this polarity issue also apply to the alternative nodes for sled2 th=
rough
> sled6?
>
> > +                     label =3D "sled1_amber";
> > +                     retain-state-shutdown;
> > +             };
> > +
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260729114312.39=
47300-1-chou.cosmo@gmail.com?part=3D3
