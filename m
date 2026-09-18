Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E64F848CD7C
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 11:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789729291; cv=none; b=n0LRJX6lr4/gLkGiJkln+uTpfkg8o35vErRm540WcgT8xPx0znAGgtNHarILkO10zw9TZDXqXlK2zeSdGXASFZT3yPQfboUaeu0YZ6U8uczjzEUcyfQaFS11RwMXseDX/j7jRN952RjAf3hcYxSDpTMalQUw5EZfFlpU+T+BH+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789729291; c=relaxed/simple;
	bh=pHbBz+S8xEejNMUWSAFZbzLNSweTHGPtXBRxivMnMf8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qNB3XSE7sa3IiLop5Ed8EtNE+lTol288RxoNYE389oyLWbxhW71jfArBtRN6EGuXFQw6Kg2zA9ncUwDfyBc3BB2lCrX0gbSICRM4ndJhaRe0lVabnPEnInXlG3synQ+O9XImh6YxBAxvg7i6v+8IP/LlvC5cKgY8rHF57BPPIII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Sbw5he4U; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZKLt81vc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Sbw5he4U";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZKLt81vc"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68I9dScJ860427
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 11:01:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=lWswSoekF7IT3Yxcc40Z7y8MoP4qOcIdr70
	QbS4iBZQ=; b=Sbw5he4UvXM3m6BznJWgw1QUL7ZOMlWCmO9ORrPOowV7n+hxyiO
	AkZLqUASsKF8oOAKXgTTle6uGX2xMJiesScLKzyuon3GBqsvq/66P5RZDzCZw+i4
	pNesVP9YvmtnpfPtUPrmYcLEcb9SglgWIaZ+swnW4UNkioKBBbvKNLfglZahS4bu
	TPBcrtYCHtLO/u+I4Cenn7za6PZTMR36KvZ6MsI8MITarrOogfqRRfLupPAaZVHp
	9nRY4z9ebwQTgWMosRyD+n48OGe0SyFFDRGidcUCvUi6Hjt0NuDEZnTl9ZA0ESn8
	R45UruT7LTsBrGUfRp4E7BHX0rNTDaTmN/g==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gs2hv8cyv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 11:01:28 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5c851df59edso148381e0c.3
        for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 04:01:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789729288; x=1790334088; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lWswSoekF7IT3Yxcc40Z7y8MoP4qOcIdr70QbS4iBZQ=;
        b=ZKLt81vcL46+PyyRZNZSxrCm2vdMW7kwCpERhIGENcLfirukC1gLddTNCePighwQ3k
         8f1bqPX/weqBWyLu9H2SGYyZRZc6i/HX9krXaeX6Ho6wSy03cJvw2sBDSpQn5mC+gSMs
         3lLIYqrEz7h0A5f7pglhcltbZugQD81uJN/p/2ZRMHcE30R2pkvia6TXVEDOMo3gXIy6
         VWakm4TkevKI9Up4xxDRbdxMF5GSabSpiwfozhhO7iRGrikQTD6dgJHJ0BoT40odI4oy
         51NRvvZu6EsMeEkJgR0+e+PMIAOFTBHsqPusLUYS8xwKEoL5DE0yppyr73Pok7GLpfd0
         opUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789729288; x=1790334088;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lWswSoekF7IT3Yxcc40Z7y8MoP4qOcIdr70QbS4iBZQ=;
        b=hn9q11NntIfDOahbf371+SB82/k51QK9teNs5NZ3tClKYe9QCLQ4MOqGJfKarJLhTI
         YRq/g4Oz6ypxoGViVjewAQZs+RiL8deCpsUnqe/AE+DgdqmqXqAYd9Y+pYLosGHp5BwG
         kDZ7bYondzvrumbN/bqNGWLPBIIYVqvvrqp5aljBGF6vEVClrEiP3OJE4n9UCVjMUo0/
         w9VDmEzIVL+MrblDvllLehMSpaIl8DkGYvKtMykRjAhgsZ43caqnGot/L0uUNnEAwkIY
         9cz+k5lKMf4d76MwRs23MJZDCfXiUm9IC1cCQFpWqGRqjDAPgp2eSdMWWFGHng0T2bQi
         edPQ==
