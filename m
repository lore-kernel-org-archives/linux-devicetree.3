Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 676B83CEB85
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 11:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776855962; cv=none; b=ae87DMj/rfKlxTbVqQyvP3IwZuKxFiYkhJayKVOvCXerFIZb+E9tyx983C663tHAbKFxdzrjJxqbwo/lqPrM8bVMgQKutSjUbADUdQX/w+loxhYdTrw/0wb/mRgLYL7YucKM/AONR31PYpE2VUbKnPWYtY21x7Fzy11YLqAdpl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776855962; c=relaxed/simple;
	bh=V+ZMBuNSFVaGWYnwYt0xNSbNY/KGitTFOmcjxFWL9nQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oXG3iO2SrnSjljYCRJFiCWae8ayVlSHN0e+8AF9zj5K6LfuUMa7pffkiMHChVf8Gv9eJacQjj95Af0fmnmb93+Q5njhTmAbxjjfb+/BgE9HRwhoNdHNtBn1d885P4eZrCaCl8VYRlu7IYtFh3WS/rCRC4fJWJyqF/GnZx3Zm4mU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-5674d8be45eso1574606e0c.1
        for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 04:05:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776855959; x=1777460759;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+dE8GZKBh2kocFSYW8A22paeYqS71tNSGxjxbKeGcjc=;
        b=AmqXAl831cSDie25nK6x3riejkeMvKfmxI/Z4hAVXU944Psag2ISEVKWx/AX/B6o+i
         Q7N/8CV8tXgdfnMvIhPGa2pVLLcD5CNhnTThKAxB3eJFupzM00rnCQxedeI50qcJVND0
         BgWJq6nb4mHHwg/9lYfmpYDbZZRTa2z6xzOwJxCsmD6+oElXyIi77FlJ0O7Ieb6wy3/8
         zLT/16mSm9UtoZIG7ocR7aQKku8pcLGVljea5T1jgS0goFLighJMUQSc9Gfz9E+p9znp
         SNbibliE0QFl/XnkT4HMrVxnZmHB4Dm1SN80Xh5KmU4jZbPbFyQzdv1UlaaOZeKA9XwD
         NpjA==
X-Forwarded-Encrypted: i=1; AFNElJ91UCdNAOYUGV1EoVMtQeOfQNn9HWjG1oOks5nBD7NzjjpCEvN1o1CMAd5VZ0Hllk8wddtjd8729lBv@vger.kernel.org
X-Gm-Message-State: AOJu0YzTY2gO0pyWudMG0bXzpogqJyY4ZHz1Gn2SKbSC/Z6XiqEt/oP+
	e66scC95wawJNrb1bmDDyZmMlOsXe7C14VwHh0f8OeclR/l+u8+QURfooCR0ZB/vgUs=
X-Gm-Gg: AeBDietLnCuPonNfJUmw5ST8YHcQ221/3KjLmmNd6cZJxxInrHLprtiHKM1f5RqAfBX
	MY21yrVl0j/IbHv1oA4q4NrCDOwAYETSxFbJi5GtI+JFkJ7xBc4KiaFLuA7Ufqfe5FMFBBzXDi7
	wrtqb39KCnVcCVp0n8pJy1poRWUWvOiUfuHmgdlmlblrTMidFS1wOuaYe8GdkSwu8MPwGtBJNTq
	6MOrWGYOlWHPMCy+L9FXc12aBRYv3mvKO0SEU81VRlvET/NJ/fhk5izu0e2vXglS2PmyaX7xZDt
	zgKM8NJoqCRaGguHFjv3euTn4u+jrrZfAUPuWbXD8VosMVuGWFT5D9FdXbRXHQZq7yybyVM5bhD
	tNJ37IRNyVHv/xnnijMSQkUTWiZmY65frmmbkOJGMkpVtlJoTo0hNIeX1T7itjL3CigHIpAUSay
	8GGGdeRsUirTfkn+HUrJ8FAMLDnMX8BeDW49axNPp9BMpnMzC7JUnE0hFYjoLHz7mFPAv2iTM=
X-Received: by 2002:a05:6122:4693:b0:570:f670:587d with SMTP id 71dfb90a1353d-570f670593cmr3875211e0c.12.1776855958909;
        Wed, 22 Apr 2026 04:05:58 -0700 (PDT)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com. [209.85.222.49])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56fa92078adsm9128162e0c.7.2026.04.22.04.05.57
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Apr 2026 04:05:57 -0700 (PDT)
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-948029fb1f2so1303737241.0
        for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 04:05:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9P02KerQwmLj6SSEk1nD1oKWrYso+1sgF+Cumg1QXmsGJb6yNMb4RqkB6CUlno+Hy+Fvz2AJ6REHDx@vger.kernel.org
X-Received: by 2002:a05:6102:2ad5:b0:602:8ad9:1f6f with SMTP id
 ada2fe7eead31-616f4f7437cmr8915360137.5.1776855957147; Wed, 22 Apr 2026
 04:05:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1775575276.git.tommaso.merciai.xr@bp.renesas.com> <31210e05f7189b466b30eedbdda3d11726dac279.1775575276.git.tommaso.merciai.xr@bp.renesas.com>
In-Reply-To: <31210e05f7189b466b30eedbdda3d11726dac279.1775575276.git.tommaso.merciai.xr@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 22 Apr 2026 13:05:46 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWtm2-xGoV5Q1t7MTeDPthWGyNiR2hAtU0uTm34ELy9dA@mail.gmail.com>
X-Gm-Features: AQROBzAi0Xvfi6K-aYoZnZ1LHkHlOn6785xY4aXFH4_i4D0pQfgPtu2T2oaih5w
Message-ID: <CAMuHMdWtm2-xGoV5Q1t7MTeDPthWGyNiR2hAtU0uTm34ELy9dA@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: renesas: r9a09g056: Add #mux-state-cells
 to usb20phyrst
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: tomm.merciai@gmail.com, peda@axentia.se, p.zabel@pengutronix.de, 
	linux-renesas-soc@vger.kernel.org, biju.das.jz@bp.renesas.com, 
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 7 Apr 2026 at 17:35, Tommaso Merciai
<tommaso.merciai.xr@bp.renesas.com> wrote:
> The renesas,rzv2h-usb2phy-reset binding schema defines #mux-state-cells
> as a required property. Add it to the usb20phyrst node to fix the
> following warnings:
>
> "arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dtb: usb20phy-reset@15830000 (renesas,r9a09g056-usb2phy-reset): '#mux-state-cells' is a required property"
> "arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk-cn15-emmc.dtb: usb20phy-reset@15830000 (renesas,r9a09g056-usb2phy-reset): '#mux-state-cells' is a required property"
> "arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk-cn15-sd.dtb: usb20phy-reset@15830000 (renesas,r9a09g056-usb2phy-reset): '#mux-state-cells' is a required property"
>
> Fixes: 6a1b6f7e56dc ("dt-bindings: reset: renesas,rzv2h-usb2phy: Add '#mux-state-cells' property")
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-fixes for v7.1.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
