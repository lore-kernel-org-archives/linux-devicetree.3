Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF4673ACA65
	for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 08:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776070799; cv=none; b=ChH709SR7MWSmfvh5KAD0J82O6WKoDLiOD/P6iIGGe2UF7tXtVZtp3yuXH3j8OyOtFm+CCVZEPBrnyFCCBd7bgUDk9YyqAAncU9/cz0LWvTH3IOYk+Rf0cj6pgM1VO3OPvNQJaegss4R4L5nFxqdq2PJZy9JYzJNmEhtWtvG/p0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776070799; c=relaxed/simple;
	bh=L442J0TwwkkuIUC8FYLtsVKcRZ/d3ytHa4etGdl3Eb4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DK9DVPmbvR7JOULQGCd2MMH5fGVyqh6uiQA7NoN/+pms0U3zh1s4Ho9FlDLwcBoX91Z9BWxjcjkDUxpU8FVSR9FBYz5nl90E0miecWsgpYlDlrbffOjH/JtIk6KxSCYGmGU/XDzerjnZ6VDiFiU/dl9A5TQ3aIpN/6Sab/KFG/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GBSENAhu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dEmBjIhL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GBSENAhu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dEmBjIhL"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63D74ZHB1716509
	for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 08:59:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=PkRzWo8rUsGFuiJvzYXey03vyXqqSNfhJwR
	0OAPDinw=; b=GBSENAhurBow5OKvWIniVryoqZfOKcW2NRv3zcX0ljvPGWpHlPb
	ifAPMFHfBUZ+qfK1P5XzRYDE9FO5hlqe5wjgQ4OXBjgBMiRpEy+ORghG2dOKWL4Y
	NDEOf+ln4bmsKnUlPSnnSk/GXWi686M/GCYwp5S3hVTFlHMQ4NDPiTDLzzPHNj/1
	YPuL2f9RfYnaNFkcqrdkArypype57F9Scb1enazrkAMFqJckmiuFcepSrV7N+Zx5
	SOSDUKIR/dVkIClTEZoYhCgTknairwqT4NgmH8kfSpeMhkbHhwzrO1EHa4phtsJm
	oXvicdAprjuMxwf81X4vRlntC0xC0Es9mVw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dff0jvga9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 08:59:55 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b4b81c632so34790531cf.1
        for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 01:59:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776070795; x=1776675595; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PkRzWo8rUsGFuiJvzYXey03vyXqqSNfhJwR0OAPDinw=;
        b=dEmBjIhLVzKKtlfujTmDPnYOwYHwW7CMpP7KRL8v0v74VCb26uFAXLxo9bJoRzRT0I
         AmaQbkrxG6VM4NYYrNGBBD4uItFpGQIYEVWnQBV9zLUXgRrokvIVHaJ/lAzUGY2p6eQX
         J7lFhWQ0XDZMPlZEbkQnDYJkF8Y9gZvaIDdCEx2fHyF1k584kut7rWSLb8lraBjFQmd8
         bLNprARE6NEMilF8pNd49ay7CA/3vz5gtE3bS/e6/5lVuMqoRoxqLn/VYUXjhiliGC1s
         a+dHY3pooB/h7Sop5TDeRhUbrkfQuxs00HFR5fu6J0P2De2IKIM4t69mv829x+jyDkfy
         lNTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776070795; x=1776675595;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PkRzWo8rUsGFuiJvzYXey03vyXqqSNfhJwR0OAPDinw=;
        b=dl72xzWdksL6d9bYj1kk4rLPGzks4onxra9ng7hfZPUvzsHKTNC5KocXN6nMjXS5UQ
         Ve9l015ZhwbAAsMPAv0xKH3Rp+hq19lTX/iT2XxWilc1afvm6B4IRKcvlPX5FWSUftxK
         1OV3hFDmaMA7ExFn1Jtqx/oCSJ2bQgt/XqNzt0ZlqKPTBypTVsL4FI/Qc1gZQoO4TG1G
         fD0BcmW07q3PRccOA/JqbjXfc/X0qosmvvRy2+fVqUyDcpdEoFcFTwXB71jfDrG3RUOI
         us2mHDnNlGGI9xRKok39bNeszzuuaMhLePhlMV7IEPeeOyId2K407oeUYkI9em4GMG42
         M+Tg==
