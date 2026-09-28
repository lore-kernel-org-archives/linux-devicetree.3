Received: from mail-vs2-f39.google.com (mail-vs2-f39.google.com [74.125.227.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DEDB48F82D
	for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 09:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.39
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790586682; cv=none; b=tg4sh+6snwpZ21/VxUjOuU3piho3yGQbf/tBrCErfqRkz+UIm3SawOGj9DouxDOUzXZJQ1uxGCFAitWQdaGfLueH8JejXuCYCstEzkzboB5obqURnIGyXe/1/MpHwkpv44+dINnIYfDWwKUSgrYUUQmtJ8UXURIFqj1blevpdcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790586682; c=relaxed/simple;
	bh=3EkAw3KoUJ5vJqs5XLdwk3rugWwLtztqYVKLvXds3TE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e5yicW66i3XDkoaae9ZRgJFyqbHCL1+y5m1Wef3myqTnXKUA5pSEJM7xzltSaK9AdmVcjehXLHkrthBKxVoRXkWSzykEm5XgnHIPGuYdQnEMv+6Xc36RzgLz7E0MfiCZcBTj7phJ1Ik76u5WjuiioZ6ucNqF4bwIEHiE8xP7yXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f39.google.com with SMTP id 71dfb90a1353d-5ccb36d5a57so1429225e0c.3
        for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 02:11:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790586680; x=1791191480;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=YQdf/IVZCveOBsVWDfZ7xYtojPo7NY7S5FZDi+enVh4=;
        b=Lz+4q0XubEEd+wPUY78irZiaoOdg9jNyU9RO1Ejim7DJXs2pwoai3YfnlP851Th8Zn
         jd/DoZ6NhyZLDxY8MIrs6Dh8ae5VgHSKetoe9J5n6xREOf0nzNudCGdtIyR9E+xSAC6j
         L7+sindVY82ABNwkBmzfvmvyANLrJ00BLjQw2+9AYBB5x8PkYxnE9N/m3MYfe8kbBc6f
         oZwQS2WLVieHg2pB2wfpHjLL8O70tf/4zyyru5Ry2ZFrrIQY56r9mx9W5N89cm4Mx6Gf
         d/MgnAJU7GTZ9fD4OmJErTmDZBh1rMT/1Tm2tSHLKuczSuC1tQdnzBb/OBXGL0gUaYaY
         82qA==
X-Forwarded-Encrypted: i=1; AKwUvBx+43EE3NCkmi449fDvUUnxeSZEt0MlCEnMWhViEEPl54RZ4rUBDMw5dazSE0YRlqBeVoQMgJcS/Dou@vger.kernel.org
X-Gm-Message-State: AFq9FYJfWxK/XYbwnR013u0gpSVpVkJcHWuVAOMpry/PEcK5dWPng0yp
	NG1C8T0IRC5lh3zbGofKnYoNJOEaaTk+oDE8QCkpDAfa39LGvEH+SF5bMEB+uDRO
X-Gm-Gg: AYBFou1i6iS/TIzpsP7QeOJIm84Pawfk5Id3KCgsDPlIvgXtYr48hwgtqZIvT8gfpcr
	NNnP/oRl9HS8R5M5ywwsoFNkZw+H8F3LuBEvb8BpFzwoaKODiZLzRHp+L5hyta8kxi1fOyCG/Uy
	WXMffQ9v0AWLtn8GwEHae9cDynU6qoHJyomUZwglC5x/95p89rJnr99G4hv6PHo5Yl+J2P2yrS6
	xHZIFb34Z9G4WOzEa4OncQdjVzztWzKpiz0Eu96FgvfuUCQawoV8hBx9EP+SfpM/NQkvKGab89h
	qh/dqq8o4PmXbglW9w0cvqfriDEF6Y11bsV30pO/256G9T2rUJEWruEjpK9ZEadc3nZ+CA2rSwD
	U4N5nXCjpxVntk4tcn1fAiAlrv7AwD4XKg5Y46FywoKPk3gx0TGwp5GZpvDRluhCsn5EBLGVVhS
	XBUYRPBEsMEY4f0i9G46sV2cEK3zGmAc2vU72on+rq/K63wNGw82yiuCco/nVGljBwhdl/nujzy
	dPq2gDDbaPEkzIgMl6jOne2FvHZnAYQhYOk
X-Received: by 2002:a05:6102:5707:b0:79d:f468:9d05 with SMTP id ada2fe7eead31-7af1c79f87amr4069641137.7.1790586679919;
        Mon, 28 Sep 2026 02:11:19 -0700 (PDT)
Received: from mail-vs2-f39.google.com (mail-vs2-f39.google.com. [74.125.227.39])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7b398ee9869sm8762192137.1.2026.09.28.02.11.19
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 02:11:19 -0700 (PDT)
Received: by mail-vs2-f39.google.com with SMTP id ada2fe7eead31-7b2c87a0311so568749137.1
        for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 02:11:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBx3S2QXlIN23tY9BlRmsL5BGK53JAR4NuxMPeynTyxTyssWbbp5kusy+wjmH13OaiASA2t25h34SH2l@vger.kernel.org
X-Received: by 2002:a05:6102:a47:b0:7a5:4fe2:b380 with SMTP id
 ada2fe7eead31-7af1eff6903mr3975673137.26.1790586679062; Mon, 28 Sep 2026
 02:11:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260927151133.45845-3-wsa+renesas@sang-engineering.com>
In-Reply-To: <20260927151133.45845-3-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 28 Sep 2026 11:11:08 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWJ6r4=hwm6KxayTsYTJ4c+O_Bf0mazi-RYN2P3AxWuLA@mail.gmail.com>
X-Gm-Features: AclHuK9waXidYdoACalWAOWf4K7OhYl7ppYO1Lo215_OVK_ZMODfGAsk8xBNjaw
Message-ID: <CAMuHMdWJ6r4=hwm6KxayTsYTJ4c+O_Bf0mazi-RYN2P3AxWuLA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: r8a78000: Add I2C nodes
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 27 Sept 2026 at 17:12, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Add device nodes for the I2C controllers of the Renesas R-Car X5H
> (R8A78000) SoC.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
