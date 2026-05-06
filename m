Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 643C4368275
	for <devicetree@vger.kernel.org>; Wed,  6 May 2026 10:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778062769; cv=none; b=PqCE/XaArP1k6cweVAV9P2yksWJYXx1zXYiFZ0HjPlBEyiyfQCfzs2s/ib82PflrtmI/M7lvc4uWIoE9m4AJCkSmPz7oLr6fb53lhij4H/ow7fD3CTg4lDIniwIutnhcsceoI3XEoEaDXHLCafshTi1PluhtKYvSoS8UnrZKabQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778062769; c=relaxed/simple;
	bh=B2Xa6VZztFm42sxYFXowro4G1pwYLrRZg7/codjLEJU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CFwwmQEbXOIPgWHaKLQ7h4IAEP6LY4Vj382LwmYiueAI+NeXQKmbJ/lTfPcqsrnONt0XZ/lWyBqXhEMay/XUrALOyQLISSX+y3qjPZ6yBTAbHKXgrAxg2QeCebqth1Lcgh/JbWkExaR3SbSKPWpbrl6CbEjtQQ8h4VL73Y7z73E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-95ccd87859fso2432855241.2
        for <devicetree@vger.kernel.org>; Wed, 06 May 2026 03:19:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778062765; x=1778667565;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=frOZWVrduNGKMu3VYaa4JiBvzYZTtFtYjox5RDxS4rA=;
        b=HwOimYd+tGHXM/T6ywE23/BvIQhRyNgU8TO4D0RF8k0Q5K61ie5Opw7WbMXpdPWQbv
         jflCgP2AruKTaRW2AkE8zSibRvf323v39UKZEhugbGEG0oJyQabpsoHr4KIHNMUOG+vn
         TNUpY34F6MZILX7rYNd5q8dOvk6oLEEjBlIfclww91yqhAomB8kSNiNb47DjDeEpmN77
         hrX7TB6AdXrSgscw2NlpH5wSiqDwfUO1scixM/UvQFBaVdUB9siytC6CgLV0yC9QYpAU
         x4sh5750F0cvyLuQG2f/qwCjF6+SF/O6d30+cqidStrah1w5SXxoXSovG+bPIGYLLtp4
         AO3g==
X-Forwarded-Encrypted: i=1; AFNElJ8Ty4Oa+m02R139yuSS8T2iX+WUqGW9DoI0syQ5t+Oo4yBH6dS0x0pK1PMMBIz+2IKdkWxkOl6zbwvR@vger.kernel.org
X-Gm-Message-State: AOJu0Yxsc7zaeoB19cIjJDZ1T4zxGEFEO/MfMtA3bxwFd86CyDCpnzwB
	T+x/S71IbUeb47S37WQ4vBb06t7chWE/B1TxBX1Bg8qDV32PiT+q58+7fYkpSoE2
X-Gm-Gg: AeBDieu+Nup9sTCkeP4lGLxO5PdoQMHnfm12Pv+VHBPvhcppVdRYNqt1pxTkKx/Qjno
	UJr3N1iyzlb9rE0xa6cwJ6LU7V4GpHpzGB+JiLicasGIuJRxh4f9Fu/hTijcVC2KPi42DZNLius
	f8v7w2S7lYrz2SIxrW0nqTsUtwLozihUX0PhpHUoV4i1n4WtcSQKnRpbJ6uaUJKlPMCNxEniA66
	aZMOou4QipkJYsDDdkWdlydVibG8xgOvqv330Uxm6BZi9vZPQlo/++/2IQ5GM/tVxwqF1tEdnzQ
	wis42xad5Ai3850cpV3mGsF6zhqzQDAgEC0pMUllZLNlmmMDTNknpbphwd6oH+x8T6jUxLexgRc
	ERiX6kM2IGUjRsKP5/P5AdvbghpvR8N2AL/gyOsKF/vCcQvuSIaSMQGxrMzq2CD9UkVpgKQstJ2
	Bgz/2SXYbv6Lco67gkJHH6fQAUBs3GEdO/HQsQdwbn7dWUP/SP8Xb4GNEVoNQQIDbeeDNlrK0UE
	OdmowgPueHCng==
X-Received: by 2002:a05:6102:cd3:b0:605:2df4:c5dd with SMTP id ada2fe7eead31-630f903fa97mr864057137.26.1778062764663;
        Wed, 06 May 2026 03:19:24 -0700 (PDT)
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com. [209.85.221.174])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-62bfbb75140sm8838341137.5.2026.05.06.03.19.22
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2026 03:19:23 -0700 (PDT)
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-5675d609621so5814759e0c.2
        for <devicetree@vger.kernel.org>; Wed, 06 May 2026 03:19:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9Xpz2IOueE46nIfYRJx11L4WKZy1EPIs2VChGRSPTAwKWJfqo/hxe+4RbbJ0f2dFpA5FflRlYT0Hgz@vger.kernel.org
X-Received: by 2002:a05:6122:3214:b0:56b:815c:961d with SMTP id
 71dfb90a1353d-5755963f49fmr1289109e0c.5.1778062762167; Wed, 06 May 2026
 03:19:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260504144534.43745-1-marek.vasut+renesas@mailbox.org> <20260504144534.43745-4-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260504144534.43745-4-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 6 May 2026 12:19:11 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWdqDpU+AZrwz5ccbZPjJfp5DspoVscYi=Q+w-nniuuCQ@mail.gmail.com>
X-Gm-Features: AVHnY4JCwkwAqaqLSNXuaf0ETjjPOv64a8QgXMobUA_baaUFwZots-RZr9ezKew
Message-ID: <CAMuHMdWdqDpU+AZrwz5ccbZPjJfp5DspoVscYi=Q+w-nniuuCQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/7] dt-bindings: clock: cs2000-cp: document CS2500
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, 
	Conor Dooley <conor.dooley@microchip.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Magnus Damm <magnus.damm@gmail.com>, Michael Turquette <mturquette@baylibre.com>, 
	Rob Herring <robh@kernel.org>, Ulf Hansson <ulfh@kernel.org>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 4 May 2026 at 16:46, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Document backward compatibility support for CS2500 chip, which
> is a drop-in replacement for CS2000 chip.
>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Acked-by: Stephen Boyd <sboyd@kernel.org>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
