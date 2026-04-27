Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34F5B213E89
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 00:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777250147; cv=none; b=gH94YYv0z9PwDxJwK9npVIEqgmFEYSlzbzjAm4haIu0d5dRJ98Kd4wuCx7kfvZo08N8c/g3TEnFEFrcAhy4A4K+gSOzRyRgH2J6bPU8JyaNrI5u9zrWbXgs6SVORx0rav2JUE9YJb50R+9ql4eOsqP8Y4q2aIIhKv4V3tuXA5TE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777250147; c=relaxed/simple;
	bh=zTgtyyIrynHeifIk9MyaS4R1JAaWT6P0jUM1pXyZZKw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=emovMfTTyuc8A+sRmBJFgrXAF9xC7FVzH7Mq4kuHpq4awF8IBMLoTyLwgg4jLfUpjbWq2dX9VZZS34msCuFi8ZwPXXXprYFH23q+YKCt9QjmdHNQjuGerYSHQpL7AG3XiuA8Q/L3ILffMXUH7AdXyFxHLTGf3yQ743z95v+OQ3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ihFWowV5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P6UFsn6X; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ihFWowV5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P6UFsn6X"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63QKDOGI4128510
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 00:35:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=PhFizofyBtI
	tMc9uyHKH2biJrKAHWnjnPNByrZeBZMM=; b=ihFWowV5s3I1LQdm8Ixby2QOLQu
	NsBhWG36pGx+UDtwA7O3Ij2vx9Y56MjDX1HA6hHjDVEDguqOgdh9C2ovwaMpToOR
	mEbfFdvtYzlLUe+raNcrWiEOe05c+7XpV5jz4kzRZVx8MJ5hKAh+HPp2+O+L83Lk
	M5XD1QrnNIMyP1mCKT3/Dho60qChkOowZLeBnmOPdZmToppVgASfwAieLvcYJgJC
	+pyXkIPxioJN6tHmqBylXRnsfgvP9/O9CoZ36swacrCf/z375GlAqhOnaeT2SSmS
	W8Jb6/6/UXbJkN/fXEUqlShyikM+TSqS8/1y0HeD7srqwSOBHDv0916nJ9w==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4drnqrksas-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 00:35:45 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2ddd8ef5343so9473362eec.1
        for <devicetree@vger.kernel.org>; Sun, 26 Apr 2026 17:35:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777250144; x=1777854944; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PhFizofyBtItMc9uyHKH2biJrKAHWnjnPNByrZeBZMM=;
        b=P6UFsn6XqpMbkJMIal600Mbt74bsFbcK5ztwyj+4qs1T0NOd0+sEoP7NztSFKefDFf
         skpFhj5UzMOiOmdAasnFYz0roFdLy1eVgdBRwUebuQQDsMppCpvG3MJswoH6JddvEHvQ
         6ll7Bp2eVy6YKleZyRugx97xr6gQfVVb8XmAMySwUpziDpiXYAra6KsfKnPpQKR1a11V
         GU6ILrQ7YejuiNetD7Jz3J7pTY9TmE4DmfNKyTxZih4UyEqe/V2eCZ7MxyjkW0e9IZrk
         SZRBVNBEgj24EHoWo/VIl+1djaH94Vw43ORDsDuSg1XJiqObSXlqu6/zA4qprtvyWrre
         a/IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777250144; x=1777854944;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PhFizofyBtItMc9uyHKH2biJrKAHWnjnPNByrZeBZMM=;
        b=SMwpogFvT7HTQCCntz+ZciFeHvmpy9nZ/oIvSDHxWS24Jca4ucM+W63bTzGy8xhlJ2
         1S7uIGLwi4xW9eTWjg9++lQEFzm+Apa7PygmoCtuIYeFCH2oyp2njNVpcrA2LL+xf7b3
         +5Uansp8TeJxxnT17/s+lTPEfHMiN01237TcYxWHqw8qSeJn6QBra0fstPG8fZeS9Cap
         dHuihX9SgIMsavEsFfeUyZEFEey3gImvw8epi3LzAbJiSN/IqNUnGStFbusncxYZaI+n
         Dx9L6w1I+Xa6+uK3J5kRZgT8y4XvMicyRGmUcdG6PuUmMBusmDfM8P7g0xK+ybntGMdy
         2jig==
X-Forwarded-Encrypted: i=1; AFNElJ80xgUnBjlKISeEcMgLmer0eVGx+XBiFXAOJSMpKGiMi9GgoNmh5005SzDIMUMC9V1zrpPFtyvTbaPi@vger.kernel.org
X-Gm-Message-State: AOJu0Yyi1f1xCrlOoF00U4JmCGLLumeAEBvQrBlzq0gsSu2GOp5rsWuX
	hGVgG26DuM0OdZzndQLCmjIS5AglC9VBh87GYXAR/7SLnf2dH7FDnDFk7YsIGmXZkdf638ic3vb
	as1cGTLyN1QHaBoBekoJaqwJhlBvESV2tifjrUfxu9bqh8SiDCYRH+6dd3nVRZKh5
