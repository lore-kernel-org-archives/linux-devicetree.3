Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 660DE267714
	for <devicetree@vger.kernel.org>; Sat, 21 Mar 2026 21:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774128009; cv=none; b=Aaj/L0t2ZWMngC0sUYNNBxTgpTvqjdMVtsg1HirPAlF4QndyR+RanB4/R2nZW2Fr1mVtECKXpb2OG2Ic1k6wupHzub7bewvmPIcVp7fV0Eyh6TX6IRLv5mfR9oNWS2TlN6RH0BH/dcHKAk5UW8JQ+igELEq+fzpGe2Dj+lDjMsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774128009; c=relaxed/simple;
	bh=ZKk0y+cFIrZ/4uI+fWfBRwLXc6bjmfZ30cUW3aVa3zM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=FUZkRJOez3YVye8WtDSGMmTdRCQF5uERg3F6THo/EUtbP7x+KaAM8dVKJyRci8Ww3XID972t+86Si3TirnHYRYzoqqqEbgvJAgDriA1HK3yRu2U7pHWkDWtyzn6bwjwQOGdLUoLJfBMne69JyMvcAot2BD++oQPn/MRgMHLBJ3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hPjayRhi; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hPjayRhi"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2aae146b604so19113505ad.3
        for <devicetree@vger.kernel.org>; Sat, 21 Mar 2026 14:20:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774128008; x=1774732808; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WhIdzTmYC8R2SfzqFRZ7Gsyo+REWy2RCSseFLAZzguo=;
        b=hPjayRhic4rLf2jNLlXpE6TizmgLhacAxioeH59vtTGPWwUXZFsxvFeGCXvwlJ2SBD
         ajkf+bEJPJx2S0Ly8ikI+ax8XwWXgUYFMQlSxTbKUsfiv0D0/WNdwsNnEDTT6uCsRO90
         XqUEG4fYLJ5D3pdbjG6kyNhkyDSypa9KES/yRgRVqdLvRL3wtXZpXhJstFB2q1Eyb559
         LORzoQ2V5WF9QWL8ILbYr3GdnoGuo93Io+N6kd03gjGtUDcSlc9tg0GhhxwAtEuRUMVG
         XkAo/4uEl875RDUpfve0MMeFIC6mRy9MgDFPoDRF4xRRxZifWn8gc8c8aZhEUdeMtF9j
         eHjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774128008; x=1774732808;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WhIdzTmYC8R2SfzqFRZ7Gsyo+REWy2RCSseFLAZzguo=;
        b=KF2GADqQbfSj3YMZYfTQqpLNHdgOokdLKkfVhKNv16Jo46z4vOX6KHznqLuf+N3Tht
         s0fxben/7WWxiJOllvsUSlJ7cXJxelMqZwb3YDamOEx5uMj3VcrxR4F6FdSKOIl2drXH
         id5xp6gAKWrxRLMVRKc+IhTGPkCJ9HTBM85LkhlsD39eSByIuOVuuWbNyPXiN8wx0Evh
         iTvVe29FLhpN2oLKS42N2IzlCFKJB/F1pjtrNbny522viJlA6iJO6xIn+aqko8XH1Jxd
         ZXq5z15w3P6mM+SisWWVVKt+pGRt+wQUNLXKkXC4GQEeVHG1Ccur1VmRCforGBLgmTUi
         ZkkQ==
X-Forwarded-Encrypted: i=1; AJvYcCUo2ndwpZKu74ciY+vIAow23uLWq3nStEpWwGyI7/xEDK5F04gjvKQ06C6GXK6pxztsgnCp2YgTpgFu@vger.kernel.org
X-Gm-Message-State: AOJu0YxLdGsx7BBaE7FM57Wi80uOxh/Sb3CYWl3cBUJ7cuDqKMEVaYUJ
	kpNv2Lf8Q1JjRXwCw3kczh1BzxAzLYGiiWsQ2aIyfHj9TczoqPMGJT7+76GeCf+z
