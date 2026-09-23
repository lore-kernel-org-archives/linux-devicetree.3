Received: from mail-vs2-f42.google.com (mail-vs2-f42.google.com [74.125.227.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A418D52122B
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 15:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790176292; cv=none; b=Jr/XugH+zXIdTtwmKXNj+jRxgY9bcRWe8JgBO4rMQByd/z/ZxL5yKVbhdg4zgNZDcAgOpMbxUwMPVQ5CYQJu/ph9gzV0tQpJ9GfJpzKpBAd5QIQdjxDN7QYIiSgy8xXjkzaPb1UC2LLChc9TciMuJOjF34BK7BveXfNTyrGt9q0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790176292; c=relaxed/simple;
	bh=pZ9PpJiZh12Hwh/7XmEn8qQxKjkEk7eQcjPzfGPj1DY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o9C08XSm3S8DtMpILO92myfBH7+rqLtfQ5JCucn8T0JQqLXYWAMpu71WXkZRtIscgoCxvF3cWd9JTzkfBj3pj65keF6p52e9ankXso9bukni7nNaoZ5Gd/l0m2KlQ20HzLGCDMYMWwbR/zG3Ge4awcmfV/NfA7ybMk9urfEC0g4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f42.google.com with SMTP id 71dfb90a1353d-5c98e194227so439233e0c.1
        for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 08:11:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790176289; x=1790781089;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+skuiLYw/IgGtWcdd1NJ+Hgm0E875s4yIqfpBxdBYoI=;
        b=bUauV7T+ZbJoQVaKB9nUe7pMYmFMDcb3wVoZ9+WmdsNmNBbLnEbJppzur7X93QdZP/
         bZwnDnvs7I3ztai1lyCfYUa5/yS3gRKvk+4asvuqbsvZ/OdlAcmOw6woWHskCxnDHr1w
         JxvA866LPUordbzETviVIe9LGuxufk81OHdHIf6TN13DyXAdhPuF4Ugw3PkX/wtftBu9
         ztGfqh8GNELTSoirxr0ZUbEDVfrq7Y5Wuy0M8M4OeIgWDAQxsp9NCeweA2q6B7EtUfAZ
         ewBvZE501pf3jxKRUS4ZZm0txRDAtzG8FNPud2aJexMo0OVJ5YCzR5gs+Frr6K1xj9oF
         CprQ==
X-Forwarded-Encrypted: i=1; AKwUvByW5c4Fn4nkXtjFX/JOUXOmPEyA6z0Yw7Iiel/nyrf04mWEfRFZgUyRFzIwvrNYcoy1Yuh5a9CATIE0@vger.kernel.org
X-Gm-Message-State: AFuF++kv690vuLo8+FlmWbbzHrucznbu5ZiJ4TdWejSgmfB0ipFOZntO
	A/GNDUXViHl2vG2lj+5nDf/2tM4H4ffpxhmu/rkIu+Aa2RDCXQiYWpmh3VyKNzUuCaI=
X-Gm-Gg: AYBFou1lMuH4SRdUYVVGF7MCsWkFkHFSQdwM67LwbD+MfC8A++nNLJkgHx3du5Lxw73
	zYL1tdwuBdSn2joTTzNOU+X7vAlJIwmkYj3OMbf5CVGv0VKRPLrGYJ/MHPyZNes0yxtqNTq+S/5
	N4C68zGul7vWiP9MWFiPZ0L1i7Ho3lBhuMcu1eGgExdmfAbf2ft/OmColStL6BGo4qIMbpbmU0T
	PL9PXvmsZRhDiB0Kx7NsQwBSQ6JcT4ZziTujw4RKLb3t69ZuRNmcb4oyTReS0LWiVeNW6ffs1Ym
	G5MmQi1Bqfzlc3EH3/04t4c1yHw3iSqDJMn+Qb1kL1jLjUgTHLFY47tO2jSpv9xa6lKknmkgtCN
	IMJd/0+XcmQ1sHT3qqPH8a+nJ708g6Vdjc1ZUrMX40eIUxs8TjhSbTvh5l5TgmhzyuLe8ihViC1
	BwXbpLK7U4GQJiKZTxvqTw2Gvc9VeQgL1JV0kifJFRxDcNsiEtDx/OQJpDICvz54QZh+geQFqUu
	h17i6Z/uPiYo8Y6SVQWX30aIOdZH2H16Ncvip1h
X-Received: by 2002:a05:6122:e266:b0:5bf:889f:e7da with SMTP id 71dfb90a1353d-5c9f15506c0mr2773818e0c.2.1790176289476;
        Wed, 23 Sep 2026 08:11:29 -0700 (PDT)
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com. [209.85.221.169])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c9f053a418sm3284584e0c.13.2026.09.23.08.11.28
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 08:11:28 -0700 (PDT)
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-5c985f055b9so1161697e0c.0
        for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 08:11:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBx7Q88pNBGigIMZQF80iyIZSdY0oqF3Z32Wx9oBGJfli7pyuumaUGvZO/K31gFO5vOQkIlLbc2aYnFz@vger.kernel.org
X-Received: by 2002:a05:6122:2804:b0:5c7:c898:9817 with SMTP id
 71dfb90a1353d-5c9e3481de1mr6395425e0c.7.1790176288382; Wed, 23 Sep 2026
 08:11:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904-rzg2-sr-boards-v8-0-94c4674927e8@solid-run.com> <20260904-rzg2-sr-boards-v8-11-94c4674927e8@solid-run.com>
In-Reply-To: <20260904-rzg2-sr-boards-v8-11-94c4674927e8@solid-run.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 23 Sep 2026 17:11:17 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX4K8GbT-=qUzWTdhq4bayC3ktE1F+X+z2XnXDi9vCAfA@mail.gmail.com>
X-Gm-Features: AclHuK8E9qilobRH7fLrZ_B96xKE8A0mTA3qi9_owW1vdBVZD4FYLc3dsbXINdI
Message-ID: <CAMuHMdX4K8GbT-=qUzWTdhq4bayC3ktE1F+X+z2XnXDi9vCAfA@mail.gmail.com>
Subject: Re: [PATCH v8 11/11] arm64: dts: renesas: add support for solidrun
 rzg2ul som on hb-ripple
To: Josua Mayer <josua@solid-run.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Benjamin Bara <benjamin.bara@skidata.com>, 
	Linus Walleij <linusw@kernel.org>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Jon Nettleton <jon@solid-run.com>, Mikhail Anikin <mikhail.anikin@solid-run.com>, 
	Yazan Shhady <yazan.shhady@solid-run.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 4 Sept 2026 at 13:56, Josua Mayer <josua@solid-run.com> wrote:
> Add support for the SolidRun RZ/G2UL SoM [1] on HummingBoard Ripple [2].
>
> The SoM features:
> - 100Mbps Ethernet with PHY
> - eMMC
> - 512MB/1GB DDR
> - WiFi + Bluetooth
> - SDHI Mux switching between eMMC and Carrier Board
>
> The HummingBoard Ripple is a reduced version of HummingBoard Pulse,
> featuring:
> - 2x USB-2.0 Type-A connector
> - 1x 100Mbps RJ45 Ethernet
> - micro-HDMI connector (not usable with RZ/G2UL SoM)
> - microSD connector
> - mini-PCI-E connector with SIM slot supporting USB-2.0 interface
> - MIPI-CSI Camera Connector (not described without specific camera)
> - RTC with backup battery
>
> The carrier board is identical between RZ/G2L, RZ/G2LC, RZ/G2UL and
> RZ/V2L SoMs, yet only the RZ/G2LC combination has a product page [2].
>
> RZ/G2UL SoM shares SCIF2 pins between on-SoM Bluetooth and carrier
> board. Provide dt overlay changing pin function from uart to gpio led
> control.
>
> While the variant being supported here is named "Ripple", the overlay
> still carries the "pulse" suffix as it would fit all its variants.
>
> Descriptions for eMMC and microSD are shared with G2L SoM and
> HummingBoard IIoT.
>
> [1] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/rz-g2ul-som/
> [2] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/hummingboard-rz-series-sbcs/hummingboard-rz-g2lc-base/
>
> Signed-off-by: Josua Mayer <josua@solid-run.com>

I didn't compare with the board schematics, but it LGTM, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
