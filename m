Received: from mail-ua2-f43.google.com (mail-ua2-f43.google.com [74.125.226.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C728A455603
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 07:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.226.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790149086; cv=none; b=h8cOvh/RT3kikDos6wgG/DtOR6t5HvMHFvz1PZYpYxR5i2QqcblpRpPDmNt6epV7QEiCg4eWdAx7VcYAcQ5xJptc7Jxu3P4LRhoyE5PejBKd/J2bbgPfP17xPZ2lea5HdTzgxrOfLYO8lI/9sbX+h3iss9eNDVXTqRX4T8lpc10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790149086; c=relaxed/simple;
	bh=pn8GhlML0JvQlv8XCkL1gN9RQZWKQflTUH6iKyoTXWc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Yq3CmJsDnImg81P9QipCSu7qPKOYUj5I4K+VAWZNUmnuEe56dvnwAKwbJ+ol0kQKClP3VVw6HWz4evZDDf+x7ZCu6Xvvh5iMrHwnXyRTcy2UW+ri0Ka8voHAz5nGjyKZsiCof8hL4z/HuWJdVyCn8gu/pGTWVPyTGr+9tZvnxho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.226.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua2-f43.google.com with SMTP id a1e0cc1a2514c-98514b4115eso363547241.1
        for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 00:38:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790149083; x=1790753883;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=gPyyWITg2Eop/iHLzqVBwj4t8oamM1QAzgzHz2VN9cs=;
        b=tT8xT/0akst7rASXmy7Qi76ImKD05tGdACVXi1IsKUc8lGgX4jwHzUlope/6PHbxTI
         vxHQDpb0xZ8enDH9Ppw+RPziS/TXjxai6Rwib1YthR7zJ1jaaXoQ99Xk0mhTSTPNurdg
         aFZ2q9OhkoCIa+YeOVgipmNfbzh801ZOTY6Pkju1A9AWyxKmL02Z4sObeY+Or8Z397WT
         U2LY679+zs2Mc/gRpN9pqU8vvx1oPFPhFlZVRjgCk6KliTrBmhbYDHoluKKy5fMey1Uo
         IcWdWD7+WK9e6h/ciUKRdYWsyAEK2qvGwMcQY4x+CcCnvRBtsF1EgJ6XP79jc508vcX2
         qkTg==
X-Forwarded-Encrypted: i=1; AKwUvBy1IHGl/IDLMnwPDVCpsVaOf1xl63tJEYEjeSTCofHTIIOPnlySvNFt6gSAM/LbEcOZArXFYe/eIvny@vger.kernel.org
X-Gm-Message-State: AFuF++mgzzm6hK1Lvk9Ud+78fRry4mHSslv2UoJYJ2qcWTHVRbMlcRzH
	+xHBrk2qn423O258sHkc4jm6qrNvwaI9oscE9JPphkVNH1GzPI4+dNQcHS1FfUm5l2Y=
X-Gm-Gg: AYBFou18zwHaJnwnfGdrPy55PbSFgEnzKxvMDr49uppqD4cHxjyWeduMg6akjYg8q7s
	6kTGXq+7DkJa7ScdNqQTHnGOh+cm2JAIG2U+I+lSDUmNkjdxFCiM58Pp1pXAQREc3XBhVnWMip9
	ZzdB+w8yGuI1Nxit7SKso2y1vP7ORzYIZU1wPveXDBihwHGdrsgNpkpWO+D0Gd3x2aLmwT7leHn
	MKc02RaVgZyoeaKmZ7plqtaNh9F2nzKOpk5t4+zpATuvptXP4Rmmy9zVAyHmwSMh3YpmIqJSow8
	ufVqNGVsAY2eSq9UJiGlaN6zeMliuJwt3iNgPodCtHoWxFhEcaBe3STecO9dneX0IrYgeoMWCE8
	9tvyEtY/fO8x1HwlPQGXHaNtcySetSz5dz9/C/OxCAZBE+oSDHHh0UX3WqUxVJPQ0yvKpdU6pZA
	D2mCgS2vifONy9Y/O+mo8KCOEnVGATUC0IAP/1i3fsU+bhym4OFrzGFZHAffsqgCej4L5HSs332
	ifZdYFEbb7ZHycMrIDVbtix/QvAjHNe8bVR0EOmLQkDJDP4
X-Received: by 2002:a05:6102:50a6:b0:7a4:fb71:25d1 with SMTP id ada2fe7eead31-7ac1a6c6e37mr1941939137.7.1790149083672;
        Wed, 23 Sep 2026 00:38:03 -0700 (PDT)
Received: from mail-ua2-f40.google.com (mail-ua2-f40.google.com. [74.125.226.232])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-98516a42fe6sm2442506241.7.2026.09.23.00.38.02
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 00:38:03 -0700 (PDT)
Received: by mail-ua2-f40.google.com with SMTP id a1e0cc1a2514c-97e7c7bab8eso357009241.0
        for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 00:38:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzMAS0FgoJkfAwbH36S4o1Iyo7GCXbkv63N3X4zHpbmw3IFxngx6z71tzXEXILNKhuZGhR7/LFR/JEe@vger.kernel.org
X-Received: by 2002:a05:6102:50a6:b0:7a4:fb71:25d1 with SMTP id
 ada2fe7eead31-7ac1a6c6e37mr1941921137.7.1790149082786; Wed, 23 Sep 2026
 00:38:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260916220801.240796-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260916220801.240796-1-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 23 Sep 2026 09:37:51 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWdv5up6d7rhhRyc7of9M5MthWFoeXCRWiTPSo+5B22Mg@mail.gmail.com>
X-Gm-Features: AclHuK-KliAgyjEnFc7fc7G0ednHxc9gvY5BOag4zMrSEzrWijgeZD9Diiyx23U
Message-ID: <CAMuHMdWdv5up6d7rhhRyc7of9M5MthWFoeXCRWiTPSo+5B22Mg@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: ironhide: Align inline ECC carveout
 sizes with bootloader settings
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 17 Sept 2026 at 00:08, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> The DBSC5 DRAM controller protects DRAM content using inline ECC. The
> current set of carveouts follows SoC documentation, which describes the
> three trailing carveouts as larger than the rest.
>
> Both the downstream IPL and mainline U-Boot on RSIP configure the ECC
> carveouts to the same size for all eight carveouts. Align the carveout
> sizes with the controller configuration set by the bootloader.
>
> This makes 1638 MiB of DRAM available for each of the three carveouts,
> which adds up to a total of 4915 MiB of newly accessible DRAM on this
> platform with this fix.
>
> Making this memory available does not pose a danger, since the current
> set of carveouts were carefully set to a larger size to prevent any
> possible issues until a confirmation from the hardware team become
> available, that it is safe to apply these less restrictive settings.
>
> Fixes: 6fa6ee724d8d ("arm64: dts: renesas: ironhide: Describe inline ECC carveouts")
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

From the review thread on the original:
Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
