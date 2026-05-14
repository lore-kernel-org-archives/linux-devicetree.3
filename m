Received: from mail-m1973172.qiye.163.com (mail-m1973172.qiye.163.com [220.197.31.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A30891F5842;
	Thu, 14 May 2026 07:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778742117; cv=none; b=Jg7W0IAYGabEMbfVEYQD4UPAzfZJaHLljQIItw4m2MX5qGdt8Thyke1uoLsTRerCgYxDpdnr5LoVuY+LyjS+m3JxboOe+X4shNZnRfHrEjkwmjCrRpZcqorW9qcbXt9ATZHN/0Yu74E1EB/RHnTYACz+a/lwqHdTJSNNJj7qyR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778742117; c=relaxed/simple;
	bh=vpYOsbpfOQEuM10dVez2H1rgcCp8dRJRLKnPLP9Ylj4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=kyLRp3wasDjU7WjftEYSEDeL2+MhC688r92ffLsyk9N9+xfvG/wH4OCGZHfhJcklM4on2VtVvTmUxGWEMXzSWWeuL23YpS744r8pXqecvEFqxUW2g8Vc4pDxVp9fk7kWl9fiuFH6+w7NgaFoLcbukdYwaxxsax7yoTcx3hSi7mY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=bF3XB/Nx; arc=none smtp.client-ip=220.197.31.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="bF3XB/Nx"
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 3e617edca;
	Thu, 14 May 2026 15:01:39 +0800 (GMT+08:00)
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
Subject: [PATCH v1 1/3] dt-bindings: display: rockchip: analogix-dp: Expose inherited properties
Date: Thu, 14 May 2026 15:01:31 +0800
Message-Id: <20260514070133.2275069-2-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260514070133.2275069-1-damon.ding@rock-chips.com>
References: <20260514070133.2275069-1-damon.ding@rock-chips.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9e254a7c6103a3kunm8191ae6fc25f3
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZHR8aVkkZTEMfHxoZSkxIHlYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSE
	pKQk1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=bF3XB/NxtfQOdzSctQkKF3XU229TaU+05o8zkZGETUQMaD+NbJYBPn90txPuIu4Ji2T3dbnQahqfjxrfLAJkbCb6VPFszt6OCkR43iSxNgVILoFi4iP5u6GOyWyCX+wnPlLWYWMhX8cBfrQQJF4knrw0wAg5QXfJr6MIfBM60xQ=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=PnQAO4hrda8Ee7d8bYmPsv3T8ksDqN93d0yp7NLmvfY=;
	h=date:mime-version:subject:message-id:from;

Expose the inherited properties from the base analogix-dp schema
to satisfy unevaluatedProperties constraints.

Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
---
 .../bindings/display/rockchip/rockchip,analogix-dp.yaml    | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.yaml
index bb75d898a5c5..896ded87880f 100644
--- a/Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.yaml
+++ b/Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.yaml
@@ -50,6 +50,13 @@ properties:
   aux-bus:
     $ref: /schemas/display/dp-aux-bus.yaml#
 
+  reg: true
+  interrupts: true
+  phys: true
+  phy-names: true
+  force-hpd: true
+  ports: true
+
 required:
   - compatible
   - clocks
-- 
2.34.1

