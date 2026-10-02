Received: from mail-vs2-f15.google.com (mail-vs2-f15.google.com [74.125.227.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 016E73B101C
	for <devicetree@vger.kernel.org>; Fri,  2 Oct 2026 09:54:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790934894; cv=none; b=Q3bZTfk8SnkAmANeE4jzjOPfxAyNZZeYkqM2EtXnJb77Lfs2r6iZlqfOxtv1cmsxG2hm2O3gDlN7oI28u5qekUKJwx7Djlp6+ZCb1WAAW5kNEr+WSdfBxy744y2/BLVdVa3Xfq/NiNK6ltCuTx31shbBbD9R+JoigvAoevGEb9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790934894; c=relaxed/simple;
	bh=GzAnx2xBXfEPO5tzd00AnUoKCvkCiQ5XrGLMnwGIK18=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q8xDSvnqMFybDFUq6oL0u4+8FunrePboGvXWNPRZGua1LTDbdbqzoBTYBXxxHqZSWKb6ygmCdc6kNSQrsUQ7lfxz5vDQrXqva8ntDKGW1t1ZKg5nJni5y6PSQz0HLGyw9fyoVwKnUd39bDjqzmbDPCpg84ZZv8IMLv/bdE59tUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f15.google.com with SMTP id 71dfb90a1353d-5c981b0d59cso5260028e0c.3
        for <devicetree@vger.kernel.org>; Fri, 02 Oct 2026 02:54:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790934892; x=1791539692;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Z0fxwGjBjqcCfabEbDLAIlWYoRpsrY3klbqZYJ/Lvy0=;
        b=g+f/IEUleytSUtZDSUCSqcqnt8KsVAzxauPMpIhuDInqEfmTaZpofh2L1H85wxuiac
         p+2/nq1V8Q9bimRLGug7gmkj8P0e1MdNHnF1mxmJOh20wBDVCPER0HAj8EXN9RYHpaGK
         1OIJDXAdUxMvy5d0Rx0jHT6VBM3bRE20cLAlb5Pd6gwydpoOOSk5ZrFgBE12UHxFiaYR
         DnyzHyQX+s4+sGaO302p5CbDqU5QYuQkdpksCDO4IV27X7Hgjenx5+ASQPQ4lZP/STZB
         enKfCqa8vgVHrY2b1HdKscdmEmNi47Sa2gxqN3F0SuhSizEuF59kR2RQCKjbhLhRGRLq
         YiYA==
X-Forwarded-Encrypted: i=1; AKwUvBwsKgvlp+KwO7+eAP7IgNzAdbHsGcBYbEaeq8f7x78/a2Byn2ThicMPfu20dmmMhk9w8JGduQgW+75l@vger.kernel.org
X-Gm-Message-State: AFq9FYKWh9xkBDMo7VmdggBMDOrE4gjyzxx3l4dVkKLLExKCbXWqSwIC
	Nmsdbip0LQ7kKjkHR5diq+hJlwXc+uBo7yvkybpR8GZS+/vv/7Nj4mHGFm3cfixt
X-Gm-Gg: AYBFou1rAiVTsgCWUBTRBasntuigGxMiYeiYImt/10RTasc8U8Cbei5qqC2ihb41xpy
	95GmjtVCM/h89DWASmIFcM2AExwUkzHXTEMxgAbm3OJE+TIvYpwDmT83vQNV2heYGRyy6QTj6AD
	k2bAwKcUhXEyNVQnkVmnf38fRG67OmdsvCqX/yNwV8SYfQCmrJbcX9kUZ++O6CBzSu/Xdvq1VIc
	vlXc2O0x2X1deFHF4hFiYK4k/AtQyIXpqFETBMOYaxNM+NU7y265BGRLpdQPa+6+aSRvGdpGdlS
	BzFH3mHcvdurSn+ItekxO9jOTRPAHkOMPeBSVs2RHYFIJp5MT3trcKxzRkL6ZK/tsX0X8x35Drj
	0voJyFI+AwANJtzfv20hRDCiX5vQ5h2cgyInPIRv7omwvlbMo1k2u5Ejze/Ix//ZVZLO/FqFtAP
	Vis3LQ56k+c0FQhJfKloy4aGReOWXJ2F9n3GcpCb2ihbvoCY99e1KvK1r6IZVmlMDlgXLIpXKgz
	HcgCS0zfG2WN2TsCCEsf9Zr0qtr1DaqXGUj
X-Received: by 2002:a05:6122:da2:b0:5c9:c60e:3a3f with SMTP id 71dfb90a1353d-5dab3263ba5mr686611e0c.23.1790934891630;
        Fri, 02 Oct 2026 02:54:51 -0700 (PDT)
Received: from mail-vs2-f15.google.com (mail-vs2-f15.google.com. [74.125.227.15])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5da61f8fedesm2817650e0c.9.2026.10.02.02.54.50
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Oct 2026 02:54:50 -0700 (PDT)
Received: by mail-vs2-f15.google.com with SMTP id 71dfb90a1353d-5c981b0d59cso5260011e0c.3
        for <devicetree@vger.kernel.org>; Fri, 02 Oct 2026 02:54:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxEhiuqGcxZRCJ8shC391AKZ2yfqV8llh1pQ+gkEjgYKzPlt494cyKRMnOC6X6boHwvXJ9PhD+GjvR/@vger.kernel.org
X-Received: by 2002:a05:6102:162c:b0:7b5:6bb2:53a3 with SMTP id
 ada2fe7eead31-7c0f498afacmr661636137.10.1790934890369; Fri, 02 Oct 2026
 02:54:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260928-rzg2-sr-boards-v10-0-91752ea39cbc@solid-run.com> <20260928-rzg2-sr-boards-v10-4-91752ea39cbc@solid-run.com>
In-Reply-To: <20260928-rzg2-sr-boards-v10-4-91752ea39cbc@solid-run.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 2 Oct 2026 11:54:38 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXZMcdpgmZ8r3khF2er_ZNLsHJOXULbPmWj8ikCyeigew@mail.gmail.com>
X-Gm-Features: AclHuK95-pOI_InJ83kxtHngxLL78Cpy4C0cuDPVuyEs-ntx9z4X1Kg0cbn21cw
Message-ID: <CAMuHMdXZMcdpgmZ8r3khF2er_ZNLsHJOXULbPmWj8ikCyeigew@mail.gmail.com>
Subject: Re: [PATCH v10 04/11] arm64: dts: renesas: add support for solidrun
 rzg2l som and hb-iiot evb
To: Josua Mayer <josua@solid-run.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Benjamin Bara <benjamin.bara@skidata.com>, 
	Linus Walleij <linusw@kernel.org>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Jon Nettleton <jon@solid-run.com>, Mikhail Anikin <mikhail.anikin@solid-run.com>, 
	Yazan Shhady <yazan.shhady@solid-run.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Josua,

On Mon, 28 Sept 2026 at 19:34, Josua Mayer <josua@solid-run.com> wrote:
> Add support for the SolidRun RZ/G2L SoM [1] on HummingBoard IIoT [2].
>
> The SoM features:
> - 2x 1Gbps Ethernet with PHY
> - eMMC
> - 1/2GB DDR
> - WiFi + Bluetooth
> - SDHI Mux switching between eMMC and Carrier Board
>
> The HummingBoard IIoT features:
> - 3x USB-2.0 Type A connector
> - 2x 1Gbps RJ45 Ethernet
> - USB Type-C Console Port
> - microSD connector
> - RTC with backup battery
> - RGB Status LED
> - 1x M.2 B-Key connector with USB-2.0 + SIM card holder
> - 1x DSI Display Connector
> - GPIO header
> - 2x RS232/RS485 ports (configurable)
> - 2x CAN
>
> Descriptions for eMMC, microSD and RS485 are provided as overlays due to
> their dependency on configurable mux states.
>
> [1] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/rz-g2l-som/
> [2] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/hummingboard-rz-series-sbcs/hummingboard-rz-g2l-iot-sbc/
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Josua Mayer <josua@solid-run.com>

> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/rzg2l-sr-som.dtsi

> +       sdhi0_4bit_pins: sdhi0-4bit {
> +               sd0_ctrl_dat03 {

> +               sd0_dat47 {

Node names should not use underscores.  I  will replace them by
dashes.

> +       };

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
