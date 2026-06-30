Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4317936683B
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 01:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782782485; cv=none; b=pTFYPMwl9hB2xQz9su+NB8TJhZ6gTbnEZXWqE8s8q/Id+OXlE1yBVs4qzWuP0cofMJsCPqW34uzW31gTaN8FODa7YoLCwdwjfkrVfvzuoH+UznVPyL1C4hQWj6oUy+xiIx+1KnHc84rDIAOcY3mb4Gq3/aFew3gd26xhXU+LUUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782782485; c=relaxed/simple;
	bh=RvftKoRzMRPCIxQX+fAjqTrjlrFhXHu5VkmJ8e+BAJg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=bcVGReaVu97WhTn+4iAvNZuUi9Ifh8nPmt5SzBT90fA8q+JYzhT/9IG1au32GBGvKhuSaXrVBAmhTFZ91A/Y2Y457R7hVcbsxRJUHmMhlplikHYUagCHKHEvDjlH1IBKxmjEGpLXV7z4I5QauQP6hX7fCcBRX4/Q0aipHxBYCkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z05QPOMq; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z05QPOMq"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-847921eed4aso1099734b3a.3
        for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 18:21:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782782473; x=1783387273; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jSeLpSyqZM0d28vZftrA3N5zj3VTIegp6CHksZAgsSU=;
        b=Z05QPOMqRB6Y0UMUIvFQK4ppB1AVvE+1zxEXGzBMjNFmNj0mQDCc5Ethv4QVGqrGzG
         U9aCD1rYpFs2XSmPl87EFKaWRE9qu3QofdMHeGMdWvbb46ueKinaTZQZm4XJpNYmn4LV
         b70BRnNnBCqtqCaECM1UerbiK08DMkCSjNOfOocEtK0rcv9quwy/03tI+2iAzz6/ml0d
         lYVA9JsByrejw9giUFhYhSqpF4kZBDkpOj4wqYAoMyG7ZC87pwmJWQC+UAqmBaalrGFS
         qHpD+ydmSZM8ROFRnTVXDOF3L+s3LtocnlW2yXvFmtpkNMoPiFWcQaN0ZBHu8mTP8vb0
         8zJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782782473; x=1783387273;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jSeLpSyqZM0d28vZftrA3N5zj3VTIegp6CHksZAgsSU=;
        b=n7w1GJc9wNyWtiGu+VNacwlpsL1+e5PAGEIcdIfI+uNqbqxm0G5H4DXbvKJmVCFNvU
         jaDEZ9OAv472VmxrxsezL+0fHOuBqNR9/TpHC3SgItii0RQf65VCp21MQltWO/sTQH+d
         GHx+UoznWKViQsFHKKFUUhSm/uVULojM0B5h78WvDn6aWUfIsVWJVIfysngR4WS7ZHSS
         VjKswAVmLEp1u7k35RN4Z1hWSbYNwVQmz7gZulCZDpvjdhWiL+ZgxVMpCj7lkzLsJrsM
         iGcMvORZ9Q5e8cYqyp7a7gJqVruSSfXcyPPp37SkRv+cYk7/xQJfJFeMT6VrwFNFWN0t
         /jCQ==
X-Forwarded-Encrypted: i=1; AHgh+RrWG+3R79DILQocFDEVIGsjNPr/5SQTVYiiYrUJkjAsLrcElNAzp04a00PQtRfuvPFVs0/biIpcqCCW@vger.kernel.org
X-Gm-Message-State: AOJu0Yxb0psU6TylkGimoX3c0jzuxy+TFnnhW4hBnBkNdYKN6ZxwqQ4e
	4aI/iZ1zRIfcsiwVQsMz/R3Ob3wN/r2owrrNl6qsvum5HEaZl1Y8PHgt
X-Gm-Gg: AfdE7cnLeIwuRHcs+oxc29QPYChdkWYR3IzVyL89qUhI/dakUt3RPFLvtFr/Fw2Ij7e
	hmqPnGmtus/W8Q3REQX75Jh9//k0WD0FmakeBeumAEEN+3fYPOlRx3z6AbtYKjVlGI4aCteTYKl
	FlEMf73wDFNRreIODbIEXBrlO1uUKjui+Mc0VpTXYzfFPgdmS7zsAihy4xfabobi0F9ZgIuXEHm
	PLs+KE/fCEqNNM3nCbZlJuPI1BrUbQ/AHJNkj8M0gR1LWRHbXoatQ2HDEGy053kdWZElYFjM1IT
	SM7h7MSboz6SQ/9ShFrzVnzK1K+JqomlMXBeoXmcFa/vV4dQW1qMARHRB5jjCmLqFJfxiMVYjn0
	FjBrC09q8ruoR8kKvGQrHgLpLkOIX0JfVGHdD80M0CVYXOaDSeHMcp2nDFPeJYjKnnb0l+bpCmg
	VMO2txdy2KHDmeXcPwBxtGwK1YkBssr3uFrWKpfBsElbXIGRmlN5CKFBeAvzHlFO96ONw8Idc=
