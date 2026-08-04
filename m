Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 830D73264DD
	for <devicetree@vger.kernel.org>; Tue,  4 Aug 2026 05:38:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785821936; cv=pass; b=V3pNzEX3unNKjU1no97dsmp7YUvd7YlUVqqpeqwaaCyNk2hwGeiZcBcMb6wg0kf8z2psK/Rn+22zQVkQu6+q/ewWVh5C3JMkHdOC3/mPuv+JRRyDciXvm94QsTQ+smW7OCNdl+NyMMRedip6e1aEF5Ps2deeP56nIgtxU7OeYjc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785821936; c=relaxed/simple;
	bh=1oGFcPXRLFeg+XzkJ7Xu8V2V8oB8G7jbegIze4GgMb0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Lg/GpR6axNqq4SwAG6i5QN+6Jbg+As+mV5xg5kj0oQxy+IYqAIUgVeg+kfLX7Sj5LedSe/d5tbQWUyI3aeA50l/llqYPpt2aa8LY40X4ca+X4XYjb0HfYgSXDzSl59CiuveoOnZ9GfNW3DXjItOIjMyQY8F0oCG1EKtFg3hWycI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jQSUHp7e; arc=pass smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jQSUHp7e"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-69edc72e513so856342a12.3
        for <devicetree@vger.kernel.org>; Mon, 03 Aug 2026 22:38:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785821933; cv=none;
        d=google.com; s=arc-20260327;
        b=GcMbPmL+x8Lo9WaKUwX73837zOvcmPKNuQi0HGwUbgRIwpPGhh2IkFZqYkzji88kJS
         lneRc4nuf3JYUy4y+aCsIg/iH0NmX5Gu5GL1NFdDOvqMWpHteD/7oL2XdRrdv/jmIBtG
         feHvyrhalM3tUy6IpbeacZkwVhBFuih9PVR0Lu2VLb311wQmnEgDPBdMcfiGi+8x02Ur
         B6V2vkxneCENduZGxmYHqD1uXhINegBK2tthqTh3rKrP5yrlHJoFiezt+A2G/zJj/AwD
         yJfVP5GytPsQ5t9gSzBG2lPTFg+GKhOU1aVCKxcyxa+ryP6Ovkc5EYn+BdJGmqbo2lAA
         JreQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=P90gcr6xxU77q+kC2zMybYqYDBnl8zPA4OBwiUeNTi4=;
        fh=6I7XqBnoZZZWH2nw4dbEju/En3WLY8ZXqdMhwaCHshg=;
        b=cr1ROHM3wQmlrEpznz9809w/DuzkZnHWtImGXxXZN8Z23fJ6dNwez55ZkOGEs5U/V0
         9sikwIjpFfE5GKjrz+8OtzXWHhpg9o9wI3tmVpv5GIIWgkbHUP2bziYrMrtcFV2iGL1X
         wi14ZF6jpcWppbZuwfSx+6PN30/pz9SPRTQkp59rTQMJUgTvRlaeXdoGdOGen+Rv1NA+
         +scHl2x1RDdZb+IOLh0z3etliBqJpyVTprYBCaLWoSuS8tvuhOx9A/yreXGyHLiNRUEF
         icWuCiutura+mzFKErxcnt/lrJaZIvtNrALPuRAmjgjFZDDZLvYc1nbQy/lkRHjsph+5
         OLJg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785821933; x=1786426733; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=P90gcr6xxU77q+kC2zMybYqYDBnl8zPA4OBwiUeNTi4=;
        b=jQSUHp7eRQ349SMJsXjhhP6QwgrAvWAwyFaIZ9Dm3AgVNhiOGOpvZ/h1xsaHPK2azh
         gfc4FWNOSzCuKVjFD5mw3rc+Ih5PEkhBErkw+/24ydJBDi9iIq1u7gWYqSlbkck/rw0B
         afTVIw1xWhS+l6w6/51XvcVP6jcy+/CG8vmJPwqqzX0E/DD5HX0T+4K+V1VGtBU2aE4I
         6IYH/y3HAsScG/c1eRFiEyahOpSJ1SPoFBqWYdyWF2OCxyTy8GvDBmaYpD4q0XQLG2TU
         TN8fwxpnbkCHz+RQ7DV3gkH+iGXmaH60snlyyPokhWthMMZJKe9XHpZ4VQy2vPs8A/xA
         UxpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785821933; x=1786426733;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P90gcr6xxU77q+kC2zMybYqYDBnl8zPA4OBwiUeNTi4=;
        b=ANCHMYNCChaZuiX2G7OSpUMgpauz7f63TF2B+GeUyUyqJEsCJ6WK4yrM9NN0Ydg4hu
         zhRX3Bsj+D59g+uemnZewmcArmrBPIqJZceBwAqNv8bLLx5uYbi3kYVooa95VLKk85lV
         vsSrjZiT/ez7ur6ai9yIC50wG67Krr9KAO1yeLYlHLlZZPt5OZJQinOMp/IJXc+59FP4
         3hRjzulHlU6KB47t/wA53q8EO266QJawdu4bNV63dVkwQlpNJAvSGMtiEI2vWFnSIQbA
         1oOjFI47dJJT2wzUjTeCtHhGm+I6pxDS/CfZrukwjdgFGVIcnH4Dq8JIUU0hbgKLEqL0
         LrcA==
