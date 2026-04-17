Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F047F3988E4
	for <devicetree@vger.kernel.org>; Fri, 17 Apr 2026 11:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776426170; cv=none; b=mea7JeGmYKuG5XHbDuvDp5Z+sukevCM1vo+7sjVkOlc8JL5PWmDZuLAG9H7dhI3zMGQPVPVgH4aUM3ECVyXMBVsaY7TRBvCI1EvmqGCyt28ZzPFcEVlJBeg+TM6u3qR4mkqSMtUTsJxsVoW+KBWvVm2yIItqshT70sPpWtvanZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776426170; c=relaxed/simple;
	bh=Pji0/ofzjtQ63oZLWNDkDfpZTnQz3RIaDahYeQ6edfE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=exa4kpH3nXX8LSYobRXMdINRtrhIS2JfMt/lDxYDwc7rrQMPttPO8wG30n709Fmd2r+/itrqE5nsJ1h0BTcP3gJGHxsj9SxwUJoVsQWp/2PzKe9U+SOzLgXmiasLH8ggBztox0am/b+1hAxBVdaVukCaTnRToCEpgLVKUgtofDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qVN4u5g+; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qVN4u5g+"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5a40d02b58bso515933e87.3
        for <devicetree@vger.kernel.org>; Fri, 17 Apr 2026 04:42:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776426167; x=1777030967; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bTztIzyLZUtX46/uC4DmLedmtQKgb/ItDKns9uW8WRo=;
        b=qVN4u5g+HrPiZXYg85xntUJPHeFQd7o11O0U71PmH9ce4MtuET8xY0Hovmqm+3ifsA
         uJ35nvO1sLB6BbR4G0N7JQWysH3JmNEmT+vF7ZHDMr0zX8DVVSlWY1FwniQkF1L9xTc9
         OjW/v8Jm8A5IVfW/H/6RHIdt4HN/Z9VKtwQkjMwFpCMJaFtR9jzjHEnva3h4yWcR5Vdp
         f4TXkV12SRr5+xcjBuaAz5eBbCGjHUFbDbmSalO2Sl2r5lSnsQgOLuQmw1dPsZ3Fryp0
         1Z+DLHbBzEbcS1EQH7TMsdA7PjbnxR0xzeGJX9TrRAOej6AQJVJ3yQyL2TofUz0k0lCm
         cSRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776426167; x=1777030967;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bTztIzyLZUtX46/uC4DmLedmtQKgb/ItDKns9uW8WRo=;
        b=BDbH0D1Iiq/u++T3ABpIBJBZVzzpcjT6kqTVAWtLFv6HOZTqtLz8MJq0Ya2d2Dplel
         zbdMH2YQ+sqeGaHU8y0IArl+6vH9nDIkdP3tw+iuCiBh+WS2O1VINLL0f8HacwP5XYoe
         UB5KfdfjImeHMfqx6VWVCU3VXzw552m17DrUHPpj0inZ9RAGsqP166FD1X6o7wQeC+Ej
         m0WLtK7jSIdp6nQC1y2mUxRbHRFOl//E6dXetkKmuGOXo8xjYduMHri9t/QhC1s7zyWK
         d95iRAhP9KLfXpzIwh/lX2+l01GRb6q2PKmAu26v36bC7/EffD7ao9qQ9Ij4lA8WaR4M
         nfaQ==
X-Forwarded-Encrypted: i=1; AFNElJ/R6I3A/zShmtlVDiU97zNDth/3XPvqg0G3go899kbhYgepN4hkt6Qt1ytFAYKru8TgzM+JBJ4WyW3G@vger.kernel.org
X-Gm-Message-State: AOJu0YyFaFlh+Idr5wRzdXCEEXtJcBjV6xn7fq4zm/1QtFx/L4/c7wtQ
	wz6ViMWy4q6eY433npBTSpx7u8khyh0UVIqpznk2+qqoVaMPX1cH6PUu
X-Gm-Gg: AeBDievPU+buBM11OQXR/P/LBeZIqeqsZdShWuPzpcaG/XrV/1MlaBNUHgGMnR9jhUu
	qbMsxLuNQq0VddXIeXwSLmOP1lQfMDH34mEL+WM/O0x0rV+HdbUM7Yg/AMPZWVX6gbwisHlN2Z7
	iNkpETB/748c84pzP/6230fWcdTJbD3yjjXoYvVNAaan9+JxXK/CiGR3midSZPsDJXcS5Do7EK6
	qMi4ogMyXjYlRtTf4vAm4MkLI6DorX/J1Tnul8oSdqNgWlHfJxnKaZspHaUdyL3BlxAZaZkwEeu
	YVq0RGl/VETdP+u0HvWoeX5OSRvl2gwOUP4x7pw9bLfPfmpXfAqCB5Al+7hXAjTsIVLya+IEUD3
	vSnBoDteQlFwXNr9BtOmFsAALXY3QHNH8eFB1QwIIWuADz3OAqpTQEoIW16zPFQtmxCkM4oKEoW
	dudCbgy1tEMFPhdgbY0EP2I8o=
X-Received: by 2002:a05:6512:6d0:b0:5a2:b487:b945 with SMTP id 2adb3069b0e04-5a4172c67afmr809260e87.18.1776426166838;
        Fri, 17 Apr 2026 04:42:46 -0700 (PDT)
Received: from xeon ([188.163.112.56])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4185bc672sm338636e87.34.2026.04.17.04.42.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 04:42:46 -0700 (PDT)
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
Subject: [PATCH v1 2/5] media: lm3560: Add IN supply support
Date: Fri, 17 Apr 2026 14:42:23 +0300
Message-ID: <20260417114226.100033-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260417114226.100033-1-clamor95@gmail.com>
References: <20260417114226.100033-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add IN supply (2.5V - 5.5V) found in LM3560 to ensure its proper work.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/media/i2c/lm3560.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/media/i2c/lm3560.c b/drivers/media/i2c/lm3560.c
index e6af61415821..a2674af6c9fb 100644
--- a/drivers/media/i2c/lm3560.c
+++ b/drivers/media/i2c/lm3560.c
@@ -16,6 +16,7 @@
 #include <linux/slab.h>
 #include <linux/mutex.h>
 #include <linux/regmap.h>
+#include <linux/regulator/consumer.h>
 #include <linux/videodev2.h>
 #include <media/i2c/lm3560.h>
 #include <media/v4l2-ctrls.h>
@@ -434,6 +435,11 @@ static int lm3560_probe(struct i2c_client *client)
 		return dev_err_probe(&client->dev, PTR_ERR(flash->hwen_gpio),
 				     "failed to get hwen gpio\n");
 
+	rval = devm_regulator_get_enable(&client->dev, "vin");
+	if (rval)
+		return dev_err_probe(&client->dev, rval,
+				     "failed to enable regulator\n");
+
 	rval = lm3560_subdev_init(flash, LM3560_LED0, "lm3560-led0");
 	if (rval < 0)
 		return rval;
-- 
2.51.0

