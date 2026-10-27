Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793104535;
	b=dYxAIRxLs3/vBzeGny+i53kzs5Lhe0Dim1OfoEhPuZ5cn4Q1K5TjErMRdH1YF9u+Qpol
	 UrKSaRPr0JmQBhy5ZTUho7qVfQlTXZ5boynFfwkj3sjgDSRebkkYeAooY3nh781/8VuJU
	 r33rY0kybdLk4VzSJnv4FIGgJHdlYvoazWT0pTjUuh3QGhBLiIGVKp0CqIPwtper3XgiP
	 Fu2gq1lBy+0dOubq5CDcBIl5dP+sCzo57mAq6Is2dWtuKvqPaJbaSaQxBv24C1v1LAKE3
	 rFDL1/5T8H8CO4XPKkiNL+0ZCuEgLieMjDWDE27vKj7eHhKcbq+RIeCKQp0isRFPgRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793104535;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=LNwvMt5gjfJinQ/wSInzrkxOYi6NIM+HIlhbrr/hDqk=;
	b=5XGzvNy2pLFn5LJzNjtQWSf+8Yw92DOJU8lazH879vcF9jfEJEeqX25Reelkl4S7gIKf
	 dac2ZMPBm77YvqA8NorRzCfxPaJCifu/ns9/SqaaNN+yibMYPJsYvS1g8uBR21KtebxOW
	 MLikM0jA5aY0tFLS2WvExApmB2QV7R5nF3dUf5kTKBTnUCMhYmj4i1jWjDztKPPUEJbGc
	 gF6UY5W5KzaOT08sx8vJrtaNLMniUK21ApuaQmu5SKqZSVLHfyYvjIe4K38hu6TWAdT0B
	 NIQBKByA3MMnrvhyYA1G4E6x15kbDYRHSP/f8M2W3RySzzg4vgbtF42oyMubhnEg5wA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="VX23Hm/A";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=L3wWuJ1U;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F0F260A2626
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 12:35:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F0F260A2626
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VX23Hm/A;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=L3wWuJ1U
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAeKcj1427437
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 12:35:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LNwvMt5gjfJinQ/wSInzrkxOYi6NIM+HIlhbrr/hDqk=; b=VX23Hm/AGO4aelxK
	IJMOWvVlw1Edx41mxYk780SdWu+DMYYv66O7Eho0dIwCf8Cu4ek0NcLgalu0j2yg
	COYOL2RlvVR3SZJyniUqBgg2H/G2TYfZzQBHy1w1nSqKf0yc3S3RZAXYZF3cXyTy
	GOJNIAQpIgqOtL0B3PF6ED+/fBnFVedu9/4IbAgvVfV55ZF5si5IZw+ohWkf9cDh
	HOordz+58Q7EApi0Cjs/xv/UI+DgRwgZ43gdld+Idk7a0PEB5R/deATPMe0GGfUH
	F0Sdl4ChByRs/1M7XKJKOCc4m/th9xMkXb8+qjQDNShPLDRr/04bHDm/FyDTfsMw
	Sgr1Ng==
