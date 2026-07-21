Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C95DA326D44
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 17:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784655743; cv=pass; b=DJ7ZhF/pr6UVlCw6BZWyvbE/k5twvkbsQwyi3mSmGOO1Gac+xK0thZuRdHrjOw+Oj+ta9YZF1gTXfkYghJuxaZUz4ElWLFWcpq29viQHmnc9AITGCYlHIaOaYB9frq1soA5mP505gEtI5QIrirxLYEXOPEGxWGF3J7afMuNIReM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784655743; c=relaxed/simple;
	bh=tK+bZLcsdQ8qnewhBYqhGihItfIiZUpVHQ0hH8OrxvE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GGPiYYO31XkVZXQAKvAX9fQaUdLRrxn5pe4D+nMxnYi/VAcHZNqjzCT8Iex7Biyq/ToBJPnLE6Cslro5qL8fekE744ueogDDAQ29kR0NMFoh4QyHCqR9DT4Yn9/fOt/tCxOiCMZk6B6wq5DbgIz3+CR99bATAKyka4ljD+qZwS8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X9YAV96j; arc=pass smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X9YAV96j"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-39c8dbf4ef0so105228481fa.2
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 10:42:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784655740; cv=none;
        d=google.com; s=arc-20260327;
        b=auo2+2NHBx+axwN0BnNzXuw7BE4CHrC/YkMQwTDokECcxA9gnIZPfsig4O2tcDMWKC
         FxCw4VoYVGi3ofUQuq7YZ2AHb5cZF91QEi2cyO5RBVteASfQfVbheXztCLJhyp3EgDUl
         cBUH1i35gRctTOXKs8MTUawZi1GBKyOw8OARhuDhSrRIlluZTSroW8eRuT+3wMtDnJnK
         nKjc0gWzad/wZ+NEDPQVXAlLI7hJog+ei6TU6xqQnK+8po2Q/UwviaWULH6P6HmIFYv/
         eKTBXv1h4NcdpbyUamfe+G/m5YMoaR4aFC89g3rCVSixzEJs1DmDSn+JrBNEruDZgGNA
         ZDQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wcHwhdeQPiyGFea8RRLYBEqK38jdeuTu3+dvRJn5SpA=;
        fh=dyDdi3FX21Zw7NVVqBVo+/6/HY+B2tgT2Zo3O97Hbq8=;
        b=Hth1V6kp7ujSN4kKjCZTEMHAytJuche1KUOlLaUaGieYACu+w2b0s8lDqbHxhaVCeZ
         l7wIl/gWI9UbSbj4HvkQOJVxJl+ncizjtCsYakNRjAX5jJKKM1aZPFISlDz7nrTrTsmN
         AaF1IzcuR7ixiE+gmlUv/6BIzCpgt/FlrafAKaQNiuyTARbZfvsYRLDm9xf/LvSryfVN
         NgIJHx44RPgFKuQlVrcU2KIFKogWAFBoVmfJbawZsYInxg4hRchCepmh49o+lKTHS9K/
         GxVhtojaMUbKmS7dn0znaJYbAifWykM15sAFos/EbqQop6MlqU6VD72biTdM+8kuobm6
         NtLQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784655740; x=1785260540; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wcHwhdeQPiyGFea8RRLYBEqK38jdeuTu3+dvRJn5SpA=;
        b=X9YAV96jxo7lOWIxIPkChB0PAWO0eFKMwom+yz2BNuLbDNh1dcyqRfJ4BGljECqO5A
         hbdEIBMdeFFJ9u88gvQMPSBTuLsQZJnoFDD1NqVuA/siVMfBeOVnBApbMt9bqLihjYQC
         le5W6kHh18XGl4iXljz2pu0jC52tQbxLyHsz8HFPpE1u15QH4TAOscBWFdsBgnVj6K5y
         hKCzkrYsTxd6a2REtjaJYRS50ciSMdj34QuXfbnW0tCYEx+LgxBmgW67OxhppOma4ga4
         8GaDRSv3AtwYdDIBWbzP4BR/XsxH2onlGmLrr/Ql7A0F67GkYVTJOm9wfuoBeXsvu6uz
         SyJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784655740; x=1785260540;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wcHwhdeQPiyGFea8RRLYBEqK38jdeuTu3+dvRJn5SpA=;
        b=oWLcgkhlvjqJDAv2whECCUhjsARvuiPNuWJXhuGwJb/PqMwyodFQROJoKt52iGgpFy
         ETSgVa0C9tpHtbCt168fitV0m7SzSBQ7XyajqOOPjIzBxKqa7FL98x8S7N+Ro8ydhJ3Z
         SzDZL/l942n/Xo3QzPW77ReRxCEzW3Lg49dHLAPCQYKuiEnKbsEEKAwMSRRt90ce4Knj
         aESbwW4HM5u/hjJ1p4Bu71oO/seCT3EPFbgUfxaJrKQP+3Q25vbvVMEdWo1LNvHRqzDS
         HqVFaPOMr2TJbo9Vz5r5umZctPEjvULlVn7qWS221eNvKjezDqxev1mxqX55hgp2EoYq
         2uQg==
