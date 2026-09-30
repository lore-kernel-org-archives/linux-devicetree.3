Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C4973D669A
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 07:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790752718; cv=none; b=HVJnvU0z4qksOZqgDqPUJaBis2A6sKadCk/ZV3j8UdFyAd3IQy6C3Y6lIEXk2EYz/CuqQbeCKBtKnljqD3OrlQH30H7jM4WrzgoCB0XiYJbHeL6vqbLxCk4QZ5LykY5T0Y49OMwOPUQJLXrYTtx6QZsMZmR7VQDMxtg2GMcUjyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790752718; c=relaxed/simple;
	bh=GMtjND5ptledmZaDMH/T9/dH+V/0E+i0Av6Y/iGEgXc=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=lyvoo1KvyHV5CXGQY3IgIZlHXqz+InjFraFZBj5MJiCDEYDOYrTV0e5NolC/V2OK7a1ACnmlMUffdMbVyz1ISB20Q8Kv6jqoGeD7+teRd3QmkC1rDBJKuULBjyrA8hB6lEYU5piuZ+VsjyXhPjukeBZs184CH2GGg2fhLeVtVXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PpX6NTGl; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PpX6NTGl"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ffbd83a92so30439235e9.0
        for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 00:18:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790752715; x=1791357515; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y5Ar/J3lXFwxWphKUtD7c9Gh3UMYH3kW8PbvXHpvZmY=;
        b=PpX6NTGl0ts5aj4P/31JOamR9oEXSWIZcZZwz8EAiKd+HyJ150vMW2aho8dS95Wskq
         5NhrpTw3b7cYLbaIx8RcXNI1LyfNU+AQrNjkM1JU2CB+AsT/hrLBvo5bspyOEbSLQ2s3
         ICpZD+R91rSioVsUdUjYkz8dfuuIyAVnF65c/MTDDZyo45anbSy6y7FXpWDaeNHJzUUM
         5znv7TslxqRKsKVmMPzH0U8LZ8uHvokhpwYfcd7gDmHNzVSIAVwBcDpdLXOLA2jLgEUD
         Kb+0BwhfzRSTAF8Ew26CTg4zHFzin+ffzUdFyYRgTRaV+LoDvFdn9PHJij/DbOv3WMYD
         6lvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790752715; x=1791357515;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Y5Ar/J3lXFwxWphKUtD7c9Gh3UMYH3kW8PbvXHpvZmY=;
        b=dpqVZackgHSLqbpJTaXQxUXfYbvBChCfvPAaS9M+4xrdPtD17RwU3B7hBAVEiS/Efz
         z+pOiidcirUDorndI4SF/psnDQTqFzMS3kTpoU10aawtDmdF+X5eW8CV7GXorcMTAawa
         XR94um4DS+Brk1BST2em3fw3RY9LHcsgXnJ1PPRYEYT9Chjm9FjQCfRYWQY+81oUjste
         hOxp1Hr6Xi75ibiJPYPt7HBBzjwK5iugndMuHILVqJIBVQZJfzjrKVRIiy5mlc29nToP
         nNmxMD+eE1mtqcHxvRR5QeB3P0KvnQ/gzKCSqOZ+B12XBXfS/fHy8KOJaQZ01cCzoPm4
         ie4g==
X-Forwarded-Encrypted: i=1; AKwUvByjvUXCRbenWb4BvVk8VlKH8rIkVxuG8uq4valMF41wuswUeLslyDelhv9TkPB6NovIMRf7aLNAtp6w@vger.kernel.org
X-Gm-Message-State: AFuF++nM6G5nJCS/bRTQIpnOZRZl4Dw7TItSFT+l/8g2rnPwed6wMEx0
	pdCijDym+lTFQpxyprhEtIFSntYrC3d5RCHnkBC07Zq+a4SWuXhKpnT1
