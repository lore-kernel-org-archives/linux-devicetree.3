Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AB9E446049
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 18:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784226320; cv=none; b=niCE4pQ+9xBj0/AtXBxWDxbJd8ld19COnMDN7ldPzf6Jn0QXDd+qrVukxqruXQOgz1iEeqPeVE0PaYM4UrmPcY07r8yDisH0pgfFAa31pol6nM0oAg6h8279+FllpTU601KnlRFP3JFJBBLkFammPztDmZajEC0h6Oirvq3plZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784226320; c=relaxed/simple;
	bh=X9kfMad0L+qsQuGRshE5Nr6Bo7lF0b4nDmJNYT6NVnQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Y17v8n3p/zfyHPMNZSi23U8YYYVp9MocYBmATIYyhdPqBAEYATRe9aNYNTJuwzBdbf5j+JPoh/ibmCbpMVgrRq41pGIgnVcubQUFfw8q/WcpAZu2M7B63h632AVPY58fv2aebNZ4y0m+QrASksLQEuyk9pVBQnvK1FZmtg7W/Bw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=OuKGsbpn; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="OuKGsbpn"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=98SE4CKBkuC1U0dGD2ygGl2gM94/pCkblmzMnYwDQqk=; b=OuKGsbpn2os34BAQ6UizSxnUQW
	SiErxKki31XrzsoUiRG3NMh9rHPSwrQ8mzySswVcqMfO5xJJlHcLJtxpz1zuZxFdIUb57XwcLsoqu
	Qghoy1B3sQPtxT/G/pUs1+GYPI+eI2UyyMwHFwJmxQMq1CVarNqPBg0Jluz+9BJOkO7xHl4s5sDd+
	TpCBQo0w205KAOpL3XH4RgQP1cugrlx1g3YYlG0D9hzYq49l+gF/gDygDf5AByXWbAwKq7fFtCLSn
	mgeoQGnfJEYVqJgRLfk/zbUj0uzs/5zEJWg08CFB0xgYfHfiq8eAvGi4aigZjwboVwSq5Z7BM/u9N
	ANA5vnhA==;
From: Heiko Stuebner <heiko@sntech.de>
To: Diederik de Haas <diederik@cknow-tech.com>,
 Joachim Eastwood <joachim.eastwood@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 jonas@kwiboo.se
Subject:
 Re: [PATCH v3 03/12] arm64: dts: rockchip: rk3588s-nanopi-r6: fix missing
 pcie rst pinctrl
Date: Thu, 16 Jul 2026 20:25:02 +0200
Message-ID: <2204997.bB369e8A3T@phil>
In-Reply-To:
 <CAPSPb=tTbdzBZFq9NE0PCiD8+7pbWhErauhOfjjkp0DnhDwvRA@mail.gmail.com>
References:
 <20260713-nanopi-m6-v3-0-227567ffc5dc@gmail.com>
 <DJYBBXE6SAG2.20OEJI5K6JIVM@cknow-tech.com>
 <CAPSPb=tTbdzBZFq9NE0PCiD8+7pbWhErauhOfjjkp0DnhDwvRA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Am Donnerstag, 16. Juli 2026, 11:02:47 Mitteleurop=C3=A4ische Sommerzeit sc=
hrieb Joachim Eastwood:
> Hi Diederik,
>=20
> On Tue, 14 Jul 2026 at 15:02, Diederik de Haas <diederik@cknow-tech.com> =
wrote:
> >
> > Hi Joachim,
> >
> > On Mon Jul 13, 2026 at 10:30 PM CEST, Joachim Eastwood via B4 Relay wro=
te:
> > > From: Joachim Eastwood <joachim.eastwood@gmail.com>
> > >
> > > The pins are used as reset-gpios but not reserved through pinctrl.
> > >
> > > Fixes: f3c6526d6fb2 ("arm64: dts: rockchip: Convert dts files used as=
 parents to dtsi files")
> > > Signed-off-by: Joachim Eastwood <joachim.eastwood@gmail.com>
> > > ---
> > >  arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi | 14 +++++++++++=
+++
> > >  1 file changed, 14 insertions(+)
> > >
> > > diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi b/ar=
ch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi
> > > index 67e284a15c35..8df6e1a21180 100644
> > > --- a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi
> > > +++ b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi
> > > @@ -360,12 +360,16 @@ rgmii_phy1: ethernet-phy@1 {
> > >  };
> > >
> > >  &pcie2x1l1 {
> > > +     pinctrl-names =3D "default";
> > > +     pinctrl-0 =3D <&pcie2_1_rst>;
> > >       reset-gpios =3D <&gpio1 RK_PA7 GPIO_ACTIVE_HIGH>;
> > >       vpcie3v3-supply =3D <&vcc_3v3_pcie20>;
> > >       status =3D "okay";
> > >  };
> > >
> > >  &pcie2x1l2 {
> > > +     pinctrl-names =3D "default";
> > > +     pinctrl-0 =3D <&pcie2_2_rst>;
> > >       reset-gpios =3D <&gpio3 RK_PD1 GPIO_ACTIVE_HIGH>;
> > >       vpcie3v3-supply =3D <&vcc_3v3_pcie20>;
> > >       status =3D "okay";
> > > @@ -420,6 +424,16 @@ rtc_int: rtc-int {
> > >               };
> > >       };
> > >
> > > +     pcie {
> > > +             pcie2_1_rst: pcie2-1-rst {
> >
> > ``pcie20x1_1_perstn_m2`` to match the schematic name?
> >
> > > +                     rockchip,pins =3D <1 RK_PA7 RK_FUNC_GPIO &pcfg_=
pull_none>;
> > > +             };
> > > +
> > > +             pcie2_2_rst: pcie2-2-rst {
> >
> > And ``pcie20x1_2_perstn_m0`` here?
>=20
> Can do.
> I see this used on a couple of other boards as well.

It's always a per-board thing. Matching pin-names to schematic
strings makes it just easier to reference from one to the other.

So yeah, it's very likely that schematics might be similar, but those
board designers sometimes also get waaaaay creative in their naming :-).


Heiko


