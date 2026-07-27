Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1DDA219A8A
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 02:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785117677; cv=pass; b=Tej5wtAjNXQcQX5D49dzuOU7BJr6tV8QMSGkhughIthULRqxEuuzcxDnzbzoL1VpKDFM22kTSVyWcfI9G+NxC9Edk7oH+SiaAgVfApuDnpKWI69jflW7b8nz2TpHMmROfpkEfeGLQM7o4esCQDMqTQlbT5k4c1T7agMIr5Ggv0o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785117677; c=relaxed/simple;
	bh=Cgbgb/97B5pbnCy8IhzLU2oyYhrh12Il+I37KXS84To=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=duoy3TFkTzSBLmvQKvwkYxrvyg7PE/NCEC89LffVEifI/r2kCAHbtsAF4nANajVXAL4e3XkVBxD3rhmp5IvVcf/nABt9wAUHasX7cap4qkqIzCU8JmKthpIzuz/MutJLAbVnmxtqUyqww0iCHV5FEQ4q/rTVx9QVtKPrlwBpfgg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b0WlxiTw; arc=pass smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b0WlxiTw"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-69e0f4eb4ecso424198a12.0
        for <devicetree@vger.kernel.org>; Sun, 26 Jul 2026 19:01:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785117674; cv=none;
        d=google.com; s=arc-20260327;
        b=SHHROIoEQ8ufnd0xQd63uDuiQ+NEmgaAvEXl3p3lO+Fg6NmjmKYhRm+/zxMKIxlI/Z
         UAqM/8PGvzfLoCJ+0KFXrI4dVtxqVcAeGTdpQIIU03JXeGImGzs6EnvGGlu32iw+w780
         5GdF0Ju6xJ9w1wOMzjJvx7iOxtEfaIFRJWEiWCQiuLqBOK1oNuSQAaxUtyUA3tmqJtfG
         li6m61q5JtejVt72lbGNbZmLl9s5WsVjH9N2PDBM4+k0cU2nLkFIK1gFx3ksEQuqrXrV
         zed6zri/0WbLJhXB7ThbxMXVERfThcfM1ATBNL+WPqGcsJHnxt+YkkCsbVFSuDabn5LY
         xXmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5+/AHWCEducqpwF8K7BV+G/0gvvxyPh5lYi8bnFbPfA=;
        fh=PWaqE5rbQhqxdY8hdXqYPDVCI3pDOzFsOFKiQ5BXAQI=;
        b=FDGJclLGpFS0fH2BaP0ZY0ZPvJiLEER6qzZfy23O7qKiKRyLS9MoTi3+Uny2hZ6Mju
         2qQcVBGnaV95x5Yv4ZB5ipsBcRDrQthbL25gwo9iBj8R0o2kDpHN0HlyGNTS7bTyBVe5
         vPnugO8MFxT84jc90Sez0zHAwPZg+mGovdmv5qv6nos5lnohYLM3u8OPdec049CH0sip
         f0D6p9XblRonprO7shpk9slFANscYMCRcXsE97QiBPVrUAEJIF06b8ZaHTKLpfygzIjQ
         sSfrX0OAGISHR8ouaI8M7YYJnkVNdYXwn9gSQaW14/PUmbP6EKm7Cfj/U52bwEKZX4n9
         R3MQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785117674; x=1785722474; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5+/AHWCEducqpwF8K7BV+G/0gvvxyPh5lYi8bnFbPfA=;
        b=b0WlxiTwgm1mUg3oKEsBruN+P+e02bbZ7yy0TZQFjHJ5f7e2uN0IS472EUuHXPgKzv
         ZxPH8PFnXWua2OqbW7Fv08h0cvRF9dhmOtSEzGWgy8liI1khoepmn5gG40UOxhwOcuq9
         JRdm0G9cLvUSnlga5pMuEczFT1ouyfbT2TbvSaAGHtJwyb6SfPTlRBEkKN0usxYPfUZe
         pzblnppf5zRNlX/nWUejiAY3vJo0+K5CBtKzWUB6TqEWtWUQt2XI89et+EPhtN40JwTT
         fr4eF5V5I0MGkw6xudRM4/AN4PhZc2tfuUd/OER1Yd8wgcZij5GK/N92Wmb+HnlC9xSw
         /bQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785117674; x=1785722474;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5+/AHWCEducqpwF8K7BV+G/0gvvxyPh5lYi8bnFbPfA=;
        b=FljA7+1tcF63lO59G9Fm9Z46DmZIQSSXgeo6o+FFqxzSIm9LKNOG1ZtRSlvFTWfhFN
         +jZY1nyWAkwwOL01kkAjrCn0jri//S2LX+HjawKn8L2MXZfqvAUE0MAKiVkPxxQPD72x
         sy52TXqd526BBcgNqpu3wwH0SF4LpPeFF5YlaoZMsDdbEuEa7OHJ5yvtFfmlMuiuINfo
         LRxm9ox07XVZ8Z8kL9lunnUP0Eae7gSubV9oVZHBhke3KWPIJ3vj76n/FRP8eCNJQqKE
         VmG/hUOqWYGZZeV8AuqTd7njki8p6Cqywc4ZDbuQVDcCpkn/0In0uClEKYu889BlJnEl
         cdnA==
