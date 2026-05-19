Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 522844921A3
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 11:12:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.133.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779189177; cv=pass; b=r4SFaHGFBpJhCeWKfXwzyha8ljyAb2sFDxFShW+wM5MTZchKXGrbmfYFkfPLtgfTIyFrNIoCxvw8N3W8zcKMwvD6nH9FLZWuSX+Ejk4xOf20V+KXdnt4qOiXopwI4XyY+xW415SNickENIWOdptqhuVaQHSuJl/kyhX8mGv0Svk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779189177; c=relaxed/simple;
	bh=G0ThN/1d1oEYjKqmxKgM7/icL/xC1s/HQwJfFfdz33k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k0+XO2wI0ZeT8olYfUb9PuVHUpAQb4N8Ugr28BvZn2TqVjOoIef5Kg2GKto0Jcu1vweTCDT1uwgz4at5UE/eOlpxPu8Xy60x2+0P5zcMuqPsA9euWtH/Y0pwJeXSfxSjAVVxDnqnIXTppLbr0KyE4birOdlygROj6fYbNIKUwhU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PWwMGAML; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=HWMkZjrI; arc=pass smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PWwMGAML";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="HWMkZjrI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779189171;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oXsqNQngsEDaEw4yQ657tilzkdXWVYHvbpp2A/ZUbBk=;
	b=PWwMGAMLHUIlLTk6dYx/URA/ZmtB5UH5Pnv+7N6za9jAnAVfqR5+WVpoBrddddAZV+b9Tm
	VZ6xld7Si9gJ6xZ+xq73tWMLuUz5760veqJMap0zcoTyIJ4vOsJNmKRkPYaS9VtgeEsHSo
	A9T0gR6VFfK7rlK7eSH2bgYhpSYjFqs=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-574-87TVxIdjMFewmcz9XoRS2Q-1; Tue, 19 May 2026 07:12:49 -0400
X-MC-Unique: 87TVxIdjMFewmcz9XoRS2Q-1
X-Mimecast-MFC-AGG-ID: 87TVxIdjMFewmcz9XoRS2Q_1779189168
Received: by mail-lf1-f70.google.com with SMTP id 2adb3069b0e04-5a86f40bffaso84132e87.1
        for <devicetree@vger.kernel.org>; Tue, 19 May 2026 04:12:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779189168; cv=none;
        d=google.com; s=arc-20240605;
        b=IsZt3nDkb4VKIktAUxmeS/wX2wOE3Fb/mP0oeP4rKz7huvHV3svkXKJGmv8K/WuZKw
         fBGZLo0z17DYZRuZoxY9GC1/Zjeurjuq6BtSwsyYKblfbFZJpy0SZTTUmASry0UYzjji
         JFYQK+KfMNF9tt5dwkf6zE+OYx4+To8P7zG1s7uukJ+vWhy0ozGMSNp5iUlOPWEC+o4I
         qlY6nBIkfm1+oMYF+x2IrebDNlPnsaq0muxz9QzcY9VyJaD++PbFe9ztV8wXmaKiyKcm
         BkoO2b9jyOhSg4skh+zmBV0aP1R67q8fQrLtKzmy1YTuuLJtXej/Hj1Ooq/Cl07OO27x
         AX6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oXsqNQngsEDaEw4yQ657tilzkdXWVYHvbpp2A/ZUbBk=;
        fh=VRwOaoX3okdRK2xLVRwYzfP/R4qLApQTVaZ0L991yI4=;
        b=cc6WKuWd7UfDD1EkYxLkd9iwFTbn0f/mPwuqSCjwkySjB+PU9FrYvPDBZ5t475xX8J
         1W2K/cvxUc6ilqcwfsXooHTM5Q4WG8Yyw5W6me57ar9k1Oq4C9ZkFkltzpB40g1MRwRg
         rhJb5YfK5bvU9+vTP5CN2uqKbYiaPGdZd7W6bK4lFByVzNFMZ9AX9q9mKkdEEd+QCFgp
         +uTl5pJQkyK6F1wPtyLjGHcXvx2lmg6+ypZrGyrP0/D+Qrx1mrYqI/oQyioK7YNQq9Lx
         c5EKfy53eE0KafM8ggLklap5ER1MS9mENcMnbaqRMVHaQs4eW+NsWFKHT3nSO4QOV0An
         C7ng==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1779189168; x=1779793968; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oXsqNQngsEDaEw4yQ657tilzkdXWVYHvbpp2A/ZUbBk=;
        b=HWMkZjrIQ+RTQ5eKH1BX1z+t/5W31yN3NBzsYBH2hHVKR0AIXlsZWG8vU+/5xkMOQu
         bAkUkZeesFcvMeojqjGg/f6P8INPyYaoqWOma3Z7prB/GxUJvD4jGQWZFL3SVCYPf9MI
         zx94xAQlXyzyyUrZjRnkUvP6taxqZeM2UavrfF5MpFVrNmGCt+RuIKsrZPu5LMfSBtLf
         esMVZ6P2+seaA+hPmT1NyJtA504SbLjhbSE8cQpO4KK/KbM9SBQaOxloTQnfYSDm9177
         aW873QXzYPgeSMsjgdxrC7McrHw+xQwZ5fglCZKBej77+4HYmF4JuQBS0S2GdgY76DTP
         2Gkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779189168; x=1779793968;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oXsqNQngsEDaEw4yQ657tilzkdXWVYHvbpp2A/ZUbBk=;
        b=UvINfiqjAgMIJwERdNx6ttMGuQFPx5guy27ASISmypOPHdxMV9l0pCGXiYVq2SQQBY
         vZwXBQOxjmahz1mepR+XVdJYs/MzvaZNUDq6qrTGdNX13qDlvumkCFCSQ7yLW+Hsi5ts
         HwRQicfa0bmzjyZbrjyFkvSfiRHqRKCdItUpQxmJ3WYlYM6pqeSQaL9MiSrAf9DsyUHc
         J5nNjyszQH7l9yzegi6l0mbJPdPbCYMFzCtpoyHPgFo3F1KtO6YCjB+n3kOTpzLjIa4D
         dcbvkO/pGn5vTHZTa7Ja8b90UO0+wVkW3KnhDPyNVAuH/MIITDme5Q1lHj8eVyWR6Iez
         gpDQ==
