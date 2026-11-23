Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795445265;
	b=DJBnCxiWFWsS41BHf20g51IQMfpB1kf1LkjmI2VtmoFIBtTpsUuowfU4WZz0iIUyF/JY
	 V2h/jhOBbkDhFDAtmchRWYj/xuU8NIOJFprXPDmefS73DYPw92HIUE2mn1MCazAJKPud3
	 7Gy/UtBsGdG8wWwWmPiAKtOpZAOtzUHiqn//TK0ctnGYkijj6uN9SDLeK2XkdVZcLPcUg
	 0F7PR2hHj0NTOk0D+t0tjeY7dbu+SvPWsxY+NnJCAy/6+KNIDJczuZo2d9pE+0rtt9ywI
	 BPedq+X+mELtjtSbsx0qC3kLRgpoOZeECUuIjxYYrh2ZHBOdktdQlZDZb1spZOfDKJw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795445265;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=+u/LMR+68R3fgeGC3uXOoW103LA72nPToZD+CrKv7lY=;
	b=0ymX+ZXc4kOB48TRUahiopP32uiSytDZE3SSkyI8EcOdlobLTxk+p0Y9lUw2bvfk67ZJ
	 OYknCi+QzC9hmWVjQsmAW5aopjRacAd11ENjRIqgPb/zwpL5w/ZyPmDCXEl+1eEOho+6O
	 lAcano0AjkzvlNjO380MLy5+QrOhx0RmHycscSe7Bnby43K6em36xrHn9ucGAj06w227+
	 8E++XikjdmkKeDSwOYMapDwD5EUg6tkHGMqpFSREq9sPEc6BCI2E1H6W1crI8Q/+hBxe/
	 yCvB6GeHCbbZGiYxKqrlqfagOpIikzpyFxl347sWjoKNT+lKuQeBAxyEGR9vzVMYWCg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=m9r8ZEFK;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90E72606A688;
	Mon, 23 Nov 2026 14:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=m9r8ZEFK
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795445265;
	b=JXpjAw4YUeZ00n2mfyZJKhLBZKOqf7k5jp3aUQft0+lEghS7GIPJawwqUyJJTMaYkRDn
	 /qq0zVrW0DH8hZuX7W1PNyq7QQ8tABmPcsm2AlBPz+t+AYv1n5Nku3XwyJWKIwi2adNnl
	 rTc1r6SFyyljOgl/RpmQZ5ZdG/lSe7LGENcIWbSU83zoc0W73QCJo9Nsx9s5rxjLvpNJs
	 YHA/QYe/5s44cEvceHn6nKaqYPDSzD9GFiAXN4Kbfpd1P5xNMEY+8Tjnw4cqUg2WXYtBs
	 E6YolsEV/7lx48Y+cUWGiiBj5vhCs5J8HDnl0Lnmgd6cjCE6ZP8MpTdEv2NP/zX9nzg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795445265;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=+u/LMR+68R3fgeGC3uXOoW103LA72nPToZD+CrKv7lY=;
	b=jag2OwF7ilvZGfErpmsXcRi8VS0eHwkKGoMq/d8yFcEqoupN7H6Jd0NsqqrKV8+bhC/Q
	 3sYU0HGXK8RQV1qYPJAkc0jNB6iyH3Ine1iwh3aTMv/qGBdHCpsPc9swXt5w8jTLz35yC
	 OgFmsKL4UVDGyBhe/X4S2a31/bqS7jrzz3uduIj9PCYCnDAkjRFUuREGWuCPjiRGv/tQB
	 0lLqo7ygunk7+gqdrOVzU6+EfzvJNXPoEMheYJHvOMEpBcqdVmkmz5v5vN5nATydT0r2H
	 maGvSePR++LRh/lg6Hbx1keKPQcHQiW146p5M8Zkpho4EC8XGVdsV8jZVRTiefrmOzw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A6AA61F00A3C;
	Mon, 23 Nov 2026 14:47:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795445265;
	bh=+u/LMR+68R3fgeGC3uXOoW103LA72nPToZD+CrKv7lY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=m9r8ZEFKyT3Vi97uEWbui4P03j7YDApDKBJBmQdWWVerv0FLyp5ipbCDqHOXJyDog
	 fX+gbIL3VJjK5Cf4Ds8pnSqa7mwgIuozsmXbPyJ4GjaV3Gs/q+pY0M3VK/5yJQq0s8
	 VgmJc8fofJ3HZEN9gtbl4RbSc05aZGu0dqomFU+hlPJS9zlPODGIbCiZYe+fX/2q6g
	 3kLyKNsLP2eUUI4XPTn6t+sL3mTFIvltuGBVBs89HIaA4Ouxh3pLul49YO334s8Rog
	 MFoPwQ22V+20V/a3Kq8Cdw8kLgzbZ5nwDqdvmD1tPKjtHaCgoRTr73Cj7t7IBjnise
	 Pmn8vD4to164Q==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 36C864C4FF;
	Mon, 23 Nov 2026 14:47:24 +0000 (UTC)
