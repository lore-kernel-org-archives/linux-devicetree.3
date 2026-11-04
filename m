Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793783518;
	b=tp2NrxIJpBjoniCYK27XuZdMM+gd1ObgW1i+jKJcENBL31785rJmwQSQaNOUO3WSuo58
	 dUUe2NYnOF3jFREn6Ph+20jYJrT041gKJ59rkQqADYGOiEfGt1FTbTut86YBinvPi9fFZ
	 TioUrdHMDjHp8YH65quc+aFc0my8SybD2kKe9HHSlCokH0edSUTq6wyVfPQ7H3KPsxNOs
	 egkYTYMKAJhWWtoBqbtcDeS18nWPhsblMwtAMqIF7igHDdRO5lUlBZl08rf+YS0z7tttl
	 mmbDD1u1ArMOqUuF98H2/p6uUQlrYG5N7A5Rgr5RlXWRQMCSaVYnakUmfb88eONs39g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793783518;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=jhKXBgg1sGJn3Jt16h2wqToqL6AFAOLSOJl/Bs/EcRQ=;
	b=EY6NrhdbN8WTbIXLRxWEmltP4aOZw6M6EqDtVl084/9euJDAwgQQKqyGpJY9lW+UZP0u
	 /tc6MCpOerspp+td55mkrnLcGKIPXDkzQNVzDtgP4HT3S7n3R7vVkvFAm+wJco1nanEah
	 Yi9eYHbQJwg96BbNR8CTnTzzao7wbC05BU+OjedvHiCO39J3NEvOdM28F6ZkGC8YZjt0x
	 3yemHq/Pfr4ZhslBVJgnXGM4N6F+IQ23jkY75HZueGnfcyM3r75zxVAUFB2Fap11HamEX
	 gARB3YiC2yYSe2AqNGi44dFshKe8q4rUcw+ez6hKl84mIHThPEFdfddTIqmZp52h2sw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="V+MVO5/H";
	arc=none smtp.remote-ip=209.85.216.52
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7CEA606A333
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 09:11:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D7CEA606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=V+MVO5/H
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3ad787b79ffso366985a91.1
        for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 01:11:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793783517; x=1794388317; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jhKXBgg1sGJn3Jt16h2wqToqL6AFAOLSOJl/Bs/EcRQ=;
        b=V+MVO5/HOUMXtW+/hWueRfgYYSpNHXYFNqTWJ9hFYaAepDbyaIcWGBP0lq/7ECVyiz
         pu5ak9PTxbqAGtMCCGCkV4JYyp0LgHh6H2R9nAlPNTTMRRexRBzPpCwFy2cau+8uXLQN
         TWc4mS0s+LEXUJULMmh3PSj1vKBzFNch0PSuHxECSEMeHRYXAYj+RRi7Co+jurN/OYIG
         ofNcMpIQYtODaVmYwJiqI/8DxXzF/v3htZX9HjivxERIhYgRr/1lQqzMVk0phwNuPT57
         Wt4KTLx6AfKCvSr4ZJuRvscVA/B6s++LnOaOiL7sLuNLVSX6oGmu6m03ehWAz3OP8y8D
         Y4xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793783517; x=1794388317;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jhKXBgg1sGJn3Jt16h2wqToqL6AFAOLSOJl/Bs/EcRQ=;
        b=TtTZLl+zR/ezI9kt6ncYmG+dY+rmJltJnTVYDZSCWZQTX6XnlW+wlnsHcLX5ev6EiB
         P/u76yRMPyPUo9W3pN82efXXUjutv/WNRANQHvwugwbAz+kVcwKg8fddrfZ4RpH9+8/B
         UWdL39gxJgPLE8C602y4Z+Yzw+qdlbEAmCKmPpnM1Tb52svEtGqb3x9IJa2EYeychEe6
         k46YNwPqWwhWCnFv1Eomlc9txhO2YtZMNPYnFFUlAf6FonDm0hcYILI161mKa5opECUB
         xQzT9OU5bKF1CZ9xs8o+G1Nm8WwnOY7zwjzmxQvpK9/3zWHOaNO+Zxoj9PTTSnzKq6IW
         15SQ==
X-Forwarded-Encrypted: i=1; AKwUvBzf/BN+axAH1oyb7wQMIdgVR/B6nFAXXxal7GHNt5nG00IhLDVL4qISqAzx3pEpY2tr6qLGDui/KQS9@vger.kernel.org
X-Gm-Message-State: APuU4Z8T2KLp8XQ/mGgE9q07AAyx5gLczuUd6o3vxHzU4uXfrKDw4REA
	I1pLSV5it71wjUhcUpXROrlYUOw2EZEp7Gz0luL65ON/rNA7Ax7J9rna
