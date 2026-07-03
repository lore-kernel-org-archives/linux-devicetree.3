Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8CAF37D10A
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 08:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783068372; cv=none; b=RK0qnx/YKF/XXkMOe+n9pYsew2h+Grld+3KxORYToS7GvejA9DbaEJDhAoPQBW78laZ/X/MQabumlIWbXpMGW5BGstJ6X46SAgb2mT9qu6PJ8WfNguHnVlo1XzIGeL6/1NvWOwelEf3Z3DI7RoptHfcAdbYrJckNmK5CSypczx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783068372; c=relaxed/simple;
	bh=AbM2+PdwzaPJmfFBoOmafSUHXuSAXw6gY/hyZryufoQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QAoDFSlzv6iZEZvLDtZgA5nW4fnxyFBIq+yMa2XIADUhHqyLuPzseIxprACclbaDI5AQDens8oNsYDhUmEarPRxOW+szVRZX0pYbkNkT4YQa4fp1HWqAJbbPWgbLo4LAs8eiVL0lpUlabDm3cTjwsAaQkMAvugmvwAWOsdBm/XI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B8RJDw9Z; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B8RJDw9Z"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-493be1b9682so2340775e9.2
        for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 01:46:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783068367; x=1783673167; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rym+87Q6pp8Q6AfXc414r5kgP+DO4WPCOFxK7p7VbcA=;
        b=B8RJDw9ZaStdp3cVgblb4pd7qLV7QVQZtt6XU6DiTv0JiBHz0R3Hv6ogtbghkVBEhD
         Zf9a8eWJ7an4+4DMqzddHdGB1+1CNpKdeH/q8627nLADnjZEQ+8utgcA0CD4cGBqCXfh
         mC+ZdBlqp/FVAq9/xRPrYElHsmh+gwtfHJtPPpPlOUaOkpq6nrmRj467vaYt2vsFDNoD
         xcFFadN3FOoqfS4+VZGC9H6GYtsvHQhhaxSHcLXXOuQ4gsxKrxLhJDJyEJbIpuzeNUcC
         xJJ2vQKi/V6AMIu/8EDLGpKttb6TWG5oYYcVSQRsj3HJKf0EhzM9GaSa/RC7ptG/tAvG
         3dyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783068367; x=1783673167;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rym+87Q6pp8Q6AfXc414r5kgP+DO4WPCOFxK7p7VbcA=;
        b=DoV2eoQsp68zvyM2r2UOLsB5fYs6QPt1oY53VswyzCW9yZqjKnhuXwF0POMbghAl5F
         lgwFO1d0jpvovdH+tqutp2uHaCAdY5hZc2jTpj22+rdGnHguXt/y9caRi6zn/qpA8n3l
         nXFSxRBKsM0+gOBvdre+CWcMlplAcabUWBFFUgvF0hoaa6PX1DeMzWG2mXG0XEjNlyoL
         x2m3EVrtuY1ecL5FFb0n5fwM2gdZ31GJDA4A6j7Z01PtAMR93iAHMGMj+BtCtC4XbqoK
         Cyf2MWEGbgadsqlKZIX5ZIREK3b45oXkrtzrpjsJ1gHqYAnH/jD1mmB1mlqK6AzRqcha
         XYLw==
X-Forwarded-Encrypted: i=1; AFNElJ8y/b/Vxz6eWAKDyParqN5gdQcTxT4BIdmVnpsNBXG+7V+SbK53Jzo3zwtBeT9nSYsO9uVfSGiJc/td@vger.kernel.org
X-Gm-Message-State: AOJu0YwwyLDInnOvzaGXJ1FJ0thfu4G9c8FWTkW62pdrZ2O3+EyEdG3I
	b0qzzbmq72BCAGTmHWu9cSyIIzaglMRMZl6aYR/pLD0k2VLwOiMTSzv7
