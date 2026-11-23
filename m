Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795459481;
	b=id7zz886gJ4fZhLHyP9MamiklGhs5JvKk/auLHHxIkQ32pw9ikT5B3T8FWsuZgCtSpmC
	 kzKL9vnoDeYcciQ0LJFh09fR3cfTDI3kcM4vaFyWkjvqwj2FeGW/V0uzGbJT9ewhDTcRF
	 OkGEQNTgTUmjGudP7B7xwb+l6jagZpRQjZN69mWX64IeeEaYrsGHrOERAX3zDPoYHFToM
	 HSseYuxMF9oj3wFkjMDXxujqgI+vtc9m4tpB/he8pCnMGHq39JjTyQetC/KHJjNyPFuYV
	 bxOljFB0rvzrdOov4pngnXg7beiNpf3DOqwSce/owuwC5gTVxtNtNyB1lAF+/Oe5/FA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795459481;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=MjeKjHN4rePYNfzb7vgeU2LsVigAmUGjCvKXHqpWDDE=;
	b=kw1pJU0HlnujY2Pj7odj2c6U99kXAWESTg5ULLy96uoOhWBKvjMipImFCFJu8gOpRRIQ
	 dvNvZLwjtkFjZHej/y2mNjT5fQ/LEQ9wfVdibvtmdjhsnFAf4PkW5mt+b+CX6JbqidCFl
	 E823H4F92wlvHgbfzI7Dvgw8bG9/TBOOJyEkTFq44YJZw+lqez/Pn4jklJXMcFyMvrVzH
	 gl3XpcgEQ+YvOUy5BoiAr8wSc1TXEh0iJxr2srGIc9L5/Nt4nIU2+gMPnrsmkf3GAA9Yu
	 3o2t8nlCIWHxGH5as085cpu4158RBB3tPZaBXce3eW4IOLZnKPspD8pTEgiC+E6PMMQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KpviSj7e;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE3D8606A6A0;
	Mon, 23 Nov 2026 18:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KpviSj7e
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795459480;
	b=In7JgtJjfpkXYGo1AYR1lwjrmgAdNZHMCKwi0kC6T08lQZnNaT7mbMwWYvXqwV8WBNmd
	 3ruTJHTu2b0ZxxUWzFY/8OIaQvWi5pycIcvDNsIcv9P/ghSA6L7ybJyGH1zcqkecBqUEJ
	 c4OB9gymrz1fOh5I/0ailmVYiFmb/b7R5e3hQFGHDKVkuBcFVs77ktQZKRizPq7zBHkfU
	 WqM6yO3rD4vDx7bJo8ZHlLf4bX9+VsiEnB44lSRQPUWta9ELa4/rX77oyhabawd6SaWsu
	 BhrBFNSmkF/KQ9dCHPS2bfLgxPY1wuktV0kqP+xbkSmNs4yk/SzmeeVtSPvHE0FCGrQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795459480;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=MjeKjHN4rePYNfzb7vgeU2LsVigAmUGjCvKXHqpWDDE=;
	b=qOBzvcJvAfZf6mqWiviT/4tMnGhpEqreY2RXosJD8gdHSAV+dO7zVfsZWLvxJO60Pe6q
	 zqobO2lAHmHVkrtTn1g/UMryOlEIC14GkBnRteQ5MkooCEIoxJXlJQ9A3r019iNMoknzT
	 JtnUoTGTEr4W/vBt7TCTjdJHg7xnwkzPQa2rBVEIZl8yBchuyYiREm4c2lJ6/JCohM5vt
	 fwS7BejHjakMEqtt4yUX2ZNYtOnUpDSGaS1FCOzPoA+oV89TXiAQZTigYF3NqmqcXKSmT
	 RTwLp7pT7cAAagCOV4wmswAKdUv78S/lrsphf9T5NKoRt5cIdLF5JnhevFOuVuhxBTQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id EF0B41F000EC;
	Mon, 23 Nov 2026 18:44:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795459480;
	bh=MjeKjHN4rePYNfzb7vgeU2LsVigAmUGjCvKXHqpWDDE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=KpviSj7e8Vq16WefT0FDzgq5IUNuprQBlyKY3+F1aZ6JM2+iot16TZhIgSyTdgdN0
	 vMI5+56j09nKrPd+D4R3CAlTsHoZE6nLevsNYDIeLGYA6YqePItBXTsy7ciuS1OP1N
	 5SP/vsLpDQdel+UqmnigtMiY0gB/dJFhsfRgmQri5hXJmVc0HJ1GaPVl6HXhlpproi
	 SY8MEl4HVVs5HDvAsFydA3XSb0zujGh5XKwZoZGHNSW2V+dCAuqNI0+xOK6vZL5czX
	 MhBXL8tzj95TLk7RttVK+I5Mq6V8sxe0/X8VBKO8J3g3vt7kdvkWRophCGuEXAlSt3
	 i5MmfMJMiEzXg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 3B1174C607;
	Mon, 23 Nov 2026 18:44:13 +0000 (UTC)
