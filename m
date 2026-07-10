Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B25041F7E6
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 11:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783683863; cv=none; b=RdlgxmlkuaAc52M/NSRCZfBVG3iRDjvkBs3lrsjt4l9De2fbfgp6UsAW2AL2WnzaMzGhyjNODfI6C7scOdcf1BDkdDpShIby6max2wb9zOo4JUvtgEXxP0lO8FFae2J5QU4Vxv9ysWzYDXwRyJauXWNYxls+G3FIStbN+BLf2uo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783683863; c=relaxed/simple;
	bh=dL3tpsuUntKxbUUvgg0wlrIm48VH5D5MZof+IUXcho0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TDmsWQXSvTmAeOaIB09pnyMejUUfGny1HxTOn0mFRAfMW+hSHfk0ek4t/1Jy8NqDqjE+NlwSsn8V2cEBlV8etKPmjpAlzZonuf+0JtVJpRKd+a38hzS/IgTkxa3PpbpsTTfCGrUyLVq9fO6AGmiS0UlY7TFim6Gmmp/YZcjV1j0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-5bfb3347dc4so203050e0c.0
        for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 04:44:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783683848; x=1784288648;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Y5ZRUNCqj6NZWBIJRevARucfFBuDZbr36nuloNIDCEg=;
        b=WGuXccbMXai4FH3n4esXCxEu6WsuNJzQyxlK2013zh7PEQs8kZlST2d27tym6HbVRA
         OrNc9cs9c5WM/ugseu5krg9jrvIssyVD36yrBx5agHdxBGsSMk1ANADX1qxqh3Q7sPKU
         ehPD1Gg7WVlb1FvU3EZLBx9L7hx5yVms2FqAHqtrra0cF1jXdcZqMlIEOANxKn3UwXan
         a1ZKSgbvZszS0P/I3mpBcHn5fyyKvpyb77AMKObfYRwFeAF/Q1LYC6TXsDVHm01w6SPB
         HanHyzDG7SjqJEd1B05s+pL5McKd+4sWyKVNso0y8Wnx7//FrKig5MVpfey6iWacyC58
         Oeig==
X-Forwarded-Encrypted: i=1; AHgh+RoKOsrYLROS7375GrxoeeeG52Oo1LnfhGhuchl/KV0cPKKnZi5G9m5DL92dJrDxoYMoCxK4+F4JHYwH@vger.kernel.org
X-Gm-Message-State: AOJu0YyZhzDqc06cg6AWCtMCNVy2i3sri2C5WFugdUZLjSmrhWrKcLNA
	KG2Cut8KdDxUwERhp++t1NUQHgxpqYgQOk4CG0fXKfYA5SczqIOlKpu4ptDp2frqVPg=
X-Gm-Gg: AfdE7cmsihyAOSUMNRJPxO/2W5p5p1eosZbJfyCyeOQsrhD7dBY4ffARxBhF0Qc/m7I
	oiX1VRiy/j7qxGtWzSmS7UjuU4En7h+yDF+wRu2U58Jtmcs06uoHa39xodmeOw8tr72v0wdXNgg
	Oz8E+g3mZFmEJTEIx3sdNGlf1J+V0OcDMWAJzlQm8MsWvenA5jZkXOtGhZPgad4JA+vFnLBPvFa
	ehDCiuSBawZMqkSrRsFhZ7cjUTGasIioQOopTaxN5SoDqbnCJ+1aznG7Ng/x208HL2YzRPNIlqp
	DgKLTtRI0MKtTPoMFcm6cpI32O9fc59iObYLjUgwfDSUxl54bpMk0uyBKI+Q5lh1d97dsaMJOAk
	N0I2UNhQf4BvpTNHrtAQnbGc6CkVwRfb3sw02CDxWAVuUKnZukV4L056INd9RX3yKhpAiNqL0TW
	cbz5Vk+nY1MdEEyRKEh5Tu08vJl0T8wzP+/ptP7a3SM2OLcsztVw==
X-Received: by 2002:a05:6122:3a13:b0:5bd:a247:49e2 with SMTP id 71dfb90a1353d-5bf75d33b1cmr6699897e0c.1.1783683847829;
        Fri, 10 Jul 2026 04:44:07 -0700 (PDT)
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com. [209.85.217.45])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-96ed3186d3esm4192226241.6.2026.07.10.04.44.07
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2026 04:44:07 -0700 (PDT)
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-73b7c3791dbso408637137.1
        for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 04:44:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rrs7ezaTefrmZyl6Wt/a7MAWqhaDN6Oxwfu4SRiOSUQw968AVIpxC6iy+VDWpV0MrO/1hcVUV83BZZB@vger.kernel.org
X-Received: by 2002:a05:6102:e0c:b0:738:5e0:b40c with SMTP id
 ada2fe7eead31-744e00910ddmr7236987137.24.1783683846883; Fri, 10 Jul 2026
 04:44:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260707145135.247565-1-biju.das.jz@bp.renesas.com> <20260707145135.247565-4-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260707145135.247565-4-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 10 Jul 2026 13:43:55 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV_S-k8vJTYcwq9Z+xn1MeFEUykZmpTN2f5fjgMSHiS0g@mail.gmail.com>
X-Gm-Features: AUfX_mx5bef4KCy-t6rEqSQFESUXpdTXkFdBdZ6M9KBRV6SHDEbtexpDvqz1hLc
Message-ID: <CAMuHMdV_S-k8vJTYcwq9Z+xn1MeFEUykZmpTN2f5fjgMSHiS0g@mail.gmail.com>
Subject: Re: [PATCH 3/3] arm64: dts: renesas: r9a08g046l48-smarc: Enable
 USB2.0 function support
To: Biju <biju.das.au@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 7 Jul 2026 at 16:51, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Enable the USB2.0 function controller on the RZ/G3L SMARC (r9a08g046l48)
> board.
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
