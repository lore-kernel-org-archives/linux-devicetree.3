Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D725D31A81C
	for <devicetree@vger.kernel.org>; Thu,  7 May 2026 09:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778147544; cv=none; b=gYRE1PRpnGo5dW0BlAwi2WskkYkj62SJWepZpzcL88sWnEOwWXlUEwcmQDK3kGu3DlxN5EchzQqfXeEN1M0/Ecic2rhbPJSy9ryL20pJZ+jwDgQNFHT2wGmen721+vCbxUheVeqp267aLgVlt99RfaQS9SY3FgtfbmaDoQymVZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778147544; c=relaxed/simple;
	bh=eJ/srp9zrosiZKPztLc0t3HXPykDKM0ecqir8ctUaFU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d/Yg5993wWSHm5obuwRtStJjWHJXI4xdteNWbtcIhYRYICTV1V5cueuJYvPRQHxikNDp6eLJIsi4kjL7/gycxbWKNWAH/2vxi79MiP2CO5dRtGRo8eFhrATyoPlwcvStFsp9cHXudm1tCljvZqwtK8yQJIcM/Y5OtlOAQPCORaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-62f4c4e6694so418695137.3
        for <devicetree@vger.kernel.org>; Thu, 07 May 2026 02:52:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778147542; x=1778752342;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1bhar/UK+XkT5Dhu83HpcF1mBIkuaB73W2rNiIRK9TU=;
        b=pJJZmixBx9DvNkdCLYA2DcO+qseMFi0CSBlDeXGBe0XP8JADLm9nvllo4af/H+hVlf
         C4w6sKfjecW+kX2sNovjc+t0qbk66hMSkGzt+32hsbtG8oOpH8fvFQkzfrlt4iH4fKBZ
         /Cdx7iBpRZGkUZ2WF7qlHZO6mMw160MmM5PN6HKyW3AbDFSzG0YdhnrdVdS4BoJn3WXJ
         deuSo3Hy6NGWXfeY0l4astT6CRZuGqdw4JpG3bX7I2Z8UXLJubsQEVZIOVl3UDV6kkF/
         UNSVgwAhDOxDSKm056FzSJPGfqgqyUaIbxWcfJL85ryRZ4NiyyLeNTjUsDg7t4Wx/PQL
         VWJg==
X-Forwarded-Encrypted: i=1; AFNElJ8ETngpmioOuk6+dIu8U078bYEsIElXkhq6010y8qk9LLkLWNUiasmbDetxPS8Avi7dxi2WfNzexKL6@vger.kernel.org
X-Gm-Message-State: AOJu0YwhiJ0mNF/kF1gjX9cXlwWBtadTDCuxnqPor8Vk1QwTBw01JtKe
	xTSepJoT+w14eXfiqLAhrjhfr4HfyjOw+YJ6n0mCMI0gKEa9DYmAby2z0osHWn0XhvQ=
X-Gm-Gg: AeBDieuYavicQbyHXRbpN0kcE/T1HVq0fNlAXFXOtJd76/FMzibf5VgKVQestWG25jw
	6OegHiByglhjdhP+YH69EnqjkAeQLF6b5sG/j6rwnhve+aUPP+V2rqFadEtr/elSmH8AViwtTEA
	7RJRkmTN2+r+im77DAUWHpz+ukZyQaof54EPfcKqNSgaiQ+GgXhRxIwskwPYyOpjEhbYBLlXNTY
	FsyzRE1qoX5kb0r/JIecMU3pjRbNEml121DJNT6osU09zKDuaGO/VYPzdvKgqaOGd3+gNPQjz2G
	AY+h/ZnuvifBD46Q1vNkFy6aTrpqaHSVRgWTo9yb0b6bb9Hi2421MVCik24sefOkJB8VWOYwt9c
	Ex3z2zpRlSHqNJAvyom3elHv0Aa1F6W84we0LUSyoJw4MjSAj1oVDxp8/X3sjTFAhUfGUMW76uP
	0iV1DdoMqiOqOgQt0Fh6Wr29YVO0aY2meezK++r+SKlV0+hOFS0ar6ex0cSvBv5m+nrmx71SM=
X-Received: by 2002:a05:6102:8082:b0:5ff:b8d8:b40b with SMTP id ada2fe7eead31-630f8ee2576mr3578909137.11.1778147541857;
        Thu, 07 May 2026 02:52:21 -0700 (PDT)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com. [209.85.217.42])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-62ece141251sm8916769137.10.2026.05.07.02.52.21
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2026 02:52:21 -0700 (PDT)
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-62e4f756446so418665137.2
        for <devicetree@vger.kernel.org>; Thu, 07 May 2026 02:52:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9QtVUjRRYq6zLbgL7desb2qX5l27/qAtdZbiMmGHqD98i2ryh98uOZ7GQWitv+oWo+vcQgjdHAN6J3@vger.kernel.org
X-Received: by 2002:a05:6102:374c:b0:612:164e:ab02 with SMTP id
 ada2fe7eead31-630f8e75bc6mr3667660137.5.1778147540890; Thu, 07 May 2026
 02:52:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260326111953.31024-1-biju.das.jz@bp.renesas.com> <20260326111953.31024-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260326111953.31024-2-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 7 May 2026 11:52:08 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU8S6pOxodK-LRWfU9NJhD5is5T-=cxA-K-cohqAyefAQ@mail.gmail.com>
X-Gm-Features: AVHnY4KKrk-p0LtIDnyA7jlpV5cLB8liuCJjfvbTpNoJ0gGv-_9HWUuGQzK5SBg
Message-ID: <CAMuHMdU8S6pOxodK-LRWfU9NJhD5is5T-=cxA-K-cohqAyefAQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] arm64: dts: renesas: r9a08g046: Add GBETH nodes
To: Biju <biju.das.au@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Richard Cochran <richardcochran@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 26 Mar 2026 at 12:19, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Renesas RZ/G3L SoC is equipped with 2x Synopsys DesignWare Ethernet
> (10/100/1000 BASE) with TSN, IP block version 5.30. Add GBETH nodes
> to R9A08G046 RZ/G3L SoC DTSI.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v2->v3:
>  * Rebased to boot series.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.2.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
