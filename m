Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 490963672AC
	for <devicetree@vger.kernel.org>; Sun, 12 Jul 2026 02:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783822399; cv=none; b=pSrTrmE0f10qdxGYNMLxNY7MYsz3g0CoWmN0IQO+yFgX1iqR4wrwgF8GsEQCv+MTt0AEaabOejpWj8Y3YayPt+FEGLWvkZuJgguiclmsMDw9gt9eZy1LwezDah6St6Yr7cj8zwXPGjR5bgxESZWo1/bXTgCYlqQy8kqP/PbKs3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783822399; c=relaxed/simple;
	bh=eq12R7NB8g3dejJk3OC3R9HbUZCictTcSDAGjAXeTbg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DNzJnFROWVR4ldF9Gsq4b72hj3P33Bxyy9LpyBintrYcSNm4Cwn0bJScK6x/zcTr+NEd2i31094umJGXRE0+wq2vf4ZP+RhyQ1+SFXXqtXvOieFPVT5R7tLGpKI7ZgrjI7J65odGiZCOg/a0yy5GfhnFfOuEBfWlPZGaRudRUng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VnymHQC1; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VnymHQC1"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-381ed661712so2550315a91.2
        for <devicetree@vger.kernel.org>; Sat, 11 Jul 2026 19:13:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783822393; x=1784427193; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qnUG3JskAqM/JfRrK06JJsIVlYwHJ11zw3wV0jbg0eU=;
        b=VnymHQC1/GvrV99w5LqAdZD7lX1dTHrXdJ7A2gPFkzJUo0ZKkH0qlDJyZsejLt0fmN
         QqekvZLdlAJywHierQWTZ16XxJhA7WC/yzaiCt/FrS2J3O1PIScSatfzDgDhTg8R/wEt
         87XFGFmSlL35BrfT5GiAr62pnK+ImiPno8JEU1KsFu0xcoxE2DsKsLVEo+L15wh424nD
         ZwRXoBVM343Jb8UVngyhfCHvQ4Eap8CQj1u7wHYd/gHU+eZxEZh4aVvSlY35E9KLtEbD
         jYRm7dybVQQXq6qmLQQbDmeoWqe/2YrmdFgx/aqclHqElSLurn+LXC20UualzWL5ecih
         z9eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783822393; x=1784427193;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qnUG3JskAqM/JfRrK06JJsIVlYwHJ11zw3wV0jbg0eU=;
        b=GcBgHJF+M042T5Kw2bByTsxWic624/Nylm6/4WdM5gNzkv+WeBK3YMJ64PXUUmkjJz
         CuxCMyo+cUGKN53QOo58ITSxlVAdDM9t6CZOe0rcmU6byV2A2aB0+OVc7CacZ5/qYlay
         H1Qn2jXMgDQS9Su+XTiZyJy37IZ7N+63P54srPd7OM+xXElhhrRlXK5kBY/NPmJmnSi6
         RfJS9J332QVAcOWTrNxtwtlDE2n2W7j/pSDUxoeQY3H3pZxP74H3vsAud29Ud+1LOsW8
         FtbhMHI0tI5hhjfcq6ksj6gRbBEMdmPQn6tIJTw1ufZfxpDdmMt9At0W+kUHgvXcxgtc
         CsuQ==
X-Forwarded-Encrypted: i=1; AHgh+RpNHn6U9Jd207yHQV6IUNPwdA5YS2z0xjpJmshAzQeXG2rG5LJiBdtMN2lwdv/F366ResjHnsv+E/sm@vger.kernel.org
X-Gm-Message-State: AOJu0YxyShU0RE8XYRyhT4VRW+ZBhYdtMPiVd0JprHcxHGzYMZDDSpC1
	Y8bHqvfcY+ZQ1B8iSa5oB1hcpyaOHpKlDAimXCj6iEKSRXsOwbsl44AR
