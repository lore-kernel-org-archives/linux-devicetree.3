Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C70C3E49E1;
	Fri, 14 Aug 2026 07:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786690897; cv=none; b=Etl9nnerDrXKm3nCbsfM/GlPV4/Ri6vEZr9xlHv6kjDWdq+hNDzPjVHs8MqtaqT+Kk7Oi8PlIFL8NFEyqU7ZpzR1EvPIX/be5UZIbFCr+gizwbxjutuFsIiDmhdGrEw2CnwZFhyAchpyTmArKZ3PC1yvXwO5KLWGhCiP+bMx13I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786690897; c=relaxed/simple;
	bh=4/77o17dWSycbSHa3WGSDrQi34eIea2ICuDegwszIt8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=UC3xH9RfyVshH7Gfk3KO50/B02iRfMjzAVBsH6thlCTEZfivI/ifAYspK+jcxuiA72FiKYeePdk6o5hMRwTxbRS8RUNcrRvWsEot095ImGGcitW9ePNpORTFPBYGPLu/zqkmQm0TeKw7KopyZQqUTOkf4fEnNunBkamzhG04QyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OmiWt4Sh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OmiWt4Sh"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67E4QkFW4043727;
	Fri, 14 Aug 2026 07:01:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=EgKURofPfiX1dMI/4USI61zdD/x/DuDV4Za
	t+3rGqOs=; b=OmiWt4ShsNFIIe12Y3l0hV+8mc/P25f179WyWS3dQgHtH/iyN5A
	mpnVjzrYEWSJqw93oH2oxNQ8nAay1K6kMpzLI4xi60CbmpnV5AFTef3x/5vYV2zE
	ZcFXrKltZz62KyUN+yGG2gmkiHGEDkFUhxNXPVwop/FRqGiKHbR4j6qFetUaX0u+
	H3IDfNutjll2KXmBTQMnghppL1TmSfSRHn+gTVwe/JY6ivhkIKyxF5NziXnGJnfl
	KHgRrR5b1aIWySm/YzIyCIof8S8f5/gn2/FGjgS0I0gd/rYzPhdBWm99UcwoJY/t
	NRjGwfseUm5dee5nk1O6JMZpqC+SffxVGBw==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g1m42j4hq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Aug 2026 07:01:32 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 67E71Swo010952;
	Fri, 14 Aug 2026 07:01:28 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4g0bs3g1ht-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Aug 2026 07:01:28 +0000 (GMT)
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 67E71SOk010945;
	Fri, 14 Aug 2026 07:01:28 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com ([10.213.101.157])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 67E71RvS010942
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Aug 2026 07:01:28 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 2342877)
	id 1F8A363E; Fri, 14 Aug 2026 12:31:27 +0530 (+0530)
From: Nitin Rawat <nitin.rawat@oss.qualcomm.com>
To: vkoul@kernel.org, krzk+dt@kernel.org, robh@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-phy@lists.infradead.org,
        Nitin Rawat <nitin.rawat@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Subject: [PATCH V2] dt-bindings: phy: qcom,sc8280xp-qmp-ufs-phy: Add QMP UFS PHY compatible for Maili
Date: Fri, 14 Aug 2026 12:31:12 +0530
Message-Id: <20260814070112.1676300-1-nitin.rawat@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=I+dVgtgg c=1 sm=1 tr=0 ts=6a7ebd4c cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8 a=UH2bE8EBJgXlDjawRugA:9
X-Proofpoint-ORIG-GUID: PpttNO0RUjEEKW2UoDMrpaMGbg8IzoQe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE0MDA1NCBTYWx0ZWRfX6B1AaCZldAEM
 aX6oB6Sd5DYcjyKyEDDr/u3rRGS7nnTSnJIPdl3AESjNJg1Fbvcb/cCYvXeTyXv47RtkckhADG1
 SoewXWt/m/p6TcVO6xiDG7DnEb4t4/0K9Kh5+gayv/ZLlKZLzXcdT+FkBKBWW2NZ4c1L/NFbV2K
 0MS9ZWtJPzKANoS2jMVFmE2IH4NuKVWZ47znG4g0YPEoKwVRAH4o8Psdfuq2nl4q7sK45Qf3sJm
 t1SzgxxUiduykOBatgTc44xkSyWeAGsnuNIq7cLThds733ebUcbruoU8XKMCaNCRCxxC0e8Ty+y
 FCzvhrFaNHztJitdY8LzwR0liBbO3oVahSIElJ1EuBtGkhb/ApnU8uCDPV99b+xnKh8iA2cC5v/
 +OGLrVi6kZsyCnh4xhXacmPUpmVaeLsUluWvo4/SF92Mc/ES0QeUxYBBEY3YKyy2TokeJqeX8kg
 y9zMWVrlldLf6Tv07Dg==
X-Proofpoint-GUID: PpttNO0RUjEEKW2UoDMrpaMGbg8IzoQe
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE0MDA1NCBTYWx0ZWRfX4yv0Z6dJHyBV
 Bs66Y+GXm+gI74yNkk2JE/33wZYeHJkrv6ns+hUd1k41CK30KrwSgAj5BORS2gfBmnvAfUm1PzL
 9zWwepBTGrp5Qv/QzbMlzP/9a8MlImY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-14_02,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 suspectscore=0 bulkscore=0 adultscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608140054

Document the QMP UFS PHY compatible for Qualcomm Maili to support
physical layer functionality for UFS found on the SoC. Use fallback to
indicate the compatibility of the QMP UFS PHY on the Maili with that on
the Hawi.

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Signed-off-by: Nitin Rawat <nitin.rawat@oss.qualcomm.com>
---
Change from V1:
1. Fixed Signed-off-by chain order.
---
 .../devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml    | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
index 4efe40c0dc97..eb289c09906a 100644
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

