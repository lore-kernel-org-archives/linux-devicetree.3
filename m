Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99E9F3B893B
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 10:09:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780913380; cv=none; b=FdNFacd2wznXZEpUJBrMDifXVClanrHLwShTVVRyIswWOzdIAm38pGYgGAEClhlM6RfpaPbUn2isDXebaKCkoIHaC/SdsqYiZs3LWecoqBzG/H/kt3jENfAZaqPLJ/SYJy68ST8qGwBb0PN2kQaN8bYUjkCkU1QgTennFijVvEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780913380; c=relaxed/simple;
	bh=9EHqG1xL2evbdMdVoRmlB61K/kkPe59jVtYVBRRzyAY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SKOMn508CGnO1OuOM4TnXVfCdFwI0uQnyj/h3t7GnKGiFMZ2CQOYo9azqd160GLEkzVctJcRt9FnDZFEO7nyB11POD2E6yZGEG50FtCXV/OB0cLRXS0G02snejooVKNqy249jSYNpgnEIhjEaqQSSgVmbeFW562tb4RezjfGay4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fun+euQu; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fun+euQu"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-490be29c1c5so52799445e9.2
        for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 03:09:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780913376; x=1781518176; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=i8fz5rrixxcXBSE5i7ASUW+eSqUQor3TCtORJAa6UrU=;
        b=Fun+euQuB+q0Yc/haQcM9SKvsd5ZlLYybEH2G4SApX8j6pextDKiLlR0tZMQXkv4lH
         4gYNQ/cfKgckZLvE6jTdVfMaDwMkKEPfxNB6lADxEIVzVZewIWZ1TaB6c+GpQb2SryyX
         FcLJvNtmhKYtsJjxkrTFUHV6Pthi9NQxvziPqCTrNLat2sOwXTvr+8gEy/oWnHfLBgyp
         cmIO/IT4ua+cQU0r5FsbVYwgAzFzzJrVkzQCdz/Uzf/+XfJ3GtoJs4ZMeykRmeY2zUxv
         vhppKPNqKzwxVAPycajMEVAoMAqfOPUrBCQLF2Q+wwXHLpOjHjbH0d5DIrv42Tsw79CZ
         II8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780913376; x=1781518176;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i8fz5rrixxcXBSE5i7ASUW+eSqUQor3TCtORJAa6UrU=;
        b=PayDjcz7nsH8OPDWGcxTjSdRX42nmZCBiZwZ8ZjDCMNUy2XiEec1aFiq7OisLBn62t
         Ox/NbwjUcO4VnyUsVn9TZK48X4yey6sWRjVjh8/8l50bsj1PvkMovYfDP0sUH0vtBvHD
         dEgP5sqVrlc7cdE/lLhQvtu1t/uaxC4wBK6SH9FgornM0g76+lpZxIkrxsbz6TZ933Wo
         4jCjBsk/HA/EhAOE1OSSCSMyac4GPanACga6DUc4Dr0SUAkad7lc2MNiPa7Qv0pJKjsW
         iklnhcGwqOe8ms+HAiFcAWqH8uRNZrVqovJIMd2rI99249shqf27R2FiUHYIiCpSs4Nh
         P7Lw==
X-Forwarded-Encrypted: i=1; AFNElJ95cJwRFh8Pjp9M4uayDP0ectqCVoNgBIvd6JnOnXxlycdbIBF3gW0+ejOVvFUF0q1H1ZS5c17bFgod@vger.kernel.org
X-Gm-Message-State: AOJu0YwuiVq7j3vVmKmdRasfJWa7I41XHIDzYVQmZG2Poy931rWh5MD2
	6dXOoprWcNXlyTq67X095mDkvd5gFbZ17oIwflPop6854CdC7Mkug321
