Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B28B3D16E0
	for <devicetree@vger.kernel.org>; Fri,  1 May 2026 17:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777655201; cv=none; b=hN8o9RurU04dT4WRAj35hSa4e3ufhlXHAcZ0FncNz0SzCjNqbrGwA9E641iydKvNLBSsclmuLzLxvAThMyruGdMUv+QyiS/DwvPxLxuPygJttP/41GczdqnEsZw09JSAt0Ohf8JAOLHk6urM9yhlCE5YzovtmqpIxscOPI49c10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777655201; c=relaxed/simple;
	bh=KvqAs5R+iIDwc5i3JUTq2hNLbPWJGmhxQ+Wfjhe5QAY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=SBwlDwD913Matz2D8j5liYMZaHvnfQI/ryaup6RU2Ad/IvPlaTJAFfopCpFmCxAvzfKXTigUuut0BKIOwe8X9Hs356FGR+gANTd1Ea+NRjN0HEnEhIW1A93bZFGGlPjt7vgUdBXXv44kymhw2JGGJ6/DXWcGHSUuygb/IAOFv9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W/2Waab9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KOBNlF+P; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W/2Waab9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KOBNlF+P"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 641GLW22497912
	for <devicetree@vger.kernel.org>; Fri, 1 May 2026 17:06:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=l02V6N4JgrN
	OPuusUfSdP43C6TvNDkrqHvXRRW/M3Cg=; b=W/2Waab9WSzoVY2eDwwqwhFcGXc
	YeIT9D4M8HxpFrMU3OAR8jD//ajACCC3l0AxeIEFYaHY+lL+Sgq4lYyFJvGTVisy
	bOiPsex4upb8koTSLW54K3NRP4IWpW6Dlg9qk0YFDxGxxjY8s5P1tYtCDsxvnddU
	JNr8BT4gMnGxTd/SsjGKNa4R5mlM/T920EAQDPjsVeRy1Pgl3KzlX58AeVHgExvH
	U/asnMKTiXZh94Av0p4Ha7+Xhv1mrO+pOw1uZhciL0wZCLyOcP9wDZzlL1n/Gzgn
	99LNQtxlFUYBTAdHPb2rFUFB+00JWBH7byyLqeoGB9jzbi40nPZgdN1njhw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dvchkbc2b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 01 May 2026 17:06:39 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2c0f6593ef5so3236593eec.1
        for <devicetree@vger.kernel.org>; Fri, 01 May 2026 10:06:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777655198; x=1778259998; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l02V6N4JgrNOPuusUfSdP43C6TvNDkrqHvXRRW/M3Cg=;
        b=KOBNlF+PocSEEkRuuzkhNRETuYwWKxLZC86KhsqdvdAd5EyqOYDrSoBz25+ua6lDHh
         MDQxCYjpHHWIxeR+umc03tR3ZMJ15R9E60lJjTzPSMC8rXzo/26F3R33XkVWo+4XPvow
         qNYy9yWXiWreNPh5klTNDcjALdPOU/F3RxpVq2ncu9kRy4gjfhOMK5I8ehOmlHbtySzA
         TUqp/Hg849FJJqzpSNJqGkSSFpdEEB5jbDBxtXqAVDXJlIsZKGM5vjT8MleVRaaIooH8
         EI6ph/c65h/eG/y73Yk4RbmVTooLDzshD3qJJRoy7ofWM/tAQxI7jE8ERwp6RGi44/iL
         2JXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777655198; x=1778259998;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=l02V6N4JgrNOPuusUfSdP43C6TvNDkrqHvXRRW/M3Cg=;
        b=EhJKMLmvsTLhWXDIM9y0w9lOIFkqSGdtSy+kxWxTfuS6UvWVxAYiaJI3KPcMKMTQZQ
         yWnqbmt3KYbXy3ERAHxYXEa3opZH7CJvk+Y6JeKsyFfz+2Qk4z7LDZWElryOAK6FyGFb
         a13yuBAgbnBjmOGOU64kwhaPt9jR/htj6LVvyvrxuAcTTYwaRj3T6jl3LRaqZxDArWqq
         yWS5vmv9bErc/r8OuCZVHeI6KJysXQGLagpYfUPgCRxAMuMKwYV5om09K4ONWf8CReYu
         G+eeDK7uBZVQExZ7uotujL8zqK+bIqbD5ELrslJrP4nANStp0k2gTPuBo2ZbE+ByDFhx
         3f1Q==
