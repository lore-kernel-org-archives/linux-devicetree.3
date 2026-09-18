Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9A8951A14B
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 16:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789749814; cv=none; b=Ou9mqDNwRz4FEyXjwonIIYj9QLTRck0G6bKbTu+FcsCfbRJL2nd0+EIwSLe064VJXG2r+BygG1k8ZXeJvaPFhhvN1QR3x1eIQ7wjy0OM4dIn4f2o4+9iijzFo4ApRHhK2PKVqRvtA5RNw/Govwg8AgofUe89d4AByob7sK6RTQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789749814; c=relaxed/simple;
	bh=8UAuFJnUEqKcm2XD1+YeWZD/invavXXey/59IElm+FI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=siFPFCwtT/Lt646ZXh0EgDGWiHFpZ46yPIyEJK5glrv5mE6RMiiN25RDb/xxr34NYaJgr7PHRxktRxwJfIZPr9ZPxse3WYj7WBaniZ9BmBzTFl9/4SNp/eQMebXwJjqs8dMlKed4Pa03IPEREOSh2WGxkRWh2VowFOWM/Ioy9P8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EznILnNS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aqSlqKcg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EznILnNS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aqSlqKcg"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68IDOXG91900389
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 16:43:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TXhD2qfyTH3ir9nwCSQhy3VirEjLkSnYOqGNbJa/sSw=; b=EznILnNSgYugzLNG
	BZlZXV4xqBLhARQ5se3RElfuqitGY7T5atk6bYWRNRnFHbfw5lBPkNT4Ew2WstVW
	MX30rNgLrN+xzmFkwXW7vcpbRfH5smgNyRsO/a+OpEKrIpQJxmcjvBvV9E6YlOey
	aSlxdBeV3wbfy0VB97QrQE+nOahy5GKlEyqRmKnxA9hPYd+Dtafb1DBdbBLvBecG
	4Y0jJmx1cpSplNBR1paQP5yaLB5peY49z7WM05YndljAAMqfW/HuX35oHMLHLm8e
	aG5FE/7RFnyhg9myTBm+xQPzT19D9p/OL1refAb4lbynO72nsMpidYpLVJSWX1Kf
	hNXCEQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grtdpuq0f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 16:43:32 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2dd753a52bbso17318725ad.0
        for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 09:43:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789749811; x=1790354611; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TXhD2qfyTH3ir9nwCSQhy3VirEjLkSnYOqGNbJa/sSw=;
        b=aqSlqKcgcqNzeA/ul+j6IoO6+medR+xAJH+bF5rZbHZfdCA1OhTxuI+EOchQvIvTxO
         tTN3iSwe6GWNLcpBxoxtqprzH0y3hD5tqd17AkhsL8Uuejr+i+F9vTqED75myhR3Bm89
         4WbCEWj/Uh2R6lInHONk7tEf3E7Bsuy6QQxPsAYJr22nRQ+JEkX5URieNEldjwq8oO01
         +HFiacfn0sbMjZ9l9drD9ONVi8r8SHPkD5kU3YoE7s7LNQ8t1H2rcHNy3A2Cv5Zt5DMC
         UcwmFn/IzeqZutN1Z/1cg8LAKgMTc6+lOq0IikX75CeT7GCfUvXCqzApfJ5wJKBUYRdu
         uieg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789749811; x=1790354611;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TXhD2qfyTH3ir9nwCSQhy3VirEjLkSnYOqGNbJa/sSw=;
        b=MDzcFfpsVtnS1a1esU+c/G5jqgSdmLmPtiQb0bkCeOA15GrIxl9g8vHfsw2HgYuuRF
         csQAv1pZ+U9YUsXyQ3IfQhmvSQyUKngr5SqyHAjh1dGhf8xkN9cgyliFktOwYQYKxl7U
         rZ55MevDb1P0PDCMW242sWjQwV15hKWQKOPtYjiH0myrDPVqYJvGmoxR8kW0VFg67Yym
         UJJLvS2X5nx4LWZXDTy7/s9strYWPjg/BYtzs+UJ3pgw9296lx4YPj1GcFPn6Bpe65/e
         7nKrtYqzUp9M8Jg2D6y/2uFoo4FBG1wWrYFkYDSPuLPEFQgYtH+5HWjpBN9pT4zpWo5F
         tM7g==
X-Forwarded-Encrypted: i=1; AKwUvBw9weMMTigBCWigXuMncz4MvOvp1W30KLOsSwWxwOI5Jm7XST1AGuprs4ypnqlpALXVmbyEQUfd3orA@vger.kernel.org
X-Gm-Message-State: AFuF++k7Xx1dqtm1pEAX7+79H5sXo3snV9uZP0qc/1SsZIUvsNKOmRQB
	OJYoow2fyaZOKMJqn+hYK+x52+/m/IiPS2pdCrZo7EqfhxGIHUmj+1IffGDBLmZ3d384wM9fjad
	iwuidVtE0t0NgXd8Lj8GoNRF6rvoKAoA0+M8fP2rKsJEA80Jdpy1UBaYKkzHL9vcV
