Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795180656;
	b=bYcNTI8heOpXHFAECXoS/tIkDTRccYzM/3h8hzjHsXnqZREciQkDydtI+iBb9t1PfnHo
	 YyZZW98BmQwUGxM59cYm0VMX157y4e+CdSeGOHpnu3UOu4YXB2TPv2WNPODmU4Pp/P41N
	 L/49dugcvffCVfdsZjEZaQaST2qhjTd239PSegUGMtN9OJ5nUHE5BMyZz0e9Bj+fSMe8f
	 4ks43r0dMBE3OFqQElMrflOK7LOPwZDyqS/l9i419La1G9/SN2kVIz+Nnd6D9tT3b6PA+
	 YtEEBBOUfvmOwMxj9R12RwS0IHaDMTO1+1Q2jYNJRx+rJcp7aSxYsHOT3ceBsxs2D2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795180656;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=Q6IKWBXLobC5DRUy2DzuSRlDF/SVfDMAiaTqttRtgzQ=;
	b=jXQb3FwMjiEo5Uvc7oXNjwbge7LZiKqdaJBk1Xf8rNsuLhsExz5j2BsMk+2tUMx64DvB
	 fP8bmaF5EczojHR+gULe+3+4MWLi88wbw/dOBf2DY/GOVi1slvKknn94EB4aLybXeq5bY
	 Ji7LMXBekR3KP1+yr/VpkLBZT2e+8G3Jl2aewOFyFzmyVxP+zsy70mQ+zgiNEHWGptVmY
	 SeChITo/al9l6j7G1lkXtrTh76hz7yXa+oxvENuZGQksztLlVedMwMhzPqAhURvsH9e4o
	 r/l5videwc4Uus86DkRugvi5e0+CUYExcrCpTyih0s6qQ99KbSqebS07klbATskYn5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.222.177
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DF59606A338
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 13:17:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2DF59606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-949657a20d7so117973885a.1
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 05:17:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795180655; x=1795785455;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Q6IKWBXLobC5DRUy2DzuSRlDF/SVfDMAiaTqttRtgzQ=;
        b=Oh5LrrU0skbJ6eMC7V/1wErAKeGI4rVhPmvI1nHvhn8bPaoXyyO/+U+W4ysUg4Nygf
         fxEbGGkWWWnES2bBdytH2GWVoRd0LocVJGselscAdX076vIRHEKFHG7aovWsTOGhGk0R
         82CF98C7aIZi01Mfg248Npn1rasb0sgTBCsN5I7zdRBVmu1yfWVKao7OyA4wM8WGMHBV
         gV7VUEKai1neng9UOg1m1Ef6bJ71quoOFMQYJotsm3jUwH2tfrWbHdgN9pHEuDVDW6p/
         EUeI1jqlRpET+Ho4yWzvPxv5Or/ayzFzypnW7rzFn1xUOyAA7/SBYpVU7XOA2EY615Vg
         x6CA==
X-Forwarded-Encrypted: i=1; AL+hErG+QqTv8bpFuiKZG6jRdmg6ftC0aJwjLSbwnqFiqUD1P0ZPbgbBwTucs81W51dkXiDWH83QF8t6mVi4@vger.kernel.org
X-Gm-Message-State: APuU4Z+W9Stmz3HBmq+WnEwPRnta9VNa/g9c8wTdwjM9nWkwLgpuHwys
	cWodF3749dhpcdiWX190o8IKNvyX5sjBgzjTVpi6w7RKt7ut57d+6XRks5lUjqbo
