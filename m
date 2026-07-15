Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9808C3EA97E
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 09:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784106662; cv=none; b=SUo5/72hUM+JrQZhcKYqT/k2ll/LTJneqGM6SPtGoUSLA8SjfN+7UZSC7r9JxdB4z2CGUoSwWmvig2qCV1EgYH0gp/uwC6Mz8+X/jaaGwmW9S2FhiCKaFehJjxyrs1nF5YFgQxc3BgZ0NgaP3IQQ4EjXsDDzAbf6I33MxwBl+M0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784106662; c=relaxed/simple;
	bh=b9PpOJcb8DxhkXY45jY4YE04g6Om+Wyc4fpqhjZ75nM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AcCOpi3exLN4JmhmxGtFXrnejCaYjGcgKH5JSJJBEeTURKVy+KE6MnLkFeOZWT0iHf/uce8kjX21JfAFCXkLXOCPmIzBeMaDrWfBUtnFue2PhDSIw9Gi32YjHmrajCbUIGZRZ+QqIOLUmy3p4oSudO9rqmYZJUI1riaCEBI0CYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-737de525d2eso5315541137.2
        for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 02:11:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784106659; x=1784711459;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XLTXQ+jfU88JSGv7Lh/A+xkjnHoYFHk+Tdqt/10T0QY=;
        b=WLIhw3v4u15SSpixT3lkgllWMrbPvoo0GCuSKZs4pd5VC8y4kC4QrfBJPyjd7stkuf
         SknLYOAr06/5X975r2QoCNIIbR2mv4TqISUDcd7SJl1R2LVFLWyLNBCHPkMzkLPdQgeT
         oCEdDvq4FGO+MorhA058HhdLWfGrOeMyOaQ+gV1+3ZAYnRCjWMcAvYhimyeDe3hMk+a7
         k35ZeVGwlUTAr5Tqr7rMZ8W1qeHvdcM+LhRCHW5PtdK3KocgTuylliTDmt4dMpJhWCrN
         x5ImDauJe4JXfpYvoBQULNEZP/s0W6fMSTLx4WuzG5Ge6v8B1+hbYF6viZgArEVUSsQA
         boNQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqig9wK4gJ8yc3cQHdZNCwaPA11MMQWXbq6LhG5aQOrDcemJ2r87/5WUHeuDOqjlrOKnHhniFQBpHb3@vger.kernel.org
X-Gm-Message-State: AOJu0Ywb0SzbgfZHUr736g8dAr1qsIN4rt+L8OQHlLDeIfrveqafGv8e
	xZjTI9ckmAhCAiWcMld5jYmt28+d5EsWtuXrVcdBYdX7wqg2nMTf6zIAKUpYGrlLnAY=
X-Gm-Gg: AfdE7cm9GiO95f1OzyFGjcydrBt3qgEA1fLVwQ7KCdBRyH7c0jIodWwousM4+jBDURa
	ETbQdItI6Ktxr4h1eiFobdtpzoo9yjrrAbFccds0IwQWxytZcurVCw6jMgSQIX0DV7C+1FGzu+W
	wEABsFNNC+Vf2WIHIn2vUlIKw6pDgN7UUOYOmMslPQUCVYywXQnHzCPdhsXzgeDwO4PxcvhF7d4
	IHbnTh2RwYz4OTSMpb7IHqqGOL3Tkz19zrcdVjnHgolVSZJISi9nT/AK+LUxXZfM9tlvwYuvuIV
	RqSZ3mQJnaklOWzGq/CxIbdUp3r1AlN9L5bvMI/3vIwVI1FO+IAb1JSytrj17bYMSmBr8Z4Ep9r
	GDzaWPCgMVmI/RfOf8nDaoaG20tgKv+vk8eM8XJvYXUa8L8t1XFJEJQO688WflO+8QETHM2aHK+
	3uBgPPRAyPOP4eMgs5XsDMnMycnPcLJJk1oEd9qxqqlUk06J51E1feRA==