X-Forwarded-Encrypted: i=1; AFNElJ94lO0IvHvJAuLUfR+41QD5hN6UGrCakoDE+Qa/P5IBuORnaWZq/ofufTPmWX4Q9BLItfJ2oA3m0PfU@vger.kernel.org
X-Gm-Message-State: AOJu0Yyd3KBF8OowJT9hEQmyl3CrbN8YX3B9JFUfPmL6qNnfKxAzZd0+
	X63pwA2S+WGozoljUMIpkHr4H1A/8feV12xMzmhFH/VsYfJG7qAuXizXd8yJNIP9X1naSZgA2ZK
	ZtPOLtIyO5Zlr4EyvnwUDDlZ4Q/uYgmIArutb2+0kzNeEzE0DkB8ApMIuyr6WXggwupjUQxtbAc
	rd6ro6Z++jORkcdb4lT+NvKbqrLXAeGAm03YSB9g==
X-Gm-Gg: Acq92OH3b9NBJUhDXMG91/YehOoWyVjVNfcTB/HhFeRApnTkfLP7McKuf22Fvdfgnc8
	TIYRQp/+SR5UT0YTnz5vXRTXY7OrhWXKt31kGxJEYoXzuqszEa9jYKS9vma+zLEFAspQGFg5JXh
	jAjdqtD+3tSU6uwL4lV9UuqKAliavOUXCsoWSKbU6iwJQGiK7q5idLCUSryMzrDD5dz01cv7QLX
	qM2AQ==
X-Received: by 2002:a05:651c:4119:b0:390:f0e8:a0a6 with SMTP id 38308e7fff4ca-39561eca6a3mr18209451fa.7.1779189168278;
        Tue, 19 May 2026 04:12:48 -0700 (PDT)
