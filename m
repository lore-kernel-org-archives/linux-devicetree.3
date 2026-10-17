Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A5C0447256
	for <devicetree@vger.kernel.org>; Sat, 17 Oct 2026 14:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792246123; cv=none; b=LU2sGYLHi0qS+qMv7uVAvRtGKt/TR5Y13QTTqwEbQUZ4HjLesB7P6VaFKAFnOnm4GpwuSukRIjmGYQclGCtWFnWGyC+iW8rydHEss930SKgwuuY5iEz4Z1UUiKbqRxADZAK2QN3vMOrttr3lML6jQvOvyVWzyJ37rhrcKdZ9I68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792246123; c=relaxed/simple;
	bh=w7lzAcqdMCZEjX4ITQ15nhloMh4seij6PruLBJ3/GZ4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H6NHMTOGnV07r2IqbPt7TvglSN6i/ZIgmo/3uqd0LrdDPPIq4JHDqWkSRl8jyd5rHEA058GD6Xv0zTC1OzU9hm6l4ctFLl9MLUm9PzhnzGNsccJuTcfUxn+eTSXR2qsv9Mwx37nF+uNPTVHdpTtrWOx6g3VBFZ/RsfyU+kjX9kI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZAACPVeN; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZAACPVeN"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4980fe6b3beso11666865e9.0
        for <devicetree@vger.kernel.org>; Sat, 17 Oct 2026 07:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792246120; x=1792850920; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oNxk/T2LUY8i3MRxnTeuyFwAKCAvPmVRbJValg45Ois=;
        b=ZAACPVeNROOevtuQ6g2s/+XgRzVd1/WtEv0nFrcVQ52VOTrt/a8M4Sx5pkk/NknBgd
         ATF17QnX1EjKACdognhiUAoL2KehgUWloo5Y2OpDjJ3MRoxgFWoCC+5QzacdbzC0d0EI
         i4p26Hag3U6R1O4qKISJCV+R3q3NI8sxtbZzD2AdoUf2WHcv19O4HmWgt0Poy0E9eFsm
         xLp3POv0u30hBBQkDp8JT00ze+QacrzO28ApVaSvp2SrfHD0vu4IpkXFBISbi7SZhB7x
         QhxAv/UjL9UQ8MdQAPD+HtAaTkxQguqmRfkNShRqhT0/Rvuyai0mHfZChIHTPH1DQwMw
         WZJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792246120; x=1792850920;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oNxk/T2LUY8i3MRxnTeuyFwAKCAvPmVRbJValg45Ois=;
        b=uuEMp0JSzPd2TduDMLI+jag4uIZRTDZlM2Q7AP2Ld7g1c/sy19GTg2JCb3GtOZvvvy
         NqjIqJrWKzHzfm7YkgQKnfVXOqhhczdiLuqmMguqfOKeRBf/qBCX7/AXDuEsx9S3PjMW
         oHzgg0Uv8dYnFI78MEofnGRlVARpd+HaCZkOsJdhTJVcrBkRQR2IM5FzlayIQUPNl89S
         rx6KBPxSi/7EWm7w9K1kNngZ8NPte5aHVs7rwJG3dRRD9oX47VJWPM1e0GuMjPCs4uqt
         kSUqBmPzJsFBSzAArUTFN3+0IUVK/1Vr6q5kcXr7uXcJpPZdeLVVfx+WkDTsnDE7i9Wp
         xQ8A==
X-Forwarded-Encrypted: i=1; AKwUvByvQe2hoM0IMfm6tucD9dZpKC6Wql2lHR19i1GkG1k+w1aiGl/wMUYP0TlGG+7q2hdL5AOqGvJWapkX@vger.kernel.org
X-Gm-Message-State: AFq9FYJh9gVBXAp8Dm2PDsZnwzpkxqHQ+zJQqUcBcfleeef4bCh6xVMf
	wrpwU5hAtIQmFZvUuQg7f6sDSvrZw7iRYxn9WZidLjZYzPYqPwPWsQkA
X-Gm-Gg: AYBFou2iEBRWWoMVr0FDSZMxa7WbZ4LVzD8oyVWuf9CT12QfrQNFpBV0oDLEcRxKypK
	JFV/eY3PniRFG+IrBps5Hq/LMaL535dxSGKk8hLl0f/+h2pHCGmoHjniOa33dtD/tKEn7wsTr7n
	j00PcBZyQSXv+q03p7t93JphtuRQ95dISZ88tHntxUaNMTi2cvbQ8VdbG0vPCDm6fX2D0Q63up3
	ww4yyj4jYvQNwe7Oy4hGtCxIW5rdNFDij9EQ1wpkd/fCA8vaML3Ci3ErV47rQ3cK3PE9YgrIk+p
	MTPDEUmjWF5Mybivs69LoVoMvFSLs6RmDOSYudtBDu2B25arp1OFZaEoOOy97Q2nJWkCEqibAE4
	344oFoWhyozLvCfjp7BZye8pmNLsUygGwrmliAWLexr/l6rOek7jCV2w0axrPP4HnbdZO35rnnj
	O7gSiu2gadZzYnTDb6nB/v5cKwsW9KNwYZ2SY4Ect6drn6gInydjQhy5HuW4DlnMCcShggylMwX
	uNYlL1xdY+4NWYrcSx4mIX+vsrFkzEIpVGjWRekhRhhE+xA9Q1MsrC9OOiDHqJ2+NVqUoVNP0Uv
	NA==