X-Gm-Gg: AfdE7cmFsQVnZtg1x8YRquiW2XFz0JXmItRyDk1R7FdQ6h+JKfUhqi7ZQGb3QYKAf9q
	aGjMN3/nTInLl3LjjBQhWraaB330Gh921sgXap3E37L0bFFFEkqPzUXlgd11kh45nkYZPD4mS1H
	GeETv1qNFTZax5VweIJmN0kxDTYDs2q5XsP7zYSEmJe/IyNIu0XwSNqTLbXf8LhhB7khaZ4eB58
	0CYlLTMG2WR1bI//6KUiwDhKzZwvHjKCeLUrWNYEV8dPyQFPT8q7ObP0s46f391JlO6a/hd3Wgr
	Jh+6nSW/iPYYZqLwm9YnE4kYck7FAHxyWAWjnZ9whPk7fvcUn0ZyaOIKPIHFPyeLAHQg8xWAyS4
	Dah1oIrCeCvLcB2+qlfcRc26IJIuvHNL09SrOq1D69xi/FXMfbd3MLBdAKZSdr1ukYi6LzLuAdH
	bMaIZh85E0FZYtC1dqXPxVl5ct3Qy5hUHgaktpIhJTa/KLZxNTWGb8RHsGn7gcMAH+LonQiGe6R
	+vWdYODZDj4Ovw9274rdUjSww==
X-Received: by 2002:a05:600c:34d6:b0:493:c6ed:a044 with SMTP id 5b1f17b1804b1-493c6eda218mr71854355e9.34.1783068366968;
        Fri, 03 Jul 2026 01:46:06 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-248.cust.dsl.teletu.it. [93.144.65.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493cfb6f199sm6335505e9.3.2026.07.03.01.46.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 01:46:06 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v1 00/15] arm64: dts: freescale: imx8mn-var-som: Align SOM and Symphony DTSs
Date: Fri,  3 Jul 2026 10:45:47 +0200
Message-ID: <cover.1783067947.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series aligns the i.MX8MN VAR-SOM and VAR-SOM Symphony device
trees with the latest hardware revisions.

As the i.MX8MN device tree hierarchy closely mirrors the i.MX8MM one,
this series applies the same alignment already accepted for the i.MX8MM
platform, ensuring a consistent hardware description across both
families.

The update consolidates the device tree descriptions to better reflect
the actual hardware partitioning between the SOM and the carrier board.
Nodes describing peripherals physically present on the SOM are kept in
the SOM dtsi, while carrier-specific components are described in the
corresponding carrier dts.

The changes were tested on the latest VAR-SOM and Symphony hardware
revision.

Stefano Radaelli (15):
  arm64: dts: freescale: imx8mn-var-som: Move UART4 description to
    Symphony
  arm64: dts: freescale: imx8mn-var-som: move SD card support to
    Symphony
  arm64: dts: freescale: imx8mn-var-som: Align fsl,pins tables
  arm64: dts: freescale: imx8mn-var-som: Update FEC support with
    MaxLinear PHY
  arm64: dts: freescale: imx8mn-var-som: Add support for WM8904 audio
    codec
  arm64: dts: freescale: imx8mn-var-som: Add MCP251xFD CAN controller
  arm64: dts: freescale: imx8mn-var-som: Rework WiFi/BT and add legacy
    dts
  arm64: dts: freescale: imx8mn-var-som: drop duplicate USB OTG node
  arm64: dts: freescale: imx8mn-var-som: enable FlexSPI interface
  arm64: dts: imx8mn-var-som-symphony: Add TPM2 support
  arm64: dts: imx8mn-var-som-symphony: Enable I2C4
  arm64: dts: imx8mn-var-som-symphony: add wakeup sources
  arm64: dts: imx8mn-var-som-symphony: keep RGB_SEL low
  arm64: dts: imx8mn-var-som-symphony: enable PWM1
  arm64: dts: imx8mn-var-som-symphony: Disable internal RTC

 arch/arm64/boot/dts/freescale/Makefile        |   1 +
 .../imx8mn-var-som-symphony-legacy.dts        |  19 +
 .../dts/freescale/imx8mn-var-som-symphony.dts | 162 +++++++-
 .../imx8mn-var-som-wifi-brcm-legacy.dtsi      |  12 +
 .../imx8mn-var-som-wifi-bt-iw61x.dtsi         |  45 +++
 .../boot/dts/freescale/imx8mn-var-som.dtsi    | 364 ++++++++++--------
 6 files changed, 446 insertions(+), 157 deletions(-)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony-legacy.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mn-var-som-wifi-brcm-legacy.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mn-var-som-wifi-bt-iw61x.dtsi


base-commit: d0c222c2e2ce577d801bdf129dc6c078f29e22df
-- 
2.47.3

