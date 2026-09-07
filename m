Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5551C4ACC83
	for <devicetree@vger.kernel.org>; Mon,  7 Sep 2026 20:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788812663; cv=none; b=TILSc2a9zBRh1w+fW9w1u05b4EZ9al6UbjK/HfefycD3ezJ/CXUN7WqOi65vGmUEoN5BS8OA8FkzKTe8tflcDESbwSfcywhEeKUgYsicsYD3WfJdRfSLMSiacALCyaTd1TqwspBO1H7Sq20OBPwp7rwDJ28XDHmpt4o17bSa68o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788812663; c=relaxed/simple;
	bh=AH+qx0x4KP0Ub7IhYEI/kkBrCs/Qa/fQa0F1JhH3QPg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kcXD19sSI2wphQ0+8wMCpZ/zFPEjd4k32j0eEd4pzgCTg3kfnBxZ81EvScsSNjFqGbPnktOld7H9vnMwbvNDvT8rvsHR1aEtrAEcFBSCaxnLZWTi1GgMaCQQnNGwqZeEyq7ZhLA9XGRsnoR+ILFznQRmqaF7tfV8yYI8Ft2Hz8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o7lD6MeY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MexD4V2L; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o7lD6MeY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MexD4V2L"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687HXIYX553104
	for <devicetree@vger.kernel.org>; Mon, 7 Sep 2026 20:24:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Az1erGSnETLR/YFXkBczCQXpiybLwgDvwwIrMae0ihw=; b=o7lD6MeY26M1WO8v
	9ZKqJ7uMQagH3gzeQUnBdtWxeQ5RfAP5np2R0w16jZkuPezpH+PTHTAp6hgECdR7
	7/8u3EzEwe+XVZxcPYjXTQ6V8acwYo7kNQWU+D4ZgB3ymzTwQW03MrT2hshiLFY+
	wuomhCCkDFfYTt1l/3uVhiB9ilBcjpWNp2t9eyy5jYXMT4W822v8UeXr0Q7eFii/
	90q90l9ISJ08bfpWrXyuv73IMxPOXr2eHwZu+ROOyi39d5gy7QgZdYNjOBVWm2ls
	3zh+hpSyWIp6TjRMvN8gWoJ4i72Fl7QFcjNMoTwSy/WJ1UbmEvDLgAd2mgicN9Mk
	0ekCDQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gj1rwgeq5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 20:24:19 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2d54187d8b0so8413725ad.0
        for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 13:24:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788812659; x=1789417459; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Az1erGSnETLR/YFXkBczCQXpiybLwgDvwwIrMae0ihw=;
        b=MexD4V2LvqXnUk4MUfN0PS44nPiTLdFSEWNwIw7aChgZbpq1RPmaQmzLh4+QKvhH/G
         kFfCR1YSO0qHP+065gDqQz+oMQL/Wb2Elj9QneNSe34AWJJW+42LgpTri9fDyGQVBVxz
         GjW3rlXglh0Xdjh2OoqtqT8fjj0bitEYNSuWZmcrVtPAj4uuhHkboDFsQZrINm4ONhsP
         BiUk79gjrgY82w5RO7rJNdsG7mK4ZiVTNmtkpk0dAb3KeK+xge0xGBUvup9o73aUyjop
         pR5LATEDkR5JPF68C/3Gv4IgbIEhUJxx616KDVkw6bLPNLHnVSLEjdkd4CFnkz6E2Gm8
         Hm9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788812659; x=1789417459;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Az1erGSnETLR/YFXkBczCQXpiybLwgDvwwIrMae0ihw=;
        b=Pg36O/PIkUtqG4izaknzomKTOAhfmnB2UUDQrhBAm7/TfqJVH3wFIVUtJM0Knb9qzl
         QQO4kYQCz3bFbNMDiuEnWg0Z1Y8o+uHQMODY9+JPd4NBskNyivQFChmEdy1NztA9yeg0
         /VXP0WWYXVjA2XxiMLl/4vsjQJnYrSKiy83N0FbKUGFBEjUPeccPUnppcs3scKixyb1V
         l56bnTIE9CsLGA4JR6veN9VLBRCQ/7tw6JqwlUtqszT6FWGMf3hFvCPQLxh3/mDoIjML
         WMfqMAuHUQ5BoUZLceG2SwW+Bob/vZNPuDGBafLNx6ns+dbrM4oSUnXWPGmGRDYLuJk3
         5kzg==
