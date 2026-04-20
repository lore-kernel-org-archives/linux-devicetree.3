Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3209E39D6CF
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 11:50:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776685803; cv=none; b=d2CGL5gAWtPLBYg6bg78IoiW/PeG99HklF6mXmAFtBIUO6ZNXa1ZQ43Jz7NTIFUmd9S3Q9Pj7uMjK0zioWLyYuFK3WBV1qBUwEaHQv11Q/YpM9JZRb5BSNrrLZBSLtpkK8YJkao0SqJqebcnz1SxMKtq3VcZIbsstQA/ZpTnA+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776685803; c=relaxed/simple;
	bh=BhtVsvHqwipunR1cVFQzCSny4nImw5wDkPa6vKIEfXc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UFXYSmb3Av7Bxt1Qn0HJlNf6gfuFjfSWR58+ABExW6dj97cAqHrZ65/xiFbFgXJ8AzXI6gdBP7/ovV/n0arunzMNDxjfTadEGPz8p8wIpBa+CVbZO1EQ52pqufz3wj/gc28o6mY16BG3LplWwRxHp0wzGpvqY4uef54s+IeUOvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VTpHXisL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NmLGfzOl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VTpHXisL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NmLGfzOl"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63K97EIN2755817
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 11:50:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=gwv9Rp6MAzjqv4y3DbSzkzWs0vosbCAkTdd
	M1lHun2Y=; b=VTpHXisL8QBqQqas4ixUxRwIWPzD2Pm2lYcykie/p1fwScQqIMb
	ugVBfJ83W0j1T0x+hZTioSdb1p6naTMP9Z5PUPcj9L7Kzfc7UOGP5pq4U/15po5Q
	bWmCnDrC3ZlwK/xV4zIzSIx0SgVzNc0GulbAm/ct0bQpbkuP5rVBXKVvp2slmL0j
	zaUBlWZwQWFYK2Bml3Tc2fhDye7HkmLG9ztu3DiWmi+3KVZc/fztglJJDXS/9PUQ
	wJG/pLLVMG5+0WU+cG117OuqR/TdMrW1vvkCII0fWBgSOCSUV2zob4LsSozwfKq7
	Z5zWGEG8E8J/IxG5iEsd1Uz5WaB6uYgz0Ew==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnh7xghq8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 11:50:00 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2e60238adb1so1024766eec.0
        for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 04:50:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776685800; x=1777290600; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gwv9Rp6MAzjqv4y3DbSzkzWs0vosbCAkTddM1lHun2Y=;
        b=NmLGfzOljWPWoMdIrEfWBMQ0ovxVyDDgg9o3ov9BaHhDikYb/HO4AKCyaTlfsFmB2T
         FX25Tv6O+VtglPWSdPP/ZgsahTHWIEnOuEhENzv91/kB2leE0VEyaPgd1dcDe1/nmb4L
         dLwBeJEYOan6HWnmVDjJKDtzwGcOZh4i1NTLMXvABtXuKtJmNFoKfeO2FPsEzQ0PN9XA
         631R6A9bbl9ORqvDuXPCL0XA1OdEewt/JasUdRXG1A+yUrAHeVy1m+mOas3lPgDsDXeH
         V8LCtnpTr/vVmhGVWnyNF+prJSLrE8oxHILtNi91RCCQPxvwoiikNvIz4KnHakBd8a6u
         X5WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776685800; x=1777290600;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gwv9Rp6MAzjqv4y3DbSzkzWs0vosbCAkTddM1lHun2Y=;
        b=JShlwcvZETn07gzaVtbY8NCRe5AH2JRYRWIHDCWOU/q6oicE/NAqYCSZb4lOqb5G67
         SpYsgBPfMcRHuHPF9ok7qtTROk1j3JR9fdiDCtMl2UiIJwmpYT7RLSGblinfGgKXi5Tc
         cZ/6nM4lVaJjNzUtF6Ce1H2wkbIBCpzjh0s5RQ4JRHRFiaaGuGIXfWs8AIdFYcP48O65
         c77svYUC3+ZLgGY+1jcPfCBlzuieF4T1P8RBU0Lu7x9jvIua1AGpvh61rUzeuDI/TvvM
         cYi0TmTBgnrPimk2qw1ivJikzxc/WfkQB6QqOfwNPZGu46pNo3DEwW0mLE6wodr6GirT
         Nb7w==
