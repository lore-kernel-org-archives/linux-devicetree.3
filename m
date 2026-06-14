Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 622D625C804
	for <devicetree@vger.kernel.org>; Sun, 14 Jun 2026 04:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781409670; cv=none; b=IWV/gLdlEuBPH8NP0y29Hawfqp7dp3zEvWmo2ESfacy6MmmIl3rZFULsGRG8VcVgv8eECaa+p7ivCw3CNwcxHpAwHO+0Eu6f0LJbptmUAP215IONnVaGVEdiP9bmuIxCzORtI6inh9RxgY87xIQvwrIABVXNVCl3qNtPrdKKPrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781409670; c=relaxed/simple;
	bh=YqZgooixA/CJnBKTcYQgsktFkPYzsrtkk+x91gr+1OM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pf7kwy5j0TTrqiGNEAlDaDZOvO34uh9MR0nfZKqdtuDlg4F8VsAFXp0Ovzmh+1AgUi5Pac+FfeLX1YRe6fEOR3o+/6e++5sLBs2ApDHrQZ41boXzAm1QDpHLR34w/m0zsFjTmYW4fZL0Jm+ZQeizvpS5Pbr1tQzvPWFIFC7+7Cc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IJJqyZsJ; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IJJqyZsJ"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-c8587427468so828081a12.1
        for <devicetree@vger.kernel.org>; Sat, 13 Jun 2026 21:01:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781409668; x=1782014468; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OOnY6yEezyUxI5CBehQcqD9t37X66JniIBbQ/HB7HUs=;
        b=IJJqyZsJ5cahcfrFYbsa0P/v3Ypl/QOGkkAERh3hSEPWHf4ldxpP1/UscgwcRbyfQs
         9f49Qa9OW9+QULfr1f1/Gom0kUdbT4UCKNxVtorwJlBbJWc0d6Z3edjn5QcJ8xIA7aAY
         EvoIC5jJpQH+6SwoanSb67TIUeH+EULvAk64XnbrhUQ28dKvAD3vfEOxKDqy9IRf3MEX
         t1SzczKBJnidozYuqPn8ofF1e5W9jo5IWqG/tjLDWKxYVG014aKkWbBX4K34g8RkOElF
         KjgARFpRskiFhuChJy4ZnWtWyWe6KczhPzWkjz2vhpoRBhAwYXZ83X4GqkcYE5+MkB5k
         nLMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781409668; x=1782014468;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OOnY6yEezyUxI5CBehQcqD9t37X66JniIBbQ/HB7HUs=;
        b=dyk/aeOvFUsYIj7YWK1NZ9TxvNfaittteczsaeVq6w9mhb2KoZLOa4v9dYCTEhSQIN
         GPJEQMc6TYqhuiBSOZwEKRqaDn5NJXdE1+6jxmENz4bak/CrBQyYcnZ2sON8MwFE+fvz
         xEyYPaZTCeCaUIZcdp9lfpkK7MsR15c5ETIlprgAmpGDqbqrWaMy1UqWmaz8SUT99fcW
         ZvZyVKjrhNAyLXtmB8KIuKsLic5RgTVGgK7Ec7pPsmLMyyE1ZXLSwwCLh5abodPweKj8
         lnZqUEUhIxTrVVpooWrJl43cktgRzzIgl7LZCB2LSPMciaDYpTgLfHEh2Ljm4WVsvRVi
         Y+dw==
X-Forwarded-Encrypted: i=1; AFNElJ9gfLQdSS1Nnrv/2KSRaJfLxW5j6+QSCBGOiiv/9gHjcp0l+BkNnSVPz1fdLxBvk7Y58fIXSctXJMu9@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3UbK09HUGdCVNxBYzB7c/oSVsP6OhuD3ga50MlrVIEonY1W0j
	zJWBV2AZY1uvBArWP1fxpemuKtqKFwTnuAPAplSymgyGOFKZB2Bfx1rL
