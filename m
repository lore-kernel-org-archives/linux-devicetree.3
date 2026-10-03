Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FBDB3AC0E4
	for <devicetree@vger.kernel.org>; Sat,  3 Oct 2026 09:02:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791018158; cv=none; b=G06bZcoqWRGoflOiURVQf7qiX5W71+ld++Kjt0N78/1InyF+Ywu8Ck7ZKBediKCc5YWQu2/49NJMl0rZfcHtByI6WAyMY9ObD/UsEM1QOCj8kS7GoF8KhW+7rhW6kQRR9uk9mOyfxSBABPoB/Z1V5L3qq5S8OnHaPbxaI3z+aZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791018158; c=relaxed/simple;
	bh=CBTZPH5nNqRbSIFimjVHiKTwtWtEsPK6VMai+/nUPtM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ik6dSWr6o9rJxQueHDYV//wXHOOCrU4Ft6lRcwnauzLjQtjc8X1qrbXmu/o3K5ytXElgPiPpCt+u4oLkoZh1TUZlQ412NzXqWwn6RMUKQRJ12sHsMNUYMAI7S7omsjmJxgNLG9DUgvZhi0/jf7ArSS021gd9OwdavsDT8XWA3xY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ouYizifQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=N3PdSkO1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ouYizifQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="N3PdSkO1"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6934lVsR2724576
	for <devicetree@vger.kernel.org>; Sat, 3 Oct 2026 09:02:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zGGWlPUDb3bfeHhoicMWJRnksmpfuUxoNxOSlwcoEWE=; b=ouYizifQY+9BxdYy
	D35sLXnO9O7DWS7mmw5zMVKK7lWHnDM5nsotex3uuaSghvrW1T/RwuV28D02yJRY
	2I10MbiyUF5zsVMHXYmBe0yiidOPZtCCsM0NtYdKfIK+v6qc/nWrT7dwSrGNtrex
	WiqA/n22xd6BABrLWzkPLmEyaU80Anw6ms7Y5mdoJZ6shzCIXqdhKBtT3q29672/
	kL1yULrDA3GHuSweToRMaV+8mlJnGBesDxZaNWirlNx3R07FrnXJn1LwREieu9ti
	UGxoc7/kbJoCl3au+7CYhRWNn4zOSwg/XTaatmOp+t6L27LiPvMYj7KVJQ3aK4YJ
	fjJPcQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2u08gd0u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 03 Oct 2026 09:02:35 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso152470eec.1
        for <devicetree@vger.kernel.org>; Sat, 03 Oct 2026 02:02:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791018154; x=1791622954; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zGGWlPUDb3bfeHhoicMWJRnksmpfuUxoNxOSlwcoEWE=;
        b=N3PdSkO1yJAMvIZS41848wBOugZlM4M6qKAc921dGxQYT3qKtE5ioa1fmHcyAbGV9o
         lb6nzW4WY/szh673nk+B1amJIigE469CkW9MF2KxB7Ri4XS+78emcrGiIa/BUSGO4TrL
         W8GyodFcOhO3PM1NmZbEDkYGyJHLxZNrfQiOdv/61PU2cQ6lzRprDTNGUpf164P+RSPB
         sMko5VZL/rQiweDcDs1LejMo8oaj8U7AtTFSP0J2ouhJBtSoV2uh/0iktUX32tPdJKsS
         dBWsAXFxNYEZgZviZcBkde4W7StBnW5eFDFM7so+mJLeWHa6ZNu00kgf7/bc33nrq6VJ
         KmnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791018154; x=1791622954;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zGGWlPUDb3bfeHhoicMWJRnksmpfuUxoNxOSlwcoEWE=;
        b=KM40Ow8856Si0kOm4rK1xf/Q+nT46O0ItzsWNBxiVH/thHcfImOdQkx6WJnSe4xkkL
         wzB+Z7lt7K7Ot4hD25MSNM6U4OQ4f11dS72Qxg4GKFcDxcreBBjHljUadcC99fIHfUzH
         MlE9XJefjN2b20sWcE1cv++P4E+gLQhwMkwHz2Wfu7soaMvnvJFSKdPZXyWhUKS8Ph31
         RX2kPZbMJFPreM4R88BWJIhjkH9Z13oL8DOQTKG+4qNICigA73S6MMCEWv19UnDsp0nf
         /oLyeyu1U1HK61p7Z0qzjBLyxE3G8SahEQXbYn8vaBqEk0RujPWByTSTPv75SmwmDG6w
         MQGw==
