Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795577295;
	b=PoTiKcNYQ62X/m3Tj1PoJy3iwSTkZstvIau2MY8hlrLohimVdzwDW1UEvXy0YOvFEFhA
	 K9unGEIEPikHq+bgDfnuI4fPV9WRdkWpMq3muegfAKsOLMudlFnMbxhTjhWAcxa+HWxkr
	 t3iX4JxGSUk0Dt5An4umQRiMLZ8c4c13CARQ4baeoaEdy8b+oWLd3MrGtJbt4rHbERTj3
	 abBLwP3wmZEIqiy+8cb+eRXDfqE6FLwUV89TLjtwG+To7dFFfy/IDXhG8TO3hRp/6mWOu
	 pZ3cnxXWUsg2mnqilotiys4jCCCsN1XqyIHK4LSpJuhObkNM27LgTaC9RxGUEo25DpA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795577295;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=sG4IjzQzTOsq8+1nteR/Dqn0VR6TUjyjIc18rbJBV9s=;
	b=r7YuWmcJqAVYpMXTfDcLzjzV22fARHIm20LD/89vO+CKfe4q3Zif0TbchIR6efvdCntl
	 6xZe/FFERWwBGh4uk2jH/eAE/qwgcMexRLU19TDNlrdwy0uGGkOvQyNCLzVojp0NkObLO
	 LiS6LlO9qlRdSTB1iNCzqwzgRCJbghg/OCDk95ukiHH3HfzeBO4ahpkucex3XZFpbNc5X
	 xfdMwd+WSN/3tQv9+gcAVAfvuHdY2U0Rk1TG6syuFlTLAgV7LEanDGQ4/nR7hAlBq61dk
	 rFfmWOlLtAykPnKPa4NJA2R/LtHK+onU49KB/BYO9KBF50Dr6RplZyM4rWpECa/kJhg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Pva+qH5L;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF54B606A6BE
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 03:28:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF54B606A6BE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Pva+qH5L
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-4a34ffd3e39so2843622f8f.0
        for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 19:28:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795577293; x=1796182093; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sG4IjzQzTOsq8+1nteR/Dqn0VR6TUjyjIc18rbJBV9s=;
        b=Pva+qH5LwkfRhY/HwbuWQ54KdZoI9qwiM2ANNoQjop+Al1lt+Gs2GjJHLVhyECm8Z1
         2CChIklgFlF83RjXCGNzKTVjFdbIyeakGRqfM7vpIyAAloWFT6JAbfBg9/toCxKyOlJd
         xe0Y9nRMliTY7LRnF7+Xl+8iFb1uRZCZFwR3KGlkBm34l64abBXecw4P5+rjfmTV2VXH
         S8WeMlhR7JMXkJYiJrNVOx6dvwMRwMhrxKlkUGvXrWB8DEsZczOtWRAzorpvWKnS3P0v
         aEtnkYsRgeclvDywKMKzvJBSAM0phfesoeu8/WVlmJsi2EO9R+BLhgV4C0eCkJJdYtuJ
         YWzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795577293; x=1796182093;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sG4IjzQzTOsq8+1nteR/Dqn0VR6TUjyjIc18rbJBV9s=;
        b=AIkNbe+yzfxDICAjWLaVPbVJJm08deJf5XN4I2fKKDJE1rB9YcJGoJKjwTy8EC8j6M
         0QjIUKnAJDqZ+pQcarkebHeEND5igZucgL8daosTZJsodAgIPMSAN3JgRL8it3/pqaJO
         4D5MqiMgREnKce0zunHPy0Qx72UN/zVv8SfyPBO2ADx3BW5s7PhUpubLxked4HHLsc8G
         nAjKX2Lz3sIrD6hZ/sxvvq8oPAZwkY7tNxX6d3LkCcj6Dh8G0THAeLGGaleQazUTb8d2
         FGQBEDmfXkohWeWCtZ7VWpDMLgsw6rs/QNPVKXME+4zCPYVE30XpZrWf155QGAZdFFiX
         QI7A==
X-Gm-Message-State: APuU4Z9/9wHxz0liszy3ulsmzaKC+edPVnBMHo9icTxYR3Fho0c5xm0A
	PPVhtrBQ5INSb2EI/VORzO15ykal9RacN0yIA0LFKrxvmAFKmNLddZmH
