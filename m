Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 030484CB8A8
	for <devicetree@vger.kernel.org>; Fri,  4 Sep 2026 15:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788534799; cv=none; b=B32VTofw28+QQdG948z6w2McuOgtHDktUsNTEks6zAuUza/nHxpTUXhk71GGWAhc4LR1H0SzqkxGnZeedYhEqqTUl4oSCPBHfEhbCUflPuKfwmAtwSPn0eBwAMY6JT8xiTR4OtzBNGze8Sqvd9HlRvc5gO7xyUsyweMrfRA07tg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788534799; c=relaxed/simple;
	bh=JKMK2CnzL8ftNzdqEBL6ZbY15a40r3hgTJf4pBsjvSE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K20nb9jku5083hLKGa5mvTsSSkh86NkEXvIo3Z/098VF6k95GHMdvdJjiKvtUOPuzG/n5SoTiaQkNdsfWfCSbuz3VTPmU2VQA2DidCMIhunaUjNNwEnsv/CQ1ecAVcfyMF8MyOaqzE9Vc07ZJvrfykmN1LV2lft9tdHAMHzFsmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-5c675de8e1dso505806e0c.2
        for <devicetree@vger.kernel.org>; Fri, 04 Sep 2026 08:13:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788534797; x=1789139597;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=EH26aGan0gGqVYE0IjLU+OD6hNNld1CIjczwNKp7Quo=;
        b=MiPe7O3+5Ivy/ChXwOFlPI46b5KtGi8jJcPHpDiHaW+mBF3bPsE1VlipczHWFB5Dbw
         N/E60x8KUbWOqckkwdPWh+Blj5Wd9pLKDZB8/gcAb3YfOafuttI6Pf+ROYFU9mgMmb57
         nBJd6ePRDYF5P6HWmb96jp0GMFDrKR7UyfbGH/Br/2+FwG+zmx9LdRC1pY57XWT9D0kL
         WY/9eymesnQptA/kYhdTUGKGj/0r6Q6WZT+/LV9rgyCtOK/ORfP49WzPV0GStt9qRZf7
         VIQprBBoZHf+PloLSNMaMM/zAiqR1F4XzBN2p+OT8gT/6lCmvcn4OUju5KpIBlaBsX7M
         gPCg==
X-Forwarded-Encrypted: i=1; AKwUvBzaGiIDZVh1gaVz2HMA/RJv8wk95tjeAVJ2ssTMME1PP9TgevAh0gPaZljVpK0553p7wVxtwWW317ul@vger.kernel.org
X-Gm-Message-State: AFuF++kWVdLG+h8TH672l7gQvfBEOLaVitzJTupXuXuVQupxIb4+52qM
	QazfHeWsrhY1S1gASh3X07gJoTcIM2fsDvCxnMPcjPddXyXjg6oK860AU+qTX/t1
X-Gm-Gg: AYBFou3v4MXGxTtTUeGRitu5eP9kNreCTYU6Jfs2d6x/cBnQeF9PmYV4iwBgsJiC3Yn
	jJYN9m+mz8+h/sTZnma/rZzp0LZsUcOuKiZPyKf1mEco3mm9B89dEr2ODa6QCgkZSxwLPv9Sfxs
	vq7Lh3n6CY5wKH0S+MIi/SNjmU+ToOZglOHB+nGTIpZLlM+wPiMctAM2zcC/TRgDseC9Fxgx3Vw
	PW1bU5xjcI1gq7upxmAaFpIz8dkBDHC+DGQvTuZyb2xYZK4roJk9RTVSIr9rcEDsENZxRXcyTpY
	cKCXl1Wrem392p1vkfvcaUIPF1YURrqdAHRecQi/V/RwQ8rxT8ZjUSV5W7h5Kf++/I93nHXdbBG
	WUvNCSmo14n2GWw6gEbTgCTz2RF3XRJUzUu+k8QnkDIcGUfWEOsyNERc2g/pT1jIgY64u1MvhF6
	Ip+tcUb+pxe9AiXSG7NGD1fK5SKM43phAWJtKk5NjM/GM5tSHbKe19hAX6zVk4Ayj8Fd+opgrYF
	fAKAiW52w9bRhVVLGsgkoclRQ==
X-Received: by 2002:a05:6122:4f82:b0:5c2:ac92:eb18 with SMTP id 71dfb90a1353d-5c7ed3f6d2amr2950055e0c.7.1788534796647;
        Fri, 04 Sep 2026 08:13:16 -0700 (PDT)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com. [209.85.222.42])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9808eeb22e5sm1777124241.12.2026.09.04.08.13.16
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 08:13:16 -0700 (PDT)
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-96723c7151eso341204241.2
        for <devicetree@vger.kernel.org>; Fri, 04 Sep 2026 08:13:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwQHN2cS2fdAngZ5vQAZT2I3gVPjTKMg4Y+POWz/CE6Ug5KQS48NifK1DptgOLwmFweVKfBWDXG6L0g@vger.kernel.org
X-Received: by 2002:a05:6102:2b9c:b0:784:b9ec:913f with SMTP id
 ada2fe7eead31-78a4a6c8e9cmr2072720137.5.1788534796061; Fri, 04 Sep 2026
 08:13:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260821150408.73829-1-ayman.chaudhry.kc@renesas.com> <20260821150408.73829-7-ayman.chaudhry.kc@renesas.com>
In-Reply-To: <20260821150408.73829-7-ayman.chaudhry.kc@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 4 Sep 2026 17:13:05 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWOLRH5CWwUBkb6odaX=4t6eDnd4onrkgGfvwgPc37i_w@mail.gmail.com>
X-Gm-Features: AcwNN1VLaUGS5m2MWtdAilN8Kk2snIGRLTUTYNqUMsLJBTkMdKQbkgJo-6rNerQ
Message-ID: <CAMuHMdWOLRH5CWwUBkb6odaX=4t6eDnd4onrkgGfvwgPc37i_w@mail.gmail.com>
Subject: Re: [PATCH 06/10] dt-bindings: clock: Add r8a774a3 CPG Core Clock definitions
To: Ayman Chaudhry <ayman.chaudhry.kc@renesas.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Ulf Hansson <ulfh@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-pm@vger.kernel.org, Chris Paterson <Chris.Paterson2@renesas.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Ayman,

On Fri, 21 Aug 2026 at 17:05, Ayman Chaudhry
<ayman.chaudhry.kc@renesas.com> wrote:
> Add all the Renesas RZ/G2M v3.0 (a.k.a. R8A774A3) SoC Clock Pulse
> Generator Core Clock Outputs, as listed in Table 11.3 ("List of Clocks
> [RZ/G2M V1.3, RZ/G2M V3.0]") of the RZ/G2 Hardware User's Manual.
>
> Signed-off-by: Ayman Chaudhry <ayman.chaudhry.kc@renesas.com>

Thanks for your patch!

> --- /dev/null
> +++ b/include/dt-bindings/clock/r8a774a3-cpg-mssr.h

Missing "renesas," vendor prefix.

> @@ -0,0 +1,59 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> +/*
> + * Copyright (C) 2026 Renesas Electronics Corp.
> + */
> +#ifndef __DT_BINDINGS_CLOCK_R8A774A3_CPG_MSSR_H__
> +#define __DT_BINDINGS_CLOCK_R8A774A3_CPG_MSSR_H__

Missing "RENESAS_" vendor prefix.

For the contents:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
