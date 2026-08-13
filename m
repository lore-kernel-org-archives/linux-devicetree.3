Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93DD43B9937
	for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 09:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786613158; cv=none; b=Hpc7B8NHkU7xMfsQYNWSxg490Q4xYrrwWbq/xh80XvKQnIjxYus5BUCeAQZmHrCo2A5FAXWCfuLclden+nsRqF81h0XgNbbwPt21FdCZaxn8i4WJt0+zQTlyNkshMI9S6Gbw5Nt6hjD2E4tKbNNr4HkIIoOCgRXTbZFORzXGp84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786613158; c=relaxed/simple;
	bh=z6DTFuPGv6FWaGZrtsoIb4p3tEuSyUOB0Uv5doIJz9s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BKZjGggr0yEnCOUcU1xRRch4o5eBgMD2+FHIXCfDmPOpGXi5c9Bl8Km85tdN/pmQ89mKYVWs8gQzC7kBE6HhpYLz+hkSq7Kr7Q9qzkgkmmEh0xRtSDFnUIEmlHbZO8dm2ccg7NaTvrgkU7Iz08m0lznwAaZULtMiNWUraGMNiqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-977ba4d3b49so598969241.1
        for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 02:25:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786613155; x=1787217955;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=RqwpdLB7TrtYeRCXVjCM9omQuKhZ1BXK2srBTA+xeu8=;
        b=P/f67kNx3HmtWzG0JbYooH7I6Q9U1pcU3MvMpN+KG1/nOiTSTmvu4wIMYoqL2/e6od
         rxy6GebeeB116bB9URh1twDy7EjNgkRopXgCcBy1IKg/8f0jtAb6doOF3qlD0ytxO/Ed
         j/EmUh7RQZm7YHqBocuJEeSzyqJQQYHV5WZ3qARHOyLkReZvyohuDfpZHR8Q6bSgQzKj
         Q3LFfMTWVenZksHGyK9HcrxlryjBKH4Zr044G+0W7WitB/kTvz7Xi9VrmagolDdsascJ
         7qoxGE5zGsInHQiTnRSfAF57f6kEk51auvOo5lIyig5jZDSPs0n6D097GbxWz3b0M+aX
         yyZg==
X-Forwarded-Encrypted: i=1; AHgh+RrQtw0fbZyjHG96iCaQbs4JxuvO1D+P4JK19aiELdc4kk78L3lYWFK4iJjkwrMJ0GaG0DNJdi1zLMxk@vger.kernel.org
X-Gm-Message-State: AOJu0YwhydNhCfNXYO28f7+u8bYMLKwATTINuum/ZwmwlZjEVQS3perK
	Hj81nQWhP/aH3PY/Xhj23OjDYSkoCesr2VtHs2ToBuxbnFPwd9W0TzdlYlTpSMnF
X-Gm-Gg: AR+sD12ISYrB5lIgiUyLqhkUkPxGgCGEGtpfNRwIglf3xBj4IEpuJcimMpznonP/HLl
	f62/9LtzPWjkhlWWmSFWCEn0Vj8R04uW9zjRkl2kS2zLVdLsslqZHjUJ/z9hAb98xnaSYmyr5Pj
	mYMjQrg99cErXSsYm86Tns0sykeQl5bpRo4OCZpJy1i4XM9UvpgR7qetH9XKB6YE5RIAC2Y+y6/
	JbUo9ue69VqEbotXz6Qe4Yw41BgHkK/zaueqsAvftWWS0sRtQwUlrqt0DvKzqUUhytXb52GpYUk
	Ukv6oc1mSpH4u7Q7xhRkjtVVVnAPPjxKtnpV7dONLdGUEj4zEbDz7++s0d9IV0fCcNgJMU8dwdr
	rK6+hlKAkB7m2gWgNaFXISSPCytnlkLOez0sPx0gyxxD0wxe6tmlYfglUb6maAU9MphAJ2L8LNc
	3ClDLU/cvxwfFdg30qkCPkChEm1NOWxfIKKzzi6ogrIM7MWWIl/RWqkP431Yq60V6JK3H5E2jTn
	YcsqLtrvtC7moHpOGDKo2Io2bWLBw==
X-Received: by 2002:a67:f707:0:b0:745:36ea:415b with SMTP id ada2fe7eead31-76dd1573628mr385089137.5.1786613155393;
        Thu, 13 Aug 2026 02:25:55 -0700 (PDT)
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com. [209.85.221.176])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-97becc5ef5csm636508241.10.2026.08.13.02.25.54
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Aug 2026 02:25:54 -0700 (PDT)
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-5bfbbe5220dso422297e0c.1
        for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 02:25:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Ro/RieFkmoRdLNA7nqdbtMNNw4wNfrSx+qUl/1YBwe6KkHEti/NOxvePooZkKu8D4E35xfLCUom1qgb@vger.kernel.org
X-Received: by 2002:ac5:c74c:0:b0:5c2:a30a:1a08 with SMTP id
 71dfb90a1353d-5c57bad1c3fmr407701e0c.2.1786613154174; Thu, 13 Aug 2026
 02:25:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260615115455.1412098-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260615115455.1412098-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260615115455.1412098-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 13 Aug 2026 11:25:42 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVD5OHjnpBJS7hgFoU1i+6AFHctB4d30HFHHpRPazsESA@mail.gmail.com>
X-Gm-Features: AUfX_my2gqI3H_UNJDW6a68Up-CId8ad7_1-724yfN_7o7bmeKyk3Bb75eFn08Q
Message-ID: <CAMuHMdVD5OHjnpBJS7hgFoU1i+6AFHctB4d30HFHHpRPazsESA@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] arm64: dts: renesas: r9a09g087: Add DU node
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 15 Jun 2026 at 13:55, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add Display Unit (DU) node to SoC DTSI.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
