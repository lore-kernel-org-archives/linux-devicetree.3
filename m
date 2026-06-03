Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B65A3A6405
	for <devicetree@vger.kernel.org>; Wed,  3 Jun 2026 07:43:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780472594; cv=none; b=W+FXMm1tvhreCGilKVI7JR+tUor9Nt7MAEcqoRD7nNfRbur3Ucd+7HcVFhynqxndQfYmwqBEKoJNjISGKbw3jLPS+Xv2A5Qs+41g1ckkN4jRronNxmvypCetU0CWjJ3Ja4LbhVA5NCEkh5k3CB0nBTauRpO7Sz2uxY8MgBoosI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780472594; c=relaxed/simple;
	bh=Ya0MT4zAtkNNmztCtW9OTdr9DhWl4/8kLAfYiu0ziH4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l9fHAnRqKhuO9rFwzkOSdgXiM3IXI7QpG/i/+hR2xtfzkciz0GIYQAU2aE5bh3cnY+vUGRfFrH7Ranc1PpCG1CmrpGOyNYgSQUtI5/xryOUk/JtnlAMWvN6TzdO/VMllz4hj2JTvmkKxEJg1S7tDNRj0OpnfJTxE/6KquNl2Arc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J9sJkpKU; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J9sJkpKU"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8423610ec93so2843507b3a.2
        for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 00:43:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780472593; x=1781077393; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YEUznx6q1xgPyacCOOmKA9VXsKVblZvEIF1KohfNbRU=;
        b=J9sJkpKUOWOLIamX6aLy2hfe98uoYSTEAZdzvueonU/USNyoWHGMR+QphS+ukAzxGT
         N8gNxI/gClPy5ha6rAqsnBVDcmZhdxTR5vUaPK32dUZfJBhj/uYcWUnt8+2TVMt4sOjP
         fRQm0ruu/RtiSUgTG8XzVlTvnllD+UyFqGXxYQE/dKSgEsidsxNVSQIpjflYEgxgirg9
         wQ8oZOfUWdZrv2X4fB7Lp3BmPQPLe4fo6kOl4T71MyH/FNcrNC0l5R9E9ETwmiavzy2t
         PxySjnjziMo9+GHTrFPf8K6VV47j6iiARqa4mT3IrLSXRkxGCk95WzaTiq9Iihy9ktHq
         KmCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780472593; x=1781077393;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YEUznx6q1xgPyacCOOmKA9VXsKVblZvEIF1KohfNbRU=;
        b=RLxabDqpmp0hhujyTm0jswxNc/xvpY03/6i6+W0CVS6OgWMlGNsUlllLd9U9szL9Zz
         beV90mPMLLg/7Osb9oSTwe999TzsYVoc/lvVaHsVqXmQiSqR5TXquy0t2/SdjMFLjY+S
         eylPCHi26O+t95OHCstE/fqJg/UHxBmUn8p9Q5VxXxs3khjUnIX1mN6fRw9ghj4iBEN7
         D8dJv5b7A/CUeLt+nQXjxVVj/wPh9cjVe/0H6dBdulHKN5ci45f4nnpyq+26DMx1ewoM
         YgKGxb+EZQsIJ2XVkdzRSbNgg1Qn+Zejr2kbwHtYAc8P4g97Pu7Z/XgjuWb2eWuCPd5r
         dbyg==
X-Forwarded-Encrypted: i=1; AFNElJ+EvNp2xPdBt1YIdT9jg+5vtTdyFNgtVrxeGW+pLcJTptRg2ZKrhWWj07/9OqILXkE9rupnK72zVc9Q@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3RbOLY6Ee4Szi1YDW2okXsgMTmGl7phbOOrOzMkcsTIt69OQo
	UwMCfQ79RZ4GjjSIBAlkelyxk/q/5o0yoUNlam50b3wYLZpLk32y16TB
