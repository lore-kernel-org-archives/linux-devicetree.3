Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A73D37474E
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 17:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781717946; cv=none; b=hW9EF9B6wKzj59n6yTPRwAugJgHpQ1UxoxgoYA7iCg7fGZH6O1HTex6EBLMJu3tonui8Edl1pBpsxUBTA2rHOtzZd2H/8tSFtB8HWo7OOlJB1yVLmiwaOfjIaASSSVrTGJo5ezh2kXycZUzpdsdj0ktjR6BHLjcGXnm77pCn6Cs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781717946; c=relaxed/simple;
	bh=dE6/5esF/eMPOaURmocWJsZguEErQvH5GRyjJ7XmrpQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=u4z8186YDC/Y5tZsmFjhQ5uVHOfQVpOa4Oy+2Oj/06o53Ua5P4G8XJ7fN4qoIkwWIw8Sn4CpJbheNm/MoWGEggf7osfBsGhAHJa6ZO2b7zPGen6pJORUQfa5POeJuNeRwL8HJ3shwrJ7bbHyxv+zKBMhITlwcKXhyxLISic1dOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NH1INrx4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F8GOZ1kp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NH1INrx4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F8GOZ1kp"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65HG5lDT2634266
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 17:39:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JhQGMJo/Hy8WFmRJlMLasay8E9zFQoFdfklzAuPVRdc=; b=NH1INrx4as7ovag6
	mDgzLofjBNxz9/UXAVZ1HkUij4KlGzv5vJW1S844cyPrJsvkiy/KSlUKW5Uc6Tdn
	iiCoKtM5Kj6NmmIC/ZtRccddNDppFgcMmI2MqHxwTutf9SHTqUIT6RjeehiBBdtz
	IdUZBvY/SQ5lOuujT0sWMCC/jpEDFd5XiQ7UpVNP2tam6pTYyDS/w3V8NGwhi5EA
	09VRpM+XQZLFkEZuN4QFvjpFheFQuR91bT54Z8TjndQYCi5AadubrO6QiyVS7d1N
	TlWxpBqvIrkG1xYyv4QfOcpHPyHE74zCinjt6GH96Q/ttw2hqpZaJXNFqBFAubGL
	qK1oqg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4euxt50hed-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 17:39:03 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2c6cf1126cbso631545ad.2
        for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 10:39:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781717943; x=1782322743; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JhQGMJo/Hy8WFmRJlMLasay8E9zFQoFdfklzAuPVRdc=;
        b=F8GOZ1kpR/FDyqUWgwvNXm/NWcDNtaxfoTRCmKrOu32LqFK6OjcOpmiUeegzlVlAPf
         K/JLuOywpNq3EBLBaBG37w/ybK0p+2PPMJmPX/kc0onI1QMHqYLQCIkYI8VlnBfrngHg
         ClwaWRubEEFav2sJD1j3w/gI2sU7+XFIXzxmaSGgrhnHdPa5Wt1NedL6tTJ9OFbNifVa
         RMCGGBFYNNm6YEBmVu/g6pRXBGoqOrqZocycdJ/O/5FkWUV6lhyT0S0O5kbANiE2mMW/
         7IA8vg+TbDRqPNjt6YHChhz7kuhEfgccIS4as8wb2/bjI5rdxKG3fH4/dOhBUYR6E0jf
         N9Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781717943; x=1782322743;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JhQGMJo/Hy8WFmRJlMLasay8E9zFQoFdfklzAuPVRdc=;
        b=FwSWI3ZJttyP2zmQKiLbLNPI3mzO0kKlcSL0hRDFhYWInoS8+Xn8V5hiBxTKzVZttT
         YFrIZbLFLXKwm2JUSRbI0zkqt6rWRD60RlOSC4LPj8YaJHp7tQxahPZolmqsVrQPaAVJ
         7BPGHSBCUcREYUxBSMkgcPNWC6Ja7j5f9gfaOIiJ/kpaFopXmIPZ0Up/G5GVjeu42kXf
         BAZXQtYT84/giJT2nqTAi5PtyTXwLx6mxoWQi8PdBp3yccwmMCL4KPK2s6uCh4yZyzjj
         g8+d800U5rfJSLBvpgCz0+DExqGzZ/65KFUsjcs/0/0IQ7wnwhKcvva/3TwSrfvj6AV0
         jbJQ==
X-Forwarded-Encrypted: i=1; AFNElJ+y7NWN2S8VCz6Xnv6FTBsK/vSo/MN/tTUmMk6tDb+dmKRixGhN8b7x0F+JbRQurL4TgFM9eHwQIRrc@vger.kernel.org
X-Gm-Message-State: AOJu0YxR8bO7dSsUIwi9nhI9LiKVLiy0IlFOHTHUATX4zRdZTcUtCAxN
	Lmgls1iYGJIwwaV747RhLGKQINRpM0UGrBqI+G/9qwpnNSJRDWHpnsASfgMR3hmotnO9NF5+1gL
	xkZIbtFeF1V6e54ks9STeg+ZzPJrju4BX2J+UzqzHt4rcLhPlVcQedeWXOeYOTbLb
