Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B6813E4113
	for <devicetree@vger.kernel.org>; Tue,  6 Oct 2026 10:29:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791282588; cv=none; b=I+S1icyGcA6e+WItjafjG7sOqAMnDon2sXewxkW0RLYdoeljlXzOX/O/+g1g/bIVXXq+LlfWgf/YlMqpDAGdDm/3R8Mg6MMylTkG9rqQsxE7DAixxCnFicAxaGNBXZre6sZBJ3XE07eqBwIJYsMmrdUpG1zmnOVJBpLTWl7DB3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791282588; c=relaxed/simple;
	bh=fCCMGsIdCATwcrMTmFVjngOswQXf7xCGLQnCBjdJHk0=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=NV580HPO+BW9f3kgBjj+L1Cac87rFMUDfvcLHhu2xwPpqWL/JPlqdzLssrN94AaZd3Zzev6gx++/uxrcuvcZ/qI0LpV/KKOixQgpFFsZW2tr/7fzPE236ItNLgTcr2WtKvmqDyCV05oswVkR5sUW1/jTf/o1R10qVTKDgJv3aQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oxTrjAHh; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oxTrjAHh"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a061a13884so4951515e9.3
        for <devicetree@vger.kernel.org>; Tue, 06 Oct 2026 03:29:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791282585; x=1791887385; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TysRoX6VmeGROus3Z8XTTK5G2wbRE4tAp4KLkmbW3DI=;
        b=oxTrjAHhjVRdUWRoSiCqIrTW/wPvu3F7WXupXYzfAvFvWxGussb9Q2bCQDSkvEG2jy
         9nJJj6emxXubY03Jt/6c13kitxJUmP5vpc8lAEQdcZBT2cEbzUYNbDM/a1+OcfbbLStK
         To/Lxsk4/raAd8xPPl2bDyRFnz1JDEoNXBqaPFPbaoGL64l5W9I2RscWf+gTUdwimzG4
         hFeb3ikRDOo7z3KuqYQBCvJV4vP+OhOaA7gyrSxO21crQWWI9bpsdi/ZQQOnrwqbOAls
         cAt+K3TxXHlVgj+L9nCQAacxaEKAqggV2HkDvnvN28+X9/v76zEvB3A7BZqJYDWjb6fd
         unFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791282585; x=1791887385;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=TysRoX6VmeGROus3Z8XTTK5G2wbRE4tAp4KLkmbW3DI=;
        b=h6l/fcR3ZIn4S3s0hyK28LsU74nE94MQ9mXJ7N+3qQhtB6/0EF737y1jFtzcUigPoG
         XSn9M6NoN2IUAbhI0leZnNkwfI8OOP5qt2N2kLZtRolTNoIZUi+kCZ1v7EqkOv73w4I5
         4U4iGsfjrLWyVHL7mc4splctXX36+7d6HpQWs8brAE+W+VLGn4b0xwEr5SebsNAABlMW
         lfoaC3wt4QfcdElM5akjtELRge97vD9UpIcb/v9O7Cz4bDOHm4TP+i0FXUe/JvhJvebX
         x0fmborzmKCqT41VfDomySH6MxU5PfueOYi7Yj13GOw40TtEV7v4J9yHjkMxuZ+eTnS5
         PnkQ==
X-Forwarded-Encrypted: i=1; AKwUvBxwjaj36H8r0EOcm+efEnkPnFNzU+KQajf8Qn1VDyfSBfMnBXexcw2tl2vh7VCuccNpn24Yl+tYEZFh@vger.kernel.org
X-Gm-Message-State: AFuF++ll6D0A7XcSomA6+9beRCa0S60Ca0ZcnsVNFWw35AkxfxVjXFTy
	NRiTjv3hJrOvvBdSMYgVnZNCKeQBWIjVvhMF/m5+1D52nuOv1VZlbJW9
X-Gm-Gg: AYBFou2Q+mKjdce2Sz/hxxijM09/cT4K3UysYlcj5/7wRrg4xETCt4zo9bV5UynA+wh
	DzYywbVofUYiiUuXGcWbJATBnnfKQ5IBRhHC3NCORTls/o54dI/KLI55T0apGF/tRA6tT/wDJV3
	JnczkqyLGwj7k9pZYDaBflIeIaVmkqNb7kDEr7Qqkyo+uaBuvtbgaOSz/EtSwVD5D6ObufOPjmX
	v8GTzbSAcFk2FUrnGnIiQwJGsOHdc89K6y4WqHuxgtrHRzF5Ll3IURgmxkoEKnt55/Xgp3lwRTX
	QhSFy1drLxi2TFzuF5balU2K8ezkPJKsvdPmmCdV/f3CWPkzzM0AnI87ERWbIrV0N6uqWdw2AgR
	06Ac05jyCZ2hw7Brkej0VxleYNgf3F/olqqqP1v5cB2m/5bSwap7DVlXhE+cfmuMeFcYfHB4ZyX
	3zwceHoPTOX6l5kv5cihkzzlHoDl3b44auENfaB5jNLMxaGgmeqoPgObSmmVUyTW4hXVwWazK8Y
	QkAcBG9Ib9M6p0WodtymKbvS6cFExn+0D/VCMFUm2EbLxane6Wv54WFTMY3
X-Received: by 2002:a05:600d:8499:20b0:49f:ce78:3567 with SMTP id 5b1f17b1804b1-4a17b5526e6mr13173735e9.24.1791282584897;
        Tue, 06 Oct 2026 03:29:44 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-87-20-252-14.retail.telecomitalia.it. [87.20.252.14])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4a178c33091sm63427485e9.4.2026.10.06.03.29.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 03:29:44 -0700 (PDT)
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
Subject: [PATCH v14 0/3] airoha: an7581: USB support
Date: Tue,  6 Oct 2026 12:29:32 +0200
Message-ID: <20261006102937.10972-1-ansuelsmth@gmail.com>
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

Changes v14:
- Drop blank lines at EOF for DT patch
- Fix SPDX tag for move patch

Changes v13:
- Rebase on top of phy next

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

 .../bindings/phy/airoha,an7581-usb-phy.yaml   |  61 ++
 MAINTAINERS                                   |  11 +-
 drivers/phy/Kconfig                           |  11 +-
 drivers/phy/Makefile                          |   4 +-
 drivers/phy/airoha/Kconfig                    |  24 +
 drivers/phy/airoha/Makefile                   |   4 +
 .../phy-an7581-pcie-regs.h}                   |   0
 .../phy-an7581-pcie.c}                        |   6 +-
 drivers/phy/airoha/phy-an7581-usb.c           | 559 ++++++++++++++++++
 9 files changed, 663 insertions(+), 17 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/phy/airoha,an7581-usb-phy.yaml
 create mode 100644 drivers/phy/airoha/Kconfig
 create mode 100644 drivers/phy/airoha/Makefile
 rename drivers/phy/{phy-airoha-pcie-regs.h => airoha/phy-an7581-pcie-regs.h} (100%)
 rename drivers/phy/{phy-airoha-pcie.c => airoha/phy-an7581-pcie.c} (99%)
 create mode 100644 drivers/phy/airoha/phy-an7581-usb.c

-- 
2.55.0

