Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794733892;
	b=TIGToCW07e1dclrY2Bug9PY4dHaOZ7kDZPhY+2D408bGRQ1jBXl7WthdmQxCNRHRpShk
	 rX+rS8jcVV4wWQxpcRD5RTaumhDbbPph/TKrV6ShxS+pUmBMgYDUJOd68fi4KXVwyPNx9
	 1yZrCSVkalmhKvvp8sADgLkD/q6xbl8oQ/FqGYYd0JBYhHOJbpftvnAn1jpIGLs+4y0DA
	 DpXNsMFUOfiDhn4gV93DNCQAmP7nMCfuKsT4kIVHX2tZfptMSF5ESluH7pqGaSTkH96bd
	 060xkMjM/248OxuRqH2YX+3MczIydy6QI0W6ePc/I8xA/HcL5qXJgcZZ8EXC/7JIQfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794733892;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=j40ibOKM4mRf4qD2apM+zYLryIz6pOPTKlMB8WE+osk=;
	b=I+C7UU1sR9z5AbpsiLXut8p+txtpB8qpnYsElxHlnYHUngcKyELuUsbUD48yG7e8558M
	 O6zxbS1rWSErDq13y4krkNe3Z9fzUxTKkBEjOJu7P5EpnMCkqoF5tlvqWDB0tzD5z3swq
	 Fs95/T8hG1almXOnG2NyGzqLHqlMWlKaODyRUwTQwhZy55Ws00IWjuKQk7oeADHplGYuT
	 CqW6OAa78iYPICU9xVWR0+BukXHQ/fVBpNZNTTOAnfP8senN0ogof/n9YZDPdgFPYOCDu
	 dtENVCdvckxPdn8o/UHXVAQVWMi/hVIJCdLCG8lsvMtXOA1lIQeLSlKS9/aAgjmxY+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="ndht/p0t";
	arc=none smtp.remote-ip=209.85.218.49
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A6F6606A31A
	for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 09:11:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A6F6606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ndht/p0t
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c4d2b741ed9so407835366b.2
        for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 01:11:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794733891; x=1795338691; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=j40ibOKM4mRf4qD2apM+zYLryIz6pOPTKlMB8WE+osk=;
        b=ndht/p0t8qzPcRCOk7ccV7NMJ0aBn5qjhK+k0s7XUYFCqoS9bzZHxRR1qN/xgeDfsL
         E6/Sf6PNlDF1X1BQXrcYiBXlZ+4GLcOEp1c12bIHqSLtfR2YXxMyHbZJ98z6ERj93u+R
         FR4Qe4j5xhltHAUb6ZRtMHSBttLlZkSHCWbmlNCMcmrH5Fn84HZa6zNDd3e6bGAjN69C
         nWXawJB7gkePvTobYFw9qCja34OCVO+rqyvTPMvo7D9zQBce7nXm5vfZ/v3p8+vIa4kd
         nakgFWlEPbxaIg0T0RyqqsN2vSJ8lsrr71fizH+flVDIz1xLClUJLBo0CY4aEXJZn6Hh
         pHLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794733891; x=1795338691;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j40ibOKM4mRf4qD2apM+zYLryIz6pOPTKlMB8WE+osk=;
        b=i7S69Nk9czzOJaMUCfSoHgL/Iu505bDKHtwtpQD1v2iW3zvY7t9k1iglx6+Z6r+HhF
         j3Djjb3U0By7G1WyMEivxWdBPyOExlh9Rjvywt42I60JRZvxO02MMZvNvcinDofSaW9T
         EWz+7B2HzA0w1n3G3TF/F7rRhr7WJ3/l9X6KT0K1gStzWRs3kdujvJbYpkNWyIUjCdHr
         Zjp8Ev7O9Reidf/pmq6BURiHDJyBptumLrVHPixGGISqIUN9I9lx68w5BywqThByVyiT
         oslsZjG+1mJKcMGpXmiNQwht+yXlFxP3OkSLHLuUcUBxmCLhk6MN5Bs0afCtd2WZAbqX
         HRWQ==
