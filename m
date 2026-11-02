Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793609382;
	b=vMPv1JNLTsLX8r/V/l2kK3JpNd7mF5Wdccf5nBAM9ossTX3sfMejup828NRtTS6y1+LN
	 z6CfO5dIcpgx7kmoS/mln7tPB3Yu4RNEOSkzELQ/QbdCZEXQTuj0pBEATyNCTxP5I0uyz
	 QtnGdQXtPojh6vFE3HAj+LtSpZeFy3d0yCJp9PS8aY26DXfrLqRBXYpga8/z9xCi4xdgW
	 yS0gGH8o+2OK1GT0Skv3e0boEAtb3+ab5sio0k5r9Netq0eyK5w27l7k0R2h61hO8TI0D
	 5N6Rd/lRrF3YtFl+DtXBH4Srjp473cB52cXjM6MxKL3K3TnfIjg6Rg2KMLX8pGqP4Qg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793609382;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=+YEAseZvXPy4rzi3ilmBCswmMdSrruj82r2UTnccKOw=;
	b=shYnLhxaRMpVN1mOzoKXAyUD2kJ+qZZnr/KZmPgDFFOm2MlZLRjYGXSbq7MCb19+T4gX
	 c8OWyqlZ2MK7HKqhpIPOyRiytl0w0Jdrl+LdtFxxboVHlSiJ701E1N9cTcq/8zlMNx1xK
	 NEAGfeH/HMOu9KzwSiiHum9wFf6Hj3XyZCzejhD5GEKQw8bmBXelXUjjxdTrgI0x04BZt
	 mVcHcAiU3EYw5a8y0/40quGsX294mvcVDYjCnPXu32/fY+sWss/2RKs5sG+SA6x/+EoMm
	 gv1hBORRl+ONCB8mjkz1BQoYEEiEQ63WNOt8VQFMR8oHOc0MXYEl7ZjXEDCLj1xCVOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.217.48
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9567606A324
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 08:49:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C9567606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-7777fa8f1ccso557419137.3
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 00:49:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793609381; x=1794214181;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+YEAseZvXPy4rzi3ilmBCswmMdSrruj82r2UTnccKOw=;
        b=m3ZRsXDU0ZU5NYpo+L/hB8D9g1FedK/p2DsT+w41ulYtVOQcsm1Vhh1Q+cjw7yo+3m
         YoziRtjK7U/Q5gmGFhEn9kLM1Ipb7oZg1eevhQLg+5ooKBnR1betHwB4AKCI8bnzWYEt
         /IQP6k5/e4s///uedeVYKTO2FtcdXfkfOQAhn/z6NcSAVLT78xMcwdZPFL8tA9xPDEHA
         uGZ7OHvOGe4p7bwQ53Ral+OJezjIgP+QIGeJlkgY5yn3KG0jvvUcAq/nXmwtuoz4l0Jx
         irMLBEp9MWEpGJDyJA2oQpmnBkznAkgkyxptfuxygxj9qQ3ylHzEto3xOxsyQbiZx4vn
         iuTQ==
X-Forwarded-Encrypted: i=1; AKwUvBwerlfgJWa2lZPfHlrmQhaQnN5tMNOd8b88ILBmF87Mj6yYwkO1PDZ3dkoVajuw97YgODSAsQbeWhoH@vger.kernel.org
X-Gm-Message-State: APuU4Z9Cw3hLTq+h0sU5RwLFz2JTv9GVUeU4r3oaS6il4BJmZ6AvOyQa
	hL4rG8FyDPxUHhtm327GjG9pdrGiXTRAKI9TPHJLDoVlxOiWQ2CcvI8JzdH/Y7NH
X-Gm-Gg: AYBFou1pw+xD1CUF0HGIgL7nKLF0b0h+4c8plE9vNKLJc/PrGW66SeZyk9lB8Gq4Ujn
	ROo+s2cV7nfeDpiKokpbNTFZfBwHkAPdrG0Anf7WlJmC8zc6OowOcN5PBlUV2CoY7ijLGBpsOfa
	kN1/p/hozRPQ0lyKdrm7PpaUhdUpnFHNJrznJs6fDyDQvXGTNttr4A6Sjh95lIaEXn5lBhtc9Eq
	cCzu0YOd12IfTAhq7hS6hm/4LT+RCMnfq6blk1aVQHjTsZ8r44BZSGA4EoErnjVcS+WfTbQlaup
	QuX4ZsfBaxFDA+K2ThQmie8W2b7E1kmUWIwIC8kfomJx3xN2qGgdq2uihQARAZZGlH5Rn917wQ1
	YAKObpgQkgOhM9gym8udgJDBc1Uy+PSKH+B7LZ6zk9hZdMFvqUIBJK7E2YPI/sSFAc1L1GsLwCO
	QtdEJLbpzOeTEZmpP3F7P1kwkNXRhvbS5M8aX096//k3jPaHPjhwVe8F5M/GDJfIfSSLuR/pMGB
	5o3lYUzJqauLLjbMzJRuaW7aiUivxiCs3CHQUctUPMNiyAPbTopBPkdQkCsnBpahuHxcgHnApIY
	q2STwQEo5iDekgbJAOdfQ4DuPnaF2wNl7+/9Vg1xXtKZHv8FVnjVEhMtm2jMt0uGfhBDQKU=