X-Forwarded-Encrypted: i=1; AKwUvByqpEmRkcvvXHsCvm8lsFWTbjRNmYasiVYUfjZv9akQ1HRaa9/Gik7NcAcbmUHy4HyJndSkAmdgbeNs@vger.kernel.org
X-Gm-Message-State: AFq9FYK1BU5sRiWbBf6EkIjrtsqgpu8A3UWV/ci4MEPL4XiTS2N+TZIN
	9OLUJMQcZiKGtRpsLZbYbSfvXHkmV/J3VTYzkKvyXqy6DXQgUdWv4GDjsjc0lVTW4V7Zi+2dZVs
	2IUjt2nUwO9JkKjnCaHRerqnEYduYhqJ+hvFqM0BXaLIph8TRDkHMDmhE1YQ9PvuNWbD5g6R+iP
	A=
X-Gm-Gg: AYBFou2bg5Urx/yLrpyBPmxsTcGoEkqxGznOUAetZdybZf2n0WDyiNaWm21CwTY8V0z
	/gHg5QeBkfeI/OuxtsdryffXquidhSeYRdemubITvMgpu3JvDfo/3siBCOxdi5lezw713qD0LkL
	RrZ6Oyp+dVZO8LC8foMqMV3lPmJjlxchyKF2xGHhaQirJS8Vc69g5zq0eCNroeLvVWVkLzNU90M
	TEr80/ywaVRszWzDBltzRL62cCpuOmuG3ILOmJ0ZuNVCVDDdB9N2aOY4mARe8IFoDcofgzglZXZ
	8eYoI4970h4ao2eWK9n3Pm2TG01AdzvGmdtOpoHJo2y2rTIDhSTjCf4j2+3w1ZWcLnMcXt3SfwU
	Q6UOnNJjxRhFH81qTzqGN46cD+JDdVjwXjxf97ikUYAntuwm5i4xaNIkSPSNSGPhQ6w4IdovVZV
	3GTLU7FHOhWA==
X-Received: by 2002:a05:7301:1885:b0:339:7572:7b2b with SMTP id 5a478bee46e88-34f150eeca0mr4897678eec.24.1791018154300;
        Sat, 03 Oct 2026 02:02:34 -0700 (PDT)
X-Received: by 2002:a05:7301:1885:b0:339:7572:7b2b with SMTP id 5a478bee46e88-34f150eeca0mr4897648eec.24.1791018153703;
        Sat, 03 Oct 2026 02:02:33 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34f14f9f2afsm29278695eec.18.2026.10.03.02.02.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 02:02:33 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Sat, 03 Oct 2026 02:02:16 -0700
