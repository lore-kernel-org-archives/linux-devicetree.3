Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FA3A33F58E
	for <devicetree@vger.kernel.org>; Wed,  1 Jul 2026 16:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782924697; cv=none; b=EiOS5u25wjXPX/y0iw85vh8tucGMqaiYr7TrPJIA4sgS9MLN/COEVhBSXmmDq4PukANqdsQOZ7Vxu0wbfoJt7UMK2QqWMID+hsyKtNho2fnb+uSbZ2RlXLE54ELnB+rrrmkXJg+IDfKwTR77Lbmb6Ql0tOyATOQyCZNAD5aEyuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782924697; c=relaxed/simple;
	bh=pbtAlqAtciPyZLApsIuSzsmZ5up6NekgbBPTk2/K2mY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=o5TyH5+frPZoQjh4IfV4V9GdXPLHqorWzuuD8Ad+dbhfStD5pdo+Q8ikh6xxgDXr551RnGQNOpxAjz2tnHtJphqgXNcE46gB3EFmxm2gJHPkXghpsv9FDypG1HYnoQSIN5XeoYhGM+k1uTZrJKc5U3dANENPyQZbvJCCVPb6FeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fiTukh4w; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MIfjNZHh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fiTukh4w";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MIfjNZHh"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661GmceG1589773
	for <devicetree@vger.kernel.org>; Wed, 1 Jul 2026 16:51:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=DySryhhOCAk
	VsOqghjH6N3boVFZ/zvc1535VchMsR3A=; b=fiTukh4wumIPlge6T03oChYnj7c
	d0WpmggZ/4aSE8knBLoWRIKVBxrO0VyEoCBQKnpoll9yAhom7ANxhc5Q2tfHAkhq
	1wXBmCUIuHjmCMN6bfNc+0Lbpmm3+FLvPJ80bLjMjXuNXO+M0PFPGdrvoxaCAs/U
	0JLoTXOgLwS5zGzc4NvGCGCxPa5IX3sQHhg5SD6TCBulHbu1Esl3eVBFVIrw2eTV
	ak7TkmFl9vf7AA0585UQ4CmGev/E9FQTKGC870peffjMsZdHq6ogMkk4pDnbMFqG
	h3y4MgXBJqgKyA9mmiGmxjSzWvKyhvoiBXh1tWlOo0Mkx+lyhoiWyFhElmQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f53q08vnw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 16:51:35 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-37fccad2b01so1370577a91.2
        for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 09:51:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782924695; x=1783529495; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DySryhhOCAkVsOqghjH6N3boVFZ/zvc1535VchMsR3A=;
        b=MIfjNZHh85Oq5Pz+az5Tk4WG2f7OkkNeX1xxmgUZ0/CQx8/SK0iVAWFK0zcXtXlQEG
         eI/6bpV1C9xFTLsVNHTnx31XdBdz3K33oZh2vFtUT3Q5n/RrRIL28aWK7iy+Pdo5YHFo
         I9I5HCgCp2f2XH/7r50Y9pzotA68T5P0U5WviseZx/MnU033WYtHtKc/qU04VtpBD1Kw
         P87yFB+r88stV+YV5KAFNaDqSAa4BSvJ7W3yWZZfJYUuxBGZMf+ADn2VBNbV+y58rXKR
         GyjdrUp5xh3plp+QjdpPQ6a2vo1pI63uhNq8pSYbyZ3WxP1fRLacXruUaiGNvOFgn3Ak
         AbkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782924695; x=1783529495;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DySryhhOCAkVsOqghjH6N3boVFZ/zvc1535VchMsR3A=;
        b=OMiGnvjgzTnsgE1Do9ScjtATPB3btg6lLlhY+UGcGyJpyhESEk2Mjrl6uyzB1xqoIJ
         9TrgsmntcGHsnkOh6mxlg13lc4DaqMLHzf2wQIdqHBiPlHqjvZi81jY1WhRQ1eMf9f5K
         CJv/+CHdbwI5mq4at0amGb03ap7QCaluZ9eSuioGNAA1uaeqgyaeiL0Yzj0ucNaEXmMe
         dkgqkIqlnmlNJGyCkaCLbytSTXnF7bty37EQkx6K4RR086zHHZBo1ZwmWYy2j/nKrjFV
         CJq0LNK9nb5AYndhVmO9+IQsmpMy/Nd5N1AWaxr8TasZsg6/OZrZduUDZJ0KKpgu2i2s
         TtYg==
X-Forwarded-Encrypted: i=1; AHgh+RpKYKpAgGqLNYs8zFhHrZhKkeDgLx6vTTS7s20kkoZp4cgjf6+/XTyARLVGVZLHlAEPycLJSAxImHNw@vger.kernel.org
X-Gm-Message-State: AOJu0Yzz3AmDezgp/+UcwhLhIZnsREBWaug77QEVP82SeVStD5Z+H2vR
	1PG+iUEmB/g2LAIp71r0li4KOXmEIWeFdS1AGSCQaD0IIfwA6BztcPS5m6SQKDKbTuG7a164r+l
	wKk+knb9hmMdQdTORm8sAl67euGzvwtlth2r+jXrym0RwWMPHKhVxM/V5JD9ca5MU