X-Forwarded-Encrypted: i=1; AHgh+Rp9m0mwVNhMIRNIMXdNhiItWIsYJjrxbTHMZ5L6qe34t9QomlHLRFCjpTf5NxD2CW4uITHMWeOEb3yH@vger.kernel.org
X-Gm-Message-State: AOJu0Yymqak5KJkKb5VN3IhXwYp8P6dG6+V0Bbc2U2TiaGYkqjjahwQs
	giw8yzWI1psYJLCIj+4oNgBy3sbsYbP7TQWu4AvmHV0k3L67XYMd5Qru+/nDI1f+5nTIa2iPqd0
	MAkMzOIJ7Stpou0SCkAXmv5VppW6B9Lg=
X-Gm-Gg: AR+sD13852hKsDUiE3d4YeqkFez5JZ6LcbYrxTS5ohfTmjA/KIDxUsU+PJnuy4R8eGv
	P+bdON8Qi9fgatt2hWzy8qg2gNMThcrkN5q5BnCbtWB5VuvFnv3lZaySI0GjOmn4637hFj1QBky
	GzG3wydnmd6CBphnrIKPV0ZO9lrM6T9BDmKKCYLFT03ZyVxgh+/zHi/diZXf6BTtemnxI9L2gjF
	NWihkcse8sV9Tx4LwsLLmPW6eQUOOycKSdItgnnH00XcO3slN05lk6KxEUxndyiKK1ytLI=
X-Received: by 2002:a05:6402:234f:b0:698:81d7:b812 with SMTP id
 4fb4d7f45d1cf-69fc1160318mr1644222a12.3.1785117673656; Sun, 26 Jul 2026
 19:01:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260726-dcphy-rx-v1-v2-0-cf9cc34a412a@gmail.com>
 <20260726-dcphy-rx-v1-v2-4-cf9cc34a412a@gmail.com> <20260726150717.05D3F1F000E9@smtp.kernel.org>
In-Reply-To: <20260726150717.05D3F1F000E9@smtp.kernel.org>
From: =?UTF-8?B?5qWK5pm65oiQ?= <jason98166@gmail.com>
Date: Mon, 27 Jul 2026 10:01:01 +0800
X-Gm-Features: AUfX_mxPeRAwfMB1LW6SbwIcSwcwD6Ov9zJ0Sq5EDYBErYupCAq0i7GTmKZBjAA
Message-ID: <CAPwA33K1oxnyzPgFOSTGyjCX2RLE8BEupUHe6XOn5A6UWSPKfw@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] phy: rockchip-samsung-dcphy: add MIPI D-PHY
 receiver support
To: sashiko-reviews@lists.linux.dev
Cc: neil.armstrong@linaro.org, olteanv@gmail.com, conor+dt@kernel.org, 
	vkoul@kernel.org, linux-phy@lists.infradead.org, robh@kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> Does this code poll for PHY_READY while the PHY is still held in reset?

Yes, and that is the sequence the TRM specifies: the RK3588 TRM
start-up sequence (figure 22-8) asserts S_RESETN, programs the settle
registers, enables the lanes, waits for PHY_READY to go high, and only
then deasserts S_RESETN. The poll does succeed on real hardware -
every capture listed in the cover's Testing section went through this
exact path.

> Without this in the RX path, could the shared APB bus interface and BIAS
> block remain in an uninitialized state from the bootloader?

This one came up on v1 as well; summarizing the disposition: the
vendor BSP's RX bring-up does not touch the APB reset either, the TRM
does not require it for the receiver, and the CSI-only configuration -
where the receiver is the only direction ever powered - captures
frames on real hardware without the APB reset ever being issued. The
BIAS block is programmed explicitly by whichever direction powers on
first, so nothing relies on bootloader state.

Happy to revisit if either assessment looks wrong.

Thanks,
Jason


