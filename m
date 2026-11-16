Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794824642;
	b=C5dE7HqAfWWdMGqPGNpY7LBGoxlsTz/CHyrYDh2QCK9I2VRnOWOUpw/FpJBWEcYP4wEl
	 uNLtTYiv58fdHSkIb6h4f//z4Bm50Kh1GQXKUIlgWkaPp4MiyaS6yEBEWfib0VGW60+x5
	 NdAWa0qFFrRhIi0ZMtdccJk3w0XDRZAA6SdweysFe0e9wr7VtUBRubVWl9ML2m0XcHPl9
	 41CZZokOWF95kneio2ef6T4wRLJHrXtpZwoDjB/q+CVNm/GqUguMjIuElTyda41oeLCbx
	 6USR2FdRTeZANe9+hbNCK2EtjcKS1Cwsq9WVfOtrIl4GTDuYeptmcLwe9Wqzsj89vbQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794824642;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=JbqGOOCkMK2aUyWlzLwbx028m+dzfMAfr1ojena/7dQ=;
	b=r8ee5uLmudE1JWnC8NsSRddCdxXNDX0xW0nozSrDIGCzG+yd4tw9x2+lgEpx3ia3sxNJ
	 Dfuid50Kz0N8bChU+5Icong3PhujiEX1H18BanEPupZHjZlPSN0yCkfAHtNL9dAStr46B
	 liElbWOAexJfHIg6NxPmy1E3/iP81eMKvONsfWdVy+yYjTtHNgA+1yq0NxYCZO5GKZ7pw
	 yz9XPIP79NmSO1A9ovuNwwm/snAOT/U8Y0HN46mFEqExxAjJjh/AWkS6b4Y13avRijNF4
	 jiCnwIG/VB4ORATaJD+oHjBP2+nsYCXxzjsHY5yZRBsaZLn9W4dXk8zoQBXbTgMgihg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZX435Zha;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A026606A323
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 10:24:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A026606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZX435Zha
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-33fb4680717so8827040eec.1
        for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 02:24:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794824642; cv=none;
        d=google.com; s=arc-20260327;
        b=IYGmhJjOn4VAmkcKOXiLrFy4lflqVXFj1ModTryWGBu2gqjef9wZP5kE8ZGnoekgD7
         BtqNuLMq8icnw3wOIORLYW562KHm7l68xAmkKQSUV2Um/ZFNr0hnpSs/6UM9kWrb5g+0
         db3O6Y457s/lT7sFH7EEUiVrbVRHg/eWVuDB1uzff4X0Qb3NVGvp4nfb5dXS6gJpM9GH
         tP5i7Tb65jziByBpxjYKf0jf0nnAUCLcdKZ5LPVn2ilMnrLNhPt2y98CmfQa6g9a7mf4
         IXJ1XTeGM5mweg/ZgZ5bAzoCj59jNaomwCMG32ZNbPrSLUhVVE+ivBL609qmgdk3RZp0
         UofQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JbqGOOCkMK2aUyWlzLwbx028m+dzfMAfr1ojena/7dQ=;
        fh=M4xUFpotzdyfPCe5P0qxz63mrzYhq+p8DQ/fRIOVuOo=;
        b=BH+TqZu/FDN0U3SKSAFcD6PKLoGKnZNF/SF/zZ13T4cwtM+1tZdrXrVraxD+rDwCQY
         Tnlxn9h4OijNmOgS/4dHnSIawPTZaA0otlA0HDk2jV0XCH1BjONC87589WrETLzBPgcf
         cg1EP8yhLwmGVBv4voggQARJafxj8gwo6WNTtYzZOfJJVZF4YswCB9xkR05RkaZFDL+R
         CxtmcQu9isdGn3151t7WHELyP5JKPse4ebpDMOD1yxDyEhP+Nsxnlp5T8jvG3OcVBXR8
         g53kdknxwyTQ1iGwUjO8cC2nMfZSeGdJ4VpkVtGrfJ2dMS/+36IgCwc8ZBeuxPRpPZR2
         rZMg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794824642; x=1795429442; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JbqGOOCkMK2aUyWlzLwbx028m+dzfMAfr1ojena/7dQ=;
        b=ZX435ZhasskBrHhsjUgMP8cj896c1igrqorRzLaGT99+Rk0Gxy0oLjQgxiD+VMpKvH
         D4U/tJpsIbzYFrDIoGSW3/RDIYkG+0LbH1+2de59HTrHz6bH8aGzM0nu9Ry7YWcuqrQX
         jjFe3WyoteY5ZsEsJQclpDK/18FEkpjdJ/PgBADOljyIGLYUou7waKJYgwxlHtzQLAQQ
         gaOQMidMuDB/sBsRSiJN5PrLFAYv8GN9IL3MJGgEP+PWSlUy0COJMLIsK27tZtPdkOOQ
         aU2ELLzPlC+ajDK/grAFwSF0Bwf/yHKHGmDd4g5/1GIh/bDbZl2gpu9Jv9a4O3g8+sYV
         Gv7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794824642; x=1795429442;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JbqGOOCkMK2aUyWlzLwbx028m+dzfMAfr1ojena/7dQ=;
        b=dSbPcV8jtZ5Z3v4yYdJNrWAEPpASN7qOVMvXgEjmpRj6XzKoTUyfqhXUY/7bIDOJHj
         8i86RbwKfmjew1qHo+e8TDVy9mH/7wL4Ngkb/xtKvmBFu7796zaSlbNn0EQLQGFNxGDw
         dqznt77h3ZrbaMAx2DCxdBULq9eYyxCQ7TkspajGjq25P0t4uPYAeG70JmDxbycKRHWE
         X9YwkKnYumfpeB6IEOTolkgzfYajVF4B2tPlFommzVUcDxH2lNs+qznNziq8DtESCFIH
         ZNWEmrs1IFIrPbLM12fUZYywVkidFzeouSZYDYej97589b6CmbedgGKWVvKW41ZLJCLK
         qebQ==
