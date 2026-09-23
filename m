Received: from mail-ua2-f12.google.com (mail-ua2-f12.google.com [74.125.226.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF8635218A6
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 14:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.226.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790175384; cv=none; b=YVIvEXp2wtJ152vv32VtQC61M0h8fspGW/0dZnn2Tz6YgbUQdgRd0n8mw78oSlHtdCPuymEeEKwNNW06ByJK7HxPv+GsJzjnzCe2FRoFSZStsAzo6YAD6RWdryznv5wQ8IkFCc0c/66ikwXQkiDnfZTHUugoooh05/JOwBfbY6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790175384; c=relaxed/simple;
	bh=R0Hl1uM+B2TCFyzAh2mRelpWA1TgmI+2NQ2VkDXBKN4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N5fQUz1YCMGiSmFFhm4BrKlO0z6SQSnrKAcyubgSRaP8bAV8rKr+llPBujblp6WI2kAGsVx8NDL0+wZrvv8c9hRYlB6Gyue8vppauipKmEpOfqGn+M/nbw1ZiQHme29zOZNP0X+4Sxoi5xjqRLFkTVb9fj7txWon40Oyt1eOTkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.226.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua2-f12.google.com with SMTP id a1e0cc1a2514c-97e97e2c7d4so589139241.1
        for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 07:56:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790175381; x=1790780181;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=u4gaNTKxdC+sW3aviG7p02o1OWtFZhqrn2Ys43SAJgs=;
        b=y+3DpCIvs1bmIA00P3aFOw69nsmpobrTWTJt0wc0hjC2VsOux6tn0OUU16xWoYvRh+
         k6HV8mhMZ/LiJCg5qxyCDFw7kw8Rjp/01LcN4WgQJ4BL0JEQ0vrexFkaUoXi9yfMwlnB
         TFDJ0esDuuN2n0tyhMZ4AtuF+y8rm6GviAAMmQemIaFHmkLcjS9OtWFzalwqxpCLbtje
         iosObpkiK+yXvgTv0jw3TdemGzm3M2rBvC0JKCLzHjehNW6jnCwD+fh17Vf7ACBxo25V
         fmrT9NpYoHQLQZN9GpNPQahYsrX10yX72nmBwwEH1qU+9kUBDY7misOTEwAhsBXpalUJ
         GDZQ==
X-Forwarded-Encrypted: i=1; AKwUvBxTiEsy7tGSTwUmlyKPJwuyPzKb199LEjuvJnIuDsx8xE+DgpO/+JvMkvdOXzdgdtVB8T0piCxEdoSP@vger.kernel.org
X-Gm-Message-State: AFuF++kr9ZwBrzK6MfNK0MuxyjxCQbRIAkzF788F3R5DPdBqLDhEDoae
	KrG9QJYpFfiDo/4miKK3GDW80G5ZUsK/jcKMj0Tp/MQb/R1Hp9roA2f1OmAZXzQin3I=
X-Gm-Gg: AYBFou37we6T1g0+ykdYJalJ/V6GD+FUlbBIqQLKk80TOtAjyMCTGSvEDoypny6PX6m
	hYU++FAgh65S8AZTdbsKlfjNDIF8tc0xMFHB92SZBPa4aSPc5v8sbSQHwyrHMGa17GG50MpgNFL
	ZVV8wSjJn2qMa68SwX7F5lIP1wZo7VkkxeFKBcFyLLjYfGxLPaf0dfjf1sEz9tYrZiHpcZneuHC
	qrAIgPQwf/uW69Aj0JZ+V9L95V/kYbmaC/7nI0apObi+0kaU+mIo/viBXHq3JDkq/pQyYbfgmNY
	cPHu3+GT3Dy+6RyNnR8XDIeIEdPuXzNfT0wSuDViI4SHUAf8NFnOua9lnHrtUr4alT8pdnc7AqE
	3yda0tXcJ3zF3O0KEt7qKf75TiTuLavZuAGwdMPCyQbUVTriLjcOtvUxkkwqQHptpb9hLOVULEH
	PFvv3YjjMc+P5yvuKzsse5kPJ2TmQI6Kt+7eZlI6jcZlHkiwP9rp+4tKIs3ekG6g9klCzs2IjDV
	ZLeEqmPgUBu7H7jhiM/5QWnHGp6BTWn8fmFgw==
X-Received: by 2002:a05:6102:3711:b0:7a6:b8fe:e82d with SMTP id ada2fe7eead31-7ac1b203c66mr2689347137.4.1790175381467;
        Wed, 23 Sep 2026 07:56:21 -0700 (PDT)
Received: from mail-ua2-f12.google.com (mail-ua2-f12.google.com. [74.125.226.204])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-985169f62a5sm3838892241.4.2026.09.23.07.56.20
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 07:56:20 -0700 (PDT)
Received: by mail-ua2-f12.google.com with SMTP id a1e0cc1a2514c-97e97e2c7d4so589120241.1
        for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 07:56:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzNP3Gh9P3sp++weYSLJ/TZ442857CiGdBk0xQPlN/xhJ5iY9ijrexNb38PhN1P3yGUH9CGft6wfr90@vger.kernel.org
X-Received: by 2002:a05:6102:5e93:b0:7a1:f7d2:e827 with SMTP id
 ada2fe7eead31-7ac1e25c9a0mr2449263137.32.1790175380384; Wed, 23 Sep 2026
 07:56:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904-rzg2-sr-boards-v8-0-94c4674927e8@solid-run.com> <20260904-rzg2-sr-boards-v8-7-94c4674927e8@solid-run.com>
In-Reply-To: <20260904-rzg2-sr-boards-v8-7-94c4674927e8@solid-run.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 23 Sep 2026 16:56:09 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUYm-hG5RcQpa4GGF=r07Lrgc5t5=Nu9qPhJTyx5kebzA@mail.gmail.com>
X-Gm-Features: AclHuK_46aJgUmbOx6pmISWhWZ74QNKHCsrv6CnnvbaLCpF8u6RT7TH__uXbV0M
Message-ID: <CAMuHMdUYm-hG5RcQpa4GGF=r07Lrgc5t5=Nu9qPhJTyx5kebzA@mail.gmail.com>
Subject: Re: [PATCH v8 07/11] arm64: dts: renesas: rzg2l(c)/rzv2l hb-iiot: add
 dsi panel dt overlay
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

On Fri, 4 Sept 2026 at 13:57, Josua Mayer <josua@solid-run.com> wrote:
> The SolidRun HummingBoard IIoT features a DSI connector supporting
> touch-screen displays and is usable with RZ/G2L, RZ/G2LC and RZ/V2L
> SoMs.
>
> Provide addon for the Winstar WJ70N3TYJHMNG0 1024x600 dsi panel.
>
> Add the addon in Makefile for all supported SoMs SoC targets.
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
