Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3DEA361667
	for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 09:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782379077; cv=none; b=a+NCYfvd5VVR/CrdPlqvN5QtHtjh6d5NCqONrK1uLL+V9ge1Cg5FP2gHFc03L0lQOhDgz7cgFFOU+CKro7PDilpB9OX8zhOCfGo1q5Jc+gu/kdDVPuwRY4giCbKuNrbDHvcCM68FN8VG21IoaJy+FlVwQrp0gpn7y5VdexVzUfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782379077; c=relaxed/simple;
	bh=YnnehkMvE5MTztPmZllPQ4dbztAc6uLt0xGFdUSc+5E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NNJ+giw7llJEh9yzHxK0sGo5gDSJuregtQcbLrfVj3mgNoYa7ENFuWqDJ7IVI4mZrSW2uPRAkj8+6O4r3qAFF2g2RrUY45hZc0rr61HkM+Nmkf6rHT0d6PdZ01XfeYWiHdoV7LuM1z0H71bzTTDOgHf75tv0UAqCr9Saz6h+/cM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hBSjuCNq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B9DaeA2G; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hBSjuCNq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B9DaeA2G"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65P8p9df1271738
	for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 09:17:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=MpjKZhSYxUqqFzZEnuTPID8tPJIXJcPao+V
	9QclwJKU=; b=hBSjuCNqv10dqspnEghxubOx8LVOKsKevFwjzGlf0yaGkpm/H+S
	xIRzt1dd9tC43ie5Ru39o/QCKoh+RFEYZMjYez1RsKdz3iIhD1HEzhpNL8q60QPg
	SNiJ+AafThKnuW4J6FCkI6o/6840+k97VJamjdbhGiDMiwnQnM79mG7CupKkTxXC
	96MKl/3oAZnbgno9Vtr3+5Ou4FQGx9QNEJz5gxsA/MI1MpakK9EehiDV4LMMVups
	X2Mks8MuFLFpWrkVcag7KWgsK0BVYcOhS0dFg44f9TmTElhEinl0VBAQEGnkT1HV
	TdIAiKPzjMIBzarfftM1wQy1ASj9j/dzxCw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0uudhcrg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 09:17:55 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9157ae36434so264824385a.0
        for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 02:17:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782379074; x=1782983874; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MpjKZhSYxUqqFzZEnuTPID8tPJIXJcPao+V9QclwJKU=;
        b=B9DaeA2G6dglw5iCaAuxf0pTQuOCrBWaJf9wx0VIuo7njah+egcTaFF0XgunJReKSy
         GHJ0R7dNjZmKa/6lcVoO+zAcNXiJkpnrHDFr9cmmK9bXjNQ56CAOlNYBvl7VrFN4CLxK
         /DbWHFw449cSXxdTZR3qugpFZRJM/B6LY24qTTcGRNr+FKTP0U991+3oAIFjbaGrFP+0
         U5NtnNrFIpBB4NgPKW52g2ZcrP31KQACJjMEPREAs3byBzDSAzhucUlDLAMwLFrpM0M3
         gC1QXoire8358djZALzytkBAPSIDpUD0Uhm+KInjSS4ffXYk9upOzYLC4WOobCRpNR4g
         g3WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782379074; x=1782983874;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MpjKZhSYxUqqFzZEnuTPID8tPJIXJcPao+V9QclwJKU=;
        b=Lm5G8ieo4mkjB9Ji9ACuPHv9ErKMoESCJxBkxY7RYOR4qsexJv8WXfNWP7S2gomBIY
         ZTx0OwjxChUUjPaXUcRGejWERwAC2M4smM09zUlsT5/Rp1PSjq4pQ3Gj5lCFGdu6+BTE
         UgYDXfsT0JLucauTFU6vM7J2MqzKpxSr1uPjyIyXqQdv5eyJ3R/E6xAuMiJQojx1Eyrj
         y73JVmVWT5HcdjPzmjWmP8wTay9/K9p5I833N8POHkHUG8AgVE2nos+mROtCgCfGE51r
         eCKXanEqoVV5v67xKe56R4xAsD5RA6AaTkT5rHsELPAILGKm8mxUTotZi720viUIwrgw
         jlMg==
