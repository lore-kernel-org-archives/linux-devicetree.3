Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D17072FFF89
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 06:22:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784701371; cv=none; b=rX9BpZ0UWWaFfWOvmUX7Tiksg1LskLzEOjQYdsMGUdzerNuyVT7SWJ21EYL7838iFExjNHvCnBdR3v9I4DDCd1d09rPj8VkSXRVKfyo+AjpQOcbcw7uxChxMdz2pGSmqyogRp9toRfwquyVvRckLscyTzAX2YDw37aOylvfNZkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784701371; c=relaxed/simple;
	bh=OIx4wh2CtIAOIh+YltX8TMvP2J5GYPy71LnZDuty8dY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aceGj7Qw66YggrC9EArviI+rWyGszHXK0mW0VmuID8+TqBjmCRf+DgtEcnBY9kds6i2P1kQcn9avoBQ+N0fxUMvJJNmJb8d8de3mQBwVGI0dm44jwTxVH+hhgBpT76+nGQ20Xfdj7dfTOlEoLDmMcRQWqt21MR2uF7oMn+YVXns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QDuy4X3d; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BimwHl3Q; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QDuy4X3d";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BimwHl3Q"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M61q1n984397
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 06:22:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Pi2jq6VI0YK4T8L0Ox3TFJViHrhjp/ljuhL
	yyaW44P0=; b=QDuy4X3d4g9BL0Kaj+fZXqaME8m1N/u1olL6dnHcfzb5ivVsRyJ
	qe672oJJEjHr3dmId5TAPUCbsRJlq5jyMRREys+Qr4I38neOM3IbdQ03yuGF75LZ
	6q5Rj6Dn7SjgZXY7+g56FoA70P0Hx3s0z/HtmKhZ0K1eaRSUPm+KDooXWE09mOF4
	6sl1PTpiwYOI++Y7tIdCM9TA3JQXUZRmV3A3uuH/fhQLEXg9F+6bJvnjA0VwH33W
	3zcSsFXUYufVw5jsYRgNVvxJ7uGnCVqDoRu/iQ2Xf/E1trnQBykmeEOkaTVLZcmx
	B5sELhN+/dJVEnRZgmYBW022fRon2MwEMLg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjr8382m1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 06:22:49 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c0f0a0760so294812851cf.2
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 23:22:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784701368; x=1785306168; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Pi2jq6VI0YK4T8L0Ox3TFJViHrhjp/ljuhLyyaW44P0=;
        b=BimwHl3QuxdfrDHS3L4QHSL0AnEbyEhy9pcxGRmmF9QB9hweC2TMm2oHE+SFAC9OFW
         wLA69cR3BuIohK7KV4P5PsUpZLUesgKNP/R4CsZrsq6iSIeFGLyyEvp6u2fMHonTPo6u
         /fZkRvdWxlMfK5Clk/QjpeiuT8d4996UqlgMX6iqpHlRubQuMlQjb74TapPsZEPw2EO1
         99XODqF6nILZKhZ21MndSInR8Dp3LcGWqoqCw0PrPp8RdhLFASoXcYA/4n8svXIYtjVp
         8I+09yUOvYgsB3wcPU0wspE8SjMyitySTB1DdvJ8iRmfqOqLDsBtUqEVWRWCmcwINI/O
         yx1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784701368; x=1785306168;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Pi2jq6VI0YK4T8L0Ox3TFJViHrhjp/ljuhLyyaW44P0=;
        b=UYmQMaMRRg/SuRDgsCD27o9fqCcXmNySUC/zWo463xK793BJxtlCUOdD6Q19w/HWAI
         bo00WKaOOoh7KjQ7pULeUhWvfHaBYrakbSMTn/ktu8VzZtMfGg9d3d8J/a1QPK7lDVYo
         k3deJMVkTJDOwPGbMhJqyo7Ei8Bihb4hLyN481ltDlW4SRg+OZiW7haQPyvb9tFWsf0g
         /bTm54Nf/McxoaZE4ZEQHQ0QbBsASSkMsY0/ZWNZXN1hi4ph8YDO+WJAqpjxQmnqx7z7
         7iKEej1DN9GQOuP0NYrKn9PmrWFOqxt/4vrQQNoEetn/EK2G7fyPtvho+0VGcYl2E3wR
         9DpQ==
