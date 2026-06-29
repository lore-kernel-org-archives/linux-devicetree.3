Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96DB440BCA7
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 13:23:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782739417; cv=none; b=pw6FTHZ3PK2WUpO9BHO46vazbzaYIjJzSyK5ol/LkY+4y5LJVwMSyFfBSM+u8E1oRu/pQrvjVoCAzdrPNT7ueu83XPyqshC5s4M+uaiqwNA0QeAui0F9qY17dJjb+YuvZzmBlIisq+5hJRU/OfGp3MQbqjxUefVUl67lfZz8CIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782739417; c=relaxed/simple;
	bh=DdwggJ4E9iDAHbD2Qln8KIIUHdg1hwqV6Nb3MWUD7P4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rtYBQggMPJloEk4yP72/9ZHuL1IgChiUcxqY+ApHGGdXvwTarsVez4PJj0t6ZV/rfhKdGEjxfoAkz2WQOktaxMcEM+dFzd4DbBVr5W3VYkWc/aYpSelTQ4G+hRXPxof0oOAxwyMeRBqlNbF69ajSUCtZf73gY23aQbsU/Xo+GjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-966d70b9e1cso1509066241.2
        for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 06:23:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782739414; x=1783344214;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bKY7ojYsyJyKr7XY9/LqXdE3DsIviA4GUBjQBda1xac=;
        b=ktWNtqGoiqyGPrQMm80U50URa+/utPtsCy3QFqIzs2EWudfg1Rj5tAJ68PqpIi+Yl8
         +ONmtJt5do4UKY1EY0wcP6hBRe45M/sbAUpcvB5a2XC4RRBhdJQ7dwEZLw6DH6kSQn68
         zp6RolKhkayzloVePtVHPnPKx1N4/95EK6PLPzj24qG2hepNro6awUpgkQ5DsP3FV8F6
         myi6CQAptCwTrXmGXVJGjtACPb5RdBK1WCreopzw5RTdOaC9Tufa68RJx0F6KRtSGAcO
         t5441w2vPlMxgv5zQPlCeoS+d9ve99mzPq33d5yjG/01ey4beCCvV+V0kMC0QHl+Just
         UmIg==
X-Forwarded-Encrypted: i=1; AHgh+RoJsGeO4C4urt/UOHu+eCKk5dD1mDFobQ9hFBDzGBWG57PYPtJvf8V2FKLqtox+RnZYPhsHZk4Jttkv@vger.kernel.org
X-Gm-Message-State: AOJu0YzomU2Vau1tjnhA1SZ1VpoJXIKOEr9XU9sy4OEA7esiFQtcC9NE
	louAkeWd2BZesvJ6k6VMxVWJfUw4biFgaaDHHlEbMuNBa3Vljc7y/Jq/Ifu8bfGL
X-Gm-Gg: AfdE7clRX24R3UvjbWxqj6A1s2i1wYOHMWxnvRFuLcGzG8nwBG2S1Ps79/eP9Y2zcJK
	Abnf271lQ0ZPGMhGYSkXmOK3UnQApCphl1/ca0xgtO4066LAKUQlDL4vkL0164pSE07SXkHYGwk
	wyvafAaToSZ7i5SzkfdML+NOR1Il2EuqyQNF3RFhlTbUCaMJjTumZuPif3dEjRIk5tCO/m7dNMH
	SpREFuTFqiRbszAI2EnFnOv9t45x9C8WfyC142aMbPaV267L4d0A84jzD8QYOdxcfEYJh0Ot8Qk
	bsoOMOCmEM8ZAuBzTCLUiqemIvz07TjgQCYbW8ojbWcB9jbNMeiKB7EfpADYJGn6ohnpuYGOCQG
	dOb/UhBQZJSq6OLT0AfXqOYkKkkmPp4f43hfVHEe0D8GSW+Y9GIyE6IBUvI2lYcUEAFxSPGTzo1
	IKye9u19F2qJh/j3tMOfgwf76qqDkRVVXTMG1N0JalwFd/aGQgJQ==
X-Received: by 2002:a05:6102:548b:b0:739:15ef:cdfb with SMTP id ada2fe7eead31-73915ff17dfmr1200441137.5.1782739414506;
        Mon, 29 Jun 2026 06:23:34 -0700 (PDT)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com. [209.85.222.53])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-96916eb7b9fsm5120374241.7.2026.06.29.06.23.33
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 06:23:33 -0700 (PDT)
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-9670c11410cso1447948241.1
        for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 06:23:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrqzvEYEpqG5uTtRBmkvwbQMx7DvtqtQ9ZkwMcThZVylOP3DYx+BW+Y+x/bjxXzqyquXX2MI5y7yrfV@vger.kernel.org
X-Received: by 2002:a05:6102:440d:b0:729:cc7c:7de2 with SMTP id
 ada2fe7eead31-7343464d061mr8150103137.10.1782739413627; Mon, 29 Jun 2026
 06:23:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260626180326.9593-1-wsa+renesas@sang-engineering.com> <20260626180326.9593-4-wsa+renesas@sang-engineering.com>
In-Reply-To: <20260626180326.9593-4-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 29 Jun 2026 15:23:21 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUnerjPTvZvL2QmaFn3xaWA19SbLtoh6ek4Am_-nUVwmw@mail.gmail.com>
X-Gm-Features: AVVi8CfgvqcZ_IqMp2pmvREWQ09z7g6L3xLrH_AO5yEh0leI4fJK7FP82g6k3hM
Message-ID: <CAMuHMdUnerjPTvZvL2QmaFn3xaWA19SbLtoh6ek4Am_-nUVwmw@mail.gmail.com>
Subject: Re: [PATCH v4 3/4] ARM: dts: renesas: r9a06g032: Describe SPI controllers
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Herve Codina <herve.codina@bootlin.com>, 
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 26 Jun 2026 at 20:03, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Add nodes for the 6 SPI controllers of the Renesas RZ/N1D SoC. The first
> 4 can only be controllers, the latter 2 can only be targets. DMA nodes
> are not added yet because DMA needs some extra code in the drivers and
> cannot be tested yet. Basic FIFO mode works reliably, though.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Tested-by: Herve Codina <herve.codina@bootlin.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.3.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
