Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C81A646EC8B
	for <devicetree@vger.kernel.org>; Tue,  1 Sep 2026 07:50:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788249005; cv=none; b=s9XFHxb/jvev6K/kELYQzZyhEMRRfGQnJn9rmuPsRpxKLdamCWlJe32qE/RuHQ6WMk21dopq/E23zcRVGsqhBQqSWGbXN5olDTsRf6NsnZ0WGi7PL9xYCUHlbWTO0t1ff7/BA4W10WwTDGkvp11QWFe/xTpCLLYYAF5QVc09w6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788249005; c=relaxed/simple;
	bh=KSh5c40N/ncjUkxNS2dUoSiZ9wDsl5oOe77nz1eIIdQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TbV+TetSmmkXrfBhjtAlvOP4sQRb1sw43Y+paQ7juuRvz5cM5yu5HdEa1IrRmbcsKZBVuTQd/a6Wex6GeMrB8ardE/jVZ6rLMEdV7Mi/QM+CxZTzFiFMyaik9iTx7Ud6TI/DFMML69Zm01+n3hBwgjAHioSxBaaF6Tcv6UaXGTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Lq846xDp; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Lq846xDp"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2d7200b2e15so47414935ad.3
        for <devicetree@vger.kernel.org>; Tue, 01 Sep 2026 00:50:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1788249001; x=1788853801; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wJzWbza2zag3QhFxPq/teShXqDf76npySrhO2+9Jdis=;
        b=Lq846xDp2aXhMzO0BQBk2BNWZI23Zq2slbPd+5IkCZNq59bQxrB1RfACIKZaPBzzoE
         7LeWfaoFDZW0aL0f6gq6AIjS5ZIJX1FYRrBjDf5VpyRADYTZNYCuQPPJhWyzanlDJfkh
         gE89DdoSmckyYlvPRmQWRk4B/75Im9he7yJcM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788249001; x=1788853801;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wJzWbza2zag3QhFxPq/teShXqDf76npySrhO2+9Jdis=;
        b=bZV/Vz5XS7KDyVJQxjoudT8yL02uJZaYVP7iKYsOoXA3U1FhoP7KBZXuiSwWIWPPW0
         LhVARJTVhGnjEp/7Fl0xrBSBfj/Xc4qkgehnBtfNdBBakSPRy5ZfAR270TJ3US3O75fX
         TtGPT/+IOCMKSwrQca4Sd9sA+KPGP/LlEPrpaosaqT/q7pqbO/j+TbO4FuFQXaCpARFy
         B24uymXFq2OJTZVD/+UYPj/9i2nxWg+AybUtAHQQI/LHT1xBnK1c4Osl/6N3HQ8/4Qhu
         DKW42pIGBhyk6fc813BxBzDfafTbxRSE/Cw3imCLJurnreRhQruNK+RFKUeHeMA9Q5D7
         7NZA==
X-Forwarded-Encrypted: i=1; AKwUvBy4JBEnO7L5UwBoQXF/LoKywrc3iN8KHtVIZRuUyZWJ0XJK8oOd/dm86ECwx+FFOLQGF/ZEXfmkAp4y@vger.kernel.org
X-Gm-Message-State: AFuF++k4vDrHYtma95d7rHZLk5vAwzrrzaW8kClws53g4PgBN17s50rl
	aPA64ud3DacitFiiF5qCmHAvPSd9D1ZbK/1e34ww/H4I2O320d326jtzeOdYoHYkPw==
