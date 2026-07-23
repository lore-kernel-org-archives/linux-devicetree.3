Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76F4A390615
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 04:44:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784781873; cv=none; b=o2QSoWjY6vLJMjxMLh2j0OlMdgyesOVVC4dq6aNOu2+DegQr9G/OaXtIEXqxkBwGlQhE59rwrvobhGl6ZK6DJHqLO1BknTE+h7dFnVtd1eKtb66QV1XM4h2HeYXuhN9cONncO96npZHuua0Y3R9Fo75s3nTNSmYS3umVYfJfzak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784781873; c=relaxed/simple;
	bh=yiYdgiJqd9IrcyVppfU6gBuaofPptGycHJJtR/oHevs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Yuf2aOZi3N5O9pWcg05wfQlH3NtlvZiftqYEZ5p3raaepnin9FuM9p8GDyRcA9TBsET61dR7usqPrvtyNkXloB88PMUl7OxrRIBzyjM08YEtIw2oURU2NQcHNljD5lD5UG63JYlolv5BHt3+lBXnFeSYV7xtJxrM6H2/rv/Z6Ds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KmEayScr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Jqs64Oh/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KmEayScr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Jqs64Oh/"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N0WlTB2519479
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 04:44:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4nC2LTSIQg6tprR91g53nLLPdKX5ERT2wD35VYnpBLs=; b=KmEayScrLrlkDk2L
	8TEFVvYxrvJmEBp01zyrP3qLf6KDGLpJJtb7jUzpdVqnRdcWyRDVoQpH2/9W8ew0
	jmwCis45gvpZAkqnnG1MBYB7yyEWnQi2tGh/rykWMnblOa1cEPR7ZgJvV4A9N67d
	g63QJBfhdNe2AkJ1pj+ldiYIq9JQYi73Ioy+5HCJMMYUy+ZgbftDkMlUutkB8UBr
	uuSCNKupRYZU2me+UDKVMpfiqNGoYzJZIvS3XBD6mJmzUXqL/2nClbv+S9uqSRCE
	WC9kvPwnud2z5CHOWEBm407rXYmLT23UFS3DvYLkv71JDm5ZTofgRcDrG1nyKnzb
	uZBu2w==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fk6c7h68q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 04:44:15 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-84885a4fcabso322582b3a.3
        for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 21:44:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784781855; x=1785386655; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4nC2LTSIQg6tprR91g53nLLPdKX5ERT2wD35VYnpBLs=;
        b=Jqs64Oh/hv5Ofimkkk0o5IKOM2Yd8Xy6QAZpD+G7wXBd6O2G/NOMhsm1sv5wYBXMRL
         1ZnqM0BQ1EnGP0JpNjvJZyiU+CdqlYwRKniz2cAs2eV06mqoQx4SJQ/tnEOMz58ZW/p7
         HxklvBXQwDM2fg7CTIypqXgBkHhOW/0S4REO+PUx83r3qBMQpuHyYF/NeOqL/qgsqdOY
         NYPRjPcjm1t6uPjzOKwBc4+j7vWGPaglGzx26t0980Q2JCpWZBtsS+ganAtSpBDJEbAe
         9TuZLNZ5zvmxM0WZIo+QXYuhyhc14PaCQNP3vGnjwQYsRE59q9ZDQh7RsPKwXt20u+ES
         ZkJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784781855; x=1785386655;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4nC2LTSIQg6tprR91g53nLLPdKX5ERT2wD35VYnpBLs=;
        b=cc+Efgyda6+iZIf//B2/VcggUmWTz51QX+gzlsNo6uUJYup/mt2niEeSH/DREv8V36
         cDYo0yKmdw1MItoDOgjx6E/3WF0ZLbQtT6e3+ioI0pqL5RMVyd/vr/2yBFurLjDTXOdP
         qkTEF4N8+TMsmsK7Y5USVxDsN1aR3t4EPTtW9tAiGz7mIGtxSoLxadFiad7CRDiKMyj2
         ad0lHFYGiE741Pox91rWqYjZWZT8H07LiBm7c61SerYY/pqv1DzpTjqKgG0oTyZ4E2Xg
         0sYT/sySmxsIbCIF23OCw1H1Q95l+teKu5r5PBkb06bf90uH3SAB/+CzWYF/l6V8RrPK
         RAtw==
X-Forwarded-Encrypted: i=1; AHgh+Rru+doKMdpnT276BHMG0FixNuMUDOMrqwrbgfxYcgXTq7B9LVZnZ0PxRqYjv5IXJdLwtdpE124FMjqQ@vger.kernel.org
X-Gm-Message-State: AOJu0YxTSJz9qcg0QSz04i0M8NgRwHhK5r8nKop8Y4vN6GBCObu+wVqf
	kcnTBBMtXreDLwdaZ+FI0KdmZVa2/cNnb+T0pd7VUWujO2NhVAgmK4U/hoAMjX2HZdmbhTSdlQ6
	xksaDIdJhSa1BP2eK9I6eVEpUYtOobmoUOKcqHaoDo9BRbT3ZP1l8xHXGy74FP8oj
