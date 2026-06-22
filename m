Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29362270EC3
	for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 10:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782124522; cv=none; b=qO8KcRO3jpJVyV8M+2iRe6EQcz5vHmobr81FnsejZ1Igyam4heWM8FdQKzVzc8GNvIgaF2Mx3nqFNIWNEqs3o5oWz695BEyykeH6XxBoPpsDD7NL+cw9nxZNteVq6CT0QwIx0j71R82pWcTO90cTulJbddaU1IAZUmwIo0tISpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782124522; c=relaxed/simple;
	bh=oMPdsikacqtzYTFY2QxLAR1WVtrEJqjXLr9DFz6PV3o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eD8OF2DrwgKrOkf7clzY+1CSXTj3O0LiQLF4/fWYsfgpVkVcpUJImJ9UdU0ZvkAcnlNms9USNWHriZ3pjugP6Yn5u/qL6qD9Rf9JG0qKXltyPH8gV7w1QXVBksq9JM5NNU7Ly17Cm2hVBt2t5McewoskFfkUOVoWUdyz3miytoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-59e8ededf4dso3065242e0c.2
        for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 03:35:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782124520; x=1782729320;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CbT9MfaCjQT3Ym3J/HtdCmcThbQYXtUBVcRrZ9h8JX8=;
        b=g5/ffmPY/P5wFCzfZ4m9s+Mv7i6GklUwIe5eEs1YR7aCp2PHjer/6kYORpLTrdrYH3
         MdI7K8eFIlBBvz65raile1lzRzKNsk26feheytWHjhGTuapk1qUf4OGcMpdwJLV7FOby
         ZLEjp5XP74+D1HL/8sFmICzs/65Xs0RsRNbXYAJF8Q9Z5K9zVr6zkmlMp+rK00szwViF
         iIFcZ4uNeFJjNaBpTYzPcgvi3ibnrJ7WabAUpIvANMSR6RSLH9eeShIHb6+QxBdjtCqV
         dOz8m1cG6aU0nhgI8DI2NqtztE6r5etVi8TVBSfdJHe5/UqeRy2y+LnnpWX2+yQmZYqn
         YwMg==
X-Forwarded-Encrypted: i=1; AFNElJ8m9oEVETRuPf8SS8JG+DdfhEQvqbBd9tLOXicuJYV6tAjOrj83pjsm1Weu9powY5kNV9nDfZcTldOy@vger.kernel.org
X-Gm-Message-State: AOJu0YwUJIiQUSRb+UdvFLiCbDaDIcdiBylNVPET8dD0ak9q/f9/Sg0e
	9tsSi82E7d+UCdvkJEFAb8CU82Wh/Y41loCEwxHKGhhzRJBtT2cBNV42ER+dVwCd
X-Gm-Gg: AfdE7cnF+icyGWUN6gbGx+JVgvpaG2P9GAVyA4KDAVR4/dli7FVdUO6cWst1tQ+vGiT
	ApXRJFlj/K0PTGEt2l6cLA2oDMQgIhNnsDpxKKiHSdDH5ApMYbabDn9dIx6pMT1IiWAl9WRMb0e
	GGlHUVDBPdCjqT03yHsQZNUV2PZtlYaO9y0d+jsJDkEu/zo98ogCR8/HLawfxxo5YIZG0Trt+BO
	H20Sh7CQocncgF6eQ3qY6b55ic8aeCyA7T5rN3xkiQwg2kpJSlV49kUPk4FUzVaUZceU9PFICUt
	nP7a9rPFriAUANfJyUCcMht1EeNXUUpSNZFFlQahZTpPsB2oFO588jOje49nx276eVmjsiFsvYY
	yVC8uajIY9gUKUmXIqqQqA1pHqwFvXQe+KeBLwvwR8IB2rnTegTeCREp0Thh3CLFhEb0rh7ESmP
	zEmV7neB3Y8tDuN5Y3ElvjglrYtXn0dL0KrHeMcBj45ZGaVp//+Q==
X-Received: by 2002:a05:6122:8607:b0:5bb:fb24:5782 with SMTP id 71dfb90a1353d-5bbfb245793mr4042620e0c.14.1782124520074;
        Mon, 22 Jun 2026 03:35:20 -0700 (PDT)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com. [209.85.222.44])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5bbfbab451bsm6232103e0c.18.2026.06.22.03.35.19
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jun 2026 03:35:19 -0700 (PDT)
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-966c991e6b1so1765215241.1
        for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 03:35:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/jSpmUBH0rkTWQm1FmPHZUAKsfuboP9yev8EFBf+JEU5XrpQn4AAVd+iDxiuSwyb3ajCXm6ThhPivP@vger.kernel.org
X-Received: by 2002:a05:6102:324c:20b0:729:4c16:b4f4 with SMTP id
 ada2fe7eead31-72a767f94a8mr4675989137.2.1782124519443; Mon, 22 Jun 2026
 03:35:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260621025052.406507-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260621025052.406507-1-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 22 Jun 2026 12:35:08 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUEPR0xWXRwLjBt5sF7i4HxcDLHCQGmc=gGvFmHRDv-Jw@mail.gmail.com>
X-Gm-Features: AVVi8Cfb4mv2QoVmKeKaT0JRkwbOlUFA4xPaWe_fn-8CnsZR_T46Ke01ntwYiSg
Message-ID: <CAMuHMdUEPR0xWXRwLjBt5sF7i4HxcDLHCQGmc=gGvFmHRDv-Jw@mail.gmail.com>
Subject: Re: [PATCH 1/9] arm64: dts: renesas: r8a774a1: Add soc: label to soc node
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Marek,

On Sun, 21 Jun 2026 at 04:51, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Add soc: label to the /soc {} node to align the DT with r8a77951.dtsi
> which already has that soc: label. The soc: label is useful in U-Boot
> where it is used in U-Boot extras DT fragments.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

For the whole series:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.3, squashed into a single
commit. Unfortunately there is no cover letter, so I will have to add
all nine Link-tags.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