X-Forwarded-Encrypted: i=1; AFNElJ9VVY2PZxecESmfEmKmWXiq48RZDsPi2efcU8JSUR9Idws6ECPuuTsKm4k/VahdYIwr3DfpRLkrGoRB@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1huIDQ2M1Ek4cDbDTIDVjWdSir01zEXdUTE6GqPNlCSuMlO2a
	LRoJU/W0PNoKxx/aFg+3qnhUyfPOBgSWYwjvTMVliEHsIW8QX0OTBLO1NNg2qs09zABpVb/KoWT
	1zzwG3JzT1PmNRURjZiuW3JMQNOO5urrRKX2ehklUuGnpfjNZKB0dxfSdsMZ6yDVh93kI9DpF
X-Gm-Gg: AfdE7cm25Gts1QJRcnZz91ZlJzpFi4YukcwqluwPXt/ioyYSGwHhOnj/nI5DKDm9HCo
	hjUADRj5aGt7a0XvK4P2CJ/Ybp9qSQ1AsD42u7a9A+M2llIMUmfJ9UuIdv3VMTtk9Q/at/T7rt0
	+GF1+2MDX6Fyr0X5csMYig83jnvJun4X1eJgorTKJIkLJwIUeVzhowlr1MgFIx/8RIpCD3o8+py
	NxWQ9j7AbjVSfIRU0QKueuBZRw8UpgBowk9Kr41nAYJl2HpC/LhVw9IBhG+RVU+xtL7IkYRx74Q
	4DdZehu8gC8R/V60yh83E8xueNjxMraQMLGL01lbG0CenNe2zyYeG9cV9pQySmzjxsBbbFXxgAl
	LaRN3zkHeTqZlTXrAhoL7QAO8YrE=
X-Received: by 2002:a05:620a:44d4:b0:915:cb40:f76a with SMTP id af79cd13be357-9293c5ff8fcmr241447285a.39.1782379074261;
        Thu, 25 Jun 2026 02:17:54 -0700 (PDT)
X-Received: by 2002:a05:620a:44d4:b0:915:cb40:f76a with SMTP id af79cd13be357-9293c5ff8fcmr241443085a.39.1782379073766;
        Thu, 25 Jun 2026 02:17:53 -0700 (PDT)
Received: from quoll ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46c1ee01c6csm14676789f8f.14.2026.06.25.02.17.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 02:17:52 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 1/2] dt-bindings: usb: generic-ehci: Document clock-names in top-level
Date: Thu, 25 Jun 2026 11:17:45 +0200
Message-ID: <20260625091744.109467-3-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1395; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=YnnehkMvE5MTztPmZllPQ4dbztAc6uLt0xGFdUSc+5E=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqPPI42GVj8uP0YJqcKtCaxiQTdnhWhpppmoHeF
 OK6pEDDMLSJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCajzyOAAKCRDBN2bmhouD
 1/TDD/90DdZWS5kGZ5A/og2vSnprFs3c/4VsOaUpczG52rQMlcKGCSMmvQfMfyGZbIhOAYmX7CV
 l1IVFbcIqMWFkdQU9jXRVDr00oVD1a3AU372JJR0AzYY8PKVeKh5PoqpuReIv4zpReBp0L3/Wrp
 QKo5a5Fs0+6p6wmoSd9mqdEg1rv/cJB8HmQ/m8VpNjgQss4S+BFjGyUJTYuBkzxzXLeB/lTsbPG
 PG1L0hzIpHrDXXDtZUiHrTiyIXAPskeIgIjD9UaREb+g7/OIdiEvQpp+HC47LuBXvJq3iksJVwl
 z4fH7zNBA0jgna5BFuhoPPHFqnPHTW1a5vt/jzoMmkun63CFXt4qOGLeeWFJpQhICdcLuCzYsvk
 62uzizQCAgOdO5hv4TTpl7ipyZTOLnWordYd/PEWWKlYCyzxhIx/qHsdkL0jo5XvjZ1hEtRmdXz
 HFI52qlyNr8xWdCz+nI91mTAFeflXKrdiMoxT66ckgYgb3OHDjXjo+1dxoqJdjtX9/GKygmltlv
 kFthwJ08+IXoXnjq/uS0qdEU8etU20bDgUJffYPuyi952k0WtkcWf+6aUDxzNqNPgcpLfpB2DyY
 J/mu6Fnh3ZxCzFYT+jtj7X7dkHcXduL+tRBYk0mU/jIHYQoMOkeazeXQcUbPUpwVm1IcYsek+uo rH93d0vvzIlGnFw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDA3OSBTYWx0ZWRfX7HtxHsoZhYJr
 fBsGRaozWHf5LpwDk04TRu0TJz4osvcs05CGXeiNH/ihd84TUS7GHYr4Kr7w7L0h8XhhBwxllQy
 flnyulOuzu4nHieQq135glxagxrAU6U=
