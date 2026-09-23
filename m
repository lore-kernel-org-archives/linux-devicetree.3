Received: from mail-vs2-f12.google.com (mail-vs2-f12.google.com [74.125.227.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55F3447ACE9
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 09:13:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790154802; cv=none; b=B05xQDQiFhFtN4fCXlpW4/ehFhUD7bMh4PUWD9rWMSSA3s+4iKMdV0GSmtrYae+xusYbyUPhA2Dc8RS/CDeXPlZjIgrC3UAJvExoaZM7kURXZ6zPKu65nVaHD0C7L/5Q2//qCDDuVGx0Ecez4Qh083wqVZFwg0uSm/NE4e+I/Sc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790154802; c=relaxed/simple;
	bh=pChAlCbUWivP0jckC5mbXA4KLqm12IMiCjsns2Xs9aA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e0qh5bTi3kM2/4SHn/6eJChi4t0js7z5DwRWVosbu41A7tS/Vmt4SswltRVsyuSRDQene50ELuA2/gaMvy1l/wahIN/j15yECghtozSm0LYJT/MZmMx47hNoeI/jaTgEFQZbh56buYKKa6Zew7SzYM2ly9XKHwq5yA+AJPFXb4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f12.google.com with SMTP id ada2fe7eead31-785692e5907so430314137.0
        for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 02:13:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790154800; x=1790759600;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=XAKYyai8psRXv0/QFZ5hHt6xP/WwuL0KY0YP7Ej03uE=;
        b=tXp6KloQ9oOfqFOrkVpg9si/xoajGvIhNP8snWlbiFdVzbBV2wFZntpWefA2mXAM9x
         VXPsXntAakc2UOVvTy0GxWJd8AF8gWyWeLDFO8l+J+fwcFTDjmJ370t5jJ1oqLLFSutX
         imyYLdKqR4UV18QkG9Y1Hzoaq1e4t04f0FgVczM6cvtCdZQOjo6fWSMTp1SRwtS4FJZT
         T1JOaCPO9cDTkuXbgKV2dvtUEcXRZXdmVCqvkm1654FmCWl46jxguTbraCwQXVZ1Zd4u
         1vINRZSOcdKI4JXmiF6rx8gKNS75UsziiNOKM/Hmi/dEw8VGLxxXJn+RbvhOjm1phCFI
         +M/Q==
X-Forwarded-Encrypted: i=1; AKwUvBx2JAQoUWD0qcTRayx/zgaRh5UveIT9zJmuVR8kWefcLrorAFJWxpi0rDBWELYM+NBwyp1WdoptV6Iz@vger.kernel.org
X-Gm-Message-State: AFuF++n9GXt1XOGKLy6JIVGkuECNLYWRXlOOQWQ3djRkC11zyWEgB/dS
	wV1sxjcur4pQQxAgmmkksODrmwrPzY6tvASW9fUi/jh2Uo7TrB5IW8xYLo89iO+62Ik=
X-Gm-Gg: AYBFou2HuxSbDiotlYDXbdALUtp0y1AiQED0wNHRD2KALIXf5xbR+MqRhJHiJvvanSw
	ZvfZfbx6m7ziNV1ULkUyulW3uRLHUVrY+CMeKe5s/kVROWKktr7eZtsIO+Vmuoa1u2o4+oVQ+nB
	6nFE6a6enucFvA03HvzqmBV316YsENQcFLRVuW3ODlK4DdJXeDaKP78cmZ82yEKH4+yTvBJ4F/X
	CjqDKzrIYn1gLBaqujaDoZs00zSsZp7bkf6wdiB8fll6gD3+HrsZoepgJ0Ed8uXJjbAMOvj1x/c
	yUcnV18aHZsZHFgMLvjxLIx4N8i9PJpsX+EhrqPP3oAu2SBRFAX7YRAAA6h5ZdUuxFjbWzvcbrX
	T33xX7lOc+WGti1wybq6jNp8Jf0YZ6ZH4gxggMkFYiKozy/A8U5nQ9RO+HAXKcap5hufnqQhSWR
	0PktKoLkavlIUpqVsQcCe18n12+7yvOPQklXhreKSUxZ+ZBH6Ixo+MLorXSRwmkMIFjt5CoATgA
	vNfcC83lfCz/fr217Ufe/5LO3bquHOhzudK/Is=
X-Received: by 2002:a05:6102:3910:b0:7a7:3485:3385 with SMTP id ada2fe7eead31-7ac1c79025bmr1977653137.21.1790154800261;
        Wed, 23 Sep 2026 02:13:20 -0700 (PDT)
Received: from mail-ua2-f43.google.com (mail-ua2-f43.google.com. [74.125.226.235])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7abf65b6a0esm2814102137.12.2026.09.23.02.13.19
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 02:13:19 -0700 (PDT)
Received: by mail-ua2-f43.google.com with SMTP id a1e0cc1a2514c-9852048ab71so14397241.3
        for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 02:13:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzT15VJpQVIXVADnXNn7ujIAfJmIjU0cCDsyFDsMY3Qg3YUz3QSxxjvf5d+mzjstcW8oqHAHyIHv3Kg@vger.kernel.org
X-Received: by 2002:a05:6102:3a08:b0:7a7:19aa:8a89 with SMTP id
 ada2fe7eead31-7ac1d6f6461mr1654647137.36.1790154799016; Wed, 23 Sep 2026
 02:13:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260921131951.187981-1-biju.das.jz@bp.renesas.com> <20260921131951.187981-5-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260921131951.187981-5-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 23 Sep 2026 11:13:08 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV_fR8-NpJgb5_J8aZ8XypHis9Lf=C-yW-U2ehrut-aag@mail.gmail.com>
X-Gm-Features: AclHuK_ep9PIij6_rn7bpnDa0DbLwc_cLRHpWMpcqauyM0t_Uefy3670sPqkvj8
Message-ID: <CAMuHMdV_fR8-NpJgb5_J8aZ8XypHis9Lf=C-yW-U2ehrut-aag@mail.gmail.com>
Subject: Re: [PATCH 4/5] arm64: dts: renesas: r9a08g046: Add CANFD node
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das@bp.renesas.com>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 21 Sept 2026 at 15:20, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Replace the CANFD placeholder with the full node description:
> interrupts, clocks (fck, ram_clk, can_clk), resets, power-domain,
> and three disabled channel sub-nodes.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
