Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 200C63B634C
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 16:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784909232; cv=none; b=G0BJtcR/4Ux32h99X6yfP/cnTJDuw8C7Pr5Zwxu4uI2chhzfJ4DL5wSSUe2ai/SWtzhU4OGklb25Pi4iljNBG04SMmMXsmY/cQOgX0m4Qq27tHz582OZaGNj3aSAlQcMXFmliP9EMAi/4iEhaLvm7nhWlWIZSj5/Dt2wmNcky7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784909232; c=relaxed/simple;
	bh=i+oWKZOb/p/8kF51VJZLbmBSUaMxGA1MMQ4mIXAG6Es=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=RiFt7H94XoNORNPyUFwF+roWe0wlr4nr6x0Wy+cboqQ5uZV74xiY96+9avvOPkmCXYSU7fdYZE9ubfgMt2leA/bFa9a8iGXGpWjrzNTImsoKX0Fs1CDUqQpCPkElwfjChu1y56aJWBcaOmhcc0noCpm9C7dyM96zPk+Pk7xICys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=jli0MbXZ; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="jli0MbXZ"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-495590dde14so7576475e9.0
        for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 09:07:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784909228; x=1785514028; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Nhf9VFdcJj67d9mnRhCsj+1NVc5VUfS8waKbVdijXcw=;
        b=jli0MbXZfPvgv+B9kQMu0bX97NCWZFcO4kLNJ3dPyURiWSffP3ywksuZHOitI06IPB
         LCKEIltQBwujGdsQGeP695YsQ9yGxLDZX+A+3ZfLmgtitJwS+h0tiBCgwM2nH6bwnDxL
         Iv2VT5MZPCGpR7Tz3oOfl/N2NXZeboPPvAH0ZY6PYsku3lZoCfni1IkteN9LEEaE+Xbe
         PgwVeKrRr86/8T68N9hKVDnPHILJqltA4YPFjPCITwawHKHUF4DHWkE0seGfjER7isjI
         MYY7c1riSOAQsL0nmc9tOiwv4wqFFR5LoW5g6/jduQ+nOONz17PwgfycDwxTB0s6M3jo
         bnpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784909228; x=1785514028;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Nhf9VFdcJj67d9mnRhCsj+1NVc5VUfS8waKbVdijXcw=;
        b=QYsr44GV9gXWy059MkEX4PrT038SaVSZpUWsoLwuz7O3vQ9uURulLU4qCzpU0FG7Dr
         e8B/S1dMQp8LYhaLKmb+Gv9YD1bBAkFm0T9K3FuP3DUCs8A5urhSgP/e0sTMlx9QvZTd
         cvDYBd+AzcDlOc7wxeObC812kCo+4tQPoiBm+bLV3FpoiusC4ifYdtl/o12HOmO7Uu0a
         qmRrp1ZPeUmPF/uahcuTS1wUnPfnFnV7vmRyrblCaPyXxzsOn2X1Cc/5v/96pklMXYcg
         c0ZhjzJ+HEpWx0W6PDJftHoHNmgHNGZy5619JRdz9XRKnaknzEjklw93tNuI6TBm+1RT
         CX5w==
X-Forwarded-Encrypted: i=1; AHgh+RroggymWc4PX88iP/NyJe9SZFPbhB44GBo/ZUsBot5ws9MUWEixLuwUkvmrR0uz5IVMvWa6/R+CsNxf@vger.kernel.org
X-Gm-Message-State: AOJu0YysHvqX99LXcJFFpzaNVWcPJx3LuxS5hl7p2pekF93dQH5aj84T
	gvBci6WprJ/QWB9JTXnqYPQ1HyJk8dAjwdhPyNxZW/16Uuxai5miSALWffPga8SYn68=
X-Gm-Gg: AR+sD13c+nOiJtwTQwGilqVHtlB6M6uHcTHpCO7scdSH5oS7F4Yk7AJ8ahBhbFfZe5g
	W0HvBhu7Fu/eko+hNfiymSIzWSMogP7/4pni8NRgNe2JqDcmJlhgpBGFT7BOMmH5Sr3589QYy0/
	ZrxNL86RFQ0fJmcK1rA+Fw6/g4GAY13RcSRfE0K5crsQpSspLQrHu/ftLyritiVC5AZ/LuuU+S0
	h0Dv4SMu1/xC/2Dwtj4SinyqXToCCTzIL4tyM30IH9HhIVR6JRiMDBa+YnW6EmnWhU3rU8Fef0+
	9Q1VOYzs+BC7ySGJUWpIGPA9I2HoPB3x/IRnppQhRgf/LVTIkpTNECIRieXBZDEiVftvt0bHkwL
	S2ghNfoAzNcujE9cyVCOVAKs3N8F1BI8vf1/H9CaQaOtM9W792jm4Dpb4WnMxmTM84p5gbt2fPS
	gf
X-Received: by 2002:a05:600c:47c4:b0:493:e983:806e with SMTP id 5b1f17b1804b1-49573cb963dmr58020255e9.3.1784909228253;
        Fri, 24 Jul 2026 09:07:08 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:cd72:3055:a9af:4365])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-496b487a3e5sm734285e9.14.2026.07.24.09.07.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 09:07:07 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Xianwei Zhao <xianwei.zhao@amlogic.com>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Brian Masney <bmasney@redhat.com>, Jian Hu <jian.hu@amlogic.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Conor Dooley <conor.dooley@microchip.com>
In-Reply-To: <20260701-a9_peripherals-v6-0-9630f39879e5@amlogic.com>
References: <20260701-a9_peripherals-v6-0-9630f39879e5@amlogic.com>
Subject: Re: [PATCH v6 0/2] clk: amlogic: Add A9 peripherals clock
 controller
Message-Id: <178490922597.2801722.3885834711328764674.b4-ty@b4>
Date: Fri, 24 Jul 2026 18:07:05 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

Applied to clk-meson (clk-meson-next), thanks!

[1/2] dt-bindings: clock: Add Amlogic A9 peripherals clock controller
      https://github.com/BayLibre/clk-meson/commit/33972977d632
[2/2] clk: amlogic: Add A9 peripherals clock controller driver
      https://github.com/BayLibre/clk-meson/commit/f905fc7b7a81

Best regards,
--
Jerome

