Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794664097;
	b=pBKyM89T+s4rPDOKt1TWu4woahl3NooFFGv/1t1dR6ECfxXW99aXIE64Ubsoxtxfs76c
	 Ac74l+FMyEMoHcoXF756Fjcf9NWZnV9C4aA2aTX13KnovCNw8LFHYsM8DNhfEF/Ym/e40
	 hKMB4bOCEGgvFLbsT74JvifPZETHTjcs/yBoxgge4GUPK7gpzdH9oYb9gHuxp7jLttlAX
	 aXf4LZztGfk9g1hBo9VoSMTLF92Bi3cqGY+JLeA/EBrqxGcEX3x7O5HxIPhO/SwOA3zYF
	 +O3IgRq1vzSxBSCQJHB+FiPCMoaekyl71RimhsKwSZgjCuWlPtPD0QCiL+2TRSIlJQA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794664097;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=uV9w4XdeJBMVabGCuGulxAnon3qiDUPy4KI5C/5BU4A=;
	b=DNQKvu8nxgQ77CfUMToyEM4Akr71oeKP1av5b1THn57b2mZPZsIi/KUn48BkYWxbrU57
	 kr3cI2J/JPDs4yBBYaTCBn11pTsRT7kx46rtli+rQAh21RNJO1N7CaoJt734zjT1BufZT
	 93mhreMGPFsFYYIYBYuW3DPpdCWH/rsaewr9lN3L9KbqTg4F9JuFm2/ZSAlHeIkXWO5Ez
	 c9gKxw/h3rFtK64VI8XTsg42RULYMnbE0gPUuiRmxlRs8i2MCYzSY2vsT4jEtgt9NSuoA
	 9tpo4zG+YYSqM4lnvYkunYVQUpezhc8mtsulV29T/Vx56YfRUGJveagJzExFsjzTDMg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=i1lZRvJK;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.44
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A16F9606A329
	for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 13:48:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A16F9606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=i1lZRvJK
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c4cb6834eaaso392051466b.2
        for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 05:48:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794664095; cv=none;
        d=google.com; s=arc-20260327;
        b=bqaxdnW2B7sHYOS/psHYyN12JQ+9fGIY53KsKaJFMR56NX1FuNBlMtRUUsUyGndkJ3
         RS8YG0mFlxCHBj8N7bkeCF6VUE2Rm6h42f7ElPbPtPq2dSy2GrwklD6214ufwBRxxOAw
         XNc3MDg56/fyZ9W+kUixq2mjANW/cZ4u70mdeVBbVch4l7fsi593lCT3xYhdIMAe7mD4
         GOK2rznkcR/Fw2gVMubY9COvIUsxFXk+lX5FXN2jrMyuKqX+Lr63JjsOcbrgNIvbeflv
         5/DU2NNvBUA51+IFNNHFZ9ofNE5KylsEaxu8wJYdGL5cq5w+kstkpLBTq73u7osaVx28
         WHIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uV9w4XdeJBMVabGCuGulxAnon3qiDUPy4KI5C/5BU4A=;
        fh=LQfdS+m/cPKdWQ/3kDuhJsIgVCfZY+tYZPFhscd6cXE=;
        b=kVcVo+3NH397B5Cw5dR8peykue4fYLwLQZp7n4HL+eTP0GNsytX4ialynq0Nkn9w2r
         PxN+uS3nsTiIRO/jO99H8kzbww0hzrzWBahYsXP/JuQQv2W8tahHBSFbShd6lPAVB6zF
         N4jFcPfoNE/uqYvs8uLtRzaJB725439vren+/TPxab0CqNo1EnRPBFNQS/Muqr0WxbEt
         LO1sE+vb5cz3QoPSYs9xLA8mUKTDL6xM97yx2Vk9TVSZDFQZLCW/Fo62eV2uVwVjGH5E
         h/qNnjVAT/5P51GCAJrj92Hex7wgmZpUqw6SVxMtpWx+RJLNEQyGyJiE5Z94RQW7o9Bp
         8CXg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794664095; x=1795268895; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uV9w4XdeJBMVabGCuGulxAnon3qiDUPy4KI5C/5BU4A=;
        b=i1lZRvJKI4pxHI/KEdEuK/CRwqVzQapKRUGOfPtVjMvx4zhIWjT+w33rNSJeqmvXlo
         8XpnZS5ORoj1BzxD47pEaEpJvTnlYATebqClXpn6sdm8qF9gfzCNzJVnMkdCT7ESZZuS
         VsYzkkaxeHMVlAZVdjqDP3smlo9CHctLUcByBQQT/T/XuEanH5/RNOpbr1uavF8GfUTE
         rUht9LK1bkXx+Cv4YR0A5nq/89lX14A4KTDDiq3FS9DuNTsjjZ6JvwMjOqu49UhwOkM1
         8tChAF6M9Xnq8sA/DjxVY73Lo9MvIuvm1DRZvCeFXRv1qaZlpm7exLUsbKHlUyAqHT0v
         Gw3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794664095; x=1795268895;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uV9w4XdeJBMVabGCuGulxAnon3qiDUPy4KI5C/5BU4A=;
        b=lmrLI54NNYvLoqhd7be5lBj0jUPoPRbIgAR7QlGuiqal/I41yWsbCq95FFwMcbdQWC
         qy1rMY2QU6xZtbcVeaxuGphKUmlOzWbTcOxtpsrM8yQsZKMi62atRNAc5o+q0tp1sO76
         OquApgEP38G6H1C2Nz2UjACUoZZyHh6/7VQvmPJ0yhLSKvvTV9weXzG9cjEeKFxhmrcs
         iSXxSSNZaapBIU4eElyunWCwGtv6+sGEY/w0FUc/NoAJING6HZbNG9KdvZoSkTMI1PNI
         3RLlwCSXPYzoiX+ttkVc3ZODmIwDt5tMZ4zjjqEd0BKcJeT2KymorYKyCvZS9ebBPbmj
         BJ+Q==
