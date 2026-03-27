Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2932F38F63F
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 11:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774612135; cv=none; b=XfXD6Gh9vlvx+s5Cg6HY5vB1Iv3AFDGfnUvXFG/wlGbt2B9yvVrbuS3l0PNvDLSteTUFhtq0rrPMU9RmvYYGEkQ03geEeZxPQdZa4r4r1BHmEtPaB7458NdFoVnoYQofWb8e6IYdAbRcQTEmEZJlU7EJxaUaDaMFDO+Ztud1ttY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774612135; c=relaxed/simple;
	bh=sp/IhDBmUKnNkZq4UW3TtZjgx9RAlyfRMXoZdagEuIg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rCNtBXKaQN4M8VXGwJZSrD9GVgmGb/3F0Qr7SOrzBtIVR1+7+qs51s4xF8kA0/QMIB+2aNDamUynsiYn4a6iFBYlOYukKxbeYl/zccBpgm+f4fKsXa4EMV8fB9aEssS8j2ZOq/5wv8Md7jzbrihjz2l9WzEYPtJ4HuRBVyNJUPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=huvlQWQO; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="huvlQWQO"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-486fe2024a9so15340495e9.0
        for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 04:48:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774612132; x=1775216932; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hmqha9k/Jw7r6pvW2ms6JnuZxlOdkxkRhbawPY0Y7FI=;
        b=huvlQWQObB5l7oFaJ8JSkM0FHitiZiQktq5euRBTWQIVCdolbTdiiBcPEPUd2fUMDO
         TlqIk87sNpXpdqL0YiKdI3fox+vwyI0+q02+C8XclhYPwEcAwk0NSRuVYqUx5wjqsKWH
         tFHJOUMqtYKyuXnYV8bcKCCggx2seP7VxtYe34BMl+YtqaBfjFan5PtXtYJ0TQ0l30kN
         hNnl0Dsqb2QkE61oXPVEg9FiEpSv63xUEBENgGEcS2kzsTgK/mxJ1ltyjECAj6buTdPY
         rPb6nMF+gRB13x+cySXNQoBhgXVPE7sOxNi15Kh77WLEFSj2EtehG/vLh+Oo7mMRMMmL
         p0JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774612132; x=1775216932;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Hmqha9k/Jw7r6pvW2ms6JnuZxlOdkxkRhbawPY0Y7FI=;
        b=fJhft+PRej/j3/Xle+MjylPtEFJcXr6w1zTNEB1asBZ2URZaWJxt/Ux1sa18ZI31HG
         LT+bUN8uwsdSSCpL9O57kATk+E5JQyZ+sqQch1NUY8j8yYTJR6p+VcHoPfV973ABoRuT
         YvtS+gB4wUxaFVnrA3K8204hLYrua4pct9CXmshtUd5tXrqpHO7w8K0oP2dDnkqsf33r
         xues6jwyMp2NsiaKGNxrvm2Zmrhp7t8003xNxSwpJ06h9Wv8H5zzaNDMCOUcRkOP/klG
         jlRHhd9vVK3XAdsVLo67YQF28GUXP4NY/BeQ91qTrQ0HqV/fdI7UbkruDvSVKDNsPQpd
         oTsA==
X-Forwarded-Encrypted: i=1; AJvYcCXsyGnhS/hEMBaWhegtzbqxUDplXj1Zp+Gbox7peVwkjcOk6uN9CG9byxJO5EGI2y8wiaRzFhLb4tlh@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0WvDDDN2KqoK1WIVSuABP0LhxlZcxOXc5tCP66YlX0GYDM9Ln
	zs0O78CI+7xoTqZ/nLwgzUrUjv+r0dsl3bdasPsNrQ4dYlb5jW2Mxo8j
X-Gm-Gg: ATEYQzypVkziHrDyaspLJYUYpn7iYnImNcL0737MwITJjcMBTa5O9aYOJGpeF+7enwm
	5bHhW8k9Qoij+T3pBQuB/ed3zaaqilydgmC94M04/I77z8ICrM3tVIw6gzpvHjfhz6+EKRviSVt
	G8z3cA1YOH2ikY/jJbX2adbVjn5F+uDjV6DIrBqGsVHd8jo6/6BRi/7iJF3TR+5xZZMrlJfDWw4
	0vHN3FMYmV7hg8vJthMVrNdMxy0GxyZZ4HJE5Rm/7ItlNJR8XvCra6u8UKkNm3ZfrbhYye2/Rk6
	2CNiZtz8UyL81SuKQJW6XIEZLLCPjz6D03On5bjyF0ar01YmLLdGGkGJyztX2/1IYbmxfwsW7Uk
	EZINA9cd58c3OoXDJ5plNVXkOdyKZcYpuBdat1e4qJwCsKdEMmrmbULXjB0oCI1wZeTmpxMFINI
	pJZYxdPqX6W0RvAG14hdUwwVEIdxhvXYXodosHq6ZX/geFWCxe7QxwXDJOVsv3zVBkwVhiOldd+
	zxYrlee/HecPdRnXpYVz4CqmQ==
