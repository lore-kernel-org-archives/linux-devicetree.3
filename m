Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAFB62BDC32
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 15:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779377817; cv=none; b=dlJX4hY/Qyz4DT3IfPV3laXSq/HS59Lut52QBTKxofJZFVPQDp+DE3/1ZVlnm4TjJNHUZd2eT0f9k9cgviQB7RX8YaG7j92k0iFYo6KT5W0XkrHhZEWG7uhFCzX4HLgAxaDdL14bKC8XCcmHIXzTArMP76XhnZ0WAJXJ4STUBvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779377817; c=relaxed/simple;
	bh=jYXygDsMTmmAvlNt7SLorTLjZntIVRWjwlL1muBsyXk=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=WQDvP5nyw09bE8nPr7uXSndiGezssbTCyG9EQvTR2zwHXp38nYt92huCicOd7MXINudjvtqPB4Rw7qPleMc6sUvDp48v+dzhKsSteGrh8oa26EE1hYNWbuaafHLk3c8wsUNzKhEMWdEZStRhq0mV6Xe3RhEk0wzFWo2lEZXDRss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O+HaIqgw; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O+HaIqgw"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-488ab2db91aso65909375e9.3
        for <devicetree@vger.kernel.org>; Thu, 21 May 2026 08:36:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779377813; x=1779982613; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=yI2KtTIwiuNK+knqFFW8fgG1npheFcqTp4LO6YB2KS4=;
        b=O+HaIqgweZrYiajNw1wvBZeS2CNvbQwRsjqaB723Y6sPFXy30QF22p8BEStWv+arHo
         MqolxzlyjwuCtNMYElt0Ww1W4atIPVxwmYaijJQZPWQDNG7IHqaBvhTKj5k8yxkLd5py
         nNjbr4d68VW5e3Ls4mBBQwab00rvWuuAPlj2O5+lNtLyH6QxVfMCpEVJjZkH4+ylnFl4
         TnQXq7AZCNKSwqi0WalpvJxzpG7trYAzDKM8mBK2CL1CDM84fhw5MbyTX+yHZas5kJJb
         GRqohV8YtZ7YhRwdK8T2HV6wdYJWoezZizK8bSCiD3XfA1SjdHJN1+mOs6a/oMnkwtG4
         vaqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779377813; x=1779982613;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yI2KtTIwiuNK+knqFFW8fgG1npheFcqTp4LO6YB2KS4=;
        b=bz9c/IiPGVgZQPwXxBI7R/xaIhAallyRbHWkr2kpU4xpK1J/4AoNKpI7VIwJL8YPzt
         VxsdOtLjifdC4DqyY5EwhFLFcwPC5uqryYTUh80Igavs7Kx9b+mNBkoYJzFVbhHG7/GQ
         7Rb5u/9X9C6DIdlX4VwHyvb2TPJHSCFbRe8z8A5EVetH1ohar8eQR2zOTCL+8NU/RpSv
         7byHAcHYuB4gv1hLlpWX4aRT8pd3XmjfhmEYjLRKOnHn2axgSF21ZqSYx0rcCANuvEsy
         ngIguXGcHEpvI5Q5fcLTCO3wDdopwsy/J142/ZCUrpFWD/thFP6Gp6DPIsNunU3sRpCW
         PGqQ==
X-Forwarded-Encrypted: i=1; AFNElJ8H5i/RYlmOTy3hxOHgH/CN275OGUv5ecYPZv0egxpuy5Xb1gsZJF4vk4IfOnswzjDfnIl+5i95lfuf@vger.kernel.org
X-Gm-Message-State: AOJu0YzCXa+6uCqxqPnzqeakMtXo5FyDjbayrVd1Ti1bSRV1FAgZRzIm
	O2omtgjrl8cArUVp3MIeVPSOTtdF+1GbNmBMSYiNdPbisPBwYAvPRvAP
X-Gm-Gg: Acq92OEDRg86qoyPPiirPKRZYj/5MN2otmj4KHQeUkcqRFFc9qxT/YExAo0kD2Qav/R
	wMqj0Jhdbpql9EO2cK7/W783EN1ta11PxXObxoPshrHSWyegyrnanht6Rst1x2N3Zxa0PlaCBlw
	s2Yer+Nc0NwPuUlQ7aNj1kV/1DZDwZYz2RvQ7+WjRBhbIXewiDhF9Jkb65/uNHwuDwTNjAeFBI/
	DBbvCkZmQt2CmZY8BRdbs1bEpN3aoZPz/5QbEK7ndVWp5quEaPa3terWEqgt4TBp/qVN5xlPQDZ
	GTI1yu62tlOjiJKhJXSp342Ylie0t8CH+ldAR77c88ocPHMghNJBLhIoogtUjhaN1gCZx4vcEjQ
	ZVTbxiUBKnnApMGfXAQeArZo2wKb8VCeKmbark6BHrL7RVZ+bkQo6nk0ON8VyFTQO0mrZKKG7m7
	HcOOd15dMxW6OoZ/ebxb6TiFGoiyews7/E6x2sXRqxZQQdFZeXSuuhmnB2F+Eh3EHcocZ7By0wZ
	w==
X-Received: by 2002:a05:600c:8b34:b0:490:3d27:94f4 with SMTP id 5b1f17b1804b1-4903d2797c3mr28980425e9.7.1779377812772;
        Thu, 21 May 2026 08:36:52 -0700 (PDT)
Received: from Ansuel-XPS24 (host-79-22-5-99.retail.telecomitalia.it. [79.22.5.99])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49033d9edcbsm79159825e9.13.2026.05.21.08.36.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 08:36:50 -0700 (PDT)
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
Subject: [PATCH v9 0/5] airoha: an7581: USB support
Date: Thu, 21 May 2026 17:35:51 +0200
Message-ID: <20260521153645.7028-1-ansuelsmth@gmail.com>
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
 drivers/clk/clk-en7523.c                      | 218 ++++++-
 drivers/phy/Kconfig                           |  11 +-
 drivers/phy/Makefile                          |   4 +-
 drivers/phy/airoha/Kconfig                    |  24 +
 drivers/phy/airoha/Makefile                   |   4 +
 .../phy-an7581-pcie-regs.h}                   |   2 +-
 .../phy-an7581-pcie.c}                        |   6 +-
 drivers/phy/airoha/phy-an7581-usb.c           | 559 ++++++++++++++++++
 include/dt-bindings/soc/airoha,scu-ssr.h      |  11 +
 13 files changed, 901 insertions(+), 21 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/phy/airoha,an7581-usb-phy.yaml
 create mode 100644 drivers/phy/airoha/Kconfig
 create mode 100644 drivers/phy/airoha/Makefile
 rename drivers/phy/{phy-airoha-pcie-regs.h => airoha/phy-an7581-pcie-regs.h} (99%)
 rename drivers/phy/{phy-airoha-pcie.c => airoha/phy-an7581-pcie.c} (99%)
 create mode 100644 drivers/phy/airoha/phy-an7581-usb.c
 create mode 100644 include/dt-bindings/soc/airoha,scu-ssr.h

-- 
2.53.0

