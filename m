Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68DE34334CB
	for <devicetree@vger.kernel.org>; Sat,  1 Aug 2026 10:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785578426; cv=none; b=Wv6atODLWSSpuJ2oR/AZjCNtpQshpZkGuUiN9uqco+M+v/vpVLNlimjgn7mdGPyE8ilO26Y5v5/jA0XQxxTvrCJ3hNnsKu00WzcjQS0JgJ+N8x38YGlQOZLMrc/zKwcdzzzKozcI4Y2pBezjJad/Tnv8KOTtJU1zmChJ6MoopuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785578426; c=relaxed/simple;
	bh=7lAnEboM05pxKLJKuQkUK/+Xj0N55Uc3icMOdr2M+eM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=r3SFyRw0FOW4O/EGZWhsD4khqW6Tp3HhbVkY5Mm0MgTgho8e0u+8zaKL5KLOyhsH1jeCM8fcW1QW6m2bjXWw6VD0UpGitARbvMowdTWZlVgaSGgsk8uUVbPya7DRM2IlYPPsbjTFJbgWtK1DkmXjbUMoTiO83OkWCJj5DdtX2do=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oYQ698dq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MGJAnamm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oYQ698dq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MGJAnamm"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6713DP3Y2065103
	for <devicetree@vger.kernel.org>; Sat, 1 Aug 2026 10:00:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BIETq0q+ZXab0uvSzqdPRZQrHX1hfSH66MKbozuc2X8=; b=oYQ698dqQF06k7S+
	2eSVha6AwBQqu0+qGFVDyJ/uHbKbZi3aFG/fFy9pT1A9eKJU/sLV6r6E0gnT1mx2
	CHwi4jgadzGMdyGKMsnozwFfLeJmXcsJEAFFSltBbUv/3UnQBUofxVoYQSh172k7
	yetRgFRh+JHg+xVO77jG5qu5n0tMtW7mPLd/kciXn8Dmgyg0BBrJlhoEQX0amyiV
	Bq6JTL+sIOz+5AyvqUUJlDjjXgbBLiMDiv5wqyrjgG/qhsweHSJRoEQtsSE9W2hN
	UxEI+sTHl290r1fZL2v1anWt6xPKuNJbmEoMfdChd7bH+iMqGy8xnHijsyvxSq8F
	34TjsA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fs8q50ptj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 01 Aug 2026 10:00:22 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3811279d51aso3309375a91.1
        for <devicetree@vger.kernel.org>; Sat, 01 Aug 2026 03:00:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785578422; x=1786183222; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BIETq0q+ZXab0uvSzqdPRZQrHX1hfSH66MKbozuc2X8=;
        b=MGJAnammhDU+tNhiJvVda5SqjSXKDW9gNZ693pG4cKWy6iRMGRWYwJXLN3jM/4hSUi
         gpTI87+iAAfQFqNWMTkLKLWoE7eTp7VPawJIw5Qn1vb2+erXbhONL6GYmC/HpGLb9v7s
         uzQ4k9dcOA0YkatZF4MSODmQ7BKeTWAyhyN8PDnnwKKBB+ZW1vXisQP6yGlZezdKVoxc
         x8a+qaCvCijmLyi4rd8ShDLt6pkcwMxYyGaxLQO6Du40z0a+WxAYUTTPqSnP0mZo6Tkx
         VaTFrP5gehKbGoZ8wF/2sG9oxnr8gj7mNyYfFJCyGelJpIAkY4+MiDhS5JvghaPBKfHj
         XfHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785578422; x=1786183222;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BIETq0q+ZXab0uvSzqdPRZQrHX1hfSH66MKbozuc2X8=;
        b=I9aZDMzOsP9UAtFwnPdDIfPj1RGkBUcG1Ye65SCcxJUNUhyhrqUh8/N3O2aR78N+Wk
         DC2a2D45J1N3c6iH5f6E8swDaazwJt1cUKQVdH2wllfef1SYy4URMUkGCQu/ebWm+w63
         ZBFlGCwYb5ZgZYAl9o/I38u45/MRC4ByatmTtidHzoWFOSyYqUqFT7EgZ82LkmE/Qlb0
         moVN6xfkAva4QA99/CCT4iLSfEapJWlb7Rao7Q3ZIu4oqQpFwOOneYoQIa60WwJmmWjy
         OBgVWjvhHlBIQQnAmBaU7BrcvG17x/HMamoyvGeLhaUvzIPAGh4yCOYThAzPSsjR78oF
         7EvA==
X-Forwarded-Encrypted: i=1; AHgh+Rr/H8IVolFU/0uBNcb0G0pXTvHocz6S/M4b3oTCk6sNU3wT6RQD0fnx9JVYVD0elgLYyjYuvFenp/XL@vger.kernel.org
X-Gm-Message-State: AOJu0YxhcGGUI+fnEfUPWJTzI0Z38lP5ewCkyDkCnKgLQu2YCbXcudeB
	t41RcDcEUQDnHoDGRttjkvVok/hxIUOXdpx93YZjswGSeDmZ72qMDAdEA0itqR/uZOINFKwK/Z+
	gLU83Q/S6bsdgnE1HWPYAtqiEiVpZl+zKowt10ZhjEonV/D0ADLABmBIeVTizX9jk
