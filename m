Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC27E3D0BE9
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 17:11:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779383474; cv=none; b=SBNdfTtk6LvB39Szz4VCGafRrnV9upgGZMB5yvbWph1NSHaMvJBjv3q0nOs6zMduw0qGH4fpe/DLRLBQSaTMYbLtzSONQk7zkH5inQVYhHl7RSkgp8ZdLC731ALBIfdIIUid5xTZQcOjdCir5KHQbUF7VPG0txjP8zRR97PTCT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779383474; c=relaxed/simple;
	bh=nrTpwWDzLnTkunP9cIp4DZH4zeNYymR48XaZSitFxI4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AcIgCe3v5g7ohXY+CSHBbQGt2t5A/KCBhWMSe7zHvMMt3Iu6tvEcEV3oUdfgT2rHjP0yxbxJOLXt//E64KsnInyQVs7lhwK7reYHd4+v3YrUVcEmeU5f35S8V1iolqF/T/eHuuHF+EPc9KO405ocj85jrHLR8Ay4zWm4OYhN3oQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mSTv/ofP; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mSTv/ofP"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-449d6c68ed8so3360133f8f.0
        for <devicetree@vger.kernel.org>; Thu, 21 May 2026 10:11:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779383471; x=1779988271; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=98JuQONnWQsI55kpTBrrRllxqm+qH6cTiMyVfzawqAw=;
        b=mSTv/ofP0jLfhvEFiFlXUXz2tW+wNs9OaJjnhZ8cAA8JANg8DMr9Wi0Kja6T7BLpdD
         LgdwCVVcqeSuYA46HAoKSLJgaHNtw8cbzm58O+icyGfiuvm8saQagCMhJ5P6syzbuXYl
         2c8d7FOibhixj8obh+hZNS5Pq+X4Fvfp2iiaKAJeBGyv23DGz2h4DJ+KH0R/7vr0uZwC
         hLszgzqJzYd6nyR3VxqKummKzV6VkHq3IBNj/WIT/usbsrm8teERpA7SngKMYD+7A6J9
         7EpJaASGj/LvYPjD/5nZSDb3xUH6leVKCZzEO35WTlgnpbkLMLqG2rQdb9XmSb+BY4bJ
         RUzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779383471; x=1779988271;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=98JuQONnWQsI55kpTBrrRllxqm+qH6cTiMyVfzawqAw=;
        b=U4wnoF/VwV0L3nZFs8MTu6IKHQ/+1hlHQK2kRx3LlOlrlQ2kSs5pucWRgHH/+dNOlY
         V3n5uQ1mXHv0Gbg3kgGSPwNOIy4+Ot07HzTD2q+eupQcTFS80z+cEjB38iNqoSwxRqT5
         5RRRFDF61CTKUxLKaXhyFH8VPx50B30i9v/6RQFxiuvRi8WXhpHGSsIOX+s7xExFI0Yp
         iOxrZ8c9p+HXMOxB9fK5PyfubM3ZbsRhD1S6Rs/SEXCZfthN5RAU3AyJjBJd9uaQqszT
         lX3o+U/GiKYh/pVpaYY7wpE+Mh/PVPUAwhctHJ58iwwAADAbq6LnE5depU23Zio62Rdo
         YGOA==
X-Gm-Message-State: AOJu0YxyzcQj69agHdiTdK6ptKw4jPnl8tKFy5j43EFHB6Hx7YKDjbW3
	uB4KuR5ZkSM07kiab/C+UxlRC6nU8JB8196YiKL28zLYilUBWCZzdztMJKKLjpKN
X-Gm-Gg: Acq92OE7mq6mbKjMFp3y12uNHwuBD1BR4ElZGCeCsX3MnE3PwfZVslL1BzxGTPZfelL
	INt/Npi4ZODdmG3z3J7nkRPAK4nqq+bwp57q6in+JsfqYumUuomE55mlTVNEJTOl58AXsm5UFHB
	QeP0peI4zWUoztDLWt6qFM/iRZnd4pgm7fFeD63fy/gEvnugXnor1a5lkXjE1bl8ukd3A8i1FM6
	nqAySNfQwyajTBXFymQa+qY6L/56Ta8NQwc/ogG1/xn+0HgURsA0fzmXbwlGTAhhRfYxO8IfeN8
	1DMlMBpXO8RBQeglSGQmJpM6koUF7e+y/IKpwdxsciBkXzDEVQapNLuQcC2Qs7OrLk/tJRcpQ3J
	jYXB+nwO7RqjKgGa0EFB2BW8DmNLG5wiLBxGu5kMYO1dyS3dMHKU5R4T+O89UZ1kyjgGzTRPy2J
	2yQDrKtF7tOSWRlrqAuwJ8odkXJn+7b1v/C1WVUSttXsMU0/1uFuVLSyLcirtzCdD0IP+8QLtof
	0KtpX+eKLxgT7klz+ajNiC0/lfl+70bbcpaubQkvMjNQa9a1120pTWUjP39JYAnN4uLQxop2tDW
	8w==
X-Received: by 2002:a05:6000:22c9:b0:439:c18f:5aaf with SMTP id ffacd0b85a97d-45ea3bf0b1amr6276246f8f.34.1779383471016;
        Thu, 21 May 2026 10:11:11 -0700 (PDT)
Received: from [127.0.1.1] (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eaa7cd815sm6046116f8f.6.2026.05.21.10.11.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 10:11:10 -0700 (PDT)
From: Franz Schnyder <fra.schnyder@gmail.com>
Date: Thu, 21 May 2026 19:11:04 +0200
Subject: [PATCH v4 1/3] dt-bindings: arm: fsl: add Aquila iMX95
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260521-add-aquila-imx95-v4-1-5a7f86c824f5@toradex.com>
References: <20260521-add-aquila-imx95-v4-0-5a7f86c824f5@toradex.com>
In-Reply-To: <20260521-add-aquila-imx95-v4-0-5a7f86c824f5@toradex.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Francesco Dolcini <francesco@dolcini.it>, 
 Franz Schnyder <franz.schnyder@toradex.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.15.2

From: Franz Schnyder <franz.schnyder@toradex.com>

Add DT compatible strings for the Aquila i.MX95 SoM and its supported
carrier boards: the Aquila Development Board and the Clover carrier
board.

Link: https://www.toradex.com/computer-on-modules/aquila-arm-family/nxp-imx95
Link: https://www.toradex.com/products/carrier-board/aquila-development-board-kit
Link: https://www.toradex.com/products/carrier-board/clover
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Franz Schnyder <franz.schnyder@toradex.com>
---
v4: No changes
v3: No changes
v2: Added Conor's acked-by
v1: https://lore.kernel.org/all/20260506-add-aquila-imx95-v1-1-69c8ee1c5413@toradex.com/
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 59f7f168bf7c4..ea4cc98dadebc 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1507,6 +1507,14 @@ properties:
           - const: phytec,imx95-phycore-fpsc  # phyCORE-i.MX 95 FPSC
           - const: fsl,imx95
 
+      - description: Toradex Boards with Aquila iMX95 Modules
+        items:
+          - enum:
+              - toradex,aquila-imx95-clover # Aquila iMX95 Module on Clover Board
+              - toradex,aquila-imx95-dev    # Aquila iMX95 Module on Aquila Development Board
+          - const: toradex,aquila-imx95     # Aquila iMX95 Module
+          - const: fsl,imx95
+
       - description: Toradex Boards with SMARC iMX95 Modules
         items:
           - const: toradex,smarc-imx95-dev # Toradex SMARC iMX95 on Toradex SMARC Development Board

-- 
2.43.0

