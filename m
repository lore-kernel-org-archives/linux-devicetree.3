Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43DE03DFC94
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 12:17:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780057047; cv=none; b=V8RJMJyeC6JSYMKuts6mbuFw+unmYViJUDMTXPtBY1iDlTJZSj0wlxzsRVUT5/ksW0/sZaOnPb+5Hv4T+1fUfwjx5eJe3c3ll5D+z4Rdz6DpdGzrigozP8aco1rhw8Hp2aMbb5O3BHL/aocAWftOjPCqMrwEarlqOsGTa2cu0EI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780057047; c=relaxed/simple;
	bh=6Es1YygK13lhvi/gkYMQbaFw9yC00RjnyCu5Erw9q88=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fsZMZVYfxMlcoyk5edIewxkYTojcVmRRTZRy7OLlLDH1hC97M88l5y+zk38X5kYywxTRaAzqtBSdUUYj3zauc+LCPD2/YqmXBfRzMkaK19qj3c6Pv/Ndwhml/UyzQd7w7K1LwXyLMBI5pStiex8h8VcT0Vnv5oURb4mlOoV265Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-6c28e1511adso179043137.0
        for <devicetree@vger.kernel.org>; Fri, 29 May 2026 05:17:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780057045; x=1780661845;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3WuaQKbiM+t9dvJovReE2gh8Jl4CO7/nRuyMCaYJ/ns=;
        b=Wvh1UeBn/cj1iXbhapnxRjpf6QOrDKP6IDFPgShpA2YTDrE7XlHu3qpuRnkIMU6L+T
         LdyR31MpSbVljJlNQV1dyxbhYQqeoCwYEKxwZte0JVKeKSNXO+FW1m6pNyDboBo9bgDF
         LXxiQl4Q9Z9i1CvyPwV3rXTSdgTJCWnPCK4PSBOsj9SKOyESbuhTK9yXoBhh7iENSX8E
         /dsemJrZIJAUc/MMmqavrs0cFbm5Tce0ur0O9J4O50lmgIysrGA7xaMqaVYTfDNv7hV1
         i5YiiHtCRF8ehqh+f1O64y7tPTD3AWW8MKoTdYc6PBgOxo4pRQIexdbtMmFfsUio3iuO
         bLSw==
X-Forwarded-Encrypted: i=1; AFNElJ/7zV3nrxa7Nfrged6Lh6wKpgLKZ4z/ycgzUOq9On0qCWpR6ebE7GjR5LY0DYidr8YHTelwYCmTOHek@vger.kernel.org
X-Gm-Message-State: AOJu0YxH+hR8RwFqLUg09skLqIVIDoL5Q8hEqvzAunf6tKGRiN9EePem
	5Yd+w1F2hcbU88Y5SuhR2cNnmtdCb1Mz/GHuQhraTtNcH3QRvYUFqpivE91M9414X2U=
X-Gm-Gg: Acq92OHZ4XubTUP8a6Wv6mRVj1StmHF2FcWqAR13SODrn6jBTFJFsGOuIF0sP+OivCe
	31RoFIX+ORX6l5QkdwN3stgjjETq4k/9FxxzDT2L/XTYwvjPEKF4dJO4+BlS+oY3BFPyYm7wLuw
	3gLcinY1qaarvdhpB4RKrSI+pXdvc/AbWA4FP/iKNyak+yAK/c3ZwCUlz6NggeeXI8FoUq1zeQ9
	24pB55sVqt0dTmaoa2zvnrO6WELA2YjmINxkdTHPnj80iLhJfvAfk0v+4Fc4dDoFqUDlCDLx93A
	5YO3WLHCWrDqtPyn/Jf/gaeGJ7vJ4nLEh/Hzp9sJr1/003PYVfh5Vt/QdKmuzZwLgqED75Bw0/4
	HPg9oLrv6cKCngNbtQquULv32FwfOx5a7I24GytC7zHik0/c18swLyj6zKiczpChVuVA8OPCQq1
	Q6kVjhiPmme27VWWwzDnAFFHpMdQEdB5f5/2FoddY9iaZm4g9Zkx1btMpG52xT2K3zTnRyOUfF3
	czfYsRfog==
