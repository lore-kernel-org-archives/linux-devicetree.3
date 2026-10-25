Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792926624;
	b=qcd7vP7gWvkw8BDlX3UieXVHh7211THHpe4CEqc8t7+TfJP8yGZliYQgo1MqF+6Ae8gZ
	 hg5kr2sSvUGADy3iUSQu5d05pCe8+pjGbuu8F+12Rl4rGCP+mnTRqoEJaITLroqJEcjiM
	 1dyDBveuLXOKRgKZJV+XuTqWDSx1B671maN6Se7kpIDd4QdxdDxS4LKnpkyQuoPgfNl8r
	 YcsyXAP2ZvC1O1qvU8vaMOEgo4XV2b/SkJqHmIno8SBkcnIFgG2IHOm8VoDGRi1b9oFHg
	 spUO4z+XQP6F1Hp+f4eBa0P7Yd8E8UftQY0itTMPWOWC8Ed+4zKwUyaT63TsHZBot3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792926624;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=GjtDmUDJ7P9a7dCWsPAQRfLzfmaw50jjj96MMkbrG+o=;
	b=wShKGtRUzLoUqh5EyUDVNnNZ5hWj8cywcYuFKo8Pz0DZ1x6IGAU5A0HC/N/PPQEE1eBQ
	 mSyJU9dJpOUu142KUyPTWtqyPsIxM2CS9aiON+exMXXqU8Szo22J5ndAmZX3xENdnyjs6
	 PjoiXwyW0LiSJPSk5trCcG0/Hgnv/Z39LQkWsflbik08i+5NGUqU3Kdm0i1Cdky/+GPgU
	 +ZSVZJEJd/XlguCoC7R4Td0PBjIZUn9MpIgz55pHO99eT1oYNQ+Jc/t/N1tF/VG/cQNvT
	 ucuK+CO0Ifab9mY1R29PeRQojfh/atydgYxXk/6JOw0FhVHXymlAH/n+DGytn8j55mA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.210.47
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AF37606A31A
	for <devicetree@vger.kernel.org>; Sun, 25 Oct 2026 11:10:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6AF37606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-823e4047037so1735241a34.2
        for <devicetree@vger.kernel.org>; Sun, 25 Oct 2026 04:10:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792926623; x=1793531423;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=GjtDmUDJ7P9a7dCWsPAQRfLzfmaw50jjj96MMkbrG+o=;
        b=z9n3l73W1SQ9Hji/WTWwmONdgNhe5wNGxM6N+TI/38Vz6JXiTS3eq5dbv8JQEHWPOA
         H8zpyhmkNyX54lq17Hl+8gGn2caLTKmsVHndNaoXCfWcJC95LtnIE+AvGZtCEk1wPXMZ
         6gze6TRaxeJewaczTFy+i3BTxnCQVtn+MXCwyTj+Y7ObzjB+g8JRsHpWctvFDvMH8Ufp
         Pz/8c/vrC6lWxoRgovwSLjkwInrAjXg8yUxYWiXdiTw+b2QqxNSAgrdvAZac5eowufrw
         s51skKjzQI2o0EcsH720sMbKM3WZg/yHUpHiDSxIuf4gGfEceaOMDC6uIUIqsqRFi3eX
         NMjw==
X-Forwarded-Encrypted: i=1; AKwUvBxrIWhJ0telJ/oaof+K78/TTC1GSMnQmo28YK3llr2vtqNxfaV3iUNOTeBPwD52l2ijzgFsFKNFDZpJ@vger.kernel.org
X-Gm-Message-State: AFq9FYIVjclIHf0AXqN0PaqKlbvd6EDrPgduyS/qREfzbj/RlDEOnaOw
	+7s+nnKjXJ0S7IfJTnZCLd5Dj2qloxcSciCWNcVfdVUKr/4YOzcdRHP+Kt+UKkSO