X-Forwarded-Encrypted: i=1; AKwUvBzdHKWJyJbOBPJS+Tw8Gwt51YuQ3t4cmz1G4FYP0XsikVqQ60emfC/p1gsNyDw/gcJwIdimhqRb7030@vger.kernel.org
X-Gm-Message-State: AFuF++lTlolIVHr8EK2WUeXYGrD1lWy8kB+ZJF4Kft4KBZ9G18iMopEZ
	pG9HwqirQ3pn0Ed3MMPnqWMuuADVXtUrWsZXnrPo1unPdx3ph7XI4EIIuNzV3C+LnoX5RFH6g1w
	qtY5oX2WN5u6H2se4StvABp4CQd0D/TXEaNraBL5Ydr6pAeRtJmVru3ATWk6MiBPt
X-Gm-Gg: AYBFou2jvVrKlQ6oiQEfJBcZFdj3ltgnDlKGonsO6GGnlJpc35RqqyW6P8Q8xaLxJAL
	E+RKDdyvghqxA9qUWX6bj6hpFDwN6r5oWrVexhge3IxhPY1C/TEtwizSSuvsa1HvoEiR+fWjsXl
	BfU38Qiq1R+vDCDwYg1YdsNTofJsaTMz3vcNEaDPtMCvAWUdCdPNymAFK82KBSGADyJXQTpcdtO
	51NjlMBoW2V3NcbG3AzWMal+DtjqXmP74PU2bP2qW87SYjEAj7Wsg8WJp0wda6ilgUZdayGg4w8
	rKLdP8rlSkouwY+02fdLOyC6Cm+oZggwUuLlPSZOZ0vSVQKhOblOySI3lwBlr+ZWJdz/MI+EftH
	qk8pnA5/ytv08pBM=
X-Received: by 2002:a05:6102:41aa:b0:7a1:f951:f2fd with SMTP id ada2fe7eead31-7a55c8841d8mr694326137.16.1789729286845;
        Fri, 18 Sep 2026 04:01:26 -0700 (PDT)
X-Received: by 2002:a05:6102:41aa:b0:7a1:f951:f2fd with SMTP id ada2fe7eead31-7a55c8841d8mr694082137.16.1789729284751;
        Fri, 18 Sep 2026 04:01:24 -0700 (PDT)
Received: from quoll ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc56eff84sm41962245e9.1.2026.09.18.04.01.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 04:01:23 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Marc Kleine-Budde <mkl@pengutronix.de>,
        Vincent Mailhol <mailhol@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Aswath Govindraju <a-govindraju@ti.com>, linux-can@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] dt-bindings: phy: ti,tcan104x-can: Fixup unapplied constraint to ti,tcan1042 family
