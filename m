Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D63C330E84A
	for <devicetree@vger.kernel.org>; Sun, 19 Jul 2026 21:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784495627; cv=none; b=rdIGjlYW+NoTb088SRi+fn2zv3q4zqVIA0J7VlAJp+R4Sk9Lmq6Sf2BprYybKIHqIjFjWQ+zJfi2YWdAloBYf8dUED7hQIhiSK4NHjKDmEtPrMbX2tCZ/XpeOTNvPhLRDJP3BmghMharUO0aTHxLH3qWQs2XenAOmGJP5Dcwcx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784495627; c=relaxed/simple;
	bh=rQT7FnSJWSbCZQvFgg9XlhlbtVZ2Cd5f1GzQeXk++wE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=E7sBzqI01pd0HfK3Kp24eWbDTX1ZxMVOJjLo1knljdJDTiD3bV24bS0cCNT36mZOBU76NQY4k1H1gvEub1iYDfo1qbUYKhTdhgQTn7oCsj0CmnSeVGglii7zcpyiQEMO6Aac1ExtoBHU8dquEvIc2TkEGrC1f4kNHQovZzu01co=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZbUkv84X; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZbUkv84X"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-49555a0e68bso4782705e9.2
        for <devicetree@vger.kernel.org>; Sun, 19 Jul 2026 14:13:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784495623; x=1785100423; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yoqurlPSvAJxWv157dNwPLL8InVlGkCToDlg+t76AwE=;
        b=ZbUkv84X3Vsh9jErt2iRoW/Hn1KY6LYTAk+7WhKDw9eI/R2C635AXLS/rmsJ/5u1R8
         bKbY4PCn1wTn4gLU1qqivHCeyUB1WarPnbxyPFDm43iM8yhud88AjKvSFjZS8Ffg2Er7
         Zd2Fhj+gin+i91C2pkOjwkwYwcT7WkgoVTJ/IZ7I9uWn5kqlzOfJWrd8r+FMHKagKelM
         I54VUb+VPbDSLc16SHsBaO21WdXKZfrPuzgrUCdgYjKxk4xT+cBO+yhAEXwORbn+vARt
         1+UbO0u1Q4WR6j/iB2+3YCROGaNh6Kyynhw6wCImHF1cPrtaYd7H+g0SWKsOLoafy+ly
         jMMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784495623; x=1785100423;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yoqurlPSvAJxWv157dNwPLL8InVlGkCToDlg+t76AwE=;
        b=i6G6TfHy255enSB/W+emUAesuK8Q4A7BDroH45+5NTh2AdtdAeyKi/K5WO3krHizOi
         ZXwlCJtsW/5DiRoirEb3jKs4OPZLXAS16qJO+jG/e45g5sEUEDsp+JzPUcZPZTqpq9lr
         bSeB7/FLVEkSeiWGS5IKNogO5NxHpDUCxhzGe52VR/WXuxrLruzfB10nVLJAZTT7CsNS
         P9sR11ZbDpjedlTNMvqIxzW5/28XwVjyeTl4IX6AndCwArMxY//oi6+lzKA1p5UWjRiJ
         shOkF9YN++jLAVMM5W2AsQEFyp1LTM+XS0nnQRhOpAf2nqNbTf7wN2tVVaK/buL4CqoL
         RjkQ==
X-Forwarded-Encrypted: i=1; AHgh+RrrDvoSiF1mUgAmm7tswlBiQ6vSC4cv7t0f0KYLUPTPMs9hvcew3qG4Ie572JOWtzl2gtyIRWz8zR66@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8yHBYqoL7xsFk3JuCBDrLKzi5I8DUqD3AHqEFHML7LCNhvh6C
	SFdJxhjekHOiGFFlDuO5wJOwfBgX2xNi191GpbMQi5pduuUNwxzisOr3
X-Gm-Gg: AfdE7cmNN4SGuz/uZAknYzhLsp7k6JMYrbtir3aY4dRw+9p3p1O79/P2PPclkd1VxgJ
	WkUfEIzyRcV1R/6uHYZb2dLpu+vMhl2RQGA1yu3wedLT5PoFJJfNmVUOCL3dZ2ga4jVOm+W+Ilc
	xClPnjFg8BFaL1qiV8f3F5Lemk0RKGLiVWOz0K5zgamSkTweLdVqC9ZHkvw56SEGSYSDET0ABcd
	uvuBtcVOx7+Nfue6mBtllSKQnCEYl+DIfjgC7oEh5QVJxNhHOC9ajOWpF/U4aKcT11TrzlZeLjs
	GQeYTTZp58RFZZ4+ofvrcJTUPRgOGZcJx6G2u9mnPT+3D8Bo8bqMfz8Lf0ao35BWeNU+8YcyooC
	l5uvTzOc+aNyb7VCfzY6STCs5S87mbrD+ck3TsrAbeJC4idBP1HtRXpPIss82dCC2qJjJcJ2hkc
	aRHIutgaxJm84hgtVbIxqqddjtxu+ZlMZP++KR1seiC0GhnNI=
