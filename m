Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.125.188.122
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794339108;
	b=SWvzidfmCt9j4z7+2Egl/Zfd89N0h9NeZA4O+hVKsCXU3g+Sz4DX+xEiI6E2qTFiKf67
	 wzrJdi1u+dAAesYVspGG/ybMgzKSa5sbzCsRxxeBV8joEjvw9An4bXz0lU69QvyL1YHLM
	 i4wFOwh5tVh2hDIfM3EOXRM4PgIKdg64rL2S9YWunVADmt1f/wIILFrmg4QJbO2l+/C5Y
	 DR7B8Ymp84jUzUiQqGGyAox1rIz/XtZf9xyjnJjtDLnkEq8kHH4lBlWP3pvcsXBzjdt3m
	 VpnHFlp2Gf4rhd4w3v9qvsrShiQxQjQLmHUYxZhbBNA/coLyhnuE9se4yC3+uUXqZqA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794339108;
	h=DMARC-Filter:Received:DKIM-Signature:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:Received:MIME-Version:In-Reply-To:
	 References:From:User-Agent:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type;
	bh=HlDh8YMmHEBtzHMVqB6csYqKYNKf7MABmovW9DqJSao=;
	b=XIGR14rW4nd7imjJrkodwRagAsprg1jsTUN3K7B+e/4X7cuvqaiOr0h0CiCbTvm2R7ci
	 uJ7CwcMpzNeaqUKTklsKYUV69+1MiwxqbDpAIWbME8a9NN+vCGWAinHzsoA/R+Xk22bxN
	 6eC3VWMozYvsS67uNV5ihRWkMVBjzQKX4yay0Bumf2UJ2LbogEcuvX9i1fpXFYdATFJ/6
	 iy7g2l33uiTe2D68UKh8Krx2ZcouJtyJmSmsYJO7tt1dcbxyvbmANH+ZaBfvI7i14cIaY
	 RN3F+yX62mwnfdrho0upRZz7aEFlR38NfPhXj0HNy4GXpLEbgwUkMtwJMvH3W0FXu7A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=canonical.com;
	spf=pass smtp.mailfrom=canonical.com;
	dkim=pass header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=O13ecu1l;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.125.188.122
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4AD060A2604
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 19:31:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C4AD060A2604
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key, unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=O13ecu1l
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com [209.85.218.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id D90293F853
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 19:31:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1794339104;
	bh=HlDh8YMmHEBtzHMVqB6csYqKYNKf7MABmovW9DqJSao=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=O13ecu1lE0fY9ozGK0wADVTciwDl5oh4wWejqscWQGPEHm9+cXEzVoTYuGVpkcVLk
	 hq94WGJd9CUjJsIPIFTDIsG4xJjI9sZgC3L1W+0wxjB6rXjoKAYNS658eBTdTMHhmZ
	 W/cdXta6dacpVo49NLwXls6GE3lPZFQO6AZK1TJGZrpnIxC0hQLmvri8WoocWyMneF
	 wCbVaJVEbnq7ufxHUAp5U0cbcnp0xTm+2x6nWVdHa7upjL2k9V/Izf/jsfqwYsLfbk
	 mpuDEAjFmo7pW4EG4NsxyOhCUlokKyYRpFeLn6UZLCoLl0W9oYWvamlKkPu0C0UxeS
	 OKYUuT8DX3U50ZVkW00nITkHPbRNQ73UCMnvxcNYx6uDdrAsEwcaHxIH7V3G1+8k7M
	 is6vPH8+7GYE6Ylvx/Il/j5vSUCp/YwubrF0THfnQBrvQSueNFTy0w/su/CK/Grllf
	 v0xVO54cq8ln/h3bfKJEQbxMo4y/BM7pRtXKYKmQNZd2V80TAnCx0ZHxIgOx6OGYlq
	 6biHiLr87/FHjCqBeG6S2O8+6qzGjLwZsWqbBbBpxsbqIoH/HSm6m5bx0jBJMoMvwv
	 SWcMOLfEWkxDm5WBTwYGbYvzQvaliHMkNYCMrXTdojyapbxO/FfHP3V5QapEMTyEE9
	 XavCVlxpgOBIoRwm2cS9J9AU=
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-c3f04e0e481so205736966b.1
        for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 11:31:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794339104; cv=none;
        d=google.com; s=arc-20260327;
        b=rbjA3RQttEdCt+0b+5+Jdy60dLjxiDIDnQ4q3Zjgan5kAMqULsQ7uPNKYMXlT158Wz
         6LD3JSy9kpNBcskQvTstFIJOwexthwxT6QwYau+S6CJKapsIKj9+8OcBtqtSC6yfmL2r
         1tFMd5m3AovtBWzz4ClyWDm7TukaVW+S6FCXz74zj1BTvtNwC5g/WH444WnGV+ozviVI
         A8xuov7+nIJqjiP2g0T8aCAdK9/kWBzyujtKb42J/NiVdqEJ1vbn+4ezyxxYnMgoeyVf
         6SOuWDX7wz7QEZ7HvAzSN225+yTnlvr5nUC6Hq5ao7oTs69Uqn4HBwFCsvsgktHGFbkC
         NCzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version;
        bh=HlDh8YMmHEBtzHMVqB6csYqKYNKf7MABmovW9DqJSao=;
        fh=J0q7S++8BieLxdBzVE0EtLY4Er7mSoCS1dDOAVzJRX0=;
        b=WgZ8HscTOpMkb7QPiJt4ma/DJQxcx+Y4So9jFBNjlZgwU8rA1VBrY5wftFHgA6snFQ
         vAZmd3OtUqmpPr8TMw3T6Rj3PubVeK+cMA2D9AyUk7q3byRXQtCrDeImNhmLs+wS6QJp
         PjYRVxNJPi3SkL1YCPrAo/9bYnkzLZaVsO2QzM4K89f+FkFk2l4LbHq+kVQzT2Gy73D8
         +JR7yRrZxC+xvDRAa+AQaeeoGuAfCK6Gn2D9CbtOclR0t606hW803zEItGEAjnBZP9gx
         89+hTQO9nY+t1kJopKGEzf2drlq1bwBIgYqJvYfSMTZ94PlZuoj8JHOflE6YrykVnsMm
         EOZg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794339104; x=1794943904;
        h=content-type:cc:to:subject:message-id:date:user-agent:from
         :references:in-reply-to:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HlDh8YMmHEBtzHMVqB6csYqKYNKf7MABmovW9DqJSao=;
        b=eK9K2o6nYmtA67nj7KFxj/yHqBWuUy9RBmgdI8ddJCGS0Jgok4y3kSmrZ1eRCrc99E
         ar2Gk2SQhUV+KQ3RruuKFXLFhMiXfW27vse03Gq1wSjZ2u2kGraYsyJ5me4aPXK6LT5j
         /93HCrlmUZWm8PX+LsagbX8ss3KkOa7FLKRmFahvzBluu2zeN67GvkrVxZwYL0oYA4WV
         1hGD9Z2mxglrDwlT2i7nY09HgRZ4/gWOMaqja7fm+cCUmQmCws+OhS402KuWgeGd12B+
         QfBZOZqraxqtVwYpwW3dmlJOYDbwIEee16tixJVLzezxjsN8lwguYliLOVCeBgCsmn5Y
         ajfA==
X-Forwarded-Encrypted: i=1; AL+hErGGKQ9XL+g7E4Wt/G3QC+WXJU45oAuxsWdgSvUyceMm5VD/LKPO6ZSTojPhMFtI2+xYaPNVcvnX6WQx@vger.kernel.org
X-Gm-Message-State: APuU4Z+MqHRqRZJUjpNS8JnGETcWXlCeATRYdtCtoRn1m59uHpHlRePP
	1ir21S8t+p7aJaJtKW1MSZnKXDnPcH4XG/MnfTXfLJT5cWtYqIhn9hL/0fRe+cNtywn96VltER9
	F/c407tXc/30vivqqAo3H7JOCRYAg4ZhX8C42AEC7EaOkIt7oy37/xYhs6d+GYEz1eM/fC/uoYV
	Isb+ob0F6uc7+8z+y1Cfolxo35mDqSmJPF5UCTVD3CyiDsPRfvzmGg0g==
X-Gm-Gg: AYBFou2iO1XJvz/uSf8JdAq76LoyYsKKGZD1MCH2Y+lncxLl88KAuVTXaeW+NjaCT9s
	2GjhNuKYnK3XODGTD8RfK67it7KnW+qZBmiSjEjboyEvN3ZpflyrR+z5JUXzWv+oHUzsQp7TdoV
	nzgfhFmsTM2nuYGIsy5ae3gUYL7TBZ4rMPn8ckrOIMmAnvNeCg50eifge0
X-Received: by 2002:a17:907:2d9e:b0:c50:4b7a:de71 with SMTP id a640c23a62f3a-c5066c973bfmr7684766b.28.1794339104483;
        Tue, 10 Nov 2026 11:31:44 -0800 (PST)
X-Received: by 2002:a17:907:2d9e:b0:c50:4b7a:de71 with SMTP id
 a640c23a62f3a-c5066c973bfmr7681666b.28.1794339104008; Tue, 10 Nov 2026
 11:31:44 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 10 Nov 2026 11:31:42 -0800
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <20261109051050.105623-8-joel@jms.id.au>
References: <20261109051050.105623-1-joel@jms.id.au> <20261109051050.105623-8-joel@jms.id.au>
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
User-Agent: alot/0.0.0
Date: Tue, 10 Nov 2026 11:31:42 -0800
X-Gm-Features: AclHuK9fQA8Jgn0xTRsqLvStB1Q8zamqe0b0Aq0C1Bxekl-A8FrsSuWOeKP0fC4
Message-ID: <CAJM55Z_zrUjaWrxSqZ=8VWEJqbh_Oa6gTHf=UJZyR2__MCVueQ@mail.gmail.com>
Subject: Re: [PATCH v3 7/7] riscv: dts: tenstorrent: Add Atlantis platform
To: Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, Rob Herring <robh@kernel.org>
Cc: Anup Patel <anup@brainfault.org>, Alexandre Ghiti <alex@ghiti.fr>, 
	Thomas Gleixner <tglx@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Nicholas Piggin <npiggin@gmail.com>, Michael Ellerman <mpe@kernel.org>, Drew Fustini <fustini@kernel.org>, 
	Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Quoting Joel Stanley (2026-11-09 06:10:47)
> Add initial support for the Tenstorrent Atlantis platform, based on the
> Atlantis SoC featuring 8x RVA23-compliant Tenstorrent Ascalon-XG cores.
>
> The evb machine represents an internal bringup vehicle with just the
> interrupt controllers and a UART. This will be updated in time with a
> full featured machine once details are available.
>
> The chosen node sets bootargs to earlycon=sbi to aid debugging early
> boot, as the platform may not have a bootloader to fill out the chosen
> node.

Does this mean OpenSBI uses a different uart from uart1?

If not that means both Linux in S-mode and OpenSBI in M-mode will
both try to use uart1 at the same time. It might work by chance,
but a much better solution would be to just use "earlycon".
You already define chosen/stdout-path to point at uart1 and the
driver for 'snps,dw-apb-uart' implements earlycon so it should
work much the same.

/Emil
