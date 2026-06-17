Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 423743B8412
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 07:06:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781679976; cv=none; b=CTcKpEf/p2I+o4LLTcVqx42y5I3A/IRBLB8ybpD47JDvn6x1G73xzh9UGJ9xcBLKttqQ9HXGqeuvhjX6NQMZqkIC1IAqRwkI9dxlLGtdtkcngkE33+te/Ev9uubmVh8P/HbNtDxvuvTcCHwELmadn8WuHODpQ2tRqfT76AFJ0X8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781679976; c=relaxed/simple;
	bh=ywM5fxAP7YLHk3plDUVugejdL0ti6Z+u86nyhpgQsGk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oOBAandAwq5ZLJLLR6bX+dQbVL985WwKHPjP7r6ZbbP+5NrtMBOELr5qXm5/zX2SWiig8G+NWRBhA6mUrraglgptW4GIaHgd/01uWUPYzMIveBz62OnkiDVW16ssadUwqxvNy7aqtpENzPa0HPa2+mFxF7CtdvMT9YgADbSFeHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lmXVYytQ; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lmXVYytQ"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-bec405a6ea5so775715666b.0
        for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 00:06:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781679974; x=1782284774; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Kh2zmRfLqBJkX6ljmJ2Zzgk6D+llpzzKDQIImg15hLw=;
        b=lmXVYytQtldzCj5PPlvIQBDcms60DS0kfG+qPdeM56zEyEMVfnx9OT1ZHcS0tNM+zk
         gc6XZZWy2bPgTSXqRdvQ2Y0d0q9sxHATyw97v7HNZsaXqvUhZhpMscnCkovj1mlkWvSl
         tD6078nmE5yOwAXHrgDfJ1nZ0yStXNIC/ZxbAIPfP0uFRehJAiS9gMsXRAoQaBzfDqg1
         +Kv+kzMZyrGRdwJq7pOBkCU7iALhcYawTNP3jppuBmRnzD10dhv2biXuc0CCsD1HcZLD
         5jaaRuBIB+Engdbrac8x9l2lMWP+17veO8pvoUVy8aQjsccHFZEZ11ezYd/BK47JmzL9
         EMQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781679974; x=1782284774;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kh2zmRfLqBJkX6ljmJ2Zzgk6D+llpzzKDQIImg15hLw=;
        b=sT7kFy+lRgqL3GCEpoupvzSQdJhJqt/CgNnhSv2lTm6rv4aq2pV25+VI8rFYT0NwCr
         hQRW1bxi8VI5UeZLEl4LwalONRTDB4bKhqLekj/67oOLZCmAT5+uaJ6UOpRcWdVTwFYP
         Vbj3LRh5iKJpW/xRu9zgDMnXRGZ7aV2UVuYuL3TMDQw1nb1ISadWwmBEwVFveNNElhOk
         kyohBtuKD3II3/j63RgveajS6lOiLIBFlIOVhd2tlphackjDXQkm1DyaSXwSAF0WqviH
         UTU6Bor2ICNjThUlnxHX5LmP+MqKaJ+Z7eQoZXpj+HIoLbsAkEflC0K1rvmjbRThoJes
         qlGw==
X-Forwarded-Encrypted: i=1; AFNElJ+7Gz/HDlw8JoIflNkBwjuWBNXbJ2ydtb2k3RLKWHTAvpmW19xIrcWjQgmsImDq8SQmCdFfuM4/N3gb@vger.kernel.org
X-Gm-Message-State: AOJu0YzmeWCgm79pxstIdvdmedQIZ5l3o52gm2PhVJE869W9WdrSp73z
	8q0RhYV+jjNe2EhdyD5h9wkHsvhHsZKekc2+ae+5EozCp90XakYcitYJ
