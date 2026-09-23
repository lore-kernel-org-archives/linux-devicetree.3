Received: from mail-ua2-f12.google.com (mail-ua2-f12.google.com [74.125.226.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 297E0443AB8
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 09:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.226.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790156591; cv=none; b=dBQBZsFLoHyni9gq3a8U9nrlkpGElIoOS6OV1fGj27rYcWPkyMcrPRFxNaw798B21A+EWWapWizL5bGtPb98CTIy3Z/xRRHYWqP1p63BZtmxlmm6HIiJXWQpKVrNm28N+sbVo6n8w/Acc8/o2c/6QY6vmpitiVKXKoumnuCml2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790156591; c=relaxed/simple;
	bh=kXRIYiD+xenQqUzM6yr57E7e+H4wDyAglPgjREDARWw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D1XRor8ODSipR32Ze17/84VoS7nsAETFMjt98Idi1MesAwOxex4qKTcdSn/3mWf3AcrnHPLvcRqvuqgHsv5d1EVVCUHlyriML/vHGLqSjHznGjpxwMnPhOc6bXjR9+AI6AOXVcllCKVLekaoac5avkGyQCFt6jUpGZ2HTBTD04M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.226.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua2-f12.google.com with SMTP id a1e0cc1a2514c-97eaa1155fdso228645241.2
        for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 02:43:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790156588; x=1790761388;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=SiQX30aX3aRyR4XyZV6+3F+T8bea/FfKCnzec63MSFM=;
        b=fdyWy9otbeDbdXZ5/nlrHVkh3iG2dF5scoqiao5FfqztICqewFpHYerZ+llqNRKrU3
         Cf2K6qkOTBcQahe7cafkRu4lzOPF6b+s37oAiFYGo80y4jPleT9YdcOFXccoQwNv+31m
         ChHgwEdUg6nhBK7FuWOI5hPRWbwM+Jf2uQu1EeGDYm0u61UK+Gw2fEINXgI8a9VfZlbf
         JX1wRniNk4hQ3SicZVI+m927yQmeZIEwy1PMgzYM0duDgLq0M3/oXGNMvmJ8bivA6fki
         uCg3vohRS2IHmjg+aJiEIomMU6A5/TCCAE32nkZZTEw/lDoHkfS8W5FiZyBLu3kH0nBt
         4eVQ==
X-Forwarded-Encrypted: i=1; AKwUvByYQWInBCluSoh+DEwK8sqV4p11XQOjsbCifaTV3A1GHKraYdVhOb9x+j9cd4Ysou/YfBNn0pj4ZpgT@vger.kernel.org
X-Gm-Message-State: AFuF++lqsi5FiH9zYh/x+zGRmZTeRER3JfkPVLaB6w23UpDAcYlPpzxn
	SB1ZnTcTNCZzILXaFfIk0asQl8jUxw7qOkPW17vNnNn5BFWSKjOiOEF6i33QAik6EOQ=
X-Gm-Gg: AYBFou1Me2dox9XXGkEeu0khabIVu2GBqbj81FAmwyJOxCLBX9quzkdBsCd5tk6GK5n
	iJEXoJU3phxKuiLYnD9DZioKl0jQP/5+s1mcvyNkjSzEwKVPnJCmSB1BLQvQj2eybHvienA2u1Y
	DhBKni5XrbBXQ9YPqL+KkDjTPYK4yq7yir+4xxSdsC3LUVZSmCGCEckg8h35zT1E4htkv8OAIU4
	OVsx34pXSwdPrQsVzA9JUKhWJicdRuH8nJCtB+0brVJunK/9NoRaUsBo7myENTAiI/WAi9B4mWT
	WjQlxGWW5s7watnjhNZyMkxFVXFIxr1OLsdzOEaGHIr7QrPZGMUcOTk/g5y0nMWupl96MnfwXPu
	bcIAFUnRqw7hYm1fnVN55YAyr7Lo7yZCeJYTTTE4Tvt0xgQJoNhehCwU3jrOH78sm5lF7uvmCMo
	VhgypPiRt3S7ntATDYtJE6GY3wdYckKxmlX+o2iKLMDLAtZoZC2j6F4/QQenbPC0/GH+DgPARSn
	2pO/uha0heDsPJU1eGHqNwRf+l+NVkURzrV
X-Received: by 2002:a05:6102:3e8a:b0:7ab:f00e:8d59 with SMTP id ada2fe7eead31-7ac1ceb1b8dmr1732087137.17.1790156587882;
        Wed, 23 Sep 2026 02:43:07 -0700 (PDT)
Received: from mail-vs2-f41.google.com (mail-vs2-f41.google.com. [74.125.227.41])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7abf35bcb07sm2968909137.2.2026.09.23.02.43.07
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 02:43:07 -0700 (PDT)
Received: by mail-vs2-f41.google.com with SMTP id 71dfb90a1353d-5c7f7cc52efso323713e0c.3
        for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 02:43:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzhTuhffk67msuWSheQyC0yclka+IN07DkdxCEvKWSmEQrmHYMV3pic4+uRfy8D0+CEfhwhSr6RnY3+@vger.kernel.org
X-Received: by 2002:a05:6102:162a:b0:7a5:d652:2e3c with SMTP id
 ada2fe7eead31-7ac1b41557dmr1905945137.9.1790156586853; Wed, 23 Sep 2026
 02:43:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1790005703.git.tommaso.merciai.xr@bp.renesas.com> <540fcb8ccfe7efd15844823c030f393efb536076.1790005703.git.tommaso.merciai.xr@bp.renesas.com>
In-Reply-To: <540fcb8ccfe7efd15844823c030f393efb536076.1790005703.git.tommaso.merciai.xr@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 23 Sep 2026 11:42:55 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWFUM7xVNOfEhCN08UgdgEu7ZAnkR8GDGgT4d-wg5TpJw@mail.gmail.com>
X-Gm-Features: AclHuK-GoN-PXrLEwtbZvvcfh_d25jq7EgJX0WCMepbHIeyPLfj-FzR3-jNoD1U
Message-ID: <CAMuHMdWFUM7xVNOfEhCN08UgdgEu7ZAnkR8GDGgT4d-wg5TpJw@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] arm64: dts: renesas: r9a09g047e57-smarc: Enable
 USB2.0 support
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: tomm.merciai@gmail.com, prabhakar.mahadev-lad.rj@bp.renesas.com, 
	linux-renesas-soc@vger.kernel.org, biju.das.jz@bp.renesas.com, 
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 22 Sept 2026 at 00:27, Tommaso Merciai
<tommaso.merciai.xr@bp.renesas.com> wrote:
> Enable USB2.0 support on the RZ/G3E EVK board. The USB1B_1A_HOST and
> USB5_4_HOST connectors support host operation only, while USB0_OTG
> supports both host and peripheral operation.
>
> renesas-smarc2.dtsi is shared by all boards based on the RZ SMARC
> Carrier II Board. USB2.0 is not yet supported on the RZ/G3L SMARC
> EVK, so disable the common USB2.0 nodes in its board DTS until proper
> support is added.
>
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> ---
> v3->v4:
>  - Drop usb21_pins.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
