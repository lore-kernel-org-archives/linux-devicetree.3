Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795446458;
	b=UVye5/c832hRm5fckyUMGsaGSg1rlcMBq/Tuto3cFVo6Wdnniwg4w/VmsMeErfDfjHxq
	 3QPe0k8idZqylpa+1lTpQHDImm0ycVzkv8HVltwpAfgqWS4TwZCsXS7g+q47sEpgeUwEX
	 lSKb7+fgktQ6foxs2vKeDYcXGS4Bf2z2v236TWvvyPuz4uR/my8ZOgRN8ZIjDZq/uorMY
	 Q/E+W6nyMl0enxdEEYh3qIifC9uyAZG9+nlLnGfsYosiiuohorNea5VcUCzGeq8hjlpzZ
	 apfOck4HurjefmOBkASizj3kQzJ6kb9kCOorLEK3G9IkWioH4qTNVIzCETu/7rCMr3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795446458;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=LrQqNvxu/j1cHnx9Lcyw23sony0Jj3XqLz3lYlPUdFQ=;
	b=wzqDURJ519vRRC8K7OLnNI/CbC6TxNMb08jeNJx2vHRCff3Gzt7sGVHzz/TxLL5RtRrp
	 tEeaY3zMFoxW94shnNG5458tbrqhE7ErB/vH08jfHW5z10MGgB7/fW7lNYsTNocGt+p/8
	 K4Wu/7ZNiuq9q4uNn2rMRF2fZSrFPinTkC0p+1geEZ+Rrw7EaSeuz6k+dF8NNBbr3uzMz
	 8Jjg0UnzPUOrk2wo9mqBMOZiT7Sq0Fey/Uzq824Ujj33N2JIQ/lcVIYdcZCcjltfyNpzO
	 zEMWBBoBAi1hagOV7tYnW0BtnYk2xL6OSzl1ke1QR1AjEmRxbZgNMLt47IX8scLFm3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EPqUHYLo;
	arc=none smtp.remote-ip=209.85.208.49
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A598606A321
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 15:07:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8A598606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EPqUHYLo
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6b596afb4c5so3752250a12.1
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 07:07:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795446456; x=1796051256; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LrQqNvxu/j1cHnx9Lcyw23sony0Jj3XqLz3lYlPUdFQ=;
        b=EPqUHYLo+3zB60AG4ZmvSvS4PSvmm+KHS9uXrJd0s6uPr9B2Hpk1VdCgVuvcXvxzAd
         DoXVOKzvYRXVHugk7MDe2ZoWCKuV+M3+rahOrLMtDuOmYKebrCh9UReTGHxXdTWdRDUz
         828iB4GDtT2Krpgh+0D8R/N7wpVooHNmXDgX6ujKscBDiYqa6vbywVj12qLWIHGOjXSP
         R3elBqY2PN+Hk78FRgH4g1Irmra90YL+CdzF5OOb9Zi1Myn5msN2gcghX8Ls4mPZL+XM
         RsiQpFUFnEliQhpw+CI8x0exFeoMT+OZU27N07TgIBkQbtzbSqgPLK8AGX0zCt6U+JCR
         JUjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795446456; x=1796051256;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LrQqNvxu/j1cHnx9Lcyw23sony0Jj3XqLz3lYlPUdFQ=;
        b=hEpGV/Je64tijkqmnMNau2izCRb9jyba+QKNN6ud2FzLciv9ZPNk+jc8wBTRs+CwUi
         3DYRYuu9iKXzNnaIg5JRMn7FxQdAZ1fnsVu03trUWChXjUq38+fbl+Oe5hu2c2dipVv6
         DW0Sy27qS20JmuOhhfsjhQh1U0YxFDAxa08wZJEdaazO1bvxJ5ufG+mEe+YJOop6iPtf
         bbM0oUPYD/bPZfZTHG6oya9jZdwjwJY8lZtU4BpcTG7pXWmca51BHqnu1edA2uUOjnxC
         Nw0ftXZ4cqwiG2A9+bYTjZgzb/oJySXmV03GejEmCWfgXg67bVSZmNzWQiqCRbZn+H1l
         ocSQ==
X-Forwarded-Encrypted: i=1; AL+hErEjsFmXZ1yXQ+2QxFlaDS4bIvpgrJS6BQjHl267BZRTyI0j+uHl2mRC19h1PWafjPq/KSShUd/9jmCB@vger.kernel.org
X-Gm-Message-State: APuU4Z9pv63FKHGf0nhYiiqbueW/UYL7RCkEfaaSxFQqTDBzqYQlKgKG
	qXdsTrwPCTIaKCGUaU0dQsafcVcO0+Z2nGV7g9wdSPfp01KRPLltObsKpVvqKQ==
