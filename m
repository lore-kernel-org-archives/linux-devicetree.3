Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BC8E3D3492
	for <devicetree@vger.kernel.org>; Thu,  1 Oct 2026 16:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790870801; cv=none; b=rMVjNlIMBieBPJjwDidKsIXLeOPWLQOZresiovveJtCWlugIK1LIZkFCN8I7SrXcKVHkhG1SkRFqYMqN6iLpstGyqEBieWho8H8BQKKOindD1YPzxDLicM0FLoUOxqQ+1BSaZ+Sv+5BQ4YkIF5Lpn2tGreCQSvO213q4YUunW/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790870801; c=relaxed/simple;
	bh=WgAh06pTErBsg1r/NbbofMqPA2B5H76POkIEZ1f1w4w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mARg7uwo/BbIzDhX0+lV5W/xaKjJNvAnNHGEGdil71cmKnTdEA3uWH2ued5XcgW2R3sXhmnaBwarAWy7OEZjPbQb8nvpSKHWK8rg9nUlA5HcnV6oFbCE1Td21rA8gNnU+KaOSa5p5LzB8IPgDKbV9r65G+DcCgD620HILD7IoUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=i+0xsAgd; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="i+0xsAgd"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-4a006bb267eso26083565e9.0
        for <devicetree@vger.kernel.org>; Thu, 01 Oct 2026 09:06:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790870798; x=1791475598; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ojl2W7T3yKD9ARXzuM1thSb0JncbAdcUVHPn+qvV/1M=;
        b=i+0xsAgdUBTcQ3ihkKPMZ6yfwFRHNc2qlJePLyOJti4QqPqmBK9m8EX9OmH8IOwChm
         CUk/jkeBwkCRCEAzB6kAAEZYhSrpgP64bpxLd0KOBRqqmOGI6/6vN2km1OKE3nlHxtwC
         Rzw1lL6gzDsTJHeqoEzvsiMfnRmfP761CP1OQ4Lksxn2qMGQncAfcZWJpAwnIlsw9k4X
         hIEg8lsPBYbpjveEf4XTkwERu0f0IHN0NzL8nfpH39WYvG5BYlQ3Oa0QBSbauGiv4Vlb
         bHPr25HjzUP6Q7xROS8OczuiHiQGMM5wL5qmy84XpETMgoNgnVzS27DGtDQHj4kDF1L5
         sCFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790870798; x=1791475598;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ojl2W7T3yKD9ARXzuM1thSb0JncbAdcUVHPn+qvV/1M=;
        b=s77nNTNY6JZZAlujqLKZGdoY4yJVjfec2ce1RAMVXM/KHmdAlq6cUrtND5/5CmIczu
         JigamxVPIn87vgDtedA3dIEjnxpRj3D7cYUybNkbh9FFaXfrRP4eNwbYt0gQBMY7ixMU
         CW0E9C2KlB4kmyv20XaajGttnntfzMcEBERHK9zWXMWlesLhel6jDI8l7J8MQVPUJNxF
         TcLwIqtjd5YcCxZPPZvSRZZRrW63fxi3KKuv1rQdE54fOhi8j8AxJ1u3j9VwSmeW1lxI
         wQq2zX+yWLrUWyCD3+IHOcuL5/vu1i5hfTxxAxm+mCVGF2az3t0H5fERvuSi79yb7zqq
         /fpg==
X-Forwarded-Encrypted: i=1; AKwUvByBI6I8N3A+N4OIesW1zR1GfoUClzbm/A8om4vdt8WmaKxDvmjX2kIOYByWoawB+EvIJMLvM462SXjw@vger.kernel.org
X-Gm-Message-State: AFuF++mf3rNBoYiVW2RdDMY16/a/ywl6c23vC24WmKhJb9NIoZMxjf5V
	v6dIUgaiv5Q6u41iSzF9vfRjxbhkJthqTyKhpK+Gnme+ouFxnPbJnGfXXugeOxzKFic=
X-Gm-Gg: AYBFou2uWhCnWKuLH9jFltzP7/QcVf3f0AYnx3JzjpDyy52NxoR3kfsjWDsjYoSlxHZ
	Vj960SYasd4qOcpSefC0B2kag7FCJDDeKMooGFeb776RX4mEIMUV2K5TV4w/oFvj/CH04A0yWrb
	HE3xo/nL+9KoiaucSDcq4imzaqDHaHZxVugiNguaW/XJ/1m1KUPdKZBTbwfYDWJofD1aPAeq8WJ
	GSChjcVRao5j0B0Gyk4fJmKkpmhs71j8QibRkdrC6r5m5EY+9Y6H7gCjxgWeK9BEk9lDF6Q70YF
	zVcaRfNOSLhM5CP2ulYZ2wa5y7cqtNIgd1eHs/YPiEqCSkWxGzx3nPmbc7ms+jeyPDkryvK/Vau
	kHiYiZG7eKDqz6fRnPYmtv2wf2gkSzyUvrnTZp8MlGtvXJZtLasLkfanYePXwlw7rMT63WoN5Rh
	2tN+LZ+Dc/qtr7ZNHk4GcKU2gE4azqd+VJxfbgHmBa54S4U/QRdwSjICyVuR1SpOY6
