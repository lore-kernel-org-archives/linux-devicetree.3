Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B38D13CAE7F
	for <devicetree@vger.kernel.org>; Fri,  4 Sep 2026 08:01:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788508864; cv=none; b=pLIwXRUheKcQJDQ1FlTd9A90GIlJu4ghODr/DXt0gvU0Gje2D/0LWPO0KnTkl5URJrbUPkqhu2EheG8LEHaJF3EE21wbTeFIrGpmAL4Xu8VolTNM7o+eLzNOUisQ3txf4Du9RQJRFEohmcNM2uTOo1alwhz5i6kkmQVjOH4eVBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788508864; c=relaxed/simple;
	bh=5STgmEpuSXLAENtQSqsuFnM5l/nP8haJUcsvw0rzQek=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZzDfT69CEPnYhsUTgk3dUPgO5uJ+BYwHnykkTmuEvAxc0ZhNmoRGap8qXIVkpei8CyYlhdbf/HwNH8Nn6uvIKnWaOc68OA/RJ1gX4kMkNGNEdKwp57Fte4zt0jEKGrIjGtY6wHs2nnXZv+vrtmJB0VogTypfBtWP+kKXxiiXkNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-5c652293bcdso919375e0c.1
        for <devicetree@vger.kernel.org>; Fri, 04 Sep 2026 01:01:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788508861; x=1789113661;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=DHcVzyvg5T1LbBIIYfTsEAB71A8C4BjQEyDgYTrzH78=;
        b=XYEGdP0yZWkGP64i1aJLO8Y9vOrkPPtpunwHtlVihz3MN4cO/HKWrTW2i82jQShU17
         V5gjv/EJ09hvAHN9xRFTcyCt5VLVvFKA9Cd2ONs4uRPBwmiaN7RElJh+YDSHzv5QMjCk
         s9GQpMvP7oKVknAZUkFG/wQ4nfZ8A/mUJ/pJR8IJTgavf0fbit662kllIjvFv1OSH4sd
         rqlYFyPLFxXfG/QMm1av2YHRfVhwTK9s4avXSsZgK4FJbJR+dAeAtCyuo4eZ7dkB3LpW
         4QYSkQfqFdpMMFDtyRLBJ5qbYnAelg20puy7k7DnWj2YFCnk0LvmhPlN534YErBQIS4c
         e0Qw==
X-Forwarded-Encrypted: i=1; AKwUvByqMXZ70Vn0pzoU8dlJsoM7Y0HdyePTaGm32aFDC6p8iJX9msCtEMMKVIGrhUVZ1HMvoTqBz7OIJz3P@vger.kernel.org
X-Gm-Message-State: AFuF++mWsaQ5kQS5Gl6+uYuEPWeT7DpchEOxi8U0aL0th3Nh6JWU3GUq
	c1DF96gqqNVVQtx5YRiFK6JP0ucQby2EeVkB/hijBIozlsSaLRBJWu3r7MDSLUbJroc=
X-Gm-Gg: AYBFou3S+MoqfTKaXo030Z+17IVWZ6KY49H3U+kCzq0VwP2tGftXCBIY6/YElqlb2iu
	D5FXJjlMcDkCfIaaVJYWMgqLpPEmcE6wTMymBVvC454pvGurZZ799JAxjoywUMN+W2eScl9Rmtl
	nqVnvrU584tVi99jFUmBtbaqBOazA2i6GtnzD2PxIggqT8ATTnfSvbxC8G17QBEyZSnsL28mPyf
	YBoVXGW09U7JpDd9tzf0LtcG2jh8wzbsZKklVJMq1lspuFysqHtEo8oOAf62Yxokuw0dA3Mmwof
	WK5msgJ4pBsgdIYQowhBit4eSKFl6G0XzBp1I/v+QH8d/ti6y1EApsDcZ29kTo58H6ncC/H9Ab/
	dIQ0MIQu8aTDKZ2Lhey8khGA1GgkgwU91dELkZoxcvQbCsmPew2owJbBahMKnh5eT1Ixw+GjaA9
	XUhPGOusZQDXzo1yDNDOooaAVgSqzc+x0OhvTGNfnaGN0zWvvF/yeNqGB20tXOqZy42xUibNYuR
	kX3My15Stfe9RW9ZMB0nkyIRvGL/SDb0EKN
X-Received: by 2002:a05:6123:4e:b0:5c6:599d:8730 with SMTP id 71dfb90a1353d-5c7ed723952mr2022613e0c.3.1788508860984;
        Fri, 04 Sep 2026 01:01:00 -0700 (PDT)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com. [209.85.222.53])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c7ec23d459sm1575405e0c.9.2026.09.04.01.01.00
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 01:01:00 -0700 (PDT)
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-97ca72f2cd9so451188241.2
        for <devicetree@vger.kernel.org>; Fri, 04 Sep 2026 01:01:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxouBDMJjxDZAVMqF+M4XlfW6xelxs4PAbLOtMW9oTmP5a6RuSKZbYtZTqgSgo9nP6G9Ao7leSL/etn@vger.kernel.org
X-Received: by 2002:a05:6102:e0d:b0:778:5bbb:b2d2 with SMTP id
 ada2fe7eead31-78a4a97bda0mr1434786137.11.1788508859808; Fri, 04 Sep 2026
 01:00:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260820171657.62815-1-biju.das.jz@bp.renesas.com> <apnUfCIcTG4bmYZF@ninjato>
In-Reply-To: <apnUfCIcTG4bmYZF@ninjato>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 4 Sep 2026 10:00:48 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVOY2CYKfhmx4qmRPkf3a002NEbWuwafLvrJTXvLb9PLA@mail.gmail.com>
X-Gm-Features: AcwNN1URdf1eUYUIsC6Dx67B7nRZjxmnJO7wd9vXW0tYWJ8jFblIIeeoKCEUiQM
Message-ID: <CAMuHMdVOY2CYKfhmx4qmRPkf3a002NEbWuwafLvrJTXvLb9PLA@mail.gmail.com>
Subject: Re: [PATCH v24 00/15] Add Renesas RZ/G3L SD/eMMC support
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Biju <biju.das.au@gmail.com>, Ulf Hansson <ulfh@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Magnus Damm <magnus.damm@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 3 Sept 2026 at 22:11, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Although there are still issues to be handled, I tested this series on a
> R-Car S4 (Spider) with HS400 eMMC and on a R-Car V4H (SparrowHawk) with
> a UHS SD card. No regressions.

FTR, boot-tested on a wide range of Renesas platforms (RZ/A1H, RZ/A2M,
R-Mobile A1, SH-Mobile AG5, R-Car Gen1-4, RZ/Five)
Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
