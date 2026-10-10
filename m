Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E44F9483BC4
	for <devicetree@vger.kernel.org>; Sat, 10 Oct 2026 11:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791633369; cv=none; b=RRX/kwBBdanTl3t5ynlaq5tTfwDUtNkX3quqlqeGJlxmE1kw2ZPVyHcv3iuZQfvZgep1ckLHccm4dL4w7zzr+N9cxI5fmgy4flpfbLkT/erD5a2i9+jJC9ily9bo52LteYua2UJoBqMoG65/Vd/9gda511dyVAmH3dqkGqNnafU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791633369; c=relaxed/simple;
	bh=R9jduDBNkrUI4Ytp4d+BkWD4r0GbRTA682YKtlbMYd0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IE/mYwnB/ZD6mL5ywHa6vmYdgOobNS9NsAMxzrb0wvyKN3ZxbrHTTk8BzCVYEHx2/2mMsZy5ZwxzMylixQ5RJtT615tq/izr6i/SxKm9/rEEnMYuguJzCQdwyP4fPO/Z38xGL7zJy5IeGKdFhwdvAGiP3hkrIeQ2RZZg0/boM8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CM9SymQC; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CM9SymQC"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48b03f23305so443977f8f.1
        for <devicetree@vger.kernel.org>; Sat, 10 Oct 2026 04:56:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791633361; x=1792238161; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RPzRZvC6M3eYrQVDkjYe0kKV8YaVNewsubnx0uw/yuw=;
        b=CM9SymQCPjpuB/uy//d4QH8tZKx3scvoSVsls4CbuFwAXcu+ROF9w7TLoWbXxn3MnT
         ytxdhP38ZzjGfFjx3ZOFogizxpdJTXZZ4RVd1JUhoVj1gqye/MT6ELHKNdkOHjDpGE/I
         RQKW9IPBacEMRYCU7Ja3zzhtsDLgTYq1HjufOrRRKanS5Mt3v3JXVr25SbWWO2yCx+Wl
         ZU11weVxFNMlSjuj9NsjVAGNqB6wso/JvVbDYOQtvJVuQi68jHwjZrELdrxbaGDvGdqe
         jPHPlAOCTQLVaJVxv0MFX4yZ4/vyzaIAKo3DhTPZRK5WvbORzjPyHFcacJnMcPiEGLyk
         OPLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791633361; x=1792238161;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RPzRZvC6M3eYrQVDkjYe0kKV8YaVNewsubnx0uw/yuw=;
        b=DvO67OsZLgPwWOhrVR2Wkg6zdP+tW5yiP7PokGM3ktOASOqENLpvR6Q19FJg32WnZN
         7c/CNkNVR13BEYvPIjL/1wWG+uWdzRI05m6j//JT7BVv+kNRhbCJQ0fGjEAWfUHB+CYq
         25eNOgEKWlLogpBndvzOil5wEt0N56mWfCiJuO4J8yu/6pf9Z44nejVmP1xAtupJeGAl
         fkAw7TBjhH/9e8Vf0AdRG0UItp//FxW5DP331cQjkd7kj5FBF2jyw02o6XDsrPY8xKLe
         VeL49BDYd0wvff+1UZNnSNj4yN8svVXizl4gufjsnuU5T/0j/2Szat0i1wXnCqCRUWkP
         3f+Q==
X-Forwarded-Encrypted: i=1; AKwUvBz3Mat37qgSHAqH+KFDrpaEfKSGUi6kvTu7waH2jUHwSl4r64DLr0PugF4bp4ANFBITcvt7ae7+lErk@vger.kernel.org
X-Gm-Message-State: AFq9FYKftSUxxMQSYB5YU+Fx/9VNutQ0iYe2PY+11PrJKNcDFQIDQsg9
	PaADS2JG2lREJHdftKYdGZdI5SotgMpbVJ3xk9aSu8Ru646u5qrYRBdS
X-Gm-Gg: AYBFou34i7Hk6TMLn2M+Ko21fvj/FHzdgak/EZ5xm2c78zQ+yACRuLSsNNP5W5mL+D6
	asE/CPg+TMUs5JsUla5c/Jy9mT7IJX8QPT8Dnx2xMVq/BcMaHa3geRptlC8gF8cAlKCNig3OPHx
	h3uaJortlH2JoqlfoAQyU0qqy4AbWJK+NOrPt/iPREOP9SIWe+C9wRE/Ny61sRQWW7t0L3u9m9I
	omreuS8sCpRvEMW1Tv3XLOADFo/em7+yhwliaVWe5+Ac9Q/CfXnJ/ptJOZoDZndF+iBu7uJbuES
	pMAKinD/SA7i+ySGepp19sDSKwrMc++UYLYGzADJuDptSSxaocewtBHYx1vQwlUNKe1MLrSU5XG
	fPz8bxm6a4+xew002Qn/1cyqqlgGedWBjCupZ/wRFgNas/9/7zckMyvRtI9ELFKC1bf7BH7b0Kg
	XLbMnh4D1ejHt4fd3mdK0OjS6oeh1w1/KIBKJbGyl4IU2qVZCR9BZBDB/y8qNO/ww5vw==