X-Forwarded-Encrypted: i=1; AHgh+Rop3G/gX+sX3Fqx+PcChkpJA7yJLmHfVLkMJaRednQPcAQP832c19dVfgQ3eX70KG+Pk9+alZNDtuij@vger.kernel.org
X-Gm-Message-State: AOJu0YxfcqLQfBQwiEsQXx9Ij1sal3qOfTQM3xzqJg76DZqDf4kdqnrM
	brBaGFZkDZ73DH584hklJJvJTMwIY2BVaEe8psPFiUZqCqQvE6Yyn4nIvPS0W8nGBvybxLY/hCb
	1eKTNEMnSFL4mOPfEd5JE/vsiX5Q0tHI=
X-Gm-Gg: AR+sD10aIoLnpoaSdBUuruquD1MJ1DYA+XrPN9Y3ZqYy/6XA6WrKXrgbWzO7QEFm6Eu
	Gb4ATVI7mOz3y2tkWl79fx6zeINESHKioMljG+XuHQztGt2UWQVg2TnNsPMI855dR2jcCNvXoU4
	XaqapK9S8kCNlP5ex7+NmiikneCzGCtJVjwDDUvD/vc3ochXblsMwLyNarD7+6ZAJqCFeVh+drK
	qKuRVbLMcZhjV7jl0bD7aPCFPTF5tS5Pz8W+04nxOtiY3p3tZLak9QUqk5f1lU2lkMt9xhdTeeb
	o0a6iF3JdZMu/TqViovJ/yIEcwW7pcoMLkegJrZSUQM/f7ltPD8ll9cD5w==
X-Received: by 2002:a05:6512:b83:b0:5ae:b5bd:5e72 with SMTP id
 2adb3069b0e04-5b28fabb816mr4439164e87.59.1784655739596; Tue, 21 Jul 2026
 10:42:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260720-t210b01-pmc-v2-0-ca5317f8507b@gmail.com>
 <20260720-t210b01-pmc-v2-2-ca5317f8507b@gmail.com> <rrmQkm06RD2JduKX6eSoDg@nvidia.com>
In-Reply-To: <rrmQkm06RD2JduKX6eSoDg@nvidia.com>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Tue, 21 Jul 2026 12:42:08 -0500
X-Gm-Features: AUfX_myE-1nDG631FIG3IHwi8gO93TqS2Jbav418JH0CG_P0J3Xxa7JV1kei1m4
Message-ID: <CALHNRZ9F5RkcdegeeOncTD-6eg6+25cGn0p+Rabboj5oTZ_=Yw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] soc/tegra: pmc: Add Tegra210B01 support
To: Mikko Perttunen <mperttunen@nvidia.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Thierry Reding <thierry.reding@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, 
	devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Azkali Manad <a.ffcc7@gmail.com>, 
	Thomas Makin <halorocker89@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 21, 2026 at 2:22=E2=80=AFAM Mikko Perttunen <mperttunen@nvidia.=