X-Forwarded-Encrypted: i=1; AL+hErFg3N7y2uL5aleMAiIwUyQPjeLyXSkFajGReL+3xNt3iKfqfKsU+hm6D+tkltLGykj9SfWep23r83n7@vger.kernel.org
X-Gm-Message-State: APuU4Z+agZcruQ1FtzaIOCqQMrtdzFlFbAr4IunWUSrN7lYkSpa/Y276
	F0Pck1DHHTFDLGRbkobImKwROQKCf+3LviDRvR7QpWinjBLz71eChF8CZvDMzHN+BoQ4Q8FH7aG
	+g/7HGGSFIks5T+6S3963kLYccEy/7+Y=
X-Gm-Gg: AYBFou30ZVwF+E15U1mqopuceEbuTc4ZcI2mc1gALCaV76Em733S8Jipswq4ah0PiKl
	V21qwNyQmzipXdzPCIekiSFZWEK7UiLrAQdYb64XLJHnG8f53xJSpxtMb9qaeDXKuc4pXLcFpkx
	HMzzEhVpXP3guTeLX+nleGfPmWq+5zoZlAbZTAxN8kWILmjc9zg7ZemKy7Wzrg4tIfyG+96NerJ
	24T2yohnXW05IoyPK/uOxsIhl8Sbzd3kSh7lIXxbhG8aD0PzTjrI0PKylzD455gt/C+wjZytTmb
	7o2skclfysrh4TjW9gyMARJAh4YcMa1M/nqhxTnaWKnCMsPM8Bo/i+TCR+cI63oOU5uAVl1TFxI
	tC4b/CK1KHCLN28W4EvS/J0dadyWuME+7A5sQqyPHITln9rtUr/qHChwXU8pf1Ybkdpm60v7wLA
	5H1VMql21iUyR8Jz4KlmC33XFCuWNSXw==
X-Received: by 2002:a05:7300:b0a5:b0:375:f846:5b50 with SMTP id
 5a478bee46e88-37967316379mr9974671eec.26.1794824641398; Mon, 16 Nov 2026
 02:24:01 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261113145708.261530-1-clamor95@gmail.com> <20261113145708.261530-3-clamor95@gmail.com>
 <179474058020.3790083.7531788945003507652.b4-review@b4> <CAPVz0n154OuYUG2RObrdh4TmASjRhKF9svF0Z=4iCrPyyNt0pA@mail.gmail.com>
 <179478265643.13037.17097457582246933781.b4-reply@b4> <CAPVz0n21-_+G3cEVg98MwcYqhcaGi9nBa42YebNWiqUdo+vqjg@mail.gmail.com>
 <179482363653.13037.14387881069650442772.b4-reply@b4>
