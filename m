Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D29447B423
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 11:44:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784115869; cv=none; b=a0IeDV8zhU8FUN0jEehLX+nV7rzK9CikVPlIzxGi8EI/c117S2yvdq5l3CgJYeEC3zPKKg0RJy9Vc6Lq3Ma88B3QBfuie+NIaM95Po76SZ7YyQ0J7LAty3k60MaXNhJpgxhMgqPcx0dChGvd9us6gcLOXrymv1MUHvCTxwU3gsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784115869; c=relaxed/simple;
	bh=bcYfj5jJHsv6QgPHcDA8Qbrw7a2VO2b0E1lpdTZY960=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JU+zeaXC3gLxdKlqn5fkbbSxIHozkA9pYT68So5NmLM3B4CwhpZMOuYiJ+f0MZXjOLgFAgXuk4h9JvvctvG3k4shmSYbDr7gqqZbxsZcjudRU5Gf+4ZIy3c2OSiMd/VeqxK2KWzI7iIBRXhzWcOEP0a0r1qfuH8YSoC1NnqkZBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=G1i2agav; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="G1i2agav"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-4720f3bf164so335873f8f.1
        for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 04:44:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1784115865; x=1784720665; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A3Ixs0kwhVNVHVrLz/R6Y5v0FE4WXlRn39OXAbjyA4o=;
        b=G1i2agavYPAJd21TmcoYhqzWhPZpO4h0q5NMhFn6wYdmQ99p8cgKDcjATedsff/j1r
         ApMM/IiYbiIx7vHA+7xcM440lODH9I6FRAA/mT9ABOxXoQw7MUTgb9ahkXic4fh2RCBn
         gb3x8YwfUuFs2cm6zqNjlll8rOfDP9WVXSrMy7ln0aoLFEF5tnvOOLaa63ytc6D2BDMT
         25cB2QA0VE7r/WkCtN7LLXSGmnf5CUJYWRMj7HQrehgOIMrFRfDkHR6/zuXvzup2i9dM
         orMsa6Fth8MzBhEQO2VO1K/fif0x3yKXP0YGtb0bfNu2yEx17EnDmTrXDqtKtKwbdo05
         aahA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784115865; x=1784720665;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A3Ixs0kwhVNVHVrLz/R6Y5v0FE4WXlRn39OXAbjyA4o=;
        b=f77U49cG/0RA2L1zQGIhfUpy7aCWmHchSq2o/8vhhivxoroGXIitKNyUOdMiYA8QuN
         mtauaZhyf6AsUeYM9PWLLpiAtgUJwQBuqCOHgja4TRQqL4Dam7xTTiW4y/15prwuSZu+
         IlrramgMn3wUabonogwv38gO983cI1DH8j35upZ4mkJJmhZ+qTmvArbXL8WNbqHfH0pR
         E2jw5hZEDGtTOUA3I4YPjgRMTfyyi/WbGHMBtWDqhvDLYAhDSLVv/CFR419sCgyIHZ/b
         lt64x0ksQl4I9GqHc5elGAbUc1EnRHcYROWwTYcxA/KWcLREGvuG2c8qo7vnJxfqNLub
         IWBw==
X-Forwarded-Encrypted: i=1; AHgh+Ro0y5TbUma5Edr0yQsGVXwt2BxgNX57t+OPJkPRgyhrFQ7k92KZ7p5j9olUeo7zMbd6s3AS1veDS805@vger.kernel.org
X-Gm-Message-State: AOJu0YzOMCrr0hDjloeJXAPRpCbN7RPKwl/L5+vDrVHwvOXqWOsHe1N4
	k/Ei0uH3EUUUtgif6OsnGoa9VRsk1zhadMswtVjS4ONcKSZZU9iUXKUiy0SaB5ULSvg=
X-Gm-Gg: AfdE7cksdl104ZWAOXjhi/B6n/d52aAB5g/+1nkBmeWLrK77aYfguXoZlicT1NscTUE
	aggbCl4BrYwcA+wVVcNJ9hQxzAYecTA8hqcov/Mt2ZV22f+/RImrjy/UpAuRqqQT19Yo2ikFfCJ
	NzQk/wHpOz+umFNZ2QqR4XBVyJtHVQJsUe92DqaUE3EqN4lJbpTBDc0nqN44FoOX3v5/uupy65T
	l0CPhd3ZCxsGo7m2tZSJD77SZDtksKaXL8ewXoaAQO3qVNrokSW3eS7yj2fXrpqY00G/D5BiHaj
	3Nf3Nv6dtXLhpX8VDZbYCwv9MuDUSPgsKoHfCPw9otaHQFDd7reY6cbsMnh6yU8yYMYo7AVlb3Z
	ef/t5LoNOhKxKUhTakQYkNctlIlBflRJGyr0Gfq35BsZwt9B13jqCgsO3GzMsKIRrpO+r6l9NuN
	jYUffQXO/6oOxQiEzAYWUkTi5TYW2Kd+KSD1lHDvpwUcuMMbmbt0QSWiCj+z44LMedb8jfUoZ/R
	sk=
X-Received: by 2002:a05:6000:184d:b0:474:3708:c8 with SMTP id ffacd0b85a97d-47f2dcc0d79mr21039734f8f.15.1784115865328;
        Wed, 15 Jul 2026 04:44:25 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-47f4829896asm14005425f8f.23.2026.07.15.04.44.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 04:44:24 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 15 Jul 2026 12:43:30 +0100
Subject: [PATCH v4 17/21] media: imx355: Use NULL ctrl_ops for HBLANK as it
 is a read-only control
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260715-media-imx355-v4-17-f7f966fb9ffd@raspberrypi.com>
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

This avoids the set_ctrl handler being called under any
circumstances, as it will return an error for the unhandled
ctrl.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/imx355.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/imx355.c b/drivers/media/i2c/imx355.c
index cc27a193cd81..3b3bf41485c2 100644
--- a/drivers/media/i2c/imx355.c
+++ b/drivers/media/i2c/imx355.c
@@ -1124,9 +1124,8 @@ static int imx355_init_controls(struct imx355 *imx355)
 					   1, vblank_def);
 
 	hblank = mode->llp - mode->width;
-	imx355->hblank = v4l2_ctrl_new_std(ctrl_hdlr, &imx355_ctrl_ops,
-					   V4L2_CID_HBLANK, hblank, hblank,
-					   1, hblank);
+	imx355->hblank = v4l2_ctrl_new_std(ctrl_hdlr, NULL, V4L2_CID_HBLANK,
+					   hblank, hblank, 1, hblank);
 	if (imx355->hblank)
 		imx355->hblank->flags |= V4L2_CTRL_FLAG_READ_ONLY;
 

-- 
2.34.1

