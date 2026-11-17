Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794942969;
	b=kYD6nD6/xF02vBaH0rbdW2FG3hC4dPY8kYllls25bUJKpGN6XDYOpGsGwcw0xVP7ijUn
	 bsBJ8R2CvBqqQ2zMg3saYyaP+s92mq/NRxQcj3HvGzjO/l/QVjKIQEzbrZ/WChIx4sUXJ
	 nzSBpGiU6NsK56iGK1yr73T+SKZfcvtuccAzaRGvI5GBTG2Ki/iUkt2RJMfeA9QAPNKh/
	 nd10HVf+r2OvI1waRsHZSFcniWeut7kNhXwscEZGACPT33VIhawmEpcROi+HsRcHQ050Y
	 T7gONsfQ1sOCwc9Twf+RwHgXi5ZZvarmvFbNwHptnLmeZW8RYCY7DiQmr7UJosKgAHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794942969;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=saTeE4vmtn0WPySBkxUfsYGBUMOtngMCE/Ho+pVY+9E=;
	b=pOIo5xOtMbmT4EWNBov9fhE4tXDH3guXjGfDWi/rPLjxCnIjUaWEq1+bUpXIPoV/kefq
	 1/w0BI7DSkYvahzjxfZumUG8IGQzJw/in9AtiGWc/neQ0E93h7jFJ6g33pWjt6qNEF8fF
	 322lzH4KCTdldkZIi9zLIqCoqraPf3mVer9IlleAQ4jFQU//8pWkM197qoqL2un597iNg
	 p62MmRaccL/pL13ZmIPygRQqaJAG9QNhXAPfyMT6rO2ZNx/V70nS42PPYaMyKDGBin4C5
	 Uu2nWpPHhSEIV93u2AuY39JoU492+436AosLYt4pY7btWNCi1z20ED9UF5Qf2/RMdFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=mz0pJHTw;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54D46606A32F
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 19:16:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 54D46606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=mz0pJHTw
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4bb61185057so1922305e9.1
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 11:16:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794942967; x=1795547767; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=saTeE4vmtn0WPySBkxUfsYGBUMOtngMCE/Ho+pVY+9E=;
        b=mz0pJHTw+7QpxzzAKLuXN6/+s2NFA3soOVmbRbVNrqy9Yj66hIqODj7kB2i0gD/Fjd
         iHhZPAIaVP7va9Du8/DCsHiUqAUUCwhCp6jI5UoBoPvJZoLHekheEgx2eaZ3HonuPAI3
         nm/B6dxOsR8RI9uwg3qZfol5spcmO6U0IIgTgDIc+tKJoN6hx7r/uN1nafOG3tmzR0PP
         UGmAKbm6lkptFPo8lYDQVR/DDO1IB0C8P1qoOpMNPCr2ld+kJWrW3qjbH3P9lXxq4cWh
         /C7ct7q39AQdLdz6GMaZvcRJyzAPt44Q3qSCdpiwVNl7i7ZrTMKOlJwfL4o6YpiRT/KX
         Vi5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794942967; x=1795547767;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=saTeE4vmtn0WPySBkxUfsYGBUMOtngMCE/Ho+pVY+9E=;
        b=eqcXyMzjgiW9L54ByA8UEJEU1bXGTnDNrGM3T3pqUlSdRoAoMsSwI0J1ENNimkv0g3
         XChIT5I8Oegq7Wzw8FYeGd9j6DOVBZkLFm/XYmr+uF8tcAxDim+OnUpIa6RmLWGLQvhj
         MzHhhBzryR1ZG8FMDVU3sTO3i2tgieYmtUUmA6aEXQ2VGlYHRF4BuN7D437Epv6Onk9k
         1u0y8Gwy+yQ19SBpBbtKcqfB2UgOZ0tYsBTWLaViu/LfZnV/T8oM9pz/+Nxe4mfBeTla
         b6cVU8FkXfGSlzQONgWMxOtqN1WaLEZDeoWN/6EKstnDoxgPAyznRhaH9icPtU3RiyeS
         bEEw==
X-Forwarded-Encrypted: i=1; AL+hErEmuWxY0qxQNQVwH5iLd97AV/+xi6xUK6ipxAWSGw5hEK6Lcbk/XX3HnmSsZqEv+5H8fGFLDWqSYK5I@vger.kernel.org
X-Gm-Message-State: APuU4Z8w7phoidLn+kacX/txqtycb6MifW0hIIjnLdj4z2Lw1xXmjYCF
	yzaJCwc7nzQ0omXsyH9nimlYFKp0DlDk7nlKlPR0iucZmyk3WGceif8Y+qzBFKyhO4KdVdM3JqN
	W2owne64=
