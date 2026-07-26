Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2492231A21
	for <devicetree@vger.kernel.org>; Sun, 26 Jul 2026 14:53:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785077607; cv=pass; b=DKAy9QPcDNu/H2cXcBKybsNHMJ9zqcZrnDVeB9BXdE9ChvhXSlKlyEWjnWFLRPmmw803oV8UxnkrjT4TUS86rtujIg5PkWMNEWgOymM1+lMOMJW2YBLdv/L9c5CtBKS3Y7G/BGOqoAedXN5O7BbHRlx6KaECI8au4qZphnAosdE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785077607; c=relaxed/simple;
	bh=0GAdslSPIUzPgsP9WtaNMHUaqXLHQnOorwGQNsDzmco=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FrL+PlOTfOI2tUClsAVa3WaGdNBlmP068GqmZ2SK3n+GegMv3muTmDIiinWxBZkCN3ygR0X16hvUT8+Rgb346wpyz34Jv6SwhxFXVfO7X9QtOHYwhTC02bzB+7gmRrvPcWpm/2IxiJJUr5whQTnTEvDAQhmDXhmVQ5akA6rkwhQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aVBZecSK; arc=pass smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aVBZecSK"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-698aece3d7eso260086a12.1
        for <devicetree@vger.kernel.org>; Sun, 26 Jul 2026 07:53:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785077604; cv=none;
        d=google.com; s=arc-20260327;
        b=MJK4albQziZz1+X0UBlsc4cpIg9VDPvqNv2lxpbOiUO9Wja6THSd1deJ7Xspf5Xv9y
         zfRAdWuDh/Lsd43A8Y8nKziYG0OeL4CDssd4UHohBzEAD2LWh/9IxKe8GrzMhNYLut0J
         3ZBNnHF+urrzRlytBEtvDiId2nc8ETPkJNlLQ8/NH63lgFXtgYiJaoIUSu/VuI7tpY60
         FoY6HbSNGnhcioAqnjjPrPSJhN0jgcvV1MlK7fkHzd5PPuaYGjwuFVPQwgW8HUsCRLEY
         oDEGbBE6kN/rKJc8DxhixGUeEdf0oBhYNmQizWHLD8cO7EkMe60koPwoqis7df/V+il4
         lB3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=21Ke86u3QQOW0+WvIHZr/yfreUMZndKTcNAYqwVL8R4=;
        fh=M+p5Gw/b+kEO1EbT3dr3tuqjET4y2tMgYUV+iv+HRl8=;
        b=YCLVQFeU+W5tb/tPGwE+HKABFfEHAoaR4bR+BKuq71vTF6BzPZ0Ld+CQK7xJPyPN98
         T3czomsTJM1isUvivanMdo1uzO81LS3f7zek6cJqu/NunCMJQuS6j7s0ccDmFE73zIk3
         aidHPE24jxKP8Jmr79wk7QWOPLLr4obG7PVePfRtIC2GOfsbe95sWxsAKuo53w54yhXq
         TDnbFFSvqfA5r1+w9ngEZJjvhE7/ZFJZenjVg41hYHaTstBL06XNgDBn0Fzek038GnSI
         tZDq71On1XGoA6pmCo470xD2o3CY+ba4I3EeNoJwLnzLdd+Qi/77dKO+Twnaqjy5mG1y
         HyzQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785077604; x=1785682404; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=21Ke86u3QQOW0+WvIHZr/yfreUMZndKTcNAYqwVL8R4=;
        b=aVBZecSKKdR7mEDhOXXtqkJm64tvI/ivFh115LQ6H74WOQ4vBlQyvBhAZ3pJhuGj2q
         NWduSy3Nvj71zfJFjdE3CVC/XQqAMzTcO6vwVND/uLye8TNdkVAW9xzgpKBEG2bzFMgK
         obr/IsNdE78haCU51HFYBSlZq0BTljtIswjIZO8eBmoaOhHYD64Cl6JYtmMlDCmorT9k
         2i4gGTv6pc6nPWmH2OW/5ni/RzOTpOLXJpwDWIPhuZkctOc7QIqWiR7yfwvKwxA8Av/3
         cW1LkkWmV2NwdcTrY36bLjy/lA9YdEXWNHm+HimGD4GXGbLQ2eWSbOgYAQNEdAYz2swD
         1KAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785077604; x=1785682404;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=21Ke86u3QQOW0+WvIHZr/yfreUMZndKTcNAYqwVL8R4=;
        b=W8iFITsLQR4djPWDa9kEsXtrxRuAllYAKkmQq5ZosmMJyD91Ck5nthzNglHl5/Go9/
         z5OeYXP/uyAsrj8Hf+b3MFNeLOb91DgVqBL+nd3COY+Hl8svJrCuaYCvLc3sHuy6Nfn/
         vpolXKiTTwzUEJq02KkGuQyYBBYrVU68dWlJp0WQOGKqP50WUCz2nFOSfeUA/QKgXj6V
         twym5IEbti0yFgHkNRwxFjhV/IgI+4XtBQkSutZUfnLfDXqNTknlePYBxQvthN0At/N4
         Ab4cV6UcwPhKMQQ5iZlCIdLPCU0LnQpGpaQe6hSzu/9nhF5QCd8uxRdfmOgc7cRxyWAy
         qO0w==
