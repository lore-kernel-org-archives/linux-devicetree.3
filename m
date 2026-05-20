Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88B67352030
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 15:09:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779289774; cv=none; b=dt5uSkgyJpc0eFLHKuzfN5iZxhnyNPWPEaKzh0TpX+inexdM5Ior8KNH5eS4YMUrTDO0rJHiroz8M2zXW9wfMBVmZJsTCFb94PeaxZgE/lFVT5cDJruNBWDJzMmHeSaaYKzv7jsDd/RAoq8mp0dRsKq8EGmggTY7a1jvvXI4/iM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779289774; c=relaxed/simple;
	bh=ZFCPxnBsn7l/q5muCwmNmTDcY6bBCEJ2vd6Wy7/pDdM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MRQVwF2tZ5zUanFLAiVNpSzNHGmBOEvVvrFTf3Q+oGKa3LNCl6PBvLkXZc54PuBff3NQmjQeCFa7JVPQFmQ5NWYIIkSoFCjED1FP0kDzmIcE2UnhaM1runqLZ4b0NEpaebMlEa8DKadDpRVgA7M7p/0S+PvOVNsNVADa9QIBORE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LWbRuiOg; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LWbRuiOg"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-45e8a834cc2so1751940f8f.1
        for <devicetree@vger.kernel.org>; Wed, 20 May 2026 08:09:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779289771; x=1779894571; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jNa4hPs6+EpEb0GIRuEgBVkSu+eNRa7QDRsXvqoVr38=;
        b=LWbRuiOg4Orvt8OGvEjCgKYJ+SN9IvVWMPzxtX1pomrFyMN8IoC2OairjswLJJWDkq
         bhfjT+87OT0PYMGm7MKjfZFR9aGu5JyJ7IZO5wgQyh8PaBhE/Mqlf6Y7dg1bePFkqF6P
         AJK4yAkEC2qPaKhl8pQoheAQEDkkVUuCmTosZfBjpkdMXTr350JNFRlHcUZEBEBQEkkn
         pct6t0EL6JBh/8y8t7qRDU+kCXqCSoPMxVsDIP3BAwJW1YaawwtUVI1HFNUqVIGyC6G4
         BPidk/QCDW4n7lMCvq4Bqv2dzICBDZCR9lDFkqjLwcYoQnIBnTlpZaXdZxLsFrN8Eb+t
         HSIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779289771; x=1779894571;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jNa4hPs6+EpEb0GIRuEgBVkSu+eNRa7QDRsXvqoVr38=;
        b=pz5lhNt/qbiOMsblf0YNtB8bSETSCM9Z5OoYc6JHyU/zbkY5o1o2EWKH7nPAdPbb/7
         bxZOs6TesIpOE92eoQ8jxJXMLlKXswqogvxyWmmIZMvQ3hcbfsUx+mHG8KC021pGgOQq
         I6wpjN1xEj2hwSRi+TuI4QBJfX5/HxZ/zPtwHE87XBsUmd7/uPr1AfQmTeWq7K/W7/3F
         FI+9UHirmAauMvi/J/CBalxXlGe+BEOIW/rCI4J3PdA8hCx+sthPr3armKnTGIXox8nj
         J1refbebfRrABYKF5JV38euYBs3iHK2Z1gfBKAviRIBmm3Jm+xsqBJwGgqwVCTOpkPdn
         zrVg==
X-Forwarded-Encrypted: i=1; AFNElJ9bX9tai/QuhSDbslpJkRvChGB9wcAJXmSdpZYuoatRR+Jfrn/+szzsEXb8Dv38uo7IMYtKbbKHk4vQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+4fxbS368J0eJOQsJ6q5iPXkZjoDibXysgnUD5hBpiRTZobgp
	2fxEn9Le9BSP4Ij7H+2klmeD1zliUjGkcSl06JRJ4puYDECSaXjyS2tL
