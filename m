Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A73E36D9EC
	for <devicetree@vger.kernel.org>; Wed,  1 Jul 2026 16:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782923275; cv=none; b=cGkNH2c0tv4Z/q3Nn35ZBe36TAzMuNlC33dQgYG8tK6Vl9AfOD2SxKiCsBwJMegduyv57obH9CU3vpKZ0+dD0TOODCt+RgHP/4an7FPnHaLOIm+wjhaZOUTinc2KpJV9pUyY8IH4c9CNR+7o1Zn1csNteO2tp6IwaUvrrIa2394=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782923275; c=relaxed/simple;
	bh=SFkszoYob0NQmXMceDh/DB0rxgYBc8NVUBA1MCXzYRE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=oq8gDUVlWY8YEXHxZF9wtaO0ABG8gcvpUrbS0f/CupmeQtjKE9QHos3RzNTD/q+Mmc9iWFaAF3BPfhP6dKxpaw5iLmXEsZhUTKCYaeVlLd74xPyzilHLAkt6F3jE6P7di+DWGZ230wLjQBZWXcNYDTSY2b2VvFUeWiAvyfdm4as=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PHMUDJRe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d8O6TW4c; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PHMUDJRe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d8O6TW4c"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661FoIsh1553151
	for <devicetree@vger.kernel.org>; Wed, 1 Jul 2026 16:27:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=W33J77eszCzFLVVz2y5CJSlgxsxIdWmNKHK
	eyk/vEhY=; b=PHMUDJReCDQjIcQ33EMGF9e5oWRhlkpFJ0zIXnP0cmDZlly7sxR
	RXsJDQIIcgN1bWIrUen/L76d2CtDxSpnYRrNxWoObWiRNIJTczG+xF4tDkjSccjr
	j96v9JA8CEQUGeimDOmrWO0QOlA7yUpJrzpV0U5m5J2XVvmQW7HmT0mfs8KSCq2S
	5aNaHFUPcd7js8h5iWTKeuwKFXZHqbLS4zPrk8FywZ/ac1zmkITNO9kAQCEHqqSC
	UizLS7EtiikSRtmCd0DXjYdxCbwes5lQg4Ws1N/2c7Qrgf0ln+GG5UEu/Tm65VLa
	t8KrfEl2qs1XU0iAItGhmltnM78rs+jFoJQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f50sd1kwk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 16:27:53 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c894c1c4aa9so648940a12.0
        for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 09:27:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782923273; x=1783528073; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=W33J77eszCzFLVVz2y5CJSlgxsxIdWmNKHKeyk/vEhY=;
        b=d8O6TW4cnNjnm4CIwH997nEZGeEMBA2aLMgxbV4TEo6JbxB14mghDPU4+976qPfQHL
         uWahm0fiHSou73Qs0nF+FMEwvXPaR78j8Aah74O/NYbEEN3rypCnm1QVSrLU/mL+dccK
         8uz9iiAtRg7bVx7To0/SF5Rg+NBGZ9qyzkLTqujnL0ljUeTJnHCihV9hti6EEZhgKmua
         dmq9Fy3vb+1drWsphWlFEnPTA77c9TvoBTBQm5t7avGDvIHEys+ZUQnV95r92vc7W1NK
         rA20YtoJv2fZeaW8/c6N2emEAZYRdUIq/BFEakvZkfdOvCDq4tlDtrlpt3ABaTDbe0RR
         m7Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782923273; x=1783528073;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W33J77eszCzFLVVz2y5CJSlgxsxIdWmNKHKeyk/vEhY=;
        b=GRsIE6mhJNE/8OyXT4kyyHP1fc77W3DudNEIGGxOcx7KGVP8sKERJchrijUKGbVEmZ
         qmvaZNOWEUjUADG4XYDRFz1daBt8RfYWQmsuRLH9gCOhPZ8tMcTE0d6i3gKrgRfhwtMF
         oB05FlS5d4PchhjGpeDts4FEeMbyn6gpqYVnT6pPpVLL1IkW9W2SxTknZufCHFKnqAB/
         6lFsxjSv2lKMKXM6YkapR/COQLPtHn7yuugX77DHwiu+sGLuSsK67828Yy+zJ+xOSus5
         WPPEWEvJK9LVY3mIwWTCYqcKDbkY0jIWHbKjYOYNdBpDhd/xO+G8mSkrGsJ+02HoW4QZ
         onIg==
X-Forwarded-Encrypted: i=1; AFNElJ8YivRYo2RgZVYn90SX1C6dXNkfmBwjAFRNPa9cufVAHppQEDbnZrwe4JV212Qhi+rwuB2x8CgGoNl/@vger.kernel.org
X-Gm-Message-State: AOJu0YzqCvMTdyH3ipZIdvuCvElBUNt7m+XhOF6YW8INtJ9uYS2yoxOo
	2CIxH2m47WA/WVeW/yo7O66GnHN2SnSm4lXx3IhxBWT5s36b8JGEvmtnboFxzglaFeW5PRHR2Q7
	1/I5qF7hiBO/NN515YZLlvBmOQcE4MgCEcDmCyFnHeo+VWm2iaeCiDeJVKTRDvkuN
