Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 360324C8C54
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 10:14:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792404854; cv=none; b=fJaMXX5jKhJNcqwyRO45wtIrS3LqEozcFF8+xt7qgjL4oTG7LFFtqs41HU96ctmiaWjDCMzwlpGgF/jHKmjTD1Z54ojSnpnRK9EoJJJBcjikS1E8rb0WvyLH1hGrgtLmIRhgZJkFddNrjoBXRvcE7O8dm/jQKd/wTdSeCD4+0n4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792404854; c=relaxed/simple;
	bh=aR5OSmq23bLV4lV/PZCwDUREMgyfHjAL91EyeuGpuVw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=B81j+FB38RnNytzoyJ3Eer4PZhag1zkB5th3UZ0zzLNLK/FrzG4Xk+rZTNkMWpYLv2WQHYZM1QcTeA+XKYSYW4JSAtoupwj2BluWtH1X48xcyj0GpfSyrtX2b7V61LK3HtoNog3eujd7UbxMXoLGXVnHnRMlJMW8Mk2KxgEon3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q0upcJcN; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q0upcJcN"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a1dfd49525so10768235e9.0
        for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 03:14:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792404851; x=1793009651; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GaYNfmiJAdoDL3WIMAcoiEX2xPvw24j0M/jps2oZpr4=;
        b=q0upcJcN3ers98XFTquqk4j+vwTfMgwIKkE6hoLK/zQ1sticoF5gThEUPk4CDe3Qg9
         nB9uAyU9ry92lwjSw65F+2+Om/BydqfPIjUXhXcuL9wELtIoxTlIAHq+KhuqMdQZujNf
         jKtykNNjbz1wQNBR4OENLjvtB5lA2p6BLCAwdePWGI+VwHwD/8s+YVREmfsaoxv0iUK9
         pEnwKszZJvXlUiKGLUihH79RWSw01PZbnlQj5LdelYnHzqze2m8k0wZzPPhmIc5kJd2O
         bKeDpXJ02221zJVMgZGJPo5il1myWBYusNwNnhGXfdgheGa4swKoUB42HMxLdIyFJo3E
         ao/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792404851; x=1793009651;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GaYNfmiJAdoDL3WIMAcoiEX2xPvw24j0M/jps2oZpr4=;
        b=RBzVeV2Qvju/r+unWRvvCGFu2R3oFjjJfXeFe2Re4ymqBTiJOPVDYJoIY6KLN/L+tj
         gE7HwbxyerNpGvpj3/DLGhHQSjR+7X0GOucY2wcAWzB+PmEQ4UcNjwNAwKfk3SPa+wdd
         wq9yqEpdeJOyP3qn0tDtR/viqzYRofkUFJUnwT0aRDtrMb6NFHrwNOkAIRQVGFBekdt/
         p2BrcuvprgdgKPIh9VAsZ8eg0G37F2YRZiPq7SMEcO9FsCj/4HALq7SwPV3yAE4RENp6
         1lckGciEdc/v4rZp1HLiOSaI8OqDoz6eEMN7/NdnMTQVUajmgp1cRVppOWgqlVYxJtuU
         8eXA==
X-Forwarded-Encrypted: i=1; AKwUvBzsDPSim9SkFQG3jpYp/Q5tCrgY5Bsnd+tjnrGjZreSwYRHRTh0K/2IPjtgtwuhBntQ2F73xNbXnHRN@vger.kernel.org
X-Gm-Message-State: AFq9FYKlxLtrKR3wnWHjNVq4Sa2+XMKFMxZO1H8gJ1YftpUCvA5N81Lc
	7aLF0JC2PpRgrkK/5lDMjfo+Lz7Qtt2LY9V7dcrSVxTTHKtPw3JSTBia
