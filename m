Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45511478E47
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 11:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784115869; cv=none; b=a05s0TKbsgIDzAskfIFcCTjr7+jYSqe0GotGl8i0R9nXfAoWI7IrnUMkVDuO06y1ucyfX/V/Byh+qeOwnIE4AR4EYf6rnY3IcvDbOF+uscIHtQLG1yNZCgpjLn8WLqgynIv3+7J/FzXiaOqjPxHsLm4VHprBCNsyOk5fn+g5fvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784115869; c=relaxed/simple;
	bh=G7QPlTkMee79QYHS9v7Qtnk2HOJP0RmJkXzxeJoizP4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sr4mtUlqvdp0GmijmesTOWJm+RKW3je5FwhjIwMKYWgBv24VArazZpTmc4iOA2sbuFf6tnEXkgOW0AKh4iv8OO4vMFlkcI7hvnleTytb7I3CQ+ZLVJuy4UCwwJimynFKCupfLAx9mPKZO2tplt281f8x8/h92NJfzoKmjSNvYbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=Qf8qKwD7; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="Qf8qKwD7"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-4703bc0a99aso3258465f8f.3
        for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 04:44:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1784115864; x=1784720664; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wJiOXsXcQGmdy/lo82tEoHsjlQ3Yl1x4+oS64EHfJ50=;
        b=Qf8qKwD7Zqtw5ErpzI0iBDi+GnOXyT/EiKiMIMAK3XMElfuMTLfum+trDdvSOqlQt2
         JheweUQsMZWsVp/coM5P3PW1CeTl6SOeZY/gsaK3We33MKJWhpYZX+WJMZslvVhZ46wb
         M1bxuvl+tXh+mFEMZ+j7o2Tk1J1BYOTd1xm2LAKW6yQT1Ylwv4sYa2vswKGe576ms5cN
         /6i1JNFRoJBVvqrnqlR5o9Pov0ApSUFh3dOqf+TpxTn/dh/bFqP1EBjj2vlGQ8hjkpza
         Jvgm8vvc4Z1dcfOAWIJ/GjKFt0GGd4WFh4hkShAIdPhyhvS0b0f9/gwpP4YMVujxkHPK
         OwXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784115864; x=1784720664;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wJiOXsXcQGmdy/lo82tEoHsjlQ3Yl1x4+oS64EHfJ50=;
        b=JmjwhIQYwyUh4ZrkTIZqTldurtUiQoU3m4bxlkPB+4tI0CJkh9C88Gr/z/sq4r8Nil
         yH5EcPN/Jr1dTyJizdSG3BLKbMIxkZLVPYAPGWM/2WnTYTuMgCvzXCvV2T8uWk5bPijr
         9Gp/xowi342+jFvNWDNIDDp/RrnIO4hZ5N/Gn0I7JlStDi3gVowWGSU4T/IKsWCiJVAw
         1Elpg6ZG5PrrVwV78dunvrdJlVIKaxjECkOJh3ftvMTmyGovWitGfj3K4+L7+7tU91Oo
         IdUM9kfDhvPsFh28LZw8rUSVd+4cPogn3VC0UZPywB225UbmIZ4PBHSrZ9PQV5puDAej
         NoTA==
X-Forwarded-Encrypted: i=1; AHgh+RoeBw5QX3pdM4zC5mJteIlaoKJcRwWTIwPjiIKntA9DpIXo1eQxJ0Pil959gqL325LDXFbykEYjHhfl@vger.kernel.org
X-Gm-Message-State: AOJu0Yxs9UJdIymGsAABpfk+OKqRNu/toO5+OEcosnig3rSAwXExu8es
	v/FGEkLnw7aRuiu9Cugypl6KiAee3MW4Wepbh0xrT9YSqkgnFbHd5VSjVPpANIZIbI4=
