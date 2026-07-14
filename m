Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5548E2EB859
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 04:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784005196; cv=none; b=dzIFOV8cc+I6rZNl0+J/M7dNMM3RJhUBnsFLAngivWI7CoNObUvuZAS0Ajz5XeAFYDfdJdv5uqyTmrRzy8DcY1AqbPwerjq2ekKkXO5ISa200jlci4KHCW4YE6xe9JtlTg/zWEwUrX8huNO4RS5XN4bNoLGKAcwVRWxqSY3qmtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784005196; c=relaxed/simple;
	bh=rWbtb1W+stySBwVTYmTH8aWgwOvBKUz0d7zkndsOrdM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HqiEuD2jgItwWGQ7dCnr72nA2vOwTTd5oD+cWDgSw6ouqsFcbAWG0GsmOmWVEywLJ2+ORB0FPxfR7JAvHvylBHl7lltcQoyslY+K9FZMjp/YyZU6wU2eDjTUHA3ibRr021+Ts6+5Suo+Fubooxuqig3hGilqriYYEb3HR2P/Bh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g1y6JH1T; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CWLgc8bV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g1y6JH1T";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CWLgc8bV"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66E382Pf3276937
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 04:59:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YtW4Ak09kXgiLEZNs7J/4jrifXCWd9zql1exxl35Rg8=; b=g1y6JH1T6DfjzNF6
	BaerBrMsvlAy9iKUNiWhxq1pTw21/asu3EKKt6xD6zkOXK00gmn+Bj2FpiGbVNGT
	xUadMmgzdCSf/RayBktt7iLrdPVoMCaImbRO6HFFwe9JYyNX9Cv8HWpWpyb4ZpXy
	hHebozuIijuySV20hRiuSCCo0N4YY/ILuEXMOplRbG9VlBXmB94xnY4h6SKkPrEO
	xBhyzK7i90MKeva8FaOY0NTQ4wABXfTkWJnB/Pkw4gcZnoAonjm5ZTYu5Cs4lcyb
	JJehPMvmjh6yLO7pf1AqUKRyHsidlEsS+wNdsoN/oYnFMUPpOdbX0KNaO6qUvMcl
	FPAXKg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fd7gvh8cv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 04:59:53 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38dd87656d3so2706928a91.2
        for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 21:59:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784005193; x=1784609993; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YtW4Ak09kXgiLEZNs7J/4jrifXCWd9zql1exxl35Rg8=;
        b=CWLgc8bV0DXk+CwV2TsVy4TyUq/geqeg7Vz1BvW7Ppn9jrIQCG9uVIFIv7evHI1peu
         VR2x3edpFOrKLtHstVc5dpvz/2zRGVgH78kopdDhRTSIdWMaV4W6umYn/9PLx0NKdQmj
         BXn5IYZg/mpVVzXwMPHzNDXxHGCAga/YL3FEfWyd0s7vc8zJIWqBm0p78hmwLeeoUg+2
         xqAN8skXn+VFwjR+jW8Jktgv5FIMWciASSEwWNIb1NSKMkLdWzt7+OEBixmNY1U0IGZA
         zVBBco3/1OcJJRc+bN3kA7Tdn3g+06tM410Q+SfywHxqZTQgrDD3nb3FhLUNB/pas4B3
         SUUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784005193; x=1784609993;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YtW4Ak09kXgiLEZNs7J/4jrifXCWd9zql1exxl35Rg8=;
        b=b6rY61pp7+3mlGyIoF9t9HZ7GeCAykMmjcPPoIklm+EI4uefDPyOqPDhvZtHryPVVn
         WEFjqJ+AzpLiNHYczR3fdMQeSEW4rsBvtowGUuazgzt+ozNcGYlMMJfNlqaXP4GlMgdF
         nWiXvZGe8n7ivWSP1McIjO5hHg71FcRqGKqGks7H/kCbPg0yyW/F7oNIOJ83CjeFl2dj
         I1nS2gJFnSdpv/zEHo71+5Q5+iQw/ap4zWmBTQ+WuPM1BfwgE0fnPqW/PVDwLY92soon
         WGyJ4v+s1s1Lh9rnuogZlUjb//EqjPE/WD/BjRqCk+vJMGeBbbz+8cEDZk6SOQZPzIyP
         wDcg==
