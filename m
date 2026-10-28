Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793200871;
	b=ENVGnpvkPX44hCJjGiAq/X4aVh3p1+yDc8fmH+awmJKw4sHkh6DWZDs4LyotnhxlUlom
	 y0hVGVkRlzh5an7yVyqL/bD4FbaMWWTTOMu9XThX3J4OiS6Mkm9D6oipsTyNE9uYDVtL7
	 Jm27gGAOP/5QIbLYQ4b6nLQP0DoQHSJUcDs+zLZnwO/ScsDMsv03b1L5RYXHsD5ojza/i
	 zeRrEN/Pyg3kswrFHsRrFTg7u7bqT0Xre1eMFDPBEhziSngNlzivo6HCEWkEOimt2jTCi
	 g4mrUZEMXw7cN1Y+c6ntvJ4h9rr9Z7m8HYu6OqCxeJO75hUYaTvipZqAqVrs7XynXsw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793200871;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=WC8KaNzexqILvj+nwYYKocvsByBerULznJgP9Q96RzY=;
	b=yUNENDBFTXbqk8gCki7t4ABrXNi8HQCK0HZi9J+sj3zX979JBcrDDLOvQHaE/M2wKcSf
	 0i2EnRGIHHkaUXospOuWdK7YLKAEh3qCKdjCK9n4QZvoiMED5bz221NAHznLgAvN49e78
	 Y+ep4p8+yRedws5H/v1xoYLIY0JXCuHl/bQNwLdJFfRXAWVij9grwzrP6pZLmOacsV9FH
	 lX8W7hfO1pASTw2W2sy/DOIloXF5atdukDdrenmroT0Z0hIoWajzhnPnZRPm20/qj0Ba3
	 uJXaYLZ4moyOVQRhNGB3f07e6KCf2bKMwL3zDp9MDS0mkw0uge/ci8drpQ+hH+vqIuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="mZbUf/nG";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XHwGfAqh;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A9F6606A33F
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 15:21:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A9F6606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mZbUf/nG;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XHwGfAqh
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SFAgd4423537
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 15:21:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WC8KaNzexqILvj+nwYYKocvsByBerULznJgP9Q96RzY=; b=mZbUf/nGhN1KTNs0
	KQnai4oOh0VL32rWnYxOUmaLRkXEw+m3FYHCLQDAZSEt+hvET5E2g+3XXnZA2KCz
	gwHuF5DeEMIFuPacHKlzv0nUvABbChp13NgcHZlGEDK+km2uMP2IWeiCWb6b8war
	7K7KZQz8fzNf2JeUm3h4456A5s0rn4LWL91dbGS6t75Aj1qzTAaLc+S1HrPVKSWF
	SSkeaIkXpe+g05gQ7YPs4u8i3lkmYUBHojBhw945msyR47P0H3WrUnleL/isdRcQ
	+2tYJiJ8DFZA6guWvYIZYpaljJeIZO0aE7KWa0zto7O4v+4WJ08YEmZtsdVlYUH4
	IZmKxA==
