Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0092C3D3304
	for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 11:39:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777376389; cv=none; b=YCeEXvkrU3oXo/KSBHr7atKoZ/ns7627TucqrkIBYXTfg8a+L4/r7Hkl3KVb85p1vtjp/Li1Oygwhu6GPc6nhUlgnQXaUDoqFHvlAEOL136AQNGJq1U09Eneapgd3/QHIVB5ochNaDeXDnUY2XHhoYxDOq+faV9Dbr7UV7QQx+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777376389; c=relaxed/simple;
	bh=LRXlNS9x02z8g+CGxmATU/6gvHvDK0YuBVqtECCU2ME=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cc8cU7HoGICK8fp7FbDv7Vt62N68vwDaib4idaOBsG4eVOKJdxZ0Xmw7TtfhcMZ9I6a8ldLDCScOjOu+grEtyfar8nAb68cknv8SKj6wf4YxTNQMvtM2WN0JF6TNa6ZzhDiq7lRQkx/Gpx6fCxe0hAlj/5ZyRedbtlDvnt2B9Jg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U8R5Ul/R; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U8R5Ul/R"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-488b8bc6bc9so81535415e9.3
        for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 04:39:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777376385; x=1777981185; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2KGU01Qq2W7EXZE5uDuHFOzhjoXBSa5CoF8m94VBiMo=;
        b=U8R5Ul/Rtjv688G/ApPoqfcvPkZAw4zHfPzYzdfWwdy0NbioFyKUIuOqbmTm21kRrV
         5mkkK7T4LZ7w1tIDmc3dOQrvhfVkIrlChjODdPWFaBwIjo62hybK5RlMCVSC/H9VdQRj
         jz3risBC4lv20gsYNYzaTwkpinOlUKOL6aEFhGH+Ob1+G1ZkcJoASg4AFXA7R6djPU3A
         GJUtLAf/HFG3ILwQDqXzuKi+OIQGmQ0mMxDs1ux3lub9XDp1IWBw0FjvynVWAvdG4cTr
         7jFGsaNrp+IvO8UmJCOgUDGnxbWV2f26qw4WniXp9d5aDiLUMeblcQKdyBvcFdTLppof
         Qcgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777376385; x=1777981185;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2KGU01Qq2W7EXZE5uDuHFOzhjoXBSa5CoF8m94VBiMo=;
        b=P132DNZ4Il5dkJMgPoWtNCYeHhYvzAkrT1jPQwK+ZpXhqO4wY9fWtfPUld8jZcf6FF
         G1SwI8J5nKT7MwHWqQwAA/5cU/0GdNdWuRSe92y+iDmbYEiAxwmmOcZ7YHKLNrZUwWZ9
         ACAvgpEIKgltNvIZl9/HLOMrhG1DiomWEekefar5bu5BUo1b5x34X7BtLV/NEi1Bct3N
         JW3lzCys25FzpbEYUBPwpIrcRw786wFkok83gfnJLrM6fJZIXuKRtCgreRQMeaR1IX+x
         OvClFGRh0H5BsUfq8Uk6IvdoLSxUVL/Ih4i4Crnes9NWlY9pbTN8TE7Jy3Kvy0iyrb+e
         nKEw==
X-Forwarded-Encrypted: i=1; AFNElJ9u0TB+potkLUXoSdNSfNjJ50aWrOuBcHO0O9opdj0aPJKrjTmtjJq2529DRMDFqRbJwtm3rvloPzPG@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4JKPbcg+fE7ZBogi/OjDIAE9tueGM7EQhTk2uGZkAGTyK4nYY
	qSUttv358sSJ7p+7eEjRyWUIUNP7JARbqaMxGdB2xpW2o0us7YykSsHcJps49zX0
X-Gm-Gg: AeBDietr9yKba5HjAjkc5sRd5AY7poH8EAI+ZYQv3BDB8QKgLLLGXAOhsuniN+bfasK
	cYbHpxaUxtoWxvSpVaTaigp4aKQS6tp9a8/oq8fGlyEMAlFFtAhRXfqEl77M0pAl/RHu9C/LnO8
	AKuUP0kJv0ER6QKsYd6X/Vzm2mTTz6sNnT5QBmwP26Wli07jgX4KK1PHgOeEpEPvnNlSKEvYWt/
	1FdiEglz6SDbESz+K75e+bBICdtOzkmOYX7D9L0wDkykIiA3lGdKC9umMiS4jJXOht9IAXhuVlv
	Y97yTQ2LWUUwtnXh4vsT7bNB1TAO9gLiVhPiEVmkiE7KWpmdSwsFNlS8HIuq5liLzhegFlAgOA8
	GzlJLs/g4O/2W59BaOfnAzuSGh9QJ37Ca9h+Zfy3aMTFiKorWrYxzbPn5fO/lTNTkProzkgQLhB
	vDRvqIrkuKnP9DiwzxuwYEzYo=
X-Received: by 2002:a05:600c:1d0a:b0:488:a824:fe04 with SMTP id 5b1f17b1804b1-48a77b1e893mr45325545e9.26.1777376385036;
        Tue, 28 Apr 2026 04:39:45 -0700 (PDT)
