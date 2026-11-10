Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.231.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794294180;
	b=b8LERjO+E6QUnaBBwysSDF3nfp6qy8hkqY/4nPfRS5IW9Gmf8NO6QXtysO5i+6xwtAzv
	 sB1SQx4JR2GsU8G+ShPLMnHPRh2eFsqDhmDlRznH0HRIaDTnBXwR/Q5MrJwyNsyNfBg8J
	 +KQgmj9f9BDsnyy47poun1BMziTj3fQvGyCdxHlE3A62Q0ROEV4AFdULDslFbhDjrkdQI
	 RW9avI9ec8EUTzrzjHVasb4iBwujTK+OPL7lfdVCfP9SIuz1Etqx/YH4XrfKWQvJ3q43z
	 zS1Wyg3IsfDqC2iesMbjy3tL/91lRg06jOz224/bhfrVrlj5dldAxCTB8cCsGGZ15Mg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794294180;
	h=DMARC-Filter:DKIM-Signature:Cc:From:Date:X-Mailer:Content-Type:
	 Received:References:X-Original-From:In-Reply-To:Message-Id:
	 Mime-Version:Content-Transfer-Encoding:To:Subject:X-Lms-Return-Path;
	bh=VtDaiBvkfKI1+bXdcUXzcnZOabPvH6+FEFj3kyTZ72Y=;
	b=QTj/MvapRwCFweVTxJWcqq2Wp4EV7d7wPc5biDIYr2JOScthyzL9FmUW05Ur9ghsPA+I
	 kpCPeIlrA31S5aDthYk1cwLbwleObUw7ec8hm2Ds1JGa9HXQsVCBMgTMp0mtx8XcNZ4OT
	 HV9Gg5idmFDVtmY3szgq7iHyY2mo5TiOUJvNxu70NDEqJrAY93SsdIDUHeq8nt1Qe2Cbe
	 tkNc2SKAtYLkZ4ds5cJRz1os1RnTdTAofVksGwO4O0Dq3eI/1pa13TsW1VeuhZrt/PdP5
	 rSjalJmOcen7RJcR1RNhZz6ddr0AKh/2aJ6vx0N7Z81uzjLrpbPPmB+n5B2QSNN2nfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.cipunited.com;
	spf=pass smtp.mailfrom=oss.cipunited.com;
	dkim=pass header.d=oss.cipunited.com header.i=@oss.cipunited.com header.a=rsa-sha256 header.s=feishu2303200042 header.b="d9GI3/Bp";
	arc=none smtp.remote-ip=209.127.231.54
