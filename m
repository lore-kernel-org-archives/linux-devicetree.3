Received: from mail-m32118.qiye.163.com (mail-m32118.qiye.163.com [220.197.32.118])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26E783CF02E;
	Thu, 21 May 2026 12:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.118
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779366055; cv=none; b=GPYKAk41CXHTaMeNo/a6zu7Iktob2jOrvykz4Fh3BRur9DUfHX28LAlkDnJtspduzw4yJJmxbHUlEBGPeNqCBSA+Ujel53G5wAkxTdedA0VAvzDjZWfdkdT9JG1bExU9qyw4gZNqi/CklUkgBDjXwcuS3DI1fmJLGnG5FMdCuPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779366055; c=relaxed/simple;
	bh=4BWCPZnCEYs5vgRGHHEtO//oZUNtWemwT86caw3lyn4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=H/PErf5s6kd5z6J8APBv2qp3GtOETwD89zFYegvw6h/742Ibylwum81WYugVrny+Q65QCvV/pw9mS38CcfhCtmNjZkFln58iJ/5G9jnvi8rfRCKbu31lI7w5Ht/qmewHTahBqCSYu7sLZ/BUdJEzkxw0WEbv1oBdEolinbKbUg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=EXC1F9yu; arc=none smtp.client-ip=220.197.32.118
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="EXC1F9yu"
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 3f5009434;
	Thu, 21 May 2026 19:45:14 +0800 (GMT+08:00)
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
Subject: [PATCH v2 2/3] dt-bindings: rockchip: analogix-dp: Add data-lanes example
Date: Thu, 21 May 2026 19:44:58 +0800
Message-Id: <20260521114459.1394264-3-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260521114459.1394264-1-damon.ding@rock-chips.com>
References: <20260521114459.1394264-1-damon.ding@rock-chips.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9e4a5aa4a203a3kunmad9184e67776c
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaTRhCVkpPGB1NSB0dGB4eT1YVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSE
	pKQk1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=EXC1F9yuTc+tl5/F+N4awUmmaKrZe9mRfjiMId9aWVSauh2NxtXP9orD84HZrTLA7f8DGJkCLMhAlGy5/HB5EPvlVTl9hen/oXiLd3Q9DEB66SvpTsDZ8OFBa7NugzdDBuO4IcCFv1NNZcmQcmjmPVR2XsxYF4mVBgHn7IEhfvw=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=KlebGy4vmLFS3sABadJGKLU3IR8mYj+LJC5u2ExLQAI=;
	h=date:mime-version:subject:message-id:from;

Add data-lanes setting in endpoint example to show actual lane mapping
usage.

Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
---
 .../bindings/display/rockchip/rockchip,analogix-dp.yaml          | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.yaml
index bb75d898a5c5..cf75c926318b 100644
--- a/Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.yaml
+++ b/Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.yaml
@@ -151,6 +151,7 @@ examples:
           reg = <1>;
 
           edp_out_panel: endpoint {
+            data-lanes = <0 1>;
             remote-endpoint = <&panel_in_edp>;
           };
         };
-- 
2.34.1

