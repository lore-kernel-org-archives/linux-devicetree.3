Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C812E3CDBC6
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 08:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781512568; cv=none; b=ScTUZAVRvDlQFr1Lm2e/fKwwP6PdJ6hOTK7fAFn1Ej94YJ18MkYGbgyUCBvpyDfbnOO/DZasq3zsYtXYPiPEGmMSxw1ByUsw122hxeKPGzU5sl62t/6aZsecGIlecoK3xiBdyQBzZunVMnFTz6pl4RV5cY4fSLBFrxQ+CVMZGjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781512568; c=relaxed/simple;
	bh=Mh/csXgMe8/xbAvwGXq1r5Tg27UMC/uoEBfmXq+celk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YLUajhXSrSbvtqlbthOB1CjzIe9xNUBQRz/G3dXIZfNRo9dJMI5adu0YPnq8b+vZWUowXb8maj6EPZOF8FF1L071zaXuBX60Db8nyJgdDx/sGyialcN6Ail+CtSmlUiZ2l66BjmtsLcgs1pXDev4OjFCR3Qpfm50yYV760PQ7oM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ITu98fO3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hnLt2QcM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ITu98fO3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hnLt2QcM"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65F6J2j93344705
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 08:36:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	avNKz3SExU6rh/XKynzctCgh7xbdNurw/Ta/aNH0L3U=; b=ITu98fO3IenwcMHI
	dKfVni5Ud9clQSuSFPjxWCE3Y4vBzYlQ4IMYAglpEk0eWD8ZJ2MnZJLk3qOQmg89
	E1Sb+RIM8H5y4zHXflol2QDb0+++Dj6mVx1a7KIlLO2a3VwwV69eHj0GbG/H5aaF
	PB4f9YzTLSzhHrprmJmCHBYUxMmyYpkRbtEPxc+CBh+FaSGDIFdDhKwuyB5+ZsyK
	AbIG906CC4lQqbhqarXMVmBBeySBbkZleHJQwsik5xAp7EjzNhrxu3YaAHSX696U
	ISfpVoBPV29soNNzoe+UGG+U3aKkNWjSKkF+QQzXvFfrnw0e4MNRVALEaI/qdg/3
	JXl9Og==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ery9feetg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 08:36:04 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c8611b27631so2277137a12.0
        for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 01:36:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781512564; x=1782117364; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=avNKz3SExU6rh/XKynzctCgh7xbdNurw/Ta/aNH0L3U=;
        b=hnLt2QcMYoFitdX4fe2+C6bmI3mjz7ADIYNQNJVDKbxAbbbyp7RGe+g6PNchKx/Vg+
         sVSnHai/uecURaAypHRTFuvmLiuoUUdwswwdcvPT4k1Ns/VGb6Kfn0NyPB13i2LchXpC
         umIkeKSmP+ed1FK15u7g9l/3yHJp/PCJfBFDTqSjWSgMzLbY8xPBRrKrvT3At9u6pBuB
         48HgAkPGnPq+qdrVRjE4iGk9styFz3g6psJcrtrpSPY5XUDfIqA6kHYxmsNwhSlAI3LS
         0gTOsS44JMG5JK2yGYhVw4j3O7WRDnMLNzCyZtC9EpQ2Ctl2IxiHG5UMQOhA3ANNJh3I
         YN6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781512564; x=1782117364;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=avNKz3SExU6rh/XKynzctCgh7xbdNurw/Ta/aNH0L3U=;
        b=GqgpKeTkXhTPWbciYLnpq+5B9zj4xShtcA6fFRJqQJKxXzYzyY0lKhAMHK1oY0oiJ/
         gkSFxCFuvG3bHlCWgnPI1SmQxNgKwSki6oPL4b+FHH0hen+2FW43rk6z9rOTiYjUwnGA
         Fl1zp2YJhdljCXyUV/Ouhspax90dzEP+GEYQAetBDbDhPTCOTX4MT+oSgEfF2UCokpsd
         gTRRW9VP0cLvlJTH9/VrpSbJ6sYDB9v6j6Sdu4ltbuCGbD73qZsXsisZpursVBqDRd6q
         Bpzs3peTGC/jWsUOqGqlRamk/vuQFV2i39a9pyhmCx1/ALT8djD320WKQoKV7rx+zjRR
         l6Wg==
