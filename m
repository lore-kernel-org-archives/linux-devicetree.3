Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com [209.85.222.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D2A73F39E7
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 15:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779894436; cv=none; b=XrW0RldXmSED3yJKLD72IZvpbf6U51oO2kzzigycX6ssRlrq1MjhZk+8Yxx6M6N4apOeE0AUOnYlWgES+7VKnP6nRBm+GE9HwTp9AZvQFxcLGlCx9UTK5q0Qrwuuf7p7OdDPblycpHo7uqormNBi/jheoSkZfY38Gj3EaCCmlTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779894436; c=relaxed/simple;
	bh=H/HylOP18ZwqwzSynz7IVJuiEBoSrCg7QihznW7U1Y0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Vzgzkn30VO6e6BhQnu9BobTyy0ASLcqsxymNjHSl5N+ETChU+QjcovVB5hEh38ipiGDtYFuJgao3C169AK5jHuWV/R6XMpFQjbvREp3keP086uRNmjKz7OU0cLvBr/zMFpxwZVMBzH2/b8jAawv2eRu3NkBztMBYJJXnvWU5rXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-956948531a1so3163115241.2
        for <devicetree@vger.kernel.org>; Wed, 27 May 2026 08:07:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779894434; x=1780499234;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4tLo8u1Vz2R4AkmN4sReuuk/c6zepEhZe6+0SFajHw8=;
        b=dRMTwJZalCv//7zTZL/13CO9BEJQ8YxuK/yjMPtwdFTgrDv/OwXH0CaB8P47BWInuT
         7gc3Pgvw6jmM337zM9F2T9W6xWu9zQH2bJFO8uYj2l5xnQeS+gx9zbFP20orfg2Bx3iz
         mPabaUx93l8Po0CuFbvumSjh7h98+Gal4nC+PSIwGeOnyxFthGq/UmvLOBr3M7u987+Y
         ROzhCgNRydXdYTiKm93QueJNKYEtpuWdqm0ny8fGUroNd2w9VxLUrrvYt3GOAnflkybP
         bRhyydPa6qv2a6a4OVtSYXsz7mHNBFsj8UusvOm6AjA0o9ZJmBqc0nc04e8RDz696w3S
         SNDQ==
X-Forwarded-Encrypted: i=1; AFNElJ8VLFre8TDvfV8AhiSXfHm7rZQMYAqzpL9yLgWOwlOxZHsSCjTLtVxMfqSZ/SCarAbYK6ra4G6SLAVF@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3ov5b/pvZJCeAyEvq/x8vnNNVCvaPPSjJXJc55hp2cd098EB3
	wPxgEm1FPCpnwKRaQZ5ytJUKD3tQ0uYtIX1v/4RPasjhtu2kgbaOe7+0qCiT5KVQ3u8=
X-Gm-Gg: Acq92OHblb4CT7TG1u0038uQeqCL8nef5//rBizQaLVPn0fUwQ30oGAo4io2ftt9GHJ
	txewb2S1vVsi35lMb8FKep00gstKX3SM3wxH6k5uWk5w7fpqvLvydomucOySWXh9wzzK5mRrJQw
	1XswWA2yGMPNKvTyXE9TBrX1Jwx9uOfxlk/Qhyj4KL/aZL4q2e8C3UPZByppd0XNL8O1h4UXr1n
	rnp9RtJAu35w7jwwDYdHjDYQIaT0LcvPv8IGy/usNtBHqg5RCV5NmZKyj60696+cYG+yA+11ek7
	IKXy/CExXALvPJs4SxFtbRNxJs/1hkDMesZYPJCoCUkxjud+YkkURtmiujtllwDM1tBjZ0m2ZXl
	GSPK4sZNAonG3SbQjdOok6RZ9HeDFUfq51cxYuUaNTx7TnqkVfu6Z5QzxnYGu8UZX+EGEsCtmJO
	lwnG4cLXa8DrEGYaT8glyN9zeEgQrmvSJKy/76C5e0DPOjtTsau9aiQZawhaIFaNea37o/9+ECI
	Jo=
X-Received: by 2002:a05:6102:358b:b0:612:7ddc:52ee with SMTP id ada2fe7eead31-67c7c0768c0mr10280467137.15.1779894434030;
        Wed, 27 May 2026 08:07:14 -0700 (PDT)
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com. [209.85.221.174])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-67ff5f0820csm17410320137.11.2026.05.27.08.07.12
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 May 2026 08:07:13 -0700 (PDT)
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-58d2174a2b4so1681646e0c.3
        for <devicetree@vger.kernel.org>; Wed, 27 May 2026 08:07:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/+MAy/qpT7Xfm1Lzfg/P/U03rFzuPu3crhnWNv7nOBUG0w5stCaULqx/qhiP6184j1aQ36fWwA4YHs@vger.kernel.org
X-Received: by 2002:a05:6122:3402:b0:56a:fff5:b4d6 with SMTP id
 71dfb90a1353d-5865e2b5250mr12717440e0c.4.1779894432539; Wed, 27 May 2026
 08:07:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260505070206.7932-1-biju.das.jz@bp.renesas.com> <20260505070206.7932-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260505070206.7932-3-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 27 May 2026 17:07:01 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXbTQVF2XnC8CFkDnCr55Lf+sqC+SyVBouXSKZjxqObAg@mail.gmail.com>
X-Gm-Features: AVHnY4KHTobvA38i81edRkw1RH0rAYyI2YTU6RYcwFLR_hc61OTVaY-Gy3btGV4
Message-ID: <CAMuHMdXbTQVF2XnC8CFkDnCr55Lf+sqC+SyVBouXSKZjxqObAg@mail.gmail.com>
Subject: Re: [PATCH 2/4] arm64: dts: renesas: r9a08g046: Add i2c{0..3} device nodes
To: Biju <biju.das.au@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 5 May 2026 at 09:02, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Add i2c{0..3} device nodes to RZ/G3L ("R9A08G046") SoC DTSI.
> As the place holders for i2c0 is removed, add the pincontrol
> device nodes to make it functional on the board DTS.
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
