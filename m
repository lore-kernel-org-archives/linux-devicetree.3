Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793953836;
	b=1kAwqZpaG8aHYuqy0S1iVYcU5daSJSL8hIE6rZkAchwAHEwPVQMFCIPRSJEn8eDfLHlp
	 MotDYKj1JANShVXOX59XJBd+5gljEzPt+WF3GSExxnLXPiKO/p01kUevQh01dSW7Vxk/n
	 FDBr5+vfU/s3eBNbNnz/IN1nbBpGYWDrLCJhN/KzM/lYc8SkUX6zof30Qj96Tpaal0bIF
	 DFHYT2aaN5Q4/mjBjYIUREldRrx18NyEVKUfyLuSakpK4kh7o/1PLP1Bsutt2SQeqhG5e
	 TebhlHuJepty+MNDsjuiGBJbsnNjzf33t0FAkuK/B7gEvslwONhKW0bE0bkmN82kv9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793953836;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=bBvAlTqUUTVWwtpovytt9429b4fXz6tD1BdJt6T8kRk=;
	b=qyOuSU6AZFe9L4c4q0pp1kaA1dK09tauT7bcgKnOwNj6MCbsttOtbbR0EngfPkLaEVbB
	 swOtfb5pFwqrskDF9NAHZzyX5qetuCYEMW3xZjKBlN1ur8BZF1Lcg1c8bKJZ+/z9hn1dL
	 dkYyhL9QRz+2YiHREuLPNQ8ElxxC+4US8Mp3A/B1U1thEoTKfWkdz1SK3bbZYwYHTBwU3
	 dCIOyoRweHjSWSUtApm4A9AKPIora9nZZnxQam94S1WEJBx8kcDc6xF3povtfUweFdMBq
	 Js8yDvs4yF5QDuvgNveyat4unvHrW2M2GXnUjD7nIoZSuTNBv+TGZQr1jrSssma0A+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=KOpLB47E;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10B37606D803
	for <devicetree@vger.kernel.org>; Fri,  6 Nov 2026 08:30:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 10B37606D803
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=KOpLB47E
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-49d05d51553so1792075e9.2
        for <devicetree@vger.kernel.org>; Fri, 06 Nov 2026 00:30:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793953833; x=1794558633; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=bBvAlTqUUTVWwtpovytt9429b4fXz6tD1BdJt6T8kRk=;
        b=KOpLB47Ed4bk+JKdsP7yqQLxUdlyrMVxvYibBOjeWaQanhi64o4SrNArejPjmdbfPb
         CtKq7OzYt9cdEl2TWRiaJvIzqSplkLYUu4gjXp0NF7LrIkcd+kP6/bZjNgSd9s94sj6+
         2vARPHzD7YWIO75zzdXzZStAR0ld+MhW58I6OxxxYI6O9hBppbLITOMiTYE9S+dcNfLb
         wNUvKeAX9ioMloEuyFyo6g8P97C/ozKkdv9WP4b1Oq/O4Z0FDA0dC42b3JTcUW1ZTjwN
         TSBygiPJMElMxgnaVcJ0lPcLM+UcLH5uVyr88bS2szahmOu85ZXCNunvq/UmxOD/exY0
         nY1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793953833; x=1794558633;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=bBvAlTqUUTVWwtpovytt9429b4fXz6tD1BdJt6T8kRk=;
        b=hOaN3FGvTfdPek+IDQODKq6/Ue5DzL2kzF0blJmqjQiz5hDetoikOwOg6/vOakhKH7
         hnzGXAvkfvE7cTXtYIVqcfaMjgutImEg8NhLedVQ2Fut+kLNg52C+jd5LFnLMB67MCnj
         E+i2faU3iE2Y6igYw7I120fmPE2iD/6sFdPgVt90OgwIbFOYWghUd832aSFQVdbJoHVD
         F0kLJ4zqQhmxbybo+bjomLRmCDdrWQbFAo6K4Fu+usKr9I3s89/xmpywIMsE62wJpRkh
         WgDKCgt46dowPch9GuZTzDgRG7cSH4gTCWzLte8dw6YtYsTMwDTf+3O0cpOhNbBjTO8M
         efcg==
X-Forwarded-Encrypted: i=1; AKwUvBwrCLH/Fr+VIa+dVnfQNLDl9Lg2qPqfj4WelOiBR5IX+EEpxqXChfLXMD+IZM2hxQhnRdbKkWwT9+un@vger.kernel.org
X-Gm-Message-State: APuU4Z/btGisgh1MTSUUeEnZGx6nc/cOpry+nlOO9Du+s4oMg7KoMgXA
	szTxGapHR/KcP87O7xIgFHfLM9W6ZfI+uQYWfHZtDv0zhQS1CVeiosZ8/usE7PI9ql8=
