Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F12BC3EE1FE
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 19:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784058457; cv=none; b=ABtkd8Khfvm20v/67nF6t0v+aw7vrziFRVTnv2lV0CaopcEKbW5N7DB9+JzJSXzBWEykuPg24Hjd4ADXErT2VBerLTcxIIrmnIpKbIBtfasnlaS4w2imU1c3ZuhN8sVIWR/IUNXZ3w6MHhEGJOc6qToRb5V3O9+JMTljki8AjoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784058457; c=relaxed/simple;
	bh=/LUsmvSQpGHMRLIXYDJV6G6dNemLKaKPM3r1uJGsMIc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=e+PYuKcLYMgV0N57j3dmXo5rdgaxbrt9rPm70lVBPWlLyJGFmpYFMsHWLZzH8IQ1fchm0MYa6RCT/u65U+aedWn/kzV20aMpX+yXTJO8FBirAy7YBWSp0VJK/MiWie4bOL5KfynAYZAAQJri+N0rMJHEQdbo5BqoCBA0HTcPdgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mPI3ze0x; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mPI3ze0x"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5aec6360133so3541405e87.1
        for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 12:47:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784058454; x=1784663254; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NjCijnCvUpLQ5hXkZKX1A/TF7R6tnAbvlJyfXTOe26k=;
        b=mPI3ze0xD+Fhpd7C9D5MHB43Jth8wZOqd6lTpcWkDSvhTp/bryOu5pDQHvVYfIjkIX
         WWvzhnBo0LUMyo9TKsjFLSdztirEKTthd7LK7iR3RhR3pClznbU1BI8s+MFCsLkjmE9P
         AtyO1i0vCR7rXEGmLf0JCLecp6ZiaRw7r8/TXM4pDzTErNwGAnE6GJtDzvL95+/bbwjA
         uRCopWE5zX+CVyWkHXfnyGqNkLGPtigmYCfkXVVjMw4uqe6pDqj7FN/ALzO8/oLGapiT
         X7VNs4iR1PlrgovSHtcWmF/r8+iQnz5YnGqNDdMniWxOwkKq0ZKQ1jWiri4t/UN/mxPM
         ebGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784058454; x=1784663254;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NjCijnCvUpLQ5hXkZKX1A/TF7R6tnAbvlJyfXTOe26k=;
        b=ZOOuXMSmN2LdHfu+YujlFMs5iHmfkOxY6RrXRXOC7Hp77PSouRON+b5B4Ll+L/ueyX
         Ki9AS9mWAxdWbVwmWAVrovWvr6G/Ls0Afvys0uj/tTCqVW7w20uTVQZLXlbsQqO4u7VY
         GchN9dhB744IHPNbPNZLJj11CrKTveEwGQp6MvZ+hW4Wo9cqXn3r2GVgC/sRi6vRkhlM
         bn6wZz3Qz1FE+E5yjPmzJeDL3ttlEGNxJu0oE9VC3oFRMign4SZZ56ZUS94qb/XlsBCr
         DUH+Z3SVRqVdbek6y0QRYgLBFSXT5NPD2Cd8u7fFiQIZwZC1N3V6SS08YWDhtOpeIYoj
         3q2A==
X-Forwarded-Encrypted: i=1; AHgh+Rqk0zubz79Bk8j8mIGo+q82IabaGSiY5zfSVYJNKA6UCfidb7oDVzoHTr36/14y5ImYwgasEhHIFmHx@vger.kernel.org
X-Gm-Message-State: AOJu0YzoMp4n3zU3Ez7SRtFA8j3lQKZdXHm9zHF64mtoWJw6/9+/Pa3L
	c8Zg8Pe64/m0CZC0b4MZ3d6+uQdUMxqT9AsAeo6FwHdQVS+u6Oc7p6I8
X-Gm-Gg: AfdE7cny1RLWzXB9KmQr2VIJf/dOBWEifdNria1HBk36Kjd9/pBFbCvhMgo9naUJgLh
	+oM0W28tY0i6r8yCxlULD3iZLfgjjKJuoZZao3tiAKuuidm2DzIoSLIhnnFL5DTUgorDXUhLQmm
	WkVKXlk7I9pWkNlC4BAShPDp2hfxdMenYrnB20NOLHan5aIGZvKbwjCuqPjgYChxvysQXSVExdM
	7QzqAOIbAtZD0D6FB44v/CweOKFExYb86zA84eDduoSzyqv2L/WGqeGqv8VY+tKOUoOK8y/QK+d
	A4AhyMrZLxcPWYd8aV8QfTUN+fhnHUhdPJvuo50/pSjyb+KFN5tiYfxHwEhwf/DH5tn/PZTSEP0
	a5AxapB2Rb5DbITdF4ndyGKptrLJObqj/CY3K/UMjuYtIxfnA/14Cy9AdtcvPG1aFeRCjNuU3Ji
	Ad1akkDoXDGa8bRQPUe0RD+czQ9/pkDsF+yC+dORnEfEbdMDI=
X-Received: by 2002:a05:6512:6787:b0:5b0:113d:8ad9 with SMTP id 2adb3069b0e04-5b1582596d8mr726361e87.12.1784058453771;
        Tue, 14 Jul 2026 12:47:33 -0700 (PDT)
Received: from MSI-LINUX.kielce.vectranet.pl ([2a02:2a40:27ec:2900:822e:374d:22e8:16cf])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b01ca50a8esm3780287e87.28.2026.07.14.12.47.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 12:47:33 -0700 (PDT)
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
Date: Tue, 14 Jul 2026 21:47:14 +0200
Message-ID: <20260714194717.596193-1-jakubszczudlo40@gmail.com>
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
 drivers/iio/adc/ti-ads1100.c                  | 151 +++++++++++++++---
 3 files changed, 141 insertions(+), 29 deletions(-)

-- 
2.47.3

