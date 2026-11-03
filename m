Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793699675;
	b=GmCTNX4KfBmGxLAs6IlhpQ91qxoZt7bFrjdYo3+EGu80JxNXMqCN+rjsLYLSiCISiVPD
	 7s7VDIvMIhsaf8pKjpqZUMcSa4CAQoVnKDjHPec7dXZcgMsanX8BZphYOOamzHuRt04jQ
	 0TM4Hw2tjmq2WA9DTHnih306GkID9r/xyzbp48/3bgFv+gIjiw03fTJ1okg5zaHKyFD1H
	 R9W3HV3NkHpZVzVz46bdLOzPQTXizSz7AtyvGQSD8PEATT2qCSASW8rI5eXKeEZKDIUsG
	 /2cqjg7vsnR7uR+V5zywF/lnpwPsETYr5vhSrg4w53P6NRhMwOW+vFw910z9goSZNWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793699675;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=zqCaLUUNz59+zgsekGyFjzKAv3q6ta6bJK4x/zj55AM=;
	b=p3FKKhzZmPktge1vk2Xfb5SKRY7xipme44QX5jxmI6kPHysRHE2foI3KfzowE6E5Lds6
	 7AyMbaBIPCcII6Q4FPcsxStP/NBjGkF6ivuumCoQzhbe/otO/yKu/dx5KlybaytQOoyKw
	 W2i1MJ0LGcEl7eUqcVhtKrMoOUCF4OBwpOyX/2iP2yv41u46XSwtP8sIs7bmX921suN59
	 sldNhm4WNqD1uwhJGi8yJFQJcHQAt/bIyjNRheZxFG+LZU4Taf4moYsciwFuWLg8kQLyL
	 fSkQ1xygIyNIdstMfNowGpLoJJumpxePmpizkA0RHlibFJprswgIGPEz4hb6mVJFRaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=ZZpmcJ9W;
	arc=none smtp.remote-ip=209.85.216.46
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DDD0606D816
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 09:54:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8DDD0606D816
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=ZZpmcJ9W
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3acd21ba21aso2884068a91.1
        for <devicetree@vger.kernel.org>; Tue, 03 Nov 2026 01:54:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793699674; x=1794304474; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zqCaLUUNz59+zgsekGyFjzKAv3q6ta6bJK4x/zj55AM=;
        b=ZZpmcJ9WUyeh7inRPfiWzraTq7IqCh3IocJ+GRbi7LEYfvoUUvI2ktnGKvii/Re2c3
         94xsGrKWPlzXDsCEKEwyd/3Yyl4KHHQr+dq+Ma4P/f2y/nAkUHm1DZFHjoD54QiETbaY
         XdQOPyVIRpi0H9XdhGsBMxXLnxot8Z14kAXLs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793699674; x=1794304474;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zqCaLUUNz59+zgsekGyFjzKAv3q6ta6bJK4x/zj55AM=;
        b=XPy46f/s3y/XRoIfjlthhflRr3Dp4j5/H8lVFq/2Q0WE1vmWA0uhjVXI1EyVQFwDZD
         SFZb+1ye+TupBQPCzWri5IzD/rizWTsazm11sOjvxQEmJi8MU6jzUO+6AY+cPLQNQDz7
         fnLrmtGcr7kshqkTSR9H3RUAf/DtLBwTXceJBbGKTbM4pnkTGaTXMT2LXuvu1uDjKJT3
         IhV7bgiDiphf7QQZG/HagUzsmsXLkkNGzldq3Ey1OFh5A6HSD6YFSQ0T2yGMsFjZGJM3
         KHJprLyQD9XojGeFNjUTp06eAwP5NuZIbrkyPGZMnp2+E6zgacqxnnQU9VAzK1ehhQZ4
         wolA==
X-Forwarded-Encrypted: i=1; AKwUvBxjhqG+aruLAYI0XM5sooKL6HB1fZj9L44fPqHsvErX+b37UxLnqZiP2iYzOjrex/6qxojNzVRYIkyp@vger.kernel.org
X-Gm-Message-State: APuU4Z9K6WMuQFG+OaepLVRUGcisedzEBKmfz9Ei98wWkbE0+RIKKn6L
	93ZvXpkjuxMVt1RqXu+zMOIAbq5qaL0d29stwfWnR66DhSWPdusCYekl2BHkwxg31g==
X-Gm-Gg: AYBFou1XneQR1P1cLHtRzB6iQaJQJc9837q/dJscY9urelpZeqcwOMYEz8veuHvdqPd
	/3fsJal4gxKgjx1hPRVnlE4+DTDU/UXssludsUKreYSRiU5DOd8wbNm0I/85kAyHEiC+6HFHeeZ
	igJCgrRqB6nBpJ46mlwafiVXw1+SU8PunEaZfTcG4yxEjCUofBJRUZNMkLhpk7OY9pOR7ht4Mne
	YZlYlAo42nxpZ+XvilrfqVm/gs/XD904lPswjImbPtDDIUUN1PlY5egv21/QZy4vCnSqodUNKej
	rEAxdHfXeaRTIc4XcLqaBCdFhXrW8RLa8qMh3kpUJx3iexYF3Q4tE31sry7VvR2jdNMSu8TPFR5
	o34uMBz33MbbHtLZnF9UZnUFC58D6HN1bUbElYtrqNeVOfb5yIoyfaZpLcZejdgwjlOgD7lEDBg
	JABd6e4uA3d3zLSXOkQoaNCGUfFFJXlmZtg6bYrjIzSwk2txXefmeuOX9QvgFJF1I+2ojqARC4T
	XuaoSSZNB6oTRntnsRW1CGGf2eIDca2a24pfM2cuV+bl3zdK7nbS6GwpSTtiVUCnCspuaWQZKoH
	/gbf63fzmrkLBAHRY/0swKvygS6LEN395dwO6wainKylUInJERjvc8izxMlO4ptFBChtT+qpTvG
	W7/uLxsp/Q91ACzUjxOzh9kzwFBceQdrVoQ==
