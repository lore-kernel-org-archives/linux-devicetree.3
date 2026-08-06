Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F8223DB33C
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 07:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786002614; cv=none; b=BvhFGTjxV1ZNS/F8NMg2GMVj0BcFObo+NBSBolrJnNXLuZKDNefIfIp+pg+I8lyU0lXFaAMy/n4mSQkvaETJPv6cifrvFJa4vmP6av+gCumI9oRDL89A+M7k8fwccY5tKhtdy4mtwoI931glUlSfWSNzN+NFJbs6rChJOTAp8jA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786002614; c=relaxed/simple;
	bh=BRzW2/OT2/0yKrT1p+N+QYbs30oY2P+WH549plD4BDA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JWeBlYDXB9Kxsd7GlG2QcQ/0IVwE4cYhaka29VRk/BTUvGhXaF+g9JhiKuUYQElIC2JdCtYDJz07ECgZXg+B1mQylnz5cP822p84fh1Ec+BflkG+1axP40bHWhZE7FGO60rM1esD2h3nEdgvOThbeMD+X1nJaSCRlcyob8YGMyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-5bf959b820cso1279389e0c.3
        for <devicetree@vger.kernel.org>; Thu, 06 Aug 2026 00:50:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786002611; x=1786607411;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Bw0q5d56LIKtFiT6Te7rkJ4Ur/ITs2O5UDLJ3AFpiL0=;
        b=MytcVBtVLmvxm2sTBBRZkqxtYuYhi3a5ntk6RVPp0qTCzAz7bbozh+gfEo8TWw/XNY
         oieY5349XjDGmI7F1ARlQpu2TOQ3VEj/RsQHTKyCeWjC826psN2xmA/tx/FsDIjaYI+W
         APTGZDddmx8evTEKRC2ZOCdt0+n6qH2cPbVxhTMJLb9CppTPSsgSRuqUWN9LKhPuSrIB
         TnzTia314lnyjHk/oRCo1McbPHGQNRENCQ9Fi/0yDsyS4klHtEYwTYzTRIWbYAyD/qlp
         G4pm360Zy4CwfVg1C7ImtIBZUBeKYurgd4pWpIuOUQzx6fFMg5KQ/3KIT1W+VlcWhB/7
         W2bg==
X-Forwarded-Encrypted: i=1; AHgh+Rrd4QGl6BRQVD5lRUEbw6OnozDB1597DMSwaXmTO+auy+iTM2u1JLvE9y4F0MB7TISGsc+BlHUdPfiJ@vger.kernel.org
X-Gm-Message-State: AOJu0YwxCdk6J3EautJqL4zmdu/AyorfkI0DqmGgHPsQHw/0qQ59GsQO
	/GdZQo03MynG2KgBIJTcz9Z7eEcTEbjkGgZ0HhLziKD1W8LpuccOOpeHCMz4cGTG
X-Gm-Gg: AR+sD13Xb7JO9B23s/fcclO45I2GhPUZJw4ztbY0U92a0gS/I1IwSfMVpOQy+EhZ8J2
	F50Io0eAu6cGGD/cA/IGe4WWaDK3nvezoy6lVLx1nqQiPNNOsYWlTJAKFf5F7671YI23xlw08Ua
	DXgNEtEU9K/26h2s/+ALt6N8FyoyrRNtEHmGx5NIXC1CQF74fJTmi4HluvPtY4roRqIqtkDQadH
	TDeUW/iqyltv/OaHP3rDEhTO7HvLkKbzFPK6LDeLzmadmgL8v6iGBcc4EyPv+7Y+Hg9PovpsL+K
	kTVivYZDY8TapC4j6jNWQSESIFdyCR4LoV9jLbrPedM23/xY22qkNrFb9oJdtFTWDuHEEmFuAFw
	nTCfrk1TftIZp7W7V/VEp2Q63JWo86x1gVWqihf31aI2DeJkQqJsfpntG/a91RjvddIBomLxkza
	a34g7USQDJpLGuU2lSveayaezR8m6I4fk5xi4OIVm3VYsfhpQGEjGuJajsH5UwSZFI0a83fHI7c
	0qo/xiEymf+8+I9Czv08C+D+w==
X-Received: by 2002:a05:6122:1c85:b0:5bd:8c84:59aa with SMTP id 71dfb90a1353d-5c3d9162e78mr1888849e0c.8.1786002610647;
        Thu, 06 Aug 2026 00:50:10 -0700 (PDT)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com. [209.85.217.47])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c3d050f8c1sm2900627e0c.2.2026.08.06.00.50.10
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Aug 2026 00:50:10 -0700 (PDT)
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-73a442f7cd3so1147587137.3
        for <devicetree@vger.kernel.org>; Thu, 06 Aug 2026 00:50:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqIW8R72yAUExjqLsPp3f7ScyHlU2XhfKNPtyeTxlWn84lQcZ8yMHBt7WVVDUc4IbSkXXp1O9I0/5fq@vger.kernel.org
