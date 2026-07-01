Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 951D841C2EF
	for <devicetree@vger.kernel.org>; Wed,  1 Jul 2026 10:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782901716; cv=none; b=aC7VlZB0Gk71N4d83TsMkm8DiOZxXgRF2IWVwSbQYVUALqNi0UTe+5cX+NBem2nFQZazOTwFr0Ua12ODGx9216PuZhWTg/h3jWqP57xFJBgN6YUJUqElfj4pvd8le9fLYB04Uibav6cGozqYDrk59SXwUJLjb6398OedkGQ+J/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782901716; c=relaxed/simple;
	bh=l8QfYoFSstIExHnispTOUZbqovMeqrNg7FKcyIklooQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MQ+umIZdzjlqS1idASRytvz6oDLxnX5aRMl7i01vyhyj/PBGvpDp+25bleHvc+k3JhVDjlK5RhhJY/8ASjs+AHDWB1x9gMRIBmfyQoSrMWV2k8IjQ1SnI1OsLfbENdBCysNnp61PtpYKSLhH1qBGzSb9ZOZVrpaV7UAuJmgx6ps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MWIRlnAA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZAj5Cc1W; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MWIRlnAA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZAj5Cc1W"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661A8xm9763108
	for <devicetree@vger.kernel.org>; Wed, 1 Jul 2026 10:28:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ONKy4OXlaFS+6eH3rmX8NTr5xpbMTHPRAg5dd1nBsqM=; b=MWIRlnAAQVxWDqWn
	kOztpenJy7YSKrrT5tHodKNLQl4JAO40fiKL1PUW+s4FJPeGN47yucfHaqmow9J4
	eZnbTWmap+1Ab6OLHm9Micds7HL4hTceEJ0KOSpaLjsGFxAw8rIRfl+T4z6OsY68
	sxX7oi49jv0By/w/69dUCGzRdtQ9wpYKneM41w0LUDqjhw7C9F4VCwSMFwBndtUw
	sN/jr1Jzryh9+bjcmrXMolj8+CBMeJlRO0y/fFAvG9MFSVg5yoOV9Z4F96mr5jN7
	aiOE4Ybs3n4y2XyCeL3weqGmdWnKDU6NF3WSxPsEXpI6tihLY9fd4ajx0HxUmOen
	tKQ/wQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4jktbmn9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 10:28:32 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-37fca5f21b1so1211023a91.0
        for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 03:28:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782901711; x=1783506511; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ONKy4OXlaFS+6eH3rmX8NTr5xpbMTHPRAg5dd1nBsqM=;
        b=ZAj5Cc1Ww0HHWCDc1Y1jYUeY1wpFEUdd+JIjSBHLRXKQl/fSQA/hRkHbuadjZfU9td
         /gWjo+8Afqse/MrUmGKkwR3YcEfVL4h/C+x+znj2AaKSHi0Lagu4x3EhhfTXBgIZY0ou
         fC/oONkr9gL4VBjEOrnW9sIJX40FURXMGXDdhN2OoE3V4yPtmWhzHUJbbBJCHAV/W4UI
         aBnGef0uxKLYAvoI7kKlchjTTbdXYhk31h11w9ynfyQ1wMrwNc+oEeeZ2QvUSrIhvmRV
         tAkBiQYwsz/wkTtVnztqdSVpt7w8JkWYd4o0xgBDHfLNClRSWeH9dVwfHPeUxntSfV6X
         GE1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782901711; x=1783506511;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ONKy4OXlaFS+6eH3rmX8NTr5xpbMTHPRAg5dd1nBsqM=;
        b=Acdji7PiVX50Cz3PBVOswPM7lBsueEOFYspelUlu2usOAPvlmCQkTK2j7q9U0lloH7
         pnU+awmzKCww8o7fMun8WMvNbjZzms5Nqj5kx47fFY3emPfmBYJ3PwNs8yBqHYm5dkqT
         ZriAd6gC2JMFlQZ8oujrpNiqDRr5cMBm9UpQUQfy1YNtIWKon14+7+a2pDS9F6glJ47o
         IN3qhlLCbSnb2rj5UbM9ctEg5qDfFwA3bIeeEeNoNYUY48sJKDlQksHtH4Jqz/9yrSdz
         3kmx8F23Va6rTxj9cVm0U2RHwII6LDS98NAnoOPsI/2+HUK8XtZTV53p0d2HyLuufx9b
         6/vg==
X-Forwarded-Encrypted: i=1; AHgh+Roqhs00zs47fISCoU1/7Sjiq8qHkzSShySeKbWXbb4zce0IPllW91bRn80GkU44IMUIwiqkRoT1dOip@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1yS9BVa3DIy1UK0CcGKpepPykKScBXNGNei4HAB1XvXGZf6cX
	C8hlNDTBKrX2Hl5aqktI7Apin+yUhXlgn0AOaBm3TQEGt2ZVcr0ldFobRyVimfFnSrrEvher0xD
	Ax3OfCzI0DQ7SbRr0rv8qBw/Y63UtuuBH4EHu00opEjTFFyK3oDZXoyC8kW9jkMI=
