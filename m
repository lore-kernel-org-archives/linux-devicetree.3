Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C565F3FE36D
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 11:16:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781090201; cv=none; b=QkPn79WZfGMYHsUwn7SJkLEmYaOqDW4yZHHGHwmgwf8sZg5pSn/jL/Ge75tOQ/wdk/4Zz99G7Ruayj9lXcCMOGJPcdv4giFUaEpUDJAS5gQ9tlOuv0lQiWqHEiK8sE8tFP0a5mpwRjYP7d6No3o+Jbe7xDwrSWbRLgROUu9Hkwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781090201; c=relaxed/simple;
	bh=WfvqcHxEIKd+2/Fy6r0OKfxrNsPOIVjM3gS59zdojfE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TTfb5eXeOk1u6nIraljRYoh0Tdpv/MsG0a8YGDfShyMh/MEOwiQa14eI/BoSeLVNqGFkmjt5lsebNvt0IYc+0AZ7CNf986hW3abjgHilOJV+OqW2a9kQRXhJd1Bmj5u559DybRaNN1FYWrDxDAEgFun5NTUAPd+CannnwUMSRZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EPVMcEjc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J/4HAZjH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EPVMcEjc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J/4HAZjH"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65A7in6H997538
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 11:16:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	O9QM0vnhY8+WfpiXtoZ6RW1A9C9R+5BvzpcQBGpBa80=; b=EPVMcEjc2dqGBfgT
	8u0LWDRnnkrkrwPcj5EqHu8EgDLXzW/y8kMuTXjw5ux1X6zyO2M//mW6IOiUdgEQ
	QhGegDi3pNgfEBL6sZEXiWaudwat22htMWeCMZlsJ/OwGNIsV5ZV7frfLiFSB8tv
	OnhKJLc6EWMSTi+T9GHcs/No88rousghQmQeEScTuC6ovY45P6y5tn1jYqR4DvCE
	0IFzsr1UNqckORY/3xV7MgrgpiJf0UCxKmy0TgY4yCW40x16SsMxSVit7SYkHuzC
	VMsSEHszroIxUngkTE4V2kTiEmpd516tYE6FWNh19zFOp8Dk1L2fpJa4XtwT5U4/
	I9n19w==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eq10a9h0r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 11:16:28 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-36bc5e97950so7505927a91.1
        for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 04:16:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781090187; x=1781694987; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O9QM0vnhY8+WfpiXtoZ6RW1A9C9R+5BvzpcQBGpBa80=;
        b=J/4HAZjHt5X6UXZeM9LaAv2mvmZeHMerpTC5D/u8g4W3leTCG2v2TOBVvflhlClR/s
         J5nQVN+y0/puIo6rH8DKrdlpZe+Sdgbge7ER3omTrpkIwzFoc8dx3lDG/V/+qi8Q9hav
         BHbLe5ddOf2I11svpvZxJGG7euVEiJV9r8bxyVH3lLBCHH9l0vynMC2jdEo199fHQxVo
         IgtbiP3ZmJ/3gT/tSJcQB8VOoin8QMKV/xd/jN0nmnTp5pGnRVhT/7RnkCf+mPIDvpMP
         ZdMEAOqS58kFi1etj7dfOxYoTnvhjdRs0W4HY91z2UIUNK3t9R7rs5/epfRSR7sQ2XzY
         0fqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781090187; x=1781694987;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=O9QM0vnhY8+WfpiXtoZ6RW1A9C9R+5BvzpcQBGpBa80=;
        b=e1X9b+ROVribsRskTwKIYFrxFWfZyYHXK98qqmt7/+Aecy88+njsZutmRy+Fmb3M7F
         XuP62AbvepOoSvcAbj1HNLoqKTJNd3VFetu6x6QoPmp3Nli77Gj3eI0BhcTP0JKre9Ml
         dvZphMyd/nnUx35jSrZOdJ7sh8Q4Ftjv7ap2luPBOVL+2RJkGRle3kZx4HMeI8RbBsKH
         nonifMjidJtzGndJ4prXGwmBmjDIqrXOYvi7vIrZDWL07zgWMgcjTfWdxAMGVHvA/XJr
         T3PbQUzo4XT6sookioNaf5wnL/585nuAhnE20IIHyT1o633uhSIQVvAsZzwBx2vQKHOw
         8h+g==
X-Forwarded-Encrypted: i=1; AFNElJ+5ckl8ctOD+4i5L2NN1JlQlSYyene49B2uRqNPh1y8zoJo9PAfwI8FOxoca363gVpZYHH63xIYtQTh@vger.kernel.org
X-Gm-Message-State: AOJu0YxShm0cZ65rdJ2enoUmCw3jlGUJSpJ4gq8GTVjSNPQFEgkOWXFo
	NXJBzOrFeSifhB/x2NObLwwvQefgzS9dUNStGFmTf+xt4qlgq/e9xQJ5p1cOm9BkHZHkngjldXl
	RKssw0+DmJZ/wuz0BzAj/6s6nM7N4tHuk+emQnmk5cf6lBpYCyhrZ4KQjWvyMYVn2
