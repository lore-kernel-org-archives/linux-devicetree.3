Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7783368282
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 19:55:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784058944; cv=none; b=KFqLTD+c6IgoChm9ofgCAyfk47NrW5kt0rHPZoaUo3XzfY1wByP1/OqI+k6TP8oj7ZwbmEPF0MrYqYnCGBKh7F1jGh6PG6ngxptWPm9Hv3RUesRq84czaNpTV62cM4uoje+vrzfel9b5NXAW4dgRKN6Sjl1MEFmiB0hGHAdghCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784058944; c=relaxed/simple;
	bh=f8PY7ZBPpl+KhQeMiVz0FaxPV5IiQdWfdAFvjTQrj6w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cBbo4S4GUHpQOiKsWPAwhoBUYqz7DCpHLsxncOqWzC5roe52ITMf9ZligFmZBmPQsO6NLRL8fdIrCRXx0V6JWWc2oZljg1KHwE5z/Q+YfxGkiyJc3vFG/LDTqBXKE1Lf+nW/xsWOecBPE5B/6pU0Gq2ejW+DcDqsWy59t8OfBHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pF4p2W+N; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pF4p2W+N"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5b14d1f9315so3008148e87.2
        for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 12:55:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784058941; x=1784663741; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RDPK8lIvfuURcJ5W8jwuruRb3VcAZoYEULrLA0QKHB8=;
        b=pF4p2W+N5RM0RnYAj8kw2LlwpjnEs5qR9gqdlWPPVdih/ni/4ji0nkjMnjKgoMxQHB
         C1RSgXp9FEeAPTtkXCZpqLuAvPx2B7VdRKYVqUCghx0VCTLnWlZZAh8O8mY6e7YD2ETd
         HkGGAt8NiDhKjiTuP57fPsOe9oYQ02xgeGHLELHStb3tPPjmccfAB2Oh5ydree++VvFI
         vMBjW3IgFWvyZh+xvGHY3/8N/YcKrjnouPMwySX9rlChGSQf8i+ZbZm637iE6d62WcNS
         4bMxIs7Qkwv7jaWc7Vvz1eKw5LKDbLQAbi5KcmLwULXQknWSNXJG7qIfjU+Kkqd8r/Xm
         yqXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784058941; x=1784663741;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RDPK8lIvfuURcJ5W8jwuruRb3VcAZoYEULrLA0QKHB8=;
        b=poY6M0E0sAjSLlkJMcju9QNNW4+Bk7aq01aZIimYlzPDRX2ulahmmqnZjHK5Z+27fM
         R6WnGD9sNrYklFTbZo3sIasOQB6xTzqoJTb1+E2iHxkhVF2I6m3T2apPFH9ngDtrNkGo
         zOScuEiIUzsyRxla+Z9Hwbod2F1abq5IxanDDTd01aQRIgBla47ZbqdN/OGyRNqqurMa
         fI7PGbEBso/J1B/Rc5M1+ePlRpzfOnO8y6mACEHs4t40BDsevue/DyuZPWwf8v/p+nmo
         J4IanxxDYXau5RyCeyrPbJiA7rR/ZSQkMbsnwKQdKhi+O51malhvtyhhnGMT/MAZbAlc
         JrDw==
X-Forwarded-Encrypted: i=1; AHgh+Roh0Y9docJQADCxM3ShxjxKt8vHFIIYyT6nO0frnRT/9TalPD+ZPeA2MlWXvr++mSByoKD2hgDWyXYW@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0/Qe45iM0Dwv/EK6UwLdZewwe/tWVTOEhmSmTgbKlypIXVxBb
	kE1ZX4dGLWTQeKpyuDjNVk7uFT6zFVJKq27Z/o4JTP1EoSaust2aRVub
X-Gm-Gg: AfdE7cniTSpobMIZe3+TW6XWmkN7S1ZAtPaAw7TmC/futP5phDNvgW6ADdC2e2j1OkT
	r5AnH9sTETEoJjPN/cFaSheLB/muQP1xNrI6QCQ3BDRgIuqkrloNvZdPWHo/Znz208wmrnghR4U
	bmlwP+0g1Ki9Dvu4qxOV32VHdOS2ttBLHHkSM9rCmFPJnFGEr7UusJOIDLRlqSPfi4dATmGp0Uc
	rnaPJS/WXMfZP1VJ39NRrfeeltAhvR6JMjgi8JCZOPEUzSO4E5cL798wAbw8YOnRfDufYUXP5W1
	OYz7jRZhUw5rRnmcxM3eeB7X6eOVTCpoZj8cRxcX+qCCu5NlhFrQoZ4yOTf3urQkmbvTWA1uSbx
	v5fvHnKGgTI1WBDPrmjCMi+Eg6jtMxyUpbrUNYZgjVGvQPmTAbRoVc6jttcvzaSrV3N1HM5ZbPf
	kunZI39vRJdF/9hNp1jv08Jw2TehxVS+SxVGnlgUlWhRyq13E=