X-Gm-Gg: ATEYQzx61PK+K+MeYGuGDTihppfxFHYmiU1gdyM32OtANSrQU+wipE7A+nk2LvZBEjL
	Iw3T1EHc+BcKfHEWzNqQ3cC2enVgBdMw4gkuIwFvXM/7BB3nTvymsiPAj9W4nVrv+6bMdM2nDGZ
	F5PpYBra+fyqs7cw+3FnBHb64lamc83GP7lYkyDSNhgxvnWb8Efc9vYYW7aGfAn6n0VY9GOVKpW
	WclKD9QmUAh7/jnbAPd//eq4c1Dl8wPVIpOGMNx6qKd0ENJIU+cuafiWR9GYOgXnqA5D3lR+MYV
	V7QT7MsJK4OjHH6fT85RXAdai2XVThDHhzMN7PfhAfMg7U3Q6Pz92/iIHsy0INTTKbSJ3ZzrS69
	f5apsxYhKIa3h+cDBJnFfzxTm+EIAUvU7u+1b5WIR+lKPopg4V/XMF45ECBVVsBQuBpZw50VqUH
	hp21PebcNOM/v+Fdvdd2nC60D4AQ==
X-Received: by 2002:a17:902:f690:b0:2b0:700e:fc9b with SMTP id d9443c01a7336-2b082793ebbmr78523325ad.34.1774128007628;
        Sat, 21 Mar 2026 14:20:07 -0700 (PDT)
Received: from [127.0.1.1] ([103.216.213.160])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b083655b81sm82269275ad.41.2026.03.21.14.20.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Mar 2026 14:20:07 -0700 (PDT)
From: Atharv Dubey <atharvd440@gmail.com>
Date: Sun, 22 Mar 2026 02:50:01 +0530
Subject: [PATCH] mailbox: dt-bindings: mailbox: Convert to DT-SCHEMA
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260322-mailbox-v1-1-c6251f18187c@gmail.com>
X-B4-Tracking: v=1; b=H4sIAIALv2kC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDYyMj3dzEzJyk/ApdQ7O0xDRjc0Pz5LRUJaDqgqLUtMwKsEnRsbW1AIT
 J/nxZAAAA
X-Change-ID: 20260322-mailbox-16faf3717cfe
To: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Jassi Brar <jaswinder.singh@linaro.org>, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Atharv Dubey <atharvd440@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774128003; l=4642;
 i=atharvd440@gmail.com; s=20260314; h=from:subject:message-id;
 bh=ZKk0y+cFIrZ/4uI+fWfBRwLXc6bjmfZ30cUW3aVa3zM=;
 b=CAktGuVb7uax32Ia6huj7xstfxG/NMPnbq6uUNxekUQvvunPpZIv7rfd8cXQ76wU/HSadUPEH
 TUuMPoevcelCs5hSMmoV2HOic7OwbdLUJB1DYe6qKXl2dCUQLs17aoR
X-Developer-Key: i=atharvd440@gmail.com; a=ed25519;
 pk=T6i1xWOKT/RUSDYATSgyVG/4X7ac8jPjRSG1mMAcqVk=

Convert the Generic Mailbox Controller and Client
binding from text format to DT schema format.

Signed-off-by: Atharv Dubey <atharvd440@gmail.com>
---
 .../devicetree/bindings/mailbox/mailbox.txt        | 60 -----------------
 .../devicetree/bindings/mailbox/mailbox.yaml       | 78 ++++++++++++++++++++++
 2 files changed, 78 insertions(+), 60 deletions(-)