X-Gm-Gg: AfdE7cmniigSzh1duhCsyEpJdfvRMBSjeQwNHOwWt+YzUWEE7+dbQLlPeIPUsiISWDy
	iZcKE2AQo8fzdEguF2K1qLoBKEaue0/PEKaU3Dy/foNCEDh1RRRDWp+2n5b3EaZnUObDxBPQZJM
	1jZIpzIh2YZX+Fer8Wnzo/9tHhFK1RMKU2ArGCBqcDE/82q+PTpL+HqVM7so1KbGCifR/pyOQjh
	SHohyL0JCwhlcAdiYO8K5004gYEIFha521MgOV+tyZHVlCEAESSEi7Wv8JpOmD/cne2zFjeGPah
	xnpeMAMIEfYlI1W7JwuFrjGxo3s2wtDX1Y7Go5H+3pTeut9fghakqQ//cv1UF1tvz5uNt3nc93x
	0Vi/wsNz2ozBh4cBQn6w0rvl/Icdl2dIlhmFBKr9BUIoaKlvDxHRDe+VC30Klgs+CDmavCSz7w3
	IK6TUIolbAmbzoSlpP5JrcN9pKSmnuFyPc8r0pVMbcviSZ5g==
X-Received: by 2002:a17:903:986:b0:2be:1c3c:72ba with SMTP id d9443c01a7336-2c6bc21012cmr47168575ad.32.1781717942683;
        Wed, 17 Jun 2026 10:39:02 -0700 (PDT)
X-Received: by 2002:a17:903:986:b0:2be:1c3c:72ba with SMTP id d9443c01a7336-2c6bc21012cmr47168325ad.32.1781717942271;
        Wed, 17 Jun 2026 10:39:02 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c433369c8asm173973215ad.73.2026.06.17.10.38.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 10:39:01 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Wed, 17 Jun 2026 23:08:44 +0530
Subject: [PATCH v4 2/3] regulator: dt-bindings:
 qcom,sdm845-refgen-regulator: Document IPQ9650
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260617-ipq9650_refgen-v4-2-c505ea6c6661@oss.qualcomm.com>
References: <20260617-ipq9650_refgen-v4-0-c505ea6c6661@oss.qualcomm.com>
In-Reply-To: <20260617-ipq9650_refgen-v4-0-c505ea6c6661@oss.qualcomm.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-GUID: UcuW6Kc_FOXtCfF-3aBkTl1BliDnDHGC
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE3MDE3MCBTYWx0ZWRfX2z6QsLvEFugs
 ovGPNMt2L+3thZmKRODeEh8EDSosr6XxxtqDS+eEAbsoZ3hPp/PA7W62Zy4CVH6qgVf/cSYREXh
 PqbKXOm+4K2MmuRa3eaeJ1GvFMRp+ds=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE3MDE3MCBTYWx0ZWRfX27WG5D4qbnOL
 P9SzQpyw6rG9pom50B1cWjT2BaGmLAXdZg+tSsdZvcUqUqez3CGEzjsLHkL0B8iX/H0dJ51tRKk
 OPJqm5qEIbf6xVO4t1Xusb6JL4gK/z4Sbqr+FOqxcWqAH1ZuJKUnjlwMDAxrvWRQxW5kinrvpOV
 hMN/u39ReJOHa0XUEm6nWp9DRlOplo9O9+L6iVVVZL10l2pbdbHCsVznxgCbFHRyLt9OWGdJzaz
 soQfWsBADGoalnpgGq/iHfClkMZBL2a32nostwS4uTX065jJL1R1Z690n7oYW0lCOgx4yBFjym0
 ekXXeAnazy0dn5tr+orwVL12k+EB6Mbvnt8zBeELVMNg71lPPW/pO+Xpvk1lBNt0+teMPc9xmGv
 99yhcT4tWZhpAEyw3xPeHP+9vdUGl+8xIcdu1XMR0vqG2f5ukvq3x/qgnEs9gAXrfWhXG853UFy
 5y+zJCJSSMLbmwL4SRw==
X-Authority-Analysis: v=2.4 cv=PMw/P/qC c=1 sm=1 tr=0 ts=6a32dbb7 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=be7_h8-LoVvd1EpECVAA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: UcuW6Kc_FOXtCfF-3aBkTl1BliDnDHGC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-17_02,2026-06-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 bulkscore=0
 malwarescore=0 impostorscore=0 spamscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606170170

IPQ9650 has two REFGEN blocks which provide reference current to the PCIe,
USB and UNIPHY PHYs. Unlike other supported platforms, IPQ9650 requires the
REFGEN clocks to be enabled explicitly.

Document the IPQ9650 compatible and the required clocks for it.

While at it, move the allOf block after the 'required' property section.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
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

