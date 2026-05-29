Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DFAC341ADD
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 08:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780044689; cv=none; b=PKKJaEN3kWXH0150ooqhmO7/9wLOy0xrbnJf/t+3bR+LgO3Er0EOMNTsT7VFAOZKxpRgJqIwkz/CIOv9vHj5rSNQWgubFWHBy4E3G1fCD6un2eR2178TJljzB2uDttknEWHplIgf/GMjcL9ue6iRND6lnpv2w7gFQe3m5r1wD2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780044689; c=relaxed/simple;
	bh=bdkabu71rrDKTa7LCUjVlosFsfIEDCU0sEtD7EQ1qII=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qw1RgfKPlDQSo9kwv2TcQiRahyVKofZeoZ83eLHYxbRvqYBtbqklMPsUMyJQosWdZRoaFZQK6pKV7twSPXIjaW8zl9OehDLtU64jN2TxJT9G+vJQQm0QKHf4ZgAhxZpcjh3YPmDcL4Ku2w4GVdGd7fQRPiLkIBEG17W5KE3sW+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-963b04fd87aso64937241.0
        for <devicetree@vger.kernel.org>; Fri, 29 May 2026 01:51:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780044688; x=1780649488;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RkwvcdoTXy80UmD5wUVPELnXBlXTid1VaGcK25N+5mA=;
        b=XB3iTPl2n51yt1ce1T2L9ILQk3K4pBsdLqb8Mf50//9+BVH25u32p08CYPvM585l+O
         2xricZzexfOYfoQDRCDsdSV5MpD2oQO57DMv7CdgIWUO8mraqXZpba1XEn7ppaMju66d
         8zBFzo3RhoPWpeI/C6zPdeLCQMMvYzhdtoB4CeRSiAnvSxZKDBFeiDOqNrWacT7Gbl7M
         cqgCqtfbRiksVCbIR7W9KtoNSuGe3bHW2dJz7EN30F5G+FQfQXfRl5P/InRURCIiI1gi
         zfRAHx+OmSEzdqFYQddlpdMqTsYgXrUdGsfYLiMrVmdTOXS/T2QwUBLPfkrTje1C+/oi
         0zsw==
X-Forwarded-Encrypted: i=1; AFNElJ+wyvBeTAKwq470EkD0E2fkOUx8hDc5S/hHdoIGtDb24DkWV4Rvj8vyf+UlkX7JAm3e+FZvGXfaEW6K@vger.kernel.org
X-Gm-Message-State: AOJu0YyaBmUlX8QKbSvyahI0fvcX4/kSKKQnYyh0rMPNX9EkINGNJsUv
	cuESNsgVMXY4ep71AyGYhYz7dIguKRqfITaXocqnFJhOIt8Tvd0vXq7Hlwh0qt3ig4A=
X-Gm-Gg: Acq92OGAjUX71DB1h3mf35CNb9rz5zdzvTaPgx+grxNdBfz6yWF4ap6wm+8DDohbuP9
	LOZYmL0ct64EUaws9WPQZovoF0dUd2AVzFfX2pyi5ivGkG6rjFYkkGQxqkQPbroJJljPmM7Ron1
	cXDKPzrWrZzlyFlxA1y3ssL4xvMrtf8kGcu9WfVL5KizZr/ZnHHGLUoIe9yJAMfXIj6Xwl0ABjO
	oxU6eZAb/H4Qo++wZyN6v2VSPceOjGGydiQJX3ujWN5cqq+PKud/7d5QyhzvW7UnkswW0dUR6IH
	jS1QKjfZGee7IiBqwwalTw2x6aztKulQnf+kINY3GVQLKOjwso0Em2XZrS4XL0ZJJG4CduoAdoz
	9zWum6JNhvdzcfAsSZh1Lqlm34TQ6WkFfzKZtW0ZXtpWxgX8CKVtFRSIxiWxt8Tl1M/ISjme4gn
	DS0o9OEDNWQIb6EQtUd1IQvneL+dBf6ayPnTj/7u/X1Kz61cYn1fftYbTNo0KRCUQWn6o9MF09E
	cWqrwDG2w==
X-Received: by 2002:a05:6102:2c0e:b0:607:798d:8083 with SMTP id ada2fe7eead31-6bf44d030bfmr589318137.15.1780044687622;
        Fri, 29 May 2026 01:51:27 -0700 (PDT)
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com. [209.85.217.45])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-963abac87ffsm492475241.7.2026.05.29.01.51.26
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 May 2026 01:51:27 -0700 (PDT)
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-63130466364so5081509137.2
        for <devicetree@vger.kernel.org>; Fri, 29 May 2026 01:51:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8KxudpDKpvr/5gBSYXZ7qu7dBJFZjfjVbgIPiCP9DNJgYYkUQlJnmE7bcCmMLr/0frHvJcnmWCGcdJ@vger.kernel.org
X-Received: by 2002:a05:6102:3ed1:b0:64e:32c3:1371 with SMTP id
 ada2fe7eead31-6bf3719eddcmr673394137.2.1780044686545; Fri, 29 May 2026
 01:51:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260517163212.18016-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260517163212.18016-1-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 29 May 2026 10:51:14 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUvUsUUkOj43oOWGs_MLvOZnEW=2YyKpP-VwHxe7ZaTgg@mail.gmail.com>
X-Gm-Features: AVHnY4KcCj63IhphrvFGQN6syC1_7Ix7eM6G3oNuhl6QDo_VJC9lcWJclcF3QAs
Message-ID: <CAMuHMdUvUsUUkOj43oOWGs_MLvOZnEW=2YyKpP-VwHxe7ZaTgg@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: r8a78000: Describe all reserved memory
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Marek,

s/r8a78000/ironhide/ in the one-line summary

On Sun, 17 May 2026 at 18:32, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Fully describe all available DRAM in the DT, and describe regions which
> are not accessible because they are used by firmware in reserved-memory
> node.
>
> Replace first memory bank memory@60600000 with memory@40000000 and a
> 518 MiB long reserved-memory no-map subnode. This memory region is used
> by other cores in the system.
>
> Reserve 32 kiB of memory at 0x8c100000 for parameters shared by IPL,
> SCP, TFA BL31 and TEE.
>
> Reserve 512 kiB of memory at 0x8c200000 for TFA BL31. The upcoming
> upstream TFA 2.15 BL31 uses memory from 0x8c200000..0x8c242fff, the
> round up to 512 kiB is slight future proofing.
>
> Reserve 32 MiB of memory at 0x8c400000 for OPTEE-OS, which is the
> entire OPTEE-OS TZ protected DRAM area.
>
> Neither the TFA BL31 nor OPTEE-OS do modify the DT passed to Linux in
> any way with any new reserved-memory {} node to reserve memory areas
> used by the TFA BL31 or OPTEE-OS to prevent the next stage from using
> those areas, which lets Linux use all of the available DRAM as it is
> described in the DT that was passed in by U-Boot, including the areas
> that are newly utilized by TFA BL31 or OPTEE-OS.

Thanks for your patch!

> In case of high DRAM utilization, unless the memory used by TFA BL31
> or OPTEE-OS is properly reserved, Linux may use and corrupt the memory
> used by TFA BL31 or OPTEE-OS, which would lead to the system becoming
> unresponsive.

Oh well...

> Fixes: ad142a4ef710 ("arm64: dts: renesas: r8a78000: Add initial Ironhide board support")
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

LGTM, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
