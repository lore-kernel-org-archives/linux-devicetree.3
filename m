Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56EF74DF4B3
	for <devicetree@vger.kernel.org>; Thu,  3 Sep 2026 15:34:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788449642; cv=none; b=Mhl0DWgP/NSg0jr9dMX6H1VGLvwmJmyEzN6RWV4PnXsqHsP/WGwqslf45XOi0F7p41kHvhl1h5pkh8e+e5rmVt2HBqh3VO4HUzcv42ODks2wACahIuOCKzY6KKKAXcEE2ieubbqT5GklCBGwgwviIrogFBUytLKxzlIJa26Dssg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788449642; c=relaxed/simple;
	bh=4ISs0p4OZ8p6JtAb2NqQCn3Ms3bwI1uZBinFoY6Hif8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iQeU9V/mqLBkvp23EifABvpo9oWbSpKeCk8jKX4cBddUGbaEl9ri6erDOSNmukMTMkbJqd9a9XPXto9GcY7AKrUNssfxQgHyGyj5Fi5oPciePJ8fa4vk+w0brhPsrLFTtNlRhv4fOAgy93bOdshR3O7SET7LzA64lV4x+kb0fkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-5c675e64ffcso1098006e0c.0
        for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 08:34:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788449640; x=1789054440;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Q4co215V8cCcryKl+ePptL3AZAP9ssa33MB98SUpHXE=;
        b=Mqmlfe746AfzGHnlK+ySOxRBhkD/7OsbXwVWpz/0ljdWBq9dpXPmdhz4cga39nL5a5
         +JRDFTy1gfLldgb7rpNoeC5vARu0V4G4IrIpJ7HXLsFRFRXX9ZRgGuZJG/t1oE6/e67o
         PXhxlzqIzH2P6LF+RIUYGdjtvp8bhltXcnqgCL2Zr7dg7aLRexGTXSmic1zL+4BE13I1
         yrDSfw1vB4PHscUP3TkRw9VQAqCTOrN4ajOMAhNKU1YD1HMjCE6JMuEA8fGriyjWinQ/
         xsFGfu5hoB1yCUlPeHUPtP9Bou+SU5MLagS+9wj9V/pdsrXqZonKjXoa0pdZHWTBjcvd
         nu9w==
X-Forwarded-Encrypted: i=1; AKwUvByd4SP6P/x6UYdnyQ/6C+haHU4QsQE90YXxrGOis8YZ8UtEYahBGgNIVT8rm/vxPtIiC3Dfw7nxyLfL@vger.kernel.org
X-Gm-Message-State: AFuF++koK3U4SvHH81glP51+I5T825vHxXGxqp2OQfda1tsM2Qp7n9ss
	hxKw6NKhaIxmzCtVd/gCMTDBCi0ovmF5D0Gi2Ki9mh6cFeUiHGEVhTvPih1xEelfjE8=
X-Gm-Gg: AYBFou23FM2qaape/ZEeZZIT6/hGMIaQOUGZraYD3pNTbxh+YeSSsE4Ux/WMryWQE0T
	gLyEwm1pnd6JT622lyvXTnfYJY5SUQoeceZwu+s2n8RbF23h7TFDMPMW1gVNeMyWKWlNwGe4Gxa
	yQkLQ/ekkcHFA9XJ7PST4hDOMxT+K4FUeb2UHVkoCd7wjfy+DKee2IICkpwz7YW4h8gXXNPlM5I
	eOMXCkFsUf/1+YOwnHWmll5aDi1wHEsoz3DDBh7uGwc+NTee3XaxaTqtNgZmeGOtvjea+2sVYpf
	OQiIDNgaPXaRhc4YuYQjS/oSjwN2ntA8sEKGPuEnKxXHipp1bpo3ftMqtZX0JNKHc8uhPG+WMeD
	DsBNs1fHCIaFMnAV5BFee6JbDPtgHtFuhgfxYL7r24cY5MssmQYNoAP2mozoQtFbz3/Og5z1X1a
	DJC9Xg8/HGWaNfsYQ1JYt97t1GoxsgyDhJ1jaS+ZbrDUtop7oIsXrzeto1Kiep2xhIexGStrsD0
	2yrnvvfx12kmZc1ifRL12nlEA==
X-Received: by 2002:a05:6122:4898:b0:5bd:b0a7:47e7 with SMTP id 71dfb90a1353d-5c7dce9ad94mr2241052e0c.3.1788449638778;
        Thu, 03 Sep 2026 08:33:58 -0700 (PDT)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com. [209.85.217.51])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c7ec1097f4sm31211e0c.1.2026.09.03.08.33.58
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 08:33:58 -0700 (PDT)
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-7894670be7dso497729137.0
        for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 08:33:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBz1lcGanpAI7XUwwu9jDFxxUW4qw+QDQQf1YdbWTQcb3Pf5MqRldRZYTwoTwQWkYN3rrODqHqsEJYEb@vger.kernel.org
X-Received: by 2002:a05:6102:8345:20b0:777:2e1b:1e2e with SMTP id
 ada2fe7eead31-78a2ed7ca4fmr1596359137.3.1788449635039; Thu, 03 Sep 2026
 08:33:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260903113327.1217457-1-claudiu.beznea+renesas@tuxon.dev> <20260903113327.1217457-6-claudiu.beznea+renesas@tuxon.dev>
In-Reply-To: <20260903113327.1217457-6-claudiu.beznea+renesas@tuxon.dev>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 3 Sep 2026 17:33:44 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWGCdFH4-+-0Cws402jvHO7YBAELUeobp1BbDpeAZguZw@mail.gmail.com>
X-Gm-Features: AcwNN1VsYZsO5o2pygHZnaCq-bQizs6Zsc1Hfv4_iBmyRo69jsaq1nCLJ4t6av0
Message-ID: <CAMuHMdWGCdFH4-+-0Cws402jvHO7YBAELUeobp1BbDpeAZguZw@mail.gmail.com>
Subject: Re: [PATCH v6 5/5] pinctrl: renesas: rzg2l: Add RZ/G3S support for
 selecting the I3C power source
To: Claudiu Beznea <claudiu.beznea+renesas@tuxon.dev>
Cc: linusw@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, magnus.damm@gmail.com, 
	prabhakar.mahadev-lad.rj@bp.renesas.com, claudiu.beznea@tuxon.dev, 
	linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 3 Sept 2026 at 13:41, Claudiu Beznea
<claudiu.beznea+renesas@tuxon.dev> wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> The Renesas RZ/G3S I3C pins can be powered at either 1.8V or 1.2V. The
> pin controller provides a register to select between these two options.
> Update the Renesas RZ/G2L pin controller driver to allow selecting the
> I3C power source on RZ/G3S SoC.
>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---
>
> Changes in v6:
> - used bit 23 to define PIN_CFG_IO_VMC_I3C
> - described the I3C power sources according to the new method; due
>   to this didn't collect the Wolfram's Tb tag.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
