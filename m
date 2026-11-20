Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795169464;
	b=ALhLIODyS83lSZPG597ymk7YeFHiUAVp9b/am003DTvJBqUuf1Qd1RnoRmqK0Heci8Di
	 FikZGlWY8TaMnl9VWaHyeGCA/fnfRSormgfy7qHDzN01Qk734bc3mmnp8If5osFvaRfHX
	 2iBCImWcAn2LL5Ei/kfg1DbI8oqZXe/RIVZzbpwmG+5ODbLJgfGltrnR1srzdz/s4vLlj
	 3PKJ7soPSMSCPxMqn5x8Wz1nmEAjLE1PR8+31NbkwWuDK6s1sWJXNBpy/CxXFi2eHCiMl
	 7BhzP7NOAHct7jmGKYO2/wmR7CwyRFd7aTQsBa+WxG7RNmJ1pIKfiBpc3V2nHerguHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795169464;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=FmERSsGdijHPEpg70TWraIUuJ8ka7iU2Z/SCqAmN7f4=;
	b=kzYyIv5o/CYbds4yjbdu377j5Tdm8h7n1Lu4s9BS0Yh35ZnANWpmFaMVB7iyStmAvokJ
	 27Vf2UwzAsfG5xuFQCBQMjYiiVw6/DNozXHeeiindP3Eg/nKXhDKo4ZkDzekJLOHiKzB9
	 GQtVzU0dOmEXM2Qrl1MpPUoJspTdcoTNrem+0k/YgfrwH8uljLOcyUFB0nErlNhu157Xw
	 UG0dYA3azRu0mFAnQebKhZ4pKsuvRg7w78g68M4MbTtrJ9Fag0vokj4zduiXnJG0IxF1H
	 gBe4oL0AKewDQVB8AYMa/2bSGeDSeZvFwbVAf49bCeKp/YC7F9G6X3jVNHsl3jZesWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=mHpQnPHc;
	arc=none smtp.remote-ip=209.85.218.54
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3375360A2607
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 10:11:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3375360A2607
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=mHpQnPHc
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c5126505cb3so103862766b.0
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 02:11:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795169462; x=1795774262; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FmERSsGdijHPEpg70TWraIUuJ8ka7iU2Z/SCqAmN7f4=;
        b=mHpQnPHc4Bpjj3EtPPLutRTBm9uoGStGB3o1lg4W6V2CEGtc5ev9C3eas5a34yPR+z
         weuCtiVvukAtMETpr87+jEOKWT7IsI14+cM+chzbZndyptBOdoqEPdbcpQv+FFp0bSTo
         szA2UFrMVIFdNOAdT1HQIQmJtEMtkqy8b8EXXkrTHeqrRKOmJsA5CE90H3WvnfKAbmPc
         ihP4dn4km62xAlp/g3cTEd7Ay11ntSML9f/0uWVFxpOu+0JzewA/MiBSm/8JBWSD9XrU
         RFQfB6S8Rt6QIQOeNtHYPYERZV0r7OewVl/TNoYDdcrZy3mbn5sXkb3mN/3NErt1Tknr
         6RRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795169462; x=1795774262;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FmERSsGdijHPEpg70TWraIUuJ8ka7iU2Z/SCqAmN7f4=;
        b=twRg+PlO0mtCxCQQjZ9eBxk0Nw76XYkp+R2aBffis4tC3qBnwh2bivauRgUQNBK69t
         p37/z+v3mynJgPIXEAa9sMRkJLdcxerY/XorBI4sNBrv3ON2IrXrGVU32LhaaI6cYDN+
         aHd3ER4lMcg6lWs+LrhXYgJ07HeoTg+lBH+BK6KainolTCI5K9swFU/Ltp6XQDBYzpqn
         cWvoqfKqYujOWzlwC7+no4GvZmNj6E2kTHdr+JmNVo5u2lBYwCVdkOuqapPIeLJ0i52a
         UdQGaXxKcZilF/auDe0YNyZwrrQcP2WHI50qOOAP9HQzAKso7hmgNRsQok4SZ2gwwTN8
         tUzg==
