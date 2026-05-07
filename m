Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 044AC3E8662;
	Thu,  7 May 2026 11:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778154193; cv=none; b=f+HHbUen9Icy0Aq8a7gC5cePrNazzzABFwdc713v+m5eyzp17DgozfSW1GsleEbu9x41EH7e277nkgG7gyG/JODlioubgZ4j16y8uPVhE3BJ5N0hRGFxSZw1PG0w6lErc1UR6JPONMS9+TtVunJXmg6O2MoTZoXrW3xPZG2AS3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778154193; c=relaxed/simple;
	bh=+SAVTzJ65YYBiG6j/Jvf7bZVHg7/lfk4F3CAFcztGRk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dbWpg/kh9jZLXysfLBqsydDt8moVl8jm9MRWUQCK00Ol5EE9rStMugwIueuQ3Ac5cpff22LWtUYS/OQhR6loWAVtglZNVHdYBnTvaWDFxfEGgGZj3twvlGME+2aD4UCJtA8sYqNMPqaGutqx49FpGp5uDJ7yGBmvaS/Rb3h1bDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=CrnNjN0m; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="CrnNjN0m"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=4r8mXmt6skT6Iq4+j8vT+vFH5yMYCK775SlOiUC7Pz8=; b=CrnNjN0m1XtdyHqmY1+DsuV07f
	lXViUR5+x6r0ra86n7QkOwbcU9cOmz6apNfoWfKVfKmcJ0LTLLHu7825NJV++k9NI0JkU8ZbOfOJ0
	8U8tTajXryp345oruqepaUy0z0sRG7tMwko2jAZWy5hG0fd1Ddzfss/vs9nf4VZk7koMLfx6y0tNG
	IjcH5Ymz08Nax4PCDgDuLTP7d5c7A9EVicNV/qLjb73snybFH8ZkjDQuKCX3dICtovMpiBpKGl6bE
	r/CkQXJUkeTN+Q9fvmAiv3/uxerNxIMwlZBBdkOOpmtLi7ILOe/5+Q90pXE+RE0TrP/WM+FlhBLpQ
	DSRMe4rw==;
From: Heiko Stuebner <heiko@sntech.de>
To: hjc@rock-chips.com, andy.yan@rock-chips.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, andrzej.hajda@intel.com, neil.armstrong@linaro.org,
 rfoss@kernel.org, Damon Ding <damon.ding@rock-chips.com>
Cc: Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, nicolas.frattaroli@collabora.com,
 cristian.ciocaltea@collabora.com, sebastian.reichel@collabora.com,
 dmitry.baryshkov@oss.qualcomm.com, luca.ceresoli@bootlin.com,
 dianders@chromium.org, m.szyprowski@samsung.com,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, Damon Ding <damon.ding@rock-chips.com>
Subject:
 Re: [PATCH v3 01/10] dt-bindings: display: rockchip: analogix-dp: Expand
 clock-names "hclk" for the third clock
Date: Thu, 07 May 2026 13:42:50 +0200
Message-ID: <4528155.7s5MMGUR32@phil>
In-Reply-To: <6496645.8F6SAcFxjW@phil>
References:
 <20260507112948.1115003-1-damon.ding@rock-chips.com>
 <20260507112948.1115003-2-damon.ding@rock-chips.com>
 <6496645.8F6SAcFxjW@phil>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Am Donnerstag, 7. Mai 2026, 13:40:09 Mitteleurop=C3=A4ische Sommerzeit schr=
ieb Heiko Stuebner:
> Hi Damon,
>=20
> Am Donnerstag, 7. Mai 2026, 13:29:39 Mitteleurop=C3=A4ische Sommerzeit sc=
hrieb Damon Ding:
> > The RK3588 eDP controller needs the video datapath clock "hclk" to work
> > well. Previously, it works without explicitly adding this clock because
> > the 'rockchip,vo-grf =3D <&vo1_grf>' property implicitly enables HCLK_V=
O1.
> >
> > Fixes: f855146263b1 ("dt-bindings: display: rockchip: analogix-dp: Add =
support for RK3588")
> > Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> > ---
> >  .../bindings/display/rockchip/rockchip,analogix-dp.yaml       | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchi=
p,analogix-dp.yaml b/Documentation/devicetree/bindings/display/rockchip/roc=
kchip,analogix-dp.yaml
> > index d99b23b88cc5..d2bc8636b626 100644
> > --- a/Documentation/devicetree/bindings/display/rockchip/rockchip,analo=
gix-dp.yaml
> > +++ b/Documentation/devicetree/bindings/display/rockchip/rockchip,analo=
gix-dp.yaml
> > @@ -26,7 +26,9 @@ properties:
> >      items:
> >        - const: dp
> >        - const: pclk
> > -      - const: grf
> > +      - enum:
> > +          - grf
> > +          - hclk
>=20
> are you sure about that?
>=20
> The edp uses the vo1-grf - so what enables its clock?
> For example the hdmi controllers on rk3588 also use the vo1-grf and
> explicitly handle that clock.
>=20
> So who does it for the eDP?

Ah, ... found the hclk_vo1 in the following patches.

Still the binding commit message could use some more words about what that
clock is, and why it can "replace" the GRF clock from earlier SoCs.

Heiko


