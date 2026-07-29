Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52A333C1D5A
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 16:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785342742; cv=pass; b=kfvSpaJrORZYBgoaq+M0XyDyAm4uO/QJL13dRc3UsUcSfSga2zxPhE4SjisIaX7wC2VT6M4MzZv7qMtNuEiACXPGl883FmN0MKO6Wy5UXOlj21gTlIbuUpVJ4F2YPnoSSOGLg0jSLsUWUXGmDAzSZWPxMht5MjtMkCmADZFt4xQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785342742; c=relaxed/simple;
	bh=DAtgpZj1DNS+c1m55PrDVqDn1j/YKlo7Xv6LfVC98fQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gWULY6wky+kNZkWdA0gdpQqV6p9Io4X8KTXN0pt+ZBdmxWdLpaSYYDPdhxbuTCJotY0QP665SOVJHe+GoGZpYqyOq5cBRz1a672vUQj/mWagNT0IZrlRP4HPIWyqTPLgOZz84Z8VizjSf1vbN0K38cGfOn0+/xm9jjgbYiwrwZE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TkzYL0AI; arc=pass smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TkzYL0AI"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-51c2808dbc3so7578621cf.1
        for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 09:32:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785342740; cv=none;
        d=google.com; s=arc-20260327;
        b=bi5+mi3MDV+lNCobEXGNaWC9OzwDj+2xNOplFvWaTtkTB/KiI1RDbGGbuW/2lcRil0
         jPu3XFastWBWH9w9p5cvUOTeANzaLGkIT10jcENVnAsZbDt0lXMb14miPb+kO1puJAPd
         xVipQpgu0Zaol3opEJY8eyzfhJp6kPiXqTEdR2RJpouGjurBrQXfskvLgVjxxQr4Swf9
         AK00U4LXMZ0d33ixKVpqDHmrVtu6g6huMJyva3kfZ6HBj1VaacmpRJCSvTapPfIyTSkx
         +9TnLlivhuIi6d+XNRAYIlyW1T0vWRq4AUKP8+2YNhGQPjDEzINOif5QByw6Lu0Shs2S
         VgUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Q7pTQ84ALbX/4r2igPejPxSAqnbe2d+NJmIUI1AGgJ0=;
        fh=J6BBWMeRxko+oJRZETeKeuKUP+Lw47eQRt4GhS7cQAk=;
        b=BWGZMYwih1IZQOIwZwsZLINkZxbmjqZ630a9ZNvLz/YZ8F2cVgFm8Sci0wv7ARddJk
         oD7dQsAxkuecAzgzVUYmmE5CcZbfr6UUooLN2YutA91i+MT7lsvssH+aaK+RzEZANTk8
         4kVt44aBVyhjLPMGabQZsrEgfwh1/BrghWa12JKtQ7US8vobkG6/79E/Evpe61c+g5JW
         1uXZVR/704UoVR9/bLMF2L8qrV5ktn/OLkCtH1i02xgZDQ3+lKA/wMUvgMpOqeRI2Twd
         fGRKg7U2JW5omL3lKb0pQ9AbF+Q3qI3VqDvb1+eZbooaqFvlR/pVDzYzjvMIaoWFzl9M
         O3+w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785342740; x=1785947540; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Q7pTQ84ALbX/4r2igPejPxSAqnbe2d+NJmIUI1AGgJ0=;
        b=TkzYL0AI0C+sps+hglf3P6W8Byegmj5eaGWsgOCzTg3NNmpDBrhW6Dx5Gqn7WCe4XV
         Hhad/c+C6c0iuRGpyWZE8YPRtLauT2eJVnG4KPuWuBV6Ie2yRXZpPO8aHCiCMxD9s+TE
         aSzd27L6D/l8jaOYF94Iy2PbFk/v5fCbop6H0pkhbCfLggTY60hVJla3fahHlim1rvSk
         iRVSKZ4cXswi/lLKUIQqPZ5XogzKKrYJCmgge+vpOZmIFS+bKmCWHqZcpZUbhtxJevzc
         E9Gs7dxY2usnyohSsplwoaEFau3AF81Ep5D8kp2oRE5H+sOPGi01NwULsf2P8isehTdM
         dmkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785342740; x=1785947540;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q7pTQ84ALbX/4r2igPejPxSAqnbe2d+NJmIUI1AGgJ0=;
        b=hBhw8b1bp9JNxTjowQXM2lZJHeXoKUMdQft0W+62OlWNWTOodRDQ/Qt63JRLGYKSTx
         AyCZ413DiVghQSeaEtarh/DatM6PMxEPyOuBAXHFBTTHLtwO34hpHDHaMmDaO2aqomfO
         icZnLvBvE4k4ge0y3hWtlgMGFwINS8IOl6dGSqD4QxOAsclrUo1kpeAcPqa34TXgGnkK
         SvzmqubH0hi1RH6TxlqTdlwEZsxYlxBL9Q6NNLcNsgaCmNl6OZZjQr/2XZnEZlkfyoIg
         bnrWJpozlAKde2qa3fbnE/Lyear+P08ryAuYexUrKPKcFm4K7EV7KHYhMN5FHSGGHL4T
         f/5w==
