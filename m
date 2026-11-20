Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795172850;
	b=kXs1RIwNbYNbOyvLFsnbxBW215IXSXt5nBfz6FQpAuASioGqP3A3HeFqp28go8WmRtAf
	 KxEUgM8le5r9rJekkYizafYLwrY4gG2aBgpfbiM4N+4ubiXF8Ftx/dhfhIzaXN1UBf3h4
	 BAMnoacnHXf4GXIFF2P8kPiOZ+cZC6Vlzyevh1A5OLaoghUVcNeTefFAn5RJRohdCkevm
	 vwprz3Xoq8Kx/VkLcDCDEmwTmtFgu8IBwrkoCNddkP/Ig8Dws8M5bWCl0mJ0YxbRx4dZI
	 Gwa4FlVHwsEt+ZURE2R+62VmruF1caFklNKesx7/ctRGeYN4EHML1sBG0RJjBLyMvyw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795172850;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=vw1Za3j6nrNQlO8tUKSo+13HAPp3lg1xUs/OwXV+egE=;
	b=ZpMuGe7zSBU7zYGCHKPR4J41qV7hyhEKULRPvhs0TkT0FIAxJ9t2055i5GGZ/Jia+b9U
	 dqTkze1k9lZw/nREvun+bozNM3dqlptMAqgIEDjx+nsuSnyAz3aGNkZTwLcEjVCZNKJcx
	 t5gMjO3uaGGIel5gH3BoD5dTedLp8kkvNjde2lT8EzS83gwiL4rmZlGBP0+XSOnWPkiv0
	 iP3fSdcydeK+/DBEa9LQ8AHUyFe3YskGkIIX3i5ENz1Btu6wc6nTqIrUM+4G64A2jNM+y
	 j991y6kRaKfP4+c+3SltTKyMXSFRluiW24H/6dtRJNOZoxt85mJnfMj77/2Fm7qpp0A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=yXseSSBw;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.46
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EBB660A6F4F
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 11:07:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1EBB660A6F4F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=yXseSSBw
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6b88d143160so893099a12.1
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 03:07:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795172848; cv=none;
        d=google.com; s=arc-20260327;
        b=E66j8t/RPRDalQ1lSFuB0s8rbB904xjTDvguRKJa5H10CPPrDb/r7I1Af9KO/fNRiA
         hrIlw+qgkYttFizlapRHIXLHRKslvmxrp6Nja0KOeXyg7fOU/pSFZIWyOn3mUGXq8pX5
         buhZqDQBUrmBdkpcooiibnWBcv7kzFCg62GrbaTOP95zuWtVZCn7EPICuSlkw4qZTqS3
         SODSq4j3nHTu6XtRqCJ2a6mX3j9iTxlwreyPb61V9fdTMY83EFT/BGl/eDF/huVeaB7h
         nMlYuVDcOVj7QHLG/j7xzVl4QtQ/pI6fQIegu77H2ceA5bzbHN5QniciVIyE0yJY6urH
         hD1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=vw1Za3j6nrNQlO8tUKSo+13HAPp3lg1xUs/OwXV+egE=;
        fh=E8J1cQm5viwfY0Ew6VfrZY98yNhQI2/fSfO9NLC4Gyo=;
        b=eSk5sDXgYdPTsqsFmNEkuPeOvaDN/HXrqEYLmGEItOuoOYgD43NmFsSPqaeMXRhGpo
         dWITl922N/F+sordk61kPlBPLw43Bprri3/7+cLrANtXt72UmrkHcE+WXrrgAsbL7Lag
         /zZBAqZfSVDd96KAG2L6fVlfiT0IsUlyEK+XIE5s+e8XF6lN1gM1BgRzOo5gPSQ/5aKA
         VuCdqtMm4YvImdJ9v3sHs9NDcvW/zDXIOx4DNPBkWe4cvjb2gvQHphuQGyc9ZXJBt6Fo
         cy5S3lqC9ofCJ3FDSaJ5lpnq4gns9M+i4plvpQx56aSRpm++9ROkfBrLvFv782ZJxxrx
         YdzA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795172848; x=1795777648; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vw1Za3j6nrNQlO8tUKSo+13HAPp3lg1xUs/OwXV+egE=;
        b=yXseSSBwL667WWeqcwc21yoPcofDc/e/i/a0eCGiiUIrolXJjf8p5oc5Tb4mc6Ermj
         bePnEkY54ZTwInl8DL26psq1wTSD/NFqBAe8CxTmiyBHp1H/jpU84o455nMMjQhhEdEa
         lA1XN4iqiRUxyl9I8P8BVP5yyGg+CpqVfPuEtVWUJ3GwjYCturtgNWaBIXKDoI27wRMS
         eZA2otDBZHbX3bSAsZq6wZS6p8uA816T6cXsXjW9BokYqZBj516ziReL7o4DVqv93sGi
         YtmqSj33RCnGt5u/8A4nKw8q/PDc+udI289bWFav1ty6PHm9KHhQlgCApfj082PM3uVD
         IKVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795172848; x=1795777648;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=vw1Za3j6nrNQlO8tUKSo+13HAPp3lg1xUs/OwXV+egE=;
        b=YsQdWAxFHcNpzTfslJMpdY1r9HZ13D6oRkrp4ZWtouRQ6od/ijvNLWcwoAPj/aVZwT
         GTP0rfI6ir7TteiqYndPzdlAb9Yjwnm3RdA+81O0xS9mYjobgBwIGS3eLIwb5zqJ/LAP
         BPJ4uV+b/Fdr3jQMUw2K67wodQIly9DFAvnFbFXC+Aa6MRpuB1ZZxPzQ7243Svp0St1p
         UQ0JVwODLSmye6DOmeeDeCkEkaB97hRonycqCB5P2XMJGAB/dioetkDwtoctLIoNQ0Bj
         9+3kq2/VpsHxlp3br9E/IZyRMz5gcCKIfj4gsFA/w8voU244cQ4EyCVwAA++PPVSrnnU
         r1Lg==
