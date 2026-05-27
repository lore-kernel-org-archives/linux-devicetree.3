Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com [209.85.222.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B41783E4C64
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 09:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779874572; cv=none; b=WBiW5fmGqTRcQ4GNZDOmqCa2KAA+zWktLTodX1/3x2O+GlBcj4v4Y3EcSgbfKtnVapqUctCfiElrExfML/jY0KvRBzzedPVXp2O8ewvY8FEGrVJTmSat81sx4ymPFs43NA5RRLrh5vCEkuqxx8k+StmR9UhyYSewKl/tiTB1J0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779874572; c=relaxed/simple;
	bh=zj+g/ezhAtLOdlP5pufwUVnlw/mx7Nw1tJEnvJe2s7s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S0zOvZUSqzlff+rJX5ainEpmOErcvDklaiBEnN6Xu3N6jXS20SfXQbhvvBVKnqFj7Nm3WVGV9U8PXyJvUpJA4DEVlvamCNE8GhBPLhUSVrKmfkfljSfR1IcKXU03Nq7G3aGPBd1eHTBrrLVL+1KkxdBozn7wAP1q/SqgTp0JmYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-9617940274bso1742020241.0
        for <devicetree@vger.kernel.org>; Wed, 27 May 2026 02:36:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779874569; x=1780479369;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GzrbtAIhbhlWL39MAGAjbHYV9tAMPrYxV5QryhtJx1s=;
        b=UBGYZeVqIYUpK25YjOF3AZ+NIu05U52UauTgWbrs8XFXjXtKAXWFN9wvIqy7aGn2u2
         auszNbj5Gobe1cNBi/c20dyb/oUbYH6o9m24eF1xQ4V6a7AXrAArvfvf7IBhm7kpL0hM
         iylU49n9ZnNw35OigoLtwEBKoz2bcmNEhu7AmQ475Hladvog14vxlA0uzBM4Z2wC5V8o
         DA4t3HdLCNZfYFkg8ITu1scbev6bbm8ezY+eGLzNPhjZvxbsbqNEOVx4SxUkvLDC1z7I
         b+76BMpXZPC5mM+p7iP23NjOsyYO/GivCH8ql5A3ufHotxNqYCijWBczTznVx/IdMdMP
         0YFg==
X-Forwarded-Encrypted: i=1; AFNElJ/IsRwB4ieMRRRz4sm34Z21RW4X/XCdU9YmLoPZCZuPSwMaPkUE/v0H9Jnyw/uKfTc54rgs2hqU2gF1@vger.kernel.org
X-Gm-Message-State: AOJu0YzC7ic76dcafseyuPfQOiw1F9uBdatEhDLzex5exJMmGI+0Pty3
	Vn8kv2fAHvsVG0yLUgBi+9Kom7TdpbcziqPD4bzRGG8qwn7CVW8Dmb8xqk/kyzjUOYk=
X-Gm-Gg: Acq92OH/4fzhGQeMjACi68SHI/fG24t0NZ9+xIvdF2VU1pR3LWXUpkc4tg4z+1oFikl
	NwAAiNX4YqGo0zoWlgYBWcjyDyWnKrUEFZVw1RyYIoY2VDeEBKlZkVkZ3gyRNbxWU/tqSoeM4cP
	pI9lMIfGidADey93nWYVVC/H1vPkPjW1yLsLaGYEqePXITv1nHcKnqoHn6Pajykt35IPRKk9MgW
	a191S5uqhCMQQTXIhlKs7JZhUwotsRdR4Gfbob8QPFJ6JFYkrlI9+BIkYoLWYGXU1YhJM7+Los1
	YRgIkF0FBo0ULlUPxT6/JE7g+EPC6Pvrgr6xHLC5xiFq7Qw28cGthyWbvOvIDHYc7G/19LoQ07Z
	uiWySIDK5GSDFzQZ+UVcZI2+ZJpzM3ojUkoLRKNQ+nd1qmWxDPEk4PeMWAt34Rle+5GSv9ge+2I
	7U+n7+ZfdChHSIl1FR7cbgnV9huPtBFwmVCcUFmJOnT5Hq7UEtN64tOLuMz2NME/ZXm+vXRYnxE
	YA=
X-Received: by 2002:a05:6102:32d5:b0:5ff:c5c8:2734 with SMTP id ada2fe7eead31-67c805b5ee2mr10704591137.25.1779874569576;
        Wed, 27 May 2026 02:36:09 -0700 (PDT)
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com. [209.85.221.182])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-67fd8851f5bsm16055567137.3.2026.05.27.02.36.08
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 May 2026 02:36:09 -0700 (PDT)
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-58d2174a2b4so1487395e0c.3
        for <devicetree@vger.kernel.org>; Wed, 27 May 2026 02:36:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ95f4K5AVS5QVGb4HUUSeXr3nPduFEoEXWpF29UTMZ7pyAbGt8KQs5uSJqOAzlS6w9pmMUbkP8cNsLN@vger.kernel.org
X-Received: by 2002:a05:6122:247:b0:577:501b:a668 with SMTP id
 71dfb90a1353d-586616414f1mr10121604e0c.10.1779874567993; Wed, 27 May 2026
 02:36:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260522102251.1723392-1-claudiu.beznea@kernel.org> <20260522102251.1723392-4-claudiu.beznea@kernel.org>
In-Reply-To: <20260522102251.1723392-4-claudiu.beznea@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 27 May 2026 11:35:55 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUdrtRvefgvSZdM-Ek5At6gi-wRsi-9hqefoa4ij6meKQ@mail.gmail.com>
X-Gm-Features: AVHnY4LW6vUstLwsIKPkIzpK5RB63flO6CC_KxPAXPEps2GwX01GBBQiIwPKpZg
Message-ID: <CAMuHMdUdrtRvefgvSZdM-Ek5At6gi-wRsi-9hqefoa4ij6meKQ@mail.gmail.com>
Subject: Re: [PATCH 3/9] pinctrl: renesas: rzg2l: Keep member documentation aligned
To: Claudiu Beznea <claudiu.beznea@kernel.org>
Cc: linusw@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, magnus.damm@gmail.com, wsa+renesas@sang-engineering.com, 
	claudiu.beznea@tuxon.dev, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 22 May 2026 at 12:23, Claudiu Beznea <claudiu.beznea@kernel.org> wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> Keep the documentation for struct rzg2l_pinctrl_reg_cache members aligned
> with the struct member order.
>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-pinctrl for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