X-Gm-Gg: AeBDievIUTLNhseugjiNM8UaeYcAYiMfMtab2ldJSrgmlI3zI+pLQ6t57eDwW9NRaxg
	3zWzJkQP1hlMxSNgtD9jmky7K8bUo++meqbY7XzXZo5b+uY2GBoow4umqJjH/2gudeuZr8qQ2+S
	CwLmZOnzuIOaLCIjrinn8qaZ3TfatcnFTBb+S5KAtBxpmmH3eDUZaEN9CJCoA/80BW8LCrb2mtA
	CT3N+PVoR1cp+hlMLh9yEcvaP5KsoeQwVnVR+ZIplwsFetfZEAOGOUnhTvgk9gy9cbvx3DGDkYI
	twzKG0sO+rL9XKHPwlwWVgXG6LBtTwhnmFpfahktstp42kUH0Fo+mRb6avAdNbmHIypwYtckmYG
	6y4pEXdMG9VcDe/isC61x3d8kyhTJNWBA4qhy82fxFQvREvldH2Zqwr3eCXX6DkRqldOf9TFlaN
	zzgiXnvdEYaa1OEXxJ
X-Received: by 2002:a05:7300:2d15:b0:2c9:ee15:a0d6 with SMTP id 5a478bee46e88-2e47901662fmr24768176eec.29.1777250144146;
        Sun, 26 Apr 2026 17:35:44 -0700 (PDT)
X-Received: by 2002:a05:7300:2d15:b0:2c9:ee15:a0d6 with SMTP id 5a478bee46e88-2e47901662fmr24768153eec.29.1777250143645;
        Sun, 26 Apr 2026 17:35:43 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e53d2ce98csm40010879eec.20.2026.04.26.17.35.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 17:35:43 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v2 1/2] dt-bindings: arm: qcom,ids: Add SoC ID for Nord SA8797P
Date: Mon, 27 Apr 2026 08:35:30 +0800
Message-ID: <20260427003531.229671-2-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260427003531.229671-1-shengchao.guo@oss.qualcomm.com>
References: <20260427003531.229671-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDAwNCBTYWx0ZWRfXyrIwYNW/R8Uu
 FcSUSQ84winHfsgD5EXqHEQ53+glQjaUCuwZif/4DprBoGnRiv1gPcJfiapMc0sS2QhN9a9YLsL
 1uV+DFU19XbvoS1Z2u5vM7W5IUh7AAdirhif7Ob2wZfBKhDTX0Zu2oZuRw8SaoJpH5MSDfwfZ4/
 yMzGpgWkii41mUqYmId8+KSueR2HvBHJarAooOe9KRRhRrUldEiLG2MqbzYjEJsXDIshTdYMXOZ
 +NE6jFzT/tTouh71lOBFn3vuc20Jckc9b0AhUTGuTIgPusKBZv0ljTWMZMMZQ1kREiXnBJLgsL2
 u/XCemnVDe3lvS6abuAdMldEq9G+8Noer66Lrzdc9SUlXFHkjcnlDYBc1jdXkC6jwBDhJwDwu68
 u4wXxiy8VAx4OQUhz5Cl8ALbUr5Xar9eel60fYne/ZobYzATD3t6vbd4szevvs6rC8GilhvywOY
 jUtzQKv2LEJT3OiGi8g==
X-Proofpoint-ORIG-GUID: qgqgwkE1p3ZfnrANrlNSYcllqvw60irr
X-Proofpoint-GUID: qgqgwkE1p3ZfnrANrlNSYcllqvw60irr
X-Authority-Analysis: v=2.4 cv=UcthjqSN c=1 sm=1 tr=0 ts=69eeaf61 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=v3ITllUuhb3Bg83hOPoA:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-26_07,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 adultscore=0 priorityscore=1501 bulkscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270004

From: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>

Nord is a SoC family from Qualcomm designed as the next generation of
Lemans series. SA8797P is the automotive variant of Nord, where platform
resources such as clocks, regulators, interconnects, etc. are managed
by firmware through SCMI.

Add SoC ID for Nord SA8797P.

Signed-off-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 include/dt-bindings/arm/qcom,ids.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/arm/qcom,ids.h b/include/dt-bindings/arm/qcom,ids.h
index 336f7bb7188a..be4657417192 100644
--- a/include/dt-bindings/arm/qcom,ids.h
+++ b/include/dt-bindings/arm/qcom,ids.h
@@ -297,6 +297,7 @@
 #define QCOM_ID_QCS8275			675
 #define QCOM_ID_QCS9075			676
 #define QCOM_ID_QCS615			680
+#define QCOM_ID_SA8797P			690
 #define QCOM_ID_CQ7790M			731
 #define QCOM_ID_CQ7790S			732
 #define QCOM_ID_IPQ5200			765
-- 
2.43.0

