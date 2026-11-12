Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794492628;
	b=h6mQgrHi8xNH961PsKLuDpeubxlrgIgHNphHbT9NFuua25N/JuI16/5PdsAWIkOl1WrI
	 UXCpRhS/cgyuklimVoCt9LA3ZMlykZ1gc7vrMNrOWANC2LFxWtRipHA244RRw1Qy4nfsr
	 hrAS31ZB1QvNI7rAIx5ps7oWDGCAKp6RSYnRrIH1oosah85phr5YShyXGLxnFsaUL3RbE
	 YC0mbdTZXtlJ+pagDKzfBu3WGr1GXxiEEAFu0R7M+TPXcZNe21l9DX357UNbFkTMwbAnF
	 ssFFqYszXgSMSvrJSJqCu+MIzLJJ7J+PX/hYry4wBd3dGoMWEe/LgX4clTaHpX6nJRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794492628;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=nxyVT71yJJ39uTDbzVGV1GPiP5/ViVIjOJ9mvPoYFeM=;
	b=z5GdT57J2rneL5D20WlgZHxJdExOkA4rZd04POGdjeEWd5AydPd5zlDPw9c2Aceiane7
	 DZRRFh98soT+eIzgrIeKqlpyZHxZel5sbrR/HJPnsHT4UbJc4ZkVA7kfdWOHwg4n0bjac
	 XPIK9dkpZ8Bg3Qe72gYctTkzIQS3f/ONppYD0VxumXf6gyjb5UtwqofxTT5ITVRE8LUFT
	 a8q6+otHTe6Moo0KMBviYizbfBNULH+Ridn4lrPDpbx8DHB4zSuEqXlnUen+7uOUQYO1f
	 mrWe/GvWfQJBCsziNQpZKSdRfJhR24a1dj1+RMKe6G0dPBaXMQ16H4sBh30VIF+RulQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=K8Y0FBE4;
	arc=none smtp.remote-ip=209.85.214.174
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E1B6606A31C
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 14:10:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E1B6606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=K8Y0FBE4
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2ed11653a91so20425445ad.2
        for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 06:10:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794492627; x=1795097427; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nxyVT71yJJ39uTDbzVGV1GPiP5/ViVIjOJ9mvPoYFeM=;
        b=K8Y0FBE4DhhNIqwGaGuO5AFTOMp/htbHRE5tS329ho4N7/MfqqxBmgegsD6lOf0KG+
         HgV85XDx1x+bvSjtlprhzh5MCIJgpHfau0JqPLAJzO5jGAN3RUvydN6GBNiNl0ixh/My
         TB/xxX7DnIV3jMs+S3DaswsAD/VwXCIaYEITK3Wg7GMjKOYzWTkoIKCB96BzDNZaPrCg
         axJiZde1qwmo8j6LneZxyYNjSbdtNKPYsgDOnVRhLF6QdBCXE7mj63K1a3YL36Cq77xE
         YZfLFZadVy/OIXy+baVXbj/449OtDMI6quDxcfuWzatuLq0csO5nRcZ1rJRAe4vErmjb
         +hFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794492627; x=1795097427;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nxyVT71yJJ39uTDbzVGV1GPiP5/ViVIjOJ9mvPoYFeM=;
        b=ELXlG9WaopnKFe2Q62un3f7cGL6MEZfiEuxUeKj1dK1d2tMVKo9rdF//W7xlLqTWTp
         W7gsDYvgPKvjh5ze1240iYT5jKPLmdMmA7TZnRuAlEQKznbvVH/uea+8ro1n+BbVhLYP
         Pfg2mX3K23WdurFWdMceHa3NmBHAgb4YuxvPN+s8Ce41hwJGbifLRYDnehJMIWTU+wmS
         XiLDj9nxU7tr7AHJeIlcDky2fCEFxl/F9doG0jfbqTx7Tr1fDJ9H4VIErHsQDOPgy5kn
         9EWnvBROMe5lHHc3jtEco4SNoJtfwbQRLgsB9OKRT10znQ+yvYA1eQ16niOKY5FUD0Nk
         jwVw==
X-Forwarded-Encrypted: i=1; AL+hErEarPByNeLRuZvJGfERaXnrwwR2g48wkT7nXrKNJvrapSnExamCkuCIa9kZPfNkfpunNJLIY6ZZ1twn@vger.kernel.org
X-Gm-Message-State: APuU4Z+5jxUW9vsud+cV2fy7oJBe8qf0xhyH+nuhrCfz476veL+c1bgo
	FghYOCdQF33elt3gAjY/PKKeI3DZou7Irlwjex6gznwBDBlewSIwzWdO
