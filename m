Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.231.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793638234;
	b=f9OOp5QlDZEpKdU4Yp1YXBctsGJDk0Bp2Al+ESa/Tfv9SGuPlfwj9ZBa+Mq92lUxVQhj
	 XDuj66YWCJaXLwX5+3ZbeXiLZscy+n1BwFo4BuLuv9c3Og38Sg8JG9F0XoDi/1F1kEeUh
	 4wDwavQAZyH1QvzUooDSXPOjw7rr3vQredP17G/A/5TW9gWO2vxee8RQtS0wKfQUm6oD7
	 0PS7k0HYFYNAxlS38k8mrmdkB6nY9/IIN7WNP7A6OPHqJTxpDJzVBnSHII6C1gkXXF7xA
	 44BrASaLx2v614Cfn9hlPj9Ii/OYFPV+zUQL2tPmgHMPNwiBzbYvwQxHtIxxknzASxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793638234;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=K8BYvSAD0vaRsrXFQzKVgQ9ORTXgw762XXjLlecX85Y=;
	b=ryiAI1FJyfCsVDeHs2OXdkasqoVIpcqqfGgQI//IsrbdmNa/qx2MWaDncoRSyNxavE0X
	 fUYFkyTy92NmC5UMoP3g20ZrTUprY6dKoRL8Vn287OLBVmk27k7xlcIBz8exbPcB0iJXU
	 i8cmOTM/seir+ihvKbJKgvMgFWvc/BQfVcoQ4hTYTkI5AHFh5Z8Ct2U3TKPd4a+NRg3Kd
	 iIsPgJvN1317XHYj7RgqUxNgTISd7hBVlJwUxN2oQYj2SZsBqLjFimMxKNGFi0aM1SdFj
	 KiEr9F9fgfKOgnpWNZu4Rjmw32htz7qoGgIYY5xq7/PBVQWzlltcPb0E08b2Z7KmicQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rHfQ1jyI;
	arc=none smtp.remote-ip=74.125.231.131
Received: from mail-oo2-f3.google.com (mail-oo2-f3.google.com [74.125.231.131])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D03A6607466A
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 16:50:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D03A6607466A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rHfQ1jyI
Received: by mail-oo2-f3.google.com with SMTP id 46e09a7af769-8459f7bc7c0so252492a34.1
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 08:50:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793638231; x=1794243031; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K8BYvSAD0vaRsrXFQzKVgQ9ORTXgw762XXjLlecX85Y=;
        b=rHfQ1jyI8vgeZsIJ8/crxP6sQGfOrqxThPsEAA/+kbRZwUIEBpVbtv0fgCcZRIF23D
         jawXtmxCraOCtUMOjgKF2+S9Ww0FRiTIgABHxilJk8/hfn/bzcoHiYI0KZHSPccxiW1I
         1/agQFhLFa1IMgaD9Szej8Q3tnpjCpN8FCN8tOVSKSnxBziMSactzZwu7lizWLGztw7C
         DLip1LNDcM8jd8J2A0nS64qm7jIGRLOTEvSlRagL8a/hh/ywh/oAVXto359VwJJBwv5y
         Ik9/Ifb/YIaU/OECBjMSkLi69Zsj7Tf81u12NAT+xnj0Y+qS/2TsgMNydiWc0Ps5ACLr
         V1HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793638231; x=1794243031;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K8BYvSAD0vaRsrXFQzKVgQ9ORTXgw762XXjLlecX85Y=;
        b=Tkb2E2XRrB1qctQ5QTUKDchO/VUc/aS52jVsK8pae7NEC+sd6k2SZkfcWKdgKqkV4c
         bHn0OYzQQixvP49CpMaSAv9Yuh8y3T20d6qg1uEg9y/KW+uOF+Ectml3M6wBnZt/l4rw
         JpMivhe0Hms6v7ztFOyvEi6nkihTu6r4R9AXvogAJp4g7vwCtrLGg/y2Y8hYXio1HZIE
         LHkG3cZ2Hszp89E6PODr4+O8F9WoqyWjLJ2SoMn3iqW9CF10Z3dA7isYyImmOiDElGdv
         oZSohZpVK7Wvsv3xr/EfROeR05GV0UDwDGhV5pe09SEgBb/f7Hj76n0FXmDHqW04tAJ3
         Tm9Q==
X-Forwarded-Encrypted: i=1; AKwUvBwyRHsImonBzkE6KWdYLIixkxhkFH+2i+ibaYOtpWqeofVZvrmtKYU4LKG/5Ouder+yd8OPQIlvgjy2@vger.kernel.org
X-Gm-Message-State: AFq9FYLlpXrqKVfSu1JSbjYt6x9SvAtsFvM1YG8xm8c3oQseRESeRySA
	rAF7S9UpY7/ogfCp/NpR/3UsO9kbMzfRRdw5345IFRCeaJZUqcJ4ztd+
