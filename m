Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792679491;
	b=mRqdUm8vxmU3ieVuZswLE7SUk86p6866vkKCBSOmQCNpIZJzTxTfjedNIVNK8+QMwHu9
	 E9YcocB8amnCoaVlNg7MCRw80BbnReUnoGgd/48SUIV/bK0EQQ9OWOY/JjEvpdkhij1FU
	 oGlTanek3V8NC6C3kzsXEqXre92a+GYUA6w0Hul953V2nuJyMwsff5Hsiu3a0AEdDg3Q1
	 mPpMBymRXViopDNE9qGTXeYioMySvIaIRWb4l+PDyQqC3hXt8v8UaNfgZxcYT8SVfpPbK
	 qB3YBgvP6Dzsg6amFwv7Nk+zQPbgxQxc1kp4Ad7i7ObUBRUy+tM5JgtdiWtrMKOkleQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792679491;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=VSDmw3zZL4GwSBLGTgTs+YZpiiLncoXUqRyZW9au3hs=;
	b=NUQnWtp83f9K4iYehpBavwOS+lUSWRjVeIbhq0MFhea7j2RejsIfQ2cUkcgRAe6+yDlM
	 Oks54dAACCdu32rfhD05LzSD6T0RDhvRMZtCjYSJD/Qq/QzS0f/1ii6Wm10WTxD5NF3UT
	 uVAJ/UpkBvOepoQLFI8njyez02LT2FlPa+RVwx8OhY+FVIQmiIXbVymYiQ3TRp78pnZFs
	 ALEVMLCRRlA3AXqzA8yCiEgXIrtYxYq8BDNAjwRVQEjUC3q0baNFKcZhHejAF/WhHYl2H
	 y6GYE5oM0MdRBBmXHP81TL0kFrkmM6RA+09oAWEve5vU3sxeYCnT2YYL+QgMqUZUVLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Ccs2YyI3;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D01D3606A323
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 14:31:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D01D3606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Ccs2YyI3
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a20bde60a0so5015625e9.3
        for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 07:31:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792679489; x=1793284289; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VSDmw3zZL4GwSBLGTgTs+YZpiiLncoXUqRyZW9au3hs=;
        b=Ccs2YyI3pKNIsHdD0mUTS2bMDQIyNKPZFT4TFnbkKlcB7oacL+VC8UO99fzT1ImjGx
         1fPRCQq3moIx5EQTJS6VtkL3bFwzkNI7fsZuLqG4OJ9Yq8xzEwN3nKGNvKuza5dGqZQ5
         aj8BX/chL+VPLTKLTYLsrzINmpEpTlGL19G5RwZLDT3eHRfz5jB3usL1aB/I3zaRHzjC
         PoapEziYHT9png3XE+fUF08zCqlcBNiEJzAaIlqlgJalKdoH/VU9/ly2OyQE41xHleIC
         0U0yvhLVddL484CLyuSVB2eQZM9HJiIrupsej9msssNOY9Ap1wcX3vM65THPxkzlNdD2
         fqpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792679489; x=1793284289;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VSDmw3zZL4GwSBLGTgTs+YZpiiLncoXUqRyZW9au3hs=;
        b=IapMQ5TctW42aaRywjsBBQmRjAipXHAKAG/tzkFzbWq+ufPfdoguz2SsZ5+Y4IGwlk
         Emd0ks1TBea3JcPgNjzxMIc5WRYIIHCYpmYA7f+5yozVk1PAfRuQki8FC7Eyb37s7jzM
         fcuYo8GCRd3+neij9u0Qwcshh9CYSmb31my3VhSmgebRA6citF18+PszXwSAwC9nJdeM
         BhNqudfVuCqt0YkfoUjz5QxGp2BURHwMzNgudaZdYqK25jCU32ZR5j2KZLnJOl5Ba+TE
         U1ehMesle0frqD7rViDDTXiXkFtW15OKiyFwPspqnJyy06KbCtdisJ3sseB29+H2rjG9
         9dmA==
X-Forwarded-Encrypted: i=1; AKwUvBz3+0+Au3/Bjkrr9xrAOty9NRmKp2nKtO/7usKCyFbNF4XwbhISyYHGkFR3+deuOntSr+ngCfaSRuSr@vger.kernel.org
X-Gm-Message-State: AFq9FYKi+odt/qhoblpC0XIO6zNsCdpNEuft3bbNHDcegE4ByhQvYhKO
	rM1V8vQ36p+Ekh+IL5xSVe+Skdur5kYmKrCnW68WZ/ZcIVqcs4Lq/YNI
