Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8DF9494A08
	for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 13:57:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787320656; cv=none; b=c2w12CdpAJl0kj90+cuU7pHqvaRFjtUE56CdcPy4mbkVnwYU0qZPBGN8PKWR5YexTpzhHisSkf96Fxp/poG9rqkyPngMuJ4/5JGSwm1qTZq5GaMKdl11C3R3nKb+Cl5x4ZDZUT28N+6+O7AuL/2uKTaUxgmAqA+n26w1ha7U/RY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787320656; c=relaxed/simple;
	bh=IluQ6/88LjvYk9tKrCE8MgZCp/KUwgzS1AviHu4hA3I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l5pmIM9JTZTSorUW9TCzBlx9rPay1xp3+iA06Vq+BrzE0i9XHlma0cyCeYJZHayYeNo7AjvB7xq9NeAO/1Tbux/KVytfTCVghozHhGM0ji3+vkukik2AXGGfrqwoj34aWlTj9A4YsZCSSf4/FVf527nm03VF4rCbVVyiQzb8mM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qpqhsCbM; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qpqhsCbM"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-395cf2535acso555237a91.1
        for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 06:57:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787320654; x=1787925454; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ioElP7foXHU/zV+3aMWaDuBuUqmVQTzgyvOHav4k8hU=;
        b=qpqhsCbM+r/RIJ/Vj2FxSJy7ZOoXNbDmeKDn9q4Bb7A/ZQzaeieoH9ZrczFnIcKlzh
         yRwr9hHxlF8uiTMiKQ8MGF+VIdB4DAF3s3mwIhguCUln7hvTMKF6V7TiMobuy2w4p+uR
         jPAqE8veLQU0g5e/lNhSVFLNCZgEPL3fKo7sF9jkqc6S55U7GOKumub9C/ofM54OGbNA
         YHa4/iN6EGMNg7kg82QT2XLFjCMy9zZjGa/8RfI1+8MQHIYO/wT3zUPH1+3MPZVVLNkr
         SI+0FZcKGpCEIpKUVvSqAz4NII+220+QfBaDK2AWdKyRjUgf+vw1tALeKSt73FAuJ2PU
         DokA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787320654; x=1787925454;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ioElP7foXHU/zV+3aMWaDuBuUqmVQTzgyvOHav4k8hU=;
        b=m6FdC4BDsLRbag+zKO4HrbbG9/76icWCA8Mev6JykMawh/l+4Dv2o9qhgQFuOSXb3U
         w0uI10Fb+h7PpmGCkfbB9pIXBJ1WBygiHocla4pHXjHohFraMo7RDMRAn7Y11pgYxoqo
         OKvVPY0XXqMauy3rEJdmxQ2Gn0CmdY+Bq2KhYk9syRMO4IU1x6whIYNcVw1XLvBOScNY
         C/wJHyFDPBxzIEqJOPLv/0I2UTzNDzPs1MolyprFJVhRwzAPiap1hbSnMPlG+66kAzXx
         D7w9pbisY0Xq3c2eLZ30o4GcWVYDZtZAId3SG8zu/04i3wnUZKGwc1uZahVnyJTN700o
         OCIg==
X-Forwarded-Encrypted: i=1; AHgh+RqtKhWwY/G9twIwRgv1HyjPBMOB978EXruMC7Cp0Egqfb6IkmDMi3OcpWfoczvgL3UU7ieg5uhAu1ci@vger.kernel.org
X-Gm-Message-State: AFuF++nGMCtH4pu3RQSuj7SEFexdaLNPpjhLVRuTYxicjXucAwjP9VNT
	VYp3N84QCAtfJshSPWkDOOketKhKnl1fxtbVj/9LHERPNiWzLmWNcoYZ
X-Gm-Gg: AR+sD13/dmy4CcttvmzAdYI8VRZZH4Ned5bRGjrhs6J4veP7OjP3apcdR2gNO9yx4At
	9xbpA/lCOirZG6tk9ZSYj9lGZXgsK/dicbGy874thjHfOWQyY0qZnawz4elTzJuN4grNKYr8BJz
	qKFaF+Xipu6wd3i0/+p+DRWzxRMtFHG2Co2QYmSrpHWTIPsKnxu13b8Nd1nml7rS5f/bNOFiTfV
	06KvlVV4zYNb9XQOlS0fSQrpsIoVS5j7tPjQhCO04p/psrKAVSvTEk0Bo0OGF9jdlFZt1RFS0bm
	9F3mp43PB92H36AZ7cyi6Uci99Y7UbXXq7G6qiPDjxMw0IO8qo2Wm8ztbpbG5WfYyF1JempPAts
	XTMVCCAW5+WmtWjJ0NM3RYLuOeWFRQdYBS3dv8oKrLjiJxTeNbYyu4c8aHIYLRXDdyLhGYJzplp
	gcq82eQJqLDq+x2Tzye098ZqLitrO3xJbhU0R7z22XLBBxiGCBbTvLNfnra049peZC12MBTJLrF
	ZpGBOi3bw2H51QEl0UaG8z9kUS7E4GVDqUVgRyRos5MQZrtulItsS/1j84V8WlKRK/A5Wy/a8BK
	D2HnIAbsiA==
X-Received: by 2002:a17:90a:d40e:b0:38f:a81:15b1 with SMTP id 98e67ed59e1d1-395a071b857mr17915084a91.19.1787320654034;
        Fri, 21 Aug 2026 06:57:34 -0700 (PDT)
