Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DE8239A7FE
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 15:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774454385; cv=none; b=qKyF/bNhzJzzMGHvPFk8B4jva2JbT/DjeBlxYOpXgnm9aqaJKyfwxEnO7KGSUDBowZ9MgQ78gs+cEFB09rBaXnh1vUfS0ssLJbzl4YyGOstfAXyWdXvwfCIXvvhg7L4AKXU+ooN8ITdcEfEoDthBCUvPyHgI3eaYvqGvY/N10xQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774454385; c=relaxed/simple;
	bh=4RYRYnx/N+uB3nG/PmCpdDFzhigjOZcdXVf1qTaHjTU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sq2fHMw7t2QZx25Hc7tiK3sZzLGEdFmI0xkdTzdVGNqp3Zt2j0J7Xp0bQYI12s7UzveWMtyIJ2yn7ObBbgvZ12dKVnjlzofb6srzWdTDiaRQyKr9Hia4I65bB6s0tUtBe1OA2f53+xFjL7oZdKXC+TjPBcyeaq2AEqL765xjFdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-94ace5d0e39so2000667241.2
        for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 08:59:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774454382; x=1775059182;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DTYn6c2oWhs1HU9mLDTjqKGDTTeJkf0Hf24+Mstq7Ik=;
        b=F32lyilSS9UJaDYbRG73yFKdjCIl059pbkk3q5X0r2be5KZyX1eGirjgMUr/DPYDTb
         lfExeihRA2HHbR/1DAXsHKkmRNtrVuFSXxmrOW1ezYBxY7oNkANjiZvoclqXx1rSgDIN
         hz98bcEdB6NUeC4E2HfjDADz9XGPyr6pq44E97YhL4WXDc0/Yt/GcsxAXO01U2cNnDme
         Mv8YV5LoEReCwyZw2MWCD4Hx8nva+mDHrEfrssPkUXyV7HMtvgwFcYwcuh7yJc/QeIyb
         PiMq5u6wMuChHc++jeGh4RU/oUGv4VbcS/sGwuA9cHOwfeC72Sj8kBMb/Z7yEBdnIEKa
         dRVw==
X-Forwarded-Encrypted: i=1; AJvYcCXnIujuLWw8N8Diyt2k3K8Vti+6rmZGR/9r2ODA+UBgiSCizSxp2inxg+0DAsvCgTQLk6k7Im5WzS4S@vger.kernel.org
X-Gm-Message-State: AOJu0YypaUM8kylcLdK1kD00JyCcoCGVUkX2fJxUqRW+6dLEcVUzbqNT
	CffRwZYaGnCWmZvEFmIvM1+DO7/STGINnBNB/Km8ni0REO8YpoOHgw1CnR9w48YlQ7g=
X-Gm-Gg: ATEYQzxmFqCG5O/xTQTitbXnlLy8vCaP8yzh41qUZDWu7wtCZ5oBBJPNlZm3yhviRtC
	kXXWSvRkloH58Va8eMr6uX6KYdDIidmLfIuImURQH3ayfs8tF/PX025QBw+mLIbh/08hEHXWabB
	9mIx0S+HKsfkJaGH91oiedizTTem3PiVymJ7ROySJClOlNtiG5N0QoBnCw3I2H8/JMqzAe9MEQN
	1mBq5TYic0Lbnvm0sZ9c/5tqhABvsWOsIECnXeaZqyUk1wY7J5GkFT97HcGG6rQUP5I+U/0WDbe
	kovCd0z894U58IgFWHom3FpNiU+1B44L562vqpO0x8KLlJZgYsMikki6RkL026It4yz+xxf5Txw
	Mlf3Np/Zf/4/HZlP4McaNsaE7hchnR42zvYhBQ6C7hlbuEF0Ew8EDau10IWzjjj6z45ocdkz0hY
	Esv8TY0Pn/udxughM43NjcouuDAJkPihrXIr1j3slSgDUTnbs7W7L4OYkc7P/U
X-Received: by 2002:a05:6102:4424:b0:602:9b21:eee7 with SMTP id ada2fe7eead31-60394825aebmr1940775137.35.1774454382191;
        Wed, 25 Mar 2026 08:59:42 -0700 (PDT)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com. [209.85.222.49])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-604d53a7b8bsm46005137.12.2026.03.25.08.59.41
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 08:59:41 -0700 (PDT)
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-950b77942deso1824310241.1
        for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 08:59:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXHywFQ57HweHDnTW/yMoMDBy0kXIj5T78fOZ1pONAQsbgXiZ5b7lFzj00HOWee+EI5PDiVFCjdf1UX@vger.kernel.org
X-Received: by 2002:a05:6102:83cb:b0:5ff:be25:8936 with SMTP id
 ada2fe7eead31-6037901966dmr1857866137.5.1774454381452; Wed, 25 Mar 2026
 08:59:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260318085119.44717-1-john.madieu.xa@bp.renesas.com> <20260318085119.44717-3-john.madieu.xa@bp.renesas.com>
In-Reply-To: <20260318085119.44717-3-john.madieu.xa@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 25 Mar 2026 16:59:29 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXXwtniV=_gywHfDCBQ_+660aV4+K2SXbfM3c9guNrbng@mail.gmail.com>
X-Gm-Features: AQROBzASFVBtfoGlkigJX5s9euj0nyf-Dtn2deDVkxMdGhdHzx7S7UnqewbVbV0
Message-ID: <CAMuHMdXXwtniV=_gywHfDCBQ_+660aV4+K2SXbfM3c9guNrbng@mail.gmail.com>
Subject: Re: [PATCH v9 2/4] arm64: dts: renesas: r9a09g047: Add PCIe node
To: John Madieu <john.madieu.xa@bp.renesas.com>
Cc: claudiu.beznea.uj@bp.renesas.com, lpieralisi@kernel.org, 
	kwilczynski@kernel.org, mani@kernel.org, krzk+dt@kernel.org, robh@kernel.org, 
	bhelgaas@google.com, conor+dt@kernel.org, magnus.damm@gmail.com, 
	biju.das.jz@bp.renesas.com, linux-pci@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org, john.madieu@gmail.com
Content-Type: text/plain; charset="UTF-8"

On Wed, 18 Mar 2026 at 09:51, John Madieu <john.madieu.xa@bp.renesas.com> wrote:
> The RZ/G3E SoC family features an x2 PCIe IP. Add the PCIe node.
>
> Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.1.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
