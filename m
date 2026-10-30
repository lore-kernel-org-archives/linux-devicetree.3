Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793330116;
	b=JuU5yoEdgvT5D4Zkg2RUornfXsDXeOz+Nw9kyZJxIrgwhJqPk34PKICiCXBRMxs/VAwI
	 33tRXU/m3OFK9Kx/lAZilWD+chEHH93MdHKOh8G6BqemWTPMCDTsFivKGTi91nNB3gbLn
	 K2cjla1bxmbDcGHMaTUW1AcSa6Pn8bUTtOosvN0io0Ed2OpPCEXPTrYOgv/L2oHRj6DUy
	 D0f/AYiaseXzxbuIVpAhtjY0iWeMtcUykwIYXOAWL0CK3q8DoI2cf5XqgmGwv8v2Ep1nn
	 QjO9it1pSy4VlAPb3SvLKVdTj9j+aVlBxYHbd5mDkIzmXuYNxDaBPK1vUE8E14+U6zA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793330116;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=AVQv90cVLZ+qJuF4mQ4kF8CxT7gJb59j0c9vMsRIsuI=;
	b=Sx3yvoxR6TPOg7WTtzep8Pebwj4S49TWGnwPXjuaNVPE8BnxnOLNwZbpNoU94mGu0kfs
	 SB+r+9QVWNnT961RUgNfbSkuZ2yFQ4tm7dVGgj4DkSOvYnDOT+yuerMoE0VrQPtQ9VvwR
	 HqYQA2+wcsY6LQDHe3+gurky5g0yse3T4E+zhG2kwT3K1cq/2MjO6mBFdsmbeApEVO1Dw
	 cn+0qjy1X6++3JTYaKajmrEjFpqUXVFpk6GIN6xIPkpSWe3Cm2PvofnQCaMTy7fYSXCS8
	 uWbgXZmQ3R9MoCLiuD7bQ4y+g/wssTdT/NyJMThQejszp6FM3a40bkuZ4Q2gFiQaEKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="aaSqiqk/";
	arc=none smtp.remote-ip=209.85.216.48
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 593A7606A31A
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 03:15:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 593A7606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aaSqiqk/
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3ae1b34e0d2so761033a91.1
        for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 20:15:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793330116; x=1793934916; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AVQv90cVLZ+qJuF4mQ4kF8CxT7gJb59j0c9vMsRIsuI=;
        b=aaSqiqk/H1U8WEQGlWNsFZOX7aajgQfKPp5EL2DyY++KF2L86/T31dba7vVN0KR10U
         vv/GFiQEWjtG7RT/O/22jpjh1SOyfq5ljVTJ9dNEyc4BBf4IIKvTqVQaMOqZffXrmC+7
         MGQ7ZyZbdPgBafeq0sPoYsxHX7UER8ObJY4OvnEXCwkuq3zzLEC45mcLdRFgVwcqBWJK
         7ItWZtYxRqpwdGgUlpIhyiO1wXqPrISF7TmVtrxAQLRxewvRdX+s+udAPqo8POMS/PQC
         G4QFEcrRFME9cUHGKm0JmOa+gD294hUYUXV5GNRe2dD1ly5x3LtTmytlxRzTi8Cgqn4k
         jf/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793330116; x=1793934916;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AVQv90cVLZ+qJuF4mQ4kF8CxT7gJb59j0c9vMsRIsuI=;
        b=pxXi++CNSSBlLG475q7ZwfnibyxWvdN9hqbMMGXqvZFo2thJHuCP8OVQB7MYg9rufz
         FyXduU5/nTrKgBB8viWNW/dB0f3TOB6+xOR6IDV3b+jxZjJmFfInk2SIyJLj4WXw7UNY
         UBVlEo6f9mxkry4WvCAxo0Dyrq4tstP5yAvc4ZNFZsSyK+2VNmu621eB2iQOruLZ4BHA
         rQ//8yghhfT7eLvZKmIa+RSpRLB6oMYsBNC7ii6Q5Rpay5LOZKhsakaUgqsHuCamRKp+
         zSlaxr1v4ITFxCxBkx4psETaYyahSrdl1ySpaXHSHVZ9Oqnfy+rHW2fbD29RkeRLZCR+
         Nn1w==
X-Forwarded-Encrypted: i=1; AKwUvBwsJ2e2i/akff+jDTLfdbqs/K7IWvnW4lLVj7Py/AtxzGg1uQGcIF2l5oWaLy9BBv2RFYAMSNGbyvjv@vger.kernel.org
X-Gm-Message-State: AFq9FYIMB8PuH5fffc5qJfV0GuonGPm37HcXOfg6up+fyAZxly0CKUtF
	LgY16bJeP6Uz748yjHIzpjMkJeKhE9v3fQPB18txzyBXvDeKgP7MufaY
X-Gm-Gg: AYBFou1+bnbu+6xnOUxT/pBcfHpuUtWqZ4zuMWpzzvNbPomlRstRiRTvlH/gQhWqA7o
	BWnXvwL7JB+s4b2JeHQp00uAuYBWQj3hO4pTLepFahGxsVr7a+ziV3mmTedMwEsIoE154SHK5x4
	6W7LrBPgkDJQjpdmzFORFrjYCd+8tTzqp9XN8nJbXy3MJoWybjHhUBnVnmLhNkdsCZHrdsyRW3w
	VArihpRyWjWgtRHAMaEhAinCQAbsn9dMi6m1OYgvXl6IHi7Ove8TYSqd/SOEzm+lOb1ZjDWe2EI
	VGkc5Zyj4xRKAezF1Humo1LiZFPLyFWQa3Q9jRTWwSUIc/49ZAD45WJx9ftrY5Bz+3ykW9YhEZS
	X5zT1gIuDNCNTb9SltkBWWqGizmT/Gc0oJA1u3+dhf6OlWQN/29ZfCmvNkO4T+nDzZH6p1GYE3k
	bp9eYrLpC9dRIK088e6Jo3YZnMPTMUqUDhW3jVlHz+eXuzpqBVsUXqb6rz4ABNpY3vPxRWN8MbE
	qcTBGUx7EeTh86f2YUAA9N8rKPKMKnrmC3c7t8rRWc/vX1RylcPa7vDPLV+dIpGAaYrRvR4xaTA
	+IWCbOToNUm03nxVUGcWOjSjswCu9vsx82XbAVXVH85PVYpDLX3Gtx6F1g4jzI2ye6Ql/2/8gz2
	5+mOUEYm8I1t1XmU=
