Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D01AC42A149
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 12:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787660852; cv=none; b=HOgQcATbcGfjvXgvJo9FFZyI3cGWvrO1Ew39YXKkvOelXOZVAa54OxFyWxcFumnt6InfX9N+/5n7uh27tiu7qtB3z+kB280S2C3e1nJbZ5Pbb/3+NBE7llS5EbAkTz7SfpEp0h5xlklwhPyR2VfO3DZZUb+OH2VPvpBRf+yIB4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787660852; c=relaxed/simple;
	bh=4nRcMnRQV+AnDLfqURNbts14rQ+nBGEFB4Rm66x9S30=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cFG3TwJU3xwHxogYcRHVa94G3CivNiAdwkr8lQYGfr79aoZYip//Sz6b5/jIBHI85DjQTwOUBDCZvOfDey3UQbFq8hgCbpC5DPqwBbPtK0tUPLijFiJNF6m+WB4gwQZEGTySxQKWsOHcwlcRR00VYNmThsio7Tluw5Q3vXBmEbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-5bf8e1edc3aso3063591e0c.0
        for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 05:27:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787660850; x=1788265650;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9/HktJJBeHHkHA6w8idbfeQ0ukYM1XFsMvOe4prisg8=;
        b=JU4h8tEQSVM11H5XJw67bwp66x+PrYIncYX0BwXzQnpx+RpcMjZOJLsa1fvbZpxK0Z
         on/V5ROu9RzaI/rhppVE03fbyBoki9bFRXS67L9CJEhnl0LqklUdp18iIzeCMR2ujlAe
         Gfu3fsQp7B/DjM9tF6Nk7jbbYjhJ6NgH+qJ8Pb4ca0MUUPypGAKgcVn4Q/CrjlvbSHmw
         ZS2+MT9pGV+Yt0xO5uieTpv4uVNku+qRaJWyFpdr0nln/Davf7JNuuXn0/1P52MJ/D2Q
         lK5AzHy+7YUU6dg1tUiB18zWi7kMVZjes2sD1LTSJ8T1PXfWwP3mbPLBWsBJhb9RdkR3
         aH6Q==
X-Forwarded-Encrypted: i=1; AHgh+Rpb4Zc1OAjGR9C3ifFpZda84TiOlE1v7UHOCKir8pxsA09PUBbcF1L0NGRtVh0kZ69CXzm0XVD+0Zfo@vger.kernel.org
X-Gm-Message-State: AFuF++nonOfUa3HavzEPz8YpiukUYKWYMSHmM0KxWnfrA0dtY9aVwzrv
	pKtRlfYLcQ3c6FTfgABsSQMWIlErpyo7hA59YufrdBlTPq30HBRZBzAssYD+rW/xNoE=
X-Gm-Gg: AR+sD12gf+jKFTy8k2VuX7DQhEZYParYh47bDMDZmRJmv9HyyDtFzXSEn88CB6mpNhp
	mcJmV4B0P9CSO8kjwToSalHqezK8Lc2lteumGmSLp5LBUQVJL5rdbMMaECe7PKzHiOI7Kjlewq1
	qNSu1UG22v/69lBRyjVykyWSiRFcWccd65aHTpiqBQM7V+eg51Ug6Mv+bz8T1DgXp8eMay7jJ7C
	2DScjTAay/ECdj9FO7LyhKQ/0Q8E9BtgiuxFihOJ1gb+oOiSkh+nz0zm2XrSRSXe3skOlHnvnnv
	PunjGrVYd923uP1CyGvozZxd+t2Lbo4Re+x2+Pkk0J86oEFYWjxLMIrsHdGZXKvy1biyHwtBcqB
	fxa74554dYeIQh3NHWmqVM3kYddtAnlaN115XgTlKrmb2p0/0EaE0ndd669qoDuKwCth6mMG2sw
	fX/csWy5A6l9tu7vmuCOsobfBKDi49TIiquFYRCAR9skXClIlddE/qdSvefTfpUV1xNUNPKo1QJ
	QxiINB9LfZKacol0Ot2sUTV8A==
X-Received: by 2002:a05:6122:4692:b0:55b:d85:5073 with SMTP id 71dfb90a1353d-5c642ec3ed1mr2550852e0c.4.1787660849817;
        Tue, 25 Aug 2026 05:27:29 -0700 (PDT)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com. [209.85.217.47])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c623f3ea39sm6109049e0c.18.2026.08.25.05.27.26
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Aug 2026 05:27:26 -0700 (PDT)
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-754acc61e10so2088503137.2
        for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 05:27:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rrt4y1FnaKg13ZRbSEDD5bnsqayucnGVGOz/rs5qjc+YEZfvkBTcoIf9EH4H87/dgzka+wU7EN0xHyN@vger.kernel.org
X-Received: by 2002:a05:6102:f0a:b0:779:aedc:88c6 with SMTP id
 ada2fe7eead31-77fe357cf7dmr2091702137.0.1787660845781; Tue, 25 Aug 2026
 05:27:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260817192540.423994-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260817192540.423994-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260817192540.423994-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 25 Aug 2026 14:27:14 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUxeZ7gQiqE6VzDEF6NqgQyqO9bSnGkyyOxmT8zg62QqA@mail.gmail.com>
X-Gm-Features: AcwNN1WRL_UGP8kr-vdoVNnxkPPKW_sCIe6xHhiuRgRsERD9dSDy4YtRIX0EpTw
Message-ID: <CAMuHMdUxeZ7gQiqE6VzDEF6NqgQyqO9bSnGkyyOxmT8zg62QqA@mail.gmail.com>
Subject: Re: [PATCH v4 2/7] arm64: dts: renesas: r9a09g077: Adjust CPG
 register region sizes
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
> Increase the size of both CPG register regions from 64 KiB to 128 KiB.
>
> On the RZ/T2H SoC, the CPG/MSSR block is a multi-function block where,
> apart from clock and reset handling, it supports other features including
> clock monitoring, write protection, and peripheral configuration registers.
> Expand the mapped register regions to cover the entire register space of
> this block so these additional features can be utilized.
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