X-Received: by 2002:a05:600c:3b10:b0:495:4aff:5fce with SMTP id 5b1f17b1804b1-4954aff609amr121711955e9.32.1784495622909;
        Sun, 19 Jul 2026 14:13:42 -0700 (PDT)
Received: from localhost.localdomain ([2a0d:3344:2841:7708:a101:2b8a:f76:a00f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49549a3e2a9sm224108815e9.4.2026.07.19.14.13.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 14:13:42 -0700 (PDT)
From: =?UTF-8?q?Juan=20Manuel=20L=C3=B3pez=20Carrillo?= <juanmanuellopezcarrillo@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Brian Masney <bmasney@redhat.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-clk@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Juan=20Manuel=20L=C3=B3pez=20Carrillo?= <juanmanuellopezcarrillo@gmail.com>
Subject: [PATCH v1 0/4] clk: sunxi-ng: fix the A523/T527 GPU clock model, enable GPU DVFS
Date: Sun, 19 Jul 2026 23:13:15 +0200
Message-ID: <20260719211319.982285-1-juanmanuellopezcarrillo@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This series follows up on the discussion in [1], where Chen-Yu pointed
out that the A523/T527 GPU mod clock is not a standard divider but a
fractional one: GPU_CLK = Clock Source * ((16-M)/16), with M 0-15.

I checked this against the T527 user manual (v0.92, section 2.7.6.58,
"FACTOR_M: mask M cycles at 16 cycles") and verified it on hardware:
with the current linear model, forcing each OPP on an Orange Pi 4A and
measuring the real GPU frequency with the Mali cycle counter gives

	OPP request	programmed	measured
	150 MHz		600M, M=3	~487 MHz
	200 MHz		800M, M=3	 648 MHz
	300 MHz		600M, M=1	 560 MHz
	400 MHz		800M, M=1	 749 MHz
	600 MHz		600M, M=0	 599 MHz

so every OPP below 600 MHz silently overclocks, up to 25% above the
vendor ceiling, and thermal throttling to "400 MHz" actually raises
the GPU frequency.

Patch 1 adds a small ccu type implementing the cycle-masking
semantics.  Patch 2 switches the A523 GPU clock to it, drops
pll-periph0-800M from the selectable parents (the vendor BSP removed
it citing GPU job faults) and drops CLK_SET_RATE_PARENT (pll-gpu loses
its CLK_SET_RATE_GATE protection once the GPU runs from a periph
output).  Patch 3 registers the existing sunxi-ng mux notifier so the
GPU is parked on pll-periph0-600M while pll-gpu changes rate, as
Chen-Yu suggested in the same thread.  Patch 4 adds the BSP operating
points to the Orange Pi 4A DT, which enables panfrost devfreq.

With the series applied the same cycle-counter measurement reads
149/199/300/399/597 MHz for the five OPPs, all from the intended
parents, and devfreq scaling plus thermal throttling (emulated
temperature) behave correctly under load.

The higher speed-bin operating points of the BSP (648-792 MHz, gated
by a SID efuse bin, running from pll-gpu) are left for a follow-up.

[1] https://lore.kernel.org/linux-sunxi/20260719153122.892013-1-juanmanuellopezcarrillo@gmail.com/

Juan Manuel López Carrillo (4):
  clk: sunxi-ng: add cycle-masking divider (maskdiv) clock type
  clk: sunxi-ng: sun55i-a523: GPU clock divider is fractional, not
    linear
  clk: sunxi-ng: sun55i-a523: reparent GPU while pll-gpu changes rate
  arm64: dts: allwinner: t527-orangepi-4a: add GPU OPP table

 .../dts/allwinner/sun55i-t527-orangepi-4a.dts |  30 +++
 drivers/clk/sunxi-ng/Makefile                 |   1 +
 drivers/clk/sunxi-ng/ccu-sun55i-a523.c        |  47 ++++-
 drivers/clk/sunxi-ng/ccu_maskdiv.c            | 199 ++++++++++++++++++
 drivers/clk/sunxi-ng/ccu_maskdiv.h            |  71 +++++++
 5 files changed, 342 insertions(+), 6 deletions(-)
 create mode 100644 drivers/clk/sunxi-ng/ccu_maskdiv.c
 create mode 100644 drivers/clk/sunxi-ng/ccu_maskdiv.h

-- 
2.47.3

