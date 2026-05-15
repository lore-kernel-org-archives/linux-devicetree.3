Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CDE83C4563
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 03:03:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778814213; cv=none; b=Ra7yUUabrp5oGZp3p9dPy2KKGix3bimRMNIwcoBdBjEpZWiPmngCeHOIrcgk1l1OkyVH6xI/U+ZLU5eelgr/x+8dZL4cA7fcyBa8NqdsUofBnOLKABVyC8jhARlZ1sjjTTjTlGax9ayqx59dKB0umI5RJ9dIFiMECvA2Q7PWIcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778814213; c=relaxed/simple;
	bh=OxGWlzEJeWEJ0/mwm6tr0gvLid5D4nkqPKsW4pKcxsI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=l1PfTVSVXPru41SazDTz6YsnlHMkvJ0flpXcSsndAps+NA4B0pJ/R9rtULVwBMviRKSjTrJirLvmmQhb4UUJajoZJi6mzSO/DDNEw1p9/z1QVCr49EfRkGxYDzhJHWANbF7xZRBCruTZ5kOpOj6SQ+hJK9aINZF6lMjGusTU9f8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=NC9pfFhP; arc=none smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="NC9pfFhP"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-2ff5472f263so5068505eec.1
        for <devicetree@vger.kernel.org>; Thu, 14 May 2026 20:03:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1778814210; x=1779419010; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mLc8hoxLlLR50zyDrnuTvZsozUqMQjyYuYXQlzRXPII=;
        b=NC9pfFhPtqLL74qC7izf8QTuDIgFhrYFu/sOIbEiQuKxQ9VweUWeOekJJLXTSTGdLv
         KyzUkFxgdhvkcVkpsvPSSnyLQQUNGMPTaVNyzlIjSjBjzgDSHAHuGGSHaETCH84uBtTr
         5oIE1CjfVUhYN/JbeLgsTVYWPHYmSNT7rbJ3XmLgjevjHxNR6CJ//KJzD4fmFlwKlFkW
         K+QushC0JHffGbrMB7YjXApP6GHH7tMpPVRYWJQCifvTkcJ0+MhvOqP5Zgh+wAEYy+NA
         ARuxZTtJytsp0fGMYrf7/Z+6+z3cy+pjrQnvifzhfbR1Bv4+6bGcTwblOf2oWUMqkMXe
         6MJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778814210; x=1779419010;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mLc8hoxLlLR50zyDrnuTvZsozUqMQjyYuYXQlzRXPII=;
        b=fTs+yWxscziwKTCHVwFdhIZtvjvGJkXBQId/qlu5XaK5fDAwFUCh6xXguCR6/iHvkP
         Df9yWkMgAzQ+EABhkMJCVr2e7q2aXoTuVbW+SdodoJv6ayVg9K93G7YBx5CzOgPA+SpT
         r+LXTW8oX9/E+MKq3lcym/Z2XwlhpW7KCnIPI35YbHRLAKLHBKixa1QceZZG5V3aLZX9
         z3AeCrDD40gD96RKVpVQBI+RJTt8RJR51v0zAllzyAD9S57wYMPhZVIU5ykBf1u2+Nkb
         T7mdOQxF2uNu3StDEWDbFWN9+7zP0ainLa1s/3BFHtgzl3IGIuCw0eAAlsx+CIdn5RCW
         QnFw==
X-Forwarded-Encrypted: i=1; AFNElJ83KdAr5Yqb1l8rBium+/1aEXg6I8vxx2DSVou76lYIv7S9wvpmGvP5MMuVBILOL7Z3pueY4diyQn4P@vger.kernel.org
X-Gm-Message-State: AOJu0YxMPvt/z2+iUWlAi1R/v/WDxX3iTdsygspKTWuWlN17FyRZepxd
	vCkABQdaTV4Qw306BQJ6G6OY4gronpL9JKc1oNGpwJJ9s80E8zHbzlmlERB7282wgEJ1h8QLbdu
	Eymm8RYo=