Received: from mail-yx1-f71.google.com (mail-yx1-f71.google.com [74.125.224.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkdsp1h0u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 15:21:09 +0000 (GMT)
Received: by mail-yx1-f71.google.com with SMTP id 956f58d0204a3-67994010b21so41263d50.3
        for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 08:21:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793200869; x=1793805669; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WC8KaNzexqILvj+nwYYKocvsByBerULznJgP9Q96RzY=;
        b=XHwGfAqhRbL6FWck5/aRfJmkhAQT4/7oeN5BpRhKisp1lNn31xxKiFDV+dgjBWQoEu
         SCzp9rk1D1YnO3HNKbaDFmGSA5oS/IPfITpADH8H9olMMx1eOt3NckQbDUn7EDr4OBiA
         tptB4RrQCu7k1VjNt1qAnHQcCDLagoZGNH/lZfzeB5y6ZZ43qMAXcaAdt3l0vVHEWt+f
         Jp06UiwLGvdS6e9BsuI93dUfGIpcLlNohiA8QS4l8RY6urS+bHwR1h0UYI3RdLoKeWSr
         k7EoSA2q7v8gm0+gf9/Y4eQ0Fm1M8yayEiq2CJu2exVfG16or6X3hJ6ssi2zSoEb78Hh
         KzGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793200869; x=1793805669;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WC8KaNzexqILvj+nwYYKocvsByBerULznJgP9Q96RzY=;
        b=KuzF+N5oYzb+5oEiGpXuY8j15WftwMJv6Dbc+pWo11fxZ9ZgGhQ5pc0A9s2+bDVg2S
         UJYSoYep62w6TiG1G/4IDH3Ub4xXtp+YQgxrdgxdu4ECpQjq6Hyb9W4jqAKkyGqL02lz
         7HvPnLX3eMN4kg0vFW8noXczy09XMDnTJx9hDfDHPbS+101iYuSxfueZtTkNapjsUyzf
         RcXYv4AqPtOqBFf3SpqOf9iQCIW00rHQvPHEXx+Sxq/I/u1QQRnpqaJVE9NqbST6qgEI
         eKlAlDpFB98oI1TdGelkn6LnJ9mB4MFiEc6aumXO3UFW35QcH+Sx8ArybtwaPA/en0LB
         d/1w==
X-Forwarded-Encrypted: i=1; AKwUvBzxSWa9ItiOPZMsv9huy+x8DTJAUjNmq+ynUlWW3oxMc0cguzBtSZ20qgKDr6sstUIdFUXqFk22CGL+@vger.kernel.org
X-Gm-Message-State: AFq9FYJr567EI+hDx4bTcf5VVQYnsFAMhIEQpzPvy88y+IjtMHriQjOv
	HS/dgz+/WYq2+RD4IZlPQBMgU77Rj2C4pDtm18XGMODNnlWqtU9zQTxy9M/d9UppKFpUG28PChU
	EaOc89dKeT1IaLFwoM6/S+rB4F7nvgUFwoyO3OqtWJ2efTHNw9XnFjECkh7SF2F8i
X-Gm-Gg: AYBFou2GwWq5CynKve8rULjMZpH6YQwIKW+ReJCGaUIgBpH4b9MXQ66KSDhKyuGItX0
	45qyqfg7CKTpplrm4/fYa/i4OBDkJTdz3pV8Bl6X6IdWVVIWJP1B28LE5D8jMyj/xpisb0H0iVO
	cO8HrUrX7UliIMsbCgM6gHHf36LO7Ka4FVHpom4ztF/XToTpZXCHrqMlO7TtDDQ6se+knfEL6lN
	SPm1zeN2v4UDWqBfIGWNf7a4CHH73npptotkYnZ/FNEBDQ2V4HMhCR0BBi7PnCoCIPqLJ5VDXvN
	78t9jOvMSHDBBV0VWg8LI2+WjUT1+puW37feeGiG18xUDuKsQZOatAgFX8GJE07GOe3+xO6EfAc
	4vYF9wps6tbFIL91iJDnKhtzvbz0zQMr6e1DKL0lzk7X+wrlPZ+TTFuTfe+fXPxzUE6ryuB/KjO
	HZ1jBjix5uzokNbzJA4rkHmzO4lDxL3ZuruSiGEvj2tiQqaSPecBalc6hGcIWa
X-Received: by 2002:a05:690e:13ce:b0:679:8c43:a140 with SMTP id 956f58d0204a3-67a7bbf9a0cmr2290676d50.31.1793200868834;
        Wed, 28 Oct 2026 08:21:08 -0700 (PDT)
X-Received: by 2002:a05:690e:13ce:b0:679:8c43:a140 with SMTP id 956f58d0204a3-67a7bbf9a0cmr2290626d50.31.1793200868178;
        Wed, 28 Oct 2026 08:21:08 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67a803cdd1asm1107541d50.4.2026.10.28.08.20.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 08:20:58 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 08:20:37 -0700
Subject: [PATCH v23 03/15] phy: qcom-mipi-csi2: Add Kaanapali support
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
Message-Id: <20261028-kaanapali-camss-v23-3-95f250b18612@oss.qualcomm.com>
References: <20261028-kaanapali-camss-v23-0-95f250b18612@oss.qualcomm.com>
In-Reply-To: <20261028-kaanapali-camss-v23-0-95f250b18612@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
X-Mailer: b4 0.16.1-dev-17221
X-Proofpoint-GUID: O_oad4j8jKUrYN6ZpROUCqy3259qmmV_
X-Proofpoint-ORIG-GUID: O_oad4j8jKUrYN6ZpROUCqy3259qmmV_
X-Authority-Analysis: v=2.4 cv=Cssq4X4D c=1 sm=1 tr=0 ts=6ae212e5 cx=c_pps
 a=ngMg22mHWrP7m7pwYf9JkA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=1e3Zegj4IIqRqDCgfwkA:9 a=QEXdDO2ut3YA:10
 a=yHXA93iunegOHmWoMUFd:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA2MSBTYWx0ZWRfX2e3gllBvmflz
 W2oqaC8nfEQ19SsAyNFzO6JO0M9F5itbFvgpMHy9L65JDRrwtyJKFTa3XOe5hmFF6km8F67nRmn
 X5kZnYxqXsqULXQF03XgFV3KfgmFBYAyB7/NZ4/dOxq3xWtnoNqZpcfV6yYdkGTiOmLTecufhVR
 cPMurCLc1EiuEgSoS9xDQhENC3dITb/05TXOcrTPV7oP1N8OxYaqqBFMW8OyZUF9GPuB7xtagGb
 DFa8OHEuDx+gE7v/WTgmGwW6j5b43/HUol+Pvo5AEo0RtGfL1AE+5LO5K+D9/LaDrHJej98oXCU
 moMysMX0tSQwvU/xTL1WsTUXNOilVC02lm+w2YE+T9J/8TAZcmpPG7d4OGyXvSKydFRHPRlZqSw
 pq47716yfA0BYf/wc4iqsEWRHjeFr5syJKTQVVJVYFrer4GtdP587HbZE/fhrZdh4+7zpRb54t0
 /cXzEvXOWTY01GbA/Rw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA2MSBTYWx0ZWRfX73n7csw3CO4J
 pCf6B1V/uiaccCCSpQiKOPCbTEEarMkTIzInP1Pj85SxYBn85yf0Dwf8A0PzuF+X7P6pEAicjiZ
 Obz3AgvF0QQW4WZLpyK829vGYw4FI/k=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 impostorscore=0 malwarescore=0 bulkscore=0 phishscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610280061

Add the Kaanapali 3nm configuration for the standalone CSI2 DPHY
driver, including the Kaanapali common status offset and power domain.

Reviewed-by: Bryan O'Donoghue <bod@kernel.org>
Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c | 16 ++++++++++++++++
 drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c     |  1 +
 drivers/phy/qualcomm/phy-qcom-mipi-csi2.h          |  1 +
 3 files changed, 18 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
index 8cd331cfb4b3..658a39463104 100644
--- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
+++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
@@ -389,3 +389,19 @@ const struct mipi_csi2phy_soc_cfg mipi_csi2_dphy_4nm_x1e = {
 	.genpds = x1e_genpds,
 	.num_genpds = ARRAY_SIZE(x1e_genpds),
 };
+
+const struct mipi_csi2phy_soc_cfg mipi_csi2_dphy_3nm_kaanapali = {
+	.ops = &phy_qcom_mipi_csi2_ops_3ph_1_0,
+	.reg_info = {
+		.init_seq = lane_regs_x1e80100,
+		.lane_array_size = ARRAY_SIZE(lane_regs_x1e80100),
+		.common_regs_offset = 0x1000,
+		.common_status_offset = 0x138,
+	},
+	.supply_names = (const char **)x1e_supplies,
+	.num_supplies = ARRAY_SIZE(x1e_supplies),
+	.clk_names = (const char **)x1e_clks,
+	.num_clk = ARRAY_SIZE(x1e_clks),
+	.genpds = x1e_genpds,
+	.num_genpds = ARRAY_SIZE(x1e_genpds),
+};
diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
index c0a4fa20eaf0..aff9e66f0352 100644
--- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
+++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
@@ -444,6 +444,7 @@ static int phy_qcom_mipi_csi2_probe(struct platform_device *pdev)
 
 static const struct of_device_id phy_qcom_mipi_csi2_of_match_table[] = {
 	{ .compatible	= "qcom,x1e80100-csi2-phy", .data = &mipi_csi2_dphy_4nm_x1e },
+	{ .compatible	= "qcom,kaanapali-csi2-phy", .data = &mipi_csi2_dphy_3nm_kaanapali },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, phy_qcom_mipi_csi2_of_match_table);
diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h b/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h
index d6366f809e51..2355a1db9b94 100644
--- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h
+++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h
@@ -94,5 +94,6 @@ struct mipi_csi2phy_device {
 };
 
 extern const struct mipi_csi2phy_soc_cfg mipi_csi2_dphy_4nm_x1e;
+extern const struct mipi_csi2phy_soc_cfg mipi_csi2_dphy_3nm_kaanapali;
 
 #endif /* __PHY_QCOM_MIPI_CSI2_H__ */

-- 
2.34.1

