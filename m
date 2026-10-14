Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8676A48A8AC
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 07:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791962593; cv=none; b=iwxhfaaRXSiXnRz9NxhuDYMsQQPv25BQ1xA5yxk+XkfNJqFKWhewzo9Jl+2WoVyl7pcnXkaMa7HJx8C4gEviGGy8B0yJi5qcXptYgyF2qRaVSkuTzrijO2jlaG9ThRoagSxIoDGQ/V0p3o2xFDryYKMo/QsT+X2LyAtVYS5bO9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791962593; c=relaxed/simple;
	bh=E3PFYMvecW3iHYbCYGdAhKiumjMtP9bvopg4I7rWNEQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CakWhLmtF9d9ljuhcH80VwaB10neKfyve4VKO0MnDrGQX5UVvDWCkxUeurcD09BTci2WARfzbWgKWwSTCa9cztDJ2ugBs0o7EQR3A3ROjhfeOlcLGQKJK/lZBHZHeAKktLu7qEc59OhzJuV3UOn2kUMUqwCtEYND6UnOoKiTA3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cmzHGBKh; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cmzHGBKh"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a1698ea378so30864565e9.2
        for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 00:23:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791962587; x=1792567387; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eUGfe7wFqlQiSC0eGjj4e04EQS1TgsUFwNMlSY0cEig=;
        b=cmzHGBKhOZ/CvQR98dIKCZ6HUGtRJWrYaKPYCdWuVPQpveDqXJByPR8RQkM3Vh3Dfm
         69nchZcMCDuVeoRQd2+sNi3YbrB1CGnqDvWEZg3oQLv6LEhEp/bmT7fiBpNCDIjefeev
         UgFJgM/BaQZ0MMLHqVx8JAJp86O5UV33HiGLBY7eYsjRfeWKCfk8lrRRX1xhvJIA+ifW
         QYL9Np+spKgZ2vblTblxEKXiGLmvuKLF3UtfrgC8hXq8r5FKBphTjKVMJpes+BPg8dQm
         KtTV3gp66h8qKwQaISzlFoR+L5ZxOrtAW5sm4GNFo5epxPeJTWNDzUUNQanhR3TmW08N
         zwMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791962587; x=1792567387;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eUGfe7wFqlQiSC0eGjj4e04EQS1TgsUFwNMlSY0cEig=;
        b=XKWTaX0YfYqpW6FFqn9IUPUGMSwWW8RGHMzcbTVjfv1m4D/cE3NRT04OK98v/1hcWK
         AQkCNhsfWs8bfOPldMcN9GgQN5Bn2lZCLwLQZmLUKnVde/wCQJLTSUt/McMXeV38jhWP
         D4hax4BiK/Ak+MlnVZySrixSpOPBPEfmhwO3arbvotp5sfUBUhZ5FP/YMQ1CXemSqhC4
         jBJ8e0YM+VhB/9e8wCb9eqatZeIViuUWsBnzB5gNtUXuhpWDOkCXGs4tF8paLvisTS7p
         AsawTjFjfv9btIS4Uj21jjRFm11SUWgD3A3BuZ3uX0AhIvRxRHjuUAEGbCdMEyH5EPDg
         Bjdw==
X-Forwarded-Encrypted: i=1; AKwUvBwSeUG9Hq/rjp6rMnsk6bb9DcBwBat4c0ek807KXCPDP9mqX6iDMoXuJCnCfD90bBEVtW59em5POsee@vger.kernel.org
X-Gm-Message-State: AFq9FYIjTcb06A8Dh7WN7bazmF5txB2gUC3Zym4X3+Gp5kYzJiveTpZ1
	vBXGtvTJiLf8yyULK87NcOZcR6QNirue8H9BTq2Ig6ZVMoOaXGeQyZoK
