Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793945226;
	b=0tJDMLR188Yd4LHIlj4eQAhst+GiilPuaYeBJHv4E6pPub4FsYWBZsgW6qjg4JDRCPO3
	 utkaNbbDOiODJN0Kbog2v8JzQB21qXP1ncT8n3A+S3bjOhcVYZm28xF8Kwb42HgCWtIzA
	 lOb4EcqGAF0SBVW0MvCUAYDW59Hnur7oXsy2ujSNUKO15vSLK/daTr+VkZvM1IU1GiuAZ
	 ZvI3DZPe9yBvyI+I2y9eOZ6RQYoEHwrYE7I7q6Nrh9aorTN6xtoGm9ZiVyZGYYWEglLn/
	 vgdEad2zrbVg4cs62tFjA8kvxyOJFQkLcvmvcWeDrFA5jdKGzSv5Rf0m4R3ND3L9Y9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793945226;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ELq0ou+C6nHSxjAqQFysu+9NjstawTtJSoslQjowt8M=;
	b=jQEva2xXFkpNN6zFB+XeAF0idVIXo6oOD72AFcgzq9s8lrZhVBbxpDafMdXNcymjc1xy
	 CHFbupXD76uCRV23EjCnxGbfJsycS2l+060taaQ9ai5d0IMmSOMT96LUgI3vT7wyGMu3K
	 33hMMXYpRk+xl+eJetP4H+Y8U32at8zfdPvGyl5XddR3M0YyzB/+uNPc2P+bPN6hAOIcj
	 WJ5p8muaMrA+Rb/wA/OBFh/d9uc8SwJGXyqGvpmP86YbQi2Gdp1BidvWVTMl0nTKxlucG
	 i/lJVA31OS7iWY7yrA32a+UQgm1tgm30knamomWXu90zqj6XjknOjDcMGNb9IQtO6Ug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WcxFWBHr;
	arc=none smtp.remote-ip=74.125.82.51
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFC8A606A328
	for <devicetree@vger.kernel.org>; Fri,  6 Nov 2026 06:07:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BFC8A606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WcxFWBHr
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-1a2761c69fbso802784c88.0
        for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 22:07:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793945225; x=1794550025; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ELq0ou+C6nHSxjAqQFysu+9NjstawTtJSoslQjowt8M=;
        b=WcxFWBHr+4j2KzHRC3TLQJ1w39AeH4QSSkQPUUOtOS4x2x7RfijiQ+SUzmHYvHzZzW
         DthpCGRCyGbQWAV/SzLZivyErV2R61UYLYU3U35rsnbG4+ZJtr2bbrzRGOXUFCLIGK7P
         FBCVDTk5U4M9DQPfvt4aE+PhtwMiBXCdzR028rbsU+47R/OBFAsVtJhyBBDtZVJB39xv
         d6ehxZ49QMLWRzXgycQudNu4ZEtYT60NSIHZWfCifeNsdbKDUHg/+znx4EqO9BYWXVrB
         f7d5gRlx8gkbv22oZV4uBKOtJXzqKRmkDADzjyTVtbx4TbFM3QHSZ8oLhVapgWddGkM8
         li4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793945225; x=1794550025;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ELq0ou+C6nHSxjAqQFysu+9NjstawTtJSoslQjowt8M=;
        b=DODhU9IKeHbh2woc6LbXvQqtdY6GjWNIdR5GLod3q6Js/2m+64pK2LeDaINFSkMkGM
         kPtJRCtLtkYFhjdGKDrYf6hKcU9F3azRTHEHioyyamKAVCH4TssQh0UHzv1hF5q2+Uyu
         DsaFeIIf1R6iCElJ99yr84P+OnWEEVI/PWsxQwhokxeDyuDDebU78o9yFbe++fMuYrLp
         tKh2Z1ZWU+3ADQqsj3BEc8VzaLD35aPAUVgmoSQoqPxQCRznG7eHb3ee/D1oWFgGSCIr
         QgZqj2HJ1HLUurhmcRT4R8YJCnlmnpIkFuK4ZHbfl7BxbHzimMRcqJ5k4NPcDEgPzhPE
         7jAw==
