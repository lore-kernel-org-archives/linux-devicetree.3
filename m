Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795625790;
	b=G14Dv/ktIT1L/0EI1cb5bQDf8Yo36KY30ATa3tGhtfvNaO0JCIxl98dLXyuSC5Bme4r5
	 Ixank8APBznX/qCndePi6FDARIhmLLNF2Jqxb+Kc7P5oeFttjloP3UXVBYv82WIa953mu
	 sH6zPEPbwsV2OYQtR128LadFPMnb7ueYfvHo1kRk96MoixgoR9+EPXSsgNi/R16N7S+/I
	 vSnaEDrtErVWDBFcfzXNrMTynsFjqso0oq+ZCYRSkGmF99KLHCK9+6AztVJb/S+JcwzFL
	 +j7PX1qE8IhQaa7kkVswIcl6bw2ul5k+4EanoBa8Td4o8M/fe4/jTT926zLKwFU17sg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795625790;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=/KcILltQBoAou7W2+XQ9IkERjy/Lp2MpSgOSIAqYW+I=;
	b=F/NzThelLl9Hdy94+6CV+a3fWDyuksvdeEx8d9+gaqV/eagrCJJ+TrclRcijONhG16T7
	 a+8i72syIloUcuZmCXRTlB+YsdBz7NO4DOYut34lS8askwgzakrVsAvwQmXU5Dnj3uUWG
	 IhwVzAv6ctoGeqVfOhc264UZGpHRmSUrE/6ROHudszGrXVN89ipVXb4Zz4bDpRWqt6jrd
	 Dih+JwheSe+vxYnUy3lXYBYgh4eUdmbEPQL+vZKh+LEYqsWpQH84R6kIJcdZSoBth7g2G
	 jKy7/HvbezquyRlAkDJvupcKEcJib8KiluhYLqEy3uaUnxleRPsVx4/SsJKRD28791g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.222.179
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A32BE606A31E
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 16:56:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A32BE606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-93f3c616c84so471941085a.1
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 08:56:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795625788; x=1796230588;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/KcILltQBoAou7W2+XQ9IkERjy/Lp2MpSgOSIAqYW+I=;
        b=Rn7PYBx8h4moOXJooL1Rv55hRqCB15t/dUY4GTfJHP8mKwExpSNV4g95rRqoKqA3c3
         hAClGtbI2KQNpU/Fbq956B7/ENn0UAeZGFTciOR3eV5ctomFBXLtDu8G/0Pp+xDTOf6L
         d5QmQy3Gibh3QnDhRmjEI4vZcrbGCXeo9TixJe0gOViiEZ2fWd28p/uZu6HKLi4Kwugw
         Pb5iT1xOXeBqkCJmfDb/W+xaPRDPnJne24rO/J+S1qaZDNwUaTqyEpl6YlVrt6AVjT1p
         /9z/njujLdyEwvPhjU9UZOFRpapO+7wPA6EhsjAM8F8SAv5Q+VkNpaYFvMGCtkRkQ+9l
         R/GQ==
X-Forwarded-Encrypted: i=1; AL+hErFOciqG4fVaV7ynD7CedZMRtvZlBi2sLnCiRT3B5gtQJdOcyRxsdp8tgEgR99rNWJriVdbeKEd1CeZf@vger.kernel.org
X-Gm-Message-State: APuU4Z/yLRzGxNfJ2j9/8cp6O4i1joQYFBRtWJZPOUCXWXZE/zSssVOS
	zuucKr2jzM60bZRd/OtUBl9u/GItBAfSZkLqBqXD+4E1dhX+c4mSiLTIZCEc/CIn
