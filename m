Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8B073EB816;
	Fri, 15 May 2026 09:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.154.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778835911; cv=none; b=O2XBGuls7OqMXSosnKKH6uMb425PMSs6neJweiPbe1aKS20NrakiP0ccn/qTLLNiGUo6MEb72H6eqLGhpiFBEOIlUxvRx5p/9hy7UVlZkHxxgEDcSq97+PKU/ISjjOluNeD9pMiaIk5VXX4KJemqJCaBXhZn1MmKsHbfQuCrvOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778835911; c=relaxed/simple;
	bh=JF3uZsy6llHlDV7C7vLRRmWCmal9y3CobKnloKpst78=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jAOXaRKxFm5wiqHQo64mnqvaRlnz8yHhvfCGDEWm6AtBDF+PgVruYIiYcTIkWgs2w6a6wE94NqJlAQVzLUC2/6NNb9/dkiKyPzRaGe8R+Dv1dENHzMrbxKNLdi1nrAGujsgvGBMOIyHQKwRk+yBFiSY/RT0Dt2hZqRfmKhQMOYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=ZJLs4Kcr; arc=none smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="ZJLs4Kcr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1778835910; x=1810371910;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=JF3uZsy6llHlDV7C7vLRRmWCmal9y3CobKnloKpst78=;
  b=ZJLs4KcruAf40DLEE7vJTivHTBR4tb4kI8omSBSouzZZ7Z2rlrR4PXim
   Ona2PF9OpHVsWaM4U4wBHBNM89MdcQqy2KmihXIaNaqDNH1XyChd1YP1g
   ZaFfopK9Ijy88vTB2vaK1dIp3iCPz3OVLlFdU+oyZkIxLntc+f+jY3/77
   /sqqL4t74/YBwCvnnZCmk4WiC9wuFJZ8E3yKw7RjOedBBJpS2+jhQw8ht
   9LwRsiINbM6q9LL9o6D5/gmBBw/AvILR9x2a9vvR3cbYP85ToGsKqBUFq
   IOUbt1Mr5i1vsrUF3asxbox+ca2J5tBWMKyrw7rd6Ly2EpGSgzJrlN7xM
   g==;
X-CSE-ConnectionGUID: aBy8wa7JRn+FUchmSVlp4w==
X-CSE-MsgGUID: fbVAwTCTQfC/IGhAcLgkpA==
X-IronPort-AV: E=Sophos;i="6.23,236,1770620400"; 
   d="asc'?scan'208";a="57964607"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2026 02:05:08 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.87.71) by
 chn-vm-ex2.mchp-main.com (10.10.87.31) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.37; Fri, 15 May 2026 02:05:08 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex01.mchp-main.com (10.10.85.143)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.58 via Frontend
 Transport; Fri, 15 May 2026 02:05:03 -0700
Date: Fri, 15 May 2026 10:04:25 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Damon Ding <damon.ding@rock-chips.com>
CC: Conor Dooley <conor@kernel.org>, <hjc@rock-chips.com>, <heiko@sntech.de>,
	<andy.yan@rock-chips.com>, <maarten.lankhorst@linux.intel.com>,
	<mripard@kernel.org>, <tzimmermann@suse.de>, <airlied@gmail.com>,
	<simona@ffwll.ch>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <andrzej.hajda@intel.com>,
	<neil.armstrong@linaro.org>, <rfoss@kernel.org>,
	<Laurent.pinchart@ideasonboard.com>, <jonas@kwiboo.se>,
	<jernej.skrabec@gmail.com>, <nicolas.frattaroli@collabora.com>,
	<cristian.ciocaltea@collabora.com>, <sebastian.reichel@collabora.com>,
	<dmitry.baryshkov@oss.qualcomm.com>, <luca.ceresoli@bootlin.com>,
	<dianders@chromium.org>, <m.szyprowski@samsung.com>,
	<dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-rockchip@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1 1/3] dt-bindings: display: rockchip: analogix-dp:
 Expose inherited properties
Message-ID: <20260515-confess-hungrily-4f64ce0d8de2@wendy>
References: <20260514070133.2275069-1-damon.ding@rock-chips.com>
 <20260514070133.2275069-2-damon.ding@rock-chips.com>
 <20260514-upstate-sneer-0b6e78682798@spud>
 <2f653664-27e9-4632-97e9-8b59cf7e585e@rock-chips.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="JTEOF7u1knQLxomm"
Content-Disposition: inline
In-Reply-To: <2f653664-27e9-4632-97e9-8b59cf7e585e@rock-chips.com>

