Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBF1243710D
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 19:28:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785785319; cv=none; b=cHPC63LPZ/qaFbyW1e8hPiD1Wc0KShxlv1Jp3D5exj2/+vwAOUBK+HqO85/9N5X7BKQZrK0EJpQ3qfCoxj6LN/OUvg4qxQzWXeqLPAL7AyCNIa9+8k6YGqsqTjBJY22WK70ccv2kUJRdeHRhaFi/6EJA7j5dfuWw2YRb8KLF6x0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785785319; c=relaxed/simple;
	bh=qhtVBX4/vzH6MAbufHtQj060ZOVQJk/k4kNtYtAfTO0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=I26EWPlw+8qPyTgwswDO64ZWbiJ1QnmORD5cDLLTeOdfEKFb7fVjjT96xkkjcwuiGIC+8RiGu7XCMFwklBY/GZJRiXmyeaE7sdLPEODCfR3M9El4N8wy8av1Zxi38rMJojhYg1zNkQbyP191qx2q63R0wpta2wpui5DgMpmDH94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fLddI5L+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZSENxSxc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fLddI5L+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZSENxSxc"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 673GwGjK1302073
	for <devicetree@vger.kernel.org>; Mon, 3 Aug 2026 19:28:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JqQJwuVP7Napr8UYEGu1mAZ0Py+bW1mmUtywwgwTT8g=; b=fLddI5L+TJSBGq5J
	zZEO21RN82G8WcgxJAFLh0jY71/7rRv8o2JKuguSPVP2o8/cwmHyEfQ6etD7YtBf
	lieoNJiZPV3tYLdOXBVOf4MYokDGU52tNP1qgCiEORoDgqcn8ea7/kd1igWGnAVy
	6mwLvaiGJUyiqZ8rbwok1uHAGZcbMilogJ40mexkZowY6qDrBzFAebL04iMmJZ6q
	zcRnNnCeWUl4zJ0ZqsMTEiTJzUpQ6laK3Hv9A8/OU5A1sriH9eMtj97iBCznsKI5
	83fZViyntkmr5hUr+pronaOY4ZarzNVGSJl0X7X8fZ8sSF7zD9o/n3P2im9JpuAt
	HGvL4w==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ftnrtbcmv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 03 Aug 2026 19:28:36 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cab041eced3so5965994a12.1
        for <devicetree@vger.kernel.org>; Mon, 03 Aug 2026 12:28:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785785316; x=1786390116; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JqQJwuVP7Napr8UYEGu1mAZ0Py+bW1mmUtywwgwTT8g=;
        b=ZSENxSxc56VUCGL2h8YyKlnrvazhsI2n4SDwJL1LFZHEIM2P1fola/O8X4Bhta0HCq
         lRsisSlkR9fIMbjBqw1soypzwOlaqGpcE4iLevXnL6qIlFfZwgBF1ziNge5kWEhXMvza
         EGsZRckW9uuwCRzUxJQF77jyjb+4VVesJTN3qIyXbvg1jWL980dCBOMLDPPvro1Pr2yJ
         QfJrmtPb9eUTMSoIZ+cx3joLa5yqlPWek7YESfGOZQDLW0cQdRuc8Ux1K69juY/Q0SOj
         7nremLA7XENs5q5nb3S9zIY+HoebLWATSeAATkmpvotKOo5MbIoP+nJJQVlTGMBPiqZ+
         42Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785785316; x=1786390116;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JqQJwuVP7Napr8UYEGu1mAZ0Py+bW1mmUtywwgwTT8g=;
        b=rGx4ZjfDv7I37hsgQcElKw/BUNv4R/qo0wWjzFw+C3W2Z3xLJsd+XkNvFe4aaTNgLx
         s9Jiok1KNT2pG/hlOoiQTBZ1svb2LK76yJ/g+xa++Z0JQ9T0F+VMlDldfHPx0EMa2L63
         xlLCfC+KJpZYuT3m6lFm/yyks96ldL9nLf+z1oOtVjf+SG/zKqB8QyXcFpTumabjCTpm
         LQvM4q7u3ifOO4wwzX8CzyY8RCyetl33xrHNsX0OsrjgUfBxOhg5MnK+olZ+hv/kiyhg
         PYMkPb8AIAFq9fjm1TAZEd//kDzBi/c1gySlNl2rPMHRSF/Og56PZW23xRXZLsbNo5HH
         LSmQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq78c0cl/7JUvXXFbXl6Ju7Xyo0k/+VjmMh6y2GjoRwy89BQDlFwWPi7YuiU7OYaKifgowxQh7YUi+a@vger.kernel.org
X-Gm-Message-State: AOJu0YxRLbOXNL7APraTumXJP5INZjXZc0sgFD43n6aELKZjJk/aJgag
	JLTAfvw/zEPYNueIbQNPNOPXyisKqNboXuVoMB1EVrcOL3+K/eTvYtHtr+caKmMuPBnOhJkpHHw
	zdm4lEfrExTdVeywqDWEehZBLVZPsbRprNkFYBqCrIUfSjK5MxJwyiweQtK/8QWEI
