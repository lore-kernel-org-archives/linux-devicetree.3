Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADF5C38910E;
	Wed, 29 Jul 2026 14:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785336417; cv=none; b=uwcu5kvBGjL4rqLcfJJu5mVolL77jyNV1VgvBaMDk04U7Aj/je9RPREbOHvtdxAWja+vi2OEJN4ncYcqS8A7SfkpJRHtfMgeePnr9yZXBvUJN06+2CAp/7+OyLU/h6IMoQEVi+UBASdp/Fz0g0ephSXelYgntEV/eZu+RUHw/Z0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785336417; c=relaxed/simple;
	bh=ac5MqdTH/iMPTH0Pd2RDhWIfUJ0atyomKfgvP0KD3Lc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LzIJ7lQ8Sh1deSFTswoswH6EGSMOsWC3ccgdsOVW4g/eqWnGascAmO80f/bPWD0OCmCjYfGqFcidpLpJBIIBjv0MUdMopwtL87/hSyxDdq2JoSNp5GVzelDYUe7ZcBhEEH0sXE+T6heyeQH2FZBLOsYuctlzl58bR96ffx2nQaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=c2Iwj9ry; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="c2Iwj9ry"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=zJcsJ8fR+ulIwIiOMxrp3nSK2qIbFs2gb9tc6WLrzyQ=; b=c2Iwj9ryzc7uaSSy6XQOv58vFx
	ysJ3eLDDGkq65DzSjVvj1Lxj02XFVF/lGve/vr7WU6/lgoXvyTVX6bTWnHP5RjZJzMWT18EeK8kyK
	whKrhnj8Z9zR3AbSk0ppWJvyS3roCfMvyeSaqqiJS9meUURiohi99+AWgqe5+NpPwm2S1qcvclOg7
	uEEDgHQiYrLDspUjMEc6rFFnnknWPy47yCLvkNzoyDxmzsgnNsnVKHjIqPixQGggrwm7RMm+L9CEF
	e6KoB5ZwPHLjyzQOuqZSp7KIdMYsYConi4zPod81125RGDJ7MHqXHggALLhACVLFmo9Dy46bxkxYw
	YbPO3r4w==;
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Alexey Charkov <alchark@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Subject: Re: [PATCH] arm64: dts: rockchip: Add DSI LCD display on rk3576-evb1
Date: Wed, 29 Jul 2026 16:46:45 +0200
Message-ID: <29759328.czjnFlTdjD@diego>
In-Reply-To: <12339028.CDJkKcVGEf@phil>
References:
 <20250925-rk3576-evb1-dsi-v1-1-c76fc3740abc@gmail.com>
 <748fd61a-31fb-436f-b028-b47807a4860c@gmail.com> <12339028.CDJkKcVGEf@phil>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Am Montag, 20. Oktober 2025, 14:31:12 Mitteleurop=C3=A4ische Sommerzeit sch=
rieb Heiko Stuebner:
> Am Montag, 20. Oktober 2025, 10:50:58 Mitteleurop=C3=A4ische Sommerzeit s=
chrieb Alexey Charkov:
> >=20
> > On Mon, Oct 20, 2025 at 12:31=E2=80=AFPM Heiko Stuebner <heiko@sntech.d=
e> wrote:
> > >
> > > Am Montag, 20. Oktober 2025, 10:19:51 Mitteleurop=C3=A4ische Sommerze=
it schrieb Alexey Charkov:
> > > > On Thu, Sep 25, 2025 at 12:38=E2=80=AFAM Alexey Charkov <alchark@gm=
ail.com> wrote:
> > > > >
> > > > > Add support for the Rockchip W552793DBA-V10 LCD+touchscreen assem=
bly which
> > > > > comes physically attached to Rockchip RK3576 EVB1 boards.
> > > > >
> > > > > The display part is driven by the on-chip MIPI DSI controller, an=
d the
> > > > > touchscreen is connected over I2C.
> > > > >
> > > > > Signed-off-by: Alexey Charkov <alchark@gmail.com>
> > > > > ---
> > > > > Note that backlight support is left out for now, as it depends on=
 PWM