X-Received: by 2002:a05:6a00:4515:b0:845:cf86:9469 with SMTP id d2e1a72fcca58-8479f216724mr1371011b3a.29.1782782473138;
        Mon, 29 Jun 2026 18:21:13 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847a03778basm654503b3a.49.2026.06.29.18.21.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 18:21:12 -0700 (PDT)
From: Zi-Yu Chen <zychennvt@gmail.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Zi-Yu Chen <zychennvt@gmail.com>
Subject: [PATCH v5 0/3] i2c: ma35d1: Add support for MA35D1 I2C controller
Date: Tue, 30 Jun 2026 09:21:03 +0800
Message-Id: <20260630012106.3616821-1-zychennvt@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds support for the I2C controller found in the Nuvoton
MA35D1 SoC. The driver supports controller and optional target mode
and runtime power management.

The implementation has been tested on the Nuvoton MA35D1 SOM board.

Changes in v5:
  - Patch 2 (driver):
    - Add spinlock protection for MA35_CTL0 register access.
    - Add NULL pointer check for i2c->msg in the ISR.
    - Use devres-managed cleanup (devm_add_action_or_reset) for runtime PM.
    - Use pm_runtime_force_suspend/resume() for Controller mode 
      system sleep.
    - Control I2CEN bit enabling/disabling via runtime PM.
    - Refactor arbitration lost handling in state machines.
    - Remove unsupported I2C_FUNC_PROTOCOL_MANGLING flag.
    - Clean up readl_poll_timeout() parameters, retry loop, and
      unused macros.
  v4: https://lore.kernel.org/r/20260610030208.2020275-1-zychennvt@gmail.com/

Changes in v4:
  - Patch 1 (dt-bindings):
    - Update example interrupt number.
  - Patch 2 (driver):
    - Remove redundant spinlocks and fix 'irq' type to signed.
    - Fix target address recovery in ma35d1_i2c_reset().
    - Refactor IRQ handler for multi-msg reads and NACK/IGNORE_NAK.
    - Fix timeout UAF via explicit IRQ disabling during recovery.
    - Drop IRQF_SHARED and fix PM paths in probe/unregistration.
    - Limit suspend/resume wakeup logic to target mode only.
  - Patch 3 (dts):
    - Add missing i2c0 node to dtsi.
    - Switch SoM configuration from i2c1 to i2c2 with updated pinctrl.
    - Add nau8822 audio codec node under i2c2 on the SoM board.
    - Drop redundant i2c0 alias and clean up dtsi property ordering.
  v3: https://lore.kernel.org/r/20260512073953.564323-1-zychennvt@gmail.com/

Changes in v3:
  - Fix minor DTS formatting issues (whitespace, missing newline)  
  v2: https://lore.kernel.org/r/20260316063726.41048-1-zychennvt@gmail.com

Changes in v2:
  - Overall:
    - Rebase on linux-i2c/i2c-next
    - Switched terminology from "master/slave" to "controller/target".  
  - Patch 1 (dt-bindings):
    - Simplified description and fixed 'reg' size in example.
  - Patch 2 (driver):
    - Modernized using devm_*, generic device properties, and FIELD_PREP/GENMASK.
    - Optimized power management by moving clock control to runtime PM.
    - Simplified code by removing redundant .remove(), .owner, and inlines.
    - Added dev_err_probe() and default bus frequency handling.
  - Patch 3 (dts):
    - Moved i2c aliases to board dts and reordered nodes alphabetically.
  v1: https://lore.kernel.org/r/20260302020822.13936-1-zychennvt@gmail.com



Zi-Yu Chen (3):
  dt-bindings: i2c: nuvoton,ma35d1-i2c: Add MA35D1 I2C controller
  i2c: ma35d1: Add Nuvoton MA35D1 I2C driver support
  arm64: dts: nuvoton: Add I2C nodes for MA35D1 SoC

 .../bindings/i2c/nuvoton,ma35d1-i2c.yaml      |  63 ++
 .../boot/dts/nuvoton/ma35d1-som-256m.dts      |  20 +
 arch/arm64/boot/dts/nuvoton/ma35d1.dtsi       |  72 ++
 drivers/i2c/busses/Kconfig                    |  13 +
 drivers/i2c/busses/Makefile                   |   1 +
 drivers/i2c/busses/i2c-ma35d1.c               | 803 ++++++++++++++++++
 6 files changed, 972 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i2c/nuvoton,ma35d1-i2c.yaml
 create mode 100644 drivers/i2c/busses/i2c-ma35d1.c

-- 
2.34.1

