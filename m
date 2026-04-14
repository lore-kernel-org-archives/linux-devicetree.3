Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2424D34FF78
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 17:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776186524; cv=none; b=LJOsYet6qDo7UmOGGxEELfMgZYzk8lPrmxSMcLRB16QXUlWbAL94Qn8lKUACBbAgtGoJUBu/K3mX8tecevW5W2A4Vv+Hz1r8HxDTKV6TOec+whT6L32mt02Aun5VFFOxgbMeoHrxejnthoXuDgvHzAaStodfwWSMh82ubJxblpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776186524; c=relaxed/simple;
	bh=U9SHP4bt1Fs2c7XTKSSf5Fe5zLYuiL+JABoTuDRifhk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iIRAkaJNAcNbE1MeNqUzi1V7j+o7WppH0e9A26VCLHc/b0uhXfED3GLKdUvBscOHmzHmWjJtCfK9vmyhp5fOvI6dD2pqs7zqleuMzvmvVOUwoYPPW0MpCvAafeoPnK46wW59/TBCJrEYkUDQ5gTC0qFHzdvC5IrojXGYrRJlalI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=adF+VuH3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VY4NMARU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="adF+VuH3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VY4NMARU"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63EBmZEY3157512
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 17:08:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ns0DliTLIe9b0Tob6jP05AfojVMCfJToxkNtzSXiD9M=; b=adF+VuH34Ie06N1d
	Gyx/Xq+7khxJ1LKe8tS4pkywB3VV/UmgZdAILx+MolHRtmKinSRnn3YFdEPkh2hF
	1L8a89GGh5eKrnJr+tqRa1orBEWJQDU5iqzAXPEOQj1ZleQe+ita57T7RHt6t7sx
	IFgN3ew5jg+rfNxJ4QJKwGv7aaR5AjuP9KgHyCGAsIV1LeKFsNDBo0h7peOSHCM9
	NVrQOO192FjJz/EEitoxMJ1e3DGNDnqvGlPZl3w+KB2lFQQm1u9kCA1sSZtt6Wt4
	N5Rhz3aaixoHIDD9YvFRizrLn9Dmj24yB3N3IRgr6HfJOZ92kA0CXsV9aCg4Ovmo
	RfhcMQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh86bbqv9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 17:08:41 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b2ec948174so28952175ad.0
        for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 10:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776186521; x=1776791321; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ns0DliTLIe9b0Tob6jP05AfojVMCfJToxkNtzSXiD9M=;
        b=VY4NMARUlNPPdDJzi9HLHsucWRdSqFUBIOB5nV/3OvD/CzAh/shUMgjtOo+/ZbhHx2
         wn5o39EGC0uYa+nz2TbBJ1NVD0oL5BpvLtHjkDLALw+xs9kf0QSiJBKV8UY0t+JQ4mlk
         yuaXdElIU5KXHuS5ttsvYA9h6fK6QhzDdehhZwcM5IwewLIU2YkWVKe2At1C6DULBPhG
         yfAg9xplEmSsmDNeGVFMHigebMSfz3nO3woEfDnnWTKkAExy+FiJurf3AhZZ5WgSFfBs
         10lRophk4UlRjhTa/Yrpv1k88bSIOgxcsFjKD9mOHaV6e4ZofQskF/M9PiMfeAnaZ+YP
         fdvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776186521; x=1776791321;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ns0DliTLIe9b0Tob6jP05AfojVMCfJToxkNtzSXiD9M=;
        b=frJXFD6F0dxg3GbtnPDO8RhSKL64lZN+vIegFctdSD1ECtmA40e3Kjs8BaqXXcgETX
         qc8T4emZ0bIBxhM/f0bLlPNjmuKvkea3Fh7JYEV5e1T/cQ81Iyp68Bq+EndBdWa3Cu3x
         qAAF//Cx3ljGKyr1Ptk23PoeWlWXPWWvkRzchvL7kvQtSqBeAPsF/0ElIVyW0eh3oGny
         RcJEZ5F5fRoKFZJgjepZWXcLNr2CBtonEDNosj8+cxDajPzV079USiABmdr+NufXbCUa
         e+vDxGV6JSI5QLlB1WBLOiPOnGc88TGgENBEJN1cWYmtaPaV0xyCt3qdg3MznX/CQQge
         veiA==
X-Forwarded-Encrypted: i=1; AFNElJ+0JbSAiW3zPNTh241JMAe0HeNgzj6FRK3YbfpuBMbew1Wjx4zdNvEoVqRIvpSeO7eGUPNS26/M/OSt@vger.kernel.org
X-Gm-Message-State: AOJu0YxeiOvkcxDCxyrW87q6+eokK43J6vw8Z+/ZU0BNm03T42uiTZYv
	YnrtOYjBIgSrRle149qrdkuRljcrbJP7G8TIvcYWiF31qPtQrLo90oHYp7LdyDSSuMVkC5HyiBs
	wN9kWNCTHnR8tpjrWLZTHFKOIwOq6AdJAYkSBbQl+M85jnfGOzZ9jNCthtKRWCt8p
X-Gm-Gg: AeBDievs6N4IW1HCx8HxFfAPMKd2r06X0nXm8mkxabH97CVkk0q8aj8BtzCFPnGaZtc
	tjr3QXdSU5Vj6+aSVU47fUOIlyurriuMkvDj3yt5Vc1UC3dri9lhoOe2ZKTdKol8w4OZZaV8YGC
	VpX2Vr6gA4lCD03hD9DvNhztTUNbz3TxTAaVxfSOcHcmQomjq+SdqJwBsw+edUgmtmhgknhUydj
	SEBAoq9x0HX56Eloqbxo4lv7B5bWXAPZdUAUf1WFtxrFGqZUWdFa8uPZTnCsdwL4CG15MWdbZ8M
	R2mw+cMacA5MLr1vdV4oHqMdm28bwSDFUr2i80VhbKiYdQMdbmEoBSz4fTGPaPiFQro1UQdqWr5
	4ElGASES8hJ4lHtABl+SEBSXklhrHTpPBK1CRy9twedMgbzyzNx//m1k+x9Faf7xdWLEF
