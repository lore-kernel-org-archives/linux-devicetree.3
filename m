Received: from mail-m49198.qiye.163.com (mail-m49198.qiye.163.com [45.254.49.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDA8B379ED4;
	Sat,  8 Aug 2026 08:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786176044; cv=none; b=conrK4XPBA1+VT8qgJb6kaWI11m/l3K2g9kzoymdxT9Ng/FUtCA+U+oTdZYdEHOWKn/Gty+b9lhtWBzJMeqqkzFFCeaQvnmBF+uAtMv/tb2749A9tgHlLM1mk6QPtlNAZZb0vCj3OFdY1vSX7CVlm4pCwxzWo3qsh7Z5LRluz3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786176044; c=relaxed/simple;
	bh=gU1wA+yVgRirQB91req6xsO2h10eHBjXgLcCXdXw5Yk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=VZ/G5z4yzTi5XnqfHffjZWOKyJYPn+70PuSGrv4l/owIT9jlXXQKPsvfu/FnS/OmGSjORsQprhHYWmHpg0voTgy/VQh9gTckX4rB3gUSXcCFLdSJBYIdMXmzkdVrmvVVXYVznB4uDpRMvtUo7nCa+ZuI2Uu+inuSlmerxbPldlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn; spf=pass smtp.mailfrom=jmu.edu.cn; arc=none smtp.client-ip=45.254.49.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jmu.edu.cn
Received: from Vostro-3710.. (unknown [14.220.232.127])
	by smtp.qiye.163.com (Hmail) with ESMTP id 494038e87;
	Sat, 8 Aug 2026 16:00:30 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>,
	Chukun Pan <amadeus@jmu.edu.cn>,
	FUKAUMI Naoki <naoki@radxa.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: arm: rockchip: Add Radxa E54C
Date: Sat,  8 Aug 2026 16:00:17 +0800
Message-Id: <20260808080018.1492239-2-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260808080018.1492239-1-amadeus@jmu.edu.cn>
References: <20260808080018.1492239-1-amadeus@jmu.edu.cn>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9fe06346dc03a2kunm975b5a9f61262
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCTUJCVh5JTExCQx8ZSB5PSVYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKT1VJSUtVSUhJVUpJTFlXWRYaDxIVHRRZQVlPS0hVSktIS0
	pMS1VKS0tVS1kG

The Radxa E54C is a high-performance network computer developed by Radxa
based on the RK3582 SoC. Add devicetree binding documentation for it.

Link: https://radxa.com/products/network-computer/e54c
Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 082df5fe2ff6..89696401e1e5 100644
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

