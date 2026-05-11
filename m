Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBF7E3FA5D0
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 13:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778507858; cv=none; b=Q2CVQuQUceMnuU1brLaw8h3TwwTJwLdkZZljcegvz92iYo2SfI5nX2aJPoPZ7YQ7c2mphWoE2eA4WrCuVLJRptZ8wkQ/neU4eYsntKbwARBPTj/Q8aq6bA9A4z4v0mWa/jNLGh7mNqFOosOWHetO0Z5Io9cCeEXaGIGkPev2fhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778507858; c=relaxed/simple;
	bh=UGnwnynsk6MCY6H8VDntAGqr8yOAgR5+RJ5mxZdLHZM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=o36F3SMq64XhwOsmtI9SVtud8hUwykSX43M0GNiYOwQ9NL2ZrHb9wTgsZE+S4ZCddtk8r83AG6aWJ0PEl0HLCQP+Cj14r7aU8WCmqGSrnNkVs1CJAPusZqR1GMyxK8ED+ulv+ea+y4Q53qVgYb7oHnF2sg9sM9hb2CMzNiZrxhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R9/+y0hs; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R9/+y0hs"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-67b6a6bd7b8so8987051a12.0
        for <devicetree@vger.kernel.org>; Mon, 11 May 2026 06:57:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778507849; x=1779112649; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WdX1Hn1whpHFxpnqtCP4cLwf/y3NxkK7GqmkakB9h2s=;
        b=R9/+y0hsEtFzQUpXgRzvAmmYxgz7ExkZm8O+9rT+NpyAQ+/o3KRP0XrYpX2R1BaRiD
         dCsIcCGAD2D5hCQtE8KM9A/7Gt+9IGEXFkHeOUdWfAEYp/pQR4+rSDaaE4FUMuFxQ+8h
         J600jYbyV3MjK/A5N53AEdRGi78N+3Z/KdK05SqBtl0gEnxxeVEQb7vX1y+9qI8w705L
         j+333xmAqAkVuIziNy4BOtLC+ykB50F9jwqVWcuxUa6Ua/HUBKL4yygjUJPUekW5esJS
         3haLAUCso3T0lB21StROK8z7cdSHI1Fd+lGnLQXbuA3RuBXWggRxuaSz3K7cCz7V5lFh
         SoxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778507849; x=1779112649;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WdX1Hn1whpHFxpnqtCP4cLwf/y3NxkK7GqmkakB9h2s=;
        b=EEqe7AEdERVvI33R7W7ZEls5Wgm5/DsJW7PvTClbTqEualCPs1IKnoiTcvJrOyIs6i
         6SxHhSV39Xtg3f402gToUVuBAQlKi2Tx+VPWtAUTdbhRr27Jtelrm4uB1glc1u4Xb4Sv
         vzKMDT4toqsnyJ/EKSnoREGgdTP149TesLxJcPfAYdWLbwRCZbxm8jHLl42eiH+0dKcB
         bZtm/y2Mwx+w7cTawozZQmtGmuAgEmMmc3CqJFuTq+XhC+pxEFHcWSys9tTPHuHUS9x5
         wPbYRLpE2DEToHjjYgAfeSQ5K8y9HPkaiNh1rdKRGLrkYjxjDT/ykRAV6ZOiZHunl3Sa
         wI1w==
X-Forwarded-Encrypted: i=1; AFNElJ8uCufdT4nc+RhHyoKD9CJlL6gmR8eI03JQiTpI6d7OLltPkk8r7RXvV9YUoLP0pRpu2vlt9eBRkArc@vger.kernel.org
X-Gm-Message-State: AOJu0YxqZKbZvmdQQqh90xlAiXEcQ5WV56SFgSgQrSUymgC+T6G+iRog
	klbA3Gjs9goZVbKDyMkee6aRyEPuOEfw52F3/SdigckJY3HjB1NL3Hk0
