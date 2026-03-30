Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 805983BF68D
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 11:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774869201; cv=pass; b=fnVoB238IyaX1LeDk2zPeVwvBAFceQ7vlp/Eo7J7IVb+grr4dlQ5dzGfe1AF9DZV3DcleUQLCkNYK/wmNyCd4M4eB0d1uDONfBwpiobl78TvygQPt4bLFSRrniCt8jPvbRrx395ryYaE8siSPXjB7bewkUjDi6Dms1CO3LGRrX0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774869201; c=relaxed/simple;
	bh=dlgA3vHp/tCZZP6x+MyvcYNS73Ufva6+EVngsEM6VdY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bwqEc9+UbSY8f34Nlxq7HtSQQaZbZQ4YwF1hI9+vrUYIXxba3trFS3ogqX9oc5u/l3AQBSqpY2Lnz2o3jT+sNi70Van3/egkubzo9/eG16Mk/yhnJ2eq4lyvd+Yq4EnAj0o51jdvzFTvJqcFRDvzX+PPDaSwoAf/V6ktgnfpwm4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hCsadkBg; arc=pass smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hCsadkBg"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5a1307438ddso4669328e87.1
        for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 04:13:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774869195; cv=none;
        d=google.com; s=arc-20240605;
        b=HbMZgYzYhpYT8Eb+dH6hwjOirJRYFp+FMKuq2yLkuSUHWtixYdeuJJMBGsSMGigVK+
         ib9yo3db4VEBcQz4EcV5GSstHP/7pJo3Z4R87ELVfAf9qVtCcl7E2Hls14DUGnKljuVs
         Nji055t8IRNabQ2NtcwNAAgpVxkjUmW+wC0hxdhm8bWscHbXGgHUMrUOETuYYdPjnw0a
         sakXVF6pyLyqbvDoAfSTolEgll5jOnS8Trs7pFoPoPkXQ67zfIR67+PjKC1TwDFS9sJb
         uYgew9M9FgtIX7fPoVIWKM/gXqdmnH4QEOE1GVV14zUarnZoWKYh6urRsqvObH2/wBP1
         yGhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JOM+v3hkRUPIxwZnJzq8Dzd0DMU9QR03z+xYMXNAkMc=;
        fh=JoDA/5wqJt4xS0gJXxVDn0dln3/RxdTnRmQVpkNJSHU=;
        b=Nh4NtqRhm+4dDRkd8c152QmbuTJdXEf7Mon4vVlJMPyDXVwDTC0NtlgkIB0nmGwByL
         4mnjnqmtlENelAlXr9Fl/aKJWD635aGt+vdp2ODHYn5shHp/IaiIiGtUZtYfM2ISzgEh
         ehBhamR4zFxKywURBn2y3iLGiaLPuCR7Rmp5lK+YLNYZKPmSdZdDYoo2eWQVvTQ/7/Ux
         GU2MAblHzypXhg6NU79IGMW9XfX4ksL1EeqxJ2wBgrShxzV9UyaKUojIcq4Jl9GGOYRG
         PlMyb0pQuK7vWDDJ//WrTM73B8k0amMcdBrHOdh4bMfncdDCYJeBhoP8+iMrauAeTf5T
         gu9Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774869195; x=1775473995; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JOM+v3hkRUPIxwZnJzq8Dzd0DMU9QR03z+xYMXNAkMc=;
        b=hCsadkBgAmi+9tAT9KksvfkxwpsYqeTRsfRyUxAUIcHE8RGB9HD0sWgd8sCmWvcB1r
         UI07jD81jbCf75euSTuXQDsISj4krH1/XvuehjtCH1w7u/HcagjkA2LEIo+zn6FDTOCI
         LitEGYYLljS0josW8buvHBitH3eTJqQRQkQeGCWGa8XQI6J/veFyDR23q22xR4EsExfi
         p6BnlQ9Y2qj69Q3I8b1CK13Yynx7zcGYkjwzL70QcmMnWCLxEk1/mfDj6C7mOUVEhab3
         kXmticgIFLgroGP3qEsSkOrE78Hh3XmEGwTCunQBQAx9vYBV1K5YON0Wc6BPxk+rYBhj
         XT0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774869195; x=1775473995;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JOM+v3hkRUPIxwZnJzq8Dzd0DMU9QR03z+xYMXNAkMc=;
        b=O5Wm8nt3wVhgL0hWxjQMcr/14lB3dmfoG9rGni89P7W8GgouNZHsBH+qg9/Bo5Ns12
         Ns2ivciTFv+e4yOWcAudhUmemTDwLmvDe3bBIjjP9JdjGCkxc961dTEqlvOAMjR8K7jW
         LoqroUJVCnNg1jeYkB41z9aPzFn4Rf95B0xRRKD+jfm7IIq/z065of3FTMuN7UccMwMD
         H8I0JAJ+3k1ZiVgPPSH5ASS05KBMsD352bLlBIBHEh5FK0RuRhNWx3XWXLTwaSDmFQDx
         4KBSdPCf5Z6p0Z/c845ivwqxScOLsbiJHi/Npteg54UGI8avWw95/VxSiPGdJd9LyAre
         OHDg==