X-Received: by 2002:a05:600c:4e0a:b0:4a0:25c:8af2 with SMTP id 5b1f17b1804b1-4a0276bfaaamr1412195e9.17.1790870797933;
        Thu, 01 Oct 2026 09:06:37 -0700 (PDT)
Received: from [127.0.1.1] ([151.42.82.6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a01f93ad0bsm52969705e9.4.2026.10.01.09.06.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 09:06:37 -0700 (PDT)
From: Valerio Setti <vsetti@baylibre.com>
Date: Thu, 01 Oct 2026 18:06:26 +0200
Subject: [PATCH v4 1/7] ASoC: dt-bindings: add amlogic,gxbb-audin
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-audin-v4-1-2476646118b5@baylibre.com>
References: <20261001-audin-v4-0-2476646118b5@baylibre.com>
In-Reply-To: <20261001-audin-v4-0-2476646118b5@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Valerio Setti <vsetti@baylibre.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2499; i=vsetti@baylibre.com;
 h=from:subject:message-id; bh=WgAh06pTErBsg1r/NbbofMqPA2B5H76POkIEZ1f1w4w=;
 b=owGbwMvMwCV2z3ty7kUrRgbG02pJDFn7Wrlm/60069aWmXbZJP+L/Ppv5RfXibQmLRd+ZLU1b
 hFzieypjlIWBjEuBlkxRRaW6fd+F5SqPTROOFkAM4eVCWQIAxenAEzE8wXDT8Z3+u5l4hHrfMrm
 n9V7bVQTHXlLfMIzD+ZU4Z0FWqkeHIwMF1u9YyzD1kxtfiE1aW1j4EFljTmfXx9REo2tNxN6cbC
 IEQA=
X-Developer-Key: i=vsetti@baylibre.com; a=openpgp;
 fpr=0497DEFB707526E13360C970DE4B936DD13A0100

AUDIN provides I2S audio input support to the Meson GXBB and GXL SoCs.

The AUDIN block on GXL is identical to the GXBB one, so "amlogic,gxl-audin"
uses "amlogic,gxbb-audin" as fallback; the SoC-specific compatible is
added so that differences can be handled later if any are found.

Signed-off-by: Valerio Setti <vsetti@baylibre.com>
---
 .../bindings/sound/amlogic,gxbb-audin.yaml         | 69 ++++++++++++++++++++++
 1 file changed, 69 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/amlogic,gxbb-audin.yaml b/Documentation/devicetree/bindings/sound/amlogic,gxbb-audin.yaml
new file mode 100644
index 000000000000..4df4796623ed
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/amlogic,gxbb-audin.yaml
@@ -0,0 +1,69 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/amlogic,gxbb-audin.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Amlogic GXBB AUDIN audio input controller
+
+maintainers:
+  - Valerio Setti <vsetti@baylibre.com>
+
+description:
+  AUDIN is the audio input block of the Amlogic GXBB/GXL SoCs. It supports
+  various input formatters (I2S, SPDIF, PCM, HDMI) feeding three FIFOs that
+  transfer captured samples to memory. The sound-dai cell selects the FIFO.
+
+allOf:
+  - $ref: dai-common.yaml#
+
+properties:
+  compatible:
+    oneOf:
+      - const: amlogic,gxbb-audin
+      - items:
+          - const: amlogic,gxl-audin
+          - const: amlogic,gxbb-audin
+
+  reg:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: AUDIN peripheral clock
+
+  "#sound-dai-cells":
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - resets
+  - interrupts
+  - clocks
+  - "#sound-dai-cells"
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/gxbb-clkc.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/reset/amlogic,meson-gxbb-reset.h>
+
+    audio-controller@a000 {
+      compatible = "amlogic,gxbb-audin";
+      reg = <0xa000 0x148>;
+      resets = <&reset RESET_AUDIN>;
+      interrupts = <GIC_SPI 7 IRQ_TYPE_EDGE_RISING>;
+      sound-name-prefix = "AUDIN";
+      #sound-dai-cells = <1>;
+      clocks = <&clkc CLKID_I2S_SPDIF>;
+    };

-- 
2.47.3

