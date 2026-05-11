Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FD513C65FA;
	Mon, 11 May 2026 10:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778494449; cv=none; b=DZSZoqZK5PylUk7L8wD8hmoiQJQ+fuDCL6mnLRgBLQxjLGaEWhlXV8f3H7lYkU8jttHxWZ+PI2rO3/1y7PEJHEg0choEuvUZ+CorlI5dz8JNZuqIuZhjzrXu80TmHx+ii0y9iEsBh1kiWnFz5QifQqCt+oEah37O+acksya8I28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778494449; c=relaxed/simple;
	bh=W4ksUwvjxfcN9eQn8pG2jiv9bkWQfyqT6AEYKNiCh1M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Rp4/PwlAT6hsPFOUSmz3lioqoRHfoixAhUmOOcdRwOywtg7jC27z9sT+pc2Jk88sjiUhVM22Pt9ZERJQ+LBiKRQh1n+Qvr+KRTniHkCQgS25jpO7/PQoaH1e3I3GpWOFxv8bES+paK897nrZd7UKH5dw5AoNZu1OcBLFsIzzB0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=hAoNcQ9s; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="hAoNcQ9s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1778494446;
	bh=W4ksUwvjxfcN9eQn8pG2jiv9bkWQfyqT6AEYKNiCh1M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hAoNcQ9ssOsFwRuzWPaTWSHjHdrJgsueDYQO0lJnOK9eN6SmlwC7JpQdgRMC3IZg9
	 qrcO96P7gxlWjXAzDmj3FMToIsFgEkSt62ZsFpB1OAekOF9OEjqFH2alAARXP8RusX
	 SH2ygyap06NEpZmOhl26yfG3Dwcr9DMn5bzVE9FPm3sPoH30He5zgpgrd3nrJ2vlPZ
	 TD9CHgrxD+fleFBcUBiQw6r7gZghUJQqhaq1yZ2lgtHYoG25iod0bama1C20nqeDUt
	 uTJgJdrO1NqT8jpk9uD6DRgYwpHElN64zN2hZdiWbJAaE3bK/4dldpC/WTGzgMZb22
	 1ieGi/PWmYAqw==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3827D17E13D3;
	Mon, 11 May 2026 12:14:06 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linux-mediatek@lists.infradead.org
Cc: lee@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com,
	wenst@chromium.org
Subject: [PATCH v12 3/5] dt-bindings: iio: adc: mt6359: Allow reg for SPMI PMICs AuxADC
Date: Mon, 11 May 2026 12:13:53 +0200
Message-ID: <20260511101355.122478-4-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260511101355.122478-1-angelogioacchino.delregno@collabora.com>
References: <20260511101355.122478-1-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When one or multiple Auxiliary ADC IPs are embedded in a SPMI PMIC
it is reachable at a specific address.

Allow specifying the `reg` property and make it a required one for
MediaTek MT6363/6373 PMICs as those communicate over SPMI and also
disallow it for the others (as it wouldn't be applicable).

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../iio/adc/mediatek,mt6359-auxadc.yaml         | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/Documentation/devicetree/bindings/iio/adc/mediatek,mt6359-auxadc.yaml b/Documentation/devicetree/bindings/iio/adc/mediatek,mt6359-auxadc.yaml
index 5d4ab701f51a..e685e5ee224a 100644
--- a/Documentation/devicetree/bindings/iio/adc/mediatek,mt6359-auxadc.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/mediatek,mt6359-auxadc.yaml
@@ -25,6 +25,9 @@ properties:
       - mediatek,mt6363-auxadc
       - mediatek,mt6373-auxadc
 
+  reg:
+    maxItems: 1
+
   "#io-channel-cells":
     const: 1
 
@@ -33,3 +36,17 @@ required:
   - "#io-channel-cells"
 
 additionalProperties: false
+
+if:
+  properties:
+    compatible:
+      contains:
+        enum:
+          - mediatek,mt6363-auxadc
+          - mediatek,mt6373-auxadc
+then:
+  required:
+    - reg
+else:
+  properties:
+    reg: false
-- 
2.53.0

