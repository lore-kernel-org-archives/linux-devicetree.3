Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EDE1380FC5
	for <devicetree@vger.kernel.org>; Wed,  3 Jun 2026 04:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780461368; cv=none; b=f3E4erErrL3QFAbN9knqKWJERDGIYbwLW/paOtMiPMgLoDJbaDPmWb4M6dgJWwRztzEk3S3Oiy5X4fTi0j+FKNusnzLwT8vaKugyfflzJdPQBnwOQRc2Ncz2azOgU78ZhM3uPkYh14GUEpAtywiETst0KWfHGktjnGgpFSdc8Ss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780461368; c=relaxed/simple;
	bh=RsY2oIuWkiPL5Y9qoeuUbOymeqGvcojBKj+xOb2EDc0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=sGoeFWNuqkBP8qTp2TFxj2Jxe7+ahBxiqgHjnQsYfhrHiSybTKy3XUuMAhRUR7v2l0m/myVKvdnHVRB7MlG6d3tLJodMlU7O/vQaG46DGrXnemIxk977kI+hvGR5mCOzPHLvlLe+FT18iKpixhEAJJSYRCvStW7mk22gpoOSJfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ux9qC+Qn; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ux9qC+Qn"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-c8589498839so1683217a12.2
        for <devicetree@vger.kernel.org>; Tue, 02 Jun 2026 21:36:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780461366; x=1781066166; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1WhyjqFeKhuYhkhKO1bR1hDfl8+mFdDMpPiPRXHEMcE=;
        b=Ux9qC+QnYBIDaKayaKaAhanqRlgSXNOJ23nv4ywI+xLj97af4B2AE/C0xzBPo2ZVL2
         /iHEZFIvQ1b9GmAJafH1klEQbiJd6dbE7DPNMMK7SIIfRBLqEVSyKg2lkzBm7qPpmfvo
         /14aUaKnOlJuw+aoAgT5CpMu4qEOp9tgSQaaSg9W9qRwjboZ2KlJ8rSXPPz7mGuc0kUI
         96CLTW3BzPtMslTD6gXcHsnGrOWtU7k50X4f3Cc1gLN+P4uG8zeB8p/S8CE/wLNQbLhJ
         hUb2VvtK2KOmgG4QQnrIZEqCRYRJNMlBXOzekLegkbu9J3xhns0sHp3/o9xDL/U7SfJX
         AO1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780461366; x=1781066166;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1WhyjqFeKhuYhkhKO1bR1hDfl8+mFdDMpPiPRXHEMcE=;
        b=Q9Gg1md8zhY/O8c9Qr0zYnvVSZJhvkuQCslld63RH8Q0DPZy+mNH8U0RF0C3bbRxfM
         /B8SrEfQcalcW+/LmsWD0xcPJOvmGWmZDBIPAh2yaAv4gist/vSAzGjidmABbsTvtjfl
         +e/PXTGpe8YTgy9RwtA2nWpdt+s/oRQAgZ+BauqssK9QXL7qXJ7ACTfFD5ghKYc0ehPh
         K/xAWNicQ+LcMORJ9FXxdfej5USyzRSrXPaFgDubgPjEmQwiCYqau42E0Ob9moinyw4y
         zzoYg65st65sWrU1DBaermCxyFX6+ya75mz2Wkmj5jRys0fsNy+v4e8vckLsFINM232h
         ep1g==
X-Forwarded-Encrypted: i=1; AFNElJ+X4KEgmk4Pr90LJdM+KbElNN/KCj5AnnReMgGpkdRsNSyUimDXlHF3mZulrIMnvICENFP4zcUZV8k5@vger.kernel.org
X-Gm-Message-State: AOJu0YyNIiPEhrXhUYapIX3+ELZ2j8y5Pb1zG1lfeKTjlduRiqWZgYl5
	mtO9jm2VFreyh255Ji+GVTkdn159SP36BH+FxrgfC9FnWkC/86FtqY5j
