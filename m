Received: from mail-m49197.qiye.163.com (mail-m49197.qiye.163.com [45.254.49.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E08FE3750BE;
	Wed, 10 Jun 2026 10:05:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781085936; cv=none; b=TA2Pf0SIsI3gM8B5RSFRnsYNiNfNfHvvZ2kGlAD4KNw7EiCaZpH0F8iawOZ0uMGoPgloXNiJ9WpR4rPJ3HpfrNFOz2iIQMJdCKKiXNeV7vXSDxrBk8trY1gVbuMuarTPcfvM0GeI65XW6gr6qsAbkO44poCGnNYsCoJSdzJ8YRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781085936; c=relaxed/simple;
	bh=mL5+LBkRL1gjysIXJ3lHr4Di2CKnAZEwoKyCpyNdAAI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=I6l1/EcLtQrddPBwUIpJ6UHzIHqZ4tO1Q5xbQLgTOzh8ZHbvygrkGJ5VgMcT8LEyGMC7FXH6VtLsYf18AbW8szXfjqYUoaEO+l+HgGSnk8X5cviup8YeWo83o+JSYWzLHPxI/FWeSXJdRdP8WgpG6rhJanqKhC7HFRloDstglOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn; spf=pass smtp.mailfrom=jmu.edu.cn; arc=none smtp.client-ip=45.254.49.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jmu.edu.cn
Received: from Vostro-3710.. (unknown [113.80.141.92])
	by smtp.qiye.163.com (Hmail) with ESMTP id 41d5b4a7a;
	Wed, 10 Jun 2026 18:00:16 +0800 (GMT+08:00)
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
Subject: [PATCH v2 1/2] dt-bindings: arm: rockchip: Add HINLINK H28K
Date: Wed, 10 Jun 2026 18:00:05 +0800
Message-Id: <20260610100006.366963-2-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260610100006.366963-1-amadeus@jmu.edu.cn>
References: <20260610100006.366963-1-amadeus@jmu.edu.cn>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9eb0f9b8dd03a2kunmd062ac7916b4dd
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZGENDVkJITx9LHxgdSh8YGVYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKSkhVQ0tVSk9KVUJJWVdZFhoPEhUdFFlBWU9LSFVKS0hLSk
	xLVUpLS1VLWQY+

The HINLINK H28K (also known as LinkStar H28K) is a dual-gigabit SBC
based on the RK3528 SoC. Add devicetree binding documentation for it.

Link: https://wiki.seeedstudio.com/H28K_Datasheet/
Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 1a9dde18626d..3952987a2c3c 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -724,6 +724,11 @@ properties:
           - const: hardkernel,odroid-m2
           - const: rockchip,rk3588s
 
+      - description: HINLINK H28K
+        items:
+          - const: hinlink,h28k
+          - const: rockchip,rk3528
+
       - description: HINLINK H66K / H68K
         items:
           - enum:
-- 
2.34.1

