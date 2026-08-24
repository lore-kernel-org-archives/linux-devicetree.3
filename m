Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9975743D4EE
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 14:26:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787581581; cv=pass; b=fyOLiCQuhYM2E56hdiAUFPPCMq6JxJ9Vcg569CjH2l1LvGmrRxkN98Kh5h9soNf2dhJR3blIe24fiaAc0AFsGSBoyzoAeGhWr3jUDSSJdAn64bnh9oB8+u7mKB83BgAnarJxd5ocqt/Q3eWVRQbvBebfWX8GQlxeWuS8biLvj8s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787581581; c=relaxed/simple;
	bh=g6YG7ebYQXB3bRpGj/OB4nhiGkj6yamYDPhaSzTu1Rw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U1tey7S+wZkJLxM2BfMbTVRfJje30MEAtt5g5pOcIupHFfL7cgMhWOpWTTQ0usCnr5mNRP4aDUgBq6abwS0Ivt4LiAmj6hUk7bM7mt2FD+IplY4DkbxI+FRXfmFGVJzgxBmCyYZI60x3RRps7O1meEAgGLjybTmwG3WH99wng8I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n1oYoH4d; arc=pass smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n1oYoH4d"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c247f6687dcso403268766b.2
        for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 07:26:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787581578; cv=none;
        d=google.com; s=arc-20260327;
        b=pl8QpcfGrAu0mBrtli+FfgHBiBm3jGiqgYAWUFmJqEzQuNT4qIpV33IbKjjcXY7vQ0
         1bMdpE8E+Sf550XQu9rLfs5FRhnWVyOOwe+cbMjrci6SaV6+8hE39NOjPDV4BEsedecc
         WsVsEZ89AyGUYjBXc+16WASURbgCZUIn++OQN4l0q99eNqsljEYJuuAMC/c1swbkx57M
         804Qxls1LEs57hLu3iyxgtZXLga9UhDSgdKu+XbMcf+Q/p9OtwqWcc8Nwq9No4kTYBTj
         0hcbcLVr1UJMG/xbaun63NjkVaYD2HmncZoUoEDWWGssAhBAbodUCeq+DYiZR2F6rBec
         xMFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=xKq0tTixvb6fNGgIvXcGGKjXYqHTulwy/M2vtC3qFIk=;
        fh=UbkxgrjfDNIVTD8AtDpcaSpjKH9pQy8M3YOLBMywEIg=;
        b=IlZtrRyzoWmPJbqKVC6lxWOxDE3aq1xuF7M5Om6XoqYjDAsJxLht1qUSi7Y43pgLAO
         DmTJYfit7Tt2NjWnykk21FMPz4L6373N5gN71NnuJxYEe4SqQkiJEGHWFHuXz+V9jk9/
         mQJWkm1N8ect/WvVOAvAbRY7m/9QVIFh8rHTcx74SLZUoAcVcH8O493oP/jOJMpythwk
         nJJRuFulsBFcuuzqiKOFjBJrDDjFYvKgAI//lnAVYIituQnWH0qmN9NeDAaH1kP0Po5A
         xfFEAIszlVUfcMKQRvA1bfw3zYPA0A8yqMGpBGe2f7e823H/L5hDWmbxTmrAcn5PNt9T
         IFrA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787581578; x=1788186378; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xKq0tTixvb6fNGgIvXcGGKjXYqHTulwy/M2vtC3qFIk=;
        b=n1oYoH4dUCRj3F9ZgC3yBwfZexnJT8/KJhMCduQEU1+cJaA9tU+5SvkjfbWSTe6a+U
         +fFySSiAmkV+2cbe0eknWQ2nmqO71qEFOlZ/JEPOAq/jT4NLmdPnGTSPZuD5EGwliEHq
         o6w95odqn4McNp/DtoWDr4tLSS9/0VZWgLUq4YFzx50XPKsr9QNIDCNlYlwvHtK55Fjx
         TMkdcmJfxBqdqX+0ZxWdOXBOMUk49a4nEYpQmG7BE1YjncK/En3+JBapAukgCV/7zE1R
         GLRpOmMG61umcPPFDrePpyN/sKrMg2Fv93hBC8d2ll106GksjIdZvW86EM0bfXqfE13+
         QMDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787581578; x=1788186378;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=xKq0tTixvb6fNGgIvXcGGKjXYqHTulwy/M2vtC3qFIk=;
        b=D77dg8TPerAdkiAklsUyztWviVBXfd4a2NfgD0vKyCY7+D2gOJY1tz1x28GfneVBDr
         BrD2XpmStlUXJoCriIOsb07BRy8hlfgxO4fL8Q/+gjj+S6xvvJ/V71y+81F1F+VXQ6O2
         6dGR7oIS5RNCm+Ym3cobA/RTDgmb7JarBaDyrc/nCBnftOl6sr6ZopF4LFRX+v+TVayl
         dQD/LPHZrFslvp5LeCw4cbgsuXMItMQlJpaBWSiIxzxLVr9WblRNevFO3TbzULS3ZEb+
         owH7QaADHm1d6ILLt3Uj+7Gp9zMPBksEM1UF1IlEgcIAI3jPu2RkgWohbVYLgSZvB4bQ
         lEjw==