X-Forwarded-Encrypted: i=1; AFNElJ+oiUotGtft5SWSDf3ctZiAIlu3cpwjHieR3Gr+K94uqhgNAV2XUkIBO8NCBrdeEh73+BF4Nr/VSzdI@vger.kernel.org
X-Gm-Message-State: AOJu0Yy924HDtR9XZ5wZHrfVP/cTWrMh1qOCHPawnbMBxhQU45agyJLx
	Ckxo+Q1nJhNAn8KtQbQRLhdDz4cJ9xg5dyfPfT+Tij1yRyVbI54D+9DOuZpO5nf/5xEGMM/HjN+
	DkXc84SonLhEhFoEKsg8S6BGXjyD2RIk4WJV8b65+IL8ArbwPyERtu/K7yt04xtBV
X-Gm-Gg: Acq92OEbMqy4JXewFki/+pIH/f0kstjZ3hSgAEqwTu2Cez8cZg3oUpf3UL3EZ8UAuJ2
	qLPV0tdnaJ95tafhqPp9+rdUHJ0MQ8HMt3nYnvQI0sn+Ow0Dlx4Ky9QLwrYEVgp/yUNl1PFbeIy
	bDrwKiqu9CyyCueUT+26nyBP9GElunTDVpCnb9GLPHskNG8hNTCp5bo14KEc43iOMGiWRatSYCz
	NakoJFS3jcDE2ljVgg1yMenrT8zhzLu0osWZu2KSJ5VS1O+GWJAeB74zMIfJqAUcsWRzf+QVySZ
	Llmg9eeyY88jpopREEUNAvQq2Fzau2MYQcs6+GTfrI+BTE82Gap24PdoepFOeZvsdG2p90uR3wC
	5pEPEOCrZk7kS9VGeRz/72mvD9mXo2y/x7UHbAStKarc0ukieZBuPG+/d71u+UUxqb32v8JQJJk
	/HedGF8j4fxPr2Wg0sVUZUx6tfcqdn+Z06SVwIxTe/yDiEuR2keUXh/UCr
X-Received: by 2002:a17:90b:3fce:b0:36b:d40e:2cf9 with SMTP id 98e67ed59e1d1-37a1f74517fmr9264014a91.7.1781512564283;
        Mon, 15 Jun 2026 01:36:04 -0700 (PDT)
X-Received: by 2002:a17:90b:3fce:b0:36b:d40e:2cf9 with SMTP id 98e67ed59e1d1-37a1f74517fmr9263973a91.7.1781512563689;
        Mon, 15 Jun 2026 01:36:03 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37a210ad64esm9558974a91.0.2026.06.15.01.36.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 01:36:03 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Mon, 15 Jun 2026 14:05:48 +0530
