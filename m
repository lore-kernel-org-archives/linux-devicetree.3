Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3D5A37B01F
	for <devicetree@vger.kernel.org>; Sun, 19 Apr 2026 09:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776591280; cv=none; b=GihJ9RQiUil/nmGZVe+Zl97NOP8GoFH6wKUK7yGtRKQHix1LEPivvGgWwJSZMdW1dlJCr6B8zA5g9QMTnO0wh7RDYq6NjqjwWarD1otZVFe32oPUr2gwOsMOcnyMV8GvKXt5XUSPPbTnvS/Hk1iD8SgmlpotLjPRY5EbbkRKa6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776591280; c=relaxed/simple;
	bh=NnTZhLTZnNfRAZTpInLPnO6pd8hHUs/jOhkVX7vXeK4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GlAoTCgad+KIIrM81qFvnv4yJIFHSRLi4EU6PwlBqwlrVX5ctEfRBf/xUgnXpcdptX4RhAmTwSiDzLHwQO40/Bo1AIzwFcv1olUEqhNG5e+r7cD8WPE1oYREz1WISqfF+ohI82g2w7pPF3yYzbKw9s9yCXIUZZKqO0DP5A2GSCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b1UirRBg; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b1UirRBg"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-38e97e73234so17186261fa.1
        for <devicetree@vger.kernel.org>; Sun, 19 Apr 2026 02:34:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776591277; x=1777196077; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d0a97i72KVR1eeUiCzxnD93bJZC8Qqjf+srt6bZebIg=;
        b=b1UirRBgWKe01ZefHYhHt1bIkKPpu++bcmRdJHnOQMF9ezzyrG6OjGKTq1n43OEFQt
         0TdIMRMlYaNV2F5StHZG7tQoL4cWFnL2cT4NXCui0E3xMmnpvet+fzPLNOtZytMvfPCi
         z7xojrwVGisE517O659eDeEUUMXkWSJmvae4qE5S/U7rnTfw2UgTRe9ctWzUL0vZRgYY
         KN5qIvKuoPwixGZ58Fs9x9Eggvxsw+GW0PvYWxQyY8D/jHuWbaJRz3qyEcS4BX+CYmbn
         eWG7HLw92kzgY3ds0vBv91DFwD0xFv6ClSU33c09AaPWdnwC741Vy3Wuh55IWrsz24LL
         MYng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776591277; x=1777196077;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=d0a97i72KVR1eeUiCzxnD93bJZC8Qqjf+srt6bZebIg=;
        b=Na2AQa7uOd5lo92d/M/U4P31uytq1nXiZyWdbMVSm0Qdf0RSFAw7OhEILQFoJ5a3TP
         I7bJTPlxQ6SkGEdLAaQ4cJJd6D6DkDvbzlSJKfPlPPFFrZY0cy9KEoeX4B+rClaxLKJL
         Q1QLugdsquS+ck34YOuyEnElYEcm3Cti3XwDC6dbWcQ3UrIo3bLenTwwk0usORKVk2rx
         RIv0nopnXYndmRsPSTlqFmabufnH5Qtv9NdDU71QnPIdO1jFPktCnXz/L1ELHPMh1wo+
         bcImhTMn1zb5CUQ4On//qkeOvSVyJM+gnuvOIz+GNgSfs5yyX7Hg8rkM+XfPolJTt/ms
         B6pA==
X-Forwarded-Encrypted: i=1; AFNElJ87HUryAAZL5i35qvpXQjxNl/hxjL+tq/gQB0kgAVa/3SK/eKcKBCUAcuBorfaZrcQfOpe9gcKrPq3T@vger.kernel.org
X-Gm-Message-State: AOJu0YyK6JunNg9hEQzfvGQdDgMSiLaqH+CULfDT6cWnN1bQK44O4Pul
	3yp6i5Eqo3DcKID2HhNG0/ICRnT46ePY3MQAP7IPfFS2jCfRA0OZEw3O
X-Gm-Gg: AeBDievTXHhwfSCVyNTitNrOfV0/SDtSyW9TOKxch7C8N8FeSLG4D8EBEWqd/7zrxIy
	n3FvuQI9aGVBIPno+GXc9Hl7FMfI+e7swz7U2AXhML4Fl0WtnjN5HmBcdn0MYVUWeJljkgoW65q
	FrTnmW4EIX3EJb3Xrh9lBTQL4lkMrNT5/fI5XUz69ALPLWVdWPBLM4cF5evVNBQYZxq+mhDmNpQ
	O11F2TiquTSlt7XCQ3a3wO528HbngP1qtp+3HbhNDlrtj+biAHER1i2oJreHxkKZqNUZisrCf+B
	Yw4rQr3p2J3jZBG5kTQagPItE7FxCldPHRq/U59oWJI0R5xREelLeMUDgkScfVjdFLuDQ3mQpT/
	BehIbZUteemADPR6Mb7WcE7cZ8ZCIqwHfgNx3HbhyRJwxhuAFv3VnK/T3kXEfnZSbS4GcXPDvIW
	O9dEuchuE4/eQgdiio5Q2visSWSHZpH5royw==
X-Received: by 2002:a05:651c:1604:b0:38e:9ef0:58be with SMTP id 38308e7fff4ca-38ec77f5aafmr27047701fa.5.1776591276767;
        Sun, 19 Apr 2026 02:34:36 -0700 (PDT)
Received: from xeon ([188.163.112.56])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38ecb7613a9sm18221671fa.41.2026.04.19.02.34.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2026 02:34:36 -0700 (PDT)
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
Subject: [PATCH v2 2/5] media: i2c: lm3560: Fix v4l2 subdev registration
Date: Sun, 19 Apr 2026 12:34:09 +0300
Message-ID: <20260419093412.40796-3-clamor95@gmail.com>
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

The existing driver does not call media subdev registration, making it
invisible to the media framework. Since the LM3560 supports two
independent LEDs, register each LED as a separate media entity.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/media/i2c/lm3560.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/lm3560.c b/drivers/media/i2c/lm3560.c
index f4cc844f4e3c..085a0ef70e39 100644
--- a/drivers/media/i2c/lm3560.c
+++ b/drivers/media/i2c/lm3560.c
@@ -364,8 +364,15 @@ static int lm3560_subdev_init(struct lm3560_flash *flash,
 		goto err_out;
 	flash->subdev_led[led_no].entity.function = MEDIA_ENT_F_FLASH;
 
-	return rval;
+	rval = v4l2_async_register_subdev(&flash->subdev_led[led_no]);
+	if (rval < 0) {
+		dev_err(flash->dev, "failed to register V4L2 subdev");
+		goto error_out_media;
+	}
 
+	return rval;
+error_out_media:
+	media_entity_cleanup(&flash->subdev_led[led_no].entity);
 err_out:
 	v4l2_ctrl_handler_free(&flash->ctrls_led[led_no]);
 	return rval;
-- 
2.51.0