Subject: [PATCH v18 05/11] media: qcom: camss: csiphy: Add support for
 v2.4.0 two-phase CSIPHY
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261003-kaanapali-camss-v18-5-87ba4ebe0db1@oss.qualcomm.com>
References: <20261003-kaanapali-camss-v18-0-87ba4ebe0db1@oss.qualcomm.com>
In-Reply-To: <20261003-kaanapali-camss-v18-0-87ba4ebe0db1@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: FBlReZQRxNfBRLjdmXWifNTiiNScDfj2
X-Proofpoint-GUID: FBlReZQRxNfBRLjdmXWifNTiiNScDfj2
X-Authority-Analysis: v=2.4 cv=JqlkP84C c=1 sm=1 tr=0 ts=6ac0c4ab cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=YI0lirVkik_cQ8OgtUwA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAzMDAzNSBTYWx0ZWRfX4yxP39MfHqUp
 4CwMdrHQeitmFwSa8f+6Gxw6TIB343/Xg4BgOQkykn1xRSKECeyMMQ+NxzFQWVVtZ0U1KN1+1gO
 qfsccvrgl9S6LvAZlsGtYrCbOb7kTwE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAzMDAzNSBTYWx0ZWRfX2gcyE7hngEj+
 sCFxFh3DU3S8ArXzUWp45GzIcFtNe+dWmZD4zps93F6rHMg1zg4lSro9l7+7dVZ7slWsny0CsRv
 mlWdx65BjZODv6xX2sPzsS1Hnro/RiHPC4CC2D2/qPWT6WVkj+RSBR2KYok0jXLIZVd+bA7Ny/A
 cJnar04VU1ueZQqJ492cbn/9I+Tv+thUN4/NgiyQzccFFUp8r9UhOsGD5pHrcx+5F22U6iq02LM
 PrlPqXgpfFItXRFHxIbQvC3mMvo+DrW0olMY+fwecxq58sJyQ8Z1bTndk7QORyotcYwIMvl4+/q
 6+lfCs7pQmLwYtBOSuWEbQCgDRCdv0j+IFijQDl8jIBBgjh45opgWnzUqeCLBrV+ixyllErME5z
 6eOTm25wDbF9XuCYmF/akbSySqLo36fWT561hIobnWz7A481Ku+sJdOO8VBJsAxjUNSU3Xt35Yc
 leEfbjslNHh66sdV6wg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_07,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 phishscore=0 suspectscore=0 lowpriorityscore=0
 impostorscore=0 priorityscore=1501 adultscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610030035

Add support for the v2.4.0 two-phase CSIPHY found on Kaanapali, where
the PHY is driven by the standalone phy-qcom-mipi-csi2 DPHY driver
rather than by CAMSS. Add the mipi_csi2_dphy_3nm_kaanapali configuration,
which reuses the x1e80100 lane sequence, clocks and supplies but selects
the v2.4.0 common status offset, adds Kaanapali power domain and register
the "qcom,kaanapali-csi2-phy" compatible.

Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss.c          | 53 ++++++++++++++++++++++
 drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c | 16 +++++++
 drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c     |  1 +
 drivers/phy/qualcomm/phy-qcom-mipi-csi2.h          |  1 +
 4 files changed, 71 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index fca3de214a92..9bd0dc7a7f9e 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -38,6 +38,57 @@
 
 static const struct parent_dev_ops vfe_parent_dev_ops;
 
+static const struct camss_subdev_resources csiphy_res_kaanapali[] = {
+	/* CSIPHY0 */
+	{
+		.csiphy = {
+			.id = 0,
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_sdm845
+		},
+	},
+	/* CSIPHY1 */
+	{
+		.csiphy = {
+			.id = 1,
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_sdm845
+		},
+	},
+	/* CSIPHY2 */
+	{
+		.csiphy = {
+			.id = 2,
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_sdm845
+		},
+	},
+	/* CSIPHY3 */
+	{
+		.csiphy = {
+			.id = 3,
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_sdm845
+		},
+	},
+	/* CSIPHY4 */
+	{
+		.csiphy = {
+			.id = 4,
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_sdm845
+		},
+	},
+	/* CSIPHY5 */
+	{
+		.csiphy = {
+			.id = 5,
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_sdm845
+		},
+	},
+};
+
 static const struct resources_icc icc_res_kaanapali[] = {
 	{
 		.name = "ahb",
@@ -5593,8 +5644,10 @@ static void camss_remove(struct platform_device *pdev)
 static const struct camss_resources kaanapali_resources = {
 	.version = CAMSS_KAANAPALI,
 	.pd_name = "top",
+	.csiphy_res = csiphy_res_kaanapali,
 	.icc_res = icc_res_kaanapali,
 	.icc_path_num = ARRAY_SIZE(icc_res_kaanapali),
+	.csiphy_num = ARRAY_SIZE(csiphy_res_kaanapali),
 };
 
 static const struct camss_resources msm8916_resources = {
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

