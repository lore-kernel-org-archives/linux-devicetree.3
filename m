Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75DCD31F9BB
	for <devicetree@vger.kernel.org>; Sun, 10 May 2026 19:50:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778442603; cv=none; b=clyvaVXWHWqudjPiyyrsqNvzXGS1AU2N7XHhQ3Q3USv89gbfcdOFleYOua8IWA+hl173u4yecLzZyGCXXy3Plg4biqU7P1z0LX44Jowq6wODg/gDg1AT0U5bT7GyIwhNOZFg7CpYzYnzZBUqQ88pv+Jdqd9nKvqpnhKb087+Rgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778442603; c=relaxed/simple;
	bh=V/b4mSM6zH+p8TXIS1po/E/hYlP6zgqrks6hq9bn5Oo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TiiF5DdOSViBbkGqsbc4sPkEmf1IV5v51Qa8yUpwvenMGZ0ANDzgxDzVjo6ekgFmrz+l2TQIxZdn2PXyKJWPiyqoU682XoNUkGK3TSIBupaxKf6+7oPn+6RT8FWodCladjH0xHE1l2YYHJmpLcv/XURPfmd0A/y2zwZ0wL7Huv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pOR8ckvV; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pOR8ckvV"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2b9705613ddso21874745ad.1
        for <devicetree@vger.kernel.org>; Sun, 10 May 2026 12:50:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778442601; x=1779047401; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dP3fG7GEDYkhdiRzY6vd4dPBz6B4/zruI0cK+ySaCJg=;
        b=pOR8ckvV80VgzFPlHJQ9rIhoGe+viGq5nj/rviRtpJK8nA5BJiScmtEwzkRaDrX6hN
         tGmn4szqhAAIeFWNF6h3uAmnHQ3qvYW6i5Gn3qf5m3WR4M3Rt5XBMeUA/Dz6WPIamd9V
         UxX+z53K3hndk90eVyBJoaEU8UhdHoRWGpVtmhdjY6WldJjd4WhX2hlrwCArMf6BoS5a
         GdEhfY0mR/S0jxTh82QKl7HrvVsSLwwisn9mgCp2j9xuaVuey+Phy7H1QlKTenOyaF12
         WIE7ooYj+EFkJxPBDu1OpspuBu3EzBUbthLQ460abCRYnjn89arK9lgdpRHuzEMhlPoC
         Boqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778442601; x=1779047401;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dP3fG7GEDYkhdiRzY6vd4dPBz6B4/zruI0cK+ySaCJg=;
        b=dTDf5X50Xp6TRuhr3BjxhoFrV377Pf9Kuz8rzjhTtqbfSBJU5zp40FwSkK8Txdulo2
         5z9qbFKiXqELjHmsl2I8Emq1DKhPwNxHdWMd8uO08ao8YrEc0LajPOtN1bmQyO82hRiM
         6IljlatpvcHaSWIQIDWE5AXiIqtvP3lD3TqDAdIMGxyMniBqV3tVu0zjYgTPk2ryY/1a
         OY5KHuJ8StfoTTzYLfQzKE5AB2e3gxiavPE9RGdWenGEvRexA49/GZ8U6arn9lbnRGlb
         J5yLX+AP9Yr1oHiLIecTxVSbayZJQJjozBzpiK+vpjmFvSdd4K1qaQHtHw5DWDomNXqI
         8/MQ==
X-Forwarded-Encrypted: i=1; AFNElJ+k+yzWaSV3QNKQkK4Q5JLJSjpZvP30uyhCT27G6mG8BFJtAmQ+PUQ+vPloGHYUiD2I/kfjxFcB27H0@vger.kernel.org
X-Gm-Message-State: AOJu0YyWPhHQboaRovw39ReNLphDdbQ+CgO0O9CryPvzeKOExb5Lw709
	kaZVMKoTmxE3DKLc9cWjZDIgoclhDPmLgC0KdQPNBFQ/N/HoVwwJeLUA
X-Gm-Gg: Acq92OGOsLvVRX16PaRinp+PKKfH+AQ3hbg8Bw4KmgjjiK2BNcn+dv4Kbiu2YsLZ8Uz
	8xWsvrfO/6iLudjZbwhAaNXXmXYsGF5A0A04SIHzmmXPiBkKfx1nq37aY48kJu8KzXn8XGPlu/j
	e0qgnmySV/pSmn52uc9XnriYBWs9SwaQRBpKepwToi2AzRmdSaQSxi2nqp+huAmvgPISpRzxZU5
	zxulEsAvV8wziJ72LlQ7nWDlD5WHylzIeX3vaiJH/k8n2ez9j7Sg/k5QrhxkhUZi7N+iQ6IQ28H
	ihZR1CsvTUawTzKv/7VB1EFzIeHgMJcUE0npdRTY2XYrvB/H1f0531YloQ7pbhOKbIPdRetCPk5
	1pZ4oO7T9c+DB3Gy8GyJUfPBIS+cc6gDcvifr63x8aisVOP/FvhFOvjMjkGq1bN3AOaqW7FPuRH
	HbV07FkBHIbEDAK5PLy5aPUuOfLwEvKHwPS7SpYVSYMjwhNzzrm8FK6xeYRoL2Ca4avBaSNPnXz
	coC1kqANF7ggaUEgut5nVTubtnij8JgdAjK9h/alG9OAXi9HMdjIMZVT3UQ
