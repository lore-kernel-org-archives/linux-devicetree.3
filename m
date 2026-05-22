Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CB7D37DADE
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 19:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779479654; cv=none; b=Eb5Ru0D2awkZpnVPygkYlSZKWJg7slmoRGxNx/aWjYhM0Lkf1N6j/ApH6GDO90CZdm/Wtkf09JkJsBrD7vmCk5bnNSbIYJfI/MFSTliCbpQv/Rp9JXm3A+JccERpuO/PVJcUKHVrhosbtVG4lXLQ5OfmWDokAd7nGNWsoBwWCqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779479654; c=relaxed/simple;
	bh=adQeUYpX5mb5stJg0skrMeRG8iYvZNYvayR/mWNjRjw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iYsrLepiwL/w7ilZbl1nnLVnTDqbWMZCv1GTFS+XBOcqDzJSM76xI/yKNaEZZTzKHVsbXutRmy/SXEu+NZvglnKEm8BF2YSbvGfg7LhNL93dQhyWT7Bv3LA4odgZ0m468O6c2xBBKHYuCFv9KvFe+PTFrivlHnPPu6NjSumqTaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ILUUx7HY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dzf4soem; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ILUUx7HY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dzf4soem"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64MG0dQA3476988
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 19:54:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=LlJpGcXGOSf
	ETNR4FoSmOI+FiFVFxQkYddCmj1YZdyU=; b=ILUUx7HY4fqMY+5crtHIytpz6wF
	Ts1+DAia5UBbzZ5KoMLl/OyuiufARS78CL+LQ3ZFhQMHCiRe8U1mrgH9bxfVm5dk
	yD+3uPZ4zkFTDLRoM3kINyUMlEdz+ymwnNcBGuJ651pfaHqWMbHrwjskOTlk2vRd
	W8BnxG+HdHHMmv2wg6jkNgDwoOiIMFiVHPzEszHt/ag4vMPClvAWWzyWE/BJBvq2
	sAfeFjT2WtVFJ5QepB9AQBVZF11Zx1U3tS0Qyh4JIiiWkNsCvYjpgfjaTFpd0p0H
	PjR/6ooCnfMUKSQscgwk8OTFSArM2O7EtTqjUx13GjBPnbuqx9vMUPziXQA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eat9r8t0y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 19:54:10 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2bd6aeb3637so186185235ad.2
        for <devicetree@vger.kernel.org>; Fri, 22 May 2026 12:54:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779479650; x=1780084450; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LlJpGcXGOSfETNR4FoSmOI+FiFVFxQkYddCmj1YZdyU=;
        b=dzf4soemBuEVkYFsK0EoYcxDACdhPPv+Fl17rhQTXuPl6ps48uLviKW1ir92gFXnnT
         KpVWVmkTC02h4691H8q4BfDXCrNriUFoLzZq4BVwm6o0Bth7+gI+4x2jBIFLqhYm08dR
         gaEQ9aFvk2dOxbHsqHbm0lewjG+gN+C+xEFqXEtksxIUxoDTYaGdxs38H90CQdWGqj5V
         bbZrK3wjYWGhr3u4+/6jWb0YHe/8dyc3XO2tuvdwX0ZL4ZPzaA4G4BaIG7TpeEiYwgtq
         cIF+auABELysHh/bg1iOe2aMHzpZDZR4ZZgzHntIcBVk88lReu8Y5gV9G9uhK5lo9fQc
         NsEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779479650; x=1780084450;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LlJpGcXGOSfETNR4FoSmOI+FiFVFxQkYddCmj1YZdyU=;
        b=MmV29V6OUF6Rk75Dgz2R69ZyzX42jaKp4O7LgeTiGoqm3xXIxvqe229PnhJlUI1ir6
         jZ//YRZ1vjDN03KZWVpmfd35Bd0m1j97zqfk0AIEAef0gcxx3dldaiMPRtqVUKy6MnNx
         H8zFh5Lvfgt8Wd+RFWLM+n0iuojcGxx4fy2/nSg68F3hBtNb7giXDtEc7EM9v8/f05IT
         CEs7cpXGVn3iE/cOEiIus/eDtQSKo4lirUGPSsVa4VD0GM7/AjYPaPbH/QT6sxTY4nBE
         pNqYR54OQ0OfmAKz5qJN4nBzLwTrgC9yKrK9M/L1hy+w21dq8eluYup3OnqIWal2fCUt
         6GpQ==
X-Forwarded-Encrypted: i=1; AFNElJ9zT58NMc0b51ttWSrT/YSNhqHkrI0OxE6eYhXGZ3a1ovUofYhEJFPp6CI+MZgoRSNglsc8v8LPGmfd@vger.kernel.org
X-Gm-Message-State: AOJu0YxE5AY6aggKpOq3wpSPkmSN+JEfd/LgmeUvN4uVwa5t4njZtk/h
	RcD6doZQ47ig2ABFHIynFgOuhqLnDCrx4dRsf4qgesXLRfZp+djvhTTAEx7GIIWfkf/S2OPhF1U
	qgzHnH1LLBu5EkRDSQXaQOuRP866oetFgALu9lj5npaq5IvYIM5WQ5y+wKOO4p685
