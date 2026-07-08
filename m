Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EC32481226
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 14:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783522169; cv=none; b=EqCsBpKtXK+j71GEnQ9ABKBElusCpieqpw/pbP1mAQQB35vHdYkmFjsmSosTHUVjtBduVuURa00VgdzVejJdSMCgF6xo4uwKdANVGvjq373opk5osfKODJ6uGsYUQXMFFIRZTPJTvLB0njTLcWmV/NzdPgfFVbuO6bvcRDFnx9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783522169; c=relaxed/simple;
	bh=N22ub8y8rxVNpO5t6NfeXqjef5cDmG+VxKvP1KyhEqg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=u4iPsIymcf7L9CTwgGbyn46vfoGefTMPVWsHJeerL9K5lVqpvle4lXZfNUEhb8tfXNUWQF+ZchO7kgJFCbcKKDs71Jqp+CMES7+xoclOIZfzRjEVrAPnoKusJVvexrJx7qoe1eav65gzuF5YhIPRp//9i2fYlxWEmde+vL0EjPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=g1aL2E3E; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="g1aL2E3E"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-493c5220cb7so6089615e9.3
        for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 07:49:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1783522161; x=1784126961; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HmxbOG7rbE41JtbgC/kLoXXgZ/dEvF+BjHVvArFg/gY=;
        b=g1aL2E3E2VCMl5EZl+mm56PtLoA7f5ff/rFSpvITWgTbMpeIOZzoqy7QS90kJMWkXC
         Bqh0G5s564Ie+o2YL8Wx/i7GIur6KTzQlw08PpjYXje10FSl/wTgj0wFbIGMl6D2TZ+i
         HS7k8qMuw53iAwOYJ4edKlHtqs8ZBjGSHnQfvsL9EJeZ+l5OdDL//zRmvcbv8VRwSp6I
         p8Uj9VFNRIz5YASBcfBo4a6BJZ+aBbWNb/sbNRM828Dvi3PyrZCuJEyzVxghNPj91/6C
         n388e7R0EfEOseltmN4yKXyGkbhIxQG0IPqiHZLyoCi7r2dXRJ2skXjo/Q1IJE/kLzOi
         lzbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783522161; x=1784126961;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HmxbOG7rbE41JtbgC/kLoXXgZ/dEvF+BjHVvArFg/gY=;
        b=nLZmuMpvL9Wrq+XnCbxnk3wSpLFimSTJSEyeGMyW5OY6yC/l8V0+XeOHkQLNRzHJIm
         p2BWEmqFDuzGKwrmpz+gi84Lv13DAE/A1DA5uL78+bZMgfAhK6bPMK3c1o/wKLvXCliC
         HrTdChfx53zCsL6g053GefAo2kh3IYU/I7naub9RFw+/3Y5bqsVd+EqWp8JDOvv2rtCX
         MMiLbfdKqquUJ03h9YmQ0/M3Pp+RVqL9KYBeMxsqy1+aYUrJG4Q9kB0kEu/V4M3E29nT
         UiPvuEOULlaR/0rfZAD/FT6x+lwwJphjSo2+BnvRfX8dfRhOM9hObFa+9LrEPvnkvGRT
         OnGg==
X-Forwarded-Encrypted: i=1; AHgh+RqT/eLokCpIikQZXe/tIYtC3aOHCIsKhGE8OsK6Medzs9dyVt5BEbezNK8pprkN83iZrvtQXfmUJz+D@vger.kernel.org
X-Gm-Message-State: AOJu0YwaodfZKP2ycRvWhs2E4TdUSpBeSeT8CbutFRQrx492DDGUebmI
	I5Hgr5saDsWnt/L+FHb7XDszYXT9PW2i8UsjeXRWgXts18BhpFSaEsj8w0/fC731afg=
X-Gm-Gg: AfdE7cmO+hG0MyQanu65pUJKH3kTplRGpojq/7MPfme3nYPlmSbMYTglT45wgHwUKg8
	vYuVGhduX+59HppW4yjzKPxcNruIl8GJAe3nv9XZHzgKOrp8GUVd64+u6UWHaShv7kLIrumdYY7
	Mlv/Uqccx0irPS0ygKhmLrNtoNU+4gpVN87tMY6f8yYxz3W9IO478MIGUM8XKlY0IS5fcjlgkyr
	79aImyPCPsxaPFUKOTK6GMcD9RfjFW9AUxHn4phIjwT4XN3lHtyf3oFNwy9amrveDvHrcuQHQ7T
	c0NDo/tXS4veNTZKCKLK13UlxGX7fiQnrqxlTNFNp9wmw71Sxs7iRXSo5voGHJ1sJs6VGgox4do
	E+MF9IRSuebnCNgp4Bd610R2tmLVIkrHv9T/MJMGKB57kHlETJ/ge3NIrXCwu+be6WVv96zNaAp
	KPkp81TFcoK3SEH1zQxB3Ajg0SJqx2uTMJCYGGzed6xJdINX1rHdJtW+21jGbrwnLg
X-Received: by 2002:a05:600c:628b:b0:493:e947:b24a with SMTP id 5b1f17b1804b1-493e947b27fmr5523075e9.14.1783522161339;
        Wed, 08 Jul 2026 07:49:21 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-493e0fbd355sm135363315e9.13.2026.07.08.07.49.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 07:49:20 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 08 Jul 2026 15:48:51 +0100
Subject: [PATCH v3 15/20] media: imx355: Define the exposure offset, and
 use that define
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-media-imx355-v3-15-9df386a623d7@raspberrypi.com>
References: <20260708-media-imx355-v3-0-9df386a623d7@raspberrypi.com>
In-Reply-To: <20260708-media-imx355-v3-0-9df386a623d7@raspberrypi.com>
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
index 2bf8da7469fe..3b86bd2e2e5e 100644
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
@@ -1129,7 +1130,7 @@ static int imx355_init_controls(struct imx355 *imx355)
 		imx355->hblank->flags |= V4L2_CTRL_FLAG_READ_ONLY;
 
 	/* fll >= exposure time + adjust parameter (default value is 10) */
-	exposure_max = mode->fll_def - 10;
+	exposure_max = mode->fll_def - IMX355_EXPOSURE_OFFSET;
 	imx355->exposure = v4l2_ctrl_new_std(ctrl_hdlr, &imx355_ctrl_ops,
 					     V4L2_CID_EXPOSURE,
 					     IMX355_EXPOSURE_MIN, exposure_max,

-- 
2.34.1

