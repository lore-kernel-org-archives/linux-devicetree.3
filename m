Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF489309DDB
	for <devicetree@vger.kernel.org>; Sun, 24 May 2026 19:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779651545; cv=none; b=r+62FF6X0Pllr6j1cWDfBynyz97xTTpEvKxjShBqP8DiMshsSQUAByu/J8XOCPoVzbLB6WKqQ5kSvDLRbqGGGtzUxCyZcYlkbe/zCL5x0Nb4tHsv4csFfXB3Zw8Uln39SmuhsHK9eU96+7Dt/4xSF+Mw39CUT5fDwLJRq3YqdyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779651545; c=relaxed/simple;
	bh=Ka0lpy76ovZVEz7hWNGwKbfns3W5Bp+Q3vY0KlvxXyc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VLF/lDWVU9jjhfGHK/LCmlb8cIV6QoadqMv56QMKPRB6xvdixBK0syKeKGLf5MNj3RzrOCj1vW/w4VM9feflxMFrRV29w6M+R1lvCzVLutqEWU+Y/bLmbTnGJ1NLv1E8WsBFroQb6AXIstQXhBto1Y8PV89gocCF0LQ5Qx/Uh6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qvHIzUvh; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qvHIzUvh"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4891e86fabeso113551635e9.1
        for <devicetree@vger.kernel.org>; Sun, 24 May 2026 12:39:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779651542; x=1780256342; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UYXve+OwpS7I6tcSPMQLO5NJg/fMFA3PAPuTx/rEeus=;
        b=qvHIzUvhmacY3aN/SNjCWNDzmTVLm2jR8DG0TXCIEjOq0ZbsK28dp36KsPk/lxTuG+
         BEgNM1LlaVWCYlVpjjjRJjeAaJbMM1hHASt99HiEBwn8rkdrkNK3WVFSVJNt8BLjcweV
         hosSp58KSd/1b7YatHLndSRiCkMo2YxHVOAA0hUdCq5XUwhUsavdc6cLb21czZNP0Uds
         MOgAB72MAjJLD1SKMThx9L+tUsfwvmrRHC5Yw6bx4DZyR1JuN5CskFXoL3jvEZG1nLD1
         s+Mt8YMChaMQa79y//naQYd+kiH0rj12+sy9VFd049rr0I/MtQZL/QOyxyt9qmRTjkFw
         ePQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779651542; x=1780256342;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UYXve+OwpS7I6tcSPMQLO5NJg/fMFA3PAPuTx/rEeus=;
        b=d7cE9ebq/6c+EzqtWmGoLYzyHBBGKoNjMfC2keJ72iZKQBxaVQchCwjoCej3sANrgE
         QaDyFuZDQ3xELmXm0uY7WchJVVW9F7B5dSdtVARN7ddg2RcCtFdX+6oEnJIP3Pt1bS5L
         TbSnBhe1YQnFYpvBuz5lwDp256wK4PzzyvPZJuLIYvGl2bBtyL41/ZYKz7Dt94a0htwn
         EMbUQEsudJ6I1k2ivaFs2vuPvedbEdWW2BZKV441qqRjMnhVNcu2sMPOnk+em96MOc1/
         R8e9wIKLevH4asKotTnyoXD6aJqhQOA5iJrhHG09pEwRnoMNQylFu65qAWLuCx7Lk1Yc
         q7CQ==
X-Forwarded-Encrypted: i=1; AFNElJ/cPP0Tp1IUnndr5XfMI71MYVz8HYhK1GNGREc3Zdp+w10gsvK/uIOjF51+9euvqQ68/XhqfAvj5/rH@vger.kernel.org
X-Gm-Message-State: AOJu0YxdplORkPEVroaQB/2VPzGyZLs4BEpeBp1+KIsWI2bY557FvARg
	2m8axKngDeKdkpzufM5BTyrXJd2hSXJUBCZEvmVCS/owAnHRFT4pWIFM1lM0sLnx
