Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC9D3443A83
	for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 08:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786611174; cv=none; b=JXy8DY7hpdGwJEaLwjeybfAvyE4A1j55V9IymLRjhv+Pf4Ve3aFJP/q+BlULFHs/sRzgQ1S2z9eHLmTc0jJrByAGHeRWFotc5OxajrRyKYn2Al9yGbebx9/wCfNmTX39wZoLp4Ip9xXFAKXDLfyCFByWLCx+YFRr3TjpJwLZgn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786611174; c=relaxed/simple;
	bh=wqe3WmzrY4ZpzNWzwSlqJUtTcYOGLXlIv9Kugo+5S64=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bPlj0SY3HOt3Zp4QHJT8k4BqAuVXEWg4xQEB6CiAGB8u4fM1Q7p/UWMEFTaa7l/drcz04SRyv3GZIbYV5ljm727wRoOLkrSTh9FwSDr3mPuGMgflYMNmz7yaI90v3SCNKvJFe/eBYsgdlt6X1ngAHSm++vlS7WUSZ/M9lgvjo1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-76b3036d2d4so211996137.2
        for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 01:52:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786611171; x=1787215971;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=vy/UbCFeeNu3PaVu0I6JLOsmvQPQwW9n0EehGyjoEeo=;
        b=RlUVZ6fK+HR0aNE9xNek1URnGb61SEmG1f+4gpnmNjLfqHedwkucdXbTfjat91Mm6+
         csCWSLeF/yvsoAPmTXyNsexMbqpoJGr4x6zxRGVJoCChdXW9nym5zaL/c/TqXR9v+uEZ
         vExIegUDYDLmO9qq13a0oXRHRYEgEiUpeSHM+A3sqtnZYiBWYuQEl/jZkMx8o6So7m1y
         aaNPc+IwSppYycpAg1cFdhzV22Pn8KmAOqW6UA0pzZMrD+H6OuhQPx34UWLX0G08uNX8
         l64cFpMU4tH8RyPilGeqJjtClfYz9n+D+bb9W2VaOJc1PsET9mYq3ew6ttABeNIertHa
         c4Sg==
X-Forwarded-Encrypted: i=1; AHgh+RqnI/gNR5DVbiaUsRDxDhGJPmhwMK8n+++n6L/2ncZRwLHFCPrxRK7gaayL8lErpzsZX5NYHBifX1Sw@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/N17w+WD5hq4uxqbgSJn0B+HYYllOVEjYmrnID1BvETE77d4S
	Xp+lbiwTb+fwn2z3ExesgAeJ7LL1QNKGvt285FAUWj2Wg493OeRk2sTask7YwOjW
X-Gm-Gg: AR+sD12nrIl1XkL8r2nt7SzlbOdq6/7HVHwqhM7l2/aStkBxMR5D0u9TYHQx9xfsa+Q
	KEvitNOyHWYJFB6Zif57OnUbRWUN3iaN2TQy9HReV5buHWl/+dY7bye5UuqzVJzQdnFURxK6CG6
	U+/d+UBITlf9MAGXy/jBAZawl6dlveRy4lA66LgXjaPuSZusbdlhafT+gCNrqZkLCUv3PxAwPD4
	B6d8RKDCZhiX9nUJroNicHpWeMLukmIKAa8SKUhy2Xmg5yRoeJ3Pfmq8EP2Z2K6Q6NHOIG9m/v3
	+/tePUcD3rGmALAnYfEWyw7qJ7lWxBWmj5IEuFfNAbxwXyFYaPz28jGvItkoCflTQfbHGb4gKuZ
	3957AXEPHf1oKY+XfUjbgqK3P3L/7dNGLfFzb90h0ubyqdhY2oMzEotIze4KWc3JcexQGEOl789
	pa9GZmS8chkMjP3paZbnMOYsYA6d+ZgCsYbND/7H/Ms+JFs9EZHvDnC9V72kwCPKITlhPb6HCOH
	OIDoX8/c+RaoA/f83ni855Z9A==
X-Received: by 2002:a05:6102:2b89:b0:745:1c72:cf72 with SMTP id ada2fe7eead31-76db7e94346mr1292487137.13.1786611171624;
        Thu, 13 Aug 2026 01:52:51 -0700 (PDT)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com. [209.85.222.48])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-97becc5f645sm608722241.8.2026.08.13.01.52.50
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Aug 2026 01:52:50 -0700 (PDT)
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-977258a75d9so310404241.3
        for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 01:52:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rp3pS8gaAsHWNK03tu5vvoltZa/mbaos6FQusENLxJ8JzLN1o+Za38mfksL4tw33EDguMLs8v/tMmfc@vger.kernel.org
X-Received: by 2002:a05:6102:1485:b0:738:9c30:2b7c with SMTP id
 ada2fe7eead31-76db5b7ee90mr1429147137.6.1786611169848; Thu, 13 Aug 2026
 01:52:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260604151855.307772-1-biju.das.jz@bp.renesas.com> <20260604151855.307772-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260604151855.307772-3-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 13 Aug 2026 10:52:38 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWefm4o+o1skM=-_-7S3QaJFhghxTZ-FcmG=vuFpz=MXw@mail.gmail.com>
X-Gm-Features: AUfX_mwjL-W35M2y6KFKKHilmi_r37CqYqL3tzuxXEaIqBzbpu7hLUaVfVScz-g
Message-ID: <CAMuHMdWefm4o+o1skM=-_-7S3QaJFhghxTZ-FcmG=vuFpz=MXw@mail.gmail.com>
Subject: Re: [PATCH 2/3] arm64: dts: renesas: r9a08g046: Add Mali-G31 GPU node
To: Biju <biju.das.au@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 4 Jun 2026 at 17:25, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Add the Mali-G31 GPU node to the SoC DTSI.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
