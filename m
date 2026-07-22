Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F56533ADA7
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 21:01:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784754077; cv=none; b=gbhuJ1BUYWJyy00C9FvQPIFf8dwvZ3hp3SWcpE35wN8wNAqs3OAM9IiBPINCdbBwcqZkvJ2Fxl3T3OJiLoaCny95tRMoezBW/2GGJ5lOoWsjcsMwUUVqQuqScRQI6TZgV34AQCcDS9Lp6NiI2fxt09JwNd15AJFIkD8r276dOQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784754077; c=relaxed/simple;
	bh=t46Babqj/B+1dHlW5fmgPaxIjdyCrT3Rb/Vc6H+uGPI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cd1uSuc81yljSWH82IFQVRi1h9mEvyClmiJJeNyUgvKAUk/zamNubYSijxSPSO4OkJQ/qOm8UNDP8tcRhd3ho47w8Z61DAeTNNFNwacYu2DbFa4uUW/GgqEIu3VX9QLYYIlPD9KYjset5bqYusxOmWNLGQd3/01M741LDIa+ymM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cdz6ImZJ; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cdz6ImZJ"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-47de008b020so4959147f8f.1
        for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 14:01:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784754074; x=1785358874; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=q/5F0oA5i8F/L34a9owjNm1QgCmiW32I4DyCKgmPKrs=;
        b=Cdz6ImZJOjMEYP3+fmwoevVV0Kh5TmHdUQTcONkQqFjz7+HT1/gCDP93QdAa/DMdJq
         ++ZGAmuqUEILjdUjUHhuQpopaH6PbIAPY+TfUj91fSE017PamuZZhnvzbTW7a6J/AN5Q
         UTfzt9mzYSoYAzJxpcOYjI3KgYQSaZPQ1hlnl57ZUDelhttXhdVOLp6rQlXsdS8EQ65m
         sSAliQ0vFbUwXgZxOpso0lMknwPXWmkWkW9p2MUukiaQ3jwHfp9unpSOM0aqnPldvjfo
         VmNSxzCKIH0pl4CeagTly88dCdz5Jj+1X+mIklGoFd16DcZmOA4/u2Hn5pFMuCCqKgkM
         nkvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784754074; x=1785358874;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q/5F0oA5i8F/L34a9owjNm1QgCmiW32I4DyCKgmPKrs=;
        b=qeRxAs1AF0xgmGHmqI4TpTPM7u5QOfo2m0C+xh/v+8gsl4bQyOm9s53CkrVM1YbzeQ
         gtbOVXe+OUh7ep0MbOs5tY722NXRKQ00FrFnU07r1+hBJKJE2QHq3X/r+Hgj4edy8Q4U
         Qe5EI9Aq6hcH2ZuXtx1y//e2o1FQANjg5F+OXQdVaNc1wGpnbuRs5q0n451y+sVBvLRe
         1/P8fgveCTXnXKFN4y7hK34Qfx60mvGPehQqflnMJQAT0h5FdaEsK/cQky6GpyvRZ0OH
         HrBXit5O4Kr9bJxQkWGR6ASJG1K8+qBfDRlMQOB7nWXa0/YNtaoQBGavi/L6r9rZgGew
         F2dA==
X-Forwarded-Encrypted: i=1; AHgh+Rpn6tn+DXfaZH9zFI6IheUnsoi59pZEYQnUx4ujFpSUjLGGYlAhLK/af8rH7i7LrE88n804KzuNaV9j@vger.kernel.org
X-Gm-Message-State: AOJu0YxUd8f36XomTQSiLG5TI2ovfCgj5sHySLOj/kTT8MRtvEm/toQO
	VbZgw7tBPWZxAioNKdUtV48Ho8IYkWyd2nzHpEt1fCrvP00i2SuObbwP
X-Gm-Gg: AR+sD135Yi13lPUn5bl6WXPWds1vKu31NSnMe9PazsLEE0wstaRCkToeWZCNhtKaNor
	hKEmI0O84fr3H9X8sg6WXf8bp0haKtWFXAKb98FaUmmLWN6WKGPOyQT6zZ6iz1Pp/qdBAY2LgUP
	fzVBBzpMe6BHe8COMCDSlNtKtUaK15KSl34CRaPbGUmShCeeXslvGHef+ENX4aLLzRx7djS5b1O
	eKkX/fYYCQF4ZDnclc5tcWJMNPuHJeIyV683jG2QQKu9HAYf1UJ+a1M5VixKlb+KeL1pdJlPWVA
	cm0AIWGFHZqpSjJgXj4gtbi+2IW0b0ANT+pALFPbNfDsQuZP7CwShQiObaU0GoyfUh+P5j/4sNz
	Q5pjAC2rRWX5Raswr6qcav5AdkjGl3zPKYRvxWzv5TKK4FrKvyeOZ4WT+p970xN4xFHLHCyHnaF
	avmWTeyDAHtOtFvtNOcV/8iyc+rOuXRMt6SgE=
