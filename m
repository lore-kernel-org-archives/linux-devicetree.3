Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8881B3DA7FB
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 09:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781515821; cv=none; b=VJGD43uDwDNYOpvBKRLmw1col77r4ul2i203pTjhazHFq0xCRMXX7KBHc3Jf12RaGZ4Nt9imUjXWwu/B6dbETcT7c1oYUzSGVxwJTKT+ytq7O6ZksAZSx8vTxOIQrOtDfOdtq+ZTNMcCSzPUor8Oer/Ca0Gdy46yNoT5YEfnvGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781515821; c=relaxed/simple;
	bh=cokh81Cx7W15QrHxXBRjalQp7kxTMzsuksUx0kqLiGU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IsozHZNJPuE+eXJqBAresnvQfoy+25E3IG8cKiO+M93RhfQzgUaZwypTKt1KMbmD589nJUibVDNuzz1KyR/407Pv9yUdhU2A9QXOxFBr44W4AAxjn2Gyn7Isn+draJnDOvr8neEWr+4TgXm62QeUc9ObBVHkj2KYb3sHCXwbFBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-5175eab3a93so25724241cf.2
        for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 02:30:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781515818; x=1782120618;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ekHktY4/Tubvm6BgE1BfS1UNgz1F/icrKZN3pNx8f0Y=;
        b=J3DFUk7fw4o/k9XqjMqSbd/09fvGHRw6YEtv6NHSRc7tCzjK93TtWuYwWPrRbSN6Om
         ZC+g65os8jQgSCxgerihyOwvgoSja5Mjzd2D6AibDDE0/7UIJB7eFpWdyChtf/pGHiUQ
         npwBQqHsbnvXTTMR6O9sbFJKyjC3KnhMq4Mi0kujEhC8k0HMXDKvpBm2KT+mJqz4xFsj
         2V6QXXTZuBw65fo33GPh5YtJYy6HdZjhgCXGc+k3OPYlAAA6c4NxKMJOvhlmPqlcfDb/
         b60IX9U9coFFDhadPcDcj1+0Eh3ZlKnal2ZZk0gdTk0vhaMqMIypBpKEXzXZiR904NBD
         5CeA==
X-Forwarded-Encrypted: i=1; AFNElJ9aA10WwwNa/22noWACnDzdRr+ekgh2ryIX67vy8o3LSL6gOB7RfgtsNuM3Tp5HU5K5EzReU/WcopIB@vger.kernel.org
X-Gm-Message-State: AOJu0YyldiIf4sqHQjfsY77Bev39491Ioae5EUd2ryxQ4Tj+Dcif2H9f
	k7krXGxO/AiA7HYYwC5L7BvTdioAoZ4y3dxeWE8mZdFn74OUpj2lorJ8ITRvjjhD
X-Gm-Gg: Acq92OGiia5W9Mf3uPnyDYbf7cNE0Pq1J2XOoJsEopCCLqNUMFvY4kmJfSVQFIkUvrj
	3b/KHD7nM2Rh6su9dx6Kvqn2NfslQSDKA1PYt+8hUCsN/L5R2Udb39Wm+NlW1mUdIh0LWtFmCFs
	onQIMQ3RWxkeK9AozWIy6uSAx44Lx5pnsdpJ8yzkasGptYccfqnmMWKl3MBN/Pe+GPQXC+2+7Vb
	EyNEDt43hiKrVkLiKowBCm+6UAaOW/k1WQoOtPwJ7FJgH5qEcLVUQ5dsCcnZbcWyz8coidX1RjD
	D9w9HQmbj7SBxFp1MZGHWfFFFSi/gWLSseBx0GD1G6aHv22J5dIfNGbH4iqwEhmG9Ts78ZlXDde
	wviZ5f5Eqh7Ev+100oM9cWiKb6ff6C1eKuJb4SaaX/T6qqlYe1OhhjM+OrUhE6t8KIYnNcqi5iB
	QUc4XX0sN/Zzq+RjOeRVBXa9lbaprmyEzhNTN82Safad+L6F8b7I4eLMC6awQKfl8O