From: Aleksa Paunovic via B4 Relay <devnull+aleksa.paunovic.htecgroup.com@kernel.org>
Date: Mon, 23 Nov 2026 15:46:57 +0100
Subject: [PATCH v4 2/8] dt-bindings: riscv: Add MIPS Boston board
 compatible
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261123-p8700-dts-v4-2-60bb7bf8a7a1@htecgroup.com>
References: <20261123-p8700-dts-v4-0-60bb7bf8a7a1@htecgroup.com>
In-Reply-To: <20261123-p8700-dts-v4-0-60bb7bf8a7a1@htecgroup.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, 
 Djordje Todorovic <djordje.todorovic@htecgroup.com>, 
 Anup Patel <anup@brainfault.org>, Thomas Gleixner <tglx@kernel.org>, 
 Radu Rendec <radu@rendec.net>, Inochi Amaoto <inochiama@outlook.com>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Conor Dooley <conor@kernel.org>, linux-riscv@lists.infradead.org, 
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@sifive.com>, Joel Stanley <joel@jms.id.au>, 
 Aleksa Paunovic <aleksa.paunovic@htecgroup.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795445243; l=1692;
 i=aleksa.paunovic@htecgroup.com; s=20250806; h=from:subject:message-id;
 bh=5xVOseiOua96OFvJrDMkH+ySfMmO2vu4mBB4SPO9IZo=;
 b=beu1kx1zKl18h0EM+fq8lWG1IBvVARKUqB5fnJ4/KvZ8Dd19XQZHg2hqyXGcTasrrRWlbRVLa
 6s9VCWcogCyCq5agIynAI/agtMmuDflGBqQ+CE6josvuVgypr6Wq61U
X-Developer-Key: i=aleksa.paunovic@htecgroup.com; a=ed25519;
 pk=Dn4KMnDdgyhlXJNspQQrlHJ04i7/irG29p2H27Avd+8=
X-Endpoint-Received: by B4 Relay for aleksa.paunovic@htecgroup.com/20250806
 with auth_id=476
X-Original-From: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
Reply-To: aleksa.paunovic@htecgroup.com
Content-Transfer-Encoding: 7bit

From: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>

Document the MIPS Boston board compatible with a P8700 bitfile.

Co-developed-by: Djordje Todorovic <djordje.todorovic@htecgroup.com>
Signed-off-by: Djordje Todorovic <djordje.todorovic@htecgroup.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
---
 Documentation/devicetree/bindings/riscv/mips.yaml | 33 +++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/mips.yaml b/Documentation/devicetree/bindings/riscv/mips.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..bb251a7b1bcc762876fb94f0b636415774024183
--- /dev/null
+++ b/Documentation/devicetree/bindings/riscv/mips.yaml
@@ -0,0 +1,33 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/riscv/mips.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MIPS SoC-based boards
+
+maintainers:
+  - Djordje Todorovic <djordje.todorovic@htecgroup.com>
+  - Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
+
+description:
+  MIPS SoC-based boards
+
+properties:
+  $nodename:
+    const: '/'
+  compatible:
+    oneOf:
+      - description: |
+          Boston FPGA development board with a MIPS P8700 bitfile
+
+          The Boston board carries a Xilinx XC7V2000T FPGA and fixed
+          peripherals: a Xilinx AXI PCIe root port, an Intel EG20T PCH,
+          a UART and an ASCII LCD.
+        items:
+          - const: mips,p8700-boston-rtl-5057225-202410011144
+          - const: mips,p8700-boston
+
+additionalProperties: true
+
+...

-- 
2.43.0