X-Gm-Gg: Acq92OEQYG4Q9zUku4/XSk/dtnO4TrmM1CWsnBW4Xiz7GYXHVf8KKYZpto+71/PPVyL
	aw39cY5I3yUrHI6w9OZRxDMeGuNWrPF3IZ38BE76JStqc5+Y4K3ZT/BJ4nd7JkULgnRt666evkT
	OMNvULq1GdaQPR6czXbH6N41cXnyWxrnBnoUp7Kc8C0Tn8ATAasy5kyWGHVqS13BkygTQdTlb+P
	XmjOZ0Wc3wc+f2Zmgday8yyYULht3vR8ofp8cOR+j34DHdW4wQEIFWPUcWQl8VJqhy72Da1cFBB
	+EUOLnN4+6u7gPC6SqaZUnt7OBLydjuWys6PRCpbL/XaqK8LOsWZw6xpDz7EwWdYzL5scCb4lYO
	ATpRKGsyKTxLgDsPRZSJuDJ2xMF//D25Fg050QIo52QSAih05eNw+T1x4866Dwo8+wltQeSbejV
	7n9KUKZLbMqDAFT3IgnApup1iFl4k84Q==
X-Received: by 2002:a05:6a20:728d:b0:398:b178:a53f with SMTP id adf61e73a8af0-3b784021a1amr10268367637.40.1781409667707;
        Sat, 13 Jun 2026 21:01:07 -0700 (PDT)
Received: from mincom1 ([115.4.79.42])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8661a67603sm5676983a12.0.2026.06.13.21.01.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2026 21:01:07 -0700 (PDT)
From: Jihong Min <hurryman2212@gmail.com>
To: netdev@vger.kernel.org,
	Lorenzo Bianconi <lorenzo@kernel.org>
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Simon Horman <horms@kernel.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Steffen Klassert <steffen.klassert@secunet.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Christian Marangi <ansuelsmth@gmail.com>,
	Felix Fietkau <nbd@nbd.name>,
	linux-kernel@vger.kernel.org,
	Jihong Min <hurryman2212@gmail.com>
Subject: [RFC PATCH net-next 2/7] dt-bindings: net: airoha: add EN7581 SOE
Date: Sun, 14 Jun 2026 13:00:27 +0900
Message-ID: <20260614040032.1567994-3-hurryman2212@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260614040032.1567994-1-hurryman2212@gmail.com>
References: <20260614040032.1567994-1-hurryman2212@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the EN7581 Secure Offload Engine register window used by the Ethernet driver for ESP packet offload, and add the new binding to the Airoha Ethernet MAINTAINERS entry.

Signed-off-by: Jihong Min <hurryman2212@gmail.com>
---
 .../bindings/net/airoha,en7581-soe.yaml       | 48 +++++++++++++++++++
 MAINTAINERS                                   |  1 +
 2 files changed, 49 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/airoha,en7581-soe.yaml

diff --git a/Documentation/devicetree/bindings/net/airoha,en7581-soe.yaml b/Documentation/devicetree/bindings/net/airoha,en7581-soe.yaml
new file mode 100644
index 000000000000..24aecafecc70
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/airoha,en7581-soe.yaml
@@ -0,0 +1,48 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/airoha,en7581-soe.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Airoha EN7581 Secure Offload Engine
+
+maintainers:
+  - Lorenzo Bianconi <lorenzo@kernel.org>
+
+description:
+  The Secure Offload Engine provides inline ESP packet offload resources used
+  by the Airoha Ethernet controller.
+
+properties:
+  compatible:
+    const: airoha,en7581-soe
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    soc {
+      #address-cells = <2>;
+      #size-cells = <2>;
+
+      soe@1fbfa000 {
+        compatible = "airoha,en7581-soe";
+        reg = <0 0x1fbfa000 0 0x268>;
+        interrupts = <GIC_SPI 79 IRQ_TYPE_LEVEL_HIGH>;
+      };
+    };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index cc1dde0c9067..7c338e670572 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -757,6 +757,7 @@ L:	linux-mediatek@lists.infradead.org (moderated for non-subscribers)
 L:	netdev@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/net/airoha,en7581-eth.yaml
+F:	Documentation/devicetree/bindings/net/airoha,en7581-soe.yaml
 F:	drivers/net/ethernet/airoha/
 
 AIROHA PCIE PHY DRIVER
-- 
2.53.0

