Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED81E3845CE
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 08:54:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774256073; cv=none; b=BIAH0+TJoJ9w7RpuWyySK3LS33EhSNmmkOLGGqynJ+ERtjeWWT2oFXJYWgXFT4HAsVZeR+zxkshorC+Lvlk+fjUIyyaXM5eQfuNnYNSwSegZfIYPtsDejrCQYH8VuyUIOrQ43QVfNW1pPDChj7+wqgKMw3c2E4B8hneajqJRh7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774256073; c=relaxed/simple;
	bh=WDwt+iJWsLrMVO9ZsmRBE3Ry8wsQX0z/9z6PVVpk62s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GOpjW7AP2HPdcadUsCZ9Ry9x9HsP/BlxHSaxNxCg7j71qdiC5bhWMGM2NAqv8c7aBZToFWMJxAWy6J0qsVH83lM+dEe9Cik1tTWbMia3Vf0YJ4bMCrWehb/iWWZfdu3FcqpcR9ezDz2ILOsJ+InIlyIaM3AfWsv0vMz4lkjIiyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ecK4OSr2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cEbRPuGK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ecK4OSr2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cEbRPuGK"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N72gle4138099
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 08:54:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	O1j7aXR0mBvxICpb+HVyuv48KVermp7Qzb1+jaye6ls=; b=ecK4OSr2nk+8aWvh
	VOTmIlAofkSYcPJswqh3k+UWX74Va37lDYJzOSDPGMTBBK35XICjzU9z3RtSxAs0
	DHbUub5hgwidyJHZxKFbtoZ2UaInhU6tWuiKHRdLjTlsdudyuUwnXzMiETFpwDGW
	aTlT+OZDN4wfZRE3nEuWBa5bI+8QPtl6zneCsg3HrjS/QMbnvzls14hY5dN/x5V/
	Yer0I3jkuX6Be9xYceHYIk6al1jwCeCvXaavhhU9IzQxgRByk5njKqCobXyCxx9B
	bD5ZOPEY/wina6+3hifOaOVyJEn4EXTyQtxzb0q6y3iI6dDoM6ifE//emjfkzZb1
	uRRPqg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d1h1e4pxq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 08:54:31 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50911c94db1so30281681cf.0
        for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 01:54:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774256070; x=1774860870; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O1j7aXR0mBvxICpb+HVyuv48KVermp7Qzb1+jaye6ls=;
        b=cEbRPuGKeaLAynkbK2Uvi9Lp+jMwWhB3pLL01AkxvlAtLkgikxdkHbmN1q9DwT2dcd
         AEGrndd/yvFoT/2Y/unhy5N3QWJgzz1evsI+nm2KmaiIYLX9F1N9CX200L2T894JxAE3
         bBNFosQJ3ZGNKGuvDS6oMPvpHVVwfn5vfCG4aiNsFSvCX2IgFquxRiSKU93KptUxkcrj
         hxSqvM9vWyE6L1Ij7PAMCcIgGXi0TkYOclB961b/99+aXqUoHFVA0PBjGnNn3FkWsGxU
         dNyKkwuaKd9+PYUTrDSEwRxjBVMAp24lyI6kCA4QOUN3UO5fqwY31CrizK0O7dyemkH4
         xH7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774256070; x=1774860870;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=O1j7aXR0mBvxICpb+HVyuv48KVermp7Qzb1+jaye6ls=;
        b=T8blVkymst+ed0zubBo8ZZG2TuUsHty960mglVl77z/bB5uNF0YA+iyRSZ58M4LvD/
         mguirqbbgxBFyoUpMTmDUPCYx3P38QFGX+5b412ikdw+mAFE/OQ8dx9M/O9d4f9fbww1
         gBd946iE48o19Hyw1IPPH5wUcKSaSdcb0mgYArNTMXu7NPVCkxua/LLeD9/isKOBVVx4
         rfFDBnlhCkMGAr4Zx+Ic39ezmD8YhMN/WKnkq5WQHd/UPtTrRtFqjX9pWhv4Dl7+9Jg4
         yHf4wiar3quB/D7S0ivWsJIomZwHOVT3XrV7R2jc2L7b9VjadgM/sN7aAu1zuzwO6kt6
         h8Lw==