X-Forwarded-Encrypted: i=1; AKwUvBw8s1lXRfmPYwBFYJI2CTTC/E1IfxJmgwAnGHiO6EaJNZDl+EaDpgbZhLnXVmmow9xs/MNEYCehhJlB@vger.kernel.org
X-Gm-Message-State: AFuF++kC27zksW8ws1e1gcG6qZYUAmnYXIyXpIcUaOT2wnyC0OQE6efX
	X5+MblMTZkQIpeVXO/MQdZlMLcxoP1nTnJclfEkS2YFkD4x1wWO954RqLePlItseEt64TT2glHq
	znqt9iQfh2cSkGoODAJyraJ4v0WalIpN8Vd5V9Pf5Vk5e9QYNt5p/L+nlPmNFigCP
X-Gm-Gg: AYBFou1b6B6CJDTpqHC1rCdUCU/gJrvLJAbGflKgnFutEY54ctNCXERCTREt62PzOFC
	0cKnitkKuSztbj3mNj2+n1BCizZk3L9MFRsaL141kt1HhLAlSezbmZWJ27v/YN5JACS9Sok/cul
	qoF5/sVW5XSN7dA3BdV2Aondk9Llj/rynLM2NpUO65/gtRPVAUDNyaq/NPUfsx3t1wes/9pFUnT
	7+mUspEF0BWFJJHT09vEn2cYUuGj5OC0HoQm3qb56/IFXQ8RsRlU/Ae3o74eBNGJ3Cpkk1KPp6r
	QEeIezwex/36wyqTVG+Pp0G3v/kpioW5ZixZofvJgvvD4tDVftdUh+J7gU5foskiCJdkg9kqL4+
	kRmNvEne0o7vzcxtkcEH2GWxQYqpcTQ==
X-Received: by 2002:a17:903:40c6:b0:2d8:d4cc:5bb1 with SMTP id d9443c01a7336-2db1286ae13mr343732725ad.17.1788812658746;
        Mon, 07 Sep 2026 13:24:18 -0700 (PDT)
X-Received: by 2002:a17:903:40c6:b0:2d8:d4cc:5bb1 with SMTP id d9443c01a7336-2db1286ae13mr343732285ad.17.1788812658328;
        Mon, 07 Sep 2026 13:24:18 -0700 (PDT)
Received: from hu-mohdayaa-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b314cfcsm30482259eec.19.2026.09.07.13.24.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 13:24:18 -0700 (PDT)
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Date: Tue, 08 Sep 2026 01:53:16 +0530
Subject: [PATCH net-next v2 4/9] net: stmmac: qcom-ethqos: convert
 ethqos_rgmii_macro_init() to void
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-shikra_ethernet-v2-4-bbe3389d0652@oss.qualcomm.com>
References: <20260908-shikra_ethernet-v2-0-bbe3389d0652@oss.qualcomm.com>
In-Reply-To: <20260908-shikra_ethernet-v2-0-bbe3389d0652@oss.qualcomm.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andrew Davis <afd@ti.com>,
        Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Richard Cochran <richardcochran@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Jose Abreu <joabreu@synopsys.com>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788812616; l=1916;
 i=mohd.anwar@oss.qualcomm.com; s=20250907; h=from:subject:message-id;
 bh=AH+qx0x4KP0Ub7IhYEI/kkBrCs/Qa/fQa0F1JhH3QPg=;
 b=U5M2VtaJtZnsRmWp4CktPyNR78lRXabNZ4gb/HF6l5Rtx7QqP9hm+vavujwv54agyXymDxysK
 jc5fEfZKW1GCvBMrlVtVw8Cn0R+P4nBWRzKjVpV/PEYH5ZGT4L5Xlkq