X-Gm-Gg: AR+sD13bCsxUW3ECdkN3cPXh884HjmVMn4Axsb6DsgIwzUbuzDXeKebQyU1pVTSP3BI
	W61t1Elg5spAQ3TQ8R8Sg8XnQXnI82vAWBaDbj6qH7yaEXd9F3wWbUHy6d5tjy72Ojt6S2FqFBH
	gZH35rYIbe08mw2G+2z8V8eBw4+MtgBu8wKHGCWR8kLrYdqEkU7bRrdIdCHBofYPa9Bz9AnBx+6
	bDbUKy7j5qacupbwLoI+0bie5PkZsDSwHtIFpkbeK1jMbA92nGthPGGkcL9B/qc9NVFA0eJHcgf
	XF0OprKWtBrL/twKxzS0zWzd+9AW/BY1CYyDxwqBU2djF/BXiYO/awWCunNyLTnqM7E4iUlni/7
	AxATZzhAqo5yT/k0+9NxBcAJlvEZzbA==
X-Received: by 2002:a05:6a21:3381:b0:3c3:cc3e:a9 with SMTP id adf61e73a8af0-3c92a4c4143mr12647949637.4.1785785315771;
        Mon, 03 Aug 2026 12:28:35 -0700 (PDT)
X-Received: by 2002:a05:6a21:3381:b0:3c3:cc3e:a9 with SMTP id adf61e73a8af0-3c92a4c4143mr12647904637.4.1785785315347;
        Mon, 03 Aug 2026 12:28:35 -0700 (PDT)
Received: from hu-mohdayaa-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153dd4e5b0sm38622738eec.1.2026.08.03.12.28.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 12:28:35 -0700 (PDT)
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Date: Tue, 04 Aug 2026 00:57:58 +0530
Subject: [PATCH v2 2/6] phy: qcom: sgmii-eth: vote for both voltage rails
 with correct current loads
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260804-b4-sgmiieth_serdes_regulator-v2-2-c4bc688177dd@oss.qualcomm.com>
References: <20260804-b4-sgmiieth_serdes_regulator-v2-0-c4bc688177dd@oss.qualcomm.com>
In-Reply-To: <20260804-b4-sgmiieth_serdes_regulator-v2-0-c4bc688177dd@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wasim Nazir <wasim.nazir@oss.qualcomm.com>,
        Mohd Ayaan Anwar <quic_mohdayaa@quicinc.com>,
        Umang Chheda <umang.chheda@oss.qualcomm.com>,
        Yijie Yang <quic_yijiyang@quicinc.com>
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785785297; l=3607;
 i=mohd.anwar@oss.qualcomm.com; s=20250907; h=from:subject:message-id;
 bh=qhtVBX4/vzH6MAbufHtQj060ZOVQJk/k4kNtYtAfTO0=;
 b=aRYO0/dt0yIlbXQkeAfD/ICL46OpEGS8d45uiAcXqSioG2+blgh8ZUMcI3VV9prDFE/7Wfmxr
 Vp2zx8+iMlTDrI7f3ypoUR/Y2iRcx2pTVezE411n3s2FwxZ/COdqXmk
X-Developer-Key: i=mohd.anwar@oss.qualcomm.com; a=ed25519;
 pk=7JNY72mz7r6hQstsamPYlUbLhQ5+W64pY4LgfSh9DJU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDE3MiBTYWx0ZWRfX2fpPimqCKJPZ
 gkWKQo312ftf61wo+obNNSr9qAetP+9hX6gA21MkjskUz0kc5sfNuadfv0CcfDpDPlmyrF2SzNg
 XQo2BXB96W2+W9oFrP53LMgvzSN3MMQe7uEw/KY78ubcCgl2yRXW/JisOh2Qw9H0IVmtEgZFJfN
 8g+t3HAdiX9xwQXnyYky+dwtyCQr3dCrnUWKC2GWnzM/M0Xl2GSoEv156rFKrr4rOV/jV18G7g+
 UAhndc//BfB7/MkN6k05XaDBGHMwLFTwOL/qrB6GyBdx28asRmJvmS4fIDEgTZW+rOzdfW8LZXd
 v5ORC7qen9igrVpT48sLITUWUA78jUyc6zyiKDrWPfwDxC8WqK+XigRT9sv06eggWcm3AhSAkJi
 xLePXcYdQLXdknhwKKeJdvsjH11Sau4fTzl5JPAjojHc1wvKkbFFaga3lHiDne6mGxVwlG264QN
 88yPoGj0Ytv+XfMlmhQ==
X-Proofpoint-GUID: n-9fmqfyhh7kQq8AuWxqlyr_LOiGUjFO
X-Proofpoint-ORIG-GUID: n-9fmqfyhh7kQq8AuWxqlyr_LOiGUjFO
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDE3MiBTYWx0ZWRfX8YyEibxjQbsw
 65lOpZq/XPXzxQ+C5SD5oxW67FZp9ZRqE6fdpm883er0o1Q8feJKuvhK1bXglZXECr2iyhVxC+F
 EkcMxMbeezwfpwt0SY7oloTnXryUgLM=