Received: from xeon ([188.163.112.56])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a77aeb223sm43541125e9.3.2026.04.28.04.39.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 04:39:44 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH v4 3/5] media: i2c: lm3560: Optimize mutex lock usage
Date: Tue, 28 Apr 2026 14:39:20 +0300
Message-ID: <20260428113923.112920-4-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260428113923.112920-1-clamor95@gmail.com>
References: <20260428113923.112920-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Pass the device's own mutex lock to the control handler so that the media
framework can handle control access instead of managing it manually. The
lock must be common to both sub-devices since they share same hardware,
so the individual sub-device locks will not work here.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/media/i2c/lm3560.c | 19 ++++++-------------
 1 file changed, 6 insertions(+), 13 deletions(-)

diff --git a/drivers/media/i2c/lm3560.c b/drivers/media/i2c/lm3560.c
index edfb07587cab..5b568ed9536b 100644
--- a/drivers/media/i2c/lm3560.c
+++ b/drivers/media/i2c/lm3560.c
@@ -162,14 +162,12 @@ static int lm3560_get_ctrl(struct v4l2_ctrl *ctrl, enum lm3560_led_id led_no)
 	struct lm3560_flash *flash = to_lm3560_flash(ctrl, led_no);
 	int rval = -EINVAL;
 
-	mutex_lock(&flash->lock);
-
 	if (ctrl->id == V4L2_CID_FLASH_FAULT) {
 		s32 fault = 0;
 		unsigned int reg_val;
 		rval = regmap_read(flash->regmap, REG_FLAG, &reg_val);
 		if (rval < 0)
-			goto out;
+			return rval;
 		if (reg_val & FAULT_SHORT_CIRCUIT)
 			fault |= V4L2_FLASH_FAULT_SHORT_CIRCUIT;
 		if (reg_val & FAULT_OVERTEMP)
@@ -179,8 +177,6 @@ static int lm3560_get_ctrl(struct v4l2_ctrl *ctrl, enum lm3560_led_id led_no)
 		ctrl->cur.val = fault;
 	}
 
-out:
-	mutex_unlock(&flash->lock);
 	return rval;
 }
 
@@ -190,8 +186,6 @@ static int lm3560_set_ctrl(struct v4l2_ctrl *ctrl, enum lm3560_led_id led_no)
 	u8 tout_bits;
 	int rval = -EINVAL;
 
-	mutex_lock(&flash->lock);
-
 	switch (ctrl->id) {
 	case V4L2_CID_FLASH_LED_MODE:
 		flash->led_mode = ctrl->val;
@@ -202,14 +196,12 @@ static int lm3560_set_ctrl(struct v4l2_ctrl *ctrl, enum lm3560_led_id led_no)
 	case V4L2_CID_FLASH_STROBE_SOURCE:
 		rval = regmap_update_bits(flash->regmap,
 					  REG_CONFIG1, 0x04, (ctrl->val) << 2);
-		if (rval < 0)
-			goto err_out;
 		break;
 
 	case V4L2_CID_FLASH_STROBE:
 		if (flash->led_mode != V4L2_FLASH_LED_MODE_FLASH) {
 			rval = -EBUSY;
-			goto err_out;
+			break;
 		}
 		flash->led_mode = V4L2_FLASH_LED_MODE_FLASH;
 		rval = lm3560_mode_ctrl(flash);
@@ -218,7 +210,7 @@ static int lm3560_set_ctrl(struct v4l2_ctrl *ctrl, enum lm3560_led_id led_no)
 	case V4L2_CID_FLASH_STROBE_STOP:
 		if (flash->led_mode != V4L2_FLASH_LED_MODE_FLASH) {
 			rval = -EBUSY;
-			goto err_out;
+			break;
 		}
 		flash->led_mode = V4L2_FLASH_LED_MODE_NONE;
 		rval = lm3560_mode_ctrl(flash);
@@ -239,8 +231,6 @@ static int lm3560_set_ctrl(struct v4l2_ctrl *ctrl, enum lm3560_led_id led_no)
 		break;
 	}
 
-err_out:
-	mutex_unlock(&flash->lock);
 	return rval;
 }
 
@@ -328,6 +318,8 @@ static int lm3560_init_controls(struct lm3560_flash *flash,
 	if (fault != NULL)
 		fault->flags |= V4L2_CTRL_FLAG_VOLATILE;
 
+	hdl->lock = &flash->lock;
+
 	if (hdl->error)
 		return hdl->error;
 
@@ -363,6 +355,7 @@ static int lm3560_subdev_init(struct lm3560_flash *flash,
 	if (rval < 0)
 		goto err_out;
 	flash->subdev_led[led_no].entity.function = MEDIA_ENT_F_FLASH;
+	flash->subdev_led[led_no].state_lock = &flash->lock;
 
 	rval = v4l2_async_register_subdev(&flash->subdev_led[led_no]);
 	if (rval < 0) {
-- 
2.51.0

