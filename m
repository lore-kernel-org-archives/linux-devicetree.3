Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794470770;
	b=NdOrjdroQ5jRFOgYSKtISDcGnAGoWq1evtlV4PY61Z52vfVQ8i5aX5lyq6Y9gmjqPyyl
	 Ebx/unDHliO0pOY91F0R1+VotMfLqLq0yCpP8rUhhuU3wNMsUEU2OGoJ8ekAY2WAAKflw
	 AzM8MnhIb6YW66RlVja1spQA1lIkCDpusumbBO5v3kf7vhaQn6CyAxPUUxcMfKxCnhBce
	 L4mahVQN9CyIP2JMj7mbvnnsBooVKF0ilipCS6kYQtpyIrcUGYJWzuk8zFCiNQ3RQlp8h
	 5Fg4wpAbSu4iNoeBYUpiRH5qRSn47Ju69u/3ein4m3Npvd6TW4FxXsf1D08CvmGJfqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794470770;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=gma6tEKKFClTNwQqyrudA9xAP8hDFuYrKZEMjTt+5oE=;
	b=eorQ6/6HrVGio2PDH0UoRGfDyQVGRa3RfOtea7PuHKC39jgHYI3ge02hCrqNXpjhVmFJ
	 5kypRbhEF06doX1+G+MqGAVDknhmMYeGDvUzFPtakf8NulajtWK53CVxezggz719CkNF0
	 N7JfDKQs+u95+V5Xpz+Ns1QiLDK84hSoJiq9YTVilQ8Nh4+ROAn+rUiJcSTrbNhdCx2dh
	 IRk+ipDvJWZutxbB0L6rRfvBzs3QfqevTeThzT5X0bYPLLz9NaLA1wnYesLqVcYZJadKG
	 7OD77qXj6p43TD7y342LJnf+iZcX97AEAh4ZSTsCiqu7tBmYRa52/Qw8oVJyJrySKog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KVaAVW+Q;
	arc=none smtp.remote-ip=209.85.216.43
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8E92606A321
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 08:06:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8E92606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KVaAVW+Q
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3ac91ac8924so2315428a91.1
        for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 00:06:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794470769; x=1795075569; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gma6tEKKFClTNwQqyrudA9xAP8hDFuYrKZEMjTt+5oE=;
        b=KVaAVW+QM8Qx3j8rarPWiwsJXaC2P/laffzehB8YUNEvHeldzttyvEEpnwiIasZZij
         d9C9jV/ULN17NwW3Vd7SzB7d85B3JweWpfMqgwkGZLiChDdlg1PZCOE7OwcU4bxkZgSS
         bA7zci8Rp2Uqz9suxo/viyCn+BATWcUxYE/Sv6U0AguJQ31sCKKfx/y6I1onYfjoesvy
         Wk3onyOhVjl7XlciOSFPuas+0kjJYJtip0a8uaTdkGMrcrbXaRAg58tjdyP3LHtrWHNu
         hddH0qGarYPjb/sJno/LE2qcOOkmmWXPr/MCsJQIKh9IT/g9WULFkKLiFPD7zgLx0c3D
         Ip3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794470769; x=1795075569;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gma6tEKKFClTNwQqyrudA9xAP8hDFuYrKZEMjTt+5oE=;
        b=ka8jHb+6HbBhotv+PL+Q9gIBqQpGcB6qCRdHkS8ZDPIaT+/cnlDncPnvgfrCl1QTF1
         DytpfQCZxdCHNeVu8Jr50LJz+q1GRzM4r/UCN5ReM/hdLXHnJGnUQ9ACsjvmrVFEQMjP
         yx1F8HNSLlbbYy6iOZ4AOH0gey31cXHDxtEs3+FMsGg9myjQVrYUWloN+AFLWUDBDnm+
         9A66OvftCMZlwgDcxz3pUoENuenIt1jDY94ldZ00Npf4N1/pwPj4vHqYUDFHY+dXr0D5
         p8L1Nwqcc+8eU/hamiDkAgU/K1hc5bl5p1Tl/9vu8g9CwmHoenYd5taz7Qpazs9nyVJO
         zumg==
