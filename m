Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E66C2330305
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 10:26:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780050398; cv=none; b=Jgbxf7YkTSe25GQg5UzjwSKsihenaWaFpod4Kc5Ka3Ebk4l2HF1po5J7wUaJU71eFPyfBLe8jnYj2KskMPbREef6zBZ/bgrjfDjPzb/Ws0wQUJ0ho30/ou11C5gztYNLaYg0L7yhP+/kPZfzxQ0rYVMNZfPl9BlQ8/2x0xQbM8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780050398; c=relaxed/simple;
	bh=c+8bOIJH2/zmKEeYW8ysGdmmpN9b/JyJJqcEUviAgwU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kjTLs0gNcfu3P6P6ABG++v9G8zzz+nxIK1rHVTmgWfT7d8F9MDyPCGQqViSIJrnSkFaYtribmdmFKOk0rzUHHpIroF9h3nPA7vIAXKUgfjqP6+Fz/gSkMQGes8eGcNao4tAPMhrdk/4WmsH92vZHd1I5cw7a7HxOiRM2PSCJvAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-57512b86273so9848200e0c.3
        for <devicetree@vger.kernel.org>; Fri, 29 May 2026 03:26:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780050396; x=1780655196;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hGrKUr6SO+4MwqjYJ/JW0TEtGW5JoCk1D2hlkLnc7q0=;
        b=ez8s4LtVeDM5YQRawdQUlwf3/Jewnb7dTp3dd7BOIHrDP/EUnnK3IB9eF6x7Pz3mT5
         y02dj+OW9ACB8RPLbOXS2Qj4OzUW1tIRQmEMD06PUV93Ejr9YQ4uWRDifj6FhgV10soI
         NgYNY3C/qD1oRG2kffkb1ObX2tMb9xpN6fpgOzX0KphgDym/mjw7/Kwe9KHVXdha6CAl
         uQCL2PltV7F/Rrlb71HoFwJ/TzzVCl0tXd96G27l6TKpfuW/BNpH7DinpCIdkb6CLzSu
         MiiYLDAJ1aAysz3L88Wt1yvA8Wu4wZlL6Nm3cebqOZveJVnlW3naEzgl0OUTn8ykIGHo
         XI4A==
X-Forwarded-Encrypted: i=1; AFNElJ8cQ2KNjtmIFXiGtfoVqrCuVeK50PRSpAfpucoNS8L5ocoimJLmm+w7ZPEwaovv3dELSANSEGa40jHg@vger.kernel.org
X-Gm-Message-State: AOJu0YzXWmW1zNuI6saQH1jNmC14MFm8WNB0ZzOSXqJod2zYJgShHIxp
	1iAJWXjY4FjEEUKSZHQYe5bqQKTE3N7LikseXPIVcJ0NXm0NZexM2Lisu0pih2Yqzno=
X-Gm-Gg: Acq92OFqNaIQJwJJ0kf3FHI5vud7fIF1BFKA1l/NHZoL0QpLzT3ePRHtmr5a5H2iUdS
	evseR2dsct1wwqfEZzx50rdz0yMmZ1XFFyJjKkuxRgUht8R6hMaFrH7k4Pnk6EB5NGVjuIQMXKv
	/kaoE72Z/8nQlA9fA1Pv80cs2s36y/ASh1Py4TCRLNTCoPxFFY5yjLBXq6VSY/m61hSatHxX+ff
	3U1yLZJEJjcWMtJwBgsmR+i493nAny1m+l0tQWjQLY1Dn8n4QcPln6Dgt3kUV0hTw3OPB1BVAOO
	8uneHU3KXxb/E/9rH6xkOHX6/uuPtEyiNjIJ0S6Fz7LWtEZ6T/fB5f+0GN1Ao9Hs6B+Uq/uMR0X
	KYrFYhKmfNESgX6/tTDdbDp6Dj7kwpyrwbtcHNS5VD6G1Y2rsb69BUdJrU+xq6zSkim3p6DKywD
	M2cQaqrzNd2FkSiDMrktQnoY2Dv7uatSTimfImoJTtkDb+5tmb5tUMbfU6ph4Y4S05GO6npaw=
X-Received: by 2002:a05:6122:d9d:b0:56d:8ded:796c with SMTP id 71dfb90a1353d-599f600759amr679212e0c.4.1780050395937;
        Fri, 29 May 2026 03:26:35 -0700 (PDT)
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com. [209.85.217.41])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-599d4754259sm861818e0c.7.2026.05.29.03.26.32
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 May 2026 03:26:33 -0700 (PDT)
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-6c28e1511adso126957137.0
        for <devicetree@vger.kernel.org>; Fri, 29 May 2026 03:26:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8VQCDSk2InrpFyp7BkUgaVVeXLWgsxH88FC5AtQG9NcpxcaFPoZpV1klnWEoQBkNh6t/WG837Ht7op@vger.kernel.org
X-Received: by 2002:a05:6102:8008:b0:631:2a82:111f with SMTP id
 ada2fe7eead31-6bf39267a54mr800161137.17.1780050392478; Fri, 29 May 2026
 03:26:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260519111958.233194-1-biju.das.jz@bp.renesas.com> <20260519111958.233194-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260519111958.233194-2-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 29 May 2026 12:26:21 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXGjA3FCsO0QGLaRbYm0FaJYUXkd27qiW+NM8R2q5Mwdw@mail.gmail.com>
X-Gm-Features: AVHnY4LFt0O6F_i-Vh9tP5Toq47ZnKZeLEtgQ8mqX4PxSw3V2T6vgOee0I80fc8
Message-ID: <CAMuHMdXGjA3FCsO0QGLaRbYm0FaJYUXkd27qiW+NM8R2q5Mwdw@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: renesas: r9a08g046: Add RSPI{0..2} nodes
To: Biju <biju.das.au@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Biju,

On Tue, 19 May 2026 at 13:20, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Add device tree nodes for the three RSPI channels on the RZ/G3L
> (R9A08G046) SoC.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

I spoke too soon...

> --- a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
> @@ -442,6 +442,78 @@ rsci3: serial@100f3000 {
>                         status = "disabled";
>                 };
>
> +               rspi0: spi@100b0000 {
> +                       compatible = "renesas,r9a08g046-rspi";
> +                       reg = <0 0x100b0000 0 0x400>;
> +                       interrupts = <GIC_SPI 440 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 441 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 442 IRQ_TYPE_EDGE_RISING>,
> +                                    <GIC_SPI 443 IRQ_TYPE_EDGE_RISING>,
> +                                    <GIC_SPI 444 IRQ_TYPE_EDGE_RISING>;
> +                       interrupt-names = "idle", "error", "end", "rx", "tx";
> +                       clocks = <&cpg CPG_MOD R9A08G046_RSPI0_PCLK>,
> +                                <&cpg CPG_MOD R9A08G046_RSPI0_TCLK>;
> +                       clock-names = "pclk", "tclk";
> +                       resets = <&cpg R9A08G046_RSPI0_PRESETN>,
> +                                <&cpg R9A08G046_RSPI0_TRESETN>;
> +                       reset-names = "presetn", "tresetn";
> +                       dmas = <&dmac 0x26f2>, <&dmac 0x26f1>;
> +                       dma-names = "rx", "tx";
> +                       power-domains = <&cpg>;
> +                       num-cs = <1>;

Why specify this, and why one?
The hardware has four, and the driver hardcodes four.

> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       status = "disabled";
> +               };

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
