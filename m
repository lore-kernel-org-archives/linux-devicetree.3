Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795580134;
	b=enlSqS61o+SUJm/jUe6nfWeKoidNlzampxTEsivfbSaTgAKtIPv/hPirtIlEsXmeB4wC
	 q0ZQoxjHmRkOvwJeq5wmSjNEsTvYFPT7RMo/np1W/AfNUsQP0Sp4VC8v9TeJd/soFqmdY
	 elGPz7pldohwD4huhCbqFmzDUMNTSp7S9WIyZEcxVTZ2ic8duXQ9tXZCTeJ/YfNtHbOyO
	 6YgBQpP+s5OI9mKyZzw9OFkrG5TK0U5faR/Spg9G9BzWWY3huYXuRwdL/FWjQk2FumoB9
	 a9/fqZ+owClez4DU9ZB8Q1H87VrP59dxqYShuds818xUtspEZI924MC4962lO6zRAlA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795580134;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=+dZ7m1mSWDeoCgTYM1P+lZfpnqZnFCwEoDUl13Sf3Bs=;
	b=yIhR47Cc0vfhHol8AfCGlXj5BDt1n6D1j+cxJMxNf7fYGLy8mYM8ogfrhn1WGDh9IF8k
	 JXDdGX6aPch98hnHxDbysOvl6dBV4cQswFwp/lOCsrGXRr59w8t7FPI/ipZnU+CppSlO1
	 GC58a4xHVxkKK8MIrw7tAuY56e63/U/Xq2YHoyTu8vC5qjrDbswWa692CmItrk4ub0EKZ
	 DbFZi4nb9PPkQ05aYFczHGgFEuTlmIh0E+3AiOc79w+7yruU4W8CjOpfamqoMUslsa2C3
	 ljHdyfP25tIy68j3Lnnhh2mSwnvGFZpDWGfy6f9lO9txEEldmMSBURsQnUASBMDAiCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=idcRT9xa;
	arc=none smtp.remote-ip=209.85.216.49
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADDFB606A326
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 04:15:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ADDFB606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=idcRT9xa
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3b4cd193b50so968737a91.1
        for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 20:15:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795580133; x=1796184933; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+dZ7m1mSWDeoCgTYM1P+lZfpnqZnFCwEoDUl13Sf3Bs=;
        b=idcRT9xaKtp4jkQ/jnT4A+uApNVZBkFwPhQRcn3ozvkAkW9S0lAWBwlPQONb+s4+G6
         RhQgamrOBr5BuMvjnFG37F849ZSLwxdcA4LI3Kqur3EuTN7qyUW6L7oCM4n/QRfY9tGN
         JpN2MS0ungOpXrbkEOvS6cfurVcTVl6aE23xBe0zN5lBt/8mKi/32k9MVlFApYucxa2o
         3EYhY3Ny7iGNGg9lmvQn6jtjPfbOH3ebXwUya12h2m4H5+3iO10Vr/PoAJgJTa+U/let
         7RO8oRQNSGWIWif5sIQ+Vqr7tvyDHCtMBfMnzfl2APG3dgRmvrGz0VYXexkMcKnKw72i
         jyKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795580133; x=1796184933;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+dZ7m1mSWDeoCgTYM1P+lZfpnqZnFCwEoDUl13Sf3Bs=;
        b=Yb+UIPej6igMZi8J9FYUecrBGgZERWFClQviKFBXoLrvwEobBlL8ASuWGF3bKeFzYR
         8l2SzZ3FWB4PVyq0mXtUH/u9s9DcQdkxf9ejtHG9jbdAl/tlE7xOCUBHrPeUTgNz0k7T
         A9ueyuiywrHxaYPuz0+cmJF4QvO1lt2XhRbzPzVMbLNM53wCM2ilWtp89rYxEUyAivYf
         Sd/hG8nxkVRpZqyYKgLonaFHNgxYffTFPYUkLVcR9kiFBhl3M33o4Ij5BAahzDSDUS1k
         ZxUR1WZHgeSKxASNdc8LIAzKCl5Z3nHfuY43FkelsWqklLbTabgVl8Xsoa3OoRndL0I3
         /Avw==
