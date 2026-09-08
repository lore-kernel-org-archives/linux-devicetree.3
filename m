Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F25ED59D60C
	for <devicetree@vger.kernel.org>; Tue,  8 Sep 2026 18:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788892461; cv=none; b=FnVPTtE3OL8Gkr00q64k8O1+Fsw1fORtXZO/KOlbOwe/BNrGVOaNZmn47RJmdkgiyscMWmEIyQD7SjOOF6xTwO9CwTbxTErSfvJEJJOyl7sgfxq0F6HtyzZwAV5DDB/qR771fkiprCOGsPUJoXIX9Iwy5wf2Oxgkq/tfFoJyx40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788892461; c=relaxed/simple;
	bh=4eGTP4LUxsjfl69Msy68378nEsw33bHsm07+fTnlLT4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Cc8eRgLPfmLz1dsJ2FdGiVb9xHxaPm3vmoxQD1j9C781ZiWkP3ZjwcZkdlt+dPyWXCej+aNbzB2pJHejKw37X/iRW5eTqC5hv/Boeze4tTzQzQ3qP9iWKW/gqnOQabF4IR0IKka9E2fHqExRyOpK9Q+g3pO4gSpSZCxl6k55PK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=efl7mipp; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="efl7mipp"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-4859245e493so2631587f8f.1
        for <devicetree@vger.kernel.org>; Tue, 08 Sep 2026 11:34:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788892455; x=1789497255; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DlzHWsXat6ojDJ/DAFZB3TdvYphSiZcgNgIhwrwJoq8=;
        b=efl7mippk5rRe/T7glofPen+X0bnSTrkcumgHFCpVOH9vMwvAgiFBC4k5YQKMNcJvf
         9iJfRpUipv3ZaeZcGr9QxGTbFWy9gXY2NTCF7BR9Y7zvN1IANDO1jx24AZbneLEm/ncb
         JwCVSbjXjibhsaKNAQXlall3wQGcKvgPPVmRLhoRFJhXV1H1aHGg70O5rj/e7Gs3UKzF
         daYD+SSshnPNCtD8BhLfTLqI3Thxn9bVd48UH5pEMLQzWhG1ivHRaZhLDDbU2J04e+aT
         HYNbWxErBoiguchpzQW+if1OtFHlUCUAIRorxZcsz99r6AaFtle5gThTb9fybgra8vHK
         n8rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788892455; x=1789497255;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DlzHWsXat6ojDJ/DAFZB3TdvYphSiZcgNgIhwrwJoq8=;
        b=aYSSxjvuO/eWvEXj345PDHTvlZ1BWSnptE5/U4/0eT9ndXykQX8h7HFbmckRpikJR5
         //o55lYc1gtBaeYACgd6Lb43lUrZXTqINzddgLZ/UffaLcpGmjfb8n4TEVaP1ieECR8r
         z5oRsKOqtm3gmuV/HrP4NBXGn3HwIqIgdrC82bF9k7GM5QBiC5QEKg1bqEewqVOK/IMg
         BbfU7CuPU/xqfkuEws7lTdGw+RFKjEbfjn3bD7UmSDcpU14pik7gHY4ceFqEihnMTDq9
         M7cnZVQ4ZVQmAPC16NIeRHbj44rjqQu0TqZj69jOc70ecfCKiYBKQ5MLW3LrlATwQJ+c
         KzHA==
X-Forwarded-Encrypted: i=1; AKwUvBzrIaHuJmhzSoIya9ib2mWub6XWeh+CLnGV190BPEVIWL/W7jYLePlS47dhLkxR5vT1nabf2uTsOknv@vger.kernel.org
X-Gm-Message-State: AFuF++ljHoI4LH7Juaj7xzQ1yd24yrQyDs7KW8TuFGiCQet417EqRcNz
	0tkcFERfP7+AkME6ZkmsJv65EHtigc25sxc2MPlmrfll/HF/50QgmY1k
X-Gm-Gg: AYBFou3qfQe+yi0YKCOg5y6zOycCIU5QIM07DiOwq/UD4cn6n45vfFgpd/chOlr1Veb
	qisZorhOJPKqSaPfrOIlgD4IRpj94s9lAvZ4z7v5pPp5r8XrSZXN2XSvLkquAubOhMW75hl5RJb
	45OyeuoPxIqMaeSt19C7K4ryuwxoJ37N6Z1V2H357gVcBrTLowV3CwlbZW3CtCwSL4CklftmE0J
	fc3/VMjxxh/TY8Il2z8m9OcPJmXbBZHk4XjuTxSsMCN1RY4kk7PaFyUlynWuQROQM5aJe432N3R
	Vkc2ZSMZXpP26HualoxaVun19fieTzgP7i/S3tNcL5WJy2Xx5pecvFbylK6Cx1JyORYhTeQbrn3
	xLFb13CkwJTfKjhr3EGi6eSfgtaHjWZFBXhl2BpWz14xmpTv8czZ0Kt6PdnYSPkvr7AEvtreXZO
	wcWdB5uKXw/5gI0FZHlYBP0pKFohM0AwDkOvIGq9cyid/nVlvDvUwkdsoalMH62aVr+XTLon5pV
	AbHtb0fkTArE+uBN26KPIEAyDBeaCvg
