Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74AD13B0AE7;
	Thu, 13 Aug 2026 14:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786632907; cv=none; b=JLV3z1aWeBVAIJQ+Bg4qWYxBuM06pI7Ym3nw8HnzdETrczrZaJyu3bnqcuvvvcpdh/W9NmjebjxZ1yZ+hYnWfcftTXnqLYbQ4xQZgICHB7W1ixKglMXDMIGbxwXdFYwOyg5TXYaG/8ozUId8gisyQ0G5/FdSyCKuDXEf3Cu87C4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786632907; c=relaxed/simple;
	bh=7dJmcR699amGRM0H09D14BdIBmxZdYtCov13Uu8hBP0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kgmPpOIttero8xphmYR2coq9vT1Sd08mHc2KiLNxsgmqll69qefZi11/2yxkH8an2ZUO38GW6F0AdQitbn2+FrqgNzo5DGuHuNUtTjS1LPgaiuUB2oRzNrufnrqXRIN9vsi5fzD+vyhdvlezG3xeKwu1YheM8+rI/esicy1CIMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MZ5YJZbz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MZ5YJZbz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAD5D1F000E9;
	Thu, 13 Aug 2026 14:55:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786632905;
	bh=0A8IrhKHQG1tU+EN1faW5fs6vYQdqMgGnDDkxdw1eHA=;
	h=From:To:Cc:Subject:Date;
	b=MZ5YJZbzE2Jq7P3zV7P62kqMiI8EW2gtCwP0czuZOXeq+16wUtBV9yFfPc6u7iF7f
	 jkqZXWYnVanvnszPF1WYuE6/P1h2OcNK/KcQceaQORGInh2R2z90B3Ms48xfQGhIH6
	 L+fdMOSj9VqYf3QbuyxeDAqgfHLq2UwLISg0Qtc5lYCbPALt7dTNlRgZ58xCNka6NZ
	 ZPUJt6189Hc6ygxpLFgyAedck0YQerMrKuKv+O0xtRwCETOV419DmHhDSnsrxF1b6N
	 V7pnQ69RvsLfqYSHFzaXOuLh6W2rfaLMi1BdaKFvR35RMUEXpo6cxew2g9I8T7Cp4V
	 me+IYa/bC+UAQ==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Thomas Gleixner <tglx@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] dt-bindings: interrupt-controller: mediatek,mt6577-sysirq: Drop invalid JSON pointer
Date: Thu, 13 Aug 2026 09:53:59 -0500
Message-ID: <20260813145453.1919998-1-robh@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The $ref "arm,gic.yaml#/properties/#interrupt-cells" doesn't work when
used with another json-schema implementation (rust). The issue is it not
a valid URI due to the 2nd "#" character in the JSON pointer. Though a
"#" is supposed to be valid within a JSON pointer. A possible solution
is to encode the "#" as "%23" instead, but the dtschema tools don't
handle that.

Just avoid all these issues as the $ref only resolves to a "const: 3"
schema and specify it directly.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/interrupt-controller/mediatek,mt6577-sysirq.yaml  | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/mediatek,mt6577-sysirq.yaml b/Documentation/devicetree/bindings/interrupt-controller/mediatek,mt6577-sysirq.yaml
index 30d76692ca87..b94fc3cec175 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/mediatek,mt6577-sysirq.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/mediatek,mt6577-sysirq.yaml
@@ -49,7 +49,8 @@ properties:
   interrupt-controller: true
 
   "#interrupt-cells":
-    $ref: arm,gic.yaml#/properties/#interrupt-cells
+    const: 3
+    description: The cells have the same encoding as defined in arm,gic.yaml.
 
 required:
   - reg
-- 
2.53.0

