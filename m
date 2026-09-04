Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81D0F2D47FF
	for <devicetree@vger.kernel.org>; Fri,  4 Sep 2026 13:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788527104; cv=none; b=IF4utaJWfoLB48vlmc/O8aCOK1VKlUQhpqwemR+3OTdZ41aRBckaF0v2ZTCIx7VI9eX1KaRfCJPbAKUFYssBffC2PrBQMWc71OjExbdQ0WXv5EpTyEg2vxAXwAa2VNVJ0xIyoZvXxi4WzKTY7vacMBXt2wtJ3+Xt3xXdYI2mH9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788527104; c=relaxed/simple;
	bh=9xSOtnR0JMeRis+2A9+69QPm6YPp5GCesQOz8P1BqIo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fsSsppGxElt4zR0asg8nBB/aQSgdVBLozfptn5ocVDU4yGxYITDQ+RhUmqCaecWlb+Dclr2Gq+NVaC5m3bluMEcK6+B+VMWYj74Sn4gurIJmX7s1MytEV9HFg9t3R7uDqiCfwz8598QRIlpa1ekQpxJ1qINb5rouN9pmmxSiEvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-5bfaa014978so472880e0c.3
        for <devicetree@vger.kernel.org>; Fri, 04 Sep 2026 06:05:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788527102; x=1789131902;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=RX5/AQcrp5g9z3JYNb5ynUUaEFHGVwH0550eIwcyIWE=;
        b=d2QiTDsuKNJmmmv4eIECGQ7epL2lkMlygIYLc6MTj/b1NJDeMxSEKl0jVx5ELnj+/6
         6LOJWTL3jhMHYLlx/c0CWlwwQ4d6DUG3jFomFoFKsndHXO0QKxzcD+ICxXeWGASqQ/ZI
         ae6ZvypSRCm0f9uQZYUt7e7Xr4mcX3MUBxzsCTVT7Vvphr8rQynEfcr2m7W8/DZF5nUv
         pwRNUsagMWVPMvD0OZpvMUE36LCzl8VTlNSP8QlXKmH8eq+A08qY/Cm9eq/PBKvK/uag
         8NMFNrboGuvnzpLNd+Tvp/zNl/EDI0PqL3ZeLw5KjV3yodRtny4jxvAhKAcVrlUJA3sq
         DZgA==
X-Forwarded-Encrypted: i=1; AKwUvByHjDx4HrQwxC3bWNi360CINjJ3IzT7Nm3FIZSq2YKEZGotx2Gylu1F0tYpaoF5Khqwzd0oAjCp4FV2@vger.kernel.org
X-Gm-Message-State: AFuF++mBMCbjacVX0iFCuD6nIL8VHuP6lgZT3nX5qTYmvVrhVaiq3Jrk
	yP35buklWXF8ffADmpFOZnDyY0LwShV6D8OESLz5ciQqwsP8K+8CSgXay7rIjeGh2bM=
X-Gm-Gg: AYBFou0lDk+Fkbu0JlpsYfdwQN9bU5algfSjAkp7WGdGI81xrP5KLhJan8xk44R6xZn
	KluFzdhxl1bghTEU04FJ8kGgoWUpgt/Wc+QT6vpkm2D0t1b2ecQ9dOP+qlsmNzOCOw3DvJXcNde
	9RKti+gK4CcNp0A4FlnyvEjGRcHPWoTAoZHkhc3MqxWWlHPoO3ehvTs5Wo/qZt79fQbrc/egWVq
	Bj+y+0VmHN5bqKueX6FrqVQqbZXOZq6igbLxbKDFVmYnyL4qjCJOLyDYqRSdEOgyh7J3YHMptee
	zcMcBV9MHCqnMOf2Uaj+oc2ma/7vgV2XZWDA3tMBnWZfu0KT7s28eZ+AE/aUH+bW3pqL92RyzWX
	U3GQwXBkq8PN4FrG5IAVsF81MrNcG/GoNl4MIQVy/MUP68Q1ItUMAXX0aHtBEgCAV43/Chk6iG4
	dZwd3N+n1DKjbsS+IwFxV4+qz3sMzsnXeaRRheofbepJQ5YT6Tn97LWf8Px39KbYLGVdNTBwOvX
	00CGP1Y/ngKKXFKJrx6cB/k+SPQNg==
X-Received: by 2002:a05:6122:8b03:b0:5c0:fb8d:9993 with SMTP id 71dfb90a1353d-5c7ed38607amr2381719e0c.0.1788527102233;
        Fri, 04 Sep 2026 06:05:02 -0700 (PDT)
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com. [209.85.221.178])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c7ebf559cbsm2049440e0c.0.2026.09.04.06.05.00
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 06:05:00 -0700 (PDT)
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-5bfaa014978so472852e0c.3
        for <devicetree@vger.kernel.org>; Fri, 04 Sep 2026 06:05:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBx9b8rhcgWBBiNeW9GG9s4eihhk2M443/LSGxjNbAPvHv3h4NSMExZ++4V0DX6IMON0VegVx/9QY/nx@vger.kernel.org
X-Received: by 2002:a05:6102:8098:b0:783:79ac:9dc3 with SMTP id
 ada2fe7eead31-78a4a880ccdmr1610149137.10.1788527100013; Fri, 04 Sep 2026
 06:05:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904125425.412632-1-claudiu.beznea+renesas@tuxon.dev> <20260904125425.412632-4-claudiu.beznea+renesas@tuxon.dev>
In-Reply-To: <20260904125425.412632-4-claudiu.beznea+renesas@tuxon.dev>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 4 Sep 2026 15:04:48 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXMyNqkuLbRuxjmAfx3K9uY2v4Bi3E55Oi83ty3183diQ@mail.gmail.com>
X-Gm-Features: AcwNN1WoMZ_PTeRAOvmLdFtKHfL1Mzb06YSXX-uH--FGhySrvI3MRJ8Z9p2r4tY
Message-ID: <CAMuHMdXMyNqkuLbRuxjmAfx3K9uY2v4Bi3E55Oi83ty3183diQ@mail.gmail.com>
Subject: Re: [PATCH v7 3/5] pinctrl: renesas: rzg2l: Unify the power source handling
To: Claudiu Beznea <claudiu.beznea+renesas@tuxon.dev>
Cc: linusw@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, magnus.damm@gmail.com, 
	prabhakar.mahadev-lad.rj@bp.renesas.com, claudiu.beznea@tuxon.dev, 
	linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 4 Sept 2026 at 14:54, Claudiu Beznea
<claudiu.beznea+renesas@tuxon.dev> wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> The previous code handled power sources using a mixture of power
> source specific definitions and lookups in the available_ps[] array.
> Unify the power source handling by introducing
> struct rzg2l_pinctrl_ps_desc, whose purpose is to describe a power
> source through its power source value, associated register value,
> associated capabilities (e.g. Ethernet), and associated IOLH index.
>
> Introduce two new functions, rzg2l_ps_to_desc() and
> rzg2l_pwr_reg_val_to_desc(), using the
> RZG2L_PINCTRL_PS_DESC_MEMBER_TO_DESC_FUNC() macro, as their
> implementations are similar.
>
> These functions retrieve a power source descriptor based on either a
> power source value or a power source register value. Other functions
> that need to perform power source specific operations can call them to
> retrieve the corresponding power source descriptor.
>
> The register values for the soft power sources were kept to zero since
> they are not used across the driver's code.
>
> Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---
>
> Changes in v7:
> - collected tags
> - dropped 2.5V voltage domains for SDHI and QSPI

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-pinctrl for v7.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