X-Gm-Gg: AfdE7cnolABTZhXJ2jislkwCtLE7EF9MfA/WCZxynMedgBe8RZlmGkbd2GKSJm5qjow
	EbqBz11wfO/APRFGgEwDdz8Zo6I3578YkXC6tE4kXbqTxsDZMREb26g6NpJuP6/QEVdKN+0AOj0
	ChFd629waoKC5j3jwesm8+QfC/xgn9RKozJ1UlySXvOmAcScvWoMJPiAThFkFP1iNS2RCB40wkI
	MxkCOIQstr3WgsHWUw9BQ7GkN6gTAaU86fUaoB/3WfdgozcTwKsxCEtBjmXRb7NG5NSpSvCyDl7
	qXqJVfc4YHThLhTmwS/QrG0DL7D/chsyp+agMkpqMJaTJc4onRZEhE/TKPAXmc02cOkfk8gfYAF
	4xQPqjGBbA25BBRM++xSnbnuZnbG+YQKoAVBAXaPqN1rm9cDD6bbeufr+4XZQKeL5z3D4LOKJwZ
	qX66G4GglIa1BO0rUCeGD3LJo0li1wTtLfl33QwRlVWaQ4MgJEi+zMTjhoCSB3WxzIAjSqwNm73
	EU=
X-Received: by 2002:a17:90b:5545:b0:36d:9e0b:3801 with SMTP id 98e67ed59e1d1-38dc74c4a32mr4437207a91.8.1783822393449;
        Sat, 11 Jul 2026 19:13:13 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:c63e:9756:a95c:c75])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3117d847e17sm54796692eec.18.2026.07.11.19.13.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jul 2026 19:13:12 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Sat, 11 Jul 2026 19:12:48 -0700
Subject: [PATCH v3 07/10] mfd: wm831x: support software nodes for DCDC
 regulators
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260711-samsung-kp-v3-7-b2fcaba77aff@gmail.com>
References: <20260711-samsung-kp-v3-0-b2fcaba77aff@gmail.com>
In-Reply-To: <20260711-samsung-kp-v3-0-b2fcaba77aff@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Russell King <linux@armlinux.org.uk>, 
 Mark Brown <broonie@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>, 
 Sam Protsenko <semen.protsenko@linaro.org>, Arnd Bergmann <arnd@arndb.de>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-input@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 patches@opensource.cirrus.com
X-Mailer: b4 0.16-dev-b242f

Allow passing software nodes to wm831x DCDC regulators via PMIC platform
data. This is useful for non-DT/non-ACPI platforms that want to
associate device properties (like DVS GPIOs) with the regulator devices
using software nodes.

We add 'dcdc_swnodes' to the PMIC platform data 'struct wm831x_pdata' and
have the MFD core assign these software nodes to the buckv cells.

Assisted-by: Antigravity:gemini-3.5-flash
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/mfd/wm831x-core.c        | 47 ++++++++++++++++++++++++++++++----------
 include/linux/mfd/wm831x/pdata.h |  2 ++
 2 files changed, 37 insertions(+), 12 deletions(-)

diff --git a/drivers/mfd/wm831x-core.c b/drivers/mfd/wm831x-core.c
index df8e76e000cc..c4793be419ba 100644
--- a/drivers/mfd/wm831x-core.c
+++ b/drivers/mfd/wm831x-core.c
@@ -14,6 +14,7 @@
 #include <linux/delay.h>
 #include <linux/mfd/core.h>
 #include <linux/slab.h>
+#include <linux/string.h>
 #include <linux/err.h>
 
 #include <linux/mfd/wm831x/core.h>
@@ -1449,6 +1450,32 @@ const struct of_device_id wm831x_of_match[] = {
 };
 EXPORT_SYMBOL_GPL(wm831x_of_match);
 