X-Gm-Gg: AYBFou0hkGXfBpUinLcdyYzb9LCLjbr3G79pRzvsMx2NePQO/WjyAuQ64Yef3oPkpt9
	YLW/fUIXBZijEYzqtOAfvAulO/Wh9RLixrJDX94ZILnM+ly6M60ldto5I9J6nD66h1ZuuE7rK12
	xG8OdlCp8hp+aOpX1+wreCMbWc7g5orr+LsQDUUBls79atmgt5DJS8OhaEmaBEf2nNkLUFRghrf
	/CCFuUKr8R/lux3IQ8Ce6A+qkocfILOf/n6H575bG1sI4QGTQKXRwm94kaZ1Cb2PuF3qmx1Bo4H
	LhZWeHB0/GRezhLrRyChwvL6vSo3jjKH7S01/nd8MjftYUroTq6+SSb3mBAuPCq9tXKIgopTwy5
	Sevjy+mFXx9lVGl9Mvw1SzMOr5Naa032DQlHLTnTGwDF1AASyYkrbJWAtdDAbjyLyFFTMOS7ir/
	Q6E/jp+NzhlediixdYAFm870AWr5+023bx6hdoujgWmC7xxwhFOrOrDlGWzYvcZuHF5bkUAgeRG
	FxdDE0qgP9d7mFNZ85HPKx5F1VyI9UOFDnnglKcZTR+9+TMZ8GPJ5SLoHiz/4kDZZJWnG8X8oul
	AlWJ2uksDpl+xvW3FOg2CqfdsNJ9XAiHt0F8H5Tcu94JzTWMks1dijRT
X-Received: by 2002:a05:600c:8b8a:b0:4bb:52bd:a3c7 with SMTP id 5b1f17b1804b1-4bb7da2240amr3295515e9.6.1794942966666;
        Tue, 17 Nov 2026 11:16:06 -0800 (PST)
Received: from [127.0.1.1] (82-230-44-19.subs.proxad.net. [82.230.44.19])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb7d2b8032sm5658625e9.10.2026.11.17.11.16.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 11:16:06 -0800 (PST)
From: Alexandre Mergnat <amergnat@baylibre.com>
Subject: [PATCH 0/3] clk: mediatek: Model MT8196 PWM source selectors
Date: Tue, 17 Nov 2026 19:16:01 +0000
Message-Id: <20261117-mt8196-pwm-clk-v1-0-d8725bcea9f4@baylibre.com>
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
X-B4-Tracking: v=1; b=H4sIAPGn/GoC/y2Nyw7CIBQFf6VhLQkgD/FXTBc8LopKW4GqSdN/F
 63LSebMWVCBHKGgY7egDM9Y4jg0oLsOuYsZzoCjb4wYYZJSqnCqB6olnl4Ju/sNk0AFN4aAYgS
 10ZQhxPcveOo3LrO9gqvfyt/I8JjbU900ZE0B7MaUYj12QUoutdeaCLvXnjkmiaHCKy+95YIE7
 q1UjqJ+XT8P9MwYvgAAAA==
X-Change-ID: 20261117-mt8196-pwm-clk-0f154aa0e720
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wenst@chromium.org>, 
 Laura Nao <laura.nao@collabora.com>
Cc: Chris Chen <chris-qj.chen@mediatek.com>, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
 Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.16.0

On MT8196, a PWM channel can run at the wrong period: on the test
board, a 10 ms request on PWM1 gives a period of about 8 s. The
clock driver does not model the selector that picks the input of
each PWM channel clock, so the PWM driver can compute its counters
for the wrong rate.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
Alexandre Mergnat (2):
      clk: mediatek: clk-mtk: Add composite mux tables
      clk: mediatek: Add MT8196 PWM source muxes

Chris Chen (1):
      dt-bindings: clock: mediatek: Add MT8196 PWM muxes

 drivers/clk/mediatek/clk-mt8196-peri_ao.c         | 38 ++++++++++++++++++++---
 drivers/clk/mediatek/clk-mtk.c                    |  1 +
 drivers/clk/mediatek/clk-mtk.h                    | 16 ++++++++++
 include/dt-bindings/clock/mediatek,mt8196-clock.h |  5 +++
 4 files changed, 55 insertions(+), 5 deletions(-)
---
base-commit: f66469d9905b39d2c260a15d7d6db450f4db67c1
change-id: 20261117-mt8196-pwm-clk-0f154aa0e720

Best regards,
--  
Alexandre Mergnat <amergnat@baylibre.com>

