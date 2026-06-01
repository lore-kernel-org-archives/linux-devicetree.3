Received: from Atcsqr.andestech.com (unknown [60.248.187.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 534643A1E92
	for <devicetree@vger.kernel.org>; Mon,  1 Jun 2026 09:49:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.248.187.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780307354; cv=none; b=AWAlNyUwhwFzB+LjedXOJYZbLREWmB60IywwwYeWZPWo9qQ/w2elDDqEAPfz8m8ARw51NFwVGBdY8vtjrlIdsAZq/lVqRt+on+vv24tZmB2FhhH78kqZfDh4qUvCYY57BObYfBpriZOjVSK2p6HfUkPYTQBtPULVr4PG6mnTueo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780307354; c=relaxed/simple;
	bh=rGAs5By7HiLAckjcsP7AQSq6DT8KeI08ba9MVp2EVYw=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=GgiNCI2OgSgdmg6KiKeCx+U5tEWZe8JdPqfcW9V07Z7SKKRBy29bwyB3px7DMbVQb/ZAI6//LRkaAHuNb+z2rYTEaK3nXq/fGXZ6r5N9jS4zlpj+bnx0x1V+93xmjlY/O+XO6giOtWwzTYxBjM7QqWtBTKLWt3/t5shqVmdUQLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=permerror header.from=andestech.com; spf=pass smtp.mailfrom=andestech.com; arc=none smtp.client-ip=60.248.187.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=permerror header.from=andestech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=andestech.com
Received: from mail.andestech.com (ATCPCS34.andestech.com [10.0.1.134])
	by Atcsqr.andestech.com with ESMTPS id 6519mqLp065051
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=OK);
	Mon, 1 Jun 2026 17:48:52 +0800 (+08)
	(envelope-from cl634@andestech.com)
Received: from swlinux02.andestech.com (10.0.15.183) by ATCPCS34.andestech.com
 (10.0.1.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 1 Jun
 2026 17:48:52 +0800
From: CL Wang <cl634@andestech.com>
To: <vkoul@kernel.org>, <Frank.Li@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <dmaengine@vger.kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <tim609@andestech.com>, <cl634@andestech.com>
Subject: [PATCH v4 0/3] dmaengine: atcdmac300: Add Andes ATCDMAC300 DMA driver
Date: Mon, 1 Jun 2026 17:48:43 +0800
Message-ID: <20260601094846.1097678-1-cl634@andestech.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ATCPCS33.andestech.com (10.0.1.100) To
 ATCPCS34.andestech.com (10.0.1.134)
X-DKIM-Results: atcpcs34.andestech.com; dkim=none;
X-DNSRBL: 
X-SPAM-SOURCE-CHECK: pass
X-MAIL:Atcsqr.andestech.com 6519mqLp065051

This patch series adds support for the Andes ATCDMAC300 DMA controller,
a memory-to-memory and peripheral DMA controller that provides
scatter-gather, cyclic, and slave transfer capabilities.

The ATCDMAC300 IP is embedded in AndesCore-based platforms or SoCs
such as AE350 and Qilai.

Changes in v4:
  - Use items list format with descriptions for reg property in DT binding
    as suggested by Conor Dooley
  - Re-add Acked-by from Conor Dooley for DT binding patch

Changes in v3:
  - Rename DT binding file from andestech,qilai-dma.yaml to
    andestech,ae350-dma.yaml
  - Deprecate IP-core-based compatible and align with SoC/platform-based
    compatible strings
  - Dropped Acked-by from Conor Dooley due to the above binding change
  - Remove "andestech,atcdmac300" from of_device_id table
  - Replace deprecated tasklet with threaded IRQ using
    devm_request_threaded_irq() and IRQF_ONESHOT
  - Update locking from spin_lock_bh() to spin_lock_irqsave()
  - Use builtin_platform_driver() instead of module_platform_driver()
  - Remove "select DMATEST" from Kconfig
  - Add separate MAINTAINERS patch (patch 3/3)

Please kindly review.

CL Wang (3):
  dt-bindings: dmaengine: Add support for ATCDMAC300 DMA engine
  dmaengine: atcdmac300: Add driver for Andes ATCDMAC300 DMA controller
  MAINTAINERS: Add entry for Andes ATCDMAC300

 .../bindings/dma/andestech,ae350-dma.yaml     |   67 +
 MAINTAINERS                                   |    6 +
 drivers/dma/Kconfig                           |   11 +
 drivers/dma/Makefile                          |    1 +
 drivers/dma/atcdmac300.c                      | 1505 +++++++++++++++++
 drivers/dma/atcdmac300.h                      |  296 ++++
 6 files changed, 1886 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/dma/andestech,ae350-dma.yaml
 create mode 100644 drivers/dma/atcdmac300.c
 create mode 100644 drivers/dma/atcdmac300.h

-- 
2.34.1

