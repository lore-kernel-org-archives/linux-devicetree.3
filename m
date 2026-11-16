Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.231.73
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794854805;
	b=szs/e00ZqqOTo/AUSp7kO9Y35pT5KXKd9MPWYiHyqKnmbZLSwaamcTxpf+R3QUR3+0Lk
	 bkpbGp4sUXEItxpeByFiB1knSptFVW6g5+9auOgwWrccTlLQ5EsegZ4gdwcUuVJkXHFwg
	 I2xkiweWqZKlTugMqiGCwvm8iP7CXZXbMH0JoCTmMPPNvIthZ4XJHI93HFyuEENKioF1D
	 Dcy8IDwbr46fYHbxsolW3JRfINsmhNDyn7PEKl/lHciVJR8NRF3YNcHBDZGrtUjx+FQn4
	 5fJyoX1+NcbKuq20DRohVVwZmBR9q8ZhEU5W21Uz6y2wug4tuBEVjK3tPIzy1s+msqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794854805;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=/AVctQ+aR6nnVUb3bzlRRJ+51PbpL8MX28yvtpVethA=;
	b=V+hKIMSAyRE+YY1dm0/3fXGJnagfBuTcJ2Oegnr2VbYNM98Fop1unFxCyy15+V1e+Cid
	 dlmHfg/eFEodueEHQ8s+k5LeW6C0RLg1Lx3SrMbexPccxk2i5LzLkH531x4dFHuh2JFvo
	 kgc/7+CtIQKFDIqZGONz0GkygmvDMAQOtilZ96LVzR4GnS3ADyHaveM7SYzGdiz6OxpWT
	 T2e2nYfY8KI2GfWjyry0W6SFys+keoNVFQ5scp16t4SkDWvckJLiGJkgJWGopxY2NM1+Z
	 d5dJaJvsev0bBsjb3WDUR4AIJtpxEQxpAO3F42tsLLZWk9Tkm04LwCvkBwLgwRxlmqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lSiQx4S3;
	arc=none smtp.remote-ip=74.125.231.73
Received: from mail-oa2-f9.google.com (mail-oa2-f9.google.com [74.125.231.73])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F8E1606A88E
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 18:46:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F8E1606A88E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lSiQx4S3
Received: by mail-oa2-f9.google.com with SMTP id 586e51a60fabf-4abbe52a747so1408826fac.1
        for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 10:46:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794854803; x=1795459603; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/AVctQ+aR6nnVUb3bzlRRJ+51PbpL8MX28yvtpVethA=;
        b=lSiQx4S3Xo9G/OM+t4saP8wp4415tQJEz+Wfn3TbxnoXXxpJxsHJkv8On5xYqoadZ0
         Hggria6KMnIzhATUsM2DWE88zVbX2twjyN4wWSbpO738qoPpb4UW2K1SH/3Q+3tYit70
         rJ39CRP7zu/7PTBX3J+Y/SD66bCjHFTkLSBUjhIh9R5kG4mCFC4BiwnrnW+VoMNN8f6c
         FmPFMFm6Cc9GzyRlvERTperbKv5QtzAescXvz0RNKF7HqBGt29y89LGB6r34zmyCvstY
         cUt7OyRB/C3ggMxavuAF0udge2NJwDJkmBR2yAnqHGvwnMdkAtbi5FArr6bpi1M3X1lQ
         SF7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794854803; x=1795459603;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/AVctQ+aR6nnVUb3bzlRRJ+51PbpL8MX28yvtpVethA=;
        b=iHEWs4slJTjbGwoLa5vjHsP1K5g2DAL4TzQE8zZPHCA3Q/F/OxWagxXzsEh1kZoFfd
         H4bA1CG2VwhCKlVFjNhBwnr1JJIFNMK3dq3pGg9thaq+dx/3j4eLeB4E3wnWnm430+J8
         fqV764ml8k9YzNjPPLUMTIGJr2nmJbp3PaBWGVziKaniWHvTFom2BRwbhMz5Q/pKih+e
         u3kYtXNuoGczftBrHOWYwuCqxpID3T5xv5THcx0K32lAH1oSJRjUSqPzuVQKSyasFNOC
         6lRm2C1+Ub/Hub0NZmcWWqnlNvU8MPCLXaOKLtv3DIzxoBbq3PBNj6XylLXRsay/Mu/F
         lyhw==
X-Forwarded-Encrypted: i=1; AL+hErGu9PIzJ8LgzN7ouI+XuAgi0fXgmf687A6pTHI8x1L+x06/FAak0rC3lufBqRYuTsAK4uFhvfXKNwkV@vger.kernel.org
X-Gm-Message-State: APuU4Z9WcJf5Gsz3x85NlyIzjO9la2a3iEnUcamAXkFuIQRw73K2dUZP
	bFdfgXykCKXiLvZrb3PGR99EFKtzwjsq0yzPzzq4mWqaSlBxHn40QNpD