X-Gm-Gg: AfdE7cmwd26/GV1VEgPgF27eb5YVOxURawQF1C8iZ4wv2H7W/kQI7+phvpPPVk163a5
	vqDQFJlR+28lUJmt5SQSTF++ONjiTeiYj1fCZ3LN+DujtwMs0k7j3JcSBcHgRfukSMMSe6tAMUo
	UjP5CR1ktM2RWsrJiHieYXlGMnu8nawpxKjMT9UVyyXcGkk2G7alnbJrhyyNYVi+Ya1NZhBM6sd
	Xn7oTVjZPltsR4Tk5LVt1uw6zqtAXejTssNEi5PU1q3XKAk59NDXwR16EJtWOD9QsOwb4JiSh6A
	EBAS89iAq+6E9Gt102Dp7Se0todgiAWNb/GpXEt2B6Y9AOlk1qvpXDt3JxOyCwoGBBKYGLcPoYU
	BiKB+pXbuTAUiaX9x1CJ9H6CBYy3mmZSnweCzeR8hUwK9JX5O+mCC59XqweVas0jbLJ82KZrYAV
	9WfiQG
X-Received: by 2002:a17:90b:548b:b0:37f:9ce1:cdab with SMTP id 98e67ed59e1d1-380baa971aemr1557081a91.33.1782924694821;
        Wed, 01 Jul 2026 09:51:34 -0700 (PDT)
X-Received: by 2002:a17:90b:548b:b0:37f:9ce1:cdab with SMTP id 98e67ed59e1d1-380baa971aemr1557050a91.33.1782924694380;
        Wed, 01 Jul 2026 09:51:34 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ee317095dsm33038935eec.15.2026.07.01.09.51.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 09:51:33 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>,
        Johan Hovold <johan+linaro@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: [PATCH v4 4/4] phy: qcom: qmp-usbc: Add qmp configuration for Shikra
Date: Wed,  1 Jul 2026 22:20:51 +0530
Message-Id: <20260701165051.4122259-5-krishna.kurapati@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260701165051.4122259-1-krishna.kurapati@oss.qualcomm.com>
References: <20260701165051.4122259-1-krishna.kurapati@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=dtnrzVg4 c=1 sm=1 tr=0 ts=6a454597 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=BrUXx0GcgBZ9W2fV7PIA:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: xQqGwuCFCzuAIE7Hk5p6ZcfkArwUgAd7
X-Proofpoint-GUID: xQqGwuCFCzuAIE7Hk5p6ZcfkArwUgAd7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDE3OCBTYWx0ZWRfX1teUWMSu4N9A
 QVHrGsTeONfQ5HqmgYCsipmyS/v6zjQm5un+2SqbBYQ9Vs678WZfrahyNrBPPn67HzQb/wXOcDb
 9yvoet82PCRCgOyLA8JmX4EJlcySuX1vWxuMW2gVHonJu2Wu+ZopoUoTGeZPDjBiCAWOdCIp+ix
 J9RZdN+2F0SJO2ehLqdk5pMOiLhHE5GaxrjRkmlJg+e3F5yHgQIR1HBT3SwXtcKYcT2D9GyRuq/
 J5Eh05/zJ7zxzf3VsUch8qU7RChXQ4FoFea4a2mrfcdy23cv0Q74ifoYAolJ3s+MzvyObgd7aUP
 dd+9A4OvvOknoCBfifn1F+/hyhs+vC9qSu1nDFJymCwX1jsuwTvhiMXDAlDRBlQEWpkeluyWKUa
 gsC4fLgL+M0ZRob5eX1DEdNzrKqhbJhlMQb7xgpUJ2UxlXKXBoW2w4ViZeOJv8aItQxRQb7ngVO
 WX56NglF/Bp09B0b2aA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDE3OCBTYWx0ZWRfX0Pe71qIGpyyk
 GwSkQPT42mP+WbcHhK/L62hAcmcl4MP4zFUs+W2Y1mfF3HRHvw3NTvPGnxHbxHGcR0vLSVG1Gif
 zg0voX3xb3k3NH/Z1kTRf2apbsfJw9c=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_04,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 priorityscore=1501 suspectscore=0 spamscore=0
 lowpriorityscore=0 phishscore=0 malwarescore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010178

Add init sequence and phy configuration for the Super Speed port on Shikra
SoC. Also since Shikra uses 3 resets, add support for the third reset and
configure Shikra platform data to use 3 resets.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 53 ++++++++++++++++++++++--
 1 file changed, 50 insertions(+), 3 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
index ab3055bb5b0c..fa8492b487d7 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
@@ -512,10 +512,14 @@ static const char * const usb3phy_reset_l[] = {
 	"phy_phy", "phy",
 };
 