X-Received: by 2002:a05:622a:894a:b0:517:8aa7:4aaa with SMTP id d75a77b69052e-51953552d55mr112568001cf.39.1781515818080;
        Mon, 15 Jun 2026 02:30:18 -0700 (PDT)
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com. [209.85.222.178])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-517fb6442d8sm102109261cf.11.2026.06.15.02.30.17
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jun 2026 02:30:17 -0700 (PDT)
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-915b5ce94c7so337732585a.2
        for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 02:30:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/y9cwvF5/KJUC5lUyFNgxzgl/iWbiSIcfgwNdCarExG0zPHUd3STO0GveGyI8LP+oTE3O5iZBc0/uu@vger.kernel.org
X-Received: by 2002:a05:6102:32c4:b0:6c2:e290:cc69 with SMTP id
 ada2fe7eead31-71f60e0fc5bmr5388435137.23.1781515508903; Mon, 15 Jun 2026
 02:25:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260615-rcar-du-dsc-v4-0-93096a1b56a3@ideasonboard.com> <20260615-rcar-du-dsc-v4-2-93096a1b56a3@ideasonboard.com>
In-Reply-To: <20260615-rcar-du-dsc-v4-2-93096a1b56a3@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 15 Jun 2026 11:24:57 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVxwvDmRqsdbA_ReCnnaDWbzzTKGCXw-64U-bSJfgiy7g@mail.gmail.com>
X-Gm-Features: AVVi8Ceq73VEJddOjmb1j9jjrYgT5rbGI4-mYSdD7C_MYewqPqxZACymjTcgJ3U
Message-ID: <CAMuHMdVxwvDmRqsdbA_ReCnnaDWbzzTKGCXw-64U-bSJfgiy7g@mail.gmail.com>
Subject: Re: [PATCH v4 2/7] dt-bindings: display: bridge: Document Renesas
 R-Car V4H DSC bindings
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	Conor Dooley <conor.dooley@microchip.com>
Content-Type: text/plain; charset="UTF-8"

Hi Tomi,

On Mon, 15 Jun 2026 at 08:28, Tomi Valkeinen
<tomi.valkeinen+renesas@ideasonboard.com> wrote:
> From: Marek Vasut <marek.vasut+renesas@mailbox.org>
>
> The Renesas DSC Display Stream Compression is a bridge embedded in the
> Renesas R-Car V4H SoC. The bridge performs VESA DSC encoding of up to
> 8k or 400 Mpixel/s .
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> [tomi.valkeinen: fix the example]
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

Thanks for the update!

> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/bridge/renesas,dsc.yaml
> @@ -0,0 +1,99 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/bridge/renesas,dsc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Renesas R-Car DSC Display Stream Compression
> +
> +maintainers:
> +  - Marek Vasut <marek.vasut+renesas@mailbox.org>
> +
> +description: |
> +  This binding describes the VESA DSC Display Stream Compression encoder
> +  embedded in the Renesas R-Car V4H SoC. The encoder supports all DSC1.1
> +  encoding mechanisms, configurable bits-per-pixel, resolution up to 8k.
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - renesas,r8a779g0-dsc
> +      - const: renesas,rcar-dsc

Please do not introduce new "renesas,rcar" fallback compatible values,
unless you are adding new support for a hardware block that is present
in SoCs belonging to multiple (nowadays I would say at least three)
R-Car generations.  The DSC is only found in R-Car Gen4 SoCs, so
"renesas,rcar-gen4-dsc" sounds more appropriate.
However, so far R-Car V4H is the only R-Car Gen4 SoC that has a DSC.
Even the very similar R-Car V4M does not seem to have it.
R-Car X5H has DSC-functionality integrated in its DisplayPort TX
controller, so that seems to be a different implementation?
Hence that rules out any family-specific compatible value for now.

The rest of the (system/core) SoC integration LGTM.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
