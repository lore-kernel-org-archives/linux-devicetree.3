Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 775184C77B7
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 13:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778677950; cv=none; b=JQGIijRYBlyW+fM2DuYbbmGsEwT+Nk2KTMC0S2DASq8sl/po/gKVrkOTextLuoPrLSjUj3ymH2BwzkOjtWxc4Q2TiaYFuDgQ57IuVON2/ql4VVwkzfNoyqhUfZwl8owzwcn7ErJHn2UqFXrE07mgwDbTxPFwSuliAAxSFcB7zhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778677950; c=relaxed/simple;
	bh=OUQHmjb7UkllJEpUp8KQM62kjPUwPzi6de+ciaj5zDQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CGB6fVcqAoM3UqIBeg5QCxR/39F9fGad9YhRXXiHUA8HPFy+ucXQKas7Dlqd99yAkEsRC+zGNvgB3Bqc4tBX8kelSZDQzpv6g69rGgkk1Tl4glHu7ojIRIt1VeKyOlLK7EHKEFFvQZ9F7VtEm9y7vQdTTy4T9yg1vDWL+KuIjwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-956948531a1so1802521241.2
        for <devicetree@vger.kernel.org>; Wed, 13 May 2026 06:12:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778677947; x=1779282747;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GE5Sc3I5fhZDV/Yx4xguTp5z/tXd0Rx77uBwtmUCg9g=;
        b=hCLP/NqMRYiE8Pnibtt9sHbesM6OpkCyxCJ3Q8WOV5tzJWXmGXGsJmwHePAgcfVk84
         Zw1/hdXvA+azLbWObJlSXEh66L6NCSwMRYXv8pRSqwTLJvoGu8F9SN2gb2J+hAETGNES
         2UoRKNj+XbyIF5lfQ0c24DcyC4mKNQT0UUj5bntOwJrz5T1kZdoHswnU/2ziv/B/bfGg
         avYIphQwWYAEVaGPnfmlT1uUm4VD5z6q5c9jTZDMFvwvv0Q9aKk0Mn+K8OLCGorn1Xfn
         EgTyGL1KJDuFnmnpjMxv4eT3DKmydOw+hP44S4CBm8xvqsCI5Rt0D1A+7+oB+yCYW/At
         7qUg==
X-Forwarded-Encrypted: i=1; AFNElJ+j5yPhceMrj6IrEsc5L4xZcnPKW1r6Ez5NJwB/U/bPk/PIJsnU6Z3jLJB+3frVjEA3HiwmBZetaWlW@vger.kernel.org
X-Gm-Message-State: AOJu0YyePNty2GWvp7Qpz0PIMifmUTt1SyMNENVOkMCNIaH3zGqPZKoi
	1mS/6Yll8kjpH7PskHSjoByN5a/wsmXjAT0QhSFoN5qR3RZmdKWrFu9LTylcD5M/
X-Gm-Gg: Acq92OF9QU0BGW0Eysd2LiSdNznHLzDKbrMiFjK9f+kGJJmKPmMmpQvqbqYBcrxrCo8
	jHi7AILQTGZtsEwvY/9XSrg1AuRw6lyoM1ql2afAU9svlPbUL1UqogB3QQZ9+QZvauDXZFLUlgX
	IkOoCgNUKWN7b/LISjjAdYkqFD8f1PIHYkRFZBus5GRs11IoN3ptOnAD9syf8ldodTaETFij+ig
	9jW3+v2JbNYECU6F30wRTJ9DgbZTaRZHM4hllXk9Qs3C1mkV7qkt4GtetW9mm0TTJ7tyRdUDZEb
	UQMXf6o9tsYu1GKhfKMKSM9tYUQDsBuP+G94+xCh73bkoOBvUuDPbMAtNV1vv+yTJk/HywqM0Xt
	pNxmgrKImQlMGF+DSNtX0hfQ3zuuZZqclJnkv7ea+SfHLyrvYiTjImhH3cCgCmf7vZXphe5i+ge
	0tsEZ+b+DMVOjWt4qyWt/pNxyah652I3oxQt2YILO86xNC0czHodY4PdmlR+3PsBhp
X-Received: by 2002:a05:6102:3907:b0:631:ab8b:c34e with SMTP id ada2fe7eead31-63771e9aa85mr1333913137.11.1778677947400;
        Wed, 13 May 2026 06:12:27 -0700 (PDT)
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com. [209.85.221.179])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-63140250725sm9968315137.12.2026.05.13.06.12.26
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 May 2026 06:12:27 -0700 (PDT)
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-5751e12c524so2317030e0c.1
        for <devicetree@vger.kernel.org>; Wed, 13 May 2026 06:12:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/PcBm5mZaFZt4wJplVPUxPa3pR/mXN31nCUY+zk1O6y3YUFp/eB25oM/MlvGGMYJUvxIlnQIg4hXA4@vger.kernel.org
X-Received: by 2002:a05:6122:6992:b0:575:352f:eac0 with SMTP id
 71dfb90a1353d-575e6fb88e4mr1415729e0c.7.1778677946052; Wed, 13 May 2026
 06:12:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260502185557.93061-1-marek.vasut+renesas@mailbox.org> <20260502185557.93061-2-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260502185557.93061-2-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 13 May 2026 15:12:14 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUGGEXa+S7DZABv6_VjzgKaFR_dgEt6HMsoLWE3vtpduw@mail.gmail.com>
X-Gm-Features: AVHnY4I1ueP8c0lbfl8GeS1mAQp1h1WSM6acug8SaPsOhckX1RLhaKldCR-pmEE
Message-ID: <CAMuHMdUGGEXa+S7DZABv6_VjzgKaFR_dgEt6HMsoLWE3vtpduw@mail.gmail.com>
Subject: Re: [PATCH 1/4] dt-bindings: clock: renesas,cpg-clocks: Document
 ZT/ZTR trace clock on R-Mobile APE6
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 2 May 2026 at 20:56, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Document ZT trace bus and ZTR trace clock on the R-Mobile APE6.
> These clock supply the coresight tracing modules, PTM, TPIU,
> ETB and replicator. Without these clock, the coresight tracing
> can not be operated. While this does change the ABI, it does so
> by extending the existing clock-output-names, therefore if an
> old software is used with new DT, the coresight tracing parts
> will likely fail to probe, otherwise if new software is used
> with an old DT, there is no impact.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue for v7.2 in a branch shared by clock and DTS.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
