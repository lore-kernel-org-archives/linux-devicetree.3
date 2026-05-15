Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FFBB480946
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 11:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778845931; cv=none; b=AramchuVyEA3836YXs+lkEk/norlU2/ZscdxKJddD959cazKTSQH2J4Z9h9B9F4BsrxFtwpeTDcoVXAMLOJodpiJhsDpEWlAkSY6Z5EmM1/gxzvgvh2qb4yxK+GKZYiv5exXyux8gt4hqI04+B+EUk9rro3303nj4EGS349uibo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778845931; c=relaxed/simple;
	bh=db1UysockGOOdN/jD+3r0kklFbD/5UZUqI3qs3dKzM4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Js+olwAxrrBl3gAK8N2quXrhFx5ls5zRyAR2CW72X/Srwm3AIuPeI5x3P/hF135fP582QuhGMbCRvHpGRSJ/5aylIgmMuZsrXF8RrNS2D7Q5bP10ZlAXmoMSJN8T/8buriPuTPX+3Ts+DzN5r4KC09eTpc9akxMW3axatiDpypA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sEP04Sbb; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sEP04Sbb"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-44509921fbcso4674711f8f.3
        for <devicetree@vger.kernel.org>; Fri, 15 May 2026 04:52:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778845928; x=1779450728; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o6EhYJYljIpOTcXgWAOcvJXHIq/zZQeBLSK1ZR8tzzo=;
        b=sEP04Sbbjsu99K/P+JQRNYm9EWNvTZSeswcX556dBgLaSEAweQaOuSLU9lA+4zsDxL
         9JLTfL1joIxeLNoJavbOg6TbdvNr2kO9U+CMEwLiUT91LXpMQUreB2mCXTcxvuZaksnc
         m/586nsqcYj0F/GsHR0qQhRgtMuPwlhPk4TsHKMEVoxzYL8+OWi20xOdWDgCiyYegwCO
         xf/p10W89HVNEgUK+MR9bn7FQP9ul0IKWk8NRl7hylg9GVlEvYvt7QGCfmLdpl/Rpmsv
         Yb3+Mym90IJbg1rq4Yc2iWPNUWXo4YHcaPTaYcPp7LAAnNn9DG416jAOPkUOSpdZXrrs
         OmRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778845928; x=1779450728;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=o6EhYJYljIpOTcXgWAOcvJXHIq/zZQeBLSK1ZR8tzzo=;
        b=L6+srlSyVZDvbzFU2Z+NpPwPG145p0wM+y5hluIXVjIzHrRcWO7jXJBiJuvnJOVfnO
         GXHWEo/Jjgy2BweO7iYy1idV2B90riaT6alAOMsJYJ8m7/VgCHKcf4dmSMzR7K/sIZdB
         RW8irdZoRHMB60crPwRrd31oG+iMomwWFlVhEMkwXTJOiDjI1Ke5YVBCaWBC67YoMCWi
         Oq055/1EhzVDLrFNKoa6DwGppYLRjnfUROqzrB3YmsKb6c6p/stXbd0bNoCvQSC4Qg6g
         sr01xMOSOaxjIbgEngEBKxxqGFkGgJ71Zb9HFy1HNYVlHXhgfGnPPnkECsk6Iozq9krp
         NXPg==
X-Forwarded-Encrypted: i=1; AFNElJ9QAEGkdOzgg+fFnXwY2t0v4WKBObjhambJli5/HyQYPJN0QmKyrZKAn26BUhiWx09tLd9gAQSFqtnj@vger.kernel.org
X-Gm-Message-State: AOJu0YwKggUzuaMvEkBuNLHBzCb3GjmB2KxZForPDd0afUiLqa8d+up8
	lkZSyqTkClGjZkHRjxDlULqyx00uNHC2IhcYK8rYfluT0TUptG9MewYb
X-Gm-Gg: Acq92OFAoPIY+h+zajF23lYsNwZMo4nrRjyvJHCtewbTOb9+cGUI9Koowcq/E+iC355
	+0y5PLVc402fimiAb0dXnnXlUP9z+114eRyQVx13um359ng3AD9NKqE/MLVhRecfBCDTbl296kl
	FE9cc0PBN71QBIWOUO6L4AirUPbLIGwOIdkCcvcpyVCaGMCKP43me7HlX2MeJYLPVL7adIQMcyi
	DU9hZMX5Rln+RTCU+XTpOgX9A9KaGKEWuoSzDLKO4ZYtXVOz8IU7cjMf+zE7hrueIMvPcrN2RME
	kiemnnT9FmWKC0Fy1DXDgEihDxbft6MQgUx4CIWtTA7sgYKy9seCKbw68Xc0ZZCKJ6rmpomZZGJ
	+fLivZ8bLKdaIF7r9mBUdgGH2h3PAubhfje3wOdKRRav3dmK0IxeJ96uLBkWdqafgV23YeAAv+Z
	oMmHaFCZsjNg8jpnmDHnMytn7kaxbeGGG+UGUAR2UyP4/dMgzHjIBMmypZgncdp72Kk/OypyCuN
	AtstOtDJyoldBc8Wa1RW3CZo4o/xP7L7yOi3EJZqDNr+Pw=
X-Received: by 2002:a05:600c:858d:b0:48e:82b4:b54 with SMTP id 5b1f17b1804b1-48fe6514873mr39770125e9.23.1778845927690;
        Fri, 15 May 2026 04:52:07 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:c85a:b53f:fa7f:6b1a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe5cab818sm58376215e9.14.2026.05.15.04.52.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 04:52:07 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH v4 2/2] memory: renesas-rpc-if: Fix duplicate device name on multi-instance platforms
Date: Fri, 15 May 2026 12:52:02 +0100
Message-ID: <20260515115202.1515577-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260515115202.1515577-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260515115202.1515577-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

On platforms with multiple xSPI instances, the driver fails to probe
additional instances due to duplicate sysfs entries:

  [   86.878242] sysfs: cannot create duplicate filename '/bus/platform/devices/rpc-if-spi'

This occurs because platform_device_alloc() uses pdev->id for the device
ID, which may be PLATFORM_DEVID_NONE (-1) for multiple instances, causing
all instances to attempt registration with the same name.

Fix this by using PLATFORM_DEVID_AUTO instead, which automatically assigns
unique IDs to each device instance, allowing multiple xSPI controllers to
coexist without naming conflicts.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
v2->v4:
- No change

v1->v2:
- Add RB tag from Wolfram.
---
 drivers/memory/renesas-rpc-if.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/memory/renesas-rpc-if.c b/drivers/memory/renesas-rpc-if.c
index 0fb568456164..3755956ae906 100644
--- a/drivers/memory/renesas-rpc-if.c
+++ b/drivers/memory/renesas-rpc-if.c
@@ -1034,7 +1034,7 @@ static int rpcif_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(rpc->spi_clk),
 				     "cannot get enabled spi clk\n");
 
-	vdev = platform_device_alloc(name, pdev->id);
+	vdev = platform_device_alloc(name, PLATFORM_DEVID_AUTO);
 	if (!vdev)
 		return -ENOMEM;
 	vdev->dev.parent = dev;
-- 
2.54.0