X-Gm-Gg: AYBFou2yePL3ehuqs+YAfK2SZFrz+KRQK+27QJyOTEo+XcwdCnqF3XyU68dWqIc1L8j
	5W5C8wP/SRczJdJGT3/ptQWqjwXll509TvuXm6ZXb/jEC4ecU412OGdtWiPL4YM7oQw7HUpR6eC
	KpIu9MaqPWEph4Gdv1NWnYhmEV0mR2EFdmbdtpDyTekQXJGB0AXwuElL6omQ9O8EubuH4NZ6rSu
	1nBOUIetNeEZuK/FCyJ9YbnJWMwqX6sLkYvNqNZNLc4z6evoLZVvL/Okpk1clECjG3PfWGsgGXv
	jhtRWVVsEQ+q6OZ4A/nlwGiueGVVgWPxBOdcwYALqOBWPlVdKvvPMWOa/HunvZXK+NY1iNqeDzZ
	ezNwpOo8+MpvSfmwt4J8yCh0NGqOY4eEzsVGoy2/sVpYQFFBflsB2oTQyUvzIVIKYD4nv2u2J8n
	SpPdcBstLndkH7s2p3NEiG0ksEuA5e5nflxlC44F1xWk8L/Zytch8/BD1qJOARSOZrOWfDMW2pX
	u4dLXHzb7cq/4b/9RcmmmfHlAjbgOz8sUl4Qg3VLUNr+eAmpXfZR7Scf9URj0oIzRU1bI778zj1
	XUL7Q86CBYhCUiStNPornqt/mQeZ+nW3eGrNb9oXf7EzffAK451IRx+MGkgsj0Mb6ABtxhOjtZM
	PW//wgX5WhxP/UXM49gA=
X-Received: by 2002:a05:6870:1794:b0:448:c946:9ae1 with SMTP id 586e51a60fabf-4afdf492de7mr9534453fac.18.1794854803469;
        Mon, 16 Nov 2026 10:46:43 -0800 (PST)
Received: from [10.10.18.223] (wsip-64-207-253-118.tu.ok.cox.net. [64.207.253.118])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4afe242b670sm7210735fac.17.2026.11.16.10.46.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 10:46:42 -0800 (PST)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Mon, 16 Nov 2026 12:46:34 -0600
Subject: [PATCH v3 2/2] rtc: mt6397: provide the 32 kHz output as a clock
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
Message-Id: <20261116-rbrue-suez-upstreaming-mt6397-rtc-32k-v3-2-179145eb7e89@gmail.com>
References: <20261116-rbrue-suez-upstreaming-mt6397-rtc-32k-v3-0-179145eb7e89@gmail.com>
In-Reply-To: <20261116-rbrue-suez-upstreaming-mt6397-rtc-32k-v3-0-179145eb7e89@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794854794; l=4985;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=5Ww9Gje6b1XRBnVHPbGKqTnDhZK8UEbEzy3EbOlGhe8=;
 b=0RKmfCD3eY+/9AN9a1rhsVOFhEDM/PpOvKN0oMv1Ca3hnbVA3HFzfLgmOVAArB7TAbJEd394l
 xnjgKaYm14uBsCI5inKdYxKpwUyUOaFw96x0xaydSQa3fLA0llXYaqC
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
 drivers/rtc/rtc-mt6397.c       | 88 ++++++++++++++++++++++++++++++++++++++++++
 include/linux/mfd/mt6397/rtc.h |  6 +++
 2 files changed, 94 insertions(+)

diff --git a/drivers/rtc/rtc-mt6397.c b/drivers/rtc/rtc-mt6397.c
index 5afdb707a5b5..d24f0ccc132c 100644
--- a/drivers/rtc/rtc-mt6397.c
+++ b/drivers/rtc/rtc-mt6397.c
@@ -6,6 +6,7 @@
 
 #include <linux/array_size.h>
 #include <linux/bitfield.h>
+#include <linux/clk-provider.h>
 #include <linux/err.h>
 #include <linux/interrupt.h>
 #include <linux/mfd/mt6397/core.h>
@@ -318,6 +319,87 @@ static int mtk_rtc_nvram_write(void *priv, unsigned int offset, void *val,
 	return ret;
 }
 
+#ifdef CONFIG_COMMON_CLK
+static int mtk_rtc_clkout_set(struct clk_hw *hw, bool on)
+{
+	struct mt6397_rtc *rtc = container_of(hw, struct mt6397_rtc, clkout);
+	int ret;
+
+	mutex_lock(&rtc->lock);
+	ret = regmap_update_bits(rtc->regmap,
+				 rtc->addr_base + rtc->data->control_reg,
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
+	u32 control;
+
+	if (regmap_read(rtc->regmap, rtc->addr_base + rtc->data->control_reg,
+			&control))
+		return 0;
+
+	return !(control & RTC_CON_F32KOB);
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
+	if (!of_property_present(dev->of_node, "#clock-cells") ||
+	    !rtc->data->control_reg)
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
@@ -381,6 +463,11 @@ static int mtk_rtc_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	ret = mtk_rtc_register_clkout(&pdev->dev, rtc);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret,
+				     "failed to register the 32k clock\n");
+
 	nvmem_cfg.priv = rtc;
 
 	return devm_rtc_nvmem_register(rtc->rtc_dev, &nvmem_cfg);
@@ -417,6 +504,7 @@ static const struct mtk_rtc_data mt6358_rtc_data = {
 
 static const struct mtk_rtc_data mt6397_rtc_data = {
 	.write_trigger_reg = RTC_WRTGR_MT6397,
+	.control_reg = RTC_CON_MT6397,
 };
 
 static const struct of_device_id mt6397_rtc_of_match[] = {
diff --git a/include/linux/mfd/mt6397/rtc.h b/include/linux/mfd/mt6397/rtc.h
index 44d2b2cb1ff7..986b3aaaeb35 100644
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
 	u32                     write_trigger_reg;
+	u32                     control_reg;
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
2.56.0

