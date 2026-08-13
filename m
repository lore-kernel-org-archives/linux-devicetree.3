Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A734736196E
	for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 09:24:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786613092; cv=none; b=ewGujGPMAdEnLox2QmICwpNGAfSo62yQay4vE2BhTPHNfWg+UUmQfS3zcjm3q48Hm58t9Z3oOQ5bSRVdJFsIyOZXgtPKvUyT9pIwexWDVn12/VV0Je4k0uRdUl4hmUtmDHAehyfgzj0wdtKx/U6YIuFKU5dLP0pnGWxCqH7U8tQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786613092; c=relaxed/simple;
	bh=jd48x0JDaMadZvGCtOW40fgYj3SqSfl6jVqR/YltFCM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ze1wkZ5/s3JQEZqAu8dk/8YLgbod9bjlq0gVsE7L4mWSYRi2S/+e44r/tSoUWcwe9AFKoh4EEjUFKsyPFQeSuvqm8viuA30gyQMoN7w/Nk9SeUJRqeYqzavXk7OLl5fyDcbfD5digAHJ00Y2gCYRNXD52KxI3jmfREgsMqc+lh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-74ac3ea9c60so535505137.1
        for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 02:24:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786613089; x=1787217889;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=pTzoQkw/EdhxE8XX/iXjCk7UuKhM31vDtUCV7Bto21I=;
        b=EiLD2iH0gQGjkJDnVpSFfbOe6gUCrqtOEEEsRJnUIEtyOu66YjkQeSzFLjR2ABZNA1
         gfFAnv9lf4ZqsNK5S6nggms4VQjUnRtA/OL8fvR0/0tWJoeqqrffA22qZavMrdc2UT8p
         bLPrUV2zopsVAksfTUitT8jatgzQNQ5eEqgh+ddYq/VaonXM+Y957CJjgy83teEohylA
         RTspalKQhDhz7NPTrYcPZyjNuKqrwWkdjanjZD5tgIFiFwBE731iGEj8M4dao4GhmaVq
         zgnkcE802l68jFwrEnA7BRGsc37itm7ahHV0CA1+8jncazd80OH6tEdwVmhea7k9x33F
         jrHg==
X-Forwarded-Encrypted: i=1; AHgh+RrjuVgDd7feV+bum5//iLop3Pv2W+cP/q84XAYa01Ak3j064b52f/KZHn2tOrM6/CK0On53cqteC9kp@vger.kernel.org
X-Gm-Message-State: AOJu0YwdEqC7DGDOMfOHTr/D6mso6pPnrGkK4ndSe7JWn62mZfm6hYiC
	PqYaLQbsOzw8XAHAxedvIGJEyTeYQFkj7CmYK0IKeme0CP871vpzMJi8VoD0q91o
X-Gm-Gg: AR+sD122cXd1h1kUE4SxH9S1sWLwraovxXegq2VAYM8k3BFmDMcbbWtNQOkM3OugpOL
	IcRLS/6I4RlJzFP237Z35zhZK6sGRHN1ALsio5v90QCtMDbcnaJocuYIeyKfwK39FUZmaMLx4HV
	AM7cDedRJjvzbhoZPbzz83lu3UrxMwT425PoNYw5AzmCP4V2epqOXwvk8a+SV8fHSF9N9vUG8v4
	MJoYC6QkYasx6q9huxBvGn+TmkmGo0aZPa6ksLgI1JokH39/1knHXjwMDMt8WCyEjxWPf31Gy5h
	v4YoYwYIBEvHs7L3NjCGR7NuruINmj5zyjg9eqHx+X5gr3I8tjhSQAdPuQWN0EDPvMcESQ+vXKi
	rUQdzaw+YdcBcWAxVsozVZ+N5SHtFX8B7ZBiDiQ6rQmVxhqutqpw+L6lgToLMSKreBjG6gjh8lZ
	sgCy/hwOb9paaoAnSPkH2i3AJx+Cs6x69RNWvJnBYOX4XLDOxKAHxvVAKM2Qkp233pl11phZukB
	Q4+ROxQ3E90xbm+4h+1lB7VYQ==
X-Received: by 2002:a05:6102:1485:b0:737:783d:1916 with SMTP id ada2fe7eead31-76db7b91137mr1053811137.11.1786613089577;
        Thu, 13 Aug 2026 02:24:49 -0700 (PDT)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com. [209.85.222.51])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-97becc5f312sm617690241.9.2026.08.13.02.24.48
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Aug 2026 02:24:48 -0700 (PDT)
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-9770fffa5a6so532484241.3
        for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 02:24:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rrp2GKKODOUYx2DkYa2hSZmhpoiZ/5lhe3MqePl1hdsxcMw0NvT7yartS9umhHqn6ALyRVoIENnJh20@vger.kernel.org
X-Received: by 2002:a05:6102:1485:b0:737:783d:1916 with SMTP id
 ada2fe7eead31-76db7b91137mr1053786137.11.1786613087765; Thu, 13 Aug 2026
 02:24:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260615115455.1412098-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260615115455.1412098-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260615115455.1412098-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 13 Aug 2026 11:24:35 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUQKmDQz=V6oa-7HC6NNUTzYUddOrCmHMaRXvHSBrF9pQ@mail.gmail.com>
X-Gm-Features: AUfX_mxIUL2dSfgpmaEW9n5O8N-uwqoJgDk0_CZpOV-32gxYiS60Hp8O10qmVn4
Message-ID: <CAMuHMdUQKmDQz=V6oa-7HC6NNUTzYUddOrCmHMaRXvHSBrF9pQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] arm64: dts: renesas: r9a09g077: Add VSPD and FCPVD nodes
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 15 Jun 2026 at 13:55, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add VSPD and FCPVD nodes to RZ/T2H SoC DTSI.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
