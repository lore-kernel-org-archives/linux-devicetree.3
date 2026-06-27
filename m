Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 423B73AE193
	for <devicetree@vger.kernel.org>; Sat, 27 Jun 2026 12:15:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782562502; cv=none; b=PdIEjd2HsknWOXdoYk2tpxVdVfTvpZg55JAhJpI2yBCYw8m23bjD4LoMAgYLkoV070VjwzPDsJh50tBi0vLzYPCE2O7jVTSVTNn385HOw1cEeiUEmVbUK6HGSN+9DB06rnz4vCgqi/U8ftkdsKGVpt9s31e9SNfkOIneviE1s6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782562502; c=relaxed/simple;
	bh=iOqbzTOr7Al7FRgdDYfrfx6rKgnAR26rPeCHRKlIgiM=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=f+FJlPm1Cz/Cz/6dPH8Bu0uSUM1Q65Ro/X0+ZzdGtut2Rks8TlLd7LueZB/h50LTXlUQYFXsq9p+9fcOKyhcAlhb+YuZ67kxV/3m5V5IOenQZiLmZm2XMhO//6Y8DgRPnRdwmBzJmWCRXCsGYVcE2Yj2JKVs5P07mmjQ2gvRU2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c+F7+STo; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c+F7+STo"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-49258ac7294so13275615e9.0
        for <devicetree@vger.kernel.org>; Sat, 27 Jun 2026 05:15:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782562500; x=1783167300; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=ENGLhUzySY12FfgNeO/39C61qpfSr8IVf4djxpXqVbg=;
        b=c+F7+SToXKOjitreIm7Brg6kMOEXdrDcrlPQ8e+9oH9P0hN2Az6Wy5jZgzkT8q9cgT
         w3yvycvwwY1BXhEx3dc+HulQ0pOa1jSPttpInRZfEFARoeTvdHPDAt7iJNwBv9NJfewq
         QjTlhHXgrpI9dBSNIuFdSZKZGn3tjsWmWNJKfnOv/0XxP/RDlMhmYsUSIxfGTK5hapvG
         DPA9jWk87QLmNqtgYWkoGHIxEUV2+F5FyD5hMpLUBQmmTgmrn0ojnylWud1o2EJQX7qh
         0NnQw5MyyOzqkRg3xuCjXoCMniWGc2NaTiO/lHWQTdHXbwQzrzHJqdqycA9l2CcDFAHC
         1iSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782562500; x=1783167300;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ENGLhUzySY12FfgNeO/39C61qpfSr8IVf4djxpXqVbg=;
        b=eKuzUQUuAGwzaqEENUGexVVZL60SW36zexNYvQMha0IPuExLupkJpz22G24rnt580s
         8y01VA1V8aLwJeJ7bYOstwu5mt5shmyJ101EvcMSuEMfh0uJ2ojdaxkuMn77Hq/N90Wg
         FHMu86qyFoDdKk8T50WPVEFfk2WmKo1zHVjTUhMWziJIS+bKpYSF/m/txlRdW+mP0dNy
         XKyW0ZwARk6YR+8U6RkltmYvKnlE2BlSI+k+15fEqqecgjti+aHo+rYBA+TSBR+4YFHT
         G4Dy1p/IIQDnDMxPxRwcJ7ACwEW7q8wCF4hcCMecYmoqyIELDeRq2Q+E0oazRI9tQnUN
         OuNQ==
X-Forwarded-Encrypted: i=1; AFNElJ+7m1utS6kkO3JkxmkvYjo0tuu32ncnBebOLK3wHmuo6yDPnuY6tvGUnEPJTxRoRyKGlOmgZSvfgipy@vger.kernel.org
X-Gm-Message-State: AOJu0YxtXpnMysZUJZUHQRr8qwg6JG54yQmHqyF7xIFZYf7alMXPzmu2
	B+hfppdC7Ild+4edmYVHsWCDkXLAhyMHCCqzm4OrCjrCjOE63/U0TkzB