X-Authority-Analysis: v=2.4 cv=Ft81OWrq c=1 sm=1 tr=0 ts=6a70ebe4 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=25a2QmDRLaibZUvL8hIA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-03_04,2026-08-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 phishscore=0 bulkscore=0 suspectscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608030172

The SerDes PHY has two voltage supply rails, vdda-0p9 and vdda-1p2,
that must both be enabled for calibration to succeed. Without them:

  qcom-dwmac-sgmii-phy 8909000.phy: QSERDES_COM_C_READY_STATUS timed-out
  qcom-ethqos 23040000.ethernet eth0: __stmmac_open: Serdes powerup failed

The driver relied solely on the PHY framework's implicit enable of
'phy-supply', which only voted for a single rail and set no current
load. Use devm_regulator_bulk_get_const() to acquire both supplies and
set the peak current loads (46 mA for vdda-0p9, 15 mA for vdda-1p2)
as required by the hardware.

Fixes: 601d06277007 ("phy: qcom: add the SGMII SerDes PHY driver")
Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-sgmii-eth.c | 37 +++++++++++++++++++++++++++----
 1 file changed, 33 insertions(+), 4 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-sgmii-eth.c b/drivers/phy/qualcomm/phy-qcom-sgmii-eth.c
index f48faa2929a682be6024ee349fac6fd1b6464cb3..7137200c3f310a4d2642bb9bdbe3adb7589b2241 100644
--- a/drivers/phy/qualcomm/phy-qcom-sgmii-eth.c
+++ b/drivers/phy/qualcomm/phy-qcom-sgmii-eth.c
@@ -11,6 +11,7 @@
 #include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
+#include <linux/regulator/consumer.h>
 
 #include "phy-qcom-qmp-pcs-sgmii.h"
 #include "phy-qcom-qmp-qserdes-com-v5.h"
@@ -26,7 +27,15 @@
 #define QSERDES_PCS_SGMIIPHY_READY			BIT(7)
 #define QSERDES_COM_C_PLL_LOCKED			BIT(1)
 
+static const struct regulator_bulk_data qcom_dwmac_sgmii_phy_vregs[] = {
+	{ .supply = "vdda-0p9", .init_load_uA = 46000 },
+	{ .supply = "vdda-1p2", .init_load_uA = 15000 },
+};
+
+#define QCOM_SGMII_NUM_SUPPLIES		ARRAY_SIZE(qcom_dwmac_sgmii_phy_vregs)
+
 struct qcom_dwmac_sgmii_phy_data {
+	struct regulator_bulk_data *vregs;
 	struct regmap *regmap;
 	struct clk *refclk;
 	phy_interface_t interface;
@@ -273,13 +282,24 @@ static int qcom_dwmac_sgmii_phy_power_on(struct phy *phy)
 	struct qcom_dwmac_sgmii_phy_data *data = phy_get_drvdata(phy);
 	int ret;
 
-	ret = clk_prepare_enable(data->refclk);
-	if (ret < 0)
+	ret = regulator_bulk_enable(QCOM_SGMII_NUM_SUPPLIES, data->vregs);
+	if (ret)
 		return ret;
 
+	ret = clk_prepare_enable(data->refclk);
+	if (ret)
+		goto err_disable_regulators;
+
 	ret = qcom_dwmac_sgmii_phy_calibrate(phy);
-	if (ret < 0)
-		clk_disable_unprepare(data->refclk);
+	if (ret)
+		goto err_disable_clk;
+
+	return 0;
+
+err_disable_clk:
+	clk_disable_unprepare(data->refclk);
+err_disable_regulators:
+	regulator_bulk_disable(QCOM_SGMII_NUM_SUPPLIES, data->vregs);
 
 	return ret;
 }
@@ -296,6 +316,8 @@ static int qcom_dwmac_sgmii_phy_power_off(struct phy *phy)
 
 	clk_disable_unprepare(data->refclk);
 
+	regulator_bulk_disable(QCOM_SGMII_NUM_SUPPLIES, data->vregs);
+
 	return 0;
 }
 
@@ -357,6 +379,7 @@ static int qcom_dwmac_sgmii_phy_probe(struct platform_device *pdev)
 	struct phy_provider *provider;
 	void __iomem *base;
 	struct phy *phy;
+	int ret;
 
 	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
 	if (!data)
@@ -381,6 +404,12 @@ static int qcom_dwmac_sgmii_phy_probe(struct platform_device *pdev)
 	if (IS_ERR(data->refclk))
 		return PTR_ERR(data->refclk);
 
+	ret = devm_regulator_bulk_get_const(dev, QCOM_SGMII_NUM_SUPPLIES,
+					    qcom_dwmac_sgmii_phy_vregs,
+					    &data->vregs);
+	if (ret)
+		return ret;
+
 	provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
 	if (IS_ERR(provider))
 		return PTR_ERR(provider);

-- 
2.34.1

