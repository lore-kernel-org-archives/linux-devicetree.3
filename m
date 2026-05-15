Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DEAC3EE1C2
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 08:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778832476; cv=none; b=QEA94AUKJzcPvEApiCkoRrXOupN03sWfQCqbzVUlLmSjY1jWgBPLk0I0b6oW5WnKGOm6puqYs+94zNHgZn58O+OxCzPSy1LFHMTc4HERrUz/yhgEuO3usTwNsw8Taq/xdWBI+XYKiZUAUPC3LJ4tjTk16X4mFxzZ7RCTmO/yEBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778832476; c=relaxed/simple;
	bh=li6NXU7sST/n8eXTPpy/Kpdi+fuxsdYH6rwtrEYDBl0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XmxTyqgNPDyPISjob5T1VqSuyeTGIZw97/JfXs5bKi0zfzlXf9qSklpqGyPPrgFQ+HLgLRxpOxefOnXTaFhlcMVEWJjYHDrMxQzTcunW4UDf5nmGmxyfU85GFZv6HnxEugzUfhaua31PGMzf1byrx5683u+Gy5/2vBPJ5tV6g38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-8b6dd874471so116047616d6.0
        for <devicetree@vger.kernel.org>; Fri, 15 May 2026 01:07:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778832474; x=1779437274;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mk3+gk0uvDvPr4J0ZYYOynNFHdcw9MrgwNKr9DcQAuQ=;
        b=cFPNM5cVmUFS1jGcEbIM1DSe7GlhhzXJsEjutsJsZ91bClxADzRf2EO2hXSRJiF/1m
         dVpnobbWkpb0h6LLBy3dmlraPmEQlVrocLSH2yKfawkAEnk4IjB+qj8+xSH5CeA1xm4l
         sNVrM17hEn0Pen/+/+uIeLsZM3K8eUhGR50KRCQwPFgs8QxOEUEPH6nPQ++0EESNBRFq
         bwQG8ypZ0Dt0JiWW3pwcLyqbnZBwtYT6uFqF4UFLvjQLUYtwY58TrgiNYrKI6paMmIDy
         X8WjyaLPeQabb/tqkPbi1ZevmgNtCNWZMrCdy3hNwR5jNfq/F2XoeCHXnVzZ3JiAl5wR
         56hQ==
X-Forwarded-Encrypted: i=1; AFNElJ+XGmXD+Sco6d8QkBDn9EZ/kcEs+1BLVzoowD2g52weDFlIHKUpo50jvyJNcOVNL8zRJwnJhoWRaGsZ@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6Jsl83d2McsCDyNrPWv63AiZ/e7JbHoo9AlnjQn3wSNfJBxSp
	VZzVkWPN/ex3oDgSjn2Tap+1jE0597YuRVHZqoZUGbzWgw/lp8TpJ5udfOOtfds/
X-Gm-Gg: Acq92OEgLIh7hcTZp6kNKoL1IsG5ZLfd3heWTQduycQHHNW3ifT1R61sET1bP/E879Q
	u/aZoyHcgSgkxiBaHOeDGm0qRPlLzzgqzskFrCebPbXnaxOLIkYezm95cc1sCYWQaoUyP62bW7i
	s5Fk6GismOqDNmy9brLGqe+SfV0qSlIC3UoIpGf5cYqYo6rGbwgwTNwAz7vL3fk7cLTZ/yqaOzY
	w9eAasaDr6ptBSRf35AvDi6VaIEB2bXvVyomN2nsY4bhsYGNS6gi3DtfUxw5ITzKc0y9bz92/61
	+d8FsztCqmE1w/C3mJxpF+JmVgl9o34btC+/jQbS7Dg57yclhI+mnjaepZfJARdlrBpaiMgCPyu
	3mnFNHLepxyrrulEps9keORGc8zPjIQ/Ko4Q6GhWFoZcTyInPds2eQODxwh4BIGtkZQnQgnYIwp
	EBpKmdMGw6SadC48kX8l6hlUyaBk81C7DBkxcfo9cdjBUzbAuUC3K4L+LgkCP/+RwX
X-Received: by 2002:a05:6214:601b:b0:8bd:c9ca:7b5c with SMTP id 6a1803df08f44-8ca0f6e4e26mr44584956d6.44.1778832474297;
        Fri, 15 May 2026 01:07:54 -0700 (PDT)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com. [209.85.160.180])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8c908f0601asm48326616d6.17.2026.05.15.01.07.53
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2026 01:07:53 -0700 (PDT)
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-516389a9b70so22374451cf.3
        for <devicetree@vger.kernel.org>; Fri, 15 May 2026 01:07:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9zNyB3RPeInL8+qIs96cMGoo0/ptPB95rer4nzBjBsiDxhCTobDFy7f2UlogPAz7POL8IRZVvkH39i@vger.kernel.org
X-Received: by 2002:a05:6122:ec7:b0:575:44b3:300d with SMTP id
 71dfb90a1353d-5760c0528f5mr1639450e0c.10.1778832080852; Fri, 15 May 2026
 01:01:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260515-rcar-du-dsc-v2-0-f6b9240a1240@ideasonboard.com>
In-Reply-To: <20260515-rcar-du-dsc-v2-0-f6b9240a1240@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 15 May 2026 10:01:09 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU_HF-L+KrMNTUMO0_ukfVJE=nZLjoadFFWf0qDopKs8A@mail.gmail.com>
X-Gm-Features: AVHnY4Juo1yrSdWSEhGd8PIKGe45raKjJnOdNJywoBplErTdAE8Qpe6uxcK4nzs
Message-ID: <CAMuHMdU_HF-L+KrMNTUMO0_ukfVJE=nZLjoadFFWf0qDopKs8A@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] drm/rcar-du: Add support for DSI pipelines with DSC
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
	Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Tomi,

On Fri, 15 May 2026 at 09:56, Tomi Valkeinen
<tomi.valkeinen+renesas@ideasonboard.com> wrote:
> Some DSI pipelines have DSC (Display Stream Compression) IP block
> between the DU and the DSI. Even if DSC is not needed, the IP must be
> enabled for the DSI output to work.
>
> This series adds a basic DSC driver, so that the DSC IP gets enabled in
> bypass mode. This enables DisplayPort output on Sparrow Hawk board, as
> the DP output comes from DSI and sn65dsi86 bridge.
>
> Original series from Marek.

Thanks for your series!

Now we can revisit "[PATCH/RFC 1/1] arm64: dts: renesas: white-hawk:
Add mini-DP output support", too?
https://lore.kernel.org/05e43f61321b4191d5f97dec2349facd4b56c899.1729240989.git.geert+renesas@glider.be/

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
