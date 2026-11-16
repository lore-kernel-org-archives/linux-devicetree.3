Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.181
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794818607;
	b=dzSvQKrYVHn8ig658xK/AW3fKns5DUdyxpm3i4Ffa2qCZ7USWo/Rz+oSpgq6aQFNWfGl
	 AHYyOCgPFd3jcvA30JQAQ5rWz6XbkCPuKTYLyclxXLA5iXgRsvBDo0MR9hot11HAsAai/
	 lDIkgIRxtpQixsshRzihSD6YXj0SG7dKVxth2ciA4yArttehaQdf3fa+Gu24QIG/6IK2u
	 YXxa4shSD1QxJthVuwQDqyu6ULmFLq+0qMUFuGrfXFMqdSJO1j1n50IiHsqr4ryPj6DGf
	 sTyXSuJckFY5/zWeRfvY3zS/8nKkkJZEztcFL5lkUoo7SqJcZ9U8OjGHIwvMZlXHp5g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794818607;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=nY+h2b3wsrKb5mJ3LIlCYXVGjCOvqpxj3QbUvlrfjKE=;
	b=RMW1CsspqhQJj8i7Z0D4zPdbGvgpLMVyUgixFXpr6avW/6yjFjsVJLJEBuMJud+8Zsa3
	 e4BmOQgT8J/fQXQS9JLIeenfoIvgoYUIKVpCOFYqftDB1yRlDlde79U01YtRgnqdkPROy
	 tBvWVwlwSH8JcBOtkBtdAV/QECUAQRIBFq9zelMKCVJ/HcNrLvIg/VAw7PV81tRKEynOY
	 D7XNkQmXzyiRhogBowDi8wxEBNzTVRzDc4R7HsNHulpnFpoVpa1UDRhfr4IX338tinyhD
	 FVPttnTssuSJ4vCgmr8aiEfqKaGUeW12NLuIO6/CMgAu+6V8VLs5FBLDRCAdEGYmc2w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aFoLXRey;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DB12606A329
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 08:43:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0DB12606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aFoLXRey
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-3282db206d3so9138539eec.0
        for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 00:43:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794818606; cv=none;
        d=google.com; s=arc-20260327;
        b=nmKO0vjiC9/rdPwQ87h9JtOFxQ1xvFP+oYXLJRGyangtLRV6yanxzdkkDRDUZc2kqZ
         WKwyMmrf8TNYyahQ+rM4EddDd/miYSWzX3vxl8eOy/ihDxiwApzw9h3Yv/PAxM/4+neL
         j+Y0554TNJj+LNqHrlPBCw2enxnYUT6go5pMsztW9zajEBHUnHTMyJZsDnoM7/zkZ3OS
         nuhQpQJBAMtImEnqwHJb/eUnyLjqZGQxKpsXMlXRxT0mVfdJTE90DjuTuvpY30REHKtg
         r7tZJr19Sd+Q+21L2MH5NW4P4ER7+TJK0VD+HPb++dSqkiz3FAmR87I2FLFE2DYgAFn+
         spIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nY+h2b3wsrKb5mJ3LIlCYXVGjCOvqpxj3QbUvlrfjKE=;
        fh=3sIbuJ1AQeyGoXrM2cyy/DW670sk2KwcyzMTb9dWOKU=;
        b=ht0eJtmi1oIn0yFQyqR1uDSpV9JptAwj2YIrjoF0oQIofesCpb5qio1dhPmROILfEI
         LA4eEn9G8eOihygr1XemC/V7Vi7n8ImjevARl2POzLfL/fvRAlkGqbqWkBJn/xXl+JPK
         7ui3tv4lqNvp55iCJ7WK4OcS1uSOJ9BdA0mpfWLdseDZHpGmS28uH3Y9bnq5R7tmFfJ1
         xx2xqd5AMd/PZQQistbfm5naxiPCZKBs/kR/1k5nhTVfcfOySN69s+9InQLmGcSbmesb
         kHMs6rQ/ISnzLeV8GPabJEr7NrJ3sIldV3SNztjPB1eQTt65t/hIIJbuzq7VwrNijU9O
         pBWA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794818606; x=1795423406; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nY+h2b3wsrKb5mJ3LIlCYXVGjCOvqpxj3QbUvlrfjKE=;
        b=aFoLXReyupk43dXE0Bd8Ij6BK2NiknSHpzjU1u40qyGksAAyb1bLMBlYS0s6NFh1AY
         dPupndtPEV5CcQ8zlesWggleFHSp6R7olXSiJO/2jaHX6dNXjIL/Nctv8liWpvh4lo14
         8aKPlNa22PYGuYtosrzw7gWAVoaVV9tiAIydtZySFSBvKhuIWR2RZKnknmWx95H6ADSQ
         DDUwPCOZGSB9bbc4bNTzxEDs+Gmtb0YnMyaqE2WmqcTLu2vdEjquvLLrjkp21BNAJ0ek
         fAYPIAfEfLo0z3CcBiFhWbmJwgnSrNENJLZ0ieUXzsWh1NwQ2KgwqBnU/Vc/zfqSGHa2
         2NoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794818606; x=1795423406;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nY+h2b3wsrKb5mJ3LIlCYXVGjCOvqpxj3QbUvlrfjKE=;
        b=crz/jXNdHyj255Q3vBbSqW+dz2x8nVw1cB/GH6anTuagBW1/OEykv2jEU3z4MF3HJG
         rybXXQKbibPn2FtQwkRnjnjurK8pWaOA0jyjq+Qz6oa3m5OQMtoqQqseG/UPRtR2k4Z4
         sg/m33mChFpinU9SHRvRKNnquexTGuJLUyZazTtLECicVtjguNBFl4fv0/YR2KNm4JXa
         CAjeaEMvP1jx1NtVU11hr3AgUXX8a1wkdx9Vp1BDsrW6vUOY2QgWmGTkLCg1uaH09vGP
         IJlvRm2cwr9i6UKU122bGaXSeb7VsLVuueLzPWVLflQG5+Gpur0BdYApaWa5JuWzILhI
         Ac2w==
