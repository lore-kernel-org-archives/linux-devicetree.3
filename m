Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05FB41FDE31
	for <devicetree@vger.kernel.org>; Thu,  1 Oct 2026 12:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790858827; cv=none; b=eggr8cmvuwPIzPqz4e3dLXM1Q1f1aB+qOmwc6MDX4/mg1U906cKIZqwSZgw5q8GyAiFBxjLTjE1xctg689yw8a2VID7HBCJYdX4gvowxvXY5lmNRtPLrwQUYSgXWfY0Y/Q2OK0k8FA4LOC1jb9lqVyedV40OyVMg9fIDj/+aTwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790858827; c=relaxed/simple;
	bh=6tlCPBQqSMxcoVXtilOkI4PTIRoLgatFwb92wyZ/NXA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=S+10SYNH4p0C7R3w0WMQXP90hyWIOXDtMMQcNpPQ7Nr0/cwoBbsMqoPh2HLPTywxznGiPfJOhcSoHtTQTvUb86uEnlmaqJXjf5+6/7T8ho7KzXdNh+vqwpLUnT8oCV5hjiQqB+LJfJjvgskS7ZTJvpmABksUDGfIN4gG2Yv7X+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YIlOyC90; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ejb6+3+f; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YIlOyC90";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ejb6+3+f"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 691CdZAv1062211
	for <devicetree@vger.kernel.org>; Thu, 1 Oct 2026 12:47:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gx7XquVkrYTfZBCGvyqx6Cyz/aYbbdYjH1W5oDABB1g=; b=YIlOyC90XNammilL
	l3wTRW2vJOtE0wptkvIxIZqCLke61Kkszu9jNooJL4Xs9qi15HZCbL2tWt31AQy/
	dEek/947FxFaFkPIBK/w1pkxwn0ioAfX69VyOkBil+RYhWZDu9exekht5IlS0qjN
	2xSPNeMaO2vTcap7QaaGn0QVUOqUcEw+cHGmcHPl/C9Kh4ygbq8uPDAOmPMQ71i0
	czN558efSTZ3xeBcRJM1a7Fgye/7kWHt2m+vaDxQXRTC4RaEP4u6oFeWhuvg4hsP
	4U8pIgI19LMPeuDcegO7xGGWpFZTkA9SYBecvqVyBZCof1SxtpmzFccJ/MSnfHoH
	ZESvPw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h17mvuvg0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 01 Oct 2026 12:47:02 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-39e3f521346so6892328a91.0
        for <devicetree@vger.kernel.org>; Thu, 01 Oct 2026 05:47:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790858822; x=1791463622; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gx7XquVkrYTfZBCGvyqx6Cyz/aYbbdYjH1W5oDABB1g=;
        b=Ejb6+3+fl5QcXy/UO/2fIGOhCbYQK91VXykTO9Hy5b0H0JUDTl2OpH5DHiEuJrcwnH
         sHExCGDPaNtzT9UlutVxMjh0Ds706Dw94EnMMKubGTq7p2pga8gyW8ZuT39ZCysH3Z+c
         xrZx/AnXsoL7OLwLLD24gHLbnbMiGoUl5IrZ7kBWrXczeVq9sSgm9jUObKgL/xjPBJ8b
         4NcquVus8IvqLqR1kM6XWKYISn6kTPu7EcA6TNacvWhYHdxl2YkK1XnZNNmSQBticGxW
         ZKH4pu5K0DmHlQBTYyH1TAeBEtgzsC15GT647hIYWazQlhMMBb3431dYT53lldQIWlZX
         baIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790858822; x=1791463622;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gx7XquVkrYTfZBCGvyqx6Cyz/aYbbdYjH1W5oDABB1g=;
        b=nDGLz6OH21UWzg5IwAZqw2ye3PxEtF0LymucWdevkbED4MKdniQbAdMvXoS+B7OrOM
         kUkWc7ZU58efmM0SVQJl+b4SX/BBXdxr1KKqAmaJoMpwWEy7/7T/kZdeHhm4yHoThpsS
         hCdivcMItSoIoI3C+VDcWw2B3Yj7rnAoq2fGZIqqHngb9UTjKQFc11WobA6qIH5RF34t
         JXeN6ssTgODMvj62xVR/KK5m7fLyfFqgaQQRspXx1qCtjwxddpWqo7bWaVo3BTUEBI1W
         FV9QWfjr4tK7bdO5LbPl9lyiCKlpgYjb9Qh7LMgJTS3PMomV+o+D7Da5UzuAaIBUkKvL
         5Aig==
X-Forwarded-Encrypted: i=1; AKwUvBwG56pppP8geOvRGLxI4OkhMThiLtqyMBkJFVzFXWfaPtX8ayEUJ0WhpZa26ZjcxAZmZlFlo4WgTd9R@vger.kernel.org
X-Gm-Message-State: AFq9FYI9aVg5uA3eeU5oolxRpGEU6RbOHvea0GjvrfKTIOVSacrFP92t
	Srma1/3ZTVCZkhr+5MEI4iWcisB3+wSSiuh6hWkh+7QkPUTdDEL9rCci4g62Hmx5zT/jhMvgr9u
	okR6PXgXz2gfY1DOCcGt5B4PipsCidQc2p9yfOgXbbdkEOZEj+W8F1a+302KbM7/a
