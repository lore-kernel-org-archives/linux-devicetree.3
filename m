Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794582821;
	b=xHX6RIZd/r4xNLopw9Usucq4df40OOWRBMvlxkvoeQGaUt8a0mDgr4OPshM2Ow/8DDfw
	 1NSTqH/1l7L08/BSmkh1SfdseDnsCudJ2r3X7OHBbJMgI8v4ISC6vkBwO9ON6eFzEdJp3
	 osfNN4TcBkO92HssCi0UW7oITAMZuBmmxJ+1+gcFozVVbDSvQuryjscb54K4eQ7CeqdnC
	 fu0U1c0tf+QsDNgwLm99eE5qJfIbZUu/jSQuvt5ezobhUABJIBur5gpNQMF4+/RrKEhFJ
	 1frxV/FxnYa2VLPvQ+cOkc5JTzLhZc7CmAtCGuHlCgJvELTCVVH/1OrVgjodWQWyMLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794582821;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gmail-Original-Message-ID:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=cVOOq3RPpxrIdRrjnzQ+Oq5IwAudXg3maodPAIwZDdk=;
	b=gV+V+TMQLlc5H1oDLETO51hx3XodpL4hdQZJulKJWvg32YfRDncF0fmsf2DWlMI4x8ZK
	 5gCJ3PNJpxzfoTY35pcWBMfox9Snyp+BP2CxSPJIUn9jhSRZB3F5zlZmnvLjNXQ1ixFs/
	 hVGUNMCmtaaSmYfO5gQkwVwO6Pn6O6oe89Vk4Gga0AkgyhGsu7cuDQJmoTcbEgNeaCoIk
	 N3aixdyB0fglMq1VRV/EwRj7Pj/Qi29qxygOr+JNt4IrCpDSu3GiZmZzxeeB/xJ5HdqRn
	 zyLiF1o/oL6TYFdILC/4yBp5Q20p4zU/KUTBSwX+AR9rHm9HBypmomB8BeLJXJVFJ5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.218.48
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25D62606A323
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 15:13:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 25D62606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c468bd799ecso210359566b.1
        for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 07:13:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794582819; x=1795187619;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=cVOOq3RPpxrIdRrjnzQ+Oq5IwAudXg3maodPAIwZDdk=;
        b=HQXr1lnSk+sNJDLycEQPGEzpLG9fj+nf9ox+UGVGWoxrg6JUU5zph6d+cg5nDj0R0+
         wD0abVOWJVe6N3QsBp5LlgaM3XRBjNFe4chEdsabA7WOYUFEIOZSgUpuuvEK9istucXs
         abPzm5nbnS95eMdkXNWzTzaWiy7Ig0HN0SBXBqroD8SZzAIunvlYcgSZPlurXMo5zH9A
         nFP9v5ZsZ+kHkWP4wTHRJzeGHstKnIjEqcA+ruFJBQidZjS+2ZU+0QYX0gKDfNhw9nvT
         /cvEtpuouvsMcHISSBbXjfAsBcPrKlPX2VtsPbSAGzd8vB/oi98br8Sx6LW046B4g52o
         FxPg==
X-Gm-Message-State: APuU4Z87eQz8Gh6S6WVTWCEVWEMvrtk/JXI/pcDIi9z/RPYs00O9FPLI
	g85xTZqJjV5YaJ6JY5B5FI6sHIszMFHql9X4miP4qUDvTerdg6F0WfoIp1BjcR/pgo8=