X-Forwarded-Encrypted: i=1; AHgh+RqXHolA8EDNw+Qf/FqOllMEsj7yKAkRDgyNX0bdoYxsTL798RDavtKueA3Dv00PEqXF+VNK9g3GfylH@vger.kernel.org
X-Gm-Message-State: AOJu0YxchvgsSTjOpm+3LuAYxvxuaFn2UTMZiBiEIc/OMuG8DEdNyIX3
	0pfdhTHqX4XAtWVa6KwtlyVW1z7Kt1FE98sa/SkjDDX2y6DHfxn1uSec0ET9cMrkHg9uIqOnE4M
	qhPPsc12Sjn7o12x8U6RPnoit+ZKHxnM=
X-Gm-Gg: AR+sD136mDgb58iIsbavjXQnXY2D0T2ugMPovZAljsP7vwAT7/o+D609/o4u5s6COdf
	hCo+QHb4dTXR9baAMeBZZPgA1t6J4L0ldpsTWZTqF8SjCJboYHLUsIrQZLFfyc3yh8ViL+c+tUX
	2yV1cW1tzyerqrKQl/9zcDqqJCWBk+YJa2z/YNiWDLBKbI9sH7ZpovEOIySGwrQteWba7JOC2Mz
	hyZ6TM7o9mr+9Y4SxhqX4yTSsqbl9f9CM3XkfI/YIt3qd/QRlg1yF3cokrj/xRBSxkL0pmFiAMZ
	RU0b/g76TGVAmH6QSbiaBM2C+TAdOKVia54HYSiBSVwL31umeKLQvK2Ce+Dr9hdZ+D5sJ7CFaHM
	=
X-Received: by 2002:ac8:5747:0:b0:51c:19af:6341 with SMTP id
 d75a77b69052e-529d713873fmr69349981cf.36.1785342739913; Wed, 29 Jul 2026
 09:32:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250925-rk3576-evb1-dsi-v1-1-c76fc3740abc@gmail.com>
 <748fd61a-31fb-436f-b028-b47807a4860c@gmail.com> <12339028.CDJkKcVGEf@phil> <29759328.czjnFlTdjD@diego>
In-Reply-To: <29759328.czjnFlTdjD@diego>
From: Alexey Charkov <alchark@gmail.com>
Date: Wed, 29 Jul 2026 20:32:08 +0400
X-Gm-Features: AUfX_mzBEaSdgIsBEYN7VZbYtoGsNzcTEENadfy3YmzUtDsOgmQlt3t77sIoNTw
Message-ID: <CABjd4Yy7kzPFxSakaGqY18hyJCfQf5neCoHBdm4DueFrfnda0A@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: rockchip: Add DSI LCD display on rk3576-evb1
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org, 
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 29, 2026 at 6:46=E2=80=AFPM Heiko St=C3=BCbner <heiko@sntech.de=
> wrote:
>
> Am Montag, 20. Oktober 2025, 14:31:12 Mitteleurop=C3=A4ische Sommerzeit s=
chrieb Heiko Stuebner:
> > Am Montag, 20. Oktober 2025, 10:50:58 Mitteleurop=C3=A4ische Sommerzeit=
 schrieb Alexey Charkov:
