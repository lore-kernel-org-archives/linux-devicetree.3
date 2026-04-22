Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5138532D438
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 11:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776855853; cv=none; b=Aim8oGYIo4Y4nqAXjeDbQRY98E+WcAm36v9zZm89immtQHhItQABQ29b4MQ0vK8JOjqY9QLDhN2sO6CgK3+lcTsIrqxn7p9kczBmtQeUnWbUfTEsYRerzv6Luvtn5y5P4dCrZ1w0ZIgx4aZMGalXIIUAHc1GcPfJg0NniGfxsV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776855853; c=relaxed/simple;
	bh=+kKnoE3X5myIN/x98gvTEBRPP0ds1FM6+RV8J+/UXuA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XltE70FW2yYx3c61I2OVdNtzdlU/Beufsb1HNpTPTMtNe2IzcO1OC1MBuTMSpB1KomwEmJGWZxucNoj8uqWpkZyTWb7GwT668dbWAI4fpo7yOTRfYoE6Cy5109Y+7O/cFCyJh25dcSb5aT7Xc7Ota3jkMBmthl6T3Ku+7OO/WOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-56dfd007d31so3349819e0c.3
        for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 04:04:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776855851; x=1777460651;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PAq7sn6tmrcy4Xrh4FAud6hbxe2HMMl+qUt+pq72w94=;
        b=qlPeG7NwbF8l/U6w7yHJQyh4l1lGTbvBRrVCpbb59s8n0xkKcEjENXtpd/7VJBN9Ke
         OigCb8xhebTW8rjLX8A5HZo9uWVgJpcap8w/cop8YTLVyjdRXtD/tbPsfZaOJx06xdfi
         m8f1czdy9FBS9V9jjByf9u895ZaGjVS7zIFTsWZpzGYfooZQrDHEmCqr0eQRIQ6kHzE4
         TQ3JxZSooYQv7pT0LFDGuSxde+vynLBIKzU7r97+hsl3JXlSxvrpg5iLjATHS9C35vmc
         EQSZ1wz3GdudB1wAoacw3LMzXyULN9E2vsHVrRzmkXWvGLX6xdyC7jNVw6Nj5X+T9zTr
         H1jg==
X-Forwarded-Encrypted: i=1; AFNElJ+hRMd2ONRWORkjMm77DumEu6hHCpOqxT2CmOoq124E1cw0F7r0x0rgUJwe5aZA7JQWZxXHZ6XjC3ju@vger.kernel.org
X-Gm-Message-State: AOJu0Yzm3UOXSgPlG3nduxUk34UpKgT6DaH2Hb/HeSYOsYFQ9MSPnBmN
	po5GC/F1Bm9Q2SxMTRNhpUljQmwFGHDoDYp3lw5Bb7pY4gvzoRZg9HlvzvBt+LEnjgQ=
X-Gm-Gg: AeBDies597G+Mi20kOjGpENK1DSzIjDADsdJ0CXNj9LJrKUirmkDGJa+Iz2r4uwie0F
	m8gm3ksl8iovWYXlejkRPqUzWJqV0EiGMP5NJbm4kKVReHRP+pMn7XvTd3oWwZSHLE6OR/g8tyl
	ttB6DqXsoA8lTYq77Yil/2ug6T3CWwQ4AqObPbma1B//ZkwukNHv776Xca5r6Vdw+HTHfFADo/6
	HmiNGIXeR0ntumUtPY7nyQ7mn7irY2EnIJCSTpNtYQS8aMmP9OUcSdsNF9I93oX9f+wYALlPez2
	eq7hO5/2xq9nSskZA0O57BruX8OPjeXT/QkwrEXdS0GRyj7HmA+649mtcODE5lOEAXd3QFzUyT9
	hdtSwmL1tNCIDy+el75qFbiVOkwQ1k9f09znPCKsoiQZyD/ptydKwbnywm2o3dP1eOGMPQ4ahYo
	Q0QlMq47ho4mee6sp2Ibxp0myA7qE1/YUithIsOBKDUiyjwSwCkKE8toE3WGAde238GgLlqSCbu
	E/CuOnTD5j3hw==