X-Gm-Gg: AZFdTZcTHb+5RbW6y/PyRCWT5YZxnbTS8s97lDUWcLTMU/Grs9WxXUMPmv22O7zREZt
	qJzLTVuEuumajJfs6lPy5QzaxG2imw6v66USghD1E0Izm7jizaXNeBlHS8HgrFAW4JGvwTFycnU
	VQotAnvPiKx4XPtUe/g2fjwFZ3YTp1mw2ZnxuKw0r5bNfNJPr21W1hlhGGVDXObyeYwdevIaLhK
	Ud4hbYeS3dRoQY5ze8SoJQxGk1hGAgMMp4P1sSDoz5mSRj2jaE+tYL9zhqMgY6bQ39sn+s8RSPd
	Gxx9TxLYv62kBZnCKyTuCX63taas2YwHhyXtfFVOAWuyX4RydfJ0+2nXbt2S5PDKOXZMrRO0j43
	i6g3oIqsUFoBMBUQl9SMl3ej/hB/C5BTGR2QGwkTZa2K2HdV/9OBuhCKOjInsFagu67VS/Rwwiy
	jowafPS2j0Gew3jRAM28bgv5irV7F9kskS4krohw/ERLGpszgki9w/LzbLYLbO0C8L6uBVrvVCJ
	EJj9n74rroUk1uA6vOqdClCA3qCQQHdPqI5laHPrw/sGb1X7XeoYcncRmKYlhZKG39bEf7639eU
	yMIRYEvdWt8pys1eHGKn0bxHuGby1LuNB715/rC9IOq23x4tvtQgjZa39AZ0Ra4UdkKGR4tns6V
	4xI1Y/6IJ0tlH2S0of8lKRHnaauGF+AU=
X-Received: by 2002:a05:6000:2913:b0:4a8:7115:fa08 with SMTP id ffacd0b85a97d-4abb0f3c202mr33671845f8f.13.1795577293140;
        Tue, 24 Nov 2026 19:28:13 -0800 (PST)
Received: from DESKTOP-BJ3EVC4.lan (178-164-182-185.pool.digikabel.hu. [178.164.182.185])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67fe48sm28918822f8f.23.2026.11.24.19.28.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 19:28:12 -0800 (PST)
From: Abdur Rofik <rofikcoga@gmail.com>
To: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	phone-devel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Abdur Rofik <rofikcoga@gmail.com>
Subject: [PATCH v6 4/6] dt-bindings: input: touchscreen: add LG SW42902
Date: Wed, 25 Nov 2026 04:28:00 +0100
Message-Id: <20261125032802.8460-5-rofikcoga@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261125032802.8460-1-rofikcoga@gmail.com>
References: <20261125032802.8460-1-rofikcoga@gmail.com>
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

Document the LG SW42902 I2C touchscreen controller, including
its interrupt, reset GPIO, power supplies, and panel touch properties.

Signed-off-by: Abdur Rofik <rofikcoga@gmail.com>
---
 .../input/touchscreen/lg,sw42902.yaml         | 72 +++++++++++++++++++
 MAINTAINERS                                   |  6 ++
 2 files changed, 78 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen/lg,sw42902.yaml

diff --git a/Documentation/devicetree/bindings/input/touchscreen/lg,sw42902.yaml b/Documentation/devicetree/bindings/input/touchscreen/lg,sw42902.yaml
new file mode 100644
index 0000000000000..e8ef2d325635d
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/touchscreen/lg,sw42902.yaml
@@ -0,0 +1,72 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/touchscreen/lg,sw42902.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: LG SW42902 Touchscreen Controller
+
+maintainers:
+  - Abdur Rofik <rofikcoga@gmail.com>
+
+description:
+  The LG SW42902 is an I2C capacitive touchscreen controller used on the
+  LG V60 (timelm).
+
+allOf:
+  - $ref: touchscreen.yaml#
+
+properties:
+  compatible:
+    const: lg,sw42902
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  reset-gpios:
+    maxItems: 1
+    description: Active-low hardware reset
+
+  vcl-supply:
+    description: 3.3 V power supply
+
+  vdd-supply:
+    description: 1.8 V power supply
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - reset-gpios
+  - vcl-supply
+  - vdd-supply
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        touchscreen@48 {
+            compatible = "lg,sw42902";
+            reg = <0x48>;
+
+            interrupts-extended = <&tlmm 39 IRQ_TYPE_LEVEL_LOW>;
+
+            reset-gpios = <&tlmm 38 GPIO_ACTIVE_LOW>;
+            vcl-supply = <&reg_ts_vcl>;
+            vdd-supply = <&reg_ts_vdd>;
+
+            touchscreen-size-x = <1080>;
+            touchscreen-size-y = <2460>;
+        };
+    };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 6a41a0690d9f0..8c88429e647ba 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15211,6 +15211,12 @@ F:	Documentation/ABI/testing/sysfs-platform-lg-laptop
 F:	Documentation/admin-guide/laptops/lg-laptop.rst
 F:	drivers/platform/x86/lg-laptop.c
 
+LG SW42902 TOUCHSCREEN DRIVER
+M:	Abdur Rofik <rofikcoga@gmail.com>
+L:	linux-input@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/input/touchscreen/lg,sw42902.yaml
+
 LG SW43103 PANEL DRIVER
 M:	Abdur Rofik <rofikcoga@gmail.com>
 S:	Maintained
-- 
2.39.5

