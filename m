Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793650395;
	b=Me98PHNYZB+JxtrHIwP/PztgnWgPc4wezKtAh7R3JbOHBKVLfNXTLdHHK4YDHGsONcFZ
	 NsgqiPmSl5oNFE20fAbE0AWA5RbfCRxlwtAhbZ9Ru1HnGce8DHVBMcxYc4KgdLvWtCHum
	 nQ2pMy7IJ5juov9jDo8l4rCl3xqZdFCRDltk0D3yD603P4iReink3qTMa4rrKnXKvxlaj
	 A03slphQTZjBSjUUFLzI5EqpmdFBnKbl/SpUeDonr5DSXanwixk8UKMIbQ9hGV2JFYNfg
	 Vl9PubeHhFxz6/yFcqyJI1Lul6Wr1U3dlNAbykE89Tdbs1WwwF/SYfwjSLmWDM3R5HQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793650395;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=L2gEpleCd13p+gM0N/gkP9xykl7jsD9jHrOnDwV/TOQ=;
	b=kX4OjkHaEqkX0HuaPODPW9ynLOjvljAYp602E5NBVNjFLZEOp837Z4geTYwk7u7JrP8q
	 ftyOL/XugqpkwOz0fZKNIDrFuzWKeTKVKKXEQyRCnewIv21gRxhCnUUPy8Va8mg4L9wRi
	 MEYQ2AIo2l5peNbgCVMSADVQgTpxvrH80QnhBJua1dF+0TTNZceHAzQoMDSAcBUfIf1nv
	 YgG1CnVkllR9xZWPBVyimOOyvuLlgRtHQoIVMyozYmX7KDb7Pg3MQ/nDMymmroPDJ8pVw
	 Neug8JFbLEO+SC5rcy5uvvAChL+Ga8aviV+5Pjru5QLBGE/LkOGXCBibS1kK3IQv08Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	dkim=pass header.d=mg-crea-com.20260707.gappssmtp.com header.i=@mg-crea-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=MmSV0NDv;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB1D1606A32F
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 20:13:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB1D1606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mg-crea-com.20260707.gappssmtp.com header.i=@mg-crea-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=MmSV0NDv
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so34845645e9.2
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 12:13:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mg-crea-com.20260707.gappssmtp.com; s=20260707; t=1793650393; x=1794255193; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L2gEpleCd13p+gM0N/gkP9xykl7jsD9jHrOnDwV/TOQ=;
        b=MmSV0NDvusZz1hnlGyvqH9FGRNZmkYXSSPUBGZ9aWE8hBkP1gA1S84f28JHu3Q+fx4
         BbxJzw8iFTkIWHedRtb5zP/sMHHyw0rS0m4/9xpAzCKQlbrJU+XJ1RFjP7Pts+malEhH
         GfC/iGJ/b/NZWaY2nrOZr64AQPXUy6yb/miV725si3g2Zq4p5UTTGejXX8aJEhQ6RoBQ
         FSNl2DzJ4Zp09b7qEHkWTHLcvUVjibmtc/3OucJfYU12u5xUQ7Ms27ql10t70oIiJyLP
         v63o0HjQGe1M1EHsuyGHqtieBL+2hLHmv/9iqzRhPj/INNxY24a+ckyrqtbOiBuROVuR
         znRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793650393; x=1794255193;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=L2gEpleCd13p+gM0N/gkP9xykl7jsD9jHrOnDwV/TOQ=;
        b=O1gRbA9rWDpNaG+z6nnN546t+BBa6QD+qcgVkkuKp0qEVdAVUOexH6d/XFrKbMEVZA
         Q/Tj0S+FESKWO2o+CXyybvdbXgSifjjP51SYj5P8FNnyyDkoDLTT/zF47CwEUV8fAZYQ
         0hQdeU6hKlXb/oQ4fEvCG/qfb6ThQHWDtbafd3mqeU4+BOM1sJt2s+llk0NYOPjvTj49
         7P5NLp2EtIQIv3INc1DDfyHUK3cLbRW7ZhRcL3+qFWMj2Ph11+aARdJMTMbPaJpy1V31
         SGYwRSC4AYl3z8wxf826lZlScTmR3wL9jaQNAOJ8pd2MLdpCA/ynWe+6uMZlR0XgL9du
         a2wA==
X-Forwarded-Encrypted: i=1; AKwUvBzgTd+gJ+y8jX2EI7i4i45popnJK3WTGHo2vHcrFj0jB5U6wWw2WMrq8+rS2HzS0IwoE5ggAWF0EIFP@vger.kernel.org
X-Gm-Message-State: AFq9FYID4McEC4XnSzvq80aao7xRdzYomXDm/og0j2QacE/SvhYHz0iN
	3H30j9mt7IifhvWFx66D/5Yp5pbfjuCQcYrmFMMtjBhhQvLipd92nO044ezBQadyr50=