X-Received: by 2002:a17:90b:4cd0:b0:3ad:aa1a:312e with SMTP id 98e67ed59e1d1-3ae895a5680mr10487974a91.3.1793699673751;
        Tue, 03 Nov 2026 01:54:33 -0800 (PST)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:203d:7:dea6:6326:4502:bb8b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c903d0dsm3576828a91.12.2026.11.03.01.54.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 01:54:33 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH] dt-bindings: usb: ti,usb8041: Fold in TI USB8020B
Date: Tue,  3 Nov 2026 17:53:29 +0800
Message-ID: <20261103095425.3097720-1-wenst@chromium.org>
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
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

TI USB8020B is another USB 3.0 hub that currently has a separate yet
similar, albeit more limited binding.

Fold the TI USB8020B compatibles into the TI USB8041 binding, thus
allowing the TI USB8020B to correctly allow downstream ports through
the common USB hub binding.

The requirement of "peer-hub" is relaxed, as done in commit e44297dd2b75
("dt-bindings: usb: ti,usb8041: Support nested USB hubs"). The hub chip
might only have its HighSpeed data lines connected, and thus would not
have a SuperSpeed peer hub.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Cc: Macpaul Lin <macpaul.lin@mediatek.com>
---
 .../devicetree/bindings/usb/ti,usb8020b.yaml  | 69 -------------------
 .../devicetree/bindings/usb/ti,usb8041.yaml   |  5 +-
 2 files changed, 4 insertions(+), 70 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/usb/ti,usb8020b.yaml

diff --git a/Documentation/devicetree/bindings/usb/ti,usb8020b.yaml b/Documentation/devicetree/bindings/usb/ti,usb8020b.yaml
deleted file mode 100644
index 61217da8b2f3..000000000000
--- a/Documentation/devicetree/bindings/usb/ti,usb8020b.yaml
+++ /dev/null
@@ -1,69 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
-%YAML 1.2
----
-$id: http://devicetree.org/schemas/usb/ti,usb8020b.yaml#
-$schema: http://devicetree.org/meta-schemas/core.yaml#
-
-title: TI USB8020B USB 3.0 hub controller
-
-maintainers:
-  - Macpaul Lin <macpaul.lin@mediatek.com>
-
-allOf:
-  - $ref: usb-device.yaml#
-
-properties:
-  compatible:
-    enum:
-      - usb451,8025
-      - usb451,8027
-
-  reg: true
-
-  reset-gpios:
-    items:
-      - description: GPIO specifier for GRST# pin.
-
-  vdd-supply:
-    description:
-      VDD power supply to the hub
-
-  peer-hub:
-    $ref: /schemas/types.yaml#/definitions/phandle
-    description:
-      phandle to the peer hub on the controller.
-
-required:
-  - compatible
-  - reg
-  - peer-hub
-
-additionalProperties: false
-
-examples:
-  - |
-    #include <dt-bindings/gpio/gpio.h>
-
-    usb {
-        dr_mode = "host";
-        #address-cells = <1>;
-        #size-cells = <0>;
-
-        /* 2.0 hub on port 1 */
-        hub_2_0: hub@1 {
-            compatible = "usb451,8027";
-            reg = <1>;
-            peer-hub = <&hub_3_0>;
-            reset-gpios = <&pio 7 GPIO_ACTIVE_HIGH>;
-            vdd-supply = <&usb_hub_fixed_3v3>;
-        };
-
-        /* 3.0 hub on port 2 */
-        hub_3_0: hub@2 {
-            compatible = "usb451,8025";
-            reg = <2>;
-            peer-hub = <&hub_2_0>;
-            reset-gpios = <&pio 7 GPIO_ACTIVE_HIGH>;
-            vdd-supply = <&usb_hub_fixed_3v3>;
-        };
-    };
diff --git a/Documentation/devicetree/bindings/usb/ti,usb8041.yaml b/Documentation/devicetree/bindings/usb/ti,usb8041.yaml
index 07e13fae640b..74021d13a43a 100644
--- a/Documentation/devicetree/bindings/usb/ti,usb8041.yaml
+++ b/Documentation/devicetree/bindings/usb/ti,usb8041.yaml
@@ -4,10 +4,11 @@
 $id: http://devicetree.org/schemas/usb/ti,usb8041.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: TI USB8041 and USB8044 USB 3.0 hub controllers
+title: TI USB80xx USB 3.0 hub controllers
 
 maintainers:
   - Alexander Stein <alexander.stein@ew.tq-group.com>
+  - Macpaul Lin <macpaul.lin@mediatek.com>
 
 allOf:
   - $ref: usb-device.yaml#
@@ -16,6 +17,8 @@ allOf:
 properties:
   compatible:
     enum:
+      - usb451,8025
+      - usb451,8027
       - usb451,8140
       - usb451,8142
       - usb451,8440
-- 
2.56.0.385.gac671c819a-goog