X-Gm-Gg: AYBFou02+zNbrI6n2AWyTGfmUB96zug+u+nBYxpaB+10MtyGm8cO09kzVEM1Ad+AT5R
	JN3MTTRxp1rKhJ7un/KWEGGIPTpXaPTsdUeI7j3ejEk4vdTNTRQ0dvXKxg4g+JAbN9gQgi74Q7U
	s3GxBm0zqrV2nPuovoYl6DjIfiLEOMrxfwDNs4+FzDCiFyVdry7R+o+z/YcDuC95k1zrk+vxmK2
	rvkvs815gu8hNLU0P8wADXe84YoN1PXbMb/PICqn4b3OLg77Cypd317U2kTL4bCDvgP4l6C+URQ
	sQLlCQVcKCNLvLDsDOrx8SQAlViOumCtMmpLa+avlSucS6BcweLCxNliCJ4dXLrrMmaCH4cf5QS
	ywxj35wWL0i3WsWVhcYWt8gOqnskrshyObA27uG4aMttpIq87KC5YlaVlirzv0ZvPt+Pg/kSE4I
	Z0X5QAYFl8PolVTpv83drU7D9sf38JpMpS3Y4fUxBgwLyKpYoi1qc7rLN7wgigC47FqMlH7UDDv
	fITneBUe4911RNzpSPlINQ7pIX2mih1kLrbLUNzf8nTwkT0uvq/xguJxd2VYaJpyPIxDyrifBL5
	9xtdXejq5EeInIQVl5la8ZziDFEju1pBGSxSZhWktaHfr48HZcjsaVK6YhJks0rVnSIGDNfvetD
	fxlzwVaRrH+faAzRbhYLXgSR9uxW/LawA8FXvQQHSi2ZPtIiqTSECpdbriRn5nQDRtEA=
X-Received: by 2002:a05:600d:8408:b0:4a2:526b:d410 with SMTP id 5b1f17b1804b1-4b6f7374730mr17693885e9.13.1793953832731;
        Fri, 06 Nov 2026 00:30:32 -0800 (PST)
Received: from macbook.homenet.telecomitalia.it (host-95-246-144-141.retail.telecomitalia.it. [95.246.144.141])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d8472969sm2366839f8f.58.2026.11.06.00.30.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 00:30:32 -0800 (PST)
From: Carlo Caione <ccaione@baylibre.com>
Subject: [PATCH 0/7] Add Amlogic S7 clock controllers
Date: Fri, 06 Nov 2026 09:30:23 +0100
Message-Id: <20261106-upstream-s7-clk-v1-0-7d501d62621f@baylibre.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDINYtLSguKUpNzNUtNtdNzsnWNU5LSjVLMzY2MzVKUQLqKihKTcusAJs
 YHQvhF5cmZaUml4CMgaooSi0sBVpVAlVWWwsAYXNdmIgAAAA=
X-Change-ID: 20261026-upstream-s7-clk-3fbe6f33652d
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Carlo Caione <ccaione@baylibre.com>
Cc: Jian Hu <jian.hu@amlogic.com>, Chuan Liu <chuan.liu@amlogic.com>, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.16.0

This series adds the clock controllers of the Amlogic S7 SoC family
(S905Y5, S805X3): the IDs of the clocks the firmware exposes over SCMI,
the PLL clock controller and the peripherals clock controller.

The peripherals controller is close to the S4 one. Two changes to the
common code come with the PLL controller: clk-pll handles PLLs without
a pre-divider and PLLs with an active-low reset, like the HDMI PLL.

The new clock headers are covered by MAINTAINERS once [1] is applied.

[1] https://lore.kernel.org/all/20261022-upstream-maintainers-clk-headers-v1-1-d09dd4db01d6@baylibre.com/

---
Carlo Caione (7):
      dt-bindings: clock: Add Amlogic S7 SCMI clock IDs
      clk: meson: pll: Support PLLs without a pre-divider
      clk: meson: pll: Support active-low resets
      dt-bindings: clock: Add Amlogic S7 PLL clock controller
      clk: amlogic: Add S7 PLL clock controller driver
      dt-bindings: clock: Add Amlogic S7 peripherals clock controller
      clk: amlogic: Add S7 peripherals clock controller driver

 .../clock/amlogic,s7-peripherals-clkc.yaml         |  126 ++
 .../bindings/clock/amlogic,s7-pll-clkc.yaml        |   73 +
 drivers/clk/meson/Kconfig                          |   30 +
 drivers/clk/meson/Makefile                         |    2 +
 drivers/clk/meson/clk-pll.c                        |   52 +-
 drivers/clk/meson/clk-pll.h                        |    1 +
 drivers/clk/meson/s7-peripherals.c                 | 2149 ++++++++++++++++++++
 drivers/clk/meson/s7-pll.c                         |  648 ++++++
 .../clock/amlogic,s7-peripherals-clkc.h            |  245 +++
 include/dt-bindings/clock/amlogic,s7-pll-clkc.h    |   42 +
 include/dt-bindings/clock/amlogic,s7-scmi-clkc.h   |   27 +
 11 files changed, 3380 insertions(+), 15 deletions(-)
---
base-commit: 363f97a1ce635b86be7fd263d56a040fbd87bdbb
change-id: 20261026-upstream-s7-clk-3fbe6f33652d

Best regards,
--  
Carlo Caione <ccaione@baylibre.com>