X-Gm-Gg: AYBFou3PC2rXiShYio6RFp7oGwmXRELY7Ywg047ebnqniBx9XRT097BZpWws/g6eyQV
	Q9D7YroQKBC0Kk4PiY25RwBXXqvZEV+Di1y8b4PK+AwPhmk30YWsEPOB3espE9dYxn5Uv5jcakc
	G3mmxZZSN4MSufC7e/Tiau3rQvUXO0z7RXFKkXOdBB+mE4a1n++eSOnLteH/d27aIZM5OhoZgQF
	X2ylqvM5xyWmBLB1x199pyKJDO0K1o+X2LjBPhE/UTvxGk5PWTlGlLlzvgQtu9glMFl8oGo4rYE
	WKF/Y3vW5tsCWCrJnl9b7J2LP2JJRYYpxz8vyFzb6nlVCproyVvXjSnTVJO5T58pudzqi6TJd20
	zzR+3mwVhE484DvdaZn83v7khukPFwvUCHr3bVUle8SlPHgQn7lwX8GBYQQdBiDdz8SkijUQQGp
	LHoeMEXDAZxgajLTa8HFkmc5m5YFhjCFqp+RLwFOHmIfC5hnpdrjtSQXdYsve3RwrHlgN1Zp1Ol
	N0HM7UKdbLOnHDyd0H4SdISSIntIw02wzrRIhgugTMHZ4bpGAFq8wNKrb2iy4XSboh+Ar//UfE+
	VsK+euoUubIL+zDMxVl38/yflve5oU96B2sdtMY4iSb//Xi90+RSWSs5T2MGu0/tm+SdwqafNX0
	gAMBUFpFdbMzX0+sSr94=
X-Received: by 2002:a05:6830:3481:b0:844:a8bf:7dc7 with SMTP id 46e09a7af769-85d363fc570mr7336192a34.17.1793638230796;
        Mon, 02 Nov 2026 08:50:30 -0800 (PST)
Received: from [10.10.18.223] (wsip-64-207-253-118.tu.ok.cox.net. [64.207.253.118])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85d354985cdsm9936779a34.10.2026.11.02.08.50.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 08:50:30 -0800 (PST)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Mon, 02 Nov 2026 10:50:22 -0600
Subject: [PATCH v2 2/2] rtc: mt6397: provide the 32 kHz output as a clock
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261102-rbrue-suez-upstreaming-mt6397-rtc-32k-v2-2-19ca72815374@gmail.com>
References: <20261102-rbrue-suez-upstreaming-mt6397-rtc-32k-v2-0-19ca72815374@gmail.com>
In-Reply-To: <20261102-rbrue-suez-upstreaming-mt6397-rtc-32k-v2-0-19ca72815374@gmail.com>
To: Sen Chu <sen.chu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Macpaul Lin <macpaul.lin@mediatek.com>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Eddie Huang <eddie.huang@mediatek.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-pm@vger.kernel.org, mfd@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-rtc@vger.kernel.org, Ryan Brue <ryanbrue.dev@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793638226; l=4890;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=amIz4+OO8bg9BY0ErwfxlJTjkYD75qjrKdIIoLGCs4c=;
 b=SddfdcmGKWyuqGOE2/GxaWQqOQ1TXoTGs5VUhTToGfp3bnPWl7+Zrz5vLWEeXxPdlsr4dE61r
 fAJ9r7/SePRCBSg2vB3thim3kLRhLfoupjQ/1z8Xsr6XCNPG6w8yuKc
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=

The RTC's 32 kHz output is gated by RTC_CON.F32KOB, which the vendor
kernel clears before it powers the Wi-Fi/Bluetooth combo chip. Mainline
never touches it, so on a board whose bootloader leaves it set, such a
chip has no sleep clock and does not come up.

Register the output as a clock when the RTC node has #clock-cells, so
the chip's power sequence can enable it.

Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
 drivers/rtc/rtc-mt6397.c       | 85 ++++++++++++++++++++++++++++++++++++++++++
 include/linux/mfd/mt6397/rtc.h |  6 +++
 2 files changed, 91 insertions(+)

diff --git a/drivers/rtc/rtc-mt6397.c b/drivers/rtc/rtc-mt6397.c
index d6e156516aa6..2849beddc79d 100644
--- a/drivers/rtc/rtc-mt6397.c
+++ b/drivers/rtc/rtc-mt6397.c
@@ -6,6 +6,7 @@
 
 #include <linux/array_size.h>
 #include <linux/bitfield.h>
+#include <linux/clk-provider.h>
 #include <linux/err.h>
 #include <linux/interrupt.h>
 #include <linux/mfd/mt6397/core.h>
@@ -317,6 +318,84 @@ static int mtk_rtc_nvram_write(void *priv, unsigned int offset, void *val,
 	return ret;
 }
 
