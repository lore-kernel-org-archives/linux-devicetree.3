Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795074551;
	b=dX+TRyZiMls6JOFK7Qg0n4V4he6skAaVZ4/+vrXk6On1c+4IdaEYN5NcrlKOO5qvEvnh
	 dWlt0QsP6kFZJDyqmxIflUu7YERnU+hd9Kbd2/g1bQnQVaWEoMogjWgRu83lo1RUzRYhB
	 cmXwn7wEqnjADUgi2xgXB0KZSWkqFZP7SQZhjCk8i0dnIZKMrnittrTHY+jt4IkpNBjEO
	 NDAXcOaiVBKxboicCYvZv7bAXkq3zKdtNKxMq46DmJSlYCWXDBRLoeohRJDY5mFFbKg99
	 H675uunyOi71krgRRx7WkZhnk+gCXAi7+TQ2dk3Oe2RGmqN9FZIOqqFD/9MFQDo14cw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795074551;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gmail-Original-Message-ID:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=AlwETNNCgQuoL3olEu8hotUVCo0wqZYULOda47vcNrw=;
	b=g6BcKqumaSoCb8z6Juqp6O+iZg6qJ0LZmz7OjYVSJP/v/0QhRosQVpKzW5guxRogKRSe
	 ICl21OZkdcex84vznMkgy3O/ITE+29+dyiG9b1mAzYqsxfUW83mjTfXHOBSuCaI8yTbxz
	 Ad5Pdostt8dnz3qIJNt2QYp8g286spsbRtNhRBrNOfaqlq92F0GLWISDfAZf1J6hyn0be
	 J4xldnB1QAb7Q1dhIQNASHqQVTQIH9A5udyQhCJuCIEbeu/1GOqsCrqIxU66ADlVtYH2x
	 O1iKGTte37DFV2KVKAW9xPCUhfeyPciBF9oFLgvo069sD/BRWbop2gIuodnIDzaSzVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.221.181
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA71B606A320
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 07:49:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CA71B606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-5eadef147ffso1270004e0c.3
        for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 23:49:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795074550; x=1795679350;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=AlwETNNCgQuoL3olEu8hotUVCo0wqZYULOda47vcNrw=;
        b=AsUD+PKch7uVKMbI68J/L/+FKaGFNpz9VNX8IEpnBvHF/m+yDI3vQT95+IWiBmL8v7
         QEJubuOaSLzc155+Ta59mPDrBCqbH1LL+3ajhNdahesyEkb3w64lRON2f7NRcr5/iZLv
         IIPIRonxxLPIxyjtH72PZSiEQZLHxXbbJfi79s5HnP3p0Rlpk47zcScgFAhjA8d+mZOj
         QziL5EH8Cpc8jncizDjUOYjKigHykNnGhK5ZWT5A21QoiPIFEkiAwdnyl7uxg3JEZ4mI
         gSmjxKr7UqMencSEcNQrp5aYNHQ6Rt9gO5rpwA7k9C2cDKNbZoOM/bChVx7Jftoagdn9
         JwWQ==
X-Gm-Message-State: APuU4Z9PiYeFvInMezy//nR8z8EWqML2haafm+KAsMZAyHEZSfP/YjbE
	ZYDbzgSc2zUunFyMcy5IKOcIIJP824y4OCgwtU9BcddTC5GexK9jxPIVOmF3QHzZ
