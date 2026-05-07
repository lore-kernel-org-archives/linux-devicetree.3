Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D8923BA22C
	for <devicetree@vger.kernel.org>; Thu,  7 May 2026 12:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778155690; cv=none; b=ZBTaumleM4CAP4Ea9bXETPveYtjxJr9DB1GtH3EJJ0YesoANx2RRi4fHSqktmNdEaC0vd6A6/rdRlgZw2z8dEigzUxwoQACZ4L9NycfF8Ib7CYR3Nlvu15HIwJxiEVjD5Zg/nCnsl65E30Enmnvl4oWvT9sp7hNzWvqRJppMk5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778155690; c=relaxed/simple;
	bh=3hmr6ERBqCfMjSM8iSf7/vzVsOSpjaXIgAdr4FMHpjE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Cyz394C1GSQCjyBlqAYSuaFazoJk0Ip+kUZOHPDxMNRLYWKqimh6HhnolDLp7SOkSGsDiYuZaoHWWQL41wTPoktIWPQfWysWtdyxodfIuKzpqAn1owrtnziyDD7EnySIB3q5EntTJszTnzH1/T2L0iglM75xT2g9rvOxw/EV20w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-5751136c561so1470578e0c.1
        for <devicetree@vger.kernel.org>; Thu, 07 May 2026 05:08:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778155688; x=1778760488;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hModA89l364XE51tBAuBnwy/if+9avfhQto+MunlAnQ=;
        b=mGZ/+PEies/x8FlPmDyA+3LurBeZPgPtgEfvN13zm4AKVJkcOQjTYYDXqLpPfZtg5R
         996M5TIusIKTraJYF8sY5k/vdvs/678iJamCjqALgwfXOftLHPCJJuusT+VaSmQiyxD/
         f7kTvJ/sZeLGcKbkUxpgxknQJv9rF9u30EF1ZsBoTrqLqaXVG5gPNU6qlO/9F/+TnWGO
         JaopPv0Ex4d1F99fDVmYEDHW9HUxW/gWN/Yw12bmHCHLzEKpNXnkDAHWnGvLTd6O5XR5
         y/0DVjAglspgsQYoFKBJIuwBh0MPMiCBWI+dqbv0SVdbeWIQrfL9G0hqr2PfCBvoWlDg
         RVFg==
X-Forwarded-Encrypted: i=1; AFNElJ+RqtQCfUxo/hV7OsTYygLJKSMW5gK36LJqCX0L+2SsxSmQ3jC+IBd+/lEzvCnpVEUsIDPDg+SCxQBi@vger.kernel.org
X-Gm-Message-State: AOJu0YyJqRdwmv046Uh2Q8jjfKP1V09woS66i738Vq21Essc0hxu718u
	eeSgi3DUPDQCz5nCtu9Gj8dq74LDoHmzcPVvU4rbn0CqUBOzxlrbIOScdlFT09l53h8=
X-Gm-Gg: AeBDieuO2hCP9RR0JQxJibDjJ3QI5DOQawrx2VQhsKU8T0AJUW/M5rawYVGolyYBhtc
	DUBC82WIo1eL1bJLh3XaQGssf04WBvks1nVaIP+sl6HMqqoOaVEmU7gNbW/GE3nVPkYwktLvIW2
	FYrcQT+Ce+7NV5hXZ8bvVAlZUxAkDGKjvI5J4O+FUxboCXTSkS/3okXMNiVquUuvjutylNJiEQK
	UANA/aNYeQT/KvyBYkumqkFSUTKSnzyUBEh1Hly/nVqlcpfO3ymjpv+Q20otLZqr0ZvzMm/jpvR
	mIiosLVXfPpXStjW/25PavOtBtmRel11K0IykWb37/SvLuEFzF+wZkiTSit3LGZt0AxkoHhD+fB
	I4TJUJeAy3JFXUY9OShEEX7UZbWa+SZBQoKVDZ93naa886eN/1d4ToYkipYO99XFIwGZ6FE7e0w
	eRNS9nZoWyB7myjjP/ENV5dsJoWoMqIupSK/1cRwQ3FqiPjK12zTt56DeLwnJSKPBWedmhHZ8=
X-Received: by 2002:a05:6123:49:b0:56f:3b3b:eea with SMTP id 71dfb90a1353d-5757011a4e8mr859003e0c.2.1778155688202;
        Thu, 07 May 2026 05:08:08 -0700 (PDT)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com. [209.85.222.51])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-575757a84d8sm562865e0c.5.2026.05.07.05.08.06
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2026 05:08:07 -0700 (PDT)
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-95d226e3ed8so1395211241.0
        for <devicetree@vger.kernel.org>; Thu, 07 May 2026 05:08:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+cpVwzc9i6TkUb4JKqeWsmhp65Gu2ybdEkabV4IQ/gGiFXP8chnh3rjAQJPag3dmzcWbyaQSiJ36Ht@vger.kernel.org
X-Received: by 2002:a05:6102:2ad6:b0:608:d017:471c with SMTP id
 ada2fe7eead31-63115de6ef3mr964328137.6.1778155685959; Thu, 07 May 2026
 05:08:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260505125921.149682-1-biju.das.jz@bp.renesas.com> <20260505125921.149682-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260505125921.149682-2-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 7 May 2026 14:07:53 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXY_ddFtNk9Mwg+19is1MpRCqYZ=Ks+RxQLmnfMOTg4TQ@mail.gmail.com>
X-Gm-Features: AVHnY4IYMKfhhaXF1qebj-FLr2w5h_ByXFxZrYHrC2npI6D9NhuN-Fm3Bxj5sZU
Message-ID: <CAMuHMdXY_ddFtNk9Mwg+19is1MpRCqYZ=Ks+RxQLmnfMOTg4TQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: renesas: r9a08g046: Add wdt device node
To: Biju <biju.das.au@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 5 May 2026 at 14:59, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> The RZ/G3L SOC has 3 watchdog timer channels:
>  wdt channel0(wdt0) for Cortex-A55-CPU Non-Secure
>  wdt channel1(wdt1) for Cortex-A55 CPU Secure
>  wdt channel2(wdt2) for Cortex-M33 CPU
>
> Add wdt0 node to RZ/G3L ("R9A08G046") SoC DTSI.
>
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
