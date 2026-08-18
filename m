Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 576323BE14A
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 08:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787040406; cv=none; b=RXM47Pqi2vLF59SwF9g2MsjqLbdlIjrXGT3oWfoBxxwCLyrDG/l4yqHCIxJkhohueocUiB1imBHYdAz1KZ7U8f/FmE27ee5F8b8sBRcg/qlWA0W3OW3Z5sCtyMVCxsEYyHI+QSC9suTtvuZ56C+zlSf73uQ2BYTqr4OAbRjqXsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787040406; c=relaxed/simple;
	bh=BtMVAHXM9KoBuSaBgXcPyEGGY8yWHDBQpY2nHDSPMuc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SSUORvtkcMUHMEuFhzvXTisl7hvweXTgzIUZHIzDZo+8I0AMfzI9D9NoPXSyzq8FIzWUOU6NRcId0SExeMUOLNZBGxDlShshcB1r1YiXvPHR1eZioQrkal+GaVnvMo8KC9whiXQjqlz/inKucNm7T4HQtZgoq+dWOkCs2rfzBAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a2LQDWR+; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a2LQDWR+"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-49800c6a846so50581795e9.3
        for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 01:06:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787040403; x=1787645203; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JlTQW/BF9URteLWdGLssLkReJV29Ip7yvpMIAoyvb8I=;
        b=a2LQDWR+82bkS9J4eXV+4nSAptKMRKco4H+M7q4CHMtuvtIyanozbI60LeUts7hKkd
         MyhDlYmGsRYWvRITQtRseg8rimW3Q/Sk+eST/8FEJhJQSyh5ega7sQD5HdlFuH1KwQFH
         4nNDqitvnvlcsbdMFVvq6Z1eLtPds1dbSzMmEt7H3WzEQWW7Z9JziN98rEP3+nd1jgrt
         OqfsShoOvfG9GZdjsJRpKcANzWpcLn09kBSG8jRvKCwpNwogDD9V4k1evhg1D+X1vvOy
         7MMIRc58F8LXNkXJHAnM0uS8GBLQgaORZSN+lYoNqdPC8Y5FDujbfCyMnzYbi1MS78gL
         5Mbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787040403; x=1787645203;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JlTQW/BF9URteLWdGLssLkReJV29Ip7yvpMIAoyvb8I=;
        b=MjMXAhEBwVQVyHiI3g2ApxvRM1cPW7NXPLtxjv3xFjf9iB1pPCGdHO4JqBKnCBubrC
         ufneyJFi63xyP0tfI68pDpV4LenjYojvb7NmiFffeahDpxx34TeoBFLx7g4higNLH72/
         u+mZfhzQ2FrjV34relZEQCZQIkzkDhtMHCfYp0+BtuGXH8Nwz/hCb+6IvHWu18Jva4gv
         iT1ue++e3bduwwG3NQ7lefUTjcoN0EebH0lRZ8AGGec3c9E+y5kfF9KpBgkzg6fm7kMQ
         R4C8y3YGzjFwPJ7vTIDnOUH/FhC19NyCgTCvmkX+WQRjCYEy71ga8PSx5q8wHH0S4qTg
         i2Ig==
X-Forwarded-Encrypted: i=1; AHgh+Rr+KPEu5rrgIVzog90MPdXfI93edrbAwxA+lcz4dP6IpuOtXEs3/dKvT1GMNRCCWSrTvQt/Usyxkfts@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1VLfdjB3c98WWI00vVkAbrEbsRV50svqcwPn7JuPRO3tMIE5U
	i+mliXiSR70GKn9hGC/s7s6y0Egl5dqGxR8t2oe9y0VN++xYdr7iNwKe
X-Gm-Gg: AR+sD13Wa2sZzzN82ZwEMhWMde+Go7+WJKMw9q7wS8eH1SZNG2SfhwlXUKeZUTK25Gv
	wfKmVLkSJ/EVfwk2oFXQMqSzLMGh5HJwmRf1iWIS+BRe/JRjvjcbNTpZcgMC6UYbUwEmG7fMvXv
	D+Q6o3wNUt09NvoJT2O/ijs2sRSbyH+za+1W0rz+VtJs7xc4YVnoo4K3mwviAR1iye8Pns1LbtP
	EY/+mpVIYZV4sJTcphj0EBO+IFf3LGdGqsvaXdICd18PxRMVpMKj3dqCA4f46mIBmDKoHO2S9Eb
	9C2G45YgSqD9qaJCJPGrewb5cP4Ace4lInSTpDHqzVcMxERMZlTdGlGgDPzDfPpBQ6NYLTkbrVS
	YMk9RciC0SJlhZ53bUKJje67tLIIDyHEOH4qmrWNaNJiOvm0i2y5GqpXgN40E+jx4hJ3vSyC2io
	wolfZ7jBjrHwPq6p+41skhcka5vxd9BQ9wWWfXZt/jFiAaG83Wdp8jVgCtr5xbh6QprgOyVA/Ed
	Kw=
X-Received: by 2002:a05:600c:528d:b0:499:900c:9c69 with SMTP id 5b1f17b1804b1-499900c9e99mr376832095e9.9.1787040403473;
        Tue, 18 Aug 2026 01:06:43 -0700 (PDT)
Received: from anthony.local ([2a06:c701:9cc4:c200:33d8:8ea2:e077:ebe1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482a5a3b2e9sm10367223f8f.9.2026.08.18.01.06.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 01:06:43 -0700 (PDT)
From: Amit Barzilai <amit.barzilai22@gmail.com>
To: Javier Martinez Canillas <javierm@redhat.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>,
	Fabio Piparo <holofermes@gmail.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Amit Barzilai <amit.barzilai22@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v4 1/6] dt-bindings: display: Add Solomon SSD1351 OLED controller
Date: Tue, 18 Aug 2026 11:06:21 +0300
Message-ID: <20260818080626.30430-2-amit.barzilai22@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260818080626.30430-1-amit.barzilai22@gmail.com>
References: <20260818080626.30430-1-amit.barzilai22@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a device tree binding for the Solomon SSD1351, a 128x128 65k-color
RGB OLED display controller driven over a 4-wire SPI bus. The binding
builds on the shared solomon,ssd-common.yaml properties already used by
the other Solomon display controllers.

Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Amit Barzilai <amit.barzilai22@gmail.com>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../bindings/display/solomon,ssd1351.yaml     | 42 +++++++++++++++++++
 1 file changed, 42 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/solomon,ssd1351.yaml

diff --git a/Documentation/devicetree/bindings/display/solomon,ssd1351.yaml b/Documentation/devicetree/bindings/display/solomon,ssd1351.yaml
new file mode 100644
index 000000000000..80850c2ab5b3
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/solomon,ssd1351.yaml
@@ -0,0 +1,42 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/solomon,ssd1351.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Solomon SSD1351 OLED Display Controller
+
+maintainers:
+  - Amit Barzilai <amit.barzilai22@gmail.com>
+  - Javier Martinez Canillas <javierm@redhat.com>
+
+allOf:
+  - $ref: solomon,ssd-common.yaml#
+
+properties:
+  compatible:
+    enum:
+      - solomon,ssd1351
+
+required:
+  - compatible
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    spi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        oled@0 {
+            compatible = "solomon,ssd1351";
+            reg = <0x0>;
+            reset-gpios = <&gpio2 7 GPIO_ACTIVE_LOW>;
+            dc-gpios = <&gpio2 8 GPIO_ACTIVE_HIGH>;
+            spi-max-frequency = <10000000>;
+        };
+    };
-- 
2.55.0

