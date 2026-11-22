Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795369128;
	b=BmprGioIlJuYDAM0OEgG4FAvuCcUNa0BHc62G1Yzj56YA/vH5a5EuGLVmVRC1rhlmx/X
	 AtiCdPnOWvFZtip/JCua2in4z98EymQxBuHqUwdLzMDJ5FhyfDGDZbkMySGvpUr4mIuZT
	 joEKxkkrkXY6dtOBCvo6FyWKsYu9ZVI06TpVTmygFx+yx+wxpnxnja7W5lN3FD1KBlMh4
	 XvQjsUsOuytJMW2so3bIWMFGZu5bHMwOQOYO8FcMQ+FLr6gI09Wz4YVyyz6qVuTCELZhy
	 b2/DtSuksQBixv1YAqJR1IqrTtV3i8pWcKBMobkTeEjn6vpVD7vL+tktWw2W8CHbsMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795369128;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=YtPpwqT0RY3R6ujRgb/ym5DFrcjRWn/+cm9aN5vCi9Q=;
	b=V1lrru6slhHeXxVhPJqJ6bBQBZbVD4GsYNaNDCssyi2MJxileQNrjq6a+k+IOqp6cY4s
	 /Pgg7Nas57DKWYnbGelIz7PLAECpFSXgRnS0jbrVGTWk0fQj0KFfyxW86aZvCx/VmRMD1
	 5J9aBp+Q1eaZqwJVTUDjGE5GbAUm0YMYd64pSoAHe5eNdt5mVhN0sd2Y7Z2IP5/B3VxVd
	 2lSbpQxPlup6WgycT4E9ocmPdw5uCnLmJmSmVX6+e5ZnExMuQACC3MnN6hhlTR/nUesxV
	 UoIs4XRDm86qvr4iiXbus+HBephMWxBICJ6QvkpDE4Vt6cnD9f5c9bO/ISe0FS1j6kw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tTwHHvqY;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 705D6606A339
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 17:38:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 705D6606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tTwHHvqY
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-386ab9ab619so789243eec.1
        for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 09:38:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795369127; x=1795973927; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YtPpwqT0RY3R6ujRgb/ym5DFrcjRWn/+cm9aN5vCi9Q=;
        b=tTwHHvqYfjW/n++ndPB2P73YVBQbaAa//aYE0JB318M9ob2t7dFR7gpne9VJ61e/RN
         pBniat9w7WF/ij0iWB1h8EtHcLHHSHFDH2w+2CTv8Xkjltvv+aRlAf3+IDRSCb1mP2hV
         49BxUOle+04/PiNpSNaaDahhPL8vjcOBbJs9buq9AvGdjA7rqRJdRHqYvC3pzELP561i
         XgOr9XwKthBT8H1LZEnKcd35DE1r0PK2T7luqeRQ8Oi8bQLqq4ChqQlloLAdMYBD66gF
         M48x3w3QcUjTYcmGKrZwTBEKQ/NLCWOEVrsdrCy7TTDvIhkOXAjDSkNfjMKTTm+XSD5t
         YX0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795369127; x=1795973927;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YtPpwqT0RY3R6ujRgb/ym5DFrcjRWn/+cm9aN5vCi9Q=;
        b=trGqQc2UDeN6WBYLo9AxvDdqKbEGiaIuYYsuK7Qt7++1g3+ldhzweCCJqjhFAOdDAm
         X+sNc9jYHnyl/PGHMqtSPjqey8yvHg4PLtJ8CtVWip6dV6pYvgwXw252NMIUUFplJSvA
         8yMtEyVRuRIY36UlATM6+i/VSKYpXNi3k5c3I7EA/vX8njMOIv2Ubxf28jOtAwB0NFkQ
         FLo3BKYluLTHZtu6ASXTxfDZH+CIqMD0B+P7kJlhPI8no/AC6tE3CAXM8bBk3imnULMo
         3bgALpp2aetiyackD/Kda3AbnjjWxQSJ/m1WxpKSo/0UmSamHMGiwB3/vOhKdRV2A8Ro
         c15Q==
X-Forwarded-Encrypted: i=1; AL+hErFfjkUnX9jciuKofaLrll70hYo4ePlUufw+ayMqFXaVgNJH7amY9qyNfwLc8fA2KwP05PQBciIdv7mi@vger.kernel.org
X-Gm-Message-State: APuU4Z8E4WvAfSlLwoe37MwXVc20ZyDVgD/6EpPBokitTPo4wModNq/s
	AMthwVPxkBfAmbMFX+/d7g9FKlIfEO1l/hfyodHiBgGhUdEdUtorC8vo