X-Forwarded-Encrypted: i=1; AKwUvBzbZeDe4D1qdu4mrDgrFwDg0Tz7pwkwNLdAHwPebYg7OE8KW2zzWJCqUOmsEIZoVq2J13lAMAmzLroX@vger.kernel.org
X-Gm-Message-State: APuU4Z9OM4RR5Ij0inegphMIKXPki9z2T/dhrebo0DxRF5kuKFc0tg81
	E6tRo4/iGCDv5AB4wy2qpHTFAR9VrGuCPju22czboS9VeW9L8ZsCrvjl+s+EQZJDJh3faQ==
X-Gm-Gg: AYBFou3jdjG8v038TAC3IwhUeMdTHAn9Sp5PpJuCinsuRT05NhMltTDaQsjSuNGrupc
	qbodjDBbNRtcH5+lDQAnSZUt3ZYcbaOUr+eE+AMBk9I4L/QJXRgK3BK/P+qGsMflyd9v4BYRKjo
	YnbaZhy+6yA4o+ci+UBoCV2AY6pP5pG1vGCV8RqeA8+imzPCXsMS8TRb6FxlzqL6/NVsMk3BIYR
	/5DQ7skUTzEBFRHy97AU357upKXORTcbx1K+t1rfre/XTev2UEc1ihoVgXmiEmwjM9DRFyHWcAJ
	nxvrpDsDMTuOhw+ohCsT/qk9e0x4RIJL2LGLO+tleWqA/X0GdLBE1flz9p7H4GeRBjMlfrzpN+0
	H50vcvydpR8MIFuPartYwrfHn+D3z5r1C79qRRWCG0cwii7M4aszJ/DhY9XMBaEagi1Ldy6tPa1
	UD1lMVSujFktSEDIfM9S7P7i/ZVxoaMTQb36HBfsoquwckyeCiDlfHxoqU7YbvkrUNz8Xs0UuSW
	sGGN/TEMMKcH3DuHC6GcHTeIACYB+1AlJU//82iqy5RYyWegvhQoNjg4QSIYyuW97i+vUzQOHBW
	/d5GXLWc27mcdzek5DVY7Cycml5wuMmcKF4Te3QUPL9uBgYzFjt6
X-Received: by 2002:a05:701b:450e:10b0:195:c6c2:c6b with SMTP id a92af1059eb24-1b25d35462bmr1797486c88.35.1793945224722;
        Thu, 05 Nov 2026 22:07:04 -0800 (PST)
Received: from duge-G3-3500.taila331c7.ts.net ([183.192.220.13])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b25e4e079esm2780992c88.19.2026.11.05.22.06.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 22:07:04 -0800 (PST)
From: Jiayu Du <duge1256@gmail.com>
To: srini@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dlan@kernel.org,
	troy.mitchell@linux.spacemit.com,
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
Subject: [PATCH 1/3] dt-bindings: nvmem: Add SpacemiT K3 eFuse controller
Date: Fri,  6 Nov 2026 14:05:23 +0800
Message-ID: <20261106060525.346873-2-duge1256@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261106060525.346873-1-duge1256@gmail.com>
References: <20261106060525.346873-1-duge1256@gmail.com>
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

Describe the SpacemiT K3 eFuse controller and its readable bank 0 and
bank 7 shadow windows, which contain temperature calibration parameters
and other configuration data.

Define the AES_WTM clock and reset, little-endian data and
controller-relative NVMEM offsets. Use fixed-layout cells for the
temperature calibration parameters.

Signed-off-by: Jiayu Du <duge1256@gmail.com>
---
 .../bindings/nvmem/spacemit,k3-efuse.yaml     | 63 +++++++++++++++++++
 MAINTAINERS                                   |  5 ++
 2 files changed, 68 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/nvmem/spacemit,k3-efuse.yaml

diff --git a/Documentation/devicetree/bindings/nvmem/spacemit,k3-efuse.yaml b/Documentation/devicetree/bindings/nvmem/spacemit,k3-efuse.yaml
new file mode 100644
index 000000000000..93f4301c8289
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
+  The K3 eFuse controller provides configuration and calibration data through
+  shadow registers. NVMEM uses little-endian data and controller-relative
+  offsets. Read access is limited to bank 0 (0x104-0x123) and bank 7 (0x190-0x1af).
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
+            temperature-trim@19a {
+                reg = <0x19a 0x2>;
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