X-Received: by 2002:a05:6000:42ca:b0:45a:5392:3a19 with SMTP id ffacd0b85a97d-47f840c94dcmr5450029f8f.16.1784754074458;
        Wed, 22 Jul 2026 14:01:14 -0700 (PDT)
Received: from coolemuke.fritz.box ([2a00:6020:b320:1a00:c256:1463:a40b:d8c6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85c63678sm8610812f8f.29.2026.07.22.14.01.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 14:01:13 -0700 (PDT)
From: "=?UTF-8?q?S=C3=B6ren=20Hantel?=" <fugininsane@gmail.com>
X-Google-Original-From: =?UTF-8?q?S=C3=B6ren=20Hantel?= <fugininsane@googlemail.com>
To: linux-pm@vger.kernel.org
Cc: Vasily Khoruzhick <anarsoul@gmail.com>,
	Yangtao Li <tiny.windzz@gmail.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Rossak <embed3d@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	FuginInsanE <FuginInsanE@googlemail.com>
Subject: [PATCH v2 0/3] thermal/drivers/sun8i: Add support for the Allwinner A80 thermal sensor
Date: Wed, 22 Jul 2026 23:00:43 +0200
Message-ID: <20260722210046.2932498-1-fugininsane@googlemail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260722203341.2917852-1-fugininsane@googlemail.com>
References: <20260722203341.2917852-1-fugininsane@googlemail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: FuginInsanE <FuginInsanE@googlemail.com>

This series adds support for the thermal sensor of the Allwinner A80
(sun9i), the last SoC of the family with an in-tree DT but no THS
support.

The A80 THS is an early relative of the A83T/H3-era sensor generation:
same register semantics, but the block, bus gate, module clock and
reset line are shared with the GPADC, the THS registers start at
offset 0x40, and there are four sensors (big cluster, DRAM, GPU,
little cluster).

Philipp Rossak posted a driver for this hardware back in 2018 as part
of a larger THS rework which never landed for the A80; Armbian has
been carrying his DT patches ever since. This series takes the
mainline sun8i_thermal driver as the base instead: patch 2 adds a
chip description derived from the vendor BSP (register init values,
protection thresholds and the temperature formula), and patch 3
revives Philipp's DT patch with a fixed interrupt number (SPI 115 as
in the vendor BSP - verified on hardware, the original SPI 31 never
fires) and critical trip points.

The A80 SID is not yet supported by the sunxi nvmem driver, so
calibration data is unavailable for now and the driver falls back to
defaults, which produce plausible values on real hardware.

Tested on a Cubietech Cubieboard4: all four zones report
load-reactive temperatures (idle ~40 degC, ~54 degC under sustained
full load) tracking the BSP formula across the range we could
provoke.

Changes in v2:
- Guard the calibrate callback invocation in sun8i_ths_calibrate()
  against chips without a calibrate op (would have oopsed if a
  calibration nvmem cell were ever added for the A80)
- Do not enable the alarm interrupt: being level triggered it would
  retrigger at conversion rate for as long as an over-temperature
  condition persists; only the emergency shutdown interrupt remains
  enabled
- Note: the unconditional IRQ_HANDLED in the existing interrupt
  handler predates this series and is left untouched here

Philipp Rossak (1):
  ARM: dts: sun9i-a80: Add thermal sensor and thermal zones

Sören Hantel (2):
  dt-bindings: thermal: sun8i: Add binding for the A80 THS controller
  thermal/drivers/sun8i: Add support for the A80 THS

 .../thermal/allwinner,sun8i-a83t-ths.yaml     |  1 +
 arch/arm/boot/dts/allwinner/sun9i-a80.dtsi    | 68 +++++++++++++
 drivers/thermal/sun8i_thermal.c               | 98 ++++++++++++++++++-
 3 files changed, 166 insertions(+), 1 deletion(-)

-- 
2.43.0

