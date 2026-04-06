Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9604E370D47
	for <devicetree@vger.kernel.org>; Mon,  6 Apr 2026 07:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775461889; cv=none; b=DeqQ47rxrpOSm3yMv0wCoz8rBlLobYrXTpy5ksftwLZSlOTPvGFsl+tQCfwN0sQHF39IyRn+Fj0/rJQYVaF883w4dBPCuQUTPLHHwj2SjCNv1ddebZZ31bBXIz9QlZKhVARykm4VRC4A8Q4RRrb2EkgzHhfHWTNplaLI7Z9a+lU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775461889; c=relaxed/simple;
	bh=SEmsAqHjWzSjMRRIk9zZE76RG8HXzQCV9AOLnG25kjU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Mbd285gFzSPVt623AqgbNWNr7TwVD9sVsP2i/CzEk/Qjrw+Lo8Ec2GZmHFNbXpkhHiYAWEmjdYpM0n6VFUZ6Rg+pzuv+un8mYe7gfhsJdPEg2+TQNI7uqJJMYsSDqJJsacEYwQKiyF2gr8JZhmEsYraxdDMHLRpNDVBn9vpOLxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZwINUzzN; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZwINUzzN"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-488b8efed61so151865e9.1
        for <devicetree@vger.kernel.org>; Mon, 06 Apr 2026 00:51:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775461887; x=1776066687; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6rsA0Hj8nsuRsqpJ4sAx6KrXhjtnw96EIBhafsErWLc=;
        b=ZwINUzzNNI8BbGWL6v3rkB+wPTIdXxQejjVYahnNib1osa1x/NQYZwEYxxynCMqJP9
         s6KQT/m5J4daGTGUSxZBTkwigjXpTc0wwak2L9fBQf4oCcw7kkxAocDzqO1zjNSApv+3
         2X+vvWn0hjkyMB+i743QD94T0E3zS+YUiUaNa+ND3JlawJqo80ViM7JPyoA8oR+nuZ7E
         ULzAmR3ZW7oPzHo4x6UlT8CZ7fgTAzLbqP69rmw/tO0Wvi3Yu9FeG1Q63dG7t95iwG4A
         ark/uhhpZh41s7E/1BfcYcDQhGzMjGw+16Ar1FKDf5nGq+OKzwsxC/hbWLL0iNHw3Gw0
         cTig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775461887; x=1776066687;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6rsA0Hj8nsuRsqpJ4sAx6KrXhjtnw96EIBhafsErWLc=;
        b=azvH5TAmqh45vl6yJdi4ssIJYfjTGmDZkkkd5q/rPzzkiTtfpIGZIFnniJQqcDV+nT
         SwFitvSiveDliaLZqizlGtAhLW9B0IHuNkCigJx4MCbH8NPfR5kek9P5tt4YeAHBdU/3
         0L6y0YZ4E/y9dXpRGgWPvKeZYL/AAAfjw4SmD5Rmatrq7fol3j/ErKBlJ57iL+RrgimU
         2j/gR5w6/qPHPyOfMq9skPeDBfbEIDSKXNlU0M3VP68ifbQSJ7QQyddPSp6jqCsjfY62
         aEWAnmK7HXk+hgQzowK3tJthKAFmf9mpjbCEOFJ83c2Cis5KlGGjne5e1x6hvFx1szNA
         SPFg==
X-Forwarded-Encrypted: i=1; AJvYcCX17SgdRLw1BEPHmO+2Mjuq57702fUWHu1P71k03g5J2Yi+631QgbRt3RRPnjY8YfJstU7H0Zmf7CPR@vger.kernel.org
X-Gm-Message-State: AOJu0YyrfPX18m1SwLdzYIf6qTNJGPzNB/IdG+b2B3ET1TwA0PtkzTzb
	8wAh9L5Eb/Tf4yJvTMDTCLSwxdyIKsnCDTLc+Ye/5CgxHF+R74tkM1Z8