X-Forwarded-Encrypted: i=1; AFNElJ+eAo39NLDltTLf1jcKTPbNKwgWG5cYuj6RocS2efqiCJ+uphZq8AkEi5MD1kYHcAd2ZboXdbn0X32R@vger.kernel.org
X-Gm-Message-State: AOJu0YzDZ3s2t2Xc7UjesYLr/xrdcnYsgvsnMxs1B8vJRZmkNpalecTT
	UTwMow/y3Q2Bl4qi5595GZpNVhp8laE7jWOpyc7ti9o7CNrYpqsdgRzIm1M/UH0oDZa9E9/uqOp
	NqYitxdTEgxZLp1EbNjncHjC4niE8lX4u5nWGheR2v5uLlr7756VnVBByBZr46WKa
X-Gm-Gg: AeBDietgltWgquhVpMK8MsfN40FCO3WQUTWBM1P0kvEaCzzGRc8pDVhyqak7nEEh1nP
	29xOzFzok7T1cgvatsCDlmNBIM35iu+Dm7KT0WObY1/PwoWuqlUkIo/X8dVPC+NWVXwlBvPggZF
	4mr3iqVXcevfzPvsR62cBXXd2VihU2GqEXEV/aSk3msCxuziVBmwBYfGMUBcwKIarHOkBB2Ox+/
	p2zAXyO0i/i7nVg5S50mmhsm5OlficaLhMFgJsIH0no77QaFdvNCS+Ce+Rn4Bc7e+c+NbeQneew
	tC0fi9yjtcQmsLcuLkGQ6iPvSpCbNPocPsP7BYNcvqO6rscBI6N1I4iQ5gTxkojQ/XXbassNFcw
	bEYUcWkHFnr+UCQC7pKBPMKWw97eIcaHKlL8QPVkd4IRJ8Qhk8dj/fATMLGDcTmMNzNjQrTpAX+
	iuF8IidiLqvg==
X-Received: by 2002:a05:7300:2322:b0:2c0:bfe3:b95c with SMTP id 5a478bee46e88-2efb8aa1f8bmr96517eec.4.1777655198048;
        Fri, 01 May 2026 10:06:38 -0700 (PDT)
X-Received: by 2002:a05:7300:2322:b0:2c0:bfe3:b95c with SMTP id 5a478bee46e88-2efb8aa1f8bmr96494eec.4.1777655197477;
        Fri, 01 May 2026 10:06:37 -0700 (PDT)
Received: from hu-eserrao-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ee3537d300sm6655978eec.0.2026.05.01.10.06.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 10:06:37 -0700 (PDT)
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Souradeep Chowdhury <quic_schowdhu@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/9] dt-bindings: soc: qcom: eud: Add per-path child nodes for UTMI routing
Date: Fri,  1 May 2026 10:06:27 -0700
Message-Id: <20260501170635.2641748-2-elson.serrao@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260501170635.2641748-1-elson.serrao@oss.qualcomm.com>
References: <20260501170635.2641748-1-elson.serrao@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTAxMDE2OCBTYWx0ZWRfXxEx9q/Fvnpl0
 +2ok/ApRODOYaW8tzROMnxxTmvEjYCI3rA6JuYO6qtqQpUO7mVMCMHY1LgJpSBu1DH/TR+CGNPd
 5waR+jOcG4wvdoVbR3Tj/sJ/6hAww/lmUqr8/G970d9BRhPdJKL2Y5C/CANyTu8xjwqwd36a/8H
 QCcYtWV4ADuja3orXg9zF3Bi+Krg8J68KANEz/y17EpiMWCIDxh2PrvwW7mMdvpmdSd456K9ElP
 YSp3h9o649G+wzpZ6Y9m1nfLXBXGVO6z36i4jVau0nXbn1keW3WG1XFULWHBigkPrRGNNUHl7ZQ
 rj0kh1U/pwTYxjXQgfJQULW5Bu19A0Cj1P7tvc12cNkNkruvj2B1HyoFJ1f9UR2b4iADR9/8lLr
 ruaPk+sMorfJBq6r6qVqzthyNAWmbZ1do7a4BnnRXwar+vSD1pQfZsRJk+dJ+ELrMqIsBV3QCbB
 dnyV6zIu8QjyjyvmwbA==