X-Forwarded-Encrypted: i=1; AL+hErEQ8z7s8ZqftK2Gv2Wl78KA2sL+sCt7XfcVlzo22vX4nMpHYiF/D8OeRUhI48xewcW56FKwFB21qnug@vger.kernel.org
X-Gm-Message-State: APuU4Z+XpoiuUU7zTSw8lPBUx5f5F0DpymtUNmRr9UL7YE9fN8l0hzS0
	dw+PSRJU0nqW0H4HI/ZaLPBoBJJMLK24A/gwM66t4Oz2NsxLaksgW45e
X-Gm-Gg: AZFdTZd/ZnCOmVysql2lJF7nl1jQqUPNfTjJ4n2mwBn12Z6xoNsJK3UqoFpsM99Tej0
	wCoMoWHK7UwdZVvYUvOn2Di6qf7Bu2T7jtqlkZ7ORYk9BaYznI2vUKGH6Y3EVshXbY8Rj47p2ie
	ESlWtjYIw3KP9RZ2f1WODvorEW8VfcMsLBd3Z/AfNbOegAYfGXE/ndKxMdRQdOgHVshW2MS+hSA
	mNKIrUxw0GGCYgPYjclxGlIveyPtnBiHmyAFuAi7oFVOzROiOJRRoZpH9/KmtfvkAA3b25halpy
	HwCEBVyq1HHGadVBTgA/C5M6Vd4h+c+H6v/njx7/5xI+rXqwlXlR2FsTH25sOLM3SFQlTanlSq5
	ou01mzWhNN9XQbmxXb9imkV0LuVd7o45MUk4WJeerVGr/mMZ1IoJRCBQx8MUFrSnhKecrhBfl3e
	Pyzv95aCGqc//+cK6UtnNzn23Q0bhpUgTypNaI3bk33dodL/dMcPsu2DHCjqBUJIdwC/gI5q/Il
	8mSbgsMJSu5jEqqZXrVIib/fqLQFGhNSaMBr5qyho7Qxs2QpZlBow59a8WmLe9uJAo6UUd+BqVR
	LBjReDj8rKNiuldRv9sZ9w5LP1A=
X-Received: by 2002:a17:90b:4983:b0:3b4:1357:d529 with SMTP id 98e67ed59e1d1-3b41c97c444mr16500146a91.51.1795580132845;
        Tue, 24 Nov 2026 20:15:32 -0800 (PST)
Received: from localhost ([2001:19f0:8000:4ce8:5400:7ff:fe0e:e6b2])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad92c07sm25848152a91.13.2026.11.24.20.15.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 20:15:32 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Jingoo Han <jingoohan1@gmail.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@kernel.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Frank Li <Frank.Li@nxp.com>,
	Sherry Sun <sherry.sun@nxp.com>,
	Niklas Cassel <cassel@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	LECOINTRE Philippe <philippe.lecointre@thalesgroup.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Xincheng Zhang <zhangxincheng@ultrarisc.com>,
	Randolph Lin <randolph@andestech.com>,
	Senchuan Zhang <zhangsenchuan@eswincomputing.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Inochi Amaoto <inochiama@gmail.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
	Pengpeng Hou <pengpeng@iscas.ac.cn>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
	Alex Elder <elder@riscstar.com>
Cc: linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v8 0/6] riscv: spacemit: Add PCIe RC controller support for K3
Date: Wed, 25 Nov 2026 12:15:14 +0800
Message-ID: <20261125041523.242588-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.56.1
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The PCIe controller on Spacemit K3 is almost a standard Synopsys
Designware PCIe IP with extra control and external MSI controller
(IMSIC).

Add binding and driver support for PCIe RC controller support on K3.

Since v5, multiple vendor fix are included in this series, you can find
in [1]. And this version required [2] for phy bulk data support.