X-Gm-Gg: AYBFou3sv779TDXX+K+ohWwYKwNOK+Rl+HTsYiBH88FE61Y0NJqWSz6ir3vD3gVpiaX
	0qz128nJC5nFf3vr+Dj4nLBmrClDVVQGVM1Zc/8Orjdkik6fAiilx8QffV3sc0RSdNaEhfG3IUZ
	b3HGoTjpQhxXqnIC1YiGFYMIxQ/VMYBgqn4Emernsi4SGnjLcVrW5ByU1dv1LYuj0SnRLNB78qW
	w9FVRoa/NOQ3egx+j6khxFlqXJbe1jc/lvKR88aNQIIxchKh+HKwws4rJKwVXuZldFLh3G0Ursm
	TkGZCmh0jo2RF2nffeRucgrIvb+0zng9SpNpZ/rO/Cn4ULsD2DhepiqignKScRffflf2RfTTcR1
	K2QMCiZhZGgRPGEkb/BjtU19PHE9UAQYRBGe0EaCgI2SGhhKgUrgh1wsfkOeSl/tSToPaoq3lVu
	wcf4YwiAA30cNAAlOSljzUWYXbkh7KPG9EZaGYGiP4ZTnlts86RRFkFTxepQneGzbDR1lgj0nRu
	W88i3bmMDKSCCOxeeVtkIgt0Fhv+56ts1H0PI89WStDchJbvD/t7xYF2p0uGSVDuMlXul7ajh0r
	jjwgsjh0EMdO4YEj6nWEa+l958jyBHQcSCmYIMJsBe+3x0r2+ifDni2pYShqx3Xu3s6LGVr92jY
	QxWMb1BI1HUtcNpA=
X-Received: by 2002:a17:90a:e187:b0:3ac:77c8:ac29 with SMTP id 98e67ed59e1d1-3ae896f862emr12115163a91.15.1793783517097;
        Wed, 04 Nov 2026 01:11:57 -0800 (PST)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b09369c638sm3167257a91.0.2026.11.04.01.11.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 01:11:56 -0800 (PST)
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
Subject: [PATCH v4 0/2] iio: adc: Add Nuvoton MA35D1 EADC support
Date: Wed,  4 Nov 2026 17:11:34 +0800
Message-Id: <20261104091136.151269-1-cwweng.linux@gmail.com>
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

This series adds IIO support for the Enhanced Analog-to-Digital
Converter (EADC) found on Nuvoton MA35D1 SoCs.

The EADC provides eight external analog inputs which may be used as
single-ended inputs or as four fixed differential pairs: 0-4, 1-5,
2-6 and 3-7.

The initial driver supports direct conversion and triggered buffered
capture using sample module 0. Although the hardware provides multiple
sample modules, this version of the driver uses only sample module 0
and therefore supports one active voltage channel per buffered scan.

The series is based on Linux v7.4-rc1.

Changes in v4:
- Use the common ADC diff-channels property to describe differential
  inputs and keep reg as the logical channel index.
- Restrict differential inputs to the four hardware-supported pairs.
- Restrict channel child nodes to the ADC properties supported by the
  MA35D1 EADC.
- Prevent single-channel and diff-channels from being specified
  together.
- Document that each single-ended input and differential input pair
  may be described only once.
- Remove interrupt-names and simplify the interrupt descriptions.
- Update the binding example to demonstrate separation of the logical
  channel index from the physical ADC inputs.
- Update channel parsing to match the revised binding semantics.
- Store physical ADC inputs in the IIO channel/channel2 fields and use
  address for the logical DT channel index.
- Reject duplicate physical single-ended inputs and differential input
  pairs.
- Use the physical positive input when programming the sample-module
  channel selection and the logical index for firmware-node channel
  translation.
- Use interrupt index 0 instead of looking up ADINT0 by name.
- Add the standard one-hot scan-mask validation callback.
- Use iio_for_each_active_channel() when selecting the buffered
  channel.
- Use a fixed scan structure for the single-channel buffered layout.
- Limit conversion results to the 12-bit ADC data width.
- Always report -ETIMEDOUT when a conversion times out.
- Make timeout recovery best effort so interrupt disable, control reset,
  IRQ synchronization and stale status cleanup are all attempted even
  if an earlier recovery step fails.
- Use devm_regulator_get_enable_read_voltage() for the optional
  external reference supply.
- Rework clock management to explicitly balance prepare/enable state
  across probe, suspend, resume, error paths and driver teardown.
- Improve suspend and resume error-path handling.
- Remove the redundant explicit REGCACHE_NONE setting.
- Split interrupt status read failures from interrupt-source checks and
  handle failures when clearing the interrupt status.
- Use symbolic definitions for the ADC resolution and differential
  scale width.
- Use cleanup guards for mutex handling in buffered capture and keep
  trigger notification outside the locked section.
- Use more specific error codes for channel capacity, duplicate channel
  definitions and out-of-range physical inputs.
- Apply the requested regmap, control-flow and coding-style cleanups.

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

 .../bindings/iio/adc/nuvoton,ma35d1-eadc.yaml | 163 ++++
 drivers/iio/adc/Kconfig                       |  14 +
 drivers/iio/adc/Makefile                      |   1 +
 drivers/iio/adc/ma35d1_eadc.c                 | 912 ++++++++++++++++++
 4 files changed, 1090 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/adc/nuvoton,ma35d1-eadc.yaml
 create mode 100644 drivers/iio/adc/ma35d1_eadc.c


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.25.1

