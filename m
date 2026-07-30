Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51375407582
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 23:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785454373; cv=none; b=cLJlA/0zwvZ8rK+O+CdL8/U1NstfcClyxyfXjR8QdJaW3wzpNxlUADKxOKT0AzmNrnVG9E5SmngmpSVR3h5bC1SuCoM+9DLxo5J3IcklpvigzmjS4dQgy9NaGklPTiDIJaZT3t8S8iaUvLAqEaHVv3zY7225uEzOUCdT13agJsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785454373; c=relaxed/simple;
	bh=O0SjzN/C0aO3qHhb3UBjmXFOhQPDFTOsNKhcZLytoNI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oKUneZuclsUUWhdWA7QWG6GPHk+4tpwjYKLo/TCJwomm+ctJRsZB/sFGqqAI4x956+KFJd93rLdfcxl3OhDhcYN+13hmv005AHjb5NUozRX+z01uTPiY8YAMsRAFffGata4JDFgPFGdIpUwhb8BhGiy99F5Bs6CSqQ8ZvFKwTNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=KyBu6w2+; arc=none smtp.client-ip=209.85.222.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="KyBu6w2+"
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-977cf5cae50so67229241.0
        for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 16:32:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1785454371; x=1786059171; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=b2iUYeLjQUxHnF+XDQe2fiV8PKRsDwqLHqM0lXiq4GU=;
        b=KyBu6w2+vXEsGob9zfkF5EnIJ2qGNtDhAnkDfNirfUtI/ImnmPl7S7ib/SCUhduHnq
         nKevoktcIwUxBUWkjGJgK1wxG3QbFqpnYNZsxqxAMQXF0Cq3RLcOslJXk74nhh3u25BO
         7GnmAS6WYOnOrzeEpSsuZwZQj5nfZ9ykWTQ38=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785454371; x=1786059171;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b2iUYeLjQUxHnF+XDQe2fiV8PKRsDwqLHqM0lXiq4GU=;
        b=rkWzKWn+rAXtgk6Jbjf5JYcqPR68nZ4FTrUv00DFOBhfS8a3NjGDvJCDBXAU647MVo
         73zjhHx9Kr0asVdO7CQi/uZP4LGbl7OiH1re7+EU7S9g/P3YltzqGhaLyEQFOrzlM8DN
         gQJ2C6al7as1pOYwym8WbushEuGJvXvFCk8VYMzhvKOtRhhVcKCnZcVhcbs9R72HAWOl
         mq3xZ1BBricfVJe8w0J4ROUIBCJIdVJbNvkOENERznHOuX2iC6MIEKJu3uQ/SI1LjhX1
         yWd6qHa+Gklhpt5tGLudzWtV5ls/It0242wpZNKCYcBILX/BHPZQBjxwsq8kTteUCFx5
         3YXg==
X-Forwarded-Encrypted: i=1; AHgh+RrXOImXhVHoeUJzqMXCScy9vybTCV6vdYWVvgLWiEJR0p1aCtluIP3iGoTBlepeRzBuQMe/47hb9pEb@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+YnuAcKx9PM4a4E1TohQ5Y8eZaV0pRAL78Y1gOtcY5NqPwGSJ
	yqI1VEU0xST2ko5wS0H9upstQwQiMb+llmGUB38BBbgX7QJ/U2bUtJBZZIIXqExSVQy+IIlRmLi
	7oAs=
X-Gm-Gg: AR+sD13tXUMXx8fdhHokAm9vYUb9jv3Ppkopm0bUTN0ZWN+ENfSqyeh8mYF8w0XsOkc
	RJ2n1iwM5AX96JScKeF/McbSxXeodH3AYXM+VzgVKgZsaTbIVZGbzD94W723UgY2bDfLmmOVurA
	LsJ7XSJHZGsRIA8d+bSJ1ZRKTvHMXdaclal5R3025AK3W4d5CTDWGUCeJMZmIYjY7ypMAWC+AmU
	BQwM25zToX3OzaxixNo6FrUJgo7cBxSp6c7Xr2XZo6IvBQxTvKhnx9NNHX/gxA5a9EGPYgiidAy
	fQaluUZmv58F615hF+r7clBpehihZdYQ+V0szPczIxM7HlZfl29/A876FzL50FI6Mn1QOuL+50o
	XGYvWlob+32g5w94eJgaCy9OENg9F0zQcR3Ihaxm/FMUIZ5gpFI7kw1olqarPK6OygeZVpM/UEU
	ER9jYIjtVtGnQMC+196/f//rnNRHFRXxAIe5asC78XduI5szcIt/nduFrm2UoI5q9zftRcQ4Wyh
	NTtTRyq/Pni5Gt7arM+AaHWEtU=
X-Received: by 2002:a05:6102:3e85:b0:73e:9fae:5841 with SMTP id ada2fe7eead31-7575057a17dmr1741375137.29.1785454371068;
        Thu, 30 Jul 2026 16:32:51 -0700 (PDT)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com. [209.85.222.48])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-977cddf2568sm2296117241.12.2026.07.30.16.32.50
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2026 16:32:50 -0700 (PDT)
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-9773c6ea885so89594241.3
        for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 16:32:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqmoYsnF8qPiLbiW+9qtn8nzAXDMe68LSo7u3bLDoyALFdKCRE+xP8L6W2RKFp3aQzA7xy5eKSejDEp@vger.kernel.org
