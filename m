Received: from mail-vs2-f34.google.com (mail-vs2-f34.google.com [74.125.227.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B293C3AEB37
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 15:15:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790176503; cv=none; b=jX2urdBJYxlnt9YHyeot9h46E+jTq55ohsYDtFavjbdXXIy0B4MyjedifOBbd/jK/fkEl08u+WnLAYksqVpqpg7sb5s/BkyypolqUtQLGFkyvO+CHF9q/qC+vLvckdLcElDI+1PTxp84KMh/tqidjyJnUVkj2egmq0hSr2H+RAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790176503; c=relaxed/simple;
	bh=3CAD3EBkGvkw8ITbSCbAKxzYiupi8Enwarxa/dgYn1Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gQvmx208duQ7vxle0G632aq4yPeGKB/Pve9E2X2nbQMBeIhV5W36UkY+fMKcjWMmBGku1klBOhFgJa9XN7L79iNgHpuwUOQ/Z1Ups8S0d9C1LpNFx2TNFHyUzO01Wpf8VbcYfr6IYrnqNXIKQ95ZFRH4KQZFU41vKaTJRv/5rM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f34.google.com with SMTP id 71dfb90a1353d-5c67e33b917so857218e0c.1
        for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 08:15:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790176500; x=1790781300;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=6YS2k2hncr+GFNhOluY330WU9W5Yzfq4y1ZEwqZxKbc=;
        b=LIc3whQL89sQl9fpHeHLuYoemb1qREfBEpwhBfpDZcowJDQW32iy0BTLImkUOJms8v
         4dcSZTT4D5TGILsbtei2UHy2hlvQgbm4xZsXTcujsfIJivnd2NB49bm4tjmgZ/2CPLJw
         dSY5Ba74m3hfmDi00YS+iUXrSciKpaKQlnmHiM16bVSxA9xA7zPmt0dDD5Q9m5Y6JhBA
         v0STQ8ETWozKwtbFCCR8dvAD4eU377bcmnZkmVk72H92BT/r4esoIJ3uWOzfj/ILQBEA
         Pq/C8Pw2ja7fKZBikZbxLveSyyL2kicowKQ+U0mLgBGUTnLwGSjWSg/XaI+ZZxs5rgXQ
         OoZA==
X-Forwarded-Encrypted: i=1; AKwUvBz1JohTOQioHCs2C5imrUKUOHR6FfQq5EwLhDK1V02fkCre/TwvNrbCv8EHe+jNBNDGdZ63TPvssUR5@vger.kernel.org
X-Gm-Message-State: AFuF++mOtP7AzTIHXMPp1HMRJXRr9s47bIMZOnuxQzO7BlIf216qaJOb
	3bKY0W6YrENRt7ZP5axu22b3GfZsmYNJwcb2javJTjFt22rZ5IwFOURTuTSkITGq5Ow=
X-Gm-Gg: AYBFou3l/B1SgVuiIHGuDQmm3GIQHs1mslPzMxZjBx94kwtb7jiZwMABtgAHZtO7WR1
	cw4Qi9Kfg9TYDrJ5fKyl0pCZzqhXEXBIG6P4JWFoXBDfVS7bnwoiX9VhosaqacVdZ8GAO2ELXmh
	BQEKgZ+3xKtGL/8TnWMKC3Fei0xkvGyhRTdVy+d9+7L7ZJ7laEUo9tilJDXUpkFVhKTf/e6zEa0
	ISeRBLp8dP4UdC2dnW5ZjI4pt7LZI4NQrGUZZqfSblYS3ZlhUznI2IhvKffe55nlaBEFs0WWHaM
	xJ6GxvCldMswyMk0ZFppfq4XiEJsjLELvaC8e2x5c/ze68HNkUak5y2V2i4vfuDZ8WmzC1bc9za
	ITsEaeHocgp08s9MHA5+4kMn+JvZ+qVxrHXjIYinH+7eHhq5oLbE5m6gMMJ+8Fb6Zw1XSGJw+WD
	tgdVjNlf3KMu/BNuxStzRM+1yPv8XU83blYnKqTByOWTk1Nk52klx5loZ5go2sqPCwJ6QpA6BEQ
	IxvX9giz0SpBZWmguaao6DXUS2e8OwWOudY
X-Received: by 2002:a05:6122:179e:b0:5c9:c60e:5cf4 with SMTP id 71dfb90a1353d-5c9f1684ca7mr3664278e0c.18.1790176500275;
        Wed, 23 Sep 2026 08:15:00 -0700 (PDT)
Received: from mail-vs2-f12.google.com (mail-vs2-f12.google.com. [74.125.227.12])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c9f04fb621sm3689888e0c.9.2026.09.23.08.15.00
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 08:15:00 -0700 (PDT)
Received: by mail-vs2-f12.google.com with SMTP id ada2fe7eead31-7856441f7d9so420157137.3
        for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 08:15:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwKXlJteIrH277OqQkn6CutiHO/eMbvCptmECzsev3/OBXwsmfMV1Kg0PB6TGdb7jxjUX7A/nqKnQ5k@vger.kernel.org
X-Received: by 2002:a05:6102:f83:b0:7a1:f7e2:aae3 with SMTP id
 ada2fe7eead31-7ac1d0cb103mr2545079137.21.1790176167279; Wed, 23 Sep 2026
 08:09:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904-rzg2-sr-boards-v8-0-94c4674927e8@solid-run.com> <20260904-rzg2-sr-boards-v8-8-94c4674927e8@solid-run.com>
In-Reply-To: <20260904-rzg2-sr-boards-v8-8-94c4674927e8@solid-run.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 23 Sep 2026 17:09:15 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUzDBMVEV7VP4JeoKFvbbYs6txYqHzw+j4qnvkKZJ3Zyw@mail.gmail.com>
X-Gm-Features: AclHuK9TWKX7_LFBBJY6lEHypNQ2_JvEQbFVziKurEpWXaJo034l1OL9z_ll5Zs
Message-ID: <CAMuHMdUzDBMVEV7VP4JeoKFvbbYs6txYqHzw+j4qnvkKZJ3Zyw@mail.gmail.com>
Subject: Re: [PATCH v8 08/11] arm64: dts: renesas: add support for solidrun
 hb-ripple with rzg2l som
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
> Add support for the SolidRun HummingBoard Ripple [2] with RZ/G2L
> SoM [1].
>
> The HummingBoard Ripple is a reduced version of HummingBoard Pulse,
> featuring:
> - 2x USB-2.0 Type-A connector
> - 1x 1Gbps RJ45 Ethernet
> - micro-HDMI connector
> - microSD connector
> - mini-PCI-E connector with SIM slot supporting USB-2.0 interface
> - MIPI-CSI Camera Connector (not described without specific camera)
> - RTC with backup battery
>
> The carrier board is identical between RZ/G2L, RZ/G2LC, RZ/G2UL and
> RZ/V2L SoMs, yet only the RZ/G2LC combination has a product page [2].
>
> While the variant being supported here is named "Ripple", shared include
> files are still named according to the full board for consistency with
> schematics, silk screen labels and other SoMs on same board.
>
> Description for microSD is shared with HummingBoard IIoT.
>
> [1] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/rz-g2l-som/
> [2] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/hummingboard-rz-series-sbcs/hummingboard-rz-g2lc-base/
>
> Signed-off-by: Josua Mayer <josua@solid-run.com>

I didn't compare with the board schematics, but the rest LGTM, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
