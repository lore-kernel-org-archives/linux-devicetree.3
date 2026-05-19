Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01101367B69
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 22:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779228507; cv=none; b=UyqJ7vNnajH8LPdZvXQuI5a+COV7V3+4HKKufYr+VeRt92hQ6hENniZLzrGcnAjWi9RHtfI+5sSvidAeva6Ygx1uDqG+P0xc5gVk1bK7ODyrPbhYs785Vg6ABc8XUfvyzakw2Uhl5b+xOG7ZBIDvl1XLOXZXuVyPqMEubbkoTqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779228507; c=relaxed/simple;
	bh=G/Nrw3cfains+j9k1LacJdGljge49H6XmskKVoFGD5I=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=hrai0OfMpS49E5ML8gkkVoqWLhVYJT/WYVPHpMfYjMRmGvUyDFhh1hUCsTNx1OFMpk1ljKh2x40ogOwr5qYPiGlJnNdZXELRi+fUyXV9pBFmFVjT5MDdErGkY/sT5VP7AEIdq/UhIJgQqeB2IN7htrnzUxOOIw/MgUL+8RmvkFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DlBwndkJ; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DlBwndkJ"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-48d146705b4so45126175e9.3
        for <devicetree@vger.kernel.org>; Tue, 19 May 2026 15:08:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779228504; x=1779833304; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=n9SmKxDkFJP0+we87jbRanJrpKrMwE9QMl+XapPOXtc=;
        b=DlBwndkJWwBygXaDmUISDlV56F2Jr/umPToNDDosW5ygZuzlAwf3Cwke3MbHi3cDia
         wi2BRNaB9agDP+VKaNK0L6KnxeSDZbz5Ir0n82uY8PvmALTh5ypUSBn7xjWTYhBnOoQf
         N9lRv6ndQjaZ+exVwrNJE3MJnZGKrsoMIO97MtQQiyVsLK9rJRUL8llOxpMsyaLAiKYm
         Y2O7WdSatxODwJw6MjzEtmxQiA2lXShlKvFgB2XjK2nfTHTQB6V8iRvkfQmsyngaojuT
         hEy6gl8XyUc56UP2eFi68x4g2shXkT8GpVKlZiGih6bq131veqOU0Hy02F72qhz6DzL+
         CAUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779228504; x=1779833304;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n9SmKxDkFJP0+we87jbRanJrpKrMwE9QMl+XapPOXtc=;
        b=JepN2KGJTyrxm/VPKExZTjc+qBDzebrh/VpYHoJ4dPMf080tebmx3MnASWv3ZhbMhf
         H4kcoQvplboY19W82ODJm3cp4jt4e3+Tu9rT+OFJzf/B6vnbBKE/d8Mzy+f01lRN/pdr
         pk4WRveSWPKCj3/mPYW0olK3uaBsUPQ41ZjaE18NSw825vshaVE/y2LxXFjeHfjWT/JM
         q1IVy7j6V4YhGC2w93qIxCik8d0cDwa3o2xImdCWrZw+VX1DVocLgc7W3TgXaGgNHgdv
         AhS3tvWrtlziygZqBvnyO5Y+nJkcY2fDOFuG9NnJaxwdW3GjLWuhDW+wxLMkTTnfT36p
         PK4Q==
X-Forwarded-Encrypted: i=1; AFNElJ/pSTPQDW4rFNXyOfU/EtBimdFUdDkKQJfLL73l9p3ihsthQC2ABmfq1GuiTj368kES3TqsdlEVwBS/@vger.kernel.org
X-Gm-Message-State: AOJu0YzSGsFOohpi+J5NbyMkkhffLzZRro8onycD5bWCCxZO6Ti1omyF
	4bVejVAv/SC02StEQPTCsJ8Ayn5Mr5u5e7H+eZSHfAIuijdRbA5kdXhg
