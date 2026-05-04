Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97D0824A078
	for <devicetree@vger.kernel.org>; Mon,  4 May 2026 05:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777871021; cv=none; b=nk0TxDPcB9b2GV+UFn5Pvewkhcrcb6IBsVpRyN/0BhPrACRMzh9Va4kVP77wVLlerthi3FrGebknjhWimf6VnJdo/ReS18mkb+QvV9lbGQj3o3PsA0ke7+jJk+2edQjGARJ8YNMEu+XjVzjeMKtq43z2mOLgODRHmdkBAHcxVE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777871021; c=relaxed/simple;
	bh=2TFX3CXq6/rmxkKsrdpy4I6/+x+PNEWuxGgifaViL0U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cfb/+V5TNp4MlXJizs5Pa5JCb7wblIFQFRmx07lEn2HuktLPgi0OZ0nydbyrNdwSfeqtWitJnosjSu9Oe3azmVL4rYJzqrK+hZrDNP8dFQQpjpTP7jfwOCWAT1jJ/kMxkKBEsLvejb1iCJYKfKH/7Nz8DVzCS39Xo46qZkhdhPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=esh3epTG; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="esh3epTG"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-364ff382b0bso2335723a91.2
        for <devicetree@vger.kernel.org>; Sun, 03 May 2026 22:03:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777871020; x=1778475820; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tCX5Iqac13O3XfLY0RNkBX2Gq9jD0l1ObowJKbWU4OM=;
        b=esh3epTGDpOuzQ45KdAeKPOM3vsP4ueVSpVV19Rpm//sUFPS5v4JsOCYWaVsvgxEy0
         tcedw8gqku/TS8OpTQEbUxDATIMkHp4hQHrTJY4k74BnQbE5lm47m+v67WuGgp463129
         v5+GclCgcGuXb4SLx/RSQ8LiryM0V97J80Y6q+0DS4d9SvDxiakTLsqIFudZBvSSSkt2
         Bsab4neJUalaHGjAdzqW+Rew5t8bYn1exOKTwUcnA3CuXLVX87WIk4YgO7nRf9u3KK89
         G/imQxGXbK4r+5/Bb7ms9VwIwCZy0IBA2T/J/ZcCVk9MH1g/Z293BQwJx+7PduePi7qI
         S5vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777871020; x=1778475820;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tCX5Iqac13O3XfLY0RNkBX2Gq9jD0l1ObowJKbWU4OM=;
        b=QQGFgXj7pQ0rtkHRdSeCgGD/QDIBmN8akGGnMDXCDZBnu7vK8fpgYAUZF7v8ub1UiO
         9NXHsXmq+72bngSxVdZ0eA6pBMY+T5CHYNJsdMDEkKimtul81NCz8Vfc/5LLkjavjhHB
         RYqsK22wYP8qNV+qBpnWVRRgYCuUvVzLw4oARuhyaz9jxwXGocgssR1YHwMNLi3AkyIi
         wSYz7oD8fbcN23vwj7grmuoW6/pacZ/1zascY2D5nXn8SEGTPSwXll35k5RS+mas3yOE
         fNbiao4tWWrOHlwBfqZWu9/Utl3asEWmKnkBx9w7rYp3/mx3NlwBlYkqlrCcEaW+yiLb
         B8NQ==
X-Forwarded-Encrypted: i=1; AFNElJ/L+5ihFx49mPohgyoiUUACcQLqVeaTXnTKAkFZejdgs7pylVNejzT/mMavxTqAmx9bymvnL4UNn1yN@vger.kernel.org
X-Gm-Message-State: AOJu0YwP2YEbZ3FNlScWRpcHvuJUpa/ThmUlHxsYPFgiR6wu71uoaSc6
	brO/PMUZJThz7eKxe53lIuI7KauhLcnE96NVo2HgoP8qU+uygrbOpygT