X-Gm-Gg: AYBFou2o47eVCruqnI2Zt21bXY1F0/ZyaBGi5VL5nsnw1vJzjxEBC9apO1wFl2DYHOB
	pVucRhBi79qLEFX0mULBu3ar5kiUz6FVik8lc9csc4PG9SJBrTVZ74l8g1iDuYUzvuEMm3ZTsns
	lMQicKk1rcK6vyXzwI9Jetklf+6wxGMC7ZoOO5g5mztoWbA8OWTqzHDthOYYec1f4qx1aD30410
	2nPEfod8TV8bNCsUe5ZylkEHRu6vifTAAu7HHP9UYlsiBOJBIC8sXOR7j6rWuRhUdfJDMp8oDgW
	MKOQ9retsNVrswhBYCmm10COj2dFsuMsTIf3y5L+0BkUy7s40aNYaBLW51bAJB0Y6pkGu+zLNVV
	+zimXC//QC0e2BDLtgwqfr9X/lefghNbXtCYRY+PRr8Q3Mk73hcyNvdbfE8Ggets7s/fircL/da
	8ud1S5IprYBK9WLdW/c6WE5vtkQWlbhaiEs+CFHywGqhK0Bt+WhYu9PR17Q8VWkSZVKGom9dOag
	54sGa0q+GraV8tGd0cu1xaiV7ooWbA5w+eH+otLNOPLMg==
X-Received: by 2002:a17:903:3d0e:b0:2d8:d4d7:f055 with SMTP id d9443c01a7336-2d94a930d44mr91456335ad.22.1788249000970;
        Tue, 01 Sep 2026 00:50:00 -0700 (PDT)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:201d:8:8cf:6df0:9c4e:f5e1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d75988b699sm48142515ad.59.2026.09.01.00.49.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 00:50:00 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Jiri Kosina <jikos@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	chrome-platform@lists.linux.dev,
	linux-input@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 3/8] HID: i2c-hid-of: skip post-power-on delay if powered on sufficiently long
Date: Tue,  1 Sep 2026 15:49:21 +0800
Message-ID: <20260901074930.764550-4-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.897.gb25b4bd76c-goog
In-Reply-To: <20260901074930.764550-1-wenst@chromium.org>
References: <20260901074930.764550-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On some devices the HID device is powered from an always-on power rail,
or the power rail has been left on by either POR defaults or the
bootloader. By the time the driver probes, the device most certainly
has finished initializing. There is no need for the delay.

In such designs, the system integrators tend to work around the delay
to avoid the boot time penalty by simply omitting it from the device
tree. This is undesired, as the device tree is not fully describing
the hardware.

Switch to the new regulator_bulk_enable_and_wait() function that makes
sure a certain amount of time has passed since the regulator supplies
were actually enabled.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v2:
- Switched to new regulator_bulk_enable_and_wait() API
---
 drivers/hid/i2c-hid/i2c-hid-of.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/hid/i2c-hid/i2c-hid-of.c b/drivers/hid/i2c-hid/i2c-hid-of.c
index 59393d71ddb9..fdaad451e710 100644
--- a/drivers/hid/i2c-hid/i2c-hid-of.c
+++ b/drivers/hid/i2c-hid/i2c-hid-of.c
@@ -29,6 +29,7 @@
 #include <linux/of.h>
 #include <linux/pm.h>
 #include <linux/regulator/consumer.h>
+#include <linux/time.h>
 
 #include "i2c-hid.h"
 
@@ -48,16 +49,14 @@ static int i2c_hid_of_power_up(struct i2chid_ops *ops)
 	struct device *dev = &ihid_of->client->dev;
 	int ret;
 
-	ret = regulator_bulk_enable(ARRAY_SIZE(ihid_of->supplies),
-				    ihid_of->supplies);
+	ret = regulator_bulk_enable_and_wait(ARRAY_SIZE(ihid_of->supplies),
+					     ihid_of->supplies,
+					     ihid_of->post_power_delay_ms * USEC_PER_MSEC);
 	if (ret) {
 		dev_warn(dev, "Failed to enable supplies: %d\n", ret);
 		return ret;
 	}
 
-	if (ihid_of->post_power_delay_ms)
-		msleep(ihid_of->post_power_delay_ms);
-
 	gpiod_set_value_cansleep(ihid_of->reset_gpio, 0);
 	if (ihid_of->post_reset_delay_ms)
 		msleep(ihid_of->post_reset_delay_ms);
-- 
2.55.0.897.gb25b4bd76c-goog

