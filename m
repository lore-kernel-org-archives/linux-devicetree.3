Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EE4B3B9DA7
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 09:07:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779268053; cv=none; b=eOV5JrGY7fIwE2CXYc473Y3M0HQnVe6yWbBw0Fj8z70lfvtezo/TxHNtkB+GhjMv2nD4u5oqgZta0/BtB4wwQTiMJD6fbchjFWkJJaF/JtbH8lCPcnkymXJQWwVHCmVYXijd1bKMjRP8tC/iqROyYJ4zfdafI9iIiKGpYT4/ZX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779268053; c=relaxed/simple;
	bh=YX58XETFNrFK6fPHF1U0S0cwb54Jv2xjL5zfxBSQE9A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OpsstbquKoZjSfb71NUWSqdmTsu3olHIhsfQkoukOhUSccAmSvpXGplbi9NmUtHYa1hjKkHQXxAaE6Yn3p1zTbgNL6xh9Iey4rM4+7AzoNVdMGuNnTIghAeshWHDGXXlXfhXWQaFKq3jGVyEnwtv8cXaJVOOZA+6t1x7Hb9vkKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=giY5nvR/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hmyVu73I; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="giY5nvR/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hmyVu73I"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64K76M0M2143776
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 09:07:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MpJzTEmNOgzw3NFClHoM7kG4QCGYRRJbTUYE5H6k9EE=; b=giY5nvR/8n/ACJa8
	EvrW1R9FhSoOeuT9UfuwSvCM/mG9+gL+0PokUrV7hmcawC4Ogalwr3yyUs8oEKd8
	TjSg+pDYo3xU8UaxBCfrH+wL6g2IwoB4VTuKXaU3f3QLbuOAij0EffrCOejLPK2C
	uzAurM90Gp/9cfmhmFO6KZxxbrTAlLMxJYYitpHA8FEKdBo0vz3mWRzIdgxWBoRU
	zUPu9qZPWPOdA7kWv4pMBeCC2PsxrmEL5byu522TZcMEdSvnY/nHQeBPdadH9Kvv
	LSE+u8jrFtadrxoR1IoKCsUSXyCPAkGC2yylyEyj8+9JUqa+yuZgcbvEUPM9FS4d
	j/2nVQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8t3tkykd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 09:07:29 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-36641bb3d97so2794258a91.3
        for <devicetree@vger.kernel.org>; Wed, 20 May 2026 02:07:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779268048; x=1779872848; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MpJzTEmNOgzw3NFClHoM7kG4QCGYRRJbTUYE5H6k9EE=;
        b=hmyVu73Iom8pLD5yvzmlaVnjWNW58r1vm6kZ+Fe1jiS3LEPFTBS1Q/Rpm9QYxyFw01
         AEtcXva4Sl1r7ylfM88/Resh/skCptcqkCXMliiAlOhmTqqrVCrwgvwH5nWDPDrv0Q5O
         yxdHRHoiAlRq3/1oooNCkku1mEZaxXwB2MCWtP5HPCY/jgfqY+bLUyaV/z0NTmIKHGuV
         8sbN+Z/Giltd4q/Ov2PGU2b/8bnacCrNXpCioyicxQF+4M4g1T7p/uMvpGooSPYNlJ5y
         WMD29VPIZxDW/LEAQyfyR3I4i7HttvuRs4+vQplxytsBlRN0JC2G+0Xitp/eMqruwiGC
         7YyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779268048; x=1779872848;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MpJzTEmNOgzw3NFClHoM7kG4QCGYRRJbTUYE5H6k9EE=;
        b=Vyzyf2HadZT4Xxu4Yv09S2Sos3EfWEo9ykOqAGMIfYGE6qYJbCLCFi48Rl/yZxaTRA
         MzXOs+INha6S60uNMxw4Rb4fIQ6zwfK5QcyIc5WECRuBtEuNUSabg4X6hqNk7KwBM/qs
         WrFgNMVi/mwD8sk7oku/ZJUY0eeqwZCLen06J+1e2bHmbMK7NO2y9rZyk2A5IT6iaRNz
         tU1zwY1KfNMyBb10mtAATgJ6RRD0IQiEJrr1fWvPuB831PLbZ+XSs22y3aVyazt4D4ai
         Y38AKRU8z13YX4uKOn/UJNAMD2AKKsUfWiQXO6FallLbP7zlnIzT0N7+Vs7DW6Rh419c
         JsKA==
