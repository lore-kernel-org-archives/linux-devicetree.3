Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 871E22E7185
	for <devicetree@vger.kernel.org>; Thu, 23 Apr 2026 08:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776932852; cv=none; b=WAoJr1VE+xL/Tc/frvMyFlTCgBQY5oBibYOKaHr06G7ZY1tTpGD3cFvZUMkYHppYpQBzV5toscyIDbETi2dbTusb16VRXgKEGS+1TWZMWVOBMHq2BCjZoWxbGcmk7aYSX/QW4v971nPy/YojFZBVq2gggFeCCRfsFPv4PyLmr/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776932852; c=relaxed/simple;
	bh=Ca8dJCyW90j7hqP0A78f/8T/XkttlZt+kLnyxO/ThgQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aERJbz/jThCMe0hQZdXKjxpH9jHiquIeJdMv9ouLDDCXobieSQTl1ZxB0tuJS2BNWTfjIMhQvWl6LbSBHrAOIbIUOlhEpoJaMKh1hiDcXL5OSRFR+jXZRhhMLB7xalp/K8YGw+8IWrYqgdmrmmkDaq8iJ9B1/nJ09W0WXukIvsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=QLPiOoE+; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="QLPiOoE+"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-43cfbd17589so5074003f8f.0
        for <devicetree@vger.kernel.org>; Thu, 23 Apr 2026 01:27:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1776932849; x=1777537649; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dtYIyyZaWf61k5kElg2az5B4nsfuSPsBrF1eNrN0vS4=;
        b=QLPiOoE+Jdb90FT4A5s51AmuLynWJq/68afm0UynKo8m68XzLo/dw6DSoiTv7YZwCc
         VfE9R2zbZ5YmYUsHZCNCLgtkY1Ov+mc0wzteasn2tE/+C0gYW1n4ClerTUGvAMOD4YcH
         P4a3vuCe4zLC6iCzcf5NS1NDVxzL09KuySOh64S3uRSadrLYoHk8YdOFmVkmxLSMAdf8
         cwuxsxYHVm3ZKhPfyn3c4+0tTMsVy+brDj2J9ptKbbFnTq7CmcK4SXzoX60E0fmfoo+t
         g1gmgWyzIroeradqzL3cc8n03hlrF+GZSn3cOJs3Rla6cvm+ollEaVcRTs8deE5ObbYo
         Y9TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776932849; x=1777537649;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dtYIyyZaWf61k5kElg2az5B4nsfuSPsBrF1eNrN0vS4=;
        b=peKHQNwrO+mJ5q5mMNE1EFlMT/RXuosE/jmRiy4cG2czkoc5rgRNc+F0MSVWAEQ+/d
         m12MRh/vBaG/wwRdT5KILy/BaOo4LV6Yq64xMP6aMo96LBhK8vgmeYZolYsKq7CbmBuj
         bHmaoeCmLR4Eq6cPovzc/9G9nuay37xcfDFkbiM7kxuEZT8P9f2bdk3ao7FeLJc0kNj3
         Hzv3IsZ24Vuaw+dMXZzzrwxLVO8O+R4qrDNiyb7/lMfglZsI8AEg0UJeSZ2mpoD14dT/
         YA6B6Ja67SbWtRM8Fofx6Xb/WXTsegHaILD8ORlHDUlRXujvddqfup41W/uqACG22Ew4
         qdnw==
X-Forwarded-Encrypted: i=1; AFNElJ9Se0Rl5bRJfTX1SX9Sp+wB4PGjUjjakTKKwVzHltigGo2KUuJE3i7b+knTkmUB74dUC28m6H0ojIxO@vger.kernel.org
X-Gm-Message-State: AOJu0YxxFcDocMKKKYefastJA4EHqHOFCTPJjmispEwuuqQYZQ3O8+hE
	Q3S0eeWhzD1YbtzZWcPE6xz3Z9bBrJ0JU/hyHi0mzIQgl0mu+zLtupa33RixIdZij0E=
