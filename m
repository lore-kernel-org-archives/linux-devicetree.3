Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 098CA1DE4EF
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 02:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783044041; cv=none; b=QJUSGtvh+SMbBL7EGqm73K7unfwtFjJRmt52VCeCNCLwo9XMud18kNaJVNka/NFSqNYlQqoqE9w0DRIfr7h3/304Z80nq32ZKfKpc9kckC4KpZkzpwTdwcFOqRoE7gsa8XiGTxTOur3uWm+Ykm1V7thEKKBZiUhfmLBsW9/HAFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783044041; c=relaxed/simple;
	bh=niEyCQbf2rXsKZ46imneBwDxi19Sy4NSRG4HtEFHO7Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=j1W6Vr53ojry09Vq1s0ZpN2b8y3NpTWJKyCQLmgkgXynHjgpJdncvW8NL92xVnbvGE8hrQudE4bCLWMoSugQmUlci4dJfjOfRzSZO8eeMkdDIpl7mJFqdeXn5DCs8FzJTVvBSHL8yctEHSeL0d02XUdTlIVQ6usd9UX+B+UcfnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bcPaKNIo; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bcPaKNIo"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-c88973b6965so964452a12.1
        for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 19:00:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783044039; x=1783648839; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ngIdo3QRj8SJ2wejaOldu+l1ZMsTWJa1beGhYYg+kyE=;
        b=bcPaKNIoYDw4rR1/9e4huDN4DEafcUDslfAMzOTWjY9a+OY6nFhBxX/6FFl+Z5GqXp
         3i9pMbGuSsohvcJyt+ngoYORs0j6R62d+gAHcnfFo25B/5SyTplaF+T2dJpO6Jydzj0e
         M/NaZIMPagaIwpSEUWDfHshB5gqdOaGpld/PzW7/vpcNuxgTFBGdQJlmdNAcNE33QHBy
         ma6HmbWg8H30sc+jRE13OqmhVkDZe89W0Y2wyXkSiX+sTpONoXqHcBvVvfJna8hBiB6U
         D3a/2WWxu/FdVQCNZoGUMYBrH2nCQA4uH1cWMjzZMs7Egq4c3O5fZ5IdK5Rd3te365QI
         zxAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783044039; x=1783648839;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ngIdo3QRj8SJ2wejaOldu+l1ZMsTWJa1beGhYYg+kyE=;
        b=AhvEz03ZQ9a5XWx2eZeV7drpvnXq7aFooyo0QLB8B5T/gRzzVLxhrYyuIEnFOD1Iog
         1kf+BPxy5LpgnQ0XgUpzmyLzyVme4R25bdK016KG0pcYskPUj4Q960bOuIVIWQcvDpTX
         uj3Re9Qjrw54iUWfbAsmPzKxafs0Trkr8RxpaGce8V02WaS8MvWON1dvw197AIA6bbs8
         BblUzzTb4SaZ92F9dddg3vydbensy7HG2RQlsciSR6T11jf3dL7C8gFMGeisMLAZlWA7
         yLjeiWOdACYKsOGJ9RIUhJwV5J73iOkx+DZdJBKbXpT21WCLQnHchg6sLVOn8EDHawoN
         grnQ==
X-Forwarded-Encrypted: i=1; AFNElJ8CuL/BAycvTBdADAC/Sl+q2fMbyA6z0S0+qeVD1lvXqvx3LA9JoXvkUxF76uJ9JBIpG0nuPN4HptQl@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+tPDjNp59TjRxI1qrAeAWeM80aaeLM3ob1y/LnNt37q0/Gi7z
	lU8yNn5UL+jSEu+5PHqeplUw24xgnRi5zfXO9sL3AY8B9jxm9exmOdNi
X-Gm-Gg: AfdE7ck3ZE/wqViiHxBqb3u3habrSvWR+xLe0w02ydsd4t4BXhFaH1QoUW6cjlb9zs2
	gv3cgYhKQLMxzjpk9U0S/kLJL/shhDh6XW2fiiD6fiMD5zKTM1OjQX3/gmkgNytN+vTiDgPpsSg
	AjUejwcKL95P1rdAyrj554DfH/ZDAwajx4x2b/ZJWejLPUOG3a0E+DFFwY8lXXUwCaHqH46ObT2
	vZkN/lzHKR9C5cqZN3+kuLZ0SbRvMfvpkfP/CFH5CHm2ju0Rhe5M+ed9IWxARnEfYS8N7fp3ZA8
	2VEbCj4M6fTPTB+KIV+YD5mJF8dUv6Fp8MZbEaGvzHtfqTtXaA4wvoGf6tN0BflBl3Bd7hI/IiO
	ees7Wu2dGg/x41i236fiwXpmOijmbd3/0Hppnnk4QPXA4tcPiu1I99BDYYeT81dWN7PnjqYAX3h
	L6eZUtmIOv9uw=
X-Received: by 2002:a05:6a21:7a9b:b0:3b4:731e:6fad with SMTP id adf61e73a8af0-3c01c6d75c9mr2593383637.16.1783044039066;
        Thu, 02 Jul 2026 19:00:39 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c9e8eb10638sm1905295a12.2.2026.07.02.19.00.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 19:00:38 -0700 (PDT)
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
	Neil Armstrong <neil.armstrong@linaro.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Xincheng Zhang <zhangxincheng@ultrarisc.com>,
	Alex Elder <elder@riscstar.com>,
	Randolph Lin <randolph@andestech.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Vidya Sagar <vidyas@nvidia.com>,
	Gustavo Pimentel <gustavo.pimentel@synopsys.com>
Cc: linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v3 0/6] riscv: spacemit: Add PCIe RC controller support for K3
Date: Fri,  3 Jul 2026 09:59:56 +0800
Message-ID: <20260703020003.485436-1-inochiama@gmail.com>
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
 .../bindings/pci/spacemit,k1-pcie-host.yaml   |  46 +++-
 drivers/pci/controller/dwc/Kconfig            |   4 +-
 drivers/pci/controller/dwc/pcie-spacemit-k1.c | 237 ++++++++++++++++--
 4 files changed, 267 insertions(+), 27 deletions(-)

--
2.55.0

