Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54A2E3A4F26
	for <devicetree@vger.kernel.org>; Sun, 12 Jul 2026 11:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783857465; cv=none; b=WgSX796gz/1LHNjL4l8iwTeCFpRPCl24ODwg3Bm+4fwABgM9uYLWe4tIDUjfWo+idU5DmDrCwvsQ76L9UXPVxGHayeInjXxgePkGkLLzgAzTB9uMvnoR1Xd/kQyia/DM4IAOdtBwppHnyfbAWpGl7RQU1M32Gp2rL6nta55FTJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783857465; c=relaxed/simple;
	bh=2Fbe+51I+NHaqoJEm/Ia1P/RkOrsQ8sOHQ84+D4jX5M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RB6Kk/Dp8p1UNEL5VrWecLzCK8c4k6ylq1xCDkMLFoLM5R6MEYmEBv7VoOzFdz7vwP5E/qH7sQBrgI8ikhDWOKzSQKZxPxRBhisaXFJh7BMcXrl2wJWPYKxoQuDLNibH1bsxzs1NW4KDaSYNHw9cUED5TqqqscIUJzS/h9i+4N0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lx8dK1Dx; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lx8dK1Dx"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-38101f85591so2409119a91.1
        for <devicetree@vger.kernel.org>; Sun, 12 Jul 2026 04:57:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783857463; x=1784462263; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mrmu7Ax8Tjv7DXY7cz3wQn6QU0gYid8cSWvbdHALi/M=;
        b=lx8dK1Dx6EOJ93SWfzMu2Yrh46dyN5y1NDOQqa7T70moW1cMZoqgiB8eIb2VqkyqO2
         h3A7k6v0EJen2+rdr6lhowYylZx3a0Qwlcbjs2Jy5CZq8GOr6QtXT21kll3sUEvFVu6c
         RT0E8B3LHiFGdRy6J9sDrhomMfUXyJ8WaTQ9TA2URfyEZU4SNTn1KxA845JiUMhs2DbV
         tjKRZjHBW+ySvYNWMApWuYuO3daI5zGT73mJwsX4P3WrU152wPxjJUsLQBNHxGaD+foc
         Id14flc0NzohhuT9y5DJH5PMywfZEri0F4SE5UpfpthpBvrQXvODM6iUBobRmenJ7E6h
         Wixw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783857463; x=1784462263;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mrmu7Ax8Tjv7DXY7cz3wQn6QU0gYid8cSWvbdHALi/M=;
        b=VmOrYq+pfQ516VdZz7E3Mz/O0zSAkTWP3GAh9VV/iE1FOa8JPsUuo0ZUEESrtpk/ww
         /89ZCfNXY82xnECJ/fFKx+g9zbaasp+TVkLg2PTMnfDUfmd+Yji1arCLk54StE/bPGaL
         oZleYm/IrIevm9X5rln/GE1niS40uYQk9x69WFfTFYS6LrlRWLTZRkogjMd54unjP8LA
         kMtT9HoaXOVjU04jqWntDH5JMA2F7HQ036lZHqBb5NX7F0jPgDOON1+qdRZ+7Wp2/ocf
         Ulq6I1hNpyKZK6NL3K7XcifNHuLh/jAxuWlKv8yI9bB1rht1cnMrFHdP8zWx4pgctz3h
         /6DQ==
X-Forwarded-Encrypted: i=1; AHgh+RrXJ1W5Jc3aOAYOPcfJZLgAs3XImZ7IuNtoS8VWXWTeFsgr+jO7iGP59mE4Qw4ClG9XOBZJf4CW5Etm@vger.kernel.org
X-Gm-Message-State: AOJu0YxXcS2C/FxcHxuH6Z1wqLS9j+ZQDj5bThy1DEhWkqRSmT8ftlJj
	JdUVSftEoQSgIb09hKo8qEMzr4x+73bdt5s3MEjd5wojSNyCPEu3w/Pz
X-Gm-Gg: AfdE7ckb1d2tzH5Fi8ScGcok0PC2i/aXIaXO0z5MrKtPf1TpJGk5/qBbZn7kjZpIOwC
	skFogpyZMD6oQlQZR0ya6r5LWt0UOpTRdkGUM5lPa+lx1XfS4lRfJswq2PI18bErv1r3vBpuNVv
	thP6ZCiG64jTmEX50/O/f7fuCAGeXAG6t0ZOgbk9WrVZEqeTjuztMWCpZWWVE53Jlm8t1DxSKla
	jCgn9l45+8T75hD2V2T2FP7cIuQ8571mFbFaaKg5XG/AxpDNT7TGUmVl2jLXsDOizcQ8UgK/SB4
	wM85Pnyqmz2ILpwfmVVCnse/YFRSNGR4lenWQ0DsTj1VvUn3CVGdl1eW9OCuWzcHaHjzAUYcHHb
	X1J77a/WD6BtJi2efUulIqCj3kuoQmvPJ2JQMghTMx3o3k9MHv9xBrRF18G0i/RI1ekSUObxn6R
	TWOEO9/5lFid99A4/67mgt9+SrXzTFQRkuGQqplK0UF+t4eGG+dM+nHNkAMMBMOuq3
X-Received: by 2002:a17:90b:4f81:b0:38d:e397:9053 with SMTP id 98e67ed59e1d1-38de39790c8mr1551196a91.19.1783857457791;
        Sun, 12 Jul 2026 04:57:37 -0700 (PDT)
Received: from nuvole ([2408:8456:3a01:5d1c:f8f6:b057:1d4c:1d59])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38a57dc5820sm4833781a91.10.2026.07.12.04.57.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 04:57:37 -0700 (PDT)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: mitltlatltl@gmail.com,
	Frank.Li@nxp.com,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	festevam@gmail.com,
	hverkuil@kernel.org,
	imx@lists.linux.dev,
	kernel@pengutronix.de,
	krzk+dt@kernel.org,
	martink@posteo.de,
	mchehab@kernel.org,
	robh@kernel.org,
	s.hauer@pengutronix.de,
	sakari.ailus@linux.intel.com,
	sebastian.krzyszkowiak@puri.sm
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH v5 1/5] media: hi846: Fix hi846_write_reg_16 handling
Date: Sun, 12 Jul 2026 19:55:53 +0800
Message-ID: <20260712115553.92564-1-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260712115012.91600-1-mitltlatltl@gmail.com>
References: <20260712115012.91600-1-mitltlatltl@gmail.com>
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
2.54.0