X-Forwarded-Encrypted: i=1; AHgh+RqiTSGFU4IsElvmrxFUSN+ze0PmjWE8DqK5Zd+nZYpknF5YE9i6Hrfefnuwv7/0Yx0fpJ51V/vTf9G5@vger.kernel.org
X-Gm-Message-State: AFuF++kpTnz811A7hadRGR1eQl0V7qAfoNq7wJwnGGEq08oaYk0/0WXx
	hGcmus4d4DOXTcuzGRYbqWpxDhMLJiHcuT0TXeGOFhw6Dg5XI+H4fhsTMb6502c1uBUvMNjx9X0
	5l3++cKjmfZcOQIdKGqhxdcsPDQ1nU3k=
X-Gm-Gg: AR+sD11sjhHBVmPq/+C6w0xPz5ZAiM+7xssadb3jy2SlkgqLfYlo1rRzLoxKndv2Dqf
	hAbMM7qLZ+R09lCMdA4krvUkmDGDVzs2e2cA/zf0//q4nbW09SRVRejTiW0MjitZqZsccHMG1sU
	Yrz2+4qyoDA8KRygN5Fh7OZYVSClJJe11lEYUkfkkwBZiQIX5vRb2j/44nEvTM1uZzm/BsRjBRo
	8QS20+s0BUz8hnsjiFph1O6+OdEpv5MZqtrHJKr71OGhXCLitnAZEYZR/9jQguU2lxvQ/20/ds/
	ppGp5T2PzXd1nCjmrsZpEhadCzjRGVFtgg2zok3tn3Hh3XZhu+Vn+nGdwphjxKtACD8iawBoYYx
	xoi64gM8513rF
X-Received: by 2002:a17:907:97c1:b0:c1c:64d4:5ba3 with SMTP id
 a640c23a62f3a-c246a651d39mr3008695466b.20.1787581577574; Mon, 24 Aug 2026
 07:26:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260824130437.2771-1-sreeshankar0910@gmail.com>
 <20260824130437.2771-5-sreeshankar0910@gmail.com> <5ybg37jlklgrkxseu24xytbom3v3rnzbwpudg7jftr6g3oqvo5@x4sfjci7v7m3>
 <CAA-+ukJT1=RYfTFsRvkTsN+Yca5yhgS+1xS=Gb1HmFWaSQM2Sg@mail.gmail.com>