X-Developer-Key: i=mohd.anwar@oss.qualcomm.com; a=ed25519;
 pk=7JNY72mz7r6hQstsamPYlUbLhQ5+W64pY4LgfSh9DJU=
X-Authority-Analysis: v=2.4 cv=Ga8nWwXL c=1 sm=1 tr=0 ts=6a9f1d73 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8 a=Vjzh3eGJV6Wj_RHhdNYA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDIyNCBTYWx0ZWRfX1o/MOdtTD8wU
 k9soyiORPRRzmxwQm1SkDVTt3kiWZtCjR2E44lVgIa0eokdO0v4Qgg5yxobZfe6fl1omJ6ne+d7
 +vZWf6Zfw4Q+o41h2UmmtkHbc0MJz1/20CR1cLTqy/EaKRfDPWBl/yGU7Fo6zLwgBNsTlZdpEPQ
 eUvMiMmpLfumHLzpsPKWrAwbXHICXZiz7J3aXBu4Mnm9D3fjRHtY5litfDoiTs/ZIX9ZCSf+bxx
 /IOxHKhYQ82BejfL+4QrN28aVdIGAhPVGg+Jq/ykV6TeQSrprKxVZqgPyaYCGfi0tAMXy+Tkybg
 QzDP9acI/KmKdBnC6LgjmwRiu0KRnFBd0tK6Uzkft4+iSXKbJ4yWhx35vHkuHaqoMeFj1Vm5M9C
 xy5f45Qe6QENGfqkdSJJ+Y2fRKW+iuSjFsVQD0MqIrqgIB+W1p0c6A9hsM3638NWBk0JVCtsgj+
 oygZSsfVck3zwO5A8mQ==
X-Proofpoint-ORIG-GUID: y7r4dR-OKEjMnFg_sQG2asJQijUFJmxw
X-Proofpoint-GUID: y7r4dR-OKEjMnFg_sQG2asJQijUFJmxw
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDIyNCBTYWx0ZWRfX3Ct8jftfG1dx
 kd/hnfZkLlRZnRcG2FsiFDCmMgaiqKU2oYRqR3I6cNRnARJdifSO6Ck/70Bsobf6o8IvbJ9CINy
 u4xzVnOJLM917moGzDrEjKTWKAnyqM4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_05,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070224

The return value is never checked by its sole caller and the speed
validation duplicates a check higher up the call stack.  Convert to
void and remove the dead code.

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index ac7d6d3e205a1ab5b391def879d6f1033a0961b6..44270c25d874f72e7f971757fec659d36468c315 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -371,9 +371,8 @@ static int ethqos_dll_configure(struct qcom_ethqos *ethqos)
 	return 0;
 }
 
-static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos, int speed)
+static void ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos, int speed)
 {
-	struct device *dev = &ethqos->pdev->dev;
 	unsigned int prg_rclk_dly, loopback;
 	unsigned int phase_shift;
 
@@ -384,11 +383,6 @@ static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos, int speed)
 	/* Select RGMII, write 0 to interface select */
 	rgmii_clrmask(ethqos, RGMII_CONFIG_INTF_SEL, RGMII_IO_MACRO_CONFIG);
 
-	if (speed != SPEED_1000 && speed != SPEED_100 && speed != SPEED_10) {
-		dev_err(dev, "Invalid speed %d\n", speed);
-		return -EINVAL;
-	}
-
 	rgmii_setmask(ethqos, RGMII_CONFIG_DDR_MODE, RGMII_IO_MACRO_CONFIG);
 
 	if (speed == SPEED_1000) {
@@ -479,8 +473,6 @@ static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos, int speed)
 
 	rgmii_updatel(ethqos, RGMII_CONFIG_LOOPBACK_EN, loopback,
 		      RGMII_IO_MACRO_CONFIG);
-
-	return 0;
 }
 
 static void ethqos_fix_mac_speed_rgmii(void *bsp_priv,

-- 
2.34.1

