Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53B2030C34E
	for <devicetree@vger.kernel.org>; Fri,  1 May 2026 18:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777658767; cv=none; b=YXzALoZdSZpGrjwyOKSPITPFvD4UL2DbH7gExZrKyQyU4rosraYVbRcT7yjjtJeDejqIGh0vpjlyL18YG4RmC+IEu4KpXpBlG7I0U/n75PiAMcOqytVWrMy7f7dOxP5RNjVFAwREqpEpHGhWq1D1WPX8CludP4/aaH8qOgI0N30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777658767; c=relaxed/simple;
	bh=IqJpqOcqeGDRmUnMnSq7T6iNQMa6mErewLZJHnE83z0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=lyOZMWm9aZt58sAjRcZG19dc4YZKWYzqda5mpBlGIAgkTaxjYqFL9/sR465O7JdAWyNKAfpd9xl6wJsrepOkCuz06a/zX71SzpkqPpYeQTFKUGbWgjX4b5ezauPA7EqABXvi5T8i7GJ8jy1zdOhoaqjCA7YC4c7grVjNRQS+nWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Av2I9h1O; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Es3E1sNi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Av2I9h1O";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Es3E1sNi"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 641GLh1J625549
	for <devicetree@vger.kernel.org>; Fri, 1 May 2026 18:06:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ytfNsSNY3xQkbXYwbjLggA
	SDjxHz7IDUGwPrlDCTJD8=; b=Av2I9h1OtzvvWLH6mRrAGSLDvxjTTJ2N669AEA
	n1ZdsCZJD1G4A+UD17LvFuGjPrNyLRc/PtoKeSG9mI3emjRLgh1/FrhRBmYZc5ku
	p6LirQmqvZTm3RdPjktyBsLHnNXsOf6s47TYNJJ3eyx98a3dn1+Y53tgoDrAM/s6
	VLV9Wda7XMry7XoByL4PTwqEtYiuDhuAM+asObkZmzTZWE7VxFXK1QNPXb1k8BxE
	S6iKpUsfYx2QVjGKZ421h1ZuRqJg6b7dho4hBFFejG7vfljh317dNlW9e3owAaBQ
	L7yn0aAijxcOTdYruzvrQGvQj6iRqMOiOGZDydBHx92Pjs0Q==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dvc45bmwh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 01 May 2026 18:06:05 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b9a6d84522so30553045ad.2
        for <devicetree@vger.kernel.org>; Fri, 01 May 2026 11:06:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777658764; x=1778263564; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ytfNsSNY3xQkbXYwbjLggASDjxHz7IDUGwPrlDCTJD8=;
        b=Es3E1sNiWFnf3udtePOTX6oDo/aeP7Ral++sqnf/xV1LNbo/fOGimyd+ttBrQs0MV6
         yRx5zM8hQLVsvpEkComL0y0NehLsD5vPK+CDnOxhRwyrn4cASnpQnN6bnCxQzWFv32B1
         NIOwVFIFgK+5Dyo/dqhtY8VZK0++YtMYBlQuZPU3qwTtCCBoCzmPPfnvfud+Ufy6GKOT
         ZkNgPAAaUcKxoKOPjIR/W4bWL874f1l+XJ+tvWRK3EotmKzzBrSb2femKqnTi95ples+
         qYIHNDd+DDGe6wnoHRI9ru9PTQjwDqo9JJgq3WPztbt5oCr91TvAQWCycNhurFKfQQBV
         A7Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777658764; x=1778263564;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ytfNsSNY3xQkbXYwbjLggASDjxHz7IDUGwPrlDCTJD8=;
        b=TWoGrXNcUsFBBsHt8DMQZk9RUcym9oKdzQCnDri2GbBKWiXRdzgBYzDqiJUyGzcZj5
         vW2/wXoWUzqKRa8NzPQEItvYP2grpZCclmQjRecMucgY7xr3k2lBBnZoqndgKy/5rNBW
         EI9aMQkK2UT7K1cPiWtgZSQhsOdz71b6m3sl7Qm/QWczciAZO28TJaa74zWaOwuk6PDV
         VdUk3+Ixa8Dvc6qzT3Ppva9roTdFYv5C+/9YPcQ7o/IazurWCrElY8eKFOHaagpcFNC0
         OTOUVUTBP9Bp10XN2cbkc1aKjLUE4Kgj4h0ybNn1CCg7YkvaIQA5o5gf9yurkr9lxf1t
         dSEg==
X-Forwarded-Encrypted: i=1; AFNElJ+lwc0Zl32Y8znJilFu/qsn/F5XWy6dak1+/OsV8f/E8KLJCeu+kSBrHKXTnjzuQyECgRF3toY27OVt@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2O7kClM6HrNnbjSeAFHaWkft6BTUSRyjZ/oAKqFKABanFgh55
	i8MZi/rqSODe8Aqzat5o+T6dq647pAR5Un+uh6ms73w1tP2pxzJkVR6aHwGmFit81kyQz+0b0XP
	dzKILXlBQpqUpvbG21Sny3QGlrLCz7YXcMMYvkG4AGwICd7hsDJCGw9b8fPVW8bbS