X-Forwarded-Encrypted: i=1; AL+hErFPeTi29FLEFN8UVuZJu9OwF7rl8ZOfEXc4RZIMjeQpiT3DLjOYa2lHgPGQH4oo4eEEAuwkofxlO7lN@vger.kernel.org
X-Gm-Message-State: APuU4Z9UOJCe1/UqyfCQQB6bu95oK22Lqa98iCMjD8zkQLl8pOIPdagf
	jbK2oz3JZJz8ULn4V8qrm8pJ1Hfr0fyufMNTd1YjIZQ1Uc9X3Ad0ShZc
X-Gm-Gg: AYBFou1MkDW16DIVpjmrc2P8DuCr8R5pHAiOr25enfstWnQaPKqv8N7ahmQHh6T7ppP
	lxF4ZyZMc0Ik8Yc+/gdV9+K0FNbgEEoNRS4q5H+k/MhcJ2I66On5jdgwugyj5v4WEGqwgvSu2N6
	uW6tLkaAzYXf+fP4CK4KbbF44MpWQTwK6X7yrup7t61ZsE2YtGFjlpp8H7DE0IhbzMgWzDUZwTq
	9UvqnbHXcWdv8ABt+kc89WA4TeNj/gaT0aVc9wkvrguEX7W09AtXFjJi3DgWrpgVY2SUZhGqZCH
	RkevJSvxWUFReQZXQDpIvkoDgTcHmi5aJ6zaDCK0gtnRH0LClXaVBGhuB9ke7EE5tWDgkelaBTe
	Y4CqjX6NgLx3Qo/FgMqREs6RGOvmlvUQbSNSeCErmohY83gQlKQ0o30a6EnZTLdSugz6hOd+Q+P
	KtWJ3rdH/7WnAXiWndWeoYfJ6SuNKyjV//NJQTZYS4sWezx/d2K9w4GVILDbNWqX732W6/KMQMb
	lHb2SsO8uH0EhHWrqaXjwPjuci4eeIBsxt4iOFm8PjlhyUJdeQ1t/CSmhwpUMP6WPI8USc1+Z93
	NSimGlNOH7YElgwMdxqpXVOJDtfy4+GbsTHVWD8LE5A8ciYQwiN+81tq00CTlxQZQQTWgdldJnx
	chjP22itOkQ==
X-Received: by 2002:a17:907:7b96:b0:c50:62ca:6f7 with SMTP id a640c23a62f3a-c50963b3398mr628172366b.25.1794733890485;
        Sun, 15 Nov 2026 01:11:30 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b3dbaesm289392366b.32.2026.11.15.01.11.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 01:11:29 -0800 (PST)
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
Subject: [PATCH v2 0/4] iio: adc: Add support for MAX8907 ADC cell
Date: Sun, 15 Nov 2026 11:11:16 +0200
Message-ID: <20261115091120.108684-1-clamor95@gmail.com>
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
---

Svyatoslav Ryhel (4):
  regulator: dt-bindings: maxim,max8907: Document io-channel-cells
    property
  mfd: max8907: Add ADC client support
  iio: adc: Add support for MAX8907 ADC cell
  mfd: max8907: Add ADC cell

 .../bindings/regulator/maxim,max8907.yaml     |   3 +
 drivers/iio/adc/Kconfig                       |  10 ++
 drivers/iio/adc/Makefile                      |   1 +
 drivers/iio/adc/max8907-adc.c                 | 169 ++++++++++++++++++
 drivers/mfd/max8907.c                         |  75 ++++++++
 include/linux/mfd/max8907.h                   |  53 ++++++
 6 files changed, 311 insertions(+)
 create mode 100644 drivers/iio/adc/max8907-adc.c

-- 
2.53.0