X-Forwarded-Encrypted: i=1; AFNElJ/lC3k1TOI9060T3qYtOcVk9+bdrHhb5jymt0kOvUha2+0XvswaUuI+YNKpLXyIYcfLUDzPO9O2nabD@vger.kernel.org
X-Gm-Message-State: AOJu0YyJ7FQx+NWWsSrBDcRCAqoY7DG4VGWyAK3ruwdj6LTjgINHILUJ
	7hKgSFmKqLq/IB4iyyGx5GmygHWJkCwYK+qFYK30Rg7lBMu+WrVUpwi7q+vKSOTh42VxzP9Yi21
	4jli72nte34p4DRpBVcWQACXrjEXHyrGWwqQodPgqTidVVtxH3ot8VBJMHrxAvXdY
X-Gm-Gg: AeBDietxYCSWR60/sk6312dd5h0amcAA74tIz+BdbKmBydCGn83uSzf3BHszGRg1/J7
	PB9BPU8jLPBvXrPgPZNfD00YokzKcc9C3Li6602UDax8qmUSfVMT+tncpsqJNCoYrR7WT/M/mS2
	Lcdpd5EuWp61tL102dD+V5TyneklBvf+sL5s42DW3JwEzVC/gcSEHQKXexgDaJ42Z9xK/bZo6SO
	+PZhiyJAt8iByGVFyjI0H8UXrV0sIZj29rvgaQ1rh3Q/7VDEu806TOmf1Ja+WBiSAyCUhUHujO5
	13/+tqHpSCUPa55gkhmWovtzOpPZjgpxYtGGv9V3Wmy1sUZ7RyTJBCBLVzqefwOjJfFNlpbGU2P
	spL6Dbe1z0WJF27JOwHQ5wAYkrZMEMgqddJQtCwtcj7tU5V6w3jzeX7NFnXWs86/Hba6kNf0iSE
	c+oHogDCOskuMHQctk
X-Received: by 2002:a05:7301:578e:b0:2d9:6373:ad1d with SMTP id 5a478bee46e88-2e478c1f833mr7108109eec.20.1776685799827;
        Mon, 20 Apr 2026 04:49:59 -0700 (PDT)
X-Received: by 2002:a05:7301:578e:b0:2d9:6373:ad1d with SMTP id 5a478bee46e88-2e478c1f833mr7108095eec.20.1776685799305;
        Mon, 20 Apr 2026 04:49:59 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e539fa244csm13683810eec.2.2026.04.20.04.49.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 04:49:58 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH] dt-bindings: watchdog: qcom-wdt: Add compatible for Nord watchdog
Date: Mon, 20 Apr 2026 19:49:50 +0800
Message-ID: <20260420114950.1253792-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDExNSBTYWx0ZWRfX5GpNRTMMWZZy
 0I89n8y9HJxYhImBcjvVJnAbFufNd1c5UXLouqMHqwjyyIAFzMrPPu87vmUXFo/ha0aUVYyoYUG
 PC7cqCj/c0wul3eeahujrUFCRGb/8cfkRgLdQ549S8GlxrekfRH3QT8Cx78QMrf2OOuyNQ7d7p0
 /cqcT3t3RLyuuwf4oih6SwHZsORwSxQxlYtgzaIq7uO9L8ay/cZ+HcCrZIW7+tMr0ZayW7SVVNB
 pfXwWVEaoUXgTOO77lgEIn/YARETky2q8CPNbsfwXEf4UeKcY7st0qYA4FrOqMtUggGOsBoSWv+
 zBUKsCZkBXHiigDzEbtbrivIm4DlJ2a2M8fTrKYlFPJ3DOSyNosPUVOGrXJdwbn6Ia4lay/RUV7
 rDQjRY2Sn2KtAChnpwKC0/UNWnbpjI9l67KWbRgG2zmqWKSteR3/I2gWv0hVtyKv7FJih3RGySL
 J8PERZc6mzGzh6/BJSw==
X-Authority-Analysis: v=2.4 cv=BPmDalQG c=1 sm=1 tr=0 ts=69e612e8 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=r--zF035SsPxjZAzwykA:9 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: 5C9mEtP0zprUjgvsvBoXul1lT-B2Ktyz
X-Proofpoint-GUID: 5C9mEtP0zprUjgvsvBoXul1lT-B2Ktyz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_02,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 malwarescore=0 spamscore=0
 lowpriorityscore=0 impostorscore=0 suspectscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604200115

From: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>

Add compatible for watchdog present on Qualcomm Nord SoC with a fallback
on qcom,kpss-wdt based on the compatibility.

Signed-off-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml b/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
index 9f861045b71e..f2e6091902b1 100644
--- a/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
@@ -27,6 +27,7 @@ properties:
               - qcom,apss-wdt-msm8226
               - qcom,apss-wdt-msm8974
               - qcom,apss-wdt-msm8994
+              - qcom,apss-wdt-nord
               - qcom,apss-wdt-qcm2290
               - qcom,apss-wdt-qcs404
               - qcom,apss-wdt-qcs615
-- 
2.43.0

