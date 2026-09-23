Received: from mail-vs2-f41.google.com (mail-vs2-f41.google.com [74.125.227.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 058CD285CBA
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 15:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790176230; cv=none; b=ebZt3+o4LszmWev7/1vZ2o7dP4X0c9ZVJNGxziTi4JcbfHLs4Wa3tIpmf1zgCgboEJaUuT8Gg858yFFSPkNQgaQGjxRQpy4wWmtn70eSbEfF7WB4E1geqDeoBOVLgm7S3wyEjImYjosz2TNoIbUHxneNoCFMrHpZY29LGg+aMck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790176230; c=relaxed/simple;
	bh=EhjWSKImZwoAXYfqAyTmCpINsx0oSO9M/RawkNvcdAI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U68GD16QmAfJ2moba/HXn2/XHPJEq3GVMRIgB/v5I08PPpZ54qBqIh70Cx53/x7wZyOCzitkf9LL8wSguMNu8DrWVUDse26Mq+G//pO2sOXn3h9p7L5ESoD9ljBeAi0KUTvx9TtB/7cGoWTlDJNwz0TdaQqrVDUfb6TxqJrTqbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f41.google.com with SMTP id 71dfb90a1353d-5c7f7cc52efso451987e0c.3
        for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 08:10:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790176228; x=1790781028;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=sDvgyyoRqIDDfI9/dyDxtj/9kppA0KcEIyfQ/4/NmrM=;
        b=iOeMx0YNCNecamdmtkvlzEARwRZlVb6Ibed21MJBlstionneuoxQ+Fs48YGbksUNNJ
         C0s4i865sHwTNQKrtmL51WLg/7pKGjdbxkwYEyn7q6NlCT6DpMFlxs/8YWqCEzvhoOZP
         uVJcehlgzRjV48euaw0chyuIqZYTM9g0EzJdX6nQMCHcDHU/qWYISeX5M9W4PX9gEXoo
         TK1JEGjnjoHJ+HoYAFdel4gQ4ag1ztLfNJdihldKDwSf+L4cqzJ4UsIK8DcB+v1RFmsq
         8cl1eTvU4j9eUlSHEwFFesP7VnsNnRjRr8MP1K325j/ZRZQ/ILv6Mt/kaGwkcqLPFbcV
         dJgw==
X-Forwarded-Encrypted: i=1; AKwUvBxDht+FrupzavAuYd7pTvuuYwIBH/KeGJs5eYjbyyGG6wc3Wht7C26t19P77ItNdZeM8xMMzH0aLZja@vger.kernel.org
X-Gm-Message-State: AFuF++le7Iy+VkmTWGgLGzhyZfQBnKjC1yo56XeKAevfStTCAHBU5O2N
	GNFetrOnJPDyzXsXlu0FbVAJ7Rw9UG/htiegbVxvojBDwJmfVxSO8JsuxeFMTcr2tAc=
X-Gm-Gg: AYBFou0m5RcRadKaSFrCpnpf2uRV8p3SiTfIrWtOIOyM1C29ln0xJGVJXBa3o1URgbe
	K/A9RwJxXK0NLEOMMqGSoqtfSDObBwRu3i7yeKNK3oxbD3dKLRYpQtzRBIKXqmFLly0dRWgLjXR
	1oZXqEa6nZJHo5bUqIhfzQ6P0XQscqikP8XK8nTs2s7qj2L+/6CBZE3VvS/AyJKlUuc/Er5CMtn
	upuSP6sqb+Eb4mk5slDF+9mMUMz7t1F4z3f6QVXvduC8DrWF8h6OTpW0nDJRbw0lQbHA0bNm9Xb
	7CP0HRiUyDyBfKwezzAifCZREBhvB4nah09uBRm/vHZgCV9PI0pMvwiMSOUjDBxb2G3crwPTsba
	qjslsxqfwGQQHvFiESyZyai10SS5Jl0ZEYfFBWTf6+YrzN2P2P9nKYt0jLV/EneGDGsoAfO1ZwK
	DSCbmqJmuhc+/yMqqiIvHXWKjqzVkD7/bUu6VLDFVkWuVvrIufTvLpIstH5wsjpr+zFdbBGwErH
	QI/7B+Oyc+vLlbO394oxvTfHySr8ohDw3Nb
X-Received: by 2002:a05:6122:32d0:b0:5c9:a60b:e5bf with SMTP id 71dfb90a1353d-5c9f165e93bmr3491238e0c.15.1790176227650;
        Wed, 23 Sep 2026 08:10:27 -0700 (PDT)
Received: from mail-vs2-f43.google.com (mail-vs2-f43.google.com. [74.125.227.43])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c9f0537ec5sm3313979e0c.12.2026.09.23.08.10.27
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 08:10:27 -0700 (PDT)
Received: by mail-vs2-f43.google.com with SMTP id ada2fe7eead31-79028ca9371so403066137.0
        for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 08:10:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBx2s7dRFu0E0XhK+pRo7aLrQMrUXzzkLLCvoFVBxSoIC/6s2SP+tJov8kypi2pRP7+OylJYmgjVeaHO@vger.kernel.org
X-Received: by 2002:a05:6102:26d3:b0:7a6:accf:72c1 with SMTP id
 ada2fe7eead31-7ac17ff1a5cmr2593444137.0.1790176226764; Wed, 23 Sep 2026
 08:10:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904-rzg2-sr-boards-v8-0-94c4674927e8@solid-run.com> <20260904-rzg2-sr-boards-v8-9-94c4674927e8@solid-run.com>
In-Reply-To: <20260904-rzg2-sr-boards-v8-9-94c4674927e8@solid-run.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 23 Sep 2026 17:10:15 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVQ47vaVRKRGvwSY1Sy5B9VADC6YOJ7XMt9ruPZdd+hrg@mail.gmail.com>
X-Gm-Features: AclHuK9nr5QPs8sC-PMKUOwR3cdMhCa7cZVvTQqDSW5Li8NuNQleAMbNnooakSU
Message-ID: <CAMuHMdVQ47vaVRKRGvwSY1Sy5B9VADC6YOJ7XMt9ruPZdd+hrg@mail.gmail.com>
Subject: Re: [PATCH v8 09/11] arm64: dts: renesas: add support for solidrun
 hb-ripple with rzv2l som
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
> Add support for the SolidRun HummingBoard Ripple [2] with RZ/V2L
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
> The RZ/V2L SoM shares PCB with RZ/G2L, differing only in the SoC itself.
> RZ/V2L is adding a powerful DRP-AI NPU which G2L lacks.
>
> Due to the similarities, all descriptions except SoC are shared with
> RZ/G2L.
>
> [1] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/rz-v2l-som/
> [2] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/hummingboard-rz-series-sbcs/hummingboard-rz-g2lc-base/
>
> Signed-off-by: Josua Mayer <josua@solid-run.com>

I didn't compare with the board schematics, but it LGTM, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
