Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793914410;
	b=q5QjFmO1pG9GznML5HStr54GMVZl7ef6rtO0cxg9CrwdQgCYRJbVTM8a1e2TCv2IZBoc
	 WMOogRMxbZBCYo5jvsu26CuCJrfrZXE3Q2l8u9vFTBZYfPoWyXx/QvQjBHxpCAXyduot2
	 /rNx4/e6hBbdzX8TbdOvmAdrze21VJlPSNGzhu3R3OnQA35h9GmrlkTm1R1nWAbQ+E0j4
	 2hQpKlJACEwVTmmNeYYqzP5L4UXGtdNTGbMvV5+tNv0XaOpNSysUoMZ9F/SAsk1WRnGQN
	 vdVdWV9IeqLeiWyfFIi6X+2hCG2zgrnW9+fp5nYaqwn/eqYkv/ZmoFhBgWtSX9lQ+2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793914410;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=r/eRVXTXK7q+1xsN0z72ZiYGhuDDpDyu+MIjU/i0HJA=;
	b=ar/H8plex2/Dwm7ZH02Eg1fumA4v6/ltMRatzT1vD6yr/N/sHp/CtSZMmXBgbsryFThQ
	 vosFQhH7XofviCh5xZae1lpybOg5falo033NMotB3QYB80kTK7cEhBBr9U2hrGpF31VZ8
	 0QICG1iRlj9OMlPw3w3fk+czliUtxYF523Ug4jDZjzLa4tYOfqRVWJS9vL2Dt0DbrnfEb
	 EcadTvdY90wFMjusO95P9P0KLUo0cJgJUcfVwqmVCmnM4ZnGVpVmW38Z5XzLTGPvl+v7H
	 RjqjJIJPiPHhEXj/og0VLk4n0lau+UYn8N8rf+ti3baMWXoqd0gCwTZsrRZuNCTnykA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	dkim=pass header.d=mg-crea-com.20260707.gappssmtp.com header.i=@mg-crea-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=HKpISvqV;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B430C606A330
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 21:33:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B430C606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mg-crea-com.20260707.gappssmtp.com header.i=@mg-crea-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=HKpISvqV
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a20bdaf39cso20975e9.1
        for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 13:33:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mg-crea-com.20260707.gappssmtp.com; s=20260707; t=1793914408; x=1794519208; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=r/eRVXTXK7q+1xsN0z72ZiYGhuDDpDyu+MIjU/i0HJA=;
        b=HKpISvqVCMdcqW4ndGKlzBdukD3Zxa88f3Nhojb/HqyF+yTJe3gpN3REw6lR4V3clk
         4d1KejipAnVKFl3kHwPzl3BbYW4FHzZERRtK/fGDniwPKtajOzbENYBjws3zzEYZrpGP
         UR7cx/AH23P6UTibJP00rEy92EvGJOJ4mJtLebYRem0JZtrO6cI4jLuyOopxfsnqD6Hx
         dgj2XeWTklA4dDml3oRy5IaoNcxIrzdJIKi0ilFefbP0EU095dMIRXGmowVIzry0pAfz
         RrgjsrACKyM56IcfDYsuHcgr8jCb24nUroiCOuFy25+WWB6W/lFWsXwIQ6uA16vzgvwx
         BCzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793914408; x=1794519208;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r/eRVXTXK7q+1xsN0z72ZiYGhuDDpDyu+MIjU/i0HJA=;
        b=yEBzc1jd4C8hKVeRCgJt+HOk3Ijnih12Zc0ZRr2OW1b/QfGnxUxYjn5vZ8EFLrbdOV
         SaSpE5xWptVAJJlMYELghJlbAvHjoR6r5HaBjkZGMbRXBWF230cANC2xQ/gO+9VTnIAd
         6BSpg3Ec0SNfVfbCnk5m6kp2dQleG/3rolRKWX2zjRegEvWm2cnq3GJF+pb23yh5QPNT
         6+nnz7iTY1WN/8qbw61T1QMcMLD9Gi/Bu2gok2i/4yCoAA03MckqSyljg4ItbsdG8DQQ
         w8OQtJGvVa8jGIiB7dl60fO90LLj3xCwQDTRINuBUvq3I3Cex76OOPqrbwh3bpLI0ZQC
         IQMA==