X-Forwarded-Encrypted: i=1; AHgh+RrLrq0H5LVWL8PgyXXMMzrTyANveb1xhTpbFQys1Aa2KZtqx/lPe6I0vZnO7b4ZhMPnoGG7isStk6cI@vger.kernel.org
X-Gm-Message-State: AOJu0YwyzhK1pZaYDh+fDUyh1DQcoWcHrrh1DxXGRr2n6lmH02RSE23/
	62FPSKScxG+zTJWMephBOC3SKLK5yZoBfslTpgYhpdJlQCdvIR1VVGG7aDS7peyHzl1/IFJar2Q
	wnHSX+E0euZAQAetiyNmikBIcRkgqlDId1ZXst06U3h8HxvdaBl3focUKjRflL6Wr
X-Gm-Gg: AfdE7cmj7E6cx9nva5q7ZdCo5n/agzqJWnD+wLrmhFQ8EJzyAxVVVdl7A0VeMWdG7w+
	TW+R5/n7nC2v0iWl1vhq/sWVzkiA6NmPvTFjtzxUzC0W0H4ia4fEqqL4NQDSa5KhD0JoKv1ORZj
	xYTwft5posydoUU5rX0POYVf2JgjZmKygRQGT2Z0weLwQylZ+knzBMuLdkZNf0siP7TDAHzh2dA
	arGNs1ttWOu2bkj2PDSKPyys4kY8PB8PqmfwyFB6cWIZSIZV9HDIc0f3GGLuRwrvH77sV3lT5TV
	hkOF0mCrQPpSLGq0pyyhImau1yoiuUp6mX6TheXjj+Od5fqyRfO//ny/kuCSHhR55l7ACArUlL4
	L7KunU4ZTlxoLcCN5qJRz6TBYwH6TwjuNaQxJlUIp4VsbGGjoOTO3bIsuWg==
X-Received: by 2002:a17:90b:2750:b0:387:df8f:1405 with SMTP id 98e67ed59e1d1-38dc77badd3mr10713086a91.38.1784005192906;
        Mon, 13 Jul 2026 21:59:52 -0700 (PDT)
X-Received: by 2002:a17:90b:2750:b0:387:df8f:1405 with SMTP id 98e67ed59e1d1-38dc77badd3mr10713061a91.38.1784005192490;
        Mon, 13 Jul 2026 21:59:52 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3120c8e41fcsm41874021eec.15.2026.07.13.21.59.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 21:59:51 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 21:59:37 -0700
Subject: [PATCH v9 2/7] dt-bindings: clock: qcom,glymur-tcsr: Add mahua
 support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-tcsr_qref_0714-v9-2-373670ab15f9@oss.qualcomm.com>