X-Gm-Gg: Acq92OGz9TggluKon1q9oYs+eRgWbbcdkCWtJiVsbDNTC4TH56aWIrxvQp375Hqt/5E
	pPFbjKVB2r+p/zeClORltnoQoZufGO/OUmlhVCpTM48JztYmy1jx5E/cph1QwPysGqHfsAfvebQ
	rO6zxcUZDxcXSsZ4s4h3cxyfwxEvpbnvM4Zs33ab704l/ZNoKF8VZBWgBAa4obsOPULsumtEFcR
	Ft8Kmmh06irh1A+goBlnH3mulOEaJqHAnxQYaIANkqKQrOGbodbPRN4jGbKfMXjUkrkpD1cmHe5
	SGXIejXJjzp9EL9As3SqTapQ/fBquBHnetrIuS3t3DHTBPTCrwh2ro1rJhlddzJaoo+zhLnLYut
	EY2/yqi/XGyjMvwmcDwEcq765vqckyMHJw0zSwEG4YOujNxjKdGi4VHXc6V7WVvzGup3geJ8ZS6
	K8pEkkhq2R8iE5WmMV1+RNGrTDSbMQ94WCEdbJnt2jyt3IcNnC6gRZoOYf2N9iYw==
X-Received: by 2002:a05:6a20:db0c:b0:3a8:9dd:75d5 with SMTP id adf61e73a8af0-3b4ccf82cc8mr27997140637.24.1781090187421;
        Wed, 10 Jun 2026 04:16:27 -0700 (PDT)
X-Received: by 2002:a05:6a20:db0c:b0:3a8:9dd:75d5 with SMTP id adf61e73a8af0-3b4ccf82cc8mr27997111637.24.1781090186922;
        Wed, 10 Jun 2026 04:16:26 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85df03498csm23896099a12.1.2026.06.10.04.16.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 04:16:26 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 16:46:08 +0530
Subject: [PATCH v3 1/2] dt-bindings: phy: qcom,ipq8074-qmp-pcie: Document
 the ipq5210 QMP PCIe PHY
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260610-pcie-phy-v3-1-334011b378d6@oss.qualcomm.com>
References: <20260610-pcie-phy-v3-0-334011b378d6@oss.qualcomm.com>
In-Reply-To: <20260610-pcie-phy-v3-0-334011b378d6@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=GoFyPE1C c=1 sm=1 tr=0 ts=6a29478c cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=EF49ANZLUTmcXe5zpi4A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: NYitUwWPQ3k4ZI4jHhgpPMNjLVepmyLE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDEwNyBTYWx0ZWRfX1N3ySRH5len2
 lJPQUK7pppi9AHH9RlrYZzrOUbRDRpOv2vFZk1Cy2HKnZCjJA5Ej+Babf+QT2i5kqmp6KgriERr
 MZ3wu9/9op8IGEBGe2JX2NrAZ/lYkJ2H9vl9rtsV/F7ZCa8rWisl36BjlARmkqIRJm1Gq/bg4LP
 5IU7RKxzV8Lh3qIDFwSxnUQPNxfMcxWvELcAu7uOasenm62j5d7/urJ3YxWIZWzOU50JPhLCFW9
 881Gakwoi0wjP9vmh7DhPFU+zTgg8YMOGddAkCUhTFxk8H1SZCzUDd5fm7SCvwrq0SBEigNHhHk
 bcDO29yRyvp07Wbs+FFs9pLmCs/QRZ9U/zlZxvcyFkEoZf0vL+Th1rYs2QvtaRPTImG+3VzKq1U
 WfPMs+yEx52rlO90BKeFz1DbgGRUv+ZDeKapdNJ/zldlAn0XJcUYkQBNHZrNirDJudZnAUf/kEi
 W2PtFBzwvisNUlrq2/w==
X-Proofpoint-GUID: NYitUwWPQ3k4ZI4jHhgpPMNjLVepmyLE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 priorityscore=1501
 suspectscore=0 adultscore=0 clxscore=1015 spamscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606100107

Document the PCIe phys on the ipq5210 platform. The 2 lane phy uses the
ipq9574 as fallback. The single lane phy is documented separately.

The ipq5210 has one dual lane and one single lane PCIe phy.

The dual lane phy is similar to the dual lane phy present in ipq9574. Hence
qcom,ipq5210-qmp-gen3x2-pcie-phy is documented with ipq9574's dual lane phy
as fallback compatible.

The single lane phy (qcom,ipq5210-qmp-gen3x1-pcie-phy) is documented as
specific compatible.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/phy/qcom,ipq8074-qmp-pcie-phy.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,ipq8074-qmp-pcie-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,ipq8074-qmp-pcie-phy.yaml
index f60804687412..fc155ad5fa6d 100644
--- a/Documentation/devicetree/bindings/phy/qcom,ipq8074-qmp-pcie-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,ipq8074-qmp-pcie-phy.yaml
@@ -17,6 +17,7 @@ properties:
   compatible:
     oneOf:
       - enum:
+          - qcom,ipq5210-qmp-gen3x1-pcie-phy
           - qcom,ipq6018-qmp-pcie-phy
           - qcom,ipq8074-qmp-gen3-pcie-phy
           - qcom,ipq8074-qmp-pcie-phy
@@ -28,6 +29,7 @@ properties:
           - const: qcom,ipq9574-qmp-gen3x1-pcie-phy
       - items:
           - enum:
+              - qcom,ipq5210-qmp-gen3x2-pcie-phy
               - qcom,ipq5424-qmp-gen3x2-pcie-phy
           - const: qcom,ipq9574-qmp-gen3x2-pcie-phy
 

-- 
2.34.1