X-Gm-Gg: AYBFou1MRfpUboQuhEBddYPEMAxC2OS1zj/zWwK0nsfE9Os1QcFvPmTvvJwiQv59KKo
	Vy+YFqv5ltYq0EfI+Coup6oTxGeCISYBkPzI070AfRRXUvzipRS84ufzzZxyvnytnfIA4Ezg98X
	f23fLQ256buxWrTAxCXJBH9OT5v7YdrzxXldaSv0adn+aWua+wF9S3ot6tsMAO73IKvil/6zQJP
	LwSQvWOeNppPcN6AtQNH0vL1EqJVC9dfONYN9fHyvQe4kSCGWwiGtWdVN+SA+0bzBjbOSrNe3ed
	KJG/qym2IPEXkJpOoQ7CCNYmXB1zH2oNSWQ/NhBhO47mXQw269oxZ1oZXiGI/dquE6Bz55x4KVE
	qY6mo/4ztKngL4hyaytLkETpUrSU4ZVw3kIKZOvTG3hLOvnxklY/ma5jl0KtO2m6acCZTdTKZ2E
	S5g8WY2YbFNa0g6SePyAxtMzsivPdwfv32NUyHY6Cwbg/+zz/LmcWirstpVVFlioBF4HK5FGA2T
	2aYqND6nhkODMgtV36mXh7y6Dvk8eGKGKVzLWG3oNEAjYxD31Inb0WqTGcCa2kehYd305laVM2U
	oOsNS8aNOYpj0SREXy749/OiFnLnuGa7mHmWXQi1AaVgm0XvaMQk4J/xjQ71
X-Received: by 2002:a17:903:3887:b0:2e9:855a:12a1 with SMTP id d9443c01a7336-2edd7a223camr58869855ad.47.1794492627219;
        Thu, 12 Nov 2026 06:10:27 -0800 (PST)
Received: from shaunak ([43.242.208.118])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2edb6d4dc3bsm34861925ad.17.2026.11.12.06.10.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 06:10:26 -0800 (PST)
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
Subject: [PATCH] dt-bindings: thermal: marvell,dove-thermal: Convert to DT Schema
Date: Thu, 12 Nov 2026 19:40:05 +0530
Message-ID: <20261112141005.229687-1-shaunakkdatar@gmail.com>
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

Convert the Dove Thermal binding from legacy text format to YAML schema
to enable validation with dtbs_check.

Signed-off-by: Shaunak Datar <shaunakkdatar@gmail.com>
---
 .../bindings/thermal/dove-thermal.txt         | 18 ----------
 .../thermal/marvell,dove-thermal.yaml         | 35 +++++++++++++++++++
 2 files changed, 35 insertions(+), 18 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/thermal/dove-thermal.txt
 create mode 100644 Documentation/devicetree/bindings/thermal/marvell,dove-thermal.yaml

diff --git a/Documentation/devicetree/bindings/thermal/dove-thermal.txt b/Documentation/devicetree/bindings/thermal/dove-thermal.txt
deleted file mode 100644
index 6f474677d472..000000000000
--- a/Documentation/devicetree/bindings/thermal/dove-thermal.txt
+++ /dev/null
@@ -1,18 +0,0 @@
-* Dove Thermal
-
-This driver is for Dove SoCs which contain a thermal sensor.
-
-Required properties:
-- compatible : "marvell,dove-thermal"
-- reg : Address range of the thermal registers
-
-The reg properties should contain two ranges. The first is for the
-three Thermal Manager registers, while the second range contains the
-Thermal Diode Control Registers.
-
-Example:
-
-	thermal@10078 {
-		compatible = "marvell,dove-thermal";
-		reg = <0xd001c 0x0c>, <0xd005c 0x08>;
-	};
diff --git a/Documentation/devicetree/bindings/thermal/marvell,dove-thermal.yaml b/Documentation/devicetree/bindings/thermal/marvell,dove-thermal.yaml
new file mode 100644
index 000000000000..a11611b3c6c1
--- /dev/null
+++ b/Documentation/devicetree/bindings/thermal/marvell,dove-thermal.yaml
@@ -0,0 +1,35 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/thermal/marvell,dove-thermal.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Dove Thermal
+
+maintainers:
+  - Andrew Lunn <andrew@lunn.ch>
+
+description:
+  Thermal sensor present in the Marvell Dove SoCs.
+
+properties:
+  compatible:
+    const: marvell,dove-thermal
+
+  reg:
+    items:
+      - description: Thermal Manager registers
+      - description: Thermal Diode Control registers
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    thermal-diode@1c {
+        compatible = "marvell,dove-thermal";
+        reg = <0x001c 0x0c>, <0x005c 0x08>;
+    };
-- 
2.53.0