com> wrote:
>
> On Monday, July 20, 2026 3:31=E2=80=AFPM Aaron Kling via B4 Relay wrote:
> > From: Azkali Manad <a.ffcc7@gmail.com>
> >
> > The PMC in Tegra210B01 is very similar to the one in the original
> > Tegra210, but has a few powergate differences. Add support for this soc=
.
>
> The tables are a bit difficult to compare directly, so maybe list the
> differences between 210 and 210B01 in the commit message.
>
> >
> > Signed-off-by: Azkali Manad <a.ffcc7@gmail.com>
> > Co-developed-by: Thomas Makin <halorocker89@gmail.com>
> > Signed-off-by: Thomas Makin <halorocker89@gmail.com>
> > Co-developed-by: Aaron Kling <webgeek1234@gmail.com>
> > Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> > ---
> >  drivers/soc/tegra/pmc.c | 62 +++++++++++++++++++++++++++++++++++++++++=
++++++++
> >  1 file changed, 62 insertions(+)
> >
> > diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
> > index f419a5395545f..48ae4ff3f00db 100644
> > --- a/drivers/soc/tegra/pmc.c
> > +++ b/drivers/soc/tegra/pmc.c
> > @@ -3897,6 +3897,67 @@ static const struct tegra_pmc_soc tegra210_pmc_s=
oc =3D {
> >       .has_single_mmio_aperture =3D true,
> >  };
> >
> > +static const char * const tegra210b01_powergates[] =3D {
> > +     [TEGRA_POWERGATE_CPU] =3D "crail",
> > +     [TEGRA_POWERGATE_3D] =3D "3d",
> > +     [TEGRA_POWERGATE_PCIE] =3D "pcie",
> > +     [TEGRA_POWERGATE_MPE] =3D "mpe",
> > +     [TEGRA_POWERGATE_SATA] =3D "sata",
>
> T210B01 doesn't have SATA, so this can be removed.

Ack

> > +     [TEGRA_POWERGATE_CPU1] =3D "cpu1",
> > +     [TEGRA_POWERGATE_CPU2] =3D "cpu2",
> > +     [TEGRA_POWERGATE_CPU3] =3D "cpu3",
> > +     [TEGRA_POWERGATE_CPU0] =3D "cpu0",
> > +     [TEGRA_POWERGATE_C0NC] =3D "c0nc",
> > +     [TEGRA_POWERGATE_SOR] =3D "sor",
> > +     [TEGRA_POWERGATE_DIS] =3D "dis",
> > +     [TEGRA_POWERGATE_DISB] =3D "disb",
> > +     [TEGRA_POWERGATE_XUSBA] =3D "xusba",
> > +     [TEGRA_POWERGATE_XUSBB] =3D "xusbb",
> > +     [TEGRA_POWERGATE_XUSBC] =3D "xusbc",
> > +     [TEGRA_POWERGATE_VIC] =3D "vic",
> > +     [TEGRA_POWERGATE_IRAM] =3D "iram",
> > +     [TEGRA_POWERGATE_NVDEC] =3D "nvdec",
> > +     [TEGRA_POWERGATE_NVJPG] =3D "nvjpg",
> > +     [TEGRA_POWERGATE_AUD] =3D "aud",
> > +     [TEGRA_POWERGATE_DFD] =3D "dfd",
> > +};
> > +
> > +static const struct tegra_pmc_soc tegra210b01_pmc_soc =3D {
> > +     .supports_core_domain =3D false,
> > +     .num_powergates =3D ARRAY_SIZE(tegra210b01_powergates),
> > +     .powergates =3D tegra210b01_powergates,
> > +     .num_cpu_powergates =3D ARRAY_SIZE(tegra210_cpu_powergates),
> > +     .cpu_powergates =3D tegra210_cpu_powergates,
> > +     .has_tsense_reset =3D true,
> > +     .has_gpu_clamps =3D true,
> > +     .needs_mbist_war =3D false,
> > +     .has_io_pad_wren =3D false,
>
> Any particular reason to flip this to false? AFAICT it is still needed
> to make PWR_DET_VAL writable as on T210.
>
> (The reset value is already (mostly) fine but seems prudent to write it
> anyway)

Ah, it looks like I missed that d4f0c189945c74 inverted the value
along with the rename. Will fix.

> Thank you!
> Mikko
>
> > +     .maybe_tz_only =3D true,
> > +     .num_io_pads =3D ARRAY_SIZE(tegra210_io_pads),
> > +     .io_pads =3D tegra210_io_pads,
> > +     .num_io_pad_vctrls =3D ARRAY_SIZE(tegra210_io_pad_vctrls),
> > +     .io_pad_vctrls =3D tegra210_io_pad_vctrls,
> > +     .num_pin_descs =3D ARRAY_SIZE(tegra210_pin_descs),
> > +     .pin_descs =3D tegra210_pin_descs,
> > +     .regs =3D &tegra20_pmc_regs,
> > +     .init =3D tegra20_pmc_init,
> > +     .setup_irq_polarity =3D tegra20_pmc_setup_irq_polarity,
> > +     .powergate_set =3D tegra114_powergate_set,
> > +     .irq_set_wake =3D tegra210_pmc_irq_set_wake,
> > +     .irq_set_type =3D tegra210_pmc_irq_set_type,
> > +     .reset_sources =3D tegra210_reset_sources,
> > +     .num_reset_sources =3D ARRAY_SIZE(tegra210_reset_sources),
> > +     .reset_levels =3D NULL,
> > +     .num_reset_levels =3D 0,
> > +     .num_wake_events =3D ARRAY_SIZE(tegra210_wake_events),
> > +     .wake_events =3D tegra210_wake_events,
> > +     .pmc_clks_data =3D tegra_pmc_clks_data,
> > +     .num_pmc_clks =3D ARRAY_SIZE(tegra_pmc_clks_data),
> > +     .has_blink_output =3D true,
> > +     .has_usb_sleepwalk =3D true,
> > +     .has_single_mmio_aperture =3D true,
> > +};
> > +
> >  static const struct tegra_io_pad_soc tegra186_io_pads[] =3D {
> >       TEGRA_IO_PAD(TEGRA_IO_PAD_CSIA, 0, 0x74, 0x78, "csia"),
> >       TEGRA_IO_PAD(TEGRA_IO_PAD_CSIB, 1, 0x74, 0x78, "csib"),
> > @@ -4824,6 +4885,7 @@ static const struct of_device_id tegra_pmc_match[=
] =3D {
> >       { .compatible =3D "nvidia,tegra194-pmc", .data =3D &tegra194_pmc_=
soc },
> >       { .compatible =3D "nvidia,tegra186-pmc", .data =3D &tegra186_pmc_=
soc },
> >       { .compatible =3D "nvidia,tegra210-pmc", .data =3D &tegra210_pmc_=
soc },
> > +     { .compatible =3D "nvidia,tegra210b01-pmc", .data =3D &tegra210b0=
1_pmc_soc },
> >       { .compatible =3D "nvidia,tegra132-pmc", .data =3D &tegra124_pmc_=
soc },
> >       { .compatible =3D "nvidia,tegra124-pmc", .data =3D &tegra124_pmc_=
soc },
> >       { .compatible =3D "nvidia,tegra114-pmc", .data =3D &tegra114_pmc_=
soc },
> >
> > --
> > 2.54.0
> >
> >
> >

Aaron