References: <20260713-tcsr_qref_0714-v9-0-373670ab15f9@oss.qualcomm.com>
In-Reply-To: <20260713-tcsr_qref_0714-v9-0-373670ab15f9@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hardening@vger.kernel.org, Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784005189; l=1880;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=rWbtb1W+stySBwVTYmTH8aWgwOvBKUz0d7zkndsOrdM=;
 b=P8t+Vk9j0quvabeBmT1OdSoFANC9FVLIAbuJevQ1qm4wbN2sJdQmDvyRxiniMg6PzlT4XgYcq
 TRLkHILtCrhAx7A84t/1I5FRIVZ121m3BHONU9+3jxPhK7UVaGD2dLD
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDA0NyBTYWx0ZWRfX4zb0mMEW4egX
 OaSZJsEE80dJJtXZFYs8Atc0Nzs70sCIvsQv0XZl4zfGpzal8KYHj0p6oL66mG8EDf9RNaSEOcu
 1EVzKlR3TaMcNw+L4DwokpDaKSF+kb65q4ef/GJ1N1FLh4kkyBHmfYnX2C3LAHrlS/DlO8bFFoA
 FGJ/4OoAeCPqUb4uq7WaI4TBL0dWC+9JsW7NWn8LgGz2n9ZejrDiL7IjwGOpTAs3o7i0DTgJnu5
 K207ZbcYKj53Pt1ZFDDtpL6dxZqtwL6/e1Y5QsewBUJKQrlvQDj6cj1wtdJnzRvSkX1jPs3E21K
 lVnC7yUgwLbB/KPYTOdVwNcAi5FzhHXWQg4HzlnUrUf5OIUFqbOEnxOa/JZN5yQc99XKSk3nhh6
 zTPPtX0Zr2MoTCieZNPZVSEc7Kh/aCxrAkmwVvNjw8Lf7TYTaFJOjuHIiC1P4ef/RmqT3N174fd
 x9En5+MLrxXTFhgRLIA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDA0NyBTYWx0ZWRfX8/oD1Y5XITsy
 VVpSiAsYPlk0BdphqrA4GjBdxlIiHw3Tn4QgHDtlt92IDsX+PqQriWcp6ja5cgeUAtECvXVcH+X
 98AYHsSm6MmrzT7DJqszuLiIR078Z28=
X-Proofpoint-GUID: 3WH6FmDKJZBuxMaUSpQVY8c8E3liYp5L
X-Proofpoint-ORIG-GUID: 3WH6FmDKJZBuxMaUSpQVY8c8E3liYp5L
X-Authority-Analysis: v=2.4 cv=NYjWEWD4 c=1 sm=1 tr=0 ts=6a55c249 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=tHEUkVd5BVjdM4dvyhIA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_01,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 spamscore=0 suspectscore=0 clxscore=1015
 malwarescore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607140047

Mahua shares the same QREF TX/RPT/RX component naming as Glymur, but has a
different topology: a single QREF block fed by REFGEN4 only, rather than
the two independent blocks fed by REFGEN3 and REFGEN4 on Glymur.

Add qcom,mahua-tcsr compatible and document its required supply
properties. Note that REFGEN4 is supplied by regulators vdda-refgen3-1p2
and vdda-refgen3-0p9 on Mahua.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
 .../devicetree/bindings/clock/qcom,glymur-tcsr.yaml  | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,glymur-tcsr.yaml b/Documentation/devicetree/bindings/clock/qcom,glymur-tcsr.yaml
index ec89feff89e4..2b6422627165 100644
--- a/Documentation/devicetree/bindings/clock/qcom,glymur-tcsr.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,glymur-tcsr.yaml
@@ -22,6 +22,7 @@ properties:
     items:
       - enum:
           - qcom,glymur-tcsr
+          - qcom,mahua-tcsr
       - const: syscon
 
   clocks:
@@ -82,6 +83,25 @@ allOf:
         - vdda-refgen3-1p2-supply
         - vdda-refgen4-0p9-supply
         - vdda-refgen4-1p2-supply
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,mahua-tcsr
+    then:
+      required:
+        - vdda-qrefrpt0-0p9-supply
+        - vdda-qrefrpt1-0p9-supply
+        - vdda-qrefrpt2-0p9-supply
+        - vdda-qrefrpt3-0p9-supply
+        - vdda-qrefrpt4-0p9-supply
+        - vdda-qrefrpt5-0p9-supply
+        - vdda-qrefrx1-0p9-supply
+        - vdda-qrefrx2-0p9-supply
+        - vdda-qrefrx3-0p9-supply
+        - vdda-qreftx1-0p9-supply
+        - vdda-refgen3-0p9-supply
+        - vdda-refgen3-1p2-supply
 
 required:
   - compatible

-- 
2.34.1