X-Forwarded-Encrypted: i=1; AHgh+Rq7wTG9LSzRnw6n0M9l8meIcQj/GvMJakfeyyvNx/F5RqUm+Nr24/mpaJZclw+TyvHOZLKy3Gjb/diw@vger.kernel.org
X-Gm-Message-State: AOJu0YyiEcWHJpF2kaeC+1BvI9s4NzMJI3vfutnU/hXCDKmf1NuGEq1y
	o7DtMk0WYV91oSapj/IXjEyyRSHRH67FcFOhu1SqiIFxYseWNyQmci0NfdHLLgKoakbZiSts6rP
	5O219I0FSu+cCwLaKolneh+mczPjx71Y=
X-Gm-Gg: AR+sD105fhEcGdPFx++StNNrJc6l5YEag2rPNvlgevty2G+1oexJPGZJ70kh/BJZwdV
	GpGFTK6ws/8aOCoepGEcOuM02AzgnTSZhA9rc6z5/DxyOhoiiblZkYni55Rl39nNSjmcbdeZcW/
	lUr9xhTlwGq9pHDrEgjOt6mAIc7u3IIZi/iqzL4Yp3HrmNIN/7D5VWMaAUhwu0lffMgzg2b+Lzy
	WJNqSHrovcFbWuI0yzGt5SXFW8b/o0KVumNj0XHQ5F6RnOYHKhGlH9+WEMKFlmF19MTpcTy
X-Received: by 2002:a05:6402:388c:b0:698:d8d2:df38 with SMTP id
 4fb4d7f45d1cf-69fc0fe9783mr2207350a12.2.1785077603687; Sun, 26 Jul 2026
 07:53:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260721-dcphy-rx-v1-v1-0-4fc83c0ccac9@gmail.com>
 <20260721-dcphy-rx-v1-v1-4-4fc83c0ccac9@gmail.com> <20260721105725.547CD1F000E9@smtp.kernel.org>
In-Reply-To: <20260721105725.547CD1F000E9@smtp.kernel.org>
From: =?UTF-8?B?5qWK5pm65oiQ?= <jason98166@gmail.com>
Date: Sun, 26 Jul 2026 22:53:58 +0800
X-Gm-Features: AUfX_mzW8odAED0UgyCRKI3eQ77fatS3N-dodt_GM1Fv7QOtJgboWWuZ9d86VQk
Message-ID: <CAPwA33JXBwDcP0fsXGNKDhqVmFH=MG88kx-JgO0noqSUDdZyxg@mail.gmail.com>
Subject: Re: [PATCH 4/4] phy: rockchip-samsung-dcphy: add MIPI D-PHY receiver support
To: sashiko-reviews@lists.linux.dev
Cc: linux-phy@lists.infradead.org, conor+dt@kernel.org, 
	neil.armstrong@linaro.org, vkoul@kernel.org, robh@kernel.org, 
	olteanv@gmail.com, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> The RX power-on sequence fails to toggle the `apb_rst` reset line,

This is intentional rather than an omission. The vendor BSP toggles
apb_rst only on its TX power-on path and never in its RX bring-up, and
this driver mirrors that split: the APB reset is issued only when the
transmitter powers on first. The TRM start-up sequence (figure 22-8)
does not require it for the receiver, and a CSI-only configuration -
where the receiver is the only direction ever powered - captures
frames on real hardware without the APB reset ever being issued.

> If `samsung_mipi_dphy_rx_lane_enable()` fails [...] leaves the
> `PHY_ENABLE` bits set

