Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79C3837E5D2
	for <devicetree@vger.kernel.org>; Sun, 27 Sep 2026 12:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790512645; cv=none; b=OMWFW8YEenE4ENa37ujv6nNzN4TjMv+ulERRQtLcn0FlIf8Jbu7fV+exkkX5z4/bfnlGchhvlN6FYqE7xsv0DyL8FHRQBcaCVA5KcIFM73SSfUwuMKXga35TIJ1NGGAu45CLMm5JG7RMx5963+xgEWCdRL3NBTtq5vET+TJB8Qg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790512645; c=relaxed/simple;
	bh=rh1RYeY3m8KADD4dph8IIykh/7BHkZrewmRIOU3ioNU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References; b=D7LMN86alAiC1rdyT3fXXdOTEjsk8eJMsRPCBreeBZL+r4wldFxYTQV2FwJfRYcEW1xKzz/n/MUIvQK1sKW8aeoeRFA+qmZR/mb1licfq33TvR/VGGNxBXkmhLG+1NFdxBD618O4/1CHN9WNmbmw4TmKRM6zzwMrKN1OirfXWFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=aE29hHC5; arc=none smtp.client-ip=117.135.210.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="aE29hHC5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID; bh=copIDOk9MPWo/ov
	98Kor/uunS41vMva72FnQRKJ6hn0=; b=aE29hHC5gz8S6ghSp3XCSwSTHiznpde
	i5w4eYoZRSE5vhjgnMiaAEcH/HSzG5T2N7RhRbKCJO4McWZ+hlsHiLv+9dEZc9yQ
	mC5gIYzugCotRXtG3tEKFkNFCbW/WN85xG0JVo9DDCcmQGmseOZsyp1EDjw2hHiW
	audXVx07DvaE=
From: BG9OXA <bg9oxa@163.com>
To: linux-rockchip@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>
Subject: [PATCH 1/2] dt-bindings: arm: rockchip: add ALIENTEK QuarkPi-CA2
Date: Sun, 27 Sep 2026 20:37:03 +0800
Message-ID: <179051262312.4055.11698105707712320261@163.com>
In-Reply-To: <179051260955.4055.15953866975694461812@163.com>
References: <179051260955.4055.15953866975694461812@163.com>
X-CM-TRANSID:_____wD39xzvDblqvR2yBA--.43291S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7Xry3CF48Cw47ur1xCr1xXwb_yoW3ArXEk3
	WxuF15uFWrXFyFgw4rAFs7WFyqvw42krZ3AF1UAF1kA3yvkrs3KFZ5t342ya4xWr43urn3
	CFn5tryxWFnxJjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUjp6zUUUUUU==
X-CM-SenderInfo: lejz05rd6rljoofrz/xtbC3g+H9Gq5De98IwAA3M
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Document the ALIENTEK QuarkPi-CA2, an RK3588S based single board computer.

Signed-off-by: BG9OXA <bg9oxa@163.com>
---
diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -182,6 +182,11 @@
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
2.43.0