From: Fil Dunsky via B4 Relay <devnull+filipp.dunsky.gmail.com@kernel.org>
Date: Mon, 23 Nov 2026 21:44:10 +0300
Subject: [PATCH net-next 1/5] dt-bindings: reset: Add Cortina CS7542
 network engine reset domain
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
Message-Id: <20261123-b4-cs7542-ethernet-v1-1-fdb5e8c2d508@gmail.com>
References: <20261123-b4-cs7542-ethernet-v1-0-fdb5e8c2d508@gmail.com>
In-Reply-To: <20261123-b4-cs7542-ethernet-v1-0-fdb5e8c2d508@gmail.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Hans Ulli Kroll <ulli.kroll@googlemail.com>, 
 Linus Walleij <linusw@kernel.org>, Russell King <linux@armlinux.org.uk>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795459449; l=2664;
 i=filipp.dunsky@gmail.com; s=20260930; h=from:subject:message-id;
 bh=afQd1qV0B7xeIKmVAhfGJ0iLxscNrcmWGV+PpdebZtc=;
 b=tfTFkWIjfmcOGW0TyJsPhNwJ/7RsQQNGNr1PBzxNsUCebQE2Wyz4+JuGq072EW0dq4+4Z4BE8
 jSsGPN+vfVaCj+ze3S+IwQ9+oRNjzxQrLPDPyOBex52cVlc4QS+qzJK
X-Developer-Key: i=filipp.dunsky@gmail.com; a=ed25519;
 pk=JAYP8e2rJ54DHOmhNtXud8rl1igAaAXoOHxtJmVXI1g=
X-Endpoint-Received: by B4 Relay for filipp.dunsky@gmail.com/20260930 with
 auth_id=1085
X-Original-From: Fil Dunsky <filipp.dunsky@gmail.com>
Reply-To: filipp.dunsky@gmail.com
Content-Transfer-Encoding: 7bit

From: Fil Dunsky <filipp.dunsky@gmail.com>

Describe the atomic reset domain required to stop all network-engine and
LSO/SSP DMA users before releasing their mappings. Exclude the SDRAM
controller and independent PCIe resets. Allow this provider as a child
of the shared global syscon.

Signed-off-by: Fil Dunsky <filipp.dunsky@gmail.com>
---
 .../bindings/reset/cortina,cs7542-ne-reset.yaml    | 42 ++++++++++++++++++++++
 .../soc/cortina/cortina,cs7542-syscon.yaml         |  4 +++
 2 files changed, 46 insertions(+)

diff --git a/Documentation/devicetree/bindings/reset/cortina,cs7542-ne-reset.yaml b/Documentation/devicetree/bindings/reset/cortina,cs7542-ne-reset.yaml
new file mode 100644
index 000000000..8f5b5b835
--- /dev/null
+++ b/Documentation/devicetree/bindings/reset/cortina,cs7542-ne-reset.yaml
@@ -0,0 +1,42 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/reset/cortina,cs7542-ne-reset.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Cortina Systems CS7542 network engine reset domain
+
+maintainers:
+  - Fil Dunsky <filipp.dunsky@gmail.com>
+
+description: |
+  Child of the CS7542 global syscon. One reset domain covers NI, FE, TM,
+  scheduler, queue manager, NI XRAM and the entire DMA block (LSO and SSP).
+  SDRAM and unrelated peripheral reset bits are not modified. The consumer
+  must own all these blocks exclusively. This reset is not suitable for a
+  network-only consumer while a separate driver uses SSP DMA.
+
+properties:
+  compatible:
+    const: cortina,cs7542-ne-reset
+
+  "#reset-cells":
+    const: 0
+
+required:
+  - compatible
+  - "#reset-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    syscon@f0000000 {
+        compatible = "cortina,cs7542-syscon", "syscon", "simple-mfd";
+        reg = <0xf0000000 0x100>;
+        #clock-cells = <1>;
+        reset-controller {
+            compatible = "cortina,cs7542-ne-reset";
+            #reset-cells = <0>;
+        };
+    };
diff --git a/Documentation/devicetree/bindings/soc/cortina/cortina,cs7542-syscon.yaml b/Documentation/devicetree/bindings/soc/cortina/cortina,cs7542-syscon.yaml
index fb074de87..5aca670cd 100644
--- a/Documentation/devicetree/bindings/soc/cortina/cortina,cs7542-syscon.yaml
+++ b/Documentation/devicetree/bindings/soc/cortina/cortina,cs7542-syscon.yaml
@@ -33,6 +33,10 @@ properties:
     type: object
     $ref: /schemas/pinctrl/cortina,cs7542-pinctrl.yaml#
 
+  reset-controller:
+    type: object
+    $ref: /schemas/reset/cortina,cs7542-ne-reset.yaml#
+
 required:
   - compatible
   - reg

-- 
2.53.0


