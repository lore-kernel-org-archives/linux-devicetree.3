Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12C9E1DDC37
	for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 06:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790577436; cv=none; b=Gps9CbtqbHRIhUx30Gilt0qjZbaryKUdnjtHRuXrz5sqMKp7I5gDh93Z5HMqYOmKYeFi2gMHNKtlYVSz263kRpWtPuHGFHj3kSpNtLbOfML1GI4iSXRVLZJdhVCIBjF7IaVAa5GKHbgtYBItk2QE7Evm2i44At4fRWWENnqL0ZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790577436; c=relaxed/simple;
	bh=ZvfNexsX5Cqvdxj3Vy+av/oLoVCsdXqDXsj3RFn10Js=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TVThfJDr5+AwzQ9m6tRld9/Qr+/Tzta6YXy5bRk9Kj3OjvDVGBUXI029LIx8o9Fv9DMEM9LaBBC7Ky6ahh+bePUlhtNw7i4kTwc4KbcqsLNx81d1v10MakAErT2Lot9+JoXeHjG3lZd1bcQIJnO3P0y45IZzOgNXURalVuPpgAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L7cHNXQ7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NoD1CEHc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L7cHNXQ7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NoD1CEHc"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68RLIZdS3218438
	for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 06:37:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	srxqTQBK+zwaPAssFeQan2gCNJo8bXf94ZcM17bxUUI=; b=L7cHNXQ7Q9IWNiV1
	ilYRl4Uu9LZikD+17pCDTLbQTHLQh91/pY3GC7BiQhxcl6JeideClX+PzeSBfwGf
	i48hlsITceQhBjhhrzFVyT4FKwysbNKbMwOGDLbTI8fD6ifx4DlMclwGNZ5tdF1L
	EH5wcHZ+biQwG/rgXTdofSiUse1junirQvtnj4d+ZBM0cVNReKVYb3ECrVlqXhGk
	E7aqWKQCfZLylkCe0+NCfwazbPTMHk4tY4/rK0LAi35W2gIpyiht1bl9Q9XEm1qF
	SrVeRl1SL/xJDak4QXjYTfaRrU7tAmaoxWy4xvUJSQyVauGD9tfroxl+qd7aXK4f
	zcO5Og==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyav494ge-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 06:37:14 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2d94a158dc8so39238225ad.2
        for <devicetree@vger.kernel.org>; Sun, 27 Sep 2026 23:37:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790577434; x=1791182234; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=srxqTQBK+zwaPAssFeQan2gCNJo8bXf94ZcM17bxUUI=;
        b=NoD1CEHcAqSVCu5vXX0mmczBgRpxyQyc4FG1EUkGEQhWepU3LLawMEFtofotaZk8zp
         PTRu27r2oZxvbS7s5vDi6EJ4aDmgFDn5Awvw7bXxgKGZUJGEKrZRdAltbcJJiEb0ihZE
         aVaRCwqJSNzqQ24FXUmS8agow5Nd3NU+pp2SU8ULJvajedevQYBEmpVOsW4+g1OA56Hw
         fsyV1Yc4UZUMgfZPTDhqq/bVJz3Se5viY4z82KCAwGXAi9ODSaZ4xvHOt5IP/rTEFpAa
         +hgQq4DxtMndkr00Fxtls9qpdPCHZ//OfeQYmovD0tDF6iXBHA0f5y6j5935lo5ufXU6
         O6HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790577434; x=1791182234;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=srxqTQBK+zwaPAssFeQan2gCNJo8bXf94ZcM17bxUUI=;
        b=gimereJ6YhUWraFUCFweZ2BJpmV+813HftdA5YIJrmKafr1BMTotT6DZj+++beA+pe
         WDTc0aFNP116WfHKYHaZ7jNt9IedbGnnZTdqEwFezajrM1RZnABaAUY6hdvtiYQ0ZtqF
         85dd6KpdLiXg9qZvm+HcsjlEj9doxo53BgRTmBqHgWwMykvewAOfZiXVx/xmPytsJhGg
         OpNDRL0hekX8jT/Pokeq/BsM+qACjZtkgviq6IYzuzgr8/bfMHAfGw5PUt95eCGInlc9
         aT4swsSa+j0o/oJvRX2ecadSXfaZsl4iqrAUKzNK0RBI06z4KkvBY2XNdNaSF+s4wans
         V8ng==
