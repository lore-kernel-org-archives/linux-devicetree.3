Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 330A030C359
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 13:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774444157; cv=none; b=N7ZYd0FWDMXyTOC1iSrd0UgLH5dT3ivMZZbk8ElAp5QfFg5FDsxxMCI1DTvOpGtLNNjJiemDsjFsZho91aQHG95PCxzKFHsLzjq3Rjle8174FlUq7vhZAQGJikacVLzNfJ6i7L9LXRc9WjgknfliIT/yhBuSig4/aP0h3ObM/vI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774444157; c=relaxed/simple;
	bh=5iPawtLo15CwqkkJmwsrHLhxOCNnGqzihkAjVkKHqY8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BmgIre06ZNLKlaxLbfIYj+pmrJn0++DlbZe3kB6uSEFwH/hKlDcRfBMKdVjrTjdsNeXsF7aMeFVNLGK/wwDPjF0evXqywh/2F2OyM6m08y8e/SiNrjZzYYaui0fihKWocqcT0TvdXVBBJf7J158kis9idV/pyxOp4fO58A3lT84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-66a395905a4so2570095a12.1
        for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 06:09:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774444154; x=1775048954;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ckxAXUDke0h5tovTl8PH/LMAmEb34wiiT3UqWY7x06M=;
        b=aebU4hC1CC8TXviGx8AykV9LPMW4Bfg1h6VKQ2ZL3T3Q7P16RF2vZ1SAU97ScU+ghi
         N1aTxQh0//M1ACErI+P1mjmQ22kKmOfl4FbS5+fwdgdZ4OdZ3SqcIoxMUIMF+T4zZcKD
         Iyx/12gqs6nvvjX3iJqUTawwKW4+C6T8vTsjf991dc1dKjD+2e/Nma8ICO9+7n5bLyDb
         r57BQuSaz8E8JuSlpEut99mCPm4YL2LbPg00K+pd19UvHH6TTm8fhHxyjT1cJU1UoEdm
         mzzGoWJloOWQjysE8T74JF69YkidQpSS2bhdzoO+cOPOB1HOuDQuXUO9yny31JgbfhlV
         6Nzg==
X-Forwarded-Encrypted: i=1; AJvYcCUr5Y/XytOs20BWg9H5YzXDF4jrJ3kjSTmgTXuzGtXhFqUcy0s5B7swQNdB99vyBK1Evm5edBkU83ZK@vger.kernel.org
X-Gm-Message-State: AOJu0Yzqm5XCe/VrfHMIFhEzp3qvQDgJAtXAOHOJCWuTiUjJl/E9Z4vV
	HNJAhIkK+mHic6twwQvek3SqzEM9t6hh+Pc3hinIYcGILix8WHf8267KIL6SCH1Ih3k=
X-Gm-Gg: ATEYQzz2bdWsTUKFLBe762nvCEX0JMjRhzk4gF+BPA8wKJjGOCA3z0LF85fU/otipm4
	d4tamKNTNEkKEkJVK738rpUYueSys2stHzS+vRq2dQgQzzLxN8S+U3EbEdX/9+RADkV7hQqgGwW
	4+DVURPX+3ueNqbzvvlKeCbW48FzFgV0rvPaXAe3Kq52xVtOqfW9leVszA4Pdf/7QuLuUkcINNY
	+h28YUWJmfvDlnBUgjSsLptOX6bPEMWNOKGd+Etz+P+4FpMIR3k3Gth8vsGGPtj1ZtxYKxLr4bP
	1vqae4vncbXmUvKL58Q5S9cInhjWBKi1MUKPb67chvHtlJorhgpycfC8yJTOsmaXxjjq9M+lViW
	WZEKJXPvVa6NKkA/cooaqqkkm50zDEjzkDvy/XgN3Sc/qn4psdVbrSkm1kTxhY9Ip2vyxfckLLx
	WThkROzZfzwS9ghaedv+el2Pop5+ISsax7b+4nlnvrycT3I2N2+uflYf3+Zbxx
