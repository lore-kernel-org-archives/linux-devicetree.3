Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDA7E27B353
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 15:09:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779289772; cv=none; b=KImxjS2vkNN+d0Ef2xgusqq/2BqwtKEzJrcylwE8Sqy34bZ7dNemGPZzK0BKsRVH8dL6+VU352PqgAY3Awn3/aJBzs8fCo92mVN+ga8/ySpi5uwp2zMohSrsc3ct3o5CaHGzsXK8dmeLjA7TsUDq2rA9PuNqUYSto7ez2ao7wew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779289772; c=relaxed/simple;
	bh=iK+ZuZ9BR1rFtDYZz+Aooke9+Bk5hQhX85c0ae+iTQk=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=qeA6t95IOlebzoVGixtHYoYB70b5UlIjEoq0fAdeOeYEAq1eynUf+NEo5VuXLdD5G+JegC43kK36Hf0kqN0MnOlD7NmksIeYt3YsoLMWxixH0BrbspqSyDw4veGBDbYmj9CkcEb3KSbOH6oFSsRgVASes67HgAsSI7KER5gCffE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NiBZ+GGf; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NiBZ+GGf"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-45e8a834cc2so1751915f8f.1
        for <devicetree@vger.kernel.org>; Wed, 20 May 2026 08:09:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779289769; x=1779894569; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=DVZ1aHDip8CwzjzzjcHFHeqEyzf02kvl0N1Yqf9H390=;
        b=NiBZ+GGfUAjOlXhZphhQNg9HXcpmt2/eUhP2sa6y1Cgk71hmL9o4WqxKuRMB/vaUWY
         lS7ax/NjE12Rfys7tTsMCpqdKoWbbmY0L/IbxNOuy9YClBF//s3+WprP6Y1U1ZZvYFxV
         Vwhzk9AzUduzCuOH2diXmCiS4QU9t9gOIPaNsjZEMjPUc88LFIkFvb4yOTfa9+qBPjNc
         9u3R+ML3nhzSgDPjoyQDnvarUf6V5ewZIeoI2x73tlvO4hnbHdjXeuqnXh8TIR5QDb+m
         oDZ/h2euM3x5ZyjiqVAs6yUX/IRcuoMEAcxaMtIb1EyUSXyc5wuROIjsWrjTUpax1K4X
         6Z8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779289769; x=1779894569;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DVZ1aHDip8CwzjzzjcHFHeqEyzf02kvl0N1Yqf9H390=;
        b=QZHTL8YAiIcVwoeK4osN7MUFLobknt2gpBO7a6QgiW3x9Jpr/fjZ2BIwlLzuHvoavd
         WMG1oYFr2+8PIMrmXndDtBbzOZG8sk6fsm39da52DHKNBkmFMHoQ7iaJOPC0/FcB/PoD
         Db/jPJaUmkFTBCy/S81iCoJg8jxJ9wau9WsfrPexCay3XGWkZewx+mL52r5ptlv929/D
         LTOLjib09wK94UfXH8dwY5XyX8tQ+uDT0CH2yeuFo/CBlzqVYdzGG6UsyOF+JXwIioYW
         uj4D2ELxh2KiGRANSsWwBjxbtni3JCHixa9FkNV0pCWxzZLvM4Jr3N4kCkc7EmGUKPbr
         6pkA==
X-Forwarded-Encrypted: i=1; AFNElJ+ZPjQTZdtRoynuuxHiJk5cni+kyvJ2DItkCaIjgp+oRkOogULAYBaktqf1jf8xPGvcAol/oyh2E8kd@vger.kernel.org
X-Gm-Message-State: AOJu0YyT91fycm0wqS3+r/abDqEFTeZaLrR8rOMXw4fIxGjAY83biwka
	rMXgnRRm7NYjCYtoUUSfRYvH2/aSyQ0/rvAnohREG/0jtQPqeZmsIzmM
X-Gm-Gg: Acq92OGZOkvGU4oZfHxbRuodsuEI3kx+uxEVS64qjZc7SXk3g2W/YS+Kx9BhFC19aZN
	lBhJzwoLpt644UHMf9AGe+RsofE0oYQnpoTiTdv690QI/d3s3OCOGLauJrYZ5iO2WH3//0KFPhE
	uvEo1+sujHM38cHBUk29IQtfjzWl53qmogOTlIHK5WEAnDS2MgccTICGfmZ218gqWRwdSH4+jvt
	l/JgAsRishhEV+33DlytKhDncLHMkGSN38w6YDCv7ZTFEcKs6SWHDfe1ADpiWvNkb9qW158Agdg
	HofgCyilL2TzUghiwCd4/FEx0mNjiQRw/p2dMDpMfQtuM2Efp7Wu3/yCCzZV2OCcWuKkYBMF7CK
	uTpKKfYey4KdlEQWFhBnBeQ5/5FSGL3EI2z+8ItSgaNY/KY/tsw7xNZ+YXi+fa6+a0xsR8qlHCC
	QM4ziLID9VWKTDEzloTUEglh1+1uU5K/ZuK3fKIiErdPOX1FA6hql+8NJNpLJ92EItXhi9ogaSA
	w==