X-Received: by 2002:a05:6512:488e:b0:5b0:129c:ed76 with SMTP id 2adb3069b0e04-5b15828011bmr779732e87.29.1784058940926;
        Tue, 14 Jul 2026 12:55:40 -0700 (PDT)
Received: from MSI-LINUX.kielce.vectranet.pl ([2a02:2a40:27ec:2900:822e:374d:22e8:16cf])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b01ca501bfsm3693490e87.26.2026.07.14.12.55.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 12:55:40 -0700 (PDT)
From: Jakub Szczudlo <jakubszczudlo40@gmail.com>
To: linux-iio@vger.kernel.org
Cc: jic23@kernel.org,
	dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	marcelo.schmitt@analog.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	mike.looijmans@topic.nl,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	jorge.marques@analog.com,
	antoniu.miclaus@analog.com,
	mazziesaccount@gmail.com,
	jishnu.prakash@oss.qualcomm.com,
	duje@dujemihanovic.xyz,
	wens@kernel.org,
	sakari.ailus@linux.intel.com,
	linusw@kernel.org,
	Jakub Szczudlo <jakubszczudlo40@gmail.com>
Subject: [PATCH v7 0/3] iio: adc: ti-ads1100: Add support for TI ADS1110 to ti-ads1100 driver
Date: Tue, 14 Jul 2026 21:55:25 +0200
Message-ID: <20260714195528.597753-1-jakubszczudlo40@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for the TI ADS1110 to the existing ADS1100 ADC IIO driver.
The ADS1110 is pin-to-pin compatible with the ADS1100 while providing
higher resolution and an internal voltage reference. This patch series
extends driver support for ADS1110, updates device tree bindings and
Kconfig text, and improves the overall hardware description for the
TI ADS1100 family.

Tested on: Raspberry pi 3b+ with 7.0 stable kernel

---
V6 -> V7:
- checking for negative value returned from get_vref_millivolts and taking value only in probe
  will be added in the next patchset to be easier to review
- change ads1100_new_data_not_ready to ads1100_new_data_is_ready and returning int to be able to 
  return error when i2c read fails
- doesn't add checking for short read as i2c_master_recv can return count of bytes read or negative 
  error code, so checking for short read is not needed
- change from MSPS to SPS in Kconfig help text
- set iio_dev->name after taking device name from device tree in third patch to be more generic 
  and not only for ads1110
- fix typo in ads1100_get_vref_millivolts
- correct typos in commit messages and add ti-ads1100: in subject line
- Link to v6: https://lore.kernel.org/linux-iio/20260711184414.1013686-1-jakubszczudlo40@gmail.com/

V5 -> V6:
- correct for loop so it will be more readible and return error when iterator matches array size
- fix SI unit letter size
- correct using available_data_rate_hz array when using ads1110
- bring cast to char* back
- Link to v5: https://lore.kernel.org/linux-iio/20260628194341.66752-1-jakubszczudlo40@gmail.com/

V4 -> V5:
- Correct pm macros to be more generic
- fix variables ordering in new functions
- delete unnecessary casts
- add unit to variable names
- change array name so it will sound as array not variable
- correct get_vref_milivolts so it will check if not negative value returned
- delete unnecessary short read check in i2c receive
- Link to v4: https://lore.kernel.org/linux-iio/20260622221550.374235-1-jakubszczudlo40@gmail.com/

V3 -> V4:
- make fixes patch the first change in the series
- correct error handling when short read
- use ACQUIRE macros from pm_runtime.h in new functions
- Link to v3: https://lore.kernel.org/linux-iio/20260613190957.654798-1-jakubszczudlo40@gmail.com/

V2 -> V3:
- clean patch from unreleated changes
- divide adding support for ads1110 into separate patch
- add missing changelog
- Link to v2: https://lore.kernel.org/linux-iio/20260607183542.368184-1-jakubszczudlo40@gmail.com/

V1 -> V2:
- go from creating new driver to extending ADS1100 driver to support ADS1110
- Link to v1: https://lore.kernel.org/linux-iio/20260527164312.355729-1-jakubszczudlo40@gmail.com/

Jakub Szczudlo (3):
  iio: adc: ti-ads1100: Fix incorrect reading when datarate changed in
    single mode
  dt-bindings: iio: adc: ti,ads1100: add support for ADS1110
  iio: adc: ti-ads1100: Add ti-ads1110 support to ti-ads1100 driver

 .../bindings/iio/adc/ti,ads1100.yaml          |  10 +-
 drivers/iio/adc/Kconfig                       |   9 +-
 drivers/iio/adc/ti-ads1100.c                  | 154 +++++++++++++++---
 3 files changed, 143 insertions(+), 30 deletions(-)

-- 
2.47.3