X-Forwarded-Encrypted: i=1; AL+hErHNH21FNfN+inV985U6fB1GsGWA4VxJaGGebtW8GkonYadGET3zx4QUhEAKjWB+nuJsXypjvBHq9P+V@vger.kernel.org
X-Gm-Message-State: APuU4Z/PwEyvr7MhZBQ5a6RjW2nEfZ1Mv8OAgcW0PBWKRZUJa/atDj2O
	PtK489xqIYqmSy1QerygWg3jGtD4fJ33Qg37+/DPmbxk428VbQ+rSWhci5HE2tivak6Pd3DwW6q
	XHMGVMTXmhDASD0oHlnX6Rqf8ZG2YKycMES0pAwnJXg==
X-Gm-Gg: AZFdTZf4AMB7ld2UStymYRdWSEhS1r1yPimW8dqczwrdxoG+Vu2mdVSaGM1ZwYcPGrU
	yDjQ3euZyqso+I3ZQ570vYNDv7g5PF7aQDC2JVQ4wm7u3pXGn3iMhGT+VgQW+KTXpAUk+MxxhQu
	OXnOtpb4d9R7yGq7Jpp9Fav9ZkPYKXOUVLD+LfHhwFju+qcOyUf1E8Gc01dLdVroOPSjQViZkBV
	+ol/yo/QQIYkZqkkeUOKPgH2cmoIU0s1CZ4AvNPxKdmemABMmZbS/LdjpbofuxTUJ3xrJ/4b9mM
	eePV12zzCfERkcbaSbnN6VY02hfCyKQ0wSVem80GCwRQYUXQ6Uq/B8M2sshYhdOOLO8fFG+/yfE
	rktfCGOv6lKa/sD0tiOK62jvLNFNT6Or7gLuGta9qr/Lg8JecZ6gDbIL9ymyc26B4LnbCGs4=
X-Received: by 2002:a05:6402:3225:b0:6b5:79f4:8d52 with SMTP id
 4fb4d7f45d1cf-6ba37e6f806mr1953110a12.20.1795172848247; Fri, 20 Nov 2026
 03:07:28 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CGME20261113104847epcas5p1d970255218f1ca78b19690bfd097f303@epcas5p1.samsung.com>
 <20261113110612.3265841-1-raghav.s@samsung.com> <20261113110612.3265841-7-raghav.s@samsung.com>
 <CADrjBPoR7_LDZmxC_bOFigvqDaagVihmybfX5AdvSPr9-FVb8w@mail.gmail.com> <002901dd77d9$6ddef600$499ce200$@samsung.com>
