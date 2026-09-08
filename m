Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61C9F5437C7
	for <devicetree@vger.kernel.org>; Tue,  8 Sep 2026 13:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788872751; cv=none; b=TALyUpDi3gj3D3XU1CsPONuqoNpUsuZlUvHX1ApWRMysBFcbF2AE3dUIOLnbQPnZ8QQObJ6+WB5I23z+7qPzC0vL23BxDWH2lF9LnDkvjj8SfaNItFdfceo/RDe8mkz47mfyemSlgNhAaEsQxVPJu2ViWxNxsGh9VpCDS1gMV/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788872751; c=relaxed/simple;
	bh=Go39NKKMwkuXXP/SejpjyZo/TgbX2bfpHuiP0B8nCjc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t91JTPAiEUM2iB7Aq0Gc2Z8+7caDJp9CGWpNQJv7Y+ruXLRBUkn8AugU8MWsgeJEr4cv+t2Q393IjhDopeNQYlSiQQHmQLb5jN1m0EhBipfqTIImnGvOXF6Bo8XT3ChLtFjPD79wrbTF2Hax+QPAiC1UxXsKVxSHEE0frve4HQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=NrC+l5QQ; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="NrC+l5QQ"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-49cf4f81d86so36252425e9.2
        for <devicetree@vger.kernel.org>; Tue, 08 Sep 2026 06:05:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1788872745; x=1789477545; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=piB6olxsDjTKBBKWtT/80MoIuyo/txOuxpczb55KJIY=;
        b=NrC+l5QQzZzDbvV6/pkfTnXgMK0XcSkJnoytyNbe7501PmrJanyoeAjdRO1fdwf4Ll
         67IDRbN1G+sVWuaAd1KB2BSXS+zy2GRvqkwg2e/sN9dxiGBYuL/qIfGkt0DahOEt1el0
         MxdEls46Qbj+M/bd8F1PDJCZhbhOsv50FbzaWeJuUjvSHsw5gEMjEQn08JdFrMZtIzAZ
         BKIOHHZ25Mm6PD7co3sSdOXVJ9cmvlP3wDGtNmwlDYrIfXO/v26LidRKeDzjPHNzLzg4
         rTVqy6krhRLImqWFjEuj7dyKgnOU6pbV87DzNWsWY1+x22upFloQh7qWk22OW7WSEbL+
         VuaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788872745; x=1789477545;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=piB6olxsDjTKBBKWtT/80MoIuyo/txOuxpczb55KJIY=;
        b=IpxhOkqOaxWGd9FIHh++fdt+4Vzd/Tfi1ejL5T/Qkh8oPaxTaiOqQScC6U2URj/pyQ
         gdPzcMLCVxHusKc5uh5u4/mKCqJz183JLpq6TP8lpT6zCDNQQbrx4zbhawzYDuiKBYvp
         VxGhE08Gg38NGI6OCgt7DOebWlBPhsc4hFdI+UCU6LaguVMK23KJaYDeNBpvvPuKoqVX
         4rxvpfnDGcDcf3dGdPj3N3wIaXQ9JDmpqr5yTFgSXytC3sKslryXi7Es9l+C21HBxhTH
         yw9ZaesCUHZzN4zE2NFYz7r+5DfdegOiU4Hf2a/a5ro+jlxJJ56bB1SFICsM100tTagA
         YWmg==
X-Forwarded-Encrypted: i=1; AKwUvBzCRPyRcyOLwZ1sntXB4gN2B84K249qaHcDqw/KzDlEtM9pf9Qmiip4aiVt6AHx155RS1z2uLY309WK@vger.kernel.org
X-Gm-Message-State: AFuF++mROsR+18RZJo74LnnaUtRitOR0nP0Sm4WdcTYMJ76TrV1xFFvZ
	vmpDbrfFErOiO+xqR5ve5Bh1lJ3U2PO9I19rE8as5MiAnlcy91zMoi0bL400rM6YFj0=
X-Gm-Gg: AYBFou2AflDPM2CyPyMRKx5n+rym45ghlaKcn0zaxa2qDv3TbPQOd66L6e2mNBEevjw
	yWVcWTANrB4YwEL1Y2slNA1ROnP02O1CdRwIFWb2y7EEPeJablm/fVF+SL0joB5AMBP6G27Sc0t
	JfOLPBXSAkYQNYWXH8pW/opB18EKfQPpxzSyXHwrN30K0LgoHAsAjchFeIeGaP2QsI/kt9iZT0Z
	DcLdrtiPLo95p9eEAfJbGReyePRYVq90npm+dr+35NoORFqqRRbfKbaydiKvw5mTiyM5N/RwHXV
	FGAZdoQTZyXCVWcC56QFjq50Fcd8Bc0IEx6ORaHenIjDbE6Zy0xkOuT2jplAEAcexSrFuHUEIv8
	h7VJw9P67We6syQwdFdWwXxXMcXBh4ZhR4kJ9/0c+iNMvkftxdQQWAvB+ic1Z/M+0KCpvPNqZX8
	cu9NHi2yOXNfmJDSNmInQDX327p2bYPOSlMq+sdgmhnN2hJ7GR8RjtpdtvwA==
X-Received: by 2002:a05:600c:1914:b0:499:60bf:c6f7 with SMTP id 5b1f17b1804b1-49cf8269fdfmr280303225e9.13.1788872744932;
        Tue, 08 Sep 2026 06:05:44 -0700 (PDT)
Received: from localhost ([82.145.119.95])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce554d52esm335275315e9.3.2026.09.08.06.05.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 06:05:43 -0700 (PDT)
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
	mbrugger@suse.com,
	Sean Young <sean@mess.org>,
	Julian Braha <julianbraha@gmail.com>,
	"Gary Guo" <gary@garyguo.net>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v8 1/3] dt-bindings: pwm: Add Raspberry Pi RP1 PWM controller
Date: Tue,  8 Sep 2026 15:09:12 +0200
Message-ID: <ee0aa89faa14e0073f1271693bae28678652998b.1788872294.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1788872294.git.andrea.porta@suse.com>
References: <cover.1788872294.git.andrea.porta@suse.com>
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
 .../bindings/pwm/raspberrypi,rp1-pwm.yaml     | 66 +++++++++++++++++++
 1 file changed, 66 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pwm/raspberrypi,rp1-pwm.yaml

diff --git a/Documentation/devicetree/bindings/pwm/raspberrypi,rp1-pwm.yaml b/Documentation/devicetree/bindings/pwm/raspberrypi,rp1-pwm.yaml
new file mode 100644
index 0000000000000..be020583fd0ba
--- /dev/null
+++ b/Documentation/devicetree/bindings/pwm/raspberrypi,rp1-pwm.yaml
@@ -0,0 +1,66 @@
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
+  - Andrea della Porta <andrea.porta@suse.com>
+  - Stanimir Varbanov <svarbanov@suse.de>
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
+  fan.
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
+  dmas:
+    maxItems: 1
+    description: |
+      Phandle to the DMA controller and the channel specifier for
+      the duty-cycle FIFO.
+
+  dma-names:
+    items:
+      - const: tx
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