X-Gm-Gg: AYBFou0VcFJ9rQuQcNXcMY1ZRW+kqwXHatFtD5JzZyD7LzxNXmdLK+jp82NpcQlDBgU
	eqHuyP1EOZ7g4E9nf19CTD/jKlIb8NFlbwHAIdsrBpHY7UWndDYCm7wJD7sXx16pDIKRCosohVA
	qU2pmUmZ84Olqrcvp3BGKXs6uWlE5wnKOuEjBtd8BAk7ef9ymqteuEB8c6QSV8Apn/C4fyD1c9w
	J08DyrLevO4URYRJ8TXKMT3OoHl3VHW4GuSAazmJNhfccvucqFyY0SFkeh9yYpgbOhYvlf2tSqk
	qc/4hTVAgqbOM+SNQfx/fA/8N9ZFJAjR2BJreaJupSfSAI9qyjUXceDPvUHDpHTWGfwN0IoAevx
	x3R0Y2mp4L0w4NlSLRgybjl66n/GJS+fWeP4nA+4zM1JD/SJZRmjvI6VXlfn8rjLYw57U3TNcqG
	wUO7tY8dJhk0CDfuTiA0x8IoT5MPjIEsR3Rfa55HDBOuD3C4NaJQQBilCfT3oNhiEIK9gu/kVRy
	rys2SWqB9JN3cBuf6TVyw4cuzQ8WEhdHwM0ALNfX0+o8M50BHTOcn/BvxSu1cp9x/vof3zsfEx8
	9MP0ujCZkK7dFSOPFghuZc+12EIZYBEIoY4zHYMCGDGxxFWHeGNenMLXduJFPqJJm84v2oH2
X-Received: by 2002:a05:620a:8812:b0:944:941:c060 with SMTP id af79cd13be357-949ba95df74mr434828985a.15.1795180655031;
        Fri, 20 Nov 2026 05:17:35 -0800 (PST)
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com. [209.85.221.172])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb38b0fbsm189595085a.20.2026.11.20.05.17.34
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2026 05:17:34 -0800 (PST)
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-5ece3ab2e91so273163e0c.2
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 05:17:34 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErG5JRc0dBT+FfrV8GLzErTPBHy71XOennOkz2ng5ZJIEXwuCx01WelXAa5Fu/lideiiYRFH2LtJfuMy@vger.kernel.org
X-Received: by 2002:a05:6122:792:b0:5c7:a9ee:dcfb with SMTP id
 71dfb90a1353d-5ee8aeb7fcemr1220332e0c.5.1795180653844; Fri, 20 Nov 2026
 05:17:33 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112-sdhi_rzg3l-v1-0-ca30b209615d@bp.renesas.com> <20261112-sdhi_rzg3l-v1-3-ca30b209615d@bp.renesas.com>
In-Reply-To: <20261112-sdhi_rzg3l-v1-3-ca30b209615d@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 20 Nov 2026 14:17:22 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVepu0jANzDL552TKrFueydG3AHtd4v9MMXBsw6AK83kQ@mail.gmail.com>
X-Gm-Features: Aa3M54qUvfxgceZpYCy0eGd3okw1JBrjE6O9xWtztWGDRZeQ1eigXq4aiI1_wUs
Message-ID: <CAMuHMdVepu0jANzDL552TKrFueydG3AHtd4v9MMXBsw6AK83kQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] arm64: dts: renesas: rzg3l-smarc-som: Enable SDHI2
To: Biju Das <biju.das.au@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Biju,

On Thu, 12 Nov 2026 at 19:48, Biju Das <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Enable SDHI2 on the RZ/G3L SMARC EVK platform using the internal
> voltage regulator for voltage switching. SDHI2 signals are muxed
> with I2S0; the selection is controlled by the SW_SD2_EN macro in
> the board DTS, which must match the position of switch SYS.4 on
> the SoM. By default, I2S0 is enabled.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>

> --- a/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi
> +++ b/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi
> @@ -42,6 +42,7 @@ aliases {
>                 ethernet1 = &eth1;
>                 i2c0 = &i2c0;
>                 mmc0 = &sdhi0;
> +               mmc2 = &sdhi2;
>         };
>
>         memory@48000000 {
> @@ -355,6 +356,74 @@ sd0-data {
>                         power-source = <1800>;
>                 };
>         };
> +
> +       sdhi2_pins: sd2 {

> +               sd2-pwen {
> +                       pinmux = <RZG3L_PORT_PINMUX(K, 2, 1)>; /* SD2_PWEN */
> +               };
> +       };

Just wondering: why do you use the internal voltage regulator for SD2
 and GPIO hogs for SD0 and SD1?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
