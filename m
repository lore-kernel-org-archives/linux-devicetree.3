Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D9B0353A7F
	for <devicetree@vger.kernel.org>; Sun, 30 Aug 2026 16:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788105766; cv=none; b=WRJwvz2tTVpNaCT1w49Jbd+B6dOg2+0u0jbvVFRvpWqlqdjSjiSlfBz3vGEwWQILDZTO/bvegwAPuhz39Cxkv0udPBTZ6jNdK0AERE4jxRePWT0sdnK9zZzTJr9pOu4baGfBwlvsikuzBWrvb8d9pfUWMBW70dz3PmOOqg/B3e8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788105766; c=relaxed/simple;
	bh=izFkUJVrZGWtWRP+0Tn/5mmA4bhWogEsegWu0OodXqM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qy8o0UP5n/2OdM4y5y4m6ImT7rsXXV8Kt49aQdDVSaoGgv5q4Op6YB5rtskjL17XfkG656u9dmA+HCiJYDy7chJa2dZLON+itG4K2/v4Pugwhc8BaX26fwpqJHLqQ8xjd2KlvedOVrz+up3taZU3+tQTIeMR7JKkqbMxMTtkHYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U34CmqsL; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U34CmqsL"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-cc11a905ba5so1861354a12.2
        for <devicetree@vger.kernel.org>; Sun, 30 Aug 2026 09:02:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788105765; x=1788710565; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q4Gd3Zu6V237u3MJ1sYGZ7SxZwjOc/OROhTL4anxICY=;
        b=U34CmqsLxyMtCcvAj69YvARsucH9vsfcFfQ+QtHYgO5dncuyv9kbFO40P0J+FefEsg
         qEMCQb8PQKAL/mfCyAbKZHCfr0j06yMZKMRiXsTXyQOXt2oa9uGeluMAHTVxmXVpHcGH
         06k73OO6XsQuzyIngkhsGDUAYXJq7dPKDqPTwQB/n6OqBkV6OibmNFDjya+YfGjDqhEM
         rDxXb50wSoLtGMWQzJMcObSMP0sHGArok9Ni7V2yS1W0EuBO4mHESCJgFOKQF3wtsKzr
         UAchMdL0mq9Xi+94SEGfMZjQsoqGDcBuMPONwwT6A+olhn9NhU8Pu3XxZdUla5QBkJV+
         8NUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788105765; x=1788710565;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Q4Gd3Zu6V237u3MJ1sYGZ7SxZwjOc/OROhTL4anxICY=;
        b=grzzW2bJSnOvMeFcvLWD6R4hYeTztHhcJgDbeGiblE+vdI80+NuiuH/wfeUAPqHK0Z
         bhfiWnJapAx3l6KYLL8001ASR3HbPR913ZQcHlDxok6Qzv6BB3zc3yAB3g8caUm0ZzuB
         9gyC1TE8Le4iJC9VCSrnoKXEKDA2ahH/kWWpGjhaBGNlB8c7wJSuyr73XVwRIRDpvSf7
         pMm1B4s/lz7XhrzaeS2uBf7PU/EkBxSKrzCA7jfNjfVf45PfsxkRv2dWbKo1tMfjIK9w
         88fHshKDILHgMSZTUbp50/Ixr/oRIkpBs9lrKdrr8nMqrZ/3MNSw8ZsnTjbjdJGI5a9N
         oQqw==
X-Gm-Message-State: AFuF++moH9XND78ZIAO+HxhVELlr3e4miobxf9ghrwhe/tDh4x+KqP8T
	siLK213qBgTrbckwAph3atEwollWG+oe26r27OI5geR51foAqMK1py/I
X-Gm-Gg: AR+sD11VWRjdPXEVhX95sZkHlSwQ8ui3LhCJPsICRyyt1yOCVik177ZXr12kNYLaZf4
	NznLeIQ5mlyWonRc8EA8WLEKHqe6e0J8zS89nftQkdDngLVrlGhmMmo3o03pOhneYMlGD8Poxpb
	k8u+Q1A5vL/2fWp1CJuEzahxMpdSilbtzArPsMt52EgT5oJ0euB3pmfY5y/rx24CKiUZFPMZ1qX
	dFZeZpglWBvBq0G1oTacQKRAvgl47dTcH8q0EFfqU2UJeTQwVmH9n3dOPb/yvdIY491GZ5JAi93
	sVFsPS50Uu7MdZhqK0Mthl0TOjoAOkpI3AyH3bTCR9sf/5vbIVoy6fQj6byYfbe2fgZ2awLQVYi
	tIfu/QRvhCP6jEN9GGnRwHTdCLzms88pXlTSLvuVTP5QBQ/RkYNuwruNlhPjL4hTSPGhG6y3ioE
	JawQLXiLUBtVhK2gszMahVARp67mav1ydCJ1ZO/t65l8F3Wej/0Msf2ie0jpxV+X5HaM2la0wN8
	wNSvcZe+IbEK+vVG6iBflSToThRzH5BTyL5QHXXURoD2Hq079QE
X-Received: by 2002:a05:6a20:4322:b0:3d3:af85:eb98 with SMTP id adf61e73a8af0-3d3af85fc5bmr16153694637.26.1788105764564;
        Sun, 30 Aug 2026 09:02:44 -0700 (PDT)
Received: from nuvole (2.248.212.35.bc.googleusercontent.com. [35.212.248.2])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc1f3312270sm2839584a12.11.2026.08.30.09.02.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 09:02:44 -0700 (PDT)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Martin Kepplinger-Novakovic <martink@posteo.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	Pengyu Luo <mitltlatltl@gmail.com>
Subject: [PATCH v6 1/5] media: hi846: Fix hi846_write_reg_16 handling
Date: Mon, 31 Aug 2026 00:00:21 +0800
Message-ID: <20260830160025.211384-2-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260830160025.211384-1-mitltlatltl@gmail.com>
References: <20260830160025.211384-1-mitltlatltl@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

hi846_write_reg_16() does not clear a positive *err value on success.
pm_runtime_get_if_in_use() returns a positive value when the device
is already in use. When hi846_set_ctrl() passes &ret holding this
positive value) to hi846_write_reg_16(), the function returns with ret
as is, the positive value propagates back as a return code, which
callers interpret as an error.

Fix this by resetting *err to 0 only when it is positive.

Fixes: 04fc06f6dc15 ("media: hi846: fix usage of pm_runtime_get_if_in_use()")
Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
---
 drivers/media/i2c/hi846.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/i2c/hi846.c b/drivers/media/i2c/hi846.c
index a3f77b8434ca..7f069aca0fce 100644
--- a/drivers/media/i2c/hi846.c
+++ b/drivers/media/i2c/hi846.c
@@ -1271,6 +1271,8 @@ static void hi846_write_reg_16(struct hi846 *hi846, u16 reg, u16 val, int *err)
 	if (*err < 0)
 		return;
 
+	*err = 0;
+
 	put_unaligned_be16(reg, buf);
 	put_unaligned_be16(val, buf + 2);
 	ret = i2c_master_send(client, buf, sizeof(buf));
-- 
2.55.0