X-Gm-Gg: AfdE7cnsd5KVr1JrgZ+qHSWV7opafhh4lS51WJh13a3BLuq5q+CbRx0Vz5YkG4KLbN0
	46rWKlr9sKp+LvPJ6YKCUzZGxOk0oZtdxkjk4HgKSi8rAYUS2s42KBMXxr/1VUwVhW17ZE6It8f
	Fp4+A/B5BXYpftgUcFMfLfyvrfwOLEZcXGiRkb9DlZfoaP0YI9Ux/4qUSeZOmumLmlGus8Osq4T
	MIKfPV7ZcbyK8QTfhZKIz/Uwhlm25JH2yliSSCn/SeNIaZ4tcTkp4/amgY9G9C/7MONNGAjlw45
	HeE4aJWUyPjaRa9rKLM6mXdD8lkIWQA0nhVu5zI77tIkFc2Ogx19XL6n51vZKamdp3fIbUycv0c
	9ktYevlNpOxVCjNCezsUKhTiXYVKvqZHvFFivWftqFfcKO7gqeurnO33ad2aUtEuJgF6F8HCkyB
	UCqZBD
X-Received: by 2002:a05:6a21:48d:b0:3ba:ecfb:ae2c with SMTP id adf61e73a8af0-3bfed2a20a7mr2405046637.20.1782923272907;
        Wed, 01 Jul 2026 09:27:52 -0700 (PDT)
X-Received: by 2002:a05:6a21:48d:b0:3ba:ecfb:ae2c with SMTP id adf61e73a8af0-3bfed2a20a7mr2405007637.20.1782923272447;
        Wed, 01 Jul 2026 09:27:52 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b2abbba82sm24782403c88.14.2026.07.01.09.27.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 09:27:52 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: [PATCH v3] dt-bindings: usb: qcom,snps-dwc3: Add Shikra compatible
Date: Wed,  1 Jul 2026 21:57:45 +0530
Message-Id: <20260701162745.4043106-1-krishna.kurapati@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Z+3c2nRA c=1 sm=1 tr=0 ts=6a454009 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=3e1sJlzf_ErWyEvw0aAA:9 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: r4sdotoyesUZ-uuL2tzAEqsD0_FNgjKg
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDE3NSBTYWx0ZWRfX//+LSoxkdXhJ
 crsr0XTZsr8A4ILcBPMb9Y4h/3yFbx4pAoJbRe5L3JMJZdVn0Xnckt3Jkpis3mBTqCvikrjLVRF
 /luYaYA0mTFnqZqkNZXrmKQcfdUgTLk=
X-Proofpoint-GUID: r4sdotoyesUZ-uuL2tzAEqsD0_FNgjKg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDE3NSBTYWx0ZWRfXwanExZa0EvAA
 0uUnvIYbjPpSkCWji41Gt34Up4PgXQC7wSqmRUqsXc3CykT6nQjOaTNn5/XBgyQngDZ1fQmuNrA
 HOQzjBNfgbixasGCLNHASFGmrTj/E00kwnZRg8g+H2VL5XsnG76Vw7LEGGwr4eozOEldvA9Dosk
 PtH9WxOlBkurymoSQbDGxL3KmY2SYomJoR9ks+nv2B87h+PuCnk0VTMO62F84nMp6Xgl1q20/zm
 TqQNw5+N49pRK52iKHj1SyZVc2KCEhHk9MRSl+1KLqg6iDS2Q9KKqRzhSoltvkJvgECG1vkl7BT
 qtPKmFji9W20MuHJdsmUomV4bx4F7XVt7mQ4Ian6fsf/52TT45yK1pu1mTmq5KCXUeQiEZNTX/i
 hbYz7zWIilPtPrnIMKGGA3xpQ3Dn6wJ4qDy6AVBmJQVbpgv57lmbzzm/DdKvvp4pDCmtZYy7RDd
 3owBr7AMwmp5YA5bvPw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 adultscore=0 priorityscore=1501 spamscore=0
 phishscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010175

Introduce the compatible definition for Shikra QCOM SNPS DWC3. Shikra SoC
has two usb controllers and the secondary controller is high-speed only
capable.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
Link to v2:
https://lore.kernel.org/all/20260504145710.257211-1-krishna.kurapati@oss.qualcomm.com/

Changes in v3:
- Moved to using dp/dm interrupts instead of qusb2phy interrupt.

Link to v1:
https://lore.kernel.org/all/20260430-shikra-usb-v1-1-c9c108536fdc@oss.qualcomm.com/

Changes in v2:
- Updated commit text.
- Separated this patch out from phy patches.

 Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
index 8201656b41ed..026fc715eebf 100644
--- a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
@@ -60,6 +60,7 @@ properties:
           - qcom,sdx55-dwc3
           - qcom,sdx65-dwc3
           - qcom,sdx75-dwc3
+          - qcom,shikra-dwc3
           - qcom,sm4250-dwc3
           - qcom,sm6115-dwc3
           - qcom,sm6125-dwc3
@@ -386,6 +387,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,shikra-dwc3
               - qcom,sm8350-dwc3
     then:
       properties:
@@ -556,6 +558,7 @@ allOf:
               - qcom,sdx55-dwc3
               - qcom,sdx65-dwc3
               - qcom,sdx75-dwc3
+              - qcom,shikra-dwc3
               - qcom,sm6350-dwc3
               - qcom,sm6375-dwc3
               - qcom,sm8150-dwc3
-- 
2.34.1

