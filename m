Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794202151;
	b=QXIitk+FofEQVrZ8Cggakmx4Jvxi4XYSaouqdnD929l82fPY/iKQWslY+a7UU6rFPe6g
	 gpSEy1YtP4266bb+mA+VHsr6LwY1VVsfg9g/Qh08lLt5uc32HJSrGFuP/fLY16IonAMPN
	 Fpqq2I0yhABUHZ4soc2wUTwhz6kfTOIrWYISG7V8iHKf1XxP8q+XFKb3dYWgXf7qlP8iW
	 WEDW/DBfAtgthiYLXo5R3gXot3LaVihfsAlHXeF3N0w57SeuY5bf44NnhSC6pJTK+NGwW
	 EgcrSVszPtkKJCMMiDMaJbLnPAk4T5wr5BKMfw8JnRw8d/7mISIvS2FIAdTMeryVdVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794202151;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=+2wCtwxXKIDkxHcE0WIbk0DNcnVd4qsfVLWBnePcPdM=;
	b=qFnuhRYo4XzOKkgwD1zN9R3dAH8eWtf0lTiUhx/pIkn+jqcA86/d8pcBOgvKKvAQ4XIM
	 AXFRrF39++7MNKv2GMLtdOscOe9hap1PqrkJ4EjsGEplauv2KqT3ovseoVacbkQINKJrN
	 blNLSEZTEt4G9lYDg6896hXBeQUJ7NStNMeSx+hqtBt+zPWGVAcAgT7tsWKLRA84r+Kqz
	 QfAuK6cH2NuVOnE5uvs8NTW1bzId6DIsYVIrZCxwJoYwBsQXvdO41AKPCNsGOZYMu+EBL
	 jyIVbYqucVb2Oo4tODpm7vu+P7l7bsFZAglivy9OPraIcuL3qy+5CmGa4QWP8Fs8xTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="LX/HvpaV";
	arc=none smtp.remote-ip=209.85.210.174
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA768606D80A
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 05:29:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA768606D80A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LX/HvpaV
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-8a9f9473029so362801b3a.2
        for <devicetree@vger.kernel.org>; Sun, 08 Nov 2026 21:29:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794202150; x=1794806950; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+2wCtwxXKIDkxHcE0WIbk0DNcnVd4qsfVLWBnePcPdM=;
        b=LX/HvpaVQDBWsfT2+0kqohS3rHoUvbJMJyHIyGTYM75vhqzY44mOOPLBOQOMGmRZMc
         fdSEenpF6UfrQx6rMyoOVZ4GED/c28nfS4NqAjp3hbg2HovMPvtZjFz89gtZh148mf3q
         3LbDIHsqHCVgGuemSPtTR4l/uaQUQKEtq0wP7k9NeoNPGOGNlwoBDFEE7xuLGjbXZihb
         IOewJOuL/zQ4bPoCjl4ncxrMrrKtn+izP4xIzIMs7bhPHeTn3ke2Ilc7N+d8OB6zPb2v
         G/+1KoKBborVG/JHGQzrZDgAmhdxsS5R/i6Bv7+cuGec4aS6QcdutHHFAz/GUUpNrum/
         9mjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794202150; x=1794806950;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+2wCtwxXKIDkxHcE0WIbk0DNcnVd4qsfVLWBnePcPdM=;
        b=ZpJ9sXEbfZbrvm1zCZTe0NqksUFfqUdPZ6QLHxE8KotIPbLot4OW91xtJ79vDgjkRf
         wjpVBJHsKCxcdWAWZy8jqj/vyCfI3sut5YkgFCR0v4NyMqIDYIkQjIKAKtdl8ervTquD
         mSeLWj/nsaQcPlE7hoIybDfHsLzTdwHKfLFEUlTT3Vysk7s/69kFPtR4H3zNMQss9NNG
         pjd2ukTYoFBR+S4TkpWY5V9lgS0BPUIMUPztC87uSy/DFCps0KYeqk5y5/NBhssj5prN
         j3uROd2KvmDvxuKqbyNVbk275eENRW+GbhNvGXFOmkBICjbCVhfPRDPHPrvsIvV7GP/j
         1WWw==
X-Forwarded-Encrypted: i=1; AL+hErHxYeEq3f3Aw/8CWES/ucShNvnvb/UPeMmdzSLLFcStiW4kNYOdb+IJvxKuw2MLdEq13x87s9aDKK90@vger.kernel.org
X-Gm-Message-State: APuU4Z/WWzGL8ulhzfepmLDVqiBgUenanAlqMLELEuxxy1DPqpXklvJL
	SrrsuJSn3x5VV7rv+IZdC4WQyshppjbQREV5A75dlBmtoqgB9WiSDR30