-static const char * const usb3dpphy_reset_l[] = {
+static const char * const qcs615_usb3dpphy_reset_l[] = {
 	"phy_phy", "dp_phy",
 };
 
+static const char * const shikra_usb3dpphy_reset_l[] = {
+	"phy_phy", "dp_phy", "phy",
+};
+
 static const struct regulator_bulk_data qmp_phy_msm8998_vreg_l[] = {
 	{ .supply = "vdda-phy", .init_load_uA = 68600 },
 	{ .supply = "vdda-pll", .init_load_uA = 14200 },
@@ -680,8 +684,48 @@ static const struct qmp_phy_cfg qcs615_usb3dp_phy_cfg = {
 	.configure_dp_phy	= qcs615_qmp_configure_dp_phy,
 	.calibrate_dp_phy	= qcs615_qmp_calibrate_dp_phy,
 
-	.reset_list		= usb3dpphy_reset_l,
-	.num_resets		= ARRAY_SIZE(usb3dpphy_reset_l),
+	.reset_list		= qcs615_usb3dpphy_reset_l,
+	.num_resets		= ARRAY_SIZE(qcs615_usb3dpphy_reset_l),
+	.vreg_list		= qmp_phy_qcs615_vreg_l,
+	.num_vregs		= ARRAY_SIZE(qmp_phy_qcs615_vreg_l),
+};
+
+static const struct qmp_phy_cfg shikra_usb3dp_phy_cfg = {
+	.offsets		= &qmp_usbc_usb3dp_offsets_qcs615,
+
+	.serdes_tbl		= qcm2290_usb3_serdes_tbl,
+	.serdes_tbl_num		= ARRAY_SIZE(qcm2290_usb3_serdes_tbl),
+	.tx_tbl			= qcm2290_usb3_tx_tbl,
+	.tx_tbl_num		= ARRAY_SIZE(qcm2290_usb3_tx_tbl),
+	.rx_tbl			= qcm2290_usb3_rx_tbl,
+	.rx_tbl_num		= ARRAY_SIZE(qcm2290_usb3_rx_tbl),
+	.pcs_tbl		= qcm2290_usb3_pcs_tbl,
+	.pcs_tbl_num		= ARRAY_SIZE(qcm2290_usb3_pcs_tbl),
+
+	.regs			= qmp_v3_usb3phy_regs_layout_qcm2290,
+
+	.dp_serdes_tbl		= qcs615_dp_serdes_tbl,
+	.dp_serdes_tbl_num	= ARRAY_SIZE(qcs615_dp_serdes_tbl),
+	.dp_tx_tbl		= qcs615_dp_tx_tbl,
+	.dp_tx_tbl_num		= ARRAY_SIZE(qcs615_dp_tx_tbl),
+
+	.serdes_tbl_rbr		= qcs615_dp_serdes_tbl_rbr,
+	.serdes_tbl_rbr_num	= ARRAY_SIZE(qcs615_dp_serdes_tbl_rbr),
+	.serdes_tbl_hbr		= qcs615_dp_serdes_tbl_hbr,
+	.serdes_tbl_hbr_num	= ARRAY_SIZE(qcs615_dp_serdes_tbl_hbr),
+	.serdes_tbl_hbr2	= qcs615_dp_serdes_tbl_hbr2,
+	.serdes_tbl_hbr2_num	= ARRAY_SIZE(qcs615_dp_serdes_tbl_hbr2),
+
+	.swing_tbl		= &qcs615_dp_voltage_swing_hbr2_rbr,
+	.pre_emphasis_tbl	= &qcs615_dp_pre_emphasis_hbr2_rbr,
+
+	.dp_aux_init		= qcs615_qmp_dp_aux_init,
+	.configure_dp_tx	= qcs615_qmp_configure_dp_tx,
+	.configure_dp_phy	= qcs615_qmp_configure_dp_phy,
+	.calibrate_dp_phy	= qcs615_qmp_calibrate_dp_phy,
+
+	.reset_list		= shikra_usb3dpphy_reset_l,
+	.num_resets		= ARRAY_SIZE(shikra_usb3dpphy_reset_l),
 	.vreg_list		= qmp_phy_qcs615_vreg_l,
 	.num_vregs		= ARRAY_SIZE(qmp_phy_qcs615_vreg_l),
 };
@@ -2019,6 +2063,9 @@ static const struct of_device_id qmp_usbc_of_match_table[] = {
 	}, {
 		.compatible = "qcom,sdm660-qmp-usb3-phy",
 		.data = &sdm660_usb3phy_cfg,
+	}, {
+		.compatible = "qcom,shikra-qmp-usb3-dp-phy",
+		.data =  &shikra_usb3dp_phy_cfg,
 	}, {
 		.compatible = "qcom,sm6115-qmp-usb3-phy",
 		.data = &qcm2290_usb3phy_cfg,
-- 
2.34.1

