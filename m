Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EABF2DF156
	for <devicetree@vger.kernel.org>; Thu,  1 Oct 2026 16:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790873540; cv=none; b=C5qfArv3d6QEeNEbywV7+8dhCEQ6K72ZuHesZ4efK88qhT1klP3PdWJiU5G+r+eAEBlKT/EPvZ2ibuOwo4euOPHeNyLIhcr1sRyBL3MqjnHfjQsGgGDAZopbyh5OLhg/FR8pMi1swjPMRrmPVR/XS5LEPV+3QttcmlpZz1ewFzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790873540; c=relaxed/simple;
	bh=bnqOd4Vosj6qTGxWqIJJjxL09W4L0ejCJMqbiEbYD8E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LSK+ShcVqFmw1T4N4X4Un732AxfhPWLCQumBxeydq3rFfTQ0JjzL07iAaIdtiR40TPW9yC4qnubVf6/2coz0tGn380ByKfv0mxIFWuzecBSU8w0i2v874sSxXrJvHiWyQljbuJIuGngE6tqky4yg4ECNWb2qZhv7kqIuUP8Mj20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rlcBYEa/; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rlcBYEa/"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d391aso51879945e9.2
        for <devicetree@vger.kernel.org>; Thu, 01 Oct 2026 09:52:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790873530; x=1791478330; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iB7w74QLWRMVVgniVEpCjg8hEOB8LWs4xicokl1rOls=;
        b=rlcBYEa/cBgSjdO0YSD9vKAzs4q5RlzCCCXTn9MKrehGtndo71ubOOhjSVnCOCUc3h
         Sakojlyy5Eesd7TEGIaZP3IKMfqwexopp0u5qQV3Qv+9H2aSznaQcY9A2IVcHRLAZqL+
         U0qcltlGma5LSwWq/NiOhhBK24GqEyspGAhWPg8t9hKsjrVjgXEyhHtzxyasg/ACSHXV
         pcsyI/CRVYRJbZHKZ+Pvp4Rw4/jMRr3LlEaw/kgUAFk0Jaw84CJhqImFwDBy1us8NU4N
         O6xc+1qtBCoq/qMR2kyoZURSeFsFafZQRWTFur1Dzd3nYrZzHww7NAZA5V4SzX30GeDq
         FMow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790873530; x=1791478330;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iB7w74QLWRMVVgniVEpCjg8hEOB8LWs4xicokl1rOls=;
        b=Vt7pMhFWa/EsKjZm/GNpsDG9N689NqnaMWr/fLUU3NIHVUh0BIEv8P6acgeyo/RXbT
         rQ8qXLzdrQTP/X8yTv+JHxDX8BjNe13Nx8t0grZ2UDjf9NHTgJzsC0R/ecCB6esKZBs8
         2r2RtdClVhsxhv4hPeFD95Ghc5piD0mrfw+YxQ1wXatVGWXMxx+YCy18RC9hH4AHm68h
         zpTI67lziutTQzPyRGkqZvfwpwpY+X9tRriANxaedNYIbrFZlBSapgSqM3K9EtSqagMJ
         wPElLUw3bVtoJK3sAk0VMCXqF44jOCgasGDia4KeQTxazJV/2wSrkvMFSQhXdwGXYBJH
         g+9A==
X-Forwarded-Encrypted: i=1; AKwUvByJwwB/sAoA+w9UUfZtkgOLdMtWtJ5s5qdz58j4Ln4n97YYX+SnIr+uDv3A+ubMhYv1FI2uFGXCjlHF@vger.kernel.org
X-Gm-Message-State: AFuF++kGQ+2/BjVAMdvrzDpc/ASsWoSGkhfX2Kmj+kxsdsIJ7WsN5BWX
	Nqhlc3JbHKiY2Xoydq/nwFQahaSoclusVYd40S0aSroLqZfjYFFDVibM
X-Gm-Gg: AYBFou2t9zGwWd/cdXvPpxuCQtAn/w7g9TKVzCA8vbruJ75zTeLLHW74YOp38eB1cIx
	Kz+iFjxmzoAs23Lai8rtnw45p0FjZBRdqew2lQlJPNpl8+JpYtyUn+BH4CcDtudfnXhH70w5y8Z
	dAuAMbpwMNH9GQoGHEL8yLFyEdfTLFgwxgBijU6UpvfbAHYk7VGt3tvEVsmHuuoFu+Khhykkun7
	XeaHWBeE5+FTRigVmpRe/lpe3wIwEzggwkL7FICz+OoFB8e1me0+Hfk57qseICW6pqqksvEYW/c
	mYlGSIT3kzb1FjGD96Uf9B3OFNYa9lc5JnT1MyBbSyGIWoBIXJEB5peQdh3E8xKJ51QbSuYJy9o
	ZyGhKSQZWF7Fk4VwA8V9dnsGiVMIeMeNMCk8uzw8zEVn1LnAHVyKqCTpXjy4uA7RfWkkhMUj7XB
	+tyJhygP3ms9ypVESkOQ7BGOBJ/OV/XK6INLfRtEDwB+jqPNKOoMMvJNI4PQcWIivpqzhIAR+wV
	+z3o2NMwY1JSHZuArjmeGQucYooIXAxxuZcwkB84v4zKGqDyWViaSaqR/WqCh8rnJda02+w84vt
	oirjqEv0
X-Received: by 2002:a05:600c:4e48:b0:4a0:561:d0fa with SMTP id 5b1f17b1804b1-4a02769cf5amr4592405e9.18.1790873529990;
        Thu, 01 Oct 2026 09:52:09 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:1be5:ad57:d5e0:f854])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a027ae146csm480985e9.11.2026.10.01.09.52.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 09:52:09 -0700 (PDT)
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
Subject: [PATCH v8 4/7] watchdog: rzv2h: Drop runtime PM handling from WDTDCR init
Date: Thu,  1 Oct 2026 17:51:58 +0100
Message-ID: <20261001165201.763882-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261001165201.763882-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20261001165201.763882-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
v7->v8:
- No change

v6->v7:
- New patch
---
 drivers/watchdog/rzv2h_wdt.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/watchdog/rzv2h_wdt.c b/drivers/watchdog/rzv2h_wdt.c
index 4beaac44d027..e8a40482d580 100644
--- a/drivers/watchdog/rzv2h_wdt.c
+++ b/drivers/watchdog/rzv2h_wdt.c
@@ -255,20 +255,12 @@ static const struct watchdog_ops rzv2h_wdt_ops = {
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