X-Received: by 2002:a05:600c:4504:b0:48f:d1b8:9a9c with SMTP id 5b1f17b1804b1-48fe60e14bamr359822535e9.7.1779289768965;
        Wed, 20 May 2026 08:09:28 -0700 (PDT)
Received: from Ansuel-XPS24 (host-79-22-5-99.retail.telecomitalia.it. [79.22.5.99])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-45d9ec39806sm53639804f8f.9.2026.05.20.08.09.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 08:09:28 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Felix Fietkau <nbd@nbd.name>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org
Subject: [PATCH v8 0/5] airoha: an7581: USB support
Date: Wed, 20 May 2026 17:09:05 +0200
Message-ID: <20260520150912.11614-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is a major rework of the old v2 series.

The SoC always support USB 2.0 but for USB 3.0 it needs additional
configuration for the Serdes port. Such port can be either configured
for USB usage or for PCIe lines or HSGMII and these are configured
in the SCU space.

The previous implementation of a dedicated SSR driver was too
complex and fragile for the simple task of configuring a register
hence it was dropped and the handling is entirely in the PHY driver.

Everything was reducted to the dt-bindings to describe the Serdes line.

Also the property for the PHY are renamed to a more suitable name and
everything is now mandatory to simplify the implementation.
(the PHY are always present and active on the SoC)

Also other unrelated patch are dropped from this series.

Changes v8:
- Squash header to clk Documentation patch
- Address comments from AI Bot

Changes v7:
- Rework to double PHY implementation
  (suggested by Rob)
  Now the clk driver expose a PHY for Serdes port
  USB PHY driver selects it
- Rebase on top of linux-next
  Link: https://lore.kernel.org/all/20260306190156.22297-1-ansuelsmth@gmail.com/

Changes v6:
- Fix kernel test robot (sparse warning)
  Link: https://lore.kernel.org/all/20260306190156.22297-1-ansuelsmth@gmail.com/

Changes v5:
- Add Ack and Review tag from Connor
- Implement Ethernet support in the USB driver
  (testing support for this Serdes on a special reference board)
- Use an7581 prefix for USB PHY driver
  Link: https://lore.kernel.org/all/20251107160251.2307088-1-ansuelsmth@gmail.com/

Changes v4:
- Rename PCIe and USB PHY to AN7581
- Drop airoha,scu (handled directly in driver)
- Drop dt-bindings for monitor clock in favor of raw values
- Better describe the usage of airoha,usb3-serdes
- Simplify values of dt-bindings SSR SERDES
  Link: https://lore.kernel.org/all/20251107160251.2307088-1-ansuelsmth@gmail.com/

Changes v3:
- Drop clk changes
- Drop SSR driver
- Rename property in Documentation
- Simplify PHY handling
- Move SSR handling inside the PHY driver
  Link: https://lore.kernel.org/all/20251029173713.7670-1-ansuelsmth@gmail.com/

Changes v2:
- Drop changes for simple-mfd
- Rework PHY node structure to single node
- Drop port-id property in favor of serdes-port and
  usb2-monitor-clock-sel
- Make the SSR driver probe from the clock driver

Christian Marangi (5):
  dt-bindings: clock: airoha: Add PHY binding for Serdes port
  dt-bindings: phy: Add documentation for Airoha AN7581 USB PHY
  clk: en7523: Add support for selecting the Serdes port in SCU
  phy: move and rename Airoha PCIe PHY driver to dedicated directory
  phy: airoha: Add support for Airoha AN7581 USB PHY

 .../bindings/clock/airoha,en7523-scu.yaml     |   9 +
 .../bindings/phy/airoha,an7581-usb-phy.yaml   |  62 ++
 MAINTAINERS                                   |  11 +-
 drivers/clk/Kconfig                           |   1 +
 drivers/clk/clk-en7523.c                      | 216 ++++++-
 drivers/phy/Kconfig                           |  11 +-
 drivers/phy/Makefile                          |   4 +-
 drivers/phy/airoha/Kconfig                    |  24 +
 drivers/phy/airoha/Makefile                   |   4 +
 .../phy-an7581-pcie-regs.h}                   |   2 +-
 .../phy-an7581-pcie.c}                        |   6 +-
 drivers/phy/airoha/phy-an7581-usb.c           | 554 ++++++++++++++++++
 include/dt-bindings/soc/airoha,scu-ssr.h      |  11 +
 13 files changed, 894 insertions(+), 21 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/phy/airoha,an7581-usb-phy.yaml
 create mode 100644 drivers/phy/airoha/Kconfig
 create mode 100644 drivers/phy/airoha/Makefile
 rename drivers/phy/{phy-airoha-pcie-regs.h => airoha/phy-an7581-pcie-regs.h} (99%)
 rename drivers/phy/{phy-airoha-pcie.c => airoha/phy-an7581-pcie.c} (99%)
 create mode 100644 drivers/phy/airoha/phy-an7581-usb.c
 create mode 100644 include/dt-bindings/soc/airoha,scu-ssr.h

-- 
2.53.0

