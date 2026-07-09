Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B073439354
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 04:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783569683; cv=none; b=lfbNYRYwtNDYwRo8eBwwcmQmdu0ydiEKBD2EjN+GdWSuRKRNtKgGsT3v7pr2gMB47/UsA9w6nxpOqY7hVxL19rymhMNt+7C7TTOIt/LEHugeUPrF1lKDM+am9Id92m47QOop+KTkMsFUler9BfFMCDPPJh/vvGMckzb+gOyGCvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783569683; c=relaxed/simple;
	bh=iDi6eMAdavvHdiNKGxpAXcZmLMfTTt/P5T++UkYTMYY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZfLMxIAjlNcQ/Z/xoCvy5qbdW9In4DpBjuq+cVBijXILbnaQNMMUpHW2YyQSZDWb75kmgkQ9W6FqhcmqthaeqbLi00exzlhwTRGmD0vsYKe/uDZnj8z/Tq2bFLVUogSFk4KwoUqMcBAmwJJ7QrdcHqpk3jYQN970d69kt0fNtw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bmmu5PqP; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bmmu5PqP"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-8484f229529so830469b3a.2
        for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 21:01:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783569680; x=1784174480; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cvLv9XK6KjcJ7sFC5wHJkjs3i5/edN/xpBE+mpYwY4k=;
        b=Bmmu5PqPGy+9+hXb1Tg98lrpbdanz5f4KXZ1kD12dVkZVIila+ycBakFv2BpWx96io
         CPx4JanrspbAR6UhdYSs9qBWvEuwCIt+bwUg++wbJOcoVAuOArEjgdoIB5T4QTTVNVHz
         V75dLwhcBuOBPv87tJ6tvY44tZfvYeZ9utrbuOVwlHI6nyk3YFNIxHbkbjDLVpxxFre3
         UwPKtXd1tEPrVkmooKfi1/FV94/0/tXGl8Odam2wuB2UQKvvcH0i4o7GCHUcc4X0t8Ln
         cfUy6gfnY5IymYJdvIrwJLWtA3eYyGMIxbtG1Dr4fdbySAPd8UPK0sOLoQvfE3OZlAVz
         w/vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783569680; x=1784174480;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cvLv9XK6KjcJ7sFC5wHJkjs3i5/edN/xpBE+mpYwY4k=;
        b=AjQiYWinLISjCHMnGj7q+t51Tj8dmF3tDO5GcYku0UmdDtb2HYg89mYTqtyNirnnX8
         5JbLZOi2JCQfAS/TJF68EDKdz4TmN01znJB42BA4eHliFcukWm3IfA06iJ8V/7EAQkf+
         MLlNFqLpEXvGhU8ZLHdRTva+lnuCVAtM4LKAe73NOswG8mNl/HBV7Z0sNDsHI4dHml+y
         WDIVLXOR94bwgIkkmP9GvNgeL0hw27G2OvhY/bQoHw887IQROHZyPaWW/AChejKGQiDM
         RrP1C0Z7bsF9XkvEmhB7HQhJ/eUTq9f6Fc0aNlCLjAgSFkCLqsS7bBHLXtUFhQ18JmbS
         vhLw==
X-Forwarded-Encrypted: i=1; AHgh+RrzaykPH0XVwVRw8moelBzTNyhdOR3Q32a/4jSVUrl3+BQVUOo2lBPj/ceFRKo45eogn+oaLesPOQGr@vger.kernel.org
X-Gm-Message-State: AOJu0YxsUmvLPvN2st9LYIuKzxhuoQYr63EVwHQg+VedLASl1bgPUtFT
	29Cia01VeGx7/zpSICU4HSiFESWa+t0qeLed6iyQdY88t/+FW3PfTcrb
X-Gm-Gg: AfdE7ckq+5PW69HHKYHXVMjs2VQJAZR1gVdz8evXIsE7r4fPNgbxhaJdoyAbSlLS8sj
	YYzasTDPGTW4h8+QPpJQY0QufHwDy0wCguuR9IiTVtvOK2Sua+vbqUH6aIBTVBhWSOHA0n3Pn+Z
	ACZeYbVaxLNRUUysJ/+zPfj+I9VD0j3vN/1XTVxCheLNZ+Eq/mTJfUeeMebSF/LX1w5mfChM8ug
	1NxHfx6y2y/j5vzKmeDfgAqq4mRSRLi3G8BgsUgEg1meFl5HIBd0N5YivqVUthLkw5pcEi0job/
	2uTTNxpcS+ZYIV60RbMx2e+4j8uML4Rfiwh6gCkK3ItkzDuFFMUTAEqH50DNxbuAzczciWfsDE4
	lC5ZOF2M4HTlSPCfPb1RxL42mtOpognF2l6bP1mA5hnNgSAGqzCuVuLrWnVfHtayo
X-Received: by 2002:a05:6a00:4405:b0:848:2f74:d8d9 with SMTP id d2e1a72fcca58-84843004857mr5364669b3a.74.1783569680457;
        Wed, 08 Jul 2026 21:01:20 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6b9a832sm7919258b3a.18.2026.07.08.21.01.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 21:01:19 -0700 (PDT)
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
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Christian Bruel <christian.bruel@foss.st.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Nam Cao <namcao@linutronix.de>,
	Qiang Yu <qiang.yu@oss.qualcomm.com>,
	Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
	Xincheng Zhang <zhangxincheng@ultrarisc.com>,
	Alex Elder <elder@riscstar.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Vidya Sagar <vidyas@nvidia.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Gustavo Pimentel <gustavo.pimentel@synopsys.com>
Cc: linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v4 0/6] riscv: spacemit: Add PCIe RC controller support for K3
Date: Thu,  9 Jul 2026 12:00:20 +0800
Message-ID: <20260709040027.958400-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The PCIe controller on Spacemit K3 is almost a standard Synopsys
Designware PCIe IP with extra control and external MSI controller
(IMSIC).

Add binding and driver support for PCIe RC controller support on K3.

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
 .../bindings/pci/spacemit,k1-pcie-host.yaml   |  50 +++-
 drivers/pci/controller/dwc/Kconfig            |   4 +-
 drivers/pci/controller/dwc/pcie-spacemit-k1.c | 237 ++++++++++++++++--
 4 files changed, 271 insertions(+), 27 deletions(-)

--
2.55.0

