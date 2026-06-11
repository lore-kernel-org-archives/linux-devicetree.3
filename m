Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEB1736F907
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 07:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781164562; cv=none; b=Sp21c3weAzF2A7jx97UpcxoadjI3aAKed7EsQuZk/mt31SEgLz/CwUxnNJ2KcT7vxJYvfnBvtc0NbNjvbT/Ymkq4TkojllTPpR6S89ILjgf5Fo+WgtbBSIogjNm3Rm8p51fY+D6XXPfuIto9s41nh9UerVuxkHpAvE1y/MaMtBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781164562; c=relaxed/simple;
	bh=N3TVIW3IoPJ5aqKXJxvhtdjPvgHzwg4Wp2iCFFQhCL4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QyAz47GEk0haA6bL0jjbtAFdHkfuBOmpIdaNhWcC9B38yCg+xw00wow848fAlR3+pCoxOEC1E/yu4374nJQl5QIwfD2JbMZdb1169iJ0RBYdcIQW2UBrlwqVzJVHENC1+vt2mPE0olBd4KpCqUfYx1fgIei3ueqHPYxkG//BBV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-59f967189e7so2306817e0c.0
        for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 00:56:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781164561; x=1781769361;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0QWA/oASaoEGszjXXYseH4EEvJ11J7t3dPdy+riQNNw=;
        b=G5ucg8uvcRaTNbmtu+HeVWnpq0F0Jwh4qBqowEOgkD/EPJUG0Vr/9Q1kSe8FkKgEGX
         VCXs11rzcn5vh807Ii6XStQhJUo0PDkuobicr3s+oAcTweqcjzmHQZE8n4V5Q38OE0EL
         IbjDMa+nCHE9Xe5TEf47nAEgzQcMEKk3z0c9kv6E1bD58T5X5GLQVVkOk00nW9t3oXLV
         gMcLa38x+UJfKy9qFTTfenqJRJuue6UFfJFyby7TC/rwI7ubIfHds3mp4uet35E4dF4N
         S9pPQ3tScKExdk+yqUfQt1J6lfXekPoORx46a2YH1mjeLzIOxrx8lwzoFhifcCd48Z4S
         ohgA==
X-Forwarded-Encrypted: i=1; AFNElJ/W9unXETFAVefFW/9Yl8GGi8L4RYg5oBHG7mD3kfrboL5JksSJWSxQQMHVnekOH2PzbnBWC8LuxtMS@vger.kernel.org
X-Gm-Message-State: AOJu0YyMPxMdIcVrXs3k5+yCKt5v+Bqp11N3D5ThMjoKDeLaTYa3VkFO
	u4RDyyIT3a2IDCQTfdZ3H0m7+CvgOJ27PrexpiRfnmS+iqO1QcQBblZEWu2YJVCnJ8I=
X-Gm-Gg: Acq92OFV3tLQhyDPC53q/TNMnJrRQRDH9S/ec0zGdxkyTL/P6fpN/kVb63wy5z5ZNBI
	jmC8F0C4m1ysP8tabbKrEzR7rxC1GIle+qs0u811vj5y6gKaf+OAl55y8TD2iDojMNKKZ/VkRUp
	nxPyIR27eQ0JiQirwX3Nm14Tqoq7HYSwuCMqavds7kTBUKTdYgzhViftr+qATCPqCGPYAOXSzfI
	zM9DewJ1jCpZrcSdujHbC+fHdBIMRrmxTpoO0ayasmVwijYixfKV3iF7qiZvI4gwdxUNfWNzjjv
	d+qgmBz69tQzdKsx9ykTT3kS/q7z2apmfv6zmN6yeT5m4v0S4MyajWp6sVhVpeFxJ18nNlycq4m
	9t2TFow/cYSE/gnTicftBp4fQoOiEI4MJRdxchT4q+Ut7ET8TowIQY3Vt10yC1Vi0ASPJ55Dzuc
	HXVfn/S3QU8Vfazmh4vnjGTCPA/iHtyYDDR7EXAJ82T+2uZWfTCWuUT3tw9K5BUoqCP4WE7yozp
	b8Zz2bxYw==
X-Received: by 2002:a05:6122:130c:b0:5a0:9ad4:7016 with SMTP id 71dfb90a1353d-5bb01178b5cmr443198e0c.10.1781164560639;
        Thu, 11 Jun 2026 00:56:00 -0700 (PDT)
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com. [209.85.217.54])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5bb0c92b06bsm722477e0c.9.2026.06.11.00.55.58
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jun 2026 00:55:59 -0700 (PDT)
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-6efdb57db0cso2390039137.2
        for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 00:55:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9uFor1U2RTpN9sbuxq8CqMhqvgI/j+okv+fWwZEEZHKdRjJdneZ03P7pPDQPVYp7sRlziS0UPrFfXa@vger.kernel.org
X-Received: by 2002:a05:6102:3e02:b0:6d3:aad5:6d2d with SMTP id
 ada2fe7eead31-71d5f2c9e58mr483488137.18.1781164558613; Thu, 11 Jun 2026
 00:55:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260611005952.146825-1-marek.vasut+renesas@mailbox.org> <20260611005952.146825-3-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260611005952.146825-3-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 11 Jun 2026 09:55:47 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXZASW=5v55QqsSjt0y_0Cf-3H4xuVYcQO96spfvQevug@mail.gmail.com>
X-Gm-Features: AVVi8Cc4jIWBETm4Ynpi7szi6_VsDVkjFdXWa9mml-KaDUYCZmOXsqOLYp1ugKQ
Message-ID: <CAMuHMdXZASW=5v55QqsSjt0y_0Cf-3H4xuVYcQO96spfvQevug@mail.gmail.com>
Subject: Re: [PATCH 3/3] arm64: dts: renesas: r8a77965-ulcb: Enable GPU support
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	David Airlie <airlied@gmail.com>, Frank Binns <frank.binns@imgtec.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Magnus Damm <magnus.damm@gmail.com>, Matt Coster <matt.coster@imgtec.com>, 
	Maxime Ripard <mripard@kernel.org>, =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
	Rob Herring <robh@kernel.org>, Simona Vetter <simona@ffwll.ch>, 
	Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 11 Jun 2026 at 03:00, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Enable GPU on M3NULCB with R-Car M3-N.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.3.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
