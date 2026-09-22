Received: from mail-vs2-f12.google.com (mail-vs2-f12.google.com [74.125.227.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78435479867
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 09:17:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790068664; cv=none; b=q25FtlzGWTQVHBOJgyZBidZ77+DE8pWN91m/x5vgYD88GurJ9578eZTAGDixjrNDufVBEydrWWv5y3vuyO3OUlU9pgfmR23M0ZkHCDA3vHmBZA+4mn5NZGkJKkz4kUBig3K8V5niUXsKsJloqg17ox+ku8p/RM1yDsplXP3GkjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790068664; c=relaxed/simple;
	bh=CZ3oPkSBqFVLdsQgqxzEWOijGFMKadDxp1f+3SNDcts=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EMW7IqJLZc2ltM7wVa/LczgI3ZcZ9702JQG9Y95oG+9vjJ3OoQuhnJ3HPiBtm/uehqkqweh+uCjNwY8hrzxpFBWhJmhc5DZH3a7Nu0sKPal+doNkpCzyZ7rPGn3BXlm6RE1WWl1DoiYo31F4tY9mfTqB0AHx5tiJsC9taB5VZD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f12.google.com with SMTP id 71dfb90a1353d-5c67e2ff27eso3044129e0c.0
        for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 02:17:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790068662; x=1790673462;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=oT5SmnnEiCJkeSE3HgFIBSVwvA/3E4ZeuxsouiwktnY=;
        b=zV1QaH4A/56gzoG77BNxIHKfZzlFta8QndRjrE7vQvhBN7cyoU3i6/E3hngl+GQWqY
         YbxJFa0qvS0Hd0yCCmbuElC2M3RE+hYw8f/i8Wm02G2qf2wxMzICag3nDKP9QE18b0ou
         jVeYyW5irz+FAww86tTit9KsA/ZCS7GwSxDoNs9CFbrG56qrR7awK0gm50eAQ9dmPuhD
         hO3tH5WZj91a+rbbCDZTfKKLEcekS4jDGxtXrJ1ewJu6WN/NqM0nfeEH3Dh1bha5CaN4
         rDQLOtaRx0dy7KKHWccdYnl/0PvRQbIMWU2flrzLPB/H0WzNpN3IfQ+Alb71H7OqbttU
         P7cg==
X-Forwarded-Encrypted: i=1; AKwUvBxDdT0K5jop8GBSXK+PSWAOv6fs2/eXm0LWeu55M2umx7C4iaHuube45m5sVkbeU/NWEH6GndZku7ME@vger.kernel.org
X-Gm-Message-State: AFuF++nNgmdlkhTSaF9gxODrzSyj6pqNK/3EgjdgoiqGIMgToKXiYO6p
	n0WRF+gEcsOcbGc9r55EFYQB8+Niiv09doVKjuOl3oc5n8UGyBniQHGsJGJZsihvJRU=
X-Gm-Gg: AYBFou1LQsO0zcRA+tfQ1ceIWtjVH2XmBHTIq6zDNke0Y++Oz5yle4cqXGHhp3VwYMQ
	SH77JaWiHkXNZOqX9iRyR39nppG+A3qNqD8BaZ5IzpwjAcyL0WWUWx8Q67X3BRFB/tcJOfuSTvt
	1B8lKUB+L2rscJfy7mgusdf/nvv61MKHW7JO/uLXPvAbKlPaZQJ+xobNYfkORL/G4q6psdaFG5f
	NpfZthg5r/rxX/D9ozo4ipm3eZPWuUprHKHVW99dm8QPtOaAPOM1h/jk5Yn0KXYa/6hoJEk3bVx
	SzkJkgwsWUUR+NX4Q8j0s5/zyvEmikF0hHUUHUtgeJepjyUauIioilXP3L7UTZD8H+g8Zo/LX2R
	IdXvRJv99HowmMuIbyP602I+sBGykx15TldZKM/Hs+an1psNkdbjKVNxP6WC0RnUwlQeEYxq9Rq
	9YjDkgtoaRp7UdW18G7b3mav1FUmprOFG/7CKY4GCNGldDk5VWMF5V0n0P2A3V/BkqG3uhANmZb
	mXcQjiwtEWp4WvPgCItzzJRwJDo0IxkJptl4Q==
X-Received: by 2002:a05:6122:1c02:b0:5c9:a60b:e5a5 with SMTP id 71dfb90a1353d-5c9b59afdc9mr7606052e0c.16.1790068662290;
        Tue, 22 Sep 2026 02:17:42 -0700 (PDT)
Received: from mail-ua2-f12.google.com (mail-ua2-f12.google.com. [74.125.226.204])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c9e7d09aa0sm975692e0c.10.2026.09.22.02.17.39
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 02:17:40 -0700 (PDT)
Received: by mail-ua2-f12.google.com with SMTP id a1e0cc1a2514c-97eaa1155b1so2060040241.3
        for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 02:17:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBz6aIBnqgrP7mtOgp10CY61KIF5XP6glOSlPP4HHLy0NFtt7u1TUC2+FTG9jajhvxkpc13zfUmUrzZ3@vger.kernel.org
X-Received: by 2002:a05:6102:1492:b0:7a7:198a:c2b6 with SMTP id
 ada2fe7eead31-7a7198ad381mr4988859137.30.1790068658957; Tue, 22 Sep 2026
 02:17:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260910-rk3588-dts-rtl-eth-describe-dt-alias-v5-0-c1b9e5f10cd6@pardini.net>
In-Reply-To: <20260910-rk3588-dts-rtl-eth-describe-dt-alias-v5-0-c1b9e5f10cd6@pardini.net>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 22 Sep 2026 11:17:27 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXMjxgj+pT5A=jd_A5BVQctHXJqeiU4EhPA_ZSANZAAmQ@mail.gmail.com>
X-Gm-Features: AclHuK9pjyjJZh6DYzu8j0CaKCcKmJ8CfBcbQ8aIBw9Bf-OTlVvyy4dIW39Xywc
Message-ID: <CAMuHMdXMjxgj+pT5A=jd_A5BVQctHXJqeiU4EhPA_ZSANZAAmQ@mail.gmail.com>
Subject: Re: [PATCH v5 0/7] describe RTL8125 PCIe NICs on Rockchip boards (and
 add DT binding)
To: ricardo@pardini.net
Cc: Heiner Kallweit <hkallweit1@gmail.com>, nic_swsd@realtek.com, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Sebastian Reichel <sebastian.reichel@collabora.com>, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

Hi Ricardo,

On Thu, 10 Sept 2026 at 22:08, Ricardo Pardini via B4 Relay
<devnull+ricardo.pardini.net@kernel.org> wrote:
> Several Rockchip rk35xx boards carry on-board Realtek RTL8125 2.5GbE
> NICs whose PCI function nodes are not described in the DT. Describing
> them allows for stable ethernetN aliases (matching the GMAC alias
> convention on these boards) and lets U-Boot's fdt_fixup_ethernet()
> inject mac-address properties from its ethaddr/ethNaddr env, so MACs
> stay stable across boots and U-Boot and kernel MAC match.
>
> Tested on a NanoPC-T6: /sys/bus/pci/devices/0004:41:00.0/of_node ->
> /sys/firmware/devicetree/base/pcie@fe190000/pcie@0,0/ethernet@0,0 and
> u-boot correctly adds local-mac-address property there which is
> correctly picked up kernel-side:

Have you tested this at 2.5Gbps? With which firmware?
I am asking because I have problems at 2.5Gbps using the firmware from
linux-firmware (on a different platform, though)
https://lore.kernel.org/CAMuHMdXPAeHoeaQbM9rXbXukoMbFV+0k28n6sRMw8XF8720WUA@mail.gmail.com

Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
