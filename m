Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794815709;
	b=PhqMKk836i124tTjonVyMW4NogWWdNowWDFZ9o76++YkKeMOAAN8RTK568+D6jqfdkNt
	 F1REteYPB4jg3/tGrg33mOZBERF3mPozN5cryLPgb/+dTz9hN4UWtfaWWrpAuMzEfF1zY
	 xtAmu93ERkUlafa6avBA8EYKLZ6NnSsr+l4ncyLroYMKbHyOX+wzschn5MHx2oc7NSQ+7
	 TNZOVeC/zlGMMftRBLEZIzOKxVuHQZpJlZBd7B2gL6q+0pwuhilD7wymaJuqSSzWh8c9a
	 RvAkqsGAJdsL7/doiPeolqg+XJYBXL4hHtaEzKp/WxaTovXwU5wNbEo3/9WDwe8gxZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794815709;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Tk8pYgMhS/KMO5ZSGHCIBmeCagveRv5obJ7p1m6+Rcc=;
	b=ij0kshkqUt2+97ERA5UbhveNi6w/hQssE/z6p/fcXUM/ZR8QTeyc9y1+rtpJ9X5mcegt
	 nAFyqRt4vgj8s1uzwbAAiTW/tApY1CDRH+TbRHGAClHDsZaPFsVTyzNu8IhOOQl2oMQ8G
	 gnm7mTTJkMXlXighCg8ifSJEMcPn2BHYQucFUFanqC+FKI6QM6MxI/suKMrVrxEA5lPZJ
	 ySrzVwCTwcbmrHaTiWfZEqjHaPy3bXCUgIt8fD3yG2Ovbtwdp9NNTNoGuIbLPEEmkWziV
	 MxAIzJbYHXsGdU9En5R0QXtc1aI97biAmQuf1oJIynTjoCv0cFkbtT0dmHK2w43CGkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pXKb3R0u;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39865606A323
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 07:55:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39865606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pXKb3R0u
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-3704d30b84fso3646613eec.1
        for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 23:55:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794815708; x=1795420508; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Tk8pYgMhS/KMO5ZSGHCIBmeCagveRv5obJ7p1m6+Rcc=;
        b=pXKb3R0ulw0yLCv028DFzFwkKOSfR6joXyxHQywp2dLdQ1TTl9N8k0lKTTZcFTt+Hc
         oBrJGFoEfokKZ+6s1eu6QzKkHrVsDQY4npaCTZ9PnxMeNC1/ln7qAVldFbkaRGZTI2f5
         YOC5216GgurNIaaYLZtF/A42qPB13bIRNCvfLljWA6mmZJfH+3LUsgchpMh8c8r/5VYk
         VXOQE4MzDBQAqrqnl1W4X6PykdVGGFZWLNeEdUAxVqLNr48c/6ZEdZnvJkYJftOnLYwJ
         +Xja1ifcEMnlGdgQz7mApAAXfDkr8iXsS0z0uycRdoyVc9G95pKkfP533dh79BeUHwvd
         TjzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794815708; x=1795420508;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Tk8pYgMhS/KMO5ZSGHCIBmeCagveRv5obJ7p1m6+Rcc=;
        b=1quOssU07peDNBTdEL1bAlhxP5rLLdNgoFkkQca4v2gHRDfilUTIVjBhmyLBNOF6Cy
         RezKiMHxyTASl2A5/UrqURgl1sWrVdUgzlxvO0WsOzDirULnLVhz+xeDe75oSixe8m0Z
         0Fs0ChPDGZSwunGPniOfg55zAVebFmiqv6hQIh9QKQdpaft/lqIb94mjj73qzAOIkT6m
         JlsUnW6VQZx4pral3gkytzAWxDeZhW9X7UqWKUHZDTTa+EpHb7MXLWgBM7145/UShqsr
         CHfVN65ZUBpNEFjTnuKj5wVu62wYyBudAgWy3MhvOHdHtbB1uKwVXVmnbfF19dWgyXs9
         +3+w==
X-Forwarded-Encrypted: i=1; AL+hErGMuFjxZKvjbeMxxgZCwjjI5ZmwkKU9P/VVqIByau9Jy9KkJ99DIe/qFUS4NDnC1qJrs6DIwRZZRk/r@vger.kernel.org
X-Gm-Message-State: APuU4Z+ew5oTBHVKKmZQ148KMNjrpQiXjnvIQqx5M07GMqIUJgS8JYeP
	PFiiPaW6oGXvfEbzFO0dwmDpcp1pHjvwBfE0c9eWWbqShPo5VczmJkzz
X-Gm-Gg: AYBFou2/kfpE0r/oWdfFhJ7asZw+r9VpUnm2dKRF17hbeQsCwlLLa2BUv3jtTZI2Nr/
	Ap784TfT+/bi74aiQwFUvjvr6JhdEJf2P++7z63CdznDtoyQAH33nWM+G8oOHdArbShDqwQfU43
	RpczR8K26VE5MbKkw3LPeOzL9EjfAtwOPs9O8GcPX9nCCMEqpj0zxd2wxYq+cMZZNltpq6HqqPa
	MqlrNiK6Eu2r42P3KRWWCRmYjuesXOP6UXNtDkaoNHOzBTq7XNFhAdOxIM3BDG61AjWOS5pBcyd
	RNvETMiCG7PSECI1qhtpcBkD2GCyVyLnYTho3STDIg+IqNRTuPCaMWFfXVkH3FUdeDybvv3Z0QT
	BH+Wx/cEi8+cdw8Re/mktOpwEKsmuSv2m97A6XQR/MZHVvnUujYyZZ9sT+BpNY426uljj5TmDGG
	5a2Rbkwe8xDiVeEZSUu3fsSH2R7wzFtIy1rS/I2cs18WUfexP1K8YkzBQFjvKGONx/Q91KUO/YF
	RzVL3Z9ddonLXZxRX73TlAqMAKdSLtvucm2g0Bi9QtDxlcTIJ6doTrA0NpQaIrPFpwHUb3Iwm5S
	VdYFU92FjbnJw/DdspyTJMjbBIgPNs+MqlZZbeWo1WIypZXKNwVL
X-Received: by 2002:a05:7300:f694:b0:376:203e:7d7b with SMTP id 5a478bee46e88-3796337436amr15249399eec.2.1794815708305;
        Sun, 15 Nov 2026 23:55:08 -0800 (PST)
Received: from duge-G3-3500.taila331c7.ts.net ([183.192.223.84])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955f02ff0sm31398803eec.16.2026.11.15.23.55.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 23:55:07 -0800 (PST)
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
	Jiayu Du <duge1256@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2 1/3] dt-bindings: nvmem: Add SpacemiT K3 eFuse controller
Date: Mon, 16 Nov 2026 15:54:21 +0800
Message-ID: <20261116075423.1519438-2-duge1256@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261116075423.1519438-1-duge1256@gmail.com>
References: <20261116075423.1519438-1-duge1256@gmail.com>
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

Acked-by: Conor Dooley <conor.dooley@microchip.com>
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