X-Gm-Gg: AZFdTZdRJJij3vW+yP/e9H2yRpZhyjkrQvI7HHDHD1xD7XZZ7995vq4w8Msi0+7/SRx
	4LnA9KOkur64zsmEUR30gZ2jkHaFPM1aVVRY8bWxXHlJduECahk/P28wTgEV+Cwqv9LR3Y3fRuI
	dHo85XyhiVKhTfuWIt9qkwu9nGF1GQXkukYM97rCaHUr9scFD4Ppe6M7Kx7O6OBpASKMsrXkibd
	wB9yCdcARV2SXSbJnN8DIeNufGBtZS25TZlpV86i+cBYOehGh1My4ouAaRS8Nzz+SCWIX9sHmpu
	130WUz/MFsegnbFlLR8yYjmw2uYS4lcUMKYfe93EuAhCkWqXsI5Rpg4uiWYtF2apau3j/ywBbUK
	ZUEMEeeAy/NeEYahEzBGeGDFdtZmv0geQo1/mf4EqgiFN26TMq3HyIFqPkinKQ1Am6wTrTWiObT
	5tk87va4zMgfxhGJPY0VZBhKllvxyNJO3RUwHnz4WJZxhgrRoLl01PESv77fx0X1ym4szuGyBcJ
	6yiofegCwZY280kfGYgYSwjaGkbFuTuJtnZAH1w/DYGSsBcm9Ny2zIFELWQAyhC9p91ObQ5GGtS
	rQneWEt56l449U7qtS28C2adGQlHG5ysm/YWEtqtZHp+Me3YsAGjVDeVQmGQySmy2e9y+mqV1Wi
	oaU9eX3ZvRA==
X-Received: by 2002:a05:6402:4416:b0:6ba:b24b:a25 with SMTP id 4fb4d7f45d1cf-6bab24b0fc3mr2248751a12.7.1795446455855;
        Mon, 23 Nov 2026 07:07:35 -0800 (PST)
Received: from xeon ([188.163.112.54])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370fc020sm5446279a12.25.2026.11.23.07.07.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 07:07:35 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-iio@vger.kernel.org,
	mfd@lists.linux.dev
Subject: [PATCH v3 0/4] iio: adc: Add support for MAX8907 ADC cell
Date: Mon, 23 Nov 2026 17:07:21 +0200
Message-ID: <20261123150725.212836-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
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

The MAX8907 PMIC has a dedicated ADC cell, which provides 8 ADC channels
with information about different parts of the power system, including the
battery, charger/plug, jack and thermal readings.

This patchset has 2 dependencies:

- patch 1 of the series requires this patch
  ("regulator: dt-bindings: maxim,max8907: Convert to DT schema")
  https://lore.kernel.org/lkml/20261027114634.79706-2-clamor95@gmail.com/

- patch 4 of the series requires this patch
  ("leds: Add driver for MAX8907 LED cell")
  https://lore.kernel.org/lkml/20261027115006.86032-1-clamor95@gmail.com/
  Or to be sspecific, part that adds max8907-leds to max8907_cells

---
Changes in v2:
- remove unused register fields
- add prefixes to used register bits and macros
- default reference values indexed off the enum
- swap data array to __be16
- set bulk read size with sizeof
- return directly last regmap_update_bits in the max8907_adc_init()
- added comment for iio_device_set_parent()
- MAX8907_MASK_RST_CFG_INT_REF_EN > MAX8907_MASK_INT_REF_EN
- dropped kernel.h

Changes in v3:
- explicitly assign values to channel naming enum
- add missing headers
- loosen regmap_read_poll_timeout() loop
- rename module description
---

Svyatoslav Ryhel (4):
  regulator: dt-bindings: maxim,max8907: Document io-channel-cells
    property
  mfd: max8907: Add ADC client support
  iio: adc: Add support for MAX8907 ADC cell
  mfd: max8907: Add ADC cell

 .../bindings/regulator/maxim,max8907.yaml     |   3 +
 drivers/iio/adc/Kconfig                       |  10 +
 drivers/iio/adc/Makefile                      |   1 +
 drivers/iio/adc/max8907-adc.c                 | 181 ++++++++++++++++++
 drivers/mfd/max8907.c                         |  75 ++++++++
 include/linux/mfd/max8907.h                   |  53 +++++
 6 files changed, 323 insertions(+)
 create mode 100644 drivers/iio/adc/max8907-adc.c

-- 
2.53.0