X-Gm-Gg: Acq92OEETAaTHa23yKaFaiW+DnobLdVjNJdc+qBQHxa5YCxXE6GUhA0kVl3t3KEsUXf
	jybEAePYVoWJdWqNoSV9YUGc1qG/EkdqBDsh514jjnA4EczxkL9CKVQ5FI0VfNUgmlNuHHzeIAX
	T2MBaQJe09DtyE5rLzDqISiVrpdZ0l60sEZaj/+UOWyB8O9ZXjoIwuvKEiiqtamQfdMgDzbMaHD
	XYcjDdjZUnwSZbfJlJu2S+3h7vFt/bwZLWGcBH+YcxmAnp4Bdxg0r3L0iQ/zVL1+q9nE/FBVx94
	Mcwm1W8kWQ39C/v9l7swgGiOVlYTbuTfptXeTEhFON58Igcfs6081cOKjcLGJ6MLrn3WhvpOmc8
	tJXGWbjDk6dFJ/k7re1u4mVvxjD4KG5R82P3HcA1G4QLJoK/OydZmNcvHijm3xmf5E848eB9vNm
	vvwkOpmIPDR+5mpoUUNKRyu3JDksUrDJPU2SMI8OCs+OU/A6UU+LqsQBilH8M9/+Ls88IUaM0AF
	oTCOpQMaQ==
X-Received: by 2002:a05:600c:3493:b0:48f:d2fc:d042 with SMTP id 5b1f17b1804b1-48fe61f1a27mr348852915e9.13.1779228504201;
        Tue, 19 May 2026 15:08:24 -0700 (PDT)
Received: from Ansuel-XPS24 (host-82-55-252-101.retail.telecomitalia.it. [82.55.252.101])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-48febe585absm118304005e9.19.2026.05.19.15.08.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 15:08:23 -0700 (PDT)
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
Subject: [PATCH v7 0/6] airoha: an7581: USB support
Date: Wed, 20 May 2026 00:08:05 +0200
Message-ID: <20260519220813.28468-1-ansuelsmth@gmail.com>
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

Changes v7:
- Rework to double PHY implementation
  (suggested by Rob)
  Now the clk driver expose a PHY for Serdes port
  USB PHY driver selects it
- Rebase on top of linux-next

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

Christian Marangi (6):
  dt-bindings: soc: Add bindings for Airoha SCU Serdes lines
  dt-bindings: clock: airoha: Add PHY binding for Serdes port
  dt-bindings: phy: Add documentation for Airoha AN7581 USB PHY
  clk: en7523: Add support for selecting the Serdes port in SCU
  phy: move and rename Airoha PCIe PHY driver to dedicated directory
  phy: airoha: Add support for Airoha AN7581 USB PHY

 .../bindings/clock/airoha,en7523-scu.yaml     |    9 +
 .../bindings/phy/airoha,an7581-usb-phy.yaml   |   62 +
 MAINTAINERS                                   |   11 +-
 drivers/clk/Kconfig                           |    1 +
 drivers/clk/clk-en7523.c                      |  207 ++-
 drivers/phy/Kconfig                           |   11 +-
 drivers/phy/Makefile                          |    4 +-
 drivers/phy/airoha/Kconfig                    |   23 +
 drivers/phy/airoha/Makefile                   |    4 +
 drivers/phy/airoha/phy-an7581-pcie-regs.h     |  494 +++++++
 drivers/phy/airoha/phy-an7581-pcie.c          | 1290 +++++++++++++++++
 drivers/phy/airoha/phy-an7581-usb.c           |  562 +++++++
 include/dt-bindings/soc/airoha,scu-ssr.h      |   11 +
 13 files changed, 2672 insertions(+), 17 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/phy/airoha,an7581-usb-phy.yaml
 create mode 100644 drivers/phy/airoha/Kconfig
 create mode 100644 drivers/phy/airoha/Makefile
 create mode 100644 drivers/phy/airoha/phy-an7581-pcie-regs.h
 create mode 100644 drivers/phy/airoha/phy-an7581-pcie.c
 create mode 100644 drivers/phy/airoha/phy-an7581-usb.c
 create mode 100644 include/dt-bindings/soc/airoha,scu-ssr.h

-- 
2.53.0

