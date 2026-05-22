Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0F373A63F7
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 13:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779456205; cv=none; b=IBLZpZ3c87V/cLEP2erLFFhVX/too9yDK8MVaIpH1mt9fKQFyWvF0qeMNKTOuKQ4usQp3yonIWLhkz0p7QjGm7tlKrSX9fGHTcTPvw1JnANgssi0GVRg/PKulIoQDjkHf/+HbDGqRl2txQDAnL45XKwvuQTPNseJgQv8v/kilrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779456205; c=relaxed/simple;
	bh=0PK4bMqXimU9iNRWNX/eX952I3s/oyh75Caj0sz7gdk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lCNY261kwYI/9LlzwzZWCp0yn5yrcBABtxRw1gl0liOIwLrA2ziOupT/V8fc99lzUIAMbSGyLNQTOqB+iWmt7tdcW4gdkubA3cff6HEmrSpCKXoWHniYC+TrhZIVjSVg/Re/wSzTjWJDz4XV8DsvnaayWSI08pHZuzjanYD3Uzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-bdbcc6c4500so340379666b.1
        for <devicetree@vger.kernel.org>; Fri, 22 May 2026 06:23:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779456202; x=1780061002;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b8+hN45m6EcBjSVmc7/E001s4aXOZE0CXpfrpaEBAfw=;
        b=gqxKE2by8TWN/uioUg3e1gfE/xfBYIQgF3zD0sUdlad0bUZMjHFuIJ4rOfROL7jaX+
         2NalPvqAkxwel3lhb2gzNAVVY8Az1jZMbN/bX6M8ASlN2yCHqzhNri6OmyznESmF7Ft3
         nhBtbCpDrnp3cIu08I49asXwkk/1jf98XFnaP9dvA2rFH767swoYP47ZEHL3S/c/DaHm
         CKAM9RE0uu9qZ1Eot1X8xSSvlKdWvvkYFFMIM/n8zPs5B83F6DNwgpL5zndoWXD3twcF
         E9AaaTsuTj/dgnpWbmqXbSiPAMiESRohYndi2Y62f1N1Y4Ugh3o8f0W1VmXvyrkNCo0T
         QIaw==
X-Forwarded-Encrypted: i=1; AFNElJ8SB5IY2vpUJqtgiYYuUUAiE+UB0m3CZQrCX6VS/+pieraFBZi8XpBXm2JtypS1huNxKWRtlB26Us/b@vger.kernel.org
X-Gm-Message-State: AOJu0YxVaBM1Vn1kAGeqElvlgd6PLDG6pSBKHBacOxBHjd68x+HsUaeD
	SFXAfkuZsP9gUfZESeXQea1Zk/igRkxGreKhWnaopf2vcQn+/3tMM3xxP3nTzs2E7Ew=
X-Gm-Gg: Acq92OHiNlarG5aaxSGLhAiLGp23Tbv8NGm9Y4DyVvgt37vnosCKXTuY14Mo7Y4yHpK
	GbvvxyKwwYysVEP2RNsZcZo7SQ7qdt+D5XGJdPR6iyxkuqX8kLECcyONNSyIfvsNu54zfNaIzW+
	uZQ2UVtwMsARrZxcbIQcVlaK7lBWCn+/N/LfnTzt0291lwxsIEv7x3RYS85tVuzg4qG0KwrS56R
	nT2Ftgn/dz5Ai2qlhMKVp5oyTPWcpHWFwXchnwY/WGJ+TIwIQ+c0cdbOk4BguSXam7wc2r3OaP8
	/Vcrj7f6nQfWePhuXnVIPaKGZdukxelwohxT7NNvpmggBd5TSyjKS0HRxC+TYxIO58r9z8jWbDE
	DUkAbKbWbUKm3Z4q2JnzE9M2AUXS4GipSDaTp7fGVTrr6ubyUlVcCVpKYrYJVG7hHrrevfxjMlF
	qwXlDP5C/0eA8ajl7hgJFltvlmktYKirVVj3lEoGU9z+HchW6V7QeVr7mvLwwV
X-Received: by 2002:a17:906:ef0c:b0:bd4:7cec:1066 with SMTP id a640c23a62f3a-bdd277d3bdbmr236244966b.44.1779456202180;
        Fri, 22 May 2026 06:23:22 -0700 (PDT)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com. [209.85.208.43])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bddc62d3f21sm53638866b.44.2026.05.22.06.23.21
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 06:23:22 -0700 (PDT)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-68852a4fc68so230859a12.3
        for <devicetree@vger.kernel.org>; Fri, 22 May 2026 06:23:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+oVHEZOmelTqp5sR2toR2hL5EEJCFQgAeH2TxIjM8Hn7ggGYYsxV1J1TPdpNvNqrcvw9x+F5TiOpEK@vger.kernel.org
X-Received: by 2002:a05:6402:380d:b0:687:afc:23be with SMTP id
 4fb4d7f45d1cf-6889c43e8d1mr1763806a12.6.1779456201755; Fri, 22 May 2026
 06:23:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260505034325.167797-1-marek.vasut+renesas@mailbox.org> <20260505034325.167797-9-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260505034325.167797-9-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 22 May 2026 15:23:09 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW8vraGEzDa867W585P438Q-Ad6pV9jTCNG+t08kzqXqQ@mail.gmail.com>
X-Gm-Features: AVHnY4Ihk2THxP9D36ru28lIf4LHCgnk9MqLoJMcextr1G3iaJ6rvpPRhCHiZPg
Message-ID: <CAMuHMdW8vraGEzDa867W585P438Q-Ad6pV9jTCNG+t08kzqXqQ@mail.gmail.com>
Subject: Re: [PATCH 08/11] arm64: dts: renesas: draak: Specify ethernet PHY
 reset timings
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 5 May 2026 at 05:43, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> The KSZ9031RNX reference manual [1] DS00002096H page 60 FIGURE 7-7:
> POWER-UP/POWER-DOWN/RESET TIMING Note 2 states, that after the
> de-assertion of reset, wait a minimum of 100 us before starting
> programming on the MIIM (MDC/MDIO) interface. Set DT property
> reset-deassert-us to three times that, 300 us, to provide ample
> time between reset deassertion and MDIO access.
>
> The KSZ9031RNX reference manual [1] DS00002096H page 60 TABLE 7-7:
> POWER-UP/POWER-DOWN/RESET TIMING PARAMETERS row tSR Stable supply
> voltages to de-assertion of reset is at minimum 10 ms. Set DT
> property reset-assert-us to 10ms because the KSZ9031RNX RM does
> not explicitly spell out how long the reset has to be asserted,
> but this at least covers the worst case scenario.
>
> [1] https://ww1.microchip.com/downloads/aemDocuments/documents/UNG/ProductDocuments/DataSheets/KSZ9031MNX-Data-Sheet-DS00002096.pdf
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Modulo the document references:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