+#ifdef CONFIG_COMMON_CLK
+static int mtk_rtc_clkout_set(struct clk_hw *hw, bool on)
+{
+	struct mt6397_rtc *rtc = container_of(hw, struct mt6397_rtc, clkout);
+	int ret;
+
+	mutex_lock(&rtc->lock);
+	ret = regmap_update_bits(rtc->regmap, rtc->addr_base + rtc->data->con,
+				 RTC_CON_F32KOB, on ? 0 : RTC_CON_F32KOB);
+	if (!ret)
+		ret = mtk_rtc_write_trigger(rtc);
+	mutex_unlock(&rtc->lock);
+
+	return ret;
+}
+
+static int mtk_rtc_clkout_prepare(struct clk_hw *hw)
+{
+	return mtk_rtc_clkout_set(hw, true);
+}
+
+static void mtk_rtc_clkout_unprepare(struct clk_hw *hw)
+{
+	mtk_rtc_clkout_set(hw, false);
+}
+
+static int mtk_rtc_clkout_is_prepared(struct clk_hw *hw)
+{
+	struct mt6397_rtc *rtc = container_of(hw, struct mt6397_rtc, clkout);
+	u32 con;
+
+	if (regmap_read(rtc->regmap, rtc->addr_base + rtc->data->con, &con))
+		return 0;
+
+	return !(con & RTC_CON_F32KOB);
+}
+
+static unsigned long mtk_rtc_clkout_recalc_rate(struct clk_hw *hw,
+						unsigned long parent_rate)
+{
+	return 32768;
+}
+
+static const struct clk_ops mtk_rtc_clkout_ops = {
+	.prepare = mtk_rtc_clkout_prepare,
+	.unprepare = mtk_rtc_clkout_unprepare,
+	.is_prepared = mtk_rtc_clkout_is_prepared,
+	.recalc_rate = mtk_rtc_clkout_recalc_rate,
+};
+
+/* The 32 kHz output the PMIC drives to other chips, such as a combo chip */
+static int mtk_rtc_register_clkout(struct device *dev, struct mt6397_rtc *rtc)
+{
+	struct clk_init_data init = {
+		.name = "mt6397-rtc-32k",
+		.ops = &mtk_rtc_clkout_ops,
+	};
+	int ret;
+
+	if (!of_property_present(dev->of_node, "#clock-cells") || !rtc->data->con)
+		return 0;
+
+	rtc->clkout.init = &init;
+
+	ret = devm_clk_hw_register(dev, &rtc->clkout);
+	if (ret)
+		return ret;
+
+	return devm_of_clk_add_hw_provider(dev, of_clk_hw_simple_get,
+					   &rtc->clkout);
+}
+#else
+static int mtk_rtc_register_clkout(struct device *dev, struct mt6397_rtc *rtc)
+{
+	return 0;
+}
+#endif
+
 static int mtk_rtc_probe(struct platform_device *pdev)
 {
 	struct resource *res;
@@ -380,6 +459,11 @@ static int mtk_rtc_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	ret = mtk_rtc_register_clkout(&pdev->dev, rtc);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret,
+				     "failed to register the 32k clock\n");
+
 	nvmem_cfg.priv = rtc;
 
 	return devm_rtc_nvmem_register(rtc->rtc_dev, &nvmem_cfg);
@@ -416,6 +500,7 @@ static const struct mtk_rtc_data mt6358_rtc_data = {
 
 static const struct mtk_rtc_data mt6397_rtc_data = {
 	.wrtgr = RTC_WRTGR_MT6397,
+	.con = RTC_CON_MT6397,
 };
 
 static const struct of_device_id mt6397_rtc_of_match[] = {
diff --git a/include/linux/mfd/mt6397/rtc.h b/include/linux/mfd/mt6397/rtc.h
index f4da579ec638..a8130d726c59 100644
--- a/include/linux/mfd/mt6397/rtc.h
+++ b/include/linux/mfd/mt6397/rtc.h
@@ -9,6 +9,7 @@
 #ifndef _LINUX_MFD_MT6397_RTC_H_
 #define _LINUX_MFD_MT6397_RTC_H_
 
+#include <linux/clk-provider.h>
 #include <linux/jiffies.h>
 #include <linux/mutex.h>
 #include <linux/regmap.h>
@@ -22,6 +23,9 @@
 #define RTC_WRTGR_MT6397       0x003c
 #define RTC_WRTGR_MT6323       RTC_WRTGR_MT6397
 
+#define RTC_CON_MT6397         0x003e
+#define RTC_CON_F32KOB         BIT(5)
+
 #define RTC_IRQ_STA            0x0002
 #define RTC_IRQ_STA_AL         BIT(0)
 #define RTC_IRQ_STA_LP         BIT(3)
@@ -72,6 +76,7 @@
 
 struct mtk_rtc_data {
 	u32                     wrtgr;
+	u32                     con;
 };
 
 struct mt6397_rtc {
@@ -83,6 +88,7 @@ struct mt6397_rtc {
 	int                     irq;
 	u32                     addr_base;
 	const struct mtk_rtc_data *data;
+	struct clk_hw           clkout;
 };
 
 #endif /* _LINUX_MFD_MT6397_RTC_H_ */

-- 
2.55.0