X-Gm-Gg: AYBFou2mMJPQBQ3PngYCEkNmUq4XRqoZOkCMY9Ki8O7GA+omAYABXRCngdEgIC6VOTO
	4M4SnWuMifTDs249YrKOnAfGYyz+7V/+SzaMBBX9gisqJfcPIEe7Q3UjUVMGbG9FNSo7k/Tgi7m
	1+IGP9L6+NzqJzbEIk8uzYw407ioZ9+FMVavp52JTX6ev3XYLm4rZSfC6gY9lqfMF6TAbsPIVXj
	HDwxgEnvZ/b8v9ZN0c7uHkd5xi2eqn9TnnhHqV9h/me+Thbhdk91sPPVhmtOtP9rRM4V5dfH0JV
	4MPF6uMhN9CoWoFCNGy1ZiBcRKoW8thwLuGuOPDI6N+2Ol9ZNMLJGqhgLoRUX3AmpF/zolXghGc
	D1kQkDbgR0l59DRiwSHx4TcP5lCqrhLSUv1qTVkZ88+q/o1kuYrTImV7Orb39yeAxDNo7FENYJ8
	fsMDlAefnpoOO1MAoOvqj09z18E4iQHRpXsRqnh0v9Jea2G6UZUuLugOxxNN3McfB3GV8vgfr8O
	cmsUQhk08YYJXMaEQQSxCVIgfLWpW0g8g+uW3CsFmwL1LV+uf5iHXebpg9VaBB1
X-Received: by 2002:a05:600c:3486:b0:49d:17d4:aff2 with SMTP id 5b1f17b1804b1-4a01ad9847amr4981855e9.1.1790752715090;
        Wed, 30 Sep 2026 00:18:35 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-82-57-191-234.retail.telecomitalia.it. [82.57.191.234])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4a01b1e79e4sm10590905e9.2.2026.09.30.00.18.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 00:18:34 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v12 0/3] airoha: an7581: USB support
Date: Wed, 30 Sep 2026 09:18:16 +0200
Message-ID: <20260930071826.48811-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
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

Changes v12:
- Rebase on top of linux-next now that clk patch got merged

Changes v11:
- Remove clk patch and move to dedicated series

Changes v10:
- Rebase on top of linux-next
- Add review tag for DT patch

Changes v9:
- Add spinlock init
- Add ack tag
- Add review tag
- Add additional comments for phys on USB 3.0
- Add extra logic to make phys optional for USB 3.0

Changes v8:
- Squash header to clk Documentation patch
- Address comments from AI Bot
  Link: https://lore.kernel.org/all/20260520150912.11614-1-ansuelsmth@gmail.com/

Changes v7:
- Rework to double PHY implementation
  (suggested by Rob)
  Now the clk driver expose a PHY for Serdes port
  USB PHY driver selects it
- Rebase on top of linux-next
  Link: https://lore.kernel.org/all/20260519220813.28468-1-ansuelsmth@gmail.com/

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

Christian Marangi (3):
  dt-bindings: phy: Add documentation for Airoha AN7581 USB PHY
  phy: move and rename Airoha PCIe PHY driver to dedicated directory
  phy: airoha: Add support for Airoha AN7581 USB PHY

 .../bindings/phy/airoha,an7581-usb-phy.yaml   |  62 ++
 MAINTAINERS                                   |  11 +-
 drivers/phy/Kconfig                           |  11 +-
 drivers/phy/Makefile                          |   4 +-
 drivers/phy/airoha/Kconfig                    |  24 +
 drivers/phy/airoha/Makefile                   |   4 +
 .../phy-an7581-pcie-regs.h}                   |   2 +-
 .../phy-an7581-pcie.c}                        |   6 +-
 drivers/phy/airoha/phy-an7581-usb.c           | 559 ++++++++++++++++++
 9 files changed, 665 insertions(+), 18 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/phy/airoha,an7581-usb-phy.yaml
 create mode 100644 drivers/phy/airoha/Kconfig
 create mode 100644 drivers/phy/airoha/Makefile
 rename drivers/phy/{phy-airoha-pcie-regs.h => airoha/phy-an7581-pcie-regs.h} (99%)
 rename drivers/phy/{phy-airoha-pcie.c => airoha/phy-an7581-pcie.c} (99%)
 create mode 100644 drivers/phy/airoha/phy-an7581-usb.c

-- 
2.55.0