X-Forwarded-Encrypted: i=1; AFNElJ+2Dz2Efq8fWIBUkSpeRPMZBrlGLN/LEHZJwR8vMU4lTurIzdoAtH4Qt54QHFc+NfWSZOt9j4TfcQ3r@vger.kernel.org
X-Gm-Message-State: AOJu0YzVgpp/+UPI7Qaw+VDl2yo5tMuzloBqBhmGQVdD4IvtTTTYK/N0
	aBJ3g04P5X5J3O/LcWxmj/sIIEU5xfkL0OYVJ/GzchnPIyoa5bmxcR9kDAuXYKK/Fk3l4PrTLmc
	o1i4fWqTSAHVd/LkfS70KZorqZ506JzpgsdY4kOstw9IoQhAueTgwrp0kqmD4wnk=
X-Gm-Gg: Acq92OH+u+wohR8wqapZBvnIDIv6Ig1kJKMzGESI9Ut8f0O09FGzUbsRU5kl/UXr3BN
	1gYg3sviWTcAWPijNoeRERvanLNX5aNao4OzDh0yOlX21M+FE/rHqYJUolwMY67Z4q+HEiJj/EJ
	Zn4xdZUUH8y5wsAZCNY4cNsyJLmpN4Ys+uYUPLYVrOxdi6QtgJRKdjsGxbKPgJWn4GJoM7UVbSK
	Pps/rBP8q+iq1W1wocC3P8r53P0ZzKGJAqe8R+mIJShDihOVsnVxxAe48C1BOMjuMi0ADJ3K7kj
	WOIMhaAwRVO6CyRiR8yvBs8XQEc9ppGiESNYb0ecB1MHCwUd8yrz5kMv0K7pLkzXcpyuyodAnv6
	S37fcaQXk0TvaqBC+8QsMWU0HPurvQ3emoqMH1FybEqWTWethD+TEkvppaGjmJQ==
X-Received: by 2002:a17:90b:5290:b0:35c:30a8:32a with SMTP id 98e67ed59e1d1-369519ffc97mr22994545a91.9.1779268048008;
        Wed, 20 May 2026 02:07:28 -0700 (PDT)
X-Received: by 2002:a17:90b:5290:b0:35c:30a8:32a with SMTP id 98e67ed59e1d1-369519ffc97mr22994507a91.9.1779268047522;
        Wed, 20 May 2026 02:07:27 -0700 (PDT)
Received: from hu-kotarake-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-369517a8612sm17079903a91.12.2026.05.20.02.07.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 02:07:27 -0700 (PDT)
From: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Date: Wed, 20 May 2026 14:37:11 +0530
Subject: [PATCH 1/2] dt-bindings: regulator: qcom,usb-vbus-regulator: add
 qcom,pm4125-vbus-reg
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260520-add_pm4125-vbus-reg-v1-1-f6d15d7dbbe8@oss.qualcomm.com>
References: <20260520-add_pm4125-vbus-reg-v1-0-f6d15d7dbbe8@oss.qualcomm.com>
In-Reply-To: <20260520-add_pm4125-vbus-reg-v1-0-f6d15d7dbbe8@oss.qualcomm.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, jishnu.prakash@oss.qualcomm.com,
        kamal.wadhwa@oss.qualcomm.com,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779268039; l=3411;
 i=rakesh.kota@oss.qualcomm.com; s=20250919; h=from:subject:message-id;
 bh=YX58XETFNrFK6fPHF1U0S0cwb54Jv2xjL5zfxBSQE9A=;
 b=FYO6JZIg/E+L4Ms/oyS6kYiq2jeQdFBLSlRnhvDrv7p0M2iNQFPuv8zj8HFdGJ1Zw9+hhAfZe
 mtOg4ctn9lzAYNngoNoCD5MMN1y/7tbD1kVd0kupDc6QsSWA0NkQZ1s
X-Developer-Key: i=rakesh.kota@oss.qualcomm.com; a=ed25519;
 pk=dFhv9yPC8egZglsSLDMls08cOvZKZkG6QQn1a/ofwNU=