X-Forwarded-Encrypted: i=1; AKwUvBxtcTsY6V8WLchkgdtCuC1f0BRQx7nlyG6qVI/LWaqqk6stoQ4Wa/TcDZWajb5ULlBOaxgVzTxxMNWn@vger.kernel.org
X-Gm-Message-State: AFq9FYJkFVkctFoCIQnaQ143Hdyn0bRGjaVhytTUc79n+EKAKbthNn27
	3dSwPo4Ei+pCPGppjr1lsR7QF+M+ExeEo13SUO9G1a5RhbBR1nWUTxzP+voclhkJMIg/AFnQZjv
	GinVkly9XbL6XUHJQcoUbZDphyLuedMTpEZanMyCK92IaBWIxnRvxFdciRoVBTOyO
X-Gm-Gg: AYBFou39/WIjcjK+1A+1N+k948R2HYPg/wTRQ6FLkxGkTmA41oY/kxTvOGubFs820De
	OmL6+fkbjy8ksY0OPiu1HJkaMg2m8PFixd8X+EjtrmGWggvXffLh5yqXoeL1yyciA6sLidKMQ/A
	MfFrmNLQk2QRPOCcEGvq2K7A0rWAW1ekSsVQu5rfYCdPEmZN4BIAlAToZS2uUNmDOyEZ+hHEC+X
	U7s8/QtJTDPfKptCQP+WlDAv9+sD2BJNGDb0Rp+2z9g/rV1Hb1HBsLmLFjG9zC8CRGr3tZrIuog
	At4zYzNJhE1IBgE9srV6ufqZh0sdi8f12p1XVISZDDy1cYXeyeKPy7z/u3kICszk42CcwyIqyVz
	gtJju9wKx/BMY6nN0lNdNS2xZaVENJEq/UkOCxpNmV9B36eyJrmz9jXS+b2QEUEQ0w/WOftd7Pg
	EMIghdPhKcqopW
X-Received: by 2002:a17:903:2408:b0:2dd:c100:9435 with SMTP id d9443c01a7336-2df94c1bc19mr59631485ad.51.1790577433614;
        Sun, 27 Sep 2026 23:37:13 -0700 (PDT)
X-Received: by 2002:a17:903:2408:b0:2dd:c100:9435 with SMTP id d9443c01a7336-2df94c1bc19mr59631215ad.51.1790577433128;
        Sun, 27 Sep 2026 23:37:13 -0700 (PDT)
Received: from hu-ajainp-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df91468978sm35292685ad.79.2026.09.27.23.37.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 23:37:12 -0700 (PDT)
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 12:06:37 +0530
Subject: [PATCH 1/3] dt-bindings: embedded-controller: qcom,hamoa-crd-ec:
 Add thermal sensors
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260928-ec_thermistor_support-v1-1-d9c1bae4cd0d@oss.qualcomm.com>
References: <20260928-ec_thermistor_support-v1-0-d9c1bae4cd0d@oss.qualcomm.com>
In-Reply-To: <20260928-ec_thermistor_support-v1-0-d9c1bae4cd0d@oss.qualcomm.com>
To: Anvesh Jain P <anvesh.p@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790577422; l=1724;
 i=anvesh.p@oss.qualcomm.com; s=20260313; h=from:subject:message-id;
 bh=ZvfNexsX5Cqvdxj3Vy+av/oLoVCsdXqDXsj3RFn10Js=;
 b=xYdcz72tTsuUB3zatuTTdzn67OLfEme3Jki9qjGNkar6ms/AjKcIxzouA9EK7DAaDTvEJ5yn4
 fiuZyuUnW5YBN3oqH+2lkHvtJ/H7DmlHVAtwLQ+IvpWyYZ9pV5kMgj3
