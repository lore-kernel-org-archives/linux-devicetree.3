Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EEC4370AF8
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 16:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786035226; cv=none; b=qBys/Ll204+Teupj/yMSsL0U1ZlQui9K0f51d/n0GEYLZzyD8zACSkNufdZLNVJoxTYKw4MfpDOGfnNFRpSpI/wqIJRzQCcnD1eAjUZ3G5HHbG1FfyXPYKZTOBmYpYsLEWLieKo1KaSUvWuTFkon8oBRoxVmIAn3a4f+65H3IZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786035226; c=relaxed/simple;
	bh=dyMvht9Z8v4C+WMRKB2cinIFY/+sDpmcaSxjOlWQiCM=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=C3kR4lBq2022ERtQi7SdIxhiVIlC0rzSFjJbzKoNzBoNMKlSjQ7IUs6DSq9+6JZrehRNCwH4m/KPzRGsq+sr/EEY2ArCnC80D1o6zVRSdkCZKlB1IHpGE6LbKWcnt2Uy3+glGlBxx5sYNQjoRNjgUKbLKHJkVTg+N9XQejzaIxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jfzMVnqx; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jfzMVnqx"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-47f904e80eeso2036134f8f.1
        for <devicetree@vger.kernel.org>; Thu, 06 Aug 2026 09:53:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786035224; x=1786640024; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+KE+qyKBRfV7lzyByYvfu7OS66sfgFGM8oKCG0fWclA=;
        b=jfzMVnqxHc0G1HbwnyZ0xLynPvz/XyU6BonKP1L8PbPnTerfeHaTz5OhSMXRCR6R1J
         yUzVlHU5374Ls4JsKexdV8CWLgTjHb8h/fUBdH92eigj6Xd296k8BXcKnLsd/gHUlG+7
         bCVsNpXHCzIZG1Ep/k/eZI4IN590ERzRwHs3LxrSzyFgZOp87xvs4IH+W4pXmg1bOJr/
         Kl+kEtxykaTIVjyLjzFtP7vrg8qLjukVxkziLMaX1M5YY9KDtNzbZl8D1OkgeAXcT3Lc
         Vuq8U6y8O9dIP7qIBAQmp2yeB6iayPjT9rMxmI+Lj3LK/Wjbtt9/VEfyyHek22zWPctz
         5v+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786035224; x=1786640024;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=+KE+qyKBRfV7lzyByYvfu7OS66sfgFGM8oKCG0fWclA=;
        b=lMG65ZszZvFmZKGbc8ZPpxTXhMYpqrfkgSd/KmTalwGqpyNvgmwhaTJhdh4ORlbi1D
         KRYUkcZj9RUO3I96wujNQh45iuSMlM6lnftcQjO71lTXDSubPQCWtZ1gEgntdGXMH4u/
         CqlLIFEK+4T+gyvnofmMSexT6PFgklERQl39+W3IDLvEMxUwx3hgp+AakdxbZC+K1ZqO
         eivgZcfnLquPPsw7CVPetQHjSX0XzWRWS7ISmY0Un0zuBsh9xGvpWuMTn+9MsElEaOQO
         ycn6hsl1NzUg++oN/u/UDrKTAOgMSo6DqXxae4YM3QVYNXtg0qUa+xAskUKrFc+lCTUu
         6DrQ==
X-Forwarded-Encrypted: i=1; AHgh+Roe0m2u4D48PydzPAGx4jE4TwVBwhQFrQSaLgQANcprt5b6WNXGUeyADkbbwtqwnalUuQX6P/G1upNI@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2plByWW4rD6pxYKcDwUdA+71tJHrf6IaElGwhEa8WmaXaAdWU
	UOJl3tGZgoi0qfhZ8LSQcMcQG5/OeaYH6hxWFAKpESbjFDvKW6QUpeL7
X-Gm-Gg: AR+sD12lS9oxf391BHccSkutW/KsDpewr3vxGFGVUwWFqXnNFup3N4EyZPsJlEdCQQy
	LYPT9ubLIXSy9yztQ/y6llIlj1A9R2CFLY4TgMSX7ZH+yaFMVyspGcYLxzcE4TR0cG8RIo3xPVD
	Oxu6iwUSZdGWj9M0nN7OPs170GLGVnWN2K0TmFCj/+lLvaxLaEkW3ARZhQuSJcUIVLDwzaXCQzm
	gt51vDwnhp+oxQdOb1JHESbt2SrKWoSooj+UZ17bXiDOcNmD+kfgEhIpTbFG89FvfFUmI49jPBv
	H1G+mpYoViHmz/wrm8V9ntQCmYuq9tPJscT1Jl91lzhhcvXq/Gro+GGssjTZ7DaKiuC0phDwfDH
	MzxzrxGiisLUxZ8xOUfpRb2FpJijhGt2v0iYsOVUWA5Jp0CPb74xcAsF1Th5j0t474v9NKOcFM5
	8kTG+qLfrtBaw4XlfalzcYmsKLKmEcHQNVcyVj8Oar4VmoL8BOwEXajmpQFopKYURTj9t0dnZ8N
	j0Ap71ZCVupeS34MeKDxMSlU7r+Mue+vBVcnQvRq46/7kgHOVGjUm+VolI63s1u
X-Received: by 2002:a05:6000:2988:20b0:47f:eb80:ff42 with SMTP id ffacd0b85a97d-47fec4e2975mr23732729f8f.4.1786035223457;
        Thu, 06 Aug 2026 09:53:43 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-79-42-255-151.retail.telecomitalia.it. [79.42.255.151])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-47ff79a7f07sm8070586f8f.8.2026.08.06.09.53.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 09:53:42 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Jianjun Wang <jianjun.wang@mediatek.com>,
	linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v5 0/2] PCI: mediatek-gen3: Add 2-lanes mode support + clock
Date: Thu,  6 Aug 2026 18:53:30 +0200
Message-ID: <20260806165334.7328-1-ansuelsmth@gmail.com>
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

Changes v5:
- Address formal comments from Bjorn
- Drop clk patch (handled in separate series)
- Add reference to clk changes
Changes v4:
- Improve DT split patch (drop unneeded property)
- Handle power_down PERSTOUT
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

Christian Marangi (2):
  dt-bindings: PCI: mediatek-gen3: Split Airoha schema and document
    2-lanes
  PCI: mediatek-gen3: Add 2-lanes mode support for Airoha AN7581

 .../bindings/pci/airoha,en7581-pcie.yaml      | 244 ++++++++++++++++++
 .../bindings/pci/mediatek-pcie-gen3.yaml      |  77 +-----
 drivers/pci/controller/pcie-mediatek-gen3.c   | 106 ++++++--
 3 files changed, 338 insertions(+), 89 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pci/airoha,en7581-pcie.yaml

-- 
2.53.0