X-Received: by 2002:a05:6000:4310:b0:48a:f1fb:e165 with SMTP id ffacd0b85a97d-48dbaae39e0mr7896198f8f.21.1791633360918;
        Sat, 10 Oct 2026 04:56:00 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9aca657sm8746340f8f.43.2026.10.10.04.55.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 04:56:00 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Fabien Parent <fparent@baylibre.com>,
	CK Hu <ck.hu@mediatek.com>,
	chunhui dai <chunhui.dai@mediatek.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 3/7] clk: mediatek: mt8167: Map apmixedsys iomem as shared
Date: Sat, 10 Oct 2026 13:54:03 +0200
Message-ID: <20261010115539.9237-4-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261010115539.9237-1-l.scorcia@gmail.com>
References: <20261010115539.9237-1-l.scorcia@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The hdmi_phy for mt8167 and the apmixedsys clocks share the same IO
memory region and they both map it using devm_platform_ioremap_resource,
which implies exclusive access. Switch the apmixedsys driver to of_iomap,
like it is done in the mt8173-apmixedsys driver. Also, implement the
remove function while we're at it.

Fixes the following runtime error:
hdmi-phy: error -EBUSY: can't request region for resource
[mem 0x10018300-0x1001831f]

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 drivers/clk/mediatek/clk-mt8167-apmixedsys.c | 24 ++++++++++++++++----
 1 file changed, 20 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt8167-apmixedsys.c b/drivers/clk/mediatek/clk-mt8167-apmixedsys.c
index fb6c21bbeef8..3e8611991de7 100644
--- a/drivers/clk/mediatek/clk-mt8167-apmixedsys.c
+++ b/drivers/clk/mediatek/clk-mt8167-apmixedsys.c
@@ -8,6 +8,7 @@
 #include <dt-bindings/clock/mt8167-clk.h>
 #include <linux/clk.h>
 #include <linux/of.h>
+#include <linux/of_address.h>
 #include <linux/platform_device.h>
 
 #include "clk-pll.h"
@@ -97,17 +98,19 @@ static int clk_mt8167_apmixed_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	int ret;
 
-	base = devm_platform_ioremap_resource(pdev, 0);
+	base = of_iomap(node, 0);
 	if (IS_ERR(base))
 		return PTR_ERR(base);
 
 	clk_data = mtk_devm_alloc_clk_data(dev, MT8167_CLK_APMIXED_NR_CLK);
-	if (!clk_data)
-		return -ENOMEM;
+	if (IS_ERR_OR_NULL(clk_data)) {
+		ret = -ENOMEM;
+		goto unmap_io;
+	}
 
 	ret = mtk_clk_register_plls(dev, plls, ARRAY_SIZE(plls), clk_data);
 	if (ret)
-		return ret;
+		goto unmap_io;
 
 	ret = mtk_clk_register_dividers(dev, adj_divs, ARRAY_SIZE(adj_divs), base,
 					&mt8167_apmixed_clk_lock, clk_data);
@@ -124,10 +127,22 @@ static int clk_mt8167_apmixed_probe(struct platform_device *pdev)
 	mtk_clk_unregister_dividers(adj_divs, ARRAY_SIZE(adj_divs), clk_data);
 unregister_plls:
 	mtk_clk_unregister_plls(plls, ARRAY_SIZE(plls), clk_data);
+unmap_io:
+	iounmap(base);
 
 	return ret;
 }
 
+static void clk_mt8167_apmixed_remove(struct platform_device *pdev)
+{
+	struct device_node *node = pdev->dev.of_node;
+	struct clk_hw_onecell_data *clk_data = platform_get_drvdata(pdev);
+
+	of_clk_del_provider(node);
+	mtk_clk_unregister_dividers(adj_divs, ARRAY_SIZE(adj_divs), clk_data);
+	mtk_clk_unregister_plls(plls, ARRAY_SIZE(plls), clk_data);
+}
+
 static const struct of_device_id of_match_clk_mt8167_apmixed[] = {
 	{ .compatible = "mediatek,mt8167-apmixedsys" },
 	{ /* sentinel */ }
@@ -136,6 +151,7 @@ MODULE_DEVICE_TABLE(of, of_match_clk_mt8167_apmixed);
 
 static struct platform_driver clk_mt8167_apmixed_drv = {
 	.probe = clk_mt8167_apmixed_probe,
+	.remove = clk_mt8167_apmixed_remove,
 	.driver = {
 		.name = "clk-mt8167-apmixed",
 		.of_match_table = of_match_clk_mt8167_apmixed,
-- 
2.43.0

