Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C9CA24A047;
	Fri, 17 Apr 2026 23:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776467533; cv=none; b=Z9M79WVJXFXUMS5coife8IsO8ESLFj719M0xZ0RIAF1HTjdZRh9SsdJptWWWD4WeMdL1FMa8iEfPXCkPmhpVH6nibpuCY0MsZ9revM8zurdLa95m+hNxVtnoxWHnULi7Jcig6DNbSYVkmwHF/zvuGIBXqfrZ9nzX9K7lcrLvT2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776467533; c=relaxed/simple;
	bh=4bblBGSL1f2hJrlDzK6fXgU7jLCMARyVgrGK1vmgc0s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=laNUZOab5CYwuwzxOJXFSo86H1IeOURUJxF7uDwkdJNcDpvwLF3Sihkjw7oeOmmnOkW6U4KkTEb8OreqWjjzAt3vI4w5pC6CCxw3EU7xWCjlTZr5XWwYFLL884lJqui/af9pxVgFugkvZTN6but2rODLSybuk20ApOdH9Qrsb/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=Hn//9lpm; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="Hn//9lpm"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=OX7xe87h18UEYQ/QaaM5hIYsx/fVizMj3KUfwM6/Tug=; b=Hn//9lpmGlH/Sc8sWAr5U3iWyQ
	NdJXhECA0sDzP0ZaPV7oR0N+RP3vOmv4KuQhI5bw0fGkWWSYdV6Yx7aaaOanfQKy7DiosBurauOp6
	Jn/7ZXX+7hzCub21m5S+KWpmwi2BYO9JC2IxosgodA1+jSqQdVAlBjahUyipHKOwwNWobtUhGrulU
	8N4gs506pZYhPgBU/nMSvr3QT/C2qql2AJPCXfEXmNTW5/jwK2BKO2IjL+mO2/sAHrQ9a7NVdClYa
	zNvvajE8AkebH6vp9ysuIg4FfNLEaRY5NKpaMCftH1YhlfSMXuXmEwSjX590+w5idM/HPkfXLMPkU
	dqoOlbMQ==;
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: kernel@collabora.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH 05/40] arm64: dts: rockchip: Add frl-enable-gpios to
 rk3576-luckfox-core3576
Date: Sat, 18 Apr 2026 01:12:00 +0200
Message-ID: <2282688.C4sosBPzcN@phil>
In-Reply-To: <62f51359-9d91-4107-917b-cd722c7321c2@collabora.com>
References:
 <20260417-dts-rk-frl-enable-gpios-v1-0-a19c0dd8c9f6@collabora.com>
 <2000470.6tgchFWduM@phil>
 <62f51359-9d91-4107-917b-cd722c7321c2@collabora.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Hi Cristian,

Am Freitag, 17. April 2026, 18:34:17 Mitteleurop=C3=A4ische Sommerzeit schr=
ieb Cristian Ciocaltea:
> On 4/17/26 2:32 PM, Heiko Stuebner wrote:
> > the comments below apply sort of to all patches in that series.
> >=20
> > Am Freitag, 17. April 2026, 11:24:39 Mitteleurop=C3=A4ische Sommerzeit =
schrieb Cristian Ciocaltea:
> >> The board exposes the GPIO4_C6 line to control the voltage bias on the
> >> HDMI data lines.  It must be asserted when operating in HDMI 2.1 FRL
> >> mode and deasserted for HDMI 1.4/2.0 TMDS mode.
> >>
> >> Wire up the HDMI node to the GPIO line using the frl-enable-gpios
> >> property and drop the line from the vcc_5v0_hdmi regulator to allow
> >> adjusting the bias when transitioning between TMDS and FRL operating
> >> modes.
> >>
> >> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> >> ---
> >>  arch/arm64/boot/dts/rockchip/rk3576-luckfox-core3576.dtsi | 9 ++++---=
=2D-
> >>  1 file changed, 4 insertions(+), 5 deletions(-)
> >>
> >> diff --git a/arch/arm64/boot/dts/rockchip/rk3576-luckfox-core3576.dtsi=
 b/arch/arm64/boot/dts/rockchip/rk3576-luckfox-core3576.dtsi
