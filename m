Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794468586;
	b=rS+TAHZZwnX6NvA+fcIfpQq9h7j7eTaGg0G6FZF0HKTBM7YkMRp5FK6owcXPW+3R7Gbd
	 1ucxjTXcvktmriNvx4SAGN9Zk7HVni8MDn95JSUs79V0DbN/7F2NaEgwqqmdInUV5XBEl
	 n3mHpDvAhLqAfJGqYBz3X53uJLV1CQhOfq+wY8wNzdC73zOug1JgbFCFBLMbLFaHMC8xE
	 f1roW3Ana1tviWy7/hJ97WbeCZe/U/vQGX5iVpx9Nj5vOzQUrdeQpBvelwfn3jBUtdIkK
	 xaIkba2K4Z+1IuTa7e/eJKD/hMpUqcXlSfm8eFtbcTmqtQE7Luzle/3QX/ecuP6sL8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794468586;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=EeCGyqkm0JqSOK4vQP3xUOcJ8X0Mgwj1dqLLK6KYn3E=;
	b=38TVSnFIoEnHkWA3pJJ7bX/iORQnAXRFRBDfNNWcaUgBzbuuSbXF+C82qAiJgc6qcIqs
	 uY5q8Hoaq6EOdUR6zR8dgUxeRCa5WNh+K/+nTfqGspD6H+PLhhTCzRPQM2B4l2RsXcI4D
	 VOtAMfLGq3+m9PqiWhG8hPO6Y8XcWnpcBJHu0M+eCpfeFIcX/n1L83zElIQ7q0Hw5g9Kr
	 IGlwdZTquFDOOjBaxM06T30xT/dJaNCaIOnhJB1XamxgUTrK44l5upkn52JEkMlG8TL+3
	 AI2jOI1fnmI6mF2zrKL3Erawwmzk2lyUV0BOGycrYiUs97pTDmCeBofS8U3Q8FTT54w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gOmxHypx;
	arc=none smtp.remote-ip=209.85.210.180
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 345F2606A32A
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 07:29:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 345F2606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gOmxHypx
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-8a0880a46e7so339152b3a.1
        for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 23:29:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794468585; x=1795073385; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EeCGyqkm0JqSOK4vQP3xUOcJ8X0Mgwj1dqLLK6KYn3E=;
        b=gOmxHypxd4O4PUIV8u4WBmDa9ZbYNZauWX/5z3f7n4qIiWsDVvKE5ksPpqLRja/Fx7
         syfnGKTMQKsemE9DYKzof9wMvwuaztIhowiACaT0TZDl2pOO81i/quJBa3z/LYcLeLFb
         LHLT3TGVFFu9puCuj5J7I9JfcDHOGL64+8CR7MaaFPNUfRBXnXAQC57Tm8yTM6qXapGi
         ShbuZ7OSvxHpcu/7LR3pJtuh50Q+rJ69QRVvanQmFu5dygF7+yJcjuuClLFJIrfc8bqC
         l1LgjEVXtzdnU0e25i2m6CSiRhIjPPcTq2p9iM6NWTrI8vjlOl6RkQIiXUNbYY7i20HI
         l0Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794468585; x=1795073385;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EeCGyqkm0JqSOK4vQP3xUOcJ8X0Mgwj1dqLLK6KYn3E=;
        b=Y6WxGt395f1YFyD/s5hBs4OEU/ZNcTiggIgxxTukvxVy1t77TbMQiyqlXTwhhnFMZj
         ONJiAkqKdA1fRxTEJZBPWJegmU9Xg9PRbskZkOS++tywWyvQwl3mhgpACoWpi2YqhWtn
         IBfOyJv+gftcipRFiNPPiEhvCd3bbP8ZMcKjzDfGA0+5fen591tnxXyDHUxmUJC+RD3p
         H++nE6VCW3DAV/Z5SW5xNiTh9FQGsxyWP7aeyPS92wfyoFAnO0G9wcgL2xXEOFQNhkaT
         C8NqyUINPZEh/l43uQTkjQvt1BFa5I8XehYwATr3sx4xOtt08FPM2MMfY0R1w9zJKyVv
         k2Jw==
X-Forwarded-Encrypted: i=1; AL+hErEJiVrt/RO50mCbjlfVpj5MsKe50ZUTwLBhYBNtccUrJPo7FR7+n2TsrBKy9c8XYdl4H9BJ9/guYjyU@vger.kernel.org
X-Gm-Message-State: APuU4Z+asbuhEN6WyVF7doUN88dOfakDo0uUs3Bco3vBgbIVjTTXKB6c
	YmeB0CbvmaJ4QTxxTNcwaAkRmuodRuI+vBj8BdXsjQzLAwYgD9ZsUiCbYTMRv7Ho
