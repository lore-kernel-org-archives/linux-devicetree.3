Received: from mail-m49198.qiye.163.com (mail-m49198.qiye.163.com [45.254.49.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF10339F16B;
	Thu, 20 Aug 2026 10:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787220041; cv=none; b=ZbaQt4n1760PdyhABORp+NjVm5fZmkl52paH1NCugxEXsrCnUrvlqfiCeUiScnWRpvf15v4VWCw1S/MSoDqApxu0VRo/gXCWtd1VpEIYXW2ab2oo8z81lQ5sTEpIqh/lmGId8jJAXbUNc4hrKEtFXFn9q6gpyEPS/HxRiYGXY+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787220041; c=relaxed/simple;
	bh=Larx7+W+y93pSlplBywMJ3VjR5G4smWsTgfE8rNEcl8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=F4FxMW9vz8TLt7ql108Yi/mn6Mz2pMupExdADyjMQLV8z1qcUVTDO0tnGL6DIyb05PK3ZzbL+FI4LXKFku+Ft/Z9h7jLi2ZFb9j2ussHN2JuEiEzy7pqMTDCTFb8DZ5SxGZClGs+LxSQ9M5P8Eh0Njg7ggComqCanRjON7R9HVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn; spf=pass smtp.mailfrom=jmu.edu.cn; arc=none smtp.client-ip=45.254.49.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jmu.edu.cn
Received: from Vostro-3710.. (unknown [14.220.232.127])
	by smtp.qiye.163.com (Hmail) with ESMTP id 4ab3c2732;
	Thu, 20 Aug 2026 18:00:32 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>,
	Chukun Pan <amadeus@jmu.edu.cn>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: arm: rockchip: Add Radxa E54C
Date: Thu, 20 Aug 2026 18:00:19 +0800
Message-Id: <20260820100020.3370385-2-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260820100020.3370385-1-amadeus@jmu.edu.cn>
References: <20260820100020.3370385-1-amadeus@jmu.edu.cn>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa01e9d7dd303a2kunm5b0a804aa475b
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZTR9MVk1JHUJLGU9KGh5JSlYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKT1VJSUtVSUhJVUpJTFlXWRYaDxIVHRRZQVlPS0hVSktISk
	5MTlVKS0tVSkJLS1kG

The Radxa E54C is a high-performance network computer developed by Radxa
based on the RK3582 SoC. Add devicetree binding documentation for it.

Link: https://radxa.com/products/network-computer/e54c
Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index a799bb843f74..658d55b68a30 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -1005,9 +1005,11 @@ properties:
           - const: radxa,e20c
           - const: rockchip,rk3528
 
-      - description: Radxa E52C
+      - description: Radxa E52C/E54C
         items:
-          - const: radxa,e52c
+          - enum:
+              - radxa,e52c
+              - radxa,e54c
           - const: rockchip,rk3582
           - const: rockchip,rk3588s
 
-- 
2.34.1

