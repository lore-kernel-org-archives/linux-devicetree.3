Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7981F233134
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 01:06:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781485583; cv=pass; b=mTCYHDK510bI/+/cv2Sypr1fFcrfeFDcVp3HIyVvAsMpLJLot7+IKinvlxTp7/0LHggOAvX8GR3bLJCGx3FEA42XbwOWIG5VCu26h60yhML88VzKMDk4PFzpW922Bo6vldXdNRRqx73UrIyBFWbHoqAyCA204VE+k3b7YlkIwEc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781485583; c=relaxed/simple;
	bh=zphXDRrviMIHRqbaqKTjL0GVhrLRaF0ph7bVv07Mai8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VEkvcYEnM+qMFy01yD7vB4hXqOQ0J1eqdU2/pJ3BFj0U/CvvBMqzeNGYHIYXvgRkcHs2bNZCAOiy/Ngds9IDoitRNE460S/Q7OQyQ8gSbJ3bLsILdPZ5Wp9gOQwlzEaaOl9e1XmGiWpTajzMiFbfXQz6qI8HgKuDVxtFqYF80dM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DwQ1aNXU; arc=pass smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DwQ1aNXU"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-bec449d0af2so332803766b.2
        for <devicetree@vger.kernel.org>; Sun, 14 Jun 2026 18:06:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781485579; cv=none;
        d=google.com; s=arc-20240605;
        b=HYBI+8p8eMr/L4INQwf5B0dOu6ufqMr8U5HDjD+95MVvnrS7uojPTWHhhta73L0oeR
         +59KQAtuab3dPcpGPbbyqtnA24nHJhutvUTlQHwfnRCQxjg+JnJEq4lG1ASXf0+f2GaP
         c/8kLLzDENJ7yHNOJHWhWrkeplHBQlz92hMMlJYCreOUFAGCZQdTraioZxp+yGUAazWC
         ef1Bi1s0/jRVWY7rBBdjJcIgWyZOYXqlIgpmb6e7mqnCzXhY0ZSjBzcvC2OSAJrjcFIw
         2AfzJ9yHucNJ1+NWCbmeo2E6R6mT9kHmu6UOPKGLJQy+E/9CfgMlN2+15Ja+sne4Qp+7
         r4ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=H24u8bJZ/ZfOEh7lec2yNJIYqcx3zwwTWvSipFSNjVs=;
        fh=GJs79d2HdxFDoCLF0dS536zpAUhe6mixuAgtMJOnP5Y=;
        b=hkV6uLmmoiQDYJfXfowCyuLJXpavYPZdVJSVv0tX2JLBe00+GOtZqlnt1hXjcroQZS
         Q8xMHwVxmJc2qWqvIoGEel8IMut9Qpadj7rKSbeUGWq7G34vrkGuNT8HTaPwoW7zVTjk
         kjApNIZ75MxXq1RpTuXFMjOk2FQKFZndqrJmnCS0mJB+gXdvgVe5M7LCRTf7FE6+I4cE
         f5Y9Osi1qEGcXPjImw7bdgDHeNkFQ2j92Zz2ljlK7MJoAO24EkINTz1TJX+oHJ7g6ey0
         jFQ64tQOD1aTRNd/XMw4uc4e03gl7+zVLNH1rNmumAOpsbq5Mld3Ho5W4v2Ynj+IlNlF
         h5wQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781485579; x=1782090379; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H24u8bJZ/ZfOEh7lec2yNJIYqcx3zwwTWvSipFSNjVs=;
        b=DwQ1aNXUGBL0D4j5Wtelzexz41S88x53QldSwYCY/PMspBTH3HhJ/y7/UGVUXKH5yN
         nyRguTXseoPujg901zc4AkzwkE+YHzJgYiEqbEyJEk8z3S+HcgftGObxAe7YlQzs9gif
         yZmuMvAZewmS3XaMNJ4EZI/KBu0a6/UEOrQHo5MZ3auMAM3DHjA/MRbcbhwpW2hadSbt
         Jq5xK33kpmWdb8hWCU4JW1+RdUT0NoYlmWGicymbKx+43WnQMRq3tGsHcbhvQmsn4y47
         /Rjl4jq+YZL+uaQ9PZ3tVCII83OMTJkCwCHXyh5LTzpNmLrbK94sE57oOrHoaIxR2HSL
         cBXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781485579; x=1782090379;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=H24u8bJZ/ZfOEh7lec2yNJIYqcx3zwwTWvSipFSNjVs=;
        b=qPxkb0Co8mRPIs0efIKtuQdnTBv7OAMdkf6gzlS1scJFIGLTpKsJHjKH+UIYs4wYNP
         85t/eOPIMc/ubuh/VgWpH+SKhlPYz5VNxBdX6ifetfST+iwfDkgpJtsD/jhdwIZVEr9O
         J2PVFGbtncqViflkyMFF6g/Iwfs0rDxYJ1yyIbMqqQpk/v3J8OllMq5YjRLjmMs+7aMS
         co7MzWd/OPkJCYX54gkZEkZ+n/UZjDXy4/46Q1ttt5MeFXf+nLGJCEyCKvZG9kbTB8tB
         pZZxH/nhwU0JMFNkU9YjA3dCRkPWiewiIdXh9plmfdGz8qiXqaiqeewjBMUTRDqEUNXl
         GMqQ==