X-Gm-Gg: AYBFou0c4yrOdiLiF+hxOj2iqNqVmT4enRV17wNK5njgU02NADM8PdXPAQ25nWC4oqo
	KdQdTLn6IEdtuHlF/XRtJiCE/7aguz8X8FN7YfrNE88goL7NtbShFb+vk+uCfUAvse40g+qiV1X
	rGtd5kLEqJEaYSfshC3e/miPfLX4dwxlM2A0O3fCJQVsXOCc5m7QPFkkg89yodWV9ZqYdO0G7NQ
	sso+KLqZg4rn90D/7xPTMAuKi+rbx+aBE/u9TO1sfW343kSmARhDJaDvDsEMSf65wlUIsHK3+2b
	mp1SPyMis9eVupnzlrq9KNDBXMtD46XBrHqfJhXIhCb3y7RU72f0TRVzYQXMyeKscBKgvR7+uvn
	Cbz0LrYVgs6R0/u94ViSwalx8gahy+dkIg9g/WXXHm9p/T0CXyEqy9fufLJefFeacidIjkI1Upw
	Wv3qXzw1mt47CVFyfnCfjqkxerD+XGzz1VQ9OGbYt5OIyRtgz/nXkz888Qd4U1N6IFeJfrTZMcU
	wBmT9XfJbEBLB3TgdtvOn64Ju3RebX0GR/K/l4HJPXFymdwbevHPEPspEH/sAGPPpOSyPqYyKKk
	vf7l1jOET9KWrhuwEM83wv4qDHklTvowKT7L7wClq+KGQezaOv8db4CqEEey
X-Received: by 2002:a05:600c:840e:b0:4a1:813f:2a60 with SMTP id 5b1f17b1804b1-4ac17d168b1mr286479175e9.11.1793650393215;
        Mon, 02 Nov 2026 12:13:13 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:9d2:5a71:6412:7406:ded:3229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2a82cf248sm13969155e9.2.2026.11.02.12.13.12
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 02 Nov 2026 12:13:12 -0800 (PST)
From: Olivier Louvignes <olivier@mgcrea.io>
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Cercueil <paul@crapouillou.net>,
	"H . Nikolaus Schaller" <hns@goldelico.com>,
	Joshua Crofts <joshua.crofts1@gmail.com>,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Olivier Louvignes <olivier@mgcrea.io>
Subject: [PATCH v4 1/2] dt-bindings: iio: adc: Add the Ingenic X1600 ADC
Date: Mon,  2 Nov 2026 21:11:54 +0100
Message-ID: <20261102201155.10948-2-olivier@mgcrea.io>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261102201155.10948-1-olivier@mgcrea.io>
References: <20261102201155.10948-1-olivier@mgcrea.io>
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

The X1600's SAR ADC has four auxiliary channels and none of the
touchscreen or battery engines of the JZ47xx ADCs in ingenic,adc.yaml,
so it gets a binding of its own.

Signed-off-by: Olivier Louvignes <olivier@mgcrea.io>
---
 .../bindings/iio/adc/ingenic,x1600-adc.yaml   | 53 +++++++++++++++++++
 MAINTAINERS                                   |  5 ++
 2 files changed, 58 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/adc/ingenic,x1600-adc.yaml

diff --git a/Documentation/devicetree/bindings/iio/adc/ingenic,x1600-adc.yaml b/Documentation/devicetree/bindings/iio/adc/ingenic,x1600-adc.yaml
new file mode 100644
index 000000000000..f6356ea97980
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/adc/ingenic,x1600-adc.yaml
@@ -0,0 +1,53 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/iio/adc/ingenic,x1600-adc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Ingenic X1600 ADC
+
+maintainers:
+  - Olivier Louvignes <olivier@mgcrea.io>
+
+description:
+  The SAR ADC of the Ingenic X1600 SoC, with four auxiliary input channels
+  measured against a 3.3 V reference.
+
+properties:
+  compatible:
+    const: ingenic,x1600-adc
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
+  '#io-channel-cells':
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - interrupts
+  - '#io-channel-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    adc@10070000 {
+        compatible = "ingenic,x1600-adc";
+        reg = <0x10070000 0x30>;
+
+        clocks = <&cgu 28>;
+
+        interrupt-parent = <&intc>;
+        interrupts = <11>;
+
+        #io-channel-cells = <1>;
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index ecc22d1149d1..fd4bb5c6bf16 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12925,6 +12925,11 @@ F:	include/linux/mfd/ingenic-tcu.h
 F:	sound/soc/codecs/jz47*
 F:	sound/soc/jz4740/
 
+INGENIC X1600 ADC DRIVER
+M:	Olivier Louvignes <olivier@mgcrea.io>
+S:	Maintained
+F:	Documentation/devicetree/bindings/iio/adc/ingenic,x1600-adc.yaml
+
 INJOINIC IP5xxx POWER BANK IC DRIVER
 M:	Samuel Holland <samuel@sholland.org>
 S:	Maintained
-- 
2.54.0

