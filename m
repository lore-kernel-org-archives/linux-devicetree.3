Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C4A03ECBFD
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 10:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779876493; cv=none; b=rYE9Y2og6QzaZDbq2QLz2Si/vUuBZP0cXj3Pxm+0d57Ig+Qud2yFyLaTzh/9c293uvo9I5Om+kr5VRdXxnLiLTNn6yDQqzONCQwbd8FR2giu+s+/B6At5TEZncLoI/L5oWFlxINsbwb0QDW4LgBTAVF6HhZeVSx5xWGGSXDSKkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779876493; c=relaxed/simple;
	bh=6hY9Vz9TJ0DFiGs8pWaosNqxcImGcQZ24scRLtK1zv8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FPw5r8V5UGtVdhcxTJ9gEoNV2pjAjJ5t8vKMr1DU27DO/XMSmxg+arexU9WZwCOUMT+roSM6NFsc8Qbv4aAqiNdj02H3brEu1Rpyz2I3i3tiAiMCppjTwozUgg2UGh0hrU+b7HPwpKXPnnTftRSq81HZeVkejtGIufJdYRBgltE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-6312d29596cso8726071137.1
        for <devicetree@vger.kernel.org>; Wed, 27 May 2026 03:08:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779876491; x=1780481291;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3A7F/SHFPMTU6SyxAkGug4eEVpUKc/eZBV8/DN3UW88=;
        b=s6yyiEm80dIPDrJ1G3hLQ58JpDpMl4+ly6yMOPzCB7uUw+N+TUXWJkzhiNlG7SGTGE
         L3RpG+HGMiI1SZXPTp+mLzy2nnRNtjaJDg2Q9hgbiNhBuNX6psAtyR320HNTAQm+Fdck
         K4ihrrrx6Ab3lKUAqSbBqa05f6i5pHW5uv7hY6y2hTlAkm7JKyejI1ZDQK+X0/MJoS0j
         Nki7Ty0W4NsPszg0VQ0cSI4wl6jN218Dr8Boed+6iJTct83EWqaxL4MGgRZfiui3ZZC3
         24r9CzlafPyNWrn0PFkFE7jOgwCCUnVauV5+1LiWiZsMWcf2NXjHFkm71h8ILaTZkpuB
         3y1Q==
X-Forwarded-Encrypted: i=1; AFNElJ+aKEaZceE0RNVFTt5uj/AoC8iAX5cNBUaUPqR+2Wu7yf3NQKDqN2/kZBSfZ22tNbO/1YuQxvYtI+Ts@vger.kernel.org
X-Gm-Message-State: AOJu0Yyd5jDDOdzoElsDTvnLbHF4YFDi1xmhGAkHzC98Cc4utJaZqf/P
	XQxaOlbENtWlhaRD60RiuLoNaxkAUrq+1hBYdytLzwvm0PwcJYdgeVvb3Y3Toz0FEbY=
X-Gm-Gg: Acq92OHHBcN4JNsJtmETezNYpaLi5xcUJRkXB8veOxDNeZ5JD846lZGvrRTfH5F2nBb
	moIOQA4t90ZMe0ppGtTpbzOqXBtoVXI3MZ6DbymcEwai8XK3rXg6qx3XXDd8qlYOpLwMz2Zz2GR
	X9DSQwvqGsIjsQSI0LSw0ImBhQZWzxXuBsPEG2ADgbRqbXVI2Bi2N3Wt74eZlnp07FybIXn0oc+
	2Qxfp1fjUkB+SnXeEJlpcUj2wPnwBIYOoY9hhWQ58ix66AEpoxBYlbeqQfADN1DszXXDyQs44VU
	Q9tZY7bd0YuRE34JJzKCxLW7j0Id+m3GGC+VukySlaKEVHQdZ9S7nR4r8XniYGW0byAqYiHaAT3
	0d2R46CgKSPUMQlEje3RQo7DTyVTPwKk0vScwS/HncdokihV3jLCneTqqygvv6T2y9T3DuHv0RR
	GAhwzWvkYccxNPPbn69J1fimERTumLiELYx9gPnSZGyQjJtiSKUBv33pD8J24KaW5u
X-Received: by 2002:a05:6102:3f0f:b0:62f:5908:648a with SMTP id ada2fe7eead31-67c818f134emr12496844137.28.1779876491292;
        Wed, 27 May 2026 03:08:11 -0700 (PDT)
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com. [209.85.221.182])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-67fda9003a8sm15634837137.6.2026.05.27.03.08.10
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 May 2026 03:08:10 -0700 (PDT)
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-57512b86273so8379710e0c.3
        for <devicetree@vger.kernel.org>; Wed, 27 May 2026 03:08:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/c+BTkY3RBAdNnAeFdANFwl9k1BlEsEme6AQBdDkwn3XYhCsJjQxFe4Nbt8xzmB/CpWQzyCR76rZO3@vger.kernel.org
X-Received: by 2002:a05:6122:e22c:b0:56f:bb91:4861 with SMTP id
 71dfb90a1353d-586595dd60bmr12472501e0c.0.1779876490353; Wed, 27 May 2026
 03:08:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260505120153.680979-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260505120153.680979-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260505120153.680979-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 27 May 2026 12:07:59 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXDvM1NoU0fi+9dGZWcEyEmfni_P7NH2o3V5rK-OiNjeA@mail.gmail.com>
X-Gm-Features: AVHnY4Lo1my24GbBkVvFUOFa84YDZPTbBuqbQIY9AkUO4rL63yvmDby1451NxGM
Message-ID: <CAMuHMdXDvM1NoU0fi+9dGZWcEyEmfni_P7NH2o3V5rK-OiNjeA@mail.gmail.com>
Subject: Re: [PATCH 1/3] arm64: dts: renesas: r9a09g077: Add xSPI nodes
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Prabhakar,

On Tue, 5 May 2026 at 14:02, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add xSPI (Expanded SPI) device nodes to the RZ/T2H (R9A09G077) SoC DTSI.
> The RZ/T2H integrates two xSPI interfaces.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
> @@ -1006,6 +1006,44 @@ mii_conv3: mii-conv@3 {
>                         };
>                 };
>
> +               xspi0: spi@801c0000 {
> +                       compatible = "renesas,r9a09g077-xspi", "renesas,r9a09g047-xspi";
> +                       reg = <0 0x801c0000 0 0x1000>,
> +                             <0 0x40000000 0 0x10000000>;
> +                       reg-names = "regs", "dirmap";
> +                       interrupts = <GIC_SPI 654 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 655 IRQ_TYPE_LEVEL_HIGH>;
> +                       interrupt-names = "pulse", "err_pulse";
> +                       clocks = <&cpg CPG_MOD 4>,
> +                                <&cpg CPG_CORE R9A09G077_XSPI_CLK0>;
> +                       clock-names = "ahb", "spi";
> +                       resets = <&cpg 0x4>;

4

> +                       reset-names = "hresetn";
> +                       power-domains = <&cpg>;
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       status = "disabled";
> +               };

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.2 with the above fixed.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