X-Gm-Gg: Acq92OGpqpXPcVcXYNrvhqcBHMGV04lRI/j564OP5ijANWY/mbZMVmp9imvXlgN8Q9p
	idaz7YOg3bIH/AZjnn1S/G7xswA1oOh52VpYZhU93zS2gfIlSK6kxaYcvs1ItdtxR/diAYKWDHn
	6MSpH3C7edDNaYbv7IxcX4Z1hkEtSS5uzusbCcoHcJnJN+M7GJyL+CKBcWbN0L7jFyvFy58yrrZ
	d14xes08Jvx/MYVephX1okbEAEw7dTnf2IZsn08CvyDSQdkbzElrF+EEAG5h2Al3JqGGe2W7JAw
	mQrp7oa0bV5vn3BwPdo5GQwDgsvxEITfzGtvb1T8kl6fPe+BrT0eiuPd/s71XjxrIkBjPRZAsf0
	ziN/QvnbmHZYJ5AQ9Q5EwwA863KTOdRSy6/3krgEprQqpgyMpfJteniywXCAOO4u8KTYoFJuHJ4
	5swj2L
X-Received: by 2002:a05:6000:986:b0:455:7d77:1d25 with SMTP id ffacd0b85a97d-45eb38af97dmr20907828f8f.27.1779651542090;
        Sun, 24 May 2026 12:39:02 -0700 (PDT)
Received: from sefo-laptop ([2a02:8071:50c5:5c0::361b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eb6c9ba2esm22339674f8f.8.2026.05.24.12.39.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2026 12:39:00 -0700 (PDT)
From: Wadim Mueller <wafgo01@gmail.com>
To: wbg@kernel.org
Cc: krzk+dt@kernel.org,
	robh@kernel.org,
	conor+dt@kernel.org,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Wadim Mueller <wafgo01@gmail.com>
Subject: [PATCH v5 1/3] dt-bindings: counter: add gpio-counter binding
Date: Sun, 24 May 2026 21:38:44 +0200
Message-ID: <20260524193846.19216-2-wafgo01@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260524193846.19216-1-wafgo01@gmail.com>
References: <20260515153616.157605-1-wafgo01@gmail.com>
 <20260524193846.19216-1-wafgo01@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a binding for a generic GPIO-based counter.  Two GPIOs (signal-a,
signal-b) drive the counter; an optional index GPIO loads a preset.
The counter function (quadrature, pulse-direction, increase/decrease)
is choosen at runtime through the counter sysfs interface.

Signed-off-by: Wadim Mueller <wafgo01@gmail.com>
---
 .../bindings/counter/gpio-counter.yaml        | 59 +++++++++++++++++++
 1 file changed, 59 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/counter/gpio-counter.yaml

diff --git a/Documentation/devicetree/bindings/counter/gpio-counter.yaml b/Documentation/devicetree/bindings/counter/gpio-counter.yaml
new file mode 100644
index 000000000..4bd972b61
--- /dev/null
+++ b/Documentation/devicetree/bindings/counter/gpio-counter.yaml
@@ -0,0 +1,59 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/counter/gpio-counter.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: GPIO-based Counter
+
+maintainers:
+  - Wadim Mueller <wadim.mueller@cmblu.de>
+
+description:
+  GPIO-based software counter.  Decodes up to two primary signals (A
+  and B) and an optional index pulse via edge-triggered GPIO interrupts
+  into a count.  Supports quadrature X1/X2/X4, pulse-direction, and
+  pure increase/decrease modes; the mode is selected at runtime via
+  the counter sysfs ABI.
+
+properties:
+  compatible:
+    const: gpio-counter
+
+  signal-a-gpios:
+    maxItems: 1
+    description:
+      Signal A input (encoder phase A in quadrature modes; pulse
+      input in pulse-direction and increase/decrease modes).
+
+  signal-b-gpios:
+    maxItems: 1
+    description:
+      Signal B input (encoder phase B in quadrature modes; direction
+      input in pulse-direction mode; unused in increase/decrease).
+
+  index-gpios:
+    maxItems: 1
+    description:
+      Optional index (Z) input.  When pulsed, loads the configured
+      preset into the count.
+
+required:
+  - compatible
+  - signal-a-gpios
+  - signal-b-gpios
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    counter {
+        compatible = "gpio-counter";
+        signal-a-gpios = <&gpio0 10 GPIO_ACTIVE_LOW>;
+        signal-b-gpios = <&gpio0 11 GPIO_ACTIVE_LOW>;
+        index-gpios = <&gpio0 12 GPIO_ACTIVE_LOW>;
+    };
+
+...
-- 
2.52.0