X-Gm-Gg: AYBFou29+xK6y0NdB0zHLtEY2kKtGpLQvdZqkv8YizQpPBfpOkap/K6aP/2awj7vxt/
	t3/17BKYkGrLFFrjK4YkrLrnmiKi12WI3d3z7OrlrOOrEWw98YdCJCthSp5YQcBc/0vxHG4P73a
	rhPr8aguz3hPuyQQmk8MasOLPZ4f2Jroj+nJlrI8uL8+iF7PtDswOioyYmZW2QacsDqhZxWNrsu
	DO55SaTErZmhvcWfjtkavT+5nqvFyymImdPOX7Bg2G5eHI5sPTCJ41TOM4LeAsG9nDkpnwM1xg/
	8f3YgrfPNDdfRcFwcRUZdDSIyIFyNdnMUTmCxH2hqvIk1UHOg6zLZriBmKWd1U35AhE8FfI43NN
	Y4POGw775/JcQ/nQmmpRyk3JDJzLseik1Bvwwulo7sgNumecjQi05gWpqbioKS1/1sQvUEcgzYM
	4bKxoPZkjYmRnGATOO1TwEZxWuR18ZanFt53wBBZhN4XZgsJATpf/hIqalpMajjn2cxorgzCWr7
	KvlHMUHDxU2AkXkBsETiGeTv+X7Mf6MjPPvJ4K9IqNBwTffIJ3y4qMgfBA1kLvnRRZIHLJULg2f
	S8IPQxXk/DwGJ50cMcDEEkMArYNQi+2ijL3r18lC0GFSsTkYPohChA==
X-Received: by 2002:a17:907:d30d:b0:c4d:2f6b:435 with SMTP id a640c23a62f3a-c5096407291mr285008766b.18.1794582819339;
        Fri, 13 Nov 2026 07:13:39 -0800 (PST)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com. [209.85.218.49])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b56df7sm115721766b.47.2026.11.13.07.13.34
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 07:13:38 -0800 (PST)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c4cac7a7d3cso187290066b.3
        for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 07:13:34 -0800 (PST)
X-Received: by 2002:a17:907:3f23:b0:c50:93b6:52fa with SMTP id
 a640c23a62f3a-c509614e782mr243931466b.2.1794582814183; Fri, 13 Nov 2026
 07:13:34 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1792163045.git.geert+renesas@glider.be> <2895c8f3cbe718dc597ad25e16c2461f0d681ab6.1792163045.git.geert+renesas@glider.be>
 <sashiko-outbox-174618@kernel.org>
In-Reply-To: <sashiko-outbox-174618@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 13 Nov 2026 16:13:20 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWRmqp_4GhyMjNBMFZULiF1ihKSCmiiVzLFG9L9aC=EMA@mail.gmail.com>
X-Gm-Features: AclHuK-rhaY3W-iKou3OxdeSeto8XUZuAfuEblsDGz7eRhtlFv6Qzoq4TAhS1Jo
Message-ID: <CAMuHMdWRmqp_4GhyMjNBMFZULiF1ihKSCmiiVzLFG9L9aC=EMA@mail.gmail.com>
Subject: Re: [PATCH v4 7/8] pmdomain: renesas: r8a78000: Add SCMI remapping support
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, linux-clk@vger.kernel.org, robh@kernel.org, 
	conor+dt@kernel.org, wsa+renesas@sang-engineering.com
Content-Type: text/plain; charset="UTF-8"

Hi Sashiko,

On Fri, 16 Oct 2026 at 18:15, <sashiko-bot@kernel.org> wrote:
> Thank you for your contribution! Sashiko AI review found 6 potential issue(s) to consider:
> - [High] clk: double free of parent clock reference in error path
> - [High] pmdomain: renesas: mutation of SCMI genpd and hardcoded index 0 in attach_dev
> - [Medium] of: memory leak of scmi_clk_np reference
> - [Medium] reset: memory leak of exclusive reset controls on error and unbind
> - [Medium] pmdomain: renesas: out-of-bounds stack read in r8a78000_mdlc_attach_dev()
> - [Low] cleanup: mixed goto and scope-based cleanups in attach_dev
> --
>
> commit a125fd15fada610e74f2b15cf0cafd68482a5100
> Author: Geert Uytterhoeven <geert+renesas@glider.be>
>
> pmdomain: renesas: r8a78000: Add SCMI remapping support
>
> Extend the Module Controller driver for R-Car X5H with SCMI support, to
> remap hardware power domain, module, and reset IDs to abstractions
> offered by the SCMI firmware. This avoids putting SCMI IDs in DT and
> supports fallback to non-SCMI defaults when needed.

