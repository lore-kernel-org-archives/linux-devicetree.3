Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 753043D9DC8
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 09:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783933924; cv=none; b=HwT3G8IlYcOTqIdgxyvOjiRXK8Atfdn8VuPg3qXyxotS1It1R49puWtBHUP94tMMni1YSPj1r++DI6quHpo1/nOl7jDTXCzow7RrNNV9gw70y0F6DJNlLPwS2hgPBfnReAPI7E9+PC8KRdZ3+wzSsuWkLfL4wIGa1ohjPHr9IBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783933924; c=relaxed/simple;
	bh=c5+FxcOGmAmceHhtPcpLKMS/cB4l1dpKb753xDlDMDw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L3XjdHabEUAk5ozIorzL7FXdkxcvPEhjJ9XzF2nOwfkuZAlDqfnRatoDIdIvHlHihoY8FNIUI7BZQ5gZTooQFUfC9ML+Vb0zAVZCONC0L//R2E1ubEU/b/KMVXD26lgBkEIz9KXWRv/EFEj9LR0SEqjcXQB0pbOxgOn4sf5xTGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-9618b8bdc51so708096241.1
        for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 02:12:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783933921; x=1784538721;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=W0GhslFIBhV7HjGc4JTm9mx3d3RqP/ws4R5ft90HGkM=;
        b=CTvzWZFuMzzeZE6kEOvPfziO/3QVif8zGYi+Yw4iYlIP8Y+xFycanubO57ZZxzVpng
         MV4lHT4z501QLKO9P8/+jk1sqYsjKc54+9Lul0nNUzxz0htgAwbvr5eorW3hAHKsYURB
         Zkvp8GYbd15dXtjEhQeuTImHDrNFyCaNI4m4cCK3pG6sy8cxCZHDM0yIgUKGKOyNy/Cr
         yVeNbh4ZOmG3NeKZz6Hf14u2JpbFYa/EAqYoyghEMXcq8qhPvZlruCiPbZSFsPMjmE6w
         pZhAIKljuwiBCKHGsdJnsLXh7bIV0CzGv8Tv1S+DsOgnmDkT/IWiWR8wFwbFU6ylCdjs
         CJaQ==
X-Forwarded-Encrypted: i=1; AHgh+RoGTpzS4kQyzvP57tAKlMLX9Cjrmpkmid2cz6LzuhIW9DQDcxEwMJ75KLkcuw7ZFmFaZG2Fkr/m1xPj@vger.kernel.org
X-Gm-Message-State: AOJu0Yxnfllq6+BCOVWs1jRsSyH1t4SYwW6gU3ovLtvyax6CwYDwkVTb
	ALv2yrWA/3N0UcTcVFUm4QprgPRymzJanMjf6+dctUwm7aB59m8k7OH+iGQp636Z
X-Gm-Gg: AfdE7cnc6fL+cgkY327CLkVc4gi0YU6z6EG4xgn80MwrWJMGyO9mrxvt++dcZRU9QB5
	u64TXSXxrQMh+09TtxItnYVyeblBZlv7iRVo7tS9Mtk84ePuF97ex4PNZx/YA7pY1OB65LmENko
	7Zfs6+o8PN4oLCRZ+cJhujgTdkYg1YVkuIzdGHQoUGPFr1pMgMVD59SYlBfxDkdHEusY1xT+LIK
	1vW1/v4PtzFwx5I7OGCZrcL6lCU3UOHd4tBYVEwjelAQdvjNrPyOe+9q/AILZYaJIyh8FzFNp+Z
	2WdI+VI4WK5XuguoBBS42dftZbc9kVVXeK8MIUHPWNFc73k/PqxinRyortxnrl8MR8KJKJPFw9/
	TjPb3dD/yTEzWTuj0BTWLO8kOSKF/w3Mq1DcS2SaikaUoPhfB27zp/nnoEWI4ENOTqcNe3Dtsv3
	Fc1qzFZXh7k643/0AWftHxiEqBBduIpisBrGHnP5hNafxsimFV/eLyEg==
