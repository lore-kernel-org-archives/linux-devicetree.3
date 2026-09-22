Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56B813769F0
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 23:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790119211; cv=none; b=ZRjKIPw8nAqZW6EpI8tXd1BsHi6ueYSUIKY7eqU3xXhXd8lIi2HUZyURbBrDETSZPo4O5iMLoeU4wGDVvcfjULIG8qOGY9xLnl044Sdq3t8lQS+y9ACRZRhjPYzRf35VChNL/oS/WY/YZQ0wxjzi1x/6FCwlvPQSbqhTDPnpbR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790119211; c=relaxed/simple;
	bh=l+ARlOXS2XWaVbDlfHvazDmsre4mloEoMEythuIAEgk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AFl5v2Zu5Tiaaf2U7ZuFaoni3EJIwdMzs5aFNMpbMaj0JzX1O+8yzivMiqteaTRULyUYbTY/ERB/R13kbjSSqLIb3wszpvr74pMg73+bssZcDIYOd2f90KI0TnIq7ezJ0gRH+3nkvXQN2e9mKndQmx0XSiT6LhY99IQ8+wTl+5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H3CxU7rE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G7TnSstG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H3CxU7rE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G7TnSstG"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MI761I2033340
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 23:20:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2EwrgEF430cEg8Mo0ngi/Kw0Qhs42PqZHvdu03xpsVs=; b=H3CxU7rEIrdrtTHH
	Wk3YW9AOkO5LlieZHCSh/SSDmByulJdOBCuJiBjzk1Aa6Lt0lJdxyi1jyx9OPGsp
	vhOz6P3MSFMf2t/Mqub6ahWUIDIqXQNeozVvSagjLyCs/DpR46IcqcBf4g7jObid
	yujxCdr4vmIMPfU6tGCJ8Cqd8TyNVQxWad9f64Jb3afh6L3WrA/uRZXkQ5AO17Fq
	G5JmOihbMvaHHRPhM9EDpLFqTKxZ7+oXOkYa2Np2/N/thRyUnE7qc/Pwgl1yHOUy
	P2a5oryUzwHh0tcOd6QzKBEhC1eZ5mUGI2I8amQDQ4GEYax8YAmUvUr0F0EGv/xb
	wYK7KQ==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gux8c1g0d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 23:20:09 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-142f4306744so809133c88.1
        for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 16:20:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790119209; x=1790724009; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2EwrgEF430cEg8Mo0ngi/Kw0Qhs42PqZHvdu03xpsVs=;
        b=G7TnSstGOU1XIHM4P+9CzJn9VFnmZLYk1Epzd+pgUkXqzHYnWLpAhYCunGfa2Cp+1y
         6kEph1Ybq8gvS1XYno3PoaGCwOv3Uyytn8l7RYnJwxYbF2/qFOwzh5tQSI686t8Erobs
         1N4tJXN8T1+8A9dnZVYSCBwJx5ioMnt7wAFuTNhMMTBV8CnhFVl2L9vQf9uCEkpDrrt5
         yzT3bcKfWpZUltetKdjBwpcb6IREdjA5m2D2aPUpIsCp1GhN8Tzr7kHLjcdnUUB1TZt7
         jh5yR+aHfBAnZu2jkW8Jpnl5qiMPh0moalD1I60I4l+PaP1CoU2uaE6b2xlwOv4DEFK8
         hnSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790119209; x=1790724009;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2EwrgEF430cEg8Mo0ngi/Kw0Qhs42PqZHvdu03xpsVs=;
        b=wP25lSSk/b/XvNqacswbxtqyZBxOp3pNGEO27RK93vEk4hGo7grC4nOUS1UvuEhUtL
         EMlRkWaFk9D4v1I3pFIRpc1PTQdQfGttmP8tU+HP0fKcM1dSPRzQ5N6riuCIiRPrwHCh
         zhfphOZaIRb6Pkb+TNWnqDGQB1StEZRYc2MSxIreQjgJmIHf8Dd3Qg1rogT1zGydz2cj
         FsAFrZ7ygeeOn4cratO9ZJCFmYT493FkQjM+V5guVFUyk2CakK/Wjt9y2wbAngC9T8bd
         9+0zpVbthXVM4hEYhR/zVxVZDG890KXDfzIZQ9A6fvfNKkPUxarZe/R0pUB9sXU/yNUe
         FJ0A==
X-Forwarded-Encrypted: i=1; AKwUvBxgEq1U0v4oirIA+GsqhclsZG/4WJU/7bJ+jvYVOzpGA/uRM5WaRTsj76hu3y0ZcmimvxyZSqwxrSbV@vger.kernel.org
X-Gm-Message-State: AFuF++mmr97VETWWpYwGZhwhgOYpMoV1E7SiTyAI1lx+wnmoMISS72IG
	SiEcF1ir1o1ukz3jectxl1uHRmLm9XYCkm6oE4H1auoBPUMFrx5RGYCAphVzqB7SsQXKYQ5m1+O
	grXH2NaqN570XRa//QUaL8REk6KK9hFx+K0oRbwbsxtXND7bkecm5KAkxtf+xfbOx
