Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2C3438E8B0
	for <devicetree@vger.kernel.org>; Mon,  1 Jun 2026 09:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780304990; cv=none; b=doU/bY9pJeJCCTdSNFgQIg6WEbRehuIY1WKFRpy2AjPP/ez66V23fjTPwwE9KzvL4pTQcrK80+XvCMy5fTbK1UzPhEdjdu51ycr2y4Zf9efog5We7w27Mmd0YHR20a7Midjc2BxtkKJHh4ErtULdecyWympj56ojdnLYguFWh0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780304990; c=relaxed/simple;
	bh=kNCEzYPzX/rJ/SApTMGX5WH/UUkEoeCT6G51bSzeHzI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=eXNNMrXjdFVO5Fgn+NSIabP1O53d6x4XTvll9P/vp1hLBJ+XoEaTPujSYb9nH5QxJOE8XfArpej/BHE60inGUufzxCcqX2CrTr79i2rONEjVj7puIjjQSEdkyyx1A0kVj8DLnX1WnoRT1UnSNdkcInLm0VOm2VDTMLY9yWwV1V4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=r7Xh7IaE; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r7Xh7IaE"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-842264dde84so749401b3a.0
        for <devicetree@vger.kernel.org>; Mon, 01 Jun 2026 02:09:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780304988; x=1780909788; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wXjsaeTbGU0KvnbeQVgIVZE9uw0k1+48T90bAJpfEMc=;
        b=r7Xh7IaEqbZLKoPwoxOyCQTCri4GqoesFBD4TCxPekqcr1Kq6a9QChdHJQrQIU8usu
         ttbWbzKdYkRwTQHYA64xdokbQOwrW2+PQxWuPCTVhB+vaplcSp6/LbLA0jcJcGygedgW
         w/rq3bIBukjYkoN93NmU/eITlPwgC75ZkTuTZcHTWbRiP8Mh8hKtq8hY1mm31Utw2x4P
         VqX9ot+1Gj/m+lnKmHrL/8vxsbyF+nW5hb3Bu3WouoJAUDR3mlqEO8GTSJGtlDeDi8Zg
         S3dd4+qPGsI2s6klc42SKqzRKHhUHv2IdudJa+Sla6amEJfd6C9wYC46pw1LqpzRWpP3
         P/hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780304988; x=1780909788;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wXjsaeTbGU0KvnbeQVgIVZE9uw0k1+48T90bAJpfEMc=;
        b=CnHN/k1DV6Wbyea8X6+bI5C9NGsk3BAdaSVpL5v7tal+OJqQvZVY+ubgh9hYCugdIm
         PTNqcwp+VlxNWscJiCwmXQS2cgNhVAOwPtiIdCcn8ualYpY/yrszq7cLbDIXc9JGZph+
         9rB2t48tjb+q4tqMllVffjqi19jbNpwLQP9gkBl306rKI0rxzIF4Y9CKsTJqYpgWeXoE
         wD1nPRg4AKFRdV1MTCkb0ujm+/xNhL0TqAUw2qbD+rDRqc004TVl+3Sp6EHlF8WA7I2e
         6WcxxroAMnVBLfF+Xpknry/rjGJ6H/mT61XRGKV5/u3nBYdteSIIPpO8jjAzPSSepkQt
         i8Ng==
X-Forwarded-Encrypted: i=1; AFNElJ+b1mdYcfIXIYAujIFETlmULCwqHPnI3TKZgMWHXATFU428e7tCVkT70cZF1KWDsPTHmenYm2UVWrk8@vger.kernel.org
X-Gm-Message-State: AOJu0Yyf4ZbAHucRQ1iTUB78OFPgnPL41H7f3UR/1v3KJkqOjzkfr8oj
	JETOV5UlbgGyrupK64/4ZnURB6cxKQ/hgYCfm7JhQkEzEfQOHCoD+7+4