X-Gm-Gg: Acq92OFkUNfBaM4E92mn4FccaRw6YYvnAjEwNEwBBT7HN6kXKJBVMDEwoXJnKc41qfu
	4Bu/tMyXudkzElKhU/F0Qg/vJQ0bMFXEJ0ucZOumW5xeCkTUhgaWsfZ2Evv+OzYde7slYaxuRbE
	GVtmMmnyeDpU8VVDUe/VcVQiT1XTEcERnSunn33wmoO/XcNcoEnOaMGANCjkcXB/z8xMd8bswZ8
	RwKfSy66BM4vdyAW31NgGCVzTkUB9S1x95cxX6+4R2hvllSRkif1s0nGcpWMKmMZUIpwjkgE2vD
	gcyZn1+qDw/WAlgN+oSPPeSB/95SchLhXc6/kokt+RfrCRBw/Qgm00xrgJdPpHu2mJN1Vlsn2az
	2ORamMIVKfgZRjCsekygCybgK8LppAdT66lJCntgkgAv7AoIaQa7NgNiD8j9gVhqk55DiGtVJRZ
	OEwQ==
X-Received: by 2002:a17:907:7606:b0:bf0:701e:b148 with SMTP id a640c23a62f3a-c05d2a7f421mr83438566b.27.1781679973266;
        Wed, 17 Jun 2026 00:06:13 -0700 (PDT)
Received: from xeon ([188.163.112.61])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfdb7b6e6c9sm752857266b.39.2026.06.17.00.06.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 00:06:12 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 0/2] input: misc: add support for Imagis ISA1200 haptic motor driver
Date: Wed, 17 Jun 2026 10:05:25 +0300
Message-ID: <20260617070528.35006-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ISA1200 is a haptic feedback unit from Imagis Technology using two
motors for haptic feedback in mobile phones. Used in many mobile devices
c. 2012 including Samsung Galxy S Advance GT-I9070 (Janice), Samsung Beam
GT-I8350 (Gavini), LG Optimus 4X P880 and LG Optimus Vu P895.

The exact datasheet for the ISA1200 is not available; all data was modeled
based on available downstream kernel sources for various devices and
fragments of information scattered across the internet.

---
Changes in v6:
- added minItems for gpios
- included changes by Dmitry Torokhov

Changes in v5:
- added supplies to private structure
- clk_on dropped
- ret > err
- added active flag to track status
- all hardware manipulations consolidated in start/stop
- dropped mutex from work
- dropped active check from isa1200_vibrator_close it was
  moved to stop directly
- dropped hw maniplations from probe
- bustype set to BUS_I2C
- adjusted error strings
- fixed cancel_work_sync in isa1200_suspend

Changes in v4:
- added INPUT_FF_MEMLESS option selection
- fixed missing clock status set
- guard start/stop calls in isa1200_play_work with lock
- clamp ldo voltages to allowed range
- fixed imagis,pll-div parsing
- dropped Tested-by from schema adding commit

Changes in v3:
- added clock state tracking
- dropped level check in vibrator close
- added clkdiv clamping
- added comments regarding registers 5 and 6

Changes in v2:
- imagis,clk-div switched to accept actual divider value
- dropped DT header
- adjusted imagis,period-ns range
- initiated hctrl0 and hctrl1 values in isa1200_start
- fixed situation when PWM might return -EPROBE_DEFER to be
  treated properly
- added chech a clock or PWM is available
- fixed regulator voltages check being off by 10
- added chech if state.period is not zero
- added action call to disable clock and gpios on error
- used managed version of work init
- added work cancel on suspend
- PW calls are done under mutex lock
---

Linus Walleij (1):
  Input: isa1200 - new driver for Imagis ISA1200

Svyatoslav Ryhel (1):
  dt-bindings: input: Document Imagis ISA1200 haptic motor driver

 .../bindings/input/imagis,isa1200.yaml        | 141 +++++
 drivers/input/misc/Kconfig                    |  12 +
 drivers/input/misc/Makefile                   |   1 +
 drivers/input/misc/isa1200.c                  | 536 ++++++++++++++++++
 4 files changed, 690 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/imagis,isa1200.yaml
 create mode 100644 drivers/input/misc/isa1200.c

-- 
2.53.0

