Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795577290;
	b=vze6ffLiGv2d9y2h0JhPPALFo20UCOdZcqD6hXfvpWdNGfQAxx9OBv2WPKtXt9Jl7pg8
	 QwOA4h0s41DplJwwMI1bYOymPhU++j4O+H72higKHW9/GsOusZdx5qclS55kANvDplfXl
	 Vs1egLL9szDqGY/bTeB5wnVxBvuqBbyfIOAdy4xqB7Q9WONqYJQS2x7MD9F8+g8V7LFNu
	 ZmxdqcdD+xnf23AKzQQnKtdXgQanoL7fLt00K+uW+nUo3/JCajneLRMULsoNdHtlgEaK4
	 EDMpmGFvI++fCA/jVwx9QDoUnj47Y0kDZRR+4nWiC8UVKuclcCiWIiXkLhv6M2c/uWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795577290;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=SOkOs4X+aYTNF/FE843B5YIM2qcfhLHQtKB0HpI+vVI=;
	b=SsRacERb/zUMom64YhKK8RylJkmATztaizHciZeCKzdN9yck5xMp32acQvGOCuggdk5E
	 oPMfzQSM8ONAXmjNYb4UMTFMnesh8WcOyzijKTtqI+/2MYhqk9PZuWUWn5de5eSmGo3eG
	 rpBNvnmcmm+lIuM9mDYef35L7IFskb68OMGWXLIDrChU1kY4QLiLwefv4ODXPTTkZyr5c
	 aXW7RErk7b51RBycoiiP6wJdocn1L40SGwwgsf3GMojVeXLV/vS4e+6ZaNVjI0/WA174J
	 +kMZgoNGiiONU1ve0tguqXNqSxYyF7xvQ8N1cwDjaKn3tHDePgzfG2hcs7J4iCbkUlw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RpixMif4;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13E46606A696
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 03:28:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 13E46606A696
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RpixMif4
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48e20ed3b9dso4612360f8f.2
        for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 19:28:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795577288; x=1796182088; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SOkOs4X+aYTNF/FE843B5YIM2qcfhLHQtKB0HpI+vVI=;
        b=RpixMif4Byh/aV3xfOnH6SHw4AKFvidBBjZpuYgB4fwy5TNRO40GwWG0BFFM07jT5w
         bYWsepGfPXvuthLdC9uWBn5YrDcQ+iC56WlyAfSnJP0alv38jE4vCDhVrsWFN6w0di6g
         /mS6l9NTGiuzLyYepRo2qF2ZRzYTP1cQfkHmVTuwUNc/a8RA1XJf13fpxBAZULGT5pmK
         sd54elbf9/FlRGAqyzNODLlXoOwUyvNdaFLI0uSb7zBDJe6vKmS2y8Bk+16k2QDQw+pi
         fQSQZaWvqlZhJvGYid2Yktf6VmeglBzrW3oIAU+Z6tlmsK5AD01z3VXSMe8XQXDrGtGT
         sBkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795577288; x=1796182088;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SOkOs4X+aYTNF/FE843B5YIM2qcfhLHQtKB0HpI+vVI=;
        b=VCXWhCgi+tI0N7nRMrZx2QGLnWiMcGfdZKEugzP0uXGev/umzDJW9KC6Tc8Btbzn+c
         l/r8k3nwfzZSoZUTIVMrTF32JHAYQnGE22c2awpDyb6JS4r02N6/CKjOPiMdY7Y07E2u
         OYIuDMSNGXMhluxekOSA5ZMUo/OMdyzNPZ7qOWXadp8p1ukXkTCCcO8bU74d7bpNCmLN
         Hp279B4lIWRaFhGEYBeTsAF5vJ1lSnogrt2S+k5HD8XzNLd5vPVUky1VHGLroMi6OozQ
         cfAEmAhtpDHJ9m0rTTccG8uQMUNnOf1/veGGME1RJTpxKpaJduPnSwAJI0I2/nf1qE5x
         cioQ==
X-Gm-Message-State: APuU4Z+6mAzV1E+zntQOwwsdfDuWZQ95HwG6ixALNnFm4HX3gcJVGjtB
	FX7qOR7h1XfJmeLE5ULoQP7EX2+VG7qiXCcuEUeUCnzKV6LtSfbOcKAz
