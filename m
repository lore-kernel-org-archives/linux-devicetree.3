Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 141E837FF60;
	Wed, 29 Jul 2026 17:35:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785346536; cv=none; b=qNz0YmA72mkGLPML5SwkCejEJ6lVx8tUXr4LGA8Nx+qg/ecPvqpqo5EWVhmnQxiFlMpLw3WGHQs1SmM2wjxHC496S9rYaKn8DTjGaa67GnmTtw0S6oGkFGyXGUUMDLEagxJ5UzZUkaWkhica8a4HtsJeCJJny5nZvxYcVAu9rEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785346536; c=relaxed/simple;
	bh=gPi8TkEHY3RtMgerz/Hf8z/cEz9b0HNTR/BKFT95V14=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=p4B5zkAkaZvVkiSTy1G8Y7iMzsku9drsA089h6xHMveDkiBVzM1axHkCYAQ5EHkYpBo9k/HNPn4pm4GUAIoS8v2GaYqE8mLc9B1XVzrRXTw9NZEwKvgoW9lAKcYzNgJcNWb9RPW9hlE2CUMvZzXX9ukqbuegxX/gjbY9YSGf8XY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=0VN8FIB2; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="0VN8FIB2"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=PpUrkAYPFOVA1pV5Hqor5M/8KfkA4Zbov6foGmLt584=; b=0VN8FIB2IsiVhWK2p21wuwWWqr
	1s2Yll/671IrZG4xK0SXvE8kKTBU/U/Fv3UrEqxR74QvYcjemQlGi/1E4a3TWcqmJB6/mM1qaXzcc
	zZv56SvcjWWgUwXh6KwjztEA3TQhdXMY1vpwbcbOCZ5PEoGjIlwcUvw75Ympun009ppy+aIa7jy5G
	EfbfxdsNwAyZk9gGi1qvURU0dDfByTiKUvzoZsTVnA2Y6yJ5KI+WF9rFV6gdh7Nl+BDJ2WbLSY4aE
	xGDRT3R1XlGB0an+5X0wZGPVG0tPftDJHEVSLGxjb+r8mus24Ii9963sc/AzkjILveFkNybI5kacS
	g+NuHZSg==;
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Alexey Charkov <alchark@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Subject: Re: [PATCH] arm64: dts: rockchip: Add DSI LCD display on rk3576-evb1
Date: Wed, 29 Jul 2026 19:35:22 +0200
Message-ID: <12148936.RiKt1P0BV1@diego>
In-Reply-To:
 <CABjd4Yy7kzPFxSakaGqY18hyJCfQf5neCoHBdm4DueFrfnda0A@mail.gmail.com>
References:
 <20250925-rk3576-evb1-dsi-v1-1-c76fc3740abc@gmail.com>
 <29759328.czjnFlTdjD@diego>
 <CABjd4Yy7kzPFxSakaGqY18hyJCfQf5neCoHBdm4DueFrfnda0A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Am Mittwoch, 29. Juli 2026, 18:32:08 Mitteleurop=C3=A4ische Sommerzeit schr=
ieb Alexey Charkov:
> On Wed, Jul 29, 2026 at 6:46=E2=80=AFPM Heiko St=C3=BCbner <heiko@sntech.=
de> wrote:
> >
> > Am Montag, 20. Oktober 2025, 14:31:12 Mitteleurop=C3=A4ische Sommerzeit=
 schrieb Heiko Stuebner:
