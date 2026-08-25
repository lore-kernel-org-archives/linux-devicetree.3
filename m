Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2244E443E36
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 12:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787661295; cv=none; b=FVukvxTzd79jrPOicWmqaVypOgA/igYNoobk65WSKuBkUx6boo4zI3qwI9pD92BiCc7l4HUjDwGkkO60lWaXTbDLJfnrVx1Phja3RaZTjUBzAQOiAtNG1GCyiKEEUQyrgiXZyPw1fmkUF4p16Pj8x1dYEgfHQ3kgukMecUZ4Ce8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787661295; c=relaxed/simple;
	bh=BcysfHHMDstXivbjZE4dC1w6FzsNC+WZrmqLRhvz6SE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dHP0kuRa2PJCU8lPtYix9vYVZ+J/T5pN2Y+dRVB4foTofPcLiWOoftWpISnrsGrkQa5oGYKoIFNYjqhCJ8P9oY5og8PjJaU5mMb5Y5A+Mx1zejeKq60Nssl5LK5JODB/3FDF4zIkVZ0yOWzgfsTE2uYnBftO+PP3Sa+jozcJ0ro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-7542a2ee156so2657252137.0
        for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 05:34:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787661288; x=1788266088;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=FAuCi43bXWigOjfK7f2CuiM69Vlx8oB8xWxV6AGHKlM=;
        b=IKRzAxT8mlmpIfN2Kwzj5VPvGyMc26vxyzmkQgxVut6uw7NPQ0D7ZVUOQIV2GSXsFH
         6wxQDlJRnYbH9/m5oaez+ijeYplIPHbUI4Q7BFN+GG11V9TzNS1dlOq9MeZs/iXL8kfF
         Gh0IpZOuEnn+ZLCrATJJwCNRqjV1x6VvoL3jScyW5LhWE4MpX6aIb+YfA4oXd6AB677b
         FsgCLMXzBmWpBLaWurI6VROw/KL7dcFLoCElQaUOSuHaa7zRLL4VXD/xSgYB64EUo2Fw
         IbMnsvyLjhe+ez0XDxwQUmCs//1ykCeDtWF/dXaxQxIMs7dK9KkPtw36jJQoniIwsNDO
         wC+Q==
X-Forwarded-Encrypted: i=1; AHgh+RoqA8u0vsrhM3q3swFGHkoFcnBcNtZDgrbHtbNwDaSfXJli6J5BvPC8O56ae86CsvYj64yZLOg1EXcF@vger.kernel.org
X-Gm-Message-State: AFuF++mkSsGPkKRzCLiFL4vJ902ZZZc6Zz8xFfQWXA9p/3hPMI9oWqo+
	czaY+Atb5JsyL3yas4AyvZ5HRdwJc+rovYzMdoHQYXI5+W2l+I0fraarxbbOzFJmrL8=
X-Gm-Gg: AR+sD10ywvrechbW8uFV/R++SW09mtnLhWKcTQq0f1Z6dK/G7qeq/S73JLTyxF8yhWH
	/W52adk+TUhfoLFpZ0Hb/U6BOXmk8WMK98CXxQrKEJ4XHkk0JpqBn4T6z74Lqf22H8gpWUCyCkR
	3Tfzx3ZTeyR9tbtlZ2aCuvOyZkQpBFHbFn8eha7UG8exN3pvK7R9d0G9lX6iikJ1yobJavYnQDD
	xZFRXknF+K5+KiJ5lEpZ5ugSLz2TMDFkJE6GeUWKO6NU2pURhW8sZuGsJDww6IyH1r3bXJjukqa
	vdRJvdhcpTrjB0olXI5pq5mxkzUseB5JzS//R/W80WU5jZqRynLrn1Go68UBHwBKvBq2ELD+BPR
	7OdeoDL3kY0z6U8/OvFOGUBvPi3J3fm2OzUBmYk3ksAkDNGBUSdYjv7FW1WHgfkt8g/+bLgnev+
	MX96D3RSeJ/Pn2MJFM1JDkSFMz1k2vUc//ppx5zAMrJ4B2DvnBab+ucQZ2H4MY7RaMfcqp8Kxnt
	hSvsd6zOM7tROpC140JCcikuoIezXFA7yjX
X-Received: by 2002:a05:6102:3f9f:b0:778:9429:d51f with SMTP id ada2fe7eead31-77a64a6ab62mr12570480137.14.1787661287827;
        Tue, 25 Aug 2026 05:34:47 -0700 (PDT)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com. [209.85.217.52])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-97c834d0321sm10336433241.6.2026.08.25.05.34.46
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Aug 2026 05:34:46 -0700 (PDT)
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-73b909fbb6bso2884059137.2
        for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 05:34:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RplF41NLL8Zi/OtzldwpuQ+TrzMxWvcCtPHLX8LAgS8RcDmOGbfEyGbjsLH9FKnuH8rHV7+MRgQwOnp@vger.kernel.org
X-Received: by 2002:a05:6102:3c9d:b0:77b:b14e:b6c5 with SMTP id
 ada2fe7eead31-77bb14ec487mr9899299137.9.1787661286517; Tue, 25 Aug 2026
 05:34:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260817192540.423994-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260817192540.423994-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260817192540.423994-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 25 Aug 2026 14:34:35 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWL1xCSQn4RxL0ZMbu-AK0LiYqE6auPte=JMjW7V9-Arw@mail.gmail.com>
X-Gm-Features: AcwNN1UVUdruDxPmpux1ubwC61QQoEBBzyg7nu52qu_lQAz246VJGDaKtvYgKE0
Message-ID: <CAMuHMdWL1xCSQn4RxL0ZMbu-AK0LiYqE6auPte=JMjW7V9-Arw@mail.gmail.com>
Subject: Re: [PATCH v4 5/7] watchdog: rzv2h: Add syscon support for WDTDCR
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
	Guenter Roeck <linux@roeck-us.net>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, Prabhakar <prabhakar.csengg+renesas@gmail.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 17 Aug 2026 at 21:26, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> On RZ/T2H and RZ/N2H SoCs, the WDTDCR (WDT Debug Control Register) resides
> in the second register region of the CPG/MSSR block. Since this
> multi-function block is shared with other peripherals, it is exposed via a
> syscon regmap interface.
>
> Look up the SYSC regmap using the optional "renesas,sysc" property and
> derive the WDTDCR offset from the watchdog instance index.
>
> Retain the existing MMIO-based access method when the "renesas,sysc"
> property is absent to preserve compatibility with existing DT's.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
