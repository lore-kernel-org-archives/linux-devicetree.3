Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 835DC480DED
	for <devicetree@vger.kernel.org>; Thu,  4 Jun 2026 14:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780584073; cv=none; b=Lb51um/LciBGHjtOSJswvEZWlw+gFDhDGDzWjzvu1sHeydWgwCXtE2BzhbpTSuSO6s3KMmY52nUQ8TdSH+jwzNm5Z7/VU1RxEc3FyDWWlPB1PPuEglFtm9lYXenZSaaCY29GKkoeavghJJspXPcKbJBdLm6Ch8nmLyLAVcBFr08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780584073; c=relaxed/simple;
	bh=5R8hza8m5BTYcoOjNl7U5tyB8KpDSu4ie+7bd435/Yo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QcVQb3VVtlrgarg6gzf6rVmRmH7CyYxtRZQ3+00woJd0Rf+u4Ivuibi98Eru4ZU9HqkVhEee+vA41+B5L8LMi/TewihSQwVtq46Hm2LgoYIslNthmy4I54pceeOcYVt8pD+P/CCSIGdcPMtstaPWdbnn/5UrQXAPkRVjKxonq4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DU6xHYox; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DU6xHYox"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-8423efad617so435675b3a.0
        for <devicetree@vger.kernel.org>; Thu, 04 Jun 2026 07:41:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780584072; x=1781188872; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y17sO1CSyHWex3fTMtGBSYStxy9Oe09MAYCGKv492cY=;
        b=DU6xHYoxcDEwHicPo3kl0L0RLbQvWzQl+3O4VKEAtR1TB2nTU1fktDkgJfEqLYirHD
         ECqjRyGBgpfbM5jRWJUxprYLiinC6X8rmNzv0pEXH3XEc0D2VLkJC1lj6SjucJzgIaM3
         rjIhRQJm7coVRLSMOdRC/ZRc0hrW19F7w7m45GvSIPni6G8fKHFHxlhA30g1xOujdcYD
         ZJxIYl42qpaWfRJbnmoZZ/rGbEH+m8fimgzIctH6Ez/Ay6npVgTGySsFntvrrRbhHg6c
         Qml8iesfNgDBtHjLKoskuNhX/zhmeojE9x1H+XJZel7B10eSF9r+Sjmh0vai+BGgJT1c
         jTyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780584072; x=1781188872;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y17sO1CSyHWex3fTMtGBSYStxy9Oe09MAYCGKv492cY=;
        b=J/boEVvu+p9SK4SXTG9TEysmAuXFG0tBxFBgF/EuI7ROxsMlPkwZ/3z7Kejt/EWEvr
         vuIOwSW+1Za7mULebr2jWgttsbAgKifHHKv6iHG6764CPOF/HHl6GWaLgO4vscaSIbq3
         G8c10pj1w35RMOPCdeXC4C1gLf7w+I5rcnagWn7eK9xzs719/Mc0gnO2j/gr4fw6b1wP
         cvdpF6cP1fvdsonzod3eavMgJHqkOqXzts/oCSNobguBvAZTDJwhOoWhiLtUYyKOuYM5
         6Fx1nHG+eKZ0RRaIDFwUelunyCSbf/l0EE4EHxssuMign2z+DArTzt72TpVPQ2r0BXlT
         xd3g==
X-Forwarded-Encrypted: i=1; AFNElJ/1kZh0z2d/ntYmOiDe174hKYVYOwbdv77JC9vTeji8+l5oz3Rvx+GwdDY/bJUa4GjJ2Ca1K8Xjxpc6@vger.kernel.org
X-Gm-Message-State: AOJu0YwroE/433rDGZR7/YEJku4q42anZBxs/xyn0qtnuTkC9W3UkQKb
	YEE56Pb/oOQiHnU+4OL5QxB2ZDoM4JVI4+CReeMHwSCd+PFaV0PXET8i