X-Received: by 2002:a05:600c:3145:b0:49d:1916:59c7 with SMTP id 5b1f17b1804b1-49d19165a7amr67722275e9.7.1788892454444;
        Tue, 08 Sep 2026 11:34:14 -0700 (PDT)
Received: from localhost.localdomain (mob-31-26-103-238.net.vodafone.it. [31.26.103.238])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49d04fe7f9dsm312095435e9.0.2026.09.08.11.34.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 11:34:13 -0700 (PDT)
From: Oleg Keri <okerixx@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
	Guenter Roeck <linux@roeck-us.net>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Subject: [PATCH v2 0/2] platform/arm64: Lenovo Yoga Slim 7x Gen 11 embedded controller
Date: Tue,  8 Sep 2026 20:34:01 +0200
Message-ID: <20260908183403.2107-1-okerixx@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Lenovo Yoga Slim 7x Gen 11 is a Qualcomm Snapdragon X2 Elite (glymur)
laptop. It carries a Compal EF06 embedded controller on I2C at address
0x70, which is the only source on this machine for the board thermistors,
the battery cell voltages, the fan tachometer, the keyboard backlight, and
the mic-mute and airplane-mode keys.

Patch 1 documents the binding, patch 2 adds the driver.

Why this is not qcom-hamoa-ec
-----------------------------

The Snapdragon reference designs - glymur CRD, hamoa IoT EVK, Asus Zenbook
A16 - place their embedded controller at 0x76, and
drivers/platform/arm64/qcom-hamoa-ec.c drives those. This machine is
different: only 0x70 ACKs, and 0x76 is not populated at all. That is also
why the firmware reports every host fan capability as unsupported, since
profiles, trip points, LUTs and tachometer queries are all addressed to
0x76.

Binding qcom-hamoa-ec here does not work. It speaks a different command set
(0x05/0x0e/0x42), appears to probe only because it never validates the
firmware version it reads back, then reports zero fans and leaves the
interrupt asserted at roughly 25 events/s indefinitely.

The ACPI tables describe both controllers: one at 0x76 (OperationRegion
DVUM, fields FC20-FC2A) inherited from the reference design, and the one
this driver targets at 0x70 (OperationRegion ERAM, battery and charger
fields). Only the latter responds on this board.

Notes
-----

Fan speed is reported but not controlled, deliberately - the EC enforces no
thermal floor over a manual setpoint. Patch 2 has the measurement.

The DT node for the controller is not part of this series; it lands with
the board DTS, which is being upstreamed separately.

Tested on a Lenovo Yoga Slim 7x Gen 11 (DMI 83QR, "Yoga Slim 7 14Q8Y11").

Changes in v2:
- Patch 2: drop #include <linux/mod_devicetable.h>; <linux/i2c.h> already
  provides both of_device_id (via linux/of.h) and i2c_device_id (via
  linux/device-id/i2c.h), and the header is on its way out.
  Reported-by: Uwe Kleine-Koenig <u.kleine-koenig@baylibre.com>
- Patch 2: add "depends on INPUT" to EC_LENOVO_YOGA_SLIM7X_GEN11; the driver
  registers an input device unconditionally, so a config with INPUT=n did
  not link.
- Patch 1: pick up Conor Dooley's Acked-by.
- Link to v1: https://lore.kernel.org/all/20260908091752.5508-1-okerixx@gmail.com/


Oleg Keri (2):
  dt-bindings: embedded-controller: add Lenovo Yoga Slim 7x Gen 11 EC
  platform/arm64: add Lenovo Yoga Slim 7x Gen 11 EC driver

 .../sysfs-driver-lenovo-yoga-slim7x-gen11-ec  |  21 +
 .../lenovo,yoga-slim7x-gen11-ec.yaml          |  56 ++
 MAINTAINERS                                   |   8 +
 drivers/platform/arm64/Kconfig                |  23 +
 drivers/platform/arm64/Makefile               |   1 +
 .../arm64/lenovo-yoga-slim7x-gen11-ec.c       | 638 ++++++++++++++++++
 6 files changed, 747 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-driver-lenovo-yoga-slim7x-gen11-ec
 create mode 100644 Documentation/devicetree/bindings/embedded-controller/lenovo,yoga-slim7x-gen11-ec.yaml
 create mode 100644 drivers/platform/arm64/lenovo-yoga-slim7x-gen11-ec.c

-- 
2.55.0


base-commit: df2908090cda368b01ff43709f51890076c56157