X-Gm-Gg: AfdE7cn9Xs7mikCMi3GQHG+O5ClRcea0sijCDrcVVBQ4Yar7lfsw+tRtzYclGZdkpSs
	yzVVnH7kXhhgjYOrwGw626CaIC79kNJOt35iLMIa4RfAgAWS4esAWfnn7xcrkDQLz9ixgpSnkWi
	MpKvU0iKfXEcq4bpQZIdwHQPG3jlEpThAIP8qgX/gjM2PG5PCcYByTAZxBCskd7zCNUPdp/0rQq
	69vmNvBZUM4SMKSTW4SLTwGiZ95BXOcH0P57+dDYAnopZvTepq6dNnlV+0xgGFMef2rflbOQ3bz
	LkmhWmXoHL+TjHEmTJdBbvWF7in2zpQlVzrs3yyPWLgej9lW4d1N4yuM4/xnpZeVRTPU9IVRwWa
	5OXjJZMb51DYVzL4uU7dxl8KHWAS+puDSlobfxUyy
X-Received: by 2002:a17:90b:520d:b0:37e:cb9:fd7d with SMTP id 98e67ed59e1d1-3806a04dc16mr4781754a91.17.1782901711288;
        Wed, 01 Jul 2026 03:28:31 -0700 (PDT)
X-Received: by 2002:a17:90b:520d:b0:37e:cb9:fd7d with SMTP id 98e67ed59e1d1-3806a04dc16mr4781733a91.17.1782901710815;
        Wed, 01 Jul 2026 03:28:30 -0700 (PDT)
Received: from hu-kotarake-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38095d2a0f0sm1658103a91.3.2026.07.01.03.28.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 03:28:30 -0700 (PDT)
From: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Date: Wed, 01 Jul 2026 15:58:03 +0530
Subject: [PATCH v2 1/3] dt-bindings: regulator: qcom,usb-vbus-regulator:
 add qcom,pm4125-vbus-reg
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260701-add_pm4125-vbus-reg-v2-1-6bac2bac7131@oss.qualcomm.com>
References: <20260701-add_pm4125-vbus-reg-v2-0-6bac2bac7131@oss.qualcomm.com>
In-Reply-To: <20260701-add_pm4125-vbus-reg-v2-0-6bac2bac7131@oss.qualcomm.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, jishnu.prakash@oss.qualcomm.com,
        kamal.wadhwa@oss.qualcomm.com,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782901701; l=3411;
 i=rakesh.kota@oss.qualcomm.com; s=20250919; h=from:subject:message-id;
 bh=l8QfYoFSstIExHnispTOUZbqovMeqrNg7FKcyIklooQ=;
 b=KNus1HbOrtmvPX3NEk/cH+OaYK79g62PBVz1yjxVOjSlFGWX/Sdr/Mde7T/KRtkOksrVeKNaj
 Z5BcgwDmVf5CkswhnR/4lwEeIvFUnHlpYneX5Gdum1BxbM8hgjLR05w
X-Developer-Key: i=rakesh.kota@oss.qualcomm.com; a=ed25519;
 pk=dFhv9yPC8egZglsSLDMls08cOvZKZkG6QQn1a/ofwNU=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDEwOSBTYWx0ZWRfX8kpTsPtYFMkV
 lByZrCn6h0YwdH7NIZisJlqM+/YBCk6DSamyoUbT7z440lnzDtqjdI26bfRVl7abYG3YbX1S8hj
 3pkJrOYlibMwaurB/VVSXVJ6nkQrnFA=
X-Proofpoint-GUID: H36KnZ77m-BsR-pf5RljB8FCY83JdV2p
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDEwOSBTYWx0ZWRfX4Ab04SG182rI
 WSiV5cph1pilmIw2VEIX8jp/b60KX3uVngUuiqdbVVIbUeD9s0uldbBaeE0liy1ukbw3GJczLij
 YRt8rlDNUv1K53VGNA7m96yv/xgl0yKBKg4wkzVxW10rNh4PG6JBGxhVdE1QHa7yLgJaP5l6wm7
 MuS2iW/TNQSp6KdvIWWmgUVO9YfBNvnOfzFkn48tAB/aYxfY1FPZ0XFt+EEu0Zlb6mwLYAXmwYk
 02386PMX4uygLZ9HRgyW5FMXDMnnMoMtKyOrjElx7WqeUZPc8MfFy8uDE+As/TvRqYRQ2EgVy3W
 WAhmZnZgLS8a0I0pzzGrzqfVFh3jb3MAVUxGfIokIIFLIS6z5xyj5pWwqR1uiwJb5C0NJdgv+vp
 fTdSwJldNAmfCoQsXmg2HbJhNoJ5LQKFoTt32DFWBH2Re0J2CIvZzuiBpSidM5h29hGVNpiLoqP
 78ZJB5eVz2vhK9NocgA==
X-Authority-Analysis: v=2.4 cv=R+wz39RX c=1 sm=1 tr=0 ts=6a44ebd0 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=nDMmG0lKkFKFsl1axvUA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: H36KnZ77m-BsR-pf5RljB8FCY83JdV2p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010109

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
index fcefc722ee2a495837fedba026669de97350c566..024b34d0eb1a694b9e0ff530a35f787582caa425 100644
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
+        usb-vbus-regulator@1100 {
+            compatible = "qcom,pm4125-vbus-reg";
+            reg = <0x1100>;
+            regulator-min-microvolt = <4250000>;
+            regulator-max-microvolt = <5000000>;
+        };
+     };
 ...

-- 
2.34.1