X-Received: by 2002:a05:6102:5788:b0:74c:7fd8:73f5 with SMTP id
 ada2fe7eead31-760e7bec35amr3810486137.6.1786002610083; Thu, 06 Aug 2026
 00:50:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1785941595.git.geert+renesas@glider.be> <89e6a71b35703f10e12f520af1f389b5f40f4b35.1785941595.git.geert+renesas@glider.be>
 <0124d3a3-81dc-44ce-88a2-9426c65ac46c@mailbox.org>
In-Reply-To: <0124d3a3-81dc-44ce-88a2-9426c65ac46c@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 6 Aug 2026 09:49:58 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXHPjzCidCkfyF0c9fndAmAte1DuhxGZt=WY=_jxpwU+Q@mail.gmail.com>
X-Gm-Features: AUfX_mxDCMXWQzEKQw-oHDEPLKfBz2gF2hlxdZi1vAhDPfXSN6ZVQ5LCO1qQ5aA
Message-ID: <CAMuHMdXHPjzCidCkfyF0c9fndAmAte1DuhxGZt=WY=_jxpwU+Q@mail.gmail.com>
Subject: Re: [PATCH v3 4/6] pmdomain: renesas: Add R-Car X5H MDLC driver
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, Ulf Hansson <ulfh@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Marek,

Thanks for your comments!

On Thu, 6 Aug 2026 at 00:38, Marek Vasut <marek.vasut@mailbox.org> wrote:
> On 8/5/26 5:20 PM, Geert Uytterhoeven wrote:
> > +DEFINE_MDLC_RESET_WRAPPER(reset)
> > +DEFINE_MDLC_RESET_WRAPPER(assert)
> > +DEFINE_MDLC_RESET_WRAPPER(deassert)
> > +DEFINE_MDLC_RESET_WRAPPER(status)
> > +
> > +static const struct reset_control_ops r8a78000_mdlc_reset_ops = {
> > +     .reset = r8a78000_mdlc_reset,
> > +     .assert = r8a78000_mdlc_assert,
> > +     .deassert = r8a78000_mdlc_deassert,
> > +     .status = r8a78000_mdlc_status,
> > +};
>
> Please keep the list sorted alphabetically.

This matches the order in which the members of struct reset_control_ops
are defined.

> > +static int r8a78000_mdlc_attach_dev(struct generic_pm_domain *domain,
> > +                                 struct device *dev)
> > +{
> > +     struct device_node *np = dev->of_node;
> > +     struct r8a78000_mdlc_priv *priv;
> > +     struct of_phandle_args pd_spec;
> > +     const struct mod_map *map;
> > +     unsigned int id;
> > +     int ret;
> > +
> > +     ret = of_parse_phandle_with_args(np, "power-domains",
> > +                                      "#power-domain-cells", 0, &pd_spec);
> > +     if (ret < 0)
> > +             return ret;
> > +
> > +     if (pd_spec.args_count != 2) {
> > +             of_node_put(pd_spec.np);
>
> Maybe some "goto error" fail path which does of_node_put() wouldn't hurt
> here, since the of_node_put() is duplicated in here multiple times.

I'd rather keep it like this, as of_node_put() must not be called in all
error paths.  Moreover, SCMI remapping will add more error paths,
and multiple fail* labels.

>
> > +             return -EINVAL;
> > +     }
> > +
> > +     scoped_guard(mutex, &r8a78000_mdlc_lock) {
> > +             hlist_for_each_entry(priv, &r8a78000_mdlc_list, link) {
> > +                     if (priv->np == pd_spec.np)
> > +                             break;
> > +             }
> > +     }
> > +
> > +     if (!priv) {
> > +             dev_err(dev, "%s: MDLC %pOF not found\n", __func__, pd_spec.np);
> > +             of_node_put(pd_spec.np);
> > +             return -ENODEV;
> > +     }
> > +
> > +     id = pd_spec.args[1];
> > +     of_node_put(pd_spec.np);
> > +
> > +     map = mod_map_find(priv->mod_map, id);
> > +     if (!map) {
> > +             dev_err(dev, "Unknown module 0x%x\n", id);
> > +             return -ENOENT;
> > +     }
> > +
> > +     dev_dbg(dev, "Ignoring HW module 0x%x\n", id);
> > +     return 0;
> > +}
>
> [...]
>
> > +static int r8a78000_mdlc_probe(struct platform_device *pdev)
> > +{

> > +     if (!info->base) {
> > +             dev_dbg(dev, "Unsupported MDLC instance 0x%pa\n", &res->start);
>
> return dev_err_probe() might be more appropriate here, even if that
> would be more chatty until the support for various MDLC nodes lands.

Indeed, it would be very chatty, and may confuse users, that's why
I used dev_dbg().  We can revisit that later.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