X-Forwarded-Encrypted: i=1; AFNElJ9eFDBVokGkvtecH/iR0t2xVQoKuRwt4h7sBjHKlVJR0Ury7sR4JqrrjzOl0kOn7I+3rod8f0Kcz8+h@vger.kernel.org
X-Gm-Message-State: AOJu0YwstbJQ4zOkn/KoyMCJnDQ71qWu25IRxjDF0jRVREdhfiiviBpj
	z3gzu1DFtISCCFpTkfHHrhCoJ8YKDuwSk+mKecVyJuwP/hnXKrssaq7GxRcoVxOKM1jFLaQNPbg
	OAtoXLZrt4irIaOsnmX86Ca6cuBSiANPobs1J6VUj9EdPzqJNoa2uwzFuhfuRjcPS
X-Gm-Gg: AeBDievBsD/RahoNfk6E37hCQbn8LXfbSc/UU8kFKtqguhuf320AaaeLExAm8noyUwg
	7u2I9RoZFSZ0MGn2fpa59Gk2v02VY5+1qfNULhomauGIAHyYytTcgwcU37BNZDJcE1RqJRYJcNd
	iWSUt/t2bBj5NJygsoweynZCZRkvP5bnFGZIU/lPfraPN+HvIICzJgRkkYIg1KDEvS9b3mTZrmL
	6NicHvmRP9KimlGQ1E2XWOzIVCqgIaiA69VfGaElaGuIX2qhsAe+R/DtZoWRsSaTb71WOH1UbrN
	zohPopWeit7VuTiSDJ26IyhdF+Nn9YspRFO9pMMS82MorIWuMnuPH2/suzqDoTQ/uOyILAXBo0b
	7HEcDeICdskx1CmGHFID+w/DQQvgySt5nMnFk
X-Received: by 2002:a05:622a:a988:10b0:50d:a987:89b2 with SMTP id d75a77b69052e-50dd5baac89mr141941181cf.31.1776070795251;
        Mon, 13 Apr 2026 01:59:55 -0700 (PDT)
X-Received: by 2002:a05:622a:a988:10b0:50d:a987:89b2 with SMTP id d75a77b69052e-50dd5baac89mr141941081cf.31.1776070794793;
        Mon, 13 Apr 2026 01:59:54 -0700 (PDT)
Received: from quoll ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d76eeb2d1sm11422184f8f.22.2026.04.13.01.59.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 01:59:53 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        =?UTF-8?q?J=2E=20Neusch=C3=A4fer?= <j.ne@posteo.net>,
        linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] spi: dt-bindings: fsl: Correct GPIO flags in the example
