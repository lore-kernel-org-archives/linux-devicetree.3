Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793735423;
	b=2oldwb8F14r7QbqMGjNp80vjcaYLjhRbJ9K2f+CdCPogG284Uj1hHSNu5Z9a3aHNZ0+V
	 OyYjRRoSU5qY/3lFDHBg0nhpuGE5InYHtlrt+EBXNR42NJ5QfzgZ+n9/hvB5BsSPPEXSI
	 afzKpNhFZGKu5GX9bvWXq7X1lqx2LpzAjY8KIrdeFAQfUWoGnj5+pkQgj8JVMWnCqfcGC
	 xPLssfNUYypN7/Cv35jeeYS/4Y+mpjmS6QIVwjus9mhNKf6IjDtBEQ/EH0yLpJ8a7F1LI
	 EkaPMQHWUdVjaEeRwlbLvwmPlCCkwo3E0cbBjx+Utqyq/ab1Si7SWfASkb1k4VidJ2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793735423;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=IUC8h/pS2sKKAgXqYzGDb5np/7+oqUMjSmtqPXIKCmE=;
	b=r8kuNrZUQHIHuRnfhiL0SRCAlw8cAYDv2oKIeB4eyhriUq0A0wukMbswEcXcdfrPN9b4
	 krO+ZXX0CTAtrSJhSKQVnEllYUFrlj7qM6K8YXBbSmuo6G24B2i7SlYqy6dPdKSeBginH
	 Rb+VD8xHud3BZgjBdLSztmhMW5GDr4A/tSSg+8OoX9p9l6tq85+DPv22LZiikdeKrFMPM
	 ZlCxDHQna0SQtSVYQC8NX8XY1Oezw8yQJVDQgwaox/LrkxXPkk9y24Rzp7qAY81U5a4p4
	 F90ykWu57dkaj+pyQqQ2kToUw9dnQPh4oIQKOqa9G2yvS4But0QUVKntgXg/tiqOt6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WX5St4V+;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BBDB606A326
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 19:50:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1BBDB606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WX5St4V+
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a214c5c4c0so41638145e9.3
        for <devicetree@vger.kernel.org>; Tue, 03 Nov 2026 11:50:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793735421; x=1794340221; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IUC8h/pS2sKKAgXqYzGDb5np/7+oqUMjSmtqPXIKCmE=;
        b=WX5St4V+2QCsIafPGA4uY9kFxu4RcNUYm6QOUHzr5WQ3QQOH0SZwyf22DSM53G5X9O
         05NGESiuHr58dRO0JittkYt14CJl4NnYSJ3lg/i2sHwd9vt4LGSVfjH7985JvX5Mn+l8
         bMmk95SgMvpUTpnBU2GIprP6EfklflLp4oLcJiWfaBVEA+BtT9PYJvBT//fmiHuoBEqt
         0rZBejKR6YZfHWeNlo0HmqG18Gd8hPO+BjQXDSOxapuRn3FBEPW1/UhnWc4lc7+2j9MB
         Ehqh/18Pd4ke0gQlM6X6VewkxJc99eQ0Wn4AnLiupFQewdaJ8knjIKvm/5VgLA3HRbQy
         j+hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793735421; x=1794340221;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=IUC8h/pS2sKKAgXqYzGDb5np/7+oqUMjSmtqPXIKCmE=;
        b=K6pFekf+Sw+G1rYTxL26JOPbiWqSw35mUsG/7Q/YUZ9ZX5VJn9aav2//9AjJs9tg8M
         zLaAoEATqMWZluPC/TdxI1doWI8thvPMHoXuxhGegUZpK0elk2P8KfKiPeowG8ZJUGUJ
         3ZqYZL/MyglCzJnZhhBpmbfo4GsPBjsHycDFWmpdeOD6MVgCpZS3/PXyDO/zW/95PjJo
         Ei6yRE1vi2YgMBKe+mm/Y+dJZewP5DALPi8aIrffs4Km65Ej6C42I40ugtKHDrdABMMB
         PHCC7EMpjO8/zLv4yCRG5czF5uk7QU6xvHw60z6lHKhq8ATNJdcjpDdQkf9lMdYkPBZJ
         XgxA==
X-Forwarded-Encrypted: i=1; AKwUvBx4TwBDMH3df5+zqeXM1QPRfvHU2vwKdIpX4ujzOEJwM9SzcECYPghAZHJevP6nG9EhL4v5znNretwd@vger.kernel.org
X-Gm-Message-State: APuU4Z+Sin743aYI+5oz0b/WBgZp8OPIKf+/Cn2phrnKGAZquGyxia8N
	wMi7WTG2NEHlG7S949DpvzZ3mCbq6u581VCJ6DIWoH6Q4NXOf7BTxUCVpAeTHQ==
