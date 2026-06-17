Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE6203ACF15
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 07:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781680628; cv=none; b=bls1v1I7TJfXXQR9DVpMf+xrf7lt4fjNcaEfQkZpabMNLutlrgfn44Rpa6KEdJxXSamp40y6KG3tvzE5byq+H2cAr/miTG0CasrUKDw+dbSlF5Vb9OTngnm6AkyzVoDlllr67Ucu646PRFjz6JcvrH5VbCd+b5ld9R/eR6GgrZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781680628; c=relaxed/simple;
	bh=+Q/X+Q2DSg+rq81utDjovW5AakD5MHld6hbZF6aXdkE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jnTpAzlH/f4D99pu0a1LdeHO0Q5y0xvoINk0dLXsBgjHjlkFX9ILO+C/9L6+qKQVV5Sx/ZPCo5AWVz6AumJavb1yPDMB03J8ci8rXbXzGTSrvn1btwIZuZ+eRv4JWJ2wV5l3iQeCeaoVAwtoT9Aidr/jy13DgL7T7n7IhLmAhCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-59be89d310aso488173e0c.0
        for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 00:17:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781680626; x=1782285426;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8u7Gki8p4EM6XMlf4misGHyXuNmTvOX4Ry5GM+DWUec=;
        b=NKBoI08qcMcKXDFqZFdHWVgz5Wm2dIOupjKjpmBJZ0BnUcS0NDFlC2wmCIj3MMdxtX
         XVHoYsDj+zIjB/o4P2BmqqqxNm6SoWqfryYdsQSrXKVDGx1xX2kPoz4ZmObTE7P0YqF6
         nWKBJ0lDgp/6yHMvJB+2/glPOyrnBz9rLjB18s4ly+g9gX+blsOCbN2XDyTCun+8Ui/j
         hXbmLONPO598phmSEdDU8/gknZHMeCCa0sSy4k9Zjibj8AxTWB0t0Hzdif+HmUcnd5Qd
         RtCtxPJxAY9WEui2ZQFOUZNnwVtr+Cq1PshjM0rAalfC3unIWA9ERPTj8TzCILmoqLDA
         iAFw==
X-Forwarded-Encrypted: i=1; AFNElJ/TbXREjhZtjfM3l7IU3df8gngPdP8capduL0sXdwzi+I6HGlJZny/g1VigO5ae2owQeLAPebu9UIDO@vger.kernel.org
X-Gm-Message-State: AOJu0Yxi0vfMAMTl820Vwqs0ZfMqKFNH2/vNYIv5ze9lzKmhXY4NFZxf
	g1XXKYGhxM8oP5g+PFJ6cAWlLRzRomXUK59VJh5Zr8xm7qTguXnEJV79hrcaUaBm
X-Gm-Gg: AfdE7clQ0AyDn7t1Nw6oFQk+VFq97wik50qg4/3J4eugSyoMckjBriMZBobjRKk2nO3
	r7g0w8OC4hOGYXu3wZ78weGAJWLMNbxnkNYP1qHzRV6w3VVvb6Xmz+FTLgCROTpH2hlh43CHsSm
	H7VgMQIhh6N8upQN1ES5cK8koqyVhBvzW93XFHXjI9H1mqOjzXEq5QFU0D1Uc/WMleS6ovJd4vn
	05G2POBL93EjkRBDdFbEch84slzH3zWSQx7b3XPkG+JZwyKCYlP9oxzrGKh73MkKJoxGUuB5mQG
	C60VTbEY9iEzUHjD8vYKKpmAU6zQOtl9js0nMChje/WVmrWnUEJ1DpJ6KyfRmGtb43KG0BO7gxO
	Rmgtx/kgKlrTRVLySBrZ2zy7xwuLOcYYnXRuBx+QFxcp8bZfcN9uA9zDzfrh9or9GtIdMEuqmlg
	K96u48/6tvC4F5XgG+yensMoI5+NStK6nfuM26gWvWw+8wVxcHcM1Zd5GbNi28+gQP
X-Received: by 2002:a05:6122:240c:b0:5a1:b296:78fc with SMTP id 71dfb90a1353d-5bbc107f60amr654265e0c.1.1781680625763;
        Wed, 17 Jun 2026 00:17:05 -0700 (PDT)
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com. [209.85.221.178])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5bbc6c7400fsm340077e0c.16.2026.06.17.00.17.05
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2026 00:17:05 -0700 (PDT)
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-59be89d310aso488156e0c.0
        for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 00:17:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/u0vC1oDYpaE+onY70bp7XFEdZ7nN5ZtAeaJ527/b8ZtK3dAt1FEbQwkJsyOsoX6g8BbH3vSKy30tX@vger.kernel.org
X-Received: by 2002:a05:6122:6315:b0:59e:2a50:39ab with SMTP id
 71dfb90a1353d-5bbc106a67fmr555519e0c.2.1781680625185; Wed, 17 Jun 2026
 00:17:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260615-rcar-du-dsc-v5-0-aed1a28610e4@ideasonboard.com> <20260615-rcar-du-dsc-v5-2-aed1a28610e4@ideasonboard.com>
In-Reply-To: <20260615-rcar-du-dsc-v5-2-aed1a28610e4@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 17 Jun 2026 09:16:53 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUGpxip_h1dCCQ1mdpW8m+hP_PjmjzVmyRpDUtGQWR0AQ@mail.gmail.com>
X-Gm-Features: AVVi8CcYLQHmYJC_gazcaRIfqz7y7D9l_HFtGh-yRcroThw0DCba9TthKbXFofA
Message-ID: <CAMuHMdUGpxip_h1dCCQ1mdpW8m+hP_PjmjzVmyRpDUtGQWR0AQ@mail.gmail.com>
Subject: Re: [PATCH v5 2/7] dt-bindings: display: bridge: Document Renesas
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

On Mon, 15 Jun 2026 at 15:12, Tomi Valkeinen
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

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
