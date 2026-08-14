Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C04E19D074;
	Fri, 14 Aug 2026 00:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786668464; cv=none; b=WFgBEnBSlX6Vv10SGIiC9QXDdDfbYdw9dyQAMMhTCTxnPbMObiPdH9JZW0cD7tbHFxEd9qbKc+DmLJSVivJRKdteQAy1ko+m+0WLaHKpV0AjKfaJ1I3JomSg64m5/FOEvIPkUn3quQmJFTMSwhrv18d6hnRpzq/nQAjK6o+lka8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786668464; c=relaxed/simple;
	bh=5kzt6kTpJqAqtPKCv6BwPwx7/A5p9Iwlfihrgw2qq8A=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=aJ6+WdCR0rFB3QERcmSiZGn40P8Pvmgxk9nQOp19XhyTznogwjBpVVQn0hqT++Lv/YSL+lb5Rd9Ve0cZ1Hccuq59hsT44imUmPOFLNBBvjDpwvlkVGpX3revVASTpj5kH9ZEWre26FQCGsuxdNirMh0+pWIpz+nMmOY40G4fOSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WBSNhKdq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WBSNhKdq"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67DLWlqO3981766;
	Fri, 14 Aug 2026 00:47:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=rl6qTc4ik99JKPX6LYsfjwOm1Gds3lOqIUm
	bJ/ULlBE=; b=WBSNhKdq4+qgKrYaVaA5s+bu/RSQyoS/HbAJ0xKogXB7AEke/Ix
	zRx8SELMJ6qcrRcY1LN+X+1M+2y8rDzI2L+b6tPsgWkBBzTUBCYlX0XWCD8ei+5u
	L9LXT7JBouy4Q1/EHsRQ746CibSQukwntjhyclFatVh54ME/O8F/pA89JQ4KPnGI
	tTeJXo5ec/9GlaDJ+P4pskZYc3+XdGu976ztvrGPjMVYc4CTJnFMcSVhIekIHd3e
	O/uZMb2bB4pwtHSeAGpuerDo3wEWMOKLKXgw22pOWF6MQdowCTl1EkOMGMHE3SN0
	FEbujfmW1YpGQDoq8KcvcwRNrtvkq/AyjeQ==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g1h1ut0a2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Aug 2026 00:47:31 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 67E0lSES029319;
	Fri, 14 Aug 2026 00:47:28 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 4g0bs0pj7m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Aug 2026 00:47:28 +0000 (GMT)
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 67E0lSWL029314;
	Fri, 14 Aug 2026 00:47:28 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com ([10.213.101.157])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 67E0lRRo029313
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Aug 2026 00:47:28 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 2342877)
	id 0DE4860C; Fri, 14 Aug 2026 06:17:27 +0530 (+0530)
From: Nitin Rawat <nitin.rawat@oss.qualcomm.com>
To: vkoul@kernel.org, krzk+dt@kernel.org, robh@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-phy@lists.infradead.org,
        Nitin Rawat <nitin.rawat@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Subject: [PATCH V1] dt-bindings: phy: qcom,sc8280xp-qmp-ufs-phy: Add QMP UFS PHY compatible for Maili
Date: Fri, 14 Aug 2026 06:17:25 +0530
Message-Id: <20260814004725.1368027-1-nitin.rawat@oss.qualcomm.com>
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
X-Proofpoint-GUID: oIHaxPWeYMZFgmYSike5RM7xZT5sEMUm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE0MDAwNCBTYWx0ZWRfX1sk3UyViYIrD
 QJ0boUA9HmtQaBxQj8ktDUWAw8b3zmf3oakplaybEmaHUeDCWns4Bq19UJZU8ltYap1Gk+0dPFe
 QN4ZN4yyFgHKndz20DBjndk9unmWmEIp+T+yBverKXT6x6vx1RNSQgECsLrHa/RZ2EAKySnPKxa
 Wcou1o89zf15WfZh+0MQXWYU1t6qtPaM8w7DSbkggX5Arx48aVVWjwKgr8MTC0xu7C0J0XOOSzH
 nVy/9lWHsm/0OcF94ghRO/8hL2JwG6UQRMIdqKTpyHIklOfFv3LyndFnvilAp8OJ5s5DUYZuPA+
 Ot9UlsDGJEpckBvbrXKhqfNJrGtEwgxeTUOmWbDvOac0fTlC93r3mfVX5JabzLYHOHfgc6tCBw4
 Zlsf22ZdCFC7/x6V8T882Utr3TYlXKnWWgkKXJFpByEetuuj05KKFQtvmHJcMRR4oCMoGccEglK
 R6gwfOyBOzbdUGoyVdQ==
X-Proofpoint-ORIG-GUID: oIHaxPWeYMZFgmYSike5RM7xZT5sEMUm
X-Authority-Analysis: v=2.4 cv=HMjz0Itv c=1 sm=1 tr=0 ts=6a7e65a3 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8 a=UH2bE8EBJgXlDjawRugA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE0MDAwNCBTYWx0ZWRfXxVIywajZU7Ft
 EmUN+oHFwDX6hH3zKO54eSZxI3/+fX5UPXpyRq9yxZ+5cOhlYSSYZkBrsTYjzgouLblZa2qSN55
 BrP10TPlPIP/66BqVpGW1RlTcFlHn7Q=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-13_07,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 spamscore=0 phishscore=0 priorityscore=1501
 suspectscore=0 clxscore=1011 impostorscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608140004

Document the QMP UFS PHY compatible for Qualcomm Maili to support
physical layer functionality for UFS found on the SoC. Use fallback to
indicate the compatibility of the QMP UFS PHY on the Maili with that on
the Hawi.

Signed-off-by: Nitin Rawat <nitin.rawat@oss.qualcomm.com>
Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 .../devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml    | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
index 7e83cb3238ec..d94503fc26e7 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
@@ -16,6 +16,10 @@ description:
 properties:
   compatible:
     oneOf:
+      - items:
+          - enum:
+              - qcom,maili-qmp-ufs-phy
+          - const: qcom,hawi-qmp-ufs-phy
       - items:
           - enum:
               - qcom,qcs8300-qmp-ufs-phy
--
2.34.1

