Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FB683EDE61
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 18:02:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778608957; cv=none; b=KMYQ1KQ1wYph3OlPRXlGHYlRC8lCS/MesUBMBNyKS+DCJCsg3J9MFmkyhdIimKDtPTBIrrsvGD33XvXn7pU4hhMfTbmHnoaTlOdZFiktxMOkVBadEq+HQvUWsNuw+KYxMbEJYLT5eUpsPpgUcG7rKbxsmC4CI2uY2G9QBAtgAQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778608957; c=relaxed/simple;
	bh=Fap0G3Ulkv05tUIGsv1rmjqPE5yf2rdWpkgolbi02wE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=b8hmSW8Eyaea+mL+2RgDRnA+o7Updp3rcD1BJMzlEMvJWw6f5rpVE9gcskvIHWY5Hr7Z9yWT0PEcfeX2V6l8sp8L13uNJcwjxxYDSe0t+QQofLprxRY/8Zo79jgbD+tBH01iYTf08FNlCDXhA26xwppr/phrSSOP70xVXGgy7Xs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TABmaJca; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TABmaJca"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-c80203b9d7bso2389094a12.0
        for <devicetree@vger.kernel.org>; Tue, 12 May 2026 11:02:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778608955; x=1779213755; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7Xci0mD+Fhw27MfGGBTyO8q5KCYyJyTfSheYswRyFak=;
        b=TABmaJcaZKJmIKTZ8PXkKAksvoax4G2ztGyegLCObiFURy0F2EVnPyb8Iw3OJHLo8i
         VP8SFODrpN9CmUMV2vHi2QJLYL4tRG+MXY+Z8E2G6ctn5XZkRaRc3SeM2QlRlKfn0WOZ
         pKf2l91rvix4eIoEKkPLbA74Q6DR5vNtFmWHmeJ13Nb7KSylphkzjpCfv+FEnLaaDxKm
         duXHlyKcIlT6tTwbj9ewGGwMfrBcct7g7TDaDrses8lroleMU56eGN/fwrt9qWKzdjCP
         N1ZtEUI6LPRS+6R2IItrBh6W0k5Mvax/eNXj3HDaqFg8SksSjLum2yROXU2hMi2Q77pS
         QTLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778608955; x=1779213755;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7Xci0mD+Fhw27MfGGBTyO8q5KCYyJyTfSheYswRyFak=;
        b=AMWXjabnMma8RqDnclZToahnkJuygKCTuKHiMDMIVL2sFHhorVC7t/xNhxEzaSPsYY
         nhaQQqmFUmhf2hHNCDPdFbpbG5OmbSUSyGBw80fS4Ua4oDG+8CXzZr8qpsd7PIchv9gp
         wFAy6MpBuB7Zu8sbDREkq1fGXdqeGJpHUOQN7OSPBv0zgdosfPwkuj55yEjgu1OV7JVt
         afBpnxMAg7eshTGY1OMB9oV9WZX9kF9aYQMUhRPjApqDfusPd6g7+5TcHrdmZe+Qe/sg
         qozJpK3vrsRRwsd6za2XKC89ekxb0jFMJ/RW6d+mdEzefkpfJ3kXKUEoYCaOiYFwo4H3
         Fqxg==
X-Forwarded-Encrypted: i=1; AFNElJ8YeMq9GNN5AoF6TJKXOnn52HNb5kSs7aRVvUmRwpXbUCTrLu/kJn96z/SHpE/e7DwUQrKCJZ/O+cSH@vger.kernel.org
X-Gm-Message-State: AOJu0YwjJQUVlibKjqwYMHknis2ohAM47XyCq+qUOr8M3dlOB+xWGt4q
	P8nKwmHegaYj8jqq41JqYS8Ez2lBnmiZ6n0l5VB5SFvnME59zHZ3B2rTOs1B2k6R
