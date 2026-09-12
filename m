Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3CB947A87A
	for <devicetree@vger.kernel.org>; Sat, 12 Sep 2026 12:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789216112; cv=none; b=oQFNIsOAjw/SEMDw8yBKUTJjwJuMlurpySn7whdL131sZxK+NVJ5C0+tg3Vyh5enpkt23WkZYdjy+wApyI5eCVNmctnUwuZm4h16thN7P2eq8er828X/GRfF3VWzYtqkHuGrVRzWzWE6db7Ps4FY0JLlDxtDFIfi3VcLl/jKCfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789216112; c=relaxed/simple;
	bh=yz6bckSpPK+mT3wOAvuYtNvVu5X2DaRSd2H64HUk4Tw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=huk+e0FOUL6eoCgV7nhVV8hwDR2tDdlWnWcE02T5/oh6/wtK3Vo830/P+jGO103bOnF62Cey2vgilhbBFLGHwCsoKNYUngiOdAoNhdHfw87QOPGrrCupgRpdiT/SbkgioVdgN/TxpLguCPbo/ZcGtgMH+IdIyFo96h4vFpNzZ5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d9EYzk9N; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d9EYzk9N"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc1cea50db3so214262a12.1
        for <devicetree@vger.kernel.org>; Sat, 12 Sep 2026 05:28:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789216109; x=1789820909; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B3nhmvqGa2kNf07F150Q8CjjmWkxjneDBxSr089YGCY=;
        b=d9EYzk9Nb8wfT/6U8/F+ueLS+UyUPUU0LVB46HPlSq4xKXbWD5LqEwwSMOJjch5w52
         58CdMhG7RmggzxCm+mTKfkYzPRXLPIL8w91Gq4BTq9yjrsFc50H7KFNIMJ9VCT1u6QT7
         Utbo20p7/QnbefYz4qwPrbQCfiPhRkxbg88+UIbCkwEt/MSkfpdR6M9Zvjq4xufYEv0m
         YBAc/g3Z7e272RWF5vsO2PPyfwdz1ylQ8dyMsV9dXUhLWblA+PtJbQ4QqoLBMnK8at/r
         pyg1GVpVkW9DOyUYxFdb9ZJqU0wPUspqURUns+U/wj/RKwOTg9h18m5nL0awKCbgaHC8
         Q8Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789216109; x=1789820909;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B3nhmvqGa2kNf07F150Q8CjjmWkxjneDBxSr089YGCY=;
        b=MwT4Ncff7acWqfhxhpQ3UOhm22zLBuUAwoiFvSb1vtUvUCqiCwtijwTDArI3pJz+3U
         3EiN5RUnv4HobBGh5EErZgUvjqsC3c93C+Im6OtftzpuZ1BL8x2aYWW0gMApGZ71Kthz
         sp2Tsy03TNdGbkNrVkU7I0CtY3i+hTpfGeCVD7xEjms8Ny+aQNSAals/d26KfwYW8Qsj
         uKBe04l99Nq9Khg+KoEXz5ZZ8URTRKzGuMakrYeqpbpzuLHaE7AeDhqIvHzZh9YUrBRA
         HZ3MqixjorNyaGCtYToZ6AFYrhDVGFatQ0bWyT6QBDTlSSsxoZe3D/I7vWwGTxBjjSIs
         wb1g==
X-Forwarded-Encrypted: i=1; AKwUvBwju30wVUiWE1bKf7ldbHx7ASaOridPt3Ssdi7xCrT+HI1nSEedtVgb3Q/zMWuls+v4SFnvbBmkN2Zk@vger.kernel.org
X-Gm-Message-State: AFuF++nln0kNt0ew08g2SX1YhEO9maOPXW06oZmrCJVZHsPr9LQnKctd
	UtuhpdCI9EjrXs4+UCfCU4+GFRYsIu9mQUcvWo6LKZ0HRsE2mGB1M3DU