> > > > > support [0] which has not yet been merged.
> > > > >
> > > > > A workaround is simply `gpioset -c 0 13=3D1` to set the respectiv=
e GPIO
> > > > > pin high and thus to light up the display unconditionally.
> > > > >
> > > > > [0] https://lore.kernel.org/lkml/20250602-rk3576-pwm-v2-0-a6434b0=
ce60c@collabora.com/
> > > > > ---
> > > > >  arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts | 89 ++++++++++=
++++++++++++++
> > > > >  1 file changed, 89 insertions(+)
> > > >
> > > > Hi Heiko,
> > > >
> > > > Any thoughts about this one? Can we perhaps get it merged for -next?
> > >
> > > Does the gpio-backlight work on that device?
> > > That would make the gpioset hack unnecessary.
> >=20
> > I've got a local patch using pwm-gpio and pwm-backlight as a stop-gap=20
> > solution, but I don't think it's worth merging upstream, because the=20
> > backlight is supposed to be driven by the hardware PWM on the same pin=
=20
> > (not bit-banging the GPIO line). After all, Nicolas has been working on=
=20
> > adding a proper hardware PWM driver for RK3576.
> >=20
> > The display itself works without PWM support, and so does the touchscre=
en.
>=20
> Right now, I don't think we have an actual timeline if/when Nicolas will
> be able to work on the pwm again. So my idea was if we want to
> integrate the baclight as you described below, to have an actual usable
> display and then when the new pwm has landed switch over to that one?

With the ELCE around the corner we're nearing the year-mark here ;-)
(And I'm surprised, I remembered this pending patch)

So how about integrating your gpio-pwm backlight for the time being?

Or alternatively just going with a gpio-backlight, like the Anbernic Vita d=
id:

        /*
         * LEDs and Backlights can be controlled as a PWM, but PWM
         * support is not yet available.
         */
        gpio_backlight: backlight {
                compatible =3D "gpio-backlight";
                gpios =3D <&gpio2 RK_PC4 GPIO_ACTIVE_HIGH>;
                pinctrl-0 =3D <&led_backlight_h>;
                pinctrl-names =3D "default";
        };

DSI without backlight is a quite black screen, which I'd call non-working
still, so would require some form of backlight.


Heiko

> > My temp patch goes like this:
> >=20
> > ---
> >   arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts | 15 +++++++++++++++
> >   1 file changed, 15 insertions(+)
> >=20
> > diff --git a/arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts=20
> > b/arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts
> > index f20cd6f2c079..5c27fff03569 100644
> > --- a/arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts
> > +++ b/arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts
> > @@ -58,6 +58,14 @@ button-vol-up {
> >   		};
> >   	};
> >=20
> > +	backlight: backlight {
> > +		compatible =3D "pwm-backlight";
> > +		brightness-levels =3D <20 220>;
> > +		default-brightness-level =3D <100>;
> > +		num-interpolated-steps =3D <200>;
> > +		pwms =3D <&lcd_bl_pwm 0 25000 0>;
> > +	};
> > +
> >   	hdmi-con {
> >   		compatible =3D "hdmi-connector";
> >   		type =3D "a";
> > @@ -78,6 +86,12 @@ work_led: led-0 {
> >   		};
> >   	};
> >=20
> > +	lcd_bl_pwm: pwm {
> > +		#pwm-cells =3D <3>;
> > +		compatible =3D "pwm-gpio";
> > +		gpios =3D <&gpio0 RK_PB5 GPIO_ACTIVE_HIGH>;
> > +	};
> > +
> >   	vbus5v0_typec: regulator-vbus5v0-typec {
> >   		compatible =3D "regulator-fixed";
> >   		regulator-name =3D "vbus5v0_typec";
> > @@ -277,6 +291,7 @@ panel@0 {
> >   		compatible =3D "wanchanglong,w552793baa", "raydium,rm67200";
> >   		reg =3D <0>;
> >=20
> > +		backlight =3D <&backlight>;
> >   		iovcc-supply =3D <&vcc3v3_lcd_n>;
> >   		reset-gpios =3D <&gpio3 RK_PB5 GPIO_ACTIVE_LOW>;
> >   		vdd-supply =3D <&vcc3v3_lcd_n>;
> >=20
>=20
>=20