X-Gm-Gg: Acq92OFdZEL23aMRJdVSmlO+JkE7UT1vQMhBZY4bUgKHqTE+cv4jbOw5nF7lHfbK5ZU
	dMWjqyocwz7kt3VdPe8bDZC6Po14ZfA0gNRtgMHVxHbTVggTVaiJ+41MqOeGELBIGmwLFPqm5+Y
	3MBhucGiQvtRNmbx9BATPwZNwMIDKs/FesFn5dCTaQbcCQCnomkbV2Ln3F6mRsxme4bB+GfkmOu
	35vSqJghhUlvNkaO+FLBp9rkjcv/gLk6elyeVN8YvyY33m6f7Cc0/ex6ovJ0u620o9y1yP3D9fP
	K/Nl3097pnV3jmxWkk24DHgyy/YK77IJrZw9nMGnAAyB9BKt5KG04y122uCX/aCf5pS9gNv8daA
	YWtdLkku4h1IKewjJhhAEy93QKOuPZhDcujE4GeMyvuM3S4lp6M49QUaM12nxpq6zPPfE3fg7Zv
	51RuWx47z43+aXr/rLtJL3Slc=
X-Received: by 2002:a05:6402:4506:b0:670:d548:62a1 with SMTP id 4fb4d7f45d1cf-67e0ddef87amr8352750a12.3.1778507849153;
        Mon, 11 May 2026 06:57:29 -0700 (PDT)
Received: from xeon ([188.163.112.56])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-67ef0b3b904sm3685357a12.1.2026.05.11.06.57.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 06:57:27 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Peter Chen <peter.chen@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-tegra@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v1 3/6] dt-bindings: net: Document Infineon/Intel XMM6260 modem
Date: Mon, 11 May 2026 16:56:58 +0300
Message-ID: <20260511135703.62470-4-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260511135703.62470-1-clamor95@gmail.com>
References: <20260511135703.62470-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Describe the Infineon/Intel XMM6260, a 3G-focused, slim modem platform
designed for smartphones, data cards, and Machine-to-Machine (M2M)
applications.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../bindings/net/infineon,xmm6260.yaml        | 72 +++++++++++++++++++
 1 file changed, 72 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/infineon,xmm6260.yaml

diff --git a/Documentation/devicetree/bindings/net/infineon,xmm6260.yaml b/Documentation/devicetree/bindings/net/infineon,xmm6260.yaml
new file mode 100644
index 000000000000..d34d7125274f
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/infineon,xmm6260.yaml
@@ -0,0 +1,72 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/infineon,xmm6260.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Infineon/Intel XMM6260 embedded USB modem
+
+description:
+  The Infineon/Intel XMM6260 is a 3G-focused, slim modem platform designed
+  for smartphones, data cards, and Machine-to-Machine (M2M) applications.
+  The modem is usually connected via the application processor's USB line
+  in HSIC mode; however, to work properly, the modem must control this line
+
+maintainers:
+  - Svyatoslav Ryhel <clamor95@gmail.com>
+
+properties:
+  compatible:
+    const: infineon,xmm6260
+
+  interrupts:
+    maxItems: 1
+
+  enable-gpios:
+    description: GPIO connected to the ON1 pin
+    maxItems: 1
+
+  reset-gpios:
+    description: GPIO connected to the RESET_PWRDWN_N pin
+    maxItems: 1
+
+  ap-wake-gpios:
+    description: GPIO connected to the EINT3 pin
+    maxItems: 1
+
+  cp-wake-gpios:
+    description: GPIO connected to the EINT2 pin
+    maxItems: 1
+
+  phys:
+    maxItems: 1
+
+  vbat-supply:
+    description: Supply connected to the VBAT lines.
+
+required:
+  - compatible
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    modem {
+        compatible = "infineon,xmm6260";
+
+        interrupt-parent = <&gpio>;
+        interrupts = <168 IRQ_TYPE_EDGE_BOTH>;
+
+        enable-gpios = <&gpio 112 GPIO_ACTIVE_HIGH>;
+        reset-gpios = <&gpio 169 GPIO_ACTIVE_LOW>;
+
+        cp-wake-gpios = <&gpio 151 GPIO_ACTIVE_HIGH>;
+        ap-wake-gpios = <&gpio 168 GPIO_ACTIVE_HIGH>;
+
+        phys = <&xmm6260_phy>;
+        vbat-supply = <&vdd_3v3_vbat>;
+    };
-- 
2.51.0