In-Reply-To: <179482363653.13037.14387881069650442772.b4-reply@b4>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Mon, 16 Nov 2026 12:23:50 +0200
X-Gm-Features: Aa3M54omU2sMa-s9Lr8odEO1dEUj9Cu5RuZQ3PyJtArCZqRb5bI6Ga-XTy7PHCQ
Message-ID: <CAPVz0n2OamOweoLJLBvyt2KD+Zuino1ViYTFsSjL3mTA2V3F1Q@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] clk: tegra114: Add CSI pad clock gates
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Prashant Gaikwad <pgaikwad@nvidia.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Mikko Perttunen <mperttunen@nvidia.com>, linux-clk@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D0=BD, 16 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 12:0=
7 Jerome Brunet <jbrunet@baylibre.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On 2026-11-16 10:43 +0200, Svyatoslav Ryhel wrote:
> > =D0=BF=D0=BD, 16 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE =
00:44 Jerome Brunet <jbrunet@baylibre.com> =D0=BF=D0=B8=D1=88=D0=B5:
> > >
> > > On 2026-11-15 13:54 +0200, Svyatoslav Ryhel wrote:
> > > > =D0=BD=D0=B4, 15 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=
=BE 13:03 Jerome Brunet <jbrunet@baylibre.com> =D0=BF=D0=B8=D1=88=D0=B5:
> > > > >
> > > > > > Tegra114 has CSI pad bits in both PLLD and PLLD2 clocks that ar=
e required
> > > > > > for the correct work of the CSI block. Add CSI pad A and pad B =
clock gates
> > > > > > with PLLD/PLLD2 parents, respectively.
> > > > > >
> > > > > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > > > > ---
> > > > > >  drivers/clk/tegra/clk-tegra114.c | 10 ++++++++++
> > > > > >  1 file changed, 10 insertions(+)
> > > > > >
> > > > > > diff --git a/drivers/clk/tegra/clk-tegra114.c b/drivers/clk/teg=
ra/clk-tegra114.c
> > > > > > index ec537efac692..08e425365469 100644
> > > > > > --- a/drivers/clk/tegra/clk-tegra114.c
> > > > > > +++ b/drivers/clk/tegra/clk-tegra114.c
> > > > > > @@ -1041,6 +1041,16 @@ static __init void tegra114_periph_clk_i=
nit(void __iomem *clk_base,
> > > > > >                                            0, 82, periph_clk_en=
b_refcnt);
> > > > > >       clks[TEGRA114_CLK_DSIB] =3D clk;
> > > > > >
> > > > > > +     /* csia_pad */
> > > > > > +     clk =3D clk_register_gate(NULL, "csia_pad", "pll_d", CLK_=
SET_RATE_PARENT,
> > > > > > +                             clk_base + PLLD_BASE, 26, 0, &pll=
_d_lock);
> > > > > > +     clks[TEGRA114_CLK_CSIA_PAD] =3D clk;
> > > > > > +
> > > > > > +     /* csib_pad */
> > > > > > +     clk =3D clk_register_gate(NULL, "csib_pad", "pll_d2", CLK=
_SET_RATE_PARENT,
> > > > > > +                             clk_base + PLLD2_BASE, 26, 0, &pl=
l_d2_lock);
> > > > > > +     clks[TEGRA114_CLK_CSIB_PAD] =3D clk;
> > > > > > +
> > > > >
> > > > > Change seems ok in itself, just a couple of things I'd like to ch=
eck with you.
> > > > >
> > > > > Seems both the CSI and DSI can use the PLL D and D2. Can they be =
used concurrently ?
> > > > > If yes, are you sure you want to add CLK_SET_RATE_PARENT which th=
e
> > > > > DSI counter part does not have ?
> > > > >
> > > >
> > > > CSI pad clocks are used only by CSI and CSI does not change rate of
> > > > pad clocks. Saying "DSI counter part" would not be correct, DSI mux
> > > > switched DSI clock parent while csi pad clocks do not touch clock
> > > > layout of CSI nor DSI.
> > >
> > > Ok but they end up possibly using the same PLL from what I can see he=
re.
> > >
> > > So if the consumer of csiX_pad calls clk_set_rate() on it, while the =
DSI
> > > is using it, it won't go well. The rate of the underlying PLL may cha=
nge
> > > since you have set CLK_SET_RATE_PARENT. Taken alone, there is no prob=
lem
> > > with this but can't CSI and DSI be active at the same time ?
> > >
> >
> > The clk_set_rate() call for csi pad and csi cil clocks for dynamic
> > adjustments is not possible. These clocks are used only by CSI block
> > and among 6 clocks CSI uses it can change clock rate only for its own
> > clock (TEGRA114_CLK_CSI) PAD and CIL clocks must remain fixed  by CSI
> > design and are not touched by any other driver.
>
> This is not my point, and you are not really answering my question AFAICT=
.
>
> Right now you have 2 CSIs clock each linked to a PLL, with CLK_SET_RATE_P=
ARENT.
> So a call to clk_set_rate() may change the PLL rate.
>
> At the same time, I'm seeing 2 DSI clocks linked to the same PLL, without
> CLK_SET_RATE_PARENT, so those clock will use the PLL as it is.
>
> The difference in the model used is odd. If it needs to stay that way, it=
 requires
> an explanation. If adjustements "are not possible", then why set CLK_SET_=
RATE_PARENT ?
>
> If the PLL is fixed by design, then you should not set CLK_SET_RATE_PAREN=
T here,
> and possibly use assigned-rate to setup the PLL, as designed.
>

ok

> --
> Jerome
>
