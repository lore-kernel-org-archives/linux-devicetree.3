Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795430738;
	b=yGe+xIvdunVLTMiWVbsV+l4f42kIzQU+/1jQME6jQ1ZWBxDnBMt0Xvb3rFRjhKaNIVgS
	 0J+iHW/iefZPt2mKlrqLQEmqlpbtgk7asVOOW1FfLvARByD4vXRqIl+bQs6Faunu7mHSo
	 9La9PJEFzIttQ4Af5kNNGDWnm549RaIQ5mzosCTQPDMGwQtMVJPzQW7UyAcfRU9zmRB1D
	 xPRUTS6BsylUUrVaGZ58nbSTt69rxyabGBqJ3Yzt85v+o4xnt8LV/P3RdW45O+qWUBwzA
	 qwDF1HV6bPdNBP/gAMOc5Utgq//Fp5AMx2cflCWRNFpY0GK6thoU1oAESDxruOcS+ug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795430738;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:From:
	 Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Reinject:X-QCInternal:X-QCInternal:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=7TMnlek1dv+xjOVL40CpOP+/J/naLf/Y4FKMINBX3Jk=;
	b=BU89HXytvABwvotcohxTIm4VE0VNKpVpYHqFutR9vh/qsHUtFoaqV9jhVV5QVqOzCugi
	 zE7kNnA+PdjGEWuCezV6VfITS0YZ1AaCLJo1JBG1wS7CPg9zaHrq9MLTQLoHeycP7a6TU
	 EJLjhPMZX02+ofx3Z3kPPZC3/dk/62ogM0Weusj0ju29x9l13j6ce3b2HzfqZKtUFTr1C
	 qxzIDeIBIxE1ddQypW+CCUX+YKznQUXwAuIJAcMHEugVeQwSN2C70AiK/TX3yQW1X1wRH
	 SXyUhX+30pp+43ilZLEgpsPfto8E8H0FoHAWzJymITQe9SMyO4RtVGkxRf4BDAQpa4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YP3zPbbU;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3A33606A31A;
	Mon, 23 Nov 2026 10:45:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3A33606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YP3zPbbU
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN9FoSo2072126;
	Mon, 23 Nov 2026 10:45:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7TMnlek1dv+xjOVL40CpOP+/J/naLf/Y4FKMINBX3Jk=; b=YP3zPbbUQ7B1VHmE
	gEPWgyJiJ7EK0rSX657t7TXuYaPDDMdY5NQb9Yzp2VF2RqpRRC1duuMT6m0ZwaAe
	sWlu93rFfgICK3JobCy9F6ckXxbHX6iwFCUqZqdI3W/2JDbKTCrZnlsuWTNoK9YN
	Nm+7Fu6RWFh/1Ubbyuw4NKXa7n0+zNY+1vF/+02gvc+gkv+05QAhVOYy1eN7QSBX
	iEhsArCzyEkqjRlTS9r9mK1/9oFyig6ygudv1+YBp7V7tmrDW9eyGYd5v/Dr4K/x
	GwzUMQwW5uIQhG1PVjSaEki4+BwfgtXRVgns3NrCNrTP/HQQpc66QIMsHhAdQ0mq
	oyXU3A==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g1p903n-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 23 Nov 2026 10:45:25 +0000 (GMT)
Received: from pps.filterd (apblrppmta01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANAjMvu321139;
	Mon, 23 Nov 2026 10:45:22 GMT
Received: from hu-ffaruque-hyd.qualcomm.com (hu-ffaruque-hyd.qualcomm.com [10.147.245.31])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 6ANAjLpR321114;
	Mon, 23 Nov 2026 10:45:22 +0000 (GMT)
From: Faruque Ansari <faruque.ansari@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 16:15:12 +0530
Subject: [PATCH v2 1/3] dt-bindings: arm: qcom: add Monaco Draco EVK board
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
Message-Id: <20261123-monaco-draco-v2-1-3ee3b2375f16@oss.qualcomm.com>
References: <20261123-monaco-draco-v2-0-3ee3b2375f16@oss.qualcomm.com>
In-Reply-To: <20261123-monaco-draco-v2-0-3ee3b2375f16@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        Vishnu Saini <vishnu.saini@oss.qualcomm.com>,
        Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>,
        Dipa Mantre <dipa.mantre@oss.qualcomm.com>,
        Sravani Tella <tella@hu-tella-hyd.qualcomm.com>,
        Monish Chunara <monish.chunara@oss.qualcomm.com>,
        Ajinkya Inchure <ainchure@qti.qualcomm.com>,
        Faruque Ansari <faruque.ansari@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-GUID: gDYW-JDllKrxpAuSi5vvbzXBcKUKOXfo
X-Authority-Analysis: v=2.4 cv=K+O3jCWI c=1 sm=1 tr=0 ts=6b041945 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=468qcLa_HG7mkFRz8scA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA0MiBTYWx0ZWRfX1YRPdr6XSDOA
 u2a6f/PUKF8USm/BvLrDQQUzG2EJVcvz0a93t10MYa6as6iJf5DTBwMp/euqd3tqP79pvhrwB9v
 HQ+iCxy15T43dBjYgrCUTrhX8mV0lkk=
X-Proofpoint-ORIG-GUID: gDYW-JDllKrxpAuSi5vvbzXBcKUKOXfo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA0MiBTYWx0ZWRfX6wl26GG4muOT
 uVZHGrZUvIKnJm06AykYN2WhR3e9Luz5i+WvS9iqhFEwyhvN2tGnUhHw/gALTTHLqqQknJuRA2x
 75DOrF51IPdUIv0J4wpNiCTSlQ3abImuQL1ZcY7hi543kLaZm6bPkWFPWYwhnZCeRAA0NlQDMEl
 ZpjoPVF6svDMjIebncqw8mmptjBRK1CVUYyZXgPVIkPhJkA3SNZbe29TMJ3cSSYR1PpFW6hg99C
 gqP3FuYYIWr+yNi4q/f+jSjHEk0joOba8p5wYQ+N77wZtgCBvmYkDT6S9lBDTC937sooUlcSbCz
 nDzI52JiFe6CxWLQKccjF0VTrBR5f9JKR7UfVe+SW/G21Tz5lDrWpJZhYk1Mh50EkvD3cvO/+aH
 3Hhjrr1QwU09Jm+Npx9jvCUoB9rkCoGFRXAjeO62NfbRgEAtJoyPxZOuBMILGGM/08h9ixZhchH
 +8Uv9Ya3cyXmwVYM1Ag==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_02,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 spamscore=0 adultscore=0 clxscore=1015
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230042

Document the compatible strings for the Qualcomm Monaco Draco AC
System-on-Module (SoM) and its Monaco Draco EVK board.

The SoM is populated with a QCS8300 SoC, two PMM8654AU PMICs, eMMC and
UFS storage. The SoM is then connected to the EVK carrier board, which
provides a multitude of connectors for peripherals.

Signed-off-by: Faruque Ansari <faruque.ansari@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 121ca557ce1e..d78bd8a9e373 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -472,6 +472,11 @@ properties:
               - qcom,qcs8300-ride
           - const: qcom,qcs8300
 
+      - items:
+          - const: qcom,monaco-draco-evk
+          - const: qcom,monaco-draco-ac-som
+          - const: qcom,qcs8300
+
       - description: Qualcomm Technologies, Inc. Distributed Unit 1000 platform
         items:
           - enum:

-- 
2.34.1