X-Gm-Gg: AYBFou1HuoW4DveS0WZSr29fIXFmeCgIdwfJITaoaqSjEtfEY84M/3YqlckpW7vu5yu
	sLzwPF75Z50dIRHuhyYftNEjmOSJIVW91so+PnVWyaR8RzmdhFmoFos1JXK/re60uuo75ZFcFgr
	jEkbaKRkyZs95FwEGtvkmr49NBOEpbdvNDrJcs85u+0Ow5COEs6ZLfaO8O1dTCj7c7buUUEI+MB
	64sZNa3gPCtgzT0tCqviFzXc48EV/KJ9T7Y6Ezlq1MPImKJScPSNS1fCIU+uLU+ZUOKEpxwDVkk
	lpdRL4DXUZ51EmTW5WlXJ1N1S47y7pXGfZ7vPsMIgrUS1yrjVz1zr4OLeH+KOSYWqkQwijTjpNU
	pb+83F2MiMVTuO4iRRg==
X-Received: by 2002:a17:902:db0c:b0:2dd:ad73:c93b with SMTP id d9443c01a7336-2ddb1bebbecmr66585315ad.28.1789749811404;
        Fri, 18 Sep 2026 09:43:31 -0700 (PDT)
X-Received: by 2002:a17:902:db0c:b0:2dd:ad73:c93b with SMTP id d9443c01a7336-2ddb1bebbecmr66584925ad.28.1789749810887;
        Fri, 18 Sep 2026 09:43:30 -0700 (PDT)
Received: from [10.213.109.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddb754e390sm11161895ad.32.2026.09.18.09.43.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 09:43:29 -0700 (PDT)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Date: Fri, 18 Sep 2026 22:12:45 +0530
Subject: [PATCH 1/6] dt-bindings: mfd: pm8008: Add qcom,pm8010-i2c
 compatible
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-pm8010_i2c_support-v1-1-de33d78fad9d@oss.qualcomm.com>
References: <20260918-pm8010_i2c_support-v1-0-de33d78fad9d@oss.qualcomm.com>
In-Reply-To: <20260918-pm8010_i2c_support-v1-0-de33d78fad9d@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, mfd@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dhruvin Rajpura <drajpura@qti.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Oleg Keri <okerixx@gmail.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789749799; l=1049;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=jKXqOxLBkEN4smsi8ItCByyRDNS39ib2DMxiFpu43dE=;
 b=ifKFWo3gjLLDagND+qAkNzUjHEUMeJgS99ZjJlS0Qj895XjNUp66tEIjBkKEHgkPZogowouII
 9so46iR7otrCXQBG1eR90KSLJir/jyvrsBtbk9CTL5Ntn4TZISaQfLw
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDIzOCBTYWx0ZWRfXyRJRpVgniGjw
 fTivKuEQDaDY08Nf17W+ThUnNIfbJ/+OGeOY++KcRTFLr/NkAkPwXO/iZhklcAAlSjyzYdgaYfi
 O038Ylnj289IeYSN6JIu6tqG2gRBZmbP1ODblhXCRK1ni8IhBWv6YU9OJkx3dCJl2KyW8SuPGaD
 CBnqvyTAAq49/sqfH3+HVo8U4DEfqQBc6iZ+mEu33OLgNsiPSNkVqkvQ9ZbTfI3uiI8YAUsQ3PL
 6EmcS/64tvgID9YW3GC0rpB6qZpzgnUGcYMXAZVKrwT2oeqWysUUzQKFloruFicUb6O+nKS1Q6/
 t700woz7Y+31KA3k8vJH711APue5Fj/L6YIQmND7UiDZVzZk/ak8LhNcgr1MqEI/kQKbqkSNdj0
 UGkS0BUkLxlOXs4oN8PnKZZqzAOp7wIMAM3OjHQJquKYJy+tW7DhESRg5tNEdCT648qaxCt+mvF
 bfAlNi5uwWmADgIfOQw==
X-Authority-Analysis: v=2.4 cv=N+e8hG9B c=1 sm=1 tr=0 ts=6aad6a34 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=fs3tcOIB28yc_fyh2y0A:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDIzOCBTYWx0ZWRfX/9fa99M6JjL7
 bWL4pYwzwKe1dppzyiW0ejZBbWMhv6L0XvN5vDfgHq16scEqt/T67pOEGYTBWa7/JdM1cVcgWLO
 VH8Y7uZ7Adz/lI6mGlHwT8zAAle3zio=
X-Proofpoint-ORIG-GUID: IzvMdccICD1jA95HGWC1pWY6LQOCGlDq
X-Proofpoint-GUID: IzvMdccICD1jA95HGWC1pWY6LQOCGlDq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 clxscore=1015 spamscore=0 adultscore=0 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609180238

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

The PM8010 can communicate over both SPMI and I2C, based on whether
GPIO1 is pulled high or low respectively. Since the qcom,pm8010
compatible is already taken in the SPMI PMIC bindings and that set of
properties is heavily tailored towards SPMI, introduce a secondary
compatible to handle the I2C case.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml b/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml
index 0c6e1870db1d..2701aa755f31 100644
--- a/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml
+++ b/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml
@@ -16,7 +16,9 @@ description: |
 
 properties:
   compatible:
-    const: qcom,pm8008
+    enum:
+      - qcom,pm8008
+      - qcom,pm8010-i2c
 
   reg:
     maxItems: 1

-- 
2.43.0

