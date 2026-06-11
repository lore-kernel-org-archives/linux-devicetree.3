Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99AF83BADA3
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 09:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781168613; cv=none; b=iUcH9SDwg3twXURSsvnNR/Ey+s+DIucFnENG9vaFBZE86BjbnhnWHnH5LemRb6fyFAr3+9vT1hOR9a5XwtHzQ+RxXGwSfn7IsJbYw3JH6FQUpA1XMWOolMzKs2gFgTmwFL/3K2tGb2ZStrN+M4wN5M1/K6lrVpK+u1tlLJezf2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781168613; c=relaxed/simple;
	bh=qh5pRZnX4B9uijKs73q1IgZX/KhVoR40uSi6HD4HkzA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KBg/gcZAW5QraifMwH7APo4jq8wL6qnXXYNtWHK43Lii0UOlBL7BP8ROwtL/UdfSAE+i3zLzEOOskTtEvkxIH0QqUITitXXNox8eqbVWFAe7xbHRRKRnSQLs4yy+0YWoLr209vxA3tJ19eWpe3AQ1YZV2nmqExdIg6d33GYoxBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S38DtYPZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QI05Hx4w; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S38DtYPZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QI05Hx4w"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B5GUpT3846399
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 09:03:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DmZ6rmoSlBk61fs7laKykC6O/JMmRx/oB65jdV2lrCQ=; b=S38DtYPZ7J7AeXMK
	PlEy76o/QoBjhl1qFOWL0mYLXuzydcDqlL7ugD8vviJ4I9SkTFOJzZK6EQt08e/W
	AeLifv3hx7p6TR9p7uyoYITDXrZ8tsjmOFxstEv+ihlq0AZtDqvex3iXlltZ1vQL
	terjaDM96FMXreT7ZZBAMNLLMosLeF2wXG8u70D6QCNCOqeh7QIpv+4McfzhVBCL
	XfQR65HY+Saf7og50IRV8o0GqJ56udTFQHmTuph0f+aUuxmjtT/xqWTR51038Abl
	IciFCAD0G7AumBXLeqxlGEuFr4f3RJ13rNba8/gVYExc1mSQ5kNuO32nHhmulym/
	Cm/Trg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe6u2k8f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 09:03:31 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2c0a99db8dfso82859915ad.3
        for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 02:03:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781168611; x=1781773411; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DmZ6rmoSlBk61fs7laKykC6O/JMmRx/oB65jdV2lrCQ=;
        b=QI05Hx4wrw9XDjUvGrXBqVNdNnPWjVkQf/I4KW4l9uUwf4vhuncpI5XCq/gyeWXpSW
         Q5dxXje5uhlRgpcyQStR+8VO1PhzFkIzeXZQfaTaZZanzjzICFLNQoOG4D0HnGUbpPQU
         ZiPpw4wjZj4f/5nM/PTdUj97IKa/Cmp2x7tLuMvF9BELV4jViGnfZ2zQNFutE7q3x2bg
         BlbJNkAFhQcVyntKFRMNQS7eC7aAy3Cz/HOCrCdti3DRItjUdtopQdbHhdRQZf/dphcz
         /n8CoWGj1SclLHxE14x9Cc02QFiG5h0xU8zdE3KlVenVRNV1Oq/JgPDBx/5V0R58d4jY
         uc3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781168611; x=1781773411;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DmZ6rmoSlBk61fs7laKykC6O/JMmRx/oB65jdV2lrCQ=;
        b=bJiv0v7ZusgtxqcDIcR/UOczxRTjBZahpiSWcaQg+8yXSS38WS3KvkdBlwR5oEE+vk
         f6nS5VroncpYHXvxC1xsUL0MK9kwiZtUpj6SB6WRJ1AJ/eEz0akefsOjVgWMnoZwWOR7
         RNfWtHkr53kacoePUKn4K5n5xfMxtb4g7WG4hl2phr1psBrvn5wa5RGEr10EZYvgnMOi
         C/eY94hbjLroJG4ipOygrRYWL0vTHN5ltZhs2U0pMVJ9Yga2mb/5dfz4FZcxmYm1IJB4
         gg0PnuDL3uGf0QBBi0T6rP5S+PYwZJKnv1ScbE/3hH38a5xJY6yfsqwn2woQwyeGKkNg
         /o4Q==
X-Forwarded-Encrypted: i=1; AFNElJ8MPtKhhFch1csGopaPft1jS+0Tyz9bkQdqIIVeDllNg1aDWEKB+9AycjzJKA0wf54jJy4Z2O5k7eV/@vger.kernel.org
X-Gm-Message-State: AOJu0YyUTkCU5xa/JtWDLHvGVc3c0F9Dr/0ZtN92fx+EPMT3j/Ac/Zgz
	Cpj0UT0ufcbNbjQKo82WxJy3R+X5O7jGmsHdF3ft6JI7N/NJTERXQHnBtEFs4uEmDGcO5o4E6om
	9WXguxvGsmW6+7FMIbg3I+nTXUG3tnzEkPllWY1aDywuhGHwBjqtMN3jY7cwoTI+0
