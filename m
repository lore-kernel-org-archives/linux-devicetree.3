Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C79A4A2054
	for <devicetree@vger.kernel.org>; Tue,  8 Sep 2026 08:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788857191; cv=none; b=hgTRjwnuBl/gQlGIPUF2ituivLsW9T26G7rFHsIQdKezfBXc6fWoWjRENK1cWJnPZHMpAuif/N3oMFhAuW19ENKKbel2SeTsP2IKGUiiIpVZ5rZuYLdBw0RmMm+cToEJcYhf+GYDvqi1uYAeHHt40AC2m6ds8eOrnU6E2rR6gFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788857191; c=relaxed/simple;
	bh=92gyEZZTnYL7xeeh6ZEwBFSKdx2055oIqu0lK/Rebu4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g/E/50dzAn3ygTkyefnEeUEZEqFndnk14NX3R5i6XJbbPnd3biwGYV081WtdDzZVS6dZcJesUv8S6G7Jz8VWJlt2WTJUl7pHzSYNRBXGWRLtZ1qsdFlcttaWvtfJuqeVdklAaZdplpGYm7XkBz/QIZwpNXppHUnri6xkRjrR2w0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-5c681c2a6a7so1651037e0c.0
        for <devicetree@vger.kernel.org>; Tue, 08 Sep 2026 01:46:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788857188; x=1789461988;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ApssUKPvTBDPBMVIhSzHAqwCbeQAa06dIhcXYuDQzKs=;
        b=fLlQk5XQEGPPGCJTV3vGg7GY1QYfrpDJvCh9BxZOyB6I88NQum07tiYurJf7u+H7Hx
         8Te9Jl/HmhWyqNOJYcOIP0j2KOs44OI1xmaMGhpjyJz1NV8z9a3FkjMKQeKL0t+hQ3oJ
         yGtPWnlKJnst5qtCjZaYyULqtmXMc4f4D1GUrcywhK8eRTBp3BgM0PNiSi/8YpNoUhLi
         zHildu50fZ3q5I3r6fXjjJOdt2j7gytxPD5gQhXtKlSP0R4At2sT4puIJ9iwBZlWzsIe
         a1IUoDWAUlMByFvsTnAozeqhnvqsjCf6/GvyNCeyvhLkDD+GSrWHFsxYmbbxhh2S7HOh
         RrCw==
X-Forwarded-Encrypted: i=1; AKwUvBzgIJmySY5b+sSoZ1Fvby0otrrNPQ9ebSVKOU5yHudttZmWiFdUCg3Deh0dRrE3Y/wyMSNpqWS44X+G@vger.kernel.org
X-Gm-Message-State: AFuF++n3f5R8ucgDKhKgTA3n/gnphBWMCMdZSAxwfull+CscmlPBV3Z5
	E2uzZ4BqBJIWP38+hHQYwB9C3a/iFR3sZkmTDFlVTNEEuffC172xhtmdeW1r4dzW
X-Gm-Gg: AYBFou0XFVFDz6KeACAcI03j8CIAs97n7tkAqJ1bVQlzCTaosdWNh2Wpeinct9iUAlO
	CiW6yb2xXZWchBTdF0p8bbbM9kv5xO0l7Q0Rz65LmugCfHpRH5eeAK7EbbSkJ5x/+6UiIvkE4ih
	88y0jCZRgk9JMkPEkQ31bIPdOuyo8QOks/ud9Hf83yKumMpbH4aZhmKN6/j2Sc7XkUH0LYDVJr2
	Gl4sY8X1gWVeYlPEuuYQRaT9yGyTZoPmB+xJFQD7yRoP32poF1v+Kj5AJgb9xJgxnvz3uH81Bgc
	iILNcDIkh13XR/NXBSp3rEDJFoxGEFKCqRFPVA1VpACreGE1LApfNEz+p8BOP+62H91+PZyo2KG
	ct2Z5Nao4//RMbKpxwplMUhkPnypK08Wq780//jAIMYGRrJWW34OqM48LZ8H0Sm0rlAZg9E4fMD
	GiEKxts+M87vPOqjkGFLmlcGah1c7k14UmEpcSE9NJNAjAQre+CbmRMD3GLKjO5tTmjXz4EQrvb
	625B5VOuZfZe5zNDq3f0WmvlSge+7trGbseNNqT
