Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792883632;
	b=DWf1TUGwPtK8TcHo6WVVfTh/IeBnp84UH9QG4cOTpcMUVg5pD22UZRxl8V0aE5h/XNEL
	 +J6vODOD9Enb6xhGDS6TKx8zfQto+0dlq8uhE3GefRjD6ieL0XOCYBlZYr0gqyd3+wkMs
	 Lqd8B0G4Sb7KzT3DzyvQlfUsd6z7anMkwJTScL6jmRWAwPzFt2thWnx0qQXoAKs1xVR/1
	 POpgztywjdvPXzT5RjojLT0WUyC1fdre6xd1F8AyKpAUiCCs21b2CGhbiQRoyl+Oi5VCO
	 6pNWWMXbNNUS5yMwYkzANb3Pm+j2UEwBPShrvnZj/wqaUze+N/q3Lxuf6Kza+50qKvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792883632;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=1AIKyvNFejxgpJElRWUpbqx4cqYCbCrAW59Sl75hF3M=;
	b=u16H7AfIUFE4r/rmrc4V0fzrrC0r8aMzW/bBvrp9bNnGvh5Hv/5Hgei6HoMaBKaF9ps+
	 y9LK2NpU6vC41fy13BHiQvHU5U/BEcIVTJWllHy3YfZcw2qGPWNz64taoOqNvaCY4HqnA
	 kMoF++QwjfpWxZoxLsOzMaRC4TWMxYkChDedSZvYu5XU9MxeI+Gr6Z5nxFSqqsd9QbqW6
	 /lXE+wJMswzuPWVqZz0BlfB/1aB8y6a62aBrYHWR0vJK6Cm0h8YKX3UBlowOsrwZebO4d
	 FOciBSZJQTPn5XKIpQWWql1dr8a8sAGl2KOoMAm46VtMiXzqicWEtqKRbYEQTwGVM+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=bEAEJVkO;
	arc=none smtp.remote-ip=209.85.222.46
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB8A4606A31D
	for <devicetree@vger.kernel.org>; Sat, 24 Oct 2026 23:13:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB8A4606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=bEAEJVkO
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-99075306daaso1171840241.3
        for <devicetree@vger.kernel.org>; Sat, 24 Oct 2026 16:13:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792883631; x=1793488431; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1AIKyvNFejxgpJElRWUpbqx4cqYCbCrAW59Sl75hF3M=;
        b=bEAEJVkOFRV/r5SFuPpgkq3+D+fdTibg2XIBWT2eXGiN8BxiFuGhps5MZxebVN+ZF8
         yK0pCdbN/M4QUwyYfHYHk7McXb78HB+3XZb/DDi1wN5kjJPLGjds5I6wJubT9U+RXY8V
         /QepWwgIoP7e4eEfCko9Lc8zXkBO5b3/77l6N+AZNatYbIEk3Y3qn6rsLCnJCuLWtnP3
         1NCBQBqH22915CxlGJb5UKAzXUoULFzh4sgtejeAxENtixWS60mA+yxBI38/gsWY6zVZ
         jSUsZ5Oubh1XusNCLNYqq657SPBittlCwS8a84xQ5sZCgPLGhUjcgxAHEIxGYa2i3uWu
         DaKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792883631; x=1793488431;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1AIKyvNFejxgpJElRWUpbqx4cqYCbCrAW59Sl75hF3M=;
        b=lonuT1XN34o8AW72nRTmoIOuSXE5BPfncnSXMu0VXiSbaQd4SuO/sRQw24BzH5/414
         7tqmCPsRT5Ut5+jQNGEZ1UxZEUp3cQCwmFbNcrVQrHIo+HKFS4nKgfh72VV1hlS+CcR3
         HkPrRkyYJBqjfi5W0vRFOJHFwPiRcqu/1yGGjvTC6fdO5gjXdXfmymdO4/zIex2A6yqM
         hB+s9TDwZLFdM3k+Ln6C2vurVcWL/WK4fbBToi3ryeEqTnpdGmKN5Khf/hKN9/oVOHjU
         /2vLMs0JLSgDKrkQcxz/qNo2eG3WyUWvfC5LUJi3eSVr34TMn1GlGsgvw/vizyNH6HDy
         Qbwg==
X-Forwarded-Encrypted: i=1; AKwUvBzaUBT7CNuO2HY/1zCCfdbdMPC0vHt87jroY4Iu0nf5DZkS8L3gvnJbp3Kxcjf2JP5kyetsy4ScWVUq@vger.kernel.org
X-Gm-Message-State: AFq9FYL4n2JXrVWAfdAv6ANZItY+OFgxv9401mfHNoZ0qmoUfKPEZcva
	Dbnj2oD+foHduumv7cfIKxpZGjdzpJu4kRj5f8g9cYGxWwac8MsQ/497
X-Gm-Gg: AYBFou15AXbEhgAU1YNo8JxXzF/rQQDCapY2XW2TC9nlMHMr825Z+YoBLFwvunMJ85+
	2wb5LJk5TWoIy2KhbN9pVqTLM1bbwUOTDgR1bCjJWdd8kGzUQI2Stci97doRN6vm2DQyjarrgeA
	041Tx4iUwWlwEAutvur94lf6EHmVqfhnkKN1evEX3CM6VBnavRI+hYI8orh+OQYbn8NnTc36gc7
	490bd0GT57iuLz0YyUFRd7/mcsZ2TNoFWxRb8hrK9izn1ma/+Q/Vych/BekXyntJzvxbKQSaryj
	CIOUJwY/2EofK2FMmgEQyPMi0BFgd5fZ7XZh/DboV+js9YvUA8L4m5A8elTw8NdnfSstpRaKQpe
	a+7amjtDnJpARvN8kItS+lp5kx+HRUJWKFBS/DGKEf+HUPN8UH5eFFJQnm1XOUhcOu7rLhw7zbL
	O9yEqIxO13yrcbgRnei9mA8BPwJDBVWOr74A9Yw2ozxi7NCn/+PtyiVHSoolDc/CVSZdo6Kw2Un
	vH0qu8MXfP1cykJQvfboCZfEMNdRdVn8GlfcceVKndcj2IAOUgdLKTxTVAzDKKpupbGZYs9TTtO
	MbjE