<sashiko-bot@kernel.org> =E6=96=BC 2026=E5=B9=B47=E6=9C=8826=E6=97=A5=E9=80=
=B1=E6=97=A5 =E4=B8=8B=E5=8D=8811:07=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
> - [High] The RX power-on sequence fails to toggle the shared APB reset (`=
apb_rst`) when it is the first PHY direction to power on, potentially leavi=
ng shared PHY state uninitialized.
> - [High] The RX lane enable function polls for `PHY_READY` while the PHY =
is still held in reset, guaranteeing a timeout failure.
> --
>
> --- Patch [4]: [PATCH v2 4/4] phy: rockchip-samsung-dcphy: add MIPI D-PHY=
 receiver support ---
> commit 8b1f5adbd06df56ad03e2b8d081a6587be5fe71d
> Author: Jason Yang <jason98166@gmail.com>
>
> phy: rockchip-samsung-dcphy: add MIPI D-PHY receiver support
>
> This patch implements the receiver (CSI) direction of the D-PHY for the
> Rockchip Samsung driver. It adds the RX register layout, HS-frequency set=
tle
> table, and hooks the receiver bring-up and teardown into the per-directio=
n
> power paths. The PLL sequence is also skipped for the receive path as the
> sensor supplies the link clock.
>
> > diff --git a/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c b/driver=
s/phy/rockchip/phy-rockchip-samsung-dcphy.c
> > index 95eb1200cab48..f6d112935c016 100644
> > --- a/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c
> > +++ b/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c
> [ ... ]
> > @@ -988,6 +1046,228 @@ struct samsung_mipi_dphy_timing samsung_mipi_dph=
y_timing_table[] =3D {
> [ ... ]
> > +static int samsung_mipi_dphy_rx_lane_enable(struct samsung_mipi_dcphy =
*samsung)
> > +{
> > +     struct samsung_mipi_dcphy_dir *pd =3D &samsung->phys[RK_DCPHY_DIR=
_RX];
> > +     u32 sts;
> > +     int ret, i;
> > +
> > +     regmap_update_bits(samsung->regmap, DPHY_SC_GNR_CON0, PHY_ENABLE,=
 PHY_ENABLE);
> > +     for (i =3D 0; i < pd->lanes; i++)
> > +             regmap_update_bits(samsung->regmap, rx_data_lane_gnr_con0=
[i],
> > +                                PHY_ENABLE, PHY_ENABLE);
> > +
> > +     ret =3D regmap_read_poll_timeout(samsung->regmap, DPHY_SC_GNR_CON=
0,
> > +                                    sts, sts & PHY_READY, 200, 4000);
>
> [Severity: High]
> Does this code poll for PHY_READY while the PHY is still held in reset?
>
> Looking at samsung_mipi_dphy_rx_power_on(), samsung->s_phy_rst is asserte=
d,
> then samsung_mipi_dphy_rx_lane_enable() is called, and only after that is
> s_phy_rst deasserted.
>
> Will this cause the PHY_READY poll to always timeout?
>
> > +     if (ret) {
> > +             dev_err(samsung->dev, "RX clock lane not ready\n");
> > +             goto err_lane_disable;
> > +     }
> [ ... ]
> > @@ -1004,6 +1284,44 @@ static void samsung_mipi_dcphy_bias_block_enable=
(struct samsung_mipi_dcphy *sams
> [ ... ]
> > +static int samsung_mipi_dphy_rx_power_on(struct samsung_mipi_dcphy *sa=
msung)
> > +{
> > +     bool first =3D !samsung->phys[RK_DCPHY_DIR_TX].powered;
> > +     int ret;
> > +
> > +     if (!samsung->phys[RK_DCPHY_DIR_RX].hs_clk_rate)
> > +             return -EINVAL;
> > +
> > +     reset_control_assert(samsung->s_phy_rst);
> > +
> > +     if (first)
> > +             samsung_mipi_dcphy_bias_block_enable(samsung);
>
> [Severity: High]
> If the RX direction is powered on first, does it need to toggle the share=
d APB
> reset (apb_rst) before enabling the bias block?
>
> In samsung_mipi_dphy_tx_power_on(), when first is true, it does:
>
>         if (first) {
>                 reset_control_assert(samsung->apb_rst);
>                 udelay(1);
>                 reset_control_deassert(samsung->apb_rst);
>         }
>
> Without this in the RX path, could the shared APB bus interface and BIAS
> block remain in an uninitialized state from the bootloader?
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
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260726-dcphy-rx=
-v1-v2-0-cf9cc34a412a@gmail.com?part=3D4