X-Gm-Gg: AYBFou2L5oW3BVJFnpUi7qcjKz1PJStgPSu+AJd7h1xjtsSov4rArosTF24q2/Jg0aO
	TNrek1Sk4rGuZHklEkcudcSR7ag+xs20/zR2++EivJZyk6nQ7QzZMxwcTqvOOx+TzhIixZwl27z
	jWr0pZYX9kzREwPJOxpNySvkYMXdUHXMTHKpZ8gtt8qrmiVzIC8j2lEpAAtmvM39umqAp5bVo15
	ix9OZOAQe7IVJhlkLleinVZPDED88c1e1uhkNvFrk18Y7M/KsImF5A2R+tf9f/Kp7TIAZDM8/1P
	fdovR7OVi9Bd0Loeg9Z45sfi8g0p95YLDdnEQXhorHegNgBwjMrE7WZtHz4NqGAfWyH+DXFkpR3
	/y8j9LfZ0PWCeYLX1bHqYnjOiacPI1Nr9Jpzhl65ALXZs2j8TGk42aT2eDrB/1UCgzEOIrqlJ6V
	YTjkS7kFLyY4Jj3N3oUOTykL+b3gOlf4uNLBy9BC5mmPOFTtdAfGI4HQujLlVtafZWv2GONtF5L
	Lx9F6z7N3X8p4ykYMVWbad9eh4OWBkHl2rQYR4fCrpG+2BtFat8eIO+OlTjSEhiCMgoi8n/7F8a
	n/oW351p1vYA8dZaqnTyQpWjoiS7saUfps/B9hVTSD4WDXYtGW2Ag3+T9Oaa43vkkzU+XZMN
X-Received: by 2002:a05:600c:1c07:b0:4a1:b044:9ccd with SMTP id 5b1f17b1804b1-4a1b0449d00mr79484415e9.28.1791962587425;
        Wed, 14 Oct 2026 00:23:07 -0700 (PDT)
Received: from navid-pc ([2a01:4b00:a856:6220::a11])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de3f7f8b8sm8500933f8f.35.2026.10.14.00.23.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 00:23:07 -0700 (PDT)
From: Navid Ghahremani <ghahramani.navid@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: arnd@arndb.de,
	stefandoesinger@gmail.com,
	krzk@kernel.org,
	Navid Ghahremani <ghahramani.navid@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 14/24] dt-bindings: net: Add ZTE ZX279128S MDIO controller
Date: Wed, 14 Oct 2026 08:20:54 +0100
Message-ID: <20261014072109.1759502-15-ghahramani.navid@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261014072109.1759502-1-ghahramani.navid@gmail.com>
References: <20261014072109.1759502-1-ghahramani.navid@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Describe the MDIO register block and its work/register clocks. External-
PHY pin selections use pinctrl rather than direct syscon writes.

Signed-off-by: Navid Ghahremani <ghahramani.navid@gmail.com>
---
 .../bindings/net/zte,zx279128s-mdio.yaml      | 65 +++++++++++++++++++
 1 file changed, 65 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/zte,zx279128s-mdio.yaml

diff --git a/Documentation/devicetree/bindings/net/zte,zx279128s-mdio.yaml b/Documentation/devicetree/bindings/net/zte,zx279128s-mdio.yaml
new file mode 100644
index 0000000000..fb12414ab3
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/zte,zx279128s-mdio.yaml
@@ -0,0 +1,65 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/zte,zx279128s-mdio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ZTE zx279128s MDIO controller
+
+maintainers:
+  - Navid Ghahremani <ghahramani.navid@gmail.com>
+
+description:
+  The MDIO controller of the ZTE zx279128s reaches the PHYs of the integrated
+  switch and an optional external PHY. On boards with an external PHY, the
+  default pin state connects the interface to it.
+
+allOf:
+  - $ref: mdio.yaml#
+
+properties:
+  compatible:
+    const: zte,zx279128s-mdio
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: work clock, the source of the management clock (MDC)
+      - description: register (APB) clock
+
+  clock-names:
+    items:
+      - const: wclk
+      - const: pclk
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/zte,zx279128s-crm.h>
+
+    mdio@9a101000 {
+        compatible = "zte,zx279128s-mdio";
+        reg = <0x9a101000 0x18>;
+        clocks = <&lsp1crpm ZX279128S_LSP1_MDIO_WCLK>,
+                 <&lsp1crpm ZX279128S_LSP1_MDIO_PCLK>;
+        clock-names = "wclk", "pclk";
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        ethernet-phy@8 {
+            reg = <8>;
+        };
+
+        ethernet-phy@a {
+            reg = <10>;
+        };
+    };
-- 
2.55.0

