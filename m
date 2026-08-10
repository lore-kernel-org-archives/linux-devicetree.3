Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 011DE3D8131
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 14:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786372643; cv=none; b=psza91PqUPvgRIo44hALMYCZc/4OPt1Feky0+zTaA5UB4jThLPEZi3OEhQhUJt3WOTrbxH7sMjbfaMG0nc7Sc26X3LtnVp5zrYdzTE/uzBFq47zOzZ/uZK2w1pNs2cK3YvtTi57FLVxAFUiWdcoHPEpR7pJiknXDBJOKB7/Z+nA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786372643; c=relaxed/simple;
	bh=uB/V/Xhwg31kLJGNDAMpcVbvCMFk1PoC6Tb+YOPqJRs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VYGky1H51n4K/Wo8c2CqyJGhHwx6XS9DuXbSWsYg/EIMF91MVRGCxn9f0bRUBC9BuX2l2CUnyKMvEdPpvQ/POkEPhmrwEHOBjjdS5Svs0I3npEWH+dxznJSsY2bSTfQP184Wp3ipaQqflY0GBq/BX0+6akdnvdx/3jxhP0NJ54Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-59cd803792aso1093871e0c.3
        for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 07:37:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786372641; x=1786977441;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kzNCXQCO04CqdRN4JU2RpTNoOwr4IYw/G6qWE0jJmAY=;
        b=MUhVc87xL38FsAVMMnJyzUGdd23nL9jITxZgl8pUOLfosFRB0aeMkdz0mSo6TxN4JS
         4dJU4cH0TY36aOpl5YsnXvCVs7XuxgkBO4b0IEA9DOh/oDiSJtAKZaxPQJlmQerq/c0h
         mny9RP+wUS7b/QPgW/p7QTk6BuQzMfqj9vg/v5zPL8WPeQC3KXcT/6CWkNxjHJoprrcD
         yuQUvlQpqmEoA+CX+OYfB5HJ/dQ1X7hjZnPULshaqftpMuK3ur1LPAR1VDg8bMtEwNpm
         ZSp26dXbzoazBtOWwom6Qh8yYerANqigg6hYzeYe3pbZSC0cui9PidgKx3jaBsLyYA6B
         DpMw==
X-Forwarded-Encrypted: i=1; AHgh+Rp+8gBxH/ujgV58RF0dHO+Km3nQq5z/ToGLaF4hPlG1ffx55knVImRM2VPU0yojXWwoS7uTlm0PJp2b@vger.kernel.org
X-Gm-Message-State: AOJu0Ywm/NbK31q0rePM/ncrOdD9uv29Cm3mujEuPhCgUF4v0XVMWCyx
	TQYGpW4qWknRUeascL007BT9BbWLfq2ah3fibpmLLfqd4PXV+Kxr43l4VX4kJRbE
X-Gm-Gg: AR+sD12+1N/ZN7DhkK6zOXUGDvlR0vtAw+/q5z4EX7yS+Fe8jUK3T0FwQh+gbwr/zim
	HX+JuJ7+pyPTgqr/WyelQXIN+XyGRAlgG3/HqrGQIj3L18c+okcullGn8SSgrmmgXElCcv+rMQF
	6eZlmZ9IBC/LUVmcnv+jL+xzrCTWM2US1JVnDiZM7FHXusrGv4on4zqzcEVq665Sp88xhr3s5EF
	ewfSQu+UYliPCtRz+K2iCp6ADiltuKTAi0pTKzSHsNU0hu9t0TwY6dqIK1Pd6qv29VIlGW4hmxE
	hRtXzEXofwNfS7HZknriZLMV7FUTSEbHWSjZDXkM6Oc0Lhk+/P1gp6fH6ay+1/9fJQv3zT6QV1S
	APWLGpTlflZlcSCiCEgQRbkkYk1vo2CztkgnoNZiCHGmuWXPp0tALA6M8xmlIDQ5a+7QGSOlHsW
	53C8R4gdqHdtXF+JrLsbCvGpVRFfo2s97fF/+j6EtNMlyvDrNnvfFEkpCtg35hojrt7jwHei2GG
	B9cH7/Cr2ivoWm6DlfNx/GnyA==
X-Received: by 2002:a05:6122:421c:b0:5bf:853c:937e with SMTP id 71dfb90a1353d-5c3d93cce87mr5611682e0c.13.1786372640898;
        Mon, 10 Aug 2026 07:37:20 -0700 (PDT)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com. [209.85.222.44])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c40af097absm4483219e0c.8.2026.08.10.07.37.20
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Aug 2026 07:37:20 -0700 (PDT)
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-977bbf2eb1dso888079241.2
        for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 07:37:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RoE6AxRei7ZAwqOlkdH/19cFH3k5Ws0rJKbghFHTabr4igVzgwvyKXfzmyaUhW9yZHOjlAqTj6+PTZZ@vger.kernel.org
X-Received: by 2002:a05:6102:4425:b0:74f:4162:3f58 with SMTP id
 ada2fe7eead31-760e79de5admr11853771137.6.1786372640152; Mon, 10 Aug 2026
 07:37:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260714130429.11214-1-marek.vasut+renesas@mailbox.org> <20260714130429.11214-4-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260714130429.11214-4-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 10 Aug 2026 16:37:09 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWF6hVJjfR4fBbNWJirG4mkvdEAwLYbZ1WcVyw7HvYWqw@mail.gmail.com>
X-Gm-Features: AUfX_myKId3XG_N8cJulSE8NHSJR1C4r8vD32EwncQ0VsveFleyngFJWCgOst34
Message-ID: <CAMuHMdWF6hVJjfR4fBbNWJirG4mkvdEAwLYbZ1WcVyw7HvYWqw@mail.gmail.com>
Subject: Re: [PATCH 4/9] arm: dts: renesas: porter: Specify ethernet PHY reset timings
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
