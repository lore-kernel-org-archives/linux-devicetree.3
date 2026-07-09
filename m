Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B6D932E696
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 04:01:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783569692; cv=none; b=dw9yzHTykaWZocvGqb9Lc9Ylk+RbvCus6HWRGe0v6AegOsKxxSuddVBn+PRbDEx18UpZxHTbCHdVlfJRML9WcltFiYSv+mN5XPw+0FLKLd0yGY8TREFvqSE0dItLaCp0hi8LbmQMdLq6XR5XALyrlYrlLvagEolLYAC8HB7IDRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783569692; c=relaxed/simple;
	bh=L3fsKyGi5rpLNg8G/ROz7kxtpDKTfFUi8q+A7hQ20Dk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=npvIe5qlZgi15wYf5SEu7PMcxo1YsnpkmW/sT9HXiiKISO8MiwHSeHsHQm7tWaCQoFTWd0RvuqOZk0bxEj8DV75yMrYR3ykDg+yCqqUPSmD8Tg7BRSf6niv5IhwAc6uJ5a4zDjMu/op6Cx+LNJNaY7qWQvxjYoQkpK+yJ1gBxoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GMukBshX; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GMukBshX"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-84830c774a0so1419880b3a.1
        for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 21:01:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783569691; x=1784174491; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7AEeGlWy9uXP/q/PPr93GfqgOECgNHQd0LWMUmr1tVw=;
        b=GMukBshXkJIxt9ZD5Bp3JJU6aJSmvW1u1O/0UI0stX8iYGTug6ol+VmX9z0K4k6A60
         5PSrtxcfXOQI9pp0sYKEGFIsoeFqtqAw4/gol1L1/SR/kHOQMGu23rnsvXc9tUzBDRKC
         ieCX2FDs7ImbMXxuxJVmArTlXDoNUOD2wHu3+j4Kh1nzhBDGOy2dz6Ag/TRSLqyGZMIh
         VWRgs8kA0jtmmBlPvjXY8L/NJtWQUMOQODdFChNLIxx+bMDUqMPa82AfRzPRcQ3rHM6O
         A3KZbvxXYCH4EEtg6id+RwM8MeeDCHN2eKnzs6IXyt6n56RP0kYsHmSvd35Qp8D2waVs
         X3KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783569691; x=1784174491;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7AEeGlWy9uXP/q/PPr93GfqgOECgNHQd0LWMUmr1tVw=;
        b=cV+rVzubJfpIKU5RtVs97FBgOKIwU2Ih9UZYeohuz3y3FBDYTsijdz/MZxsyHwlMp+
         EM11VbvOLP/U5V0xN8iJOCIybWcaus8kLuD2oYwyGGdCoOu1S894f/wOqv+/P6H6F0mr
         bNNQwxIMo5C7rQWv/fxs0atdGRcmMpPqzTVi+plG6AEgWwkfeLNMiSgcu+9mHIvvTZbu
         XWswTns8vy2unWvzuk0Rt4yuyBW/QujCtJGVVlbR9TSs7dbuBFre6tZRe8Xxz/5mV/IB
         6QlXsBO0n4EhYrog+tekXETlsL8CO0DtyP9SAv9HtxJMQQL9m6R2PqRAB9/JeF8xVdzP
         r+tQ==
X-Forwarded-Encrypted: i=1; AHgh+RriWN0CNYRSTKkVZd9oNLtIgiteR8SIgTRRj2SQCpwbPo3E2vKRcD5Bsn/y3qVhoeNq+ULsi2aBaN3e@vger.kernel.org
X-Gm-Message-State: AOJu0YyjXnjuWxl/Al5d6tOEOFFQzikZ3pNl6zs/SnYAZ65nZcm6J4XN
	GoXEgR4t/cuGs3kGweAJ8bM2G9H+91TtZmp7jO+ITNYQDAlATKZrjqQx
X-Gm-Gg: AfdE7ckp4JhgbcKqOr0jWH+5KhgYw3xCcYoLsUpoDBHiGWDqgc5TWBINAE3ADYsrruk
	bzkJYYqWGtBtcYumXzqn773qSPWGMPbe9LgXu95m4n5pXfSAElX5Yi98oyvVZc7PDFN/LOw7cWV
	xzvcGGoP8Rt1bb/XFkTbnqjSObI7pb7hUgDBJpOQZSKzwsvgEqqtDMLW0J+YAuWNAowY1P8yH4y
	2/OvjSO234JiDBflOwsfkX1WZRD5MTsR8I5Z86wqmFjI5y182kGsiyiD+OxyVfPG/P9sbo3xzyv
	nP9EeOW5k9TmVGW9gTkxTitRnlijUu+kFLVtVGPQjU9zlG8apjOR8N54VB+0VyCLf206XwpPQEN
	ryEB4j1G8c3718RbZ4ml/bHm8DG+P0YI/ubVO3UDq7wzD3bbHlJeUS9kHobOy7o2v
X-Received: by 2002:a05:6a00:c88:b0:847:881c:7026 with SMTP id d2e1a72fcca58-84842eb7ef9mr4875368b3a.3.1783569690624;
        Wed, 08 Jul 2026 21:01:30 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6b93f8csm8273199b3a.19.2026.07.08.21.01.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 21:01:30 -0700 (PDT)
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
Subject: [PATCH v4 4/6] dt-bindings: PCI: snps,dw-pcie: Add msi-parent for MSI handle check
Date: Thu,  9 Jul 2026 12:00:24 +0800
Message-ID: <20260709040027.958400-5-inochiama@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260709040027.958400-1-inochiama@gmail.com>
References: <20260709040027.958400-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The IMSIC device on RISC-V based system does not require ID
remapping for MSI. So this device only needs "msi-parent"
property for IMSIC-based SoC, and the "msi-map" is not a
necessary property.

Add new condition for MSI handling on IMSIC based SoC.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/pci/snps,dw-pcie.yaml | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/pci/snps,dw-pcie.yaml b/Documentation/devicetree/bindings/pci/snps,dw-pcie.yaml
index b3216141881c..91bbbc8924f6 100644
--- a/Documentation/devicetree/bindings/pci/snps,dw-pcie.yaml
+++ b/Documentation/devicetree/bindings/pci/snps,dw-pcie.yaml
@@ -27,8 +27,11 @@ allOf:
   - $ref: /schemas/pci/snps,dw-pcie-common.yaml#
   - if:
       not:
-        required:
-          - msi-map
+        anyOf:
+          - required:
+              - msi-map
+          - required:
+              - msi-parent
     then:
       properties:
         interrupt-names:
-- 
2.55.0

