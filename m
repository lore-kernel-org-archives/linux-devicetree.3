Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D69B483BC4
	for <devicetree@vger.kernel.org>; Sat, 10 Oct 2026 11:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791633355; cv=none; b=BdBok9Pd7xJaNmPuYv8HhKfTRZbta5JfgoNnJNi/JCc6qgV3JX323h34PcbEv8zlYbjmoDV8dX4pRbhiLAl+nptt89W1xCbbvvXXwsvUU6uTK5E66SsYMFLBvAUJHtTidBETbv+4zhRoJOeif2IY8oA2xdH+SgA9JFkjOSOhXPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791633355; c=relaxed/simple;
	bh=rvRwgHQvg5JZ1LUtLcvpMJdT9FYkYz/WGufe4EYyt6s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=B6wHp7edvuh16DUHkWwNAPQ7kfv1WVdPRX7jhxVVRcnSzs94Q3JXJqTaBtvfdZkLRh+t4WOpyFXRN/045AuQPBIAyh9pCAjLbX9Gu47mhTrmkmWBdEvJmd4D+AgG1psWzluDQyq2o7tZTn1+LLW5aHH5T600Wj2arhgBQ/eaVFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X/uLWFKb; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X/uLWFKb"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a01933b584so5366705e9.0
        for <devicetree@vger.kernel.org>; Sat, 10 Oct 2026 04:55:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791633348; x=1792238148; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MUGs28pjyaKV6mm7T8DFRVWF7FBLghSbmcUfgUOr8K0=;
        b=X/uLWFKbu+/TRM+hrDw4HzQYRKaf20P5Gr7PXI4ImcUAd09UQJ5rhaQt3DmOl1xtpr
         YW7fnABdmvlyapQJCPQsOk0TZy4qEZf349NoRhc2sAQnxuAcIjIS03s5cQWvI9yMrkUd
         GPuuaaMIkvDP4q9wxa4Lrw8PijPl9P3qnypWIZNRqno7C1QSTmzeFddgDbDbSYuQrmp+
         sSh8LCeuMlV1OGT1hjgHW/5IXFH8q2WzouXTBiYhsIwTBrOVq9T0SP9P6/DHaVI2ye/J
         UcQt45qq6RH95KxhVaDDPoPfEQ1/Rve9s4lrph4OuVJlUgrrog8tuIC99ndMLGx+oxkw
         MXDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791633348; x=1792238148;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MUGs28pjyaKV6mm7T8DFRVWF7FBLghSbmcUfgUOr8K0=;
        b=LSuuYAfhU/CQuDTIYuN6uE2wk3/hNhuyp1ys2EPsYziTOow6v5kD41sGZ4l1y9ZBKn
         rM8hhihR3hRJCtQ2oCtQdPhnIxc2w43eXZpnUXLVrg3P/0vdaqj3mlbCY2T1Hjn+z5ER
         /AuvZ0kiA8OgyqPqLjhpYPzpScq75C5Ypt3akHL/viAgbDxJ2uPOc91HjQa7yf0fTntZ
         oxk2/ElMGWvWJTzisHFncSqqdJxAU43NxMpiRE5ZoxVI2wBN0csg6dQ21SeIvKf90gYM
         RW8OGItRI+6o/nIIFcB73kluQQHMGUzfN7Qjggq/NtK7UDreazwMo77RemgsWcjjlREh
         LV2w==
X-Forwarded-Encrypted: i=1; AKwUvBwiFV7DRC+4DJYtc48lE2ojGK1PuNJ73jClNOhPOueum/WY4MBc84z1q2Rp1dDzxNUOGhe+M5pwbDUH@vger.kernel.org
X-Gm-Message-State: AFq9FYI/ijB1E7W4Cvd+tNuYf/j2Pt+mIWUY1i33twHWux8wGn9DnXSc
	hupOZY1QfvbAPZcM3POTKs5P4pEMxGD+N6ap0+j6x+buca4xlIITTHTS
X-Gm-Gg: AYBFou0djOyQhOB0jDYFhgmrENaXKOOuoIWsZoZTmpkejnIHg8u700oQlMuoySpX1X0
	TovBk2l9i6RMn/px0l/eaAGqdeGNJuuYxWZQo5NwuSjB8irt8L8UhvAlT1RaO7yl8/ZvCfghuRQ
	Gb2YPhMRUUAaJNTSGpeVsuKDQAIngwXPQZiypcsfN/Ma1fBGtU5hbk1v14YduYcgON08bJCNeye
	l6r6+dnjheJgTonumNW7k0tTnhhtsBfGYp4YH23asvJjigcVGk01BqlmdLQLLdSTe3tqTtD66Hh
	PcUkGBomY78z1DQeRJrnEICSNSljlJk9177SFeSNYQZDuZ0Ut+kIowjPxjv1ZvEUyo7BXCZIXqD
	dWOBdemiPPqcg6oPlWlq+IA7cRrwfZYVYtvZTJ8tUyfgCSOG7G/fnE9kq3y966ucjm6bvSTWy55
	2Li9wSilbXbjgQCum8/fcngOT8UNwKbdNFOcgfcErGULxG6Kji00X0Y8Kbs6bWmM2BvDhCRz5Sr
	U8tjQ==
