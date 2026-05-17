Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCF5D1FECCD
	for <devicetree@vger.kernel.org>; Sun, 17 May 2026 01:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778982557; cv=none; b=bDZu/4086k0k3pQlTaZJZ+7on7QSG+JNRrbQBXn7Ho6DWXDN6S/LBlH7xhChKio4VRKMhJ/IhG/ZYSfTXG/sNxSAZPbG5+CPTdI5eBWlEKWlTZEoRMG/VKvItY0M6Gp6ELlW+lEAplNHd7gUVGu9GEgCFwlNW6OKJiatcYtmNV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778982557; c=relaxed/simple;
	bh=VFz+7WbS8QqpbMzmZlj/7iUhU7PPWjD/yohdUY5kCG8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rO4jorgFmjDw756oUqMTJkJHJal7XD2X1MgLFSMIuBXU/ocl8JDQlwI+hZAgbtejfChau25o6RaZWn40BpXQDewTZqW0I5A1ItnpXwFQkcW0D2sa0HqQnrO1EiX0ou3FW59qeA4b5tHvX127at6OMHvq8Qf6yBW5yVPuRmtn8QI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Re6WtIos; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Re6WtIos"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3664df32e91so1082523a91.3
        for <devicetree@vger.kernel.org>; Sat, 16 May 2026 18:49:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778982555; x=1779587355; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=n7RsZByyP81xsWgXZpteSqn5b3NI0aEqfKSesYIzFiI=;
        b=Re6WtIos5GS63PrpMEYWwu1qAjTP9mTx2DpmEdcLD9Sp3kiiYhwW05hIOaF+trDYbQ
         MNltKQPnGgn2hRXf58LbBr3pIJXTKndZWO9GEKu7cRFUBrSwG5fDaTdbZnPD1kQFJ8RD
         mw1qKjsWnAwIt7dWc2JD9xWbzdZDHc653wLiVPD/nnrPluctoAxHKGcsTJKmQB6Rv/1/
         ON/ifL1bM+QNIf6x0R/x8N332QdWKGEJGfraOUfTfGA9CIAOjWPLKx6UpD52GxHxrBXC
         PDLIwQWWYUMOzYl3Km79vd84hfMneSdcOPwKRodIbxm2SUQgE/83K0kisQz4PEUN3i/I
         rVBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778982555; x=1779587355;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n7RsZByyP81xsWgXZpteSqn5b3NI0aEqfKSesYIzFiI=;
        b=I6/VovHnpae8jIALBWyIgIpa/D8SqgJXF6wDdnB9N1QgynandTOIi/O1MrUjq84488
         sslO8gq5s4NSkPECggv5PRA1UQFEPCCguW6rLBUW0wAD+vKpFz/B15gVmPpvExDYGenQ
         EuA8IDteWtFnpKlMYxc3zqbulT4UMsmQ8j1f5iwDpLzMmN1LiGArbBdBtyJM8CL9uFxz
         0Qgnq09cp9Tth3yKNl3EgFIp3Hh9936FXnBLJ3jibSi/2MIiYdGmZ1184d+0Db7hLVTn
         Xb4VpEizCQmawHnFZKYpYNsXGp+QdM/o24ejf8WFO9VUx24ZPQR5oQ60UErW+sfT0Qea
         bmzA==
X-Forwarded-Encrypted: i=1; AFNElJ9AhRAlN8WsmxLJJiZXuSUcz0g6iur5tpbvm0BlejO8vky7HHJc3uNbp2HKS7X1ApW8m+RR3GnAvDky@vger.kernel.org
X-Gm-Message-State: AOJu0YzT6otfjhEzdrvDWsw2Lc4fXlSQoIVH6N5pnB7FSerd5eCoTFtz
	JXzqcHWn0UYgPor9aUdE0noe9FD3oLa5Ay6pv3iwHdVVDUzEDMLjYo61
X-Gm-Gg: Acq92OGxtCJHn2xghl5Rkyt/9qxh8wnwlKqgsJt7v33QfCjxZM2ujSFTIlGIIkWTiF2
	vSkoaXU2n5mrYGMJNMX4bxZWmVwYYPr4nCmOLIzy9UtXb11ZEMxBo04l+JulYzYWkEAw+MIIYsy
	DNKw6RoVTL21iPcl7CROEtGCYbht5ekCEiB6MqV6Q0RdiAKwS7xtmgxRtu9vwdNvJqFcETz1AZR
	nntptJckQJkB9v6aVNYhxL+J31u44DMM+7xlubwMRzl7vfubU+DzVPitRGerfYq+n+7GBqdrBI1
	9UQJJBgEuHmdpLBviiv8i5o8IXEPzlK2mKHZOlnATa7Hh96KB4vHlWOBWeVEsqLN+r6WYHtuNa3
	gDc/EQVuXnfCx5Pn34VeiHXM78jQ2thESfbBC9hauYTZHsNHqG4lj5As4Mgi7bnxjOThmAgDpWl
	kUx/8281GfaE7B1TZTTEa8M5nEheD8kTMR3A==
X-Received: by 2002:a17:90a:f10:b0:369:7b04:49d1 with SMTP id 98e67ed59e1d1-3697b044e5dmr2192326a91.1.1778982555040;
        Sat, 16 May 2026 18:49:15 -0700 (PDT)
Received: from localhost ([2001:19f0:8001:1b2d:5400:5ff:fefa:a95d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3695155b2c4sm6861899a91.3.2026.05.16.18.49.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2026 18:49:14 -0700 (PDT)
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
	Inochi Amaoto <inochiama@gmail.com>,
	Christian Bruel <christian.bruel@foss.st.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Senchuan Zhang <zhangsenchuan@eswincomputing.com>,
	Alex Elder <elder@riscstar.com>,
	Nam Cao <namcao@linutronix.de>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Randolph Lin <randolph@andestech.com>,
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
Subject: [PATCH v2 0/5] riscv: spacemit: Add PCIe RC controller support for K3
Date: Sun, 17 May 2026 09:48:35 +0800
Message-ID: <20260517014841.254085-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.54.0
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

Inochi Amaoto (5):
  PCI: spacemit-k1: Add device data support
  PCI: spacemit-k1: Add multiple PHY handles support
  dt-bindings: PCI: snps,dw-pcie: Add msi-parent for MSI handle check
  dt-bindings: PCI: spacemit: Introduce Spacemit K3 PCIe host controller
  PCI: spacemit-k1: Add Spacemit K3 PCIe host controller support

 .../devicetree/bindings/pci/snps,dw-pcie.yaml |   7 +-
 .../bindings/pci/spacemit,k3-pcie-host.yaml   | 135 +++++++++++
 drivers/pci/controller/dwc/Kconfig            |   4 +-
 drivers/pci/controller/dwc/pcie-spacemit-k1.c | 210 +++++++++++++++++-
 4 files changed, 344 insertions(+), 12 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pci/spacemit,k3-pcie-host.yaml

--
2.54.0