X-Received: by 2002:a05:6102:26d4:b0:737:783d:1900 with SMTP id ada2fe7eead31-74533bddb5fmr4845920137.9.1783933921277;
        Mon, 13 Jul 2026 02:12:01 -0700 (PDT)
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com. [209.85.221.180])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-96ed663ded3sm7863012241.12.2026.07.13.02.11.58
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 02:11:59 -0700 (PDT)
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-5bf95ade656so1249289e0c.1
        for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 02:11:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpDSunK1NPSd63uTemEctZI3C09s3upQDFdlTed5adA3tVketsKT0z/dvXcrPQEo3upWJPKw/SiigxF@vger.kernel.org
X-Received: by 2002:a05:6122:4881:b0:5bd:ddab:59a7 with SMTP id
 71dfb90a1353d-5bfbf36c0c7mr4476532e0c.10.1783933918601; Mon, 13 Jul 2026
 02:11:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260710160450.64967-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260710160450.64967-1-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 13 Jul 2026 11:11:47 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUQJ8mzUi0birB5f1KnCMX_QufHTgYB7AW=d3ZoFer+Yg@mail.gmail.com>
X-Gm-Features: AUfX_mx2_XwwyHYURvzuCSrFPVED98PoIu91Ql66CsUnywXi7izjAFqbWrYeOLo
Message-ID: <CAMuHMdUQJ8mzUi0birB5f1KnCMX_QufHTgYB7AW=d3ZoFer+Yg@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: renesas: ironhide: Describe inline ECC carveouts
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org, 
	Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Marek,

On Fri, 10 Jul 2026 at 18:05, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> The DBSC5 DRAM controller protects DRAM content using inline ECC.
> The inline ECC utilizes areas of DRAM for its operation, which are
> in the DRAM address range, but must not be accessed or modified.
> Describe the inline ECC carveout areas used by the DBSC5 controller
> on this hardware as reserved-memory, which must not be accessed.
> Include DRAM areas which are unprotected by ECC as well, those are
> parts of the DRAM which directly precede the ECC carveout.
>
> In case of high DRAM utilization, unless the inline ECC carveouts
> are properly reserved, Linux may use and corrupt the memory used
> by the DBSC5 DRAM controller for inline ECC, which would lead to
> the system becoming unstable.
>
> Fixes: ad142a4ef710 ("arm64: dts: renesas: r8a78000: Add initial Ironhide board support")
> Cc: stable@vger.kernel.org
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

> V2: Include the unprotected data areas as well

Thanks for the update!

With the ECC carveouts, Ironhide survives booting with "earlycon
memtest=17".

> --- a/arch/arm64/boot/dts/renesas/r8a78000-ironhide.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a78000-ironhide.dts
> @@ -107,6 +107,47 @@ tee@8c400000 {
>                         reg = <0x0 0x8c400000 0x0 0x02000000>;
>                         no-map;
>                 };
> +
> +               /* DRAM controller inline ECC areas */
> +               ecc@10cccc0000 {
> +                       reg = <0x10 0xcccc0000 0x0 0x33340000>;
> +                       no-map;
> +               };
> +
> +               ecc@12cccc0000 {
> +                       reg = <0x12 0xcccc0000 0x0 0x33340000>;
> +                       no-map;
> +               };
> +
> +               ecc@14cccc0000 {
> +                       reg = <0x14 0xcccc0000 0x0 0x33340000>;
> +                       no-map;
> +               };
> +
> +               ecc@16cccc0000 {
> +                       reg = <0x16 0xcccc0000 0x0 0x33340000>;
> +                       no-map;
> +               };
> +
> +               ecc@18cccc0000 {
> +                       reg = <0x18 0xcccc0000 0x0 0x33340000>;
> +                       no-map;
> +               };
> +
> +               ecc@1a66660000 {
> +                       reg = <0x1a 0x66660000 0x0 0x999a0000>;
> +                       no-map;
> +               };
> +
> +               ecc@1c66660000 {
> +                       reg = <0x1c 0x66660000 0x0 0x999a0000>;
> +                       no-map;
> +               };
> +
> +               ecc@1e66660000 {
> +                       reg = <0x1e 0x66660000 0x0 0x999a0000>;
> +                       no-map;
> +               };

Given all DB[0-7]FSDRAMECCAREA00 registers on Ironhide contain
0x0000cccc (md.l e98[0-3][7f]450 1), I think the last 3 regions should
start at offset 0xcccc0000 instead of 0x66660000, too.
As a bonus, we get 4.8 GiB back ;-)

>         };
>  };
>

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