> >> index 749f0a54b478..93ae37699366 100644
> >> --- a/arch/arm64/boot/dts/rockchip/rk3576-luckfox-core3576.dtsi
> >> +++ b/arch/arm64/boot/dts/rockchip/rk3576-luckfox-core3576.dtsi
> >> @@ -140,10 +140,7 @@ regulator-state-mem {
> >> =20
> >>  	vcc_5v0_hdmi: regulator-vcc-5v0-hdmi {
> >>  		compatible =3D "regulator-fixed";
> >> -		enable-active-high;
> >> -		gpios =3D <&gpio4 RK_PC6 GPIO_ACTIVE_HIGH>;
> >> -		pinctrl-names =3D "default";
> >> -		pinctrl-0 =3D <&hdmi_con_en>;
> >> +		regulator-always-on;
> >>  		regulator-min-microvolt =3D <5000000>;
> >>  		regulator-max-microvolt =3D <5000000>;
> >>  		regulator-name =3D "vcc_5v0_hdmi";
> >=20
> > I think this regulator was sort of a complete hack, to set that
> > gpio to some sort of default state, by declaring it as hdmi-pwr-supply.
> >=20
> > Only 2 rk3576 boards seem, to use that hack, so I think as that "regula=
tor"
> > is completely functionless now, the whole thing could be removed?
>=20
> Ack, let's just drop it.
>=20
> >=20
> >=20
> >> @@ -231,6 +228,8 @@ &gpu {
> >>  };
> >> =20
> >>  &hdmi {
> >> +	pinctrl-0 =3D <&hdmi_txm0_pins &hdmi_tx_scl &hdmi_tx_sda &hdmi_frl_e=
n>;
> >> +	frl-enable-gpios =3D <&gpio4 RK_PC6 GPIO_ACTIVE_LOW>;
> >=20
> > this should be sorted the other way around I think.
> >=20
> > Also please provide a pinctrl-names property too. If for whatever reason
> > the dw-hdmi aquires a 2nd pinctrl state in the future, this makes sure
> > board DTs are staying in the "old" compatible mode until they are adapt=
ed.
>=20
> Just to make sure I fully understand, the convention is that=20
>=20
>   pinctrl-names =3D "default";
>=20
> should be always provided, even when the node overrides an existing pinct=
rl-0
> property?
>=20
> E.g. in rk3576.dtsi we have:
>=20
>   hdmi: hdmi@27da0000 {
>     ...
>     pinctrl-names =3D "default";
>     pinctrl-0 =3D <&hdmi_txm0_pins &hdmi_tx_scl &hdmi_tx_sda>;
>     ...
>   }
>=20
> Hence I omitted pinctrl-names which doesn't change and just appended
> &hdmi_frl_en to pinctrl-0's original value.

correct, please always provide a pinctrl-names entry when setting a new
pinctrl-0 .

The background is, imagine you have a base:

pinctrl-names =3D "default";
pinstrl-0 =3D <....>;

and override pinctrl-0 in a board.

Now a newer binding introduces a 2nd pinctrl state "foo". Of course
we're backwards compatible, and both are valid and the driver checks
what states are defined.

So the base sets:
pinctrl-names =3D "default", "foo";
pinctrl-0 =3D <...>;
pinctrl-1 =3D <...>;

in your (old) board you override pinctrl-0, but the driver still sees
the new variant with 2 pinctrl states, where it should've stayed with
the legacy 1-state, until the board-dts might get adapted in the future.


And I know, we're likely not doing that everywhere, and also in most
cases it won't really matter, but still it is safer and sets the better
precedent :-) .


> >>  	status =3D "okay";
> >>  };
> >> =20
> >> @@ -655,7 +654,7 @@ &pcie0 {
> >> =20
> >>  &pinctrl {
> >>  	hdmi {
> >> -		hdmi_con_en: hdmi-con-en {
> >> +		hdmi_frl_en: hdmi-frl-en {
> >=20
> > pinctrl names should ideally match the naming in schematics, for exampl=
e the
> > "HDMI0_TX_ON_H" for jaguar and tiger. This makes it way easier to> go f=
rom DT
> > to schematics and back.
>=20
> I opted for a more descriptive name that could be used consistently acros=
s all
> boards, given that not all schematics are publicly available.
>=20
> You make a fair point though, we should probably stick with the pretty te=
rrible
> hdmi[N]_tx_on_h naming instead.

yep, we're doing that everywhere else already too, and sticking to the
schematics naming, also prevents any discussions about how something
should be named ;-) .


Heiko