X-Forwarded-Encrypted: i=1; AJvYcCUtOuKeJGmbz0SA+630BNeJeEVcHW+IR4QKg4+wVtNpr5gQ6Nhs47IYTLZl7Qd0Cq+AHAeE8g3jh99X@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1vuaeL3kKQYRP0c4DlaIUXsQzLeH+x3af+ihCHNlNROAhYDJO
	J3JCwLeIqxXyxnGFJwQ3IMknoJ5Z52210O708xUF129yUbXTfZlH1WayIrcxCG5Gwza06Q1NUes
	t4EZ7nDxg0NuNj5//UT30Nxp2eNUq9jSB9mK5rggAD62pmxkyH3du0SOvGQ0ShUWC
X-Gm-Gg: ATEYQzwHKr1D2K0ihsPFWzTxR28rd9M3ehCbX+0KN8OEKyIZkJQFOwKFb6LHT4jOuoA
	VkA/5P4hXH+WYqFSso4lSJW1sA5f6lMRBoCw8nkECQ8bonH0+mlGDtk7umDMk1JYt6ULnhvcaGA
	9+fv3suM4pihtyGrtT9yjNVH/KA0QhQM/k5X0lfCXuyqDgj0ovrWrnemWDalaZ+++B8akJi//vi
	+tC5JlfRVC8xRX8BlDBbVPJuk/8qgEB/jf3CN57RLLVObg8VKCLG5sYoA1Qwqkg3maAc2tvEp+8
	hI7P/h7FG/qtJyz6j6+SLl5ysyMpfgCqb+x7zA8n36jyb0CCP5Dex5lzThVYCd7YdHiYZ1feSQP
	32MSCsxKQNXj5ISewQKBQUd2Hf8DqPfv5YlwgcEKQY8Wf
X-Received: by 2002:a05:622a:6090:b0:50b:2096:4950 with SMTP id d75a77b69052e-50b374c5d13mr184875281cf.44.1774256070357;
        Mon, 23 Mar 2026 01:54:30 -0700 (PDT)
X-Received: by 2002:a05:622a:6090:b0:50b:2096:4950 with SMTP id d75a77b69052e-50b374c5d13mr184875151cf.44.1774256069896;
        Mon, 23 Mar 2026 01:54:29 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b64703c27sm27911739f8f.18.2026.03.23.01.54.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 01:54:28 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 09:54:13 +0100
Subject: [PATCH v2 2/5] dt-bindings: usb: qcom,snps-dwc3: Add missing
 clocks and interrupts constraints
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260323-dt-bindings-snps-qcom-dwc3-cleanup-v2-2-3bcd37c0a5b5@oss.qualcomm.com>
References: <20260323-dt-bindings-snps-qcom-dwc3-cleanup-v2-0-3bcd37c0a5b5@oss.qualcomm.com>
In-Reply-To: <20260323-dt-bindings-snps-qcom-dwc3-cleanup-v2-0-3bcd37c0a5b5@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2467;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=WDwt+iJWsLrMVO9ZsmRBE3Ry8wsQX0z/9z6PVVpk62s=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpwP+8U096y5ipdmEXzRM3nEAq1lULg/vILhHT9
 939uM0BZJyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCacD/vAAKCRDBN2bmhouD
 138zD/0ezlmfMNxEESgkB6uorN+sXos1Awk2mLoFE/x+RtObVv9nFzV4PR/xGkSjNR3TXFlnz09
 XkD8Dzs8ZXjb6GbeF6ws8Jg9W1hqabAG15W9kDdxR1SMpcmovu7A0b7tGfzOTVCBoVF+DRKPlPB
 VoyIZXUFwtm6OGVz2xayprtA52IR25it6RhhwY+YIH5sbywCOxiHbtAzyZ1KofhbtUWiW+p27aP
 EE05U9bbsGsLd5aak9I7dCL/q0xnBLVIP/6fn4qhW7RsvE96eBMTojLgKJp36Aie4Fv0vrRnS0Y
 upfDIuOkX0XS3YEjtRylFF4etlYK8bxXu/mrH6r5zy1J+kVm0EgW4YaqeNeFsfXbUsy3mHBSka4
 pq+HgIoXLWbRU5E5QwNlU3Ghb3tXxO/LiV7nYO6ET0W2PB9l0jpikpL2DMPA1rdSp+qCbxF5E3t
 CMjzkg5/kyBfu8Ab2435sax1czePSwlfR+sKJMHO9T23KFMF/C34K78L6vAt3msgvbEv8CgF+so
 PWdLJnnn9qapYGEE2wEmA5a5PEIuDwSjOJXk8wVzTdA+xU2mO+Kuvj741RdeDOp7F6OaCkuJi9O
 HcplXbUhpPyYlWINfUij84ODR2avmG/bP48WdaAsZltIvQUn7usXNFkdreHf57SwbVf3j8gHGLn
 Nm+JHSnS0nRdjQw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: c8_xY4xh6kCUYXPvuT346KzMgXXyPTY2
