Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1009382393
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 18:45:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784918737; cv=none; b=CdPBcmvazQhV2bRtH87ivTchpCsx/G4n/grZKty0XSp7JACC8Kjhv4UIWBFQ5tt/Qjsbi4Q3GTF6iJB/dEWEvtJlRYeNSY8nRQszQTKFKC/F+PpR02ai7xn+90+Z8+y1V8tSAEcNbEDvuJ4qwaOWij+p86ZITqXOcKV+ilPRTs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784918737; c=relaxed/simple;
	bh=YxjXC74Qehe+/GaIugg0cEAa/U7wFpJHyY6k6mfp/g8=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=k4lri5Myh/j3h8FKjMrXj66Vjgej+Fs3feWywHcIHDnk0QQAJAFneSVqygPMQlnvHf613az5a9Iy9FN/IOs3bU+yA1RzqpW4JasYnZOPoW0OWkMFxXxxVWwGbu3m8FHSRHTWdRkx5K021LxTPIOkELkYnoI8Ql2OUZcyJjyjnGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JvPSZos5; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JvPSZos5"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-49548e01d02so4575535e9.0
        for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 11:45:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784918734; x=1785523534; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=txtxniZ+9ec8EBGpFntrCaDEilaRw0NUEsRkxlT+KQE=;
        b=JvPSZos5c3+9cE8fXYXmbOxmBwZdHebbHd1xqS8QiT0Ce3nsvBPGcphbQ/eRIkkf82
         wESzKTcHUVZTxxxmBYRKmLPJHyDRaHqvzS3ZceuOgBNd3bWRYovLR84X/TSJa3Pa+Gvn
         EeDViZA3JvyE84KV/YWtZfwuHyUGXmZVi1ex1FAIaC9DCLxCbAUY1zc3ba+MaOV/oOnr
         MeJ5QOSQSG7XjbP4QY+EytMRWTUDUHyQgeuAoo2tf3nY8vZ7tXYYf8MQhZa7vEBqZe+S
         w7XpfA0Wr4OB37tN++PvUwZ+BHbpmt/Y7Sor5tEUq9Uro0gIDumO/nJRr4hvRRNvrsHY
         ONXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784918734; x=1785523534;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=txtxniZ+9ec8EBGpFntrCaDEilaRw0NUEsRkxlT+KQE=;
        b=SXJJt2vdujjbnrtzFitkktKFszq/ZwBbS3bt62Zm6D23G0n7mYVV3aUf57K44ehbnb
         7hDQkc/c9IojiTLsZaYl4BI3wY4QMsk3lAyiMpOj2+DZytcsL+IA6Y0m4dzt9GEAdknt
         uKDsk5y+PY0XtmmvtobaBMH5shzjlIDkhKxuWQu5qN98hAiUB3FjZIRfcKW5YIee4658
         18TrTZ368oMlVGd75GdYwoRq64xU/+E2dJA1GczAbn81DAxVfMT4mvE8LM8SOIBJbGSS
         NKQZ+uHsn56gv9Er1ZmI1EzJY+56je9JG4nPg1r0UGQbPWDTKZEI2bAF/Rj6Vv9LPqEW
         12Hg==
X-Forwarded-Encrypted: i=1; AHgh+RqcvKRB92tNgDeKCOT35/c/YsDzcnnu3UnmnyjlHys5fUbtxmwQmPcWR6Dcl1HGizHTlGLL/4MpyRnp@vger.kernel.org
X-Gm-Message-State: AOJu0YxU4vitBpEkQYn/MvsQg2S9gX+3HUQJZN4XbYvS0yLl0/maqrXe
	zA8ENSVOtg9fPJkPHooopV49xKAhqsmFvIeROE84gJrRMa2+Nz1wGb3s
X-Gm-Gg: AR+sD13mtoZpSPexkuHfY/iVHp794eAnjbZKwohiFeAFNUeN0lB7Xtj3bPXvVKSab2f
	IBdOaqJS6h1Qq1wJdTXQ1OHllG+jre5WYcqBmLjk0frGabDEDHSCB0EzrfNebTkGPhuadflP1Ql
	4eziXNiGRdtc1p5l0lqRQ8mHnZ2ZSxiDCvNW6uLqbMHXDdSlzSuW1mD0AzCjV8qrTrAQU6Z3+k0
	Jmf4SVvpWKB3SgW6aOAi44mpack1qqcdng2EfMKciFCKgepXBMnAAGJgX8oyZHtzCMnvUtNBR1W
	9li8iK5Slcn4gKVbl1REvdInYOaeLNPkEDElgYb+pZC9lkY5jTvCjyiSgjBgIPAspWgRZSCjWiV
	G3rY3hNTF9GafYrZS0nPzlHR0Z6Mt5YAx0pgBhOqWbNAO2WGGZig+8bi4yqjwDkrO9Y58uiWrW5
	uPw3doFScHU2md7FxbZHEqnbuaghnAhOgWb4mWG4Y/kK7K9JQTwZ8qWBL1zeXYY+Ab
X-Received: by 2002:a05:600c:1d10:b0:495:5e3d:15e1 with SMTP id 5b1f17b1804b1-49573cd4133mr98180085e9.16.1784918733697;
        Fri, 24 Jul 2026 11:45:33 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-87-3-249-180.retail.telecomitalia.it. [87.3.249.180])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-496b4858e85sm11278335e9.1.2026.07.24.11.45.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 11:45:33 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v11 0/3] airoha: an7581: USB support
Date: Fri, 24 Jul 2026 20:45:19 +0200
Message-ID: <20260724184523.193661-1-ansuelsmth@gmail.com>
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
2.53.0