X-Received: by 2002:a05:6123:2c9:b0:5c3:b805:1106 with SMTP id 71dfb90a1353d-5c7ed05c324mr13092925e0c.0.1788857188022;
        Tue, 08 Sep 2026 01:46:28 -0700 (PDT)
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com. [209.85.221.182])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c7ec35d85fsm9598542e0c.12.2026.09.08.01.46.27
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 01:46:27 -0700 (PDT)
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-5c681c2a6a7so1651030e0c.0
        for <devicetree@vger.kernel.org>; Tue, 08 Sep 2026 01:46:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwevXOg9icml/dCQBeoacS3Umnr3QLgTxM3XxHFhSd3xE3xDBt76v9FL/U9TF5z9sBgtQoFUzbTBsOS@vger.kernel.org
X-Received: by 2002:a05:6122:e189:b0:5c7:a9ee:dcfb with SMTP id
 71dfb90a1353d-5c7ed3d6e40mr12626919e0c.5.1788857187476; Tue, 08 Sep 2026
 01:46:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260906140134.492084-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260906140134.492084-1-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 8 Sep 2026 10:46:16 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXKr-2+_kcCd8hSB84=AZpmOtDt2-Dxpgiewyg+67O+fw@mail.gmail.com>
X-Gm-Features: AcwNN1X8I3PAUGIRvp1JcLzwLyyr5hfRt4h4h2_fZyfEgH0XnWVqbEIcNTcm87E
Message-ID: <CAMuHMdXKr-2+_kcCd8hSB84=AZpmOtDt2-Dxpgiewyg+67O+fw@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: r8a779h0: Add GICv3 ITS and update
 PCIe node
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Marek,

On Sun, 6 Sept 2026 at 16:01, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> This SoC implements GIC600 with GICv3 ITS and PCIe host mode on this
> SoC can use it. Add GIC ITS node into GIC node, update interrupt-map
> and add msi-map into PCIe controller node.
>
> The GIC ITS does have master interface to issue transactions to RAM.
> The interface does support cacheable transactions, however, it does
> not support shareable attribute, because the AXI port signals are tied
> to inactive in this implementation. Therefore, add "dma-noncoherent"
> DT property into the GIC ITS subnode.
>
> The GIC redistributor does not have cacheable/shareable, therefore
> add "dma-noncoherent" DT property into the GIC node.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Thanks for your patch!

As I am not PCIe DT expert, I am comparing this to the corresponding
patch for R-Car V4H, which I have already queued as commit
7fe73a3a3f2c3718 ("arm64: dts: renesas: r8a779g0: Add GICv3 ITS and
update PCIe nodes") in renesas-devel, but which probably needs some
updates.

> --- a/arch/arm64/boot/dts/renesas/r8a779h0.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a779h0.dtsi
> @@ -691,6 +691,8 @@ pciec0: pcie@e65d0000 {
>                         resets = <&cpg 624>, <&cpg 1121>;
>                         reset-names = "pwr", "core";
>                         max-link-speed = <4>;
> +                       msi-parent = <&its 0>;

This has an extra cell "0", which is probably correct, given
"#msi-cells = <1>" below.

> +                       msi-map = <0x0 &its 0x0 0x10000>;

This is not present on R-Car V4H (which is probably wrong).

Interestingly, Documentation/devicetree/bindings/pci/pci-ep.yaml
documents msi-map for endpoint node, so should it be added to the
pcie-ep node, too?

>                         num-lanes = <2>;
>                         #address-cells = <3>;
>                         #size-cells = <2>;

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