X-Forwarded-Encrypted: i=1; AL+hErEbsgSdrHZei56KNfps+2jN4X4pAWIxB9yp9f/43XlJgYLP0GK0kOZvQboPzegxnErDYdlr5j2otlqh@vger.kernel.org
X-Gm-Message-State: APuU4Z98B2FlHyUzpB6+LIPQLRZUOLb6Q4SA7aFEz39IgGYhKLmB0AJ8
	AQ2zNHH6ZnUiazHulvtAx4vfm8HF1UBY48FOTykPIHmZkrgpVAyrjqNpjgWnAMWKqfbWFZMmJwA
	c3fh9Lc/dFc5hQkGVWHcPA/nnnEMYE5Q=
X-Gm-Gg: AZFdTZcz8W10m/M95G/FuTSueVmeqw3D6peEAb8qnEo67OpMQN5RTny4ghwSa1W0mbI
	douHjUXLy5hhDS1Mn8D+px3kU9r5kqxjiTqvTeXq9TdAVUzGF30uLEdmrqhcHLcS0QfGPJ9l27n
	Brh+lgpzs6naGzgYL3B2uth/3JfoifKubCmrE7gcdOsFZFFAIi2Whdbvd4xCVsbDMUZJfRlPUbQ
	0528adErRYTu1SXCEBa5eedK6ylnvZfmfF76zVpLww0GLAZcDv5yJZRL8obqc4RUoog2izu3uA8
	/+L2F2m95snzrYzBEPRD7VPP0DJ/00BxyQuKfvvtRRC7mk634ohD9qEbuPmP64kAaMOItrOLHeh
	BmuMyWp72jFCiCHDVQFWXhbKBPIl9WPA4RWdGEjw12OIg0dgQloyPZ4swYIAiGjokwBXjO4WccS
	/qe0gKc5CTzsgQ3Tc/8pSCeDztNibEuaxuq/AGB80jGZNiyEpl44s=
X-Received: by 2002:a05:7300:dd03:b0:36a:437a:4c00 with SMTP id
 5a478bee46e88-37967314a08mr9190579eec.24.1794818606016; Mon, 16 Nov 2026
 00:43:26 -0800 (PST)
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
 <179478265643.13037.17097457582246933781.b4-reply@b4>
In-Reply-To: <179478265643.13037.17097457582246933781.b4-reply@b4>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Mon, 16 Nov 2026 10:43:14 +0200
X-Gm-Features: Aa3M54pMEr9UjE1zw6W6dd5jtUGbWeQ0qW9zBZkFj9pK7Jh0wgW3qgyddXi81sY
Message-ID: <CAPVz0n21-_+G3cEVg98MwcYqhcaGi9nBa42YebNWiqUdo+vqjg@mail.gmail.com>
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