X-Gm-Gg: Acq92OHpVYkQ6n0e66QIL9gFW/MRvilr33QEKeFqDu2vxOBJZto6UPxa/E9Ul1zPB6A
	irYsvY36jzPuKAeyVGfWMYJHuUBgU3byIOs6M3BZXZ9IXAvpfQvKl/WmAfQP6/gNpANhE2yQIze
	QCe/tH2meajtUClDZF8SF9cqMsRlckWm+dHDIp6mjJ+7vNjfQ0Ar3pkkaS19wTXeuuSPSjQZY8y
	k6r1/UKYYlagGU6HmkV1XoObahLMTQIYGp5pc+2e8vpYmC+aV4CcbY7b0ILEcU46UGrUvOLquvI
	Y0bwOUWo8srRCETisZf8waY/6U5eMdYkpHzLCA0s0c4T9WEelj66cZbRce7T1i2Kq1NUCMWoOno
	3peEigfsWs+ZmNTK8p0+pCgD5UcDmbWzdUCkQKUhwYGieNVfsJ93lGivwxsblPoYqHDNsa0C6rn
	Z72V4uq6dLIElav9a8L+omjMFUast5FioZFX1S3Q0HYnk7E5PBs/whDW11FE7KPqjtfKKPIILEm
	PXHX4sLTKHcyWWUYLK6BlFajI/G+ez3hQxDRoKM4YPsDLfGO1GZvBXO5Hf75HnB
X-Received: by 2002:a05:6a00:3288:b0:82c:ebae:3cb with SMTP id d2e1a72fcca58-84284f0d090mr7529208b3a.43.1780584071769;
        Thu, 04 Jun 2026 07:41:11 -0700 (PDT)
Received: from donnager-debian.. ([45.124.203.15])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84282372868sm7279753b3a.17.2026.06.04.07.41.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 07:41:11 -0700 (PDT)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
From: Joel Stanley <joel@jms.id.au>
To: Paul Walmsley <pjw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>
Cc: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
	Anup Patel <anup@brainfault.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Nicholas Piggin <npiggin@gmail.com>,
	Michael Ellerman <mpe@kernel.org>,
	Drew Fustini <fustini@kernel.org>,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 4/7] dt-bindings: timer: Add RISC-V ACLINT mtimer bindings
Date: Fri,  5 Jun 2026 00:09:50 +0930
Message-ID: <20260604143957.668047-5-joel@jms.id.au>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260604143957.668047-1-joel@jms.id.au>
References: <20260604143957.668047-1-joel@jms.id.au>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The mtimer hardware is described in The RISC-V Instruction Set Manual,
Volume II Privileged Architecture, 3.2.1. Machine Timer (mtime and
mtimecmp) Registers.

The ACLINT was a standalone spec that made it to v1.0-rc4, but was never
ratified. As explained by Anup:

> Only the timer defined by ACLINT specification is relevant but the
> RISC-V privileged specification already provides a high-level
> definition of mtime and mtimecmp MMIO registers (see section "Machine
> Timer (mtime and mtimecmp) Registers").
>
> Due to the above reasons, we dropped our plans to ratify ACLINT
> specification in-favor of AIA IMSIC and RISC-V Privileged
> specification.

Link: https://lists.riscv.org/g/tech-aia/topic/connections_between_aia_and/107177435
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
v2:
 - Use priv spec as reference
 - Add soc name to tenstorrent compatible
 - Fix reg property description
---
 MAINTAINERS                                   |  1 +
 .../bindings/timer/riscv,aclint-mtimer.yaml   | 56 +++++++++++++++++++
 2 files changed, 57 insertions(+)
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
index 000000000000..1d645570b191
--- /dev/null
+++ b/Documentation/devicetree/bindings/timer/riscv,aclint-mtimer.yaml
@@ -0,0 +1,56 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/timer/riscv,aclint-mtimer.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: RISC-V Advanced Core Local Interruptor (ACLINT) Machine-level Timer
+
+maintainers:
+  - Joel Stanley <jms@oss.tenstorrent.com>
+
+description:
+  The RISC-V machine-level timer exposes the memory-mapped mtime and per-hart
+  mtimecmp registers defined in The RISC-V Instruction Set Manual, Volume II
+  Privileged Architecture, 3.2.1. Machine Timer (mtime and mtimecmp) Registers.
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - tenstorrent,atlantis-aclint-mtimer
+          - qemu,aclint-mtimer
+      - const: riscv,aclint-mtimer
+
+  reg:
+    items:
+      - description: MTIMECMP registers, one per hart
+      - description: MTIME register
+
+  reg-names:
+    items:
+      - const: mtimecmp
+      - const: mtime
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
+    timer@ac000000 {
+      compatible = "tenstorrent,atlantis-aclint-mtimer", "riscv,aclint-mtimer";
+      reg = <0xac000000 0x8000>, <0xac008000 0x8000>;
+      reg-names = "mtimecmp", "mtime";
+      interrupts-extended = <&cpu1intc 7>,
+                            <&cpu2intc 7>,
+                            <&cpu3intc 7>,
+                            <&cpu4intc 7>;
+    };
+...
-- 
2.47.3