X-Received: by 2002:a17:903:1b10:b0:2b9:f55e:1c1b with SMTP id d9443c01a7336-2ba78f50707mr209647015ad.5.1778442600658;
        Sun, 10 May 2026 12:50:00 -0700 (PDT)
Received: from lord-daniel-VivoBook-ASUSLaptop-K3502ZA-S3502ZA.www.tendawifi.com ([14.139.108.62])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1e358b2sm77065095ad.54.2026.05.10.12.49.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 12:49:59 -0700 (PDT)
From: Piyush Patle <piyushpatle228@gmail.com>
To: ak@it-klinger.de,
	jic23@kernel.org
Cc: andriy.shevchenko@intel.com,
	dlechner@baylibre.com,
	nuno.sa@analog.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 00/11] iio: adc: hx711: add HX710B support
Date: Mon, 11 May 2026 01:19:22 +0530
Message-ID: <20260510194947.31997-1-piyushpatle228@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for the AVIA HX710B ADC, a HX711-compatible converter with
the same GPIO interface but a different channel-selection model and a
fixed gain of 128.

Compared to v6, this series folds in the remaining review feedback:

- patch 02: drop the incorrect "No functional change" and the forward
  reference to HX710B from the VSUP commit message (Krzysztof Kozlowski)
- patch 03: drop the incorrect "No functional change" from the RATE GPIO
  commit message (Krzysztof Kozlowski)
- patch 05: remove trailing inner commas from the struct initializers
  (Andy Shevchenko); do not carry the stray trailing-newline removal
- patch 06: add Reviewed-by from Andy Shevchenko
- patch 08: remove the extra blank lines added between the split
  declarations and their first use in hx711_read() and hx711_reset()
  (Andy Shevchenko, Jonathan Cameron)
- patch 09: move HX711_DATA_BITS above the "gain to pulse and scale
  conversion" comment so the constant is not semantically grouped with
  the gain-to-pulse machinery (Andy Shevchenko)
- patch 10: add a blank line before the bare return 0 at the end of
  hx711_set_hx711_channel() (Jonathan Cameron)
- patch 11: remove the explicit u32 pad member from the triggered-buffer
  struct; aligned_s64 provides the necessary alignment on its own
  (Jonathan Cameron); add a comment explaining why the layout change does
  not break the existing HX711 ABI (Andy Shevchenko)

The DT binding and driver structure are unchanged from v6.

Tested on PocketBeagle2 with an HX710B breakout module. The device
probed successfully, all three channels returned stable raw readings,
and alternating reads confirmed channel switching between the
differential input and the DVDD-AVDD supply monitor path.

Build-tested with:
- make -s W=1 drivers/iio/adc/hx711.o
- make -s dt_binding_check \
  DT_SCHEMA_FILES=Documentation/devicetree/bindings/iio/adc/avia-hx711.yaml
- pahole -C hx711_chip_info drivers/iio/adc/hx711.o

Note: patch 08 produces a checkpatch warning ("Missing a blank line after
declarations") for the hx711_reset() change. This is intentional as both
Andy Shevchenko and Jonathan Cameron explicitly requested the blank line
be removed so the split declaration and its initializing assignment are
treated as a unit.

Piyush Patle (11):
  dt-bindings: iio: adc: hx711: clean up existing binding text
  dt-bindings: iio: adc: hx711: add VSUP supply property
  dt-bindings: iio: adc: hx711: add RATE GPIO property
  dt-bindings: iio: adc: hx711: add HX710B support
  iio: adc: hx711: move scale computation to per-device storage
  iio: adc: hx711: introduce hx711_chip_info structure
  iio: adc: hx711: pass trailing pulse count into hx711_read
  iio: adc: hx711: split variable assignments in hx711_read and
    hx711_reset
  iio: adc: hx711: localize loop iterators in hx711_read
  iio: adc: hx711: pass iio_chan_spec to hx711_reset_read
  iio: adc: hx711: add support for HX710B

 .../bindings/iio/adc/avia-hx711.yaml          |  77 ++++-
 drivers/iio/adc/Kconfig                       |   8 +-
 drivers/iio/adc/hx711.c                       | 304 ++++++++++++++----
 3 files changed, 314 insertions(+), 75 deletions(-)

-- 
2.43.0