X-Received: by 2002:a05:6102:148c:b0:7c3:9464:efaa with SMTP id ada2fe7eead31-7d07223f482mr4008426137.2.1793609380761;
        Mon, 02 Nov 2026 00:49:40 -0800 (PST)
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com. [209.85.221.182])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d077393404sm9417772137.2.2026.11.02.00.49.39
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 00:49:40 -0800 (PST)
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-5eaf169fe3dso711848e0c.3
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 00:49:39 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBzQyKtySKanSYKwgK6Yv1nbNn5BIG7rhiOpCG5RqVUzfb5nBgtuu15RTqUciYwND8YoL2IqtlqiteLB@vger.kernel.org
X-Received: by 2002:a67:e10d:0:b0:7b2:b159:98c3 with SMTP id
 ada2fe7eead31-7d072640147mr3163529137.28.1793609379443; Mon, 02 Nov 2026
 00:49:39 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261030230646.709687-1-artem122novak@gmail.com>
In-Reply-To: <20261030230646.709687-1-artem122novak@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 2 Nov 2026 09:49:27 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUacwihjpfJiGY486PT=tu2-jrSQX+ZTGAqk-iaLUzffw@mail.gmail.com>
X-Gm-Features: AclHuK_7cktGh1g2g1V-jYGT89r8njgV4UvXrWAUVy37X6WOtxJHbkDtb7srpgY
Message-ID: <CAMuHMdUacwihjpfJiGY486PT=tu2-jrSQX+ZTGAqk-iaLUzffw@mail.gmail.com>
Subject: Re: [PATCH v2] sh: sh7305: add TMU0 clock support
To: Artem Novak <artem122novak@gmail.com>
Cc: glaubitz@physik.fu-berlin.de, dalias@libc.org, geert+renesas@glider.be, 
	magnus.damm@gmail.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, linux-sh@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Artem,

On Sat, 31 Oct 2026 at 00:07, Artem Novak <artem122novak@gmail.com> wrote:
> Register the SH7305 master, peripheral, bus and CPU clocks using
> the SuperH clock framework. Add the TMU0 module clock gate using
> MSTPCR0 bit 15.
>
> Keeping SH7305 clock initialization independent of the legacy CPG
> initialization framework, which relies on arch_init_clk_ops().
> Disable SH_CLK_CPG_LEGACY for SH7305.

Thanks for your patch!

> update: SH7305 TMU device tree node will use the
> renesas,tmu-sh7305 compatible.

I don't think this correction should be part of this patch?

> Signed-off-by: Artem Novak <artem122novak@gmail.com>
> ---
>  arch/sh/Kconfig                        |  2 +-
>  arch/sh/boot/dts/sh7305.dtsi           |  2 +-
>  arch/sh/kernel/cpu/sh4a/clock-sh7305.c | 78 +++++++++++++++++++-------
>  3 files changed, 60 insertions(+), 22 deletions(-)
>
> diff --git a/arch/sh/Kconfig b/arch/sh/Kconfig
> index 5ce7df11c3ec..315a1d6ee452 100644
> --- a/arch/sh/Kconfig
> +++ b/arch/sh/Kconfig
> @@ -532,7 +532,7 @@ config SH_CLK_CPG
>         def_bool y
>
>  config SH_CLK_CPG_LEGACY
> -       depends on SH_CLK_CPG
> +       depends on SH_CLK_CPG && !CPU_SUBTYPE_SH7305

Why not add !CPU_SUBTYPE_SH7305 to the existing list below?

>         def_bool y if !CPU_SUBTYPE_SH7785 && !ARCH_SHMOBILE && \
>                       !CPU_SHX3 && !CPU_SUBTYPE_SH7757 && \
>                       !CPU_SUBTYPE_SH7734 && !CPU_SUBTYPE_SH7264 && \

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
