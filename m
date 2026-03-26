Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B64B52DF144
	for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 13:50:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774533038; cv=none; b=sBCo0j8pGvzZ7DnPlOaJzveH2KCo5hcw8ZnLi4AHHj1e2SsrPbFeN/P5Uc3kuOCqEgM8/uNrLrKdRvD7k46bFO4cQliI/ZCvA/yzTzm9fL9p89r1NKwcERWEd2FUvhRChbOClcWryBUwhsCN87OygOONDvNBMdHqTrTU0KB5f1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774533038; c=relaxed/simple;
	bh=zfR0KFSHLPzL2E+STUVtGkTaWWo0Rd9uMDmN3nMDB/I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mYDm5IlDuCEiKb9Cpaf6i6YzWKoBtaopKCSQNfovPqk4MKvJwB9Da5HgMU8NpW142h6J+OhDyGKbMKAHtJBvIwPlwJ5h3IhZB6f7LkMmPCnQoJR9TycevpccdpIlEVIuotsUPjOzgL7reg+t07HzTVa9U3UB6BLlm48TsbO2qHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-667de793310so1696699a12.0
        for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 06:50:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774533035; x=1775137835;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZZpiSciNjye0KqicJtIKQlGVq5eF91hzz2vGtpczo+k=;
        b=sna7X3DtlYMv7u/4HbU8Vn5KHocGcIBVkx3IDVqqn9locZiIeOI0kq5ztXNPrtPEJ4
         1MheFDcpFJ00DnKZEsSyjAcer3b7PkgMXAfBbzCbdmu7JGv/PXil21eRsYCkzvY4RUBY
         4hG57rZqBi8XUhrKBnmuJqjXrrlRHqLLvF+hJC7fZX7R6CrsSyIPl2D8Jno/gCDYT6IW
         4z9JOsEEs5FLZ+KTQzt9XNIW+I+kGNS0PCqB25ydFn78v20+NXw9NIWez0XPL8osO23m
         5JjeWR78OzZGfZisGeZyR34ZblH6WJNPiwE6l+XwdxiMmCnHtetihZRwgAW0hby5xSRT
         96Ig==
X-Forwarded-Encrypted: i=1; AJvYcCUBnwNxE07xeGq9BUWc9Wp3ii31uZPF8WM//LMBOYruiL9nE1PZOdF0UMQE2Pa1DbmdwsIiTVxNf5Ah@vger.kernel.org
X-Gm-Message-State: AOJu0YwT6b2+3JjamEiqcJrcTEkm37P6bansTETN4EXM5tLz+Q97I3jk
	A2cSAsqlBE0nIuy1xO5NLNxgFNrRtXjdbcofXmNIV1l+kdvDYtDYu3wd5hyIBLlOGoE=
X-Gm-Gg: ATEYQzyoctXNySjMZOExw0ZBQBILmpeJScd+YX+ClhcBhLcEsSQsmrxF38hfwsacX7m
	4BZUNmuGHs3J3kFF3HnhGi324lgX/r8WeLmarBGxRDdEpDlqKyQ7gELc/rGWNHVrvkt4MC6eJ0W
	4vaR6HKK5i0KmAcXYJVK1Cowa/owqhutmAkdyXYS/F0gafg6Kp6P+wZ/vI4ZipoP8nybUVvA3hA
	tI0gMTkVKWQoW5r34aM8yv3Fridesk0UxkrQMCb0OOuyiGKhd4ee2G1vD04a+aHELuGaC9Dd0Ff
	YhJyZ+Uf3FHZGdoYvHDzKh9e4Uux9r0mJDiJPe5ndW+z7STlrbbyTlZCxrBLE1McwGPeCVJ+vjZ
	NkyZ4o07JjlUEQfr4cujajYolsBKV6FXOaQJZZ0rbyjrPgaHh5PjvtcjPZS2wyCzhtToLrEzYVw
	SfH3P8blaOBj6/X1lrF7fAVbkagurv5ly8HR3Q1KGGSeg2TEt23R4OpN7niz9A
X-Received: by 2002:a17:907:9813:b0:b9b:207c:f7af with SMTP id a640c23a62f3a-b9b207dbd4bmr264363966b.42.1774533034498;
        Thu, 26 Mar 2026 06:50:34 -0700 (PDT)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com. [209.85.218.52])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b20265cc0sm120952966b.15.2026.03.26.06.50.33
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2026 06:50:33 -0700 (PDT)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b8f9568e074so145322566b.0
        for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 06:50:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUIujiZ4Fv5/pYmL0yrhHovq9p375KkwOmf8XYf3I17NsYvR2xIkKGpQ04HCwxs0l6x7QckCs4u9NXM@vger.kernel.org
X-Received: by 2002:a17:906:da02:b0:b98:2462:959d with SMTP id
 a640c23a62f3a-b9a54238a19mr468792266b.31.1774533033140; Thu, 26 Mar 2026
 06:50:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260324114329.268249-1-biju.das.jz@bp.renesas.com> <20260324114329.268249-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260324114329.268249-2-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 26 Mar 2026 14:50:17 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXbdNPMxPzf1hHT5vO9CVCPsL=UMtbvEXF9gtQ869ve4Q@mail.gmail.com>
X-Gm-Features: AQROBzDNJoDmUl7Y_VlwUV8V3o47tmUPgQk5SBKE-wsihNwjTg-QGGD52bK1kjo
Message-ID: <CAMuHMdXbdNPMxPzf1hHT5vO9CVCPsL=UMtbvEXF9gtQ869ve4Q@mail.gmail.com>
Subject: Re: [PATCH v8 01/11] dt-bindings: clock: Document RZ/G3L SoC
To: Biju <biju.das.au@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Conor Dooley <conor.dooley@microchip.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 24 Mar 2026 at 12:43, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Document the device tree bindings for the Renesas RZ/G3L SoC Clock Pulse
> Generator (CPG). RZ/G3L CPG is similar to RZ/G2L CPG but has 5 clocks
> compared to 1 clock on other SoCs.
>
> Also define RZ/G3L (R9A08G046) Clock Pulse Generator Core Clocks, as
> listed in section 4.4.4.1 ("Block Diagram of the Clock System"), module
> clock outputs, as listed in section 4.4.2 ("Clock List r1.00") and add
> Reset definitions referring to registers CPG_RST_* in Section 4.4.3
> ("Register") of the RZ/G3L Hardware User's Manual (Rev.1.00 Oct, 2025).
>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v7->v8:
>  * Fixed the R9A08G046_ADC1_ADCLK macro value 138->139.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in a branch shared by DTS and driver.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