X-Gm-Message-State: APuU4Z9mEsVexeNkdxbcjL8TmXeyqm+atq8dDZDe0tUh/UF+dAjTfdSP
	wAqu5R+aEOhXObDuMwqIFe1qv/7Qj9YhyQiKMCqYkavtPgAgc8sOkBHde/xO8DYAhJMNw07Fmcd
	M9WEjVwldJDDv3m2hB51bW2xD+lDg3P3TN7VZ
X-Gm-Gg: AYBFou2TGm3/GsLUUqsZkwQDBwrGw0Gt2rAlh80GXXv8cEe5yzn0vwyftpcQtXK3Rmf
	gqQKrZwgy55Dw7iDwoZGZEueCKjm4F3kLaUS8O6Bk1ID5s+p8OyBsfHfn4KSvcLf9sjpZJSUXPL
	Ds764E4L6EbcCv83zVI29P+BKLH2MX3ctBvg9tRuwFUGjZ0yyCMGQ1vE2lGu073RleQslQvdZai
	ssjcA5jtfiAMJJlrf68CybIued7bmL4JpCR+fyFjQbz/5D9XLdgKfbtGayKxXt0G1EMKiV9xtNg
	XoLeOyKg9lOOopwXQs4RV4Q2kIxL8tPZbCRTKKebyjyEloZ6UKcF42hMlnscVTkI8BHhc/weeZx
	pULdjSkBpPcBEkABC+nUrVgzA4oK9A2O9+nEIp7I=
X-Received: by 2002:a17:907:2d1e:b0:c4d:28c7:eb21 with SMTP id
 a640c23a62f3a-c50963967fcmr464257666b.29.1794664094926; Sat, 14 Nov 2026
 05:48:14 -0800 (PST)
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
 <20261113110546.173624-4-a.shimko.dev@gmail.com> <sashiko-outbox-214383@kernel.org>