In-Reply-To: <002901dd77d9$6ddef600$499ce200$@samsung.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 20 Nov 2026 11:07:16 +0000
X-Gm-Features: Aa3M54pTNJ_y_R-HLRUhtwnIbiMHdLsAfFF3Abu5bW9vYYJErrbwlv-VYU97Njc
Message-ID: <CADrjBPrO43A6XaVK7_J3-y9=bOsjhNbyf8KA6fmyvLJ0O61gOw@mail.gmail.com>
Subject: Re: [PATCH v3 06/14 RESEND] clk: samsung: clk-pll: Add support for pll_4313
To: Alim Akhtar <alim.akhtar@samsung.com>
Cc: Raghav Sharma <raghav.s@samsung.com>, krzk@kernel.org, s.nawrocki@samsung.com, 
	cw00.choi@samsung.com, sboyd@kernel.org, bmasney+clk@redhat.com, 
	jbrunet+clk@baylibre.com, robh@kernel.org, conor+dt@kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, is.gandhi@samsung.com, ts.amit@samsung.com, 
	pokala.reddy@samsung.com
Content-Type: text/plain; charset="UTF-8"

Hi Alim,

On Thu, 19 Nov 2026 at 03:52, Alim Akhtar <alim.akhtar@samsung.com> wrote:
>
> Thanks Peter for review
>
> > -----Original Message-----
> > From: Peter Griffin <peter.griffin@linaro.org>
> > Sent: Friday, November 13, 2026 5:58 PM
> > To: Raghav Sharma <raghav.s@samsung.com>
> > Cc: krzk@kernel.org; s.nawrocki@samsung.com; cw00.choi@samsung.com;
> > alim.akhtar@samsung.com; sboyd@kernel.org; bmasney+clk@redhat.com;
> > jbrunet+clk@baylibre.com; robh@kernel.org; conor+dt@kernel.org; linux-
> > samsung-soc@vger.kernel.org; linux-clk@vger.kernel.org;
> > devicetree@vger.kernel.org; linux-arm-kernel@lists.infradead.org; linux-
> > kernel@vger.kernel.org; is.gandhi@samsung.com; ts.amit@samsung.com;
> > pokala.reddy@samsung.com
> > Subject: Re: [PATCH v3 06/14 RESEND] clk: samsung: clk-pll: Add support for
> > pll_4313
> >
> > Hi Raghav,
> >
> > On Fri, 13 Nov 2026 at 10:53, Raghav Sharma <raghav.s@samsung.com>
> > wrote:
> > >
> > > From: Alim Akhtar <alim.akhtar@samsung.com>
> > >
> > > PLLs 4313 are found in the Exynos8855 SoC and it is similar to
> > > pll_531x except for CON8 offset, so re-using code for
> > > pll_4313
> > >
> > > Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
> > > Signed-off-by: Raghav Sharma <raghav.s@samsung.com>
> > > ---
> > >  drivers/clk/samsung/clk-pll.c | 11 ++++++++++-
> > > drivers/clk/samsung/clk-pll.h |  1 +
> > >  2 files changed, 11 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/clk/samsung/clk-pll.c
> > > b/drivers/clk/samsung/clk-pll.c index 3d837bd74355..7b0756127306
> > > 100644
> > > --- a/drivers/clk/samsung/clk-pll.c
> > > +++ b/drivers/clk/samsung/clk-pll.c
> > > @@ -1306,7 +1306,15 @@ static unsigned long
> > samsung_pll531x_recalc_rate(struct clk_hw *hw,
> > >         u64 mdiv, fout = parent_rate;
> > >
> > >         pll_con0 = readl_relaxed(pll->con_reg);
> > > -       pll_con8 = readl_relaxed(pll->con_reg + 20);
> > > +       if (pll->type == pll_4313) {
> > > +               /* Offset for PLL_CON8 which hold FDIV different for PLL_4313
> > > +                * which is PLL_LOCKTIME_OFFSET - 0x4
> > > +                */
> > > +               pll_con8 = readl_relaxed(pll->lock_reg - 4);
> > > +       } else {
> > > +               pll_con8 = readl_relaxed(pll->con_reg + 20);
> > > +       }
> > > +
> >
> > This starts to feel a bit hacky (pll_con8 register being referenced as an offset
> > from lock_reg). Is the register really called pll_con8 on 8855? Or is it called
> > something else, but happens to contain fdiv?
> >
> Yes, it is named as PLL_CON8_* on 8855, and contain fdiv bit.

If the register is actually called PLL_CON8_ in the TRM then the
current patch makes sense "as is". It just seemed odd at first reading
that con8 wasn't an offset from con_reg on this SoC.

Thanks,

Peter
