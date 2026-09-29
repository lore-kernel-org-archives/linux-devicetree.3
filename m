Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34B8F51C05A
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 10:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790679055; cv=none; b=Fj0vvVFMQjWwd8qUu2ukLtaacZgjSaJw799CGKoz8C1JoS65TluQ+of/6vtTzeSDTdC4X/QmRfZXcDAO61VyC3KiRQNDQyaPEXmGcJPohARznYOadq/V3c3T8WP12aLfFstYQJSTwXIrIRlttxS8xpyGnBwPQ+V1nTY5Shbo//0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790679055; c=relaxed/simple;
	bh=Nlv1m2l7ghTkT3cO5yFi20nfIAUpd2j8NLnXbA6e+rM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SrRGtC1YGgq6W+IHsnRB5RhYuoFhprXl9PzrJoef7z433lIbmBhKS2wOzM7yKKCL6EEFvM9/JLIQQ06ouZ0quyvf4uxP5X38Tf73A5unk67faQ3VhUG8kjcmGmTq8IyKZxIyHPCr0HTW48ll7NIF9eDnLDeURsHv7YY1mHOHoJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NgtErF8d; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NgtErF8d"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-486e1a044c5so3383614f8f.3
        for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 03:50:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790679040; x=1791283840; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N5tHtfYr9TOddaGe2pXDMEwIuJ0LgMwAhApw2cB2IqU=;
        b=NgtErF8dUX2SZCDiJiA/8syDRYJR4n/Kazm2CT+81R3QoJzDZwJylIodtle9Lv5RyL
         XEH9E2btWxkb4PnG9azveAWhfNMgiRhoredtO2GXY0fs0qFvT+ASdAim63AKLPzdz+UX
         zgbX/rAmi5iv4db3yQI11XDfYGFm6joBjpkOJyaTCs435mjuwDJYOfmsHMBNqiisix17
         k7TlvZnxyXjxnveiirGeOwXSREMNk2YrH3RFcugZBv/dNP/mR4BP+ICVuTNtjkVVtL7X
         4buwxQaDyyBsSSFmD8QDeKtgq516jYSwHeGBY1cTq7O8P/tI52VGD2gLwzCXNSdGOsfT
         6TyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790679040; x=1791283840;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=N5tHtfYr9TOddaGe2pXDMEwIuJ0LgMwAhApw2cB2IqU=;
        b=jpWnSzKRxjwc0g7gklfFjveuGoDdDlGmy4uuZDQb1okAATiYlrmyIjr9ifEb4o8zre
         p/FRoOuTiVTTA84ofNI/gw2RI0CqGF8mGXhI0DD0vByscxGkVMWkD/AT1zc7ES5tWnoM
         gIeMdk/7U541V2AgxIHfZT2NkOWOe+BGM2vswpNsVYohykcnOjsO75t3WUl3NNHGyPEW
         bVMwaRFrB9gwUMrVv04E/xpq60i7e5fdiI1sUjhR2rKYzzG1vhGqTVwWNVNeymSNM8Cy
         sMV27MrzypjRQamQaoVicV1ZTNlYf5/kZKqAbVmoz1f+7tqZ6NH2QVAA06IfdyFzZdVG
         MIVA==
X-Forwarded-Encrypted: i=1; AKwUvBxPJoUvjAM1ZKwnsAFBIuFKt32NuF+QC3xTSzPh7jcYbS12Sil64TLisH4uWL1cK/giyKdKfUpu5qCo@vger.kernel.org
X-Gm-Message-State: AFq9FYJqkN5DSt9J1U/jjqs/kIkCN7yhsp1tLzr+3HDXSKq+W2fL2MQp
	eyh6w5x3Dxaq9ozlbgBqeX5DWwDMbZj2rqTcmSqILM1/sZ6wYy9YH0Ig
X-Gm-Gg: AYBFou1FevXaNv8hBIh6WDpXHFiwiLVVVngT/aZG8/QB/A+NmzVZVsGhBnIKtRAFnTy
	pcjnn5VAnLANeKjFfJOtuTU5ifT5YndK1+2p1nQX4+7kEa1TGvPLQQdErIpGxKo+wU/QDjANgQB
	ymVZqn0MltRnCU1NxAmXajCzbRRXmM9gimstWd+dXDwHUk3vasCCyJWGF2ybI5o/MKTcdHmCvwU
	QanrTGamuYVlUpenydsoiNrO4r5a1CEXeS3RI8p6jx6903qZGTC09shfquJCOSxmfVKBT+GvHec
	Jk9o35HqUx534V4TMHh39z8BMmbwpuFLhto+ngaP0Cpc1gkeDqm2Xh9AKzM+tSGJlqT3ke1yj4D
	nIHKmcGlBCndu3DlTt9+RFHoObzhEhi7Et7zlEACmtj6JxWMT0wVC9LdQ9BeS0FBmxvNcPy2q7A
	qBg16Sa7yeBMK+FtKPB5ee7PSYLTK1GJpv84jdJgUQhNh/eINTwPUTo4ooInzVxEvHxXy0EKgTY
	2eOXa9WQaq2cKk4bwujuL+FklV4gYr3pkXS0WpNXBarltD5wU9d9+KsqUox//Xm67MWvhpCf6an
	lS9Y7vhJwwe5wPYByg==
X-Received: by 2002:a05:6000:230e:b0:488:5d44:6680 with SMTP id ffacd0b85a97d-4887175f986mr28573245f8f.36.1790679039746;
        Tue, 29 Sep 2026 03:50:39 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:10d5:21e1:1aae:c9d8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48af5058c52sm3516303f8f.19.2026.09.29.03.50.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 03:50:39 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Guenter Roeck <linux@roeck-us.net>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v7 5/8] watchdog: rzv2h: Drop runtime PM handling from WDTDCR init
Date: Tue, 29 Sep 2026 11:50:18 +0100
Message-ID: <20260929105021.542730-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260929105021.542730-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260929105021.542730-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

WDTDCR is located in the CPG region, outside the watchdog module, and is
accessible regardless of the watchdog's clocks and reset state.

Drop the unnecessary runtime PM handling from WDTDCR initialization and
access the register directly.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v6->v7:
- New patch
---
 drivers/watchdog/rzv2h_wdt.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/watchdog/rzv2h_wdt.c b/drivers/watchdog/rzv2h_wdt.c
index 17c9e9a24ce2..40157e969f58 100644
--- a/drivers/watchdog/rzv2h_wdt.c
+++ b/drivers/watchdog/rzv2h_wdt.c
@@ -242,20 +242,12 @@ static const struct watchdog_ops rzv2h_wdt_ops = {
 static int rzt2h_wdt_wdtdcr_init(struct platform_device *pdev,
 				 struct rzv2h_wdt_priv *priv)
 {
-	int ret;
-
 	priv->wdtdcr = devm_platform_ioremap_resource(pdev, 1);
 	if (IS_ERR(priv->wdtdcr))
 		return PTR_ERR(priv->wdtdcr);
 
-	ret = pm_runtime_resume_and_get(&pdev->dev);
-	if (ret)
-		return ret;
-
 	rzt2h_wdt_wdtdcr_count_stop(priv);
 
-	pm_runtime_put_sync(&pdev->dev);
-
 	return 0;
 }
 
-- 
2.55.0