X-Received: by 2002:a05:651c:4119:b0:390:f0e8:a0a6 with SMTP id
 38308e7fff4ca-39561eca6a3mr18209371fa.7.1779189167744; Tue, 19 May 2026
 04:12:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260504131148.3622697-1-khristineandreea.barbulescu@oss.nxp.com> <20260504131148.3622697-2-khristineandreea.barbulescu@oss.nxp.com>
In-Reply-To: <20260504131148.3622697-2-khristineandreea.barbulescu@oss.nxp.com>
From: Enric Balletbo i Serra <eballetb@redhat.com>
Date: Tue, 19 May 2026 13:12:35 +0200
X-Gm-Features: AVHnY4IysE9Si0e6LCWrqXrdQ4CUJp9E0s70DE65f5jtBnVk_MehFj_WtyF0KyM
Message-ID: <CALE0LRs5XwjwVXkc+WGtkucs5WGjoHu-Dcd8fLBmqQjz16XdDw@mail.gmail.com>
Subject: Re: [PATCH v9 1/7] pinctrl: s32cc: use dev_err_probe() and improve
 error messages
To: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chester Lin <chester62515@gmail.com>, Matthias Brugger <mbrugger@suse.com>, 
	Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>, Larisa Grigore <larisa.grigore@nxp.com>, 
	Lee Jones <lee@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Jacky Bai <ping.bai@nxp.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Srinivas Kandagatla <srini@kernel.org>, Alberto Ruiz <aruizrui@redhat.com>, 
	Christophe Lizzi <clizzi@redhat.com>, devicetree@vger.kernel.org, 
	Eric Chanudet <echanude@redhat.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, NXP S32 Linux Team <s32@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Vincent Guittot <vincent.guittot@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, May 4, 2026 at 3:12=E2=80=AFPM Khristine Andreea Barbulescu
<khristineandreea.barbulescu@oss.nxp.com> wrote:
>
> Change dev_err&return statements into dev_err_probe throughout the driver
> on the probing path.
>
> Signed-off-by: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
> Signed-off-by: Khristine Andreea Barbulescu <khristineandreea.barbulescu@=
oss.nxp.com>
> ---
>  drivers/pinctrl/nxp/pinctrl-s32cc.c | 64 ++++++++++++++---------------
>  1 file changed, 30 insertions(+), 34 deletions(-)
>
> diff --git a/drivers/pinctrl/nxp/pinctrl-s32cc.c b/drivers/pinctrl/nxp/pi=
nctrl-s32cc.c
> index fe7cd641fddd..56be6e8d624e 100644
> --- a/drivers/pinctrl/nxp/pinctrl-s32cc.c
> +++ b/drivers/pinctrl/nxp/pinctrl-s32cc.c
> @@ -2,7 +2,7 @@
>  /*
>   * Core driver for the S32 CC (Common Chassis) pin controller
>   *
> - * Copyright 2017-2022,2024 NXP
> + * Copyright 2017-2022,2024-2025 NXP
>   * Copyright (C) 2022 SUSE LLC
>   * Copyright 2015-2016 Freescale Semiconductor, Inc.
>   */
> @@ -236,10 +236,10 @@ static int s32_dt_group_node_to_map(struct pinctrl_=
dev *pctldev,
>         }
>
>         ret =3D pinconf_generic_parse_dt_config(np, pctldev, &cfgs, &n_cf=
gs);
> -       if (ret) {
> -               dev_err(dev, "%pOF: could not parse node property\n", np)=
;
> -               return ret;
> -       }
> +       if (ret)
> +               return dev_err_probe(dev, ret,
> +                                    "%pOF: could not parse node property=
\n",
> +                                    np);
>

Nitpick: I think this is not part of the probe path but is called when
a consumer requests a pin group, so using dev_err_probe is slightly
misleading here, although I think it's harmless.

In any case, with or without that change it looks good to me, so

Reviewed-by: Enric Balletbo i Serra <eballetb@redhat.com>