X-Authority-Analysis: v=2.4 cv=epXSD4pX c=1 sm=1 tr=0 ts=69c0ffc7 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=QW4mu7NqH3IevVM1T1gA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA2OCBTYWx0ZWRfX5v7qYw/LQVeN
 yY7LjRgQPqWBMVruDKumADfVId/rgrRg/O4lT1bMyXGTCynv8CfiLErZqbC32BG7fQf+8TXCRtM
 OtHBW7UFWqp/54rjs4NXnqz8J1sWDt43obiciTYFBhKMADAyjjZtfPW8DwMPVYTSrAZn6QrwpuE
 UHS4iqR1tb7e79cVBW6N6mp7HJJOceVjVrTsrvdDEogDUBepx7M20LD+LHfmKO/SLsfbnrWVXPt
 QsIjVt/DlX+riOHJWueun9pY1yB2mQhzR+MEwKNOxrrKWOAhf6iQY7m5ObmsJzrhauiM4E6mfje
 BO5+bZA0BgqEQgwgkBzE3be2ezhCBljeqRwBTSSk13rcovkmadQKEvquzn3oCt4CC7+6/RIe09L
 AVL3ujsIBn86Gps/i+g00pQj2FstI3z5xsuKaYgho2fJHaP4HTjrLmP29u24WNVO+uikRjv2e1y
 2sICKu9SrPzKoVT9laA==
X-Proofpoint-GUID: c8_xY4xh6kCUYXPvuT346KzMgXXyPTY2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_02,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230068

The top-level part defines variable number of clocks and interrupts, and
each "if:then:" block narrows them.  It however narrows only the
maxItems leaving minItems undefined, which then takes different values
depending on dtschema being used.

Recommended style is to avoid ambiguity in such case, thus if top-level
part has broad constraints, then each "if:then:" must specify both upper
and lower limits.

Add missing constraints, mostly minItems but also maxItems for one
variant.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Changes in v2:
1. Narrow also interrupts for qcom,ipq5018-dwc3/qcom,ipq5332-dwc3
---
 Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
index 2b6a0939d98d..1ad2b52955ee 100644
--- a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
@@ -173,6 +173,7 @@ allOf:
     then:
       properties:
         clocks:
+          minItems: 3
           maxItems: 3
         clock-names:
           items:
@@ -220,6 +221,7 @@ allOf:
     then:
       properties:
         clocks:
+          minItems: 5
           maxItems: 5
         clock-names:
           items:
@@ -262,6 +264,7 @@ allOf:
     then:
       properties:
         clocks:
+          minItems: 4
           maxItems: 4
         clock-names:
           items:
@@ -281,6 +284,7 @@ allOf:
     then:
       properties:
         clocks:
+          minItems: 4
           maxItems: 4
         clock-names:
           items:
@@ -301,6 +305,7 @@ allOf:
     then:
       properties:
         clocks:
+          minItems: 9
           maxItems: 9
         clock-names:
           items:
@@ -361,6 +366,7 @@ allOf:
       properties:
         clocks:
           minItems: 6
+          maxItems: 6
         clock-names:
           items:
             - const: cfg_noc
@@ -402,6 +408,7 @@ allOf:
     then:
       properties:
         clocks:
+          minItems: 7
           maxItems: 7
         clock-names:
           items:
@@ -470,6 +477,7 @@ allOf:
     then:
       properties:
         interrupts:
+          minItems: 4
           maxItems: 4
         interrupt-names:
           items:

-- 
2.51.0

