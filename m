Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92CCD35675E
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 13:31:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779456675; cv=none; b=oJeHNQCEx3uxRr0vB/HPaauBO5akrOqNQQ9r70LBk+Hj1BdW4dxs6L1xh65IXfon+HMfYItDGezb4EPV0ZuxZ+KPiuz2yMF4zfp4ksnOD16VP+xYirlKo5nqEyEZ5a5NRPyALnJismCMCG3wePXnQMmnsk67pQPp44OqWBNgSQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779456675; c=relaxed/simple;
	bh=EDsocOg9oilebHbXj+PL9ilT70n9YNMr0dy80+Ke9sQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C/plQDct8FpgXKskXLbvF/CZ9QJXWCVmWH55PbO+8xeB1gqn9P0TMMEmrkqwWUFkxFqxrxXBcVfB9XjM9+x6+6kkDpR0FTuULFR4apC8imNFmJB1MkS/fimIpbRuJV9bXNnIzut8y+wQNJ4d2eC4eUgC+VqGSH9UYDS7GQa8GBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-5751770a178so2442507e0c.3
        for <devicetree@vger.kernel.org>; Fri, 22 May 2026 06:31:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779456673; x=1780061473;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6+AhE4uoto6HB060rT5G1YWAsJ7a7Ie9LYO24VeIM+s=;
        b=LezWa/RMqvPYlfz9cy9nlR5tSl80hK3caGdzdD/T8VLY20gg0dmfNbtY2Fs+/YA+iD
         JN4sT4OW5Tzp+dlOofEofaRkpcep7IVgdr1qWY+ZQJyOHkM/3+/FGbXnhnKJTe4p6ksJ
         6803dlAgQFFR7X7YYVOhBE3IjrmDBZzWzW005zNvJlDHc5ZwOg98z4nu6vkBdwhqz8fk
         +YaGqMe3dEoFc4dr0rIO1Y59ijdHAYp4D0FiVjJKloBnpPNSwPXndy9EAq/t9lC+RNVF
         UrHgTnjRPVRqL0NkeXx2tZ78tY3MCe7CtfP5rJ1BKcbP+BiYD9K3xxtBO0CfX6NKGjKn
         GstQ==
X-Forwarded-Encrypted: i=1; AFNElJ9n6Ql6T45NsRkVmKbl2Nz5b5IR1KxeeJTpe3d3cP2GAdFvQek+5UU1iYwgb/f0pUlGVvRDKpFoRVI0@vger.kernel.org
X-Gm-Message-State: AOJu0YyKhmn8XxDb1RcjuLMI10mp0svU96WBlHg7GbiDkGgBAxnKQJDk
	3hHoTgC98Y80AAiCh6l1sTfMCA92Gbh5ydhRvBunS4qAg4SL/bEMiwHYmLIWxquBIVs=
X-Gm-Gg: Acq92OGj6M/9W3k52qF0aM5M+gpBKBHq4geNlLdNZhM5MhRK7HNctVKMn0HdAm30ma0
	R+6sIDmLST7f6RoV7BB7+y397PmDQ/0uiEZSV3/EhSDCNPhTT6mA1nEH5trKNWQLyqku/X8gZa3
	YzBCbWuP2oXnHTRBtnTzaYvkQXZWPBr0YUALVvNWAmSMv9FYSCqmLfPFj/DheOea+/2IoszNO18
	CZf3f0ga1oizGnRv/HZmL7W8HVOfOjrsOsNcrElXwgqBToX5nUS/1jWsq1rdAXcY3Ykd8ooid6x
	dXoG3riH7oDF5pwyr96wU30Ncc+fEte/9vhidvAezznSqEOyTHiVDQmAyqohyWCOrjYCNE3m+qP
	ibV1WneDXDRFB5gZ3ItMmtJghwgaXtAkf9KSnPeXyA0bblVHkQB72O/O8nH4TKsvq2+g4Wt0Ypf
	qbbjIX0xfOZkeuNfb2Q9t8sXoMRXudwtyF5S2eUpQNNHnV6OIHBXopykx26EwEmtufV1a/tjo8r
	tk=
X-Received: by 2002:a05:6122:32ce:b0:575:44b3:300d with SMTP id 71dfb90a1353d-586624cd1e8mr1765794e0c.10.1779456672885;
        Fri, 22 May 2026 06:31:12 -0700 (PDT)
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com. [209.85.221.180])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-96177c1a9e4sm1158300241.0.2026.05.22.06.31.12
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 06:31:12 -0700 (PDT)
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-5774680983dso2535675e0c.0
        for <devicetree@vger.kernel.org>; Fri, 22 May 2026 06:31:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/NqhV0t5q309nYTjbO+v7aAFG9MEBPZloTZrCPFW/AQ2iJfBsXy/hxwsJBJY03FspQZCf1GNnU7OCl@vger.kernel.org
X-Received: by 2002:a05:6122:3229:b0:56f:a3e2:66a4 with SMTP id
 71dfb90a1353d-5865e4a60a0mr2144772e0c.1.1779456671870; Fri, 22 May 2026
 06:31:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260520115144.60067-1-biju.das.jz@bp.renesas.com> <20260520115144.60067-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260520115144.60067-3-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 22 May 2026 15:31:00 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVJ0-2q71jOiCmWBa08fMeg_qmMuF5QdApnaghqv2w-Zw@mail.gmail.com>
X-Gm-Features: AVHnY4JCjos7DQv6shKRc2dtMgTnT_LOLrxwVA7QTM3Mzf9SauOWXKibkIBXaoM
Message-ID: <CAMuHMdVJ0-2q71jOiCmWBa08fMeg_qmMuF5QdApnaghqv2w-Zw@mail.gmail.com>
Subject: Re: [PATCH 2/3] arm64: dts: renesas: r9a07g044: Add max-frequency to
 SDHI nodes
To: Biju <biju.das.au@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 20 May 2026 at 13:51, Biju <biju.das.au@gmail.com> wrote:
>
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Add the max-frequency property set to 133333333 Hz (133.33 MHz) to both
> SDHI0 and SDHI1 MMC controller nodes in the RZ/{G2L,G2LC} (r9a07g044)
> device tree.

increasing performance by ca. 33%.

> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