X-Received: by 2002:a05:600c:4e01:b0:49f:ce78:3567 with SMTP id 5b1f17b1804b1-4a18e4afc3amr83354515e9.24.1791633348096;
        Sat, 10 Oct 2026 04:55:48 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9aca657sm8746340f8f.43.2026.10.10.04.55.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 04:55:47 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Fabien Parent <fparent@baylibre.com>,
	CK Hu <ck.hu@mediatek.com>,
	chunhui dai <chunhui.dai@mediatek.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 0/7] Add support for Mediatek mt8167 HDMI display output
Date: Sat, 10 Oct 2026 13:54:00 +0200
Message-ID: <20261010115539.9237-1-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The MediaTek mt8167 SoC supports HDMI output via a dedicated HDMI PHY
driven by the DPI1 display block.

Support for HDMI output was partially upstreamed in 2021, but is currently
not functional as it's missing its HDMI PHY driver. The HDMI PHY is
apparently similar to the mt2701 one, but some differences in timings and
in the initialization sequence are better expressed with a separate driver.

* Patch 1, 2 add support for the HDMI PHY.

In addition to the HDMI PHY, a few fixes are required here and there to
actually get HDMI output.

* Patch 3: Some of the HDMI registers are mapped into the apmixedsys
  syscon. Since they are manipulated inside the HDMI PHY driver, we change
  the apmixedsys memory map to non exclusive by switching it from
  devm_platform_ioremap_resource to of_iomap. This approach was copied
  from mt8173 apmixedsys syscon.

* Patch 4: Since the DPI1 interface is hardwired to the HDMI PHY, it is
  appropriate for the HDMI PHY to control the DPI1 clocks. There is no
  effect on DPI0 clocks as they're completely separate.

* Patch 5: Some MediaTek SoCs require a supervisor call to enable HDMI
  output. mt8167 is not one of those.

* Patch 6: In the common path for mt2701/mt8167, a register operation that
  is meant to enable the HDMI_PSECUR_EN bit is actually touching some
  other bits that are set by later operations anyway. The patch makes
  more explicit the intent of the operation by setting only the necessary
  bit.

* Patch 7: Adds the device tree nodes to the mt8167 dtsi. Since DPI1
  is hardwired to HDMI it is possible to bind the input port of the HDMI
  node to the output port of DPI1, but the patch that adds the DPI nodes
  to the DTSI [1] has not been picked up yet, so we leave it disconnected
  for now.

The series was tested at all supported resolutions on the Sony PlayStation
Classic Mini.

[1] https://lore.kernel.org/linux-mediatek/20260921113914.779393-5-l.scorcia@gmail.com/

Luca Leonardo Scorcia (7):
  dt-bindings: mediatek: hdmi-phy: Add compatible for mt8167
  phy: mediatek: hdmi: Add support for mt8167
  clk: mediatek: mt8167: Map apmixedsys iomem as shared
  clk: mediatek: mt8167: Correct HDMI-related clock definitions
  drm/mediatek: mtk_hdmi: Set tz_disabled for mt8167
  drm/mediatek: mtk_hdmi: Improve the secure output bit toggle
  arm64: dts: mediatek: mt8167: Add HDMI display nodes

 .../bindings/phy/mediatek,hdmi-phy.yaml       |   1 +
 arch/arm64/boot/dts/mediatek/mt8167.dtsi      |  62 +++++
 drivers/clk/mediatek/clk-mt8167-apmixedsys.c  |  26 ++-
 drivers/clk/mediatek/clk-mt8167.c             |   6 +-
 drivers/gpu/drm/mediatek/mtk_hdmi.c           |   3 +-
 drivers/gpu/drm/mediatek/mtk_hdmi_regs.h      |   1 +
 drivers/phy/mediatek/Makefile                 |   1 +
 drivers/phy/mediatek/phy-mtk-hdmi-mt8167.c    | 217 ++++++++++++++++++
 drivers/phy/mediatek/phy-mtk-hdmi.c           |   3 +
 drivers/phy/mediatek/phy-mtk-hdmi.h           |   1 +
 10 files changed, 314 insertions(+), 7 deletions(-)
 create mode 100644 drivers/phy/mediatek/phy-mtk-hdmi-mt8167.c


base-commit: a90ee4305c4a5df72c11b31dacfdc76e00fcf78a
-- 
2.43.0

