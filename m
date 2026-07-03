Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 773413CC33C
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 11:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783079779; cv=none; b=IOwH5uIqIzBiluYMSl+4waxan88AszXw+sOIcGyq9rHvPVUCC/YPrdoWMgiUxG/d/Niik36zhVXlaUTo5nMDGL6GSke+tRxmErp3ED9fv3gZSV1p4UJ9OcDJH80KMRuo/T7dSQoeonO9M2XrfobVWEdPGpmizrkW/N6NQEkJw0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783079779; c=relaxed/simple;
	bh=V7cOkFeI+SMCrClZ1qRg1vjKvkY61qr7W7O4sv97AZo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NouYrAwSHcCkwTNjh0xeI6Tgwa2/NehMUqFtH6lEUVW963ZfJuKRJHzwpIUQmV2CnN6ieOhgXe+ZNRZV9Zf70prhJgh6ZJ98CmwTmTR1Llu4M3zqNLX8EHJ94q2AiYaP5h/IoU2bVje3O0Al2sETYZMmTDYigglRx1TYZ1yNgwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=M9/h8NgY; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="M9/h8NgY"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-845f2909cd4so318230b3a.1
        for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 04:56:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1783079777; x=1783684577; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W1Qi7K0Q2jUkzExsWzvH+ABdRL+B0DFQxVv+X4n7A58=;
        b=M9/h8NgYWoQ7o2l8ye0lo66sKTlRzgH7BvW2v7lUuHWBX20CMZr/LB5rY3rdXehhd8
         q7h1f+k0/5tlEcjjyIMf1CtTkmA4Bq9IMyyx+YxMrfojokT9fVgHJRpKl8WsCsB5alx2
         Md/u5FHWHKQt2BCTfI5PswF8ifDsLEBK4/q8k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783079777; x=1783684577;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=W1Qi7K0Q2jUkzExsWzvH+ABdRL+B0DFQxVv+X4n7A58=;
        b=FoLzrHMyteETq4jcr9qRXnk0Un7jtuNTbZodQeCGwcmBQezM2rmjvzmIk2i1v6wCQd
         U25QMoquv7zDlA6T4yfIxb4BwWmNKxrlJKBn/ChytRFSCxhrs1oOKu/pUtO1EqAdWfna
         52D09lxkE+ils8odDsC1yEy8w+FpeBLNX1E6X96wtnxW/2MsmyyuEwGHKEg3IwOaXN0n
         LktAfy+Py9CEMsHYjrroGw5a9vW6RciP7bPKBPh6XGOuLmNMCl4DggaeQjqzyd9XPBMB
         lKKlspuXnKJQSJAYy6AQA9d1BlN/qpu6t4plkQizgbGe1KgjiA+QE2IDJFVy4knW6Psk
         hzUw==
X-Forwarded-Encrypted: i=1; AFNElJ9WZoILUJO6ori0FguEqyNn71jQcrIjKxkWc0KTd4q0MJsqr4PhC9S4M/uvtQlvZW5255s+KJw1sK6Q@vger.kernel.org
X-Gm-Message-State: AOJu0YwJRq3ID0/LnsN9zQlzOFMTih5Uk1qOl0i7nidm2gdHbVthJ/5+
	LFnLuTmLOMJa5B7MrLyEfK6HTyL9IiF1yGKVIo/TH55N+AKCOw7vmSLsoAOoP7riag==
X-Gm-Gg: AfdE7cmuZ67vhFB0+jjL8psmsixznh2kavtN6GHQ/jbRpltUzwlpvD06LvtgJysNLMb
	ObgRXKx4tpf7/rwJ39A3BvtiztrtpmdjlQLGSz9dzHa11xeFXuJu8+UnwC9LDyTt+apiGCvCTlJ
	aVm8fw8M0weTyg8jrnRSNH065NXoEyKnHTr3Q00flfRSnjar8faR7SQn4PcZsafEFfX9zKxxgAp
	MxS6v8iA/h4wTJmuOAZgAwgw6DJN/KtIyBqqnuY5cWzwtZg1QppHbFfruIxB5V7ESMsDt9h4MfH
	VW+VtPBQ4AgAzG1JDBOzFOQ7/hNRDl1ITyMWkBzfrBO80J5ig4L/kh6TNjDQYvGGggRIEbBgCIn
	Ybctd/DUzvbn0hbFgmVC+r8U3nfpm5rvVB56VaWuhTxXqJcVg1N+1/IuZfnT+ihsqmPRdtOtATT
	35M+r3OngwGU3pAFZx0qhoqOG8e5j6hG6+Ux6vhumOR7HQI9Dv5otUmDfKgF7xjyt7W0MMWniXo
	J17dGhZ
X-Received: by 2002:a05:6a00:6ca7:b0:845:388b:56f with SMTP id d2e1a72fcca58-847c08956ebmr10321332b3a.40.1783079777502;
        Fri, 03 Jul 2026 04:56:17 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:7bc5:6c83:76cd:cbd6])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c9e8bd30ca5sm2569540a12.0.2026.07.03.04.56.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 04:56:17 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Jiri Kosina <jikos@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	chrome-platform@lists.linux.dev,
	linux-input@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/7] HID: i2c-hid-of: skip post-power-on delay if already powered on
Date: Fri,  3 Jul 2026 19:55:55 +0800
Message-ID: <20260703115601.1323491-3-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.rc0.799.gd6f94ed593-goog
In-Reply-To: <20260703115601.1323491-1-wenst@chromium.org>
References: <20260703115601.1323491-1-wenst@chromium.org>
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

Instead, check if the regulator supplies are all enabled, and skip
the post-power-on delay if that is the case.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/hid/i2c-hid/i2c-hid-of.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/i2c-hid/i2c-hid-of.c b/drivers/hid/i2c-hid/i2c-hid-of.c
index 59393d71ddb9..70afdfb207ac 100644
--- a/drivers/hid/i2c-hid/i2c-hid-of.c
+++ b/drivers/hid/i2c-hid/i2c-hid-of.c
@@ -29,6 +29,7 @@
 #include <linux/of.h>
 #include <linux/pm.h>
 #include <linux/regulator/consumer.h>
+#include <linux/string_choices.h>
 
 #include "i2c-hid.h"
 
@@ -46,8 +47,12 @@ static int i2c_hid_of_power_up(struct i2chid_ops *ops)
 {
 	struct i2c_hid_of *ihid_of = container_of(ops, struct i2c_hid_of, ops);
 	struct device *dev = &ihid_of->client->dev;
+	bool supply_was_enabled = true;
 	int ret;
 
+	for (unsigned int i = 0; i < ARRAY_SIZE(ihid_of->supplies); i++)
+		supply_was_enabled &= regulator_is_enabled(ihid_of->supplies[i].consumer);
+
 	ret = regulator_bulk_enable(ARRAY_SIZE(ihid_of->supplies),
 				    ihid_of->supplies);
 	if (ret) {
@@ -55,7 +60,8 @@ static int i2c_hid_of_power_up(struct i2chid_ops *ops)
 		return ret;
 	}
 
-	if (ihid_of->post_power_delay_ms)
+	dev_dbg(dev, "supply was %s.\n", str_on_off(supply_was_enabled));
+	if (!supply_was_enabled && ihid_of->post_power_delay_ms)
 		msleep(ihid_of->post_power_delay_ms);
 
 	gpiod_set_value_cansleep(ihid_of->reset_gpio, 0);
-- 
2.55.0.rc0.799.gd6f94ed593-goog

