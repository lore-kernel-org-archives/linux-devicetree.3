Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com [209.85.222.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91DB93AEB4E
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 07:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781681055; cv=none; b=McVgOPWeeJun+8HsTZdgYnk9O/NmtaZwekm05D0nX8Bqpb6RnURuvhR0jL4mfyIhH6cyY3GmlHRDvqnaQ7qdo0q/PpwJJt3ZQrZkkbsmGpJ9ugY+YVzroQwDeHUPkaAKcp8DK28/Q+5YDlioE/AcXgpjh1hj7O8g0NES/GR7tfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781681055; c=relaxed/simple;
	bh=uR7TIRBR3yg8tAIyxRV/d8RKl0ocy3CufGlcD3SG8n4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Mx2YgRGoe3krHrtNHbuToOolNU4ecePoE1dvjtw807aOLAhfJiSkB3hwr7NrIVfzrSpXzunbX0D3Z1DSbcok5YpZx4zByGxDrlGLV42Z01mgfxv881Ri2wEMNtv+ehNj6FkzU6TCuaRpgHTRwqXRvVLThK04Ub+v/J9rLozVkRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-961556c15ceso1582563241.3
        for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 00:24:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781681053; x=1782285853;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ahs58FQh15JfUVstnf1wGngv+BPi4LTDqfDVl/aFn10=;
        b=ByhHR2qtl3VgO3KGiVTDZbzCTpMuA4Ap2cVcfIki+vSuTELQ5QD8YahYbreGzLmZeO
         hXJRmnFll0IdbJlbBKHF97VFlJkBZO/sJx1jfH70p+08dfU2qhvTVCPdu8QvChBGuzbW
         8oLoOQ7QpON13PFUagODsndMncUFjIw+gT2JDt5/SgeoNJ/YgsTXz9gOcfSCibragtxq
         AzNL29mepW1OLtAW2UTOIgYb3OO1c5F14MlR84I1IDj11/XkB1vNPcpMt3dKSH0k6/oG
         6ieTpX3SgDbtj0MbqAUBJEErfD9I1i3JE40o/AkHt2ZLADvb194S9X4IP7QvkxgHx70h
         YnGA==
X-Forwarded-Encrypted: i=1; AFNElJ/G3aObYH6ziSj9N/HX1byu6QRbcktbAVt9eA6QLT6EKY+gvessAdvcWk/9MV1D5Yc6qkMR5ja4tAk/@vger.kernel.org
X-Gm-Message-State: AOJu0Yy85UuI3aL/5Ch8silgtrVVsOr8zPlFbfK879hOOugwgXR7m3Rx
	ODUY5pGCt0u1SdVHBxF0W6NreZbF5BqrkLMhA3I3awYiNjRqVHCCI06XT+l8bsPt
X-Gm-Gg: Acq92OFKFJOD2rG45ycBt85xl+iGtJbUgBk2gUAy6yQs+UtCtMFszRBDA6z/coTxJPF
	EXTSo6HL5ll64LBNtiZHU/c+47sSv9tLhPHPyNfI4XM7HwhUU2H5j+xcUk7V9Y7bVcnhw4B2LEy
	Wi8SRd/FVvuIdPdzywEbD0RXdbMDV+xKoimfggQHk3IZXTknhFwp2PJ0B0dewo1NjVd8QNXYzlk
	SbWArU6jB9xU4Wbg5qJiaKlOS9tdqoPQcGyDS/3uRUoM3aT1qFT6TXdzqsPBxTYK+kD4zItDCiG
	yfh3+lNnbvW8kg2AS3YXL8ssFR81sfNgLy2PEKg3kSaqPy4LTrKbIAm0xjg8UoePC3yLY+CKb90
	2EabbKRmXToXzycK6jpbd3puHexu4qF0LnZTSQa79107ozTv8/eqTD8FrSYr7zLFK9dz9+VR0g9
	QxMqC/zvAb/UVnXXSM7DCbXEyegG4lidSQ5LpLZglznxZnaZyfew==
X-Received: by 2002:a05:6102:c8c:b0:635:1bc8:3568 with SMTP id ada2fe7eead31-7246d0f4e6dmr1484790137.23.1781681053530;
        Wed, 17 Jun 2026 00:24:13 -0700 (PDT)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com. [209.85.217.42])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-72084cd88e7sm6379112137.4.2026.06.17.00.24.12
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2026 00:24:13 -0700 (PDT)
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-6c3099b11a9so2204064137.2
        for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 00:24:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/eJNKGEEh5eTRYZ4pr0iTaFaBZaEB6rhPMW48pdKpWx9ArEPGcbQre8fZxJ1rZTriZhv+mZxLlTxZr@vger.kernel.org
X-Received: by 2002:a05:6102:548c:b0:6ca:32f1:f06a with SMTP id
 ada2fe7eead31-7246c88cf25mr1325601137.15.1781681052567; Wed, 17 Jun 2026
 00:24:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260615154805.1619693-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260615154805.1619693-11-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260615154805.1619693-11-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 17 Jun 2026 09:24:01 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW769Sk4FMJWNyCK5jzc5oVZL_4L5wt0w5uyL93wrYF9Q@mail.gmail.com>
X-Gm-Features: AVVi8Cct3Yj3PdPpYaOL4UBKNGskw3sUCzooWr22FhgciKRmjYjt1bOLgA7r9iE
Message-ID: <CAMuHMdW769Sk4FMJWNyCK5jzc5oVZL_4L5wt0w5uyL93wrYF9Q@mail.gmail.com>
Subject: Re: [PATCH 10/12] rtc: rzn1: Consistently use dev_err_probe()
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	linux-rtc@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 15 Jun 2026 at 17:48, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Use dev_err_probe() in the IRQ request error path to make error handling
> consistent with the rest of rzn1_rtc_probe().
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
