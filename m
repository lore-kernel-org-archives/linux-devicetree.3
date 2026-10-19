Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792427283;
	b=fwtgZ8+pi/i3F2O066Ngpf/H2PGV1zZ+N4tIPoE/5Xle+ADqgD9nasetGTJxuCt7IcUy
	 j4LiRaFncKO3NWrH0GMNjiynkYTW0yNUGwIH8qfccIboiEmkAm1QMaR8cwE4PZmLupOFy
	 D1HIrmMmxlW1hNvR/slvpze8y85hIFISBIMGtk8ZaiT/ugZV4WoWhzO5oofPniTF/tYcl
	 6JFhadaKVQYJMcfPfPiIW5BZ3jD30cWnKvfmQfWwoc0dfhqGk3aanvDaCLa6aDbf/2f+H
	 6mM62YDfd6XVrtP7rTSSVcyfGuRBgzlL2bddOmiRvgRLW8Hx5BvhzFRJZbbU88JN3Zg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792427283;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gmail-Original-Message-ID:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=grtW76dvtFb1t9XrerLmKdj5qwyowpPAeH9vnpYNVM8=;
	b=Gb6/TWKxoZRiZgSWm397JciZmmKkk7D+Hlo+O69b40KKKTna8Z3AZQEaSbPFPlajEwmh
	 kLq8mczGhvF6ImCGDDqCe2L5kjdYTmnQWCnOOwtKeLtOFYhzlSVFiAkSKgv7fkdSividz
	 11JGEHvVcCQnhIrSQU6EcZO1WOtqayE57rTdcIX3SVXeHe9owcEAXoGXbiA2Stfn2mWIa
	 4V3RAgMFab05oQl8YE3z6XDtyPkpDyLQM3tlEkKwOIySrTY1eaJLbkVlHjioYy2OsXtwr
	 xEF7XxYE9UUoVFItP6APVx0aezdvV9B2aKnpLRvTNV7G2q0hqvjKuQVHUsl+TrEiJ+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.208.46
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 029FE606A31C
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 16:28:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 029FE606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6b1ab2ad719so3384979a12.3
        for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 09:28:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792427281; x=1793032081;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=grtW76dvtFb1t9XrerLmKdj5qwyowpPAeH9vnpYNVM8=;
        b=2BcSDfVziQetobYeBwbVo7/JFbzbGzqwcNvoH3aKFsF56DbM4MJXl7QPI+cZ7VBAkj
         9pYwzAHgBHJesbLkuIWpLUodyRRMEChE1FvUptWk10vxynjRmAM5cBInQtIuE76PCbdo
         oYf5ndcb9o/CnyfFW1E4pDQtPjhOCCneVKUtQ7hxlE/73RJbUJB0ayw/w84myrYclOMX
         myvBWUoNcn+urRyirtPp9+GfprIc8q+zHPEwfrOUQ9DVkNhuO20TwWaP1xyrF+36cNhs
         dvW4fZCqBOT0MZY2W/KYia+LJQppmT8yk5piEQ8oJoc9JrulE52bO4pt/UHXWn7kmrbk
         g1cQ==
X-Gm-Message-State: AFq9FYKy21PaVQCgNMyLjFwg+yZkzhDz5GalEa3qj8cNObYQG0WYqb95
	GHqJKREjlCQaL7hhusio/kcjh8q/2FbtNYhd+xQUlgJ29Wo4HPokH2RLKBgl+C6qwNY=
X-Gm-Gg: AYBFou0czyejeGyFxyPR2jGs1GhcCUU2HGICHeQplQBvOrKAYkiUsyQPkjCFstmxThS
	nmLPYMoU9y5L5jEQNwLxilWg/QPk39S6uHxRrxkmlg5yK2ALAdwdEypEDqQ79LaPXHpg7ELQdV0
	jhqqVB+RY1p6hw4L3TG/EFx4hoNHAzXlPY5K5boGiIFB0YiudR1RfndS4GEvRqckEqmxDQGFjbm
	X+d8a52AFELfUwTiFmljh1EZpUq2Qpyq7nysV5Fpt6NmlMOWH6sC9BHhAFY9RvTp4ESneRXzJ1C
	3iKMnt4Y6u9tpPsV2myUHTlLyrZMH/3mtzLw9JXhE37BpTY/edmGnBweqThs3CGHBjy6oulym1w
	4z40DRMbCxkIn7y4BuRpp0HVHFb6eAtPVCNfzonMRs/qpAHblq7eJAVC2oxZAvygJpwEJlXCRMc
	+X58THQXg07AhJs4QRaBTLIP2WxQlxDDzpskYi2HU+zicuF9MgWA0hUupEnW4xSsDNCFPP7U7jH
	HcYTKbBra8bFtQrJws+2wFYj+XWTY0FiEIU
