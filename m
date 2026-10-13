Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F30C052D2C9
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 17:57:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791914277; cv=none; b=ANROTIC0qBJa0v9ADudAfv1K3+UHzZSbhXHnmKjv/80IJdUu57j1xwkstpzdelx/pS5APWyqDJWT0gIO271vcGsWRISwlw/beUlcIRQxhMoR4zRkXVc/zgSN3hBml+GNEQwKUk5x1XXfS3jtHtWPRAqm/JQDmcvzDjy2oalLTIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791914277; c=relaxed/simple;
	bh=wm55RmW1r4T1LjUU0ZliyxGlpbqgW7bOTL+XJGfRdys=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QLummHE0e4wInmo98xMrDodhtSPwGstPqtibH+xeErbmddrWEUjA6vEUOAwk7GWCsDc8V3XTB4oKNP+WtURhixS/m0bJbU/9omPkpxwNNZfLKrjOwWs3D7QDYG4AsI4my32mTnWdqmmkelz2Ka4mJCIa0cgklDUpKy1ecBpwmzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nxbHHyVK; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nxbHHyVK"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a01933b584so29122225e9.0
        for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 10:57:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791914274; x=1792519074; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0VnJFyDbgbe0UcJPjrh0IiME0j5eiTKrH6NBa3PdA/c=;
        b=nxbHHyVKXFsVoF6y9WIEPwKGIaVTFcXfQQYD2aK0VLExhPeOoqfoe5bz4ZpgdgdqN4
         qesS+BAHvkTenMtgTDDtE5czPuFdY7plQrJL1nTg+3QMgPRuUbAnFN/5EDvoS3yt7Zdf
         C2X+PeJA5RgnkVenDnQl+p32PRvf57PkuDM9pef741AQIc2Zw7T7bqAKlsvh4f+lB6HK
         sWIuiGFUakGjWiKfJA85f8nksWzZiCANicQ+y3nuy3Zj6B5Tm2/ArKV+zSBvOHCOGen0
         H6YxsSiUXikrUD1u3KaulV+eYHsuctAqcYlwL0ojI+cuswFxYEYwfMiEZLK7aByuchbE
         DbtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791914274; x=1792519074;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0VnJFyDbgbe0UcJPjrh0IiME0j5eiTKrH6NBa3PdA/c=;
        b=pPAWkUHXNpDM3GX6oH03FNmtMvtaf+Kvm1eBN3jxEMNBk6mF27qMOYV4jC4N3PGWzp
         po39ncma+M62mdhIKJEc+acU35eWrQcILar1ipWLtOKCtJ70nme0FTNB20WXSv0R3UX7
         htcUQpV3qY/P49YimW4Pr5YjNX9P0adLCCmsYJkC4wZpKTxxg9W7xQOIqVJ9zENnmI26
         cf5eLrUFSKsCxfIvydwJOw/qGYuZMzwDWdjy+nZ4PX7X7QHoXDGGB646d+9SZ9fEX/+f
         BKZZPRKKmyNlVxL9oUrDIJh6F4X2ESIjLRaRgVoL+6JmkrdVap91rkz3/gmnPRc0vJ6W
         ncUQ==
X-Forwarded-Encrypted: i=1; AKwUvByZZKKr9JDys/IV/TrK7hJszAmNHaHwvVw/jTKoh74RJUlkXAqgjuvdFyGymGq1Q9tatgXhVOylAZSD@vger.kernel.org
X-Gm-Message-State: AFq9FYIvac3FVDTSFVbxZm1hblRshg6uMAKdqSEKwhKjTX215OxVj/ia
	dagU8nMIPWfA4ReyzXp07W1vaG5VWKHqgiT1zyEwNpNxI5xdNKjtPdxK
X-Gm-Gg: AYBFou28pl9rEwdkiIMeMDZLwfnlY+Rd/RGwhc6KyMDmKxBMeFfy1vTAsusWSm53UqB
	WlDO/RYeZpouEE3xH9AqwsTLYUyUYwokrVYUvZCUT44dHoW6e61oDuvIMtxfXJD3RXbst1D9n2v
	RVa4t5Kq3VJEjr7hsOwMLW+FdhGuvVEOPCT99zv9Cg0dC41skqp8oajKQzRabTVIYa7rVkwUzE2
	mGp2CUIKomkeO6QFp50zgZzGQ3+5URVvxi2lV4gLUfJyYVTibp5h/pmqB2dO/WAYZIV4la3LXBj
	GDL9zYiZvkefoHPl1a8jeFVyKIb0zHqjBSKO6GZ9Zdeo1NaOo02dx/Bc5s5V76HJr+8SPzuNn8n
	ePK/XwKNdSAz7eyfEdgZEf0o0nQujP4eVA0cOdgStLIbvmu+pzPFhyAH7rUyA2jfJSXQDCF0OlG
	TXx11f1Wt7dbptfTfph3m1xs5FMMOQmyLY3QqhMyL7lLrWEVIkRqNOiThj8LIEzY3Hk/J7huW+j
	gIDLflCDxgRdpcFwwk=
X-Received: by 2002:a05:600c:4e55:b0:49f:fe39:5bc8 with SMTP id 5b1f17b1804b1-4a18e49c008mr237083775e9.12.1791914274140;
        Tue, 13 Oct 2026 10:57:54 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18f3b43efsm447804745e9.1.2026.10.13.10.57.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 10:57:53 -0700 (PDT)
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
Subject: [PATCH v1 1/2] ASoC: dt-bindings: Document FM34NE DSP
Date: Tue, 13 Oct 2026 20:57:31 +0300
Message-ID: <20261013175735.473704-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261013175735.473704-1-clamor95@gmail.com>
References: <20261013175735.473704-1-clamor95@gmail.com>
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
 .../bindings/sound/asus,tf201-dsp.yaml        | 80 +++++++++++++++++++
 1 file changed, 80 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/asus,tf201-dsp.yaml

diff --git a/Documentation/devicetree/bindings/sound/asus,tf201-dsp.yaml b/Documentation/devicetree/bindings/sound/asus,tf201-dsp.yaml
new file mode 100644
index 0000000000000..6b1c478bd03cc
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/asus,tf201-dsp.yaml
@@ -0,0 +1,80 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/asus,tf201-dsp.yaml#
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
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
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
+            clocks = <&fn34ne_clk>;
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