X-Gm-Gg: AYBFou2hWbRD2cDcM4vYZudtw54kSJfYaSfZHs9lMqFTDnvoqUqZ4JFuIWELV9LvbDX
	aqYi15k3DTU5VfzIFOm1q25WYxAQzsOks+VU1fuea5tIYQCm1WJ8rw/rR31HziZD13e+v52HMnM
	tls66/OvelV9VumkGSbalTV2uB1z8OjC8BOCsc4Xc5/IHwzgNh5Mhpxxg/nHIuYGlbz5EjRuMEU
	NRYEq8Fk/U5HyHnYOWkOVyrFHGB8HdgjcDsjGXgrlTYc8usUnQ6DoSiK7t2643/YY9IP8iBwfOf
	8HySrEdphKsqhrP9HADC1gjr92NCaPvzMMGywkHKchjcQIb9sK1LAuzgrYM2qYT2PKJuj7fMKU7
	v5AufItXouoDt9bwjwd3xaYiEsNZhb3v/rj6fTKQCe2lgtVOH/Fy3U5S9m3wZeqbApfrnPHMV8H
	mGf64NiEfxiN6A22gHEENH0taq9NWEL8asEjJ5NM+dP2CCFNHaNHffILexrzvLFp6q6G9j8/FqK
	esjVuYYCKOfyoEPykuDjIU2M9UZ0O0CWW+9FGKkDaI3zJOd/MnZEIIOBAGu6+g2qtqyo2iNylBR
	BGc5YdivcL1nh3ka+ZlOlJnTIf8Xaad1d7SbifYUiIuwUE9vsGo/43v5pRSv467AgCsvqbNutWg
	sV2ItZwwOoiIfyBIolR2XKFyhiSp3MGUIlQ==
X-Received: by 2002:a05:600c:a107:b0:4af:e04f:cbaa with SMTP id 5b1f17b1804b1-4afe04fcd89mr143567615e9.29.1793735421412;
        Tue, 03 Nov 2026 11:50:21 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (93-34-90-148.ip49.fastwebnet.it. [93.34.90.148])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48fc9d6b0aasm417802f8f.2.2026.11.03.11.50.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 11:50:19 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 0/2] phy: airoha: add support for AN7583 PCIe PHY driver
Date: Tue,  3 Nov 2026 20:49:58 +0100
Message-ID: <20261103195007.9721-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
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

This small series introduce support for Airoha AN7583 Gen3 PCIe PHY.

It's not possible to reuse the EN7581 code as the register changed between
the 2 SoC and also the setup method changed (different calibration logic)

Putting the PHY in a dedicated directory is also needed for other series
current pending that will add USB PHY support.

Also a dedicated schema is added as the register names is entirely
different compared to EN7581.

Changes v5:
- Rebase on top of phy/next
- Add Review tag

Changes v4:
- Add REGMAP_MMIO to kconfig
- Better handle exit
- Add additional info on QPHY usage

Changes v3:
- Improve example for Documentation patch
- Deinit G3 PHY on QPHY error

Changes v2:
- Drop move patch (handled in different series)
- Rework to regmap implementation
- Rename files to more specific name
- Add .exit logic
- Drop QPHY in favor of external PHY handling
- Update schema with new requirement and improve example
  Link: https://lore.kernel.org/all/20260827122127.18874-1-ansuelsmth@gmail.com/

Christian Marangi (2):
  dt-bindings: phy: airoha: Document support for AN7583 Gen3 PCIe PHY
  phy: airoha: add support for AN7583 Gen3 PCIe PHY driver

 .../phy/airoha,an7583-pcie-gen3-phy.yaml      |  65 ++
 MAINTAINERS                                   |   8 +
 drivers/phy/Kconfig                           |   1 +
 drivers/phy/Makefile                          |   3 +-
 drivers/phy/airoha/Kconfig                    |  14 +
 drivers/phy/airoha/Makefile                   |   2 +
 drivers/phy/airoha/phy-an7583-pcie-regs.h     | 377 ++++++++
 drivers/phy/airoha/phy-an7583-pcie.c          | 823 ++++++++++++++++++
 8 files changed, 1292 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/phy/airoha,an7583-pcie-gen3-phy.yaml
 create mode 100644 drivers/phy/airoha/Kconfig
 create mode 100644 drivers/phy/airoha/Makefile
 create mode 100644 drivers/phy/airoha/phy-an7583-pcie-regs.h
 create mode 100644 drivers/phy/airoha/phy-an7583-pcie.c

-- 
2.55.0