X-Gm-Gg: AYBFou2awRuoJYNv2dlUkx5agYE1zfB5/3znqdrtWTWHqKii1BfyUFcwGpkffcYe4o3
	1dB6fqRzhTA61jhe9Ykgy2xno0XHWvWVqjRRx/xmLjsGm2ZX8BEPc+w1QUEhl8nis9EL/sf78AM
	kudWsOw+D0KH266XT9TSgsgDrx5au+EsYNZxUYfDCiRw/BOW5a2vlA9/ke1CdwUEtaJA/wyCzXa
	3OQHY4CmNtKbvsvAblbIefer9fss5mnXMK5LndYdUmQy1yh1MDiatzCxRr0JA4EGapWbJ5bqUSu
	3bRckDc9CSJeQHb5sGxsdthVldO/n8sRt8X8lYb/6TwXOol/pxApA147z8n00j4jmUTcNwzIPW1
	s3JSnuG02BipCnXhdTJf9fDwBWL4g+hT12oOtS1GF0YbYVgTiLP6kyWoMKFilHAY5ODRsGAh6M9
	30qKnthMEbHqLoEwT9tmhZQG37F8IaRJusclmJ/uEtVYLexjVbtYjZgMiW52+tg27YZKLOr/gAn
	7F3pUNOTBLA+b5TnA0=
X-Received: by 2002:a05:600c:1394:b0:4a1:d492:1604 with SMTP id 5b1f17b1804b1-4a1d75f2524mr156656665e9.11.1792404851325;
        Mon, 19 Oct 2026 03:14:11 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4f5177sm21822041f8f.30.2026.10.19.03.14.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 03:14:10 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] ASoC: dt-bindings: Document FM34NE DSP
Date: Mon, 19 Oct 2026 13:13:55 +0300
Message-ID: <20261019101357.117462-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261019101357.117462-1-clamor95@gmail.com>
References: <20261019101357.117462-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Document the FM34NE DSP based voice processor used in the ASUS Transformer
devices.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../bindings/dsp/asus,tf201-dsp.yaml          | 77 +++++++++++++++++++
 1 file changed, 77 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/dsp/asus,tf201-dsp.yaml

diff --git a/Documentation/devicetree/bindings/dsp/asus,tf201-dsp.yaml b/Documentation/devicetree/bindings/dsp/asus,tf201-dsp.yaml
new file mode 100644
index 0000000000000..46308a462af16
--- /dev/null
+++ b/Documentation/devicetree/bindings/dsp/asus,tf201-dsp.yaml
@@ -0,0 +1,77 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/dsp/asus,tf201-dsp.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Fortemedia FM34NE based voice processor
+
+description:
+  Fortemedia FM34NE is a hardware voice processor (DSP — Digital Signal
+  Processor) designed by Fortemedia. It specializes in real-time audio
+  processing, focusing on noise suppression and echo cancellation.
+
+maintainers:
+  - Svyatoslav Ryhel <clamor95@gmail.com>
+
+allOf:
+  - $ref: dai-common.yaml#
+
+properties:
+  compatible:
+    enum:
+      - asus,sl101-dsp
+      - asus,tf101-dsp
+      - asus,tf201-dsp
+      - asus,tf300t-dsp
+      - asus,tf700t-dsp
+      - pegatron,chagall-dsp
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: Master clock to the DSP
+
+  reset-gpios:
+    maxItems: 1
+
+  bypass-gpios:
+    maxItems: 1
+    description: Signal that switches DSP into programming mode.
+
+  vdd-supply: true
+
+  port:
+    $ref: audio-graph-port.yaml#
+    unevaluatedProperties: false
+
+required:
+  - compatible
+  - reg
+  - bypass-gpios
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
+        codec@60 {
+            compatible = "asus,tf201-dsp";
+            reg = <0x60>;
+
+            clocks = <&fm34ne_clk>;
+
+            bypass-gpios = <&gpio 222 GPIO_ACTIVE_HIGH>;
+            reset-gpios = <&gpio 115 GPIO_ACTIVE_LOW>;
+
+            vdd-supply = <&vdd_1v8_dsp>;
+        };
+    };
+...
-- 
2.53.0