> > > Am Montag, 20. Oktober 2025, 10:50:58 Mitteleurop=C3=A4ische Sommerze=
it schrieb Alexey Charkov:
> > > >
> > > > On Mon, Oct 20, 2025 at 12:31=E2=80=AFPM Heiko Stuebner <heiko@snte=
ch.de> wrote:
> > > > >
> > > > > Am Montag, 20. Oktober 2025, 10:19:51 Mitteleurop=C3=A4ische Somm=
erzeit schrieb Alexey Charkov:
> > > > > > On Thu, Sep 25, 2025 at 12:38=E2=80=AFAM Alexey Charkov <alchar=
k@gmail.com> wrote:
> > > > > > >
> > > > > > > Add support for the Rockchip W552793DBA-V10 LCD+touchscreen a=
ssembly which
> > > > > > > comes physically attached to Rockchip RK3576 EVB1 boards.
> > > > > > >
> > > > > > > The display part is driven by the on-chip MIPI DSI controller=
, and the
> > > > > > > touchscreen is connected over I2C.
> > > > > > >
> > > > > > > Signed-off-by: Alexey Charkov <alchark@gmail.com>
> > > > > > > ---
> > > > > > > Note that backlight support is left out for now, as it depend=
s on PWM
> > > > > > > support [0] which has not yet been merged.
> > > > > > >
> > > > > > > A workaround is simply `gpioset -c 0 13=3D1` to set the respe=
ctive GPIO
> > > > > > > pin high and thus to light up the display unconditionally.
> > > > > > >
> > > > > > > [0] https://lore.kernel.org/lkml/20250602-rk3576-pwm-v2-0-a64=
34b0ce60c@collabora.com/
> > > > > > > ---
> > > > > > >  arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts | 89 ++++++=
++++++++++++++++++
> > > > > > >  1 file changed, 89 insertions(+)
> > > > > >
> > > > > > Hi Heiko,
> > > > > >
> > > > > > Any thoughts about this one? Can we perhaps get it merged for -=
next?
> > > > >
> > > > > Does the gpio-backlight work on that device?
> > > > > That would make the gpioset hack unnecessary.
> > > >
> > > > I've got a local patch using pwm-gpio and pwm-backlight as a stop-g=
ap
> > > > solution, but I don't think it's worth merging upstream, because the
> > > > backlight is supposed to be driven by the hardware PWM on the same =
pin
> > > > (not bit-banging the GPIO line). After all, Nicolas has been workin=
g on
> > > > adding a proper hardware PWM driver for RK3576.
> > > >
> > > > The display itself works without PWM support, and so does the touch=
screen.
> > >
> > > Right now, I don't think we have an actual timeline if/when Nicolas w=
ill
> > > be able to work on the pwm again. So my idea was if we want to
> > > integrate the baclight as you described below, to have an actual usab=
le
> > > display and then when the new pwm has landed switch over to that one?
> >
> > With the ELCE around the corner we're nearing the year-mark here ;-)
> > (And I'm surprised, I remembered this pending patch)
>=20
> I've been hoping that Nicolas' PWM series gets further along in the meant=
ime :)
>=20
> > So how about integrating your gpio-pwm backlight for the time being?
>=20
> Could do that, but I'm worried if it would immediately become set in
> stone because DT is ABI, making it hard to switch to a "proper"
> hardware-driven PWM once Nicolas' series lands.

The backlight subsystem is using dev_name() to name the sysfs node.
So if you keep the node name to "backlight", the backlight device stays the
same.

I guess the question is if you also consider the brightness levels as
unchangeable, though I would assume any sane system should just read
max_brightness and adjust accordingly.

Also this is an eval-board ... so you won't have any actual real-world
users :-) .

So, personally I don't see the big hickup here, but we'll do what you
think best.


Heiko

> > Or alternatively just going with a gpio-backlight, like the Anbernic Vi=
ta did:
> >
> >         /*
> >          * LEDs and Backlights can be controlled as a PWM, but PWM
> >          * support is not yet available.
> >          */
> >         gpio_backlight: backlight {
> >                 compatible =3D "gpio-backlight";
> >                 gpios =3D <&gpio2 RK_PC4 GPIO_ACTIVE_HIGH>;
> >                 pinctrl-0 =3D <&led_backlight_h>;
> >                 pinctrl-names =3D "default";
> >         };
>=20
> In the case of RK3576 EVB1 enabling it at full power is eye-burning
> bright, so some sort of PWM is definitely warranted.
>=20
> Best regards,
> Alexey
>=20