X-Gm-Gg: AYBFou3KL+Z6KcBTQzgnkkkTD0xkJKhsmo4h46fm/k5A3KILBwaOk5ooKL5vuqZYzQF
	EtPDemtFWfQNvniAaiwHpZnr2tOf5k4TJO/OlT2UcMJDKqFHlUlE5hHZ0/MaPDouNMWwGQPzKSV
	1Eho1Vqk6lm5qMBZVoPsuQBsNXoNTrLOOndIZqu13MBZUJ+9DMpA2n5u+Qo1xFzv7/eJKQIemDj
	FkWAdxjUy7pe0JbeRJxlcrq6iZTiDq3k6J3ZluPr2KD3UWY4UkR+yygHxHKl/b+GLwtGYKIlNlV
	lF4i18VBZsyaG39DLud5xh1K3CzPQNQSWhixT3QYCiAcfSJYV1Vi3i27BpKcFHaqoV2NE+caJDt
	JpzcmlREfB9JNTsxidxC+nVRfoRtMg03o5ZXaOTxXhDo76/pJINXafFZiS52sySPhsONWwEVafx
	Sur/Tj67xomvjbj+TfcT+PFyu0LATLGXT5i4jj2cmpeSVZ2bkGpt9Z4S3pCl+axVmzSVfa/kCa4
	i8udIMcEq2oFzq/R8+1m+vH+0HtkfO/7NBCcQHl1vfzbsLRRaayJQZUZHAjboVmAyX7dQ5yupmy
	6q91gnLulBEfzo1bnwBdC3tGmjrc6l7uH6vWh6sxG3pFxrRuonPkYN0X
X-Received: by 2002:a05:600c:4fd4:b0:4a1:dda8:eb73 with SMTP id 5b1f17b1804b1-4a1fdd53c8cmr107350405e9.27.1792679488862;
        Thu, 22 Oct 2026 07:31:28 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a200f4d16bsm85693745e9.2.2026.10.22.07.31.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 07:31:28 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Thu, 22 Oct 2026 16:31:25 +0200
Subject: [PATCH v3 1/4] dt-bindings: connector: Add Toradex camera
 connector
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261022-verdin-imx8mp-hmp-camera-ready-v3-1-90a30b0b0d55@toradex.com>
References: <20261022-verdin-imx8mp-hmp-camera-ready-v3-0-90a30b0b0d55@toradex.com>
In-Reply-To: <20261022-verdin-imx8mp-hmp-camera-ready-v3-0-90a30b0b0d55@toradex.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Francesco Dolcini <francesco.dolcini@toradex.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
X-Mailer: b4 0.13.0

From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

Toradex boards route the sideband signals of their 24-pin camera
connectors to different GPIO controllers. Camera overlays which name
those controllers directly must therefore be duplicated for each host
board.

Describe reset, power-down, detection and power-control as
connector-local GPIO functions. This lets an accessory overlay remain
independent of the host wiring. MIPI CSI-2, I2C, clocks and supplies
remain described separately because the GPIO nexus does not abstract
them.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
 .../connector/toradex,camera-connector.yaml        | 81 ++++++++++++++++++++++
 1 file changed, 81 insertions(+)

diff --git a/Documentation/devicetree/bindings/connector/toradex,camera-connector.yaml b/Documentation/devicetree/bindings/connector/toradex,camera-connector.yaml
new file mode 100644
index 000000000000..27fee3defde7
--- /dev/null
+++ b/Documentation/devicetree/bindings/connector/toradex,camera-connector.yaml
@@ -0,0 +1,81 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/connector/toradex,camera-connector.yaml#
+$schema: http://devicetree.org/meta-schemas/base.yaml#
+
+title: Toradex camera connector GPIO nexus
+
+maintainers:
+  - Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
+  - Toradex Linux BSP Team <linux-bsp@toradex.com>
+
+description: |
+  Toradex carrier boards share a common 24-pin, 0.5 mm pitch FFC/FPC camera
+  connector carrying MIPI CSI-2, I2C, clock, power, and sideband GPIO signals.
+  This binding describes the sideband signals as a GPIO nexus. The other
+  connector resources remain described by the surrounding board device tree.
+
+  The nexus exposes connector-local GPIO function numbers to camera overlays
+  and maps the functions wired by a carrier board to their GPIO controllers.
+  GPIO specifiers contain a function number followed by standard GPIO flags.
+  A board may omit functions which it does not wire.
+
+  The function numbers are:
+    - 0: Camera reset, connector pin 11
+    - 1: Camera power-down, connector pin 22
+    - 2: Camera identification, connector pin 23
+    - 3: Camera power control, connector pin 24
+
+properties:
+  compatible:
+    const: toradex,camera-connector
+
+  "#gpio-cells":
+    const: 2
+
+  gpio-map:
+    minItems: 1
+    maxItems: 4
+
+  gpio-map-mask:
+    items:
+      - const: 0xffffffff
+      - const: 0
+
+  gpio-map-pass-thru:
+    items:
+      - const: 0
+      - const: 0xffffffff
+
+required:
+  - compatible
+  - "#gpio-cells"
+  - gpio-map
+  - gpio-map-mask
+  - gpio-map-pass-thru
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    camera-connector {
+        compatible = "toradex,camera-connector";
+        #gpio-cells = <2>;
+        /*
+         * 0: Camera reset, connector pin 11
+         * 1: Camera power-down, connector pin 22
+         * 2: Camera identification, connector pin 23
+         * 3: Camera power control, connector pin 24
+         */
+        gpio-map = <0 0 &gpio1 0 GPIO_ACTIVE_HIGH>,
+                   <1 0 &gpio1 1 GPIO_ACTIVE_HIGH>,
+                   <2 0 &gpio1 2 GPIO_ACTIVE_HIGH>,
+                   <3 0 &gpio1 3 GPIO_ACTIVE_HIGH>;
+        gpio-map-mask = <0xffffffff 0x0>;
+        gpio-map-pass-thru = <0x0 0xffffffff>;
+    };
+
+...

-- 
2.43.0