X-Gm-Gg: AYBFou2UoHBAtC5XkR/Ct0PiVfHfui6ZNRD/X02f4Q+yctvI7/XssmFSLsModtZPO7o
	zfE8x5ALktxmj+wMQi8Gc1GPevT9fELo5G7718Ct2JsAH5hq6YOD8Onelepv5vMMvFzgcEg/PCq
	40QStKkohti+pQGYQePo7srCpRrqoJNCGY9byUB+2P7DZxbSvSC8X2xT5G48UpCMYB04lZoWLtP
	5tVHqWN9weBmzeBNtUOAlbD5TQ+hOK3tJ2CAggZHUrQbtDETQdpZjpV3bfFceg6Ca9Yj6uHGwum
	gtM7Huchd+xRiMwmV1L/CeZ4um3njjkEYyaguHM31sNgZawI2P7f7ldDz5RlA3b1ZVU3itzLsLK
	IWpZ2S/PNpILxVWerF95kEMuvP++ijQOWevUMcysPGGN9X30d5pyCcHs7A6lz8WEpE8Ad/cl0PZ
	O2ahy7dfv4NrQsRlFgs0AKlqjrqGDPMg2cvfz3rz5vKvGAbK4KzLD57s5ejYvu2/UDoyWN2Oc+e
	hdiD9zDbkEr3cVxGmZ53fsqFpIIIm4IBn2N3bnjt5xbvF1/mwIp+bbqlVUytWrSgbvrfyVJKQsN
	APIKdDjIxe5BZJVUdPHFGVKnkeZzWIYc63sX7sqfws925OxVddLhmbweRvqF
X-Received: by 2002:a05:6a00:451a:b0:8a9:b07c:7709 with SMTP id d2e1a72fcca58-8bd5cd78ad6mr1206200b3a.19.1794468585366;
        Wed, 11 Nov 2026 23:29:45 -0800 (PST)
Received: from shaunak ([43.242.208.118])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8baab8dd5b4sm2980797b3a.53.2026.11.11.23.29.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 23:29:44 -0800 (PST)
From: Shaunak Datar <shaunakkdatar@gmail.com>
To: rafael@kernel.org
Cc: daniel.lezcano@kernel.org,
	rui.zhang@intel.com,
	lukasz.luba@arm.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Shaunak Datar <shaunakkdatar@gmail.com>
Subject: [PATCH] dt-bindings: thermal: kirkwood-thermal: Convert to DT Schema
Date: Thu, 12 Nov 2026 12:59:25 +0530
Message-ID: <20261112072925.22075-1-shaunakkdatar@gmail.com>
X-Mailer: git-send-email 2.53.0
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

Convert the Kirkwood thermal binding from the legacy text format to YAML
schema to enable validation with dtbs_check.

Signed-off-by: Shaunak Datar <shaunakkdatar@gmail.com>
---
 .../bindings/thermal/kirkwood-thermal.txt     | 15 ---------
 .../bindings/thermal/kirkwood-thermal.yaml    | 32 +++++++++++++++++++
 2 files changed, 32 insertions(+), 15 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/thermal/kirkwood-thermal.txt
 create mode 100644 Documentation/devicetree/bindings/thermal/kirkwood-thermal.yaml

diff --git a/Documentation/devicetree/bindings/thermal/kirkwood-thermal.txt b/Documentation/devicetree/bindings/thermal/kirkwood-thermal.txt
deleted file mode 100644
index 8c0f5eb86da7..000000000000
--- a/Documentation/devicetree/bindings/thermal/kirkwood-thermal.txt
+++ /dev/null
@@ -1,15 +0,0 @@
-* Kirkwood Thermal
-
-This version is for Kirkwood 88F8262 & 88F6283 SoCs. Other kirkwoods
-don't contain a thermal sensor.
-
-Required properties:
-- compatible : "marvell,kirkwood-thermal"
-- reg : Address range of the thermal registers
-
-Example:
-
-	thermal@10078 {
-		compatible = "marvell,kirkwood-thermal";
-		reg = <0x10078 0x4>;
-	};
diff --git a/Documentation/devicetree/bindings/thermal/kirkwood-thermal.yaml b/Documentation/devicetree/bindings/thermal/kirkwood-thermal.yaml
new file mode 100644
index 000000000000..1f9b97bdd48f
--- /dev/null
+++ b/Documentation/devicetree/bindings/thermal/kirkwood-thermal.yaml
@@ -0,0 +1,32 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/thermal/kirkwood-thermal.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Kirkwood Thermal
+
+maintainers: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
+
+description:
+  Thermal sensor present in the Marvell Kirkwood 88F8262 and 88F6283 SoCs.
+
+properties:
+  compatible:
+    const: marvell,kirkwood-thermal
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    thermal@10078 {
+        compatible = "marvell,kirkwood-thermal";
+        reg = <0x10078 0x4>;
+    };
\ No newline at end of file
-- 
2.53.0