X-Gm-Gg: AYBFou2TkijUZJtQZ7kpJVrLXsB+Mex2Ki8qun8mPD9sXlhGIng+dbR6HhvbxF2hNsw
	KLbM1LT6uGUVbYb80KFw22RRnij5oJtXrxbGYp70RNNxSU4i6GQHNZwEYvdkj+EGXS43LCPFAAN
	iH9ZRxkf69YATGdz2Xb55rIWO7FqwptjDBdk8lQrS+P1THXnRULfe7L7g+q/YzwwZJKI7QxXnWa
	8bDJwPf8VW2SHXHi5E8A3maB68B7YylE0/SzT+H2D2reO/XDTDrUVLdDSyosQZqLp4aP3udWakV
	HlLQKCBUZ10g0QUS4tno5laVSuwiFsS0nHcPk9EOwbUDaCgDzhMRTej+u8NqrzCRI4j92vNK1jP
	Bt8+yeY3+ze/i+1bvvBCgo8JtC63XWJyzKS6JHFwFQy7yilHX7vgM89ew2yOfjqgn6cw6/vulN3
	HKx9QPZ6AV3MzQPU0wHr0kOh9Jg2IU3DsLUKmZzJfry0jCaX1D7xitF7c1MX9aT6k=
X-Received: by 2002:a05:6a21:a98:b0:3d3:ad3c:49a6 with SMTP id adf61e73a8af0-3db0e41e8bemr4637386637.20.1789216109248;
        Sat, 12 Sep 2026 05:28:29 -0700 (PDT)
Received: from [127.0.0.2] ([2404:c0:701d:4e35:aab7:8c01:68f1:4912])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc4c65b1a63sm2512427a12.31.2026.09.12.05.28.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 05:28:28 -0700 (PDT)
From: Reza Kurniawan <imkyufie@gmail.com>
Date: Sat, 12 Sep 2026 12:27:33 +0000
Subject: [PATCH 1/2] power: supply: bq256xx: Expose VBUS state through
 extcon
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260912-riva-usb-v1-1-0acd5cf8c62a@gmail.com>
References: <20260912-riva-usb-v1-0-0acd5cf8c62a@gmail.com>
In-Reply-To: <20260912-riva-usb-v1-0-0acd5cf8c62a@gmail.com>
To: Sebastian Reichel <sre@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 Reza Kurniawan <imkyufie@gmail.com>
X-Mailer: b4 0.15.2

Useful for USB controllers needing to sense VBUS state changes. This is
needed for devices like Xiaomi Redmi 5A (riva) that doesn't have its VBUS
session comparator wired directly to the USB connector pin to automatically
enable certain USB functions upon the presence of a USB power input.

Signed-off-by: Reza Kurniawan <imkyufie@gmail.com>
---
 drivers/power/supply/bq256xx_charger.c | 88 ++++++++++++++++++++++++++++++----
 1 file changed, 80 insertions(+), 8 deletions(-)

diff --git a/drivers/power/supply/bq256xx_charger.c b/drivers/power/supply/bq256xx_charger.c
index 4b1f81b1e..46b036be3 100644
--- a/drivers/power/supply/bq256xx_charger.c
+++ b/drivers/power/supply/bq256xx_charger.c
@@ -16,6 +16,7 @@
 #include <linux/moduleparam.h>
 #include <linux/slab.h>
 #include <linux/acpi.h>
+#include <linux/extcon-provider.h>
 
 #define BQ256XX_MANUFACTURER "Texas Instruments"
 
