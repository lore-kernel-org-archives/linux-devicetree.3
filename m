Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FB574195DC
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 07:12:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792134759; cv=none; b=oY8jeiixtJnpDt8XznFQtJ+U6nTG0f/+SBuZfkNSiG7RrOeKTYFkEVjzeJl20aV2G9L7q8axPepRzd3YTgZn0LUAnit2iwc11OoBcXQJ/LTQwt/Y3r53ZjXlIw+lIkzxFkAGb9pfWb3UW/8mqRqeJllCIGMRIuuE698MtGLKqZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792134759; c=relaxed/simple;
	bh=nUBV428k6cb1/zyNyUDW1FBpsf0H9Yc45aYCz8u//xw=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=prw7CYb218mO7G4ZoL7NEnn//bvozVeoQuvxRMiKvMqHA9rMxDvMRCVCK3SGMvk0EfWvQdYys0X3O3l4d34oJzguw/lV0/Lo2s9DnCzlrU+xo4a3D41lmhsXdAqM9Y176oT9keHUQiA9l496KPtL1mJX9A9Fir+UdGDxjv2XFgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eQQSG1wt; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eQQSG1wt"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a17baef589so25311585e9.0
        for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 00:12:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792134752; x=1792739552; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0i4EWzFPDrCBGPxvUTW0hZsml2U+08zpz7E33Xi4YAg=;
        b=eQQSG1wtUIXTCkjwMHlwAdziWliClkLoVDpHtsONEI+DjWnTHMe/dkaY/s84fxvjI+
         /d7CC2ELrS0UXa+3eiVDzk3fdhwUHXwUSsO2YOki3VP1n0d8SCyNf52eBbFugGenoNi5
         QpyCbfYr4EPlvjZsJvuU4fqDok2sTXikfjtJPY2VKTzNsEkRY/8rOxyWmcTWSperF/xF
         ZZpOQ4heUZITNUq2y6Q3VAim4v0agzt8JdFv315UhobDoEQBDoZ7q9Yg+WH6dAT9USu3
         EnAXp5/S9Rz7rwpW2/FsGP+rr1tHq09cYf9QOUc4y/0xfjoj7zAxHqeAIPoamqUZ4YYh
         1cCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792134752; x=1792739552;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=0i4EWzFPDrCBGPxvUTW0hZsml2U+08zpz7E33Xi4YAg=;
        b=cNCzoR1xOsqZU20kyP3XTmMX9sE+2bjCmnTbU2POBGFALQWozltM5l4bGaHw0l/6kV
         90bJmPKB1Fa+HExqE4qRBGWSdvfhC3rWqJaxFndgJnXm1CrZOlgx/SSp7FMDqPyXuGAn
         s1uSJDj61s2gzBT2vpvhf5JHjRSA6LjXeuY2PpysfPqw0hFwICZZOefPz9s1VcS2I0/5
         clezEPF9jTnAXvAiD03++6w+eIqOTylrzvXDmicy5QDRHCl8H3BvJIE5D6p9uT8oqvFx
         Aq9b9Tm3891JpXIKDtCUKKC+g9ILTY/0tFsd0+mbyfqj/d3dGMUQ1GgfK6BwsLChs2QJ
         K6uA==
X-Forwarded-Encrypted: i=1; AKwUvBwz0qtoPdzRA44W8oKV5Hi4il3wFhiXNiaT5A1ydwRfdINH4GgZ23DaifBaF10lbzeA8sRQ5vhYLSDA@vger.kernel.org
X-Gm-Message-State: AFq9FYLpLPEa49dnabVKUDpoC0ciicChCE7jQnE2/ZnyG2nQEhNuPzkp
	fvODgZtiS5Zqh3+7qVbcaQ01SD04xuDzPVLIq+9lir5Tx+qXEMdHoBkb
X-Gm-Gg: AYBFou2kf5iS/4RJApcPbKn34AkWM4/OJxp0htT4fsCWhbul8L9uhDSfkmA25xteXkU
	GupFW3Wkd56kx6gxkIjXM4etiFnRBk2Bl2I9pZ8MxIAmyKJ72z3nY7t3OSeLz1YcnfK3Uq8osyE
	VFZifFdgp7IIo0jw6F7P8Q3nSmrexL+Km8lA+ySIuCML/GNPhVNvRya5jQt9+dalczezYUClU2D
	8UHuWr5iuPNg6xI8cGyx51/qPPcd4VdltgYuTWfBLPMubu1kTXOCMpHOGnpdnZIun4pWnE3lCvn
	h3Hc5fyi5G1LxhF0pGqBDOY+ZYp5QOzbOlFFeIjH8foMPMxeT45mMiVeRfB3Jilh3PXanVI71wV
	rcBmysuaVrvdFcsWz6Iuhs5HOpty9jN5RBzTgXJOML9qgsNc1WeTXDBQQRfhW57H+PcculevCSA
	r0L3ctcxmlX8C9N7j1WZwRdElZ6tJ5qd0EIiTPfWG702jPb1S9vMaccolR5iZQBmGAk8U/u3dPK
	3zfjLJOQL0d7UDAyrk77YDgP/8NstXyAbiQ5EoIKbOCaFJe5uvh/vNq4KlwsqgggbDi5mH+nKw4
	5xHB9O8Ff9hm5lDeW0mwswYK
X-Received: by 2002:a05:600c:4504:b0:49c:fc6e:a3da with SMTP id 5b1f17b1804b1-4a18e4a7839mr459117355e9.25.1792134752197;
        Fri, 16 Oct 2026 00:12:32 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-95-235-252-189.retail.telecomitalia.it. [95.235.252.189])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4a1c8a1b377sm61802015e9.0.2026.10.16.00.12.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 00:12:30 -0700 (PDT)
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
Subject: [PATCH v4 0/2] phy: airoha: add support for AN7583 PCIe PHY driver
Date: Fri, 16 Oct 2026 09:12:22 +0200
Message-ID: <20261016071225.2092-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This small series introduce support for Airoha AN7583 Gen3 PCIe PHY.

It's not possible to reuse the EN7581 code as the register changed between
the 2 SoC and also the setup method changed (different calibration logic)

Putting the PHY in a dedicated directory is also needed for other series
current pending that will add USB PHY support.

Also a dedicated schema is added as the register names is entirely
different compared to EN7581.

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

