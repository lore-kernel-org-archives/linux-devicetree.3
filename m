Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 982F13D669C
	for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 10:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774519591; cv=none; b=sARtPN4XjaRq/vFeTSp6Vr/ejYF04tDHAqnrrb5n8hW5GnjuRAgSZwV1KxPtDQZ6qPI90Z6Vr7CnY5/wHaVIDgE2woj3JpwX9O9iFZgb2chZGdaTq0yUu2emfYkbYl7XD1CpWT0K2LqQtqkQPo84Dx+6HrQjbCp4LKLzAucgcLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774519591; c=relaxed/simple;
	bh=Dnk/Ep000DxDlm30ft/36GISAeJC6MWSp0hczCHVrsI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K1VvjbnjLuZU7w0bAjcBoxfXHDwok91ut5neeFvY04dDjWoqBa/KV7NrVpUXJ8RfeM/Bfgcbfxaq+q3JFcq/2bXV++1BwuHpvoktKLbiV7uHT2Zg8fMchFph4aLnkfKNENu0thx93KcCTNkewJO0WDB6XtgA/0cvNo0PRJ9Klf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-602a0648aa3so509269137.2
        for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 03:06:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774519587; x=1775124387;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YTtqqo6x9S580GU00V14/uSms4ERMBvfiBHq57QUXIo=;
        b=J8QQ75t6dvsNTWvzmnbmpENH4bPFlTIpT1L98mjYOCd0hWk/nPqwAW4YRf3hRl+BUK
         QrfQAR6Ku1oCdvvIttUwvWoyVbSWEitBIEe+XIHa71wrwZznu01cW3zijT+2SGf34Qp2
         PXyTsIaoETWrkcSjLk69FtIZk0LwfOV/GFJ9Uxi1KOj0zCAz11W9pv2dDDeaefXuRJLm
         D3Es5lrfirmw2tG/RM5ZLvzsP/64EyZ/AZledXrJwCRhUZddpO5liRMoH6aJHdzp4tSy
         3n9DnqOJpiovvqtxTKmZ8ftmUypZQ2YADGmsD19kixSDp2IdRjyR5EFsMHQ8MZpP4riX
         DJVQ==
X-Forwarded-Encrypted: i=1; AJvYcCUc7tKiQiS1Re9OE+vH4jBqrNad2LIBQ9MQVbNcIt6jKoL+hMf29Q6OZ+4XQdCsBEwO8GUZ1WaVMv1C@vger.kernel.org
X-Gm-Message-State: AOJu0Yzd3U+cY8/thlplb4GE71qEOYPJkETdZiboaeMjoDGkMTKa1XQT
	aGpWJEYA5810hQ50hwZJqj02gIUHTNsx438phoBh+vjNyhW/T/Q/+AIAr5mBIpS6fAk=
X-Gm-Gg: ATEYQzxBaqvHInKllP21/05bMSJJ3p68a3w7wlv3gKkTPrK9R67npIYVAcqjkLTskjH
	cDOQEjH4KOfx9/YjFY+eJ2ZBwtJbQ9BBCVHOhECbS9jGBhR0lU827paCKnPa6MWQQF9OieUWxdT
	wQqu/pkhnPm8kfSBn/vFfWU9W2VSy2r2JSqm7U9nuzbr3RBysPXQi1o9HgVx5SZHP0EZuS7ojJJ
	6Udgvd59w7rYUtG8LUAfPF49Oeg8dPrK9qLe1QG0vk3/sDEkyCAP75TygE1R9HIefLMUnl97mZM
	16F00Kcw7CChlCbIFTnIRHRYUBpkLxMwFyt5Z1ExdxRZrj72tFvfqTdhxItjqhpHuvixc48hS5M
	IomxToCHagEgICSBbcBOpuXhTF54QMzDffHTrxRtzWf6oPLOYnYKs24aKM3HJcEbec2J4PpdY8s
	wM7S2ag+1O7hiCEhtJNJMklK9yWPif6trUTjQ9qfTybOaBJ818VKCWY2HXmSDY
X-Received: by 2002:a67:e70f:0:b0:5ff:b3f7:48de with SMTP id ada2fe7eead31-6036ceac83amr3192698137.0.1774519587384;
        Thu, 26 Mar 2026 03:06:27 -0700 (PDT)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com. [209.85.222.46])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-604d50645a4sm2483358137.2.2026.03.26.03.06.26
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2026 03:06:26 -0700 (PDT)
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-94ac8cbf3feso478997241.0
        for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 03:06:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVGAdYB/uCaqznaF7d/iwG2nqsiVhzgVKD/D1Bujx7iRpMi/SxN3V9v60DxN4em8JOdFaWPOHXCWGn0@vger.kernel.org
X-Received: by 2002:a05:6102:ccb:b0:5f7:307e:80d9 with SMTP id
 ada2fe7eead31-60394931699mr3392374137.28.1774519586614; Thu, 26 Mar 2026
 03:06:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260302165441.4457-1-ovidiu.panait.rb@renesas.com> <20260302165441.4457-8-ovidiu.panait.rb@renesas.com>
In-Reply-To: <20260302165441.4457-8-ovidiu.panait.rb@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 26 Mar 2026 11:06:15 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXu13hd95vQGKnwhJvamYEU30stfqpEup-UES0T1WJwwg@mail.gmail.com>
X-Gm-Features: AQROBzCyFc0L7MNPsR8v6JpI5CURIKpqB0sB1nizHY9j3c8L_BX7fUgN2HFl9ps
Message-ID: <CAMuHMdXu13hd95vQGKnwhJvamYEU30stfqpEup-UES0T1WJwwg@mail.gmail.com>
Subject: Re: [PATCH v4 7/7] arm64: dts: renesas: r9a09g057h44-rzv2h-evk: Add
 versa3 clock generator node
To: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
Cc: magnus.damm@gmail.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, mturquette@baylibre.com, sboyd@kernel.org, 
	biju.das.jz@bp.renesas.com, fabrizio.castro.jz@renesas.com, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 2 Mar 2026 at 17:55, Ovidiu Panait <ovidiu.panait.rb@renesas.com> wrote:
> Add versa3 clock generator node. It provides clocks for the RTC, PCIe
> and audio devices.
>
> Signed-off-by: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
> ---
> v4 changes: None.
>
> v3 changes:
> - Added comments to document rtxin_clk and qextal_clk routing.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.1.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