X-Received: by 2002:a17:902:ea11:b0:2b2:5840:808e with SMTP id d9443c01a7336-2b2d59b80cemr201175125ad.10.1776186520595;
        Tue, 14 Apr 2026 10:08:40 -0700 (PDT)
X-Received: by 2002:a17:902:ea11:b0:2b2:5840:808e with SMTP id d9443c01a7336-2b2d59b80cemr201174745ad.10.1776186520133;
        Tue, 14 Apr 2026 10:08:40 -0700 (PDT)
Received: from hu-vdadhani-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b45d1ab540sm97535225ad.40.2026.04.14.10.08.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 10:08:39 -0700 (PDT)
From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Date: Tue, 14 Apr 2026 22:38:19 +0530
Subject: [PATCH v2 1/7] dt-bindings: spi: qcom,spi-qcom-qspi: Add
 qcom,qcs615-qspi compatible
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260414-spi-nor-v2-1-bcca40de4b5f@oss.qualcomm.com>
References: <20260414-spi-nor-v2-0-bcca40de4b5f@oss.qualcomm.com>
In-Reply-To: <20260414-spi-nor-v2-0-bcca40de4b5f@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776186510; l=1601;
 i=viken.dadhaniya@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=U9SHP4bt1Fs2c7XTKSSf5Fe5zLYuiL+JABoTuDRifhk=;
 b=P0hUvMsZ3NPI9VdIzKxQg778jaa9grR8W2bES1sG4gXjHQUbxUd7Dv7wdl2IBr2NFmAglcMQf
 qpg1K/57otUDrrN44TLeWmGDwHcGEkUgO15ZEah/gVZne01zKNZKo/E
X-Developer-Key: i=viken.dadhaniya@oss.qualcomm.com; a=ed25519;
 pk=C39f+LOIGhh/02LQpT46TsUSXRvBn9qXC8Xb26KJ44Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDE2MCBTYWx0ZWRfXwt8UtCLx3Hey
 hYrOu3tfh4iApegyi/BMyVacrIr7NhsMatZwMcDO+IzT8kjIIXBpdgpil+tVj36ca0jNAEXDwp0
 M4K56YqJLr0hvUlJvXvxfsg68qBAgMwTIrSY662gerPjN5McSAyjBV2j0fLPUYpa/0p6P6uKnYl
 UuTg2rfqLKpxMupGibTR4LSTgat6q+XU3vtsl3gR7MP+xYugD29a+ofC1Dzbefkj9MJ+I+xxRJ3
 C4YHKFKQi9gFZNoiBRv4f0nB8zlyuqSLdOIDWKAwzdxsQ0+ypAnoiI0RFfAi/6zoOIUUTPjqgC3
 8x94G/o6IxS5bs+mj0xzVkFXM9eVNFTNj3tkPZqmem1nIztEJFdRk0pno1053ARGtsQIKVe8icz
 flq46rLqCNFkfRVzYp4p+K5ezgaLj72I3c8q+v2XfGPm+UGJR4/ib6doYmc+ed8UDPE9fnMEcVS
 jZ5qrYDmkFjnb5dDNrA==
X-Authority-Analysis: v=2.4 cv=MahcfZ/f c=1 sm=1 tr=0 ts=69de7499 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=kPckM-BePm1yi5if5TYA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: kH05BTIJLIdwEf95l-HcHpn3Ylvdy-hQ
X-Proofpoint-GUID: kH05BTIJLIdwEf95l-HcHpn3Ylvdy-hQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_03,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 phishscore=0 suspectscore=0 malwarescore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604140160

Add support for the QSPI controller on QCS615 SoC.

Move allOf section after required properties and add if:then constraint
to require minimum 2 interconnects for qcs615 variant.

Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
---
 .../devicetree/bindings/spi/qcom,spi-qcom-qspi.yaml   | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/spi/qcom,spi-qcom-qspi.yaml b/Documentation/devicetree/bindings/spi/qcom,spi-qcom-qspi.yaml
index 1696ac46a660..38b3408ae163 100644
--- a/Documentation/devicetree/bindings/spi/qcom,spi-qcom-qspi.yaml
+++ b/Documentation/devicetree/bindings/spi/qcom,spi-qcom-qspi.yaml
@@ -13,13 +13,11 @@ description: The QSPI controller allows SPI protocol communication in single,
   dual, or quad wire transmission modes for read/write access to slaves such
   as NOR flash.
 
-allOf:
-  - $ref: /schemas/spi/spi-controller.yaml#
-
 properties:
   compatible:
     items:
       - enum:
+          - qcom,qcs615-qspi
           - qcom,sc7180-qspi
           - qcom,sc7280-qspi
           - qcom,sdm845-qspi
@@ -67,6 +65,21 @@ required:
   - clock-names
   - clocks
 
+allOf:
+  - $ref: /schemas/spi/spi-controller.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,qcs615-qspi
+    then:
+      properties:
+        interconnects:
+          minItems: 2
+      required:
+        - interconnects
+        - interconnect-names
+
 unevaluatedProperties: false
 
 examples:

-- 
2.34.1

