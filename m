Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F1EC3DA5A6
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 08:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784105936; cv=none; b=hyhaGEaN+/Q8eAUnPzxJ8pOhpxPowcP0BMHHwDT7xQX8og8J5hktT014FD/t9liuOl2fxFnwa1dYABCzbeKW/8x6Yhgty9unY6pZO42rFjOneLEUSTi5lZq9ZJgXPI98MzaW4eggXbnktvQQSCUR4CmaNuaQ6gkVXO3YhuD17Kg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784105936; c=relaxed/simple;
	bh=cd7DBG096VF7/MN3QhC9fHqLP5wSJXhCQl8cwkt8dzE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mBxcBecM3xEEr2VpiGi2vZVvDrUVjcO31BJw2len0uh4BWZNeuuKEsXKkPoFXBwO6vCxU01P6CHxJpxcyOyA/C4jlT0CVmcBx5gdY/0OMD7JrfKa9ei5CeJMbZAC/ZaB5Jqe6v+5+A+ypAsnd2QbzKJar4lb62Hj5n46AQ/y0Aw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-5bfaa014978so1744678e0c.3
        for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 01:58:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784105932; x=1784710732;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Em+8fgb0ygi1i2LhSV0Cm1ShdIUU1QDIn9O8w7QaQ/k=;
        b=beJOa4jXLIOEfsNOPN2sS1sg6h+kxjEvFP1HDfdJshq+jwl3j37zbzTp5gHZ3q2AW/
         pmpPBrTa/+g/OJuodF8w8k3GA4Saj2KzKajt+/XxvYaBC1ElpeH/ZD03V7pRyPWBHJIE
         AXp329Lw9fVPtoiOQiFfFCyAP36Shu2uN5MEBDValJyFegnI3wH8Cd+fc9ZPkdqJ/YXo
         bwrjMC7Gqq4AeGWyW1Up3lWPvrbrdP9TU23VkSn84OIz9aPt1d5SRDQKB0TThlt8kJFT
         fYiYJRQEM/AXJoTXa+bk6JSf7zoSrfh4YjghL3vDyBDU6J0Ha19ervROAD5LzH2uiORQ
         j2qg==
X-Forwarded-Encrypted: i=1; AHgh+RoEx5SX1EhGBCADyPGwBfrCHx3BcOy86SBfDBvFUFNqN7i3yUWi/Db4ZEvoHdVURiXh6+WTzIHNgnXz@vger.kernel.org
X-Gm-Message-State: AOJu0YysMerzgGEd079UxF1YBh3FTU6WMOdQ+0lLrP+9HvGzPiSiU1OH
	tj3ieCzJjIY5PztJgjjb3iY792/N6uFdhq+9hyL9w4MjNiirvCQNEpVfhB1vEO+QieY=
X-Gm-Gg: AfdE7ck9+Aeg+FVq7FTd7lNsUof2LkVVxdjpcubcfDMROM08SoVx0GVGDTbRsK9A4Xq
	KJXaVjQh76IAniXxV6sXS7yTZDqjZk0T2+WGa0mpXnhztPoD/SGZwd8nzXkuw2B9Kr1ms739Ec8
	bSjb0oWQ5bvMBRgTLS3zryz5mSdJiJ/pzGCC8pFb4Ht+Oc/0w5aW48t6SvHK82OzjS8FJl7kq66
	27+032i9tdIov9qJHlikGyu15HRUXnfnKzaefpoLE/WKem6RHWsQLlWDnanveKCQDRaCmCHWH8C
	TL5+lSjcnUfxnvLcfa99PxSem/tPkkwarBQqVzG0kGaWNI0eRvD3YAto299iYKm0S3GExtuEoPb
	R1CLNse042jFk8pSWL+SqkOp4eQBpOLu0jCuTh7mEq4dnE+gMO7AxoWF9vjWTY402ZQK3kOFHel
	kRDCOLKObtHAFoMuPnu8gowFSuadL8iycG6f3/MQqFW/FkzdP95odXOA==
X-Received: by 2002:a05:6122:546:b0:5bf:ab99:ea89 with SMTP id 71dfb90a1353d-5c10ee42832mr3435511e0c.12.1784105931579;
        Wed, 15 Jul 2026 01:58:51 -0700 (PDT)
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com. [209.85.221.179])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5bfc75d4e77sm6771044e0c.16.2026.07.15.01.58.50
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jul 2026 01:58:50 -0700 (PDT)
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-5bfaa014978so1744671e0c.3
        for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 01:58:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpvyOldgcM3supmbWuJGwKlA9doXDJpbgKTwleVtvKagfcnJjfmBFuWmVYZRpGxpBoIzLTAaT/ezB6U@vger.kernel.org
X-Received: by 2002:a05:6122:82a9:b0:576:c4b:460a with SMTP id
 71dfb90a1353d-5c10ed0389fmr3961224e0c.8.1784105930097; Wed, 15 Jul 2026
 01:58:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260714173315.1981708-1-claudiu.beznea+renesas@tuxon.dev> <20260714173315.1981708-2-claudiu.beznea+renesas@tuxon.dev>
In-Reply-To: <20260714173315.1981708-2-claudiu.beznea+renesas@tuxon.dev>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 15 Jul 2026 10:58:38 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUgvwjb7zNnsRXX9AzaUVAhVmks4yU5P+pJ0in6NyA+ww@mail.gmail.com>
X-Gm-Features: AUfX_myYPtAhsLzqsMqdAVX_MCR49rN5A1iR-oDlp3d9aq2XNRWC9ufPlL95oJQ
Message-ID: <CAMuHMdUgvwjb7zNnsRXX9AzaUVAhVmks4yU5P+pJ0in6NyA+ww@mail.gmail.com>
Subject: Re: [PATCH v3 1/8] clk: r9a08g045-cpg: Add clocks and resets for CAN-FD
To: Claudiu Beznea <claudiu.beznea+renesas@tuxon.dev>
Cc: mkl@pengutronix.de, mailhol@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, geert+renesas@glider.be, 
	magnus.damm@gmail.com, mturquette@baylibre.com, sboyd@kernel.org, 
	bmasney@redhat.com, biju.das.jz@bp.renesas.com, 
	fabrizio.castro.jz@renesas.com, claudiu.beznea@tuxon.dev, 
	linux-can@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Claudiu,

On Tue, 14 Jul 2026 at 19:33, Claudiu Beznea
<claudiu.beznea+renesas@tuxon.dev> wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> Renesas RZ/G3S SoC has a CAN-FD IP. Add clocks and resets for it.
>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---
>
> Changes in v3:
> - none

No need to resend applied patches.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
