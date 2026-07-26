Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AC802931D5
	for <devicetree@vger.kernel.org>; Sun, 26 Jul 2026 14:53:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785077619; cv=pass; b=WodjIuO05R9QQ42TFakhKUFsY04YTzlY4lJtaS4nqDHM007R6BG/Uc1W2x+P/v0aNqeNfS7aTvvr/hnD5M3QaWEVxgTGfhMK36pJZJs5LKUpXDLU8kk85w1BMgBcFFbGAGtm/08KEuWajcGYzFBqC66QX7vrA4DXgvqsBzN9BXw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785077619; c=relaxed/simple;
	bh=R9f/pVZc43NS1ELRvBxRZnxLsiBqbijHMdSlyhcCN0c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KkJCP31A+xELhPkWfaNpErpNoYBJ5m9qLYLI1am0iQPhSYTXEXmPXSgZstDM4KQw72tC2uipN5N6lQqX1PNiQRqL32e0h1q5lOUhW4IVlyk2kyOscl+tDZtbTYp7Jyzlq4VicrHzSW+y2jQSS9QPyTjJ9SkGYiNUgvhcrZ2DTyw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jbvTP0N2; arc=pass smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jbvTP0N2"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c1f1f5631f8so3638766b.2
        for <devicetree@vger.kernel.org>; Sun, 26 Jul 2026 07:53:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785077616; cv=none;
        d=google.com; s=arc-20260327;
        b=J/2MLqAsMOworlvMxZpEMxoIT/XnFZsEhZX1vQWx2jJrXp4nU+VIZ4KsCuipM84f9g
         r8ld4trimGnXY0vB80PXB188Gfadr1/NqK0OtWIElx95POIUx+r0jDH/WG8lsLpVTv5q
         SsWvRAroDMN9F1thijzGx2EoCTX6zBh22KSDm5cGv4uluA4Lw7RLtjQ3M/nt7bijVN/u
         Q6Vdp5mj+MhN6BNO1lbIOmhqRDKXLXNcH6cBmPgOF0nESs5lPnshtZnonovL6fP8eV2k
         JSxf69QxtmO32lk+EXmAOFx86BM+NAkS7XoEgqPrwJO9kFIn1rkt9e95TYNfw05Yqb06
         mpVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2SqHyyBA+Ia1q8kRP2fi5yiAfiuE7PWnVjVyGMbBz8E=;
        fh=LB1x6tr89GjEt/IV8QdL5AeVnbZu0EsxZRRoMwuS0H4=;
        b=iSByB6AwP/0zqg5m/nIOJiK0xJiA/IknSH9mgFzOHJWHq/me8c9eljPtlHZyyoXtZo
         EEjxBfPbfxG/gIIh835yTnq7A3OFJh4MOHybwFjxGRM0T+4zPb1dYr+1HaicJI1lqxv7
         glxOlTtIyd7Y5GB6xiRVQSUXRmRTK+pS0e0p9+6gyY7/2k63SPDvbF8DMA2j1hO4QBfb
         H8K0X7VB41Lu5xC1wz3FmSpHOUkN6ZJ83Wc0nNrRS1hnNzgAdi9zJcq6je4KikVj1HyL
         opV66a/bFqFc9Xx71rYuVwXapdCkwpjC24OC0fes56kRMW4JiKslg7wT1b4cJCmoSsl2
         V2aA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785077616; x=1785682416; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2SqHyyBA+Ia1q8kRP2fi5yiAfiuE7PWnVjVyGMbBz8E=;
        b=jbvTP0N2b0fOLrWpfCJsogUxbyJTS2oqQFJUQoeV2A1jTjgapLrwrTxAeNeZwj6Xbm
         h2s0dLRPXJOL+8e62/zzpNggZVODHNK4JTIgfCUEaBMpsP79R0gkOwYzr1Zu5kY7icBb
         hQ0nxij+Zu1Sa48tGrH0B4xE7AyUG/Ter5cIvpd7700eKhXBT2HVscoXziYkta5IPjTl
         07IjJDNt2teXttF6VArWmZLAZLth/IZ5142ST4KdQ2Cvbf60WwGjgTz4LaNAIHMLtJKD
         b69/hNZD7br2pjftS64aoSgs+c4Sgz5YXDSHKWz4ft+Os3bM7sE2iiUlDBHzQnaOgOo6
         COMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785077616; x=1785682416;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2SqHyyBA+Ia1q8kRP2fi5yiAfiuE7PWnVjVyGMbBz8E=;
        b=Qt25rNQ/TSngT1eivQ6AS3JbhaAnxUmmDY78DrODeBQ0LKQtpkkR9rs7D3LqrQpE4e
         ptIqQPLENiZyeURJ4ozslMEtQpvm3Ne0nu6cZ2Lx2Ry4y4sRH334zYSnNhkbvUGN59UZ
         AFMDI+M5czvltKiqXAWs4uArX2IqclAEN0b69DeooDtXBNyo2tHQvZPWKDTU+7/pjavg
         pfwdSqQhmnn6YkYNLCtJ24MBYkaz/GsqrqqYNMpkyjRKzieD5dgrSkr7ilX4l04Fxv0K
         DhinEMNqOoqBWfnmOInKn1T8elV3ObIWqpXRxtgigrWrMMsxG5itqFRN/DfZg6aCXimY
         LOVA==
X-Forwarded-Encrypted: i=1; AHgh+RrZzWf8yb3uoKHbHlwnEf0DQae0rJuSUL9Ypz7td5sBMD8c9KFcq1JGZ8/9r6YgOyo/It041e1eH2H5@vger.kernel.org
X-Gm-Message-State: AOJu0Yzwb0OUkrOOpIDvLNoq45rP2bWKZqq24YTylLkv2JTCy7VI2Vh7
	ZxJQA/+tm0wAIiMlxi0qaEX/z2CVj1KGLQhhrNmZv2nWBiaFBBoHNNqkEmYzOzeuY2NmoqRkCnR
	pjDd41w6iAOTmhQ+MBuaRmM3FoAqpsKc=