X-Forwarded-Encrypted: i=1; AKwUvBxViK3zYrDciXqokze4QennzIa5uNAwEUZKYNX+MU4rtV/hP8L9Kds5mnmycG3AK/pAOtfbW3IJdctx@vger.kernel.org
X-Gm-Message-State: APuU4Z/OQDsyHklPXY3N0FvVRd1jnO120uehy9RwhBw8FG7raksi1unb
	wwcGzNtjtS4HOrg86Z9TQgQ9nPE7NWy3eQKB4GKiFOO2Z/41bR8h3m45rv3HXP9JPJk=
X-Gm-Gg: AYBFou3rUlfENoKlFi3ES/b+cuWwUo0F1JFjLotIr1mmPmMOdmPO60dO2pKhIzbLAVW
	UJeKhTHm1dfEqjWW/6yvrMLOU9qgzgYQ/PvdWksu5q1mbUoOWpilfqrmBgVd+n+Ju4f0FoURocq
	/vvb3m1j04ufJPxzK5m9OBAfWq1w7r38RkBY4r4gFMNBIDadZDxdrWgUtU0zoJviA51dWasQLsc
	VeoNF24nOzs8oUOMTvdhSGr81HpzD4+ad24m2lOEQz8sBy7gxAnOgV8t10ngEt1Dc0H3nlhZCx+
	AAE2XKXUYSex3c//Ay7OBgX3gZwUYbBPTMiyDhmab+RJB3W+S8MfLQfLhulUOa8z2LE/2GLSbg9
	AIMk27u/Mkg4CENCui04QXuusQJfQPt+XMdm0Wfi+t/9pocUubcaWmJAalS1WU/ahjjNceLTUnb
	g29cMeyRx34YwLe18tl7pYXmClrplWDoUPO2WXKS22Syz5hM7oCkR8XV+pIumYO9l/BVw5bfn3q
	pTcj7BcOt5eO09yMSdF8bUzLoNwr+LALjqXdYIvZf/kfwNMEhNcJhfeMobDhiFazADN5N+1c+02
	n6KJ+imoJmAv1RlyS8Xz1wfQvyTP4T0FTJJu1hJIaxvCRb0om+4wqDdeQ1KvjQ==
X-Received: by 2002:a05:600c:c10a:b0:4a1:fba8:b13d with SMTP id 5b1f17b1804b1-4b6e5ab6ec5mr4359795e9.9.1793914407493;
        Thu, 05 Nov 2026 13:33:27 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:9d2:5a71:5c25:f8d1:d9d7:54c1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b411de95b4sm107798385e9.0.2026.11.05.13.33.26
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 05 Nov 2026 13:33:26 -0800 (PST)
From: Olivier Louvignes <olivier@mgcrea.io>
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Cercueil <paul@crapouillou.net>,
	"H . Nikolaus Schaller" <hns@goldelico.com>,
	Joshua Crofts <crofts@kernel.org>,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Olivier Louvignes <olivier@mgcrea.io>
Subject: [PATCH v5 0/2] iio: adc: Add the Ingenic X1600 ADC
Date: Thu,  5 Nov 2026 22:32:08 +0100
Message-ID: <20261105213210.87457-1-olivier@mgcrea.io>
X-Mailer: git-send-email 2.54.0
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

A driver for the SAR ADC of the Ingenic X1600: four auxiliary channels,
12 bits, one interrupt per channel. Tested on a HiBy R1, whose keys are on
channel 0 behind adc-keys.

As in v3 and v4, this version is X1600-only. The X1830 and the X2000 have
the same register layout by their programming manuals, and a chip_info
with the channel count and the resolution can add them later, with a test
on either.

