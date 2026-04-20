Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8748927A123;
	Mon, 20 Apr 2026 15:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776698310; cv=none; b=snMDPg4z4NpMTLqLVAG9CLTlbaJjnNaF3/ILCvrcemvuXLSjhe93uPzYh7Dm/Zi8RejUXuSfcsFwYI/amMApRboTKwD0vuSGkBlWXiQG/DAdOad6ys99eKf9t9b29vY4CdEM+7qRBbRjHPJ9YPLV3FrnN+l5bml7lHWdRuw4+xM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776698310; c=relaxed/simple;
	bh=dNNtq8DI6VR8JNrZvQkRBPWrFpgNZEEl4qH794o5g+M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FK7dMPcBKHjpDKHEUPG5ll90RlomeMBzjEcyNGJJbw4LVxeUtv9UCV/eT+BmzAYyDCV2TeD/A+UsHkjiBoKONunVkujV62umh6IYTW9B8R5A8y60zZ13zNZqmWvtiastThouZYotCJmBfV0Wmb4PHzbRzQtgVXdS+9gLxbQ0pTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=U31pz7AS; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="U31pz7AS"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=1gFNXBO4mkz3Uo0BQPn36ROKj98JwT3Uw9lk0qqRPeI=; b=U31pz7AS+pKZlw8DECKWWCdIzm
	UbVlumxOOeJhtrd4wye+31FIUG3S4SXe8ghNU/eTWKZS/3Gw/H39IDjaCFEP3FcKjfahwPSrCvlsf
	DdKg0ZRMBC5KS6tniUHoaCBk/w6useh0ouaSV0+CTSkxC8V3lRR86vV/FcPKkeDLofbOR4eR1THqw
	jBcvFEJeO7DAGRhs+JYGuC5GbJfniMVGbypYN8GoxVgiMqjljvAQxYI5jEwQnwEskn1jirHPf156t
	Z+3yLTHcAHj8JEsmkHvttsBSrt8Z0+wwIBcLIa/gxvWm+JQedi62FDh2b5SeKIjSC4JWbPnny9YpL
	omofuhZw==;
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
Date: Mon, 20 Apr 2026 17:18:20 +0200
Message-ID: <2480203.yKrmzQ4Hd0@phil>
In-Reply-To: <401a020f-ca5d-4c7d-941e-f0288e144357@collabora.com>
References:
 <20260417-dts-rk-frl-enable-gpios-v1-0-a19c0dd8c9f6@collabora.com>
 <2282688.C4sosBPzcN@phil>
 <401a020f-ca5d-4c7d-941e-f0288e144357@collabora.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Am Montag, 20. April 2026, 13:00:25 Mitteleurop=C3=A4ische Sommerzeit schri=
eb Cristian Ciocaltea:
> Hi Heiko,
>=20
> On 4/18/26 2:12 AM, Heiko Stuebner wrote:
> > Hi Cristian,
> >=20
> > Am Freitag, 17. April 2026, 18:34:17 Mitteleurop=C3=A4ische Sommerzeit =
schrieb Cristian Ciocaltea:
> >> On 4/17/26 2:32 PM, Heiko Stuebner wrote:
> >>> the comments below apply sort of to all patches in that series.
> >>>
> >>> Am Freitag, 17. April 2026, 11:24:39 Mitteleurop=C3=A4ische Sommerzei=
t schrieb Cristian Ciocaltea:
> >>>> The board exposes the GPIO4_C6 line to control the voltage bias on t=
he
> >>>> HDMI data lines.  It must be asserted when operating in HDMI 2.1 FRL
> >>>> mode and deasserted for HDMI 1.4/2.0 TMDS mode.
> >>>>
> >>>> Wire up the HDMI node to the GPIO line using the frl-enable-gpios
> >>>> property and drop the line from the vcc_5v0_hdmi regulator to allow
> >>>> adjusting the bias when transitioning between TMDS and FRL operating
> >>>> modes.
>=20
> [...]
>=20
> >>>
> >>>
> >>>> @@ -231,6 +228,8 @@ &gpu {
> >>>>  };
> >>>> =20
> >>>>  &hdmi {
> >>>> +	pinctrl-0 =3D <&hdmi_txm0_pins &hdmi_tx_scl &hdmi_tx_sda &hdmi_frl=
_en>;
> >>>> +	frl-enable-gpios =3D <&gpio4 RK_PC6 GPIO_ACTIVE_LOW>;
> >>>
> >>> this should be sorted the other way around I think.
> >>>
> >>> Also please provide a pinctrl-names property too. If for whatever rea=
son
> >>> the dw-hdmi aquires a 2nd pinctrl state in the future, this makes sure
> >>> board DTs are staying in the "old" compatible mode until they are ada=
pted.
> >>
> >> Just to make sure I fully understand, the convention is that=20
> >>
> >>   pinctrl-names =3D "default";
> >>
> >> should be always provided, even when the node overrides an existing pi=
nctrl-0
> >> property?
> >>
> >> E.g. in rk3576.dtsi we have:
> >>
> >>   hdmi: hdmi@27da0000 {
> >>     ...
> >>     pinctrl-names =3D "default";
> >>     pinctrl-0 =3D <&hdmi_txm0_pins &hdmi_tx_scl &hdmi_tx_sda>;
> >>     ...
> >>   }
> >>
> >> Hence I omitted pinctrl-names which doesn't change and just appended
> >> &hdmi_frl_en to pinctrl-0's original value.
> >=20
> > correct, please always provide a pinctrl-names entry when setting a new
> > pinctrl-0 .
> >=20
> > The background is, imagine you have a base:
> >=20
> > pinctrl-names =3D "default";
> > pinstrl-0 =3D <....>;
> >=20
> > and override pinctrl-0 in a board.
> >=20
> > Now a newer binding introduces a 2nd pinctrl state "foo". Of course
> > we're backwards compatible, and both are valid and the driver checks
> > what states are defined.
> >=20
> > So the base sets:
> > pinctrl-names =3D "default", "foo";
> > pinctrl-0 =3D <...>;
> > pinctrl-1 =3D <...>;
> >=20
> > in your (old) board you override pinctrl-0, but the driver still sees
> > the new variant with 2 pinctrl states, where it should've stayed with
> > the legacy 1-state, until the board-dts might get adapted in the future.
> >=20
> >=20
> > And I know, we're likely not doing that everywhere, and also in most
> > cases it won't really matter, but still it is safer and sets the better
> > precedent :-) .
>=20
> Thanks for the detailed explanation, that clears things up!
>=20
> There are several other nodes (e.g. i2c, pwm, uart) that also lack
> pinctrl-names despite providing pinctrl-0 - I can address those in a
> separate patch.

As said above it is an ideal to aspire to (having -names together with
defining states), but if you want to add the "missing" -names,
go ahead :-) .


> I also noticed an inconsistency in property ordering: some nodes place
> pinctrl-names before pinctrl-<n> and others after.  I have always used
> the former, but we should probably prefer the latter to stay consistent
> with how clocks, resets, phys, etc. are ordered.
>=20
> Thoughts?

There is sort of a "conflict" between regular ordering and possibly
better readability. I.e. the dt-writing guidelines propose alphabetical
ordering which I guess puts numbers before letters.

On the other hand the semantic definition of list the states and then
define them (names first, -0, -1, etc second) looks more sensible from
a understanding standpoint.


But there we'd end up with special rules, so just sticking to the
base sorting will cause less friction in the long run I think.
Aka, -0, -1 first; -names after, follows the main sorting suggestions
so it's easy to explain to newcomers.


But please don't re-sort existing entries :-)


Heiko