X-Gm-Gg: Acq92OEnTng70bjcCp+zBACotqA3LTOWmP81X72TPaHhtgK3yuufn7Cnb4iiTOlLgoM
	LdUsf02VJBsHk3r+PxFL6SR/FQpoTbsBdGGY9gaWhlXf3DBSlMkHyaQrjF3Ww5wp2eyMPr9JQjo
	X7rIZqXKfUK1dCB90NXpqopbtwALAh873Fg1in8a3wTeNrmf4iATDd72FquAjiQRA7Ze2C5xvKH
	UdwYc8616EGm47N1md82PUBVD9RnUgce8Ld3Y/kVwIqN+bHNJWcENxw9gJsvK8oEKkcQN42ule6
	E92IsVvHJjDptaazNLxYgzoQzWOKwVtRIwvCkI/b4ifgzWA3mV04xym/CyLZe9EiG37dfEnShod
	+svDs+9ZkuD1BwX7pJZt3C0TFGyF9iq7WoRgi9rG9hALGc75a
X-Received: by 2002:a17:903:f90:b0:2bc:dca9:f0ef with SMTP id d9443c01a7336-2beb0770a09mr57263215ad.36.1779479650042;
        Fri, 22 May 2026 12:54:10 -0700 (PDT)
X-Received: by 2002:a17:903:f90:b0:2bc:dca9:f0ef with SMTP id d9443c01a7336-2beb0770a09mr57262845ad.36.1779479649431;
        Fri, 22 May 2026 12:54:09 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb5695f05sm33541155ad.6.2026.05.22.12.54.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 12:54:09 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v3 02/18] dt-bindings: sram: qcom,imem: Add minidump-sram pattern property
Date: Sat, 23 May 2026 01:19:53 +0530
Message-ID: <20260522195009.2961022-3-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260522195009.2961022-1-mukesh.ojha@oss.qualcomm.com>
References: <20260522195009.2961022-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=dt/rzVg4 c=1 sm=1 tr=0 ts=6a10b462 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=Ljd-b6_uVLw3iGfjcQwA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: FRkHV8X7h8HcjK52hO9db80_S1-gHfQL
X-Proofpoint-GUID: FRkHV8X7h8HcjK52hO9db80_S1-gHfQL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDE5OCBTYWx0ZWRfX6Ld5nHdl8yeK
 zTzkAdi0eE8NJtXQVAo5c61pJbq2ET2YUM5kU2MbZuiEfboZFNg5RveInZ2MCcRPgwlW2kQJLYf
 dSGG/Zol5cOD5qHjEW/QBTdT8q9nkx1K3WuNDagSMo3JbTOApvVtvkPd38EwwcNt/RcJ13i0T9p
 sOs5PviSei5EJz4CxnBi8JqH8mnX5I51JMIkCNCOGuFSHU3EqJ2n9RSdtML59N8qx1awKpHbF+O
 56bRVu4UUdyIQe7HTf+SoRZrnQ92s8o1a19HD0Pg06mjoJOvW/qthfSKpRhaYeegcN/vrTycNLW
 52D0it6qmWL3XJV8twiqqnTMpK23Zv8YaVP7T8dMvKsyRtBgrj5Km3ko/Ky9NLj1TxAb51yyL6J
 481HLgSvLWHX3+N/xzBcjqhmZsOoc1V4CXm0WfIx+K5874GByU1RTr0ENloKGPgV0sj9qs5WpAg
 S6y2UaAtB8/ggnOBBpQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_05,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 malwarescore=0 priorityscore=1501 suspectscore=0
 clxscore=1015 phishscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220198

Add a patternProperty for the minidump-sram child node to the qcom,imem
binding that describes a single word in always-on SRAM shared between
the kernel and boot firmware. Before DDR is initialized on the warm
reset following a crash, firmware reads this word to decide where to
deliver the minidump (USB or on-device storage).

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 .../devicetree/bindings/sram/qcom,imem.yaml      | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/Documentation/devicetree/bindings/sram/qcom,imem.yaml b/Documentation/devicetree/bindings/sram/qcom,imem.yaml
index c63026904061..17adced6d3a4 100644
--- a/Documentation/devicetree/bindings/sram/qcom,imem.yaml
+++ b/Documentation/devicetree/bindings/sram/qcom,imem.yaml
@@ -67,6 +67,22 @@ properties:
     $ref: /schemas/power/reset/syscon-reboot-mode.yaml#
 
 patternProperties:
+  "^minidump-sram@[0-9a-f]+$":
+    type: object
+    description:
+      A word in always-on SRAM shared between the kernel and boot firmware.
+      Before DDR is initialised on the warm reset following a crash, firmware
+      reads this word to decide where to deliver the minidump (USB or storage).
+
+    properties:
+      reg:
+        maxItems: 1
+
+    required:
+      - reg
+
+    additionalProperties: false
+
   "^modem-tables@[0-9a-f]+$":
     type: object
     description:
-- 
2.53.0

