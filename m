Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49CA73E9F72
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 14:46:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774449996; cv=none; b=dayKXJPMZzZA1BmSL6JSLqvgO01bgtJ02ZwKNxfLSj6nOntZxCHmTHMUP/X6pfjIyVNmOjyrUnUqhdzerDhD/5Yl+Cuhwh8CSBoMPxc3HK9xs7dOmgK+4aMD6bR5RG701gI3WAXTWBaj4qtVLhphxvB8QCM+ooAlypUE2MzQxog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774449996; c=relaxed/simple;
	bh=V8d2l5KSrI/IBbjUOMQ1WmyhZ85uFel/9Iqrn9rmxU4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=H0BDuXRTxIVjYw1u0zfIpnrG7Wbalkr3uUA0rdnsmw538GsmJL41Hr3llWvbU/WX3GVJ+RBEwROnZbB7f8NSpDHcVpOh/KiCdsY/2w52OdbosH02aUC1oan7wyqLBVnlFT/m5W6t+k+K2oP6O97A/lgg918+rGmk46STpSBb6ns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VkLwFqze; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VkLwFqze"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-439fe4985efso4491097f8f.3
        for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 07:46:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774449992; x=1775054792; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BQww7rYHgSiW8MzkVP4frc74sj8xqXnVytlTkph1S4Y=;
        b=VkLwFqzes5cI2VgToRwlWzTEX8Sq0CWGDVNpQzAH7dc6nl2lqDDfGmbsdL2SB3xM5G
         Q08pYyi+28OVuTZ/JP4D+r0Bkep762rfygYUWBXFux/Kgy62l0aLMdddKcQWWbPxold6
         TFb14wAnt8uQAapM5RIYeCIw88efxpEYqSrzc5qU/Gn+GtJgSvO3oEpTonp66d9Qn+If
         v7vT2T8tW55m2c3zM4TZUwmUOAqiK1K5yZTTJJPmacJzp0vqmArMddFLQiFP0cqcQ0G+
         9nV0PVqYs5ZqcfCiLxKmnUJ6gst/5OS1uI8shfQJCviz3PUfDZ6qkgcxL5ErXngozkaY
         Nhcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774449992; x=1775054792;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BQww7rYHgSiW8MzkVP4frc74sj8xqXnVytlTkph1S4Y=;
        b=OdadJsLlm4Os0XXH9Xn/DdNkwVrM35cedIccaoZiAB7pbP8c8zFIOPH3v8KqSWmsRs
         hj86GC2kfwy9l6gNthXVFF1a9suFNIJKvCgdLzCp6Hv0opa9TpdaWySxWCZeqSHy6dRh
         gDVYKnG88Gfw3Owp5QAvMU8Zenvxqw8rjJOLj5WVFz3x2z39D1MQ3DUswq9QYvh2BaRf
         9ItjY8b2lmo6wDhzmxQeceH1QPRe4LiG6S+0aL+QqkQGwKohB1BmLFYDSHwGJmod7bLu
         aNi7mIFKwWQB79WNcUuKDj6/lHbek+h1nayp/rXlW9S4jZHHBMoxXi3oV9tTxEMbEUUC
         2XzQ==
X-Forwarded-Encrypted: i=1; AJvYcCX7i8pD2LufHyvZvWEr09UvIru4H0o1EahzW0vhwUkY7gxjEmh+Iyg0pO3bKQGWpxBbw78lTYdXjtuA@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7OSgInspua0vw3q7wnDVmPcwWBQNinIK6+ABYWgY90mPtNvzr
	UT7ylHUjETdCRQv5Xt2uzu9orBubkEq3iRTyyNZ/cGl2t7UbQ9XQICf8
X-Gm-Gg: ATEYQzxtoZk2bCXgEN76KFapG51hI2OUyO+0uSQXuRx+cHyyVMXP9aAmvd7FCh+qUvD
	2md1PLtF3FhrWnEtjSC01OXpQkCE//wjvGFFgbxPrQ9P07TLItqBhbYTIYK0L9Bur5t3szba79e
	xsUARGbmFQsYvGzwDjsAW24Czr8PZFVsNNqUF196ahnhdnXRzU5nZ81us9JwJ4nCF9zKYUM81DM
	5xKzX+7X/HoCKiASJnuNSXqxsTgLonf0yT+bzJHFORanklHQdLVUGAAztQgLp9/PXbYyKd3akzK
	1xiNLunBv9Yz99NreYaM1n1J4k9nEb2P5Bx/hphEzhn26dXbArB3UFXDtBfqUGYx0ZFVlLIVsD8
	rAIGbby3I3+bMpPLzwuJB8sst/t1GFI04XX8YTNDei68nssoicUWNQ3ch9opi/tLthuysVaPaIE
	u2J1PP7jFma9CGKvsFcmXDS4LQ1QN0+Uel2vVHsA5RZ7KvUfcsR4U4SHmu0gCoRKmb5pzWFeV8V
	/mD3oZCP/dwVOgWLafjcm1iMks=
