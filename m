Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795427160;
	b=Pi8I1/aHLRHvIM2hfEnJz3kTsrfgD72Mz9+ndfKLPqQueHrbyHRMBfoQyZdXR4wocOHi
	 YjJZTYEiDHEUzIEmNiZaBDtU/cglsVNIDiC4ILkwoeLScbscqfBYPH1ExlNIfbs5GZyGx
	 f63UI7hnlN7M63rsgs52NhS8sGGQYCBJYTHkb+Z5w5soQv5lujW5PHMNfo9MrkMfn4cNn
	 zuUOKubtVZrqiUsEJ21auPTFp93syPBYGa22byFfamnLTwsi/QdVXpnDG/URUunPnT/RO
	 MhtbKCpTC3J5e8Y7p5T/axS4/lr8ntKniCmZ5MWq7g8yxJrq0U167pOE43uXZ1DKfHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795427160;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=Xkm6UF3DxKXiMUPAVwMM+NaecpYPtU9lggI2ZNjlCbg=;
	b=PZ3KEKY2z3k3ES2MY8EmtPHUWesdhL6KLdPo1DReFsb3XvfCsZeaI+7hYqDmdeipetxM
	 hEvUjPovppOymuh/AWziHnuCRypDLalKwzQpyMSIv47t9UxvN3s+yIKmdfV7obWSoUgQS
	 cPggyUnWF+NIW5M1VvuxK3C8V8LCubQE/DrpO2Owonbs2t9JCOTFCzXWsHAOoWV/Tfsv8
	 MT9zIx9uqCJhMZ+TV8CZZ4QT98sV5mv04NtZBWt+A33GZQKlrZzCvk2A+2fpGHsdwDb7l
	 TYI6LYDSD35CnXkWjxpqtbyS8PHYr+QVNWVw6CB5DGE+3Y7Mr5ywi0yhOlBy8yXOWlg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=ky6cLrPg;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 883A1606A31E
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 09:45:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 883A1606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=ky6cLrPg
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id E1F7B1A17A6;
	Mon, 23 Nov 2026 09:45:57 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B60785FAEB;
	Mon, 23 Nov 2026 09:45:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C4BAF11E68A4E;
	Mon, 23 Nov 2026 10:45:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795427156; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=Xkm6UF3DxKXiMUPAVwMM+NaecpYPtU9lggI2ZNjlCbg=;
	b=ky6cLrPg0Ip0dOcxP9mTO4exCTxhgMf9n0TAft8MERhSJ6AdtziRXix0XS8zuyMrBXLk1E
	ztn6S7AFriNgEQ6mcSB8+Ko9naTdVH80N3jjqKxsC+H1v4idTAYnMmRilXgWGcOJlFniay
	l0ouiaS9NdTMfWc+z0AFIUlOv2JHCHUSOI0ERtZmN1vGsL80ooHmonkJVERXhk1Mpqu68r
	voo4bHDEzA9qjrUrrjX+Cs/shTiz6OcwjxMO6iGWQ7ZxEecuF64hhVk1uaHEmEr5+dSIdo
	tgxZK9LJb9RHh6sFz16lCgA81wZ6JsExR7bbq9yGNkj1Vmy/x8rZrHsrJkHjgw==
From: Paul Cercueil <paul.cercueil@bootlin.com>
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Sunil Kovvuri Goutham <sgoutham@marvell.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	George Cherian <gcherian@marvell.com>,
	Sujeet Baranwal <sbaranwal@marvell.com>,
	Paul Cercueil <paul.cercueil@bootlin.com>
Subject: [PATCH v3 1/2] dt-bindings: mailbox: add Marvell MHU
Date: Mon, 23 Nov 2026 10:45:41 +0100
Message-ID: <20261123094542.44101-2-paul.cercueil@bootlin.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261123094542.44101-1-paul.cercueil@bootlin.com>
References: <20261123094542.44101-1-paul.cercueil@bootlin.com>
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
X-Last-TLS-Session-Version: TLSv1.3

From: George Cherian <gcherian@marvell.com>

Marvell Message Handling Unit is a mailbox controller present in
Marvell OcteonTx and OcteonTX2 SoC family.

Signed-off-by: George Cherian <gcherian@marvell.com>
Co-developed-by: Sujeet Baranwal <sbaranwal@marvell.com>
Signed-off-by: Sujeet Baranwal <sbaranwal@marvell.com>
Signed-off-by: Paul Cercueil <paul.cercueil@bootlin.com>
---

v3: No change

v2:
 - Fix binding path in MAINTAINERS file
 - Move MAINTAINERS entry so that it's in alphabetical order
 - Fix formatting of DT example
---
 .../bindings/mailbox/marvell,mhu.yaml         | 61 +++++++++++++++++++
 MAINTAINERS                                   |  6 ++
 2 files changed, 67 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mailbox/marvell,mhu.yaml

diff --git a/Documentation/devicetree/bindings/mailbox/marvell,mhu.yaml b/Documentation/devicetree/bindings/mailbox/marvell,mhu.yaml
new file mode 100644
index 000000000000..5cf20d5642ac
--- /dev/null
+++ b/Documentation/devicetree/bindings/mailbox/marvell,mhu.yaml
@@ -0,0 +1,61 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mailbox/marvell,mhu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Marvell Message Handling Unit
+
+maintainers:
+  - Sujeet Baranwal <sbaranwal@marvell.com>
+  - George Cherian <gcherian@marvell.com>
+
+description:
+  The Control-Processors Cluster (CPC) provides Arm-platform specification
+  entities for managing the system. One of the CPC processors is the System
+  Control Processor (SCP). The SCP is responsible, among others, for booting
+  the chip, clock and power initialization, controlling power consumption
+  through DVFS, monitoring temperature sensors and controlling AVS. The SCP,
+  as each XCP, contains mailboxes for software-to-software communications.
+  Mailbox writes cause an interrupt to the local XCP core or to the AP.
+  This driver exposes AP-SCP Message Handling Unit to the system, providing
+  the mailbox communication mechanism to the system, with the intention
+  of plugging into the SCMI framework. It is designed to work with Marvell
+  OcteonTX and OcteonTX2-based platforms.
+  The mailbox has no other usage than SCMI communication. In case of
+  configurations running without SCMI support it should be disabled.
+
+properties:
+  compatible:
+    enum:
+      - marvell,octeontx-mhu
+      - marvell,octeontx2-mhu
+      - marvell,cn10-mhu
+
+  reg:
+    maxItems: 1
+
+  "#mbox-cells":
+    description: Index of the channel
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - "#mbox-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    ecam {
+        #address-cells = <3>;
+        #size-cells = <2>;
+
+        mailbox@1c,0 {
+            compatible = "marvell,octeontx2-mhu";
+            reg = <0xe000 0x0 0x0 0 0>;
+            #mbox-cells = <1>;
+        };
+    };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 65e8a4b5c90b..8f6f98acc8fc 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15825,6 +15825,12 @@ L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
 F:	arch/arm64/boot/dts/marvell/armada-8040-mcbin.dts
 
+MARVELL MHU MAILBOX DRIVER
+M:	Sujeet Baranwal <sbaranwal@marvell.com>
+M:	George Cherian <gcherian@marvell.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/mailbox/marvell,mhu.yaml
+
 MARVELL MV643XX ETHERNET DRIVER
 M:	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
 L:	netdev@vger.kernel.org
-- 
2.47.3