X-Received: by 2002:a05:600c:6287:b0:485:3b5b:eb8 with SMTP id 5b1f17b1804b1-48727ef6617mr34445785e9.26.1774612132393;
        Fri, 27 Mar 2026 04:48:52 -0700 (PDT)
Received: from iris-Ian.fritz.box (p200300eb5f28a7005a7787565d4257d0.dip0.t-ipconnect.de. [2003:eb:5f28:a700:5a77:8756:5d42:57d0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48722d49c18sm90506115e9.14.2026.03.27.04.48.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 04:48:51 -0700 (PDT)
From: iansdannapel@gmail.com
To: linux-fpga@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: mdf@kernel.org,
	yilun.xu@intel.com,
	trix@redhat.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	neil.armstrong@linaro.org,
	heiko@sntech.de,
	marex@nabladev.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	dev@kael-k.io,
	Ian Dannapel <iansdannapel@gmail.com>
Subject: [PATCH v6 2/3] dt-bindings: fpga: Add Efinix SPI programming bindings
Date: Fri, 27 Mar 2026 12:48:40 +0100
Message-ID: <20260327114842.1300284-3-iansdannapel@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260327114842.1300284-1-iansdannapel@gmail.com>
References: <20260327114842.1300284-1-iansdannapel@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ian Dannapel <iansdannapel@gmail.com>

Add device tree bindings documentation for configuring Efinix FPGA
using serial SPI passive programming mode.

Signed-off-by: Ian Dannapel <iansdannapel@gmail.com>
---
 .../bindings/fpga/efinix,trion-config.yaml    | 96 +++++++++++++++++++
 1 file changed, 96 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/fpga/efinix,trion-config.yaml

diff --git a/Documentation/devicetree/bindings/fpga/efinix,trion-config.yaml b/Documentation/devicetree/bindings/fpga/efinix,trion-config.yaml
new file mode 100644
index 000000000000..7e84397e242c
--- /dev/null
+++ b/Documentation/devicetree/bindings/fpga/efinix,trion-config.yaml
@@ -0,0 +1,96 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/fpga/efinix,trion-config.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Efinix SPI FPGA Manager
+
+maintainers:
+  - Ian Dannapel <iansdannapel@gmail.com>
+
+description: |
+  Efinix FPGAs (Trion, Topaz, and Titanium families) support loading bitstreams
+  through "SPI Passive Mode".
+  Additional pin hogs for bus width configuration should be set
+  elsewhere, if necessary.
+
+  References:
+  - https://www.efinixinc.com/docs/an006-configuring-trion-fpgas-v6.3.pdf
+  - https://www.efinixinc.com/docs/an033-configuring-titanium-fpgas-v2.8.pdf
+  - https://www.efinixinc.com/docs/an061-configuring-topaz-fpgas-v1.1.pdf
+
+allOf:
+  - $ref: /schemas/spi/spi-peripheral-props.yaml#
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+              - efinix,titanium-config
+              - efinix,topaz-config
+          - const: efinix,trion-config
+      - const: efinix,trion-config
+
+  spi-cpha: true
+
+  spi-cpol: true
+
+  spi-max-frequency:
+    maximum: 25000000
+
+  reg:
+    maxItems: 1
+
+  reset-gpios:
+    description:
+      reset and re-configuration trigger pin (low active)
+    maxItems: 1
+
+  cdone-gpios:
+    description:
+      optional configuration done status pin (high active)
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - reset-gpios
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    spi {
+      #address-cells = <1>;
+      #size-cells = <0>;
+      cs-gpios = <&gpio5 13 GPIO_ACTIVE_LOW>;
+      fpga-mgr@0 {
+        compatible = "efinix,trion-config";
+        reg = <0>;
+        spi-max-frequency = <25000000>;
+        spi-cpha;
+        spi-cpol;
+        reset-gpios = <&gpio4 17 GPIO_ACTIVE_LOW>;
+        cdone-gpios = <&gpio0 9 GPIO_ACTIVE_HIGH>;
+      };
+    };
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    spi {
+      #address-cells = <1>;
+      #size-cells = <0>;
+      cs-gpios = <&gpio5 13 GPIO_ACTIVE_LOW>;
+      fpga-mgr@0 {
+        compatible = "efinix,titanium-config", "efinix,trion-config";
+        reg = <0>;
+        spi-max-frequency = <25000000>;
+        spi-cpha;
+        spi-cpol;
+        reset-gpios = <&gpio4 17 GPIO_ACTIVE_LOW>;
+        cdone-gpios = <&gpio0 9 GPIO_ACTIVE_HIGH>;
+      };
+    };
+...
-- 
2.43.0