X-Gm-Gg: AeBDietrpmkbiY/m/xn166CLFYRNfPJiC6IwedSBKkjDsertC0xDiqtq1901vERtegi
	GGBXsDkbBKFBczUg3wM1yikdnk/8omaJxBFqHQ00BfGJ0Wsv3ntmMp5O3vlmFQij9z1Zc+Hx0Ix
	1cGEDVvhepvK1pWkNE1JUJNY0sIbmerVlx0dUyo0lpqJ0wMc3MqmLC5MSgB9i2A0YXU74W/nb8W
	XoqsxkbiETvt0TO5cmhuwiqpKjAlqHG4oVzBrJszLY/Hee0td4dXB9JHBjF1ICEQ3aVYBaBWg5o
	6us05g+x1pECEUpKXLBg9icY87F797JoN7upBNYAbXSrqox3UopAoTjpdBoTNq8fXeZI74aUcd6
	YvFyNG2Hk5U/jzjGtLd9dhbf3medn/J7Nq61pitEjH4Lvo8aCYt7SICE+zgkEw4q6l4E49YYV2Z
	cGBMMVX9WLBRXO
X-Received: by 2002:a17:90b:3b4f:b0:35e:3e86:e2d1 with SMTP id 98e67ed59e1d1-3650cdbaa39mr8265243a91.7.1777871019885;
        Sun, 03 May 2026 22:03:39 -0700 (PDT)
Received: from archlinux ([2605:e440:15::152])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-365437b50b0sm2662908a91.0.2026.05.03.22.03.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2026 22:03:39 -0700 (PDT)
From: Mikhail Kalashnikov <iuncuim@gmail.com>
To: Vasily Khoruzhick <anarsoul@gmail.com>,
	Yangtao Li <tiny.windzz@gmail.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/5] thermal/drivers/sun8i: replace devm_reset_control_get  to devm_reset_control_get_shared_deasserted
Date: Mon,  4 May 2026 13:02:42 +0800
Message-ID: <20260504050245.646078-3-iuncuim@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260504050245.646078-1-iuncuim@gmail.com>
References: <20260504050245.646078-1-iuncuim@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The A523 processor has two temperature controllers, but they share a
common reset line. Make it shared with the shared variant of
devm_reset_control_get(), and also simplify the driver by switching to
devm_reset_control_get_shared_deasserted().

Signed-off-by: Mikhail Kalashnikov <iuncuim@gmail.com>
Reviewed-by: Chen-Yu Tsai <wens@csie.org>
---
 drivers/thermal/sun8i_thermal.c | 16 +---------------
 1 file changed, 1 insertion(+), 15 deletions(-)

diff --git a/drivers/thermal/sun8i_thermal.c b/drivers/thermal/sun8i_thermal.c
index 226747906..df0c26970 100644
--- a/drivers/thermal/sun8i_thermal.c
+++ b/drivers/thermal/sun8i_thermal.c
@@ -342,11 +342,6 @@ static int sun8i_ths_calibrate(struct ths_device *tmdev)
 	return ret;
 }
 
-static void sun8i_ths_reset_control_assert(void *data)
-{
-	reset_control_assert(data);
-}
-
 static struct regmap *sun8i_ths_get_sram_regmap(struct device_node *node)
 {
 	struct platform_device *sram_pdev;
@@ -389,19 +384,10 @@ static int sun8i_ths_resource_init(struct ths_device *tmdev)
 		return PTR_ERR(tmdev->regmap);
 
 	if (tmdev->chip->has_bus_clk_reset) {
-		tmdev->reset = devm_reset_control_get(dev, NULL);
+		tmdev->reset = devm_reset_control_get_shared_deasserted(dev, NULL);
 		if (IS_ERR(tmdev->reset))
 			return PTR_ERR(tmdev->reset);
 
-		ret = reset_control_deassert(tmdev->reset);
-		if (ret)
-			return ret;
-
-		ret = devm_add_action_or_reset(dev, sun8i_ths_reset_control_assert,
-					       tmdev->reset);
-		if (ret)
-			return ret;
-
 		tmdev->bus_clk = devm_clk_get_enabled(&pdev->dev, "bus");
 		if (IS_ERR(tmdev->bus_clk))
 			return PTR_ERR(tmdev->bus_clk);
-- 
2.54.0