Subject: [PATCH v3 2/3] regulator: dt-bindings:
 qcom,sdm845-refgen-regulator: Document IPQ9650
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260615-ipq9650_refgen-v3-2-5f611623629c@oss.qualcomm.com>
References: <20260615-ipq9650_refgen-v3-0-5f611623629c@oss.qualcomm.com>
In-Reply-To: <20260615-ipq9650_refgen-v3-0-5f611623629c@oss.qualcomm.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDA4OSBTYWx0ZWRfX4YrXbcT6z6EP
 F50rU8Gb9wNSlRU3tw51sdXYP8LYJ7zCWdqgFASkj8nd2gb2GkOPzRCtde+FcH2tE7JOjzQpCGQ
 Ysz+PCKC/p/A5dQMDzLMh/tn1OZufCmYWJ06HZaHGGLF7l4mg0SxDc+rc+IJcjBWmuX1ac/ZIXf
 E3PD5QS9lck6eNVUk99Uyt+hhnCBP0oRuNJCAkJfLWAN1FWgJJ/ys5X5xXG+DRW1WSx7LmeVjee
 c6Mg5BwGlQeKUKJxwaZ50WSXG1fLyRhR5CTX/lfRks011fKepIwZDXjXlODdUsmnUPyH1iiezei
 BOv0ypmRqGoIqsSVKj1hgjL8+AcWFQu7lp2PRdMWdt1zhlpx3C053pH62k7quEvAMdLKzzxE7Oq
 Z2XpABZFG7w9Co56U4bM+muXLSKDEBEx4/uk9gZMnPW9nP+S7QF4dD4dchKLR+PHVVg6m+c24vK
 Y1QDZ3cPlv3R7/BFktQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDA4OSBTYWx0ZWRfX6aEZooBHgQKi
 j0AKECS9NIgbtbfIXjSsMWy+ixIDKr3ZvoCCNOAVd9mbZCOobrBhQJl29OryJZEEikDecLenGmS
 zZtAVDuq7uEF/0/GNy8sj0ETUCltYG4=
X-Proofpoint-GUID: rnKl_zGpSTWeZgA7fqJS0Hr5NUajDjJs
X-Proofpoint-ORIG-GUID: rnKl_zGpSTWeZgA7fqJS0Hr5NUajDjJs
X-Authority-Analysis: v=2.4 cv=ULvt2ify c=1 sm=1 tr=0 ts=6a2fb975 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=be7_h8-LoVvd1EpECVAA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_02,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 phishscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 malwarescore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150089

IPQ9650 has two REFGEN blocks which provide reference current to the PCIe,
USB and UNIPHY PHYs. Unlike other supported platforms, IPQ9650 requires the
REFGEN clocks to be enabled explicitly.

Document the IPQ9650 compatible and the required clocks for it.

While at it, move the allOf block after the 'required' property section.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 .../regulator/qcom,sdm845-refgen-regulator.yaml    | 31 +++++++++++++++++++---
 1 file changed, 28 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/regulator/qcom,sdm845-refgen-regulator.yaml b/Documentation/devicetree/bindings/regulator/qcom,sdm845-refgen-regulator.yaml
index 40f9223d4c27..0bbf7c806fbc 100644
--- a/Documentation/devicetree/bindings/regulator/qcom,sdm845-refgen-regulator.yaml
+++ b/Documentation/devicetree/bindings/regulator/qcom,sdm845-refgen-regulator.yaml
@@ -13,9 +13,6 @@ description:
   The REFGEN (reference voltage generator) regulator provides reference
   voltage for on-chip IPs (like PHYs) on some Qualcomm SoCs.
 
-allOf:
-  - $ref: regulator.yaml#
-
 properties:
   compatible:
     oneOf:
@@ -39,16 +36,44 @@ properties:
           - const: qcom,sm8250-refgen-regulator
 
       - enum:
+          - qcom,ipq9650-refgen-regulator
           - qcom,sdm845-refgen-regulator
           - qcom,sm8250-refgen-regulator
 
   reg:
     maxItems: 1
 
+  clocks:
+    items:
+      - description: Core reference clock
+      - description: AHB interface clock
+
+  clock-names:
+    items:
+      - const: core
+      - const: hclk
+
 required:
   - compatible
   - reg
 
+allOf:
+  - $ref: regulator.yaml#
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,ipq9650-refgen-regulator
+    then:
+      required:
+        - clocks
+        - clock-names
+    else:
+      properties:
+        clocks: false
+        clock-names: false
+
 unevaluatedProperties: false
 
 examples:

-- 
2.34.1