X-Gm-Gg: AeBDietI48NG/eOEz5pWCJLtTpny3L2EUscdQ9gn1Wj3tekS/ECywRMBiI2+mjxksXb
	q0pUbfKZNwWvwcPzNR9D0MvGt/hmbrYPnc/A2ejETRmgYHhemySavAUdW0EIGCzoLqUneCDZjxY
	45jnCW4vh79wlMNxJSAyNVTc2f6SK9564GjE5IjlgaKhjRcJinEVhkPIcMRaadvY8CdNGrIUPvb
	gw5MSs2K/1+36f9uXeJUh3Lp3r2UGwpDK36B2UD8wziYvPWL8vQz3G+0WxgS1sPQFxHQJMzZUYf
	rgsP2UnUUoYfTX3QUpkVBzHKGqfkU06Y4hOH/+0LEDROOCX8gtxmQDNUOnq3VwFI+win7QzOY6F
	BIQuPbAeSizFy0WRbAnk2n9XmAknBb5cvjwmMJINjENpieUkNYIMulIAF/ak7FIOKrFtlGGRF0A
	RABUiwzzVbtF38EOol/DGyHmRjnlHszLA4AaV/dcerTg5qXcm0l5aQyldtzSiVuAeNXdOiQ/0/f
	fKuPvI=
X-Received: by 2002:a5d:5d13:0:b0:43f:e990:2f5d with SMTP id ffacd0b85a97d-43fe9902f8dmr34420482f8f.35.1776932848874;
        Thu, 23 Apr 2026 01:27:28 -0700 (PDT)
Received: from localhost (host-79-33-140-232.retail.telecomitalia.it. [79.33.140.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4e3a174sm56836569f8f.18.2026.04.23.01.27.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 01:27:28 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	linux-pwm@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Andrea della Porta <andrea.porta@suse.com>,
	devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Naushir Patuck <naush@raspberrypi.com>,
	Stanimir Varbanov <svarbanov@suse.de>,
	mbrugger@suse.com
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v3 1/3] dt-bindings: pwm: Add Raspberry Pi RP1 PWM controller
Date: Thu, 23 Apr 2026 10:30:19 +0200
Message-ID: <f21a27b3eed72014cf21650ab22ff45446554d59.1776932336.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1776932336.git.andrea.porta@suse.com>
References: <cover.1776932336.git.andrea.porta@suse.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Naushir Patuck <naush@raspberrypi.com>

Add the devicetree binding documentation for the PWM
controller found in the Raspberry Pi RP1 chipset.

Signed-off-by: Naushir Patuck <naush@raspberrypi.com>
Co-developed-by: Stanimir Varbanov <svarbanov@suse.de>
Signed-off-by: Stanimir Varbanov <svarbanov@suse.de>
Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../bindings/pwm/raspberrypi,rp1-pwm.yaml     | 54 +++++++++++++++++++
 1 file changed, 54 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pwm/raspberrypi,rp1-pwm.yaml

diff --git a/Documentation/devicetree/bindings/pwm/raspberrypi,rp1-pwm.yaml b/Documentation/devicetree/bindings/pwm/raspberrypi,rp1-pwm.yaml
new file mode 100644
index 0000000000000..6f8461d0454f7
--- /dev/null
+++ b/Documentation/devicetree/bindings/pwm/raspberrypi,rp1-pwm.yaml
@@ -0,0 +1,54 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pwm/raspberrypi,rp1-pwm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Raspberry Pi RP1 PWM controller
+
+maintainers:
+  - Naushir Patuck <naush@raspberrypi.com>
+
+allOf:
+  - $ref: pwm.yaml#
+
+description: |
+  The PWM peripheral is a flexible waveform generator with a
+  variety of operational modes. It has the following features:
+   - four independent output channels
+   - 32-bit counter widths
+   - Seven output generation modes
+   - Optional per-channel output inversion
+   - Optional duty-cycle data FIFO with DMA support
+   - Optional sigma-delta noise shaping engine
+  Serves as a fan speed provider to other nodes for a PWM-connected
+  fan using shared registers (syscon).
+
+properties:
+  compatible:
+    const: raspberrypi,rp1-pwm
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  "#pwm-cells":
+    const: 3
+
+required:
+  - compatible
+  - reg
+  - clocks
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    pwm@98000 {
+      compatible = "raspberrypi,rp1-pwm";
+      reg = <0x98000 0x100>;
+      clocks = <&rp1_clocks 17>;
+      #pwm-cells = <3>;
+    };
-- 
2.35.3

