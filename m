Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 339753E8C55
	for <devicetree@vger.kernel.org>; Fri, 26 Jun 2026 09:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782465648; cv=none; b=CVjC+khHH0NzOM7qaqCLF61YDRBScAhOIGd4fyWoLjiDmWu8w8iom6v4uRhfUeLUis55RwlM3y0JdYh7OIdPO0Y3SmpjIVLJZ8q6kPnYFgdCxxKFYssgFVpFVwnJhrLOQEwEv6tztY68H+btfA7rXXHNdMHGvSbfx5xbRx2l2K4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782465648; c=relaxed/simple;
	bh=FCGrZ4ia9moub3vpndSIDoB0WJ00EU6aXtezVQRRMPc=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=cnGVG8rh/SjMfsQ/XJKIsLdguOVQowH1UC0OWUlk3ZH2+fUNdA8dOEPCYYtzDLP9gukW7fNBibFokKqVvLNthFgYdgovleb89RfXQ2Q8sDqZrKVc/0j/KhMgnuAwQuBVlIQiOumhorWSpsQ8YIVj8+I4Hq6qoTElfco+Ol0Po94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Elypdu4x; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Elypdu4x"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-4631679f204so1013008f8f.0
        for <devicetree@vger.kernel.org>; Fri, 26 Jun 2026 02:20:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782465642; x=1783070442; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Z7RIq6wHh9BtCzFgGyY7sK62eHn+d9xSU82SzTr05Co=;
        b=Elypdu4xi0M8dd2ntH3MR89nYmZoTtHRgc5LGXAlTwR07gD918mQ7nHYC9B9irBq6b
         HQEgPt+REk2YlKR6IhMmvsCS+ftOD0+ey8ikl7RH50MZHHNZSf0ClUDSmNET75vPfWI8
         /TY5s1zwrrMZmah8GsXqBP9xAnqJWWTDkPezQo7pgKr//OzkJ3E7bsIeLlcDaGrIfTiY
         PcLUhP/52jiJv27YJjQPrUhZbXc9xG3Zw40arc3acNExqrQWcCryBqa2PKhKMriS133g
         Xr9lm2sxdQbe8SWI5fS17wVEc9Bre9viIXgwkzOIbAx75KDD6Gmb03NDCaHHGtyFmBzC
         DbDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782465642; x=1783070442;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z7RIq6wHh9BtCzFgGyY7sK62eHn+d9xSU82SzTr05Co=;
        b=bbbCSlRfLfi95YOYccyxE7SGpff2euS+XS9EJKJtP9EKDcLYRArwhAG3v2FcVBOOix
         z2WlzuDPWmzY6L7sPa9WpJPhFaQNnzjeef6Erfe9Yl6o8gfi/fssRYgEMLvn5pmTEmAg
         TC66Fdbswjht3u33bAYX1ryWAgNooq0uZQor+4cxp80wP6qG2P4bb3ltudrzm3oDiSdE
         GSGVHk/zazcgiqCxJHgsBcDZPcGU7XYVlIqfNuE+hXQ3OgxQDbkm5QoEr6mQzhfM48xC
         OPpG7/NmJ+KZh+ThXf+ycBb6yPbvgBqD8+LBAYar/vaCdpoPmf0SjFG7H7EXKexaepBl
         TcUw==
X-Forwarded-Encrypted: i=1; AHgh+RpgOBr0CqRY1wF957z72xPql6e0puahCZ73GwqRcHrlJbzNN3MAFJUpEvpI6acJUqgsh/j81hI50zBp@vger.kernel.org
X-Gm-Message-State: AOJu0YxA8CYOGh+HARbHtA+DYLTVMnOu3uF50EJV5RaXvOJ4ezpqTN4v
	CJDTzZPJm66ezHfRR/IOtE3sgsa89Za97/Iesd5iRW7/XnTAhVKegkUV
X-Gm-Gg: AfdE7cm1r9ljAVZKEcUXn4hDIOzGk5ClRBbBIypy9if4FcfJK4J4vVSBHjt0DjINoqu
	SL0Kmm5BbHfurNcF3qs+/NOL5kmN1q4G6LN5ZMq778KK1rqqy1PdbwpDKgYIyWn03MRxgTNYFX9
	/NM0ttlwfvcuBFurdvdavb8JOcdB3Z8qRGiMhZLs8wca6NttBhUcldjRyhs77UClLj+QKBgbhGB
	dNH/L8Ju7z7K0CUg4QDL4knIDdzwlR96xpLfT0kCoA2mqmqQ5wICxzJRzCtMbHxIC2tojS1nuDs
	r4467mCg7Pgra9Z+6CcLni9LkCPF1Y3USG5lVWLXRDIKMg6oSHRPb+HPqa58Z8KAsw1VOvh+BsH
	8Lyzr+hQelQgmZo16C2QFoNmneJV2+ZBkmrH/aH1e5VrCuYb/AP7Hi6m1nN0IaFXhneLH5O5J45
	VM5PbOhZZyX36Oekz9IJNBhTcU568dtVOznPFPwmPpDdcq4yj312NsKkzGT6MTU9GWn9mGrLKFu
	TY276/NcRo5
X-Received: by 2002:a05:6000:18a9:b0:461:a15a:4160 with SMTP id ffacd0b85a97d-46da8c5fcb6mr10187397f8f.13.1782465642257;
        Fri, 26 Jun 2026 02:20:42 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-80-183-219-152.pool80183.interbusiness.it. [80.183.219.152])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-46e6167c05fsm9094388f8f.25.2026.06.26.02.20.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 02:20:41 -0700 (PDT)
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
Subject: [PATCH v2 0/4] PCI: mediatek-gen3: Add 2-lanes mode support + clock
Date: Fri, 26 Jun 2026 11:20:24 +0200
Message-ID: <20260626092029.3525264-1-ansuelsmth@gmail.com>
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
 drivers/pci/controller/pcie-mediatek-gen3.c   | 101 +++++--
 .../dt-bindings/reset/airoha,en7581-reset.h   |   4 +
 5 files changed, 370 insertions(+), 102 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pci/airoha,en7581-pcie.yaml

-- 
2.53.0