X-Forwarded-Encrypted: i=1; AFNElJ8CW5BW6P6Xvp0axQpQ9cFyFV3+KalvKbDZv6u7Gqoh+w4tTlTV5vEASCijzNIJ7N6viFwohVT3MD8/@vger.kernel.org
X-Gm-Message-State: AOJu0YxkTQ2G3KPYhay5xNA/5kLZst2FLmq+v/8/CHYImZn4K/auGqxJ
	XhnGC4jFgPXJ8IfIkOM5WZKE/wqliu2MFDq40p7zZSxAf+rHjg3JmyK7Y61+V3OtoyEYMq+LwHl
	RUYQdhAp7QqoQOzDg1GCrLirtZKkuQW8=
X-Gm-Gg: Acq92OFTDU4udX+5vd+C3QIlMpRXBEht5cr4vd59YxbIJPoIGczlcskWEShM6Echi8q
	vL4taX2DcjzatlOt5Fl3gfRUVIxpO5ntVTq9gjdxHdT3TzOgzGXIwZ4Xho1M0QNAxSvBrzt9bgh
	PWRWeVxFN5YZldYWNMCovf/2v5jN1sPN8yFx25v1HGyICsqmGFDer5qZcQlJ1l/rhSNvn+dXvnK
	XdWUZUa0B0Or7EWUK/BDAgtmaPXxcAmr2rzD5y4WToN/JsqrE5xFsad283m6HbA/FyFJbMWFcdl
	Iy94BAWd
X-Received: by 2002:a17:907:3f8d:b0:bed:2a8b:3e73 with SMTP id
 a640c23a62f3a-bff4cddd831mr396087866b.41.1781485578327; Sun, 14 Jun 2026
 18:06:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1780538113.git.zhoubinbin@loongson.cn> <4b003425d16a18049c5b90dbdaf91024e265cd8e.1780538113.git.zhoubinbin@loongson.cn>
 <CAAhV-H6G5vTH_58_pKvBnvjdr2eVTWTctUqmPAX3aMjsFDjsQg@mail.gmail.com>
In-Reply-To: <CAAhV-H6G5vTH_58_pKvBnvjdr2eVTWTctUqmPAX3aMjsFDjsQg@mail.gmail.com>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Mon, 15 Jun 2026 09:06:06 +0800
X-Gm-Features: AVVi8Cf_9hBVLVEZUBdAsB_xyIdfW7RJ29KV2A2IeNpvJzoDU304Ntu2KGk9gV8
Message-ID: <CAMpQs4LV_UcVwGYH1qP4VWKqCRT+EMyKOU6ygg7M76ymD29w9Q@mail.gmail.com>
Subject: Re: [PATCH v2 2/7] ASoC: loongson: Add Loongson-2K0300 I2S controller support
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Xuerui Wang <kernel@xen0n.name>, 
	loongarch@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 13, 2026 at 11:18=E2=80=AFAM Huacai Chen <chenhuacai@kernel.org=