X-Gm-Gg: Acq92OEeYbH0X/xa7vqORWGFF9Gjp7WAxbCUmCAkiGldwRT+63N/DprCrqcY4Ll8fd/
	/6uj1Ejr8bRiL+SYXJA2Ifuw96dwb6+l+94wxJQdxjEn6vTIncupY+VLgHFVNpq/QWwRIbfsXh2
	prQBLahmZUmFzt6lF/SLtEGNz0ICqNArwmop2y7FJ8evrwBSnrkxkzn4xYQE+NfaYWKjDTPXqTm
	CnTQjwU6rN46vEknJ8uflnMwXKs1ZWUtUcl+dBdMQYkMBVpL+pOXyYnuTHzC5BQJ/uogOSj9OWH
	XX6eqkvF1pVWkuV6ufSK4FoiSp/30lDJR53jMXXbM9ZCM5zgYLzkXKrmiN8kDmq5tjtlUw/e5Il
	OXeHp1lEwPL4G+TAngskJdj3v0jbrOfYy7kDLFnIV/yuel26x4V+p+fk5QYMBFAYoVMtI13CTAH
	8Xx4lCwCi19RajXiX9/qi7Lyha+FK8F+5uX5L4b0vaFl2+ojlEJ+u71sz+iuzy5n0CXNxrenrgm
	tc6s3H9MO7UbInHxymQMMh3YmzCcKZ8APvqdAl8oGumHg2A
X-Received: by 2002:a05:600c:8183:b0:488:a882:c7 with SMTP id 5b1f17b1804b1-490c25c6625mr215034015e9.25.1780913375963;
        Mon, 08 Jun 2026 03:09:35 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4602cda3651sm39503219f8f.32.2026.06.08.03.09.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 03:09:35 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v4 00/14] arm64: dts: imx8mp-var-som-symphony: align DTS with hardware revision
Date: Mon,  8 Jun 2026 12:09:18 +0200
Message-ID: <cover.1780912893.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series updates the i.MX8MP VAR-SOM and Symphony device trees to
better align them with the current hardware configuration.

It adds the missing board peripherals and completes the related pinctrl,
GPIO and bus configuration.

v3->v4:
 - Fixed USB irq edge type
 - Add HDMI HPD support
 - Add pcie reset-gpios instead of deprecated one
 - Fixed eth regulator

v2->v3:
 - Add FlexCAN2 controller support
 - Add FEC controller and MaxLinear MXL86110 PHY support
 - Describe PCIe PERST# reset GPIO

v1->v2:
 - Add missing HDMI pinctrl configuration
 - Enable LCDIF3 for the HDMI display pipeline
 - Adjust PCIe controller configuration
 - Update PTN5150 interrupt trigger type

Stefano Radaelli (14):
  arm64: dts: imx8mp-var-som-symphony: add input keys
  arm64: dts: imx8mp-var-som-symphony: enable USB support
  arm64: dts: imx8mp-var-som-symphony: add TPM support
  arm64: dts: imx8mp-var-som-symphony: add external RTC
  arm64: dts: imx8mp-var-som-symphony: enable header UARTs
  arm64: dts: imx8mp-var-som-symphony: enable PCIe
  arm64: dts: imx8mp-var-som-symphony: add HDMI support
  arm64: dts: imx8mp-var-som-symphony: add capacitive touchscreen
  arm64: dts: imx8mp-var-som-symphony: enable ECSPI2
  arm64: dts: imx8mp-var-som-symphony: keep RGB_SEL low
  arm64: dts: imx8mp-var-som-symphony: enable PWM1
  arm64: dts: imx8mp-var-som-symphony: enable CAN
  arm64: dts: imx8mp-var-som-symphony: add second Ethernet port
  arm64: dts: freescale: imx8mp-var-som: add I2C1 bus recovery GPIOs

 .../dts/freescale/imx8mp-var-som-symphony.dts | 397 +++++++++++++++++-
 .../boot/dts/freescale/imx8mp-var-som.dtsi    |  12 +-
 2 files changed, 407 insertions(+), 2 deletions(-)


base-commit: b3c1d1631f097619f8091f0293e027c4301285d6
-- 
2.47.3

