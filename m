Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DCA23F88A2
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 14:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786372619; cv=none; b=Y4y4APJn+D03kbvBmH08N0izt8CMbjs0wLf/MjS7otVZaZRjySuJvdypDhMakt3yl3UBYjJRDf42KacsoyxK/ezstsCMkgI17lDbyYoyYk3F459l7HSrHXJWR1jkWRWWQN/zp7fFsKiFusuCtgEZ8+ExJUlugEZFSJ29v4TVIU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786372619; c=relaxed/simple;
	bh=uB/V/Xhwg31kLJGNDAMpcVbvCMFk1PoC6Tb+YOPqJRs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BCirmGDZu56EMDBb4xTqygate47Bsd76OnpOXg85IUnUt3Pb2gMB3vtxPcLaTqaVc5TSgcL4goQfDAo4899yVKgx35/V7M/1E0H8HXn2L7o/if9fNO+N8ucPIsP8QC9fXyc9K5/ZPBitlpkJWHZtYyYJ4BkTIcivDw2FobBcvlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-9770e900464so1557248241.0
        for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 07:36:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786372613; x=1786977413;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kzNCXQCO04CqdRN4JU2RpTNoOwr4IYw/G6qWE0jJmAY=;
        b=SnY9mXlkLRDPS2+5YMCC+SxGOER0bEl/MpZ4OGchsc6iyTujMORb/mZYf2re+X4Rzg
         MDmwuoVnPNH35hnmd81uFKev2zkNQwpTvfq7wu4gIvn6Az8j3TR2S32iUIOtV5H7W8Lw
         0ymIePcpFO/5TEdCzvBthCS9ihM5mGad2cUR3xj6AcXfjiMyVdKcKEwjTqfDU46y7xHw
         zY2mv7Rbm7DsflJ8tA0uVgdlbiAX9VIP2QJRddyc7rdXxMUWec/5Jp2TAWS31usUyKXa
         WYvBE1rS6Z1RP6Y+FUNSqlKuNqo2quOZa5G2vHbS9f+35Qf0fUJzw5O925ctkRn3sVvm
         ui3Q==
X-Forwarded-Encrypted: i=1; AHgh+RrKGzn5PbrA6zZD5r0rDnXaDE/O1NmNUjOBD4L32iU0NX2WoZjZoiDPJanQiePpub6EOFhYbjzU9BLe@vger.kernel.org
X-Gm-Message-State: AOJu0YywkjXbbnBFdQtYPvHdEDjhTr1ywlOn64S6g4KXyFKqfq9+pmjn
	JGQDib8AtCZbsC9UeZgPgyRHEdrJLKuPCPog4ozhuuuwTrmGjVWUX7GBGDTkserW
X-Gm-Gg: AR+sD12pyY1J5rkLPsxJiUUH7B08jj0DIIreBoi316bwKN9DdBOTA0QAsot3k7pAHCT
	G2kghNsJ7EXv1m0yD8LVJUlTGq8snkWzDr38XGHYzUBdIh0COXjp8AXHzgGujtlqtMJumaFyoPt
	2sR1vu+G9R93Mbj76CCCvCQo9jyrCe0myIQaEh84H+KARUjPUHfZuZ+028H6+SRtri3AqILfedE
	m02kUVy/WUfSvDIVu6aOtwqCzSR/tWbpxwZ19K4Visep6WznugXEOXC+Ll3olTaxlguiXX5oqDL
	0uP1pywXUdvW6UOc8oj/3mLu0XCvuKvBTL8MfG5VFrg8D0UvJVOUoN82b7HhlDMJw2rm7U2Wyor
	cNJVzDE+FuKxvhrtBfGHKbC9+NE6WwPCSQB2iD6NRmt0j4BcKLM2b9KbzMo5g3WNVlqFuAPsdKj
	4cLBBDUxZP5cSriiApvtdZRsoD8n3GqA68JDzjm8ehBwJ1S1ZRd+SdtxWDTGrA9WlzbAMGzCNoU
	uAm74wTVUUo7ITvV0AKtjMiwWsfAg==
X-Received: by 2002:a05:6102:3907:b0:613:3fff:febc with SMTP id ada2fe7eead31-7652028524amr2263894137.2.1786372613341;
        Mon, 10 Aug 2026 07:36:53 -0700 (PDT)
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com. [209.85.221.181])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-763fe4da46dsm4707398137.3.2026.08.10.07.36.52
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Aug 2026 07:36:52 -0700 (PDT)
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-5bfc54558d5so1689117e0c.0
        for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 07:36:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rp73RKu+niOIOUtKLFvVcA0bCKh0v9F2PNrhYKwGPp6BCLqcCNxF8Qk7tfWyPkuIlnuyh0+cSHIUOUA@vger.kernel.org
X-Received: by 2002:a05:6122:3b8c:b0:5bf:9b0b:5b27 with SMTP id
 71dfb90a1353d-5c41535b76emr2107981e0c.6.1786372612728; Mon, 10 Aug 2026
 07:36:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260714130429.11214-1-marek.vasut+renesas@mailbox.org> <20260714130429.11214-3-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260714130429.11214-3-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 10 Aug 2026 16:36:41 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVNWH5P9gb5oknZx1epwxromNv1YesG2J3yVqnqm7ZZaA@mail.gmail.com>
X-Gm-Features: AUfX_mxCJ0ZS0nGlmcMm8LzPuT-W_y3qMEElgtPtAf5z9mDwsGw7FQLMUFJtO10
Message-ID: <CAMuHMdVNWH5P9gb5oknZx1epwxromNv1YesG2J3yVqnqm7ZZaA@mail.gmail.com>
Subject: Re: [PATCH 3/9] arm: dts: renesas: koelsch: Specify ethernet PHY
 reset timings
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 14 Jul 2026 at 15:04, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> The KSZ8041RNL reference manual [1] DS00002245C page 47 TABLE 7-10:
> POWER-UP/RESET TIMING PARAMETERS does not indicate how long should
> the system wait after deassertion of the PHY reset and before start
> of communication with the PHY via MDIO. Opt for the same value as
> used for KSZ9031RNX, which is 300 us.
>
> The KSZ8041RNL reference manual [1] DS00002245C page 47 TABLE 7-10:
> POWER-UP/RESET TIMING PARAMETERS row tSR Stable supply voltages to
> reset high is at minimum 10 ms. Set the DT property reset-assert-us
> to 10ms because the KSZ8041RNL RM does not explicitly spell out how
> long the reset has to be asserted, but this at least covers the worst
> case scenario.
>
> [1] https://ww1.microchip.com/downloads/aemDocuments/documents/UNG/ProductDocuments/DataSheets/00002841D.pdf
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.4, with the URL corrected.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