In-Reply-To: <sashiko-outbox-214383@kernel.org>
From: Artem Shimko <a.shimko.dev@gmail.com>
Date: Sat, 14 Nov 2026 16:48:03 +0300
X-Gm-Features: AclHuK9MsmyVhAUhfYgzoV6y_gIsPjRJJ1_oeWNNQdGoTcpp9jpoFerTmOwCi6c
Message-ID: <CAOPX745DWr_y5VfuCGoyJDKj=mXOpxWsA8TyzETwpVjeOjPEHg@mail.gmail.com>
Subject: Re: [PATCH net-next 3/3] net: phy: dap8211r: add led hardware control support
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, linux-leds@vger.kernel.org, robh@kernel.org, 
	conor+dt@kernel.org, lee@kernel.org, Andrew Lunn <andrew@lunn.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 14, 2026 at 2:06=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 2 potential
> issues to consider:
> - [Medium] net: phy: dap8211r: link trigger rejected in
>   dap8211r_led_hw_is_supported()
> - [Medium] net: phy: dap8211r: LED register not cleared in
>   dap8211r_led_hw_control_set()
> --
>
> commit 7e5f0824bef63e117be29a9ce8d9c67d5c813bfa
> Author: Artem Shimko <a.shimko.dev@gmail.com>
>
> net: phy: dap8211r: add led hardware control support
>
> This commit adds hardware LED control support to the DAP8211R PHY driver =
by
> implementing the led_hw_is_supported(), led_hw_control_set(), and
> led_hw_control_get() callbacks.
>
> > diff --git a/drivers/net/phy/dap8211r.c b/drivers/net/phy/dap8211r.c
> > index 4eb50c26397fb..2e371c231d32c 100644
> > --- a/drivers/net/phy/dap8211r.c
> > +++ b/drivers/net/phy/dap8211r.c
> [ ... ]
> > @@ -57,6 +58,33 @@
> >   */
> >  #define DAP8211R_DEFAULT_DEL_SEL     0xD
> >
> > +#define DAP8211R_LED_ID_0            0
> > +#define DAP8211R_LED_ID_1            1
> > +#define DAP8211R_LED_ID_2            2
> > +#define DAP8211R_LED_0                       0xA00C
> > +#define DAP8211R_LED_1                       0xA00D
> > +#define DAP8211R_LED_2                       0xA00E
> > +#define DAP8211R_LED_ACT_BLINK               BIT(13)
> > +#define DAP8211R_LED_FULL_DUPLEX     BIT(12)
> > +#define DAP8211R_LED_HALF_DUPLEX     BIT(11)
> > +#define DAP8211R_LED_TX                      BIT(10)
> > +#define DAP8211R_LED_RX                      BIT(9)
> > +#define DAP8211R_LED_LINK_1000               BIT(6)
> > +#define DAP8211R_LED_LINK_100                BIT(5)
> > +#define DAP8211R_LED_LINK_10         BIT(4)
> > +
> > +#define DAP8211R_LED_LINK            (DAP8211R_LED_LINK_10   | \
> > +                                     DAP8211R_LED_LINK_100   | \
> > +                                     DAP8211R_LED_LINK_1000)
> > +
> > +#define DAP8211R_LED_SUPPORTED_TRG   (BIT(TRIGGER_NETDEV_LINK_10)    |=
 \
> > +                                     BIT(TRIGGER_NETDEV_LINK_100)    |=
 \
> > +                                     BIT(TRIGGER_NETDEV_LINK_1000)   |=
 \
> > +                                     BIT(TRIGGER_NETDEV_TX)          |=
 \
> > +                                     BIT(TRIGGER_NETDEV_RX)          |=
 \
> > +                                     BIT(TRIGGER_NETDEV_HALF_DUPLEX) |=
 \
