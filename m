Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 910E03BB9ED;
	Mon, 10 Aug 2026 11:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786361285; cv=none; b=sqvAUzBh47s7TrImH0qnme5xW2asQuYKArd/A0OsNd9Y7+Hpidhmcy+AWTYdmUXx8Yvj9WumK2fvR0lIsYWwI3J6zQb4OnLjtGOL8OXf2Gm6RUKkZ/CJ8WtiLsvymq7vOEXRK/bFSzC/fLtglBbn3UCrnxDRa1k0o5xxOers6Q8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786361285; c=relaxed/simple;
	bh=+qn5uvdz54R7OXbPO7SM0CitO63HvTA7YF8rmOzNXoo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=L4FeGyHNUrSOcdPOkHUH8OVB0iZvgyX+VfKtpsVscx0CFT1br1sPWRBkSJBMlRuUE/En7l8AxCdZo6lRLk1RnsqQ0z0TBeOnjtdcPOKkj2K+HsaivtT8tBL4TUYlLBzEIu1O75+TlSOu5DoxKRPsVHs3dz1/s22NYZzGobanHOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kzw3aZoN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kzw3aZoN"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67A9SKNt2341903;
	Mon, 10 Aug 2026 11:27:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=H0NKqQtzSnk
	PjFUMFltWTCYP2upTtwJOXyI49W39z7Q=; b=kzw3aZoNM0eBwLuO203DKz7AUvS
	SdkYipvOQJQhjpxQ+QybrwJytcrsbOykGnCNzadHktL8qrmh1ss3Ibtp/P9PbqT7
	B1QXNS+XaUUSS+9ushebus5j9GNToTzx6BfuJSqvKV+vc9QyKSRIPaNEwPKtLv36
	S3YoIfHK1XX5UoXmLXZYnaiSoTQyN9dVhM6gH9E4SoTfqGRkz6zLBaqdadudFlLu
	Y4y1gZhZpeEWi3MoRg2dbcZy9lJ3i1IMUyGUE5AcGi7uCp79r/S48P1qeaeUIZHj
	e5E4CxbVMxP5RKPOSLFQTjjA7VrDvNNytbmUBtbYtl8cu9H0nx3K2PPyD1w==
Received: from aptaippmta01.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fy19kj87m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Aug 2026 11:27:58 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 67ABRu41004196;
	Mon, 10 Aug 2026 11:27:56 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 4fwwhj4wag-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Aug 2026 11:27:56 +0000 (GMT)
Received: from APTAIPPMTA01.qualcomm.com (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 67ABRua0004178;
	Mon, 10 Aug 2026 11:27:56 GMT
Received: from cse-cd02-lnx.qualcomm.com (smtphost-taiwan.qualcomm.com [10.249.136.33])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 67ABRtmf004165
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Aug 2026 11:27:56 +0000 (GMT)
Received: by cse-cd02-lnx.qualcomm.com (Postfix, from userid 4438065)
	id 800B548E21; Mon, 10 Aug 2026 19:27:54 +0800 (CST)
From: Ziyue Zhang <ziyue.zhang@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Ziyue Zhang <ziyue.zhang@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/4] phy: qcom: qmp-pcie: Add qref and refgen regulator vote for QCS8300 and SA8775p PHY
Date: Mon, 10 Aug 2026 19:27:33 +0800
Message-ID: <20260810112735.1326807-3-ziyue.zhang@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260810112735.1326807-1-ziyue.zhang@oss.qualcomm.com>
References: <20260810112735.1326807-1-ziyue.zhang@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-ORIG-GUID: Dnkk-s0dGM2SP0WcvzMuSj8sYVFmiZ0W
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDEwMSBTYWx0ZWRfX1PMTX4R/p4V2
 uK6Y9p1gyNksqIJO5i4qr3GLcQbLdfEhmjW2wOI0YNn4Vv6VB+iSAXCPu9RKqODUFNby+6XozZT
 Q4AB4eX5T8nurqAcYcloUuoNVdPCUiGuFURmGS5UXdFDQhbSN8QF8jMDVeePwxfUNeSHRMu7gVR
 jqvJpXo6OOWzzeP2WAz6FiOPjvDi32OSHnkmHpj04104VL0FO2BsUf8cAPXwsNGOknKkij8kFlf
 axFxqboWJx+BPmuSg79lqbUkcggIe/YL78g2WzhIUsvGik3kuydVe1m02iBUBFEdjUSnpr4D2KE
 qDW4mNJWJ9pR9XrzVFCXt5KfUPUagihJot3I7GDNz0t3Cy7cY27TeKatGWZXAEtcScrtc+w70qa
 LPqBD4TliHb20zT11t5Y6bgoUWhT3yjoWUMvmcRvu7kr6WJb6mGputlDRxJtrx3mFPblhSY5Rra
 RH/syAtOsZWK3/bHNNQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDEwMSBTYWx0ZWRfXz5r+YAgbRJl3
 Q5S8r5/y1DUzZ5b7dHmDLISEFCvad++6P/P6yipAVzcIJv5xr9wBghXZ8G4HUgkxN0ZCBjKFxSw
 tbbXoU+exE3Mt6XFynHzc29qCfHcGgk=