X-Received: by 2002:a17:907:c510:b0:c2d:bae5:27d9 with SMTP id a640c23a62f3a-c41a01f4977mr580165466b.46.1792427276673;
        Mon, 19 Oct 2026 09:27:56 -0700 (PDT)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com. [209.85.218.47])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c408e32897fsm384962466b.2.2026.10.19.09.27.56
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 09:27:56 -0700 (PDT)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c3fd91337baso303704966b.3
        for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 09:27:56 -0700 (PDT)
X-Received: by 2002:a17:907:9486:b0:c40:f9ea:7387 with SMTP id
 a640c23a62f3a-c4199c63fd2mr604034966b.6.1792427276005; Mon, 19 Oct 2026
 09:27:56 -0700 (PDT)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1792163045.git.geert+renesas@glider.be> <4524363679c1f2163aca3b3dda2bfbde170d095a.1792163045.git.geert+renesas@glider.be>
 <sashiko-outbox-174605@kernel.org>
In-Reply-To: <sashiko-outbox-174605@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 19 Oct 2026 18:27:42 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWT=9-GCt6pr3HT6C_=kxe2ud1y2jjXPZBH9MjcDYjB+g@mail.gmail.com>
X-Gm-Features: AclHuK-zFCPihodw8HUR_tYnDf84w30NySJpayeqxb6wS60EuVgB6NNWocEAZa4
Message-ID: <CAMuHMdWT=9-GCt6pr3HT6C_=kxe2ud1y2jjXPZBH9MjcDYjB+g@mail.gmail.com>
Subject: Re: [PATCH v4 5/8] pmdomain: Make genpd_get_from_provider() return -EPROBE_DEFER
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, linux-clk@vger.kernel.org, robh@kernel.org, 
	conor+dt@kernel.org, wsa+renesas@sang-engineering.com
Content-Type: text/plain; charset="UTF-8"

Hi Sashiko,

On Fri, 16 Oct 2026 at 18:09, <sashiko-bot@kernel.org> wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] pmdomain: unnecessary probe deferral on invalid domain index
> --
>
> commit c105920d803c0cf9396fb90d8428fdc4d83e8655
> Author: Geert Uytterhoeven <geert+renesas@glider.be>
>
> pmdomain: Make genpd_get_from_provider() return -EPROBE_DEFER
>
> Unlike provider-based look-up functions in other subsystems[1],
> genpd_get_from_provider() returns -ENOENT instead of -EPROBE_DEFER when
> the provider is not found, thus not supporting probe deferral.
> Currently this is worked around in of_genpd_add_subdomain() by remapping
> -ENOENT[2].
>
> Fix this for all current and future callers by returning -EPROBE_DEFER
> instead, and drop the no longer needed remapping code.
>
> > diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
> > index 964e44c2f78f1..88c886814a5b9 100644
> > --- a/drivers/pmdomain/core.c
> > +++ b/drivers/pmdomain/core.c
> > @@ -3021,7 +3021,7 @@ EXPORT_SYMBOL_GPL(of_genpd_del_provider);
> >  static struct generic_pm_domain *genpd_get_from_provider(
> >                                       const struct of_phandle_args *genpdspec)
> >  {
> > -     struct generic_pm_domain *genpd = ERR_PTR(-ENOENT);
> > +     struct generic_pm_domain *genpd = ERR_PTR(-EPROBE_DEFER);
> >       struct of_genpd_provider *provider;
> >
> >       if (!genpdspec)
>
> [ ... ]
>
> > @@ -3276,7 +3276,7 @@ int of_genpd_add_subdomain(const struct of_phandle_args *parent_spec,
> >  out:
> >       mutex_unlock(&gpd_list_lock);
> >
> > -     return ret == -ENOENT ? -EPROBE_DEFER : ret;
> > +     return ret;
> >  }
>
> [Severity: Low]
> Does this change leave an unnecessary probe deferral in __genpd_dev_pm_attach()?
>
> If a device specifies a valid PM domain provider but an invalid domain index,
> genpd_get_from_provider() returns the specific error code from the provider's
> xlate callback, such as -ENOENT.
>
> However, __genpd_dev_pm_attach() still unconditionally routes all errors
> through driver_deferred_probe_check_state():
>
> drivers/pmdomain/core.c:__genpd_dev_pm_attach() {
>         ...
>         pd = genpd_get_from_provider(&pd_args);
>         of_node_put(pd_args.np);
>         if (IS_ERR(pd)) {
>                 mutex_unlock(&gpd_list_lock);
>                 dev_dbg(dev, "%s() failed to find PM domain: %ld\n",
>                         __func__, PTR_ERR(pd));
>                 return driver_deferred_probe_check_state(base_dev);
>         }
>         ...
> }
>
> Could this unnecessarily delay boot and error reporting for devices with
> permanently invalid PM domain IDs by forcing a wait until late_initcall?
>
> Should __genpd_dev_pm_attach() be updated to only call
> driver_deferred_probe_check_state() when PTR_ERR(pd) is -EPROBE_DEFER?

__genpd_dev_pm_attach() doesn't care about the actual error code,
it only cares about error or success.  Hence a change in error code
has no impact.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
