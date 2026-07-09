Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64E093939AF
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 04:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783569899; cv=none; b=ShS16tklAkzLCSKTCUSJgMM4klzDVvNMi7DKPAbAAe3+fGHKgG9y5sVTgIjOE1tV0NMTglAKGqcw9MxWAyGEmVJ/fojZiE0SetmarFmtIVUm69tEp+0ZUsvHPQ8OhDyHg1vP3POMK/IFohQiH+UIrQ9DmIcWi51ckgH2pnbKllI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783569899; c=relaxed/simple;
	bh=kUdfv9pXRhZ7eoJfyNGXuA12xBzld75C2LrAs7JoSgE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=O1+nFE50ydmCQPqfsJZrgBpw7nO1TzmEdXiP/0IonX9s5i14Lm66ngMu55jzC5BLEfmvk6KfrVDPPFJC/GenbP9RPDsYo+45Ci1x+fH8ZSlAUJCnIfVaqyQxZD7/C8FMzrsQB9UbWD+o9QZd9QpzqBlihPzGjZgYj0TrZfzIwi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O1K9W/D9; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O1K9W/D9"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2cc80b585bfso3810595ad.0
        for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 21:04:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783569897; x=1784174697; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=AEHsI3+JCKB2EiJ/RAuGzgvkVrODmXwkkeIiIkxzRKw=;
        b=O1K9W/D9n9x9IFw/CowTU8EqJHBCV55Gz3C2V9NK7EjXhrCEIY9BQWD/1nxIqDRnLc
         vIij3fmiS0d+D18CQvM3f9G7zqeyI3y2Khp4CaidPGtOGiARQbGg3xm/iCpMWhfmpi3/
         u93h9nRPs5H0K0AL0g4RgVxzwr6ZAZ8+Yfs7DfZhYWSCR080Zu/uGCINWychr6GCJI5z
         jNP6yzK+BeCm0vudVFofHT3LjgfP1UiNyYljVbfuZUCr3A7MmpGZ3lWDFogcQ2Vu6Fta
         sMrSoXimjjKHrMWuiaqJHsDpSDUCNnB0zdKjx7OaJwe0+F2gafJN15RuIU0Iuihmw95G
         4Jug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783569897; x=1784174697;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AEHsI3+JCKB2EiJ/RAuGzgvkVrODmXwkkeIiIkxzRKw=;
        b=f/Pzz0Dnw7e5gZuvoiUGIZDtLiuXLJa435fVuIpJKDBayhwuNPDVlKAiR4CH+VFbW6
         LlA0DMp7sGWN75GxlrnQnpL1GFljO2uXmBE88Toqz/CdESxdTfMUgaFO+zwy0RF0OYsk
         8/KamtVcA5mnpRATDzYXd2WX/hf+M2T9kelLC97DWuW8p9f/atkP24q4q0kNS5/ban5n
         wXgQzgb39p/n7FOPHQS+/7opzdbkbi4Xq0G3ZatwM6QqMhpKhq2cLeByHQA0A9++spS4
         FehhHbfzIa6X9+28UhdK1eFTodCIutoN+suciDt6yHdVo6BALmz8UbChHUbtcpiAEcuS
         RyxQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro1GXtS0BiyM2MNUF67ZIYlfzCGudgCzJFG/YM1K2dkmxrLw5zdbqkSQ5uFG1WzEtr3NLA4ngIlJhir@vger.kernel.org
X-Gm-Message-State: AOJu0Yx572pi+38YLH4BFSCq+7rOzPse96SyYA5KcNDpC5Bv00LNOuXU
	uwwUk+pV5lZxhXWrkixtm2iGPpaeBv89MFJ2OLZm6sSSDhRU9MWLTFdu
X-Gm-Gg: AfdE7cnohP5aEP0Whgz3TPWhYR/pjJ7x+f54MCofze5mz5FxS98kWu4iSNVWNHpeR/x
	cDeO0xjCtk+ppGvtksuoJy+37XFnQtXchvBpskD+dEK9vWgMN7HK6ONwZgZ4NuDR4UzdN2L5yMv
	DP9Xtu/xwFMR2GJnJBySMa9Yod5zhPrsodAqZX5zaYsTjEZo4003fzPVcUsu0dj9MTqFirkhP14
	UuQtyJND4bzhpBtukA64/KwEmc11RpkhAIGsMDeiCACvPlBtgpOgZ5WAPhKfz7skJKU8VloNUHP
	tQpM1sQSS+A5IK5pvV5xc4iAN09IYYD1H2alVzRGsob2tUEI/40yChW72sZAbZ1LFxuGJjC5zR5
	Lt13iNE1iF2OdRhpywDa/Ctr6JguLMJ4JididIhL2FagGmY8rg2aMCMwn1BZxDqZN
X-Received: by 2002:a17:902:cec2:b0:2cc:9179:32e with SMTP id d9443c01a7336-2ccea37df94mr58757875ad.10.1783569896614;
        Wed, 08 Jul 2026 21:04:56 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9bdb72fsm36569815ad.6.2026.07.08.21.04.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 21:04:56 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@kernel.org>
Cc: Inochi Amaoto <inochiama@gmail.com>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH 0/2] riscv: dts: spacemit: k3: Add USB/PCIe devices
Date: Thu,  9 Jul 2026 12:04:12 +0800
Message-ID: <20260709040415.977784-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

DTS for series:
https://lore.kernel.org/linux-pci/20260709040027.958400-1-inochiama@gmail.com
https://lore.kernel.org/linux-phy/20260703021024.495433-1-inochiama@gmail.com

Inochi Amaoto (2):
  riscv: dts: spacemit: k3: add USB controller and USB phy support
  riscv: dts: spacemit: k3: Add PCIe device node

 arch/riscv/boot/dts/spacemit/k3-pico-itx.dts |  51 ++++
 arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi |  33 +++
 arch/riscv/boot/dts/spacemit/k3.dtsi         | 237 +++++++++++++++++++
 3 files changed, 321 insertions(+)

--
2.55.0

