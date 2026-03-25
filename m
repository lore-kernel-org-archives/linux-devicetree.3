Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B32D93A3E64
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 14:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774448649; cv=none; b=Djw83pKiECsVhQSjx5h8ZI/+al7qjcy7fyX0mpi+0wKw9ST8ToJNruiaZCFQpBoYHgV9e1kDRAG5npv6t4VP+r+ZGqsdaq2VIP9NzMrIj1sezWFHA+8rZbVxo1NtR4XvBhd35X9Vma48llBrc4ngxUAqeNc+GvejuWmdeAHW05I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774448649; c=relaxed/simple;
	bh=rNqNBC0tV1vIvoQTGjAS+aB4LTfalkbiJ7TIivz6JhM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z1SVhjDNplWLumbhG8zeM06o/Iu5CIuzmyASwLlI2RcD7py+yrm1WtRiIVyRdKGDts39fn121lX3H0EmWjbvp0Hq0qDEPH6ok+NPBpJ7PHw5qswEo4yxn88UgE9RIMjkpeyducZtC5BgYA250c+HhRtMqFNCWL58hxdBnE1bauY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-604cf8f0df9so109015137.0
        for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 07:24:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774448648; x=1775053448;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tcbIQYAOh9cDG6sNZOxVKtvVxUHP1WsG0mtWehRBwvI=;
        b=FtQonGkm1Qwnfb7MwI96ZHPuvLe9fkztdmqI42tqkGJIcf+nRok70N9X9m5iR1nkqr
         cH18/3PwUgnxycmcsIC7xrcbKwuEQ69+UoVvCju3VVJXYZJOTzDxut6H2Q6w7Iv0Djz4
         j2Y1+YDx2aA7hfZ0ggnMeUGDRKhtHUSVePGXNQFbBjvqk9tWI0RQOCT0oT932BnSVI3N
         kBk0sAXx7Rso76ahddig0wgVwj4g1VZD/V4LkPS1oqzKPP7DsBhxOwTkRmRUikT7fQ0A
         2ZzBIu3VJSLbqw5NDcVTFdywRDPdizuGF5/1m1ARC+uLio1EO6Mj1iKFXqMvOfciFiHJ
         PbJw==
X-Forwarded-Encrypted: i=1; AJvYcCUGrezPnr9cS8xpLr0pKsFDrjFp/3P7g+nxreitUkhU3Q4tPR2fP6372aqJ06ns0mJq4SLFN8DgjDdl@vger.kernel.org
X-Gm-Message-State: AOJu0YyzLMcDgdmt0IR6YblBLfVE8khznLG/MhLGe59DJYEk5ZmuNdRq
	iRvAgUh6PIqmQQn8LVD0IyM12cdxs8po1UayuoHAmLjBQTwXt8JGAxfKwgv/AEJW0zE=
X-Gm-Gg: ATEYQzy69W7KI2rID2EIGJ134zEav2e68GoTd8YXYyQU17LnzZeQiNTaKKBDiE/XHV/
	2NWraV8B75lDgV21gtoZNBe6PWSG5EmK/aDh28OrGBTeC24VyS8Jjj78SJtYol3qHmxG45KfMgO
	pmIE/tOta6NBtBEkT7eW+JtJNgIAaPNgZ9ApJG/C3RQuRhC7SaxPOkkO0tt04ffhRRLEt9MyWLp
	M+4zTnJAZ3aWYccIipK0hIvDCiPDDJrxz83wOSgatIlVB282lHZvP0pDGu6/wIJQXxaBZwMOJhX
	kO16Zo9wuvaK4u+2tnvuj8SlbABSmaaII2kUfsrQF3PRLV1sfXAsso1gcPADksrstH7lNU7g0C9
	X4DCpr5WoQjQ+9OgBnXOXCew1IMn25hyXAV+riBfjUyXA0oiEEzSHmNwUIXrqm3hk7yW5bxy2nL
	RlwTwwKKeXfLaWqVo3aD9B8qYtSY45YQMYUX75EZCGuhtL4a08OOWqFXcNuWqA
X-Received: by 2002:a05:6102:809f:b0:602:709a:52ce with SMTP id ada2fe7eead31-603870aae4cmr1781608137.10.1774448647716;
        Wed, 25 Mar 2026 07:24:07 -0700 (PDT)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com. [209.85.217.47])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-602af8ea547sm13896294137.6.2026.03.25.07.24.06
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 07:24:07 -0700 (PDT)
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-5ffd57b6fc6so1572815137.1
        for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 07:24:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWYkiZ9zRW0HLF3CqrVYdkcvsBiZPYsnLjrhWa0i7nv6uXSN2Q0rVsMrZvWhqCFrigWBVqwmPxyyziD@vger.kernel.org
X-Received: by 2002:a05:6102:5694:b0:5ff:cee8:6620 with SMTP id
 ada2fe7eead31-603870ce0dfmr1803350137.11.1774448646696; Wed, 25 Mar 2026
 07:24:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260313164008.40933-1-marek.vasut+renesas@mailbox.org> <20260313164008.40933-4-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260313164008.40933-4-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 25 Mar 2026 15:23:55 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXfRS7GNfjap74h5rUx1v4btr87vWyMRON2-5FMUVwMzw@mail.gmail.com>
X-Gm-Features: AQROBzBQrP8z2Gc4Hd7jXaA3HaJVzjYUVvRTvP9CWmOYpIcArfN0qWHYtAQ_lAg
Message-ID: <CAMuHMdXfRS7GNfjap74h5rUx1v4btr87vWyMRON2-5FMUVwMzw@mail.gmail.com>
Subject: Re: [PATCH 3/4] arm64: dts: renesas: Drop KSZ9131 PHY C22 compatible string
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 13 Mar 2026 at 17:40, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Microchip KSZ9131 PHY schema indicates that compatible string
> "ethernet-phy-id0022.1640" must not be followed by any other
> compatible string. Drop trailing "ethernet-phy-ieee802.3-c22"
> to match the schema.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.1.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