X-Gm-Gg: AfdE7cl8JrnKRw0w4j86gu8zJMLJtiw1tAzUi+R+cak5kmgGyRKyhNz0wpOi1lEluHi
	6r1twz5m+4T93uwmfhTNSJOnhAWGOeg7ZTVWj8+IizBEouJKNr9p4cPmG+EiJAb7VSeiM/HhGsh
	t2RJEE+YNONTlmErSy6uJMY8F+fSrC1O8XTMmqGBz4UFIxGkrDXQye0EiJ+ah5uzr1M0visBThV
	NA5E/LD1rIqxV1uDjALyrlkzOuK3b2Bvo2439QUO0AP0z/g5YFlN+co89hLHIY+kqo4T6KAvyIu
	wXlHvRwajWMEZfhQ9zisP/9PTl/67zMHxc07JG10LV8oG9V3tqVuBfKHn6WsmCB6VVL56NFF0Gh
	iaeyDBCGaTyywxLXkSQFh8gY00DrpbQRhn5rqZE31ju960bK8So3Yp1cXSS6mMNEIVX69dZtD26
	bPWrfKOkJtUsU9Pl+8kwAPG7onwWSTwvWs607p0u3Etz67WAVNzVgKpzbaScXHSl1k/feOp5LhR
	kk=
X-Received: by 2002:a05:6000:186c:b0:475:3a97:8e3c with SMTP id ffacd0b85a97d-47f4fca833fmr2713850f8f.18.1784115864467;
        Wed, 15 Jul 2026 04:44:24 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-47f4829896asm14005425f8f.23.2026.07.15.04.44.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 04:44:24 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 15 Jul 2026 12:43:29 +0100
Subject: [PATCH v4 16/21] media: imx355: Define the exposure offset, and
 use that define
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260715-media-imx355-v4-16-f7f966fb9ffd@raspberrypi.com>
References: <20260715-media-imx355-v4-0-f7f966fb9ffd@raspberrypi.com>
In-Reply-To: <20260715-media-imx355-v4-0-f7f966fb9ffd@raspberrypi.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Richard Acayan <mailingradian@gmail.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 David Heidelberg <david@ixit.cz>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, devicetree@vger.kernel.org, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>
X-Mailer: b4 0.14.1

The difference between frame length and max exposure time in
lines is 10. That had been used as a bare value in calculations.

Move it to a define, and use that define.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/imx355.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/imx355.c b/drivers/media/i2c/imx355.c
index fa8a6851b44e..cc27a193cd81 100644
--- a/drivers/media/i2c/imx355.c
+++ b/drivers/media/i2c/imx355.c
@@ -51,6 +51,7 @@
 #define IMX355_EXPOSURE_MIN		1
 #define IMX355_EXPOSURE_STEP		1
 #define IMX355_EXPOSURE_DEFAULT		0x0282
+#define IMX355_EXPOSURE_OFFSET		10
 
 /* Analog gain control */
 #define IMX355_REG_ANALOG_GAIN		CCI_REG16(0x0204)
@@ -635,7 +636,7 @@ static int imx355_set_ctrl(struct v4l2_ctrl *ctrl)
 	switch (ctrl->id) {
 	case V4L2_CID_VBLANK:
 		/* Update max exposure while meeting expected vblanking */
-		max = imx355->cur_mode->height + ctrl->val - 10;
+		max = imx355->cur_mode->height + ctrl->val - IMX355_EXPOSURE_OFFSET;
 		__v4l2_ctrl_modify_range(imx355->exposure,
 					 imx355->exposure->minimum,
 					 max, imx355->exposure->step, max);
@@ -1130,7 +1131,7 @@ static int imx355_init_controls(struct imx355 *imx355)
 		imx355->hblank->flags |= V4L2_CTRL_FLAG_READ_ONLY;
 
 	/* fll >= exposure time + adjust parameter (default value is 10) */
-	exposure_max = mode->fll_def - 10;
+	exposure_max = mode->fll_def - IMX355_EXPOSURE_OFFSET;
 	imx355->exposure = v4l2_ctrl_new_std(ctrl_hdlr, &imx355_ctrl_ops,
 					     V4L2_CID_EXPOSURE,
 					     IMX355_EXPOSURE_MIN, exposure_max,

-- 
2.34.1