X-Forwarded-Encrypted: i=1; AJvYcCUUx3PYKPlrIifjo5Wayiv8ptllMz0TY+wbvBMXK7QQiiWKwHLLKnAfPiZZES1C7AEWKTpYxBwWWmCF@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2BxcRlh963uZ5i3xIqpvNp+Tbp5B7gYC6Biz5rWpNw/cLhHza
	5GjXyQ15fl6S4yiQriyJJfd6yhFK7Pdn3ND6JEQeH9uoA0cWwUPp1eItY3nyKvhB5irA/orSLRh
	FYG8cpxZw8qgVhCACFNV/zgu2V0L6DMS7E0Sq26EFNA==
X-Gm-Gg: ATEYQzwYvul9y3cKTW2aDm0upwokMVx/JMZ2PyuNd8QPKDq2NokLU77vRSIJqZmXbkT
	uOq9+OcQUvCEtkoKTHeLzAf7uEBBWATWrpq8AlYDuOwt7uzwWoQNSIg0VBcfbsjxehCtwScxiL/
	5cmO1OMSPnpNd+KNYQhsOCU3KsaTtqTP1BphtE288dtuPFygz2m9mXNY9sGUTx15VV0VpTLV/J8
	UnQ5jErQ4JftSrNeMtihweS6BSWdpvi5fsPKAK/Na7+/iCNPFGLbcNtJQqLf7BesgKh1v4olXrz
	ySkmePGH1bqPjz37vqU=
X-Received: by 2002:a05:6512:685:b0:5a2:9d61:f710 with SMTP id
 2adb3069b0e04-5a2ab92634bmr3995988e87.28.1774869195094; Mon, 30 Mar 2026
 04:13:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260318-gs101-pd-v8-0-241523460b10@linaro.org>
 <177409907930.268981.5882592990447577348.b4-ty@b4> <CAPDyKFoz-sm0pfvn5iSYFY0mrW38vaGRZsFvrVPqsv7BsYxeWQ@mail.gmail.com>
 <1fbf5c54-8793-4585-be33-ded77019adb2@kernel.org> <CAPDyKFrK3NLwaii-9FEmyaTzUAuVkMkLL3rWBQwQvT-M+PzEHA@mail.gmail.com>
 <3bb6b71e-947b-4248-95ba-79852f743c1d@kernel.org>
