Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795107270;
	b=LycumD/FsMP0um89lQr4sGyMXoap2tgpYTDsJCgFcN3l7jqAXzYmjhQmFt6MRC2Nama6
	 HkaRsEqo9rJUCRjxlmS1Vb0d5gmKiM4wvHWJPBHAeqnwOUNjE7HtXyrhUstN+QS3qbxGp
	 edIG/Yj521OcQvk+4JhTuWv9aZTecc8s6mkkxJFk5BZlgtu5yv+TpdGIP8vlrDjTdwv9m
	 slKJ24mLghvWAAlVbSoWj2ADje7w9qJuc001f1XA9ig18N/MEMkb5MebOrkSpGzn5usFC
	 6Hkty4kiTT1ummwRmyAaA87KKQCM3bL4hzq+ZslCIrMJMuuTFZIMDxW6VhpbRWwUB/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795107270;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=VlPXjcEHW+lGnIptKKRSC5EQ8CQecxUOoIc+hyAGrok=;
	b=ewnHGvktoNQN4tqATn0kb06bj0vVoVjaSbXpNoP1Wn+FN2N+1Ze9nH+eJ5F2Gc7ZXlcq
	 3e6dSG/KvXHHjpCj3TT/45PmNNuF8HA6BAHmVrU6QN+drJevgXuenokbCljL/WwG02GPh
	 7ucVwRd0p0hoUlO+kNkhakWNLftTdRkePzbnF172DY8wCIeUL+y/rXH3vTAxQM3kyoDmG
	 sSPK+QzQ4T/lq0aXA5usvrLbPwFBEHRGsxKxBlb1MpDLg5c8a8A5I/fekV6ayPSv9bPji
	 4Pg1p6LjzTvcKCJw+lsqVtVjMTXw/01hyLR4dvlcu9lJdJCzZ77yMuzE4Q5PFEzmvig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R+5DdiOM;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61C3E60A381F
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 16:54:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 61C3E60A381F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R+5DdiOM
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a2000d5fb1so14782135e9.1
        for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 08:54:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795107269; x=1795712069; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VlPXjcEHW+lGnIptKKRSC5EQ8CQecxUOoIc+hyAGrok=;
        b=R+5DdiOMtL80c9mcJ5/KFHY0ZO+dJukfZdTMC2UzdCESjd8f1Ba/Hc3GxX3xNxmVsL
         ZVbM7daQY/whHTYRSQ44gXKI/K8p7wFjj5fzydgXq9FHdiDNMf7UHIaSB1XvXWGhnv/m
         Yc4iPjIVuZr6a8fd6I3YnVVNGO2oJBhwb6XMEX0OO5H8Bw0x0bNj6qmEmnoPXB14KLag
         DUP+9XNzj+038+vk+FXla4L5LSkEkaMl22I0svP6z6myJoGAFCVFnkZmhZGFacxMxRUO
         cucQKdZtIa4k1xngqIh6GWtKQcDtwwoxmzOtybDXsTvU/2S1bsaJNw20j4Wh0K7gRLSn
         zFMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795107269; x=1795712069;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VlPXjcEHW+lGnIptKKRSC5EQ8CQecxUOoIc+hyAGrok=;
        b=CPx3ZCktOKxm8pfwuuP8bvMRv+/5BghpPLJPmYEH8IYVdAs7JzkuzYO/BPtmkdOkBU
         rLCXAe+fPpbKB5xudGv+qdwQBbcBLTKaDkei3+wBHRpPN+/HGOgZeFX0U+FbZK0iM490
         29SFpRQ1Lw5UCRFjoHbrzlLTNQlDTQK0uZYwmlFEO87d/Y8hrctL0Qii1gt6v6Nerfn3
         YkWOP7EhbcCOzG5tWfSHECLi6oyH2k20lU+AzErMi5EDzpVHcBaTSOlddB9NM1OFReXr
         nQ8sOsw0zZyywrbQZ6csogmJVI7EolBU6bhTWn38o1rUThlQhFiyeJtfVD8Ydg4BqhMm
         cA9A==
X-Gm-Message-State: APuU4Z9Bu7IeXSHRbp3W1OxeUcW91O1tQNsc8+EaodCZtxbgTdq/j0kH
	lngyHa2coeZXTi2iJ3E8kFfKrPo7Bhh/8zZsGcQQ8iMgkuJaayMta2n4