X-Gm-Gg: AYBFou0KaIIAioX9tkAm+Qacic6e0/yRAM5v/eTchGCanvrmJ65q8iEg9DPYJo/y6ey
	h/r7le8UX+lr30yrGUNCxtbxvBA7I2F7PInrAr9Ib9RwgEth6TwbAYaNM9/flnQBxPwO58DaxS0
	kPfKrmWPJnSgZPEOUzek3JoCzWTv6yZzt/yeA1aHNzVvyRJTEECryql9gpOfVpJE3/Ey5XmuO9S
	M1EzJ7iV4gR33CBQsvrCrUuDemal2Q+aci+U0TLRE9AQMKD5vgk7303oiN9lqqI4t1RoKdwikQs
	83MstGETvVP3tP01v+CRfFG1Jx6W/4Qkl86xLUWnBTgdAy59A9YqtPUyFBBArCkIfSoOY19w0GQ
	jkbe22i14jLsGy4aqaQkk6kuB1e5zoiBRssOFwgc1NG/JM5V148ww185P8TjKEhU/Lz4GXHDjso
	S4UngKMjbRWR1CqFmgDV31EnKd2aId/DUkmLc1WGWUHLxKzPiP/4snsGf3CzM91k+2b1Kp1aB2e
	tpfTMHS8rxFRLRMbYlY0LQuwmSE9vVFYS+pkNkCx+ov0kL4NP7CGMj1m1s+baxLrKiQ4P5cfEXP
	6XyY2wJnIKNIcnQ56dOgTXbegCicDnNjmI/Dt/fCAKMw/Ap7rDTl5zd4WC8UuPnh6e4=
X-Received: by 2002:a05:6122:4307:b0:5de:ee96:75b with SMTP id 71dfb90a1353d-5ee64727ccamr2885984e0c.12.1795074549710;
        Wed, 18 Nov 2026 23:49:09 -0800 (PST)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com. [209.85.217.52])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ee64ec2730sm3608079e0c.14.2026.11.18.23.49.09
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 23:49:09 -0800 (PST)
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-7d2bf046ceaso1191745137.3
        for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 23:49:09 -0800 (PST)
X-Received: by 2002:a05:6102:370c:b0:7d2:c903:515d with SMTP id
 ada2fe7eead31-7d6ba3e8cc5mr2280659137.7.1795074549276; Wed, 18 Nov 2026
 23:49:09 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1795029012.git.geert+renesas@glider.be> <e6816327da51f9fbeef67f13aac723b891e5042f.1795029012.git.geert+renesas@glider.be>
 <sashiko-outbox-221928@kernel.org>
In-Reply-To: <sashiko-outbox-221928@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 19 Nov 2026 08:48:57 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXgOvdAAJEEydip_-Aakf8j3ORXnZAS-=NqCMBxHwrfZA@mail.gmail.com>
X-Gm-Features: Aa3M54qMY9KEs6Xlpwbmw0a9TWCYDcZMChPHFmIneFq8gUbTr8Q3_1H7DUbenEE
Message-ID: <CAMuHMdXgOvdAAJEEydip_-Aakf8j3ORXnZAS-=NqCMBxHwrfZA@mail.gmail.com>
Subject: Re: [PATCH v5 14/15] pmdomain: renesas: r8a78000: Add SCMI remapping support
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, linux-clk@vger.kernel.org, robh@kernel.org, 
	conor+dt@kernel.org, wsa+renesas@sang-engineering.com
Content-Type: text/plain; charset="UTF-8"

Hi Sashiko,

On Wed, 18 Nov 2026 at 21:22, <sashiko-bot@kernel.org> wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential
> issues to consider:
> - [Medium] pmdomain: renesas: leak of exclusive reset controls in
>   r8a78000_mdlc_probe()
> - [Medium] pmdomain: renesas: leak of scmi_clk_np reference in
>   r8a78000_mdlc_probe()
> - [Low] pmdomain: renesas: mixed scoped_guard() and goto in
>   r8a78000_mdlc_attach_dev()
> --
>
> commit 35d53b7b58584e545d3609ea7bb1ae4726d2bdc8
> Author: Geert Uytterhoeven <geert+renesas@glider.be>
>
> pmdomain: renesas: r8a78000: Add SCMI remapping support
>
> This commit extends the R-Car X5H Module Controller driver to remap
> hardware power domain, module clock, and reset IDs to SCMI power domains,
> clocks, and resets when SCMI firmware support is available.

Thanks for your review!

