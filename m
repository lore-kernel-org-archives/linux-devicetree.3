Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78D613750DC
	for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 21:57:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782424680; cv=none; b=mBKzApMemZu/7WJLk1B+u7rkDr0qs8JS/rI2FXGjVAedYcfELQZu4nufvyNO/MHWUjZJjaF3k6SnxQbUtR4Z3+Z9J2UaIQ2FnWmBVR7ab4OfgwlaFSDHtycXCnvKiq+uVI9D39DEw3H4vBovY9sRHYOoVxT515D5Tpg5pTUDy4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782424680; c=relaxed/simple;
	bh=46jnChl2wMQ+0gZn2yaYikR3dO6y8zMPR9FWL51dirc=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=mvR3wLvixwN/o0Dn+POHj6gi7cWnKVJTEGb5jwOWVHSbClmJk9Bz9m2oGZksibbb3ix2KR+BnZaa+edKBt3Tj51QbrQRkoL3Y+tiWRfIwdG1zzd55xmgJOieWSd87P2s/AWvSOapGl6cKCEA/Gx4q373zKwKnE/8Q+aAUDLXsag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hC7JLwuO; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hC7JLwuO"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-46db3c9a9e0so152986f8f.0
        for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 14:57:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782424677; x=1783029477; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=/GDPKha/I8hlDx0JY3/FoA06iUy7EbgInPO5kMOUnzM=;
        b=hC7JLwuO0WYi0WhAb7P0MGyaaRuVutebLmfOKIz+6dNJBUhYpzKFb7Oj4HhSSt3Ht/
         j1aQ5IZub3BZuK3dPFebnWHmpkUOMjG5m1NXqtw0pyYzU7VKLduWttzZ66d+EVq3vxUd
         Z6f55TaH+1pwY2YtK2whgphRaya3Q9+cpfrL5DamzlS4vfQzPbW/SCZOXub/VNFxVcnd
         XMYZyc4hftgcD6bEKLacn6r7+icwcEdDxZqOD/jJWDL3uVqxYjKVmdFwSNufDarFJWdd
         Ab/FiQlju492ejXJ0Z3+i5AQdSat9QCaIlwzbUqa6e6Wdvrpzx7BJ00kcLcdmaKrcysy
         b6Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782424677; x=1783029477;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/GDPKha/I8hlDx0JY3/FoA06iUy7EbgInPO5kMOUnzM=;
        b=lUqCBzS9O3FbCMFbXexH+w+lsoYR9tCc8eJ2KFhwPQCkJtCZrU2zhM4Nm3cXTIs+HW
         og+pt85tQJwXXB48WQB7mN5qu+JjyGht+ZDl5OPmbeZ2/fio/Me8EnMQtPOh8bMav6yf
         abzO3yU7YI/3fVA+BJd1KPIE3Nz1P8RVR4tXe+Q4SMzLYQU4RXyvkUTx9m2rYzTa/A+o
         bxKuYPfEOcNKr9ZszlRG7IUl3TP5imZdwMXPuy3MSh9R6WYFaM3JPp4WZfzAEXKgKLY7
         pEWcrGeyxXlRCEl3v0D31JPy4RyB7GrB5N89ISBJd1tcUIJj/1jqagUPrIkED2769wrn
         jRMQ==
X-Forwarded-Encrypted: i=1; AFNElJ9SGGhjewWQi8H91ruIslRWgf8sji1PU10esHs1iRf30ht4MLwr4C9VeujroPPE1O1wnwZ71AtjPDTZ@vger.kernel.org
X-Gm-Message-State: AOJu0YxYkPRQCiHCAhdCpkOplmgIxJCm6UJ4esG61V5rRF4mn1attkoE
	h6sR+EVaSwAIYMaI2TGulyFPwbq8TrMlqwTUkfsSIbYNJE0ajfiwinv6
X-Gm-Gg: AfdE7clF7GLLPkOQDGfjF/xwq04saV0hbkaHISLPRKBkwEoiZ8Tf53aDYGnx7ADlOjK
	lYoASWWce2PB1ntpbwQrtaZVtxG49pc1O1Gx2Z8G+K6Drrk/vVMTuozS8c1HpSv6Df9gcw0U2o6
	24/fJNStrKi4xxygPSxgApAjPf6MDP3ujjQd0AIVZg9Tw2h8GhB8lq3UuWKeaQpdhBiR30BRk3J
	jiFpAIm7TYMvsYbW/pS6TmW2CR+N17Tbo/4kUa9Tp6bs7Uq6PWqQlegJaU/30BM48xBKS2hZoAc
	ZlfnvD62+8NQUp3nSsdgLRQ1M8UnMMI6OjTDt8HPPEQk+VBInqwtaMFOyAG134BghO72R85T7yg
	21qLiFomXF1xpztYKz6k1QFxyvsdr1Eq90eG/nqGME3m7KTtujeIaZRQivBHjs/9rKGKQg1Mkcg
	DmdMgLINCRa5Zc262nfkAH9kwb1j5ggK2qIFXCVcTdpJbeUBYQiAP87O50QVPHYRUuJKv9DFrdo
	PPzj9RdxRKe
X-Received: by 2002:a05:600c:4353:b0:492:1eed:3e67 with SMTP id 5b1f17b1804b1-49266893383mr39799415e9.26.1782424676723;
        Thu, 25 Jun 2026 14:57:56 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-80-183-219-152.pool80183.interbusiness.it. [80.183.219.152])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-492690988e0sm27339185e9.14.2026.06.25.14.57.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 14:57:56 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
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
Subject: [PATCH 0/4] PCI: mediatek-gen3: Add 2-lanes mode support + clock
Date: Thu, 25 Jun 2026 23:57:33 +0200
Message-ID: <20260625215741.3253212-1-ansuelsmth@gmail.com>
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

Christian Marangi (4):
  dt-bindings: clock: airoha: Add additional reset for PCIe PERSTOUT
  clk: en7523: add support for dedicated PCIe PERSTOUT reset
  dt-bindings: PCI: mediatek-gen3: Split Airoha schema and document
    2-lanes
  PCI: mediatek-gen3: Add 2-lanes mode support for Airoha AN7581

 .../bindings/pci/airoha,en7581-pcie.yaml      | 251 ++++++++++++++++++
 .../bindings/pci/mediatek-pcie-gen3.yaml      |  77 +-----
 drivers/clk/clk-en7523.c                      |  27 +-
 drivers/pci/controller/pcie-mediatek-gen3.c   |  98 +++++--
 .../dt-bindings/reset/airoha,en7581-reset.h   |   4 +
 5 files changed, 358 insertions(+), 99 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pci/airoha,en7581-pcie.yaml

-- 
2.53.0

