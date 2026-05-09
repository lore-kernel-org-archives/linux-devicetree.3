Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36DA03C73C1
	for <devicetree@vger.kernel.org>; Sat,  9 May 2026 19:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778353232; cv=none; b=NuZphXbCxa5AsMaGyeVuiqAff8Sz98joKCMLbePUcUElpvWrpdm1Go8sTp8k3E+1rMRI8TT10yUeZSZPuLGcpXn4g22SH28/s2cqPuhwG0dZh0CF0raR1hlibtAU6RQI7T8SEYesb5W+zLr9XmS62j9Z/y0N3RkqjxbXmSR7ChI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778353232; c=relaxed/simple;
	bh=qJI1RKZ4tm1AtCPX5qv4vqS8PMeax9pf5Xalvtfc+kY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KVKp94LZWV51MiKrlQN5xGqy8DEMwATlZesTAX3Ct1uB/RYE2gSPucIdTWKuUVqGREIhXUhdxvx8Sfxid1f6xHd+nisu03Q91+fn5kjtkwfrT1L7LvX1c0wNG82uZV9W+Jrn8gvDn9cvOW8Ljd3rm3+S6tf7SPD3neFptUR+vhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p62lJF0l; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p62lJF0l"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-43d77f6092eso1860808f8f.2
        for <devicetree@vger.kernel.org>; Sat, 09 May 2026 12:00:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778353227; x=1778958027; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zfXcef4xsSF9aS7bEgNrFEzEGtCwPTxISiBE2oLRk0A=;
        b=p62lJF0lL7y+rQErKPx7zvIF6c3yF+rcmWQUK1thqj+q2NH74QCHJHDEm5AMCEQnEx
         j785sxjQWaxBhWENcASScHuY+PqfDgvcldoLa6wMyGsOuRWlh8kxI5PCM6AUiNUdzlSZ
         mFsr94jBLOFhmMJEaFIA+7lRsm3k19RgANMh7burq6psnS0hiV3robl284S6Af8Vi44K
         GC13HkmZlJSTV2UdIpzW4Om6DJbCm0sd58CoOi+K4Wn1OQJJEb0YkKx1hnPptdm3aGAs
         Y38Xx43+bPdYbeKxSMW5mUkzVcXQSTVC6dkhS7fxVUCNvhXHnRRKRf1j9V8CqI8UAtHj
         1PNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778353227; x=1778958027;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zfXcef4xsSF9aS7bEgNrFEzEGtCwPTxISiBE2oLRk0A=;
        b=XzNvm1mpY2dmsQA8yPqEWPpH1EVNMoePcHnGoX0meE+ismJAUNvEsfkgrkaYFilNZG
         hxgpYyNynr12P8q71gC+CzQ+U+1xODTM+5RqzP/jOpSO86S7LqP/eM0grsELZvFd00za
         Dy/wUmrGCSfYCmDzB68rBCPDGMADtrl9z3blxBsuH/jT7362+7yibB5+odz7OW8Eu3OI
         vGuXriD40wcdgL7SRK1MgDbtMwx/hSoGwYGrWMI4jHmwYdApoayurLY2/9V/OtsgNnV0
         RYek3dm0Y56vVo0lCca9Rv3Vl5IZvaRxLnIZwXM92GfP3wFXpVOUBIHPOKD4osGIndiE
         YoLQ==
X-Forwarded-Encrypted: i=1; AFNElJ+dexRdM0x2AN1RKmuWLe1FKlKhBRX8009tJIr0tf89TIEMuLrf1tsB3l67S/lTqhbpbl+8cvarChVx@vger.kernel.org
X-Gm-Message-State: AOJu0YzLWDCgEnFmM+6yYFsmRenrq5GFCWgXNoPImNcgQyuCstQfjVF0
	Vzx6gvTIRsxZHQ3yZ+8qMU/eD8RdUal4jTfb4A+oEeZHmsmnaHk7Oz68tdV6oQ==
