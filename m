Received: from mail-vs2-f24.google.com (mail-vs2-f24.google.com [74.125.227.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ACDB53E315
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 14:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790174815; cv=none; b=KNeMh1uwtHbqAykgCPX+w3B+nH7tkDgqGKD8kOoFD088qQvZ3Dr+MophCjO1J/J8v6tLehTd8XrEHnt7jg4SQKY41ghLzg4+kpSO/LKqKEoHoSNhKeg36hK9RNa9tqjFzbFw9mCzYoSnH5VN0SqIvqNrjUIyl8LI33m92M6NwY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790174815; c=relaxed/simple;
	bh=FXzg6hBNBXZZsScdwtGeM5Pmqbhre7BC03zd4cLn0Yo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KS9lMSLLxdyWXRoE4WDgqdbRdnfFB1TlRYESFpy5ks0fhxTHKmSH8Qzp4Vezs2FIUtHruQimlZGlw4BeBbOiEIdNJKTl8FAh+KIYs2vz750XV+vfxLpAJVkrq3WXOvtUpokv8u3iMphzIB0aRxrwTsZGieGyMb7+UHYBoJrL3lA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f24.google.com with SMTP id 71dfb90a1353d-5c97b28165bso1002867e0c.2
        for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 07:46:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790174813; x=1790779613;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ONYGJu27lrhOYpsTIFykGbM1Hkv2j9YTc036/0zk0Ug=;
        b=z1VXw/yW6sTHgYHHuhuhTHeL1az2PDowlDwk/+QATWgqDIzvv9qfxOO5soBsDKBB1m
         gIwSv6VXysNd5Cp6b1YKYm472kDmKtt/Qnc4+aX4sMjwNVqeGvUt74FjIFDwS0NtHtso
         hUYmKc5ZZ2NztE48Z/+G8u6X4bOGTC/icvNEPsZqrPoGsHRp/RYtzKWuL/R4UL7HnqpB
         eEUaSq3+0nqibqDSJpyKaG6WEnvLbIOoEv+jwpD/bGztQ20vm7GHZQxBY4+ZDMQKIoTK
         SghdBKWhs0knUuyV+Ett9fhEchkMP+3YZNw/JUjLLh5NWOkzlkt2YlDchesHBlMuOWfI
         qpxw==
X-Forwarded-Encrypted: i=1; AKwUvByWVkwevpkJYwU5jNGoIOYCMD9B7S7662t7YUyXMuX2QKBH36MB/jFU7h7RN4XNf5c29ooLNBgSnI8R@vger.kernel.org
X-Gm-Message-State: AFuF++kE4+hfVaUOv8M6gF6NOFw8GZKCQYlFJ3q2cu1JxviWauP3qpaj
	k2gO/A9QZttzigN+6XkhczvREkJ5M2KkYVvznLeghrRBLyWSJ/8dCyOP+V6OPDsl2/I=
X-Gm-Gg: AYBFou2eCpMTrUDQon1sHgOspcc+ezMfbCYUQDOlGJTJ9EJ1MSY2HgTslIpjB3u4K5F
	GJ4hYklVpGBqihXqU79ADYQjOqLz36C8yXgu5fcZk1A0O8N2pm1mwsSiYrGUbwxaPaJ4ZtMydMo
	1wOpalhmdeUJNriJMICNKv1Pd7CjCm6RyDAPMskvDT6bjpNJTaGcG6acyf6mMbOZuPTTdRycWSu
	ruwmwwqwvzxWVsABhXr7zmtSSisrC6YLRpwGYJZvnOKdB/UmLe2BJX6cEY7vK0SxrwM9tiUPX5g
	rfu7xOnBDY7Mf1HdM+Ewz4+otj+ONHRKZNG4yrdeQdlYI8u9cYc6BzLWCjrtf9Q1EQaLgWxYZJf
	olwTqSmeHQA5WBn1GCN+g7lv0Q+4bFvLR6B6lCRHIfp6rYsLbcCHQ1id31BYzbb3lfQdi1B1s4X
	NNo17lrUc1ALhQbjwUy6ty0aBmceve1GjzEdYuUeUS0eDehgSA1qjNW9zPloHPkkBkdxAiRnQtL
	MoVNO8tgMRkANGo/Qde4e96NMSn4tuF+XcmCw==
X-Received: by 2002:a05:6122:3a17:b0:5c9:a60b:e5a9 with SMTP id 71dfb90a1353d-5c9f165e8femr3312965e0c.11.1790174813264;
        Wed, 23 Sep 2026 07:46:53 -0700 (PDT)
Received: from mail-ua2-f15.google.com (mail-ua2-f15.google.com. [74.125.226.207])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c9f04f02bfsm3251154e0c.7.2026.09.23.07.46.51
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 07:46:51 -0700 (PDT)
Received: by mail-ua2-f15.google.com with SMTP id a1e0cc1a2514c-97e7c7b4ed2so617909241.2
        for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 07:46:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByRppBHPmtxgaOcKY+jaBYAImm+2LFAdbZa2X+f90pb15N8ciok/npi9SE/GlbBvlQJaKHUQTFe3VWQ@vger.kernel.org
X-Received: by 2002:a05:6102:5709:b0:7a1:f7e2:aadf with SMTP id
 ada2fe7eead31-7ac1d0cb10emr2412732137.17.1790174811407; Wed, 23 Sep 2026
 07:46:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904-rzg2-sr-boards-v8-0-94c4674927e8@solid-run.com> <20260904-rzg2-sr-boards-v8-5-94c4674927e8@solid-run.com>
In-Reply-To: <20260904-rzg2-sr-boards-v8-5-94c4674927e8@solid-run.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 23 Sep 2026 16:46:38 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWUt7w8Y=fmX2PtdJhZJ0k0YaKkoaC2ifx+LSYL5PijHg@mail.gmail.com>
X-Gm-Features: AclHuK_0TFDwROATeFWc5QcEb9bj6YWPyy6x8RXwybT5t7YWLi1_s9QYUiwmNRs
Message-ID: <CAMuHMdWUt7w8Y=fmX2PtdJhZJ0k0YaKkoaC2ifx+LSYL5PijHg@mail.gmail.com>
Subject: Re: [PATCH v8 05/11] arm64: dts: renesas: add support for solidrun
 rzv2l som and hb-iiot evb
To: Josua Mayer <josua@solid-run.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Benjamin Bara <benjamin.bara@skidata.com>, 
	Linus Walleij <linusw@kernel.org>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Jon Nettleton <jon@solid-run.com>, Mikhail Anikin <mikhail.anikin@solid-run.com>, 
	Yazan Shhady <yazan.shhady@solid-run.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 4 Sept 2026 at 13:56, Josua Mayer <josua@solid-run.com> wrote:
> Add support for the SolidRun RZ/V2L [1] SoM on HummingBoard IIoT [2].
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
> The RZ/V2L SoM shares PCB with RZ/G2L, differing only in the SoC itself.
> RZ/V2L is adding a powerful DRP-AI NPU which G2L lacks.
>
> Due to the similarities most code is shared, including DT overlays for
> eMMC, microSD, and RS485.
>
> [1] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/rz-v2l-som/
> [2] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/hummingboard-rz-series-sbcs/hummingboard-rz-g2l-iot-sbc/
>
> Signed-off-by: Josua Mayer <josua@solid-run.com>

LGTM, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