X-Gm-Gg: Acq92OEvM9Al18p+32QEUKyxCJJw9CcEcvETZe8+cfL5rpHswgko06olt3TExGSw7Vz
	Th1wm7N0q0pBc+jtrb0gvXCYuUPHxbOb0Zopk0OllVGIfSM+pVX47aJoA1FpT0jWripJ2yEPcyR
	rsAWKqz7ZFCKY9s6Pon7+rKJrz1JHTnWa4ktBt7aNR2h3EVgJ5v1xNB/4MuLtI7bsUSZWgcabiZ
	cm6FJPGyNPMSUjR9XkDlvwh6gjLZJZ3N2USBtXYbgashitYWqMsHhVvFfmDasVU4Iwr2Nvvo1ci
	7sJyKOGxBHpku1t0GSWC84eQDh3Gozpwn92Ltwm3AyFZ634yRHy8Y7uAzEtE80ZhnvgEwWn9dJs
	cDPQ58eqf4OP4FqkDSi7siZaqyD1/92QUYh2O0U11Vuog2DAZj+bgbu+qudWnssFtWrZmSAqZa9
	HsA4f+RJ1WF5O2+qCvcPuyHeEiAryw580Di9JFBOewPVwl+t/KCdeK+4zHJ84hoVZv4ynMNgroo
	xKR+mjW8FbiI+iKtl8rpJvc
X-Received: by 2002:a05:6a00:1d9e:b0:82c:e60c:f36d with SMTP id d2e1a72fcca58-84284facfd3mr1597329b3a.48.1780461366633;
        Tue, 02 Jun 2026 21:36:06 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84282904889sm1478742b3a.55.2026.06.02.21.36.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 21:36:06 -0700 (PDT)
From: Chi-Wen Weng <cwweng.linux@gmail.com>
To: broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	cwweng@nuvoton.com,
	Chi-Wen Weng <cwweng.linux@gmail.com>
Subject: [PATCH 1/2] dt-bindings: spi: Add for Nuvoton MA35D1 SoC QSPI Controller
Date: Wed,  3 Jun 2026 12:35:50 +0800
Message-Id: <20260603043551.1062112-2-cwweng.linux@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260603043551.1062112-1-cwweng.linux@gmail.com>
References: <20260603043551.1062112-1-cwweng.linux@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Chi-Wen Weng <cwweng.linux@gmail.com>
---
 .../bindings/spi/nuvoton,ma35d1-qspi.yaml     | 61 +++++++++++++++++++
 1 file changed, 61 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/spi/nuvoton,ma35d1-qspi.yaml

diff --git a/Documentation/devicetree/bindings/spi/nuvoton,ma35d1-qspi.yaml b/Documentation/devicetree/bindings/spi/nuvoton,ma35d1-qspi.yaml
new file mode 100644
index 000000000000..f7b9cb52d8e5
--- /dev/null
+++ b/Documentation/devicetree/bindings/spi/nuvoton,ma35d1-qspi.yaml
@@ -0,0 +1,61 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/spi/nuvoton,ma35d1-qspi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Nuvoton MA35D1 Quad SPI Controller
+
+maintainers:
+  - Chi-Wen Weng <cwweng@nuvoton.com>
+
+allOf:
+  - $ref: spi-controller.yaml#
+
+properties:
+  compatible:
+    const: nuvoton,ma35d1-qspi
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/nuvoton,ma35d1-clk.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        spi@40680000 {
+            compatible = "nuvoton,ma35d1-qspi";
+            reg = <0x0 0x40680000 0x0 0x100>;
+            interrupts = <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>;
+            clocks = <&clk QSPI0_GATE>;
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            flash@0 {
+                compatible = "jedec,spi-nor";
+                spi-max-frequency = <30000000>;
+                reg = <0>;
+                spi-rx-bus-width = <4>;
+                spi-tx-bus-width = <1>;
+            };
+        };
+    };
+
-- 
2.25.1

