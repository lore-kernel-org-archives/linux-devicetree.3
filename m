Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25D3336B07B
	for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 10:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782122561; cv=none; b=kWBCyYTYneEzz8899dDTwDpUjExBZQnyZ4RoyvCzMunQo9GEJTCr0uSFg1vXDNz/OwEGmE1/4mcck8E1BjO7qWm5GtZpPuuAodV0dfX8cs6AD5Kl+uHCPfkp2q6OixZKaNNo29JoTEM/7fIK9ES7iH7XZmeb7wIkQGOOViSaAC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782122561; c=relaxed/simple;
	bh=xiW40JPZwqsEYVD6cBQyY3iOM/mpdV4HTfqmrLGjM3A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uSyICimkQuAJGmne0eCRAaFlz2RQ7VaL2GPN3EXplbEoWY8/Mlk7KNNQ7m5TUusYPrj3eajhyqFBywdBSvLX6f0WeEPQ3jqHdy6nQx5by90m2iA50Qrcpl+qSy/fiQjg957lupB9V2lNGEdyOt68jP87Of38k8Usq4eQ2GQO6eY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=auXNUeID; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K/d6Rdx+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="auXNUeID";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K/d6Rdx+"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65M59HSK3800696
	for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 10:02:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=qXMoO+23Px0OwfrZvsqkySjzGHIOA5hqkO/
	MujvCbo0=; b=auXNUeIDYdIHlx9Unqu3NHw5IFBSQL2mz+WU4z62UD2oYLQ7vd3
	lRBwjujuM0FxxUws2MJh0nAvIXFCbCpRDb5mIoShtD9H5xofr3VSguQXqmsO8zJw
	WDdLkYAiwJ29RHxdQ6Yjb3lyGctimZfWxXdcjnkIwbkpKkVxK8gWUlSVT5RTz02/
	jAf/5IXDPEnvFcj6iOTnLKAcC8yEyUnxyK1b/vBaiRePmZa0lmrHhkirKzUEhW05
	nOU/XyFYIqLIJzCxKNx0lgEOj17I49AxXo6K+r+w6folxvfFA87TDHIAP1A2LGyX
	/TtBirUI2IVbCP7Fw7o1UgV2iRzMHky5V7g==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ewm1k5tp7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 10:02:39 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-966c4d26a1aso2423841241.1
        for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 03:02:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782122558; x=1782727358; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qXMoO+23Px0OwfrZvsqkySjzGHIOA5hqkO/MujvCbo0=;
        b=K/d6Rdx+xTEakb3yHs8CsmDgLjmC2RpOgPKaAGHD2arh/cjOIry5sWSC2vPRf7VTgo
         e77XyOOaz3ZJbcLjXGEIrgeTGrtUmZ80kzsgPG3T9rbhp6qeh+VaP1BPbimiIzaOgwL3
         xUEC0rM7fUCv9tL0lfGHCjedGRtt4/fetdg4T0rt4HBp8KLE5a3H41vDqES+Y7acv7g5
         /VKpBO2UYl+ECntRzqyeivnmZEOcsCoxZate9/Qqi72UeXsSyJuJPb4ZSN8UxD+pZNZ4
         jAHUA5wU1JrVV7k5qNIycNv/njy0swnhIQ2OwXK0T2yG95cycgz/3kes1Dpax/qPhqEP
         s8Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782122558; x=1782727358;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qXMoO+23Px0OwfrZvsqkySjzGHIOA5hqkO/MujvCbo0=;
        b=PSlTB7to3KACQf9vDa9CRZLOaJt63Po29iEcAhIxCuH5h0EVhBw8iGkPh6+MTtDKV/
         MGIXDwD7RjZj8FgABP1dB65UPTIFOioOzOG10P6Ko8J4ZUSYHh3HDm0VrjQAR+gEFQqa
         18p4UrH+59TQWJGO0TO9F0EVBNLA3sMXSOQPCnMJnHU9QicpfHRbasqLPLsr1P2ZkQ7E
         K9xRisOrh+/tT9dRe+FR8opcTZJGNVjcLGCy1/0hqG7WNd8IoNBwFKwUTQYhWPRGWHnM
         +bD9FCk77cop6fNDJ1MQS0Sh1zkuRY4lrI5Cl7orV1ecU/CtOpqW1Ps8Q7wwI06uvRBi
         dM4Q==