X-Forwarded-Encrypted: i=1; AL+hErFWGLqWL2lLN6H7vGKfngj2Ng3WT/Zel5fXF28U/iT7qBYgiV5ViDAk/bgpet6oVwC3MCaQ/BfqX9YV@vger.kernel.org
X-Gm-Message-State: APuU4Z+JiywwDw/QQzL2XVKaZ8r0FF18aF2v5wJHfFOIy9CdkZ4Es39Z
	+gSynY104pQb2mCzFsi60kPrNLJvdXp8XPn8Ci8rbbvwllGdJlu3RwUWdPFIp69t44w=
X-Gm-Gg: AYBFou2BGl9gsSISPTSr3dRMDY2Z57Vk2bj5BWTdO86lsvU3t+BCDS6YdpcPfXp5RiY
	/4YGHL1YK+Isl3lRcl+XlgyzR+DkCKuOIUa4no199KTalmiyNvtNdyvVloXhctauylB8HNkA75A
	/wJshKvWZ7ydZz6cSG9+RVLLcEv+bkHzq/X2fd/iG8CYjCpIt+LuDpUKPHck2LToS1SRyn/Otv0
	mBrDGx56bzMId53kDu8WQNJiuAou/iIbu7s3CWN0KOhqDHXB2RtLeNii0cwsX8QQEvsbxic4uCa
	aOvO4CRawCloJ2eX8fuhaTVESvyb98eLxuEld8Vu5cKKfXlZj4eS/hKALz5CGcLbkSRMsUkPhHT
	KvgyUYdYZhllAPD2P12Tjv+FzDnXdI5pvctIRYfBvVneKQ0VzFDfHsK6UqPHOebRR0+U0cCSvXx
	iX2Eiba7I3YUVkwuGgO49LaFcNCW8HMzw9jnpsk5bR4WXYJBbN31/bpyPzMTnK+KwtGuyNAihtP
	XHpTIqpgfmf/87qVqHQ7cImMWHhP2tSsz5mEt89nMQCx63PK0QOJ369JxDxeerbi+6rSJo2FHsH
	WIIe4z2pM64kuIciXMV6eYPItRq33rMV/iOyyHNOZQTekew04Yk=
X-Received: by 2002:a17:907:9903:b0:c49:cdc8:10cf with SMTP id a640c23a62f3a-c513ac754cbmr178323866b.40.1795169462412;
        Fri, 20 Nov 2026 02:11:02 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6bc8ce06sm4674937f8f.47.2026.11.20.02.11.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 02:11:02 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 20 Nov 2026 11:10:59 +0100
Subject: [PATCH 2/2] regulator: qcom_usb_vbus: add PM8550B support
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
Message-Id: <20261120-topic-sm8x50-pm8550b-usb-vbus-v1-2-bbda7b708359@linaro.org>
References: <20261120-topic-sm8x50-pm8550b-usb-vbus-v1-0-bbda7b708359@linaro.org>
In-Reply-To: <20261120-topic-sm8x50-pm8550b-usb-vbus-v1-0-bbda7b708359@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2440;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=zBAUAtWRwgszoLaaEzP/mtjDOwBEAECtpNbyZWiYcu4=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBrAByz4/EXZYFt5/wDRUlOFYvBOPrPKz1sJ/flkYNc
 ZH1lUAeJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCawAcswAKCRB33NvayMhJ0ZGYD/
 90xSEruhI4srRsvEZUWLQk8ktU4PEZd22u/DG5EFs4eKpCtiKIi6TJ0MOjUd/kUJ9cRoHbFhJ6gqiC
 H40jTa4Mqm8yxPKyBPYA9n1MDmhvYFcU/PS0c2R2JkEOHy6015Lb1MttTJrJi1SNv7LvB+fjPc8gD2
 DtqRqKH7btttJWrMCCIoTC7t2VJZD+2GGZ8X/Sm8PREqIrDjsih8POxzPjCayF5t+F5Ch9NcXUMaPC
 yafKjCmWBtHT3UObSvDxEbYTcrCUS+75W6c9m9IxwahAy2j6iGyskvat0TGI6vWlZ4i4DUmpLuS2Jd
 t3/une/QQYI1tr/NYXoDHZkeJKqSHeh6vAro8320KduU3419wvY4umYWX4OuBBqPNyAHtbH/KISNV0
 SoEUi09upl2MvWOJf8QsQQFW8grvLWk+B1y13sjDh9oTx7BfB0orI8mWAPMgcIy9Vz59yNKYLLlzFP
 /qLfYxtRYGsXN79JKFxCGb7WXm48YDFSEkG/sAmA+LdwAMHGDNhsY71C92zrZ2Q7MWeSINeWOsyZj3
 flWlkWsgULdYGoG+1TdFfQwOrtYhXSZ0lNg6ljFINRrn+oyzWT0MF79f75rpjyCFPShaVEeU5KkScF
 I7paUjDmAmJXYqWRZMndreFQy6q83ZtQfmu/BCT9rEUGs3CbrgjKUQVxyMww==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Add support for the PM8550B OTG boost with a different register
