Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com [209.85.217.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9D06282F3F
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 13:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786368763; cv=none; b=Qmm125xKNUNbUTcCJT2TJSfPI++UTnJ7wrAT44WW7WFavu/4ON+fkGVkSWhJIoB0+CUxpa73LvlL6SfqkBsW/B0XJmL7oNJGSVspdLyQHw+4D6SeD/LnZP+ImLLpxrPaPm6EibyO+19+GEPdc18+CwhIhsMiKaMxgVJ8A9H/Iyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786368763; c=relaxed/simple;
	bh=VBVrTk/FhG0U3rekKIzDHHMpsUGC4A0uAO/Haxfyqek=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QIt/IWGIT4i5ALhEAJ4e/8eut0ZjEQQSwBVJx1blWgJ5GxPPOn2rUNdm/KRsaU6VcdKyPPbXNuRUK7EQLGXCvn0LI2Sm0BQ/Q+zLCXGD7YegAdjzDMkdCw06jWpIdI9B2XBn7+S3uVqYrTB0Ym6OH+hWQBlYj4/yof4RqIeneao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-75e2905c09aso180105137.2
        for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 06:32:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786368760; x=1786973560;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=2rc8RvA9kkjGCpn5E8aKcYHZST75DhMDJbt7WVlzBWk=;
        b=Rurl96AurujOcCavEEXOn5WtwOFYQgoqzBQOF8bTOS6nbGgAze3EMC//Xs6SVYdpPy
         YETdpwYW3lIZvyxnaWzvK+K3flP/8+ypRn/ivL0HQCFwFeYpHDHlNp2Lt51kQUjcHsiY
         fhPYBDi63upQR82ROF1Oa97bTeVo8fKxjcWr5dmx+X7W1JwgUArFuhpPXIk/tT6KsRiQ
         ovXwEXABZUaUH/IOxPlYZxqddUL/iO1Lw5l60ZtYr/uw5RchSRlkViquKg0vAzy/mnMw
         UmxnE+SaJVJK4jPjCF8cQs+iQr3UN8t7czsX7P7XHTydPENOGlVAXVy7UoWyBrkm7AcF
         8Pkw==
X-Forwarded-Encrypted: i=1; AHgh+RrXZKnlkqFHwn/JsHAWmYqcEqjeqXdq8BDLHHTIG6eKQvY62GMrMGDlCROC/IYZrrK+JW4KqSpHYij4@vger.kernel.org
X-Gm-Message-State: AOJu0YzrjJHPoT83ulRAIhOj4igsPF2SWbt6NhJmOR6mfVvQvxYQtvnI
	K1G89Ha2VA1CNitVTF9ysQE1Apty59ASxI7J3yoq1jTPfbQkHd5Cw6a2Y5E2RjMv
X-Gm-Gg: AR+sD11Eb2NHPqorzb2p+IfwshqmFfamqr8POMFopgSViJNGPkyprFS4aJTimiZ9k89
	EfSWFmV4Kyrwo1da4mjmuFT2JJMaUdquIzo+XA7hOVzeBrwxFJRrupWAM+abj1GcdCJ+XDFkAyF
	0ZwxXEpRWOQcBUvO7Cq/P9SyNi8tHXZJCgPU23H9bOQLXcFssPDmuAcjUXa3/yFKhA/ezv9K2RA
	pINXSj57NOQ8mwqZiW4Mm9M4L/B0yPS6b5oxKPEpsR4mFjxedu3c9Ry/v8JquLB5IsrnRgMfRfn
	ShDO/ajM3fUvzCNHq/RT4KAr2sFrxC6kGVtK5X0vi8AO4DVX3FKpLXvnZaHaz0WvtQ7J4TjbaUz
	O5S2PTUGBu856RhFLR08EPQfe6QifmNJ7zaxIL8asmA3cfJwFybssJ8R+T2uaD4rlHCXBNj8e3j
	p5f/Ne81zxgXFkzU/1Ant5/9g4E/EiyHwXvtJLGhCFQ4nYPJY37RuqYeYoquw6n0wGjQQSJK7DT
	CWxmK2xLu6VNDFQPyeEkll62w==
X-Received: by 2002:a05:6102:2920:b0:631:4cd8:b6aa with SMTP id ada2fe7eead31-764e6fb2222mr4167484137.13.1786368760537;
        Mon, 10 Aug 2026 06:32:40 -0700 (PDT)
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com. [209.85.222.52])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-763feadc6besm4525435137.5.2026.08.10.06.32.38
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Aug 2026 06:32:39 -0700 (PDT)
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-963a722ed59so382693241.1
        for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 06:32:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqNGlq3/AYEqUdi8eCg1qQxi10BqvwfRdvgvscIMSTlwhdjR2/werVxN8fgayZ4nHbEASx/heAp6ER+@vger.kernel.org
X-Received: by 2002:a05:6102:2920:b0:631:4cd8:b6aa with SMTP id
 ada2fe7eead31-764e6fb2222mr4167396137.13.1786368757927; Mon, 10 Aug 2026
 06:32:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260801210321.383773-3-krzysztof.kozlowski@oss.qualcomm.com> <20260801210321.383773-4-krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260801210321.383773-4-krzysztof.kozlowski@oss.qualcomm.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 10 Aug 2026 15:32:27 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWSGjT3oR=78_2UvCVzPGYevonOyW7FGFoCntQ-kksQYQ@mail.gmail.com>
X-Gm-Features: AUfX_mwWI2PNvnTWvynZ86pP9BaKomNHm-elSNyKK_QG8sLkG5jqEe3T6iB_ZLQ
Message-ID: <CAMuHMdWSGjT3oR=78_2UvCVzPGYevonOyW7FGFoCntQ-kksQYQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: renesas: Correct white-space style
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 1 Aug 2026 at 23:03, Krzysztof Kozlowski
<krzysztof.kozlowski@oss.qualcomm.com> wrote:
> Correct a few white-space issues, like missing space before bracket '{'
> character or spurious space, which will be flagged by dt-check-style
> ("redundant-whitespace" warning).  No functional changes.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