X-Gm-Gg: AYBFou34UZaYKW6vsYujIyfTpI5ELT6yib3QxKKhyZKa6audkSYcPLI+TkDWlAjKyxF
	JAz1nCbrnIKdoE7hSXtxrguPsx5h0Xpt9U1X4mcfwgrIL1NyvD9XHjoQUzImvAhI+Od+JKDBVGh
	n2z89ZWAr1MHyLGJ77rbbRW2GlP3xLpMNeII9tEecpl2gj9CJTioEYsu6ueK/scNwG6/AdkIDWv
	PFdhD+lM5z1w+97t6Vk1P/PNGkNtu39MIw68jF8mv3aTdTW8NsF9e6kNmSMRA2GviRDE/rY+Pjh
	bFjM4bJZbZA11h7QIKVlMU0M7kzPZARKQpL8akH7IbQ+TyqsMEUeq8kzp1wCdnqNOB8lYDj/+Up
	hfoGRXzbuQVM2kTtcq3urAr3DZeErJZl4i6TvW8JpVCxkmgOZjyT2nzQ7JCWzQ6qW9Lw7xESzBk
	Vo7nOCzaLyFCUvXb3VyeshuZiAetRBwuFAb7rXJGNMlx5emGVNhlhedsoozp5iCNBp9v3gWJcoW
	Aja1SJS+BpIv5bPwR7iMgvZm+fvu95YY5cUvgGHHsJrre3SMlEDcU0tPQCfhIzMi/WRBrT8ZVFK
	18ZbMgo1wuANvRZyfc8UkRoAD0dJkuDOnN6boLB46bPCuLtFTZs27b01UP8j7XWq/fhsSyxofnH
	qzOfjCa4H4RuzI+A=
X-Received: by 2002:a05:6a20:ef1a:b0:3e5:904c:78d3 with SMTP id adf61e73a8af0-3eed5ce2668mr2545295637.69.1794202149963;
        Sun, 08 Nov 2026 21:29:09 -0800 (PST)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb9681385fsm1180899a12.6.2026.11.08.21.29.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 21:29:09 -0800 (PST)
From: Shan-Chun Hung <shanchun1218@gmail.com>
To: ychuang3@nuvoton.com,
	schung@nuvoton.com,
	vkoul@kernel.org,
	Frank.Li@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	kees@kernel.org,
	gustavoars@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Cc: Shan-Chun Hung <shanchun1218@gmail.com>
Subject: [PATCH v2 1/2] dt-bindings: dma: nuvoton,ma35d1-pdma: Document MA35D1 PDMA controller
Date: Mon,  9 Nov 2026 13:28:59 +0800
Message-Id: <20261109052900.2960473-2-shanchun1218@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261109052900.2960473-1-shanchun1218@gmail.com>
References: <20261109052900.2960473-1-shanchun1218@gmail.com>
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

Add binding for Nuvoton MA35D1 PDMA controller.

Signed-off-by: Shan-Chun Hung <shanchun1218@gmail.com>
---
 .../bindings/dma/nuvoton,ma35d1-pdma.yaml     | 71 +++++++++++++++++++
 1 file changed, 71 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/dma/nuvoton,ma35d1-pdma.yaml

diff --git a/Documentation/devicetree/bindings/dma/nuvoton,ma35d1-pdma.yaml b/Documentation/devicetree/bindings/dma/nuvoton,ma35d1-pdma.yaml
new file mode 100644
index 000000000000..d05971662a5d
--- /dev/null
+++ b/Documentation/devicetree/bindings/dma/nuvoton,ma35d1-pdma.yaml
@@ -0,0 +1,71 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/dma/nuvoton,ma35d1-pdma.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Nuvoton MA35D1 PDMA controller
+
+description:
+  The MA35D1 SoC has four Peripheral DMA (PDMA) controllers. Each controller
+  has 10 channels and performs memory-to-memory, memory-to-peripheral and
+  peripheral-to-memory transfers.
+
+maintainers:
+  - Shan-Chun Hung <shanchun1218@gmail.com>
+
+allOf:
+  - $ref: dma-controller.yaml#
+
+properties:
+  compatible:
+    const: nuvoton,ma35d1-pdma
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+  "#dma-cells":
+    const: 2
+    description:
+      The first cell is the PDMA channel number. The second cell is the
+      peripheral request source number, as listed in the reference manual.
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - interrupts
+  - "#dma-cells"
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/nuvoton,ma35d1-clk.h>
+    #include <dt-bindings/reset/nuvoton,ma35d1-reset.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        dma-controller@40080000 {
+            compatible = "nuvoton,ma35d1-pdma";
+            reg = <0x0 0x40080000 0x0 0x2000>;
+            interrupts = <GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH>;
+            clocks = <&clk PDMA0_GATE>;
+            resets = <&sys MA35D1_RESET_PDMA0>;
+            #dma-cells = <2>;
+        };
+    };
+
+...
-- 
2.25.1

