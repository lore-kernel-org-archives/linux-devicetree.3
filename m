Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 632963C3457
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 13:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779456817; cv=none; b=dHCM2/IsioxqMvjZdIC/hhiNZ57WNvnJSn5+fwP0TZuDA39+wfg3oBoynrtnxnBW/d/Om4igGtYYj2jMR05IOPST7UWB+7zPlTBmTkJl00rVA42tKkGA1K3BQR+2XwLglAJ+N5A7cOBjakSypNVa4fvzQJ+FuAJMDr0m5taKot4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779456817; c=relaxed/simple;
	bh=oCVQeqNkgLC+A8DsyABQmEoKPm1VZ97E3MIdW+uHGTE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LrhLOEyT3pXyZCD8Jw+ywhFvWGV9KA4gjLB9Mmt0aJ3gAUQbMm9zoHupuEcPD70pFgnMNpvYXP+qeMzPgrPakg6R9OT7r7dRsX7AgoMJ+hJp7/lM/tck8pVeMjhT3ZYV4l/KvxqpkXH0EBQ/u6LeaG7jb/xrpJBZGo1Sf/pb/UM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-5873983d19eso535285e0c.2
        for <devicetree@vger.kernel.org>; Fri, 22 May 2026 06:33:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779456815; x=1780061615;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zq0bJbefph0AAGvXGgXMgxADCBjnqDWg/GTQ4ba21xY=;
        b=pml4brKMo89p/pRjb66K7ELD/UKS9jYQEBaJtmNMb1zR7A12TcxsuMSUWX/xNCnzC+
         ykFtZVgltQ1JzcwMGBQQRHl9CFLpT1vB5qgg3jSVJvpAMXswTwWp3S/Wv3HtlKX4Z9H3
         qX6FXtwn6glTF25L6qaQf4ecF14xxAxK3u8vohSJ51DlRZ0wrVnBlHsiJdwjjAcs9Xmb
         TQaNHlqltV/+EsFDMWzPkgH5cQAkv3pCVJoQiSmb0h4tKLId7pf656crOsjL+87p3K+R
         3gMMItkXg+fgE9L7luWtZl/GqmIvsUDbY7iD6R9nA+QmWyq0U2NE8YnGlgt2qMGIfKjW
         9vlA==
X-Forwarded-Encrypted: i=1; AFNElJ97PZpp/q4Bk+I2VVV+aWrxmj8owGLT7rUsDDEHKXaTwiWbASaaXkEMBXdfyH4E3AWxrMdD2u/B4uq4@vger.kernel.org
X-Gm-Message-State: AOJu0YzD9bazuazU7wPqofloh4paTd2SEo6Di3BuUC0YmFALQGDrFCBe
	t+MnUjy0VNRMCoZpViBtJZm1OyPfGMEfM7wEUxiHU+01d/Uvzsu816Zk5TsZhAjlXzU=
X-Gm-Gg: Acq92OEFkGI7eyHKOhO14mqaosfMw6xeIiPHiP/kh4+/McrXRv4RKkju4A7uUGE7CdT
	LSBeXrEp7Frn2y4r0cwGaQurirAyHMEfzbFqHIwfnaIN/JU0MRki/MZGLCPBTE88JRpEVBmDYRI
	o8kmko2mKXB2U+/7mE5oO1Oia9lT2AklZ2V4mo4B5Fg0lVxX8U2s38TG9CwUPlUu0M4h29QxmjC
	D5OjYCrc5aY2Io7ThC+Iq6Ugnsg6sHvfKQJrT7WaaK9kS1cHIzw/VsYsKNO8dMqVA+h8+SIGt4o
	NDwSBRgVwl3A5Rbo2cjlN/Pi3STCM8251JeOh6FTLcOLfUtVY4TpBudKIK7/83UBhi74xROmgwc
	GHpoXroVsIpsmkMEdNS0YJP1NziTheuyU59NVPAA2Uyx0ZPSPqMxJNc2vZcEPFT89YWHSd5jEBz
	bQS4srYU5C9lT5G+ZHbjQ46CEJSdont16cSdvQKPNWa50REPtpHS+oqCgPe2mql8k9wVHCr3U=
X-Received: by 2002:a05:6122:2093:b0:56b:7d4d:4d11 with SMTP id 71dfb90a1353d-5865e69bf10mr2002660e0c.1.1779456815299;
        Fri, 22 May 2026 06:33:35 -0700 (PDT)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com. [209.85.222.47])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-586f23eea07sm2148537e0c.4.2026.05.22.06.33.34
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 06:33:34 -0700 (PDT)
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-961780b0b98so371845241.0
        for <devicetree@vger.kernel.org>; Fri, 22 May 2026 06:33:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/dXxw14M5szlw3WhpMoOiEj2QIqCah8QnMdOVOWxEbcQQDQBK/brU7yPdqwwEMbLA0QEg64iKWCCsB@vger.kernel.org
X-Received: by 2002:a05:6122:6608:b0:56c:d5cd:1e7c with SMTP id
 71dfb90a1353d-5865fbfd0f5mr1949935e0c.5.1779456813889; Fri, 22 May 2026
 06:33:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260504225704.115125-1-marek.vasut+renesas@mailbox.org> <20260504225704.115125-3-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260504225704.115125-3-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 22 May 2026 15:33:22 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVRE0Usf++vY2X=p6Wo8Kin8jdF9=2Wu2ctJyPe3QtoYg@mail.gmail.com>
X-Gm-Features: AVHnY4JZvFlBRVi5_begA8jgTeOsJbMlX8gu1et_uqRuljs-iJ43iZMHA347xug
Message-ID: <CAMuHMdVRE0Usf++vY2X=p6Wo8Kin8jdF9=2Wu2ctJyPe3QtoYg@mail.gmail.com>
Subject: Re: [PATCH 3/5] arm64: dts: renesas: hihope: Rename clk-multiplier to clock-controller
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 5 May 2026 at 00:57, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Use standard clock-controller node name for the CS2000-CP.
> No functional change.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
