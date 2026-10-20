Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792506710;
	b=O/8m8xSfHRB7H43fXycP6dc8TxC3S331o6TmuI8qpvaYvOMlDKKRwSzAlGz9FGhK2VPs
	 00nZ9T1s/NNoz9x3yxYQM8UeVmboTEre5vD+tWIZQqpW0WGwyPGJNuWDiuE6ZhkyNMA9o
	 3ZBnS93G1VZ23SGlnmeMbmKVRuXx7UwcFtzHQFTUmRujrATfimycGxRT9BmftRfGx8Ogh
	 jhC+ES1pK8H/TO6VhHnfI5MbdC4N3v863QkcehuKcZnxyscqgPTn+PExg3lUr4Tu+RxYF
	 hA5amKGGwdUB062HwfaYsFvcjwVAldg/FkPL3EAG09pF5uQrxxK29e3cvt/pvDJlXBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792506710;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=WwZtUrdYtW8MtDYG2yC3ydbDQlF/r6XHSO1vV5BkgeA=;
	b=zzpkCqpmd0s4gEIJmdE1kj19TTdJzekFRLDBZPw0Nzh4WDs2ByLD+9/vhtp9wg4pVREb
	 sSr9xiR1wOjmbuBvADRcVK+0nEenkjzG8lvrU2ogePM6ht8AYv/r91K9Zd1nssYCJi9lr
	 l3VljZ/dmeBxP4dx9xROSn0yguMbIzTmZx/gJkYCMplK1xbuZw1Jmpm63y0KafrLDRP0S
	 Y2zNHTZU1P3qQiqBVe72S0x+Z1DdILusXccr+YajWILkTRU2r4SWnwUYoTkBfWmeJPgsc
	 o2eyv+vQaKKuTAEcSdsEYChwVyqe7Gv11mXgqJf02GX1m4bTKbn7F/+iAlbSMkh/x9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=M4tx2k2x;
	arc=none smtp.remote-ip=209.85.210.179
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00CDA606A334
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 14:31:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 00CDA606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=M4tx2k2x
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-89ff475a152so881960b3a.3
        for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 07:31:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792506709; x=1793111509; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WwZtUrdYtW8MtDYG2yC3ydbDQlF/r6XHSO1vV5BkgeA=;
        b=M4tx2k2xmNZJMm8m6vMwhs1IRwIr+yzNrp2rpQ+Em5MLK4HkH+geJySjymeetl+A8c
         dlNgIFZW78l8bFnBJ0tkA+lnZhuFzWlXW5f/yC/Z90+f2Sa1eFUDE4xcpNmnS1whNvu2
         jitzNnOWqx8aY30hBu2gQFIo8wTJDrPDExBHFqosVnrVWJmKmRLr/JJjoQSzllu3ofb/
         3UphdECxSAaKqt8pas2w+NmZebFW3zKU/8i+Jv/b6d+YfhxeGCv840GBWLSyHhjRqKEP
         TLw1s4X6zKPkc348Q+a+fHtSViHAsm6a8QE4k5JXnM/gr7XZ6KYW9fvAXGbFjy9S7iHL
         +SEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792506709; x=1793111509;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WwZtUrdYtW8MtDYG2yC3ydbDQlF/r6XHSO1vV5BkgeA=;
        b=hg8Rr+PjnCOHfiWoWYJ29cH4w9S1v7y0WTUvzQ7yz9erFLz36Uh4LzTImS9nWdB8ex
         ZexGKqYZjdksLnyH/5pjugTU0R9beTDwhzK6AykRqDMC39kB9T+sF4H+W9JUyANGdRa3
         nqaELs8gayo+9xA7jnyvD2/NZDg3ytUWLNmfJuWTtFxLriZ/GM9BRpSgDa8HTCxThKAP
         gaBoleaI2FFpHjwLBxVP6DbxXtZ+tg+bauEu0w/YgmmgoqUK2B7Eml5lXn9pwTxmwo93
         19AtPmXNBXeovgVX6C3+i67mtGdgxZLgDskdnsa9PmZieI546v3IrQ5gCocM2MCOtEHj
         vXQA==