X-Authority-Analysis: v=2.4 cv=feCdDUQF c=1 sm=1 tr=0 ts=6a0d79d1 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=nDMmG0lKkFKFsl1axvUA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: IoqeHeZ8hg6qmTIII6Nqb-wnbUeeKlp4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDA4NyBTYWx0ZWRfX1fd1Pm9VB/lq
 wde3Ewr6W98B10k+AqiGxn/8ng2DWE7sswq39sb+OT0zSNWxwQipqXhl+zxp8c60crPWTaQiLS/
 gdCTNYRWCrCYPP1DkyIZ2dYqAsEjFf/OYeceycB5VY/XpC7xAfQ7byKBfjWHuNfkWFGXERbmtav
 gMQREhgzGB4Wb1uMfBZPQ2BjxNS+VrIyWSuEI7zyhdYZmUUe7Y0vG9l7Zys3rCUR5noH5rkbJWH
 geot58abzxt5eZiC7V1CcQ70hwXfp1iKWlYbvtaW14xlTlQ++xwPreVa9t8BCX1lhawH/UGAyHO
 p71bJtoKnPBIO1QNDJLqB2qYtnBZjUNdRrp0TeAqIBpdXCPYmmh2Rz2LJxOFXhjcXKmuOWZU88m
 UWpBxdhMvvH0baIUJ7NJObSAeWA6k4GrqU61q/hdRzHyp0e3pHpCnerTf6LpFzpP0TAHtogziMA
 /1yFmoe2qWiBe4o1ksw==
X-Proofpoint-GUID: IoqeHeZ8hg6qmTIII6Nqb-wnbUeeKlp4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 priorityscore=1501 clxscore=1015 suspectscore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605200087

The pm4125 PMIC uses a different USB VBUS register layout than pm8150b.
It uses a 2-bit VBOOST voltage selector supporting output voltages of
4.25 V, 4.5 V, 4.75 V and 5.0 V, instead of a current-limit selector.

Move qcom,pm4125-vbus-reg from the pm8150b fallback items list into the
standalone enum since the driver handles it with its own match-data and
register layout.

Make regulator-min/max-microamp conditional so they are only required
for current-limit variants (pm8150b, pm6150, pm7250b, pmi632). Add an
if/then condition for qcom,pm4125-vbus-reg requiring regulator-min/
max-microvolt instead, and update the pm4125 example accordingly.

Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
---
 .../regulator/qcom,usb-vbus-regulator.yaml         | 50 +++++++++++++++++++---
 1 file changed, 45 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/regulator/qcom,usb-vbus-regulator.yaml b/Documentation/devicetree/bindings/regulator/qcom,usb-vbus-regulator.yaml
index fcefc722ee2a495837fedba026669de97350c566..7c74573848bcdafbf6260f69cfcd7a9b58bc9f2d 100644
--- a/Documentation/devicetree/bindings/regulator/qcom,usb-vbus-regulator.yaml
+++ b/Documentation/devicetree/bindings/regulator/qcom,usb-vbus-regulator.yaml
@@ -14,17 +14,21 @@ description: |
   regulator will be enabled in situations where the device is required to
   provide power to the connected peripheral.
 
-allOf:
-  - $ref: regulator.yaml#
+  The pm8150b variant uses an OTG current-limit selector, supporting limits
+  of 500 mA, 1000 mA, 1500 mA, 2000 mA, 2500 mA and 3000 mA.
+
+  The pm4125 variant uses a different register layout with a 2-bit VBOOST
+  voltage selector supporting output voltages of 4.25 V, 4.5 V, 4.75 V
+  and 5.0 V.
 
 properties:
   compatible:
     oneOf:
       - enum:
           - qcom,pm8150b-vbus-reg
+          - qcom,pm4125-vbus-reg
       - items:
           - enum:
-              - qcom,pm4125-vbus-reg
               - qcom,pm6150-vbus-reg
               - qcom,pm7250b-vbus-reg
               - qcom,pmi632-vbus-reg
@@ -34,11 +38,35 @@ properties:
     maxItems: 1
     description: VBUS output base address
 
+allOf:
+  - $ref: regulator.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,pm8150b-vbus-reg
+              - qcom,pm6150-vbus-reg
+              - qcom,pm7250b-vbus-reg
+              - qcom,pmi632-vbus-reg
+    then:
+      required:
+        - regulator-min-microamp
+        - regulator-max-microamp
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,pm4125-vbus-reg
+    then:
+      required:
+        - regulator-min-microvolt
+        - regulator-max-microvolt
+
 required:
   - compatible
   - reg
-  - regulator-min-microamp
-  - regulator-max-microamp
 
 unevaluatedProperties: false
 
@@ -55,4 +83,16 @@ examples:
             regulator-max-microamp = <3000000>;
         };
      };
+  - |
+     pmic {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        usb-vbus-regulator@5000 {
+            compatible = "qcom,pm4125-vbus-reg";
+            reg = <0x1100>;
+            regulator-min-microvolt = <4250000>;
+            regulator-max-microvolt = <5000000>;
+        };
+     };
 ...

-- 
2.34.1

