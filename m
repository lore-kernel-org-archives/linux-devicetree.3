Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF9143C872E
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 07:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779088712; cv=none; b=cW0UKaDwACadNhOxmsleKqSX2QpQKN1UcNs/u5QWf6smKI3SX/g3LpBCJ4C9Dq62HKq5SqhPAUXf04U2xi6hm9m3R64U7W2MWkN2yNuZSqSB+B26Cxe8aDXV5SdxMkoOkQj2ExRLn0WLSBGtnHFe+z1Wv4c+J+8iUbus1xiMsqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779088712; c=relaxed/simple;
	bh=gAm9dAc2+cW11CY5gvrmUlDm6ZyHpaeF3uB9oM9NJYE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FLuQQzgg5QOqqVYV+u/KWREhPXrhO/i/H1zCWU2n8cE9Fu2JI66zSeoyawz6KI5UFdQV4h5KPLVwu3S0BMPJ9eTfPsmAxRS1LlrNaF8lIHKxOPmAOg0BF5R2LnHdS1jAtpfnbVdMdUtWDheChBdvBDjQY6/Z6KxVLEorrTyfQIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-631311d876cso1550019137.2
        for <devicetree@vger.kernel.org>; Mon, 18 May 2026 00:18:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779088710; x=1779693510;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2BaSm/XjGBh4son00sA6wyvpPsCewbAXPb4XTuwg+MM=;
        b=GCdX0tBwHLs2srhniysVdzPm41dkdc2lpomcThfkNq7tNjqOVr6f8RaHnf3jvoOMmR
         OLQuFvmbb5vSgI5x6Va+q4R1Sp5ykrq362kQ5ZXLXKyNNchsgz2401wNew6FaFiyuxcp
         5/oRsxSnAOQZCM3oR7cPq/vBlS4UkeDTcuwkkcaNrSmeyJtiknFBDTkebEaFYmrpylCQ
         EQV4q69ISNyJGslViVo2YivAmOGsU/8Cnj8MocwYP/ULprwTIxFFbkynubQrlZCGfVrF
         Gh++ZZMJxa216K366KVTovs7CxCdJ49pbtTEBDvHeEpN8/HGpyZjRbFtrNBXQLfVrcNJ
         1T7w==
X-Forwarded-Encrypted: i=1; AFNElJ/pfTcaU2cVzfYgpIdL/Sj+zdf3PXjq1H9w/SD5llY6FTh2ksUqsyykXFo0qBvto45M0YiKE+Zgnqtf@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4YU3sr1JbUGQVzGUzdLgZJecy5KXsdfn8VmtFdJXuwmhcu/xb
	hPUnSjlKggb6Xp/Hm09SgHT7kSNvsBuIgAojceTIQsjFZqiBxDAqEWyVmlQpV8WJ
X-Gm-Gg: Acq92OFKaPGnFNkk6lMpPYfpk/WPEVxYQ67U5WVgtaChBOiu2Mj+KshbI3dl7FrVn1r
	YQrnQ2rMT0NE245nrqKSvN3JF7GwImeWIuUtb3o3mcz5NUlm4KMIhBHNTYUfbrnJNJQKZez6W+c
	I7/6pArrLA5euYdyXKrVHzyX2W0EiV40I4V4ZFJsqibHsLsdtbqfAz48zQ0r8hgBttsJJp4Wl3z
	LApa/bGmgIHZGz1rW7YwQXLW1dq/B3nOTENiqWOkn9XRqt0z+SKeEE+j98zHg01aUDFylzT+4x/
	JB/lGV6l0dGRwf2VnSbDKUxYEsaC9vSLAnbfqBQJTGbiLXqO1UJx61e2KyUJgwQ0PFQiDQLiEgm
	BynFaQle2CfcM8/Eb5Jn9HIEsKYnjRXL4+gvCUu2OWcRvFt5molrxnpWSaR39m7ZgRqlB+mnwUX
	Vfoy2L4uq7MTypVzhaEK+u4snDGrIyWV7u5eg3fzjAwsgEFsthFRYN1keGx5Np
X-Received: by 2002:a05:6102:3054:b0:631:4cda:3ebb with SMTP id ada2fe7eead31-63a3f995ae5mr5855805137.24.1779088709748;
        Mon, 18 May 2026 00:18:29 -0700 (PDT)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com. [209.85.222.41])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-95fc2d278a8sm4250306241.6.2026.05.18.00.18.28
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2026 00:18:28 -0700 (PDT)
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-9568bae58f7so1271096241.3
        for <devicetree@vger.kernel.org>; Mon, 18 May 2026 00:18:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9iokSHHIyBZZWc0GWYMn2F4W2b58q4s4K8Xz8DzjYh70hKubuJkSYXNxaGf5pF8mfthGmKqOnBJUQ+@vger.kernel.org