--JTEOF7u1knQLxomm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 15, 2026 at 11:57:58AM +0800, Damon Ding wrote:
> Hi Conor,
>=20
> On 5/15/2026 2:16 AM, Conor Dooley wrote:
> > On Thu, May 14, 2026 at 03:01:31PM +0800, Damon Ding wrote:
> > > Expose the inherited properties from the base analogix-dp schema
> > > to satisfy unevaluatedProperties constraints.
> > >=20
> > > Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> >=20
> > Given it's unevaluatedProperties, not addtionalProperties, this patch
> > shouldn't be needed?
> >=20
>=20
> When I remove both the top-level data-lanes property and those explicit
> "xxx: true" property entries and run the dtbs check with:
>=20
> make CHECK_DTBS=3Dy CROSS_COMPILE=3Daarch64-linux-gnu- LT0=3Dnone LLVM=3D1
> LLVM_IAS=3D1 ARCH=3Darm64 rockchip/rk3588-evb1-v10.dtb
> rockchip/rk3588s-evb1-v10.dtb rockchip/rk3399-sapphire-excavator.dtb
> rockchip/rk3576-evb1-v10.dtb -j4
>=20
> It results in validation errors like these:
>=20
> /home/ding/drm-misc/arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dtb:
> edp@27dc0000: ports:port@1:endpoint: Unevaluated properties are not allow=
ed
> ('data-lanes' was unexpected)
>         from schema $id:
> http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml#
> /home/ding/drm-misc/arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dtb:
> edp@27dc0000: Unevaluated properties are not allowed ('force-hpd',
> 'interrupts', 'phy-names', 'phys', 'ports', 'reg' were unexpected)
>         from schema $id:
> http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml#
>=20
> I suspect that the properties defined in the child binding are
> overriding/masking all the inherited properties from the parent Analogix =
DP
> schema.
>=20
> Is there a better way to fix this issue without explicitly listing all
> inherited properties as true?

The example in this file uses most of the properties that you mention
above:
    dp@ff970000 {
      compatible =3D "rockchip,rk3288-dp";
      reg =3D <0xff970000 0x4000>;
      interrupts =3D <GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>;
      clocks =3D <&cru SCLK_EDP>, <&cru PCLK_EDP_CTRL>;
      clock-names =3D "dp", "pclk";
      phys =3D <&dp_phy>;
      phy-names =3D "dp";
      resets =3D <&cru 111>;
      reset-names =3D "dp";
      rockchip,grf =3D <&grf>;
      pinctrl-0 =3D <&edp_hpd>;
      pinctrl-names =3D "default";

dt_binding_check reports no problems with this node, so I think the
problem might lie elsewhere?
There's no edp node in the dts you mention above, so this looks like an
interaction with something that's not yet upstream.

If this is required for the rk3576 edp, then you should include this
patch in the rk3576 edp support series rather than this one anyway where
it can actually be evaluated alongside the node it apparently causes
problems with.

pw-bot: changes-requested

Thanks,
Conor.

>=20
> Best regards,
> Damon
>=20
> > > ---
> > >   .../bindings/display/rockchip/rockchip,analogix-dp.yaml    | 7 ++++=
+++
> > >   1 file changed, 7 insertions(+)
> > >=20
> > > diff --git a/Documentation/devicetree/bindings/display/rockchip/rockc=
hip,analogix-dp.yaml b/Documentation/devicetree/bindings/display/rockchip/r=
ockchip,analogix-dp.yaml
> > > index bb75d898a5c5..896ded87880f 100644
> > > --- a/Documentation/devicetree/bindings/display/rockchip/rockchip,ana=
logix-dp.yaml
> > > +++ b/Documentation/devicetree/bindings/display/rockchip/rockchip,ana=
logix-dp.yaml
> > > @@ -50,6 +50,13 @@ properties:
> > >     aux-bus:
> > >       $ref: /schemas/display/dp-aux-bus.yaml#
> > > +  reg: true
> > > +  interrupts: true
> > > +  phys: true
> > > +  phy-names: true
> > > +  force-hpd: true
> > > +  ports: true
> > > +
> > >   required:
> > >     - compatible
> > >     - clocks
> > > --=20
> > > 2.34.1
> > >=20
> > >=20
>=20

--JTEOF7u1knQLxomm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCagbhmQAKCRB4tDGHoIJi
0hL9AQDMzOGCBAaj30x0MldbIEzDvxHY9JZ/Hr59JunC6U0AhQEAhrUYE74I+05k
njcJ1OaOANoefame5d09LLbMsepD7Q4=
=jYCg
-----END PGP SIGNATURE-----

--JTEOF7u1knQLxomm--