X-Gm-Gg: Acq92OGKieGufSkJe8lmuv/ViRZKx6ozNZqSkncD7wzNUKBvUA+RjOj8y18bKenAJib
	DuAtwwwk8Xxir+QqrJbr/uMXpk/TmUqEHkmDcLHrzuJDYnJF6rylxh2YeUpmZVBK1+F03nD6Cms
	mxpBydTMo4469zEuk0m1+62UKE5WMxth3N/eEL80ormaugfRtcU+U+hMh4prhqg1n/nrr4J5+tL
	QNA3Psd+GaXswXuH288yImT4oyT9uqrboKP9HaC40MguUkms6HcHssnWQEmUF8IMOwuQ+Q3i6Tf
	4KOdCm9/3IJ082BqFzYI0ynM0CZQbHiWS02QlWU+Owh8gjxwbfXhi2TvOdKYS38MzRdMBvl4AI6
	zd5EKRGc4gHbn8qrASw4ZHNQlbtW0JCuMjItkmg/J9/V7UV4ZPddOMmruinrX93+2gYYMo379cq
	buX67wP9iaWGmv/CMtM3fxq+S83A==
X-Received: by 2002:a05:7300:fd83:b0:2de:3022:a459 with SMTP id 5a478bee46e88-3039867f855mr1026827eec.21.1778814210362;
        Thu, 14 May 2026 20:03:30 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30296dcb6f6sm6347011eec.17.2026.05.14.20.03.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 20:03:29 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Subject: [PATCH v4 0/2] hwmon: Add Murata D1U74T-W PSU driver
Date: Thu, 14 May 2026 20:03:24 -0700
Message-Id: <20260514-d1u74t-v4-0-1f1ee7b002ec@nexthop.ai>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPyMBmoC/2XNzQqDMBAE4FeRnJuS3cQfeup7lB6SNdb0oGJUL
 OK7N7EgFo8D880szNveWc9uycJ6Oznv2iYEdUkY1bp5We7KkBkKzEQKwEsYczVwEmR0UQFJpVg
 od72t3LwNPZ6/7EfztjREHRu180Pbf7anCWLvNDoBFzxDSWgIUon63th5qNvuqh2LqxMeHe4Og
 1MSSiEqY4DUycmjk7uTwWFuqMyKFEmlf25d1y+R8WysHwEAAA==
X-Change-ID: 20260511-d1u74t-c0cba8f1c344
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>, 
 kernel test robot <lkp@intel.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778814209; l=4522;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=OxGWlzEJeWEJ0/mwm6tr0gvLid5D4nkqPKsW4pKcxsI=;
 b=w7PkR3H+B7QHqJ0Dsmsm4myLl30hSgmpND0PSJUJyfqGOm+XqGyC++1HuJ6yMudAFwHx/7eQM
 KCYR61U1AVqBny6anNgnbsIkDtCTS8F4R3olQVb5qRcideDIQGo6nRz
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=omTm9cCAbO0ZhS32aKfJDKue0W3sQGpG9ub5eYHif8I=

This series adds a PMBus driver for the Murata D1U74T-W AC/DC power
supply unit, used in some Open Compute Project platforms.

The PSU is PMBus-compliant and uses the linear data format. The driver
exposes:

  - input/output voltage, current and power telemetry,
  - three temperature sensors,
  - dual fan tachometer monitoring,

through the standard hwmon/pmbus sysfs interface. Probe verifies the
PMBUS_MFR_ID and PMBUS_MFR_MODEL fields before binding so the driver
only attaches to actual D1U74T-W hardware.

Patch 1 adds the compatible string to trivial-devices.yaml. The
binding declares only compatible and reg (no regulators, no supplies),
so a standalone binding file is not warranted.