Received: from mail-yx1-f69.google.com (mail-yx1-f69.google.com [74.125.224.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjbmmbkap-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 12:35:34 +0000 (GMT)
Received: by mail-yx1-f69.google.com with SMTP id 956f58d0204a3-67682d4d684so6968020d50.2
        for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 05:35:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793104533; x=1793709333; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LNwvMt5gjfJinQ/wSInzrkxOYi6NIM+HIlhbrr/hDqk=;
        b=L3wWuJ1Uhnj6x2pKj4yaDgMSxS1pl0b399jLb1/t5PUnOlSqMI1NTHn5GBedAfnVUF
         FKVD00MWhB+r9DyTB2H2HdJzfVPl7SqB5jNHRJo5ji0y6WgYkFh/Y2eA5RWgQKGLCYqY
         nvnIzsXvdML/5GK/llioB8BPdKFKF7I9yvMx7DkYHB+WC2jo/VaSzXFm0QwrjpWg968Z
         7uHFkHvw+e0nSQk5HgzsMVPx54MRbfEJKOODjK8m4ZL+aTDgYsF4E4JiRpW63W87hjgI
         b1O68LNl/wkWIC9+qwtgsJG/6MaOlEXPpe4R17bkuUn3H8FcD8YgOOzhL0v3AnWCd11E
         bH9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793104533; x=1793709333;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LNwvMt5gjfJinQ/wSInzrkxOYi6NIM+HIlhbrr/hDqk=;
        b=DGyuJWW8dRnu/IiB6qisAKzobeLPdBa1z9q763Tjf1BvPIZ1rAhFAFJP5O9adg38Nc
         7+Jz3oRNPsSH/wxfb5x2NDtHp5HyxCF7SygaUrtnNqTclADAKt3z8eX6e7fDhV9yVNKf
         LR0ZaD+0tjsCj0hfI27yl5EKwgCvnnylUpP6ay4z0x08Mu1p0sEkWBrOIQOaOjEUzH3X
         Yhh7W7A2FHSaCxhWtV/HL8tg7HOFSETWULTjJrMfCbV0ls9SLm+ntip41H87LmEUL5x3
         ju3fEzG64MHdw2pFVtP5e9hep1UnAEJWPjiRzFjDRBsks0Z9XBdPQ9B82gN7d132U1jw
         FGxg==
X-Forwarded-Encrypted: i=1; AKwUvBwetRoY/qtvQP/mrXFPt27Q3yii4GcJcGs8mWk1kfYaVc+7feejCJAeblsgjozSyHjeTPrNJ00r2Wwc@vger.kernel.org
X-Gm-Message-State: AFq9FYJ4mm0ojkxPF8PkQKIEhFSvki32W8QoQ4agr/rmXZU2TaPoth48
	BLvh12Jrt9klGg5UxjqzkNV1lo1H9egruK/k9V0RqNM0iazy6OEGr4WR5cQPHpfQCIYrqmnFZE/
	8fg5XcBtkBo3+jtWErlSYoxRirK3HEdleIp7Tw6S7PDfxE3GzfFnoXErJBr8G+xW1
X-Gm-Gg: AYBFou2KbDDGhFuNpGP38ZGTjSu5xF620AdaonjX9hxlZl28gwsJXVEhBFaBHH3bvfx
	XkXFbtPTNHV+CXegBpeOA1o8Bzd2aXnuDGAEjyEZmznyG32j+L09UKDEX6TBamqzg98uF9e8P1J
	4RftSbh6/wcq05YMmJpBMP88OI9WJSJQEQEvR930NepZi7wgEWpICp9LaoI51JQw8vInBLoC4zQ
	yCGrfswjRK4c1iCFuUfzZJ/rCsg3YfwX96kAtmV76zHcDW5WpglmeTC0Bd2kQaTsZiP94hZFQlm
	IUWhcSdTMKykBUV2w5tzpd6UZD+jslChaBG034PAErAi2210Go/10un6PI8jDqgAtmOnqrncade
	8+pl9TTyaujSrFWRvoQ==
X-Received: by 2002:a05:690c:e15a:20b0:8b0:b52d:4e0e with SMTP id 00721157ae682-8b166b69836mr43735337b3.28.1793104533314;
        Tue, 27 Oct 2026 05:35:33 -0700 (PDT)
X-Received: by 2002:a05:690c:e15a:20b0:8b0:b52d:4e0e with SMTP id 00721157ae682-8b166b69836mr43735187b3.28.1793104532917;
        Tue, 27 Oct 2026 05:35:32 -0700 (PDT)
Received: from [10.213.109.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b19e57d131sm10413507b3.20.2026.10.27.05.35.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 05:35:32 -0700 (PDT)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 18:04:20 +0530
Subject: [PATCH v5 3/4] regulator: dt-bindings: qcom,rpmh-regulator: Add
 debounce delay property
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261027-regulator-off-on-delay-v5-3-f9c3b128c6d0@oss.qualcomm.com>
References: <20261027-regulator-off-on-delay-v5-0-f9c3b128c6d0@oss.qualcomm.com>
In-Reply-To: <20261027-regulator-off-on-delay-v5-0-f9c3b128c6d0@oss.qualcomm.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Saikiran <bjsaikiran@gmail.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793104512; l=2793;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=SkU7A3R3m4sw8tWJhnTvVEYAWww3+TtNojEuitZAp4s=;
 b=qJmtjaVNa8jv2KFepU0XpawCcRysOXv2cRSh64uRpTXnmJ+BmwrOq64bK4KncXlYiAxeP5i6Q
 QK9IQSOkMxwARHafhkxG/xk1uJgr3ZNPIolDb9/5OSQykY3W2WbciTQ
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA1MCBTYWx0ZWRfX/7/J4d54QlwR
 A0S/Jb3uZbkYSsAVAIq506qSsH8RBQay916kgjJGTwI+zfeMafSm/dQvooZLlM6ETH6SRjjJnHD
 v/EpOlukDzrYZgWPPsRSBQxCguLeXqE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA1MCBTYWx0ZWRfX683/7KdeQ108
 s0enX9wdKfjRGo+aZHUxi9kFhzsNhOMEu5bo0StgA0Z3Kx1lFDz2IK+rysgsFSQfM+v5dGmBUsj
 wzFxb5vdQmoyngQIGTN6h1XNc45EeA2yvX5kb5f0FK+NMMvM4R4R3frvdV8oAOr6spq+Qkt0bIK
 3+Tm+JwAyb5WWRn/eSoMvbzPwI/HwtUBgdoSp6B4sov0ucjfrPqiClDJyQCKuzKQcFKBLEcJrvp
 SrUJNSZQR5L37+4kRdjjddsCaBli8aPOExNi3MOq9UJoHt1jPaVMot3D9+REvS17GB9eNH7ByB9
 ot9Gt0gvSh8Ceu7rUCmfFHDUuqWnU9ZEUuSdqxzqMGM6xYhHQb6rgAzhyybio6kCMs2WIIwRyh4
 r+98uwqKkXfPZjGtvw3M79t+QNPwgsUSw5FKTPx/761N4sTgmsW0XG85SSyYoxnGS6RLkauMDsY
 LC8fgrcfbKvjM5cvXuw==
X-Authority-Analysis: v=2.4 cv=PrkG/AM3 c=1 sm=1 tr=0 ts=6ae09a96 cx=c_pps
 a=J+5FMm3BkXb42VdG8aMU9w==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=fIv7m2FGvZx8uhHzWWEA:9 a=QEXdDO2ut3YA:10
 a=Epx66wHExT0cjJnnR-oj:22
X-Proofpoint-ORIG-GUID: tjbOw_TpbsiemnxXDAxpW_LuV5MpdliN
X-Proofpoint-GUID: tjbOw_TpbsiemnxXDAxpW_LuV5MpdliN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 impostorscore=0 clxscore=1015 adultscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270050

Add 'qcom,regulator-off-debounce-delay-us' to describe the time to wait
for an enable vote after a disable vote, before actually sending the
disable request to RPMh.

Some consumers toggle a regulator off and back on in quick succession
as part of their normal operation, a behavior this driver has no
control over. The appropriate debounce window to absorb this varies by
which consumer(s) are wired to a given rail and how they use it, so it
is exposed as a per-regulator property rather than a fixed value.

It is placed in the qcom,rpmh-regulator binding and vendor-prefixed
because the underlying deferred-disable mechanism is specific to this
driver's RPMh command handling.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
---
 .../bindings/regulator/qcom,rpmh-regulator.yaml        | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml b/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml
index eed2ce7fa861..a028f1a9c194 100644
--- a/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml
+++ b/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml
@@ -135,6 +135,15 @@ properties:
     $ref: regulator.yaml#
     unevaluatedProperties: false
     description: BOB regulator node.
+    properties:
+      qcom,regulator-off-debounce-delay-us:
+        description:
+          Time in microseconds to wait for an enable vote after a disable
+          vote, before actually disabling the regulator in hardware. This is
+          needed for consumers that may toggle a regulator off and back on
+          in quick succession as part of their normal operation, a behavior
+          this driver has no control over, so as to avoid needlessly
+          power-cycling the regulator in hardware.
     dependencies:
       regulator-allow-set-load: [ regulator-allowed-modes ]
 
@@ -144,6 +153,15 @@ patternProperties:
     $ref: regulator.yaml#
     unevaluatedProperties: false
     description: smps/ldo regulator nodes(s).
+    properties:
+      qcom,regulator-off-debounce-delay-us:
+        description:
+          Time in microseconds to wait for an enable vote after a disable
+          vote, before actually disabling the regulator in hardware. This is
+          needed for consumers that may toggle a regulator off and back on
+          in quick succession as part of their normal operation, a behavior
+          this driver has no control over, so as to avoid needlessly
+          power-cycling the regulator in hardware.
     dependencies:
       regulator-allow-set-load: [ regulator-allowed-modes ]
 

-- 
2.43.0

