Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9311B33EB13
	for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 11:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776080917; cv=none; b=TzWfcz9b/iaFjni6dYLvqawWzc0dpDm7zaCAxbwXHFS47Ld6dyu/LesF9FIeB5Hu3GoCeEKBVxROnj8sIy816aOnAn6h0gLNv66kco53a7uhJC1egmqC3gKpRiIzoJg+yCQcReg9JDhch1Lub8AAfJ1by3QPcQmVW++t6RTROvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776080917; c=relaxed/simple;
	bh=3Xxy3phe35nld0d+I8ihN3Dz4LJeVPMdaQsjUmjwBFM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ZH2q0APF7ZJtrZcyy/k0/gmbocuMvs7+DvW+AeYeQXCe/K2cvGg4kEIRd5+gnI1ItBIw5KVe9OGN9bYtiyGhZiFY6DKLZmBeQIgz/oJoVM+37MXa4+0B6HAd67f4IEAyoFTTSNig05NGkeVIE59OcnnrWIonTOCzRPbEiyH+DaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e+6qnwHh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NWdLdtPV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e+6qnwHh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NWdLdtPV"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63D7QGIR3709159
	for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 11:48:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=mbUyzb2hgUR
	R49pOk/6k47H04jOC2pBiHnt3w2EMRMM=; b=e+6qnwHhHHk8iZbg6lY4iyrlhj6
	G2TkpMf35C1EutOoZJ+vLKBb3WBK/iqleaho3vhpfZYWDxzLWtbgsom+NhrI9I6M
	iSBzaJpY2QBbkON+KGPlK2ZymP0RPeQ9YmML9hdGMvWp1zbCTEEdZPdOtysldUzm
	RHSt8lI/74tPC5iS4Cwuduns5CJtMTYHHrsWXvu28gQmpK/6ODnMQkW0p0nmkzgg
	jtk0hFMyrQs37P2wiMSJ7/P1tD2cjl4i8RcILDtU62uwx7+LmiU6sqLEvnv1Za9Q
	bHsflbLexgiocECl8EdEc119+W1l+Yh2gk8PITa83xiii4V2Gjxy0f3biVg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dfjbpcta4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 11:48:35 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c6ea0e59784so181405a12.1
        for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 04:48:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776080914; x=1776685714; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mbUyzb2hgURR49pOk/6k47H04jOC2pBiHnt3w2EMRMM=;
        b=NWdLdtPVxGwgy29eDeIRvTTlopXvt/RJ/9Yk4Sk1W1XRjA/PMwNhQoAxXe70CWQ95G
         gVGWgprem55Zn+H2T1c4M2a/S7YyTzxZmT6ZkliFU+XswvZKDPxy6f7G1JYiFMhhk6/P
         x80O/iklGli87N4rHOvnA2U9pJUxr7c2Ka2m2VWp3b+J9040t3hX9nEsVDRLYtRaDTxi
         h6CGPHadQK5u6lXVE5SC9rdMU36cfeMTITq0+lz1/onSlxe8005TYSasyu21bxWw/0HG
         MnP/gnewBtiE6e2oTqsbXrCnDvS5DB/TTEke1yXNwYRAND897G0XEpkcRj9IyfzX/+ZN
         zhRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776080914; x=1776685714;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mbUyzb2hgURR49pOk/6k47H04jOC2pBiHnt3w2EMRMM=;
        b=Jluq2cnbCHlD+i8v5IJ0AYpUWQ1dwiaVwytkaMNRFopZZCzyZmn+/cuR/wJO0oUx2S
         XKJNCbZbxwP4thhHeNVMnx30p49fVCMWE8o6LhNi14lMFWRwQXBtUNZwK1W44h6d3o4O
         5X7aItEqni5LGFWRE0GQYYrjwtgGJSjtcJl3obIzvBmMnRn/x1TXgwAJJ9VW5AWTr5w7
         fxQj6SEsy2NOaEzQQxhOJuq8hT0XbUeRsupdhp6nq5R6rrcTmfYCNPXYG/e5R+1Od45m
         5IT7tFtPhm6UYVFv+qVo3Gqvn0Na+ydNvKfPDqGaIaetk6W+VAovzOwCdkPsTn32bS84
         FMyg==
X-Forwarded-Encrypted: i=1; AFNElJ+Mc8AzYu7t09e7sG+7cZ1zEROgvffkmM9ENt9fBoqYgG68Oak1Q4tuPELgwGJ8R4p/yUDUealh+xEz@vger.kernel.org
X-Gm-Message-State: AOJu0YwAtM9rius6Hb0Vu8yh4iL3JqBSR6IdIKAvsDvco/yPSXltpWkL
	T5jSXib9/UM5y0wfLJK6/0nrYQWpo3enGoEkAHafE5vLB21sPEBlZutgoP1qVrGgz9UqC8XJ/0F
	ZCoWJdVZbzeO86vnRaCU4tiUdzkPnfidPRNGsScS8gbFpFNSYH65v2/H213QevyB4PVDXDUgv