X-Developer-Key: i=anvesh.p@oss.qualcomm.com; a=ed25519;
 pk=8o9EG7gkPe2Er9y9UVCx8MTdcFCwU8Pa54hBZPuduXE=
X-Proofpoint-GUID: Wroqbt1Apf2TTfB5WxYU29DGXvNds8lb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDAyNiBTYWx0ZWRfXyqh0pXr8Ur59
 0cBcfXCoUlA6cGpoaWdkFxn2Ii3pR+4P+fVH18MUHd3Fl4BIR+lvWxxOhori3U++S25r1JAcfs4
 GqTl5iyGmBrnVGR/3NmHgx7G0jVd5OBZFk+yPwOWaqtR3lhDE3PEo56DfFnktWPtNuaBPMLCR90
 PwYhXo9pWKBAB2GybjvleVwmtiCzQUNKh1+5aZSsz4mxcXkU97WC1V963gR0mSK0tc6KVnq6AvU
 I+6dNoMn8fEYR/taiEbknz7S6wu2aS8mO5bL2Szclbk9/QlsKztOl2vmzSWN+jRgK/ompqEbU6Y
 cMY6UJGO6N/sxZ1/7u+i4EEhZP0IX9tBxpZzDxzCfuY7EAzrOykcpMyxQa4WoMYlp6Tau3UenTP
 y8wGV5fW9Sn++qpv28UQ1fQroEbot9n37XatHvudH1pwPfhywwhdpMOtygkCdEiCftjK3T7qRrm
 hUPXJbsF8D9QOiwMA1w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDAyNiBTYWx0ZWRfXzMb+KTcQXnvX
 iFWcEakbDJvKwXpgCDwCuYcWItQUj5GPa8Tcy8LVpa5vgrycRZ1G1u5w9BSk17kG5TghUMxc1/K
 i2SYLckmeyoKMcjSJyvH5AE/6iR285w=
X-Proofpoint-ORIG-GUID: Wroqbt1Apf2TTfB5WxYU29DGXvNds8lb
X-Authority-Analysis: v=2.4 cv=MqLHeGae c=1 sm=1 tr=0 ts=6aba0b1a cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=E-ebOgB6S8F8S_20uhkA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-26_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0 phishscore=0
 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280026

Describe the Hamoa embedded controller as a thermal-sensor provider for
firmware-reported thermistors. The populated channels are discovered from
the EC firmware capability response.

Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
---
 .../bindings/embedded-controller/qcom,hamoa-crd-ec.yaml      | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/embedded-controller/qcom,hamoa-crd-ec.yaml b/Documentation/devicetree/bindings/embedded-controller/qcom,hamoa-crd-ec.yaml
index ac5a08f8f76d..13de6bed8129 100644
--- a/Documentation/devicetree/bindings/embedded-controller/qcom,hamoa-crd-ec.yaml
+++ b/Documentation/devicetree/bindings/embedded-controller/qcom,hamoa-crd-ec.yaml
@@ -15,6 +15,9 @@ description:
   EC running on different MCU chips. The EC handles things like fan control,
   temperature sensors, access to EC internal state changes.
 
+allOf:
+  - $ref: /schemas/thermal/thermal-sensor.yaml#
+
 properties:
   compatible:
     oneOf:
@@ -32,6 +35,14 @@ properties:
   interrupts:
     maxItems: 1
 
+  "#thermal-sensor-cells":
+    description:
+      The EC exposes up to 7 onboard thermistors (indices 0-6). Which
+      indices are physically populated on a given board is discovered at
+      runtime from EC firmware capabilities; a board may reference any index
+      0-6.
+    const: 1
+
 required:
   - compatible
   - reg
@@ -49,6 +60,7 @@ examples:
         embedded-controller@76 {
             compatible = "qcom,hamoa-crd-ec";
             reg = <0x76>;
+            #thermal-sensor-cells = <1>;
 
             interrupts-extended = <&tlmm 66 IRQ_TYPE_LEVEL_HIGH>;
         };

-- 
2.34.1

