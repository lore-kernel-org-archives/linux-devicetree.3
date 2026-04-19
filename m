Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03A5337BE88
	for <devicetree@vger.kernel.org>; Sun, 19 Apr 2026 09:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776591282; cv=none; b=AR6fM5Mvlo6ziysYYMJmf0YgwLkbNjYi4rzxJRN1Atmh2DKL/iuiIgxd/A2yUScRuurqb2fDCYNBNQo0L+lLG3DTDGWXRoMsxVCg4ZQENFUpSTRXTLFO0ZQrF8sLD0g9LVHQeTuVM1LEv9IVq0Yu57rntupR+olUuyJhRt81lD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776591282; c=relaxed/simple;
	bh=DPuU9UKzjNveL2Uy3y9tUPnjY6ZhEX35Z5uqTrDGofg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QrtSOyh1vREM2ShgCSrgsAJQB/f5RIpLHh/dKaRpF0kGpdaf6pJ4wx7XElaC0+NidVpK39Izg7kH32WUL66aUe/05y+4q0akgfXi/1QEn6Ev40RhcKAYz/F8XJkRBLjyZcgG4S4f1J2HQt8II4bRhWhDKzCpJWELLWguUDoyl5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gNDW6PJy; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gNDW6PJy"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-38e91416cc0so22345061fa.1
        for <devicetree@vger.kernel.org>; Sun, 19 Apr 2026 02:34:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776591278; x=1777196078; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WwldWTVNb+Q/QpXo1IdPnwyyFuA7X8MQ9JBz50beleY=;
        b=gNDW6PJyeJ00F1zQsh4NhPP1dxsb4kvt0G2Bfbo0y8O0DXc86Vvapzj20VCp5R2y04
         4wxpxLLRN6ynpvk9FBeK1Q8Ej3wy3ndl+ZQ8dyP/fy+Ie0ObMYnNF7uflfEGJKUU0HGK
         eWVHXz3V8a/PizH5f7VQ78uct+V1Uz2fubwrCP4gaSpWRk7mI/aECcnY0hvxqifcX3JL
         COZq2Yg7ZqlfbOKGH+lpq/DlM8iITrTwjOfRQ9agI4DflhUEuSBMQ/7APJtv6tjnqQLd
         cQTybS5r5AE9S1QBJINjvUZImmx2uZQYeNki2ATbThKiy60vxJOsnPRKhiWQaPZTWil9
         sWlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776591278; x=1777196078;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WwldWTVNb+Q/QpXo1IdPnwyyFuA7X8MQ9JBz50beleY=;
        b=qolOMgrg/YqXxgt6xZflA9sPeLNhvn3i8jmLCvCrbHYrTjChsF93b0EdtJKv9SOhsY
         WpUBrk5DR2Bs7Td5iIrYXUL1OkmgCYGOKO2c4OOHAiA2KWbMytSV9KNX9eHLoYFt4KIu
         eZuEaD9asoMu0fD7jy02LdZndAf4HNTpMYL6jCgTRSHmxOyLFjz7WW0GeFjvhZY388JJ
         9IJcG0GjmozBkQjzBms4HeEUkN0Bc1yNEBd2KQZlTnaQS1wQwVOf/slha5kIIQPj5KlR
         S2i1oL5/Ww1nXeO5eEnBfEzW/E+sYj/oSgswzfV0qH4XzkFZbuDxFsumIuWwrTG6aXzG
         F9hg==
X-Forwarded-Encrypted: i=1; AFNElJ9dMpVBqS++xeRSgehFq1qtbfKnu8EWFmzWhOMWWG5ueUptEu7C8jLVOi20k6Nu/tXG0blGxQXEhjuE@vger.kernel.org
X-Gm-Message-State: AOJu0YwdxId9aURfUiK+Sp0aGadaKq4ajIFn2EXYONUpq2EfuRzA1GiI
	ZDwk6CACf+ztX+4jPm0A/IuZPryLIsbqPwzc3isydRUnCX8Qw5r4XYMK
X-Gm-Gg: AeBDiev66t7tG/xnZ/3zp2bOZjNxJ0jeYQTGQ/f1qgKk5xUK7jm6y6BcpGXCXWw0uHn
	0cZmeANkbY0YakdbX9rxEWOqI8sZpS+wYvIHV995W4ZMZUMvAJq0FDEsOHH7shmOd+u9BfyjVoK
	DanL1Jx0AqavddeC17ZHgqX2kU0wU2Z8cXQa3ZW6I+c1gG7VsPS70R8GFLD6txINT9zwSP2lWDL
	LSJ1W6ZdY2x13dayzMaSLQEMVL9hlGQ4eKk/2sl2XcuGnfSIFtx4m9VocGGtyu3K5uOzHQYfrAh
	+2qh8S5aG7woqaRH+0AM1qoX0OyAd+8ukFEJgimNlxqFCa1Ho7RWOoReAmKdplI6Kjmc9QEm/rU
	bmI2PhyswExhsJArUvltkvgfZcUeC3hmTF4klcQd3IXCk6ZnZGNSgTNuzUT57myY0EaAJNndSDe
	ecH1E8zZZP54J5LOQjS6eXxr7ZGdPvxxTNHg==
X-Received: by 2002:a05:651c:2344:20b0:389:e2e8:4f4c with SMTP id 38308e7fff4ca-38ec951d010mr18302131fa.21.1776591278096;
        Sun, 19 Apr 2026 02:34:38 -0700 (PDT)
Received: from xeon ([188.163.112.56])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38ecb7613a9sm18221671fa.41.2026.04.19.02.34.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2026 02:34:37 -0700 (PDT)
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
Subject: [PATCH v2 3/5] media: i2c: lm3560: Optimize mutex lock usage
Date: Sun, 19 Apr 2026 12:34:10 +0300
Message-ID: <20260419093412.40796-4-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260419093412.40796-1-clamor95@gmail.com>
References: <20260419093412.40796-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Pass the device's own mutex lock to the control handler so that the media
framework can handle control access instead of managing it manually. The
lock must be common to both sub-devices, so the individual sub-device
locks will not work here.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/media/i2c/lm3560.c | 18 +++++-------------
 1 file changed, 5 insertions(+), 13 deletions(-)

diff --git a/drivers/media/i2c/lm3560.c b/drivers/media/i2c/lm3560.c
index 085a0ef70e39..5cd22c2fbb64 100644
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
 
@@ -332,6 +322,8 @@ static int lm3560_init_controls(struct lm3560_flash *flash,
 		return hdl->error;
 
 	flash->subdev_led[led_no].ctrl_handler = hdl;
+	flash->subdev_led[led_no].ctrl_handler->lock = &flash->lock;
+
 	return 0;
 }
 
-- 
2.51.0