X-Proofpoint-ORIG-GUID: UBEVkWLI_IxKEn4UabVMjnkwlasAWJqZ
X-Proofpoint-GUID: UBEVkWLI_IxKEn4UabVMjnkwlasAWJqZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDA3OSBTYWx0ZWRfX0oGlyZ1i6bIZ
 A8uCYfBs9BlWZBE9HGLkTSOOXYP9AGmtIoU/kB+beQnMz5iT7sOFDkAJmyAtrnkd8LtIim2EOJh
 qHvjHeXd3apV7c+PaCneCI6TlNuIUHBFzWXO5sJit3e7u3cdCvBMszbnj4mW79vfjW6tTCqN4H/
 nNzGK6dtbiAS4y0uniXYS1oZ6W4EIOinNW6idQSMUGpZafbn2ZwqOomo3bkjkrHXhBuDPGw3zUy
 nPPpUdS2u1VCRZBIHYVrzQvmgzjLxujC44rwREe0e34nZ6wG+ohgTzDYlvQXkWa5RKn16At3BD1
 0JbQgJeYMIgYOXJ/usi9SSu0NVbgu4Dkvxbi3KiU2z8K7ysuzz2M6FfSlB8L/HTR4FbgQQSu8O8
 jnuNj73HHIsU6PT2eLKTGc/F/e1RYoo1PhoTcVy4w0uHps4q0is/z2uknbeZDV9Emtah92UhGQe
 0l/r0pZwYVktt2smzSQ==
X-Authority-Analysis: v=2.4 cv=HdckiCE8 c=1 sm=1 tr=0 ts=6a3cf243 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=PMfV3fAWEKOp6pZ_1OUA:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_01,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606250079

Convention is to always have properties defined in top-level part of the
binding and then customized (narrowed per variant) in "if:then:" blocks.
The clock-names were mentioned only in such "if:then:" block for
atmel,at91sam9g45-ehci, thus add the top-level part and disallow usage
of clock-names for other devices.  This has no practical impact as
clock-names are not used by other variants, except in
hisilicon/hi3798cv200.dtsi, but that SoC has it undocumented.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/usb/generic-ehci.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/generic-ehci.yaml b/Documentation/devicetree/bindings/usb/generic-ehci.yaml
index 55a5aa7d7a54..ae9fb70d0212 100644
--- a/Documentation/devicetree/bindings/usb/generic-ehci.yaml
+++ b/Documentation/devicetree/bindings/usb/generic-ehci.yaml
@@ -98,6 +98,10 @@ properties:
         - if a USB DRD channel: first clock should be host and second
           one should be peripheral
 
+  clock-names:
+    minItems: 1
+    maxItems: 4
+
   power-domains:
     maxItems: 1
 
@@ -186,6 +190,9 @@ allOf:
       required:
         - clocks
         - clock-names
+    else:
+      properties:
+        clock-names: false
 
 unevaluatedProperties: false
 
-- 
2.53.0