X-Forwarded-Encrypted: i=1; AHgh+Rp9JE6ylet+e3IOe7PeOSiXeNARNhr+s75o6W7pyq+2QmL/YCklEnlaa1JNVFrPf3kiXuWRRiJMf4zt@vger.kernel.org
X-Gm-Message-State: AOJu0Yww4P2d6b6PsxJG4OHOwfv7vntkYz8UmQIN5zTOQVGSWICZbejH
	zITeaKie/BYcmavtA8StDZs8+SnT0CdR52aHWMxmmcQjcmuQmihSIYsSKrZ4+5IvmBBkRpaQKUK
	MuX1euVLPaxCspcL/Na6P4rAkIVflcMI=
X-Gm-Gg: AR+sD13mCyvC+MUZp90ujuj/s+kXy9Mbu0HZLLzRSKFolcJSLVBQLunYb45hDeyZ9G5
	mex+aB1hcmeDaA0ogqEfjnwE3NqjBn2vWf46k4gFwXbZFrEW7QbQYxLO5HQUxQkkJQp3v7PC1l1
	r8xS7hOdh21rpUdv6crFCWZg/Ue8ybxgmK0YYP5m7+9G29MwZ/Shm+BYn1VxB0+ufqqHZIl1IHR
	MIGhD19/9jRdzRHAISSju3ydB+MzcGfpQUQNlTdk1KfNlgHUfZBIwmWtwBMQBdO6nVmac0WlW3l
	xdXnyJ99o68i3NUxsmfic+A0MVQSesEz+QFJsnsrpng=
X-Received: by 2002:a05:6402:5106:b0:6a1:d68:338a with SMTP id
 4fb4d7f45d1cf-6a10d68350emr2363397a12.0.1785821932081; Mon, 03 Aug 2026
 22:38:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260726-dcphy-rx-v1-v2-0-cf9cc34a412a@gmail.com>
 <20260726-dcphy-rx-v1-v2-3-cf9cc34a412a@gmail.com> <7e55b8bc-d11d-4b25-99ee-d5d181be158f@collabora.com>
In-Reply-To: <7e55b8bc-d11d-4b25-99ee-d5d181be158f@collabora.com>
From: =?UTF-8?B?5qWK5pm65oiQ?= <jason98166@gmail.com>
Date: Tue, 4 Aug 2026 13:38:40 +0800
X-Gm-Features: AUfX_myCAPOR-SQGouyDLjz2SCb_pzcHHHk_BXNgukq7W0zkKBymqfIh0ISufqQ
Message-ID: <CAPwA33Jnp6N7a=2tcrgEzFxXRpbxEO25ktrRDiea--9Uy5upNQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] phy: rockchip-samsung-dcphy: model TX and RX as
 separate PHYs
