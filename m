Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4446A374A0A;
	Wed, 10 Jun 2026 08:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781079737; cv=none; b=RSdfpNGzaRHJxHri8GmJ+B4DBnoQW771DtGNWjd5aPvoSiHKgQY/1Qohxh9dCwJskXl4vuhFlaIp77aI/o2JnZyqSUbp64zcwjPtMiBPEoxupksxn9KObyDFORPyo9xJlK89kK+2Pe768qsMrbtedzOL/azey4T1EnRm5NvW15Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781079737; c=relaxed/simple;
	bh=vMA/TDrL6pX/37cIVwe+uCWPjNEkgQmBnrmcW+A7gxA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EpiwMz3M7VwKVswM46K7u6iCty+nn6ka8wv0/cO7rFsxFtSm+MzxCRuPVgWIiUkVFtkXFuO03uMNrinsKJ7mJCo5IxzPnTq/FxBChIm9zbkUk3oUb3RuYav0oINSiJ4f9OrMM10KPVYc0U9nvR+EzrYSIBw7IXy73D5LO5bkK6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CrHszgjj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CrHszgjj"
Received: by smtp.kernel.org (Postfix) with ESMTPS id E3F57C2BCB8;
	Wed, 10 Jun 2026 08:22:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1781079737;
	bh=vMA/TDrL6pX/37cIVwe+uCWPjNEkgQmBnrmcW+A7gxA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=CrHszgjjpR0TFZA8WAqzc4kIFSNXpAVQg7ey6eavBL7ls3rRsCWJrldnkNdbAlpuX
	 834r6mXhxEhXRTM3mYNx7VA2ZtvIXn7qekzFUhrOMGq+FGag5/5LJe+sHxI661i9FS
	 V9nuFmJ0xpbVLNZAvOtSTEnx2mp3ZnqfAUek4mpaqc1VjEg76vyct8OOe4ZX6fG+HX
	 DcC5voPkqhLYWyneAlikN1Z6/n6tMUQfcIdULj7J2V3n1i9+2PD8Ytbv1d7zIxU6SY
	 Sdyw6y2Cnf7U26MbBpCvsSuhbIRQyhxenpaXV0vFkaUj/ls6D3ybI0xZUS2mQERtfI
	 YIwX5HecKsEcg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB82ECD8CB9;
	Wed, 10 Jun 2026 08:22:16 +0000 (UTC)
From: Aleksa Paunovic via B4 Relay <devnull+aleksa.paunovic.htecgroup.com@kernel.org>
Date: Wed, 10 Jun 2026 10:22:13 +0200
Subject: [PATCH v8 1/3] dt-bindings: timer: mips,p8700-gcru
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260610-riscv-time-mmio-v8-1-a865206675c6@htecgroup.com>
References: <20260610-riscv-time-mmio-v8-0-a865206675c6@htecgroup.com>
In-Reply-To: <20260610-riscv-time-mmio-v8-0-a865206675c6@htecgroup.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Paul Walmsley <pjw@kernel.org>, 
 John Stultz <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>, 
 Vivian Wang <wangruikang@iscas.ac.cn>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, 
 Djordje Todorovic <djordje.todorovic@htecgroup.com>, 
 Aleksa Paunovic <aleksa.paunovic@htecgroup.com>, 
 Chao-ying Fu <cfu@mips.com>, Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781079735; l=1839;
 i=aleksa.paunovic@htecgroup.com; s=20250806; h=from:subject:message-id;
 bh=qlCmLDBO1Y2Dd5pfYZ/Ggi2QMtMAGxo3h0341eF3VPk=;
 b=OaAWvgTi5s6lRwqlpaZOA9PGdBjUjWweevujHSrREmyAkxHvWtniupncOQZTBjJ9xvZ9yQvXQ
 px6UC26oUVCAkR1X5S3PVorefAf04lMXeb6I819y8dC/sxQiw5sDR+X
X-Developer-Key: i=aleksa.paunovic@htecgroup.com; a=ed25519;
 pk=Dn4KMnDdgyhlXJNspQQrlHJ04i7/irG29p2H27Avd+8=
X-Endpoint-Received: by B4 Relay for aleksa.paunovic@htecgroup.com/20250806
 with auth_id=476
X-Original-From: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
Reply-To: aleksa.paunovic@htecgroup.com

From: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>

Add dt-bindings for the GCR.U memory mapped timer device for RISC-V
platforms. The GCR.U memory region contains shadow copies of the RISC-V
mtime register and the hrtime Global Configuration Register.

Signed-off-by: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../devicetree/bindings/timer/mips,p8700-gcru.yaml | 38 ++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/Documentation/devicetree/bindings/timer/mips,p8700-gcru.yaml b/Documentation/devicetree/bindings/timer/mips,p8700-gcru.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..3498255762cce6b3f491292d340d9639bb573e6d
--- /dev/null
+++ b/Documentation/devicetree/bindings/timer/mips,p8700-gcru.yaml
@@ -0,0 +1,38 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/timer/mips,p8700-gcru.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: GCR.U timer device for the MIPS P8700 platform
+
+maintainers:
+  - Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
+
+description:
+  The GCR.U memory region contains memory mapped shadow copies of
+  mtime and hrtime Global Configuration Registers,
+  which software can choose to make accessible from user mode.
+
+properties:
+  compatible:
+    const: mips,p8700-gcru
+
+  reg:
+    items:
+      - description: Read-only shadow copy of the RISC-V mtime register.
+      - description: Read-only shadow copy of the P8700 high resolution timer register.
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    timer@1617f000 {
+        compatible = "mips,p8700-gcru";
+        reg = <0x1617f050 0x8>,
+              <0x1617f090 0x8>;
+    };

-- 
2.43.0


