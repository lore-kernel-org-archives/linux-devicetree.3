Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37287357D08
	for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 05:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782105098; cv=none; b=lqhWCf69WObV810dleg1HlekImLOvpjT7p4oWDzR4l9Q2Nl2+tbNwjzmS65UfYZ/DmHv2rURhclgIuySBgTru5+ET0NwcME0nrzFktJzNVSHG1TvCHUY0CUyf7gtpwiJXNbOg4ujR5z5sQJNylBGbfLWUqulNyUrR9FpcsDvZvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782105098; c=relaxed/simple;
	bh=8DTNYS+P744bOozJQkgvmvf0NFM53z+xQfE4jjKNjX4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Lwus3Alma9kDAffHb5ev7GHBhN+7LDx16qa6Isr6qCvqp7UwybIrsAckJ8NVL9wKlbkIu1XlIhpkMibj61l2H8D2lYrePkl8Unic573HmQcChxYlq4Nbe01D9ts2DEDhBzr8NjNCoKY4WlHHkU31xExZ40LbhcZz6rMjwkSlaaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mQ7nqszH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YtAlKWL/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mQ7nqszH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YtAlKWL/"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65M59QGb3800857
	for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 05:11:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SNtxURgF27LsFZz4oh92b8xVTH9R5tBU1x6VEmvTsDk=; b=mQ7nqszHd9LYH8SP
	BDuD5bGIVn1qxJF9pLkhT1wpJuGgko4IcG4fWIQPfEm81ElYw4ibqEDk4gnV9Cu2
	Zmubmg343+KsV1O/0pyMKQW+cc6EOuWE//i6Z4qpF3q1+Le/X+gXnP5KLRxuVFB0
	GnSSawgp/hwmXMA3zewqAvy1sSq8w/Lu0hqzpHJJ2gtbSrIx+n3vRbtBmVkAyMOm
	wJhlkSI9d9CUptXG0W8ak7LBmxJHUUB/CbtcmVxhj7vbUz3df0PYASuYB+nbPZ70
	8xdDSdNwjI5nJ3MtyqoP4BAKcQgNoA4njnO+yKdjHcCiade6oPZe/eS1zW/MSsR0
	vZzdpQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ewm1k4p6r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 05:11:36 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30c17bc96afso1053165eec.0
        for <devicetree@vger.kernel.org>; Sun, 21 Jun 2026 22:11:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782105096; x=1782709896; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SNtxURgF27LsFZz4oh92b8xVTH9R5tBU1x6VEmvTsDk=;
        b=YtAlKWL/b2QWOJj9dQ7mYRtmKAwNyKMRRGZYxG/Rb7mZLhjukHBR1Xw0pBzRU5JGwF
         R3xPJ4xKLth9NcnHoQhjVLEC2bRiZINKr1zKv/xrMBZXYj2xYCQedfmX94ZOR7COMWtZ
         1GKz180kEGBnQFA96jMwzfUOQiaLMZGPG/Ma/LbQZc+Qh2yhDwX4JA9KCQ7wUpneSDiN
         cbFL0tLXJh/dJExC4DZZohcGEjYXjZi22m+wzd/Aa1l/l5Jo6UkDemsoTdegFAPSYOak
         8GL4hvoM8o045Hwkq5l1UrpwWOCua01NdBSHhiKyQnGstdTBNwxxe/74kFvV5H1B3yXw
         aD8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782105096; x=1782709896;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SNtxURgF27LsFZz4oh92b8xVTH9R5tBU1x6VEmvTsDk=;
        b=NpREU7FcWVFlDudQIQvxtubPXy0Sq6UOV/tkZW0s3q8xwj9NUPpVbWhoiarCyEX4Sm
         /9FtPz79uMnq9cnhhMOydXRZVurWU0K7ure7m8XIXQJXHLUTh++iMIrYModO8fMjlMXi
         MuhKyM8+9I4XYZLX7//S+fcJ4NqqKGTUHxJZOkSQnKir9oFK7mlfy1GBp5C5yPxj4Btf
         d6FDLm8Oi10BY+pxoiswiLPdyQ5n5wCbBfa+fI4ndCXOTq7owOdyMKLmPewjJ43iVgDJ
         Z13zBQQR02nJzYtBuv/iY/YJooI3YYujgBzLyOWtbOzYZOZtAEu7c4fk14JFjfuPP/xU
         JVEA==