X-Received: by 2002:a05:6102:5708:b0:7b2:f3ff:6b34 with SMTP id ada2fe7eead31-7ce5ca75b82mr1051989137.1.1792883630780;
        Sat, 24 Oct 2026 16:13:50 -0700 (PDT)
Received: from stephan-Inspiron-15-3520.. ([2804:5d20:6009:6701:efc9:520c:e99d:e5ce])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9910e7b8f0csm3775406241.5.2026.10.24.16.13.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 16:13:50 -0700 (PDT)
From: Stephan Costa Barros <stephanbrrs8@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mike Looijmans <mike.looijmans@topic.nl>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/6] iio: adc: ti-ads1298: fixes, and ADS1299 support
Date: Sat, 24 Oct 2026 20:13:29 -0300
Message-ID: <20261024231335.280955-1-stephanbrrs8@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds the TI ADS1299 to the ti-ads1298 driver. On the way it
fixes twelve issues in ti-ads1298 itself. Five of them come from the
automated review of v1, which was a separate driver derived from
ti-ads1298; the others came up while reworking and testing.

Changes in v2:
- Extend ti-ads1298 instead of adding a new driver (Andy, Jonathan).
- Bindings: the ADS1299 goes into ti,ads1298.yaml, with no clock-names
  (Krzysztof). ti,ads1299 names the 8-channel part, as TI sells it as
  plain ADS1299 with no "-8"; ti,ads1299-4 and ti,ads1299-6 fall back to
  it, since the channel count is read from the ID register. Each ADS129x
  part also gets a compatible, with ti,ads1298 as the fallback.
- The issues the automated review found in v1 were inherited from
  ti-ads1298, so they are now fixed there, in patches 1 and 2.
- No <linux/mod_devicetable.h> is added (Uwe).
- The ABI that v1 added beyond ti-ads1298 (writable scale, _available
  lists, timestamp) is left for a follow-up; see the end.
- v1: https://lore.kernel.org/all/20261019001247.483005-1-stephanbrrs8@gmail.com/

The series:
- Patches 1 to 3 fix ti-ads1298 as it is in mainline today, grouped by
  area: the data read path, power-up and the device clock, and smaller
  issues (scale, ID check, regmap, Kconfig). Each has a Fixes: tag and
  none depends on the rest of the series, so they can be applied ahead
  of it.
- Patch 4 prepares the driver for more than one chip family, with a
  chip info structure, given as match data, that holds what differs
  between families. The ADS129x behaves as before.
- Patches 5 and 6 add the ADS1299 to the binding and to the driver,
  with a compatible for each ADS129x part and the optional DVDD supply
  and PWDN pin.

The ADS1299 shares the commands, the data format and most of the
register map of the ADS129x. It differs in:
- the PGA gains, 1 to 24;
- the data rates: no HR bit, and bit 7 of CONFIG1 is reserved;
- a fixed 4.5 V internal reference, and the reserved bits of CONFIG3;
- the ID layout (bit 3 alone tells the two families apart);
- the register map, which ends at CONFIG4;
- inputs that are shorted out of reset.
These are fields of the chip info and an ID decoding callback; the code
paths are the same for both families.

Testing:
- On real hardware: an ADS1299 with a Raspberry Pi 4, running the
  driver from the tip of the series. Probe, scale, data rates,
  single-shot reads, buffered capture, and buffer start and stop under
  stress all behave as expected. The clock fix in patch 2 was checked on
  the same board.
- With a KUnit test, kept out of this series, that runs the driver
  against an emulated ADS129x and ADS1299. It fails when most of the
  fixes are undone, and it found the command timing issue fixed in
  patch 2. I can post it if it is of interest.
- Three of the fixes in patch 1 were found by review and could not be
  reproduced; the commit message says which.
- Not tested: an ADS1298 or other ADS129x part. Mike, if you still have
  an ADS1298 board, a test of the series would be welcome.

Proposal for a follow-up: once this series is in, I would like to add
generic IIO ABI that serves both families in the same way: the PGA gain
of each channel through a writable scale, with
in_voltage_scale_available, sampling_frequency_available, and a
timestamp channel. Would that be acceptable as a follow-up series on
top of this one?

Stephan Costa Barros (6):
  iio: adc: ti-ads1298: fix the data read path
  iio: adc: ti-ads1298: fix power-up and clock handling
  iio: adc: ti-ads1298: fix scale, ID check, regmap and Kconfig
  iio: adc: ti-ads1298: prepare for more chip families
  dt-bindings: iio: adc: ti,ads1298: add ADS1299
  iio: adc: ti-ads1298: add ADS1299 support

 .../bindings/iio/adc/ti,ads1298.yaml          |  41 +-
 drivers/iio/adc/Kconfig                       |   7 +-
 drivers/iio/adc/ti-ads1298.c                  | 513 ++++++++++++++----
 3 files changed, 448 insertions(+), 113 deletions(-)


base-commit: c9dbe2a47f635465c9985b7af74d2ae310e98125
-- 
2.43.0