X-Received: by 2002:a05:600c:8b65:b0:49e:65f2:db64 with SMTP id 5b1f17b1804b1-4a1d75f2574mr69075175e9.5.1792246119996;
        Sat, 17 Oct 2026 07:08:39 -0700 (PDT)
Received: from machine.home.arpa ([2a0d:3344:57f6::1046])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1ce3302b5sm84430745e9.4.2026.10.17.07.08.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 07:08:39 -0700 (PDT)
From: Luka Panio <lukapanio@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Henrik Rydberg <rydberg@bitmath.org>,
	Douglas Anderson <dianders@chromium.org>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Luka Panio <lukapanio@gmail.com>
Subject: [PATCH 3/7] Input: edt-ft5x06 - add an optional controller boot hook
Date: Sat, 17 Oct 2026 16:07:51 +0200
Message-ID: <20261017140827.290666-4-lukapanio@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261017140827.290666-1-lukapanio@gmail.com>
References: <20261017140827.290666-1-lukapanio@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some FocalTech TDDI controllers have no flash and run their firmware
from RAM, which is lost whenever the controller is reset or powered
down. Allow the chip data to provide a boot callback that is run right
after the controller is taken out of reset, both at probe time before
the controller is identified and when resuming from the power-off sleep
mode before the register settings are restored.

The boot ROM of these controllers only accepts commands shortly after
reset, so skip the 300 ms settle delay for them and pass the reset GPIO
to the callback, letting it restart the boot ROM when it retries.

Signed-off-by: Luka Panio <lukapanio@gmail.com>
---
 drivers/input/touchscreen/edt-ft5x06.c | 25 +++++++++++++++++++++++--
 drivers/input/touchscreen/edt-ft5x06.h |  2 ++
 2 files changed, 25 insertions(+), 2 deletions(-)

diff --git a/drivers/input/touchscreen/edt-ft5x06.c b/drivers/input/touchscreen/edt-ft5x06.c
index 536d633d97a7..e57611e48217 100644
--- a/drivers/input/touchscreen/edt-ft5x06.c
+++ b/drivers/input/touchscreen/edt-ft5x06.c
@@ -148,6 +148,7 @@ struct edt_ft5x06_ts_data {
 
 	struct edt_reg_addr reg_addr;
 	enum edt_ver version;
+	int (*boot)(struct device *dev, struct gpio_desc *reset_gpio);
 	unsigned int crc_errors;
 	unsigned int header_errors;
 };
@@ -1131,7 +1132,16 @@ static int edt_ft5x06_ts_init_hw(struct edt_ft5x06_ts_data *tsdata)
 	if (tsdata->reset_gpio) {
 		usleep_range(5000, 6000);
 		gpiod_set_value_cansleep(tsdata->reset_gpio, 0);
-		msleep(300);
+		/* Controllers with a boot callback handle their own timing */
+		if (!tsdata->boot)
+			msleep(300);
+	}
+
+	if (tsdata->boot) {
+		error = tsdata->boot(dev, tsdata->reset_gpio);
+		if (error)
+			return dev_err_probe(dev, error,
+					     "failed to boot the controller\n");
 	}
 
 	error = edt_ft5x06_ts_identify(tsdata);
@@ -1233,6 +1243,7 @@ int edt_ft5x06_probe(struct device *dev, struct regmap *regmap, int irq,
 	}
 
 	tsdata->max_support_points = chip_data->max_support_points;
+	tsdata->boot = chip_data->boot;
 
 	tsdata->vcc = devm_regulator_get(dev, "vcc");
 	if (IS_ERR(tsdata->vcc))
@@ -1437,7 +1448,17 @@ static int edt_ft5x06_ts_resume(struct device *dev)
 
 		usleep_range(1000, 2000);
 		gpiod_set_value_cansleep(reset_gpio, 0);
-		msleep(300);
+
+		if (tsdata->boot) {
+			ret = tsdata->boot(dev, reset_gpio);
+			if (ret) {
+				dev_err(dev, "Failed to boot the controller: %d\n",
+					ret);
+				return ret;
+			}
+		} else {
+			msleep(300);
+		}
 
 		edt_ft5x06_restore_reg_parameters(tsdata);
 		enable_irq(tsdata->irq);
diff --git a/drivers/input/touchscreen/edt-ft5x06.h b/drivers/input/touchscreen/edt-ft5x06.h
index deadc756cd74..7eaeb562d11f 100644
--- a/drivers/input/touchscreen/edt-ft5x06.h
+++ b/drivers/input/touchscreen/edt-ft5x06.h
@@ -13,10 +13,12 @@ struct attribute_group;
 struct dentry;
 struct dev_pm_ops;
 struct device;
+struct gpio_desc;
 struct regmap;
 
 struct edt_ft5x06_chip_data {
 	int max_support_points;
+	int (*boot)(struct device *dev, struct gpio_desc *reset_gpio);
 };
 
 int edt_ft5x06_probe(struct device *dev, struct regmap *regmap, int irq,
-- 
2.55.0