> > --- a/drivers/pmdomain/renesas/r8a78000-mdlc.c
> > +++ b/drivers/pmdomain/renesas/r8a78000-mdlc.c
> [ ... ]
> > @@ -178,8 +280,148 @@ static int r8a78000_mdlc_attach_dev(struct generic_pm_domain *domain,
> >               return -ENOENT;
> >       }
> >
> > -     dev_dbg(dev, "Ignoring HW module 0x%x\n", id);
> > +     if (!priv->scmi_clk_np) {
> > +             dev_dbg(dev, "Ignoring HW module 0x%x\n", id);
> > +             return 0;
> > +     }
> > +
> > +     entry = &priv->mod_map->entries[idx];
> > +     dev_dbg(dev, "Mapping HW module 0x%x to SCMI clock %d fck parent %d\n",
> > +             id, entry->fw_id, entry->fw_fck_parent);
> > +
> > +     clk = scmi_get_clk(dev, priv->scmi_clk_np, entry->fw_id);
> > +     if (IS_ERR(clk))
> > +             return PTR_ERR(clk);
> > +
> > +     parent = scmi_get_clk(dev, priv->scmi_clk_np, entry->fw_fck_parent);
> > +     if (IS_ERR(parent)) {
> > +             ret = PTR_ERR(parent);
> > +             goto fail_put_clk;
> > +     }
> > +
> > +     if (!clk && !parent) {
> > +             /* Ignore missing SCMI clocks */
> > +             return 0;
> > +     }
> > +
> > +     ret = pm_clk_create(dev);
> > +     if (ret)
> > +             goto fail_put_parent;
> > +
> > +     if (parent) {
> > +             ret = pm_clk_add_clk(dev, parent);
> > +             if (ret) {
> > +                     pm_clk_destroy(dev);
> > +                     goto fail_put_parent;
> > +             }
> > +     }
> > +     if (clk) {
> > +             ret = pm_clk_add_clk(dev, clk);
> > +             if (ret) {
> > +                     pm_clk_destroy(dev);
> > +                     goto fail_put_clk;
> > +             }
> > +     }
> >       return 0;
> > +
> > +fail_put_parent:
> > +     clk_put(parent);
> > +fail_put_clk:
> > +     clk_put(clk);
> > +     return ret;
> > +}
>
> [Severity: Low]
> This isn't a bug, but r8a78000_mdlc_attach_dev() already uses
> scoped_guard(mutex, &r8a78000_mdlc_lock), and adding goto-based error
> unwinding in the same function mixes cleanup.h helpers with goto labels.
> Factoring either the list lookup or the PM clock setup into a helper
> would keep them separate.

Not a bug, will see if I get to it...

> > +static struct reset_control **get_rstcs(struct r8a78000_mdlc_priv *priv,
> > +                                     struct fwnode_handle *scmi_reset_fwnode)
> > +{
> > +     const struct mod_id_map *map = priv->mod_map;
> > +     struct fwnode_reference_args scmi_spec;
> > +     struct reset_control **rstcs, *rstc;
> > +     struct device *dev = priv->dev;
> > +     s16 fw_id;
> > +
> > +     if (!map)
> > +             return NULL;
> > +
> > +     rstcs = devm_kzalloc_objs(dev, *rstcs, map->size);
> > +     if (!rstcs)
> > +             return ERR_PTR(-ENOMEM);
> > +
> > +     for (unsigned int i = 0; i < map->size; i++) {
> > +             fw_id = map->entries[i].fw_id;
> > +             if (!scmi_reset_fwnode || fw_id < 0)
> > +                     continue;
> > +
> > +             scmi_spec.fwnode = scmi_reset_fwnode;
> > +             scmi_spec.nargs = 1;
> > +             scmi_spec.args[0] = fw_id;
> > +
> > +             rstc = reset_control_get_from_provider_exclusive(&scmi_spec);
> > +             if (IS_ERR(rstc)) {
> > +                     while (i--)
> > +                             reset_control_put(rstcs[i]);
> > +
> > +                     return dev_err_cast_probe(dev, rstc,
> > +                                     "Failed to get SCMI reset %u\n", fw_id);
> > +             }
> > +
> > +             rstcs[i] = rstc;
> > +     }
> > +
> > +     return rstcs;
> >  }
>
> [Severity: Medium]
> Does r8a78000_mdlc_probe() leak the exclusive reset_control objects in
> priv->rstcs if a later registration step fails?
>
> reset_control_get_from_provider_exclusive() returns unmanaged references,
> and get_rstcs() only calls reset_control_put() when its own loop fails.
> If a subsequent call in r8a78000_mdlc_probe() such as
> of_genpd_add_provider_onecell() or devm_reset_controller_register() fails,
> the reset controls are leaked and remain marked exclusively acquired, so a
> later probe retry will fail with -EBUSY.  Registering a
> devm_add_action_or_reset() callback in get_rstcs() would release them on
> probe failure.