X-Gm-Gg: AYBFou0g8RNGExJ38Ey5w9ZzD5L4Jt3yfHLUgkGTTs4mefUexWn7rEGou/cE9oheYeU
	dMvEIY2angUiQ6uImTff1TJYhelhFydX35HgL32nHNc18gKgawlfokz60mOrpi4ZPhR3MgPFwL/
	9NOPT9fcBd7uLq1K+afxDtSD2rHNAHDUz8fTTNX/zd+Y35pB3smWZPqvDHJoi9iB1v//wmzkzro
	SnCs3aC/5AaZISd3yQf3bXWVmzR0tgo1sCjBqIphZkI16vINc7rpCRVEdtodHvzQwbuYomVN5FS
	8/ZN6qQeLAKxZADmlSy4E3rS/woJK7YkL4Vf8C+ijdvPNb1k3i6eIpB1hUXOe+JfywXx7gKSJZ6
	+nevsnTfRhp55KR6+TAn0w4N2FHbDrrK/Kd2KGtGfVv7DemqtCg==
X-Received: by 2002:a05:701b:4511:20b0:143:296a:3ed with SMTP id a92af1059eb24-144f92e1a7emr834576c88.24.1790119208865;
        Tue, 22 Sep 2026 16:20:08 -0700 (PDT)
X-Received: by 2002:a05:701b:4511:20b0:143:296a:3ed with SMTP id a92af1059eb24-144f92e1a7emr834545c88.24.1790119208267;
        Tue, 22 Sep 2026 16:20:08 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e96f47d52sm1412845eec.28.2026.09.22.16.20.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 16:20:07 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 16:19:58 -0700
Subject: [PATCH 1/5] dt-bindings: arm: qcom: Document Maili SoC and its
 reference board
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260922-maili-dts-v1-1-ac2b1b76bfd9@oss.qualcomm.com>
References: <20260922-maili-dts-v1-0-ac2b1b76bfd9@oss.qualcomm.com>
In-Reply-To: <20260922-maili-dts-v1-0-ac2b1b76bfd9@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-3d134
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790119205; l=898;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=eThQjenGT64SgHD+r38689AieVgWjY46GmeXWeTOXts=;
 b=6+17yGkGOYHdda9trnjeOawzjIa09iBG8Hv+8d2KDKm2X8qxA7cHZHZB9zlVB/zq2o2+h/ntu
 ItBTVbJIXyfAMedj5MycJWtWg3JwaLVX/cMqZCiC8fPqf7E6P0r3nod
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDMwNiBTYWx0ZWRfX6r+QtqFbIxMI
 rSg48gujSxA4pIVgRed8Hf/bVufIhF80MaclGuGLQGO2NaiFoxnAag1fp4EIRlaI9BRre8/1cNK
 M6Wsofm4iCGLMxfRbVI2y1eYzoIk7MWHQInEUMocmS79EPEibdbTZpoyRegEEG/AgFKkrY+piiW
 EJhzTBCvaNIPtN5I5YPWP5lZb7CJIIa/OSH3h5ySI6xHjp/lJEoEFNh7eg94lPN5m14fGeN1enU
 6uca4pNBHpZicTGb50Bd24Tv468QEgy1sDZO06pKzKxQs+KU+sksczI4mcRfm/JmtRs+2VpezbJ
 DgKslHgwpJ3zET5MJ2BuIUQ4MMoXY7pGVYlZY/c0blv6KG1PTdrFCIlfr61eWf7yu3bYAlGjki4
 E8ll1pu+gUoANsJXLM7t/VqNSTed8tl28ZsZt2jy2RLIk/3hVWqF/MP1KSHAIOX0k0wUgEdU1pK
 fjm8YVYboPAXiQJaknA==
X-Authority-Analysis: v=2.4 cv=P9evFSAu c=1 sm=1 tr=0 ts=6ab30d29 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=nEm8NXYsWs7wjBKNTMkA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-ORIG-GUID: B5V4RC_gix1z0zvuhjhlGSv5l_fC7Efo
X-Proofpoint-GUID: B5V4RC_gix1z0zvuhjhlGSv5l_fC7Efo
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDMwNiBTYWx0ZWRfXxRYlX7/cxaBj
 Q/BYBOl7l8HLNEusR04Uje0shrV16g5ymegcypx4JEuenGHbWrsNWFh1w7rAp/NrtiYnOj/9QBd
 w2SLW4HMHjqLlJO+ZFZDdRl1iV4vOeE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 clxscore=1015 bulkscore=0 suspectscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220306

From: Yijie Yang <yijie.yang@oss.qualcomm.com>

Document the Maili SoC binding and the board which use it.

Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index eddf87fbd0cc..0e6b4fd8b275 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -187,6 +187,11 @@ properties:
               - qcom,mahua-crd
           - const: qcom,mahua
 
+      - items:
+          - enum:
+              - qcom,maili-mtp
+          - const: qcom,maili
+
       - description: Sierra Wireless MangOH Green with WP8548 Module
         items:
           - const: swir,mangoh-green-wp8548

-- 
2.34.1