[1] https://github.com/spacemit-com/linux-6.18/commits/k3-br-v1.0.y/drivers/pci/controller/dwc/pcie-spacemit-k1.c
[2] https://lore.kernel.org/linux-phy/20260923023304.78428-1-inochiama@gmail.com/

Changed from v7:
- https://lore.kernel.org/linux-pci/20260929083755.458238-1-inochiama@gmail.com/
1. rebased to v7.4-rc1
2. Apply Andy, Rob, Aurelien's tags to related patches.
patch 1:
1. The const declaration is reserved, as the it hold the pointer of the
   static const data.
patch 6:
1. Add comment to the PCIe topology description to the commit message.
2. Fix some 80 chars line problem.

Changed from v6:
- https://lore.kernel.org/linux-pci/20260923015016.64069-1-inochiama@gmail.com/
patch 6:
1. Keep PERST# when init failed like the deinit.

Changed from v5:
- https://lore.kernel.org/linux-pci/20260907112606.465778-1-inochiama@gmail.com/
patch 1:
1. Return ENODATA for no device data found.
patch 2:
1. Add power_on/power_off suggested in [2].
2. Add zero phy check in the driver.
patch 5:
1. Add K3 device description.
patch 6:
1. Update comments.

Changed from v4:
- https://lore.kernel.org/linux-pci/20260709040027.958400-1-inochiama@gmail.com/
patch 1:
1. fix comments
patch 2:
1. Use phy bulk data to simplify the code
patch 3:
1. Rebased to latest master
patch 6:
1. Apply several fix from the vendor code
2. Use separated init/deinit function for K3.
3. Add some error handle for K3 init function

Changed from v3:
- https://lore.kernel.org/linux-pci/20260703020003.485436-1-inochiama@gmail.com/
patch 5:
1. Add missing interrupt/interrupt-names check for K1

Changed from v2:
- https://lore.kernel.org/linux-pci/20260517014841.254085-1-inochiama@gmail.com/
patch 2:
1. Use unify PCIe phy get/enable/exit function for both K1 and K3.
patch 3:
1. New patch for updating device id for both K1/K3
patch 5:
1. Reuse binding for spacemit,k1-pcie-host
patch 6:
1. Multiple cleanup for the logic already generalized in the previous
   patches.
2. Use generic description for the Kconfig entry.

Changed from v1:
patch 1:
1. Remove post_init callback.
patch 2:
1. Fix devm_kmalloc_array arguments order and error check.
patch 3:
1. Apply Rob's tag.
2. Change check from oneOf to anyOf.
3. Fix spelling mistakes in commit message.
patch 4:
1. Add comment about PHY handle.
2. Remove interrupt "app".
3. Fix spelling mistakes in commit message.
patch 5:
1. Remove all logic related to link up interrupt.
2. Clean up all unused macros.
3. Fix devm_kmalloc_array arguments order and error check.
4. Remove unnecessary start_link logic.
5. Make all magic number as a macro.
6. Fix spelling mistakes in code and commit message.

Inochi Amaoto (6):
  PCI: spacemit-k1: Add device data support
  PCI: spacemit-k1: Add multiple PHY handles support
  PCI: spacemit-k1: Add device id update helper
  dt-bindings: PCI: snps,dw-pcie: Add msi-parent for MSI handle check
  dt-bindings: PCI: spacemit: Introduce Spacemit K3 PCIe host controller
  PCI: spacemit-k1: Add Spacemit K3 PCIe host controller support

 .../devicetree/bindings/pci/snps,dw-pcie.yaml |   7 +-
 .../bindings/pci/spacemit,k1-pcie-host.yaml   |  55 +++-
 drivers/pci/controller/dwc/Kconfig            |   4 +-
 drivers/pci/controller/dwc/pcie-spacemit-k1.c | 235 ++++++++++++++++--
 4 files changed, 268 insertions(+), 33 deletions(-)

--
2.56.1