X-Forwarded-Encrypted: i=1; AL+hErGEHpRQ4G4fUm1QPUg3FlYw8zLi/o+6sdVRAhDsJ53rnAy9WSPzPsmtdmChqnMEy8jrou3re5Mxj8UY@vger.kernel.org
X-Gm-Message-State: APuU4Z9nyjRJEHAHys73YSSETVrtHsZtbY+mjdnRxgMj+ki26A4U15Oq
	1rBO3MvxAxEFKM0+zVN6Kb+K/hB/+3jedRLUMhWjDJO8kPnF7GHh7jTp
X-Gm-Gg: AYBFou1D7UwwRGzp9iP1filptcM05syiYmYXTF9gsZb0/byZ5RppdbTY72ToEdzDrgI
	jOwbOoo8aWz/9wg87PDIxhY/mBD/+DuHPGmRz2KAjxeCXJ7hiD1HOaoFiXfsoETL48zvCfKuiEQ
	Lgfz+WWW9o1BRxMEDxAIXT21vszYyNs7E/a6CQ4PeeZCMeE6p77aOV41SBzUhQdjHTEnRYJRW1U
	XtMMxJX6Gk822+J9xtByhzOoY6yLKxMV5cFwlfTT7Q/SVHhP4Y6JXhrzsj8P5yRD9unYLwTt8Gi
	DLo6ENjCudRw1lNMt8EY6ZOq2BVR/Pc8H62/esl1f9hsbHjttimAYlgtbDCK+6sgQur48gEvz5/
	VFGuC7gb9jQcSxQEOQOrWTdFOV6HSMIWYMql6MmNv9kckC9S0hs3xnjUq+HrUmS+7EIPpwqgHjc
	EhnC16hAFgKeiJMnhkr/SPp/SaFBh21GY7BZYhGL6B2WQpxVp/R/QR/uZZrXFI6UVgDrHkHDMOU
	Wy5xaJV1ATwswVi9onnP1mWmtaAQwihmwgQK3g/AQJtK6LTgEYReWkbZUjwG14NJi765lWjSDvS
	Z6hPWL9yrUnT641Zt0upfDxBbbaOQYGWQen9mlktGP0GTMgKRx92H8DauQOe
X-Received: by 2002:a17:90a:e7cd:b0:3ad:6090:a189 with SMTP id 98e67ed59e1d1-3b182f93b3cmr4879918a91.45.1794470768965;
        Thu, 12 Nov 2026 00:06:08 -0800 (PST)
Received: from shaunak ([43.242.208.118])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197ce49d6sm3474383a91.4.2026.11.12.00.06.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 00:06:08 -0800 (PST)
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
Subject: [PATCH v2] dt-bindings: thermal: marvell,kirkwood-thermal: Convert to DT Schema
Date: Thu, 12 Nov 2026 13:35:32 +0530
Message-ID: <20261112080532.30774-1-shaunakkdatar@gmail.com>
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
Changes in v2:
- Fix the maintainer property to use YAML array.
- Add the missing newline at the end of the file.
- Rename the schema to marvell,kirkwood-thermal.yaml to follow the vendor,device.yaml format.

 .../bindings/thermal/kirkwood-thermal.txt     | 15 ---------
 .../thermal/marvell,kirkwood-thermal.yaml     | 33 +++++++++++++++++++
 2 files changed, 33 insertions(+), 15 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/thermal/kirkwood-thermal.txt
 create mode 100644 Documentation/devicetree/bindings/thermal/marvell,kirkwood-thermal.yaml

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
diff --git a/Documentation/devicetree/bindings/thermal/marvell,kirkwood-thermal.yaml b/Documentation/devicetree/bindings/thermal/marvell,kirkwood-thermal.yaml
new file mode 100644
index 000000000000..00edb4c8f8f4
--- /dev/null
+++ b/Documentation/devicetree/bindings/thermal/marvell,kirkwood-thermal.yaml
@@ -0,0 +1,33 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/thermal/marvell,kirkwood-thermal.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Kirkwood Thermal
+
+maintainers:
+  - Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
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
-- 
2.53.0