Thanks for your comments!

> > --- a/drivers/pmdomain/renesas/r8a78000-mdlc.c
> > +++ b/drivers/pmdomain/renesas/r8a78000-mdlc.c
> [ ... ]
> > +static int r8a78000_mdlc_attach_dev(struct generic_pm_domain *domain,
> > +                                 struct device *dev)
> > +{
> > +     struct device_node *np = dev->of_node;
> > +     struct r8a78000_mdlc_priv *priv;
> > +     struct clk *clk, *parent = NULL;
> > +     struct of_phandle_args pd_spec;
>
> [Severity: Medium]
> Is pd_spec guaranteed to be fully initialized?
>
> If the device tree node has a malformed #power-domain-cells < 2, could we
> end up with uninitialized stack memory in pd_spec.args[1] that is later
> used as a module ID?

The provider is matched against r8a78000_mdlc_list[] below.
If it is not found, pd_spec.args[1] is never used.
If it is found, it must have been looked up through
r8a78000_genpd_xlate(), which did verify that spec->args_count == 2.

> > +     const struct mod_map *map;
> > +     unsigned int id;
> > +     int ret;
> > +
> > +     ret = of_parse_phandle_with_args(np, "power-domains",
> > +                                      "#power-domain-cells", 0, &pd_spec);
>
> [Severity: High]
> Is it intended to unconditionally parse index 0 here, even if the domain
> being attached is at a higher index?
>
> If a non-MDLC device uses multiple domains and the MDLC domain is not at
> index 0, could this look up the wrong provider or silently fail to attach
> the correct clocks?

Non-MDLC devices must not have power-domains pointing to an MDLC domain.
In case of a wrong DTS, using multiple domains with the MDLC domain not
at index 0, the matching against r8a78000_mdlc_list[] below would fail,
and no harm is done.

>
> > +     if (ret < 0)
> > +             return ret;
> > +
> > +     scoped_guard(mutex, &r8a78000_mdlc_lock) {
>
> [Severity: Low]
> Does this mix of scope-based cleanup and goto violate the cleanup subsystem
> guidelines?
>
> This function uses scoped_guard() here, but also manually manages cleanup
> using goto-based error handling labels later in the function (e.g.,
> goto fail_put_parent). The guidelines suggest converting either all or none
> of the resources in a given routine to avoid LIFO ordering bugs.

scoped_guard() only applies to the block inside the curly braces.
There are no gotos from within this block, or gotos skipping this block.
This function also has no other instanced of __free().

> > +             hlist_for_each_entry(priv, &r8a78000_mdlc_list, link) {
> > +                     if (priv->np == pd_spec.np)
> > +                             break;
> > +             }
> > +     }
> [ ... ]
> > +     if (parent)
> > +             ret = pm_clk_add_clk(dev, parent);
> > +     if (!ret)
> > +             ret = pm_clk_add_clk(dev, clk);
> > +     if (ret)
> > +             goto fail_destroy;
> > +
> > +     return 0;
> > +
> > +fail_destroy:
> > +     pm_clk_destroy(dev);
> > +fail_put_parent:
> > +     clk_put(parent);
>
> [Severity: High]
> Will this result in a double free of the parent clock?
>
> pm_clk_destroy() destroys all clocks attached to the device, which includes
> cleanly removing the successfully added parent clock (and internally calling
> clk_put() on it). Falling through to fail_put_parent seems to call
> clk_put(parent) a second time.

True, will fix in v5.

> > +fail_put_clk:
> > +     clk_put(clk);
> > +     return ret;
> > +}

