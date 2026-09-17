Received: from mail-ua2-f12.google.com (mail-ua2-f12.google.com [74.125.226.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F927401A33
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 10:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.226.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789639226; cv=none; b=tzb52lrb7zDpxnrGP+svUCtFPdYlqTiD667d5MH9ZLUxTTYs9JrAZ9iE7YWciNRI9oMr8qDM2oIgSJa2x+EfPnx09/dna8ODlc8FXoNGbwkCKVx/aeXDLH3rc+V/RNiUxdZiun7d+ZW4eFRy7WknMMdFTUEjPu4LtU4FqjvMxvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789639226; c=relaxed/simple;
	bh=paeQyicGy4uOJnj9MMiYfbfBIScuQX5Dy7auLPzshnU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=apYHd8bdrF7ntfR75lKcN1Gz8rmKJSINlaWJtdZjAqnw7mVU+vlEDwa4d80G1SMA/ILRFwQEL3aGWRaN3VKLW/KgNWz9P8o0bb9LGF2icvf+tY1ZrcFdRCKSl+JY/yH1RFfYp3xYVyV8vJ7NJOIDdU/wtUuIA6ylbGpb85PIhBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.226.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua2-f12.google.com with SMTP id a1e0cc1a2514c-97e7c8c8602so276154241.0
        for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 03:00:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789639208; x=1790244008;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=PgwBsZe/a4Fuzb0Py083b181bySHfV18F3y848rFS0s=;
        b=y3KPnvV+xlBxHAPdzK1FZsksTeu3cviIoAd/Nd/VUNeLLIIp84AlR0mRTBsyhnhcD0
         IWk5ZL4ZPcNPBknIskwvP5SZGLyHJKmnRFYruQZZQgK5+HhnSzx6prBr3gXzfK9P6Awv
         CpfoLt5AvUp2d0tvU4PI4L+C2VbIxKLoAvSY4iu5q20yyfu8KFFuNoH38DiFP8nI4W5Y
         P+QsyXtS8DLBFP0D0Bnn62SDwM3SXBDwZw8C4GXfBnvVZYkIuh/Ml2A0hm+Qm20Tezjk
         D5duyxJuguoORFKpm8NZP/Pxi2MSPIrJQN7iIvtbDnL1UYZsMt0jEZrNERaScGEG8kru
         Ihbg==
X-Forwarded-Encrypted: i=1; AKwUvByDvrF4UCegF7PIMEz0duGy2AKiZpy9Q3SM12mSlkIG/bH5PW5gs0YTVlmc0IB/Bb/IeCEtJ8myU2ti@vger.kernel.org
X-Gm-Message-State: AFuF++lGw47GOKwDkk/cJVWRRwF50a+n8Ec7L40Eg2Bei2wRgLjo7LlP
	2gOjL0qoSYHdcLylUy5AotjAtNz3kKurk3JqCyncPotEDs7JlN2PVbakO+kpDP2gfp0=
X-Gm-Gg: AYBFou1xYbWdt3aAGZjFqI71ATWg7XSAPjmEFb3lz4Io6jVo4p3Usb5L4tdAVjFhckc
	uMp3dZyyM/7GikYNASCwZpR/LBtrz6fYNYYgO+Gevb0xEyBgwbnwFeX7iwoHqJLqGaVd1lVFKT9
	RxU5JS4HPJCzUSM0zKZ1D4LeIdpMN91KxbcoDIc77rIdLziQg5CZal6tPszBCRQC0qd7oZA21ZU
	hNWg61EZX7ZpMnwYO1v2uXVcwlLO4cKoaxiKalQbDdBARwMDotfRcvx94DLQzPFvQUzgiFWiuRW
	plOpyAlBgQv0NWB3bgRq17JKNGBJgf8xhT8B8jLaFstRAQ29c55AbwypO/XOTucDKijEiaItbK7
	Nu5U0vG2tFpPRQEIMs8mihLyf9KY6qJQeGlcJUx7QnN4Mvmq1ABnXBZFMHUlxWnhf7Xw8M+CQoK
	9Sf0ZcalXJ32wYKpYSuc7SAIgeLltdXtAg5OQxCvXUTE317ky5FrvbVGG+aF4E0/EnhIFr30d2Y
	nsAbWnNSsaivQ2PAfSYtqJszOTy9u4DImTN
X-Received: by 2002:a05:6102:32d1:b0:786:4822:308f with SMTP id ada2fe7eead31-7a2027c243amr783912137.13.1789639208217;
        Thu, 17 Sep 2026 03:00:08 -0700 (PDT)
Received: from mail-vs2-f41.google.com (mail-vs2-f41.google.com. [74.125.227.41])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9832340bd44sm2607812241.1.2026.09.17.03.00.05
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2026 03:00:05 -0700 (PDT)
Received: by mail-vs2-f41.google.com with SMTP id ada2fe7eead31-78a7003f9f5so394474137.1
        for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 03:00:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBz/oVL3bql1TfAkUmTjKbbLeqKiNH1GvS9rIRO5LclydsLOsAOitvZbO74IJO1MINTjIFgH4h6zFplB@vger.kernel.org
X-Received: by 2002:a05:6102:9d0:b0:7a1:f7d2:e826 with SMTP id
 ada2fe7eead31-7a2049c966fmr811148137.31.1789639205042; Thu, 17 Sep 2026
 03:00:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260910085430.3173166-1-cosmin-gabriel.tanislav.xa@renesas.com> <20260910085430.3173166-10-cosmin-gabriel.tanislav.xa@renesas.com>
In-Reply-To: <20260910085430.3173166-10-cosmin-gabriel.tanislav.xa@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 17 Sep 2026 11:59:54 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWcPMD9kzEUbkZofv6O6EoCz7mZ52Rp-ennBYP30v9-Yg@mail.gmail.com>
X-Gm-Features: AcwNN1XQBPUy3BHOan6ZOGxBXs0JV-45PEV0B5RSS4MUAdKXHpMlIwNQ2uEPp3k
Message-ID: <CAMuHMdWcPMD9kzEUbkZofv6O6EoCz7mZ52Rp-ennBYP30v9-Yg@mail.gmail.com>
Subject: Re: [PATCH v2 9/9] arm64: dts: renesas: r9a09g087: Wire up DMA
 support for ADC
To: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-iio@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 10 Sept 2026 at 10:56, Cosmin Tanislav
<cosmin-gabriel.tanislav.xa@renesas.com> wrote:
> RZ/N2H (R9A09G087) has three DMA controllers that can be used by
> peripherals like the ADC to offload data transfers from the CPU.
>
> Wire up the DMA channels for the ADC peripherals.
>
> Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