X-Gm-Gg: Acq92OFChjEui5CH8Ay0HAobLlM4+bDSAHNajTuFih/yO7FDjAIFnud6FFJ7uc76EU0
	ENudXa0kx5UIpHkAoQhJWO+WBQRI8RP3Sh5+5LI1411DfWVBrdJz+ePZ2dbxDNQzfiZB/fnaZz8
	kZf/vSHUOkMX65Nxn2SbC1QcSiABJn5PSFOWwSjn/qtm9IxKxGnXRcSgrCQlKh28mgs8kI2Koli
	RK/9ci/krk1FWVz1yWgXrVAlKu3liPXcfX6sO2SdQRCLrTuePFhLOrp1decnhqURNO/vN/R4wSQ
	xXPekVVTDMJZIn+eG5Zd5piCr7TtZgG2Mv3LiwaNKL+pSMP/lzKeOEBpKPyU/s46OZeemPGAEuF
	+wm1Dtyw9/WApVTLFW8WLxpJ6tD7+sb3juuGwFwqtDtzC5WVWPM6s144T9fW6aG94WT2tn0ukoY
	FjMojKJfdee5ybbe6w3HB561n2FYNjtY2SK3GtpqhxF8wwW8o/XYwx02nUjEmAm877fSk=
X-Received: by 2002:a05:6a21:b8c:b0:3b3:21f7:15e0 with SMTP id adf61e73a8af0-3b40fdc7d55mr13052217637.38.1780304988061;
        Mon, 01 Jun 2026 02:09:48 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:91f7:9b52:3422:d8b9:6baf:c53f])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85772df0fasm9105827a12.30.2026.06.01.02.09.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 02:09:47 -0700 (PDT)
From: ASHISH YADAV <ashishyadav78@gmail.com>
X-Google-Original-From: ASHISH YADAV <Ashish.Yadav@infineon.com>
To: Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ashish Yadav <ashish.yadav@infineon.com>
Subject: [PATCH v3 0/2] Add support for Infineon eFuse xdp730
Date: Mon,  1 Jun 2026 14:39:23 +0530
Message-Id: <20260601090925.3781-1-Ashish.Yadav@infineon.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit

From: Ashish Yadav <ashish.yadav@infineon.com>

Hi,

These patches add support for the Infineon XDP730 Digital eFuse Controller
by updating the existing XDP720 driver.

The XDP720 and XDP730 are PMBus-compliant digital eFuse controllers
with an integrated current sensor.They provide accurate system
telemetry (V, I, P, T) and report analog current at the IMON pin for
post-processing.

Both parts share the same PMBus register map and direct-format
coefficients; they differ in the GIMON gain step exposed via the
TELEMETRY_AVG register (bit 10) and in the VDD_VIN pin number
(XDP720: pin 9, XDP730: pin 20).

The Current and Power measurement depends on the RIMON and GIMON values.
The GIMON (microA/A) depends on the 10th bit of TELEMETRY_AVG PMBUS Register.
The value of RIMON (kohm) can be provided by the user through device tree using
infineon,rimon-micro-ohms  property.

Datasheets:
 - XDP720: https://www.infineon.com/assets/row/public/documents/24/49/infineon-xdp720-001-datasheet-en.pdf
 - XDP730: https://www.infineon.com/assets/row/public/documents/24/49/infineon-xdp730-001-datasheet-en.pdf

With Best Regards,
 Ashish Yadav
---
Changes in v3:
- Link to v2:
https://lore.kernel.org/all/20260529054218.5184-1-Ashish.Yadav@infineon.com/
- Revert back the DT info file name to infineon,xdp720.yaml and added
  xdp730 info
https://lore.kernel.org/all/20260529-partake-myself-baa76ed4e279@spud/
- Revert back the driver file name to xdp720.c and added xdp730 support
https://lore.kernel.org/all/20260529062937.646091F00893@smtp.kernel.org/

Changes in v2:
- Link to v1:
https://lore.kernel.org/all/20260519075558.91466-1-Ashish.Yadav@infineon.com/
- Integrated XDP720/XDP730 drivers into one driver.
https://lore.kernel.org/all/51133193-57fb-4a22-bf9e-9817f1f52ad5@roeck-us.net/



Ashish Yadav (2):
  dt-bindings: hwmon/pmbus: Add Infineon xdp730
  hwmon:(pmbus/xdp720) Add support for efuse xdp730

 .../bindings/hwmon/pmbus/infineon,xdp720.yaml |  41 +++--
 drivers/hwmon/pmbus/Kconfig                   |   2 +-
 drivers/hwmon/pmbus/xdp720.c                  | 167 +++++++++++-------
 3 files changed, 131 insertions(+), 79 deletions(-)

-- 
2.39.5