X-Gm-Gg: Acq92OEt4jjoV+RkmbVW1zl7BX0/tn88GI0wABM9mXawYkTgNTy361pAsqgHCYT4UN9
	JeUuN9Q381jGk19+PnXKBubLDg0xOEq77RlxG2Q9yeNyLQYbH6u4VJ1qPBCoeeFIE9BtAfPGjKB
	khK+2TOhzQJBQ6i9ydEifSpSWvTcja4+F6YvHwY3wS/GaMMcWAieVvzp+KjicGmLDjRd1hm612H
	SI/+5CKoPb64UEkBbTfdrZijZ+jimj0Zx+bLX5hyfNdFcId34fJ54hTSZgq0rEFefiACsYR1ZRd
	pQrf3Ha8acxpJqjU6P2SaP1qYBd40AQAJAgPSktm2RegANnMu2B0YTt8OUVTIyZw/9IJ8QS4zzG
	bb3LthMDZOqrGPJtfhuxvZmaoo1fBrluYak1J6ctYueb8hwH0lDdLmgXty0PNy+xvViL4690ITb
	D7fBnruuVqBbGCU0lCSo9e5sL3LW+ntbe3Us0NnrwIKVTivr5LQAIDGfE+GH0J3+Ggb1xMLWU1X
	dpurJevP0G+kAUb6Ogl7QCeLaF0xXt+Ci+NIwrNIP8haEupvBAMCR46AFzfhLUp
X-Received: by 2002:a05:6a00:2350:b0:842:6099:c55c with SMTP id d2e1a72fcca58-84284dcf4cemr2355605b3a.3.1780472592719;
        Wed, 03 Jun 2026 00:43:12 -0700 (PDT)
Received: from donnager-debian.. ([45.124.203.15])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842828daf76sm2161223b3a.42.2026.06.03.00.43.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 00:43:12 -0700 (PDT)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
From: Joel Stanley <joel@jms.id.au>
To: Paul Walmsley <pjw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>
Cc: Anup Patel <anup@brainfault.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Nicholas Piggin <npiggin@gmail.com>,
	Michael Ellerman <mpe@kernel.org>,
	Drew Fustini <fustini@kernel.org>,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH 4/7] dt-bindings: timer: Add RISC-V ACLINT bindings
Date: Wed,  3 Jun 2026 17:12:16 +0930
Message-ID: <20260603074222.593243-5-joel@jms.id.au>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260603074222.593243-1-joel@jms.id.au>
References: <20260603074222.593243-1-joel@jms.id.au>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the bindings for the RISC-V ACLINT.

Signed-off-by: Drew Fustini <fustini@kernel.org>
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 MAINTAINERS                                   |  1 +
 .../bindings/timer/riscv,aclint-mtimer.yaml   | 52 +++++++++++++++++++
 2 files changed, 53 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/timer/riscv,aclint-mtimer.yaml

diff --git a/MAINTAINERS b/MAINTAINERS
index 2fb1c75afd16..43dd9873bbc5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23005,6 +23005,7 @@ M:	Joel Stanley <jms@oss.tenstorrent.com>
 L:	linux-riscv@lists.infradead.org
 S:	Maintained
 T:	git https://github.com/tenstorrent/linux.git
+F:	Documentation/devicetree/bindings/timer/riscv,aclint-mtimer.yaml
 F:	Documentation/devicetree/bindings/clock/tenstorrent,atlantis-prcm-rcpu.yaml
 F:	Documentation/devicetree/bindings/riscv/tenstorrent.yaml
 F:	arch/riscv/boot/dts/tenstorrent/
diff --git a/Documentation/devicetree/bindings/timer/riscv,aclint-mtimer.yaml b/Documentation/devicetree/bindings/timer/riscv,aclint-mtimer.yaml
new file mode 100644
index 000000000000..192ff3fcf79f
--- /dev/null
+++ b/Documentation/devicetree/bindings/timer/riscv,aclint-mtimer.yaml
@@ -0,0 +1,52 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/timer/riscv,aclint-mtimer.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: RISC-V Advanced Core Local Interruptor (ACLINT)
+
+maintainers:
+  - Joel Stanley <jms@oss.tenstorrent.com>
+
+description:
+  This RISC-V ACLINT specification defines a set of memory mapped devices which
+  provide inter-processor interrupts (IPI) and timer functionalities for each
+  HART on a multi-HART RISC-V platform. The specification can be found at
+  https://github.com/riscvarchive/riscv-aclint/
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - tenstorrent,atlantis-aclint
+          - qemu,aclint-mtimer
+      - const: riscv,aclint-mtimer
+
+  reg:
+    minItems: 1
+    maxItems: 4095
+
+  interrupts-extended:
+    minItems: 1
+    maxItems: 4095
+
+required:
+  - compatible
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    // Example 1
+
+    timer@ac000000 {
+      compatible = "tenstorrent,atlantis-aclint", "riscv,aclint-mtimer";
+      interrupts-extended = <&cpu1intc 7>,
+                            <&cpu2intc 7>,
+                            <&cpu3intc 7>,
+                            <&cpu4intc 7>;
+      reg = <0xac000000 0x00010000>;
+    };
+...
-- 
2.47.3