X-Proofpoint-GUID: Dnkk-s0dGM2SP0WcvzMuSj8sYVFmiZ0W
X-Authority-Analysis: v=2.4 cv=abxRWxot c=1 sm=1 tr=0 ts=6a79b5bf cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8 a=oDW96ipbCRtAeguNJTsA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_02,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 spamscore=0 phishscore=0 clxscore=1011 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608100101

Add a new sa8775p_qmp_phy_vreg_l that includes vdda-phy, vdda-pll,
vdda-qref, vdda-refgen and refgen supplies, and use it for QCS8300
and SA8775p PCIe PHY configurations. This avoids modifying
sm8550_qmp_phy_vreg_l and breaking SM8550 and SM8650.

Note that due to a hardware issue, QREF actually depends on refgen3
rather than refgen2 as documented; refgen3 is therefore voted manually
via the refgen supply as a workaround.

Fixes: a05b6d5135ec ("phy: qcom-qmp-pcie: add support for sa8775p")
Fixes: ebf198f17b5a ("phy: qcom-qmp-pcie: add dual lane PHY support for QCS8300")
Signed-off-by: Ziyue Zhang <ziyue.zhang@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
index 27034bb62d0d..5d6186512c14 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
@@ -4018,6 +4018,10 @@ static const char * const sm8550_qmp_phy_vreg_l[] = {
 	"vdda-phy", "vdda-pll", "vdda-qref",
 };
 
+static const char * const sa8775p_qmp_phy_vreg_l[] = {
+	"vdda-phy", "vdda-pll", "vdda-qref", "vdda-refgen", "refgen",
+};
+
 /* list of resets */
 static const char * const ipq8074_pciephy_reset_l[] = {
 	"phy", "common",
@@ -4508,8 +4512,8 @@ static const struct qmp_phy_cfg qcs8300_qmp_gen4x2_pciephy_cfg = {
 
 	.reset_list		= sdm845_pciephy_reset_l,
 	.num_resets		= ARRAY_SIZE(sdm845_pciephy_reset_l),
-	.vreg_list		= qmp_phy_vreg_l,
-	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
+	.vreg_list		= sa8775p_qmp_phy_vreg_l,
+	.num_vregs		= ARRAY_SIZE(sa8775p_qmp_phy_vreg_l),
 	.regs			= pciephy_v5_regs_layout,
 
 	.pwrdn_ctrl		= SW_PWRDN | REFCLK_DRV_DSBL,
@@ -5218,8 +5222,8 @@ static const struct qmp_phy_cfg sa8775p_qmp_gen4x2_pciephy_cfg = {
 
 	.reset_list		= sdm845_pciephy_reset_l,
 	.num_resets		= ARRAY_SIZE(sdm845_pciephy_reset_l),
-	.vreg_list		= qmp_phy_vreg_l,
-	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
+	.vreg_list		= sa8775p_qmp_phy_vreg_l,
+	.num_vregs		= ARRAY_SIZE(sa8775p_qmp_phy_vreg_l),
 	.regs			= pciephy_v5_regs_layout,
 
 	.pwrdn_ctrl		= SW_PWRDN | REFCLK_DRV_DSBL,
@@ -5259,8 +5263,8 @@ static const struct qmp_phy_cfg sa8775p_qmp_gen4x4_pciephy_cfg = {
 
 	.reset_list		= sdm845_pciephy_reset_l,
 	.num_resets		= ARRAY_SIZE(sdm845_pciephy_reset_l),
-	.vreg_list		= qmp_phy_vreg_l,
-	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
+	.vreg_list		= sa8775p_qmp_phy_vreg_l,
+	.num_vregs		= ARRAY_SIZE(sa8775p_qmp_phy_vreg_l),
 	.regs			= pciephy_v5_regs_layout,
 
 	.pwrdn_ctrl		= SW_PWRDN | REFCLK_DRV_DSBL,
-- 
2.43.0

