Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C11CC41D21F
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 14:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787580923; cv=pass; b=CCAL6UOobKHyb6yeOdq5TCEwwhU6CJK9CUrx3rtnonDZq/sr6Ef8IsfdQAoVEVoXZ1A2VWCAmm0bfn5JDd/hYlj1xHTUUY2xYw8c7XvgvDKPagk+CwQU0/1VdqxDbeRvSzqtoo21YX8t9MSVb6PI5DIxSAFHh1AV6TX2iF39LRA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787580923; c=relaxed/simple;
	bh=0kks+j63StSPlXTF3OV31d0II5QMTMM20avDv0cE8Uc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T7cW2IePdEYLSGCYPqdUNT9whALU/pd0s2edSIgK/2lR/qTZ/XICz9Tpwg8iAuXpc8QGFrqCj0Ak1SFtyfGvKZNK1pcyuXd9QC0PJCP5WwU9j+VjUTlYMH8Sal3z2S6sRMK0kbAafSvcRJZMzPx4vxvMQQvvJ96+AqxIZvDzP8w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IDGJJ78F; arc=pass smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IDGJJ78F"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c2074710751so636194066b.1
        for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 07:15:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787580919; cv=none;
        d=google.com; s=arc-20260327;
        b=HsrK3MW1AaO3XlAd4xeR1to3JaPr6oaIYhkvB1Ttu1AtHkhwe3rfIw+MtLAZqlyV7m
         XPDMsvtG2LM1YPlBAnqG2cg6aUw0XjqUEjWqbmMoMu/5umXXZg4WCDl/wtzbn5Sss0dr
         gDM/jPcY2V3ZlHNWon4duc0AfOUsuLFyCJSeIaETNIzG1nEp5ygNL0rFwJNEozFDU0+H
         SlnCJtqPAdISIF1KQtIOF3TAjVEGqr1PHVOr8DPspmgUVy0JHYkxesGq/fUxlZFZbS46
         PFM4+mYsTDI4lh6rLLciofoyDic0N/M/vBUqRBKNgEEce7fLiCq4zrc0dR4RAcUbmI8o
         gV8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=FrjX2y5M6BTYXuv5wkBHtI4BXsIYAL02A5EG/qzfCHQ=;
        fh=I2lvmP3QNxTLbN04swHg7WVARbe72H6qqpxpkiThON4=;
        b=QcomwieeGAIZNXGYjH1CVSpybki5wdCdfo0VHbl2xL+2XqscqKWqK4HCnDe00LP8vy
         wHq04cGVv8FIzIUa+GE1fKGYMCWph0JA0yCY3JRNKfBIsC/+xwGpUaZXQLbdIRHq20q9
         qB43nR0cIdw6YiA0MvE7zffk7SKeObQqlIefaMBWmsMY1aj6GMfOD4Einr2VVE6Wglkk
         b8NCYahrxi0//geTnfp9Jm9SD4z1N9ENlg5du3W7jfwyBFqcuUDX1blLoTsw9By8h1Fn
         eTDY9kKyfNRlF9+z+uekuWfLnFpatJJyTrnd0LYmGnM6/oPsx2UzXO1uMNrPZGRu9TJ5
         wV8w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787580919; x=1788185719; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FrjX2y5M6BTYXuv5wkBHtI4BXsIYAL02A5EG/qzfCHQ=;
        b=IDGJJ78F3Ipc9tB0nbEffHy2jfdT1CrCCk4hIeHeL02LxT0clK4aILUCWwf2BolUbr
         wxOMh2hBeW+7aJ1e9wNd3P+Hn3H1M773HuZi1a9uORkh3kauQNk66E9VImH2UnISY+du
         H/zJedVRgM0APaG+w34ig2+9rvrfyHyCf8XtBv1mh3c1umdjzmjBsmHQ/0Wq3Qama6ff
         +xhTGOqAbKhkOiWQm82qhjQqy+ls6ciwXytomojpFytyOWDJyFeSar4DdF6CyNrRxpgz
         x33NlK9pJkVxTMVNaQzeTtnAgtlawn8Wze9sSXH2KsQgydBZS2VbU7qbClJljw6MIkgM
         wNeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787580919; x=1788185719;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=FrjX2y5M6BTYXuv5wkBHtI4BXsIYAL02A5EG/qzfCHQ=;
        b=K0FMnhVgfNrRTpITbj5B3f8hcnwj7rj5FxsGWjp9d9VUjvwxf/OcM4CSM2TizUBA+1
         tR0q3gg/6AijLAEVHwOeB97sRxyWv/EXfH6Fl1GEBu8/pHaWZDlDjMwY28t1vKzpgseU
         g3FhEdss3fsSNK5vPn3yrdRjnSKGXlclmeCocPsXo0Bvx9qekZ1lcNnDBDdjCnyo8pWC
         EkW4COuJUwgvQ1hfz+Cn2dSswIBno86D/7+w7MC9fAi9reUIkazCFYu/bjgD1S8JeAYK
         symJ8h7/JTQ8ymyy7v0PcRV+k6TsmFH1Emvy6zK0ZCLs0wGPHMovAfNc8rH6UR/a/0w3
         Hcrw==
