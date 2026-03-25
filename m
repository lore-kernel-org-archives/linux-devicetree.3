Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2480344DB9
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 10:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774434234; cv=none; b=TRWef9bSU1HkfRBAjknpP/iS/RGy86CXKqBEkH4jxet3W4DG9d8s+waU/7nsu9XOACeRivVK1GHYQhUCXNVS/bqUpjU96SZSVoClCGVnFg1ussZomvHxPmYYLp8Kq6ZnJh+I4rulbqW7SZwaYhF+j2aIKmj3JJKtYRa9jydGHHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774434234; c=relaxed/simple;
	bh=OEBtpeSr41dZ3EZGknc7L9hCWxi5F1KcZZ1/d9YvxG4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iQx7iu+/fSGh5njuYBAwvvyz5P9/MsW/1mEB+RyJ1ycYwrNA6J/3+0BGBBPfucBkiwOSsdO5BIDTsD3Y9BAOQDyiWcboe2M9H+391YNu05Sp/7l2fd6ZTwborDTNaUcBsou6AdvFAWraGwjhnpXEdmMrAEkpE8KMqyVpHU92Gpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-5091d71aa11so9258481cf.1
        for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 03:23:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774434232; x=1775039032;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HNQGjJuwM+3CX5QT0Pm/2VPyuySRhYU5/R5xPZKy+IA=;
        b=SAVDIdIAE/U4rl8uqvNV1ddFI36gWL1De8lMgqelZ4wtDVxQ5Zkr0DEzdB7BUeARwU
         yMPMp2pJgceW0aBWcjM7qQrbeOP8PYpQxBJVOzGSwUMHUnDPuoYlspYHt4BMajq2LosY
         9nuj8mtlp+fqN2NAUEZt4U7DdtkrdUbxvw/YRJs5CCrbg6qZFx26Wzrit/wGcdA5RtIc
         XMqKHj3x4ZmrrlLfN2wm7ZOL+ukw20I7K2XGQxnzV3D5VmpzcAA22ty8Gng3njB9WZ4w
         OYr3IVcgWRXPW7UujE7vDNWxCMIaB/1lODI/wZEaq3dj4hKhZcl2xNCwnMt3R3wxChAj
         x01w==
X-Forwarded-Encrypted: i=1; AJvYcCVkM8n39I9/4kYmjVMYhE/JQKxsgaswzmu0YnC9ysfKr8B0rxhh11zn8MdJfqoNwmX8QMTJSeRhoj4g@vger.kernel.org
X-Gm-Message-State: AOJu0YzDxAmD/48ApeAmLX2CIY2wZ/3O60OT7xZD7tJh2VKWxDxTTDkU
	FaOPqmYDa6gDX9nMou1/0knSEPGbeVgHFNqZFP8jjR6pWq+a+Y5S63bbOql04bvsASo=
X-Gm-Gg: ATEYQzyQ09FJF9Kp8TO7KjCUsYK7carBvzMR3tAtyAKJWuKecCDqwzyX6cesu5Xr4dH
	6OGyQx77p8yFoWQtVk1mBdNTVLkICSMqhxBw1G0iGuEkf73SNk97ukF+YQTMMwGWnMjkqFtehg+
	IUYIHRa4A8mkKCPag9nt2ApJ6CItiyMW3j0hkL43hQGMds/7ovPR92gWcS0Bt4MzTDsjtYcgtse
	hAOmqu+pX7lRCAjwsF7JVi9lPfODfAYE8cCnxhdJh9DSJOedKj92I82BW5ezjGvH+jts1Elx+ZV
	HptCY1ZZu2lywqUHVL7qaCPXPZxQ1s831inmFUC1Qu2aPInH2vm7TG3DhxbGseKjzJq2lvkSsc/
	9w54KOYulSLzB5Ru0VVG+zt+MdLRQdePR/u/gMxcg9FQr1DIws7L3zG9ZlJ1P0+oZthJu7qMXdO
	yaxTnv1xjrBKfyDAF+8yc4ACNc3KHoqv2ClIVqso5bMH9yYP88fb7pyQnbuk0OgLjohxogQy3GB
	9Q=
X-Received: by 2002:ac8:7fc1:0:b0:50b:3128:9916 with SMTP id d75a77b69052e-50b6ed9c8cbmr88572181cf.18.1774434231549;
        Wed, 25 Mar 2026 03:23:51 -0700 (PDT)
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com. [209.85.222.178])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89c85215255sm170385906d6.3.2026.03.25.03.23.51
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 03:23:51 -0700 (PDT)
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-8cfbbdbaf3cso88768785a.0
        for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 03:23:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWv0pcyK9TfzNN3qFs7kScpPegpq/Ew3oYDpgLzQVlGENAnKMUW6BU1qZE+4IP6NrqcknU9vY7M0hwL@vger.kernel.org
X-Received: by 2002:a05:6102:2ac7:b0:600:d0f:bacf with SMTP id
 ada2fe7eead31-603161b855fmr3344811137.11.1774433798679; Wed, 25 Mar 2026
 03:16:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260324225239.19136-1-fabrizio.castro.jz@renesas.com> <20260324225239.19136-2-fabrizio.castro.jz@renesas.com>
In-Reply-To: <20260324225239.19136-2-fabrizio.castro.jz@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 25 Mar 2026 11:16:25 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXcKBYrQ+5fP4b99zKD0q81LXeH4w6ssP+iOUQNEeB3Vw@mail.gmail.com>
X-Gm-Features: AQROBzC-crhwu8Gg_duZpu3fi-1fiqmCCzQLU7W9KwffAtApPIHHGTBoF1MILbE
Message-ID: <CAMuHMdXcKBYrQ+5fP4b99zKD0q81LXeH4w6ssP+iOUQNEeB3Vw@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: renesas: r9a09g056: Remove wdt{0,2,3} nodes
To: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 24 Mar 2026 at 23:53, Fabrizio Castro
<fabrizio.castro.jz@renesas.com> wrote:
> The Renesas RZ/V2N SoC (a.k.a. r9a09g056) comes with 4 CA55
> cores and 1 CM33 core.
>
> While the user manual doesn't explicitly specify which cores
> should have access to particular watchdogs, it turns out that
> (similarly to the Renesas RZ/V2H(P)) it only makes sense for
> Linux to use WDT1.
>
> Remove DT nodes wdt{0,2,3} from the RZ/V2N SoC specific dtsi
> to make it compliant with the original design intent.
>
> This change is harmless as there are no users for the nodes
> being stripped out of this device tree.
>
> Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.1.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