X-Gm-Gg: AeBDiesvgDQ7xiNyDx0g7+D2DnIAp3nLpFsHUbWHzccPZ2sTZM+bla0RpYQ3sauoHAD
	63M0eoXTH6fBpoWnxlBpltZDiZLRKHwqfXVxsw5Zoqe/03YM0dUUFl1f2LTL7cOM6nmTyJaIcci
	avS7yiEaejM3Dx447AdZnORXt06HOwGI0DQMvbpNxmvY9QTjDOzhPFb6ChMcj/W4XDiito7okcf
	8s0qyGkmCjyVrRs1D21IgM9wXoJ0DmFMd0lvUg7gSiRM7j5MGD3oIpJ0biqy2fpoVgH85bqOJdQ
	g0K6N3My1n1Yic7SxHhiNuhhYPDQkQjJ6KAntTaxDHxX8RZvoQP1jqG2RRafBJFsSnWnxbUc5zr
	7jNAfbE17rzeJEDWut0bVc74cnY3KEf+7EmKdyfpBOyG1Bxb8YXFy4tIznVAXOhrlOfkLcQCxOt
	+BHVI+Cf7P37is
X-Received: by 2002:a05:600c:c0cf:b0:485:3c2e:60d5 with SMTP id 5b1f17b1804b1-4889945f8e8mr108708845e9.2.1775461886934;
        Mon, 06 Apr 2026 00:51:26 -0700 (PDT)
Received: from xeon ([188.163.112.56])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488b739e00bsm20393525e9.10.2026.04.06.00.51.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 00:51:26 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 0/2] rtc: max77686: convert to i2c_new_ancillary_device
Date: Mon,  6 Apr 2026 10:51:12 +0300
Message-ID: <20260406075114.25672-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert RTC I2C device creation from devm_i2c_new_dummy_device() to
i2c_new_ancillary_device() to enable the use of a device tree-specified
RTC address instead of a hardcoded value. If the device tree does not
provide an address, use hardcoded values as a fallback.

This addresses an issue with the MAX77663 PMIC, which can have the RTC at
different I2C positions (either 0x48, like the MAX77714, or 0x68, like
the MAX77620). The MAX77620 value is used as the default. The I2C position
of the MAX77663 is factory-set and cannot be detected from the chip
itself.

I have tested this patch on LG Optimus Vu P895 with max77663 PMIC and
non-default RTC position. RTC is registered correctly.

---
Changes in v5
- fixed pincontrol schema
- dropped applied patches

Changes in v4
- adjusted pinconfig node naming
- changed interrupt in the example
- fixed indentation in the example
- corrected pinconfig node name in the example
- commit "dt-bindings: gpio: trivial-gpio: remove max77620 compatible"
  squashed with the converting patch for this compatible

Changes in v3
- max77620 files converted to DT schema.

Changes in v2
- dropped patch that changes max77686 and adjusted max77620 where max77663
  is described.
---

Svyatoslav Ryhel (2):
  regulator: dt-bindings: regulator-max77620: convert to DT schema
  dt-bindings: pinctrl: pinctrl-max77620: convert to DT schema

 .../pinctrl/maxim,max77620-pinctrl.yaml       |  98 ++++++++
 .../bindings/pinctrl/pinctrl-max77620.txt     | 127 ----------
 .../regulator/maxim,max77620-regulator.yaml   |  99 ++++++++
 .../bindings/regulator/regulator-max77620.txt | 222 ------------------
 4 files changed, 197 insertions(+), 349 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/maxim,max77620-pinctrl.yaml
 delete mode 100644 Documentation/devicetree/bindings/pinctrl/pinctrl-max77620.txt
 create mode 100644 Documentation/devicetree/bindings/regulator/maxim,max77620-regulator.yaml
 delete mode 100644 Documentation/devicetree/bindings/regulator/regulator-max77620.txt

-- 
2.51.0