X-Gm-Gg: AZFdTZfAqgwUGXXVsu4JaHtNhsP5bHUkDZ3MZeyIuT+a5Bix3/9CtpFovc4btOgnL0b
	mjYoCenVE0z6Qmr7YtM624S7cPvsHa9qQMk3mL5DH/b1fncfmxCJF7zvqzsraAlaHsr8fWFgf2H
	opecq8kzPwGU69+uBNCGM5IK6ReXixpZAYm6j+WcuGlENYw7D1ijU47q+fxvMDt0yN0GvzAO45j
	UAgUn9+rzdyAuhfAt4SieHKr9otjiEEpf/3l6M2XpcM1wLkfRQPOtHm+2XvvgJKrTryEWkoRgJ0
	5efbjlYMAOE8v7XRPGUPXnjby65lFDrBj1kCpjEJQL/OSjiqrcwO805WbXTqdykSZMVBO22m/GN
	JHrINI0WiAIxfwA9QmbVlMM8vIB+LcNsjFw31FvrDcj14QeQPAUWMt8dpqUeaONqnVKEU8I9Jy1
	9Db4aHwXzBxIg7eRpLDlJ8AGeoBDg9/dSazjQLdBMzqzFs00qVhu1e5up8pXQZlsKE0SDOKSBYD
	PrRcgXFCTPuYuR1WNJhjlG4uzKRZjd0noev7D4wtisURvL5fI29zBaDYc1QateuvrzumeDRsuA9
	NXJyk9KU3EpwqiFA6eXRi9NwA5h41oUHiH9GYAaRsotBpewILngYT8Xw32s/tbibftSQykMdLC9
	Eda4dJ8fFl4F3qUlzU67X/OCn1H1Pgs8=
X-Received: by 2002:a05:6000:60e:b0:49c:fde4:1af5 with SMTP id ffacd0b85a97d-4abb9de7e8bmr30366806f8f.54.1795577288400;
        Tue, 24 Nov 2026 19:28:08 -0800 (PST)
Received: from DESKTOP-BJ3EVC4.lan (178-164-182-185.pool.digikabel.hu. [178.164.182.185])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67fe48sm28918822f8f.23.2026.11.24.19.28.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 19:28:08 -0800 (PST)
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
Subject: [PATCH v6 2/6] dt-bindings: display: panel: add LG SW43103
Date: Wed, 25 Nov 2026 04:27:58 +0100
Message-Id: <20261125032802.8460-3-rofikcoga@gmail.com>
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

Document the SW43103 FHD+ AMOLED panel used by the LG V60. The panel
uses DSI command mode with DSC and DCS backlight control.

Signed-off-by: Abdur Rofik <rofikcoga@gmail.com>
---
 .../bindings/display/panel/lg,sw43103.yaml    | 67 +++++++++++++++++++
 MAINTAINERS                                   |  5 ++
 2 files changed, 72 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/lg,sw43103.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/lg,sw43103.yaml b/Documentation/devicetree/bindings/display/panel/lg,sw43103.yaml
new file mode 100644
index 0000000000000..971547c48bd6f
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/lg,sw43103.yaml
@@ -0,0 +1,67 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/lg,sw43103.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: LG SW43103 1080x2460 DSI cmd mode panel
+
+maintainers:
+  - Abdur Rofik <rofikcoga@gmail.com>
+
+description:
+  The SW43103 is a 1080x2460 command-mode AMOLED panel used by LG V60 (timelm).
+  It uses Display Stream Compression (DSC) over a 4-lane MIPI DSI interface.
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: lg,sw43103
+
+  reg:
+    maxItems: 1
+
+  port: true
+  vddi-supply: true
+  vpnl-supply: true
+  reset-gpios: true
+  enable-gpios: true
+
+required:
+  - compatible
+  - reg
+  - vddi-supply
+  - vpnl-supply
+  - reset-gpios
+  - port
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    dsi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        panel@0 {
+            compatible = "lg,sw43103";
+            reg = <0>;
+
+            vddi-supply = <&vreg_l14a_1p8>;
+            vpnl-supply = <&vreg_l11c_3p0>;
+
+            reset-gpios = <&tlmm 75 GPIO_ACTIVE_LOW>;
+            enable-gpios = <&pm8150l_gpios 4 GPIO_ACTIVE_HIGH>;
+
+            port {
+                endpoint {
+                    remote-endpoint = <&mdss_dsi0_out>;
+                };
+            };
+        };
+    };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index ccbcdc0799b9f..3386c7dfb9493 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15211,6 +15211,11 @@ F:	Documentation/ABI/testing/sysfs-platform-lg-laptop
 F:	Documentation/admin-guide/laptops/lg-laptop.rst
 F:	drivers/platform/x86/lg-laptop.c
 
+LG SW43103 PANEL DRIVER
+M:	Abdur Rofik <rofikcoga@gmail.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/display/panel/lg,sw43103.yaml
+
 LG2160 MEDIA DRIVER
 M:	Michael Krufky <mkrufky@linuxtv.org>
 L:	linux-media@vger.kernel.org
-- 
2.39.5