Patch 2 adds the driver, hwmon documentation, Kconfig/Makefile entries
and MAINTAINERS section.

Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
---
Changes in v4:
- Patch 1: rewrite the commit message to describe the hardware (the
  D1U74T-W series of 1U CRPS-185 / OCP M-CRPS AC/DC PSUs, dual 12 V
  outputs, internal variable-speed fan, PMBus 1.2 on I2C) rather
  than the binding format, per Krzysztof Kozlowski's review of v3.
- Patch 2: update the Datasheet line in
  Documentation/hwmon/d1u74t.rst from "Only available under NDA" to
  reflect that the D1U74T-W series datasheets are publicly available
  on Murata's website.
- Link to v3: https://patch.msgid.link/20260513-d1u74t-v3-0-27bcd6852c45@nexthop.ai

Changes in v3 (addresses the sashiko automated review):
- Patch 2: move the new MAINTAINERS entry into the correct
  alphabetical position in the M section (between MULTIPLEXER
  SUBSYSTEM and MUSB MULTIPOINT) instead of leaving it wedged
  between CRPS DRIVER and CRYPTO API.
- Patch 2: rewrite the sysfs-entries table in
  Documentation/hwmon/d1u74t.rst to match the attributes the chip
  actually exposes. The previous table listed the PMBus-spec
  maximal set (crit/lcrit/max/min for in1/in2, crit for temp,
  max/max_alarm for curr1, etc.) but the chip only implements a
  subset; pmbus_core consequently only creates a subset of attrs.
  Cross-checked against two D1U74T-W units, both expose the same
  attribute set. Also fixes the in2_* descriptions that incorrectly
  referred to "input voltage" rather than output voltage (in2 is
  vout1).
- Patch 2: use dev_err_probe() for the MFR_ID-mismatch error path
  in d1u74t_probe(), matching the surrounding error-handling style.
- Patch 2: gate the MFR_MODEL strncmp() on rc >= 8 so a short
  block-read response cannot make the comparison read stale bytes
  left over from the previous MFR_ID read into the same buffer.
- Patch 1 is unchanged from v2.
- Link to v2: https://patch.msgid.link/20260512-d1u74t-v2-0-431d00fbb1c4@nexthop.ai

Changes in v2:
- Patch 1: move the binding into trivial-devices.yaml rather than
  carrying a standalone murata,d1u74t.yaml. The device only declares
  compatible and reg, with no regulators or supplies, so the
  standalone binding was not warranted (Conor Dooley review).
- Patch 2: fix the d1u74t.rst title underline (was 18 '=' chars under
  a 20-char title, docutils warning from the kernel test robot).
- Link to v1: https://patch.msgid.link/20260511-d1u74t-v1-0-623c2bc1532a@nexthop.ai

To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Abdurrahman Hussain <abdurrahman@nexthop.ai>
To: Guenter Roeck <linux@roeck-us.net>
To: Jonathan Corbet <corbet@lwn.net>
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-hwmon@vger.kernel.org
Cc: linux-doc@vger.kernel.org

---
Abdurrahman Hussain (2):
      dt-bindings: trivial-devices: Add Murata D1U74T PSU
      hwmon: (pmbus/d1u74t) Add Murata D1U74T PSU driver

 .../devicetree/bindings/trivial-devices.yaml       |  2 +
 Documentation/hwmon/d1u74t.rst                     | 81 ++++++++++++++++++++
 Documentation/hwmon/index.rst                      |  1 +
 MAINTAINERS                                        |  7 ++
 drivers/hwmon/pmbus/Kconfig                        |  9 +++
 drivers/hwmon/pmbus/Makefile                       |  1 +
 drivers/hwmon/pmbus/d1u74t.c                       | 86 ++++++++++++++++++++++
 7 files changed, 187 insertions(+)
---
base-commit: 1f63dd8ca0dc05a8272bb8155f643c691d29bb11
change-id: 20260511-d1u74t-c0cba8f1c344

Best regards,
--  
Abdurrahman Hussain <abdurrahman@nexthop.ai>