X-Received: by 2002:a05:6102:2ad2:b0:613:e996:3014 with SMTP id ada2fe7eead31-6bf3bacffa1mr1013763137.20.1780057045119;
        Fri, 29 May 2026 05:17:25 -0700 (PDT)
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com. [209.85.217.49])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-963abe5bc72sm772783241.8.2026.05.29.05.17.24
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 May 2026 05:17:24 -0700 (PDT)
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-632e479586aso9998011137.2
        for <devicetree@vger.kernel.org>; Fri, 29 May 2026 05:17:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ99w/oCohXodlbXWSupAfo1emPZfbbL492oxyG5CzSA/NzXbnEMjVw2RWBIWlb2pOfgAlKRJ0hNaRXG@vger.kernel.org
X-Received: by 2002:a05:6102:8008:b0:631:2a82:111f with SMTP id
 ada2fe7eead31-6bf39267a54mr993523137.17.1780057044184; Fri, 29 May 2026
 05:17:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260504143751.42753-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260504143751.42753-1-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 29 May 2026 14:17:13 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV5ruURO+-8NwYhftojpLOSHE=eMGVktMC0TnD1h=JxZw@mail.gmail.com>
X-Gm-Features: AVHnY4LEBfBHPUiYx8mfjuBDO91FAYk3AhOWo-uI3g_bofZbbSK4hI5wATwCuDs
Message-ID: <CAMuHMdV5ruURO+-8NwYhftojpLOSHE=eMGVktMC0TnD1h=JxZw@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: Simplify AA1024XD12 display DTO
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Marek,

On Mon, 4 May 2026 at 16:38, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Simplify the AA1024XD12 display DTO, move all the differences into the
> panel-aa104xd12.dtsi , rename OF_GRAPH links to generic lvds_panel_out
> and lvds_panel_in names, and parametrize the LVDS output in use using
> RENESAS_LVDS_OUTPUT macro. No functional change.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/draak-ebisu-panel-aa104xd12.dtso
> +++ b/arch/arm64/boot/dts/renesas/draak-ebisu-panel-aa104xd12.dtso
> @@ -6,36 +6,5 @@
>   * Copyright 2021 Ideas on Board Oy
>   */
>
> -/dts-v1/;
> -/plugin/;
> -
> -&{/} {
> +#define RENESAS_LVDS_OUTPUT    lvds1

Both Draak and Ebisu actually have two sets of LVDS and backlight
connectors, so you could connect such a panel to lvds0, too.

> --- a/arch/arm64/boot/dts/renesas/panel-aa104xd12.dtsi
> +++ b/arch/arm64/boot/dts/renesas/panel-aa104xd12.dtsi
> @@ -5,26 +5,52 @@

> +&{/} {
> +       panel {
> +               compatible = "mitsubishi,aa104xd12", "panel-lvds";
> +               backlight = <&backlight>;
> +
> +               width-mm = <210>;
> +               height-mm = <158>;
> +               data-mapping = "jeida-18";
> +
> +               panel-timing {
> +                       /* 1024x768 @65Hz */
> +                       clock-frequency = <65000000>;
> +                       hactive = <1024>;
> +                       vactive = <768>;
> +                       hsync-len = <136>;
> +                       hfront-porch = <20>;
> +                       hback-porch = <160>;
> +                       vfront-porch = <3>;
> +                       vback-porch = <29>;
> +                       vsync-len = <6>;
> +               };
> +
> +               port {
> +                       lvds_panel_in: endpoint {
> +                               remote-endpoint = <&lvds_panel_out>;
> +                       };
> +               };
>         };
> +};

With two panels, the channel-independent "lvds_panel_in" and
"lvds_panel_out" labels may become an issue.  I think you can
fix that later using C preprocessor concatenation?

As we don't support the dual-display use case yet anyway:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