Valid - in v2 the already enabled lanes are switched back off before
the error is returned.

> The `lanes` configuration field is shared between TX and RX,

Also valid, and it reproduces on hardware (see my reply on patch 3).
In v2 the lane count becomes per-direction state.

> time-of-check to time-of-use (TOCTOU) vulnerability on the
> unprotected `peer->power_count`.

Agreed - in v2 each direction records its powered state under the
provider mutex instead of reading the peer's power_count, which closes
that window.

Happy to revisit any of these if an assessment looks wrong.

Thanks,
Jason


<sashiko-bot@kernel.org> =E6=96=BC 2026=E5=B9=B47=E6=9C=8821=E6=97=A5=E9=80=
=B1=E4=BA=8C =E4=B8=8B=E5=8D=886:57=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Thank you for your contribution! Sashiko AI review found 4 potential issu=
e(s) to consider:
>
> New issues:
> - [High] The RX power-on sequence fails to toggle the `apb_rst` reset lin=
e, potentially leaving the shared APB bus interface uninitialized if the RX=
 direction is powered on before TX.
> - [High] If `samsung_mipi_dphy_rx_lane_enable()` fails (e.g., due to a PH=
Y_READY timeout), it returns an error but leaves the `PHY_ENABLE` bits set =
in the PHY registers and unconditionally deasserts the `s_phy_rst` core res=
et.
> - [High] The `lanes` configuration field is shared between TX and RX, lea=
ding to state corruption and incorrect lane cleanup if both directions are =
configured independently.
>
> Pre-existing issues:
> - [High] Concurrent power_on calls for TX and RX can race due to a time-o=
f-check to time-of-use (TOCTOU) vulnerability on the unprotected `peer->pow=
er_count`.
> --
>
> --- Patch [4]: [PATCH 4/4] phy: rockchip-samsung-dcphy: add MIPI D-PHY re=
ceiver support ---
> commit 1a7ff981a5098deb181df94fdb6e07f8dc4040a9
> Author: Jason Yang <jason98166@gmail.com>
> phy: rockchip-samsung-dcphy: add MIPI D-PHY receiver support
>
> This commit implements the receiver (CSI) direction of the D-PHY. It adds=
 the