X-Gm-Gg: Acq92OHbvg1b3iU8Q+VuUWRja6oVMmATPVIIKOsHQybymliyZVevGSpB6+NYtj0lKHn
	8F7tP7w1+N2jEkTz0S/MBwfOw/ZFf2HPHrwAb+TbafCOHeIvfbHJ//AhJeqIWenzykEOyMvr9Q8
	A2yYjp1FtL4H+B8GVAH9IloTgTjI8ig9DlfE9QSXclNF9rpH6Q5EObCUF3wDNEkHa4Q6TuSMJE/
	s15EZ/DYl6GPx05zHB7C20pyoxXz/1c7vqlt/lZQRI50Dfmh+p/U3ucW3lX4fIT9GSlOKZhWIFY
	z2yZ7UZQ027lKzrBfblqtWMp+uENUp5q5oKbB2VwmuN98P3LR1zi4J2XL4aJAl+cCRikBYpHKZv
	+KP7fEDt19Rb6AuUir/wimuBho4Z7lH3JrhnOL3rxQqdj63F3Ilu7PKasdDVu02zvO8OTxCsWYI
	6AHmqoIFLwA12LXHpm3O/iz6/+tMloEFHIv0a0ujPU2hPKkBBWSlFD0mLmPbXHoM0kt7Q=
X-Received: by 2002:a17:902:cec5:b0:2c1:ea95:8297 with SMTP id d9443c01a7336-2c2f005e44bmr22111815ad.7.1781168610577;
        Thu, 11 Jun 2026 02:03:30 -0700 (PDT)
X-Received: by 2002:a17:902:cec5:b0:2c1:ea95:8297 with SMTP id d9443c01a7336-2c2f005e44bmr22111245ad.7.1781168609981;
        Thu, 11 Jun 2026 02:03:29 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c24edbb49bsm140980535ad.38.2026.06.11.02.03.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 02:03:29 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 14:33:17 +0530
Subject: [PATCH v2 2/3] regulator: dt-bindings:
 qcom,sdm845-refgen-regulator: Document IPQ9650
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260611-ipq9650_refgen-v2-2-d96a91d5b99e@oss.qualcomm.com>
References: <20260611-ipq9650_refgen-v2-0-d96a91d5b99e@oss.qualcomm.com>
In-Reply-To: <20260611-ipq9650_refgen-v2-0-d96a91d5b99e@oss.qualcomm.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Authority-Analysis: v=2.4 cv=PZPPQChd c=1 sm=1 tr=0 ts=6a2a79e3 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=VjL3xhqMjkKYvgIonoEA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: GeHFI7-M9O0LHS-AQOv-7-vWiYYBs2a6
X-Proofpoint-GUID: GeHFI7-M9O0LHS-AQOv-7-vWiYYBs2a6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDA4OSBTYWx0ZWRfX0ZdN0Z+9KDoU
 hWoNQb7VeZRobOCdc3U9Vb1YA1BvYobD/D6dZgmS7skl0RYhj30Tw0myTdIefsaYM+rW9b+XlSK
 TtEmSNXVkt4PnwQydKfvpLvssxhPmY30ixj/mxfQlP2OLulRWUzMes6WNWzEIxH2yj356yUBHXA
 0AeU590eD2GlQgjNul6LhTx2fMM2km017MpJueAwBk8ExLob9YUgdVfYsx6EvXmBxqVb7RhKDoZ
 w2rOXNmDEBRqDqxo0RMYfHTf8Oox4ocp3y9TuulTVsfFOSvQlDYmrHNReTZaYGfnc3n3nuaug6Q
 K13rI0gf/xvdQqpTwFZAw3t2i13xf/T0VnS5irePRZSs6cpwijuCAJMcyRbGfArn4FCxBEzG4f7
 ybMZmkWgKGhr+Mcvm9LSKJ/b7+rjqJzz3Tsi0S66+XzhQ8k+9ejodINiGYuWOblb0T4Pq/J32k8
 3oyXl+Sdd3QVltdWD+g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDA4OSBTYWx0ZWRfX3QPIurRPgjac
 /33yQNDMNC/m/k5MRKU1se2VYtM3JVqagyR4++B3/H4Ja/+EY5MsJO6eA4IxXGbNpiVnWlwulVb
 MMBTZ8HxSPikzXKL/GbdgWlVPMvp3yw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_01,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 spamscore=0 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606110089

IPQ9650 has two REFGEN blocks which provide reference current to the PCIe,
USB and UNIPHY PHYs. Unlike other supported platforms, IPQ9650 requires the
REFGEN clocks to be enabled explicitly.

Document the IPQ9650 compatible and the required clocks for it.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 .../regulator/qcom,sdm845-refgen-regulator.yaml    | 25 ++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/qcom,sdm845-refgen-regulator.yaml b/Documentation/devicetree/bindings/regulator/qcom,sdm845-refgen-regulator.yaml
index 40f9223d4c27..2016dd7a0bdd 100644
--- a/Documentation/devicetree/bindings/regulator/qcom,sdm845-refgen-regulator.yaml
+++ b/Documentation/devicetree/bindings/regulator/qcom,sdm845-refgen-regulator.yaml
@@ -16,6 +16,20 @@ description:
 allOf:
   - $ref: regulator.yaml#
 
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
 properties:
   compatible:
     oneOf:
@@ -29,6 +43,7 @@ properties:
 
       - items:
           - enum:
+              - qcom,ipq9650-refgen-regulator
               - qcom,qcs8300-refgen-regulator
               - qcom,sa8775p-refgen-regulator
               - qcom,sc7280-refgen-regulator
@@ -45,6 +60,16 @@ properties:
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

-- 
2.34.1