diff --git a/Documentation/devicetree/bindings/mailbox/mailbox.txt b/Documentation/devicetree/bindings/mailbox/mailbox.txt
deleted file mode 100644
index af8ecee2ac68..000000000000
--- a/Documentation/devicetree/bindings/mailbox/mailbox.txt
+++ /dev/null
@@ -1,60 +0,0 @@
-* Generic Mailbox Controller and client driver bindings
-
-Generic binding to provide a way for Mailbox controller drivers to
-assign appropriate mailbox channel to client drivers.
-
-* Mailbox Controller
-
-Required property:
-- #mbox-cells: Must be at least 1. Number of cells in a mailbox
-		specifier.
-
-Example:
-	mailbox: mailbox {
-		...
-		#mbox-cells = <1>;
-	};
-
-
-* Mailbox Client
-
-Required property:
-- mboxes: List of phandle and mailbox channel specifiers.
-
-Optional property:
-- mbox-names: List of identifier strings for each mailbox channel.
-- shmem : List of phandle pointing to the shared memory(SHM) area between the
-	  users of these mailboxes for IPC, one for each mailbox. This shared
-	  memory can be part of any memory reserved for the purpose of this
-	  communication between the mailbox client and the remote.
-
-
-Example:
-	pwr_cntrl: power {
-		...
-		mbox-names = "pwr-ctrl", "rpc";
-		mboxes = <&mailbox 0 &mailbox 1>;
-	};
-
-Example with shared memory(shmem):
-
-	sram: sram@50000000 {
-		compatible = "mmio-sram";
-		reg = <0x50000000 0x10000>;
-
-		#address-cells = <1>;
-		#size-cells = <1>;
-		ranges = <0 0x50000000 0x10000>;
-
-		cl_shmem: shmem@0 {
-			compatible = "client-shmem";
-			reg = <0x0 0x200>;
-		};
-	};
-
-	client@2e000000 {
-		...
-		mboxes = <&mailbox 0>;
-		shmem = <&cl_shmem>;
-		..
-	};
diff --git a/Documentation/devicetree/bindings/mailbox/mailbox.yaml b/Documentation/devicetree/bindings/mailbox/mailbox.yaml
new file mode 100644
index 000000000000..856386f076b4
--- /dev/null
+++ b/Documentation/devicetree/bindings/mailbox/mailbox.yaml
@@ -0,0 +1,78 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mailbox/mailbox.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Generic Mailbox Controller and Client
+
+maintainers:
+  - Jassi Brar <jaswinder.singh@linaro.org>
+
+description:
+  Generic binding to provide a way for Mailbox controller drivers to
+  assign appropriate mailbox channel to client drivers.
+
+select: false
+
+properties:
+  "#mbox-cells":
+    minimum: 1
+    description:
+      Number of cells in a mailbox specifier. Must be at least 1.
+
+  mboxes:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description:
+      List of phandle and mailbox channel specifiers.
+
+  mbox-names:
+    $ref: /schemas/types.yaml#/definitions/string-array
+    description:
+      List of identifier strings for each mailbox channel.
+
+  shmem:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description:
+      List of phandles pointing to the shared memory (SHM) area between the
+      users of these mailboxes for IPC, one for each mailbox. This shared
+      memory can be part of any memory reserved for the purpose of this
+      communication between the mailbox client and the remote.
+
+additionalProperties: true
+
+examples:
+  # Mailbox Controller
+  - |
+    mailbox: mailbox {
+        #mbox-cells = <1>;
+    };
+
+  # Mailbox Client
+  - |
+    pwr_cntrl: power {
+        mbox-names = "pwr-ctrl", "rpc";
+        mboxes = <&mailbox 0>, <&mailbox 1>;
+    };
+
+  # Mailbox Client with shared memory
+  - |
+    sram: sram@50000000 {
+        compatible = "mmio-sram";
+        reg = <0x50000000 0x10000>;
+
+        #address-cells = <1>;
+        #size-cells = <1>;
+        ranges = <0 0x50000000 0x10000>;
+
+        cl_shmem: scmi-sram@0 {
+            compatible = "arm,scmi-shmem";
+            reg = <0x0 0x200>;
+        };
+    };
+
+    client@2e000000 {
+        reg = <0x2e000000 0x400>;
+        mboxes = <&mailbox 0>;
+        shmem = <&cl_shmem>;
+    };

---
base-commit: c612261bedd6bbab7109f798715e449c9d20ff2f
change-id: 20260322-mailbox-16faf3717cfe

Best regards,
-- 
Atharv Dubey <atharvd440@gmail.com>