Date: Fri, 18 Sep 2026 13:01:17 +0200
Message-ID: <20260918110116.94024-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1149; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=pHbBz+S8xEejNMUWSAFZbzLNSweTHGPtXBRxivMnMf8=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqrRn9JeRDJ+Cu211xd7NxyDHXSpUbSvXvI6xDR
 z8uWbYaj7SJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaq0Z/QAKCRDBN2bmhouD
 11vpD/9F4q+9DXtX1IBVN3COr3L72i22jCFz+K/j0McOx/eFWpncTlBQJWqmdFeUfcR1a+/B0ww
 eTpexVvJU0qKOFzn89HChWOcZdgzBV53hTGXo9ert9DTKQOSTuhoLn0rJdGKCLrf2ZRImYBxpjY
 YIIfgtQHUeaPX+zPdbPlaUP1oJI8PgVhQSBXlHQDru0t/4YE8NEn38vjsVXWRJ3SB6gV6XaenK1
 EiCVSDqB46QGt2CEwzIRDE41sR1/krWJMDVoc25b9gEplzxoJYnoMDRju8+kiLwWA1carL0qAaU
 Q6LtSvDWnQd94eIE1PBjVfx/+B8y5rNTg77CwkYVpjDgfYKgDysaSEQYp3jQa/fRhHbuWvS74sE
 qbSLt8WR8rjRG0wekHCVLa+swed9nnogq8+XDyjro5sXTymfXWk7jN355lcTmbQbw9JIFbV4oOX
 4KJSgPuSRcWBpwJSXBBt542PrZJNCD7egyS8smaKekVmEPExXew5teimguv1GKTXVz9NBfBPhzC
 pqMFEJLQd8oEPER/+82J3XbOFrg94LnL1fjH3xULv/HpvlBPUMHqaXRW0bmDopo/ujLXKKFjNPp
 AHEh2E+daWDu5e799/dqCNIj9fKA4xc7SZsK3Nx+eMk1tvzkoc2QD4stlQwQIM6eSSWp5F2ZIf0 /G1G6ZNrVpYEk/A==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDE1NCBTYWx0ZWRfXzmGR2OibVB7X
 mu0bW9wsHTn3VuNKgRH+RRQUOWjsQVGT7sgWQZKHsw3H+o5YP98JwTaUe0Dymlh5wcUBuH6TgGM
 bEBggqdDyQZ+Gu1tQOdEW7/AMFDcBFU=
X-Authority-Analysis: v=2.4 cv=IOWXmQvG c=1 sm=1 tr=0 ts=6aad1a08 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=aAtEoCzvOngrQmLLZK8A:9 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDE1NCBTYWx0ZWRfX4U/rnaqenpfx
 9Z6WUSFm0fsXU+RZTPdBwy/Ye2zPGe1ycxCMJaM/nZEOR+4+hI2Hi3v3mEGsI2XFhpW0Ofkuj6o
 3L8NoixWMkVAm2NpVPDYS1+05fIGscorTPSJtWcivwgP46LHT8eWATA9OwfOOtFwQrnuWbsvvdu
 o/iXKDczzNDQrAoRxK5pC4+f5y4ku6/16+SJysrgzTySxPwd26H78Dv1FTwZnIxSEyncNQy46A9
 Ws/H0/i8AlB04x1iR6SxlaHPoxforQ1Tw5adE2UDioMrsSvu6I2wQXpR5NrqHs9GupCHfRuL8ur
 JXgFEaxuufMEVOEadIZG7oKa9TKL5MGIRdUZeySdeVaXtWNItgYZzLn6I8/PrRchKGolGXyzP8G
 hyF0JE38vC4AqbVlwD8C+QodGGlP1jQzLcEc4YrVlWVedoDDucs2BKRJU967vYXuZ+uwuZGLZiO
 Khg9aa9+nc60qHNA6uA==
X-Proofpoint-ORIG-GUID: a2GXug1cDmc4RwT_zsYLs6OGkAQkeckM
X-Proofpoint-GUID: a2GXug1cDmc4RwT_zsYLs6OGkAQkeckM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 malwarescore=0 bulkscore=0 spamscore=0
 suspectscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609180154

ti,tcan1042 is also used as fallback for a few devices, thus the check
in "if:" conditional should use "contains" to properly validate these
other devices.  The other compatibles used in the changed enum are used
alone, so it does not affect them.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../devicetree/bindings/phy/ti,tcan104x-can.yaml         | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/ti,tcan104x-can.yaml b/Documentation/devicetree/bindings/phy/ti,tcan104x-can.yaml
index 9f5c37ca6496..0cf5fa21106b 100644
--- a/Documentation/devicetree/bindings/phy/ti,tcan104x-can.yaml
+++ b/Documentation/devicetree/bindings/phy/ti,tcan104x-can.yaml
@@ -71,10 +71,11 @@ allOf:
   - if:
       properties:
         compatible:
-          enum:
-            - nxp,tjr1443
-            - ti,tcan1042
-            - ti,tcan1043
+          contains:
+            enum:
+              - nxp,tjr1443
+              - ti,tcan1042
+              - ti,tcan1043
     then:
       properties:
         '#phy-cells':
-- 
2.53.0