X-Forwarded-Encrypted: i=1; AHgh+RrGbnTbbIC2sFOVIjYEBVmwN3VgDRWcLbpt6l7Ii9+9eUGeaFEy3pSvbbYmawACNqyvoOJ3/w+ED/My@vger.kernel.org
X-Gm-Message-State: AOJu0YyntdtJqONJhntXKY5YlnKqE38hZy5zNNZ6++oWj/M0Klr2XVbq
	3U0gijzdvqYKIkOqbf58ZTKBIT1ClPepdn+VN6tTBUYP3nCa0My3wD8qLgBc0AdpXQOoJz1Wby4
	gDw6hjB74mTWy6KocR0G8roRDT+wT4mYVGhP7oxyBAdVd73mP2fa6gRe3j2/yrttK
X-Gm-Gg: AR+sD10hr8aBTjA0B6hOhTxaJqr8ZX2xJWkKVy/zwGUgSHLfmLFBDEzAs0Tt4j0Ok7h
	BuiXr8m7aYRSW3ZVP9LHSPXQ+GjPJnbAqd+11yPB/7erN9MYnR3qLl+HD/1dOJL+QtD0OQe2vsy
	AXy0+KHmeWOqs93z5ZbCZsV62UFf3omNJH78XHTefMf/aQqMh/h6gq4RjSEYyGVxsUhe4jiIZD1
	0tIgYxG7JjVkkDIR++LdSJXTK22cBxVHmhXMKnxv+ymZp0TFmN4ZuWNXyxMQ76tPxdxyesa+wd5
	kVTC3o3RC1js9stdqYMWBdBggbJQ3Y88pXgsxPBaFF3vE51vbInR6CPWEsuZ0Xcu6amcXUbVrJ3
	uIr5EB5nG30f3ELJp
X-Received: by 2002:a05:622a:5d1:b0:51c:7b11:41a1 with SMTP id d75a77b69052e-5213f46e365mr204032701cf.78.1784701368008;
        Tue, 21 Jul 2026 23:22:48 -0700 (PDT)
X-Received: by 2002:a05:622a:5d1:b0:51c:7b11:41a1 with SMTP id d75a77b69052e-5213f46e365mr204032491cf.78.1784701367539;
        Tue, 21 Jul 2026 23:22:47 -0700 (PDT)
Received: from quoll ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85bb5127sm3257224f8f.10.2026.07.21.23.22.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 23:22:46 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v2] docs: dt: writing-schema: Extend expectations about example part of binding
Date: Wed, 22 Jul 2026 08:22:41 +0200
Message-ID: <20260722062240.19382-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2239; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=OIx4wh2CtIAOIh+YltX8TMvP2J5GYPy71LnZDuty8dY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqYGGwv59oZWRp09y2oIN0/hjUth0QVHMXxkxnn
 080qBhYMZqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCamBhsAAKCRDBN2bmhouD
 11RJD/wNNQ6r/pTqDCzHrT1kyFGCvGoOHl10eK4ztGuLly624kydOuNRF7ONdJk9EOgOGM4wIpQ
 zmassz4qX2tv4N7UEIGUmrkCQQxSLXnxBADHR59jgAtmlWEmr+wn309u/VLpLgOEATGXwd5RYmw
 Ltih1TESQ3VKgvoWJ63G9suIGB8Yzf4Q7UmaTvOtYaumxgxhT0jDhQNBvB0ePfvCSI42apYwoid
 EPrvYFo+BCG8oAqSe+Uu5a0qn2LJwZZlqPsbJioJ5hxG5lzhWiDNiLod1oi2YEPxP8FSw5SEmd2
 cVikEdoBgwObrSAYf2BVO7u9QB3Nu3mr39PumJWZQx7bM1SEKTEMwMANfsH3NkglKPTtq1lLq59
 bIoglC2OTUK8h+Fw3Mr4VNfxo+ywqb6e9YKas8jnAgECpqtJP9h8pPqPzMJMX0tyQdYuSVBZQA2
 oda9DZ6XRzmV6t0yu8vlg4m1XIiCPi3lh8eDtexBDyNdaU2WZD47TWdet6qZQHyel2048V/jTOU
 VuP9Rd44WHaZe0ZAdn8WYbCxpGC1bwDxnwALfV5De1ZFh2EU9OlglyexXzcCIX+DuvlzpwrCp9P
 qNsI6P/i4C8EbCnvb+rt6//zzz48VuHRpzj1dEfn80s7Tj5Lm1p8sKciW6EmNLP+G7cLxYzGrYD WSMlPOEQE5haadg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: EWGbBT_rF-NTaENbRdZp7f9iapHkSI1J