X-Authority-Analysis: v=2.4 cv=Zdkt8MVA c=1 sm=1 tr=0 ts=69f4dd9f cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=S5Gqkj48huS8qG7z_KgA:9 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: QbQK6GH6DGk5rfaF0gJM2BHwHMAY6JAp
X-Proofpoint-GUID: QbQK6GH6DGk5rfaF0gJM2BHwHMAY6JAp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-01_04,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605010168

The Qualcomm Embedded USB Debugger (EUD) can intercept one or two
independent High-Speed UTMI paths, depending on the SoC configuration.
Each path is distinct, with its own connector/controller connection
and role-dependent UTMI routing.

Because the EUD sits between the USB connector and the USB controller,
it must relay role changes across the UTMI path. In device role, the
EUD inserts its internal hub into the path to enable debug
functionality. In host role, the path remains directly connected
between the PHY and the USB controller, bypassing the EUD hub. These
hardware constraints require per-path role awareness, as UTMI path
roles may differ.

The existing binding models only a single UTMI path and assumes a
uniform routing model. While sufficient for simple device-role-only
configurations, this representation does not accurately describe EUD
hardware when role switching and/or multiple UTMI paths are involved.

To address this limitation, per-path child nodes are introduced to
describe individual UTMI paths through the EUD. Each path includes its
own ports description, allowing controller and connector associations,
as well as role-aware routing.

Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
---
 .../bindings/soc/qcom/qcom,eud.yaml           | 55 ++++++++++++++++++-
 1 file changed, 54 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml
index 84218636c0d8..21f75038a81c 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml
@@ -45,10 +45,63 @@ properties:
         $ref: /schemas/graph.yaml#/properties/port
         description: This port is to be attached to the type C connector.
 
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 0
+
+patternProperties:
+  "^eud-path@[0-1]$":
+    type: object
+    description:
+      Represents one High-Speed UTMI path that EUD intercepts. Use eud-path nodes
+      to associate role-switching behavior with specific port connections, allowing
+      EUD to manage role transitions independently for each UTMI path.
+
+    properties:
+      reg:
+        maxItems: 1
+        description: Path number
+
+      usb-role-switch:
+        type: boolean
+        description:
+          Indicates that EUD should act as a role switch for this path.
+          In device role, debug mode inserts the EUD hub into the UTMI path. In
+          host role, the EUD hub is bypassed and UTMI traffic flows directly
+          between the PHY and the USB controller.
+
+      ports:
+        $ref: /schemas/graph.yaml#/properties/ports
+        description:
+          These ports are to be attached to the endpoint of the USB controller node
+          and USB connector node.
+
+        properties:
+          port@0:
+            $ref: /schemas/graph.yaml#/properties/port
+            description: This port is to be attached to the USB controller.
+
+          port@1:
+            $ref: /schemas/graph.yaml#/properties/port
+            description: This port is to be attached to the USB connector.
+
+    required:
+      - reg
+      - ports
+
+    additionalProperties: false
+
 required:
   - compatible
   - reg
-  - ports
+
+oneOf:
+  - required:
+      - ports
+  - required:
+      - eud-path@0
 
 additionalProperties: false
 
-- 
2.34.1

