Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57D1638757F;
	Tue, 21 Apr 2026 08:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776759520; cv=none; b=nXYwmr8pPrTznoDpBMtXoJFC8zlBvg5gVbXMp7qdXI0Ez7Jw8j8YqfA7Wa4hh/KhOW9fi1NhsFUaUJBiNbdO7o6gcKe+kRf4YeI5v7IcGJ2aPqxK0i7xowezEM1LLZ06n9fxjBqxCKjUxDB4ArLZ4UWmz8r3aebboKXmM5jKkmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776759520; c=relaxed/simple;
	bh=7pJbh/uj8XfFDrgStpBaGjvS/bBJlfmlOagSr2mFtPQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WpzJcKkWNCmDReDQY2qrwzL7bEfb8lnqd7d9jeaLKjflRHgqzTpGsPMYYJQ5RDxoTWNvsBUAijXSVB80GrPFKz6mwb6MHX6QYRy+g2ULMf7klQopj+8WTZFNZUavDcMPq31RpXSKZcerTCdu5SuxDKUMmIppZURfWRyllGuHRbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W2jD8vZh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W2jD8vZh"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 16AE9C2BCB5;
	Tue, 21 Apr 2026 08:18:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776759520;
	bh=7pJbh/uj8XfFDrgStpBaGjvS/bBJlfmlOagSr2mFtPQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=W2jD8vZh5T2oEI8hMBBE68lk/WCB9G5Zl9mehC+4mAvLF2ft3wRQjWSJlIAYOUEx6
	 eJUenzjwKBl+0uS+v9Lig4Z7JI2vNbiNi0GFbQE7x1qjE9gkjFbXpT1ox4xjSSUUkr
	 ZzFnxhKcMP4hiZRgfUrEE7hLv/GtiTJxELZJaJGjWQdTXAse4il/Zek629zQJ5p5Wr
	 k0V40LPXjRxBfWSMGtdtdm0pP/0eSvuaHtRxVMaoEDpkDPCWbSuqi4GrE833xPl3cy
	 xwU8UIR4V6H2unJ/iYcu0b5RtbQ+LiiKKrg8txA+uSqcxUoGXd1r7FzjnLIfpJYt85
	 ByKRcxYtFcUgA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07D3BF327BD;
	Tue, 21 Apr 2026 08:18:40 +0000 (UTC)
From: Jian Hu via B4 Relay <devnull+jian.hu.amlogic.com@kernel.org>
Date: Tue, 21 Apr 2026 16:17:41 +0800
Subject: [PATCH v3 1/4] dt-bindings: soc: amlogic: clk-measure: Add A1 and
 T7 compatible
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260421-clkmsr_a1_t7-v3-1-efc00b0f9e6b@amlogic.com>
References: <20260421-clkmsr_a1_t7-v3-0-efc00b0f9e6b@amlogic.com>
In-Reply-To: <20260421-clkmsr_a1_t7-v3-0-efc00b0f9e6b@amlogic.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Jian Hu <jian.hu@amlogic.com>, Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776759517; l=925;
 i=jian.hu@amlogic.com; s=20260415; h=from:subject:message-id;
 bh=CgTT3MEiWBM2xyukC2as1xW5lCFjTJ74JkjsBhvGt3g=;
 b=feaATb50ETYIaEoFr1FWFcpa+a9f5SmprtuXNV8oZFl6Ut6k8o5at2vR/q0GwP7GGPOJcrzyD
 W5w//PdCZQYBdTUkMEGzPoBI2YD8xNshIcpKbmLmPlRbX7+2G+xWeH6
X-Developer-Key: i=jian.hu@amlogic.com; a=ed25519;
 pk=zHUE+rNtH9z+Sb8au1/elWknjFQmy5QDVkBoxleuOIA=
X-Endpoint-Received: by B4 Relay for jian.hu@amlogic.com/20260415 with
 auth_id=735
X-Original-From: Jian Hu <jian.hu@amlogic.com>
Reply-To: jian.hu@amlogic.com

From: Jian Hu <jian.hu@amlogic.com>

Add the Amlogic A1 and T7 compatible for the clk-measurer IP.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Jian Hu <jian.hu@amlogic.com>
---
 .../devicetree/bindings/soc/amlogic/amlogic,meson-gx-clk-measure.yaml   | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/amlogic/amlogic,meson-gx-clk-measure.yaml b/Documentation/devicetree/bindings/soc/amlogic/amlogic,meson-gx-clk-measure.yaml
index 39d4637c2d08..b1200e6940ac 100644
--- a/Documentation/devicetree/bindings/soc/amlogic/amlogic,meson-gx-clk-measure.yaml
+++ b/Documentation/devicetree/bindings/soc/amlogic/amlogic,meson-gx-clk-measure.yaml
@@ -24,6 +24,8 @@ properties:
       - amlogic,meson-sm1-clk-measure
       - amlogic,c3-clk-measure
       - amlogic,s4-clk-measure
+      - amlogic,a1-clk-measure
+      - amlogic,t7-clk-measure
 
   reg:
     maxItems: 1

-- 
2.47.1


