Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85C7C367B93
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 05:42:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780033361; cv=none; b=irGKj1Qnlz2O1BlqCVloHMcRbO4yALCnymIR5n3aaiKUx13JCTbcAKq66sugsFLqif4YOINHC/akaBepKQH9uqQNSkKlVz9u6ySd57EZPfXIIESTDOvdC2rFUay5DCV4w/VrnenpjltL4UQfauoNhfXV4m8RkKbU3k12gU6GEZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780033361; c=relaxed/simple;
	bh=3EV+WO27yKodp/q+ZJBZ72/L+OXYX+2lYnG1dPC55uc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=nRbwBf77XYqWq/2P3ubWxhXYeW6SmOYOIooY/LjF04XIvWQmyRNMjhSSapu5zaH+hXVDNSSA0DPLS7kWEtiM4GIrMPj6uoxlVWYdkYcIO3rLZ7t8xkS/0WsWRDOy2eDmE8xYY0FNmdtOQ+DcpA/rjDbrGVwOGv8SCWwZg3eaUFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PUgwJoi9; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PUgwJoi9"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-36b7b7b7a80so779001a91.1
        for <devicetree@vger.kernel.org>; Thu, 28 May 2026 22:42:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780033360; x=1780638160; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6gSL83Vtjwy5lvzYsgavMavGzYk+JMak7y4sEcq8NsM=;
        b=PUgwJoi9lTJ0rx/n7B6dYM8UPiS90bBxKu8wEJA6Eoiv9rfVbqTCJkjWULkTifBOH/
         XgELrX9iDWYUFyUdTVvXiNRNlnCieAG9qFRbFP9OJeDdZ2cAdnHTz7D1q12rxK7gCNKb
         92EjXbp2WBN2FnN1q7W4XdWFEt5X3G7yLPpICDjfiDvqRUod83T9xsQsLF7GGGo5P0xx
         36hAnc2OZKqPuvIV0s+zJX1BKtZbEtmHD6eg/8NFiSvRoHAZvjXomn9k6cT/IFemZinM
         T9sz+9EO1mqRjHJLbOVw4n8R4bx8NWvpAoeypvQD9kqz7FRX7BxfjHEb3s1F/CG/MwIN
         y8AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780033360; x=1780638160;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6gSL83Vtjwy5lvzYsgavMavGzYk+JMak7y4sEcq8NsM=;
        b=qhHcAH8eVn/1OWzHjgBHEiJC772RamO4NfTMp2xXNL7fuvAvL5jpH6fTEjryxB9bTz
         qQKEc6CVznNub6BTYN3tx0N/kqnok9J26FX1HN4HDei7f4jlcGt5BaCT73JdeC/MyUbM
         u5d0BMFY69S7NG21Qe9lUmfAN8kqwHu/aKIDp/dKGHJAqWW+M+LGn0EZ8S0mYCrtCy2W
         TZbJlSnoYkuIOkHLfzK2Do4Q8JhsYsRKzlMdknNSHW8vf2Ggvl2RzTLbSkPfXjLKBbm0
         5ljLwp9stzGGR4u7j1Y+hW2LFaI5wPpwnjZD4CgNDT86850gRyQv4rhGnxgxtLUSIw8+
         z9AQ==
X-Forwarded-Encrypted: i=1; AFNElJ8Bg9qgrtS5VM8wBO4qYdiRod9TG65BZoltKXtmOUbkJFz57QyWCbCyMkuiiSCPnwh702DJ/E1wohyr@vger.kernel.org
X-Gm-Message-State: AOJu0YznmH2cT/Ruoyo0DHQc6Fq1yjVxnkgeYUVPnVN07kpG7iZgVxam
	Kw3h8W3GA26+1j7Y4DPwzeAh5gMEHyEp9wkl6Zp7cR+8pBRH0ieF7qas
X-Gm-Gg: Acq92OHM4Z25Y7NvDwTnjDiudXS0jI8lNfEl9kQUvA8gtFQ2y1JdJ0VAnFd4BVRJkqx
	W4PthN+pJHwRMS2rdHO8BOu/ZA/bjX79K6lVB8XfFdZcKMJsHKy6Jar/jR5kKBnkE0maUdn3VeR
	ngNV8CWZyPPPafNZpvNSiNjpAcnredSuOxB2d6J/maYE0R4MDYOLLKeEg9R3TWRy1kZr6MxTWOn
	ibWzWbLWcucGXwXHatILsbiPK2P3JIu61P15cukzCRXEL2yL1dO3UdRxVw2AhlytVi46JhdFmi3
	XzSrfBY3AP8NPI/oixijp3tXjiCICD8vzR5O+nhf9KJou0cbDwBzXcsRoTsqjLfjVEOjI7GRdfG
	tTMUsfbZTfDkA/Uzk9j24LgFopU3uATUPScuhDrBv/pHU2U37IBvzyam9Wu3PRnb/DkgWUjMtwj
	hPT3fm1r6i03MOkdGb9N525+NeR4tK5h1wngQ5gUIyYTwaVTVA2QSNZcit
X-Received: by 2002:a17:90b:1ccb:b0:35b:9e53:e2df with SMTP id 98e67ed59e1d1-36bbdf7c769mr1485059a91.2.1780033359732;
        Thu, 28 May 2026 22:42:39 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:93ae:ce9d:fecf:bae0:f194:40fa])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36bc6bc0b2fsm578157a91.17.2026.05.28.22.42.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 22:42:39 -0700 (PDT)
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
Subject: [PATCH v2 0/2] Add support for Infineon eFuse XDP720/XDP730
Date: Fri, 29 May 2026 11:12:16 +0530
Message-Id: <20260529054218.5184-1-Ashish.Yadav@infineon.com>
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

These patches add support for Infineon XDP720/XDP730 Digital eFuse
Controllers.
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
Changes in v2:
- Link to v1:
https://lore.kernel.org/all/20260519075558.91466-1-Ashish.Yadav@infineon.com/
- Integrated XDP720/XDP730 drivers into one driver.
https://lore.kernel.org/all/51133193-57fb-4a22-bf9e-9817f1f52ad5@roeck-us.net/

Ashish Yadav (2):
  dt-bindings: hwmon/pmbus: Add Infineon XDP720/XDP730
  hwmon:(pmbus/xdp730) Add support for efuse xdp720/xdp730

 .../bindings/hwmon/pmbus/infineon,xdp720.yaml |  59 -------
 .../bindings/hwmon/pmbus/infineon,xdp730.yaml |  80 +++++++++
 drivers/hwmon/pmbus/Kconfig                   |   8 +-
 drivers/hwmon/pmbus/Makefile                  |   2 +-
 drivers/hwmon/pmbus/xdp720.c                  | 128 --------------
 drivers/hwmon/pmbus/xdp730.c                  | 159 ++++++++++++++++++
 6 files changed, 244 insertions(+), 192 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/hwmon/pmbus/infineon,xdp720.yaml
 create mode 100644 Documentation/devicetree/bindings/hwmon/pmbus/infineon,xdp730.yaml
 delete mode 100644 drivers/hwmon/pmbus/xdp720.c
 create mode 100644 drivers/hwmon/pmbus/xdp730.c

-- 
2.39.5