X-Gm-Gg: AYBFou0V2mhp+/yyBf6gbhvN0QIqd+hbnqSgQfvO+JDIGQZR+N6knTsIbyAFJrzmw1+
	7h6gnO0bCll6d8Gey+WAkxhE2yMs9UUiq975Ao1EvLQ9+9XvTTcCI0L2l4GjDz+8PnIXiU38oAU
	kKikK2MHKnAUktMQG9CV/br1P06kzuykzcc4DEpKyIJcPEPT1OXA8mabIHKpAPRHJQxyLICtJKj
	SDs56TrYxWI757IDtuXHWlXgXfrK3oHY5gyFxaNW1BZUbmBmc0FoLTkHs6vLb22X1kCfIzfYnF4
	hLQv96eP3bHr36ra/6fPExhVZxsDmt7z0heN/jHduGhFSeXb6mgaagEECsHU5dXzG8qQqFyqW93
	b0qhpCsRzGGKKN6oZ9Mts4tp1jbWOKCxsRzrP4BhvPEfV9tg3pDijFhCqdAQpoR1aZnK6Owav7W
	RIZ4WctTvz5Y7Qlukgv8NNO9cAgAix3fWbH4I+RNj0hhWWUxU7KwwxBJbBrmPVG1cUv+xlyxUeL
	q7pm47uI0es9XeByAOqJf8WVlg0kS9jMLaOYStppZvTeF17rmCBwzl0rN7P+K3exFbO3szZvBa9
	m7skBL5VJxfP1dzxJs3qRQayKiwe5cRXM9t3tI0=
X-Received: by 2002:a05:6830:4408:b0:821:c01c:2ec3 with SMTP id 46e09a7af769-850f81696eamr3242768a34.0.1792926623489;
        Sun, 25 Oct 2026 04:10:23 -0700 (PDT)
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com. [209.85.161.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-850fa99c4f2sm4596694a34.6.2026.10.25.04.10.21
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 Oct 2026 04:10:22 -0700 (PDT)
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-6e560e00a86so1504140eaf.1
        for <devicetree@vger.kernel.org>; Sun, 25 Oct 2026 04:10:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzmFSa2gxFGp8IkaCYuSt0hnHnNOJcWXPU343ljzTz5kBnSiePosQj6boMu8Uqp7iSHhAQ4mVFFw/XD@vger.kernel.org
X-Received: by 2002:a05:6102:4423:b0:7cc:776:6c54 with SMTP id
 ada2fe7eead31-7ce5cd246a2mr1349167137.21.1792926141152; Sun, 25 Oct 2026
 04:02:21 -0700 (PDT)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1792776697.git.geert+renesas@glider.be> <f9de8214043ad4c8748fadce7fd2cc2fa95b1291.1792776697.git.geert+renesas@glider.be>
 <d870c163-8d90-48c0-bae0-5f6e0e38c5bc@mailbox.org>
In-Reply-To: <d870c163-8d90-48c0-bae0-5f6e0e38c5bc@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sun, 25 Oct 2026 12:02:09 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVcxDY2q7MK6Zj5MFi-4UVJe=i8L=gWSTCmLE4NMjdh4Q@mail.gmail.com>
X-Gm-Features: AclHuK8CaW_17mlyRa4Y7XpLgXIYuKk4YmAF6_as85fetPG-fOFZ1fPRmRtKgD8
Message-ID: <CAMuHMdVcxDY2q7MK6Zj5MFi-4UVJe=i8L=gWSTCmLE4NMjdh4Q@mail.gmail.com>
Subject: Re: [PATCH 3/7] arm64: dts: renesas: r8a78000: Add GPIO controller nodes
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Magnus Damm <magnus.damm@gmail.com>, 
	Ulf Hansson <ulfh@kernel.org>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-pm@vger.kernel.org, 
	Marek Vasut <marek.vasut+renesas@mailbox.org>
Content-Type: text/plain; charset="UTF-8"

Hi Marek,

On Sat, 24 Oct 2026 at 07:35, Marek Vasut <marek.vasut@mailbox.org> wrote:
> On 10/23/26 7:50 PM, Geert Uytterhoeven wrote:
> > From: Marek Vasut <marek.vasut+renesas@mailbox.org>
> >
> > Add device nodes for the General-Purpose Input/Output Ports (GPIO) on
> > the Renesas R-Car X5H (R8A78000) SoC.
> >
> > Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> > Co-developed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> > Changes compared to Marek's original:
> >    - Use hardware clocks/power-domains/resets instead of direct SCMI
> >      references,
> >    - Drop gpio-ranges properties for now, as upstream lacks Pin Function
> >      Controller (PFC) support.
>
> Is that ^ OK ? If so, good, TIL.

Yes, it works without PFC, as long as the pins are kept at their reset
state or configured for GPIO before Linux boots, which is the case
for the pins on the PWM connector.

> Reviewed-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Thanks!

BTW, looks like I used a wrong base for submitting, as the context does
include the pfc node, which is not present in upstream ;-)

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
