Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792427588;
	b=GNbjXTLaaG4Lz4JEviXN3w2HLBBfmL4B8HRRF1MVxDxq+WK82HPSJSofjuDeTnZohW46
	 eilippRlXKybZfLzwJQkPmPSefKAZjqbUBpT9+L3e0vt3xOuVPdF1CnMWyB3LEku+Y/7m
	 0W5xZsOK8zADz6ONgqmwZSIv+23+lLIaXcyhMvItr8HhSf8qAuAlUU1Iih0mNaOhLaQ1q
	 ZLE72UiIkh5vZL5epswOwsg/lPlSduaE+elMP9UXhh3amuOeeo0SETd3taHUK9mk7dOi6
	 /46HR6xWhOf/tt4Uu2tTITAD13hDanCgpg7q1Cgb04ZDzeLc0DMoOu05qfL7csCqBhw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792427588;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=Q8KL6LGvq0FwHTPovYus9FfkhDMRIi4bd+XQz8TiIQM=;
	b=U6a4mnPUEaLYLvzoen3lb306vMYr0nZ6PUmBcy8Tw7pshcKaHWQGYYIHfnOlt3CYwG02
	 YEy3+QkBH95wX0X/GfYQFFaF94h7NkLHJDkwBLyo17aN+ny0DYT3AIZqJSfv5FcisK3G8
	 7Q4YTl72Cdt3dF+hBz0Ccy2NQWudx0IsbsGEO1Y77/jgDcu0dqwoa9ra74vOtRnajlmGX
	 PlAgaKXCt39fd7vmK6HanHz5w64xYGfei6Ff04GqeHTWDLsgfbbV61NEPqN65v3B33h5C
	 GUJMBo9n1p+VRu/76D+aur0T52iplG7naZgSNdoj69aLSA+eYeCG99gzd0vSc22sQqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.218.52
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35327606A31B
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 16:33:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35327606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c414e5d282eso264182266b.1
        for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 09:33:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792427586; x=1793032386;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Q8KL6LGvq0FwHTPovYus9FfkhDMRIi4bd+XQz8TiIQM=;
        b=WPJN3sCOLEltkfrkL1ZaIohbAIvvgMuYtSx2CewlOyZzYwK2G5mmRdY+gKTg+8VXlv
         lA2JFnUYeLnm6dVDB/M6l6eOXiBtUEdTMT/DgUibPgiBbYPo8wkJlDEbyNAUbHDnU3kI
         7S4A4bYKluocY3ISLlIzUgRgg1Km7TgTtohvw2JVJLusC0CZOeUKKehPrhm4vIRh5iNv
         ZbIMgicJrfo8oI97KAsbiIXuK+0zwvRp7oO1dr2li0nWJyp5ADMw/kzfnkeqwFR3rgI+
         +kZaNzIDhIDjf4NgykbCUQw1XADsQDuZEgo9pUJVuA3Mv9kUzzAkKnXiTpIg84voTwkR
         FbCA==
X-Forwarded-Encrypted: i=1; AKwUvBwpc7MA/ku3D/uB+AyF3hw9YvcIB/dnGmrR9tlQax21+vWBsv679YeKt3GApZSWRAyHq6MhWv8On/oj@vger.kernel.org
X-Gm-Message-State: AFq9FYL74hwlAW1Cd4EEbuMxtrIwjRZHw4fo+0dedHHmxfokRBX4Lyrn
	UmMa5LGvX0ROqYTqPKynDOlgbq3Rjzl1zlAE6k2PPO59V/XU7BLzefivzckk4ckeH0c=
X-Gm-Gg: AYBFou2kyGyYwZrKiFQMwxLnL8veQ/1EEv+2EYHPoOBBkdO6zBNTWMoPYgyT0gQ21Vy
	Wpwk6ne3gWENcsgYhiLeEvW2f9Kpc+JdqtC/f4uNpjy5YzCvr5OQqRAr9ln0nclx+Eys+S+izT4
	3bMh2KdNzB14Aikjzx7VdlzV+Iu1NpBBxf4aonsJIixQC1tPiFRI1tr0hnRcaDy/fAFfRdjJyqB
	AQer5c/laLGVSsggtexVo+vP37eXgXeZwPZbgS3f5i8Lzja33LAoDIMLWpJZW/2YwAueeYu8sIm
	n/SbcrOyWQzdLNxVhJ5UB2GPnTwwAJeySYtwhkAYOLVSf812CiyKGC6NFIBn5Xk00VbzCevgj0l
	qAbm7VNwVEW10xhMZuf6oF7bpQbhKvL88oq6JEyosuAmh3WqI80Yl4RbrP45/OrFIaV5FHkhbHx
	adSzcpA04RH0rVz/we9zfas1apfxvyfZcm0eWPXRuezTO0YM1qDol2w6A/4cKqj6yiJ0ehw1iUf
	1eibCKaKZ1I/OH16ZrwemaeylppHt3GIWg0HuZixgLvVzZO