X-Received: by 2002:a17:90b:1845:b0:3ab:8288:b8ce with SMTP id 98e67ed59e1d1-3ae8974d028mr473136a91.24.1793330115599;
        Thu, 29 Oct 2026 20:15:15 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e2a703esm6590630a91.0.2026.10.29.20.15.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 20:15:15 -0700 (PDT)
From: Chi-Wen Weng <cwweng.linux@gmail.com>
To: jic23@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	cwweng@nuvoton.com,
	cwweng.linux@gmail.com
Subject: [PATCH v3 0/2] iio: adc: Add Nuvoton MA35D1 EADC support
Date: Fri, 30 Oct 2026 11:14:59 +0800
Message-Id: <20261030031501.130290-1-cwweng.linux@gmail.com>
X-Mailer: git-send-email 2.25.1
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Chi-Wen Weng <cwweng@nuvoton.com>

Add devicetree binding and IIO driver support for the Enhanced
Analog-to-Digital Converter (EADC) found on Nuvoton MA35D1 SoCs.

The MA35D1 EADC is a 12-bit ADC controller with eight external analog
inputs. It supports single-ended conversion and four fixed differential
input pairs: 0-4, 1-5, 2-6 and 3-7.

The controller provides four interrupt outputs, ADINT0 through ADINT3.
ADINT0 through ADINT2 are associated with the corresponding conversion
interrupt flags. ADINT3 is shared by the ADIF3 conversion interrupt and
the ADCMPF0 through ADCMPF3 result-compare interrupt sources.

The initial driver uses sample module 0 and ADINT0 for conversion
completion. It supports direct reads and externally triggered buffered
capture. The driver supports an optional external reference supply and
uses the internal 1.6 V reference when no external reference is
provided.

The binding describes the optional DMA request and all four hardware
interrupt outputs, including the result-compare sources sharing ADINT3.
The initial driver does not use DMA or result-compare functionality.

Changes in v3:
- Document all four ADINT0 through ADINT3 hardware interrupt outputs and
  add interrupt-names.
- Document ADINT3 as the shared conversion and result-compare interrupt
  output.
- Remove the redundant minItems/maxItems constraints from the fixed
  interrupts items list.
- Rework the channel binding for the fixed differential pairs and use
  single-channel for single-ended inputs.
- Add #io-channel-cells so the EADC can be referenced by DT IIO
  consumers, and define the cell as the logical channel index.
- Add firmware-node channel translation so sparse or reordered channel
  child nodes are mapped by their logical channel index.
- Restrict unsupported generic ADC channel properties including bipolar,
  common-mode-channel, settling-time-us and oversampling-ratio.
- Explicitly configure INTPOS for end-of-conversion interrupt
  generation.
- Explicitly configure the ADINT0 sample-module source and clear unused
  sample-module routing.
- Reset the EADC control circuits during hardware initialization and
  clear inherited ADC interrupt enables, result-compare interrupt
  enables and sample-module trigger sources.
- Add timeout recovery using the EADC control-circuit reset, followed by
  IRQ synchronization and stale status/completion cleanup.
- Use iio_push_to_buffers_with_ts() for triggered buffered capture.
- Avoid mixing cleanup guards with goto paths in the trigger handler.
- Add ARCH_MA35 || COMPILE_TEST and HAS_IOMEM Kconfig dependencies.
- Drop redundant linux/bitops.h and linux/mod_devicetable.h includes.
- Use direct regmap helpers, explicit REGCACHE_NONE and
  regmap_assign_bits() where appropriate.
- Use fixed-width register offsets and kernel time/unit helpers.
- Use size_add() for channel array allocation.
- Request ADINT0 by interrupt name.
- Improve system suspend and resume handling.
- Address review comments from Jonathan Cameron, Rob Herring,
  Andy Shevchenko, Uwe Kleine-König and automated review/testing.

Changes in v2:
- Reworked the driver to use regmap.
- Added optional external reference supply support and IIO scale
  reporting.
- Added optional reset handling.
- Added externally triggered buffered capture.
- Added signed differential conversion handling.
- Added fixed differential-pair validation.
- Added system sleep support.
- Added optional DMA properties to the binding.

Patch 1 adds the devicetree binding.
Patch 2 adds the IIO driver.

Chi-Wen Weng (2):
  dt-bindings: iio: adc: Add Nuvoton MA35D1 EADC
  iio: adc: Add Nuvoton MA35D1 EADC driver

 .../bindings/iio/adc/nuvoton,ma35d1-eadc.yaml | 175 ++++
 drivers/iio/adc/Kconfig                       |  14 +
 drivers/iio/adc/Makefile                      |   1 +
 drivers/iio/adc/ma35d1_eadc.c                 | 849 ++++++++++++++++++
 4 files changed, 1039 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/adc/nuvoton,ma35d1-eadc.yaml
 create mode 100644 drivers/iio/adc/ma35d1_eadc.c


base-commit: d89e1d186ec9271bf78e62771779e9fc03bf0fc3
-- 
2.25.1

