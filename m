Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com [209.85.216.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F12B031F9B4
	for <devicetree@vger.kernel.org>; Sun, 10 May 2026 19:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778440167; cv=none; b=oqWEZheIZ5yKj1ENejFiuU5lLgMc5ZiGHA/j/0lMYRkVcpXPyf93oG4/Cvk+i3wIddPtvFzTRCZzH6tCBphCZmCxZfVAjXsEn7nYN2ALu3jy/QLbdCtFqzx41ep5oAPxg2u69CIY4CvhdgdYYQxhuLsDRb03493GFgzCSoP8LuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778440167; c=relaxed/simple;
	bh=MlaqB++2vElGDvD0ve18O4Ua1b+BZ8aoUMQ5F3ZMf0E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NO0l5Bex4SqSG3eH7h8Y/D4WCHTxV3j/KyTnIHNKugBR3FuFAUcJVmrXHUSc668m3boG8SiN11wjYTnW54ZI3rxs/u1hvzD4uUZgQdJYQUlblZIZ1bZfcH8o2stSLjL9x36+5RIUp65k8IMgbbOw+KmK7JsYLqGo4mIDoUY0sNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j98YS0fu; arc=none smtp.client-ip=209.85.216.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j98YS0fu"
Received: by mail-pj1-f65.google.com with SMTP id 98e67ed59e1d1-3660b84347dso2110306a91.1
        for <devicetree@vger.kernel.org>; Sun, 10 May 2026 12:09:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778440165; x=1779044965; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=beMpOGr21Do0GmgSWnYf7S53YhuXcb7o9G97kPTeipQ=;
        b=j98YS0fuLgHMQ55sUmlF8wVIw7FZzvT4ecXy53gfgyLQrrZ7vQH2XaMROGb3ZA1Zyo
         /GGaMowuAqXu6t28WKdo9yiCuHyN2FGu08TsrxZYZCQ0LcHKjSjX6efk8dbhZ8kCc5OB
         7ze5qrB2uOVwreAAJdw2BFzl8WSBsRZT4JldisQT+mCCMGMpY93QKqjCAUwUG9Lnnx4w
         7NZr5DP1sHL5vyrDj99lANVn7Bo4/XOfWYz7QZVOU0+7y9QrBCy5/Is6mG3/guqRqzHZ
         0X4eR80E/JQ7axHUMvwXfVmyUkQIYIc9bVLmR2uIyoiqpDea9oNsiGmAO6g+4vRFqQ6f
         nvrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778440165; x=1779044965;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=beMpOGr21Do0GmgSWnYf7S53YhuXcb7o9G97kPTeipQ=;
        b=hxQLVVdX0v4J/7zN5NDLhtnRU8RWqVRtexPxqZEyedAnLRMVWTwusO6yELViJn9TRm
         90qFsTJtNBPwYpuNWT4SPUSTWV5AFuetvSX21BOd2OtoIXE1BnFsDGXUFdjGh/iLgQjo
         grAlVJOlzuCmDgGIN+tBnshsGgvsr6fsbspeCmNLfkrcp0xJc+zTh3G431+0TesKzMfJ
         0YHAXEmX+FLH+N9Wy+tzqZhMQ7YuhksNoFTyuUiJll3eLgNiYh12XQ0DdLCetU3oGt6F
         rh5t5dNMxmIZ/lN9jg7pxkAb2afYaTrrtvKEFhAOll0KosghiIf61YmxHgNQG6h4QjXD
         +IPQ==
X-Forwarded-Encrypted: i=1; AFNElJ97MJPwDtlo0OYMUcBKiKyUrzJhAIryiXEsMPWCO0iyRID/UXjoYdpZYV+MKvJTe/q9P6Cbv+JMmNVx@vger.kernel.org
X-Gm-Message-State: AOJu0YwI4wiGJ/RMBvYI32sGznCTyes+PyWQTXR+KqNreo2FK8WKIZCY
	NPDDtxDOt2EEOz/CCkMdqH3upnqiogucN6h45BO/jhxeuLVmabx+Esjn
X-Gm-Gg: Acq92OEZuk9Exc4yrHnnVKEMGTm2JGwVLZUkw2VPhcsnaSNZPvPGsJyH/l6EqmFOFrC
	yDXu9wOEPNjLS7A+ctRTBnDRSAdYxLloh8XJeoPKGouMhFrH0aWhd6O7pTDTMQABGo2Tz18+et0
	xvOVdJUPxp+N/reQxmsyNa+VybBNMLKbpvVxA55YGy141O9iBjVhPgw+PKSoSo2RgPwiY7ojoK4
	4z21gLKbBFo/t/BauSykkfYK0rBhAPmVWqt/mOVcUVzlVLswzRVtiRZ/NQkuvwULQ3niLHujmja
	5FwTnj+VFmjV0Sc5xJGzoU9+tvTVtuMHeL+g14sxJURkzvPodWICNaAYD62IgL7OUzf04wjZrbq
	PtTvYzqb4ERF5lf7dyGxwtQbZwGc7E+oxBrvUXK+fFSoJs+FTLXcpV8v4VeHxQ9dT04zhXOIvKf
	lwaY3sBL9ACGMk1FFG+r7iLBW+Qf2AF30sbhdGHrzy/mGG1FWiXjAP/JqhX93ENtX8tIM=
X-Received: by 2002:a17:90a:4ca7:b0:367:c367:7e19 with SMTP id 98e67ed59e1d1-367c3678e61mr5841944a91.21.1778440165112;
        Sun, 10 May 2026 12:09:25 -0700 (PDT)
Received: from localhost.localdomain ([2409:40f2:38:d6b4:286e:7088:fd10:80a0])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-367d623fd6csm6598782a91.1.2026.05.10.12.09.20
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 10 May 2026 12:09:24 -0700 (PDT)
From: Kartik Nair <contact.kartikn@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: jacobsfeder@gmail.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kartik Nair <contact.kartikn@gmail.com>
Subject: [PATCH] dt-bindings: misc: add documentation for Xilinx AXI-Stream FIFO IP core
Date: Mon, 11 May 2026 00:39:08 +0530
Message-ID: <20260510190908.400-1-contact.kartikn@gmail.com>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add device tree binding documentation for the Xilinx AXI-Stream FIFO
IP core (PG080). This documents the compatible strings used in
drivers/staging/axis-fifo/axis-fifo.c which were previously flagged
as undocumented by checkpatch.

Documented compatible strings:
- xlnx,axi-fifo-mm-s-4.1
- xlnx,axi-fifo-mm-s-4.2
- xlnx,axi-fifo-mm-s-4.3

Signed-off-by: Kartik Nair <contact.kartikn@gmail.com>
---
 .../bindings/misc/xlnx,axi-fifo-mm-s.yaml     | 44 +++++++++++++++++++
 1 file changed, 44 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/misc/xlnx,axi-fifo-mm-s.yaml

diff --git a/Documentation/devicetree/bindings/misc/xlnx,axi-fifo-mm-s.yaml b/Documentation/devicetree/bindings/misc/xlnx,axi-fifo-mm-s.yaml
new file mode 100644
index 000000000..597699034
--- /dev/null
+++ b/Documentation/devicetree/bindings/misc/xlnx,axi-fifo-mm-s.yaml
@@ -0,0 +1,44 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/misc/xlnx,axi-fifo-mm-s.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Xilinx AXI-Stream FIFO IP Core
+
+maintainers:
+  - Jacob Feder <jacobsfeder@gmail.com>
+
+description:
+  The Xilinx AXI-Stream FIFO IP core allows memory-mapped access to an
+  AXI-Stream interface. It supports both transmit and receive FIFO
+  operations via a memory-mapped register interface. See Xilinx PG080
+  for full IP details.
+
+properties:
+  compatible:
+    enum:
+      - xlnx,axi-fifo-mm-s-4.1
+      - xlnx,axi-fifo-mm-s-4.2
+      - xlnx,axi-fifo-mm-s-4.3
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    axi_fifo: fifo@43c00000 {
+        compatible = "xlnx,axi-fifo-mm-s-4.1";
+        reg = <0x43c00000 0x10000>;
+        interrupts = <0 58 4>;
+    };
-- 
2.50.0