X-Received: by 2002:a17:907:3da5:b0:c29:f5d5:5a97 with SMTP id a640c23a62f3a-c419f31bd1cmr592439966b.33.1792427586363;
        Mon, 19 Oct 2026 09:33:06 -0700 (PDT)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com. [209.85.218.43])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4091eb2f64sm374013666b.77.2026.10.19.09.33.02
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 09:33:03 -0700 (PDT)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c414e5d282eso264172666b.1
        for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 09:33:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzYcuS7jEKXdMQ0+4L4UWh9G04ZyIL4w9HxqFf2EutVJleg8r2ZKgnyY85r4BusI6T+kOqdRtl7T4K8@vger.kernel.org
X-Received: by 2002:a17:907:944c:b0:c40:6ed9:b961 with SMTP id
 a640c23a62f3a-c419a05c502mr618122766b.5.1792427582507; Mon, 19 Oct 2026
 09:33:02 -0700 (PDT)
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
 <20261019160545.GC3705@killaraus.ideasonboard.com>
In-Reply-To: <20261019160545.GC3705@killaraus.ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 19 Oct 2026 18:32:48 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUTz3BR48_Y8_UR9PEjLuavHtN-4uaEKURtqRXFBO0uUA@mail.gmail.com>
X-Gm-Features: AclHuK84fhnixZiNIMOwb9AdAvJEMnIe-A6l4ZZgkoIEEk378oR8Z0wb7zPZzKY
Message-ID: <CAMuHMdUTz3BR48_Y8_UR9PEjLuavHtN-4uaEKURtqRXFBO0uUA@mail.gmail.com>
Subject: Re: [PATCH v4 5/8] pmdomain: Make genpd_get_from_provider() return -EPROBE_DEFER
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Ulf Hansson <ulfh@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Kevin Hilman <khilman@baylibre.com>, 
	Vinod Koul <vkoul@kernel.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	=?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>, 
	Sudeep Holla <sudeep.holla@kernel.org>, Cristian Marussi <cristian.marussi@arm.com>, 
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Laurent,

On Mon, 19 Oct 2026 at 18:05, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Fri, Oct 16, 2026 at 05:55:44PM +0200, Geert Uytterhoeven wrote:
> > Unlike provider-based look-up functions in other subsystems[1],
> > genpd_get_from_provider() returns -ENOENT instead of -EPROBE_DEFER when
> > the provider is not found, thus not supporting probe deferral.
> > Currently this is worked around in of_genpd_add_subdomain() by remapping
> > -ENOENT[2].
>
> But not in the other functions calling genpd_get_from_provider() and
> propagating the error up. Have you validated that no existing call
> stacks will break ?
>
> > Fix this for all current and future callers by returning -EPROBE_DEFER
> > instead, and drop the no longer needed remapping code.
> >
> > [1] of_clk_get_hw_from_clkspec(), __fwnode_reset_control_get()),
> > [2] Commit 18027d6f392ee8d8 ("PM: domains: Make of_genpd_add_subdomain()
> >     return -EPROBE_DEFER").
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> > v4:
> >   - New.
> > ---
> >  drivers/pmdomain/core.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
> > index 964e44c2f78f1d55..88c886814a5b9da3 100644
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
> Expanding the context:
>
> >               return ERR_PTR(-EINVAL);
> >
> >       mutex_lock(&of_genpd_mutex);
> >
> >       /* Check if we have such a provider in our array */
> >       list_for_each_entry(provider, &of_genpd_providers, link) {
> >               if (provider->node == genpdspec->np)
> >                       genpd = provider->xlate(genpdspec, provider->data);
> >               if (!IS_ERR(genpd))
> >                       break;
> >       }
> >
> >       mutex_unlock(&of_genpd_mutex);
> >
> >       return genpd;
>
> The for loop seems to imply that we can have multiple providers for the
> same node. In case a provider fails, the function overrides the error
> code from -EPROBE_DEFER to whatever the first xlate() returns. That may
> cause issues for your use case.

The code has been like that since its introduction.  Technically one
can register multiple providers for the same device node, but one
can never safely remove one of them, as of_genpd_del_provider() just
considers the device node, and removes the first matching provider.
So I think someone just didn't like nesting curly braces, and tried
to be smart ;-)

> If the of_genpd_providers list doesn't expect multiple providers per
> device node, I would change the above into
>
>         list_for_each_entry(provider, &of_genpd_providers, link) {
>                 if (provider->node == genpdspec->np) {
>                         genpd = provider->xlate(genpdspec, provider->data);
>                         break;
>                 }
>         }
>
> to make it explicit.

Will do.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