X-Received: by 2002:a05:6102:14aa:b0:739:97bf:9189 with SMTP id
 ada2fe7eead31-7574f93a65fmr1607449137.19.1785454369736; Thu, 30 Jul 2026
 16:32:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260722-contrib-pg-pixel10-initial-dts-v2-0-3abae9717feb@linaro.org>
 <20260722-contrib-pg-pixel10-initial-dts-v2-4-3abae9717feb@linaro.org> <20260724-dancing-skunk-of-novelty-72c1b8@quoll>
In-Reply-To: <20260724-dancing-skunk-of-novelty-72c1b8@quoll>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 30 Jul 2026 16:32:37 -0700
X-Gmail-Original-Message-ID: <CAD=FV=U0HUdjPcg+5Vx8_ag0zLd3CZx5w5SFr38p+YwRnC_G6w@mail.gmail.com>
X-Gm-Features: AUfX_mwnyu4WjATq-AQcVkDVhFUfk_uPBliwju6dkYwZZ_ZMH3FiPhsyMK3Tdpo
Message-ID: <CAD=FV=U0HUdjPcg+5Vx8_ag0zLd3CZx5w5SFr38p+YwRnC_G6w@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] arm64: dts: google: Add initial dts for frankel/blazer/mustang
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Linus Walleij <linusw@kernel.org>, 
	Drew Fustini <fustini@kernel.org>, Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-serial@vger.kernel.org, 
	soc@lists.linux.dev, Juan Yescas <jyescas@google.com>, RD Babiera <rdbabiera@google.com>, 
	Brian Norris <briannorris@google.com>, William McVicker <willmcvicker@google.com>, 
	kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Jul 24, 2026 at 12:00=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
>
> > +                     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LE=
VEL_LOW) 0>,
> > +                     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LE=
VEL_LOW) 0>,
> > +                     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LE=
VEL_LOW) 0>;
> > +     };
> > +
> > +     /*
> > +      * The Pixel bootloader considers it a fatal error if it doesn't =
find
> > +      * a `ufs0` alias so it can add calibration data to the node. Unt=
il
>
> Fake node is ok, but alias won't fly because aliases are not allowed for
> ufs. Well, would work 10 years ago, but this is a device from ~2025 (so
> SoC maybe a bit earlier), thus Google already knew that they MUST talk
> with upstream open source maintainers before they ship such ABI.
>
> They did not talk, so you reap what you sow.
>
> There is no more excuse for a vendor to ignore open source and push
> whatever-ABI-they-wish into their product, if they ever want to upstream
> that product.
>
> I know it is not your fault, obviously. And I know that not much you can
> do, so that is not rant towards you nor towards Doug.
>
> You will have to keep this part of patch out of tree or fix the Pixel
> bootloader.

FWIW, it actually _is_ a rant towards me, since I added the "ufs0" alias. :=
-P

When I was originally bringing up Pixel 10 with upstream, the
bootloader had a hardcoded path to the UFS node. It looked for it at
"/ufs@3c400000". That certainly wasn't going to work. Downstream
_still_ hasn't transitioned to having a "soc@0" node to put all the
MMIO peripherals under, so the equivalent upstream path would be
"/soc@0/ufs@3c400000"

Now, I certainly could have made the bootloader search both paths, but
that seemed bad to me because:

1. As I understand it, DT paths aren't ABI. While it feels unlikely
upstream would change "/soc@0/ufs@3c400000" to something else, I
believe upstream would feel free to and not consider it a "breaking"
change. This makes it feel unwise to hardcode the path in the
bootloader. In the past, upstream has renamed nodes to clean them up
and it wasn't considered a violation of the sanctity of the
device-tree ABI.

2. If #1 is untrue and we consider DT paths as ABI, it's still a bit
awkward. We have one bootloader base that supports multiple SoCs. The
unit address differs across SoCs, even though the IP block is nearly
the same (bootloader still adds the same type of calibration data to
the node). The code I started with had a bunch of #if statements for
the paths in various SoC variants, and that went away with the alias.
I suppose the bootloader needs to know the UFS base address anyway so
I could have probably constructed the node name based on other
#defines, but it still was a bit awkward.

3. I certainly could have searched the whole device tree for the UFS
node by "compatible" string, but the Pixel 10 (and future) UFS
controllers aren't upstream yet. We wouldn't be able to land the Pixel
10 device tree without the UFS bindings landed yet and I think we're a
bit far away from getting the Pixel 10 UFS bindings landed...

With all that, the "aliases" seemed like a pretty clean way for the
bootloader to find the UFS node. It also matched my understanding of
an appropriate use of an "alias".

Any suggestions for how to resolve this? Do we go back to hardcoding a
path in the bootloader and cross our fingers that upstream never
cleans up anything that changes the path to the UFS node? Would it
really be terrible to allow a "ufs0" alias for this case?

As a side note, I did "talk" to upstream shortly after adding the
"ufs0" node by sending the Pixel 10 patches upstream, but I guess we
were so focused on the overlay topic that nobody thought to comment on
the "ufs0" node? At the time, I'm fairly certain my resulting device
tree files passed schema validation at the time, too...


-Doug