X-Gm-Gg: AeBDietm2i6BDjkoZ115odkxxTPsPMeowDRxMew4x7LJ+QEVbvliJyYlXYKYwKd37Gm
	JzQJqLrvPBVbQHffUOjCpfq5z+DCUjJZ3+jn4gg7MW4vPp0fYUYktDlP26LnX9TcULQfKnt6bGo
	dHxrriw5TaiOoL447Au6Ddd8aLEPNOYx74dOlIzdmaQ3rks6tkfwISTj38unjI4h2U+Fz4SOhCR
	bdruPossqhTYSM7EbszisblFriX1bUFZ+eKBTkBgC7KFwz1Lj0Lts8QHawRiQ+gyxLlTEHG+kkV
	YDBHSG+WBoOebJrBLjEOKJ8dzcfJw4JkLDmJur0iAIxuzoNHb/QfP5WkHvGSCks9UKKYGwfI7An
	/weTd2dc7Rj/ptpwy4jkLidjeRC9pQtyFeuPGJQpHJ+USi3kHVn4X
X-Received: by 2002:a05:6a20:549f:b0:398:86a3:8806 with SMTP id adf61e73a8af0-39fe3faeaf6mr8210939637.5.1776080914520;
        Mon, 13 Apr 2026 04:48:34 -0700 (PDT)
X-Received: by 2002:a05:6a20:549f:b0:398:86a3:8806 with SMTP id adf61e73a8af0-39fe3faeaf6mr8210909637.5.1776080914007;
        Mon, 13 Apr 2026 04:48:34 -0700 (PDT)
Received: from hu-uchheda-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7921a12adasm9822453a12.26.2026.04.13.04.48.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 04:48:33 -0700 (PDT)
From: Umang Chheda <umang.chheda@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, richardcochran@gmail.com
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, umang.chheda@oss.qualcomm.com,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v3 2/3] dt-bindings: arm: qcom: Add monaco-ac-evk support
Date: Mon, 13 Apr 2026 17:18:18 +0530
Message-Id: <20260413114819.3894307-3-umang.chheda@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260413114819.3894307-1-umang.chheda@oss.qualcomm.com>
References: <20260413114819.3894307-1-umang.chheda@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=PuijqQM3 c=1 sm=1 tr=0 ts=69dcd813 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=7Czdxb_1pZKpEXywf30A:9 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: uVuv2L6vp41D0c4OxiA6Vo8IeUqBcuVN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDExNiBTYWx0ZWRfXwwFv4OKRLqKu
 ZU0GJdduyOpgmQMLaD3rd45hSTEE1LKzPQCbNA0HFR98qPd+06JAJ5Kjlq9+Hrc4TTW5srRCU0e
 BRDJ4XVqv4A+IJ/chMvY/uHedoAaK1U4T8/tt/rLfnxKeaKQ8LY25LbJq2fRNZlBzyQKjXxuq8Z
 c5uC6EWA5tcnLzrZeappqmCbT1IDL5kfDLeNcIeRQ80wHfC89LG7H5FcW6UxTwHiSvWAbJq+aqZ
 Te+uTbSxrhKNt3OutukNfvpUlqNGTxu4Ra5eyDfvJP9iaQMmHPrhMAoVwqOehUU3eU1AowX7aiK
 Nf8DSDNndcQGMaZNOg1Dru3VHS9wq+fBNnmckyuqVX7cyzGYemLL3Ns8ZHpiyVls5voDGvdWNBH
 KDm+e4ASfvwUx8kujEo5IHEJBS/7Y9QptHP0BSn8HeOGx181aot+tBV5gYLzBRj2lGJZevCFJfO
 mVn8U82gkXIrl12QHyg==
X-Proofpoint-GUID: uVuv2L6vp41D0c4OxiA6Vo8IeUqBcuVN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_03,2026-04-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 spamscore=0 phishscore=0
 malwarescore=0 clxscore=1015 impostorscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604130116

Introduce bindings for the monaco-ac-evk IoT board, which is
based on the monaco-ac (QCS8300-AC) SoC variant.

Signed-off-by: Umang Chheda <umang.chheda@oss.qualcomm.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index b4943123d2e4..7531ab3143a6 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -918,6 +918,7 @@ properties:
       - items:
           - enum:
               - arduino,monza
+              - qcom,monaco-ac-evk
               - qcom,monaco-evk
               - qcom,qcs8300-ride
           - const: qcom,qcs8300
--
2.34.1