X-Gm-Gg: AeBDievga58bx9vhNig9Mze+9CbcCouJsFC18XUruJjjemY8VPlIkNdBmEn+HIuygd3
	+YOUBxImrp9Ejx6xRB05NYJd3O74y+sSVs2I1zCV6L7eE/ldfpHucR/1g3swDa+U7U2LS8Haq6h
	BG2jEQgjJP6tCUHkNSvHm03WTQrVruXrHOxMazy2ZCORQHLggTly8+ViW7gGMXncl0Q2ltwfsqH
	sXl0wbSgSoywdIPmF6gTZr5f+uVbZRJSpNI5v94LPs8ntFWTQ2YY0hvvd48KRwiAc39eKKZPJSe
	QLxE4tVEaz3mPxvkD3dh+daLYmSI+V7CbePqF/wQHcQnkGHYyGdQgKF75VKpo8QuRhhmzRfFGpP
	b2fLTSPxVo7nzJ3GDSlpaXckgLqAIcG3/371kEw17oBWcXww=
X-Received: by 2002:a17:903:178b:b0:2b4:5cea:f61c with SMTP id d9443c01a7336-2b9f253256cmr2500435ad.4.1777658763937;
        Fri, 01 May 2026 11:06:03 -0700 (PDT)
X-Received: by 2002:a17:903:178b:b0:2b4:5cea:f61c with SMTP id d9443c01a7336-2b9f253256cmr2500135ad.4.1777658763408;
        Fri, 01 May 2026 11:06:03 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b9cae4fd16sm34804905ad.69.2026.05.01.11.05.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 11:06:03 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Fri, 01 May 2026 23:35:49 +0530
Subject: [PATCH] dt-bindings: watchdog: qcom-wdt: Document Shikra watchdog
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260501-shikra-wdog-binding-v1-1-fd8c14bc2d20@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAHzr9GkC/x3MQQqAIBBA0avErBvQpJKuEi0sRxsCDYUKwrsnL
 d/i/xcyJaYMU/NCooszx1Ah2wa23QRPyLYaOtENohcS885HMnjb6HHlYDl4VEqPym7OaOmglmc
 ix89/nZdSPrJVO3RlAAAA
X-Change-ID: 20260501-shikra-wdog-binding-33873dcfa81f
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-watchdog@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777658759; l=1019;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=IqJpqOcqeGDRmUnMnSq7T6iNQMa6mErewLZJHnE83z0=;
 b=rx06YHRgOOLbElY15UCGfPTvLsZqgFYqCVfvPklf2GXdyQx84vl39FVw4v5tygvaZv/aaoi/o
 vdK1l7JiaQUDT1+FzgZyXANUs6rrCL7weSRT23Pz6T58OirSoFC7iIE
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTAxMDE3OCBTYWx0ZWRfX1YMO/Qn/7CI9
 hN8BHnMyLm1eGYE73myqkn73LbFov2JGo336b6/kNpLaH+JX3FqPAea7VlCmgJ5XBpMHMFyauUj
 L0QzZJ3hewaewBZN9NueqJ0qw35iK5dgrH2xk6JicM9GZEQ+MlQj+Dpr12Sx8xy2WBpn1HuEqDY
 IpTa+aBVx6bZ/zr/cx3tOmuGwa0YzVeH+zEcw8TR+bMqYkxDSm6rg4iQhsb1983QYfq9yuNbdbY
 5SOuaKjNDhM6h/q19m7SBcY6GvvRCLIk7V2wY1l4tsBUJhj3X+hysMgn5U50hdL188GXWRB7VP/
 vbVFrVIgdqhiDLUpckVw43/J9/Z6Mk9c04PS4UkwImC5Hum0tEzfjE9zyXeBVkzKPtmEBJIZymJ
 w0+U9eZtYWZdfIIboUSjD78z/YsLnsPoTgBdqUUu/l9YTNDDbjWCbF/AuYz9q6PCovUl9tCNxnA
 G+Gltf6ynDjkthHm7+w==
X-Authority-Analysis: v=2.4 cv=DP+/JSNb c=1 sm=1 tr=0 ts=69f4eb8d cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=DX6wD1BsUSLyRYCk61sA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: F4JKIuEtupb81rawliWhEu7q110V1nuG
X-Proofpoint-GUID: F4JKIuEtupb81rawliWhEu7q110V1nuG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-01_05,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0
 adultscore=0 suspectscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605010178

Add devicetree binding for watchdog present on Qualcomm's Shikra SoC

Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml b/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
index 9f861045b71e..69ab3bf5db90 100644
--- a/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
@@ -40,6 +40,7 @@ properties:
               - qcom,apss-wdt-sdm845
               - qcom,apss-wdt-sdx55
               - qcom,apss-wdt-sdx65
+              - qcom,apss-wdt-shikra
               - qcom,apss-wdt-sm6115
               - qcom,apss-wdt-sm6350
               - qcom,apss-wdt-sm8150

---
base-commit: 39704f00f747aba3144289870b5fd8ac230a9aaf
change-id: 20260501-shikra-wdog-binding-33873dcfa81f

Best regards,
-- 
Komal Bajaj <komal.bajaj@oss.qualcomm.com>