In-Reply-To: <3bb6b71e-947b-4248-95ba-79852f743c1d@kernel.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 30 Mar 2026 13:12:39 +0200
X-Gm-Features: AQROBzCzpsR16OKFH2Q1YSJwCONrrQEcDC_w0lPdIFqdSp0pO1DGRu9LhJ5vXKQ
Message-ID: <CAPDyKFpOPC2stAJ262jdap-=ByY09AeQ0kj6p_9FTGJBx+Tu-Q@mail.gmail.com>
Subject: Re: (subset) [PATCH v8 00/10] pmdomain: samsung: add support for
 Google GS101
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Peter Griffin <peter.griffin@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Juan Yescas <jyescas@google.com>, Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 30 Mar 2026 at 12:17, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 30/03/2026 12:13, Ulf Hansson wrote:
> > On Mon, 30 Mar 2026 at 11:54, Krzysztof Kozlowski <krzk@kernel.org> wro=
te:
> >>
> >> On 23/03/2026 12:13, Ulf Hansson wrote:
> >>> Hi Krzysztof,
> >>>
> >>> On Sat, 21 Mar 2026 at 14:18, Krzysztof Kozlowski <krzk@kernel.org> w=
rote:
> >>>>
> >>>>
> >>>> On Wed, 18 Mar 2026 15:27:45 +0000, Andr=C3=A9 Draszik wrote:
> >>>>> This series adds support for the power domains on Google GS101.
> >>>>>
> >>>>> There are a few differences compared to SoCs already supported by t=
his
> >>>>> driver:
> >>>>> * register access does not work via plain ioremap() / readl() /
> >>>>>   writel().
> >>>>>   Instead, the regmap created by the PMU driver must be used (which
> >>>>>   uses Arm SMCC calls under the hood).
> >>>>> * DTZPC: a call needs to be made before and after power domain off/=
on,
> >>>>>   to inform the EL3 firmware of the request.
> >>>>> * power domains can and are fed by a regulator rail and therefore
> >>>>>   regulator control needed be implemented.
> >>>>>
> >>>>> [...]
> >>>>
> >>>> Applied, thanks!
> >>>>
> >>>> [01/10] dt-bindings: soc: google: add google,gs101-dtzpc
> >>>>         https://git.kernel.org/krzk/linux/c/10084aeadadfab72648f6ed1=
cc78f7cd87b861ba
> >>>> [03/10] dt-bindings: soc: samsung: exynos-pmu: move gs101-pmu into s=
eparate binding
> >>>>         https://git.kernel.org/krzk/linux/c/3ec3c42b426fe5e2b48ff19c=
551dec50bc78788c
> >>>> [04/10] dt-bindings: soc: google: gs101-pmu: allow power domains as =
children
> >>>>         https://git.kernel.org/krzk/linux/c/c8229a5160eea145b796f543=
17d6e659cec9b080
> >>>>
> >>>> Best regards,
> >>>
> >>> Usually I pick up the power-domain related changes for the DT binding=
s
> >>> and host them via an immutable branch called "dt". If needed, SOC
> >>> maintainers can pull it to apply/test the corresponding DTS changes.
> >>>
> >>> That said, I am open to whatever you think is best here. Perhaps it's
> >>> easier if you can drop the DT patches and provide your acks instead o=
r
> >>> if you can share them via an immutable branch for me to pull?
> >>
> >>
> >> I did not pick up any pmdomain binding patches. I picked up only soc a=
nd
> >> according to cover letter there are no dependencies between anything h=
ere.
> >
> > As I understand it, they are all related and some even depend on each
>
> I raised exactly that questions but no answers.
>
> > other. I think keeping all four DT patches together makes sense.
>
> Why? What is the dependency?

I defer to Andr=C3=A9 to clarify this for us.

>
> >
> > Although, as I said, if you think it's best to funnel them through
> > your tree, please do and then share them via an immutable branch, so I
> > can apply the pmdomain driver changes.
>
> soc must go via my tree, but there is no reason to take the pmdomain
> binding patch. So I did not take.

Yes, they belong to soc/platform, which is common for most
power-domain providers.

To allow us to merge/maintain power-domain provider *driver* changes
separately, we needed a way to manage the corresponding DT bindings.
That's why I am hosting the immutable "dt" branch for these, which
soc/platform maintainers can pull-in when they need it.

Of course, doing it the other way around is also possible. Just let me
know what you prefer.

>
> But anyway, I just noticed that I dropped everything: this introduces
> new warnings which were nowhere addressed or explained. So regardless
> how this should go, please do not apply anything - it's broken and
> author is silent.

Right, I will await your confirmation!

Kind regards
Uffe