X-Forwarded-Encrypted: i=1; AHgh+RpTz3TuZYXByw3jVCGvaUDeJWloT53Af5jBqumYnPEnC8PvWQfi2+Nw/M/pC5kGsIQBCTyWI2V2VViy@vger.kernel.org
X-Gm-Message-State: AOJu0YwhnYmIjmYbZqedhnD0zlrmtOHCUvgANF4XJTS3dUWHj8lYrW/y
	KJ/lijj9GmK2dCl6WHZs1uq6RR0JaQOTgGW7FKRKVTlKTgaFnZqKe94/+yp3TmUBbdGfQWe+RaS
	NqzHchuiLMDFMLOiVHQavMpvJ/7K0BBeNNdKXa7PPNW7GiymI4xd6FZlc1W0R8uPRFsW3uD9x
X-Gm-Gg: AfdE7cnu0xELgBvFT3jezkD4kdArw5H5nbotBqwH1fW8GMoD3avkgLqhGqplk1hInFv
	rTfuasYt5Nr1wkgQPNwDdyyIwBi4zsgQnPvUKaJQZoWIH5vHJN+zdqOKZF4NfJjKN3hA1EwWnt8
	0PLcY3ZE6a7Lc2T2l60etvAAtwGhUS7UlWLXWSAVNLuXcl+XkmNrQKVIixBhS214CL2EbM07KZv
	P8jwRS8v2mCemVLq9vNetAALcnEHzicxWsaVtH4Ns1bkvMaQnsRoqLqH9Z3hPWDi5s1LSUOohPx
	Xl0WYlBOLj/shg2ZHXY2mVVy54HdKKq7zCOYGnHZuXrj7Ushss+JF+E/1bd3OJz4NMtYwiK14yi
	Cr1/UhUVmfX9ozuqn02VfMNdIwR77WHyHSFmfPY48AHSZLG/whRaSixbdFQ==
X-Received: by 2002:a05:693c:2d8d:b0:30b:e4a6:1ab8 with SMTP id 5a478bee46e88-30c0ceac786mr8884479eec.13.1782105095862;
        Sun, 21 Jun 2026 22:11:35 -0700 (PDT)
X-Received: by 2002:a05:693c:2d8d:b0:30b:e4a6:1ab8 with SMTP id 5a478bee46e88-30c0ceac786mr8884450eec.13.1782105095310;
        Sun, 21 Jun 2026 22:11:35 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c1bd8d779sm8947716eec.17.2026.06.21.22.11.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jun 2026 22:11:34 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Sun, 21 Jun 2026 22:11:25 -0700
Subject: [PATCH v6 2/8] dt-bindings: clock: qcom,glymur-tcsr: Add mahua
 support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260621-tcsr_qref_0622-v6-2-c939c22ded0c@oss.qualcomm.com>
References: <20260621-tcsr_qref_0622-v6-0-c939c22ded0c@oss.qualcomm.com>
In-Reply-To: <20260621-tcsr_qref_0622-v6-0-c939c22ded0c@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Qiang Yu <qiang.yu@oss.qualcomm.com>, krishna.chundru@oss.qualcomm.com
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782105091; l=3510;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=8DTNYS+P744bOozJQkgvmvf0NFM53z+xQfE4jjKNjX4=;
 b=gxa6FLaSvv07V0PsJuGw6iKWlvIpksvtN6PIz4l3pwzBE+lc+R9+GJU6hC5KyszsZ/7vtAMuR
 t94d65KWkmLAOt/RAubyj1uWYzki6aVJaY+AeCsmqtVd/oT2JswOgAy
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-GUID: d16OfBGRasnBQAXe2dQ6Zww7johfCQcD
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDA0NyBTYWx0ZWRfXwoRX3cn7dE8j
 Wxm6AWpbJVBSpZJJkVxZdBvSHUfOu4QnTiNZ4GkcL4h5G1/BjLVRKFtivjIGNRmpOMDWmcvMPq1
 vTKu6ctgQxMXrslAJuD1OWsJznitIyQ=
X-Authority-Analysis: v=2.4 cv=T6S8ifKQ c=1 sm=1 tr=0 ts=6a38c408 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=lXSjqk9dN1moIixwM0kA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDA0NyBTYWx0ZWRfX5WTOHIfPCVFO
 aJIo4bqYLOiiRpYfIx6PJ6+6+jBSyAxV1CvdxD/OrHm3WVdw878jfiVGoIpRYDclZ0lv63vcazA
 ZxnQuMN7QBDyOgIMAYDacRjbBr/A2F4q9yjM1afaqij1pNVDSQdHJpHs80n9e8MeZ9AlproOuSC
 /IiwCvlKfnM4E74SSPylxg65Ve4R41De/GgGxE3gBJCdJ8yjIx+GPzM14ZZRQ157oLjrENaVabI
 qCJ0kwI3qPLQthEgqQCOsxHQ/ZhaAm5yAcSDeleMUYl4Hea8FwGMTC86+A658+lxsyQ2wSgthLx
 2dGXtIhlS9Gssb+2//rqpJl5hEiylYflYRXjD2y66B4fP7fMNW/MXN6b89hj0kyXpM1XNcrjlYH
 AaiVTjPXAo4vB2EgV+4QeZRNULUJr3X7jSWCrALwMObp20sjk6JiFeVVSkvLmLaMpiZj/25H2uE
 dSN1DGvePJCaO2dmFYQ==