X-Received: by 2002:a05:6102:511f:b0:632:137d:3ab with SMTP id
 ada2fe7eead31-63a403ad984mr6556785137.31.1779088707988; Mon, 18 May 2026
 00:18:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260517163212.18016-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260517163212.18016-1-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 18 May 2026 09:18:16 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVcpR96smOd4sdEXHoRp=WTLLzWNN9hO0P0=ZBTe4fKog@mail.gmail.com>
X-Gm-Features: AVHnY4JKgHlqd5SaFhNLozD0z7aZ9BTFwj4ug759FlpKdE8vGqFRTa8yvRVCDYo
Message-ID: <CAMuHMdVcpR96smOd4sdEXHoRp=WTLLzWNN9hO0P0=ZBTe4fKog@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: r8a78000: Describe all reserved memory
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Marek,

On Sun, 17 May 2026 at 18:32, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Fully describe all available DRAM in the DT, and describe regions which
> are not accessible because they are used by firmware in reserved-memory
> node.
>
> Replace first memory bank memory@60600000 with memory@40000000 and a
> 518 MiB long reserved-memory no-map subnode. This memory region is used
> by other cores in the system.
>
> Reserve 32 kiB of memory at 0x8c100000 for parameters shared by IPL,
> SCP, TFA BL31 and TEE.
>
> Reserve 512 kiB of memory at 0x8c200000 for TFA BL31. The upcoming
> upstream TFA 2.15 BL31 uses memory from 0x8c200000..0x8c242fff, the
> round up to 512 kiB is slight future proofing.
>
> Reserve 32 MiB of memory at 0x8c400000 for OPTEE-OS, which is the
> entire OPTEE-OS TZ protected DRAM area.
>
> Neither the TFA BL31 nor OPTEE-OS do modify the DT passed to Linux in
> any way with any new reserved-memory {} node to reserve memory areas
> used by the TFA BL31 or OPTEE-OS to prevent the next stage from using
> those areas, which lets Linux use all of the available DRAM as it is
> described in the DT that was passed in by U-Boot, including the areas
> that are newly utilized by TFA BL31 or OPTEE-OS.
>
> In case of high DRAM utilization, unless the memory used by TFA BL31
> or OPTEE-OS is properly reserved, Linux may use and corrupt the memory
> used by TFA BL31 or OPTEE-OS, which would lead to the system becoming
> unresponsive.
>
> Fixes: ad142a4ef710 ("arm64: dts: renesas: r8a78000: Add initial Ironhide board support")
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/r8a78000-ironhide.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a78000-ironhide.dts
> @@ -20,10 +20,9 @@ chosen {
>                 stdout-path = "serial0:1843200n8";
>         };
>
> -       memory@60600000 {
> +       memory@40000000 {
>                 device_type = "memory";
> -               /* first 518MiB is reserved for other purposes. */
> -               reg = <0x0 0x60600000 0x0 0x5fa00000>;
> +               reg = <0x0 0x40000000 0x0 0x80000000>;
>         };
>
>         memory@1080000000 {
> @@ -65,6 +64,36 @@ memory@1e00000000 {
>                 device_type = "memory";
>                 reg = <0x1e 0x00000000 0x1 0x00000000>;
>         };
> +
> +       reserved-memory {
> +               #address-cells = <2>;
> +               #size-cells = <2>;
> +               ranges;
> +
> +               /* First 518 MiB is reserved for other purposes. */
> +               firmware@40000000 {
> +                       reg = <0x0 0x40000000 0x0 0x20600000>;
> +                       no-map;
> +               };
> +
> +               /* Parameters set by IPL. */
> +               parameters@8c100000 {
> +                       reg = <0x0 0x8c100000 0x0 0x00008000>;
> +                       no-map;
> +               };
> +
> +               /* TFA BL31. */
> +               tfa-bl31@8c200000 {
> +                       reg = <0x0 0x8c200000 0x0 0x00080000>;
> +                       no-map;
> +               };
> +
> +               /* TEE TZ DRAM. */
> +               tee@8c400000 {
> +                       reg = <0x0 0x8c400000 0x0 0x02000000>;
> +                       no-map;
> +               };
> +        };

Shouldn't these reservations be added by the bootloader stack, when
passing the DTB to Linux?

>  };
>
>  &extal_clk {

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