> > >
> > > On Mon, Oct 20, 2025 at 12:31=E2=80=AFPM Heiko Stuebner <heiko@sntech=
.de> wrote:
> > > >
> > > > Am Montag, 20. Oktober 2025, 10:19:51 Mitteleurop=C3=A4ische Sommer=
zeit schrieb Alexey Charkov:
> > > > > On Thu, Sep 25, 2025 at 12:38=E2=80=AFAM Alexey Charkov <alchark@=
gmail.com> wrote:
> > > > > >
> > > > > > Add support for the Rockchip W552793DBA-V10 LCD+touchscreen ass=
embly which
> > > > > > comes physically attached to Rockchip RK3576 EVB1 boards.
> > > > > >
> > > > > > The display part is driven by the on-chip MIPI DSI controller, =
and the
> > > > > > touchscreen is connected over I2C.
> > > > > >
> > > > > > Signed-off-by: Alexey Charkov <alchark@gmail.com>
> > > > > > ---
> > > > > > Note that backlight support is left out for now, as it depends =
on PWM
> > > > > > support [0] which has not yet been merged.
> > > > > >
> > > > > > A workaround is simply `gpioset -c 0 13=3D1` to set the respect=
ive GPIO
> > > > > > pin high and thus to light up the display unconditionally.
> > > > > >
> > > > > > [0] https://lore.kernel.org/lkml/20250602-rk3576-pwm-v2-0-a6434=
b0ce60c@collabora.com/
> > > > > > ---
> > > > > >  arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts | 89 ++++++++=
++++++++++++++++
> > > > > >  1 file changed, 89 insertions(+)
> > > > >
> > > > > Hi Heiko,
> > > > >
> > > > > Any thoughts about this one? Can we perhaps get it merged for -ne=
xt?
> > > >
> > > > Does the gpio-backlight work on that device?
> > > > That would make the gpioset hack unnecessary.
> > >
> > > I've got a local patch using pwm-gpio and pwm-backlight as a stop-gap
> > > solution, but I don't think it's worth merging upstream, because the
> > > backlight is supposed to be driven by the hardware PWM on the same pi=
n
> > > (not bit-banging the GPIO line). After all, Nicolas has been working =
on
> > > adding a proper hardware PWM driver for RK3576.
> > >
> > > The display itself works without PWM support, and so does the touchsc=
reen.
> >
> > Right now, I don't think we have an actual timeline if/when Nicolas wil=
l
> > be able to work on the pwm again. So my idea was if we want to
> > integrate the baclight as you described below, to have an actual usable
> > display and then when the new pwm has landed switch over to that one?
>
> With the ELCE around the corner we're nearing the year-mark here ;-)
> (And I'm surprised, I remembered this pending patch)

I've been hoping that Nicolas' PWM series gets further along in the meantim=
e :)

> So how about integrating your gpio-pwm backlight for the time being?

Could do that, but I'm worried if it would immediately become set in
stone because DT is ABI, making it hard to switch to a "proper"
hardware-driven PWM once Nicolas' series lands.

> Or alternatively just going with a gpio-backlight, like the Anbernic Vita=
 did:
>
>         /*
>          * LEDs and Backlights can be controlled as a PWM, but PWM
>          * support is not yet available.
>          */
>         gpio_backlight: backlight {
>                 compatible =3D "gpio-backlight";
>                 gpios =3D <&gpio2 RK_PC4 GPIO_ACTIVE_HIGH>;
>                 pinctrl-0 =3D <&led_backlight_h>;
>                 pinctrl-names =3D "default";
>         };

In the case of RK3576 EVB1 enabling it at full power is eye-burning
bright, so some sort of PWM is definitely warranted.

Best regards,
Alexey
