Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795689284;
	b=wg6SxRa9zZSvCG1Ot70++3BUt88dSHvoc5K0EsEKKjtV88ZhaYc0zVSNNhJl3uOuWO2l
	 9ruq1U1OmRiiKjJoOOWvleBkp4TsBdsfUqo44ZroMEAr9Ub2xIPPsPt6CJw4j69CMbx8d
	 Bd3QcAdRekMDnRytd42T794nT4KK8GBz9HIg8ed3FWz3mFoin85YI4IeZxSeM4sbaV2Wd
	 abVaB6ACsFob14LO+yDpcHdu7UrbZ1KcYfCp1yHUu2n2uRHdMvu3S9CeuvmsTxqT/n1Mt
	 C1JInhuqgS5PdDiDbr5iNPtVOb8ShsrxTvLleFY0oisw1OaMikZS0lKw1zQ2UQwwwDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795689284;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:From:
	 Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Reinject:X-QCInternal:X-QCInternal:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=7TMnlek1dv+xjOVL40CpOP+/J/naLf/Y4FKMINBX3Jk=;
	b=B0OyCt/xjKMv/6yiC+b6JC1OAoacj3DrAD+lisnL7WA7ANJWAuP4TSVFwxbfF4qOe6Zx
	 1x1kDfYlAOSgtZ0LKOLJ5R7KXl0E4OVtlRz0jS8dwz/9Ezb7AHixoDgTR+7Ehjc0hAKe9
	 jUIJ/+VUzNQe8ZNQ8hGh8yndCxQ4yRo5t9AqqIyuobc7BRZmYhEoFSpMECkbcu5WNAICn
	 GIxrvQrEeqSp47o7agA3ITjUGEaNVnubdaVCn1LzDqXUPeMmjkUvUcJu/AerKXwvhsp4j
	 rbFmYq8WVmNYTOxd/g4vguCzaliSwJYP6ZVXq1cJSbydtmnA0EDrn7menOVa2eVxvnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fuqry9Y2;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B40A0606A332;
	Thu, 26 Nov 2026 10:34:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B40A0606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fuqry9Y2
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQAXVGr4001756;
	Thu, 26 Nov 2026 10:34:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7TMnlek1dv+xjOVL40CpOP+/J/naLf/Y4FKMINBX3Jk=; b=fuqry9Y2RSIWju66
	GjTky8v87UUUsBtuAJCssjgye35WVnsIjs5IDPjlZ72kqKnxcnfvjG7MfLbIrUiF
	+NjRELx3LhEDDC//JLhpWMNpnA9NvZsZ9cMOhL5fPG7qsX0RjGqvnRuBHULPLku2
	CMbgRbTPWuZFDd/Sxs1RlvYJdTvOxA106iiTXAHYKyw4ACZt7GZPJrqBwz6KpaJG
	vwytpWouHzCgsuGAjWQ+qdI4/0Sz5aASJ4rhNydqzmx/A/w1jJvxIok4m31Xgyqu
	ZrRHzVcyT0f1BCvT721vvwW2RDweqi+ydReTjPm2wneaIqzEWY2rIr0JxbGhpEnT
	JAJxNg==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j62vauhp1-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 26 Nov 2026 10:34:34 +0000 (GMT)
Received: from pps.filterd (apblrppmta02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQAYV5H4021445;
	Thu, 26 Nov 2026 10:34:31 GMT
Received: from hu-ffaruque-hyd.qualcomm.com (hu-ffaruque-hyd.qualcomm.com [10.147.245.31])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 6AQAYUSB4021426;
	Thu, 26 Nov 2026 10:34:31 +0000 (GMT)
From: Faruque Ansari <faruque.ansari@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 16:04:20 +0530
Subject: [PATCH v3 1/3] dt-bindings: arm: qcom: add Monaco Draco EVK board
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
Message-Id: <20261126-monaco-draco-v3-1-0b603afa1328@oss.qualcomm.com>
References: <20261126-monaco-draco-v3-0-0b603afa1328@oss.qualcomm.com>
In-Reply-To: <20261126-monaco-draco-v3-0-0b603afa1328@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA0MCBTYWx0ZWRfX95HnHpH5LPGX
 t6UxkiXLBR/D8MU/sQRc94xUle11G6orv+o/eHD27W/rI8d7U3/9ILUHlt2e9O0m///o9zMu/JO
 mw7XbSN1SMBgwEPeiCH2Bk56d8IUH/k=
X-Proofpoint-ORIG-GUID: 6s3CMs5eduTbWF47rsJ2iM3sPjBru8CJ
X-Proofpoint-GUID: 6s3CMs5eduTbWF47rsJ2iM3sPjBru8CJ
X-Authority-Analysis: v=2.4 cv=QZPzLcbv c=1 sm=1 tr=0 ts=6b080b3a cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=468qcLa_HG7mkFRz8scA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA0MCBTYWx0ZWRfX0H2YUH2RWWR5
 K931W+rA5qfbHxwuwkj0Q6TNCyMy7Gj3nw7kZp7jSz+e2wQq4PHLokoL6MqKIA74XLZNqDka1qn
 K+RZ2SKNxnThikjpCok/sJILVNyaGSJ6GKz+HIoNo6c5ANb4znmXP5lRQk3lrMv2NDFdU8AFZWF
 xrKQoteJkyN/bA569z2Gsd4Ypb27VQczoNSB3SzUwq22p0OmVlr3UutS9CPemRSZvo3VaPpkpjM
 pBOHzqeRxPK6C086Wkdr2fgS5zgJA68xPMO/D0Q+nuzGtN6mmWdc79eGTfhi3lUgKlN+g5oljIJ
 fv2Y1Aw5ofqZG4zoCMKLAHovEEZ9RwwOPZQKwCU447yVO8Lma3Wb9dgcZpRkJeXCOFk7on3N+93
 IW9d7W91kw5uMMmOh2BWUkMS32uEy3fCkdORc16g6UPSwHNC1Iv6V46A55G0h2XlCzwBu0fqSxS
 h/uyrSEWNFfqM9chqsA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0 phishscore=0
 adultscore=0 malwarescore=0 impostorscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260040

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