X-Received: by 2002:a05:6402:5294:b0:660:a2df:ad1 with SMTP id 4fb4d7f45d1cf-66a8262758amr2052828a12.7.1774444154124;
        Wed, 25 Mar 2026 06:09:14 -0700 (PDT)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com. [209.85.208.45])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66a5f017c83sm1470433a12.3.2026.03.25.06.09.12
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 06:09:12 -0700 (PDT)
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-668e55bd36bso5627206a12.3
        for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 06:09:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXqrU+NUHOZuaS9bJ7B/S7c7X0MO8YtAymSYhV8dOAdYEQJ8QO/w43DFZlTKLNCoYaY+qeilzWMxYd5@vger.kernel.org
X-Received: by 2002:a05:6402:458d:b0:66a:3390:30bc with SMTP id
 4fb4d7f45d1cf-66a826728a0mr2218507a12.15.1774444152446; Wed, 25 Mar 2026
 06:09:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260324143342.17872-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260324143342.17872-1-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 25 Mar 2026 14:08:59 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVv5KUma8=2T+ibnXyH+45xvqVrQaPho0CSzP1_r+j_hQ@mail.gmail.com>
X-Gm-Features: AQROBzDnZXf3SxdSqv07tNfP3QRyp5IV9cnubTU8PQao0RladIsBN2aCe5n6Z3Y
Message-ID: <CAMuHMdVv5KUma8=2T+ibnXyH+45xvqVrQaPho0CSzP1_r+j_hQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: sparrow-hawk: Reserve first 128 MiB
 of DRAM
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org, 
	Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Marek,

On Tue, 24 Mar 2026 at 15:33, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Mark the first 128 MiB of DRAM as reserved. The first 128 MiB of DRAM
> may optionally be used by TFA and other firmware for its own purposes,
> and in such case, Linux must not use this memory.
>
> On this platform, U-Boot runs in EL3 and starts TFA BL31 and Linux from
> a single combined fitImage. U-Boot has full access to all memory in the
> 0x40000000..0xbfffffff range, as well memory in the memory banks in the
> 64-bit address ranges, and therefore U-Boot patches this full complete
> view of platform memory layout into the DT that is passed to the next
> stage.
>
> The next stage is TFA BL31 and then the Linux kernel. The TFA BL31 does
> not modify the DT passed from U-Boot to TFA BL31 and then to Linux with
> any new reserved-memory {} node to reserve memory areas used by the TFA
> BL31 to prevent the next stage from using those areas, which lets Linux
> to use all of the available DRAM as described in the DT that was passed
> in by U-Boot, including the areas that are newly utilized by TFA BL31.
>
> In case of high DRAM utilization, for example in case of four instances
> of "memtester 3900M" running in parallel, unless the memory used by TFA
> BL31 is properly reserved, Linux may use and corrupt the memory used by
> TFA BL31, which would often lead to system becoming unresponsive.
>
> Until TFA BL31 can properly fill its own reserved-memory node into the
> DT, and to assure older versions of TFA BL31 do not cause problems, add
> explicitly reserved-memory {} node which prevents Linux from using the
> first 128 MiB of DRAM.
>
> Note that TFA BL31 can be adjusted to use different memory areas, this
> newly added reserved-memory {} node follows longer-term practice on the
> R-Car SoCs where the first 128 MiB of DRAM is reserved for firmware use.
> In case user does modify TFA BL31 to use different memory ranges, they
> must either use a future version of TFA BL31 which properly patches a
> reserved-memory {} node into the DT, or they must adjust the address
> ranges of this reserved-memory {} node accordingly.
>
> Fixes: a719915e76f2 ("arm64: dts: renesas: r8a779g3: Add Retronix R-Car V4H Sparrow Hawk board support")
> Cc: stable@vger.kernel.org
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts
> @@ -118,6 +118,17 @@ memory@600000000 {
>                 reg = <0x6 0x00000000 0x1 0x00000000>;
>         };
>
> +       reserved-memory {
> +               #address-cells = <2>;
> +               #size-cells = <2>;
> +               ranges;
> +
> +               tfa@40000000 {
> +                       reg = <0x0 0x40000000 0x0 0x8000000>;
> +                       no-map;
> +               };
> +       };

Obviously I don't like this very much, but I agree there is not much
else we can do at this point.  Shall I add a

    /* Temporary workaround for broken TFA BL31 */

comment while applying?

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-fixes for v7.0.

> +
>         /* Page 27 / DSI to Display */
>         dp-con {
>                 compatible = "dp-connector";

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