X-Authority-Analysis: v=2.4 cv=VfrH+lp9 c=1 sm=1 tr=0 ts=6a6061b9 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=L8bdGj0wTZrxn9lFt18A:9 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: EWGbBT_rF-NTaENbRdZp7f9iapHkSI1J
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDA1NyBTYWx0ZWRfX+PboyFTc0xFh
 E7LH3eoLunmwqHfRFwh0g86+szt0uPMYfinwHRCEtIQMC6nsOUEW1tET8XaBGmjG2muCtk0+mnL
 1DqdO82CYHj0ELJVFZj8BJQ6UYPyoe9tchek7/OIXAkqPNRuY9ohZQBlClCRWzTwEeRBgTI0/16
 q2mH/JkerHzxIkh+ytBI/EiZZ70j/q/aFjeF79nGckRMzan9UEvRqPlYqyQCOsPGsN8K0shVcwp
 3H64MDkBD7iFtis3HvhJ2eqxr2tgA5YJAhCglRvXK232wb0nKx0wawbnNQUKuuAd5NW9CfarqfG
 C38J3WD6RTcEAw7ICN7M6M99miz3t4pnrJcLYL2UCbWhaWW9egjj8L/RlmnbS+7+3icjgOe5GkV
 B8eGdoTpKQ2vghtt9pV+xNr8+bJd8Eu+dhjqYXqG1LsRwc6YGfTmtCqzvV7vfQmOgjil8vooiqr
 fkbWWy9ANq+K8FmJ11Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDA1NyBTYWx0ZWRfXxX3LxZT4TVPn
 MzTUJdKR7rHezSLa1neH7MIgmcmIRuc4STP+7V7JdFYr0eKByqwQzpNQ/ObQUoHSyFu//LK9qE9
 m8adR0e6GyialHquuO/SuBdOuCxaNWw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_02,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 bulkscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220057

Document already used rules about example DTS in the binding:

 - All final device bindings (except sub-block of more complex devices)
   should have an example.

 - Phandles do not need to be resolvable - Sashiko already provided
   incorrect review, so this might help it to understand the concept.

 - Example should be complete, readable (use known defines), without
   'status' property.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Changes in v2:
1. Rewrite "optional" exception, as Conor suggested.
2. "normal" -> "typical" in last sentence about status.
---
 .../devicetree/bindings/writing-schema.rst          | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/writing-schema.rst b/Documentation/devicetree/bindings/writing-schema.rst
index 3ffd0828617a..d31b94300f46 100644
--- a/Documentation/devicetree/bindings/writing-schema.rst
+++ b/Documentation/devicetree/bindings/writing-schema.rst
@@ -127,9 +127,16 @@ additionalProperties / unevaluatedProperties
         two above cases ('false').
 
 examples
-  Optional. A list of one or more DTS hunks implementing this binding only.
-  Example should not contain unrelated device nodes, e.g. consumer nodes in a
-  provider binding, other nodes referenced by phandle.
+  Optional, although expected outside of bindings describing common properties
+  or sub-blocks of more complex devices. A list of one or more DTS hunks
+  implementing this binding only.  Example should not contain unrelated device
+  nodes, e.g. consumer nodes in a provider binding, other nodes referenced by
+  phandles or node labels which are not directly referenced in the example
+  itself. Phandles in the example do not have to be resolvable.  The example
+  must be complete as much as possible - have most of the properties - and look
+  readable to developers, thus for example use known defines for interrupt or
+  GPIO flags. Example should not contain 'status' property in typical cases.
+
   Note: YAML doesn't allow leading tabs, so spaces must be used instead.
 
 Unless noted otherwise, all above schema properties are required.
-- 
2.53.0