X-Gm-Gg: AZFdTZeidNM1YIOvg9Z51ZvdHpWOmiAGHRQAxGXNsHgg+SD2m4x1oE+jh70YWsOKOrM
	DXtBiGv1+q8HBsit31o9KxiAKrhwcViVzPtss10cZ3x42COYyJSmCPFzUH2UMKySTQ1uEL8XUau
	xevGbwygJDTl2MrPSa/C52xv5MZXnDINe/qs8dc/qzWpW+9zs0mFdo4RrR4KOUP4JozTQcrx17L
	l4Vtg8Q22pwgHB47AfCmnIBJpU0x2ZqukrVh++LW5+KCWR97Wk/E80gv7hb05TktlIYJeEnyiRo
	pm1OottTNFvPNuT/a51Zr3q5nS/2eK2iTENATVTt7N0reOcavmkEKkMHWF85VFT6nndKqKhswO5
	9urMgEdxDn3Cbd12mFBvQmA9iGiFnTNmjY6dqk/ljhiepmjVwpt4NVit+zMdthm98KhhjmTLX5c
	zNbm69uSL93twL1UNjuo+WEEl81HOQOeuxmaTgRo3Q7yU+K97sFxV4aKTwp0dLSJu9FBYD7w8D8
	2VrmQyfgpwjRLVxXfkUFfaE5RN9EmGeD5p4szlMd/bM3Dd+ECqfKZIFt8BYDAw9tBE65Deqr70+
	McaIz7i/+JZJf26xP+L3+ZrqH06EVsx2xHBQ0TLj0LrZwy3VkdRvnxF+W/ZIA+IuAiQ=
X-Received: by 2002:a05:620a:44c4:b0:949:68b6:db42 with SMTP id af79cd13be357-949ba966a29mr3472963485a.23.1795625788521;
        Wed, 25 Nov 2026 08:56:28 -0800 (PST)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com. [209.85.217.42])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-94a0189dbcesm310892685a.13.2026.11.25.08.56.28
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 08:56:28 -0800 (PST)
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-74ab99038afso3924041137.3
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 08:56:28 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEKu94peJ1uAkez+FOlVykfCsvO23eQRGiaHzdLTlv8S10aeWKD0XS7vwtJr7COTONOnkpFK0Cc2ZWY@vger.kernel.org
X-Received: by 2002:a05:6102:578a:b0:7cc:2f04:a078 with SMTP id
 ada2fe7eead31-7d7396c2b24mr10563851137.37.1795625787958; Wed, 25 Nov 2026
 08:56:27 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261120-paul-v7-3-rc1-edac-v9-0-470f2e6928cd@bootlin.com> <20261120-paul-v7-3-rc1-edac-v9-2-470f2e6928cd@bootlin.com>
In-Reply-To: <20261120-paul-v7-3-rc1-edac-v9-2-470f2e6928cd@bootlin.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 25 Nov 2026 17:56:16 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXwTWXN4XepPPrKUTJXRk4pQ+MzGbDADe1Z7FSB7q11pQ@mail.gmail.com>
X-Gm-Features: Aa3M54ojpcJtUnDseL85QBstdnKjfhN6BZ1wTiGKwa4bXu6gXK1ydb3RLzGiqBk
Message-ID: <CAMuHMdXwTWXN4XepPPrKUTJXRk4pQ+MzGbDADe1Z7FSB7q11pQ@mail.gmail.com>
Subject: Re: [PATCH v9 2/3] EDAC/cadence: Add Cadence DDR EDAC driver
To: Paul Louvel <paul.louvel@bootlin.com>
Cc: Borislav Petkov <bp@alien8.de>, Tony Luck <tony.luck@intel.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-edac@vger.kernel.org, devicetree@vger.kernel.org, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Herve Codina <herve.codina@bootlin.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset="UTF-8"

Hi Paul,

On Fri, 20 Nov 2026 at 17:09, Paul Louvel <paul.louvel@bootlin.com> wrote:
> Add the Cadence EDAC driver found on Renesas RZ/N1x SoC.
> The memory controller supports ECC, software scrubbing, and SECDED.
>
> Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Signed-off-by: Paul Louvel (Schneider Electric) <paul.louvel@bootlin.com>

Thanks for your patch!

> --- /dev/null
> +++ b/drivers/edac/cadence_edac.c

> +static int cdns_setup_mc(struct platform_device *pdev, void __iomem *io_base)
> +{

> +       edac_mc_chipset_printk(mci, KERN_DEBUG, DRV_NAME, "ECC %s\n",
> +                              (!priv->ecc_enabled) ? "disabled" : "enabled");

Inverse logic is harder to read.  And we have a helper for that:

    str_enabled_disabled(priv->ecc_enabled)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
