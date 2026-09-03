Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C81F94B512D
	for <devicetree@vger.kernel.org>; Thu,  3 Sep 2026 14:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788446673; cv=none; b=PyD4heBqeSY8x0vslIRL6lZVTLeoBZVPHg1ApMwj6kBedktPa5vQrOiJ9xHRfPGzpqff9BibztVGsaaSlg32BpU4PckR1gD7Ivt0RLqRlC5ZXwlfXcFbnWO3nnDPFFlxbMEfzlZCB0vzsNFcVxvzEbA01IHb/A17ounxkNpC2lo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788446673; c=relaxed/simple;
	bh=EgTf7s6p/OpuqItVOOUp/ztuxNWO+Z2wO2pMRh0VkAc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cymTtoiUp8yn4MHqBFT/nVIY2ImSgA2T+BgJLN18/QYxh707IFgXR3d+fA6EGCHWyLJCJZgG9jTFyamMtQSrTLUooiBlROAKZSsuNrhdlyCdwVwwdI6ZOwu4+Tq4YibocNQmATGyMlfSIgL269Tqewa3Pq2zr/slOF9snzMUoPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c1c52d920b8so336973966b.2
        for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 07:44:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788446670; x=1789051470;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WCO6Njy+SVScNEjKtjF/KEIv67GhBtMhWY5Oh8v9s5s=;
        b=dm1+VFvlFD78Ckd3R37RcX9ljwWY2g9IY19K3dsaIz8PRAT1WvRzwWjFtgs8FEEaOZ
         ntr76PFrodMNmjF7i4GUFP9wWeFv9sWUUGbYjVSfLEVEfbEfaVbkZzxFXaXbzr1JlxmY
         khgK4giDi9kngKhZ5CYm/qVfP4GXyy0OsYmZ+m08sgG6G1QNzdQAB1B+Da0Lvy6p8GE+
         ZP0BJ1PpDuEz8AWPmFTIo2B6Rn/Z/pU+hAFa6jdyC4S7GP4qdAsLnseqKf922/HJL3b6
         PSDb5WKSpVwi2/pf3Lz1sd4Fo56iX7i05uPuWnXx3Sij/0J1PmuMB9HQGwYpwgAoF743
         f+jQ==
X-Forwarded-Encrypted: i=1; AKwUvBwGXMmxEUy1pjUGt02O+g5BIMTB5d0iVqdJF3dLdN+sj9pXOAQxXPMNEo8aQfkUWTTyZnZncNr9Na33@vger.kernel.org
X-Gm-Message-State: AFuF++mohGzu/6WuO2Ji9wWh5q4doxAmJYId8g61W/KYSplLhcRjn7zq
	zkzwrjxEKm6CIuJ7dOFjl7COCS0xbH56cgGQMlqeHlVkoI+xAaGM1YH+/fM+z7Geozw=
X-Gm-Gg: AYBFou0HZwRuyfj0GfXeCskH1a213iV4SbsLoChGE+0uXSnpRHmEG8V68a8uY+FpigI
	OriqRQiXQzipwqULHiNVyaG2LLrGf0K3ipYoUXnjFh2sWfZOBeg3tuhWShNXK1nE7i6v+fypiTr
	//4jJNKjS9Jg3L8u4MyzJr0be9D5c3U8tV/+7kdlm0/uNeubRzRebBdBXw8+/HYfN+yk497TNMD
	/xyEkbER3ut1htkfp1N+yBfFjLfqXsQALRbFIE+eVf0NEIwPy0/15E/ucEWn7JqgN7lQaldNuQV
	aIMTioXX9bnYc5gVQPkyO3YvhYPpIQNNaiNJ6I60ej8fyIOjZWvgtBofk79AW3yfmAvlpBo7SST
	R3HuplSIfvcnMsHQdL7IAcII5xNpIfs5GLbYlcQoKo+aEsyakbDZChR8OZBeYgoIhTQ35EzSJ78
	TLzH7z7codpDPNQkBAxLUkzgDiScOqN6Bf3iBlF4mytY9TkVbp9mvcqtP6brPoffcA+BKmcpWwx
	q729CfMRVqaTkqdQuNoZWzKVQ==
X-Received: by 2002:a17:907:ea8d:b0:c1f:e9d9:64d4 with SMTP id a640c23a62f3a-c260479ddcemr68636366b.11.1788446669704;
        Thu, 03 Sep 2026 07:44:29 -0700 (PDT)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com. [209.85.208.47])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25f41a92d9sm113544066b.31.2026.09.03.07.44.29
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 07:44:29 -0700 (PDT)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6a20319d030so3662615a12.2
        for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 07:44:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBz8wqmhNVV8Wl8LuDSrkiKWLuiSc2GBYGXwxvIq25+ED1tTvUGcerFxUdX+tqUD5N3GgGIVdrccO/q6@vger.kernel.org
X-Received: by 2002:a05:6402:21d9:b0:6a6:54e7:2071 with SMTP id
 4fb4d7f45d1cf-6a7e5604c38mr260584a12.14.1788446231721; Thu, 03 Sep 2026
 07:37:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260903133320.144245-1-biju.das.jz@bp.renesas.com> <20260903133320.144245-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260903133320.144245-2-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 3 Sep 2026 16:36:55 +0200
X-Gmail-Original-Message-ID: <CAMuHMdURMFo8WxiU5hWoPzJB=bqrAKaEqnss181hZo5MZPNFpQ@mail.gmail.com>
X-Gm-Features: AcwNN1VFbOkMZQ7k7yG1mxbk8AnGCfE-NTGC3-0u8uK9b0jPXfAHrXpyOz__lhA
Message-ID: <CAMuHMdURMFo8WxiU5hWoPzJB=bqrAKaEqnss181hZo5MZPNFpQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: PCI: renesas,r9a08g045s33-pcie:
 Document RZ/G3L SoC
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, Bjorn Helgaas <bhelgaas@google.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, linux-pci@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das@bp.renesas.com>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 3 Sept 2026 at 15:33, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Extend the existing device tree bindings for Renesas RZ/G3S PCIe
> controller to include support for the RZ/G3L (renesas,r9a08g046-pcie)
> PCIe controller. The RZ/G3L PCIe controller is similar to RZ/G3S but has
> some key differences:
>      - Has 3 clocks compared to 2 on other SoCs.
>      - Has a different set of reset signals
>
> Add device tree bindings for renesas,r9a08g046-pcie compatible IPs.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v1->v2:
>  * Dropped "or clock for L1 substate handling" from the description of pmu
>    clock
>  * Replaced enum->const for pmu clock

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