Received: from iku.example.org ([2401:4900:1c07:efb3:773c:1c8c:24ea:eff6])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327d01ff056sm19972277eec.19.2026.08.21.06.57.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 06:57:33 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-rtc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v5 10/17] rtc: rzn1: Replace remove callback with devm_add_action_or_reset()
Date: Fri, 21 Aug 2026 14:56:01 +0100
Message-ID: <20260821135608.275233-11-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260821135608.275233-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260821135608.275233-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Simplify the driver teardown by registering a managed cleanup action with
devm_add_action_or_reset(). This eliminates the explicit probe error path
and allows the .remove() callback to be dropped.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
v4->v5:
- Fixed conflict due to moving the pm_runtime_put_sync() patch prior to this one.
- Added Tested-by tag from Wolfram.

v3->v4:
- Added Reviewed-by tag from Wolfram.

v2->v3:
- New patch to replace the remove callback with devm_add_action_or_reset().
---
 drivers/rtc/rtc-rzn1.c | 56 +++++++++++++++++-------------------------
 1 file changed, 23 insertions(+), 33 deletions(-)

diff --git a/drivers/rtc/rtc-rzn1.c b/drivers/rtc/rtc-rzn1.c
index 6a434cb418cd..02d720e95a7f 100644
--- a/drivers/rtc/rtc-rzn1.c
+++ b/drivers/rtc/rtc-rzn1.c
@@ -384,6 +384,17 @@ static const struct rtc_class_ops rzn1_rtc_ops_scmp = {
 	.alarm_irq_enable = rzn1_rtc_alarm_irq_enable,
 };
 
+static void rzn1_rtc_disable_hardware(void *data)
+{
+	struct device *dev = data;
+	struct rzn1_rtc *rtc = dev_get_drvdata(dev);
+
+	/* Disable all interrupts */
+	writel(0, rtc->base + RZN1_RTC_CTL1);
+
+	pm_runtime_put_sync(dev);
+}
+
 static int rzn1_rtc_probe(struct platform_device *pdev)
 {
 	struct rzn1_rtc *rtc;
@@ -421,18 +432,19 @@ static int rzn1_rtc_probe(struct platform_device *pdev)
 	if (ret < 0)
 		return ret;
 
+	ret = devm_add_action_or_reset(&pdev->dev, rzn1_rtc_disable_hardware, &pdev->dev);
+	if (ret)
+		return ret;
+
 	/* Only switch to scmp if we have an xtal clock with a valid rate and != 32768 */
 	xtal = devm_clk_get_optional(&pdev->dev, "xtal");
 	if (IS_ERR(xtal)) {
-		ret = PTR_ERR(xtal);
-		goto dis_runtime_pm;
+		return PTR_ERR(xtal);
 	} else if (xtal) {
 		rate = clk_get_rate(xtal);
 
-		if (rate < 32000 || rate > BIT(22)) {
-			ret = -EOPNOTSUPP;
-			goto dis_runtime_pm;
-		}
+		if (rate < 32000 || rate > BIT(22))
+			return -EOPNOTSUPP;
 
 		if (rate != 32768)
 			scmp_val = RZN1_RTC_CTL0_SLSB_SCMP;
@@ -445,7 +457,7 @@ static int rzn1_rtc_probe(struct platform_device *pdev)
 	ret = readl_poll_timeout(rtc->base + RZN1_RTC_CTL0, val,
 				 !(val & RZN1_RTC_CTL0_CEST), 62, 123);
 	if (ret)
-		goto dis_runtime_pm;
+		return ret;
 
 	/* Set desired modes leaving the controller disabled */
 	writel(RZN1_RTC_CTL0_AMPM | scmp_val, rtc->base + RZN1_RTC_CTL0);
@@ -468,14 +480,12 @@ static int rzn1_rtc_probe(struct platform_device *pdev)
 	ret = devm_request_irq(&pdev->dev, irq, rzn1_rtc_alarm_irq, 0, "RZN1 RTC Alarm", rtc);
 	if (ret) {
 		dev_err(&pdev->dev, "RTC alarm interrupt not available\n");
-		goto dis_runtime_pm;
+		return ret;
 	}
 
 	irq = platform_get_irq_byname_optional(pdev, "pps");
-	if (irq == -EPROBE_DEFER) {
-		ret = irq;
-		goto dis_runtime_pm;
-	}
+	if (irq == -EPROBE_DEFER)
+		return irq;
 	if (irq >= 0)
 		ret = devm_request_irq(&pdev->dev, irq, rzn1_rtc_1s_irq, 0, "RZN1 RTC 1s", rtc);
 
@@ -485,26 +495,7 @@ static int rzn1_rtc_probe(struct platform_device *pdev)
 		dev_warn(&pdev->dev, "RTC pps interrupt not available. Alarm has only minute accuracy\n");
 	}
 
-	ret = devm_rtc_register_device(rtc->rtcdev);
-	if (ret)
-		goto dis_runtime_pm;
-
-	return 0;
-
-dis_runtime_pm:
-	pm_runtime_put_sync(&pdev->dev);
-
-	return ret;
-}
-
-static void rzn1_rtc_remove(struct platform_device *pdev)
-{
-	struct rzn1_rtc *rtc = platform_get_drvdata(pdev);
-
-	/* Disable all interrupts */
-	writel(0, rtc->base + RZN1_RTC_CTL1);
-
-	pm_runtime_put_sync(&pdev->dev);
+	return devm_rtc_register_device(rtc->rtcdev);
 }
 
 static const struct of_device_id rzn1_rtc_of_match[] = {
@@ -515,7 +506,6 @@ MODULE_DEVICE_TABLE(of, rzn1_rtc_of_match);
 
 static struct platform_driver rzn1_rtc_driver = {
 	.probe = rzn1_rtc_probe,
-	.remove = rzn1_rtc_remove,
 	.driver = {
 		.name	= "rzn1-rtc",
 		.of_match_table = rzn1_rtc_of_match,
-- 
2.43.0