X-Gm-Gg: Acq92OFXmqOGt3hEU5+AWwmz3btIwJpbGcnuTf5HtrdFRyvkGfpuDiw4mYNeZtojF/f
	iiZG9hIR61DMFooLgGU5Tuxyg9BbwmGeCdvJquCdD0pdH5Q9CP9bz2LAiT/T7YagYZi1ZpX8Z/8
	SWmQDlipNwUbRGO0X7a70fWPZPCh3fNq5WY/v6yhOTxyfPDBcU3ilgxIrbs+uUbXnVbfrEGHAAN
	884DM5cXyY0Qt1w5aYFL61z5DvWSYpx+RZ/Xi3QlHhbzUoxlctZ0CBcKupmxmuK+C0kap8NsWZZ
	SGNOvq19UkJXqH2CeCflsefoV7esPXNuSQXcS/eFXX576idAzxvmRw4iUGqPFECipe/eM4+ZDm8
	lDlGYHjiuHCth6Cl0FeOeE9B1bp2cUMpp4d7IMEYwBWp08vvvpmq9dirMmDiMR3WFAhvXARtbvq
	GVxEnClsadoyPn6MJZV6ONsW+bjgHO+4pJwgH6MzmfM6cqSFKq9FzCC1Rs6Zsxtw5nGw==
X-Received: by 2002:a05:6a20:1585:b0:398:7ca0:43a9 with SMTP id adf61e73a8af0-3ad9a234f27mr4595033637.36.1778608955243;
        Tue, 12 May 2026 11:02:35 -0700 (PDT)
Received: from Ubuntu.. ([49.37.171.24])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c826767e677sm13120456a12.4.2026.05.12.11.02.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 11:02:34 -0700 (PDT)
From: Manish Baing <manishbaing2789@gmail.com>
To: mdf@kernel.org,
	yilun.xu@intel.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: matthew.gerlach@linux.intel.com,
	trix@redhat.com,
	linux-fpga@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	manishbaing2789@gmail.com
Subject: [PATCH] dt-bindings: fpga: altr,a10-pr-ip: convert to DT schema
Date: Tue, 12 May 2026 18:02:25 +0000
Message-ID: <20260512180225.65902-1-manishbaing2789@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the Altera Arria 10 Partial Reconfiguration IP bindings
from text format to YAML schema.

Signed-off-by: Manish Baing <manishbaing2789@gmail.com>
---
 .../devicetree/bindings/fpga/altera-pr-ip.txt | 12 -------
 .../bindings/fpga/altr,a10-pr-ip.yaml         | 34 +++++++++++++++++++
 2 files changed, 34 insertions(+), 12 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/fpga/altera-pr-ip.txt
 create mode 100644 Documentation/devicetree/bindings/fpga/altr,a10-pr-ip.yaml

diff --git a/Documentation/devicetree/bindings/fpga/altera-pr-ip.txt b/Documentation/devicetree/bindings/fpga/altera-pr-ip.txt
deleted file mode 100644
index 52a294cf2730..000000000000
--- a/Documentation/devicetree/bindings/fpga/altera-pr-ip.txt
+++ /dev/null
@@ -1,12 +0,0 @@
-Altera Arria10 Partial Reconfiguration IP
-
-Required properties:
-- compatible : should contain "altr,a10-pr-ip"
-- reg        : base address and size for memory mapped io.
-
-Example:
-
-	fpga_mgr: fpga-mgr@ff20c000 {
-		compatible = "altr,a10-pr-ip";
-		reg = <0xff20c000 0x10>;
-	};
diff --git a/Documentation/devicetree/bindings/fpga/altr,a10-pr-ip.yaml b/Documentation/devicetree/bindings/fpga/altr,a10-pr-ip.yaml
new file mode 100644
index 000000000000..1f4df40308bd
--- /dev/null
+++ b/Documentation/devicetree/bindings/fpga/altr,a10-pr-ip.yaml
@@ -0,0 +1,34 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/fpga/altr,a10-pr-ip.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Altera Arria10 Partial Reconfiguration IP
+
+maintainers:
+  - Matthew Gerlach <matthew.gerlach@linux.intel.com>
+
+description:
+  The Altera Arria 10 Partial Reconfiguration IP core allows the host
+  processor to perform partial reconfiguration of the FPGA fabric.
+
+properties:
+  compatible:
+    const: altr,a10-pr-ip
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
+    fpga-mgr@ff20c000 {
+        compatible = "altr,a10-pr-ip";
+        reg = <0xff20c000 0x10>;
+    };
-- 
2.43.0

