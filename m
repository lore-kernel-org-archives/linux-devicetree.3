Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 594093E5A0E
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 08:04:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789373088; cv=none; b=afSgarHTO212Mr0MiXHX4SG1oSvtVNPNJmbb19Rbkg8Ml+3nOKiLrilQFghjH/o6lCdtNdSRmfWs/isHB5m0E2VAmc6R3VTCvX27yhTL4NAW2XFIBGgzVh/ZpKMwyEIoPQfHcREwfaRwAriNz3EHPYwp7omJY0MUZzBE10HJn/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789373088; c=relaxed/simple;
	bh=qOxCYMeZioIGCmh0MxrsIyGPyaOCPaAbU6O6uizTRQE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RrlA8SNHQPdQButvwPFY+nCUZOzJvb7R5za6S48lWjI5/W11BxKHyXIo3VgnI7AOGRGX8spbQmp6pyf43WCMH/epJu20V1IiQdLNUcD4JgooQBm5y6SoELTY9cvzn5VlzAlu1vqO93nL4X1NecW0KuVDOuZLvAH3BlO+FPnv6fw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-5c9851764a8so43115e0c.2
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 01:04:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789373086; x=1789977886;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=G2JcK4+UnTdYFj4YxjDgOg657J6kp6BHITWmwnB32W8=;
        b=dadIjfAoni9kpWyNTUTfhwSLa1bHplsMnvSwIhoENVfT53K2K65r4a0ksJYRGlnFzl
         uv+Ez3l1+ur1HYk+m0tWSKo2kO7zXeZNbYUD11GszoGN9dB0VSgDKnn5o+1CvZXkXsEk
         UEXg0NSFO1Fjm1GYcLq8jnu+aAS904Y9m6N5JHLGqKm3gk5dkTaWTL8N5kteiVALxz3k
         WeXyU7uBY6/7Dfqh+NWnsUg5EYACIzltRgu8EqHJrdsAj9nGxfiw2yAYlZAFvkcldiM/
         NuSy96gGcS+WJKje6EyZi+QOoscmh5H/5S8GY88RxYYFm2ii+sNOfbyTzjExyoWB8HB+
         Swzg==
X-Forwarded-Encrypted: i=1; AKwUvBwKX3NXBQ5FUidYtp++7JS46FSN0d64m2W7o8uFybRD5Y/MY/j+jyQBACibOJQH/4lBVBIBy5xX8D62@vger.kernel.org
X-Gm-Message-State: AFuF++nK+fkEOHd2kGUWLbXFVg/9NnJvSOpQwKLkGl0ni81j+DT2OsgE
	V9EsagZEkbErwUsZwfELwAnkHvTBx5GvPR86Nk8auDMckTx5XW193bsMI++d8Q6T
X-Gm-Gg: AYBFou2tWtoCOB0sG93LBjaYl0I0q+atz9XG5UIAgDcHKvjI1xEs6ZWgsi8kmFORJeH
	TspVNUfi8vexVPIqHsTCTXGKKcVEiAq319wqyoxTfhOhHtdACI8EKXBUlOzrZrDQQcgYg3FNtmO
	MZWXeITa70RiKf/y/0hm9Fr30GAccwznq0bB21tluh9wWKnyfbOkYkyo4kfb1nf4HHX4cYWFm2H
	97VfQHqZ434rC7N6XwcE9+nLqaiD2vpmlwYQA/FV4VUYA8qZrzg43hZu+0VlOCOXs644jIohzPP
	0As/T4B11wsRMDuSJm1Cnb/ePhMP0D5HRcJ11tWg8WPhz4JmxHU1v+WKJXFLHRyeXbOflVpqELB
	ZG5Gz9ECDaCyraa3X4eOOhgKlLTKwTgO83vpbwFEU/54r06d94BzFP8nf7+hthhW51Pq0kAHPxB
	Tu8XLb0UgCn8V0Kif6Sp2jWkyeJ482rYXBDEwshDwM0O2i8nMubPTCbyenMiceGMHpixMzOYbGn
	E49bamPeJpTmhpeIchR0wJu/nFbDAmlfk8hA/XVNHkMKhGaxes=
X-Received: by 2002:a05:6122:4f8c:b0:5c8:3697:9289 with SMTP id 71dfb90a1353d-5c981d6c271mr712492e0c.8.1789373086046;
        Mon, 14 Sep 2026 01:04:46 -0700 (PDT)
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com. [209.85.221.170])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c8470d661bsm11078722e0c.8.2026.09.14.01.04.45
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 01:04:45 -0700 (PDT)
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-5c663437fe5so1686451e0c.3
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 01:04:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBykONeKTWyFavQH38Ylhs3cb3cdC62t4wm4SUWmteVWu5MVGvYC2O12PneZAGWuedy3rUdPGJrp4jaD@vger.kernel.org
X-Received: by 2002:a05:6122:4905:b0:5bd:cb34:1b70 with SMTP id
 71dfb90a1353d-5c981a7ddc0mr603320e0c.1.1789373084860; Mon, 14 Sep 2026
 01:04:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260907-rcar-du-dsc-v6-0-f8ef711a7494@ideasonboard.com> <2489cf57-65f1-4502-86ae-1e3673899b87@ideasonboard.com>
In-Reply-To: <2489cf57-65f1-4502-86ae-1e3673899b87@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 14 Sep 2026 10:04:33 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWfmVHsJBtnn0sB1f6YwnVpQOY5coP0pu6qOsknc-XfaA@mail.gmail.com>
X-Gm-Features: AcwNN1UjvEXLwhrFNF_ZKWONSXtVIhmEHRxBRtfYrWrrOz2Bml4dSuA03jjsOBQ
Message-ID: <CAMuHMdWfmVHsJBtnn0sB1f6YwnVpQOY5coP0pu6qOsknc-XfaA@mail.gmail.com>
Subject: Re: [PATCH v6 0/6] drm/rcar-du: Add support for DSI pipelines with DSC
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

On Fri, 11 Sept 2026 at 09:07, Tomi Valkeinen
<tomi.valkeinen+renesas@ideasonboard.com> wrote:
> On 07/09/2026 12:29, Tomi Valkeinen wrote:
> > Some DSI pipelines have DSC (Display Stream Compression) IP block
> > between the DU and the DSI. Even if DSC is not needed, the IP must be
> > enabled for the DSI output to work.
> >
> > This series adds a basic DSC driver, so that the DSC IP gets enabled in
> > bypass mode. This enables DisplayPort output on Sparrow Hawk board, as
> > the DP output comes from DSI and sn65dsi86 bridge, and also White Hawk
> > board's second mini-DP output.
> >
> > Original series from Marek.
> >
> > Note: I see that not every run of kms++'s kmstest gives me a picture on
> > my monitor. Sometimes the monitor seems to be trying to repeatedly sync,
> > but fails, and the screen stays black. However, I see this same issue on
> > WhiteHawk, which uses DSI0 pipeline, without DSC, so I think that is a
> > separate issue.
>
> Pushed the first three patches to drm-misc-next. I'll leave the dts ones
> to Geert.

Thanks, will queue in renesas-devel for v7.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