X-Forwarded-Encrypted: i=1; AKwUvByz23FgmuAxAi6rXYvVKrEakoqhlTpYp7KFpcsqePTqkvWk7sp6bofv/+WVf3NaaclVshZNBimSAi8u@vger.kernel.org
X-Gm-Message-State: AFq9FYLDhK9EQJ8y5HyKLbIpv2m6RscQzgWGEnDFnYf0vXpJK1qYlLYE
	WsoF0HsBopNUMyypqZ3dzCN8YSNUP31jOsswS2D1+kThW7AWTer3m9bf
X-Gm-Gg: AYBFou1kIJckTZ7VFKeZOvDLzeoi8L2WFox43eiAY52SH+GohvY4AX6QMpvZ18vJgl3
	zpMWFT0ssrLxOyXZLSBM7PySMp51oEZquLLNzPx1E+dWdXyKOCOhWCBcYmk/eXEikRJEQNzvMw1
	nn4IDUXouMxWQVmK5wLjuVPPgui8L26amlkqk9HHn3G/KbPSUgIlKiGD8CftqrRsnadK/tq9y2m
	yb2wbpa/GY3i3KKZmyLVJn4h7kItMlPG/Ic1rnizxT7knr8WmnkZdgLLP/l5u6UnhKTjauyGCDC
	5XtgrIUde3fACFnr4kA6DQNCASVFLY7DyNc8K3+YvL2o9tVv3qYd2MPiavGPs5BftAxDjzKho01
	pA8Kya+pJdV1KH84/sBuFafbaLloJHFPLiwLix76wG3kUiWFFCWpsNMqcI0hFriBdbFEQrh1Rrt
	mlxWN9L65/qCfTuoi4RPZgbDhoytUCRIy91hRhC2SHaR9RoZpUIy70kx/YVagtueoOplFwqLPag
	ZPQ5QwqYFtnfIsfpEMTu/9OlO1u2/s8lw==
X-Received: by 2002:a05:6a00:4f91:b0:874:705d:f63e with SMTP id d2e1a72fcca58-8a04be20ccfmr8218788b3a.32.1792506709197;
        Tue, 20 Oct 2026 07:31:49 -0700 (PDT)
Received: from arch.localdomain (123202092053.ctinets.com. [123.202.92.53])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89f580173efsm4789001b3a.50.2026.10.20.07.31.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 07:31:48 -0700 (PDT)
From: Jun Yan <jerrysteve1101@gmail.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	heiko@sntech.de,
	Jun Yan <jerrysteve1101@gmail.com>
Cc: linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: [PATCH 1/2] dt-bindings: sound: add Everest ES7202
Date: Tue, 20 Oct 2026 22:31:31 +0800
Message-ID: <20261020143135.623897-2-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261020143135.623897-1-jerrysteve1101@gmail.com>
References: <20261020143135.623897-1-jerrysteve1101@gmail.com>
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

Add the device-tree bindings for the Everest ES7202, a 2-channel PDM
analog-to-digital converter controlled over I2C.

Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
---
 .../bindings/sound/everest,es7202.yaml        | 56 +++++++++++++++++++
 1 file changed, 56 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/everest,es7202.yaml

diff --git a/Documentation/devicetree/bindings/sound/everest,es7202.yaml b/Documentation/devicetree/bindings/sound/everest,es7202.yaml
new file mode 100644
index 000000000000..ce98d2d600d4
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/everest,es7202.yaml
@@ -0,0 +1,56 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/everest,es7202.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Everest ES7202 2 channel PDM analog to digital converter
+
+maintainers:
+  - Jun Yan <jerrysteve1101@gmail.com>
+
+properties:
+  compatible:
+    enum:
+      - everest,es7202
+
+  reg:
+    maxItems: 1
+
+  reset-gpios:
+    maxItems: 1
+    description: GPIO connected to the reset pin (active low)
+
+  vdd-supply:
+    description: Main power supply, 1.8 V or 3.3 V. Optional; defaults to 3.3 V
+
+  "#sound-dai-cells":
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - "#sound-dai-cells"
+
+allOf:
+  - $ref: dai-common.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        es7202: codec@30 {
+            compatible = "everest,es7202";
+            reg = <0x30>;
+            #sound-dai-cells = <0>;
+            reset-gpios = <&gpio0 0 GPIO_ACTIVE_LOW>;
+            vdd-supply = <&vcc3v3_sys>;
+        };
+    };
+...
-- 
2.56.0