X-Received: by 2002:a05:6000:2502:b0:439:b744:c5fe with SMTP id ffacd0b85a97d-43b88a39af3mr5165742f8f.52.1774449992180;
        Wed, 25 Mar 2026 07:46:32 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b9192e305sm304592f8f.8.2026.03.25.07.46.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 07:46:31 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Wed, 25 Mar 2026 15:46:02 +0100
Subject: [PATCH v3 1/6] dt-bindings: arm: fsl: add Verdin iMX95
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260325-verdin-imx95-upstream-frank-li-base-v3-1-b2b5221a8077@toradex.com>
References: <20260325-verdin-imx95-upstream-frank-li-base-v3-0-b2b5221a8077@toradex.com>
In-Reply-To: <20260325-verdin-imx95-upstream-frank-li-base-v3-0-b2b5221a8077@toradex.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>, 
 Emanuele Ghidoli <emanuele.ghidoli@toradex.com>, 
 Francesco Dolcini <francesco.dolcini@toradex.com>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.13.0

From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

Add DT compatible strings for the Verdin i.MX95 SoM and its supported
carrier boards: the Verdin Development Board, and the Dahlia, Ivy,
Mallow and Yavia carrier boards.

Link: https://www.toradex.com/computer-on-modules/verdin-arm-family/nxp-imx95
Link: https://www.toradex.com/products/carrier-board/verdin-development-board-kit
Link: https://www.toradex.com/products/carrier-board/dahlia-carrier-board-kit
Link: https://www.toradex.com/products/carrier-board/ivy-carrier-board
Link: https://www.toradex.com/products/carrier-board/mallow-carrier-board
Link: https://www.toradex.com/products/carrier-board/yavia
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
v3: no changes
v2: Added Krzysztof's reviewed-by
v1: https://lore.kernel.org/all/20260305-verdin-imx95-upstream-frank-li-base-v1-1-823fad02def9@toradex.com/
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 5716d701292c..f0701143b237 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1477,6 +1477,30 @@ properties:
           - const: toradex,smarc-imx95     # Toradex SMARC iMX95 Module
           - const: fsl,imx95
 
+      - description: Toradex Boards with Verdin iMX95 Modules
+        items:
+          - enum:
+              - toradex,verdin-imx95-nonwifi-dahlia # Verdin iMX95 Module on Dahlia
+              - toradex,verdin-imx95-nonwifi-dev    # Verdin iMX95 Module on Verdin Development Board
+              - toradex,verdin-imx95-nonwifi-ivy    # Verdin iMX95 Module on Ivy
+              - toradex,verdin-imx95-nonwifi-mallow # Verdin iMX95 Module on Mallow
+              - toradex,verdin-imx95-nonwifi-yavia  # Verdin iMX95 Module on Yavia
+          - const: toradex,verdin-imx95-nonwifi     # Verdin iMX95 Module without Wi-Fi / BT
+          - const: toradex,verdin-imx95             # Verdin iMX95 Module
+          - const: fsl,imx95
+
+      - description: Toradex Boards with Verdin iMX95 Wi-Fi / BT Modules
+        items:
+          - enum:
+              - toradex,verdin-imx95-wifi-dahlia  # Verdin iMX95 Wi-Fi / BT Module on Dahlia
+              - toradex,verdin-imx95-wifi-dev     # Verdin iMX95 Wi-Fi / BT Module on Verdin Development B.
+              - toradex,verdin-imx95-wifi-ivy     # Verdin iMX95 Wi-Fi / BT Module on Ivy
+              - toradex,verdin-imx95-wifi-mallow  # Verdin iMX95 Wi-Fi / BT Module on Mallow
+              - toradex,verdin-imx95-wifi-yavia   # Verdin iMX95 Wi-Fi / BT Module on Yavia
+          - const: toradex,verdin-imx95-wifi      # Verdin iMX95 Wi-Fi / BT Module
+          - const: toradex,verdin-imx95           # Verdin iMX95 Module
+          - const: fsl,imx95
+
       - description: i.MXRT1050 based Boards
         items:
           - enum:

-- 
2.43.0

