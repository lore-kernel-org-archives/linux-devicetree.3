Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8CC43264C2;
	Fri, 24 Jul 2026 05:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784869737; cv=none; b=RLeKwPOquiaquyzs8MHmhOrkLHy7sRP/xAWwcaiTetn3WtGb8tV1iZ6nIIocNC9sROSY3C9b7+B8lrDsfq0Oa6sslLEXB50Y1LNMS3Z3e8DvIXiJm1R8ZMo616Rjbeku5sOpVG+PKic3SyORlghv2BfgUg7fiyp3Eege+WvAM7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784869737; c=relaxed/simple;
	bh=j6Q7Dmij6Y46wgwIzkjamYqB/kfdhXUTwQRAXKz0/VY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=kI8VdGVLijxHltyTWulZquDeSjUuGWSDgP36H3X+urG/BG66IN0YqOvSe8xkbFG14acZ2yAfi7H0w72fmuj2LmvxFwx8bWXy05iJO/GHDcMD1CV3d8YNIV3awqUPclx96J/Cadf3Elzz+8BskhsAeNlvhGQb0MfiSSBj9BhzF+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CPKCSyEi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CPKCSyEi"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66O4lRZl1869335;
	Fri, 24 Jul 2026 05:08:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=04H+gOt+GzMx/fAtJoG9A66VOmLfI/r2f5z
	tp/77Pd8=; b=CPKCSyEiMF9XX6C3cBjHB+ZGYh1gSvJbnDrZUIBiT9A2guqXosw
	7lmVNBx5ekSgbjM9YSNL8YTudvAGSpR+WDWbdOEsN7/242g27NXbgjOP2Vtx3+fD
	1Ma5yEVu3/akOJ3D3PXt16v9YxzprTE2+V8gJKYetcuF+ZkyOsWCQ6u2IChm0uWZ
	rYrPumgAM+RcbdqbnXimaJfnt9jsxEY9kYXv9EocczoduFW9PM5nFfpL9zk8sJ9v
	dJpTgdTkQ99KHIWUQnuMkclYJm+1P6y6VlG/S8eN5TpGAAaUP9dR3LJFeqfX5jMQ
	4xXy3seRy7pqz3f/9MQ+FGInqeYwLcYpRgQ==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fm0pw860b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Jul 2026 05:08:52 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 66O58nYM015626;
	Fri, 24 Jul 2026 05:08:49 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4fgj3xcaxq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Jul 2026 05:08:49 +0000 (GMT)
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 66O58mUh015621;
	Fri, 24 Jul 2026 05:08:49 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-rpavan-hyd.qualcomm.com [10.213.96.234])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 66O58mxF015619
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Jul 2026 05:08:48 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 437544)
	id E69C7661; Fri, 24 Jul 2026 10:38:47 +0530 (+0530)
From: Pavan Kumar <pavan.m@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Pavan Kumar <pavan.m@oss.qualcomm.com>
Subject: [PATCH v6] arm64: dts: qcom: qcm6490-idp: Add IPA node
Date: Fri, 24 Jul 2026 10:38:46 +0530
Message-Id: <20260724050846.3413161-1-pavan.m@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDA0NCBTYWx0ZWRfX7LaZswOZuu39
 RtiWNjUdstIGwVhdY3BdhSV48PE+O5bKfoZLUe8WV491Nm3/fhEJ+imdknI1MAPQatUuS9Dmw02
 iUf7E62ENRs28OksqMitri401+pig6mrImIBM8Ydaaz4nEd3V6dL6V0bDO0YSujGVY4r02mhaIy
 ZelrFmK9vNwSd4zpRyXi6/q3LAQtPZus0GfyhSTHXY8nso92cWmTgvKzWgDMOBcIFtU5sIUNao0
 kl87A0PIvBRBvXbExJzF8278vKvPc/76hIREsyluCZdH1xKoOhpC/9HEQDDjpGSr+GEQ9swQ+F9
 LAWl5Rt1OUkeIS9PIaR+kWV+sJ2XNxhtL/lEzHlSEucduqBSZBvLfydg78kenOxcI0FiO5q4chG
 Ha0k6+PF+vuhAbJCdS6Tye/6wyfXBf7iV9sHWLQno9SD9hq39fYd7uvwsfKBq7fa243lDFlqPYE
 kHeyN2cNjTpYvZ8ohjQ==
X-Authority-Analysis: v=2.4 cv=RJeD2Yi+ c=1 sm=1 tr=0 ts=6a62f364 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=f71KzxkOnNgeLeawMVgA:9
X-Proofpoint-ORIG-GUID: 7zmdqPtp8rwCiN_qRTsVvhYuJaICNx2D
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDA0NCBTYWx0ZWRfX2+u2Bx1v6Tl8
 mwMnFNgSwFQlLxuxGvksxUPqWJw3Frt6TSWJqXM/YXjz0Ur8ZlK42652UpUE6ut2AlYj6B1w+3m
 Pl35+pxTkuc2OsPnwk0STJdLe9MIJjw=
X-Proofpoint-GUID: 7zmdqPtp8rwCiN_qRTsVvhYuJaICNx2D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_01,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 phishscore=0 bulkscore=0
 impostorscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240044

Enable the IPA block and provide the firmware name
required for firmware loading on qcm6490-idp.

Signed-off-by: Pavan Kumar <pavan.m@oss.qualcomm.com>
---
Changes in v6:
- Corrected the board name in the commit subject from qcom6490-idp to qcm6490-idp.
Changes in v5:
- Reworked commit message to describe the functionality being enabled.
- Removed IPA property consolidation explanation.
- Removed obsolete Link tag to IPA loader series.
- Clarified that the change applies to qcm6490-idp.
Changes in v4:
- Removed empty line between Link and Signed-off-by tags.
- Added empty line before the status property in the IPA node.
- Sent as a new thread instead of replying to the previous revision.
Changes in v3:
- Rebased on top of IPA property consolidation series.
- Dropped qcom,gsi-loader and memory-region properties as they are now
  provided by kodiak.dtsi.
- Added Link tag to the dependent IPA loader series.
Changes in v2:
- Modified firmware file extension from .mdt to .mbn

v5: https://lore.kernel.org/all/20260722082314.1502072-1-pavan.m@oss.qualcomm.com/
v4: https://lore.kernel.org/all/20260703085809.2573214-1-sarat.addepalli@oss.qualcomm.com/
v3: https://lore.kernel.org/all/20260702105509.1360340-1-sarat.addepalli@oss.qualcomm.com/
v2: https://lore.kernel.org/all/20260618124700.2001191-1-sarat.addepalli@oss.qualcomm.com/
v1: https://lore.kernel.org/all/20250304152133.GA2763820@hu-kapandey-hyd.qualcomm.com/
---
 arch/arm64/boot/dts/qcom/qcm6490-idp.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
index bdc02260f902..7242695aed97 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
@@ -619,6 +619,12 @@ &gpu_zap_shader {
 	firmware-name = "qcom/qcm6490/a660_zap.mbn";
 };
 
+&ipa {
+	firmware-name = "qcom/qcm6490/ipa_fws.mbn";
+
+	status = "okay";
+};
+
 &lpass_rx_macro {
 	status = "okay";
 };