@@ -209,6 +210,7 @@ enum bq256xx_id {
  * @client: i2c client structure
  * @regmap: register map structure
  * @dev: device structure
+ * @edev: extcon device registered to report vbus state changes
  * @charger: power supply registered for the charger
  * @battery: power supply registered for the battery
  * @lock: mutex lock structure
@@ -229,6 +231,7 @@ enum bq256xx_id {
 struct bq256xx_device {
 	struct i2c_client *client;
 	struct device *dev;
+	struct extcon_dev *edev;
 	struct power_supply *charger;
 	struct power_supply *battery;
 	struct mutex lock;
@@ -1164,8 +1167,14 @@ static int bq256xx_get_charger_property(struct power_supply *psy,
 	return ret;
 }
 
-static bool bq256xx_state_changed(struct bq256xx_device *bq,
-				  struct bq256xx_state *new_state)
+enum bq256xx_state_change {
+	CHANGED_NONE,
+	CHANGED_VBUS,
+	CHANGED_OTHER
+};
+
+static enum bq256xx_state_change bq256xx_state_changed(struct bq256xx_device *bq,
+						       struct bq256xx_state *new_state)
 {
 	struct bq256xx_state old_state;
 
@@ -1173,27 +1182,50 @@ static bool bq256xx_state_changed(struct bq256xx_device *bq,
 	old_state = bq->state;
 	mutex_unlock(&bq->lock);
 
-	return memcmp(&old_state, new_state, sizeof(struct bq256xx_state)) != 0;
+	if (new_state->online != old_state.online)
+		return CHANGED_VBUS;
+
+	if (memcmp(&old_state, new_state, sizeof(struct bq256xx_state)) != 0)
+		return CHANGED_OTHER;
+
+	return CHANGED_NONE;
+}
+
+static void bq256xx_extcon_update(struct bq256xx_device *bq, bool online)
+{
+	int ret;
+
+	ret = extcon_set_state_sync(bq->edev, EXTCON_USB, online);
+	if (ret)
+		dev_err(bq->dev, "Failed to update extcon state: %d\n", ret);
 }
 
 static irqreturn_t bq256xx_irq_handler_thread(int irq, void *private)
 {
 	struct bq256xx_device *bq = private;
 	struct bq256xx_state state;
+	enum bq256xx_state_change changed;
 	int ret;
 
 	ret = bq256xx_get_state(bq, &state);
 	if (ret < 0)
 		goto irq_out;
 
-	if (!bq256xx_state_changed(bq, &state))
+	changed = bq256xx_state_changed(bq, &state);
+	switch (changed) {
+	case CHANGED_NONE:
 		goto irq_out;
 
-	mutex_lock(&bq->lock);
-	bq->state = state;
-	mutex_unlock(&bq->lock);
+	case CHANGED_VBUS:
+		bq256xx_extcon_update(bq, state.online);
+		fallthrough;
+	case CHANGED_OTHER:
+		mutex_lock(&bq->lock);
+		bq->state = state;
+		mutex_unlock(&bq->lock);
 
-	power_supply_changed(bq->charger);
+		power_supply_changed(bq->charger);
+	}
 
 irq_out:
 	return IRQ_HANDLED;
@@ -1554,6 +1586,40 @@ static int bq256xx_power_supply_init(struct bq256xx_device *bq,
 	return 0;
 }
 
+static const unsigned int bq256xx_usb_extcon_cable[] = {
+	EXTCON_USB,
+	EXTCON_NONE,
+};
+
+static int bq256xx_extcon_init(struct bq256xx_device *bq)
+{
+	unsigned int charger_status_0;
+	int ret;
+
+	bq->edev = devm_extcon_dev_allocate(bq->dev, bq256xx_usb_extcon_cable);
+	if (IS_ERR(bq->edev)) {
+		dev_err(bq->dev, "Failed to allocate extcon device\n");
+		return PTR_ERR(bq->edev);
+	}
+
+	ret = devm_extcon_dev_register(bq->dev, bq->edev);
+	if (ret < 0) {
+		dev_err(bq->dev, "Failed to register extcon device\n");
+		return ret;
+	}
+
+	ret = regmap_read(bq->regmap, BQ256XX_CHARGER_STATUS_0,
+			  &charger_status_0);
+	if (ret) {
+		dev_err(bq->dev, "Failed to read charger status\n");
+		return ret;
+	}
+
+	bq256xx_extcon_update(bq, !!(charger_status_0 & BQ256XX_PG_STAT_MASK));
+
+	return 0;
+}
+
 static int bq256xx_hw_init(struct bq256xx_device *bq)
 {
 	struct power_supply_battery_info *bat_info;
@@ -1743,6 +1809,12 @@ static int bq256xx_probe(struct i2c_client *client)
 	if (!IS_ERR_OR_NULL(bq->usb3_phy))
 		usb_register_notifier(bq->usb3_phy, &bq->usb_nb);
 
+	ret = bq256xx_extcon_init(bq);
+	if (ret) {
+		dev_err(dev, "Failed to register extcon device\n");
+		return ret;
+	}
+
 	if (client->irq) {
 		ret = devm_request_threaded_irq(dev, client->irq, NULL,
 						bq256xx_irq_handler_thread,

-- 
2.55.0

