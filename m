Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB68949E151
	for <devicetree@vger.kernel.org>; Thu,  1 Oct 2026 13:17:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790860626; cv=none; b=W8Q2KCHROuvt3TyoaLJ/FFYy4R0GkV2Hb0wKb6oRPjuxvJyn0HxMMmiIwsTntx4MyrGHO1f/i/EHwYOPLLmDMMYLydhzXb2rRhGmJJ5hT2B/ZePiLD65zMfsSlzIOFOpVjWTPoFbJCrU1EID+5Ufki9/c3HuAvlbTYZtri7fRSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790860626; c=relaxed/simple;
	bh=ZifscX9ECT0mS9cXZ5DR6c3DldNnefWRukZDDhcXf1M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References; b=FvVncfex9U0RJ4Uo0BlkRzp7dO08+FxQAmdJhZ2fqiExCFCmI9vMB4RCrZOIHPI4J3mxiK+Dvuwg4W14PYtkAtzITY7V3ABZWr3NYExoGpYwjY1gH19I1DbBHbxQJ+ZMYeP4snDS5r4cef/WNKG3oOKh7BAPVWJb4wPhT3IhEw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=FrsVBA0g; arc=none smtp.client-ip=117.135.210.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="FrsVBA0g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID; bh=UkHYuan1PuG6FE1
	cRuk2LF2qvnvHGpPzEYvnaNQadyY=; b=FrsVBA0gCoKz7TA8FSAH7LP0UDw3sFl
	QzheViYsRhEga+rRNuK96MEw03nLRJi4Z+OUWHkkZOjLt0Z7Ee6gcTJFn7LTvDld
	RU3DRBqA9R4/6krw7NwOfBp05tlicziGu4jxW3AFUVaeFroCqSpttJzp4xD7vQJb
	9iBuY2jS7ovk=
From: BG9OXA <bg9oxa@163.com>
To: linux-rockchip@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>
Subject: [PATCH v3 1/2] dt-bindings: arm: rockchip: add ALIENTEK QuarkPi-CA2
Date: Thu, 01 Oct 2026 21:16:37 +0800
Message-ID: <179086059727.25869.4898747284365209003@163.com>
In-Reply-To: <179086058377.25869.5809349568462938314@163.com>
References: <179086058377.25869.5809349568462938314@163.com>
X-CM-TRANSID:PygvCgB3zkU1Xb5qiV53CQ--.61784S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7XryfJrWxWFWktFyxAF1DKFg_yoWfurbEka
	4xuF15uFWrXFyFgw45Aan7GFyjqw47Krn7A3WUAF18A34vkws3KFZ5t342kFyxur43urn3
	CFs5JryxXFnxGjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUjVyI5UUUUU==
X-CM-SenderInfo: lejz05rd6rljoofrz/xtbC+hWuHGq+XTWqegAA3x
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Document the ALIENTEK QuarkPi-CA2, an RK3588S based single board computer.

Signed-off-by: BG9OXA <bg9oxa@163.com>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index a799bb843..a3191bb90 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -182,6 +182,11 @@ properties:
           - const: alientek,clrv1126f
           - const: rockchip,rv1126
 
+      - description: Alientek QuarkPi-CA2 board
+        items:
+          - const: alientek,quarkpi-ca2
+          - const: rockchip,rk3588s
+
       - description: Edgeble Neural Compute Module 2(Neu2) SoM based boards
         items:
           - const: edgeble,neural-compute-module-2-io   # Edgeble Neural Compute Module 2 IO Board
-- 
2.47.3

