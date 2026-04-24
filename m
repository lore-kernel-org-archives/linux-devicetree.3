Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E303223707
	for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 13:46:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777038380; cv=none; b=YTXLxCXUpPh+uGx2TMHOkmJmX5q0oVMIqKLLflhKEE1cpzeIeIAwDcV96pVHG3X9DmoO2vxrZE7pS77VqH0DaXDjLMIpa2t3GzgOuaDFLg7Qq0yuJw39OI75c03+cV8ENGS8gGLRo4Qj+nPfRMP5klh+31XEeKapnmw7sIeKaXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777038380; c=relaxed/simple;
	bh=koZZaqymAh5kIvdpCwiZv1PBzDpj/zf5HXiHOUdGIX8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LkHHa0v4cbdQC9DxXI/BaraYFr3uGAVzlnTETTxEhGvxpQBUaWQjcfjazYF3wzwq7Q91SeNRDqId6/lZbqe3YxY9Q4TQHBO5MfkvtjeLI0KVZbC2yG61oTZR8vVIHzqDDS/xV/1rrrUCE4fAC0kBIdXbqGP4g5b0TFcWVhAkbEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-677f7c29af6so4292410a12.2
        for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 06:46:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777038369; x=1777643169;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KLliIgC7Zznw0AlYmN91F7ir4F1HBOk7zj2xfpT4/Jc=;
        b=TRoCslsgu5+VFMbT89gMwIPJyW7R54krtbSsReLqy2akhAWmWUFzYDQgyENtuar/Yg
         +hpR5axqRclfmvO+5zv7foHyEukmsWBcWTIPkmBdmD5T/uM7v7C+HsBRRoP5won6rnAC
         l5LgwNq4XXp3o2YmPq7uYO9EtDCMjsW5FF5xFYutBVPdgz/Ge/Yd+paBm1y7mPCAkvqh
         nZCvGHZ+JQOhtCiEGYLZCytF+umNCq4WL15YQTonDeKqLct9alOJw7xDJl3iZhJhZvy2
         mswCfxMUMAOhPirXUdEhvqs/F3DI0I14/JLjzhsgaKlH5p2C0cUXDd4za8tsjCbFOscK
         4pbw==
X-Forwarded-Encrypted: i=1; AFNElJ/K5wExt5DEzWR3iIYKwVH54AJOmc9PF2UUBys5Miv5J4p/42kj2dcWBbARt7sXUrbRIH/6h2DrkPbi@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4FsBKiYZwEVEa+GIw3eG9+Dhg+6mtsx/kwUtl6fPEk78lcPLk
	gITIOFcRUf0XdD/t4wryp6BGW9VC6Jk16ZIdb+Qr1/ZlK8UDh1ThTgOrcrb57WB3OJo=
X-Gm-Gg: AeBDiesrJhiZdovVXTzLF12R4Y0BmdhgLVVF0BTrEFisku0+tJe2Ads9eXePExlEjeo
	PXUPONto3yWsJWbetT23Z+3EfScIuA0hPSIAa1aY4J4nYOsHkZGWZSFoAFhH38N1G4G4IYwwrp/
	Lwv4yZmZNc5SfDgX22dl4rbmbW7Jibp2E73Oa9E0g4icmbNrYmxb+O52F8nokafqIuyCTzYBwAn
	/UmZGu5pyXQRF0NB8kyCDsEXPfkbxAx1+T2vFM4SnXoXToTDimGN61167T7Qt7hJpDU1B+qK7fq
	seIztbxuPdyYiT3GekGWWbjR3SE48vIhTGdmJacD6g23sdmEjUbJkDQ808YzVPq8C04XzGIFeL+
	2WVpMsZ4IxglQomLjfaa7jR7JC5YQsLTYiPoNSvsKS8Np7anJXE2TXrNTMEoQETAe3LFw+npyuj
	Rt4OIlXCPEfIL6u8GmxNXcBU3ve1kk3LJkFPMy0MNCpJUpv+VDZDnpulmd9K0dOWyfTWeMC8E=
X-Received: by 2002:a17:907:94c7:b0:ba8:422:6015 with SMTP id a640c23a62f3a-ba804226350mr1149572266b.1.1777038369349;
        Fri, 24 Apr 2026 06:46:09 -0700 (PDT)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com. [209.85.208.42])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-672c4d455e9sm5375877a12.14.2026.04.24.06.46.06
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Apr 2026 06:46:07 -0700 (PDT)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-677f7c29af6so4292238a12.2
        for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 06:46:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8SG7066Ni+PrGCtF62DEDe4ZQye1Z1p9zvK7JRDdM+fH2soqE7J9iJFQetUL+DbBpe4fdT+oAs+jUd@vger.kernel.org
X-Received: by 2002:a17:907:268b:b0:ba5:1970:2bb6 with SMTP id
 a640c23a62f3a-ba519702c56mr1350019066b.34.1777038366261; Fri, 24 Apr 2026
 06:46:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260422233744.149872-1-marek.vasut+renesas@mailbox.org> <20260422233744.149872-4-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260422233744.149872-4-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 24 Apr 2026 15:45:53 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXb7o3NJWjNeMvtTqoMZtZJc8e-8AGAd=WYeMa-qhgk2w@mail.gmail.com>
X-Gm-Features: AQROBzCeUf1K_8djXszLWSG49-1ZmjC232gBnM75vFZ9xuQJc1mtkXTcurZTMVs
Message-ID: <CAMuHMdXb7o3NJWjNeMvtTqoMZtZJc8e-8AGAd=WYeMa-qhgk2w@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] ARM: dts: renesas: r8a7740: Add ZT/ZTR trace clock
 on R-Mobile A1
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 23 Apr 2026 at 01:38, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Add ZT trace bus and ZTR trace clock on the R-Mobile A1.
> These clock supply the coresight tracing modules, PTM, TPIU,
> ETB and replicator. Without these clock, the coresight tracing
> can not be operated.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> ---
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Magnus Damm <magnus.damm@gmail.com>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: linux-clk@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-renesas-soc@vger.kernel.org
> ---
> V2: Add ztr/zt clock at the end of the list to match bindings
> V3: Keep only the trace clock DT part here, extend the commit message.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
