Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4B38494A1B
	for <devicetree@vger.kernel.org>; Tue,  4 Aug 2026 19:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785871745; cv=none; b=hhnys/pukQT9PvSM5CTkbfqJA4wcAwdj76tGOf7G37t9TpD2z0hLKqocAS+oTZLK+u/uJ5x0qE87CDur6mURH7+etpGEkJr7utP3aW8dqU79dArU1V+6Zmreylx/XhpAo8tcMWJKV/ZaQ9mCcRmF8X2cYLItR57FMip6Nml2K7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785871745; c=relaxed/simple;
	bh=CzDd/BO64JBwmeEjDNpabUYaFCOA00Rim71uWmNnWDk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=g5yBaMfT+RgyjXDwoh0oOURmyvfhDOmJc+CJ/UOwdQIUr+XyNpBL2RzkyKjS5+uf4T0bYjueMuUZpkaggboHuGkSSRT32uFptLURuH1RRFHYaW1mtHOcMn5o8rhAm3emhORwt/UNcWA1szCFzGmbizgqHIIAt3X/E3yQpus8t24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZBdQWEGd; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZBdQWEGd"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-49553515a8bso2220755e9.1
        for <devicetree@vger.kernel.org>; Tue, 04 Aug 2026 12:28:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785871738; x=1786476538; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DXiAbpuTaDaZCMHMqvzLfY2DaG1MbPIIUZFJJKSm5nc=;
        b=ZBdQWEGdYcSJUehXaJ5HdwMj03VKRJqcnwLx5s3QtilReVi84itWsHdtYemeJeqtAb
         qIeZk0oNgskklRFxxZIPEq0AL+eo30XVTprpQ/HfSnOUCvIywc07be9aFFpycSz5SvgV
         Dqt0F+Zm8rNDMIXc6EuXQUG8yy4BlX7ogvnwrTjKZVmSwOUJRjNa99zQA2v536Zvf/48
         21h0BSJAeCEVn/xZr/oNWBsMSYsIoiQbW92kREIGR7MTd61lC/itl0GRDZ8rlZvG1FaC
         jWT69E6PvCboXPktqDbJOuo73EvZbF2xz6E2494Jb4s7oVcjsh4WGkukz32Hj1yqamBF
         Iocw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785871738; x=1786476538;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DXiAbpuTaDaZCMHMqvzLfY2DaG1MbPIIUZFJJKSm5nc=;
        b=iN0TznHZtzdYkAWnc/r42kTKz+HpKvbMaPU42pPRfDWy8ObYiP2+Taf1Ju0QyE/KOW
         IV9bdHH02Ur2bLawGF8T23WZOfehkNnWS4HgZqwW9jvnFFGELz2KcIc1exMSkzQdANtO
         u6q6wBTlDj+KP1hZqIFy7W6ppDGb2zhk9XjWGcePsULMrGKO+HCYFBN3Cb1Lv0mHtn7t
         FeQmZZH2yMwfz1vohB7leH7tcB+skI2jwCC2wMKG4SnEQyGdBP+oQIfmF5i7dXIQ4Oyw
         gPi0YzeOittZK+RAkuXuXa/E8TxOhFWt2ljWHJIKMeXlgKidmR9+ugmdMhBxw3EjpgyT
         7ILw==
X-Forwarded-Encrypted: i=1; AHgh+RoTYExu1B0erjq+QORt4nydnYUHrGvRVa80JbYXK2seeLR8pziuNjD02xXehQbYJPmoFU4h5nTlF8Ig@vger.kernel.org
X-Gm-Message-State: AOJu0YxmcwTL3NLXe3dVh8uVyxvkfZt9bo58MdbPylhPNCQuNb787RBi
	XRc0ChGR83tIcNgmFbGWqDX1l2QC1ADgQOQYsMMRlTe8BWkbdjFOVPpN
X-Gm-Gg: AR+sD10gA+dkLD21Md+EeAj6FTGJeY0OMQirVk4xKSEQiLMCGNRFB5Gqq0MyzYbz3b7
	Bfvv4rAx31tkeOvs9IqaRtxyFZkJQ3z5081Nc6c8R7enbg5z/4Z1o55S/JWJXW1iShiEw9PymcN
	YvDP05UtW5KkIOuWyGfyNzg1foL/O2ko7/3bfsxHz6CaaZh9EsfxkYJa+b3cKX8zjuvKVBsR2jw
	n/Qiv5o0VBiS7j6tZt0KjR66cmxH4pVuZEMJgpYtJbi172j9c+nrR4qg5yMFleOz5+5epdHcgG9
	ItWL/KHyH73fLQL9qOvS1cNqo4pEO44y/UzEJ0JckW5gjlhRCJTZvglrOkU+GB6QXXTHFVCmHt1
	OTUpCIG0uEKfB2IoJFfxEwdssxcsJqIPm/R681AzvbfWOSu2YfzhWoQnBOIYbVpKXCcvPx0GnMc
	NkCLGEVl0WovlNUztO7g+pTSEG2B5URiRXAbL2Bs3DXAzSGZQ3L0GPfRozMYOZ06xV+gbVmO4dB
	C1p7M//dHNuDDH54KOMWySSr1kZAEhOLA==
X-Received: by 2002:a05:600c:6dd7:b0:498:28b:1025 with SMTP id 5b1f17b1804b1-4994e7a7d1fmr5229195e9.5.1785871737672;
        Tue, 04 Aug 2026 12:28:57 -0700 (PDT)
Received: from MSI-LINUX.kielce.vectranet.pl ([2a02:2a40:27ec:2900:68f0:30cb:8ca1:f965])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4994e4bf820sm8248745e9.0.2026.08.04.12.28.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 12:28:57 -0700 (PDT)
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
Subject: [PATCH v9 0/3] iio: adc: ti-ads1100: Add support for TI ADS1110 to ti-ads1100 driver
Date: Tue,  4 Aug 2026 21:28:37 +0200
Message-ID: <20260804192840.29121-1-jakubszczudlo40@gmail.com>
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
V8 -> V9:
- after more testing on ADS1110, it was found that changing the data rate or gain in single-shot 
mode could return stale or incorrect readings; this version makes the driver explicitly start a 
fresh conversion and wait for the busy flag before reading the new result.
- Link to v8: https://lore.kernel.org/linux-iio/20260717185033.246580-1-jakubszczudlo40@gmail.com/

V7 -> V8:
- fix logic error in ads1100_new_data_is_ready, on ads1110 it will wait for new conversion, in
  ads1100 it will just wait for some time because ST/BSY register always reads 1 there
- change ads_config to chip_info
- fail in i2c_get_match_data will return -ENODATA instead of EINVAL
- make returning value in ads1100_poll_data_ready more readable
- move i2c_get_match_data higher in device probe function so all indio_dev will be in the same 
  place
- Link to v7: https://lore.kernel.org/linux-iio/20260714194717.596193-1-jakubszczudlo40@gmail.com/

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
  iio: adc: ti-ads1100: Add ti-ads1110 support to  ti-ads1100 driver

 .../bindings/iio/adc/ti,ads1100.yaml          |  10 +-
 drivers/iio/adc/Kconfig                       |   9 +-
 drivers/iio/adc/ti-ads1100.c                  | 189 +++++++++++++++---
 3 files changed, 178 insertions(+), 30 deletions(-)

-- 
2.47.3

