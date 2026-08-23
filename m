Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52BAD366048
	for <devicetree@vger.kernel.org>; Sun, 23 Aug 2026 11:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787484031; cv=none; b=qaQMHWydm7L5ezZhDlcebJjVe/m2ETUzhHKOQ8pQr89oRY5M/Woj2qCg5jtRRBSRJ5+F53wZIQKvr2DjxL+22zETCUWo3ucbciiKBjxOHdR70hBhokxaf3MjVO9cP+G8g1azsVt7nTUOMA6suICUf456pEyS277Wdp6iMQt/iyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787484031; c=relaxed/simple;
	bh=BtMVAHXM9KoBuSaBgXcPyEGGY8yWHDBQpY2nHDSPMuc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZVUhr97gif/kmDuLaWYpLyIJWr5uQh/3dntgfPHArVwpo8+8BW/ogWxn7qWhrFcqRuOBfIUvReZLtGWIRaBquKD7VPem7MeUQE+b8bOd3QkLIr/84rTUc3Pl/p9nA2X7aaQa7IAOCDjCEZsWb9mOVLv48ecr2Rpye7qnYVEUAMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mBOpDFF6; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mBOpDFF6"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6a0794669a6so4935391a12.2
        for <devicetree@vger.kernel.org>; Sun, 23 Aug 2026 04:20:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787484028; x=1788088828; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JlTQW/BF9URteLWdGLssLkReJV29Ip7yvpMIAoyvb8I=;
        b=mBOpDFF68B0DVu9vcsNMhxvHmY42qCKDmc3Hma9rFtgUs7MAvcz0bdcJMwyOpjMiF4
         YXrnBOSY37G1m7FI8i4EAOg2B6HDFTF4FW2jwGCnifffJdk8rSGjBXHYXEYPMuI4E01l
         ml8zEJDrDhGR9tV6JXPemznr1p4mzgIMyKdLr9aVWo+LycPzAC4stLl/5TTZhOjxvkSH
         0GoJrAzUULBLPZry5SiTD6yAmxzOw95zDSB1BxEtEc4z+0So7GFY+pif0JO1bGNaMRCv
         w9erKBlZER6rl9XLn3wqrAy0/c/CcxfJlYT4iQes79/khtjMp+gexFkvQ8ki98/bko0I
         b32Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787484028; x=1788088828;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JlTQW/BF9URteLWdGLssLkReJV29Ip7yvpMIAoyvb8I=;
        b=IngfHpYs3Udna12e5leODxCRcu06T3UwFbaN4PFBcol+y2al+4GJXkU7CODI8DQltK
         JF30gsjOMquWfJZ/2SKScQJ9+4ykCCKrHTnL7ktdZjxpAcBza+MqMzcvroRmw8M5V0Iv
         5CRzDNzyGZulAwm/VcZ+Ahe0Uvjy3xhq4hqJmvVsJr/klRplixIiVdz8/sIkFqoeHGgD
         +vTq1NWVQwXkLdV8yZw8nqI9DR1rVN5KnVSDxgEBJpTwKvXpiZ8XoF8mWkquMTpo9Pej
         6GUxmLAYtKgx7wjIFbt7WGsyyU2KE1+Zr4v2pkBNSyNgbGaFY7ElRvUSSerWjEL/LvSo
         bT5w==
X-Forwarded-Encrypted: i=1; AHgh+RqNnB23YdrEm5NZAoef4WymczE6bSYk4/7KfPVATdY+vSmrLucDDmBg2/qP/eDDfyyfB+KeRa/dLtS3@vger.kernel.org
X-Gm-Message-State: AFuF++nrjPXBblmt9fa1cR1IOt+Q7xUCMGL+PinpGiMZkHdr7Nt2JvVg
	YshmVKDM8QOrEol8J5JIPbNQH575oQPze0sG8zgylgSPJDM8pwnKfQxc
X-Gm-Gg: AR+sD12+Q/YYGmO4djnRIZE9EX54G1alRQtF9E20oZFWXoDX24ueNCnh6fYRByimS/V
	fDLz9/QnUoBetHu3jO0nA3T/UvBccDQL1XFAxMG7Y7rCVyMEPzAwQaFG8ikCas2H1koDLLvjVQN
	i+Mgzqnf45atuyeCjeJ2YRjZRj/kLYWnQ1kVhT+Aj5D8NA51I4JMIv6Rjg+KNLCsTqchaGdTlP6
	1eOxh0VQ+ymjB+SXhrqKrXdDilYtnx/bUz3X82S2ktAro9kWXxvD79SvwlwPPsj6vT2NoISZQ7N
	85jYMTbXwe5D+K96stQkcxxnaBRX49mUXthDiIeZLF3B+2ND0by4lrfz6LxOhChufd86HNXmcPo
	LDoXWhgTHbIB4+ov30eZ968JHCZzT9tcWlODqaSIdt5IuFNqiMOOZV+1UPAnHqbnTNczVEP8OOp
	dzJzE8NhZ2qf3q0DfojAWz7sz14QP2g55U2od/NBtkuTRMQ9UsB0r9lrqx+PEPTZJbAg==
X-Received: by 2002:a17:907:3ea2:b0:c15:f598:60c0 with SMTP id a640c23a62f3a-c249238cd84mr1203250766b.4.1787484028294;
        Sun, 23 Aug 2026 04:20:28 -0700 (PDT)
Received: from thinker ([2a13:54c2:f000:e268:6d0c:d746:2b12:231f])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c24966f58dfsm707233866b.38.2026.08.23.04.20.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2026 04:20:27 -0700 (PDT)
From: Amit Barzilai <amit.barzilai22@gmail.com>
To: javierm@redhat.com,
	airlied@gmail.com,
	simona@ffwll.ch,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: andriy.shevchenko@intel.com,
	holofermes@gmail.com,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	Amit Barzilai <amit.barzilai22@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v5 1/6] dt-bindings: display: Add Solomon SSD1351 OLED controller
Date: Sun, 23 Aug 2026 14:19:54 +0300
Message-ID: <20260823111959.17029-2-amit.barzilai22@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260823111959.17029-1-amit.barzilai22@gmail.com>
References: <20260823111959.17029-1-amit.barzilai22@gmail.com>
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