X-Gm-Gg: Acq92OH6Du+kl1ARpu8xz5ZwMNknYZzbFVC9C9JCbngXPWmBIGwfw5jrCPk/DROnMGm
	6KcwD9Te8I67Pzv2wUwVxIVuHNscuIHbm84Tc+akC7PaNtE4ixE9V5riMHXQf9ISb/mDX9vA1KY
	GM4A+CKZ0U1wx3CFiyKM1bxdmffpwMsrQA0JWnnlCofuQ9+J8vKh/1WytEapZm0wujj8Tqc0Gw8
	IEW5uWmIkZRGPbP3dojjQMWxQOFU65QoOmW5MIYWx947WAd2ZtMdBjLZ7MSumtz+ARGv7euHCNs
	fqXPtZIBLUZggpwtfXvDzGFHtHlE9o0vNQTww2LgTe0k0sU3jUFYAJVBdRYMekbgIRTSHT5ICfD
	qm6bUs+oQVfz7bw9Urj+OP5bmmIBkpLd7DPtveTTQaJXKQhUaqPmvlQczNhpSc5DRvR3bulcZ7P
	wNOBhUTtAAjGn9pXsfkX1ElVz7YCB8svyZESb8o0s8XyfB/uGE/eQZRLC0g4yVhveg7oGdpwJal
	Cn/8g==
X-Received: by 2002:a05:6000:2dc6:b0:439:c661:3245 with SMTP id ffacd0b85a97d-4515cc31e43mr28677269f8f.34.1778353227339;
        Sat, 09 May 2026 12:00:27 -0700 (PDT)
Received: from jernej-laptop (46-150-62-216.dynamic.telemach.net. [46.150.62.216])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-454913049ecsm13254407f8f.19.2026.05.09.12.00.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 May 2026 12:00:27 -0700 (PDT)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
X-Google-Original-From: Jernej Skrabec <jernej.skrabec@siol.net>
To: wens@csie.org,
	samuel@sholland.org
Cc: mripard@kernel.org,
	maarten.lankhorst@linux.intel.com,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	jernej.skrabec@gmail.com
Subject: [PATCH v2 5/8] dt-bindings: display: allwinner: Add DE33 planes
Date: Sat,  9 May 2026 21:00:12 +0200
Message-ID: <20260509190015.79086-6-jernej.skrabec@siol.net>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260509190015.79086-1-jernej.skrabec@siol.net>
References: <20260509190015.79086-1-jernej.skrabec@siol.net>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jernej Skrabec <jernej.skrabec@gmail.com>

Allwinner Display Engine 3.3 contains planes, which are shared resources
between all mixers present in SoC. They can be assigned to specific
mixer by using registers which reside in display clocks MMIO.

Add a binding for them.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
Changes from v1:
- dropped | for description
- better description for allwinner,plane-mapping

 .../allwinner,sun50i-h616-de33-planes.yaml    | 46 +++++++++++++++++++
 1 file changed, 46 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/allwinner,sun50i-h616-de33-planes.yaml

diff --git a/Documentation/devicetree/bindings/display/allwinner,sun50i-h616-de33-planes.yaml b/Documentation/devicetree/bindings/display/allwinner,sun50i-h616-de33-planes.yaml
new file mode 100644
index 000000000000..0a07cb8a5f79
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/allwinner,sun50i-h616-de33-planes.yaml
@@ -0,0 +1,46 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/allwinner,sun50i-h616-de33-planes.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Allwinner H616 Display Engine 3.3 planes
+
+maintainers:
+  - Jernej Skrabec <jernej.skrabec@gmail.com>
+
+description:
+  Display Engine 3.3 planes are independent of mixers, contrary to
+  previous generations of Display Engine. Planes can be assigned to
+  mixers independently and even dynamically during runtime.
+
+properties:
+  compatible:
+    enum:
+      - allwinner,sun50i-h616-de33-planes
+
+  reg:
+    maxItems: 1
+
+  allwinner,plane-mapping:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Phandle of the device responsible for assigning (mapping) planes
+      between mixers.
+
+required:
+  - compatible
+  - reg
+  - allwinner,plane-mapping
+
+additionalProperties: false
+
+examples:
+  - |
+    planes: planes@100000 {
+        compatible = "allwinner,sun50i-h616-de33-planes";
+        reg = <0x100000 0x180000>;
+        allwinner,plane-mapping = <&display_clocks>;
+    };
+
+...
-- 
2.54.0