X-Proofpoint-ORIG-GUID: d16OfBGRasnBQAXe2dQ6Zww7johfCQcD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-22_01,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 adultscore=0 bulkscore=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606220047

Mahua shares the same QREF TX/RPT/RX component naming as Glymur, but
has a different topology: a single QREF block fed by REFGEN3 only,
rather than the two independent blocks fed by REFGEN3 and REFGEN4 on
Glymur.

Add qcom,mahua-tcsr compatible and document its required supply
properties.

Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
 .../bindings/clock/qcom,glymur-tcsr.yaml           | 68 ++++++++++++++++------
 1 file changed, 50 insertions(+), 18 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,glymur-tcsr.yaml b/Documentation/devicetree/bindings/clock/qcom,glymur-tcsr.yaml
index 16fc6ab87f9b..2b6422627165 100644
--- a/Documentation/devicetree/bindings/clock/qcom,glymur-tcsr.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,glymur-tcsr.yaml
@@ -20,7 +20,9 @@ description: |
 properties:
   compatible:
     items:
-      - const: qcom,glymur-tcsr
+      - enum:
+          - qcom,glymur-tcsr
+          - qcom,mahua-tcsr
       - const: syscon
 
   clocks:
@@ -41,9 +43,11 @@ properties:
   vdda-qrefrpt2-0p9-supply: true
   vdda-qrefrpt3-0p9-supply: true
   vdda-qrefrpt4-0p9-supply: true
+  vdda-qrefrpt5-0p9-supply: true
   vdda-qrefrx0-0p9-supply: true
   vdda-qrefrx1-0p9-supply: true
   vdda-qrefrx2-0p9-supply: true
+  vdda-qrefrx3-0p9-supply: true
   vdda-qrefrx4-0p9-supply: true
   vdda-qrefrx5-0p9-supply: true
   vdda-qreftx0-0p9-supply: true
@@ -54,26 +58,54 @@ properties:
   vdda-refgen4-0p9-supply: true
   vdda-refgen4-1p2-supply: true
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,glymur-tcsr
+    then:
+      required:
+        - vdda-qrefrpt0-0p9-supply
+        - vdda-qrefrpt1-0p9-supply
+        - vdda-qrefrpt2-0p9-supply
+        - vdda-qrefrpt3-0p9-supply
+        - vdda-qrefrpt4-0p9-supply
+        - vdda-qrefrx0-0p9-supply
+        - vdda-qrefrx1-0p9-supply
+        - vdda-qrefrx2-0p9-supply
+        - vdda-qrefrx4-0p9-supply
+        - vdda-qrefrx5-0p9-supply
+        - vdda-qreftx0-0p9-supply
+        - vdda-qreftx0-1p2-supply
+        - vdda-qreftx1-0p9-supply
+        - vdda-refgen3-0p9-supply
+        - vdda-refgen3-1p2-supply
+        - vdda-refgen4-0p9-supply
+        - vdda-refgen4-1p2-supply
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
+
 required:
   - compatible
   - clocks
-  - vdda-qrefrpt0-0p9-supply
-  - vdda-qrefrpt1-0p9-supply
-  - vdda-qrefrpt2-0p9-supply
-  - vdda-qrefrpt3-0p9-supply
-  - vdda-qrefrpt4-0p9-supply
-  - vdda-qrefrx0-0p9-supply
-  - vdda-qrefrx1-0p9-supply
-  - vdda-qrefrx2-0p9-supply
-  - vdda-qrefrx4-0p9-supply
-  - vdda-qrefrx5-0p9-supply
-  - vdda-qreftx0-0p9-supply
-  - vdda-qreftx0-1p2-supply
-  - vdda-qreftx1-0p9-supply
-  - vdda-refgen3-0p9-supply
-  - vdda-refgen3-1p2-supply
-  - vdda-refgen4-0p9-supply
-  - vdda-refgen4-1p2-supply
 
 additionalProperties: false
 

-- 
2.34.1