X-Forwarded-Encrypted: i=1; AFNElJ/BsPeMxxkAXoOmlRPQ2GIIxKkqCRQ2C48OuLqmTawBcz/W4loMg26jVr6kxMlywnZ1udjSKgsyt/ay@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7NotiwHQcn32JOIftqlNXC6tERxaK32ukb+qNJ2dtov/nN+qr
	+Z9/qrGZpNxQHiLJ+wm8elJmTBelpSU4SugaQif4W0CWfk9nOMFOZc64I+rRGT8ikj471JvTrvX
	o84RLtaV2f7aeEzydAMk+pEzs5xkGNZSKP5JkMq65vbeKmrPANUwG3a/r0PXsvLbR
X-Gm-Gg: AfdE7cl6zoySCTTGFFqKjt7Swm5PBrLZrYS0h6UgaysbYSkc0rsqYpAJOBoNoXgI5Qv
	oe3nBwPHwYVEeMi9OxJsrg8GxSxAo2prKOeK5PykPyEifPAKhG2LzhzzpGV3CLsCmzZTHfr/TUP
	hE6RGVcac+uzep9Sbr7ubq7iCVpy0Ms5v/SIfjZ9TCqI5gTm7t81WdE80427fqJ9lyfyNbw6eGN
	6RRf4YizZeMHYqp+gULYZLE0LQadnhVd/qEw2fya7iRpi7xzESwq8F4pbriDXcuiA6fUKfKwtQh
	Z5iZjUGqvgnve39q6z7kF36YX/N9MCcNlAYloSfsLNS70YAUCI3yySlOM5WQzN1nDIGoNo+wmh8
	jTk14muw8ZHWhzunUvB3zB36wNJU=
X-Received: by 2002:a05:6102:5f0c:b0:728:572d:80a1 with SMTP id ada2fe7eead31-72a1f6ec03amr7010112137.21.1782122558214;
        Mon, 22 Jun 2026 03:02:38 -0700 (PDT)
X-Received: by 2002:a05:6102:5f0c:b0:728:572d:80a1 with SMTP id ada2fe7eead31-72a1f6ec03amr7010061137.21.1782122557663;
        Mon, 22 Jun 2026 03:02:37 -0700 (PDT)
Received: from quoll ([178.197.218.240])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-466643f4e93sm26969074f8f.7.2026.06.22.03.02.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 03:02:36 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Guillaume La Roque <glaroque@baylibre.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Ronald Claveau <linux-kernel-dev@aliel.fr>, linux-pm@vger.kernel.org,
        linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 1/2] dt-bindings: thermal: amlogic: Fix missing header in the example
Date: Mon, 22 Jun 2026 12:02:32 +0200
Message-ID: <20260622100231.438435-3-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1542; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=xiW40JPZwqsEYVD6cBQyY3iOM/mpdV4HTfqmrLGjM3A=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqOQg303t1rJeTgKVro56ukNiv21q/Aqa0pd/vC
 Tn0HtAImzKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCajkINwAKCRDBN2bmhouD
 11hoD/9stQQ73qmlHQC4U3hP3M4KnL3mBj6o/LLYxvBvRNPMJX/vxou/V70zG5yHczZgw2bR34E
 9GuXUPAmu5Se62J8QNorNzrfteTZrFZEcFLliFkwm6K61a1Y3DCqWkiZSoQN2xKuqs4LyaFDKZh
 LZYpJbzdEvPWieSRin15LfmjZAIYAoRifoJjS6kZdy2pdWr4CEYb7ubO7DANy0vaLvHsgWlJksS
 KUGuqPjDa5QRo3QCgH7CrYii28rWdjmgQmmTElW/l190DlT/vupUikmqJWCPUqVXVMyhc58jhsT
 5bcvRRqn3S160hpCfBInFIcVg5p3B6sMdduaI0BQfc7szcpadCloosEyLmXT8JSiph8dGLHDrga
 XyI0bwS2bJyxFp1a09dH4W0GpnA+jVRxvM2SPhUGPlLROTa9j2wWTEWEvfO21oEPG6JjyuvbGIv
 t+pXVg+PXEbyn8Pta6pXXgxabphTLbMebdbNiwUllXk6mYLewcxgta4BOptzvlyEBJZpi8GbnVV
 t1CbxDmOc2JOVtJY/aHDVv2jhhN1WI3xpHZAKKHay/Cg0bQNUeE6ICxcmm3sQUP3k3YjDReR7FY
 XQeXmFzhy2WwFQU+e8pqCO0DcbK/uqR5MknGqtVzD1Gt5BQBSCyB/mRT9fh/WWdlUoBwEAwp5Nc hnsvPdYariZq6vg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: CZlQOEBk79fHn24EpjNzBDFWxwx5QaOg
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDA5OCBTYWx0ZWRfX06kekc5+Bjpw
 SS2S9ZJRYZR0bKQk39dkn/52JF98K3N6DXXMfa2Rjby5SaxFJ1Bmx0KHBiv28ABAuo0Ky9LPmcg
 N04wDn31T2cBuuZ1Wwo7yiOkzFaJTG0=