X-Gm-Gg: AZFdTZfMrstH7ucDfLK181xaOrvJ5hGkDBMeEFaLcYs9ntf0RqMI1BaiszEeGSS6Ai0
	b7olzq269UO9BBk+nkMDdYJPkmJcyFKXzFqXe+EsG3Bgl3ZlDdXpnoVPZaNgMKRDCOWdSJaPAjx
	RMBrnz/FsvtX8Rnzw0x6fKmwJkDP/u+7rYvP+af3aakXCK+Z+JHBSVNJs+H3Gg0LdZIQFHJyciL
	3Fw3hnSU+sLhzgbJ6UhOmIjpv1flA+Q4jMSKOREWTtR903AbirW6qeyhf5cyL500GFzEND+pWBG
	NAXZkiKucBF/oRVoxhwi9sSVS+rmdWEUG3PEFOhW4MAFi+ZgDs3+ehpfQsZ4nLu1giLhV5K4yxE
	Okg405M3OkCkBOhT+woaGKEAq4Psmx/GemuJfTx2Oo77bXMMZux/pWZKOZd+SkKtXn0pMTYPUrf
	66/dplc/kWwA2LKhISoxHUfWEJNftoDltwkTGk/3IYLXSsQpWDI51GX0EtZdXmdOYZYpC2KycSK
	VIMsHzxC96giTHZIPPdKSbdNXDAWSUOZGtU5NviWC2CUQEuuzCOnnLD6JLgLQQNKsfUwzkEZVNe
	bFkS8W/P7VSO1eNXuxUuTeoPC3WtO7JhEPxAGrapxyBHjyCAZw==
X-Received: by 2002:a05:7301:2e30:b0:376:19bd:2af9 with SMTP id 5a478bee46e88-3856c2c4a0dmr11040411eec.5.1795369126430;
        Sun, 22 Nov 2026 09:38:46 -0800 (PST)
Received: from duge-G3-3500.taila331c7.ts.net ([138.199.21.246])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566cd4efesm29097985eec.12.2026.11.22.09.38.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 09:38:46 -0800 (PST)
From: Jiayu Du <duge1256@gmail.com>
To: srini@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dlan@kernel.org,
	troy.mitchell@linux.spacemit.com,
	me@ziyao.cc,
	aurelien@aurel32.net,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	p.zabel@pengutronix.de,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jiayu Du <duge1256@gmail.com>
Subject: [PATCH v3 1/3] dt-bindings: nvmem: Add SpacemiT K3 eFuse controller
Date: Mon, 23 Nov 2026 01:38:08 +0800
Message-ID: <20261122173810.2409146-2-duge1256@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261122173810.2409146-1-duge1256@gmail.com>
References: <20261122173810.2409146-1-duge1256@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Describe the SpacemiT K3 eFuse controller, its clock and reset, and the
bank-based NVMEM layout. Banks 0 and 7 provide configuration and
temperature calibration data.

Signed-off-by: Jiayu Du <duge1256@gmail.com>
---
Conor's Acked-by from v1 is not carried over because this version changes
the NVMEM address layout described by the binding.

 .../bindings/nvmem/spacemit,k3-efuse.yaml     | 63 +++++++++++++++++++
 MAINTAINERS                                   |  5 ++
 2 files changed, 68 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/nvmem/spacemit,k3-efuse.yaml

diff --git a/Documentation/devicetree/bindings/nvmem/spacemit,k3-efuse.yaml b/Documentation/devicetree/bindings/nvmem/spacemit,k3-efuse.yaml
new file mode 100644
index 000000000000..a7c27ed1e3d3
--- /dev/null
+++ b/Documentation/devicetree/bindings/nvmem/spacemit,k3-efuse.yaml
@@ -0,0 +1,63 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/nvmem/spacemit,k3-efuse.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: SpacemiT K3 eFuse controller
+
+maintainers:
+  - Jiayu Du <duge1256@gmail.com>
+
+description:
+  The K3 eFuse contains 16 banks of 32 bytes. NVMEM uses little-endian data
+  and places bank N at offset N * 32 bytes. Read access is limited to
+  banks 0 and 7.
+
+allOf:
+  - $ref: nvmem.yaml#
+
+properties:
+  compatible:
+    const: spacemit,k3-efuse
+
+  reg:
+    maxItems: 1
+    description: The 0x400-byte eFuse controller register block.
+
+  clocks:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - resets
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/spacemit,k3-clocks.h>
+    #include <dt-bindings/reset/spacemit,k3-resets.h>
+
+    efuse@f0702800 {
+        compatible = "spacemit,k3-efuse";
+        reg = <0xf0702800 0x400>;
+        clocks = <&syscon_apmu CLK_APMU_AES_WTM>;
+        resets = <&syscon_apmu RESET_APMU_AES_WTM>;
+
+        nvmem-layout {
+            compatible = "fixed-layout";
+            #address-cells = <1>;
+            #size-cells = <1>;
+
+            temperature-trim@ea {
+                reg = <0xea 0x2>;
+                bits = <4 8>;
+            };
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 46c416cadacd..0a9eb764ffee 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -26525,6 +26525,11 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/sound/spacemit,k1-i2s.yaml
 F:	sound/soc/spacemit/k1_i2s.c
 
+SPACEMIT K3 EFUSE DRIVER
+M:	Jiayu Du <duge1256@gmail.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/nvmem/spacemit,k3-efuse.yaml
+
 SPACEMIT RESET CONTROLLER DRIVER
 M:	Guodong Xu <docular.xu@gmail.com>
 L:	linux-riscv@lists.infradead.org
-- 
2.43.0

