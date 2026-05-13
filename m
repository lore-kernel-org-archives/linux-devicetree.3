Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E59EB38AC9E;
	Wed, 13 May 2026 15:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778686161; cv=none; b=oB5a+/3AlM0yPEDrmiZziq+HtooD+9IaK8IjhuB06XxU4r6S+qCmBQOqc6D2zszoagJ6mp9Hk2up6/SX5TzgoC9PMEMNY9ZAA8pU9MyCLJCHZLmYeCa3qMdh7GbZOXaVfal+oMVjiSUTARapyN+Hk9MXD9eoLSNLrjJoBL7GUoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778686161; c=relaxed/simple;
	bh=vMA/TDrL6pX/37cIVwe+uCWPjNEkgQmBnrmcW+A7gxA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WLFZ66s9WuW0GWJaVhnRqaIiAJ1yL5CSzu5KxKb+fEq/VnLgRlQqQi09L6uKPrKu1vNEKJAsV7mpnG27AMz7wJPwc9YUgRBxwg4WWtFMd2HGfkoxA/zeeNT7Mn1alci3yKakrnITuh89NaAkyGQalsXi81tieU5qOkQUQmmlgFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dicXb/O8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dicXb/O8"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9F068C2BCB3;
	Wed, 13 May 2026 15:29:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778686160;
	bh=vMA/TDrL6pX/37cIVwe+uCWPjNEkgQmBnrmcW+A7gxA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=dicXb/O82yGGS6zbj93Z94FiKpquH7FFlicAUyor0WrW43LaPt3hk94BylNzxPFKC
	 vn8OwJz6UqjggKZkYTU9+0d2t3Php+Sr30aKjB2yo1HNZ/CUd70BNoWP+u2PnXKC90
	 5DLrWy3IjFHXCjj0yd5XwLO44L7nEep2xh5yzBn1HavC/7aC4NHD3FdGmILlrVsmqY
	 rPnGPbkDIKXeKF5cFf84s4MGzmyCyOQGLDbyKGkJyqB7PcI44EZSeIYmdYn0RP8tAC
	 yuy6IAlxQRCKBNav2YkN073IEgRBbkyBYuDZXaNM2zNGY4bDiGsF6ddnP7t409pGYZ
	 VPjFCLyhzLbrQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E892CD4851;
	Wed, 13 May 2026 15:29:20 +0000 (UTC)
From: Aleksa Paunovic via B4 Relay <devnull+aleksa.paunovic.htecgroup.com@kernel.org>
Date: Wed, 13 May 2026 17:29:08 +0200
Subject: [PATCH RESEND v7 1/3] dt-bindings: timer: mips,p8700-gcru
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-riscv-time-mmio-v7-1-f8925ffc226b@htecgroup.com>
References: <20260513-riscv-time-mmio-v7-0-f8925ffc226b@htecgroup.com>
In-Reply-To: <20260513-riscv-time-mmio-v7-0-f8925ffc226b@htecgroup.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778686158; l=1839;
 i=aleksa.paunovic@htecgroup.com; s=20250806; h=from:subject:message-id;
 bh=qlCmLDBO1Y2Dd5pfYZ/Ggi2QMtMAGxo3h0341eF3VPk=;
 b=0h3nHTrHH207Q3zMXZYKyjtVJwR0VYMcC2lUhhr8kGDm7/giTXj42PmD5fc4T09AxMkudb15L
 A1y0fCFJlCPDOeCSi7toDZXw1K2dIA/pK7B0ZdK44onyRLSFgNbHur2
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