X-Gm-Gg: AR+sD13cD1EA5mAhL0j9VcP1/F44Ch7K4wyVEKmhxtCQmVyQcgQg2XZOG7TbVl7UnXz
	eGlSozfNvf/ohii8iAt8Z6iUGkfC5/05/NBDPqm1K4UFrVIVWYvQdrv4aqk+d23d4hiULNQ5o7w
	EMmzvmgAPemMlolEDqMy9AZfREfmYJ+3m6H4x4N080Dt+OYE9cYOWlJM84K8XViEq8m6Vvp1pPJ
	NV5Bwzgq5NsjtXzXOd5OduUeLJgfNzvz7KRQ13AbQ0RKFrBKqi5gjpVyFgHtnWF3RWTPFB8PpbE
	TdxdrC4aSDc2UiWQpWG6wuGqAUPxxi2GD+9P5nhA88bxkhV2isF4h13IMcsuMaK0vJYw3a1dglq
	X5PadD2nA21FpE4VGDXJu2vlxCjR+HHqzDqbgcSmRPQ2ZatFDODFePY3T2K1qlpnA
X-Received: by 2002:a05:6a21:4cc5:b0:3c4:46ca:3339 with SMTP id adf61e73a8af0-3c92a85eb6cmr2666889637.39.1785578421711;
        Sat, 01 Aug 2026 03:00:21 -0700 (PDT)
X-Received: by 2002:a05:6a21:4cc5:b0:3c4:46ca:3339 with SMTP id adf61e73a8af0-3c92a85eb6cmr2666847637.39.1785578421302;
        Sat, 01 Aug 2026 03:00:21 -0700 (PDT)
Received: from hu-ggarmidi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153e04506csm16290600eec.17.2026.08.01.03.00.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 03:00:20 -0700 (PDT)
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Date: Sat, 01 Aug 2026 03:00:16 -0700
Subject: [PATCH v5 1/5] dt-bindings: arm: qcom: Document Kalambo SoC and
 board
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260801-b4-kalambo-crd-v5-1-22160abacf3d@oss.qualcomm.com>
References: <20260801-b4-kalambo-crd-v5-0-22160abacf3d@oss.qualcomm.com>
In-Reply-To: <20260801-b4-kalambo-crd-v5-0-22160abacf3d@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785578419; l=1039;
 i=gopikrishna.garmidi@oss.qualcomm.com; s=20260102;
 h=from:subject:message-id; bh=7lAnEboM05pxKLJKuQkUK/+Xj0N55Uc3icMOdr2M+eM=;
 b=aQrkBpmAO+lN6OTtpZop4zJ3Obiu53Qg/+5PeproPVP+eh1uuhbOV52L8eyxAdvvlnPFzKM+r
 o5ZTJ4Z/7/eBTA/VCFSYlQdUqv5CW82CtPKqpnzh92o0g2ZfgruJ9T0
X-Developer-Key: i=gopikrishna.garmidi@oss.qualcomm.com; a=ed25519;
 pk=TkSjNEhrfsj90i3wkABTZtAjLNr2cfYsujaTvyOIDsE=
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAxMDA3NSBTYWx0ZWRfXzjrIg7GeSgzt
 9/wLqCdw4ou7gYHuqUtZhUt22nZpzH4gp5XQYjHe/Y7Pw14cU5Bm5E3XP2tMCP6LHQlwLqI5pmT
 p2nHGQ5sd/enu4oGBTQKtJijWtHL2JU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAxMDA3NSBTYWx0ZWRfX38ALCIBwiUqp
 DeGeg/MtCpMnr/rkBLrTh1JSH7SXoc/8MnXGyzYtiijAJQm8ljlRL3oLzv0Wwo9CnPWAe/57NuQ
 Hesla2CUnwud+5algDjGMIGvVVW0uRLyamCxUa/jHM2hxFhp5Xy9DXLhR3FmdjBvVWkJkRYVX5r
 Np5+oQE+WENXZZwRsaG6HafwZmbuiHEg665RkXXcBSrDHCq5l7ehHq20VHgvumMcz+jnsA9izJv
 n2FpHjZVmH/4UzAnDkaSHb/OqnFfPTLWEUCq/bDn11Pkx4JlE5HtAr6B63VHaWGyGL0J/UauPyB
 GBD3JbO8XNJXnX9WJQ3CwHcoF/qj5yi4ua6XO3wLPfTcbjDIlHbbZJ8ydw/5cUHUWLLEwAlFNcH
 ZXR3UIpFv0/9x3DkYAy9tftx9YjNHEEaio8R8cwRMgBFMd6O0z/ThLiOhSoccj+rsNrmb17q5zn
 y+2FHYz5wTidfiU935w==
X-Proofpoint-GUID: YXwcmUFYhq0VYxzuuagnuF8y97KIBoSA
X-Authority-Analysis: v=2.4 cv=IYC3n2qa c=1 sm=1 tr=0 ts=6a6dc3b6 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=p3IoqaKxkAlDmzJvLqoA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: YXwcmUFYhq0VYxzuuagnuF8y97KIBoSA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_07,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 phishscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608010075

Qualcomm Kalambo is a derivative of the Mahua SoC with CPU cluster 0
removed, leaving it with just cluster 1. Document the compatible strings
for the Kalambo SoC and the Compute Reference Device (CRD) board based
on it.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index c7c9a9279684..b0c07a57bda6 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -174,6 +174,11 @@ properties:
               - qcom,kaanapali-qrd
           - const: qcom,kaanapali
 
+      - items:
+          - enum:
+              - qcom,kalambo-crd
+          - const: qcom,kalambo
+
       - items:
           - enum:
               - qcom,mahua-crd

-- 
2.34.1

