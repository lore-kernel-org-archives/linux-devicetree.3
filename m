Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED1F53BFE52
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 07:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779868178; cv=none; b=SpvyxnrIiQuuQ/qBvie1MEfvEjqzTGo0n348o55PzOLujueX/Q/uRwZugxFklV8DxrgF4aFVtWScFPDZnyuUJkbVBKMqpxd/ioiqg3oUlMvxsTz30tGOdft6DuekYWztepFi8SStae4I8ZOJnF12QODQLXiphhuD1Jsmnbx8ML0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779868178; c=relaxed/simple;
	bh=j8lyWip3ni+b0tIn2WJm+uY4Eku+ozs0Gksj2gGBzEE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XwYg6tmJ9LcRKigNLUc+HX7ckmtfFuOlAFITSUR/m2uvgJoGI4myashXYI+VjDCl/unwgjySmRUK9ZmoQOiQaK9nPeB9QnUB1P676oIaMeHkzQ8GyhHp1Ij8UXdpwf5sIzhabsy1SQuRnouZb/7KUfiUjRliMTqziE/XVyNLNT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-63a3977145fso3715868137.1
        for <devicetree@vger.kernel.org>; Wed, 27 May 2026 00:49:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779868176; x=1780472976;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PEhdAJn+PWSD3SIUt/1YVQ0ghKtTAVNe27MEz5AgvB8=;
        b=j/MJ1exZG3AzzOGKmoPdOaU2V+wYomnPj59WgS/TZKgJSzxu7+XFzQZUbx/5pdF3db
         oVI1MRDX2rXQ99Ik14egBxBnO8zORPCh+c605oxAa9t6keLt1sKtXd4nIJDUr2ZOTD1Q
         16Dvhq/XPZ94mOTDzFgdHCOiYlCZW52LjfKHJFq42IMmh2yV1OoAT7jP7jzj2s9BgDxx
         De85ZdqsWVys0mWqOT3GPQv/fGBSoacrIg+7nAr6xBNmPo60/aW5yZ7X6SgsNqpO8uGo
         RO9q4K/Q/QhZYh5l1BNXuFVxBV31V6Grp4lsnmR0VSqolmMC0WeBIUUlZo76sHPv1tyo
         KKqw==
X-Forwarded-Encrypted: i=1; AFNElJ/kliqjCPr9ryhnUz6PwGqHI8NgJp1DRm2qITnorojv3mLSaC7tepXCECFpJIj1XozFJMKUdN/PdUzw@vger.kernel.org
X-Gm-Message-State: AOJu0Yxp9kSp8pTBHFkSkunLhMbXnoxynIJR7HEBjJGSXqoESc1mTxvO
	eXvu/6ALdCp5iciLoTt+01aEr7n60vvX+PV1yy6Ukb3Rn5POiKGsAMdXC8Ed/KJwWU0=
X-Gm-Gg: Acq92OEgJ3wFSLLLyDR7b/ewvEAVCpEX/WApc70wb5p69KEDQ0iV25CgqztYZuuR0Nt
	eCceH0VftNDTuuD7rHCg6/1FyIG35+R5K4rzvKZ8VUs6al2J3+n65YiXW247Xxu3AHIejhcK0jj
	VaPUVnWrkIhlbHs/s+3lo18hnVJfvQkhym03TSC6pk4uIt9N5Ez4sTZH5CdVVPdkdOchDMfk2t1
	XC5/80KhI9wBu8+C8qf3z6C1SaGITlP9z0ccdI5L1m7SOGP9PwAjoHGuTzhktUkoyywhm89/daR
	FGZuBuIbCjPvKLK9X/xh4qT3rrgcvEIHTPDptk2LZ5Uy2GfWHLP0JPQtLarlwtS55ngCbW9n0rw
	Zrn5JENTHg9P4BhvlyG31bKUFnvtRRRgRmiBnv75gGt5WIFr70Kv3BRLt7k4fbWOfuJrRff6L61
	8dD3u+PPHrJdevPPpN7gD45ZJrqo/rVBE2pG8yhCSCXfXTvYNWXS1yoIiCgad4rv7I
X-Received: by 2002:a05:6102:5241:b0:634:92c:bdce with SMTP id ada2fe7eead31-67c7300cf26mr10939962137.12.1779868175750;
        Wed, 27 May 2026 00:49:35 -0700 (PDT)
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com. [209.85.221.178])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-961738b2babsm16260461241.7.2026.05.27.00.49.35
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 May 2026 00:49:35 -0700 (PDT)
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-58d2174a2b4so1447614e0c.3
        for <devicetree@vger.kernel.org>; Wed, 27 May 2026 00:49:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+8T5PcAj1uYa76/WCWDWHSES5Oy8IngUk1pnUFLeOR9e+EswPk0Y/kEBAU7uvHE3T2Y3U56WhgBHMJ@vger.kernel.org
X-Received: by 2002:a05:6102:5e88:b0:631:8665:3511 with SMTP id
 ada2fe7eead31-67c82ff7ba4mr11184297137.30.1779868175098; Wed, 27 May 2026
 00:49:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260519074702.3308-4-wsa+renesas@sang-engineering.com> <20260519074702.3308-6-wsa+renesas@sang-engineering.com>
In-Reply-To: <20260519074702.3308-6-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 27 May 2026 09:49:24 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXpGLYrSMNgkqUGhhBJPuQKt-KZGGsXsbchAixbYRvD9w@mail.gmail.com>
X-Gm-Features: AVHnY4JfiVZzEOtyriYMG_UyYpzEp54K25gB24_348nKEGFu3kahakUyvYBwnjc
Message-ID: <CAMuHMdXpGLYrSMNgkqUGhhBJPuQKt-KZGGsXsbchAixbYRvD9w@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] arm64: renesas: r8a78000-ironhide: enable to use SCMI
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: linux-renesas-soc@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Wolfram, Morimoto-san,

On Tue, 19 May 2026 at 09:47, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>
> Enable SCMI via MFIS-SCP and STCM transport area to manage clocks.

S-TCM

> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Thanks for your patch!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- a/arch/arm64/boot/dts/renesas/r8a78000-ironhide.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a78000-ironhide.dts
> @@ -6,6 +6,7 @@
>   */
>
>  /dts-v1/;
> +#include <dt-bindings/soc/renesas,r8a78000-mfis.h>
>  #include "r8a78000.dtsi"
>
>  / {
> @@ -20,6 +21,23 @@ chosen {
>                 stdout-path = "serial0:1843200n8";
>         };
>
> +       firmware {
> +               scmi: scmi {
> +                       compatible = "arm,scmi";
> +                       mboxes = <&mfis_scp 2 MFIS_CHANNEL_TX>, <&mfis_scp 2 MFIS_CHANNEL_RX>;
> +                       mbox-names = "tx", "rx";
> +                       shmem = <&scmi_tx_shmem>, <&scmi_rx_shmem>;
> +                       arm,no-completion-irq;
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +
> +                       scmi_clk: protocol@14 {
> +                               reg = <0x14>;
> +                               #clock-cells = <1>;
> +                       };

I am a bit reluctant to apply this patch: with all current firmware
versions, the system will lock up after "clk: Disabling unused clocks",
unless "clk_ignore_unused" is used, or unless out-of-tree SCMI
quirk handling patches are applied.

Perhaps that is OK because renesas_defconfig does not have
CONFIG_ARM_SCMI_PROTOCOL enabled yet?

> +               };
> +       };
> +

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