X-Received: by 2002:a05:6122:3408:b0:566:354d:9f4a with SMTP id 71dfb90a1353d-56fa58132d4mr11658117e0c.1.1776855851106;
        Wed, 22 Apr 2026 04:04:11 -0700 (PDT)
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com. [209.85.221.182])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9589097ec5csm7585267241.4.2026.04.22.04.04.09
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Apr 2026 04:04:09 -0700 (PDT)
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-5675d609621so3946127e0c.2
        for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 04:04:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9Jr0yUQyBk/G8cm3LCLq09nwWR6ZiER0FTzJqP17TA/pWifxvmnBSZ3iHkT6Q6/bqXq/Pz7L4738NH@vger.kernel.org
X-Received: by 2002:a05:6122:e253:b0:56a:fcbf:8aa4 with SMTP id
 71dfb90a1353d-56fa5811e9fmr11350501e0c.2.1776855849546; Wed, 22 Apr 2026
 04:04:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1775575276.git.tommaso.merciai.xr@bp.renesas.com> <22fb9a500cdbc3272dc23cd5e36bca5fbbec75fc.1775575276.git.tommaso.merciai.xr@bp.renesas.com>
In-Reply-To: <22fb9a500cdbc3272dc23cd5e36bca5fbbec75fc.1775575276.git.tommaso.merciai.xr@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 22 Apr 2026 13:03:57 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWDZ98dTwEu0ErX+0eiauNUwDQcWxxfrD=pSo2wA61Cig@mail.gmail.com>
X-Gm-Features: AQROBzD1uypvoBrb0e6rgYJ6ENObDj8jwDEQe2Y8m7CIn0z6EpqWaIELEZXNRQo
Message-ID: <CAMuHMdWDZ98dTwEu0ErX+0eiauNUwDQcWxxfrD=pSo2wA61Cig@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: renesas: r9a09g057: Add #mux-state-cells
 to usb2{0,1}phyrst
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: tomm.merciai@gmail.com, peda@axentia.se, p.zabel@pengutronix.de, 
	linux-renesas-soc@vger.kernel.org, biju.das.jz@bp.renesas.com, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 7 Apr 2026 at 17:35, Tommaso Merciai
<tommaso.merciai.xr@bp.renesas.com> wrote:
> The renesas,rzv2h-usb2phy-reset binding schema defines #mux-state-cells
> as a required property. Add it to the usb20phyrst and usb21phyrst nodes
> to fix the following warnings:
>
> "arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dtb: usb20phy-reset@15830000 (renesas,r9a09g057-usb2phy-reset): '#mux-state-cells' is a required property"
> "arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dtb: usb21phy-reset@15840000 (renesas,r9a09g057-usb2phy-reset): '#mux-state-cells' is a required property"
> "arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk-cn15-emmc.dtb: usb20phy-reset@15830000 (renesas,r9a09g057-usb2phy-reset): '#mux-state-cells' is a required property"
> "arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk-cn15-emmc.dtb: usb21phy-reset@15840000 (renesas,r9a09g057-usb2phy-reset): '#mux-state-cells' is a required property"
> "arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk-cn15-sd.dtb: usb20phy-reset@15830000 (renesas,r9a09g057-usb2phy-reset): '#mux-state-cells' is a required property"
> "arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk-cn15-sd.dtb: usb21phy-reset@15840000 (renesas,r9a09g057-usb2phy-reset): '#mux-state-cells' is a required property"
>
> Fixes: 6a1b6f7e56dc ("dt-bindings: reset: renesas,rzv2h-usb2phy: Add '#mux-state-cells' property")
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-fixes for v7.1.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