Date: Mon, 13 Apr 2026 10:59:48 +0200
Message-ID: <20260413085947.51047-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1534; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=L442J0TwwkkuIUC8FYLtsVKcRZ/d3ytHa4etGdl3Eb4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp3LCDCBTRylj4M0qHf00HBSs+2Cjmd/aCt+/Eh
 mZkVchvrUKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCadywgwAKCRDBN2bmhouD
 1zx7EACIuCXQH/hzaxeBNlbEEVVMthpbn76FXO2qqvkHHfx4wg+IbzpOyt/2BJCX0k0Ttz7pg7K
 BHeEbMi8ZVDl+iYTGU+VHLFZeJqCIdhPEUCFyfpEVuPQctB/9dxTg4oJ/lSA7Mn7OwKneGDBMSV
 J7jLPAwaP3BUXoHtWIw6kkaHcZvV1SjJwuW2P4k00vgjHkSh4KlX0eHreqnfxgPASU3KBKyl88L
 FcDDgYK1wuxjsNtiEXEsl40H6h7lOV1jdHRHCWrVuPv990b7HTlyUV8w6vvm3YzLpIXHnCWMui2
 cJBQKyYj0jsgXXbX6LknlY35Cle91GPmxFp5ci7u9xw/rFXzVGen/4sW3m/h2Wt7Nz5dtSymQpk
 r3BEau2OVdEX1hh56aHiFIJd5M/5lYQ26b1ncu5ysIHA7W+SUWNhM8wpjRpnFz0yvz4RZ53M6bu
 DAYismfE9cjhLFEI1MO5U9PWp8UQ9YjyTiKvAOH++L61pHscInvwOGS/fu6EfJFGZxgx6ON+/gY
 U/cBsnaLvzFOx7cP4PaC1+jNr1RGz/QszROpeUPfOoynn4pig08ofyoWRpnoM84b4d3tRSQsJoC
 /l+3JGh8OnNWFJwurX1aYb/3x00iH+eZd3T8950yVkY9meqGkxEptjePbpWoHJWgelvawBFj6pp WGzA77obQ3UhGOw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDA4NyBTYWx0ZWRfX0Q+UA3W25Y4d
 x0j3chrpexkyjWKhzRsH8iBOxzn8KPjIfQONFwNi5YkEIDR3DBzRpB75ax1mmTMHBgH1MW+a0tk
 Jp4OvAqNCBq3OnoXMaKm9solUhbV6gdDyA7hr7xTGZkTjkLETYNeLZ8JeR1iYvxOWX3q2EF/pu8
 fFJEfDqN49iJ28dUVemusLwveJuJp5jvcrJvRp8oGtEe1drFOheQMRfukocGfe0uTDfGMTSp7f2
 Dmu8qz6AZMePntl2Gt9zUHesvqH7OVoEtdnnkdn73DZyMuuxNnObtCB1atC+OQRxVZseWjERB6V
 MKDJZHaSGrLEM9bKsIEWjjvzwSlQiAGxj26oZJCurAkCnbvaJeNqLp8s4KS7Tkae6DAUtoKP5iG
 TS1zKrubXme2OueD2AUWOxOZ+kJAALaaHDiXKdbSzDDod/DLI+eRGRWFXP+/Ppv76MHQrw1FlQM
 NLXDsOYNg4v9f52Imdw==
X-Proofpoint-ORIG-GUID: XpYHX9BbrThxUmWTQ7puP74wTZ2V-A04
X-Proofpoint-GUID: XpYHX9BbrThxUmWTQ7puP74wTZ2V-A04
X-Authority-Analysis: v=2.4 cv=d/LFDxjE c=1 sm=1 tr=0 ts=69dcb08b cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=vGezUznNFi9R9SW6FEQA:9 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_02,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 bulkscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604130087

IRQ_TYPE_xxx flags are not correct in the context of GPIO flags.
These are simple defines so they could be used in DTS but they will not
have the same meaning: IRQ_TYPE_EDGE_RISING = 1 = GPIO_ACTIVE_LOW.

Correct the example DTS to use proper flags for chip select GPIOs,
assuming the author of the code wanted similar logical behavior:

  IRQ_TYPE_EDGE_RISING => GPIO_ACTIVE_HIGH

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/spi/fsl,spi.yaml | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/spi/fsl,spi.yaml b/Documentation/devicetree/bindings/spi/fsl,spi.yaml
index d74792fc9bf2..6a359488dd41 100644
--- a/Documentation/devicetree/bindings/spi/fsl,spi.yaml
+++ b/Documentation/devicetree/bindings/spi/fsl,spi.yaml
@@ -59,7 +59,7 @@ unevaluatedProperties: false
 
 examples:
   - |
-    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/gpio/gpio.h>
 
     spi@4c0 {
         compatible = "fsl,spi";
@@ -67,8 +67,8 @@ examples:
         cell-index = <0>;
         interrupts = <82 0>;
         mode = "cpu";
-        cs-gpios = <&gpio 18 IRQ_TYPE_EDGE_RISING          // device reg=<0>
-                    &gpio 19 IRQ_TYPE_EDGE_RISING>;        // device reg=<1>
+        cs-gpios = <&gpio 18 GPIO_ACTIVE_HIGH>,        // device reg=<0>
+                   <&gpio 19 GPIO_ACTIVE_HIGH>;        // device reg=<1>
     };
 
 ...
-- 
2.51.0

