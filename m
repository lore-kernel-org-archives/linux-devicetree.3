Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794663446;
	b=M/2iQsfNlxhmY+Y0BAUSB7Cr8Cl1kCS0M0m2nAFbz82OG26j9XHCO722529O00xxYKUF
	 IThMfjX6s24kwB+foDuN+djHZoDkA5lxPrF4Unx/dg4UjGfOqItQtvnaryc0E3wm3xifN
	 X++VtTv6o/H1gPUL7j9UrLIp7jt7GHsgsDHVk9ufl+OP+5DLdTwYXFEAb+tSD20tz5aQX
	 zHTPmsaJqrYM1xoWHFNarUXtwJOnNJbKfSdMSnY7o5EC1Ye37V1mDftI6wVPvWbOQNhdp
	 aB1oC1bmb34iwt8eCT2GjbNouw9zNBQRtqODmEHNYz5tJnVEF4sL4cSputWL5sU3FIg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794663446;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=d1dGGKhX00LCOKp0RTB4V4U0p/3/TPwG7x8i8TvKBao=;
	b=DPyu1HdMeRayLC03w9vFWTHnGB1q2KU21W1+YB6huZmmuQutIRbFDMYT8v0CXz4gm920
	 ZcFTTAgG7FlADcJOYRxfuy5fyOq2B5uC+Uf6V4ueAii7kXsHXJDwN2aYcT72qOpWRyXTk
	 d+u++EGJEU/zz45TrV4BgfnrMBqCfNcjo7hHZnMQ56GHylruryggo2kcjmLC++C9bZEbB
	 PXxA3yLQtjVXzopM0BNS2CLspHO4Q7N9kqclZVGcLNPNMdqPgxYnAtPY8RusHp3uttwsO
	 cpMdgzBnyT9R28fOckUDFMDO1XVo5CxXRdwtBO5Rkvm+TClIHSaXUNsTydriiZcv0Bw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=V0DVzrQ3;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.54
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1E06606A331
	for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 13:37:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A1E06606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=V0DVzrQ3
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c50a2efbe1dso329041166b.3
        for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 05:37:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794663444; cv=none;
        d=google.com; s=arc-20260327;
        b=WJ+Iwm4Xi+meTYSC6luiMsg9PDmerVsnGu/xTx8WO4TAbfGhoJ1gxj3NxAbdDDjsm6
         ogZ7VSVWBlGAd8GzDtlLmdO6MC+6a6YKzqclTFbHJThhJr+DMvCwYhJkTwPUfqgbyQf4
         mtCHVQolLgFFk5dmanbh9dQyDUj153L6+DL99q9snZPsfYjVZGoPpGr3TO3DZ337vPYp
         F7K79wZK3RS0NlPCojvCTbLkqp722a5tPtQ2BEHn6Ozus14djEdWa24K95pDDQqX38Le
         vMWM0WY2ErVCwmHgWtrWnuV6AI5DWhlz7MIlLmYj5AnipvLO1vXSSUmmt/xu8yRZdV2s
         klxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=d1dGGKhX00LCOKp0RTB4V4U0p/3/TPwG7x8i8TvKBao=;
        fh=owGNIkzOMB6klMkRKKhNjkfJDcfYtgJt0i/YFhHtR8Y=;
        b=KlqVpFLWMcIwYm4dTQbpTg5HUJRglyfTo0MOBrwVpOdrxX5pMU7RnUBI1DZ3g/YEoT
         Oqzif9+2SBBk0UGkD//Q+dwbnIF/jie/vff3dP5eOSTnzpSa1MpkAwx061rlyTL5ddTq
         07thAEZoOdodxQZ4AaknQitiFZsfWk6pvALAQJbPpHDJYrAkG+NYRlSypGSy/WNxsQS+
         U2MmZSiisWq6rYHdThzi5yH1QG28mfSiCuBdIVbzQUEm1aOkLPXyBFSgsy7QGIsBC5f0
         C4UrOkMOE0cmrQn8wWSrJOnyWBKuxgboBS9WZV8xZJUduYRc204XLhMIJp7irBKZeqo6
         51WQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794663444; x=1795268244; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=d1dGGKhX00LCOKp0RTB4V4U0p/3/TPwG7x8i8TvKBao=;
        b=V0DVzrQ3UtNS2CGItTaibnG4J77tS7qMIR3c3C2ZUlh81GURnIp8X/IHvzSGRyT9ls
         zjvCcMSGfVsCr6PaYL7s/vQfBw5Mif7+7tUD0srSf73nlG5orBcEr38slNFK3s40BEI2
         7P3tnLj21L2r9iq1fBalGmh9cWBfRaIGzosEYay/i4E+/pcIFFHj2aP00nst0S6qHd6J
         o/X6UWXAn5i2xjeOmvPTXT6Ku4VxLGqH9IukfZrHdwmQeffXKQ1EEEj4+Y8Ud/51mgzP
         hYSzzU0nDdx3vWOvn6HCLUOcY6VNwAbS3mh+1q0boLKaBCkOkU/W8ctopAqNAKKW/Jrn
         WAgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794663444; x=1795268244;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d1dGGKhX00LCOKp0RTB4V4U0p/3/TPwG7x8i8TvKBao=;
        b=GMcCN8Qe4gJnukLDzRm8rwNK1Yghe91FKNOwLUUY5MXaS0P7Zmf8cPso4Fdnyfl7d7
         1NRnpTRiPvv+TqPytiPqCanolp/Xxo8wARI+H3WUxeZg7wRbkb/wjWDIFAiyQgp9lqzL
         ncyx/AhDhEW7tPW+qukbMf5ZaIBxPNIyKZD4n9T8XNoORse6vm4fYjng746qsDieyPMZ
         2s3wc5dRaJ1BUPOtzbkvtFemofl4x5fqFVHohhp0C8IMkXKyXLTXVoqeK/x6BEskm0pv
         kQVGe1r54H+PMwnVaqiFptG8pny6tNjd4qxiNHFXad+nD+FTl1bETLwl3P6N5hs6dAbj
         E1xg==