X-Gm-Gg: AR+sD10lH2ESZVqtX5YO0MJvd3qzuzJlFnvSwohW7griosvY4fgQhfRLWwNb1a/AlYz
	/10TGOAhzJBM/MT7V8wc1Rg2K0UrRzk7auB1h5yJU5EmaNa4vlrLuGW7nSgKqDSz8eKlV0MowuG
	ESFmxFrzM4gN9Qg3hXvpfxCVK0TSFUgEoU+a5jQmZX11pyrRFMmLJq6hG+0S7wG+1c5buKIq57J
	ETJzoWqjrUE+uZD4PYsjkveEw3tj0YyXICIyIfyKJcu67B94Lq81nqV7z4juoiaszn9cUEI1GYm
	fM3dDFM=
X-Received: by 2002:a05:6402:51c7:b0:69c:7a3f:9fb5 with SMTP id
 4fb4d7f45d1cf-69fc117f84dmr1172000a12.7.1785077616017; Sun, 26 Jul 2026
 07:53:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260721-dcphy-rx-v1-v1-0-4fc83c0ccac9@gmail.com>
 <20260721-dcphy-rx-v1-v1-3-4fc83c0ccac9@gmail.com> <20260721104456.0695D1F01560@smtp.kernel.org>
In-Reply-To: <20260721104456.0695D1F01560@smtp.kernel.org>
From: =?UTF-8?B?5qWK5pm65oiQ?= <jason98166@gmail.com>
Date: Sun, 26 Jul 2026 22:54:10 +0800
X-Gm-Features: AUfX_mzTjOOwIggGzm-aEH5bYG0UISvchkAs7LjBaVST0b3wi1zvFpg_5iayiDI
Message-ID: <CAPwA33Kin3jRGmUCCUt86n64C+q5N0E4a+afsWZPyFypDAW3Og@mail.gmail.com>
Subject: Re: [PATCH 3/4] phy: rockchip-samsung-dcphy: model TX and RX as
 separate PHYs
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com, 
	vkoul@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, 
	linux-phy@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> Does this code modify the shared samsung->lanes state before checking if
> the direction is supported?

Yes, this is a valid finding - and the shared lane count turned out to
be a real problem beyond the ordering. It reproduces on hardware: with
the receiver configured for one data lane, powering the transmitter
off afterwards disables only one of its two lanes and leaves the
second still enabled, which the per-lane GNR_CON0 registers confirm.

In v2 both the lane count and the receiver link rate become
per-direction state, so a configure() call can no longer clobber the
other direction, and the peer power_count check is replaced by a
powered flag kept under the provider mutex. With those changes the
same sequence disables both lanes cleanly on the same hardware.

Thanks,
Jason

<sashiko-bot@kernel.org> =E6=96=BC 2026=E5=B9=B47=E6=9C=8821=E6=97=A5=E9=80=
=B1=E4=BA=8C =E4=B8=8B=E5=8D=886:44=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] Concurrent or unsupported PHY configuration clobbers the shared =
`samsung->lanes` driver state before verifying the direction is supported.
> --
>
> --- Patch [3]: [PATCH 3/4] phy: rockchip-samsung-dcphy: model TX and RX a=
s separate PHYs ---
> commit 242b9435d09e0133de4658156f3cc224aa2f84c9
> Author: Jason Yang <jason98166@gmail.com>
>
> phy: rockchip-samsung-dcphy: model TX and RX as separate PHYs
>
> This commit models the MIPI DSI transmitter and MIPI CSI receiver as sepa=
rate
> PHYs that share the same hardware block. It registers one struct phy per
> direction and adds a per-provider mutex to serialize access to the shared
> state.
>
> > diff --git a/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c b/driver=
s/phy/rockchip/phy-rockchip-samsung-dcphy.c
> > --- a/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c
> > +++ b/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c
>
> [ ... ]
>
> > @@ -1488,11 +1521,15 @@ samsung_mipi_dcphy_pll_calc_rate(struct samsung=
_mipi_dcphy *samsung,
> >  static int samsung_mipi_dcphy_configure(struct phy *phy,
> >                                       union phy_configure_opts *opts)
> >  {
> > -     struct samsung_mipi_dcphy *samsung =3D phy_get_drvdata(phy);
> > +     struct samsung_mipi_dcphy_dir *pd =3D phy_get_drvdata(phy);
> > +     struct samsung_mipi_dcphy *samsung =3D pd->parent;
> >       unsigned long long target_rate =3D opts->mipi_dphy.hs_clk_rate;
> >
> >       samsung->lanes =3D opts->mipi_dphy.lanes > 4 ? 4 : opts->mipi_dph=
y.lanes;
> >
> > +     if (pd->dir =3D=3D RK_DCPHY_DIR_RX)
> > +             return -EOPNOTSUPP;
> > +
>
> [Severity: High]
> Does this code modify the shared samsung->lanes state before checking if
> the direction is supported?
>
> Since this is done without holding samsung->lock, can a consumer
> configuring the RX PHY clobber the active TX PHY's lane count?
>
> If the lane count is corrupted, it looks like it could lead to incorrect =
lane
> power-down sequences when the TX PHY is disabled later, potentially leavi=
ng
> MIPI lanes actively driven.
>
> Should the pd->dir check and the lock acquisition happen before updating
> samsung->lanes?
>
> [ ... ]
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260721-dcphy-rx=
-v1-v1-0-4fc83c0ccac9@gmail.com?part=3D3
