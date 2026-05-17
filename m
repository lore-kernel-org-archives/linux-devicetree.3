Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2389E30C35C
	for <devicetree@vger.kernel.org>; Sun, 17 May 2026 01:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778982566; cv=none; b=Wajp8rc/60bRu02BP2UwDSERBXZVKsG8bh8Ufh6O3pao+WbOpX0HhvFj6yxh2+m13QkmzIKBuOvA18oq/FKAdaNBNmg24tsjul9sGwXKBeuFvwao253jnu9ly/Qnr/7W5aBQA5vzVUMj7XIdTkno5AV3BEdqYGMmei6hxrdFUE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778982566; c=relaxed/simple;
	bh=0Oscz7/WLUKTye1b+R/+VWNQskuTvIsNTNGkBlIb80Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m+OyRvTubY0z03eVrdDJnVXB4loLmu3Nm4gJFmhfbL49vQOzJF69z3WsLkzXD2BTwjfhnh6ZXBvljC6kdt+kn48X8456rrqleSaFNlA90tZNMsDi+F5QcKnZ+LTHWCX3YYLkC/ZUb1MaKAIQlnv9e7o2S1P9OvKRZCTo42PL5Yk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TMLknvuo; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TMLknvuo"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-82f8893bff3so464839b3a.2
        for <devicetree@vger.kernel.org>; Sat, 16 May 2026 18:49:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778982562; x=1779587362; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pBf3UIF6lGXHsknt4Ghf3Tw97w9Ex+KKpzto98h8Prs=;
        b=TMLknvuoy/KmJN9iP776T4r+jgFJBMG/Az02z5KmsPmCfjY5/V/kgdUIqy+aHm9zCS
         oaHn6x7BMd4fzAuBqk0xcIeEoYpXOFwF4y8p133yyaVM4ed07CQIEyLZVdG7r6AMJzBb
         7PvTyqiBtVi/a3jszxdRbgQaGVvhd5YRMfNlzfVlcyvS+IrdUpjL6QvewZ1hvdFkGZlB
         tZP0xILnuDcJho7KmIUb2P+YH7OgZhha7Zf/BGgv8hwgX2SXCPctbnck+urVxdNz5UsJ
         e2UwjEeMEi9+mhsSo5yMfrDtqIIZNeuH0LV8/X9df4h2XOJ3OGjkul5uNy3KFbKw5Mp/
         xATA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778982562; x=1779587362;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pBf3UIF6lGXHsknt4Ghf3Tw97w9Ex+KKpzto98h8Prs=;
        b=PFtnAVi7cX+tjaRt0SZOHM5VbIuKPaIDRfPFub/tcgBx4Qk7e2XGxxvq1ZVn/bOc8E
         TiA8uqKoHGnHuGze0PxxuvAceT/SK4fUV6hl4tE+AERJnF/OMkcaib4NGNpGhGGMClSL
         Tq+zbo8weG/GdRP5Ery3IRiy+tfSj36jid3dxHtoiGMQe2pxjrHPScfOygr1WtAQX5Cj
         QqA7iJYLO/ZO8RDdNvfvE9maQJWndR3WoHLJqUiDpvQ2jnIQaqM6CKudEpE32RgtS26l
         mEDM+kpP1Cbbx6RRb3ZUi5Ftd78k1sqr5u3p8dMZ2cgO0P5876WurISKFW/hMPWzQWYN
         TBrA==
X-Forwarded-Encrypted: i=1; AFNElJ/dRfSkIjsBOqejy6sgQB9VcC5ZhYjWrD/II9MJzPgdAaGRf0kcdV7Hfw26XxIyiDWEKcbCHCaORSi9@vger.kernel.org
X-Gm-Message-State: AOJu0YwZxGsp5e/zXR65w4fot8fKNwSLgMrha4hfAhe+8nC2lDi5k2e1
	xS6CW9L5EkL5l5/lK4eVGRfXAcgSoODJfaWvY96fdaB+X8dh1Fc1Qybh
X-Gm-Gg: Acq92OErdXhPna+SmrwO69mmeco4XeThpsRtCrPMv9EgKg+f1OQIwqOtaSaZMgysKhd
	fJtME3Ca9AW/Gg7w3sQxvv3XuKY3IVXQ42HIxf2xtjwp1a4Jc7YnogjwnHUlNLKoCTYswd6rSwU
	mZHUN79Zx5v8SDNUMCD0bNQYOJLqszhoRFp+hrAKS5w7JLYjqpn1byoYAzkZxLNFILkXvdr1Elx
	rRjVb38BbNinY3RfWkQIxGpTMqRhKWOefMFNsE7aB879g5SDr98f0hjlODAAnwW8h7++L2LUJJ5
	2Dg8/Q0znHtizi6OSNW2f4cSM7pJ5rAA8RQ9pf1zKeJ+A/cJAfJGvUKHttehjbhzIm7Si4Q62Ob
	slPP0x3wh9EyCeRz+XxjoAk4ev9Y23hN8DtYMQsVJapfV7wWngsutXUJSugdCc9hY2cNW76Y5tX
	NJm79i27BStLtaop2ED7n4EyA=
X-Received: by 2002:a05:6a00:a20e:b0:82c:e1aa:21e3 with SMTP id d2e1a72fcca58-83f33bca81dmr10011080b3a.10.1778982562438;
        Sat, 16 May 2026 18:49:22 -0700 (PDT)
Received: from localhost ([2001:19f0:8001:1b2d:5400:5ff:fefa:a95d])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19f7cc8bsm10511314b3a.55.2026.05.16.18.49.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2026 18:49:22 -0700 (PDT)
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
Subject: [PATCH v2 3/5] dt-bindings: PCI: snps,dw-pcie: Add msi-parent for MSI handle check
Date: Sun, 17 May 2026 09:48:38 +0800
Message-ID: <20260517014841.254085-4-inochiama@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260517014841.254085-1-inochiama@gmail.com>
References: <20260517014841.254085-1-inochiama@gmail.com>
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
2.54.0

