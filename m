Received: from mail-m19731110.qiye.163.com (mail-m19731110.qiye.163.com [220.197.31.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B295359A6C;
	Thu,  7 May 2026 11:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.110
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778154329; cv=none; b=lOghFigE/cTXIr/YWZBrk7MBQE4jIoVRL41dQHtKqlNTTT9gBs4tthoUMv1u84Tyr5+Il58o0ouSJAPvgzcjFO1JfRI6io3UbItxK7c2Pw1P1fm50o91prrIwO8zgdU7ON85C4+EgDp3DzcaT9JH5Qgnq3AwjDajdGFnKDuNeZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778154329; c=relaxed/simple;
	bh=E3n5PPEfat1bxIwvTgjH9h8ZdsntU7sjmbloPpZMgcU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GnBmpPCEjey5dhOGZG7Nla5ITc3uvUKuUJwJvUsgSrvuxeBgUNFtG2RkwFGH6Dms/ZHoeIx9bGE9bkqEUlmRVxY25l4xitPd/G1kT1t5L0K/8rbsYN2vcL73AvulIktQdNsHjx3K3cLyEuKQBDzIwc+CkBvcs3V+mFXL0Kztxww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=EMIB/+i1; arc=none smtp.client-ip=220.197.31.110
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="EMIB/+i1"
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 3d7b63a37;
	Thu, 7 May 2026 19:29:55 +0800 (GMT+08:00)
From: Damon Ding <damon.ding@rock-chips.com>
To: hjc@rock-chips.com,
	heiko@sntech.de,
	andy.yan@rock-chips.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andrzej.hajda@intel.com,
	neil.armstrong@linaro.org,
	rfoss@kernel.org
Cc: Laurent.pinchart@ideasonboard.com,
	jonas@kwiboo.se,
	jernej.skrabec@gmail.com,
	nicolas.frattaroli@collabora.com,
	cristian.ciocaltea@collabora.com,
	sebastian.reichel@collabora.com,
	dmitry.baryshkov@oss.qualcomm.com,
	luca.ceresoli@bootlin.com,
	dianders@chromium.org,
	m.szyprowski@samsung.com,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Damon Ding <damon.ding@rock-chips.com>
Subject: [PATCH v3 01/10] dt-bindings: display: rockchip: analogix-dp: Expand clock-names "hclk" for the third clock
Date: Thu,  7 May 2026 19:29:39 +0800
Message-Id: <20260507112948.1115003-2-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260507112948.1115003-1-damon.ding@rock-chips.com>
References: <20260507112948.1115003-1-damon.ding@rock-chips.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9e0233945803a3kunm4d1cbcd72692
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCSEofVkhIQksdQhlMTx5MQlYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSE
	pKQk1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=EMIB/+i1jzZxOWJr8SGTBMtGF7rBNSLR/yTTd8maWPIljjqqideGXCbYW1GeotVwWIRU8UpRAS47UC4nF+WUsIM9d2Ce6iDZgcMpMTyOlZbMb96gdRAX5JXakJLCm9jgz6yealrzIGn8eskHN2utwyxUGIk7CkHnXEEK/piPKR0=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=xePl0hMc2duTAUrfFw+IqxRX9ygrNXXJcQDpAgW+nUk=;
	h=date:mime-version:subject:message-id:from;

The RK3588 eDP controller needs the video datapath clock "hclk" to work
well. Previously, it works without explicitly adding this clock because
the 'rockchip,vo-grf = <&vo1_grf>' property implicitly enables HCLK_VO1.

Fixes: f855146263b1 ("dt-bindings: display: rockchip: analogix-dp: Add support for RK3588")
Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
---
 .../bindings/display/rockchip/rockchip,analogix-dp.yaml       | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.yaml
index d99b23b88cc5..d2bc8636b626 100644
--- a/Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.yaml
+++ b/Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.yaml
@@ -26,7 +26,9 @@ properties:
     items:
       - const: dp
       - const: pclk
-      - const: grf
+      - enum:
+          - grf
+          - hclk
 
   power-domains:
     maxItems: 1
-- 
2.34.1

