Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD6E62D6401
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 13:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782219931; cv=none; b=qNwEcLFbiRjcUVjAiBk9hmuZxEN4uC+fYZpCQksdUJSBdjsH3QI2cHIKimiCRz1vPq6YrdEmtSnENDv4Qx+wMiR6ICoiS0O07nr4i30UlUQSuKQ0T9ETGwc9iGu4RW3BKaUECGCqrY0IxyqpW1wG4TJWuj6wZeNt9oftQPmxd/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782219931; c=relaxed/simple;
	bh=93/aBfJdMnMxQ1hbCH7NcblkNMni6c+McXTe75xVLsE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qR2quCF1pAgLlblf9EJNN3BuBeuaWCAbA+qxSuAOGaR16nPevT6w3GcOlGDRfTQZhncgiWh3OUhWegv4Wi2NxcblBKDPXdQcslKT0Iv/s1xxfI0rvmw7yj5pJngh+17fmCefWHYSyyuWygb+/CguuFqGofnXt9i9JM7vDbyLvE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TGMrIKdO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KMnBD0Hj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TGMrIKdO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KMnBD0Hj"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65NBXsZA3668900
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 13:05:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QBENkoZaYaXxPSASHmcaxsCEyi7v4L7vT5FlX6cyDyA=; b=TGMrIKdO+2KowRQy
	KqzlHrW52zH0RMz31yQPuY014eaaWZzZT7cOJhpp97cR6N++GJrR9kJfIQBPFUiD
	00BM/OogyRsjiQeRy6q3kGx6ZVeFjxMeg+R6hBNrB8GIpwqioIkCRkGAA8dTfRXQ
	O5+apzOTbwkiiJAv9vk7djC9dD/OyJcbMlRr4elNUIJW2GUpUjcKOGLF9FyhTW3T
	6nn0zbrhu/D+JviQpK/UJTo4T1OR5/2KJyYTHy4i9bqO/sZt5rEjkld8SFW8VgdO
	scDHXNYrpPkHnKOCUY8iX8DmiNR9ldrZyRjbVU9geyBD86aOk5npHxvTA0eE8QEl
	khxChg==
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com [209.85.128.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eyppyh2r7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 13:05:30 +0000 (GMT)
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-800a49310aaso87638787b3.3
        for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 06:05:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782219929; x=1782824729; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QBENkoZaYaXxPSASHmcaxsCEyi7v4L7vT5FlX6cyDyA=;
        b=KMnBD0HjjBzXK8kml3DPXh45Jp/yl/EwwQQgCMSd+Ve8qwHA8Ghc7acivT4CyhFyFE
         3yaDM3egMiW47eZ+BV1yoP8/eVLZm1EVNarPdeKdlHxjnheniPouoGQAHEArJ1BFXxHX
         /RLJS2WCgIC53eNdyj2YK34e8cOVVDj4gQmnxtVBWxBfJe1LvwuX4jEhG/QLqqdSkUQA
         ZjWn//LGMzscJMo009as4+/fUgMyB3UaOrTLc1mmhl6SjtNGTgpx3aelbqL5b3WLqzpk
         KATln7J9lWgMz9oYgvFZYhQrASN87vJZZ0W7Szh6aD3KPfFDX/p4bDWJbNdZ7iyOazD1
         DaDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782219929; x=1782824729;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QBENkoZaYaXxPSASHmcaxsCEyi7v4L7vT5FlX6cyDyA=;
        b=iuJxil7ELpHcGg6F/nlE9uGhJ46KA+aEguaBk2GlaML56RiKEO07WBrhN6Dphw9MZY
         y/tJTNqOX71vCdBV6OVKggC9mn2D8HeYKcYMTvqXVp5bSKP/ibLlnLekufrS+O4hFkIJ
         ZqaGQTffSYAZOsJGxbMitp7molRhTWe62mTUtWF3+EjvUfIZ535gTrxHOmrfYhZY+KfM
         MKl0L6RvdH88QvqQXPfrEMFo3IRzFYkgVIypbRuq7ADcqAv8lXU6w0WU+tUdzStilO2D
         YHYIOm6dH4QJjcsVJdJLqt2BS0xq9RIcXTTpOTPk6ihxRS78XAOKaYEDIjIxPrHvm3d4
         /Bpw==
X-Forwarded-Encrypted: i=1; AHgh+RpcfgZ/5tDcP6utL+yVXNO5bvuMujxyIYw8djTupvH4Dag/AAIIbv+ZSmPFmroPXZWXLuW4F6ll1IW2@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3hq2QGGDbPgPYowejkGUX8KEG+oRA9W0qbzkTiCzyF46NLAjH
	rLQCCMHP0RaqThtWzWmeRjbWHF1GGtO5XAZsgW45+wTkAKEKlUSDHo+PAXaGlXQsa9mzSQsvYMc
	eigQtRQuE8qboKU/k5P7BjR+oSGpU+nLkj4c5jz9f7NtAn6m0jR3tqjvk3bVsmhOU
X-Gm-Gg: AfdE7clxmXVP//Tq/nsUHYaJQcp1aV4oaM+8585Kium4YZXHQLdDvZxgbypW9Ip+QD5
	V57ibMFY8GMtyxAjXZpqS8OizjACHXr4um4FXQhIcx23YDwqBxS+qL72v9wAq/TSRO534LKbt1M
	XxB+l1G1nFxxRa1KMfJGLUp8FmJJ8lIGSL+YFAzSn7jmH13WiNmNjoGBjVwq3+mjxqx1UHaY7Ge
	pWVqpbYJZ/nY1whsa7OKChN3KDXQJZ5FMgOEikhq0ddh/3hamPAsemnYk11DwoBxqMcAWL5yTfR
	pC+DLsi1k2Bh+hFfvHXNuuDyLnz5kUbR56R8u+GKqco9EzZIwGclZzi9XqjBVefZXHtdUmB7HcY
	MpPnLpnszII4Fx1wGo62cVf9d0QTDMgQoG2I5ulu0/beKl98geCQeQn9iCg==
X-Received: by 2002:a05:690c:3706:b0:7ff:f11:24c8 with SMTP id 00721157ae682-806dbc38f2emr22464157b3.6.1782219928960;
        Tue, 23 Jun 2026 06:05:28 -0700 (PDT)
X-Received: by 2002:a05:690c:3706:b0:7ff:f11:24c8 with SMTP id 00721157ae682-806dbc38f2emr22463487b3.6.1782219928411;
        Tue, 23 Jun 2026 06:05:28 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8025ffc700bsm44091127b3.36.2026.06.23.06.05.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 06:05:27 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Tue, 23 Jun 2026 06:05:17 -0700
Subject: [PATCH v2 1/3] dt-bindings: phy: sc8280xp-qmp-pcie: Add
 vdda-refgen supply for Glymur
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260623-phy_refgen-v2-1-4d15983bf91d@oss.qualcomm.com>
References: <20260623-phy_refgen-v2-0-4d15983bf91d@oss.qualcomm.com>
In-Reply-To: <20260623-phy_refgen-v2-0-4d15983bf91d@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Qiang Yu <qiang.yu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782219925; l=1582;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=93/aBfJdMnMxQ1hbCH7NcblkNMni6c+McXTe75xVLsE=;
 b=gKQGrmpz/BsL9ZJoibvqsJOvbxakAkEmoj0/Qy8a/gal7/BjPkvx1Y402RQQVlpkpoxR0FMhq
 MMGkRMKXr2mCLOZh/Q/rAZpBV6HW98StfY/eICJv84PR6j40cPfKEMP
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDEwNyBTYWx0ZWRfX0yqoDsTjiUN7
 MUvHZrd+dm6ZcbkV+P0b1mj3Gza4aL7JFiqq2XS63eJ+e6Z4UP8U51zB+6wmjqO8lQgMSJN5Tcm
 CP9opExgCJJWl43uDQknZd/eF+TU3rGDmxkYv7g1IczlcOVLyQhkwjb0cHdnM7oZJ0u+y3HX3Rm
 RmFgZd6Br3tTKJHrY8iKQiO80+Nz7l//IV2ePGiVmqmKJXBwv7SvdyUk+60NZCsQMrLW4XVJzeG
 l0GGHcfUUg1f6wCNkM/4TajYobTzikkUA2PM5TYCZ4+9iKk8BjBTBId2500hJwRtwmizBLoms82
 PQSUZyB9AUpsf6wWrApJsehpGRZz5ynXL/jrUNcW8lZi9t3O7FuMJtBepUCC8eZNsbrooqqCYmE
 WPTxOXxR1rcEKNJkTZF5t9lCftyZgPGRWiWnA3O6go2SfHHxhpNjjCUxhqbt0m2ON2HPRwHhsG7
 aEUpwHJvZOVcYMk984w==
X-Proofpoint-GUID: -1O8UkabHvR6AVJ2b6Tt5k5l_396A59R
X-Authority-Analysis: v=2.4 cv=dvfrzVg4 c=1 sm=1 tr=0 ts=6a3a849a cx=c_pps
 a=g1v0Z557R90hA0UpD/5Yag==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=vs92Cf7bL59LNXS1VVEA:9 a=QEXdDO2ut3YA:10
 a=MFSWADHSvvjO3QEy5MdX:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDEwNyBTYWx0ZWRfX6xUYNAlMEkeQ
 imj4GMqAlyWzPcvlgFMyqjdolTcBmRp7wsv7s+3l5cAuiizm/qv5us9+NipdsxGEwaRDGt3g2co
 blrXbM2gZTIFC+zlhlH/34+R210iBQI=
X-Proofpoint-ORIG-GUID: -1O8UkabHvR6AVJ2b6Tt5k5l_396A59R
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_03,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 spamscore=0 adultscore=0 clxscore=1015
 suspectscore=0 malwarescore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606230107

The PCIe QMP PHYs require a stable reference voltage provided by REFGEN,
which in turn requires two separate LDOs to operate.

Add vdda-refgen0p9-supply and vdda-refgen1p2-supply properties. Mark them
as required for the Glymur PCIe QMP PHYs for now; other platforms having
the same requirement and can be added later.

Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
 .../bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml         | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
index 108cf9dc86ea..375f5fb2111f 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
@@ -91,6 +91,10 @@ properties:
 
   vdda-qref-supply: true
 
+  vdda-refgen0p9-supply: true
+
+  vdda-refgen1p2-supply: true
+
   qcom,4ln-config-sel:
     description: PCIe 4-lane configuration
     $ref: /schemas/types.yaml#/definitions/phandle-array
@@ -261,6 +265,18 @@ allOf:
         "#clock-cells":
           const: 0
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,glymur-qmp-gen4x2-pcie-phy
+              - qcom,glymur-qmp-gen5x4-pcie-phy
+    then:
+      required:
+        - vdda-refgen0p9-supply
+        - vdda-refgen1p2-supply
+
 examples:
   - |
     #include <dt-bindings/clock/qcom,gcc-sc8280xp.h>

-- 
2.34.1