> RX register layout, the HS-frequency settle table, and hooks the receiver
> bring-up and teardown into the per-direction power and configuration path=
s.
>
> > diff --git a/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c b/driver=
s/phy/rockchip/phy-rockchip-samsung-dcphy.c
> > --- a/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c
> > +++ b/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c
>
> [ ... ]
>
> > +static int samsung_mipi_dphy_rx_lane_enable(struct samsung_mipi_dcphy =
*samsung)
> > +{
> > +     u32 sts;
> > +     int ret, i;
> > +
> > +     regmap_update_bits(samsung->regmap, DPHY_SC_GNR_CON0, PHY_ENABLE,=
 PHY_ENABLE);
> > +     for (i =3D 0; i < samsung->lanes; i++)
> > +             regmap_update_bits(samsung->regmap, rx_data_lane_gnr_con0=
[i],
> > +                                PHY_ENABLE, PHY_ENABLE);
> > +
> > +     ret =3D regmap_read_poll_timeout(samsung->regmap, DPHY_SC_GNR_CON=
0,
> > +                                    sts, sts & PHY_READY, 200, 4000);
> > +     if (ret) {
> > +             dev_err(samsung->dev, "RX clock lane not ready\n");
> > +             return ret;
> > +     }
>
> [Severity: High]
> If regmap_read_poll_timeout() fails here, do we leak the previously set
> PHY_ENABLE bits?
>
> Returning early leaves the PHY_ENABLE bits set in the PHY registers.
> The caller catches the error and propagates it, meaning the framework
> will not call power_off() to clean up. On subsequent retries, writing
> PHY_ENABLE to a register where it is already 1 will fail to produce the
> 0 -> 1 edge transition required by the PHY state machine to start, breaki=
ng
> future attempts to initialize the RX lanes.
>
> [ ... ]
>
> > +static int samsung_mipi_dphy_rx_power_on(struct samsung_mipi_dcphy *sa=
msung,
> > +                                      struct phy *peer)
> > +{
> > +     bool first =3D peer->power_count =3D=3D 0;
>
> [Severity: High]
> This is a pre-existing issue, but is it safe to rely on peer->power_count
> here to determine if shared initialization is needed?
>
> The PHY core framework increments phy->power_count outside the driver's l=
ock,
> only after the power_on() callback returns. If Thread A (RX) and Thread B
> (TX) call phy_power_on() concurrently:
>
> Thread A configures RX, drops samsung->lock, but is preempted before
> rx_phy->power_count is incremented.
> Thread B acquires samsung->lock, sees rx_phy->power_count is still 0, and
> executes its 'first' initialization sequence.
>
> For TX, this involves explicitly asserting the shared APB bus reset
> (apb_rst), which would wipe out the entire RX configuration Thread A just
> applied. Should the driver track the initialization state internally inst=
ead
> of relying on power_count?
>
> > +     int ret;
> > +
> > +     if (!samsung->hs_clk_rate)
> > +             return -EINVAL;
> > +
> > +     reset_control_assert(samsung->s_phy_rst);
> > +
> > +     if (first)
> > +             samsung_mipi_dcphy_bias_block_enable(samsung);
>
> [Severity: High]
> If the PHY is used in a receive-first or receive-only role, does this seq=
uence
> omit the apb_rst hardware initialization for the shared APB bus?
>
> Looking at the TX power-on sequence, it toggles apb_rst when first is tru=
e to
> ensure the shared APB bus interface is properly initialized. If RX powers=
 on
> first, the apb_rst toggle is skipped here, and a subsequent TX power-on w=
ill
> see first =3D=3D false and also skip it. Can this leave the shared APB bu=
s
> interface uninitialized and potentially cause system hangs during regmap
> accesses?
>
> > +     samsung_mipi_dphy_rx_config_common(samsung);
> > +
> > +     ret =3D samsung_mipi_dphy_rx_config_settle(samsung);
> > +     if (ret)
> > +             goto out_deassert;
> > +
> > +     ret =3D samsung_mipi_dphy_rx_lane_enable(samsung);
> > +
> > +out_deassert:
> > +     reset_control_deassert(samsung->s_phy_rst);
> > +
> > +     return ret;
> > +}
>
> [Severity: High]
> Does this unconditionally commit the leaked PHY_ENABLE state to the hardw=
are?
>
> If samsung_mipi_dphy_rx_lane_enable() fails due to the timeout mentioned
> earlier, it drops through to here and deasserts s_phy_rst. Combined with =
the
> missing PHY_ENABLE cleanup, this commits the broken hardware state.
>
> [ ... ]
>
> > @@ -1525,13 +1831,17 @@ static int samsung_mipi_dcphy_configure(struct =
phy *phy,
> >       struct samsung_mipi_dcphy *samsung =3D pd->parent;
> >       unsigned long long target_rate =3D opts->mipi_dphy.hs_clk_rate;
> >
> > +     mutex_lock(&samsung->lock);
> >       samsung->lanes =3D opts->mipi_dphy.lanes > 4 ? 4 : opts->mipi_dph=
y.lanes;
>
> [Severity: High]
> Does sharing the samsung->lanes variable between TX and RX lead to state
> corruption?
>
> Since the driver models TX and RX as two independent PHY instances, eithe=
r
> instance will blindly overwrite samsung->lanes here. If a consumer config=
ures
> TX with 4 lanes and a second consumer configures RX with 2 lanes,
> samsung->lanes becomes 2. A subsequent TX power_off() will read this stat=
e
> and only disable 2 lanes, leaking the other 2 active TX lanes. Should lan=
es
> be tracked per-direction?
>
> > -     if (pd->dir =3D=3D RK_DCPHY_DIR_RX)
> > -             return -EOPNOTSUPP;
> > -
> > -     samsung_mipi_dcphy_pll_calc_rate(samsung, target_rate);
> > -     opts->mipi_dphy.hs_clk_rate =3D samsung->pll.rate;
> > +     if (pd->dir =3D=3D RK_DCPHY_DIR_RX) {
> > +             /* The sensor supplies the link clock; the PLL stays off.=
 */
> > +             samsung->hs_clk_rate =3D target_rate;
> > +     } else {
> > +             samsung_mipi_dcphy_pll_calc_rate(samsung, target_rate);
> > +             opts->mipi_dphy.hs_clk_rate =3D samsung->pll.rate;
> > +     }
> > +     mutex_unlock(&samsung->lock);
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260721-dcphy-rx=
-v1-v1-0-4fc83c0ccac9@gmail.com?part=3D4