X-Gm-Gg: AYBFou0s9N7/lqiXOkLne3k8fg8TUSCTnMFwFzg6L7wchEsrdD6yUGQqlFa4dxp4qia
	tth0xMxyIU/Vz0cj0DCgGY45bgIT1pfie8EwCgGtlr+AIpeIkiP8r6e0aGNUhaH3la5uEiOKtDY
	dsvJF6YW5/0GY0KDrPFfVoIsQEQx3pFxZzyIOTW+h1rBWw7nev+EeV3F6n9r9y2t5c8LM1YUXZy
	nRs6SVaqDQOYaDRwj6fDAfgxLOxHwxWbF4CBJl61oex3Yr+e1h8/7JtjjNrBv9v3ce6plWBjPEX
	9XXADFjuy7yNRHCa8iz72bAZh0osVPRFvImo9J5G9qd0UUxKauTpqPUT9jYhgK1RUroKOtgnVjZ
	AO5ZFfgvVdc82VPXx3KI=
X-Received: by 2002:a17:90b:1a92:b0:3a2:b20f:21b2 with SMTP id 98e67ed59e1d1-3a4d0f022afmr4109383a91.8.1790858822172;
        Thu, 01 Oct 2026 05:47:02 -0700 (PDT)
X-Received: by 2002:a17:90b:1a92:b0:3a2:b20f:21b2 with SMTP id 98e67ed59e1d1-3a4d0f022afmr4109352a91.8.1790858821695;
        Thu, 01 Oct 2026 05:47:01 -0700 (PDT)
Received: from [10.213.109.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4f479dc9fsm4567467a91.15.2026.10.01.05.46.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 05:47:01 -0700 (PDT)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Date: Thu, 01 Oct 2026 18:16:30 +0530
Subject: [PATCH v4 3/4] regulator: dt-bindings: qcom,rpmh-regulator: Add
 debounce delay property
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-regulator-off-on-delay-v4-3-258ba9612da8@oss.qualcomm.com>
References: <20261001-regulator-off-on-delay-v4-0-258ba9612da8@oss.qualcomm.com>
In-Reply-To: <20261001-regulator-off-on-delay-v4-0-258ba9612da8@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790858803; l=2783;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=6tlCPBQqSMxcoVXtilOkI4PTIRoLgatFwb92wyZ/NXA=;
 b=HvbdIjGg/48LiXQtEk7r/pVCd+EaNdhLzbrS/0UtdBYXN/SvhyUM+oBaGhRp4t0ulLbVe17vK
 bPc8xQ1GqvcBgThPLB9pHsMNQ2XH41kgRPrYWvHwAGqIhtGZg3lqLvg
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Proofpoint-ORIG-GUID: 5dpDVLNmSb9Dzi0Y35stwPfKcv8rrGlt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDA1MCBTYWx0ZWRfX3cE3kvdjsWFk
 BIpWKoTHLCA8ZF7BtFopqhIA0aAaRt4HoBGo5YEU8phaCO607Hq95Wok34B8eL/YWr2ikbIuRPU
 t5NbblkIQ8gZOi/an7Rs+Vx5Q2c7yED4obgNTCypNmE40pIHb++obs8f78VoTln0KrOc4SuwIKq
 thA3Gd/Gc3JXL8y7s4mlhOvWkhdIjo4qXBur7ifeRKCFkpdrR6DVV9ZlFLBurWkGbVZls7N2+ZU
 z6UradFxXTe1wOwxUjZI4XQ/DbKZmd+kLcDo1q1fvMIpuhIu9RKZW7w4Di5mJhzjslD9fojztSc
 IMm2fcdX85tfGJjRcP3xtxo2M2tFzDfesGzcq8ZmESXHAowbLXynYspVPTLjF6DW1tvQ+hJVhF4
 f81ox0yL7b/6pb8rHrIwOIMGkNpc4GtqDTkpld2xdx2vdREHZQyeh1Ozwv5p48IXVBTErtByCiF
 RwLaeoJAfo/sRKM/osQ==
X-Proofpoint-GUID: 5dpDVLNmSb9Dzi0Y35stwPfKcv8rrGlt
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDA1MCBTYWx0ZWRfXx3Hg9LT1MFfb
 hxxAm8Ty7RYqUYCSbrMOD7FSt7TrMzko7irC23pFL5xY9JHBDVCp7zzKKbvMF0sZhYNvjDkiggR
 1XRwmzTj+QZ6TjOyjPfx2DgZcjUR1ts=
X-Authority-Analysis: v=2.4 cv=KuvYSmWN c=1 sm=1 tr=0 ts=6abe5646 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=fIv7m2FGvZx8uhHzWWEA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 spamscore=0 phishscore=0 impostorscore=0
 adultscore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610010050

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

Assisted-by: Claude:claude-sonnet-5
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