To: Michael Riesch <michael.riesch@collabora.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Guochun Huang <hero.huang@rock-chips.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Michael,

Thanks for the review.

> This may be bike-shedding, but I am not a big fan of the notion of
> "direction". This is a combo PHY that in essence contains different
> PHYs, so why not call this "samsung_mipi_phy" or something?
>
>         struct samsung_mipi_phy phys[2];
>
> which seems clean and simple to me.

That reads better - the per-PHY structure becomes samsung_mipi_phy.

Taking your other naming comment together with this one:

> Again, this may be bike-shedding, but "pd" seems misleading to me.
> Please reconsider the naming. Maybe "samsung_phy" for the individual
> PHY and "samsung" for the complete combo PHY?

Sure, "pd" becomes "samsung_phy".

> This approach with the "first" variable seems unintuitive. If you need
> reference counting on the BIAS block, then use a state variable
> "bias_powered", use a mutex that protects it, and call
> samsung_mipi_dcphy_bias_block_{en,dis}able (from
> samsung_mipi_dcphy_power{on, off}) unconditionally. Those methods shall
> acquire the mutex, check the state variable, {en,dis}able the BIAS
> block, set the state variable accordingly, release the mutex.
>
> [...]
>
> Not sure whether you actually need to track the power status of the
> individual PHYs (maybe you actually need to track the BIAS block status
> alone) but anyway I would appreciate if
> "samsung_mipi_dphy_tx_power_{on,off}" would set the "pd->powered"
> variable.

Both of these lead to the same change. You are right to be unsure
about the per-PHY flag - I checked, and its only readers are the two
"first" computations, which only decide about the shared block. So the
two flags become one count in the parent, taken and dropped inside
samsung_mipi_dphy_{tx,rx}_power_{on,off}, and the "first" computations
go away. I went for a count rather than a single flag because the
release side has to distinguish "the other direction is still using
it" from "nobody is left".

The shared-block helper will use lockdep_assert_held() rather than
take the mutex itself, since samsung_mipi_dcphy_power_{on,off} already
hold it, as you noted.

One thing I am unsure about is the enable/disable pairing. I could not
find an enable for this block - the four BIAS registers only select
bias currents, reference voltages, the HS output level and the BGR
chopper divider, while PLL_CON0 in the same common block does have a
PLL_EN. If that reading is right, there is nothing to turn off and the
release side would only drop the count - in which case maybe the
"enable" name is worth revisiting as well. Does that match your
understanding of this block?

Separately, I noticed "first" also guards the APB reset, and only in
the transmitter path - once 4/4 enables the receiver, a receiver-first
power-on does not get one. I plan to move it into the same shared-block
path so both directions behave the same, and check both power-on
orders on the board before sending v3.

I would like to fold all of this into v3 together with whatever comes
out of the PHY_TYPE_CSI/PHY_TYPE_DSI discussion in patch 1/4, since
that decides how the two PHYs are told apart.

Thanks,
Jason