> wrote:
>
> Hi, Binbin,
>
> On Thu, Jun 4, 2026 at 10:11=E2=80=AFAM Binbin Zhou <zhoubinbin@loongson.=
cn> wrote:
> >
> > The Loongson-2K0300 I2S interface differs significantly from the
> > Loongson-2K1000. Although both utilize external DMA controllers, the
> > Loongson-2K0300 does not require additional registers for routing
> > configuration.
> >
> > Due to hardware design flaw, an extra controller reset sequence is
> > required during probe.
> >
> > Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> > ---
> >  sound/soc/loongson/loongson_i2s_plat.c | 42 +++++++++++++++++++++-----
> >  1 file changed, 35 insertions(+), 7 deletions(-)
> >
> > diff --git a/sound/soc/loongson/loongson_i2s_plat.c b/sound/soc/loongso=
n/loongson_i2s_plat.c
> > index ac054b6ce632..b4d807ee7f8f 100644
> > --- a/sound/soc/loongson/loongson_i2s_plat.c
> > +++ b/sound/soc/loongson/loongson_i2s_plat.c
> > @@ -2,7 +2,7 @@
> >  //
> >  // Loongson I2S controller master mode dirver(platform device)
> >  //
> > -// Copyright (C) 2023-2024 Loongson Technology Corporation Limited
> > +// Copyright (C) 2023-2026 Loongson Technology Corporation Limited
> >  //
> >  // Author: Yingkun Meng <mengyingkun@loongson.cn>
> >  //         Binbin Zhou <zhoubinbin@loongson.cn>
> > @@ -21,6 +21,7 @@
> >  #include "loongson_i2s.h"
> >  #include "loongson_dma.h"
> >
> > +/* Loongson-2K1000 APBDMA routing */
> >  #define LOONGSON_I2S_RX_DMA_OFFSET     21
> >  #define LOONGSON_I2S_TX_DMA_OFFSET     18
> >
> > @@ -30,6 +31,11 @@
> >  #define LOONGSON_DMA3_CONF     0x3
> >  #define LOONGSON_DMA4_CONF     0x4
> >
> > +struct loongson_i2s_plat_config {
> > +       int rev_id;
> > +       int (*i2s_dma_config)(struct platform_device *pdev);
> > +};
> > +
> >  static int loongson_i2s_apbdma_config(struct platform_device *pdev)
> >  {
> >         int val;
> > @@ -47,8 +53,18 @@ static int loongson_i2s_apbdma_config(struct platfor=
m_device *pdev)
> >         return 0;
> >  }
> >
> > +static struct loongson_i2s_plat_config ls2k1000_i2s_plat_config =3D {
> > +       .rev_id =3D 0,
> > +       .i2s_dma_config =3D loongson_i2s_apbdma_config,
> > +};
> > +
> > +static struct loongson_i2s_plat_config ls2k0300_i2s_plat_config =3D {
> > +       .rev_id =3D 1,
> > +};
> Put  ls2k0300_i2s_plat_config before ls2k1000_i2s_plat_config?

OK, I will do it in the next version.
>
> Huacai
>
> > +
> >  static int loongson_i2s_plat_probe(struct platform_device *pdev)
> >  {
> > +       const struct loongson_i2s_plat_config *plat_config;
> >         struct device *dev =3D &pdev->dev;
> >         struct loongson_i2s *i2s;
> >         struct resource *res;
> > @@ -59,12 +75,17 @@ static int loongson_i2s_plat_probe(struct platform_=
device *pdev)
> >         if (!i2s)
> >                 return -ENOMEM;
> >
> > -       ret =3D loongson_i2s_apbdma_config(pdev);
> > -       if (ret)
> > -               return ret;
> > +       plat_config =3D device_get_match_data(dev);
> > +       if (!plat_config)
> > +               return -EINVAL;
> >
> > -       res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> > -       i2s->reg_base =3D devm_ioremap_resource(&pdev->dev, res);
> > +       if (plat_config->i2s_dma_config) {
> > +               ret =3D plat_config->i2s_dma_config(pdev);
> > +               if (ret)
> > +                       return ret;
> > +       }
> > +
> > +       i2s->reg_base =3D devm_platform_get_and_ioremap_resource(pdev, =
0, &res);
> >         if (IS_ERR(i2s->reg_base))
> >                 return dev_err_probe(dev, PTR_ERR(i2s->reg_base),
> >                                      "devm_ioremap_resource failed\n");
> > @@ -87,11 +108,17 @@ static int loongson_i2s_plat_probe(struct platform=
_device *pdev)
> >         if (IS_ERR(i2s_clk))
> >                 return dev_err_probe(dev, PTR_ERR(i2s_clk), "clock prop=
erty invalid\n");
> >         i2s->clk_rate =3D clk_get_rate(i2s_clk);
> > +       i2s->rev_id =3D plat_config->rev_id;
> >
> >         dma_set_mask_and_coherent(dev, DMA_BIT_MASK(64));
> >         dev_set_name(dev, LS_I2S_DRVNAME);
> >         dev_set_drvdata(dev, i2s);
> >
> > +       if (i2s->rev_id =3D=3D 1) {
> > +               regmap_update_bits(i2s->regmap, LS_I2S_CTRL, I2S_CTRL_R=
ESET, I2S_CTRL_RESET);
> > +               fsleep(200);
> > +       }
> > +
> >         ret =3D devm_snd_soc_register_component(dev, &loongson_i2s_edma=
_component,
> >                                               &loongson_i2s_dai, 1);
> >         if (ret)
> > @@ -102,7 +129,8 @@ static int loongson_i2s_plat_probe(struct platform_=
device *pdev)
> >  }
> >
> >  static const struct of_device_id loongson_i2s_ids[] =3D {
> > -       { .compatible =3D "loongson,ls2k1000-i2s" },
> > +       { .compatible =3D "loongson,ls2k0300-i2s", .data =3D &ls2k0300_=
i2s_plat_config },
> > +       { .compatible =3D "loongson,ls2k1000-i2s", .data =3D &ls2k1000_=
i2s_plat_config },
> >         { /* sentinel */ },
> >  };
> >  MODULE_DEVICE_TABLE(of, loongson_i2s_ids);
> > --
> > 2.52.0
> >
> >

--=20
Thanks.
Binbin
