Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40BE8322527
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 14:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787582190; cv=none; b=hlC3Jut4cLIcYR57NtcoiHi5XTf9KtytRXv0J8FQDGeC5+fMhUAX+QYamc3m9+tQIwxpjqxfg50goW2XqW+rQnDNRHxMte3uLcHnOQ1dqZc6i6HmstQYEuAYvyQ6mZuIJRwMxl7bie5cwBsojeXzQutWdq2/q5WJt56EStrog8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787582190; c=relaxed/simple;
	bh=euyYYIX9hGqmevRqLicy+2VXXvcJDx0K8piK2mzEcog=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WbVtCla7rEvX/U9H+X/wtsiF2wKlRJZ0TQuZ5uMNAYTAKNQyItAm/is3Tp6r27FctVEyc5Kv9vR6FpdsyU0pFPp5/KnZBXzI+YVZDgamyrnqkuTcKypjExo2BvNhjyO2pHoG19Owd451b28yCDHJeL/0efggPE1aqyIYStPolIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c15ba3a2b4bso502881966b.1
        for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 07:36:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787582187; x=1788186987;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=cjvRvnamI0/i77BPfHjgSWNkTw1kt6AokX8isFSnrJk=;
        b=SrciUfX6DTHSUExMCFG4ypt7+BxbJNfd+at8CDi8W4kL072wScm9UlvIyp+Ad1QFk/
         2ZIPhv6+GIEM3MrBEPUOd7jCOWJ+zWZB0x4L1BbzvFetuLZX7gd96jxK49Uo1KaOb9A5
         naFhHid3qYroKC21LShJ7KZhHLIs77O2G7IDnffLivmKeBorsUQiPA0dGysTK1lTf3T0
         sclegcdJRQ44PpIb0l8/wEBSSTk6K/tvPX4qn96/XXT3C0LfJcoA1WjybOX5wTScEAdB
         UiuVNj1oB+rb3ShJnOCGBJ8KusXJfgXAXWIAZNsMxCCjjqrGZwDFU09XnTePHxlOaplv
         XDVw==
X-Forwarded-Encrypted: i=1; AHgh+RqAkr/KY3ARwNY7I55IAlh73VWvBdBrsmwLQxuJqbG1CAsn3OtwwdnEsE/lxPOAd2LNiXih0Wo8XTdA@vger.kernel.org
X-Gm-Message-State: AFuF++k9FIvIa4UcGEb5X8kZX3Kud1olQcttmuy5raBwIkpPC0HOteWT
	beIGnJLJxNCEsvXktCLpXzsDWKUWSatSKPvUyTAXMHzD7iatc194oEHsY+sRRpz2Zk0=
X-Gm-Gg: AR+sD10oOXur+jhYi4JvUnQcW+LsifGy7iGlvfQJyxtsvW3mFCw1tfn7tQV/Iejp6Lj
	DKtE1MmJauJBU65vvKmdC3nNPTfzWrYuBpAZcWD6CJ6DP+Ibhjha3u1JPxV9EdHU/Y3LJ3Y7gTI
	q1TL3xbi1pLy6ps9oj36ncjH8L8sVkZ62Ql5klLDuLBQ7wTH8YspmYLQQY7H0em0iUYzzavaVzz
	2ssRdR0JlCjWn3BoR0MtKyMFx2Q3pUqipEMgrvlc1C6CYlGi9JeASzDsk8i7C5b9njviI5Lj6rG
	e7xH9oBXGAbGAkJnLh7ajRUtfYBzqRj33Ep2lhArvTdFRDPx3qfAIO2aRRLyFjRSB6FdeNpR+9C
	OtFbUDjwNo8PV3YXKebmd61rjwCbLQUVr3EiYPnadieGZhQFOdUQHePFfP+JX3oFSqjw8S1Cv2/
	kn4Ic/rEWK0afJCvDP7EwoPCqgijZkM98vRYtFGZcHJgV0paAglDZ2PM+vdNZVCQI5kBmbYtD5A
	o9nRaG8XC29RXDvFPDo7r2/oQ==
