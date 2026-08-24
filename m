Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF0B743801C
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 14:32:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787581976; cv=none; b=erjZoVRa22yxY+KyNezsXhBcRBh5yggBI8ZoyaKearkwim1zxxMTAStBYeJ3XlHgEjCjm+Wek5am8MCZO+bjuvsiO2TUWY2vfb6fJfusAnb2RjhUr/tXuOYBZniAO+MYCyb2xsnsRX62adwR4H6BPJJ+nhwsS8r+h9J9CgpzDMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787581976; c=relaxed/simple;
	bh=V2oxkcG1MhidPAYJ3ueQIK6gKYyi9t1JdqcvUuOn7q8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UJoiPF6xVNrpdbnukYmTuExzSd84VfZWMrJjRe2yCRhj8zrUg2n7JxEdzIwlJfwLpFVS8XKqfzl8hI6E9B7G1YCZMDsh15ZIvoXKyJRBaUfyW8uLF1g7tUUIuwGEGM8y3B5LFH5S31RYhlFOkEpyqsMxmOu3dogYSaCS8cu1Uyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c214e625259so514782766b.2
        for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 07:32:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787581973; x=1788186773;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=u5jqhhZCvBwkj4iNziFMz/+JSHAuGMQopfaaYzj1YvA=;
        b=ewbS1QQmHS63+Fiv3wgo/VN847ahZxWMNfMX0Pl0N6Z0wYOkmPRWCq+rig/5YaWUlh
         ca0vPVGdxS57+0NqcbRefNszshC2hT6TuXxRZrXGrlvSP5nTFz9oFWJjAdK4lTAs7vOj
         AaA5UA5s60N3L/U3RB+HXhragfRnbJ0QKYA4M9R7Cs5eRSk6EYhMkitB/a2k48YccKgc
         JesW/WvGNj0uhRcjNHC3x2gYnx3tebfLT9LQMrVBPrdrp0dj5TiV05IVJYl2GO7pw6KO
         1pkZ5fWeP669JIToSz4IKPK1MsOpV61slopWlB3bTfvhw/qNyCluOEYbBWTgdms18Gc9
         DkPg==
X-Forwarded-Encrypted: i=1; AHgh+RpkPQp74iGY2e2m8upBD37nIwiRH4x1OrlptZe/vwMdpy1Z6rWFBr/5n8nqPLJuQd53ss+vZMCPI1EO@vger.kernel.org
X-Gm-Message-State: AFuF++laWd1JCp10ngBc7IiD/32Gwky+hVL+C9/IVJHtcO53mMG4ixBK
	EAW8YoWfVTBrWaq6Mv4kAPIsXCKw483bnrGv3durlAyu2/f01oeMailpNUmCbVRU1yM=
X-Gm-Gg: AR+sD13Illl9NV2vbZOytpzYFEmY6go6b94+tfvkc97c6GSfn6ihrZlm7AgdJ8FeznJ
	pQe8FvGkTU+vaavsXZ9fVbHrrDVQmiOYRKxPJKM1bPLBzdBxsvvmD4TncXgySpJtgncNDNLXyfe
	ztkACE3zEECdjxbeuCihw2XxBW64jKe7zO1lU2gFTZNFr50EL314nR5h2jzZ8tuD13k0nwQ8fOe
	wzAw33e41sv2SMTMH+U67RcyI1BLjpcMj85X/PdMsvxmkWmSGm00kQqZBw551bDa6meep19vRay
	iG6Klb+1OohuC3eGWZ1LTosf5Bd418IAQQwvFl6pKGgjWFxSCtItJOUnjZT+dTTN/B6CoAQMKY1
	tf4zLSK4v+WZwAz5gjkj3xz9oeUusQ8HR+L2+t3FN1r13SuvFZsnoHTPMYf8+3rAFOC2ODnJQIa
	xyL9/1T1Vqn0Ily9gEX5cffJ7q7BFow3FBptvysaMNgvCDeDvBVkdk8t+wkh3eTMwGNWBD0sNND
	Nez7b1FbwyMRrXdSQQ1Vz2Z7HQiMTP3APHp
X-Received: by 2002:a17:907:948b:b0:c16:6a42:c7d6 with SMTP id a640c23a62f3a-c246a346d3amr3118420966b.9.1787581972797;
        Mon, 24 Aug 2026 07:32:52 -0700 (PDT)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com. [209.85.208.51])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249606b696sm1446356966b.7.2026.08.24.07.32.52
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2026 07:32:52 -0700 (PDT)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-69fab5a852cso6015022a12.0
        for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 07:32:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RodKB1wh7ofErvo4Tb/SuJSnhVBonmAraw4Klu5Pfz6jjqdzTcDEBh3kNcJTEsFscD9v/vuG6csIIeE@vger.kernel.org
X-Received: by 2002:a05:6402:2b90:b0:6a3:8586:9b73 with SMTP id
 4fb4d7f45d1cf-6a42f111a58mr29148166a12.6.1787581971956; Mon, 24 Aug 2026
 07:32:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260819183829.3953529-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260819183829.3953529-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260819183829.3953529-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 24 Aug 2026 16:32:38 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWcsP6yy99S-kZWADmy30STEbWoDn1W4xsgxbwmKVbWdw@mail.gmail.com>
X-Gm-Features: AcwNN1WtsJF-mPHpyKXJvzUBbPpUfkdecnDz0u0gaOiDM2z9dpA6Q3CaLi1p9ag
Message-ID: <CAMuHMdWcsP6yy99S-kZWADmy30STEbWoDn1W4xsgxbwmKVbWdw@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] arm64: dts: renesas: rzt2h-n2h-evk: Use consistent
 switch notation
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Prabhakar <prabhakar.csengg+renesas@gmail.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 19 Aug 2026 at 20:38, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> The switch comments in the board DT files use inconsistent notation, with
> some references written as "SWx-y" and others as "SWx[y]" (and "DSWx-y"/
> DSWx[y] for the DIP switches on the RZ/N2H EVK).
>
> Standardise on the "SWx[y]" / "DSWx[y]" form throughout both files so
> switch references use a consistent notation.
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
