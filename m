Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 473D041D22B
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 10:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789467024; cv=none; b=SVEBvM/Pbv2iF562LGKlAvl+oTNXItyB3uBmPu/eFQaUvOX0vorLUC8TbJ8LqP2ASjUf12MxBNs6um+aUapYm+wkYDMlqWzQkDXpFOLS5983N2aGfAdiyfKG3JrQwYvcKYkN5JHZz+lAitHEsx71y/SbucmPrO1/T1ol6g1O+qs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789467024; c=relaxed/simple;
	bh=+gy7qeQtYG7KLJNc9m2TSuu1pefjS9CthP2TcgC/f4c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mk9dv2+dzkkWmdVwq2mVoColjHt6RZAb1cCgjuW0d55MDZwoCNj4E4jtFJaBn6VB08pz7BzZehvPkrd/gqPKputU7r9hXnXq/PJpIUNfStdNVkhGWN+WEm6tQjxdbWEk1LrIcTWzAdUK8+8qOh6UkVsATkx+N197nKUDBUg+LKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Xp++6qcC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cmMXx8zY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Xp++6qcC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cmMXx8zY"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F9h1s33317351
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 10:10:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	I6QCH+KpZMCeQ/nhN4OpqnuGLUBU+Cuv1WCeHB4YY/s=; b=Xp++6qcC8Rh4hSV1
	TEra6U6r9Z5rtFLxYmoTYVHMN8r3FG8aFwEy+UOPKhB0hTsUm+iGB/K4d5XMaShL
	PinXg23ZBjrruU0K/Z/WLmJ5Oy6VjF0bYW8iPUFzcIouGwBQ5QdSi/7X125VlmNZ
	W009SG+V96Di1yItSHoyYjEnsK8r5iu533igKtgZ3xoLabPkHtM/jNkXHkuB8UlC
	eksSD1UNjo5X6XFxt+1bz7EGsjhfu8KAtDW/MkvOitBF0XJ2ZIU9q30uyICKzSMM
	OArAwtDWgQdicg9FBZlo01n1i/IaKCDTZOhk3wXDwzyn29Cg8+YZk9JSveFTd2Yl
	g2r9qw==
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gq38e07f7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 10:10:20 +0000 (GMT)
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4b28dafb8e1so6524322b6e.2
        for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 03:10:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789467019; x=1790071819; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I6QCH+KpZMCeQ/nhN4OpqnuGLUBU+Cuv1WCeHB4YY/s=;
        b=cmMXx8zY0i/cZvEr2ebp4jsbkpyPG6rIQCdvMZnE4THiQSbH6/qJqckUi40BZun+pD
         2jsxe49OyIoumXPkIZyu6ETxD4AvdLnI9IxUHtWOk5BMszrMUuYIi5qFeWbCynZ9GxqU
         i73wPks/ZtOsnr5yoXJM6oAj4JiupQ/qCUSiFImatvoQsf5arF2TUFewO33xT3QylxUX
         6+uh1ptcYrlgbbErVbOkBjesWT+asWzrA+E1raP5PCI2K2FbhCuOQrH9u6SqtrKIuYwE
         sNWH9yq0L+7wgqGFRivXdcmo4JZ/irUVhldtlfToy0IaYcIvrEeUpl8LxCAmHcLoKbQn
         zk8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789467019; x=1790071819;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I6QCH+KpZMCeQ/nhN4OpqnuGLUBU+Cuv1WCeHB4YY/s=;
        b=lTdJV4w6eV37UdIAtupMcvpAmkRw1ZHnQ54B2Ake393LaXeF6rCVhi4Zvxu8Xvxokg
         CNteoMmloa6GfOrS3nHqEuX9V58nY7qV1Um50qqwWE9mYplLsEzX+yz14hX8q7HHrCQp
         TJV/cmITTdddtlGA9gOMtZH7VlV3780OKZbLy44X2ynzHE5fUisT+3GmahY5vw5K5YSC
         QcbI1bv6/2401+RzxV1ZXDTw5W17GKkpua9NweQpJkeDHE9+FoNwmZBuliXT0D9mBd6/
         l6gkV15WkndvePFz7g4WT8RguZQla54fYQ4Q9z0h0ohynMPCBdWpbloDc1fTrhbxXm8o
         2/lw==
X-Forwarded-Encrypted: i=1; AKwUvBw4qOOGH6u/AEPDX5VlwkHJ0AfJNxkrYDKu39yYNY5Cr0Vf6OP+F8KlNSCRvAuIRqfU2aSpzauRGX6D@vger.kernel.org
X-Gm-Message-State: AFuF++lQypgBibHt+E24Jc+dfGR1VFKcEXST+nefayYqULmnasVlEyNP
	G4ILta7zJm/RHbjs5TzgMhckQJGiF4WMuoxxnji9ql+Ky4fEMzhXcHmrRMssXC0fx1+y6GoWcSD
	bXq7TkeljPCmn6Filr9SvtIWBUu3kE72JqZfi+zw+GSeh8ObxlEyjdRNZrI/GykI4
