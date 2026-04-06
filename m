Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D244F70809
	for <devicetree@vger.kernel.org>; Mon,  6 Apr 2026 14:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775487075; cv=none; b=blVdNdlYT6xjwveACsWwWW22lA7FqAmqQ6x3H84W11vojQ+7M+H7XGZJmpBm6BnPvX98wu9X+x4wu8jtYznHdfzRr7H7VG+OM2bAh/fi0X1zllF5QfLCGN8vwG3sLR5a+aK3x3bpPFFYU/TIwYKXr0DcVoDUEJTX0aODE8PIqkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775487075; c=relaxed/simple;
	bh=TBtUiNLWVef1yRLZt7AjDPHCPv1bqI7ArKBiSjhMMSo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lq9IBpI+pyMvVWsfvFr1b67n+qmH3j2ZEcOoA7LrAD7Oqxqz2bCVDVRT6ysRpVcB4mfrC3PNWpmzsf+Skmysy083c3CrEbifCtu5IfPYEA5XJeiLFZ7sKikHkf4sMXfz7aivGP++ahhXg1FHfYZDss/dCVjNyzF2ihjDbYYu42M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JlS/1kvK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bVbb+/kN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JlS/1kvK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bVbb+/kN"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6368ntT12489320
	for <devicetree@vger.kernel.org>; Mon, 6 Apr 2026 14:51:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=cmdui6OZNZx9rZxkSCXvzaCXmT5tPpovvNR
	+KtzN/BE=; b=JlS/1kvKBRR/AmiFrsMgPMLZkFk0asZuxev8r8nuAJXxL8rXHza
	YmdutxP0r0aboF13BWSXm+wpTLOza3kUPdmqH9kG4hVl6QKf51+ho8QgviitJ2Ck
	0/yAL4oWztJn94X8mpi0/zKnvROMWAN0+oR9YttnT2GJ8Y7yC5bzQqSwlBPZOkbE
	LpD47NV8zTNYHBPYJE7YJ/y+YtG6ZOrQpH3Qavz8AYCC7F5LmkGZMisdsvT/XPcU
	BSXCHhGUIMygay4TLGCmOTc/agMGh6tixe7uLWrYV4xWCDMlg7ti1359kEu0+Ucx
	Q94wXS7KjbrgSi5ZgvMRaoMebfboxw3/+vQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4datv1dg0q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Apr 2026 14:51:13 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b4987c698so109671201cf.0
        for <devicetree@vger.kernel.org>; Mon, 06 Apr 2026 07:51:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775487072; x=1776091872; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cmdui6OZNZx9rZxkSCXvzaCXmT5tPpovvNR+KtzN/BE=;
        b=bVbb+/kNVv6kvCO2XuJw9os8JdUj3uEk1sU+YIibPrU7Njf6JeQRq8Jc2X4hwY1fxi
         8FVYBJ7YNvY6Pyx+EgKPPanu44jIcj86rnNDKvezNVYpgcwLWXV9hqXnxsIMBhAiYy4d
         iF3m8Twn8I5InnrNITCWdu5m/VL67DqrN66xP/LyqpY6E47o2HEvuhV2svkbIcEgfdTr
         vQJGdDwaRGaOhkVHmiT/ZpLa6e22qOad2yYAaWwuIF/iBvFCj8PPGhcuqKNSk9oZKXEI
         HA0hdJ9K159M28v4xX1aur42oiLCqPMa1kPf68aVBd7ulxey4liVU1cIEgMCFVQysW7K
         4rNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775487072; x=1776091872;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cmdui6OZNZx9rZxkSCXvzaCXmT5tPpovvNR+KtzN/BE=;
        b=CNDA21454xevWIc/BYdGwZPmdyU91wmzkldmCs18aFOxbRWqOx8TWrFuyQ7vHF1BA/
         accmYujDUuKvYXKm9LyNWDOQ7EsjcMkU/362JI24rS1SCYjJGjEU1IS0l5tO75C+8cIE
         fuDfJEiedPukmjg7qj5ysIpGS2wje+ktXvuhFnhL/EFLdlF5buSvVCRXml9xnZ6XZsWA
         naSuJVN6kimFX3NLdF68p1RauhcUrARaT5gMBIDga9Pg2vu3uNSQ3nIbO3sz9BeXSMgk
         VYMEp6ltgMroXpvgU41vQhVXR95sBk8gY2WOQs/Si5sefDZ1Azhi0esJVd7SsDL4KTj/
         axhg==
X-Forwarded-Encrypted: i=1; AJvYcCWqGyOyzDWkqv0emupB6DTi63BEC5Hs5d87Ale57P8xRu3jsnuRgX72PsmZJnpbrwep1Y4+whpA3gpY@vger.kernel.org
X-Gm-Message-State: AOJu0YwiC53g7fvOjaOAj+BXi8Z8AiZSK+BF9iUcWYkV1QcKxUwMi7LT
	UlAvmboQYDSaLh+MN5XK+CaoDcxalyDT4ZW6Ryi//72vkUS1a670t37HRQh5a5CH71UPcS5lly1
	ernQwCWtDapPCXgFQNCb1V1qwf3LjvdaJQNJurDPNtRRZZg2GjHlH0TB4o365XbTC
X-Gm-Gg: AeBDiessYAoZAEIIAxRfVZ7Dyo03tXIZ3yA4I4L+ZeCW+NuLE9f+ZTVt/efbCi5vLJ/
	myClKjY/Lz8NXO0kbbluAoaS6YhwIyidx4C93vTLpn5iciQdgGB3AYQuWSKqjT2VFVkaRtllpLG
	ltemgxEKGu2iJYOvPtqYQp1EE28f9bnm0P7D6+qSOfciP0ozCoEDheyWisEJFMyh78UQ0K9TBK5
	c1hUwZ/NhUycANQwJiX9cBQMqZ/vorfPv/zOkAdjTS5yVIRec6fa6l3hf70nYLx8Ji6bBy7E7FB
	eG/ifzxJOOVcocToETuAGWanJB8I18XrDySI+fIlStD6RqjuJ6AlPeP8LO0Yaft8XHiIC2mbi93
	wN7zvI5bLInh6AWXJQ6O/vrLE2V8LKz2/sgFo