X-Gm-Gg: AfdE7cmuuxrnNIRuURwrc56Ua96FiCqSwOBCAP7iXwHmxldxUbc66rOx2JH9+1k4quW
	Am0Yr4qyYn+7NPu48WIdJrL2UQXE4USRlpsL3POpXQrqtCWZTYuWtVfEdHBHlm+hh7nrclBor9G
	jDZMTZ93u81ACBhJzl0BGtXnhcSkE3yKkyBowYqBH7n9xPiw7jyU+tjSchG45QKEdzNW1/MQJNs
	uYZENATMtNAjb+aANU52G7aXqfUKsJ+Lj3MFNS93kUNdV9USIUzw+WVn1T38yDwVqachUsbfz10
	B+oXve00esk4BH82Dw23BTD2gJNxhwyrkCtkAJl0eQYZ0AuPwZBXxPHuOoh5l/GReZAyMTIWP4R
	KDZ8mdBkicBKoWQFA7ixDre90hZb++5dZiTnrkOtb+h3ThPHqz2ZJoCz6s5NLOp5JPTqkK0IogW
	4ias21f0YBQ1OFuXOxT7Oqr3dbeO1wRR20XF8QfbAzz/tdhvxV62J/J3WuHoIqrA==
X-Received: by 2002:a05:600c:3f06:b0:492:33a8:5499 with SMTP id 5b1f17b1804b1-492668858a8mr160407315e9.17.1782562499407;
        Sat, 27 Jun 2026 05:14:59 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (93-34-89-195.ip49.fastwebnet.it. [93.34.89.195])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49269002511sm149028265e9.8.2026.06.27.05.14.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jun 2026 05:14:59 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Jianjun Wang <jianjun.wang@mediatek.com>,
	linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 0/4] CI: mediatek-gen3: Add 2-lanes mode support + clock
Date: Sat, 27 Jun 2026 14:14:41 +0200
Message-ID: <20260627121450.3529133-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This small series introduce support for 2-lanes mode for Airoha AN7581
SoC. This is needed for correctly functionality of Eagle WiFi Card
normally attached to this SoC that require a 2-line PCIe card to
correctly work (and give the proper performance)

The first 2 patch address a limitation of the PCIe implementation
where the PERSTOUT reset were indirectly asserted and deasserted
all at the same time (for all the 3 PCIe card) with PCIe
enable and disable.
The 2 patch address this and introduce correct reset to control
reset line for the relevant PCIe line.

The last 2 patch add additional logic and support to assert
and deassert the PERSTOUT and also apply the required configuration
for 2-lanes mode.

2-lanes mode is implemented in DT by adding the required property
and by defining the "num-lanes" to 2.

Changes v3:
- Add Ack from Krzysztof
- Improve commit description of PCIe patch
- Use pcie->num_lanes instead of possible uninit variable num_lanes
Changes v2:
- Address typo regs -> reg in Documentation
- Address typo lan -> lane in Documentation
- Apply a suggested fix from Airoha for PCIe MUX configuration
  before PHY init
- Parse secondary reg in probe
- Add missing reset_status handling for inverted bits
- Move SCU to local handling in power_up
- Add check for max num-lanes for EN7581

Christian Marangi (4):
  dt-bindings: clock: airoha: Add additional reset for PCIe PERSTOUT
  clk: en7523: add support for dedicated PCIe PERSTOUT reset
  dt-bindings: PCI: mediatek-gen3: Split Airoha schema and document
    2-lanes
  PCI: mediatek-gen3: Add 2-lanes mode support for Airoha AN7581

 .../bindings/pci/airoha,en7581-pcie.yaml      | 251 ++++++++++++++++++
 .../bindings/pci/mediatek-pcie-gen3.yaml      |  77 +-----
 drivers/clk/clk-en7523.c                      |  39 ++-
 drivers/pci/controller/pcie-mediatek-gen3.c   | 104 ++++++--
 .../dt-bindings/reset/airoha,en7581-reset.h   |   4 +
 5 files changed, 375 insertions(+), 100 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pci/airoha,en7581-pcie.yaml

-- 
2.53.0