=D0=BF=D0=BD, 16 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 00:4=
4 Jerome Brunet <jbrunet@baylibre.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On 2026-11-15 13:54 +0200, Svyatoslav Ryhel wrote:
> > =D0=BD=D0=B4, 15 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE =
13:03 Jerome Brunet <jbrunet@baylibre.com> =D0=BF=D0=B8=D1=88=D0=B5:
> > >
> > > > Tegra114 has CSI pad bits in both PLLD and PLLD2 clocks that are re=
quired
> > > > for the correct work of the CSI block. Add CSI pad A and pad B cloc=
k gates
> > > > with PLLD/PLLD2 parents, respectively.
> > > >
> > > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > > ---
> > > >  drivers/clk/tegra/clk-tegra114.c | 10 ++++++++++
> > > >  1 file changed, 10 insertions(+)
> > > >
> > > > diff --git a/drivers/clk/tegra/clk-tegra114.c b/drivers/clk/tegra/c=
lk-tegra114.c
> > > > index ec537efac692..08e425365469 100644
> > > > --- a/drivers/clk/tegra/clk-tegra114.c
> > > > +++ b/drivers/clk/tegra/clk-tegra114.c
> > > > @@ -1041,6 +1041,16 @@ static __init void tegra114_periph_clk_init(=
void __iomem *clk_base,
> > > >                                            0, 82, periph_clk_enb_re=
fcnt);
> > > >       clks[TEGRA114_CLK_DSIB] =3D clk;
> > > >
> > > > +     /* csia_pad */
> > > > +     clk =3D clk_register_gate(NULL, "csia_pad", "pll_d", CLK_SET_=
RATE_PARENT,
> > > > +                             clk_base + PLLD_BASE, 26, 0, &pll_d_l=
ock);
> > > > +     clks[TEGRA114_CLK_CSIA_PAD] =3D clk;
> > > > +
> > > > +     /* csib_pad */
> > > > +     clk =3D clk_register_gate(NULL, "csib_pad", "pll_d2", CLK_SET=
_RATE_PARENT,
> > > > +                             clk_base + PLLD2_BASE, 26, 0, &pll_d2=
_lock);
> > > > +     clks[TEGRA114_CLK_CSIB_PAD] =3D clk;
> > > > +
> > >
> > > Change seems ok in itself, just a couple of things I'd like to check =
with you.
> > >
> > > Seems both the CSI and DSI can use the PLL D and D2. Can they be used=
 concurrently ?
> > > If yes, are you sure you want to add CLK_SET_RATE_PARENT which the
> > > DSI counter part does not have ?
> > >
> >
> > CSI pad clocks are used only by CSI and CSI does not change rate of
> > pad clocks. Saying "DSI counter part" would not be correct, DSI mux
> > switched DSI clock parent while csi pad clocks do not touch clock
> > layout of CSI nor DSI.
>
> Ok but they end up possibly using the same PLL from what I can see here.
>
> So if the consumer of csiX_pad calls clk_set_rate() on it, while the DSI
> is using it, it won't go well. The rate of the underlying PLL may change
> since you have set CLK_SET_RATE_PARENT. Taken alone, there is no problem
> with this but can't CSI and DSI be active at the same time ?
>

The clk_set_rate() call for csi pad and csi cil clocks for dynamic
adjustments is not possible. These clocks are used only by CSI block
and among 6 clocks CSI uses it can change clock rate only for its own
clock (TEGRA114_CLK_CSI) PAD and CIL clocks must remain fixed  by CSI
design and are not touched by any other driver.

This layout is used by Tegra30 for quite some time and I did not
observe any regressions of DSI/CSI caused by this configuration.

> >
> > Same layout is used in Tegra30 and Tegra114 inherits it.
> >
> > > Also the DSI get the PLL through a fixed factor 'out0' but not the CS=
I ? is it something
> > > you have checked ? it just seems a little odd.
> > >
> >
> > Yes, out0 is a fixed div2 of DSI clocks and that is code reflection of
> > hardware. CSI pad clocks do not have this setup in the hardware.
> >
>
> Ok
>
> --
> Jerome
>