Received: from va-2-54.ptr.blmpb.com (va-2-54.ptr.blmpb.com [209.127.231.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84D14606A336
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 07:02:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 84D14606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.cipunited.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.cipunited.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oss.cipunited.com header.i=@oss.cipunited.com header.a=rsa-sha256 header.s=feishu2303200042 header.b=d9GI3/Bp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=feishu2303200042; d=oss.cipunited.com; t=1794294174;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=VtDaiBvkfKI1+bXdcUXzcnZOabPvH6+FEFj3kyTZ72Y=;
 b=d9GI3/Bpox/LDYRbAdfDF3TMwJ1HXTzwZLm6rJY0h6UxDvk/7dGgm3ciG7BxeMvnxd2Y+K
 a6rpsPcGJUE9JLBrQlpaN4oDe7hRjYLrDqnaVlKrkbAH7Vp/4uWqK83VGunKgJIS3+i/Is
 M2ancIUQV+NNQph+Rx0lfaf8uY18evuXkfqmFVPeo332xtgPw7IfDKiQ61FkDh7iLDQjfv
 G6p+ll7860h91JSpkGYb/0cuJbQkZg/dhn6NB+IYno8A4/32MVB3LHL+v8bY6lkol/gE5E
 2iJCQ1JGUEBxXEfIOFapKIgN09ZEIbBkBJLOdaAcJmhe7unavkLZeCKgq9HEsw==
Cc: "Rong Zhang" <i@rong.moe>, "Yao Zi" <me@ziyao.cc>, 
	"Icenowy Zheng" <uwu@icenowy.me>, 
	"Jiaxun Yang" <jiaxun.yang@flygoat.com>, <linux-mips@vger.kernel.org>, 
	<linux-watchdog@vger.kernel.org>, <devicetree@vger.kernel.org>, 
	<linux-kernel@vger.kernel.org>, 
	"Rong Zhang" <rongrong@oss.cipunited.com>
From: "Rong Zhang" <rongrong@oss.cipunited.com>
Date: Tue, 10 Nov 2026 15:02:31 +0800
X-Mailer: b4 0.17-dev-ce4c1
Content-Type: text/plain; charset=UTF-8
Received: from [127.0.1.1] ([1.192.71.23]) by smtp.feishu.cn with ESMTPS; Tue, 10 Nov 2026 15:02:51 +0800
References: <20261110-mips-ls7a-wdt-v1-0-968bb85122e6@oss.cipunited.com>
X-Original-From: Rong Zhang <rongrong@oss.cipunited.com>
In-Reply-To: <20261110-mips-ls7a-wdt-v1-0-968bb85122e6@oss.cipunited.com>
Message-Id: <20261110-mips-ls7a-wdt-v1-2-968bb85122e6@oss.cipunited.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
To: "Keguang Zhang" <keguang.zhang@gmail.com>, 
	"Wim Van Sebroeck" <wim@linux-watchdog.org>, 
	"Guenter Roeck" <linux@roeck-us.net>, "Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Conor Dooley" <conor+dt@kernel.org>, 
	"Thomas Bogendoerfer" <tsbogend@alpha.franken.de>
Subject: [PATCH 2/4] watchdog: loongson1: Add Loongson-7A watchdog support
X-Lms-Return-Path: <lba+26af2c19c+d3620a+vger.kernel.org+rongrong@oss.cipunited.com>

The Loongson-7A watchdog is similar to Loongson 2K0300, except that it
has no clock controller.

Retrieve clock frequency from OF to make it work.

Tested on Loongson-LS3A4000-7A1000-NUC-SE and Lenovo KaiTian M530Z.

Signed-off-by: Rong Zhang <rongrong@oss.cipunited.com>
---
 drivers/watchdog/loongson1_wdt.c | 29 +++++++++++++++++++++++++----
 1 file changed, 25 insertions(+), 4 deletions(-)

diff --git a/drivers/watchdog/loongson1_wdt.c b/drivers/watchdog/loongson1_wdt.c
index 2811e7eab631..57b9e699c131 100644
--- a/drivers/watchdog/loongson1_wdt.c
+++ b/drivers/watchdog/loongson1_wdt.c
@@ -31,6 +31,7 @@ struct ls1x_wdt_pdata {
 	u32 timer_offset;
 	u32 set_offset;
 	u32 wdt_en_bit;
+	bool no_clk;
 };
 
 static const struct ls1x_wdt_pdata ls1b_wdt_pdata = {
@@ -45,6 +46,13 @@ static const struct ls1x_wdt_pdata ls2k0300_wdt_pdata = {
 	.wdt_en_bit = BIT(1),
 };
 
+static const struct ls1x_wdt_pdata ls7a_wdt_pdata = {
+	.timer_offset = 0x8,
+	.set_offset = 0x4,
+	.wdt_en_bit = BIT(1),
+	.no_clk = true,
+};
+
 struct ls1x_wdt_drvdata {
 	void __iomem *base;
 	struct clk *clk;
@@ -129,6 +137,8 @@ static int ls1x_wdt_probe(struct platform_device *pdev)
 	struct ls1x_wdt_drvdata *drvdata;
 	struct watchdog_device *ls1x_wdt;
 	unsigned long clk_rate;
+	u32 freq;
+	int ret;
 
 	drvdata = devm_kzalloc_obj(dev, *drvdata);
 	if (!drvdata)
@@ -136,16 +146,26 @@ static int ls1x_wdt_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, drvdata);
 
 	drvdata->pdata = of_device_get_match_data(dev);
+	if (!drvdata->pdata)
+		return -ENODEV;
 
 	drvdata->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(drvdata->base))
 		return PTR_ERR(drvdata->base);
 
-	drvdata->clk = devm_clk_get_enabled(dev, NULL);
-	if (IS_ERR(drvdata->clk))
-		return PTR_ERR(drvdata->clk);
+	if (drvdata->pdata->no_clk) {
+		ret = of_property_read_u32(dev->of_node, "clock-frequency", &freq);
+		if (ret)
+			return ret;
+
+		clk_rate = freq;
+	} else {
+		drvdata->clk = devm_clk_get_enabled(dev, NULL);
+		if (IS_ERR(drvdata->clk))
+			return PTR_ERR(drvdata->clk);
 
-	clk_rate = clk_get_rate(drvdata->clk);
+		clk_rate = clk_get_rate(drvdata->clk);
+	}
 	if (!clk_rate)
 		return -EINVAL;
 	drvdata->clk_rate = clk_rate;
@@ -191,6 +211,7 @@ static const struct of_device_id ls1x_wdt_dt_ids[] = {
 	{ .compatible = "loongson,ls1b-wdt", .data = &ls1b_wdt_pdata },
 	{ .compatible = "loongson,ls1c-wdt", .data = &ls1b_wdt_pdata },
 	{ .compatible = "loongson,ls2k0300-wdt", .data = &ls2k0300_wdt_pdata },
+	{ .compatible = "loongson,ls7a-wdt", .data = &ls7a_wdt_pdata },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, ls1x_wdt_dt_ids);

-- 
2.55.0
