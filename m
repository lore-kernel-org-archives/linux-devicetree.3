Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 569113CAE95;
	Wed, 19 Aug 2026 05:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787118144; cv=none; b=KTXh415peaheaBTCOTEcZ3qp8Bz4Qhlu42nFD/GVgx6UyMk7B2XjOr9UqQ0cbyKEDvk0ydci3MMPQ1zqtcL8dh4HwuIv/SzHXF1UqzhGZrQR8Xq5HDxcraKMnNe4TPI8sbZrhtHAHUGmxaT7fv0dye4uXkDVwz+Z/OQnn1vknv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787118144; c=relaxed/simple;
	bh=YODu2cJhI/aYP6zE1oeW7HV3AmOAp6Lo1NBfy/dolRc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=udLjU5rOhGnQGEfUtpUgnnOCrQIChGXxEbslKFxB4MGCjt1wPyoV58hAusNRsyJqSwk/ESQnd2XqRJSzW8IlmAHND7mDHJpsOwq7OfFrDOC0DH6zOWwYGZ3W3190ziwFqQVgCHqI4/uAwu1HKsRHfQMHiVOA2Sq83BYu3jK+Sm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lWqLUPuk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lWqLUPuk"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67J5IOYg3096301;
	Wed, 19 Aug 2026 05:42:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=1vopBimEzpT
	lgkybO0/1d/5Rzr3RN9IzYyofJnAY27A=; b=lWqLUPukpVQnikv+hWyHXasRIdv
	SuIhWeVPfbaqV3b9MRA6wRQO860VvE7Uyqzaknxou+kydKPNI1GIiFMRcmH6s9lI
	lu8kAhn3BFlF/QP1IbG9jHKLY4/QM2bKxuMQIR1awO32QO5vmx74qhFiIA6r0bzK
	w/PixtAbWA7bRo/JO4/SpcgnfLS3HGU5tH0842fCAl9feSMz2sZW8fExxbSWCpok
	erMPFm9tcx0JvTsYrf/CBnuu9CmBeWO71Nmv1+KaTJ3wnoyzDYZJGNJOtMm1XzH/
	upEFPofU+N+D2k+otYXdcBN+0FxbDGgHAlrrPxsl/2UKrYlX+br8T7Q8aiA==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4yffhfk8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Aug 2026 05:42:20 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 67J5gHoW016094;
	Wed, 19 Aug 2026 05:42:17 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 4g2h6k4vws-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Aug 2026 05:42:17 +0000 (GMT)
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 67J5gG9E016066;
	Wed, 19 Aug 2026 05:42:16 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-pkumpatl-hyd.qualcomm.com [10.147.245.204])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 67J5gGwl016049
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Aug 2026 05:42:16 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3914174)
	id E528F56A; Wed, 19 Aug 2026 11:12:15 +0530 (+0530)
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Yijie Yang <yijie.yang@oss.qualcomm.com>
Subject: [PATCH v1 1/2] dt-bindings: arm: qcom: Add Maili SoC compatible
Date: Wed, 19 Aug 2026 11:12:02 +0530
Message-Id: <20260819054203.61385-2-prasad.kumpatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260819054203.61385-1-prasad.kumpatla@oss.qualcomm.com>
References: <20260819054203.61385-1-prasad.kumpatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDA0MSBTYWx0ZWRfX6xhqyRnjOtxA
 3Zqesz+eOm8RgF9Ug9I83wdCBrlVVwahIbYLfQVWXrLQHu/+nHlLpkj6RHyD+Jn7NWApABMKUJi
 ndjFhQ/Jih0oK8l5kBeByODy8EBatuc=
X-Authority-Analysis: v=2.4 cv=H5PrBeYi c=1 sm=1 tr=0 ts=6a85423c cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8 a=k_4TUXhslClqQXneaHQA:9
X-Proofpoint-ORIG-GUID: n1G2BGkWFvIeyNOENsLY9FCW4wMlc8ry
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDA0MSBTYWx0ZWRfX8g4aiCIS/ozH
 0rq2ElUy0QZeK3vkMqOsnLof5uca0D2HiS2nRQxjNmut2VJU9QuhQHzmLcfF5SidKKVH3UpNyPR
 KGht/YrPkBw5S4gD0N2aU5oYUWxkSsbVB2OEJCBLpoKZBA5wFlw4iKWBxlOGMoR09m35jswXWbr
 LQMfimPEcqAMb4+zV7Zsz72ZW7fwLnaJG2xKJ9qOD3GLXqsC/VlnGHCYck9Q9swn36RfATBKDH7
 d6FaHrayzdLDr/+ezrfiEPhazDN1iQwMdKvb5+Jfuk5eatE4aCg2A2nQdThEkfGWxeGrX8V9TH2
 MsrufMj7i1M0P28w9Ost7sMFb4uSkG/jtu59svjxOghp7JJ83EWLNLDqC+K9kKn3oFvl7cWgbxt
 ad0pOXd0sp4pk8+HX6tMgzmyPpJPhdu5Q7wN3+5ksWZ7IEIx+1xq94q+1fIgjxa2/Unbl85biFs
 BXAmRUKnpC7OhpQxJtA==
X-Proofpoint-GUID: n1G2BGkWFvIeyNOENsLY9FCW4wMlc8ry
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_01,2026-08-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 priorityscore=1501 bulkscore=0 impostorscore=0 adultscore=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608190041

From: Yijie Yang <yijie.yang@oss.qualcomm.com>

Add the qcom,maili SoC compatible string to the QCOM SoC bindings.

Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index ff8a35df7862..00d9a493fe76 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -175,6 +175,9 @@ properties:
               - qcom,kaanapali-qrd
           - const: qcom,kaanapali
 
+      - items:
+          - const: qcom,maili
+
       - items:
           - enum:
               - qcom,mahua-crd
-- 
2.34.1

