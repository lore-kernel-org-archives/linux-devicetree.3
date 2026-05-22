Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B7B43E8C7D
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 13:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779456948; cv=none; b=rUE5PJjNVi5+PRJU9wSmwAFo6gObo/B+CiKaofqMOP8pdFWbYn4S33o5IkUTngot8maw0Ul2gRmOcnfjPSLYG+cClromKHL9+rv2s39x+8nfmE1fGjcaHwEm037pMbylbnL5veYsBNywcEb8hJJwZCSxAANuPOCZWutCV0Cqjw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779456948; c=relaxed/simple;
	bh=vaqLOkMoYJwQx3iV6i+XeHN7SxyVOeCzD1OCLEMqT/Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tyLxlZhuvM4aV82A5lVzKyUFlX9BDBbcji+oUgZJnDn6bQuxjMq5GqcXLrQLz8rUZuB84NCccWuS++yW/hiVqIa1hJ1J3kO2DEIr2kEyXaqPW3Q8xNLZawj9xnT3APGOpvsDyC/kVh0Cyo7nywqAgJmbx4jwT1YFR5FaFBYQqxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-631a7868228so5038308137.0
        for <devicetree@vger.kernel.org>; Fri, 22 May 2026 06:35:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779456944; x=1780061744;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hXlWSxNo1+Jju4boSCWbL7pXl0mOxwBwkZSG18gGaH4=;
        b=o/urpjt50ZxYcthf0nBSuBJj0gw/aFUdpW7kEbVVUhz6N2NdyfUmw+mbMp95yqUUN0
         +57lyyeXGOLN28lqG1fkbl5ibItgxg2naZ+/44f3hh2xp8oUS5C4qMY8s3jjhSgugE9S
         FssDxYnnMFXNd5jSJRdhGFBKCmDewArQxdbZC6s163dCWVgExuT+LaBBk1lTaKWNM8NJ
         dkkbBPRhpB09CBjcchbrukxQLQ8hgy+Q30z10pTtA8JUZZR0uBkzcU7MuTyh0lJLVoD4
         6MDlVkfzC/bA3NaUOqo/QIaiEfjgdGmGeJZaayMx0q6/CoW85QzqBBXC8gl81WS+sOc7
         yclA==
X-Forwarded-Encrypted: i=1; AFNElJ8FPeKWmJ21gKVVdRbIsCoj+QibnZBc40e0Sfo/Yk4K6qwA9dncG7s2T7/kWLOX0Xl++w7mPjx6xR51@vger.kernel.org
X-Gm-Message-State: AOJu0Yyhm51LONXHD6exFa6tZ+JtrJFR9Yd4p4K/Q3E6TpRJArCG5BWe
	l2K/zYqME1iXwRf8L4DSU1FK4JyA5w1h9DDYigH2LFSql1So1FKHMyC0ZP9x7KqoIDY=
X-Gm-Gg: Acq92OFyoREbBRspoT6NeGw0APPoO8srCcaH6xSdAlHukJwmmGL8pvUVPwpDYLD0u6T
	dUvFoc58MdBySXNxWUug0VElWCwG1KSr/bOlhup/vNIEKXuAGiCr088gcw8W8uKXglFpndOy0kB
	UraTcHPN2xxcyhI2jTWL+o9vMPkCBIxuZKL1QYIUitsNVnuegGYF51mdbtmFjMc4cqtvIB7vgxk
	6YsPo4NVSMDzgqDAGaJCRzAXNhCS6ARBapcpv3bM/Ug345inBC6NJ7bqOXSY6ENH6dPEQww3osF
	a2wUwdsgmA3x3FAid9Hpp7GURsdqkjtJMagzv5xOs4y8Hz4DVyzoCNO8k/5uiAxMRBMBi6xBDYd
	mTmEi+8HKk+ij/8G4BiONghAm1HSzeqCCfxI/dYryTPh0uCpuVxxqX2fBBjeQhrsJrNSxewKqm1
	Yez5OqQKisXzh8G+GPyfKSspPLImk4islSX+fvesF9/98lUl7uieTeq2WwzUbZMHyy
X-Received: by 2002:a05:6102:688f:b0:631:81d6:e158 with SMTP id ada2fe7eead31-67c8fcbdbdfmr1775716137.27.1779456944378;
        Fri, 22 May 2026 06:35:44 -0700 (PDT)
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com. [209.85.221.176])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-67fda9003a8sm1264708137.6.2026.05.22.06.35.42
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 06:35:43 -0700 (PDT)
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-5873983d19eso537465e0c.2
        for <devicetree@vger.kernel.org>; Fri, 22 May 2026 06:35:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9seXIElJAoX7EU4NXHNK8Os4z8nZaF/7u5JefyERVeYmEhCjreoICqm9iRduklpYdsTNMVHrbJYK+Y@vger.kernel.org
X-Received: by 2002:a05:6122:3d0e:b0:575:22f2:a1f with SMTP id
 71dfb90a1353d-5865f726da6mr2063094e0c.4.1779456942694; Fri, 22 May 2026
 06:35:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260506155804.3984418-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260506155804.3984418-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260506155804.3984418-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 22 May 2026 15:35:31 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW_hfAf+x1nCxpYOn1u+9Qf5MZPQ4OzcZSqQv=C+mQeGA@mail.gmail.com>
X-Gm-Features: AVHnY4JM24tWXTYpQSwoVZ-HgSC050JGtKsRm6hbb0RSe9rOvyacCgB1um1nmMM
Message-ID: <CAMuHMdW_hfAf+x1nCxpYOn1u+9Qf5MZPQ4OzcZSqQv=C+mQeGA@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: renesas: r9a09g056n48-rzv2n-evk: Add
 alias for on-SoC RTC
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 6 May 2026 at 17:58, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> The RZ/V2N SoC provides an internal RTC, which is enabled in the DT.
> The RZ/V2N EVK board also includes an external RTC in the RAA215300
> PMIC.
>
> Add an "rtc0" alias pointing to the on-SoC RTC node to ensure a stable
> device numbering.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