> > +                                     BIT(TRIGGER_NETDEV_FULL_DUPLEX))
>
> [Severity: Medium]
> Should DAP8211R_LED_SUPPORTED_TRG include BIT(TRIGGER_NETDEV_LINK)?
>
> Without it, dap8211r_led_hw_is_supported() returns -EOPNOTSUPP whenever
> TRIGGER_NETDEV_LINK is requested, so enabling the netdev link trigger on =
a
> DAP8211R LED fails and the TRIGGER_NETDEV_LINK handling in
> dap8211r_led_hw_control_set() is never reached.

agreed

>
> > @@ -142,6 +170,156 @@ static int dap8211r_modify_ext(struct phy_device =
*phydev, u16 reg, u16 mask, u16
> [ ... ]
> > +static int dap8211r_led_hw_control_set(struct phy_device *phydev, u8 i=
ndex, unsigned long rules)
> > +{
> > +     u16 led_mode =3D 0, led_reg;
> > +
> > +     switch (index) {
> > +     case DAP8211R_LED_ID_0:
> > +             led_reg =3D DAP8211R_LED_0;
> > +             break;
> > +     case DAP8211R_LED_ID_1:
> > +             led_reg =3D DAP8211R_LED_1;
> > +             break;
> > +     case DAP8211R_LED_ID_2:
> > +             led_reg =3D DAP8211R_LED_2;
> > +             break;
> > +     default:
> > +             return -EINVAL;
> > +     }
> > +
> > +     if (test_bit(TRIGGER_NETDEV_LINK, &rules))
> > +             led_mode |=3D DAP8211R_LED_LINK;
> > +
> > +     if (test_bit(TRIGGER_NETDEV_LINK_10, &rules))
> > +             led_mode |=3D DAP8211R_LED_LINK_10;
> > +
> > +     if (test_bit(TRIGGER_NETDEV_LINK_100, &rules))
> > +             led_mode |=3D DAP8211R_LED_LINK_100;
> > +
> > +     if (test_bit(TRIGGER_NETDEV_LINK_1000, &rules))
> > +             led_mode |=3D DAP8211R_LED_LINK_1000;
> > +
> > +     if (test_bit(TRIGGER_NETDEV_RX, &rules))
> > +             led_mode |=3D DAP8211R_LED_RX | DAP8211R_LED_ACT_BLINK;
> > +
> > +     if (test_bit(TRIGGER_NETDEV_TX, &rules))
> > +             led_mode |=3D DAP8211R_LED_TX | DAP8211R_LED_ACT_BLINK;
> > +
> > +     if (test_bit(TRIGGER_NETDEV_HALF_DUPLEX, &rules))
> > +             led_mode |=3D DAP8211R_LED_HALF_DUPLEX;
> > +
> > +     if (test_bit(TRIGGER_NETDEV_FULL_DUPLEX, &rules))
> > +             led_mode |=3D DAP8211R_LED_FULL_DUPLEX;
> > +
> > +     if (!led_mode)
> > +             return -EOPNOTSUPP;
> > +
> > +     return dap8211r_write_ext(phydev, led_reg, led_mode);
> > +}
>
> [Severity: Medium]
> Does returning -EOPNOTSUPP when led_mode is 0 leave the previous trigger =
bits
> enabled in the PHY register when all trigger rules are cleared?
>
> When the last active netdev trigger rule is disabled (rules =3D=3D 0),
> dap8211r_led_hw_is_supported() returns 0, so set_baseline_state() in
> drivers/leds/trigger/ledtrig-netdev.c calls hw_control_set() with mode =
=3D=3D 0
> to turn off the hardware triggers.  Returning -EOPNOTSUPP here skips
> dap8211r_write_ext(), leaving the old configuration active in led_reg.

yeah, this check is no need and causes issues with rules =3D=3D 0 case.

I'll fix in v2. Thanks.
