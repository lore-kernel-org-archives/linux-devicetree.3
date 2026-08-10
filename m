Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A5083064B5
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 14:37:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786372667; cv=none; b=gdKXjKa57OUIm1GCbBCGIg1WT6MJm/9l/5tq9Y8LuBG6u6LE6RbVpYtAUcZh54GWofDyyJNo8P9+GWR2iZSyt1DRRDJ0qKnmrptRWYlSp9wDCssFT21ojA6q7ljcpTxJwZdeM9i5mT/Kvxgc9eFJrATGnVeGZUXI6wEqDXVhj3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786372667; c=relaxed/simple;
	bh=uB/V/Xhwg31kLJGNDAMpcVbvCMFk1PoC6Tb+YOPqJRs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GdqnL5khMY9mjltqMxbVbIPG15lci5Jgo19KP5ONUoM0rc1/PVE9Lqqhdx7dXvIZRtU8eLlbRMWNYwVt2xknOq9kwBSxRfmgjIK07qddrOfXGKhVC8CMlD31j1N/9dCkLltFAn7k6VszD9rhpo/KB9OEGHLEFf+6rUwUDjGKsik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-7542a2ee156so950354137.0
        for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 07:37:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786372665; x=1786977465;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kzNCXQCO04CqdRN4JU2RpTNoOwr4IYw/G6qWE0jJmAY=;
        b=Viw4nNyurGwMyQTbhjrWyvMa6FyNvQs9uNOHBxvFFXaDHdCy/fcCJEv+0a0rFYX+LL
         R0Jmt5dw1Hb6TUZ5+YGbY9b95lxflsAjZvGWWSrqJOdNC4hJ2VRrfXnQRSWML8JiG+Lo
         VcFEAfBRhcLvYnpzZ0FxbIwvCw49X/lzhPtwHkcgDcZYDjVIBCAkcx8qmngkz88MF6jC
         LvVOIoeBlW8LoJZXvkJYejZr1Tie5VsaMg09lf5tl/gILcD1GrOvGQB3rCpWVNAQ6PyE
         Vf5XDFd88LZGD8KEtvuFpncfXIdJdHd1B2EyZr040exSVczW4Vp6SdMoJ7LWya6KParR
         /u4Q==
X-Forwarded-Encrypted: i=1; AHgh+RobxHoI6hWNJAtuofNVKa9cmcDH+YCZNe2w6unBnK1S1licZ/SvP/pS7gOBSMXUfvSh+HugEgkDquHy@vger.kernel.org
X-Gm-Message-State: AOJu0YwsGknx62iSZMD8LydPA9r1dqnUHnTAbV2ip0/0gZXbYAv9Db6A
	GzqrEXFCxelA82YEh0LpeFU07Uzu+ma5VDkaGTxIAM8HXe2tEA+1uxCoGTlOOb8p
X-Gm-Gg: AR+sD12fv7FqAByGuVH9+tCtwUcOtZ3JteRnnPhWnnOuoF8v439iWZdg/4CNa4vB6vO
	y473edIrZtrmeUc6NsK38WSMvsOu647s3WAnZSfO4T3dMLh5TmFGNq+cHpV4YfpoiPrFj2euUI+
	Oy8j7/8cwu8pOOoHNxwYT/lkWC4ee1yHElgeq7EMy3I6bYP2sHPWgaCQILf5tQ50gTJJl6Pfw3o
	sUR22otSWpYtCpYdAoM2n+0U5Vg1j90BF/WW2eXUytkCT82Y9f6o0v/8V6i0Wzg7XLDXKmiFOtm
	m52FA/DZSILr48O5yjtuQAHxSeaK2eRV1uwow7brIkIFAaLsP72EmVryaKKuYlZ5vxhrO69nawy
	R7r1icYtBlfP34RlVnTeyqwz5VzLd50shTo6ryjoI4rGkpQeEndWDdQ6f8yB+UjL+Wgx3r7x/2I
	CC9BsI6OiTSOX2YKeZRarm5RFPrwjmNJMjxJZP1pRXd0BxSnv3Z4WfF3lAo6FB43/krvV0vdyBe
	0jg10ZbVORjhM1uzI5aS1BV3Q==
X-Received: by 2002:a05:6102:942:b0:738:9d06:2a1e with SMTP id ada2fe7eead31-760e8314aaemr12617394137.8.1786372665166;
        Mon, 10 Aug 2026 07:37:45 -0700 (PDT)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com. [209.85.217.42])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-979ffbdd8besm2795159241.2.2026.08.10.07.37.44
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Aug 2026 07:37:44 -0700 (PDT)
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-74ab99038afso1261076137.3
        for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 07:37:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rr9YtKM7PupMxrBhdarebzNbZgAsuZUkdWQTW67VmFURtLxykMX7qV6wf3MxUx+j2ucz3iEHryLUZrA@vger.kernel.org
X-Received: by 2002:a05:6102:5045:b0:74d:ce64:efa9 with SMTP id
 ada2fe7eead31-760e9951613mr12721738137.12.1786372664138; Mon, 10 Aug 2026
 07:37:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260714130429.11214-1-marek.vasut+renesas@mailbox.org> <20260714130429.11214-5-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260714130429.11214-5-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 10 Aug 2026 16:37:31 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV8xxRd9dXL81KkbZ1EDFsoEe=scSVHFQF_vRWW7VtjjA@mail.gmail.com>
X-Gm-Features: AUfX_mxs1_ZDykWyS01_th2qlC8zb09CRRUvphOnXvBwUpf5EaZWE70oCbGmkLc
Message-ID: <CAMuHMdV8xxRd9dXL81KkbZ1EDFsoEe=scSVHFQF_vRWW7VtjjA@mail.gmail.com>
Subject: Re: [PATCH 5/9] arm: dts: renesas: gose: Specify ethernet PHY reset timings
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