X-Received: by 2002:a17:906:3e5a:b0:c20:2165:d74f with SMTP id a640c23a62f3a-c246a6ca4f5mr2493654066b.22.1787582187289;
        Mon, 24 Aug 2026 07:36:27 -0700 (PDT)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com. [209.85.208.51])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c24966f6b48sm1335498166b.33.2026.08.24.07.36.25
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2026 07:36:25 -0700 (PDT)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6a41191c9a9so7058952a12.3
        for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 07:36:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqiGi9AeyfJIkRqEEqotKyUygtkhv3H61SoTsKNLTp/oDYtQ82cZO+e44Uxh1MDeSmk4Q24iYBZ+2FD@vger.kernel.org
X-Received: by 2002:a05:6402:4588:b0:699:fbe4:16d5 with SMTP id
 4fb4d7f45d1cf-6a42f13c47dmr33276754a12.1.1787582185390; Mon, 24 Aug 2026
 07:36:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1787062965.git.tommaso.merciai.xr@bp.renesas.com> <aec1fce5558c6c88725fe710a2f9e4b1eb9e8d64.1787062965.git.tommaso.merciai.xr@bp.renesas.com>
In-Reply-To: <aec1fce5558c6c88725fe710a2f9e4b1eb9e8d64.1787062965.git.tommaso.merciai.xr@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 24 Aug 2026 16:36:10 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUUAcrUbYV+_CFp5sZ1gQtn5eHzswZPvfZs=-=FX44DVg@mail.gmail.com>
X-Gm-Features: AcwNN1WKLbQoBhWyxHFoBVgNL35FfLUMj0SA3RfCuChNtnL3NS63UMiAsSuuf_Y
Message-ID: <CAMuHMdUUAcrUbYV+_CFp5sZ1gQtn5eHzswZPvfZs=-=FX44DVg@mail.gmail.com>
Subject: Re: [PATCH 1/3] arm64: dts: renesas: r9a08g046: Add USB2.0
 placeholder nodes
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: tomm.merciai@gmail.com, prabhakar.mahadev-lad.rj@bp.renesas.com, 
	linux-renesas-soc@vger.kernel.org, biju.das.jz@bp.renesas.com, 
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Tommaso,

On Tue, 18 Aug 2026 at 16:29, Tommaso Merciai
<tommaso.merciai.xr@bp.renesas.com> wrote:
> The USB2.0 wiring on the RZ SMARC Carrier-II board is the same for the
> RZ/G3E and RZ/G3L SoMs, so the nodes belong in the shared
> renesas-smarc2.dtsi. Enabling them there breaks the RZ/G3L SMARC EVK
> build, as the r9a08g046 (RZ/G3L) SoC DTSI describes neither the USB2.0
> host (OHCI/EHCI) nor function (HSUSB) instances:
>
> Error: arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi:94.1-7 Label or path ehci0 not found
> Error: arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi:99.1-7 Label or path ehci1 not found
> Error: arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi:104.1-8 Label or path hsusb0 not found
> Error: arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi:114.1-7 Label or path ohci0 not found
> Error: arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi:119.1-7 Label or path ohci1 not found
>
> Add minimal placeholder nodes carrying only the reg property.
> The remaining properties will be filled in once USB2.0 support for
> RZ/G3L is complete.
>
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> ---
>  arch/arm64/boot/dts/renesas/r9a08g046.dtsi | 25 ++++++++++++++++++++++

FTR, this conflicts with Biju's "[PATCH v7 6/9] arm64: dts: renesas:
r9a08g046: Add USB2.0 host/phy device nodes". which does add the real
device nodes.

[1] https://lore.kernel.org/20260812141940.246223-7-biju.das.jz@bp.renesas.com

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