X-Received: by 2002:a05:622a:d17:b0:50b:292d:94e3 with SMTP id d75a77b69052e-50d4fd4b09bmr198475001cf.42.1775487072145;
        Mon, 06 Apr 2026 07:51:12 -0700 (PDT)
X-Received: by 2002:a05:622a:d17:b0:50b:292d:94e3 with SMTP id d75a77b69052e-50d4fd4b09bmr198474431cf.42.1775487071722;
        Mon, 06 Apr 2026 07:51:11 -0700 (PDT)
Received: from quoll ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e1fe0b0sm42304284f8f.0.2026.04.06.07.51.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 07:51:10 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] dt-bindings: thermal: idle: Correct node name in the example
Date: Mon,  6 Apr 2026 16:51:05 +0200
Message-ID: <20260406145104.36472-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=973; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=TBtUiNLWVef1yRLZt7AjDPHCPv1bqI7ArKBiSjhMMSo=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp08hYn7N1nOa/DY3yGgkV8EXxmuEm+CxDgO0zG
 gfZg2ocG2KJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCadPIWAAKCRDBN2bmhouD
 1+h+D/9lyaujqynv0h74OI2ZZJQuJntcgr67JhSYdvwy82TVjayjBSWc5bLau8WzsyTjj42hXws
 mgiE8kBLsgDeWBBn84Eda0197qCpsO/u/P7Jvh4Hl9uBm+w1FXb2VYHw2c0w5pWGsGHmcxDhZ6L
 Q/Io+/t42r4jhhNUZO+gb+EdaO6FOCKq/1eelOI78frYsro3SAgTX/lmgN9w6Rnyhj5n6HYq8Gx
 z7IwIz9oHRmFX1R9ga+BppcImW5sWqQ4kTj1rbQ8Hed/Rl57QKYtdXOvpL1YV5Z1J/ZzpRIrvYL
 /UCYTpW/BSMG0xe5xmQGXzEg8FnzcbGMZJIc+UkcdmJq61spVt6kwvJ78W+K024F1g9rj4TOYqK
 r7pH/vuyjcoXT2pl39BeVr2OZmz8zgF+DdpphsKA4YLm/tLhq2r4T8rpdIXIpA4jjD8iIN+mgb3
 vTIsS/DxaZCRE5DAwyDu3te0oraNOip/CoFI8ALWEm0335laLkMTK9IB4DctsVVrwE9C/BvX50y
 vcxXkwk68qt04mbOlhhquyubTpS4dCkSvgy6brcYND6VsZchEq+JrDQTqf4Mx/hZQ0DpZDYvXYb
 DfcBK0hur/6uIViqMH8/+8K/pcjoqYmB7rMRelTz+mGojJllNEGJiEg1yAxUa2948twQbGY19ZT IM77fK4Rdn+goew==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 2Jf40smFiY0EYuUPzuqIP__o1pEwXM4z
X-Authority-Analysis: v=2.4 cv=GLEF0+NK c=1 sm=1 tr=0 ts=69d3c861 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=15JTBmo6KlQdlkuTai8A:9 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: 2Jf40smFiY0EYuUPzuqIP__o1pEwXM4z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA2MDE0NyBTYWx0ZWRfX5zxlq3hcm95p
 nbiHQsyM0zd98J58PtP0mxduDYh1YIpDHuTJuu14tI1yTX2/YBBzmxQ2mVMGzasWZ9SiSMYRz5x
 ySMoMYJ5l2ifucLnbyu+tR3q2WW/dVdSk/3JezDF2zwbH4w4TeTa1XMWVkCg8US3KexnjdGCKSH
 hwNxVaqRw9O8r7B1s7Qp1xdkM2bEJjMuwjZEISQL/FEzIX1oaF6Pkpo41WqSfwLVzhB3HgQHqMv
 CmEA192XRQZ6jmR24nEHtPe1DO1v4URfdJOmB2VUJfNybc6mOitO8CSGnQAIc5IIaprWPktXKLC
 1RS1sNeBWUVhGCNu49aKwa2gh6RZM7ZVysbWuTJu0/lqnxDFzmVZGrJv1lMhMMeex73cglukmt9
 oojIfndy9TypWogI+EZ9tEcQJ3gDKeqheckpREdBjUVpC0+FhXsv7edCBXnKIrxPbpJoGUeGLt7
 Z9/PIkmZ0xdG38m0OPQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-06_03,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 spamscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604060147

Thermal bindings expect the node name with all the zones to be named
'thermal-zones' (hyphen instead of underscore) and also DTS coding style
is not to use underscores for node names, so adjust the example code.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/thermal/thermal-idle.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/thermal/thermal-idle.yaml b/Documentation/devicetree/bindings/thermal/thermal-idle.yaml
index 1b77d542a7b8..357699b50c68 100644
--- a/Documentation/devicetree/bindings/thermal/thermal-idle.yaml
+++ b/Documentation/devicetree/bindings/thermal/thermal-idle.yaml
@@ -101,7 +101,7 @@ examples:
 
         /* ... */
 
-        thermal_zones {
+        thermal-zones {
             cpu_thermal: cpu {
                 polling-delay-passive = <100>;
                 polling-delay = <1000>;
-- 
2.51.0

