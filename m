Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDB2152B1CA
	for <devicetree@vger.kernel.org>; Mon,  7 Sep 2026 20:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788813245; cv=none; b=sCQiB8RvKSSsXHtvduy4Cqc/aNGP8nmXCxRH6jIUjsyeQb/FA0R2PjX7+Pswg/PAtqvdekVAtRs5mkdIoHaUQYXHsRT87b2uzHYNB9Tk5L2b+B+LI0EqW9vpTDIcmG4WzE7VwfTrUV4ANM2Rrhw+hObCOr4Qen8olzywKXdyP5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788813245; c=relaxed/simple;
	bh=XRcgBCue2KrXsEL9OA0CrR0BS9mMuluh/tBBStri+Jg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rfOT7rqF9fL4mRiRg0reDH4DeF0x+mW5iBMo51O3n4VryuIjUGsmB10nAwtUuPj5+3sjO/WQlCnduXpH3KvPyCXEHItExz5dnHx8AqDUUWUUxGUbQzF16wTmUKYqcLEcb4kcMHfLurc8gl+GtJMtRqx9G/h+bNrG7fr/ZkUDu4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Lj4koppJ; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lj4koppJ"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-482dd6ee390so4504948f8f.3
        for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 13:34:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788813242; x=1789418042; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=H10CDyHf2HwaIdp1u9Z8DODXZa7pKYcGD6eHakxo4CA=;
        b=Lj4koppJxmL4lIgZOsv0/jFIW7DlHTxvL0rgyE4zh+sc6eNgegCpaKslepsXsNoLwv
         aSl4I2i7aUoG8GOXIXhdposqWXnAgKwI1aTDkk1WWzdbj/3JkzPCvN5rQDoasmQto8z9
         GKDb1P1BljmrSIWrzvOlF2sVKd1sDz2CUID0urrvpS8PWNbGjN0ksAfNwuEGNLad1aNO
         UBkMvteQizs4+OW3uM9r1eQJFaa8Z4cqlhuXbrafsrYSPE2/lKpyTetmfD961zPWgcOa
         29tAbJrATwWrOaPxFs+Ybt//GL0o38WG8gvdv6qKqCftVQDkc0UyJIeUeMPFV0CH1ldT
         LS2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788813242; x=1789418042;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H10CDyHf2HwaIdp1u9Z8DODXZa7pKYcGD6eHakxo4CA=;
        b=EPOjXjwWVqxGI5H+T3U1AmqgRbN/XluVeHJaOPhcCHtrrAIgK1P113mstpUeFLJaT/
         OJhIV1zcgg5GYtS2jY/gJmr9rwPS47d00JBjFZxMQmOR3PUymQ4q0hsz0C6Y33deekpb
         xc2LeG2S0a5UAyfYZHqQ7qkmY7Jv2iFYC8sO3s+J+D9apkeyhxBi6i5HjOoINYM7Ac0g
         lUSrQ9MhCOJfp1QVXfYFZvgFIxrdSODDPPZGAuN7uEnf6vSMDbjx1Pmm5OHfE4yrO8qu
         mV9ogApDdBKi8HW5hTNwzh92aX74K1DRPAq1XaSm1832TlN9bNc2/h0Oxr3w6hAGvX5F
         yWSg==
X-Forwarded-Encrypted: i=1; AKwUvByXyRWIOgaAKBQDfMTEuCDooyrvvvDq7XFpsGZHjpyl74CYRXfBPcbD4+VzrAjbGU6oe3uTPi6U/B6D@vger.kernel.org
X-Gm-Message-State: AFuF++l3XICm7tS0FYsNCpfFvkFP4z9mBTKEseCyPYSThsNOJ+olE1n2
	KjZVQ46rezM48aupncacenGKeONbXemP4C2ny71XG/DvkItFWgyBFlKK5vI1XA==
X-Gm-Gg: AYBFou31f39RTaYdJ5UelOtMC2ofIKZJaa+i1fosYitXVsBtRGGHpRKmKrqouUiG7c9
	hIDAowmJdwZQZDTYwQ+gVU4LlVGUmIXlhT9jeEhUaP0bSYWOQ42uj7NAJO5BrAwpFZlgAAMRniP
	lzH/moSKqPOfrtdu2HE5w95fYFLKWVOIRbYrJQD73hWvd1kYOc9Zu6kuitopK/Ul5vaW1nO2Y4o
	uBowTOZvVru0yizaHNUtzBkqDWx4ixuVpVznJEgLSnGfM31J2UURyqzuwK6Gfks8X5zHgzZoxgf
	jbX7XDTYkfXrNzOlnfx+qveo3abbtuqCSzMxDwzAG+nIEgsLBbKmCLQxKaTeMoN09ha19Yl+b9r
	WUZ7GCWOWr/b3BWiBquyDtMI6N9Cf6bVtvOwEl6aWEFOOo6kyZuzkj6pdHQU+9zgS3672Ts96Tq
	+NokqL2q2/OpSVBPbqTRI4AmJBZKObLHjLyntrOQZyT6gVc0/jHHk+oLhCBvQnKgfqZPhKIZGX