X-Authority-Analysis: v=2.4 cv=T6S8ifKQ c=1 sm=1 tr=0 ts=6a39083f cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=qMZSjPy+XpteAuilWfML4g==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=nNYyxOnhoC1xYqhD2HcA:9 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDA5OCBTYWx0ZWRfX8rcFsNY4hHzH
 X4ntAAXE9ZHh0Nvm7v8ywGTPx3NQy7h1DP9esvmbcqWGZK30y8o5ewI5TYwwBja5K2OKj3Wm9eE
 1BeOCLmGeJ13ta4l3QRmWYQp+galAmXBAJYzyAwpUV0qpE1lYhUgAmTDECmoNJgOUUumyLpVhrH
 OsLMIxDIGLX6gh6ODbhRecF1NVN7n54S1qG8Jx4WB8iIaMe2xtDcYUZWIMmyZxO7yUH4Yey9Hk8
 XCBNTyBa80OSEF9myvHaRrz7PyYO49JFCOqVHNU+j/z9vMtUz5MaOCZTcmmP5Fkx8slkB8uNT8Q
 3YBmUP8oWcw3VIg+oqYG7MQgAvfYLO/j3i5KPNR70a+b5w+Mhg+lF1gbo3Fig8axX2xZI9Kp5ai
 VRpc56ULGusdD23Yqyj1LcYHkUkM16kOdaoYcjSVKtK7Cn0PxBqtTLE0MdbM0yK2XPQ3/ioC+zE
 6e++cL445QDzydosssA==
X-Proofpoint-ORIG-GUID: CZlQOEBk79fHn24EpjNzBDFWxwx5QaOg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-22_01,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 adultscore=0 bulkscore=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606220098

Usage of defines from headers requires including relevant header,
otherwise dt_binding_check fails:

  Lexical error: Documentation/devicetree/bindings/thermal/amlogic,thermal.example.dts:59.27-34 Unexpected 'GIC_SPI'
  Lexical error: Documentation/devicetree/bindings/thermal/amlogic,thermal.example.dts:59.38-57 Unexpected 'IRQ_TYPE_LEVEL_HIGH'
  Lexical error: Documentation/devicetree/bindings/thermal/amlogic,thermal.example.dts:60.37-45 Unexpected 'CLKID_TS'

Fixes: b1c8ccdbd4e9 ("dt-bindings: thermal: amlogic: Add support for T7")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Fix for current RC - commit already pulled in merge window.

This should be applied fast to fix current RC, thus maybe Rob?
---
 Documentation/devicetree/bindings/thermal/amlogic,thermal.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/thermal/amlogic,thermal.yaml b/Documentation/devicetree/bindings/thermal/amlogic,thermal.yaml
index e28612510d67..d8f7f3eb7ae2 100644
--- a/Documentation/devicetree/bindings/thermal/amlogic,thermal.yaml
+++ b/Documentation/devicetree/bindings/thermal/amlogic,thermal.yaml
@@ -87,6 +87,9 @@ examples:
         amlogic,ao-secure = <&sec_AO>;
     };
   - |
+    #include <dt-bindings/clock/amlogic,t7-peripherals-clkc.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
     temperature-sensor@20000 {
         compatible = "amlogic,t7-thermal";
         reg = <0x0 0x20000 0x0 0x50>;
-- 
2.53.0

