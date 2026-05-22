Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA14435675E
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 13:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779456698; cv=none; b=M8WaMIPPr6PlaGcOM6KULTvnU0/vV03+Nw2a9bMnmNC/kCQWNtdVHeN5XOetH7QCPxzTVTImQ9u+5mGmtgDp3eYbjvEI2uvVaJxDBEjgpspecSXCyOCjDVLFIFnNdmmFewRnBWWtn4HlFmokYBrNIZ/7U0CBeea0ApYdlmB0+mw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779456698; c=relaxed/simple;
	bh=Xf+Yg8LOlRf2GpZPDC0DTWEwrAeGxm14AhKUDI+j+Fs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WWJhHmDU7Aya/0eZlWFPT//Qx7n7SuBoZs5OvMEBWEOJQj8SRltnvnfsR+9jiOqKXXTXQOMVOSByh4t8I/YeZN4WxiFBhmZrTAE6IekX3AZw9qStszALxF4HcIv+nYhH4Bj6d5Xdzg+IhdnL3A71y4+dhfxaj9XuYlaw4ARgfAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-63129bf2af0so2670836137.2
        for <devicetree@vger.kernel.org>; Fri, 22 May 2026 06:31:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779456696; x=1780061496;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3IibdMW0ZAZE0FiZHS+V+HA8IdlGKvS4swE3fjIitYY=;
        b=hlqI8UHcEr4bqNY95LdEeGCXwA9IQSR033HvM0vozT6m2+VkTWLnP78t7aKr26pqDv
         2Jxg7dBxtmXEtsdfW+c/Q8SMLn9oUilcG8TEtH+JCTQmgrgZqTMJJuq8uvN+kR0+/Jck
         nLtugBD8Z3JWA6sDk4YBMsonV/JRLWQa3i1yp3W3xuHKRIYED7CE6Y9SWzM/krCWNCus
         oJtMFlvfb/nWs4is2fC8niotf5zAL5FqkhWPgeQfthd7Hdveg4LcFP+mPJNg6ml1JgAX
         nlFdMF9W/GbhqUviHw90l+fdvkGODGwzcQeDqnrh4tGDB1LoRENuGEvWm1x+ak95KCk/
         rYuA==
X-Forwarded-Encrypted: i=1; AFNElJ9iMKos2Lyls0EARScQZr5kuruNYUwLKXZ9TnWDITp++MOj0DtIq/vP2cNihLN+1SmyC6RWTERKbobl@vger.kernel.org
X-Gm-Message-State: AOJu0YyiHVV+Ecfjrp9rUUvxnaLW/svqZqXOHR9dllBikGgNOQ3qvvvN
	QUi/fxh3jTX8r6USS5P5cwTQTfDYOP5NUPaQng8WmK/VfexQ2ZQvGspr+Y8EubS3VNo=
X-Gm-Gg: Acq92OE67B0WszrXcKyq1RUjZMVl0NRXLLGKWblAvE+9MzpOtbbAdscaZOXzftha0mB
	eYYurDLnnJpWL1aGbjfTd4ljeQ/239VzQaHxFT0VP+mSQ4DUcdiD/CZjwxlNL+WA4DuYb1izO2d
	Bg1MImjWDR/B9kg++fipetvRqHnFenz2whNOAWUrJS63xzVSXqpX2U1kAHnOfoH2grfNRbIbfU/
	ibsxnXM9mEk0lgbs7SnkomXpybBhoWd/XCo3bR/t+FHf3rsAuF6x9pKg9ebaDzHppz2o8EvEdBK
	BNNzntHqgc2+tCd0YLBbrXCO9/oMIMgCzcoOl9HiSBHfpd8qQcOeIKrIwCl2tvEvMcBt0vUW0Zr
	Z3hmkeVdTNL/hgTbF8ZU6D8Qx+vaOYDI88JtcqeC8VuETpQF8Tj3pJDqHUeRm6tmPGoCYwFYl1I
	sjKWgtbyAbQoA6j/OHf8pFwg2X7vb0bQCSYWqGpKYP5As0zIJa/471bVYJEqtWj5C2
X-Received: by 2002:a05:6102:3fa4:b0:634:92df:4dc3 with SMTP id ada2fe7eead31-67c7d97673fmr1625169137.16.1779456695977;
        Fri, 22 May 2026 06:31:35 -0700 (PDT)
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com. [209.85.221.175])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-67fd8850d17sm1320743137.1.2026.05.22.06.31.35
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 06:31:35 -0700 (PDT)
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-5751b7d147aso2755231e0c.2
        for <devicetree@vger.kernel.org>; Fri, 22 May 2026 06:31:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ98pkTKmnhddMoP+Z9F/8WYQxV0LDthrBv7H0gT8R0KCE4wCefvFiSdp8xNnyJijC+gH/dBZW2BpvFw@vger.kernel.org
X-Received: by 2002:a05:6122:e166:b0:575:360e:6009 with SMTP id
 71dfb90a1353d-5865f15480dmr1917895e0c.4.1779456694823; Fri, 22 May 2026
 06:31:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260520115144.60067-1-biju.das.jz@bp.renesas.com> <20260520115144.60067-4-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260520115144.60067-4-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 22 May 2026 15:31:21 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWYT1n9bs554jkJQ-Cu6yQ3C4zdeXYAeTjxRfEAGzO3Zg@mail.gmail.com>
X-Gm-Features: AVHnY4J_8QsNnHka07viF6tH8LShnOalF7HfnEKC7XAH0_Z4FxHa7fIG0OGuqUk
Message-ID: <CAMuHMdWYT1n9bs554jkJQ-Cu6yQ3C4zdeXYAeTjxRfEAGzO3Zg@mail.gmail.com>
Subject: Re: [PATCH 3/3] arm64: dts: renesas: r9a07g054: Add max-frequency to
 SDHI nodes
To: Biju <biju.das.au@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 20 May 2026 at 13:51, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Add the max-frequency property set to 133333333 Hz (133.33 MHz) to both
> SDHI0 and SDHI1 MMC controller nodes in the RZ/V2L (r9a07g054) device
> tree.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

increasing performance by ca. 33%.

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