X-Gm-Gg: AYBFou11bzcZN7/NS3iteAk6AZGLIAMRLUrWqY4DIWV9H0aM/+B1xFgbJJogHKtI+DJ
	VBezvC71ZeveAWeYq+O4ifEqsfrSa/LwlTQtX/Kbsk3mDYoObNHBhapXCuo2wVkt3kFD0NX1JU0
	c7D+/lEnk6TbAxPKDaoQjKxrI1yFvY65c2s3NpamCJege12cRfaHdX4sQXySAZkSKKmQpZ/OIbm
	Vsd+Ac4gG716Z7m3LjvIjnyffq6sOH01jAH7NHIbNpKqvQzFfmcK4Yi5IR37WMtZDnPo0dzhxij
	fq0MVH1VrFekPnC50B8agANXStsf1dSOxnS9n78qG9rZu8DZqg+0emhWI24HB9WAGMd9umzmFDE
	W9qLVfJlBqLCHei+jTMIHGvElb6q8D1x6KpzUSbeNNMMnDs/03WrhT+q37b8jvNpdpHIXwl7ist
	2xPJJ5KG2t3fmKTLnfzBiPkNxMM+/QfChshUp/CTAqXWcyZFPlK1qAGHFPKkhlemHEM/y/JAhx7
	6Ma7o0mbsA3Mns6X/YI5OZVkN1K3HgbO//ANYVs9IMs65MiwEuQh+RqqJlWdDZPWLMHY6mp47jg
	kLqhbvUhxILqGDnalFT6r+WxJLD97Bwf2N1ot9mmP+grUaOotqbXQkGYr+kq1vYqgZPyw3adHKo
	=
X-Received: by 2002:a05:600c:3b98:b0:4bb:7033:c92f with SMTP id 5b1f17b1804b1-4bb88826810mr1542285e9.11.1795107268658;
        Thu, 19 Nov 2026 08:54:28 -0800 (PST)
Received: from DESKTOP-BJ3EVC4.lan (178-164-182-185.pool.digikabel.hu. [178.164.182.185])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88402ce9sm9894555e9.0.2026.11.19.08.54.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 08:54:28 -0800 (PST)
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
	Ivon Argel <ivonargel13@gmail.com>,
	Abdur Rofik <rofikcoga@gmail.com>
Subject: [PATCH v3 05/10] dt-bindings: input: touchscreen: add Silicon Works SW42902
Date: Thu, 19 Nov 2026 17:54:15 +0100
Message-Id: <20261119165420.24466-6-rofikcoga@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261119165420.24466-1-rofikcoga@gmail.com>
References: <20261119165420.24466-1-rofikcoga@gmail.com>
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

Document the Silicon Works SW42902 I2C touchscreen controller, including
its interrupt, reset GPIO, power supplies, and panel touch properties.

Signed-off-by: Abdur Rofik <rofikcoga@gmail.com>
---
 .../input/touchscreen/lg,sw42902.yaml         | 73 +++++++++++++++++++
 MAINTAINERS                                   |  6 ++
 2 files changed, 79 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen/lg,sw42902.yaml

diff --git a/Documentation/devicetree/bindings/input/touchscreen/lg,sw42902.yaml b/Documentation/devicetree/bindings/input/touchscreen/lg,sw42902.yaml
new file mode 100644
index 0000000000000..c5ec3bf4e545b
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/touchscreen/lg,sw42902.yaml
@@ -0,0 +1,73 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/touchscreen/lg,sw42902.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Silicon Works SW42902 Touchscreen Controller
+
+maintainers:
+  - Abdur Rofik <rofikcoga@gmail.com>
+
+description: |
+  The SW42902 is an I2C capacitive touchscreen controller used on the
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
+            interrupt-parent = <&tlmm>;
+            interrupts = <39 IRQ_TYPE_LEVEL_LOW>;
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
index 28e4aac18d44a..a29019d984393 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25835,6 +25835,12 @@ S:	Maintained
 F:	Documentation/fb/sm712fb.rst
 F:	drivers/video/fbdev/sm712*
 
+SILICON WORKS SW42902 TOUCHSCREEN DRIVER
+M:	Abdur Rofik <rofikcoga@gmail.com>
+L:	linux-input@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/input/touchscreen/lg,sw42902.yaml
+
 SILVACO I3C DUAL-ROLE MASTER
 M:	Miquel Raynal <miquel.raynal@bootlin.com>
 M:	Frank Li <Frank.Li@nxp.com>
-- 
2.39.5