Michael Riesch <michael.riesch@collabora.com> =E6=96=BC 2026=E5=B9=B48=E6=
=9C=883=E6=97=A5=E9=80=B1=E4=B8=80 =E4=B8=8B=E5=8D=888:05=E5=AF=AB=E9=81=93=
=EF=BC=9A
>
> Hi Jason,
>
> Thanks for the patch!
>
> On 7/26/26 16:55, Jason Yang via B4 Relay wrote:
> > From: Jason Yang <jason98166@gmail.com>
> >
> > The DC-PHY drives a MIPI DSI transmitter and a MIPI CSI receiver, and o=
n
> > RK3588 both can be wired to the same PHY as independent consumers. The
> > PHY core reference-counts power_on() per struct phy, so a single struct
> > phy cannot bring the two directions up independently.
> >
> > Register one struct phy per direction and move the per-direction state
> > (direction, PHY type, lane count and powered flag) into its own driver
> > data. of_xlate() accepts the legacy single cell as the transmitter and
> > an optional second cell that selects the direction, so existing
> > single-cell DSI device trees keep resolving to the transmitter.
> > configure() rejects the not yet supported receiver before touching any
> > state, and each direction keeps its own lane count.
> >
> > The PHY's common block contains a single BIAS block shared by both
> > directions (RK3588 TRM section 22.2), so it must be programmed only
> > once. Whichever direction powers on first enables it; each direction
> > records its powered state under the per-provider mutex so that powering
> > one direction on does not disturb an already running one. The APB reset
> > is issued on the transmitter bring-up path.
> > The receiver bring-up itself is added in a later change.
> >
> > Signed-off-by: Jason Yang <jason98166@gmail.com>
> > Assisted-by: Claude:claude-opus-4-8
> > ---
> >  drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c | 143 ++++++++++++++=
+-------
> >  1 file changed, 102 insertions(+), 41 deletions(-)
> >
> > diff --git a/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c b/driver=
s/phy/rockchip/phy-rockchip-samsung-dcphy.c
> > index d0d77421bd4b..95eb1200cab4 100644
> > --- a/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c
> > +++ b/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c
> > @@ -5,6 +5,7 @@
> >   *      Guochun Huang <hero.huang@rock-chips.com>
> >   */
> >
> > +#include <dt-bindings/phy/rockchip,rk3588-mipi-dcphy.h>
> >  #include <dt-bindings/phy/phy.h>
> >  #include <linux/bitfield.h>
> >  #include <linux/clk.h>
> > @@ -13,6 +14,7 @@
> >  #include <linux/kernel.h>
> >  #include <linux/mfd/syscon.h>
> >  #include <linux/module.h>
> > +#include <linux/mutex.h>
> >  #include <linux/of.h>
> >  #include <linux/phy/phy.h>
> >  #include <linux/platform_device.h>
> > @@ -280,6 +282,19 @@ struct samsung_mipi_dcphy_plat_data {
> >       u32 dphy_tx_max_lane_kbps;
> >  };
> >
> > +struct samsung_mipi_dcphy;
> > +
> > +/* One PHY per direction: transmitter (DSI) and receiver (CSI). */
> > +struct samsung_mipi_dcphy_dir {
>
> This may be bike-shedding, but I am not a big fan of the notion of
> "direction". This is a combo PHY that in essence contains different
> PHYs, so why not call this "samsung_mipi_phy" or something?
>
> > +     struct phy *phy;
> > +     struct samsung_mipi_dcphy *parent;
> > +     u8 dir;
> > +     u8 type;
> > +     unsigned int lanes;
> > +     /* Written under the parent's lock. */
> > +     bool powered;
> > +};
> > +
> >  struct samsung_mipi_dcphy {
> >       struct device *dev;
> >       struct clk *ref_clk;
> > @@ -290,9 +305,9 @@ struct samsung_mipi_dcphy {
> >       struct reset_control *s_phy_rst;
> >       struct reset_control *apb_rst;
> >       struct reset_control *grf_apb_rst;
> > -     unsigned int lanes;
> > -     struct phy *phy;
> > -     u8 type;
> > +     struct samsung_mipi_dcphy_dir phys[2];
>
> This would look like this then:
>
>         struct samsung_mipi_phy phys[2];
>
> which seems clean and simple to me.
>
> > +     /* Serialises the two directions' access to the shared PHY state.=
 */
> > +     struct mutex lock;
> >
> >       const struct samsung_mipi_dcphy_plat_data *pdata;
> >       struct {
> > @@ -995,7 +1010,7 @@ static void samsung_mipi_dphy_lane_enable(struct s=
amsung_mipi_dcphy *samsung)
> >       regmap_update_bits(samsung->regmap, DPHY_MC_GNR_CON0,
> >                          PHY_ENABLE, PHY_ENABLE);
> >
> > -     switch (samsung->lanes) {
> > +     switch (samsung->phys[RK_DCPHY_DIR_TX].lanes) {
> >       case 4:
> >               regmap_write(samsung->regmap, DPHY_MD3_GNR_CON1,
> >                            T_PHY_READY(0x2000));
> > @@ -1026,7 +1041,7 @@ static void samsung_mipi_dphy_lane_enable(struct =
samsung_mipi_dcphy *samsung)
> >
> >  static void samsung_mipi_dphy_lane_disable(struct samsung_mipi_dcphy *=
samsung)
> >  {
> > -     switch (samsung->lanes) {
> > +     switch (samsung->phys[RK_DCPHY_DIR_TX].lanes) {
> >       case 4:
> >               regmap_update_bits(samsung->regmap, DPHY_MD3_GNR_CON0,
> >                                  PHY_ENABLE, 0);
> > @@ -1334,11 +1349,23 @@ samsung_mipi_dphy_data_lane_timing_init(struct =
samsung_mipi_dcphy *samsung)
> >
> >  static int samsung_mipi_dphy_tx_power_on(struct samsung_mipi_dcphy *sa=
msung)
> >  {
> > +     bool first =3D !samsung->phys[RK_DCPHY_DIR_RX].powered;
>
> Note to myself: the lock is acquired in the calling method, all is well.
>
> >       int ret;
> >
> > +     /*
> > +      * The shared BIAS block is brought up by whichever direction pow=
ers
> > +      * on first, leaving an already active peer undisturbed.
> > +      */
> > +     if (first) {
> > +             reset_control_assert(samsung->apb_rst);
> > +             udelay(1);
> > +             reset_control_deassert(samsung->apb_rst);
> > +     }
> > +
> >       reset_control_assert(samsung->m_phy_rst);
> >
> > -     samsung_mipi_dcphy_bias_block_enable(samsung);
> > +     if (first)
> > +             samsung_mipi_dcphy_bias_block_enable(samsung);
>
> This approach with the "first" variable seems unintuitive. If you need
> reference counting on the BIAS block, then use a state variable
> "bias_powered", use a mutex that protects it, and call
> samsung_mipi_dcphy_bias_block_{en,dis}able (from
> samsung_mipi_dcphy_power{on, off}) unconditionally. Those methods shall
> acquire the mutex, check the state variable, {en,dis}able the BIAS
> block, set the state variable accordingly, release the mutex.
>
>
> >       samsung_mipi_dcphy_pll_configure(samsung);
> >       samsung_mipi_dphy_clk_lane_timing_init(samsung);
> >       samsung_mipi_dphy_data_lane_timing_init(samsung);
> > @@ -1368,34 +1395,44 @@ static int samsung_mipi_dphy_tx_power_off(struc=
t samsung_mipi_dcphy *samsung)
> >
> >  static int samsung_mipi_dcphy_power_on(struct phy *phy)
> >  {
> > -     struct samsung_mipi_dcphy *samsung =3D phy_get_drvdata(phy);
> > -
> > -     reset_control_assert(samsung->apb_rst);
> > -     udelay(1);
> > -     reset_control_deassert(samsung->apb_rst);
> > +     struct samsung_mipi_dcphy_dir *pd =3D phy_get_drvdata(phy);
>
> Again, this may be bike-shedding, but "pd" seems misleading to me.
> Please reconsider the naming. Maybe "samsung_phy" for the individual PHY
> and "samsung" for the complete combo PHY? Or "phy_data" and
> "dcphy_data"? ...?
>
> > +     struct samsung_mipi_dcphy *samsung =3D pd->parent;
> > +     int ret;
> >
> > -     switch (samsung->type) {
> > -     case PHY_TYPE_DPHY:
> > -             return samsung_mipi_dphy_tx_power_on(samsung);
> > -     default:
> > -             /* CPHY part to be implemented later */
> > +     if (pd->type !=3D PHY_TYPE_DPHY)
> >               return -EOPNOTSUPP;
> > -     }
> >
> > -     return 0;
> > +     mutex_lock(&samsung->lock);
> > +     if (pd->dir =3D=3D RK_DCPHY_DIR_RX)
> > +             ret =3D -EOPNOTSUPP;
> > +     else
> > +             ret =3D samsung_mipi_dphy_tx_power_on(samsung);
> > +     if (!ret)
> > +             pd->powered =3D true;
>
> Not sure whether you actually need to track the power status of the
> individual PHYs (maybe you actually need to track the BIAS block status
> alone) but anyway I would appreciate if
> "samsung_mipi_dphy_tx_power_{on,off}" would set the "pd->powered" variabl=
e.
>
> Best regards,
> Michael
>
>
> > +     mutex_unlock(&samsung->lock);
> > +
> > +     return ret;
> >  }
> >
> >  static int samsung_mipi_dcphy_power_off(struct phy *phy)
> >  {
> > -     struct samsung_mipi_dcphy *samsung =3D phy_get_drvdata(phy);
> > +     struct samsung_mipi_dcphy_dir *pd =3D phy_get_drvdata(phy);
> > +     struct samsung_mipi_dcphy *samsung =3D pd->parent;
> > +     int ret;
> >
> > -     switch (samsung->type) {
> > -     case PHY_TYPE_DPHY:
> > -             return samsung_mipi_dphy_tx_power_off(samsung);
> > -     default:
> > -             /* CPHY part to be implemented later */
> > +     if (pd->type !=3D PHY_TYPE_DPHY)
> >               return -EOPNOTSUPP;
> > -     }
> > +
> > +     if (pd->dir =3D=3D RK_DCPHY_DIR_RX)
> > +             return -EOPNOTSUPP;
> > +
> > +     mutex_lock(&samsung->lock);
> > +     ret =3D samsung_mipi_dphy_tx_power_off(samsung);
> > +     if (!ret)
> > +             pd->powered =3D false;
> > +     mutex_unlock(&samsung->lock);
> > +
> > +     return ret;
> >  }
> >
> >  static int
> > @@ -1488,10 +1525,14 @@ samsung_mipi_dcphy_pll_calc_rate(struct samsung=
_mipi_dcphy *samsung,
> >  static int samsung_mipi_dcphy_configure(struct phy *phy,
> >                                       union phy_configure_opts *opts)
> >  {
> > -     struct samsung_mipi_dcphy *samsung =3D phy_get_drvdata(phy);
> > +     struct samsung_mipi_dcphy_dir *pd =3D phy_get_drvdata(phy);
> > +     struct samsung_mipi_dcphy *samsung =3D pd->parent;
> >       unsigned long long target_rate =3D opts->mipi_dphy.hs_clk_rate;
> >
> > -     samsung->lanes =3D opts->mipi_dphy.lanes > 4 ? 4 : opts->mipi_dph=
y.lanes;
> > +     if (pd->dir =3D=3D RK_DCPHY_DIR_RX)
> > +             return -EOPNOTSUPP;
> > +
> > +     pd->lanes =3D opts->mipi_dphy.lanes > 4 ? 4 : opts->mipi_dphy.lan=
es;
> >
> >       samsung_mipi_dcphy_pll_calc_rate(samsung, target_rate);
> >       opts->mipi_dphy.hs_clk_rate =3D samsung->pll.rate;
> > @@ -1501,16 +1542,16 @@ static int samsung_mipi_dcphy_configure(struct =
phy *phy,
> >
> >  static int samsung_mipi_dcphy_init(struct phy *phy)
> >  {
> > -     struct samsung_mipi_dcphy *samsung =3D phy_get_drvdata(phy);
> > +     struct samsung_mipi_dcphy_dir *pd =3D phy_get_drvdata(phy);
> >
> > -     return pm_runtime_resume_and_get(samsung->dev);
> > +     return pm_runtime_resume_and_get(pd->parent->dev);
> >  }
> >
> >  static int samsung_mipi_dcphy_exit(struct phy *phy)
> >  {
> > -     struct samsung_mipi_dcphy *samsung =3D phy_get_drvdata(phy);
> > +     struct samsung_mipi_dcphy_dir *pd =3D phy_get_drvdata(phy);
> >
> > -     pm_runtime_put(samsung->dev);
> > +     pm_runtime_put(pd->parent->dev);
> >
> >       return 0;
> >  }
> > @@ -1536,19 +1577,29 @@ static struct phy *samsung_mipi_dcphy_xlate(str=
uct device *dev,
> >                                           const struct of_phandle_args =
*args)
> >  {
> >       struct samsung_mipi_dcphy *samsung =3D dev_get_drvdata(dev);
> > +     struct samsung_mipi_dcphy_dir *pd;
> > +     u8 dir =3D RK_DCPHY_DIR_TX;
> >
> > -     if (args->args_count !=3D 1) {
> > +     if (args->args_count < 1 || args->args_count > 2) {
> >               dev_err(dev, "invalid number of arguments\n");
> >               return ERR_PTR(-EINVAL);
> >       }
> >
> > -     if (samsung->type !=3D PHY_NONE && samsung->type !=3D args->args[=
0])
> > -             dev_warn(dev, "phy type select %d overwriting type %d\n",
> > -                      args->args[0], samsung->type);
> > +     if (args->args_count =3D=3D 2) {
> > +             if (args->args[1] > RK_DCPHY_DIR_RX) {
> > +                     dev_err(dev, "invalid direction %u\n", args->args=
[1]);
> > +                     return ERR_PTR(-EINVAL);
> > +             }
> > +             dir =3D args->args[1];
> > +     }
> >
> > -     samsung->type =3D args->args[0];
> > +     pd =3D &samsung->phys[dir];
> > +     if (pd->type !=3D PHY_NONE && pd->type !=3D args->args[0])
> > +             dev_warn(dev, "phy type select %u overwriting type %u\n",
> > +                      args->args[0], pd->type);
> > +     pd->type =3D args->args[0];
> >
> > -     return samsung->phy;
> > +     return pd->phy;
> >  }
> >
> >  static int samsung_mipi_dcphy_probe(struct platform_device *pdev)
> > @@ -1559,6 +1610,7 @@ static int samsung_mipi_dcphy_probe(struct platfo=
rm_device *pdev)
> >       struct phy_provider *phy_provider;
> >       struct resource *res;
> >       void __iomem *regs;
> > +     unsigned int i;
> >       int ret;
> >
> >       samsung =3D devm_kzalloc(dev, sizeof(*samsung), GFP_KERNEL);
> > @@ -1568,6 +1620,7 @@ static int samsung_mipi_dcphy_probe(struct platfo=
rm_device *pdev)
> >       samsung->dev =3D dev;
> >       samsung->pdata =3D device_get_match_data(dev);
> >       platform_set_drvdata(pdev, samsung);
> > +     mutex_init(&samsung->lock);
> >
> >       res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> >       regs =3D devm_ioremap_resource(dev, res);
> > @@ -1613,11 +1666,19 @@ static int samsung_mipi_dcphy_probe(struct plat=
form_device *pdev)
> >               return dev_err_probe(dev, PTR_ERR(samsung->grf_apb_rst),
> >                                    "Failed to get system grf_apb_rst co=
ntrol\n");
> >
> > -     samsung->phy =3D devm_phy_create(dev, NULL, &samsung_mipi_dcphy_o=
ps);
> > -     if (IS_ERR(samsung->phy))
> > -             return dev_err_probe(dev, PTR_ERR(samsung->phy), "Failed =
to create MIPI DC-PHY\n");
> > +     for (i =3D 0; i < ARRAY_SIZE(samsung->phys); i++) {
> > +             struct phy *phy =3D devm_phy_create(dev, NULL,
> > +                                               &samsung_mipi_dcphy_ops=
);
> >
> > -     phy_set_drvdata(samsung->phy, samsung);
> > +             if (IS_ERR(phy))
> > +                     return dev_err_probe(dev, PTR_ERR(phy),
> > +                                          "Failed to create MIPI DC-PH=
Y\n");
> > +
> > +             samsung->phys[i].phy =3D phy;
> > +             samsung->phys[i].parent =3D samsung;
> > +             samsung->phys[i].dir =3D i;
> > +             phy_set_drvdata(phy, &samsung->phys[i]);
> > +     }
> >
> >       ret =3D devm_pm_runtime_enable(dev);
> >       if (ret)
> >
>