X-Gm-Gg: Acq92OH7P8RgxwKuP6R0Z8R8nAINstgJ8XeXTHjNIsVhP+eHLaF02L4Weer4pD8tQIt
	PZlMFURfiw1LKsvLN8Li64HKQweydV5RYSQJ1udPOJ/kZUScRQqYSkeMLOx/yWV6XD2mZYhrnCf
	IxAz04SL1V7duPte5//sp2ikNZu2zkp+htHbs6rwSH6eqFaG7nlfaXtkJLxOjkQUYiSpUmnRIxW
	TOyJZLJAUHedj82+Tx2SrxO5Y8X3Hq/MPbh1Rmw9kMVXVaZRYujQy7qZB7Q9DA89R70W//gSM/H
	1B4ZoY/dMLtuF4UPKYdCk1ZWu7mw1DVp+3xMcC4xctASju0mExvSqYG7T4dRbFeYJZbSLRb8h2D
	uTWUwF2xITinPC6wbTLGRBuZJefd0nqS5DZL1qsoGkePjx/VdCfMOCsv7r+qCm4UkoQh8OUXqRZ
	CmA4QH7kXo+lWZyysoWdc3UZLevAHQbzTbueJgGGpBmPCE94/zfGFL/zgse04VzTcvtFer3mAXF
	w==
X-Received: by 2002:a05:6000:2503:b0:43f:e43a:f4a6 with SMTP id ffacd0b85a97d-45e5c35e7bdmr39357421f8f.6.1779289770707;
        Wed, 20 May 2026 08:09:30 -0700 (PDT)
Received: from Ansuel-XPS24 (host-79-22-5-99.retail.telecomitalia.it. [79.22.5.99])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-45d9ec39806sm53639804f8f.9.2026.05.20.08.09.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 08:09:30 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Felix Fietkau <nbd@nbd.name>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org
Subject: [PATCH v8 1/5] dt-bindings: clock: airoha: Add PHY binding for Serdes port
Date: Wed, 20 May 2026 17:09:06 +0200
Message-ID: <20260520150912.11614-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260520150912.11614-1-ansuelsmth@gmail.com>
References: <20260520150912.11614-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add PHY cell property for Serdes port selection. Currently supported only
for Airoha AN7581 SoC, that support up to 4 Serdes port.

The Serdes port can support both PCIe, USB3 or Ethernet mode.

- PCIe1 Serdes can support PCIe or Ethernet mode.
- PCIe2 Serdes can support PCIe or Ethernet mode.
- USB1 Serdes can support USB3 or HSGMII mode.
- USB2 Serdes can support USB3 or PCIe mode.

Add bindings to permit correct reference of the Serdes ports in DT.
Values are just symbolic and enumerates the Serdes port with a specific
number for precise reference.

The available Serdes port can be selected following the dt-binding header
in [2].

[2] <include/dt-bindings/soc/airoha,scu-ssr.h>

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 .../devicetree/bindings/clock/airoha,en7523-scu.yaml  |  9 +++++++++
 include/dt-bindings/soc/airoha,scu-ssr.h              | 11 +++++++++++
 2 files changed, 20 insertions(+)
 create mode 100644 include/dt-bindings/soc/airoha,scu-ssr.h

diff --git a/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml b/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
index eb24a5687639..913ddc16182b 100644
--- a/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
+++ b/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
@@ -23,6 +23,7 @@ description: |
 
   All these identifiers can be found in:
   [1]: <include/dt-bindings/clock/en7523-clk.h>.
+  [2]: <include/dt-bindings/soc/airoha,scu-ssr.h>.
 
   The clocks are provided inside a system controller node.
 
@@ -50,6 +51,12 @@ properties:
     description: ID of the controller reset line
     const: 1
 
+  '#phy-cells':
+    description:
+      The first cell indicates the serdes phy number, see [2] for the
+      available serdes port.
+    const: 1
+
 required:
   - compatible
   - reg
@@ -65,6 +72,8 @@ allOf:
         reg:
           minItems: 2
 
+        '#phy-cells': false
+
   - if:
       properties:
         compatible:
diff --git a/include/dt-bindings/soc/airoha,scu-ssr.h b/include/dt-bindings/soc/airoha,scu-ssr.h
new file mode 100644
index 000000000000..33c64844ada3
--- /dev/null
+++ b/include/dt-bindings/soc/airoha,scu-ssr.h
@@ -0,0 +1,11 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+
+#ifndef __DT_BINDINGS_AIROHA_SCU_SSR_H
+#define __DT_BINDINGS_AIROHA_SCU_SSR_H
+
+#define AIROHA_SCU_SERDES_PCIE1		0
+#define AIROHA_SCU_SERDES_PCIE2		1
+#define AIROHA_SCU_SERDES_USB1		2
+#define AIROHA_SCU_SERDES_USB2		3
+
+#endif /* __DT_BINDINGS_AIROHA_SCU_SSR_H */
-- 
2.53.0