X-Received: by 2002:a05:6102:26d5:b0:738:8022:d750 with SMTP id ada2fe7eead31-7459a0629f7mr1333941137.23.1784106659448;
        Wed, 15 Jul 2026 02:10:59 -0700 (PDT)
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com. [209.85.221.177])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-744d6dea737sm11683000137.9.2026.07.15.02.10.57
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jul 2026 02:10:58 -0700 (PDT)
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-5bdc96b0714so4099968e0c.2
        for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 02:10:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rq7FEaMK6hjeqWqginiPk+bogDuuizH9uweSYFoT5hSHXdf2ngO8xkxN0Lej/fJfypHkJIZJG7DrSag@vger.kernel.org
X-Received: by 2002:a05:6102:4425:b0:738:2a8c:736b with SMTP id
 ada2fe7eead31-7459a045858mr1258510137.20.1784106657725; Wed, 15 Jul 2026
 02:10:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1783505142.git.geert+renesas@glider.be> <23f979b0903ca11513ac339ab8b6dd40435603c5.1783505142.git.geert+renesas@glider.be>
 <CAPx+jO-=LF9CvYDrC3O_GBtfHU6GYvq524OLmTG8R1-u27oyKw@mail.gmail.com>
In-Reply-To: <CAPx+jO-=LF9CvYDrC3O_GBtfHU6GYvq524OLmTG8R1-u27oyKw@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 15 Jul 2026 11:10:46 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUAwxs50S7hwWRsSmtRagD7Gu4rodGund4k3r1x1+A5ug@mail.gmail.com>
X-Gm-Features: AUfX_myLu6xhapX4cEw1JPlcU_GnqjYP1lw1RxK8SjV_xKv0JfjeAPhzRG7BCHM
Message-ID: <CAMuHMdUAwxs50S7hwWRsSmtRagD7Gu4rodGund4k3r1x1+A5ug@mail.gmail.com>
Subject: Re: [PATCH v2 4/6] pmdomain: renesas: Add R-Car X5H MDLC driver
To: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, Ulf Hansson <ulfh@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ulf,

On Tue, 14 Jul 2026 at 14:04, Ulf Hansson <ulf.hansson@oss.qualcomm.com> wr=
ote:
> On Wed, Jul 8, 2026 at 12:15=E2=80=AFPM Geert Uytterhoeven
> <geert+renesas@glider.be> wrote:
> >
> > Add a minimal Module Controller driver for the R-Car X5H (R8A78000) SoC=
.
> > For now this just supports the always-on power domains, and dummy clock=
s
> > and resets for the serial console (which is enabled by the boot loader)=
.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

> > --- /dev/null
> > +++ b/drivers/pmdomain/renesas/r8a78000-mdlc.c

> > +static struct generic_pm_domain *r8a78000_genpd_xlate(
> > +                       const struct of_phandle_args *spec, void *data)
> > +{
> > +       struct r8a78000_mdlc_priv *priv =3D container_of(data,
> > +                                       struct r8a78000_mdlc_priv, genp=
d_data);
> > +       struct device *dev =3D priv->dev;
> > +       u32 id;
> > +
> > +       if (spec->args_count !=3D 2)
> > +               return ERR_PTR(-EINVAL);
> > +
> > +       id =3D spec->args[0];
> > +
> > +       if (id >=3D R8A78000_MDLC_PD_AON) {
> > +               dev_dbg(dev,
> > +                       "Mapping HW power domain 0x%x to always-on doma=
in\n",
> > +                       id);
> > +               return r8a78000_genpd_always_on;
>
> This looks odd, but perhaps it's just a temporary mapping that you
> intend to change later, no?

The hardware has multiple always-on domains, but on the software side,
using only one is sufficient.  When needed, it can be changed later.
Other domains will be added later, in the else branch.

> > +       }
> > +
> > +       dev_err(dev, "Unknown power domain 0x%x\n", id);
> > +       return ERR_PTR(-ENOENT);
> > +}