X-Gm-Gg: AR+sD11DJjDCeeDSt6te53n25flpepqaVhIPCXWI9uxylOR39BjY9aThtcuedAb38rb
	L+Kbg0JwMV3759W4586pmbqALh22PMswN4+q6fQ4JrEJVBoLEScDQuLalbMCvm9TxO43Jq67bBj
	VbwBB78ihRT/FeOtFQnUPJ4CkAKD/ZM2JmT90ZgKHj5lYnQQ0VyDZRXguhM1ur+CYUFvDGy4phQ
	dHNl1LU6ok30XTfMc/zeJ4s+wiVBEQI+oLP6jXvduS+jI6A0xr8SbuC/XiwTChOx9z1sQ/hEX7b
	oVtG9czCst5CF1W1hLkde3RDBdPdxkNjdQswWVbG/plciNTp5qWuRHIhXSfwqgSQlJ3tM1lOBad
	5qeT1UJrKilJ4D0riosR5TMU7J08URXI=
X-Received: by 2002:a05:6a00:a20c:b0:848:2f74:1d66 with SMTP id d2e1a72fcca58-84e2bc191b4mr1845633b3a.76.1784781855211;
        Wed, 22 Jul 2026 21:44:15 -0700 (PDT)
X-Received: by 2002:a05:6a00:a20c:b0:848:2f74:1d66 with SMTP id d2e1a72fcca58-84e2bc191b4mr1845596b3a.76.1784781854753;
        Wed, 22 Jul 2026 21:44:14 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e175aad1asm2327922b3a.44.2026.07.22.21.44.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 21:44:14 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 10:13:55 +0530
Subject: [PATCH v6 1/6] dt-bindings: media: qcom: Add Shikra CAMSS
 compatible
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-shikra-camss-review-v6-1-7c46f9bbb4db@oss.qualcomm.com>
References: <20260723-shikra-camss-review-v6-0-7c46f9bbb4db@oss.qualcomm.com>
In-Reply-To: <20260723-shikra-camss-review-v6-0-7c46f9bbb4db@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Suresh Vankadara <quic_svankada@quicinc.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784781838; l=1799;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=yiYdgiJqd9IrcyVppfU6gBuaofPptGycHJJtR/oHevs=;
 b=2a+i34b6L4suWBSaj65sVWFwqZeY1Qa0wKJ5bBToRjvGqa9hw98ZhfM8ZuXl1Ob00IrzH4lN6
 J3e8fg1VKtMCUmyvsCfYDSwHZToBmpyFnHVGTdq0GdZOqLeO8ZCSReU
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-GUID: DbgPKrSxVbCRBRDTld3HUVsDeKc1KLyP
X-Proofpoint-ORIG-GUID: DbgPKrSxVbCRBRDTld3HUVsDeKc1KLyP
X-Authority-Analysis: v=2.4 cv=baZbluPB c=1 sm=1 tr=0 ts=6a619c1f cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=butnsgrUGOw-u3YEFNkA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDA0NSBTYWx0ZWRfX6lQP20mqD/QK
 C0hww+LNjoi1eI9ybBeb11GRPBdiTlqgnoRSBSq0zzdU2k1aqkOs0FVc9nq4ArOnVS23gkGlEBy
 c+MmAt9cu59K2w5SVRPlIvKiYnDFfH8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDA0NSBTYWx0ZWRfX3xYvVHZvYZ0M
 NsFYFlV9WIitVuVxKHdKlK9hKBBbuEoW2vrReWPRveXJmvKlAU7Y8w5jW39zCZk3ClpfBFC/8M1
 OdUHtSWRU2RLCRqLce/7z6kZqWYZMHeiEb5Ne91CN/LCGQmLX6PeyqxBr+O+zf+W3KZNHfDrgzD
 nCdrwbTmWWzFueWPhR6A37avRUqH+qBI3sO69tpMaB+lpROroYfEDz2iLpARUd52VjCWzSVdheV
 DkiRwFANqDKdLFV6PjLl63eBJsBShLURQl2DG9dXQjylL1anQKchkh7L2wY7hY5PaNnVNe5Ti4p
 DK2Ue0Gt+W9GZd3J+atPNnO22rYLCXTPyPGEjdXEGIKKrcvmSim+TW/1HgYssC9IhpMHOXl7tOM
 VjtBgvz+Sd9Nk55ufW680GWjW7SWnOQ3iDj7CF0dGPnnvJHxXnaT+G8z+W14iUt3WQHvUjgphdO
 eIQdad1TEPSail2gWEg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_01,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 phishscore=0 suspectscore=0
 adultscore=0 impostorscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230045

Shikra contains the same Camera Subsystem IP as QCM2290. Document the
platform-specific compatible string, using qcom,qcm2290-camss as
fallback.

Unlike QCM2290, Shikra omits the CDM and OPE blocks, requiring only a
single IOMMU context bank instead of four.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 .../devicetree/bindings/media/qcom,qcm2290-camss.yaml     | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml b/Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml
index 391d0f6f67ef5fdfea31dd3683477561516b1556..490a7f3a8c5ff9c624f46150ee651793811823de 100644
--- a/Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml
@@ -14,7 +14,11 @@ description:
 
 properties:
   compatible:
-    const: qcom,qcm2290-camss
+    oneOf:
+      - items:
+          - const: qcom,shikra-camss
+          - const: qcom,qcm2290-camss
+      - const: qcom,qcm2290-camss
 
   reg:
     maxItems: 9
@@ -76,7 +80,14 @@ properties:
       - const: sf_mnoc
 
   iommus:
-    maxItems: 4
+    oneOf:
+      - items:
+          - description: S1 HLOS VFE non-protected (VFE only)
+      - items:
+          - description: S1 HLOS VFE non-protected
+          - description: S1 HLOS CDM non-protected
+          - description: S1 HLOS OPE read non-protected
+          - description: S1 HLOS OPE write non-protected
 
   power-domains:
     items:

-- 
2.34.1