X-Forwarded-Encrypted: i=1; AHgh+RovqwTGCjRnJ6gaD7z6cBkuGgWjRXUf4lo1soUdRhxEhLUjxLYFYf7tnpuR2AdVTYbtKYvPE7ni7Ip4@vger.kernel.org
X-Gm-Message-State: AFuF++lsoNLsAkY5ANXPY0K0kK5pogN2Wr9JG2QFz6YVbQWrDxZ/qFte
	letEhk6vq5TiT1/fDYx2BgZWCY5phNo7igR0Lny7b3ztgDv7DLayjHc25+RzR2RhYbrxY2L1kb4
	EXgR4NxKCpgGvUXik0ar/RJujRoN9xhU=
X-Gm-Gg: AR+sD10KvYU9hr9knaj4GN5NyRr0I2Kp90mm2P9jY3cDVbvvdQhXnXP2bHhF/YlwOO3
	qloZNTJhtPMF6peNjylXXM8T+4TCEqk1n3TqRX/BNad85rs6oqMnxD1lGveU5X9F+ChtWCt9fyJ
	hGmAnhrnFPLsc3kzgrWOcXtYE2UCiTzyXh8Obgf2fRfjjltKiyjd0acXCDfzYSaEkxhTFDVMKaM
	pv/5I6G2wqgbuveJ73xNq+JrjSMJoinNdJ2yRgH9rIGMsoV+oPmheCm3ctcGg8PTf11K+v24b/R
	zjra34qzWiC3xi6gWHZkD3mg4betraPMqSEBTB+Vz+21IQJk9o4MDdPZCNP3zyBjIXZDRPQaAzq
	Fyg==
X-Received: by 2002:a17:907:3e9d:b0:c20:f4ee:7c97 with SMTP id
 a640c23a62f3a-c2491c2846cmr2216363566b.5.1787580918870; Mon, 24 Aug 2026
 07:15:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260824130437.2771-1-sreeshankar0910@gmail.com>
 <20260824130437.2771-5-sreeshankar0910@gmail.com> <5ybg37jlklgrkxseu24xytbom3v3rnzbwpudg7jftr6g3oqvo5@x4sfjci7v7m3>
In-Reply-To: <5ybg37jlklgrkxseu24xytbom3v3rnzbwpudg7jftr6g3oqvo5@x4sfjci7v7m3>
From: Sreeshankar K <sreeshankar0910@gmail.com>
Date: Mon, 24 Aug 2026 19:45:07 +0530
X-Gm-Features: AcwNN1WcsnGQSHLRyuZJ-yHONrPiOQJH8iqD06u4L2i4WB6_vuJbh1UpdH1J-_0
Message-ID: <CAA-+ukJT1=RYfTFsRvkTsN+Yca5yhgS+1xS=Gb1HmFWaSQM2Sg@mail.gmail.com>
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

Thanks for the review.

Missed that, I apologize. I will send a v6 patchset with everything fixed.

Thanks,
Sreeshankar K

On Mon, 24 Aug 2026 at 19:21, Abel Vesa <abel.vesa@oss.qualcomm.com> wrote:
>
> On 26-08-24 13:04:28, Sreeshankar K wrote:
> > Add support for the global clock controller found on SM7250
> > based devices. This should allow most non-multimedia device
> > drivers to probe and control their clocks.
> >
> > Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
> > ---
> >  drivers/clk/qcom/Kconfig      |    9 +
> >  drivers/clk/qcom/Makefile     |    1 +
> >  drivers/clk/qcom/gcc-sm7250.c | 2275 +++++++++++++++++++++++++++++++++
> >  3 files changed, 2285 insertions(+)
> >  create mode 100644 drivers/clk/qcom/gcc-sm7250.c
>
> [...]
>
> > diff --git a/drivers/clk/qcom/gcc-sm7250.c b/drivers/clk/qcom/gcc-sm7250.c
> > new file mode 100644
> > index 000000000..bf75c8ec1
> > --- /dev/null
> > +++ b/drivers/clk/qcom/gcc-sm7250.c
> > @@ -0,0 +1,2275 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * Copyright (c) 2018-2019, The Linux Foundation. All rights reserved.
> > + * Copyright (c) 2026, Sreeshankar K <sreeshankar0910@gmail.com>
> > + */
> > +
> > +
>
> [...]
>
> > +static struct clk_alpha_pll gpll0 = {
> > +     .offset = 0x0,
> > +     .regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID],
> > +     .clkr = {
> > +             .enable_reg = 0x52010,
> > +             .enable_mask = BIT(0),
> > +             .hw.init = &(struct clk_init_data){
>
> You missed my other comment from v4.
>
> const here and everywhere else.
>
> It is always a good practice to compare to other (older) drivers from
> upstream.
>
> > +                     .name = "gpll0",
> > +                     .parent_data = &(const struct clk_parent_data){
> > +                             .index = DT_BI_TCXO,
> > +                     },
> > +                     .num_parents = 1,
> > +                     .ops = &clk_alpha_pll_fixed_lucid_ops,
> > +             },
> > +     },
> > +};
> > +
>
> [...]