> > +static int r8a78000_genpd_always_on_singleton(struct device *dev)
> > +{
> > +       struct generic_pm_domain *genpd;
> > +       int ret;
> > +
> > +       guard(mutex)(&r8a78000_mdlc_lock);
> > +
> > +       if (r8a78000_genpd_always_on)
> > +               return 0;
> > +
>
> I guess the mutex is used to protect the global
> r8a78000_genpd_always_on, but it looks like that isn't really needed
> based upon how things are being called during the probe.

Why would it not be needed? There are multiple instances of the MDLC
device, but only one instance of the always-on domain.

> > +       genpd =3D kzalloc_obj(*genpd);
> > +       if (!genpd)
> > +               return -ENOMEM;
> > +
> > +       genpd->name =3D "always-on";
> > +       genpd->attach_dev =3D r8a78000_mdlc_attach_dev;
> > +
> > +       ret =3D pm_genpd_init(genpd, &pm_domain_always_on_gov, false);
> > +       if (ret) {
> > +               kfree(genpd);
> > +               return dev_err_probe(dev, ret,
> > +                                    "Failed to create always-on domain=
\n");
> > +       }
> > +
> > +       r8a78000_genpd_always_on =3D genpd;
> > +       return 0;
> > +}
> > +
> > +static int r8a78000_mdlc_probe(struct platform_device *pdev)
> > +{
> > +       struct device *dev =3D &pdev->dev;
> > +       struct device_node *np =3D dev->of_node;
> > +       struct r8a78000_mdlc_priv *priv;
> > +       const struct mdlc_info *info;
> > +       struct resource *res;
> > +       int ret;
> > +
> > +       ret =3D r8a78000_genpd_always_on_singleton(dev);
> > +       if (ret)
> > +               return ret;
> > +
> > +       info =3D of_device_get_match_data(dev);
> > +       if (!info)
> > +               return -ENODEV;
> > +
> > +       priv =3D devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> > +       if (!priv)
> > +               return -ENOMEM;
> > +
> > +       priv->dev =3D dev;
> > +       priv->np =3D np;
> > +
> > +       res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> > +       if (!res)
> > +               return -ENODEV;
> > +
> > +       for (; info->base; info++) {
> > +               if (info->base =3D=3D res->start)
> > +                       break;
> > +       }
> > +
> > +       if (!info->base) {
> > +               dev_dbg(dev, "Unsupported MDLC instance 0x%pa\n", &res-=
>start);
> > +               return -ENODEV;
> > +       }
> > +
> > +       priv->mod_map =3D info->mod_map;
> > +
> > +       scoped_guard(mutex, &r8a78000_mdlc_lock) {
> > +               hlist_add_head(&priv->link, &r8a78000_mdlc_list);
> > +       }
> > +
> > +       ret =3D devm_add_action_or_reset(dev, r8a78000_mdlc_unlink, pri=
v);
> > +       if (ret)
> > +               return dev_err_probe(dev, ret, "failed to add action\n"=
);
> > +
> > +       /* Note that no actual domains are registered, just need transl=
ation */
> > +       priv->genpd_data.xlate =3D r8a78000_genpd_xlate;
> > +       ret =3D of_genpd_add_provider_onecell(np, &priv->genpd_data);
> > +       if (ret)
> > +               return dev_err_probe(dev, ret,
> > +                                    "Failed to register genpd provider=
\n");
> > +
> > +       ret =3D devm_add_action_or_reset(dev, r8a78000_genpd_del_provid=
er, np);
> > +       if (ret)
> > +               return dev_err_probe(dev, ret,
> > +                                    "failed to add unregister action\n=
");
> > +
> > +       priv->rcdev.ops =3D &r8a78000_mdlc_reset_ops;
> > +       priv->rcdev.of_node =3D np;
> > +       priv->rcdev.of_reset_n_cells =3D 1;
> > +       priv->rcdev.of_xlate =3D r8a78000_mdlc_reset_xlate;
> > +
> > +       ret =3D devm_reset_controller_register(dev, &priv->rcdev);
> > +       if (ret)
> > +               return dev_err_probe(dev, ret,
> > +                                    "Failed to register reset controll=
er\n");
> > +
>
> In some of the error paths above it looks like we end up leaking the
> data allocated for r8a78000_genpd_always_on. Perhaps clean up that
> somewhere here.

That is intentional: the always-on domain is shared by all MDLC
instances.  If one MDLC fails to probe, the MDLC instances that did
succeed still need the always-on domain.

>
> > +       return 0;
> > +}
>
> [...]
>
> In regards to the merge strategy, I intend to pick patch 2 (shared via
> the immutable dt branch) and $subject patch. Please let me know if
> there are any issues with that.

That is fine, thanks!

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