layout, supporting a current limit encoding from 1 A to 1.75 A
in 250 mA steps, then 2 A to 10 3.5 A in 500 mA steps.

Assisted-by: LLM
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/regulator/qcom_usb_vbus-regulator.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/regulator/qcom_usb_vbus-regulator.c b/drivers/regulator/qcom_usb_vbus-regulator.c
index d909a6f2b7f1..dd149d28f62b 100644
--- a/drivers/regulator/qcom_usb_vbus-regulator.c
+++ b/drivers/regulator/qcom_usb_vbus-regulator.c
@@ -20,6 +20,12 @@
 #define OTG_CFG				0x53
 #define OTG_EN_SRC_CFG			BIT(1)
 
+#define PM8550B_BST_EN			0x50
+#define PM8550B_BST_ILIM_SEL		0x53
+#define PM8550B_BST_IOUT_OCP_THD_MASK	GENMASK(2, 0)
+#define PM8550B_BST_CFG			0x56
+#define PM8550B_OTG_EN_SRC_CFG		BIT(0)
+
 #define PM4125_VBOOST_EN		0x50
 #define PM4125_VBOOST_SEL		0x52
 #define PM4125_VBOOST_CFG_MASK		GENMASK(1, 0)
@@ -45,6 +51,10 @@ static const unsigned int curr_table[] = {
 	500000, 1000000, 1500000, 2000000, 2500000, 3000000,
 };
 
+static const unsigned int pm8550b_curr_table[] = {
+	1000000, 1250000, 1500000, 1750000, 2000000, 2500000, 3000000, 3500000,
+};
+
 static const unsigned int pm4125_vboost_table[] = {
 	4250000, 4500000, 4750000, 5000000,
 };
@@ -68,6 +78,17 @@ static const struct qcom_usb_vbus_reg_data pm8150b_data = {
 	.ops = &qcom_usb_vbus_reg_ops,
 };
 
+static const struct qcom_usb_vbus_reg_data pm8550b_data = {
+	.cmd_otg = PM8550B_BST_EN,
+	.otg_cfg = PM8550B_BST_CFG,
+	.otg_en_src_cfg = PM8550B_OTG_EN_SRC_CFG,
+	.csel_reg = PM8550B_BST_ILIM_SEL,
+	.csel_mask = PM8550B_BST_IOUT_OCP_THD_MASK,
+	.curr_table = pm8550b_curr_table,
+	.n_current_limits = ARRAY_SIZE(pm8550b_curr_table),
+	.ops = &qcom_usb_vbus_reg_ops,
+};
+
 static const struct regulator_ops qcom_usb_vbus_pm4125_reg_ops = {
 	.enable = regulator_enable_regmap,
 	.disable = regulator_disable_regmap,
@@ -165,6 +186,7 @@ static int qcom_usb_vbus_regulator_probe(struct platform_device *pdev)
 
 static const struct of_device_id qcom_usb_vbus_regulator_match[] = {
 	{ .compatible = "qcom,pm8150b-vbus-reg", .data = &pm8150b_data },
+	{ .compatible = "qcom,pm8550b-vbus-reg", .data = &pm8550b_data },
 	{ .compatible = "qcom,pm4125-vbus-reg",  .data = &pm4125_data },
 	{ }
 };

-- 
2.34.1