+static int wm831x_add_devices(struct wm831x *wm831x, int wm831x_num,
+			      const struct mfd_cell *cells, int num_cells)
+{
+	struct wm831x_pdata *pdata = &wm831x->pdata;
+	int i;
+
+	struct mfd_cell *local_cells __free(kfree) =
+		kmemdup_array(cells, num_cells, sizeof(*cells), GFP_KERNEL);
+	if (!local_cells)
+		return -ENOMEM;
+
+	for (i = 0; i < num_cells; i++) {
+		struct mfd_cell *cell = &local_cells[i];
+
+		if (strcmp(cell->name, "wm831x-buckv") == 0) {
+			int id = cell->id - 1;
+
+			if (id >= 0 && id < WM831X_MAX_DCDC)
+				cell->swnode = pdata->dcdc_swnodes[id];
+		}
+	}
+
+	return mfd_add_devices(wm831x->dev, wm831x_num, local_cells, num_cells,
+			       NULL, 0, NULL);
+}
+
 /*
  * Instantiate the generic non-control parts of the device.
  */
@@ -1620,15 +1647,13 @@ int wm831x_device_init(struct wm831x *wm831x, int irq)
 	/* The core device is up, instantiate the subdevices. */
 	switch (parent) {
 	case WM8310:
-		ret = mfd_add_devices(wm831x->dev, wm831x_num,
-				      wm8310_devs, ARRAY_SIZE(wm8310_devs),
-				      NULL, 0, NULL);
+		ret = wm831x_add_devices(wm831x, wm831x_num,
+					 wm8310_devs, ARRAY_SIZE(wm8310_devs));
 		break;
 
 	case WM8311:
-		ret = mfd_add_devices(wm831x->dev, wm831x_num,
-				      wm8311_devs, ARRAY_SIZE(wm8311_devs),
-				      NULL, 0, NULL);
+		ret = wm831x_add_devices(wm831x, wm831x_num,
+					 wm8311_devs, ARRAY_SIZE(wm8311_devs));
 		if (!pdata->disable_touch)
 			mfd_add_devices(wm831x->dev, wm831x_num,
 					touch_devs, ARRAY_SIZE(touch_devs),
@@ -1636,9 +1661,8 @@ int wm831x_device_init(struct wm831x *wm831x, int irq)
 		break;
 
 	case WM8312:
-		ret = mfd_add_devices(wm831x->dev, wm831x_num,
-				      wm8312_devs, ARRAY_SIZE(wm8312_devs),
-				      NULL, 0, NULL);
+		ret = wm831x_add_devices(wm831x, wm831x_num,
+					 wm8312_devs, ARRAY_SIZE(wm8312_devs));
 		if (!pdata->disable_touch)
 			mfd_add_devices(wm831x->dev, wm831x_num,
 					touch_devs, ARRAY_SIZE(touch_devs),
@@ -1649,9 +1673,8 @@ int wm831x_device_init(struct wm831x *wm831x, int irq)
 	case WM8321:
 	case WM8325:
 	case WM8326:
-		ret = mfd_add_devices(wm831x->dev, wm831x_num,
-				      wm8320_devs, ARRAY_SIZE(wm8320_devs),
-				      NULL, 0, NULL);
+		ret = wm831x_add_devices(wm831x, wm831x_num,
+					 wm8320_devs, ARRAY_SIZE(wm8320_devs));
 		break;
 
 	default:
diff --git a/include/linux/mfd/wm831x/pdata.h b/include/linux/mfd/wm831x/pdata.h
index 75aa94dadf1c..d5d9d9600756 100644
--- a/include/linux/mfd/wm831x/pdata.h
+++ b/include/linux/mfd/wm831x/pdata.h
@@ -12,6 +12,7 @@
 
 struct wm831x;
 struct regulator_init_data;
+struct software_node;
 
 struct wm831x_backlight_pdata {
 	int isink;     /** ISINK to use, 1 or 2 */
@@ -132,6 +133,7 @@ struct wm831x_pdata {
 	struct wm831x_status_pdata *status[WM831X_MAX_STATUS];
 	/** DCDC1 = 0 and so on */
 	struct regulator_init_data *dcdc[WM831X_MAX_DCDC];
+	const struct software_node *dcdc_swnodes[WM831X_MAX_DCDC];
 	/** EPE1 = 0 and so on */
 	struct regulator_init_data *epe[WM831X_MAX_EPE];
 	/** LDO1 = 0 and so on */

-- 
2.55.0.795.g602f6c329a-goog