X-Gm-Gg: AYBFou3XfeqUyRJBjxHIMLoZVUyYIcouEFIbdvDq/aytDOqb43zBeb5sf9g4l72bB5l
	633bNVoBmBS1IdS3b/rNQvdzZW5vpz9EJtT5I6aYeOqiW4JY5tsMk+Fwa2ZuxAz/xQ6worhUgzK
	j3stL3zHMcY74Sf8NYp8iHA9Ft6hcXSujzbuORN4W2CW562v241WazEQhKy0YWc1jcd4Lgze6rv
	EZcsdpWv0OMGsVn5y7HflZdkaqkxBFyRmRZ7lIIoIDS1oAr6KkKypweN65qVFHKwNGDHxpSNf4D
	k8FneD+S+hHbs6+kxifKx5T5yZJ752/vk542tNg9EAx30hqqFZi/Pc0024eN86LJP6oLqN8jf6b
	r2psQW3mClLGmUsiH7ECW/DHm0IesE4SgFE5EB/MsE8W5fJonVM83q4Ut7nzwxiGNjmTz40EO0M
	g7+BLDkYhHHlU=
X-Received: by 2002:a05:6820:2909:b0:6b0:be69:d3cd with SMTP id 006d021491bc7-6c53f9793eemr3779387eaf.17.1789467019376;
        Tue, 15 Sep 2026 03:10:19 -0700 (PDT)
X-Received: by 2002:a05:6820:2909:b0:6b0:be69:d3cd with SMTP id 006d021491bc7-6c53f9793eemr3779357eaf.17.1789467018975;
        Tue, 15 Sep 2026 03:10:18 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14382741839sm14244091c88.6.2026.09.15.03.10.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 03:10:18 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 03:10:00 -0700
Subject: [PATCH v16 05/11] media: qcom: camss: csiphy: Add support for
 v2.4.0 two-phase CSIPHY
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-kaanapali-camss-v16-5-c9f3f6f4180c@oss.qualcomm.com>
References: <20260915-kaanapali-camss-v16-0-c9f3f6f4180c@oss.qualcomm.com>
In-Reply-To: <20260915-kaanapali-camss-v16-0-c9f3f6f4180c@oss.qualcomm.com>
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
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: gYW6pj7aS7XFK-IqG8NwCXbBn1iaNpqE
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDE0NiBTYWx0ZWRfXzFaSJai2HHvN
 BoX9DbYs2croBNkBhN+nILznzpVo00zC8WBxJxufHwa86JhKJY4l/mpqoSZG8fCmpQcZ7bJZ9DW
 PEHmfpORsC4Jc9RAZM+but6pRiXJLA4=
X-Proofpoint-ORIG-GUID: gYW6pj7aS7XFK-IqG8NwCXbBn1iaNpqE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDE0NiBTYWx0ZWRfX9N8KTmfAY2Zs
 MjdUAr2MDuk+AG+FtRz2x3UfCt6c5Y3ipuUL2oHdYKRRimuz15IhYUXUN4B5XckBB49FOEaAZKC
 8L/80n8vtz/F6/ddXBKx1IAk4bbbVeDkq/yhWR6Mg/umPSBCoFSM0WjJiVevpLduFUobhnIyh7p
 Vnod5AsRDqhiEcfTHRQbKTy9ZKjnaTL84y4xk0QOJBwmQq2wjwvP+DOYzO8Oa4Zc7ma6cTjpkLA
 Zxzl/m7SmKkua95YtmWzoXOskRNHuPiUKk0YD5+rqrqt61KQnau1PlBrXwj8PBUeYeFhDLSufqY
 Ex80xD0bhvrkTOsur9xb40R/331l59mJwEtbFE7Z9UUSLdPGsl5GRbY5Fo6nAVnPjojScvaXiXU
 5kO38lUd1JBvbYHV0dPspbb1nu2z4aVRXo0cmXOQivgCptwK/PH0OCMBDyw1TQIs0Tuxi7xeOgt
 mYMTEvckJfiyPgJZ2jg==
X-Authority-Analysis: v=2.4 cv=BswIUoX5 c=1 sm=1 tr=0 ts=6aa9198c cx=c_pps
 a=AKZTfHrQPB8q3CcvmcIuDA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=YI0lirVkik_cQ8OgtUwA:9 a=QEXdDO2ut3YA:10
 a=pF_qn-MSjDawc0seGVz6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_03,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 spamscore=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150146

Add support for the v2.4.0 two-phase CSIPHY found on Kaanapali, where
the PHY is driven by the standalone phy-qcom-mipi-csi2 DPHY driver
rather than by CAMSS. Add the mipi_csi2_dphy_3nm_kaanapali configuration,
which reuses the x1e80100 lane sequence, clocks and supplies but selects
the v2.4.0 common status offset, adding Kaanapali power domain and
register the "qcom,kaanapali-csi2-phy" compatible.

Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss.c          | 53 ++++++++++++++++++++++
 drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c | 16 +++++++
 drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c     |  1 +
 drivers/phy/qualcomm/phy-qcom-mipi-csi2.h          |  1 +
 4 files changed, 71 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 2c9f02bca809..0a79484ea1fe 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -34,6 +34,57 @@
 
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
@@ -5613,8 +5664,10 @@ static void camss_remove(struct platform_device *pdev)
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
index 4227f29ad1f6..b766e1ece660 100644
--- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
+++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
@@ -441,6 +441,7 @@ static int phy_qcom_mipi_csi2_probe(struct platform_device *pdev)
 
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

