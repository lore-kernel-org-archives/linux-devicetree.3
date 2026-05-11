Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78719466B49
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 17:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778521436; cv=none; b=U/skP2uU8PZZauPj5K+4o0UPwUyPtY2JSg+klr95zOdmOLMQLCR0D0vimjbvRMek5fNsDShdMYC7Ko8f2GDBtK8qO8CYPya/zkwOyj/VpoUZKaY5SD5AK6cHEyO18kIoiL4V7bcF37JJT0+xVcks2HDIYKlqm+VGGeFAlWeSpzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778521436; c=relaxed/simple;
	bh=NZUNw0asM8Uh79fDTRNXCJ95Tgrkji7DhAnpBxZELIE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Bnz2LjKtSzuxTzj4ls9tUnQHmZwL/LxjcCy8hgorJSTBri4xpOex9XGIq7izlXB+s9KwgkC0FbOZh8iXHHWPvY0VudPEswMLY5WkmeYggk6rVGZlrEEJQOHSBUvoedq8YAxfXKjjcwriRHNCeSuBUAgAZsO45cwISFO5OKSpRM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ritCKHfU; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ritCKHfU"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2bcd3ac3307so6403255ad.0
        for <devicetree@vger.kernel.org>; Mon, 11 May 2026 10:43:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778521434; x=1779126234; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=B2jGSpuCkFnZZPSgBqwuaE2iTkPzgpCQONBBuaB+fDw=;
        b=ritCKHfU4elqPO1sNYB3ysv7Yeq4rKDVX3JJdVgi1iieqemLkLpk6fB5wHDL66ujAN
         rGV8ACqn1Rl/bHsEBqk6Dbs8RoUmbaj5km9DL/SpJqHTTz4GF3tmSbDn6jo39D9efHkW
         vJpujdioRaKhktECo1VVE/Bs6ZrPOVhHG1HWSDY/WgZfPmxZPJvQg4tkqPGuRoN4okth
         0ySpDnPoDV6vj7jyabKote550QjYUyKpBx+AZ59LVZ7QvdAKOboM0dKY4IAxXfEivIaw
         /bDNEPCoLVMZvZdvqRe4SrGz+okOOVxwgYl8D9ouAbzK3R8sU+vsT0+u21kpCVTRwsc5
         Kzsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778521434; x=1779126234;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B2jGSpuCkFnZZPSgBqwuaE2iTkPzgpCQONBBuaB+fDw=;
        b=aVSYzLlPPFuUl57Da+mfez+mhVdoIXLGEAYBOLA7VXlVRfMILyvlreVWM0v/yVfl4b
         rTAQiQYgX6Rc1RI0iPFXiVMbZ3EmWZOU/ncoq3Wac+0DodEvKsgm8jsbzSIqp5zmSZgL
         B26NU4hn0WjPL0ni4KQhcXFK5LEvs0td5Ga5N6HH0XzkncAB43Un3I8ltPSQgdPzbXtx
         F1gcXWNEqVCpCVEgo73L5WqFLeNxoCuiF7AnMDfgxPa++n3R3Q3I94Ihxvad29RzRw1R
         TaCqwaJVzsKIt2i7F8nG5xgatNtf7J2nd1QTwvoL+5qwYAijsbPg1iQiz1La6DlI0Pjx
         CxwQ==
X-Forwarded-Encrypted: i=1; AFNElJ8TnEo6Slv5RUpkXyagsF/61ZZoz87djhMtXJhackuWoTcSXCn/+VQ6uFFUIoyDtN0iDDDL33kGlj0E@vger.kernel.org
X-Gm-Message-State: AOJu0YxwHe6NWen7F5aVuQZafF0WMzskllD7ucvP7nTsS+yF044yAWPc
	Ya0JpeT1Swq+s/pi6HPIisBGoff1aSFAptePwcyscqyqwanXuXsAQ350
X-Gm-Gg: Acq92OHIjy6lgwW973SOrhb7t3XbCycjuO1e6ObZjrDiCoJXiO9sy5m8ruO13mtbHu+
	Z0Kxaf+HVYZ927CMHi4r8c5oNKcBLlH429SINHsHydBRbpI0mpZluI5XnrBdx3gL03VchYIKSv2
	IjXDwB14xMvlB86Funxm+WrroGi7P7OTOUeNQyVmY8fsfwnTQi8MEVLNJE72z4L3cP98kfKJdN5
	uKSjUWQZ+thPjldksbRyjqCMSaAuoQSS7WqCxCXz4cFhK6+YSZplNZzw2EkMFJwgG4gJn32K8R7
	eJ7YuaekmFHwaMRjAYeqF6X6Ci53hiBsj1taoDb+c9rnW0lJ0bakFUpEc2VGdnLfMcLzGV9m8CC
	om2wsQO8q3se8w774OEl32C0Ji9ABHDSylCHI/W18/W6OOLV3atlHKXaoDelohqulOmTVQEFpDc
	tDaFYlALEhg2uMdEV86Bpeha7vtJSyMr/Zk90I2dTTCYhWEo2hnAN1OmtFq/ucARKAZ6Amvoc23
	tkNwy7K0B1ul0i3/zgvKgmgA3XyNkp4bKrd8SbJWFazr5r3cUIH4TuVEkzB1uRLZIC9yDo=
X-Received: by 2002:a17:903:2796:b0:2b2:58c7:2ce1 with SMTP id d9443c01a7336-2ba7a345555mr192439805ad.36.1778521433704;
        Mon, 11 May 2026 10:43:53 -0700 (PDT)
Received: from lord-daniel-VivoBook-ASUSLaptop-K3502ZA-S3502ZA.www.tendawifi.com ([14.139.108.62])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1e365a1sm106838425ad.44.2026.05.11.10.43.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 10:43:53 -0700 (PDT)
From: Piyush Patle <piyushpatle228@gmail.com>
To: jic23@kernel.org
Cc: ak@it-klinger.de,
	andriy.shevchenko@linux.intel.com,
	dlechner@baylibre.com,
	nuno.sa@analog.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v8 00/11] iio: adc: hx711: add HX710B support
Date: Mon, 11 May 2026 23:13:25 +0530
Message-ID: <20260511174342.123820-1-piyushpatle228@gmail.com>
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

Compared to v7, this series folds in the remaining review feedback:

- patches 01-04: add Acked-by from Conor Dooley
- patch 06: reorder hx711_chip_info fields so channels and num_channels
  are adjacent; annotate channels with __counted_by_ptr(num_channels)
  (Jonathan Cameron)
- patch 08: add blank line between int val declaration and its first use
  in hx711_reset() (Andy Shevchenko, Jonathan Cameron)
- patch 11: add blank line between linux/ and linux/iio/* include groups;
  replace the open-coded triggered-buffer struct with
  IIO_DECLARE_BUFFER_WITH_TS(u32, buffer, 3) (Jonathan Cameron)

Tested on PocketBeagle2 with an HX710B breakout module. The device
probed successfully, all three channels returned stable raw readings,
and alternating reads confirmed channel switching between the
differential input and the DVDD-AVDD supply monitor path.

Build-tested with:
- make -s W=1 drivers/iio/adc/hx711.o
- make -s dt_binding_check \
  DT_SCHEMA_FILES=Documentation/devicetree/bindings/iio/adc/avia-hx711.yaml
- pahole -C hx711_chip_info drivers/iio/adc/hx711.o

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
 drivers/iio/adc/hx711.c                       | 311 ++++++++++++++----
 3 files changed, 312 insertions(+), 84 deletions(-)

-- 
2.43.0