In-Reply-To: <CAA-+ukJT1=RYfTFsRvkTsN+Yca5yhgS+1xS=Gb1HmFWaSQM2Sg@mail.gmail.com>
From: Sreeshankar K <sreeshankar0910@gmail.com>
Date: Mon, 24 Aug 2026 19:56:06 +0530
X-Gm-Features: AcwNN1WD7-RHPqzMcCh82DKazoZZTBj7FvE-P3djUsyLE_onjNfXG89rO_KrT4Y
Message-ID: <CAA-+uk++=6z0Ri1drTEKT-geGDU5ZFv2aQusC7ZLs-Pwf87B1Q@mail.gmail.com>
Subject: Re: [PATCH v5 04/13] clk: qcom: Add Global Clock Controller (GCC)
 driver for SM7250
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	andersson@kernel.org, mturquette@baylibre.com, sboyd@kernel.org, 
	rafael@kernel.org, viresh.kumar@linaro.org, konradybcio@kernel.org, 
	tglx@kernel.org, ulfh@kernel.org, bmasney@redhat.com, radu@rendec.net, 
	lpieralisi@kernel.org, taniya.das@oss.qualcomm.com, danila@mainlining.org, 
	davidwronek@gmail.com, mani@kernel.org, robimarko@gmail.com, 
	linux@gurudas.dev, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 24 Aug 2026 at 19:45, Sreeshankar K <sreeshankar0910@gmail.com> wrote:
>
> Thanks for the review.
>
> Missed that, I apologize. I will send a v6 patchset with everything fixed.
>
> Thanks,
> Sreeshankar K
>
> On Mon, 24 Aug 2026 at 19:21, Abel Vesa <abel.vesa@oss.qualcomm.com> wrote:
> >
> > On 26-08-24 13:04:28, Sreeshankar K wrote:
> > > Add support for the global clock controller found on SM7250
> > > based devices. This should allow most non-multimedia device
> > > drivers to probe and control their clocks.
> > >
> > > Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
> > > ---
> > >  drivers/clk/qcom/Kconfig      |    9 +
> > >  drivers/clk/qcom/Makefile     |    1 +
> > >  drivers/clk/qcom/gcc-sm7250.c | 2275 +++++++++++++++++++++++++++++++++
> > >  3 files changed, 2285 insertions(+)
> > >  create mode 100644 drivers/clk/qcom/gcc-sm7250.c
> >
> > [...]
> >
> > > diff --git a/drivers/clk/qcom/gcc-sm7250.c b/drivers/clk/qcom/gcc-sm7250.c
> > > new file mode 100644
> > > index 000000000..bf75c8ec1
> > > --- /dev/null
> > > +++ b/drivers/clk/qcom/gcc-sm7250.c
> > > @@ -0,0 +1,2275 @@
> > > +// SPDX-License-Identifier: GPL-2.0-only
> > > +/*
> > > + * Copyright (c) 2018-2019, The Linux Foundation. All rights reserved.
> > > + * Copyright (c) 2026, Sreeshankar K <sreeshankar0910@gmail.com>
> > > + */
> > > +
> > > +
> >
> > [...]
> >
> > > +static struct clk_alpha_pll gpll0 = {
> > > +     .offset = 0x0,
> > > +     .regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID],
> > > +     .clkr = {
> > > +             .enable_reg = 0x52010,
> > > +             .enable_mask = BIT(0),
> > > +             .hw.init = &(struct clk_init_data){
> >
> > You missed my other comment from v4.
> >
> > const here and everywhere else.
> >
> > It is always a good practice to compare to other (older) drivers from
> > upstream.
> >
> > > +                     .name = "gpll0",
> > > +                     .parent_data = &(const struct clk_parent_data){
> > > +                             .index = DT_BI_TCXO,
> > > +                     },
> > > +                     .num_parents = 1,
> > > +                     .ops = &clk_alpha_pll_fixed_lucid_ops,
> > > +             },
> > > +     },
> > > +};
> > > +
> >
> > [...]

Thanks for the review.

Missed that, I apologize. I will send a v6 patchset with everything fixed.

Thanks,
Sreeshankar K
