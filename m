Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9046E360EC2
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 15:36:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779377819; cv=none; b=cvg894POmf9hJFLA6PA7FHex2b+AfCromeIdcg1psfMIA2LPOn0WtosUPJl4l1yqVuZJOaC6fPptWkyyv7Y+Ky4/YLXOLfneAcWgCSBoRcdx+EA02n7ehk7r+Jp0cAQhJVNYVJ5Pf6hhQeKRfG08IG+WYaWuurlo3owK01cN8qM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779377819; c=relaxed/simple;
	bh=FD8IvK1gXQx5wLqh2EUIHl/A6W3peoBLFvUS6imjxoU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lbd78IF03Z5qf7sxgi0IOWfeEElpgDbTLYTWgcF9XFhYITeO2dJXPfyOVNaL5gqxH2lL/9Z7Pa1zREEACg3gKZ3OE0fMFsZu9E+lzcyfZy4nhgMONv//Z5b+1PxCs7pHdwA39HiboUOnlOQPZik4fetEV8KN3tuxdqGUjX2yJU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=orLOn2EC; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="orLOn2EC"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4903d730b1fso5121375e9.2
        for <devicetree@vger.kernel.org>; Thu, 21 May 2026 08:36:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779377816; x=1779982616; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=atavLJO9ib3dVO9oXs0ZfRhlR41n5og9pxT0XRvm9dc=;
        b=orLOn2ECKDOEFtB6WvL4t+HhrcdY49Z5P0pZIVwla/5GYUOYJWYjUNbm+nNqoJVPKs
         mfsoOzAs7MKUYxZzgs8+t+YVxmD7nYXbRloKM4IkYYsF3OfYqlUcVvBC2oxKixw2UpHp
         Y7t/W9qGFqfvYONlm+AMHfLPeTwP7kuqdbvEboZLuHgMquVxhQXZ3NhhMQt7FFMnHhMT
         BNGaaVYTsgk0+FZftShpBaAbM+H/oZ0t1DEAMYDiNWVvdi4xjG6uyhV2Yo2cxB0gkn12
         uPVXUBOJ5heeoUPzHbY7Gv8xe0wt1HRn+cfe0QxeeCwwhkR0AkGm7owEWN5rPEHsHf5W
         P+Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779377816; x=1779982616;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=atavLJO9ib3dVO9oXs0ZfRhlR41n5og9pxT0XRvm9dc=;
        b=g0T90ucpOa+JiacaZCUozmgq0o0tEHMdhRzph4BHw5/6O5xLnIhugMiSg6AjH7B/Wk
         AE++PaIVXOJOeVbfmN26WnanOP8NJ+tR+ijReFJ6qu+eGThWK2kfJinryDELhjwP7stn
         iavvLLnPlsVP7aT8vHANl7YTTVnuK/tgwF+D37ouSrNZCtPQtE7prr0wfNrr6Q6P7jI1
         aErTcnhIwYKMjAA2nflKK8HLoiYBZhImzerKyVT4grWQ8BA0bWUmgihM/ER6mfZXZr5Y
         LDiGKsGgV5W6FIvEUZqz/iO76dv0aoy4qo27HqMqWqcKaB+lu/cFrDZyJ7on95PgXwdA
         b0BA==
X-Forwarded-Encrypted: i=1; AFNElJ8vObTQAZyf70NTiN+wW8qp9wfqy8SAVz4C6rO0OWdB5pdb+Foi9jcgwOGiIvGX/0/NSPJNlxZ8LSLD@vger.kernel.org
X-Gm-Message-State: AOJu0YwB81aCiLR8Jwn1jFaO5H3Z05DmGuOCNlUXTICQFgB3WmOHrDG2
	+t0l8g1dFsRH3AS0SkbwLkcuBzTjJM3pp/2a7nIvS2JbtwvVYtcNNvYk
X-Gm-Gg: Acq92OEwXw0DH4ZkSnivM4pabMUUJ4O/yl19OkupDEb6kKA18Q/vO7orxrlcq4UYVBH
	L1M8QuQOnxUWJkUDKSOCito0uMs+LZeHYCR12Ede7D2kyBAKabRbo6fOXyp3YlblXClwlH3RmTH
	kremyKf0kZ90/NqP7OTo3HwN6Ivu3p3Qo4OwaY1qj89+Fc22sv/0sxt/GFl+Rsg0J7p+TniwjKZ
	Xyh/f7kLsFK4/mW8OfYdPd81waIFCcbijelFqSYg7/oFcU7/RvxPww+WIweyQ2YuZnOWdH4XHYS
	ZScVhA8fSvuYi8Yjmu1eHB9FC0JzZ/qqg18WSeTltmqvaxU7vtKV71qKS+kWDEz1VRqWPKmjUC9
	vY+gLuuIiBTkqn6NqWBE1eUNiztR/jPvnWhjRmFuo2LZNtuWpO743zbDI2idweaPacHpe5hfiW0
	gUMZM/HToI7+ryCEn4wt9gt7G+ZGPqtRRtVOdpiFvd21MXPfc6u++ricesQ9/vQy8=
X-Received: by 2002:a05:600c:470e:b0:490:3ec9:8711 with SMTP id 5b1f17b1804b1-4903ec98789mr14784095e9.18.1779377815576;
        Thu, 21 May 2026 08:36:55 -0700 (PDT)
Received: from Ansuel-XPS24 (host-79-22-5-99.retail.telecomitalia.it. [79.22.5.99])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49033d9edcbsm79159825e9.13.2026.05.21.08.36.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 08:36:54 -0700 (PDT)
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v9 1/5] dt-bindings: clock: airoha: Add PHY binding for Serdes port
Date: Thu, 21 May 2026 17:35:52 +0200
Message-ID: <20260521153645.7028-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260521153645.7028-1-ansuelsmth@gmail.com>
References: <20260521153645.7028-1-ansuelsmth@gmail.com>
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
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
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