X-Received: by 2002:a05:6000:4694:b0:47f:9266:9bde with SMTP id ffacd0b85a97d-4858703f92dmr21415814f8f.4.1788813241837;
        Mon, 07 Sep 2026 13:34:01 -0700 (PDT)
Received: from antoniarch ([78.212.37.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4858e239862sm25959116f8f.9.2026.09.07.13.34.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 13:34:01 -0700 (PDT)
From: Antoni Pokusinski <apokusinski01@gmail.com>
To: alexandre.belloni@bootlin.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Antoni Pokusinski <apokusinski01@gmail.com>
Subject: [PATCH v6 0/9] rtc: abx80x: add support for abx81x
Date: Mon,  7 Sep 2026 22:32:07 +0200
Message-ID: <20260907203216.53192-1-apokusinski01@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello,
This patch series adds support for the ABX81X RTCs, which are essentially
SPI versions of the ABX80X RTCs. The first patches (P2-P4) contain bug fixes 
(added after sashiko's review in v1-v5), then (P5-P8) we have some cleanup and
reorganization changes (converting the driver to use the regmap API was
needed for this), followed by the actual ABX81X support.

Kind regards,
Antoni Pokusinski

---
Changes since v5:
* PATCH 2 ("rtc: abx80x: fix error check after i2c_smbus_read in read_alarm()")
  Handle the case of 0<=err<7
* PATCH 4 ("rtc: abx80x: properly handle shared IRQs")
  - probe: added missing configuration key unlock before writing REG_OSC
  - handle_irq: fixed the value being written to REG_STATUS
* PATCH 6 ("rtc: abx80x: use regmap instead of I2C specific API")
  Changed the type of "flag" argument of "regmap_read()" from "int" to
  "unsigned int" in "set_time()"
Changes since v4:
  None
Changes since v3:
* PATCH 2 ("rtc: abx80x: fix error check after i2c_smbus_read in read_alarm()")
  New patch
* PATCH 3 ("rtc: abx80x: add mutex protection for register writes")
  Replaced "guard()" with "scoped_guard()" in "abx80x_ioctl()"
* PATCH 4 ("rtc: abx80x: properly handle shared IRQs")
  Disable all the unused interrupts in "probe()"
* PATCH 6 ("rtc: abx80x: use regmap instead of I2C specific API")
  Changed the type of "flag" arguments in "regmap_read()" from "int" to "unsigned int"
---
Changes since v2:
* dropped patch "rtc: abx80x: move part autodetection before RV1805 configuration"
* PATCH 2 ("rtc: abx80x: add mutex protection for register writes")
  New patch
* PATCH 5 ("rtc: abx80x: use regmap instead of I2C specific API")
  - return PTR_ERR(regmap) on I2C regmap init error
* PATCH 8 ("rtc: abx80x: add support for ABX81X")
  - return PTR_ERR(regmap) on SPI regmap init error
---
Changes since v1:
* PATCH 1 ("dt-bindings: rtc: abx80x: document ABX81X RTCs")
  - added missing "spi-peripherals-props" reference
  - added abx815 compatible strings to the trickle charger enum list
* PATCH 2 ("rtc: abx80x: move part autodetection before RV1805 configuration")
  New patch
* PATCH 3 ("rtc: abx80x: properly handle shared IRQs")
  New patch
* PATCH 5 ("rtc: abx80x: use regmap instead of I2C specific API")
  - changed regmap_read() argument types from `int` to `unsigned int`
---

Antoni Pokusinski (9):
  dt-bindings: rtc: abx80x: document ABX81X RTCs
  rtc: abx80x: fix error check after i2c_smbus_read in read_alarm()
  rtc: abx80x: add mutex protection for register writes
  rtc: abx80x: properly handle shared IRQs
  rtc: abx80x: add irq to struct abx80x_priv
  rtc: abx80x: use regmap instead of I2C specific API
  rtc: abx80x: replace read-modify-write pattern with regmap helpers
  rtc: abx80x: create abx80x_i2c_probe()
  rtc: abx80x: add support for ABX81X

 .../bindings/rtc/abracon,abx80x.yaml          |  18 +-
 drivers/rtc/Kconfig                           |  25 +-
 drivers/rtc/rtc-abx80x.c                      | 664 +++++++++++-------
 3 files changed, 454 insertions(+), 253 deletions(-)

-- 
2.55.0