X-Forwarded-Encrypted: i=1; AL+hErHD7q7QbLVhYIMwqVWRB6w6BHQhrH3rcGceg8NLvhsqwqwhr0mqeQG3VFsWrEf2dm0amcmypSk36xcE@vger.kernel.org
X-Gm-Message-State: APuU4Z8ZJn6+JrM1tuCay7YGs0GOnTE2ClhlzeicDBvGFyz9PGHuDcY8
	o7V4h+yeOnOsXiTM083qj77GZ6+a8dmiyTLMUnZ6LqJTy/PKvJwRQRCJ84C16DZ28DETKjUWzML
	buJ2Am0lqY+86pBWQ7TiTszF03mO+9hs=
X-Gm-Gg: AYBFou3AdFrZQOXDzPc/btlO+E0qnBntL227M+rml9ZJHvylg7uZq7Ib2LM/ACu7BTr
	K1CU0BAq4HX+Dlwaxqp0iB0mq/O2pd3lWxEQFe6D6F3w8HhHtJcKhM6TjZYmnC0CWb6Z9VSqH6m
	ZpcoxzyWM5oxPpTiCZoZCm9zvvUElEACC8pn6fd+uZjFP768a9kbvLX669knuSFUKAn98Z6Ax2J
	25orJtt/Oheown6GnsO/NBVaudZU6CJIz+u7U1Lk0Kstc0OtJRbcBgV9woDzn7N+pC5YKAppldq
	nAIR0sXrw/8r+Uc/jS1h51kPD6E8p2nIWUX4GMW51UR6wslJ0OOE/asmMNee14iAK1d4xbijXpL
	xdnMSg8Z9JKObhPkDG3RHzet/y9tCwlmCn+3ihQ==
X-Received: by 2002:a17:907:3e1f:b0:c3e:f39b:2286 with SMTP id
 a640c23a62f3a-c5095db45d8mr475395466b.0.1794663443789; Sat, 14 Nov 2026
 05:37:23 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261113110546.173624-1-a.shimko.dev@gmail.com>
 <20261113110546.173624-4-a.shimko.dev@gmail.com> <8ef5b0a7-58f6-4c62-8153-6a9c8d3703f7@lunn.ch>
In-Reply-To: <8ef5b0a7-58f6-4c62-8153-6a9c8d3703f7@lunn.ch>
From: Artem Shimko <a.shimko.dev@gmail.com>
Date: Sat, 14 Nov 2026 16:37:12 +0300
X-Gm-Features: AclHuK8XI7bnok_ObDtOfMHWf2vbfB49mnYymQ3JtOPklAmq8NLX7LejygF9N-8
Message-ID: <CAOPX745=Mx9Q+Wijt9+=Mmjtdk4fsenEeV2h0gPCvNpqc8kN=A@mail.gmail.com>
Subject: Re: [PATCH net-next 3/3] net: phy: dap8211r: add led hardware control support
To: Andrew Lunn <andrew@lunn.ch>
Cc: hkallweit1@gmail.com, linux@armlinux.org.uk, davem@davemloft.net, 
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, maxime.chevallier@bootlin.com, 
	pavel@ucw.cz, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-leds@vger.kernel.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

On Fri, Nov 13, 2026 at 11:32=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote=
:
>
> > +#define DAP8211R_LED_ACT_BLINK               BIT(13)
> > +#define DAP8211R_LED_FULL_DUPLEX     BIT(12)
> > +#define DAP8211R_LED_HALF_DUPLEX     BIT(11)
> > +#define DAP8211R_LED_TX                      BIT(10)
> > +#define DAP8211R_LED_RX                      BIT(9)
> > +#define DAP8211R_LED_LINK_1000               BIT(6)
> > +#define DAP8211R_LED_LINK_100                BIT(5)
> > +#define DAP8211R_LED_LINK_10         BIT(4)
>
> Do any of these bits allow forced on/off?

These bits only control the indication of connection status, speed,
duplex mode, and activity.

The LED_COMCON register does include "force-on/force-off" bits,
but i have intentionally chosen not to use them here.
To be honest, i=E2=80=99m not yet convinced that they need to be added.

In any case, if you think they are needed, i'll add them.

> > +static int dap8211r_led_hw_is_supported(struct phy_device *phydev, u8 =
index, unsigned long rules)
> > +{
> > +     switch (index) {
> > +     case DAP8211R_LED_ID_0:
> > +             fallthrough;
> > +     case DAP8211R_LED_ID_1:
> > +             fallthrough;
> > +     case DAP8211R_LED_ID_2:
> > +             break;
>
> You can collapse case statements, without fallthrough, if there is no
> code.
>
> It is also possible to do:
>
> case DAP8211R_LED_ID_0..DAP8211R_LED_ID_2:

Agreed =3D)

Thank you for your review.

Best regards,
artem