Changes in v5:
- Binding: the reference is the SADC_VREFP pin (X1600 datasheet: ball
  P12, 3.3 V typical, at most the ADC's own supply), so an optional
  vref-supply, and the description says so in Nikolaus's words. The
  driver takes the supply's voltage, and 3.3 V without one. The ADC's
  analog supply (SADC_AVDD) is left out, like the SoC's other supply
  pins (Conor's question; Nikolaus answered it).
- Binding example: reg covers the 4 KiB the programming manual's memory
  map gives the SADC (Conor; Nikolaus on the map).
- The driver's declarations in reverse xmas tree, the timeout macro in
  jiffies with an if/else on the wait, a blank line, and clamp()'s
  bounds on one line (Andy).
- The clock stays unnamed: Krzysztof (on v2) and Conor (on v1) asked for
  clock-names to go, as the block has one clock. A variant with more
  would come with a compatible of its own and could name them there
  (Andy asked for a name).
- The name stays "adc" rather than the vendor's "sadc" (Nikolaus): the
  JZ4740 datasheet calls its block the SADC too, and mainline binds it
  as ingenic,jz4740-adc.
- Andy's Reviewed-by on patch 2, and Nikolaus's Tested-by (LX16, driver
  only, given on v4) on both.
- Rebased on togreg after -rc1.

Tested on the HiBy R1 with v5: without a vref-supply, as the R1 is
described, the scale falls back to 3.3 V and the three buttons on
channel 0 work through adc-keys; with a vref-supply pointed, for the
test only, at the board's 3.3 V PMIC rail, the driver waits for the
regulator and takes its voltage. v5 is also built with W=1 with and
without CONFIG_REGULATOR.

Changes in v4:
- The Kconfig prompt, the header comment and MODULE_DESCRIPTION() are
  the same text (Andy).
- The read computes the data register's bank and half next to each
  other, and the two macros take them (Andy).
- X1600_ADC_CLK_RATE_HZ (Andy).
- Read and write helpers that add the base (Andy). Plain MMIO rather
  than regmap: nothing is cached or shared, and the only
  read-modify-writes are under the conversion mutex or in probe.
- The device clock rate is clamped before dividing (Andy); the divider
  comes out the same for every rate.
- Binding: the description's last sentence and clock-names dropped; the
  driver takes its one clock unnamed (Krzysztof on v2 and Conor on v1:
  their reviews and v3 crossed).
- Joshua's Reviewed-by on patch 2: the changes to it are the points
  above, with no change in behaviour.

Changes in v3:
- Cover letter (Andy, Joshua).
- MAINTAINERS: no list line; the binding's path in patch 1, the driver's
  in patch 2 (Joshua).
- Includes for what the driver uses, copyright line, MODULE_AUTHOR(),
  reverse xmas tree, open-coded return, no message after
  devm_request_irq(), a blank line (Joshua; Andy on the return).
- fsleep(2 * USEC_PER_MSEC) (Andy).
- The ADC clock divider is now even, as the X1600 programming manual
  has it; v2 wrote the divider minus one, as the vendor kernel does. The
  divider fields are named as in the manual, and the two clocks only
  repeated sampling uses stay at their reset values.
- The probe comment on staying powered up no longer names the keys
  (Jonathan).

Changes in v2 (Jonathan):
- The comparison with the JZ47xx ADCs dropped from the file header.
- No mod_devicetable.h include.
- X1600_ADC_VREF_mV.
- The status declaration split from its readl() in the interrupt
  handler.
- field_get() for the channel's result.
- fsleep(2000) instead of usleep_range().

v4: https://lore.kernel.org/all/20261102201155.10948-1-olivier@mgcrea.io/
v3: https://lore.kernel.org/all/20261026083631.48406-1-olivier@mgcrea.io/
v2: https://lore.kernel.org/all/20261024041357.34346-1-olivier@mgcrea.io/
v1: https://lore.kernel.org/all/20261023204209.48556-1-olivier@mgcrea.io/

Olivier Louvignes (2):
  dt-bindings: iio: adc: Add the Ingenic X1600 ADC
  iio: adc: Add a driver for the Ingenic X1600 ADC

 .../bindings/iio/adc/ingenic,x1600-adc.yaml   |  59 ++++
 MAINTAINERS                                   |   6 +
 drivers/iio/adc/Kconfig                       |  10 +
 drivers/iio/adc/Makefile                      |   1 +
 drivers/iio/adc/ingenic-x1600-adc.c           | 269 ++++++++++++++++++
 5 files changed, 345 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/adc/ingenic,x1600-adc.yaml
 create mode 100644 drivers/iio/adc/ingenic-x1600-adc.c


base-commit: 1390ca4953a7400ca932cb49635f02c727f885a6
-- 
2.39.5

