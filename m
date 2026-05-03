Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 971E83CF692
	for <devicetree@vger.kernel.org>; Sun,  3 May 2026 16:45:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777826705; cv=none; b=uDX3gjdwszmb4QiS0ha5o1qW6Ufg9i0UA1esHrVbJoDyiO+zqJfnYl6nv7rnBBBi/upqI5+3u1Pl11rzdqzJ6Y7Lx/HccUX0idQXWnmDEpsjDC/GJondjAw9ijGWh8j7DCiFdXoPM6D4pc1DM72rJIUC4PJ2iYNhz2XMs9zb4DE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777826705; c=relaxed/simple;
	bh=LRXlNS9x02z8g+CGxmATU/6gvHvDK0YuBVqtECCU2ME=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i7LLWLCrcNWt0Gmo5aY/LCnTmABx6ZlJfDPgNvnSCvI8EIYL21jZqxbiGJ8h4/8JS1UekMkyeJ66Ni8xS/DVOIgK9Cm+OhemmO318W2lBfCqg+4746hPDXQL7luqzuhJ2z3Epzlx+b067kMZXd5sQAMZB/sIu5//e+/LXAm9bQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OOQJq025; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OOQJq025"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-671dad7cac8so3812285a12.0
        for <devicetree@vger.kernel.org>; Sun, 03 May 2026 09:45:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777826701; x=1778431501; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2KGU01Qq2W7EXZE5uDuHFOzhjoXBSa5CoF8m94VBiMo=;
        b=OOQJq025zP22Fc7s20qoPylJWHgRBwlbxBySVpn+FzjwdqMH9bk+vq83xwjYbvImtj
         mNmil/SjoqdgCv97K7ZMWVAXQ9fPYeaDB3BlnfGyQ5DD7ZIqdGnSAdIKaIfp3azyUj7u
         MnVMArB9a6mDhiCeI/R+oGjfROe6bFO85HQNtyHxhn6bTXId+DAFqGY605ql63tJko0L
         tRKeECTiPBFEOZPtfg1Gz4Sw6SxN+f3P9eRu/2rbT/Mq8J1uoTbPiOOEjNyzfRw+km+s
         J7PS518sm+INx4jcAfPAB5mwVjaiO3Pl+IKT8jDwcAuDWvfTa/GS22b1Sg2l9CGBzFst
         BINg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777826701; x=1778431501;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2KGU01Qq2W7EXZE5uDuHFOzhjoXBSa5CoF8m94VBiMo=;
        b=e1WR+H8G6VXPyMNJk5CV4I6YyY+k/Afxl7JlXlSiTSnHEbIVsgMuUkkq5P5Sih0Bgs
         R5eHsa7YxCNSszMEYVfHgE3aHVUIyyHDkl9KIMUxfzVP8qfQqv3vGuraT1Xt30s3rDzp
         PTWwMVO+tgeg73xz7/Ftst2d+hp78AWHer+ZCWPtAg2Hf/xQOMgohzPeqT2Q1Eqc9U6h
         l4Xx+xnEpoUznb2CkKi5i4NTa9snKKtSf2fXjWbPxR9pxQYUnaqbEKm5AJOx10QI8Jzi
         68iAKK6X7WBF8/b63VnO+1XHirQr4tXG/8aiikYdw4uQaKj7ofIvemzKVilOqsU71PrL
         M59Q==
X-Forwarded-Encrypted: i=1; AFNElJ8NkboBvqF9Pp3U2EkVBg+OHB0YObSOmBA8ETxmdL+oXVj1vpqk6oN6qw0K8skMaUYVjicLujBq8b1p@vger.kernel.org
X-Gm-Message-State: AOJu0YyLpDzfMFkTonkyv+m3uGsL3jd1nIZF8o1LnF8L3O2p8y3v0lR8
	duZcf2t6SOy8fnInhWWunQ69RHs70D+b7a0q8++xM5t6MC0eQ/vM/Lpt
X-Gm-Gg: AeBDietvckrIfDLbfANLo3hBBQ5Pf+bPlZXVuoD7Z6Rvgvvm64Yzv371w4v4sSUQKjz
	3F8Cqodln6NBu51G2x6MWzZn+PiH1xLrrLbN2oaAiRz2xMszyMGFKJVGt1YWOuC5HYGIQamC0ke
	Rk40Y622rne7BMjUlhCmBzb8iGmTC8ALVhKsm8ij8qQzRbZEAyHQMjZ389gjKxZltu22Zkz2Qzh
	g7D7tX6xs4S6UYoYGeF1Ry1Aea3pRdK5PJaVJ5nsQUsQw+LCPFKw9WiN97q5GgtyJ33QjfDZT3e
	8KAMmRVSFWlrpz91KaooX5oysypp+9kOgU77TQPRATeCDSfs6yo9ANBhXhW3u17WATdyBSDmQi+
	7cxfHiFCntyYN4N6hdixZPS0I/YJ+Hx15mtCuwCIjKuQxHyCscO/3BR5T6IRzA3N5+Y+UdgYfXl
	Np1Orf7JGAl7YFXYflbXSADUU=
X-Received: by 2002:a17:906:2083:b0:ba9:559:10c8 with SMTP id a640c23a62f3a-bbffbf85acdmr212670666b.41.1777826700933;
        Sun, 03 May 2026 09:45:00 -0700 (PDT)
Received: from xeon ([188.163.112.56])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bc237ef8297sm27430566b.57.2026.05.03.09.44.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2026 09:45:00 -0700 (PDT)
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
Subject: [PATCH v5 3/6] media: i2c: lm3560: Optimize mutex lock usage
Date: Sun,  3 May 2026 19:44:42 +0300
Message-ID: <20260503164445.215540-4-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260503164445.215540-1-clamor95@gmail.com>
References: <20260503164445.215540-1-clamor95@gmail.com>
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