>         if (n_cfgs)
>                 reserve++;
> @@ -763,15 +763,15 @@ static int s32_pinctrl_parse_groups(struct device_n=
ode *np,
>         grp->data.name =3D np->name;
>
>         npins =3D of_property_count_elems_of_size(np, "pinmux", sizeof(u3=
2));
> -       if (npins < 0) {
> -               dev_err(dev, "Failed to read 'pinmux' property in node %s=
.\n",
> -                       grp->data.name);
> -               return -EINVAL;
> -       }
> -       if (!npins) {
> -               dev_err(dev, "The group %s has no pins.\n", grp->data.nam=
e);
> -               return -EINVAL;
> -       }
> +       if (npins < 0)
> +               return dev_err_probe(dev, -EINVAL,
> +                                    "Failed to read 'pinmux' in node %s\=
n",
> +                                    grp->data.name);
> +
> +       if (!npins)
> +               return dev_err_probe(dev, -EINVAL,
> +                                    "The group %s has no pins\n",
> +                                    grp->data.name);
>
>         grp->data.npins =3D npins;
>
> @@ -812,10 +812,9 @@ static int s32_pinctrl_parse_functions(struct device=
_node *np,
>         /* Initialise function */
>         func->name =3D np->name;
>         func->ngroups =3D of_get_child_count(np);
> -       if (func->ngroups =3D=3D 0) {
> -               dev_err(info->dev, "no groups defined in %pOF\n", np);
> -               return -EINVAL;
> -       }
> +       if (func->ngroups =3D=3D 0)
> +               return dev_err_probe(info->dev, -EINVAL,
> +                                    "No groups defined in %pOF\n", np);
>
>         groups =3D devm_kcalloc(info->dev, func->ngroups,
>                                     sizeof(*func->groups), GFP_KERNEL);
> @@ -886,10 +885,9 @@ static int s32_pinctrl_probe_dt(struct platform_devi=
ce *pdev,
>         }
>
>         nfuncs =3D of_get_child_count(np);
> -       if (nfuncs <=3D 0) {
> -               dev_err(&pdev->dev, "no functions defined\n");
> -               return -EINVAL;
> -       }
> +       if (nfuncs <=3D 0)
> +               return dev_err_probe(&pdev->dev, -EINVAL,
> +                                    "No functions defined\n");
>
>         info->nfunctions =3D nfuncs;
>         info->functions =3D devm_kcalloc(&pdev->dev, nfuncs,
> @@ -919,18 +917,17 @@ static int s32_pinctrl_probe_dt(struct platform_dev=
ice *pdev,
>  int s32_pinctrl_probe(struct platform_device *pdev,
>                       const struct s32_pinctrl_soc_data *soc_data)
>  {
> -       struct s32_pinctrl *ipctl;
> -       int ret;
> -       struct pinctrl_desc *s32_pinctrl_desc;
> -       struct s32_pinctrl_soc_info *info;
>  #ifdef CONFIG_PM_SLEEP
>         struct s32_pinctrl_context *saved_context;
>  #endif
> +       struct pinctrl_desc *s32_pinctrl_desc;
> +       struct s32_pinctrl_soc_info *info;
> +       struct s32_pinctrl *ipctl;
> +       int ret;
>
> -       if (!soc_data || !soc_data->pins || !soc_data->npins) {
> -               dev_err(&pdev->dev, "wrong pinctrl info\n");
> -               return -EINVAL;
> -       }
> +       if (!soc_data || !soc_data->pins || !soc_data->npins)
> +               return dev_err_probe(&pdev->dev, -EINVAL,
> +                                    "Wrong pinctrl info\n");
>
>         info =3D devm_kzalloc(&pdev->dev, sizeof(*info), GFP_KERNEL);
>         if (!info)
> @@ -965,10 +962,9 @@ int s32_pinctrl_probe(struct platform_device *pdev,
>         s32_pinctrl_desc->owner =3D THIS_MODULE;
>
>         ret =3D s32_pinctrl_probe_dt(pdev, ipctl);
> -       if (ret) {
> -               dev_err(&pdev->dev, "fail to probe dt properties\n");
> -               return ret;
> -       }
> +       if (ret)
> +               return dev_err_probe(&pdev->dev, ret,
> +                                    "Fail to probe dt properties\n");
>
>         ipctl->pctl =3D devm_pinctrl_register(&pdev->dev, s32_pinctrl_des=
c,
>                                             ipctl);
> --
> 2.34.1
>