Thanks, will do.

> > @@ -249,6 +500,47 @@ static int r8a78000_mdlc_probe(struct platform_device *pdev)
> >       priv->dev = dev;
> >       priv->np = np;
> >
> > +     if (!IS_ENABLED(CONFIG_ARM_SCMI_POWER_DOMAIN) ||
> > +         !IS_ENABLED(CONFIG_COMMON_CLK_SCMI) ||
> > +         !IS_ENABLED(CONFIG_RESET_SCMI)) {
> > +             dev_dbg(dev, "SCMI pmdomain/clock/reset support is disabled\n");
> > +             goto fallback;
> > +     }
> > +
> > +     scmi = of_find_compatible_node(NULL, NULL, "arm,scmi");
> > +     if (!scmi) {
> > +             dev_dbg(dev, "Cannot find SCMI firmware node\n");
> > +             goto fallback;
> > +     }
> > +
> > +     if (!of_device_is_available(scmi)) {
> > +             dev_dbg(dev, "SCMI firmware node is not available\n");
> > +             goto fallback;
> > +     }
> > +
> > +     scmi_power_np = scmi_find_proto(scmi, SCMI_PROTOCOL_POWER);
> > +     if (!scmi_power_np) {
> > +             dev_dbg(dev,
> > +                     "Cannot find SCMI power domain management protocol\n");
> > +             goto fallback;
> > +     }
> > +
> > +     scmi_clk_np = scmi_find_proto(scmi, SCMI_PROTOCOL_CLOCK);
> > +     if (!scmi_clk_np) {
> > +             dev_dbg(dev, "Cannot find SCMI clock management protocol\n");
> > +             goto fallback;
> > +     }
> > +
> > +     scmi_reset_np = scmi_find_proto(scmi, SCMI_PROTOCOL_RESET);
> > +     if (!scmi_reset_np) {
> > +             dev_dbg(dev, "Cannot find SCMI reset management protocol\n");
> > +             goto fallback;
> > +     }
> > +
> > +     priv->scmi_clk_np = scmi_clk_np;
> > +     info = mdlc_data->fw_info;
> > +
> > +fallback:
>
> [ ... ]
>
> > @@ -295,11 +604,14 @@ static int r8a78000_mdlc_probe(struct platform_device *pdev)
> >               return dev_err_probe(dev, ret,
> >                                    "Failed to register reset controller\n");
> >
> > +     /* Retained in priv->scmi_clk_np */
> > +     retain_and_null_ptr(scmi_clk_np);
> > +
> >       return 0;
> >  }
>
> [Severity: Medium]
> Does retain_and_null_ptr(scmi_clk_np) leak the scmi_clk_np device_node
> reference when the fallback path is taken after scmi_clk_np has been
> found?
>
> If scmi_find_proto(scmi, SCMI_PROTOCOL_CLOCK) succeeds but
> scmi_find_proto(scmi, SCMI_PROTOCOL_RESET) returns NULL, probe jumps to
> fallback before setting priv->scmi_clk_np = scmi_clk_np, and then
> unconditionally clears scmi_clk_np via retain_and_null_ptr(scmi_clk_np)
> at the end of r8a78000_mdlc_probe().

That is correct behavior, as scmi_clk_np won't be handed to
priv->scmi_clk_np in the fallback case.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
