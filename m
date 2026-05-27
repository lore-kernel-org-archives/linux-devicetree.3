Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B3213C8C7C
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 07:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779867787; cv=none; b=dbxByEMBn3KYYlwUrMJ/rVcNNoB/xoGAKZKBJFYvdATfeMPzjtagtvtZeF9ddDoWLElT65rXMiFSrNsj3WwU9aSE+Vh1+TAi4ZX1mi/6V1bkBn/3+ixUZsMfqoZtuv+3hOq9ffERl2XtVYZqE/bS39OCgcAXFYXFemkpmMRNBVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779867787; c=relaxed/simple;
	bh=JwgSYIJee9nbOlXvju6QWKDMz2Smf422DMhM+XMAwDs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WgAnWUTNLh6o+7yCCDQK0ycexo/q3oeG3EpoGCvirsvgc01ywbEcL/tawVoRcWEtLFmCQMELYSAChUW84+HTzJMp8Au8wFe7OoOAYiRW1p7p91MgsFUgKOfCEM/ftaf9/B6Qo4l2jjFXrR2VrdaWm5CXYJVKzPEwO2Pz2fKF4+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-57513a91514so3829957e0c.2
        for <devicetree@vger.kernel.org>; Wed, 27 May 2026 00:43:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779867785; x=1780472585;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zaz04lQzyGk1Skxwlpp5bPiKiAek9aybHx2v/yLROzU=;
        b=QMm6UN3w6czLAfSFHZnE9Bg0TcR7cvqIZlP22+jCv7R1tlQrZN4GZSW01xv8Er8Cdt
         6AGW5poMmq/SaK8Cpu+spxr7vWIdwFOzgJpWarh16SCalNA4xgBcMLj4dQmy+43nQEUX
         w6UYx4WFbtI7rd4DryyNRWE/GlpjZjyL5S4Fru3nGlwgrjk3tPW971JTiFGRBMNd9XCI
         GX0+uZoF/4MuLDY4HItw7JJLtV+eLrtRCJH4NUDMRmOOOzM9zop6CB0vD133KkTMlwg/
         yfyES+U88VJIFeyqVSr+idG8Xe+iVtfRfT4AcvO6CKeqxSkNjShWxNecAECz/S4jfzDa
         h0og==
X-Forwarded-Encrypted: i=1; AFNElJ8W3AAanqWbiWQtNdDpVAg21hafviYMgRKK801ndjOUGPSmpcWLmAVsTDex/X0X1oYllggO3shRhpLe@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2y8Q0WUTomUjBShwJTrPqPcLVgRkT3+MIWslT5PeIgjy4O9vW
	hIPfuLipc6yxnI9qzx2rg/oKeMUlbleUJCJneKPfyttCpKen2C5Fw2uAHnwKuNOsS+A=
X-Gm-Gg: Acq92OFZMeBvUFYKwRlvVURnPAt6qtPzjBj5C6BME/rROze2CPlbOHn8rhelCK1oXIL
	2LyTmJYZMUIudaeYh9rfZogtlu8XA/JRxljv94v+Fk123Ju0QyW2tFr8ErsxctrwGr8pCCYSTJg
	o0eCGQu6wIksHYTKakshRmhNv9z1VIDPZMJ5TOm9yyJ16QJ5euICKyHjEo8gSacLKvSQlvIrPDJ
	d0YH02k9KjhG/gfnan6M8ItLvXAQy2VgVD6oDBMTRJ1MRI/aqkLWD7R22fR7gK1mnHllHqkGOdm
	uv2UOmBN/yFHdgOK5CpKmPOQjpW5gVsdAugyvC08Nnu3Hk1sqf2Dn+Ls/OLb9u8ytN2StELqhwF
	cDm5MdyMn000ug8XRbLMeV9awtzKfxwoAy6QfnqxmveKQarxGKyQGwYhSIy16LWOu7AbwjB8Amo
	ust3BmnDP8QWT0LnzHhCMLW5qjbiV7GjbxeFkSq67cyaEKqpPlc3BPeJtLepKQ
X-Received: by 2002:a05:6122:4fa4:b0:56c:d623:896e with SMTP id 71dfb90a1353d-58663a5c2bdmr11390052e0c.14.1779867785596;
        Wed, 27 May 2026 00:43:05 -0700 (PDT)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com. [209.85.217.51])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-586f23ee48esm19129568e0c.3.2026.05.27.00.43.05
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 May 2026 00:43:05 -0700 (PDT)
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-632a055fa9fso4199148137.1
        for <devicetree@vger.kernel.org>; Wed, 27 May 2026 00:43:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+8bJpRVkzyBDMvI9GMN044VrDfRNZRK/rw1+J7uWkKOlzxr9lJ+yXYCD+eq4KPjFQHbUSb9AW2Wym0@vger.kernel.org
X-Received: by 2002:a05:6102:2910:b0:607:798d:8083 with SMTP id
 ada2fe7eead31-67c7ffeba62mr10523147137.15.1779867784961; Wed, 27 May 2026
 00:43:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260519074702.3308-4-wsa+renesas@sang-engineering.com> <20260519074702.3308-5-wsa+renesas@sang-engineering.com>
In-Reply-To: <20260519074702.3308-5-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 27 May 2026 09:42:54 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWOgpsakC_C_uUhPttfvK44j8aRuAQxG-BWWdDdioQfzA@mail.gmail.com>
X-Gm-Features: AVHnY4Iup01oc5_MZvrm0JVzZZt-FPjPltbZPQJVVUpHhN-Mvj_g0SQttnrdTgM
Message-ID: <CAMuHMdWOgpsakC_C_uUhPttfvK44j8aRuAQxG-BWWdDdioQfzA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] arm64: renesas: r8a78000: add MFIS, MFIS SCP and
 transport nodes
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Vinh Nguyen <vinh.nguyen.xz@renesas.com>, 
	Hai Pham <hai.pham.ud@renesas.com>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 19 May 2026 at 09:47, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>
> Describe the MFIS and MFIS SCP instances which are used for various
> tasks including inter-processor communication. Remove the PRR node
> because it is part of MFIS on R-Car X5H and should be handled using the
> MFIS compatible. Also, describe the STCM transport area used for shared

S-TCM

> memory mailboxing.
>
> Signed-off-by: Vinh Nguyen <vinh.nguyen.xz@renesas.com>
> Signed-off-by: Hai Pham <hai.pham.ud@renesas.com>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