> > +static const struct power_map *fill_power_map(struct r8a78000_mdlc_priv *priv,
> > +                                           const struct power_map_in *map_in,
> > +                                           struct device_node *scmi_power_np)
> > +{
> [ ... ]
> > +             genpd = of_genpd_get_from_provider(&scmi_spec);
> > +             if (IS_ERR(genpd))
> > +                     return dev_err_cast_probe(dev, genpd,
> > +                                     "Failed to get SCMI power domain %u\n",
> > +                                     map[i].fw_id);
> > +
> > +             dev_dbg(dev, "SCMI power domain %u is %s\n", map[i].fw_id,
> > +                     genpd->name);
> > +
> > +             map[i].genpd = genpd;
> > +
> > +             /* Hook up clock domain support */
> > +             genpd->attach_dev = r8a78000_mdlc_attach_dev;
> > +             genpd->detach_dev = r8a78000_mdlc_detach_dev;
> > +             /* Setting flags this late has no impact, but does not hurt */
> > +             genpd->flags |= GENPD_FLAG_PM_CLK;
> > +             genpd->dev_ops.stop = pm_clk_suspend;
> > +             genpd->dev_ops.start = pm_clk_resume;
>
> [Severity: High]
> Is it safe to mutate the genpd struct of the SCMI provider directly?
>
> Modifying genpd->attach_dev and genpd->dev_ops here changes the behavior
> for all consumers of the shared SCMI domain. Could this cause
> cross-subsystem state corruption or spurious warnings when non-MDLC devices
> use this SCMI domain?

This should be safe on R-Car X5H:
  1. There is only a single SCMI provider,
  2. If there would be multiple SCMI providers, the safeguards in
     r8a78000_mdlc_attach_dev() would still protect against bad
     behavior,
  3. pm_clk_{resume,suspend}() are no-ops when no PM clocks were
     registered.

> > +     }
> > +
> > +     return map;
> > +}
> > +
> > +static const struct mod_map *fill_mod_map(struct r8a78000_mdlc_priv *priv,
> > +                                       const struct mod_map_in *map_in,
> > +                                       struct fwnode_handle *scmi_reset_fwnode)
> > +{
> [ ... ]
> > +             scmi_spec.args[0] = map[i].fw_id;
> > +
> > +             rstc = reset_control_get_from_provider_exclusive(&scmi_spec);
> > +             if (IS_ERR(rstc))
> > +                     return dev_err_cast_probe(dev, rstc,
> > +                                     "Failed to get SCMI reset %u\n",
> > +                                     map[i].fw_id);
> > +
> > +             map[i].rstc = rstc;
>
> [Severity: Medium]
> Does this error path leak the previously acquired exclusive reset controls?
>
> If an allocation fails mid-loop, IS_ERR(rstc) evaluates to true and the
> function immediately returns an error pointer, leaving no mechanism to free
> map entries from earlier iterations.

True, will fix in v5.

> Furthermore, the driver does not appear to iterate through this map and
> release these controls during driver unbind or teardown.

r8a78000_mdlc_driver cannot be unbound:

    platform_driver.driver.suppress_bind_attrs = true;

> >  static void r8a78000_mdlc_unlink(void *data)
> >  {
> >       struct r8a78000_mdlc_priv *priv = data;
> >
> >       scoped_guard(mutex, &r8a78000_mdlc_lock) {
> >               hlist_del(&priv->link);
> >       }
> >  }
>
> [Severity: Medium]
> Does this teardown sequence leak the priv->scmi_clk_np reference?
>
> The reference was previously acquired using scmi_find_proto() with
> SCMI_PROTOCOL_CLOCK, which returns an incremented reference count, but
> of_node_put() does not appear to be called during unbind.

The driver cannot be unbound.

> >  static int r8a78000_mdlc_probe(struct platform_device *pdev)
> >  {
> > +     struct device_node *scmi_reset_np __free(device_node) = NULL;
> > +     struct device_node *scmi_power_np __free(device_node) = NULL;
> > +     struct device_node *scmi __free(device_node) = NULL;
> [ ... ]
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
> [Severity: Medium]
> If the jump to the fallback label occurs after successfully assigning
> scmi_clk_np (e.g., when scmi_reset_np is missing), does this leak the
> scmi_clk_np reference?
>
> Since scmi_clk_np is not annotated with __free(device_node) like
> scmi_power_np and scmi_reset_np, it requires explicit cleanup on error
> paths.

True, will fix in v5.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
