Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8388547D94F
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 11:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778844235; cv=none; b=eOl4OwuLD+1HdVC2TXV1nPeWRfC5tlke8MbWfIzymAzhSWVvWBvVhZMuI9r7Jfbo5Hb2gUB7Qrr5wDHac4D8heeoGLGNqBWb2+O4dfC1pf0P2fgE2C1TVWpEihuxTjYAbm8o3pUer/I0xV6Piu/BsQ7nAnhZtJ1nW0L8MzscCsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778844235; c=relaxed/simple;
	bh=/DvZZLK7RoXoyIRcMfNXJX52GjyEq7ffyO8JhHtrg7o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IGWFy8Po29H9s1mpP6pY/K6WkDGhGTIT0DtUnmNT5RRK0LOud0v96DHp62/rth5ykBNXQGOsJ5oqm/b8QWzCdl6T9ImxMeLcNxmrBUYGGrBwsmgN1Qx8MLi32BM7+1XsvVjS5YAAttsADpguDwcWaw+nX5mJ5FYEoGCPB1HIBEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=p4UK0mjV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UGSrMw27; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="p4UK0mjV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UGSrMw27"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64FB11bA1847946
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 11:23:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aRznaYXGx0v+j8rw9+afGoTRNyTfcmX12+yAEiEoD8c=; b=p4UK0mjVQ5ePLlm/
	+4SIzuq+6RxI098CAYQ0webZ+QYCElXSw47OkE+4zwrPbXd7PRqfv1nor1LY/NqK
	g9yRLTD/EEGn/wQsSYmxzGJXjdgkUzpU7YHP+H9mgWSn4zub/ne9PP4vf3UKiaVk
	/dDu4j8CNMSxg0+UqC4W/96EMdUyBu7LlI75V2ic44tIXwK44GPqnVBrgHFTn+ON
	GcveOXVCyerKZVo9GqRf5A1X4yi4mKIb0tQ+ixRA1qH4skGMpgP7B/+G88XxIrdw
	ng3eCjlxJ8LRUCgnLdlItQi7iByjHrjyB0SNi3Up/d+vAprqum0DWTP/rBPI09ek
	xnx5zw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1t2ywg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 11:23:52 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-36865d109dcso5786613a91.1
        for <devicetree@vger.kernel.org>; Fri, 15 May 2026 04:23:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778844231; x=1779449031; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aRznaYXGx0v+j8rw9+afGoTRNyTfcmX12+yAEiEoD8c=;
        b=UGSrMw27leeOOStu2uI050wr+Xtk12vmK4PVh1Rw2aNPD2mSHfUFn1310FkSYu8J1q
         dsD4xDiCxl7CMmD2aQtvyYGrqdd0xhqXBqko+xvzv5NL0rzd15hJtn57OKG346MT3XvZ
         jSmhRJeBa1GjQIhGq8CZd5XGp0Y+rV8+a2KwVZHPkrZBbcy0IUes3edJAKuLoL1lhrL4
         RQ7TIl1B3TyOoVCvw69W/zcUffFjUdYMXqkMudBFOCPZ3kWgG0jexBJ+fnWia01SOImN
         u0RTiHVJhYuozgdeVl5ZspE/WCT751ucr3tH/bV8Dr5LxPd1kUQa5aNQzqDAFgFyTEkI
         7J9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778844231; x=1779449031;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aRznaYXGx0v+j8rw9+afGoTRNyTfcmX12+yAEiEoD8c=;
        b=j1YMD4pB/aKtKVsm8jwNrZL/OqJ3HUJTlU1CgwM3m0bscRgLHwWyaOSCaUR6DAUnyO
         q/1jRJcya27Zix0HdBQA2yUiqrX0Q3WflObVp4wqxxG+Gb2RnENRbZY9ml96+KJlabPF
         Oo93gEu6Qhrur9g3GkjKecEmuV+Dz/Zn9vKWEkRGeA6LMytkdC8o4FX75S31QOQpzIuY
         O855i0LWTz4E5FiO68nGYXw4fPQRti4MgSApC8uyoljWMHexg00mBdfiK1esWxU+e5sc
         AtNSP50oDEq4SKHMPkjov/JlcygzchqPYCm0XcuR+raEc/FCcPZJ3D8/F1TdwI18p5bt
         5+PQ==
X-Forwarded-Encrypted: i=1; AFNElJ/x9yJn9bT90HH5R0P53mBQ51U5tJlhz0faAwK213y9sIB9hJF4SEKZCSqt9qZvJtnaRqwWFVXsSO4R@vger.kernel.org
X-Gm-Message-State: AOJu0YzntSdkyJb+uifRHfiTE4vPzQkW1XDHj5tKecEztEC3JHph8Bi+
	OHT1a497p9ulgmwKTrXHkyyLtpxvfCXKE7PhFV87TjHOFzG+Km1cIX96j9xSnZ6uJPTrj8iwS//
	4xRQ39qmueJVMZqYQyA0hG+c8AjlrQXPyhgoaUgSB9eDfQQJFZtTJpwoh7G6TurtV
X-Gm-Gg: Acq92OEjSiINuW5Uo1Fvj/dUbvGY1Bmc5GC/pIYTDUlHJjCYux2rwF7c91dX4TByLgB
	Og7fbXq5OyGcORTJ5f1t5GGoJr8GWIAwsCvffs0KkX7/cTsDHWRqyt4VO7o5irJkrXrLLzuLrtR
	2BVUSUAT+b/2LLmF/hL8vluEeDvgn/+t27Lui4HE9w1iM9ZrvAiQCtu2ZVbMNaaLqC7vnnLJXBY
	KOiQUMaKgKxh9Ord8utgD79xRoTX+CJq++gs763C2HXSeP0ZPe1Dm2iLkoZ9zxiiYLijKzFvPXA
	Lj49IKeV+6upbY5uN5qjX8tRvU4iajU3qNKgoPnU0blEixFUH2Rw9wimtmgiH1txnmSZONzujap
	4TJIGNsVGZOPhxR2kWC2+uOAKK78Fjzs5T57/jngsSN1uOv3b1qt4pW0=
X-Received: by 2002:a17:90b:58c4:b0:368:b4a5:c4dd with SMTP id 98e67ed59e1d1-36951895b63mr3504173a91.2.1778844231443;
        Fri, 15 May 2026 04:23:51 -0700 (PDT)
X-Received: by 2002:a17:90b:58c4:b0:368:b4a5:c4dd with SMTP id 98e67ed59e1d1-36951895b63mr3504129a91.2.1778844230955;
        Fri, 15 May 2026 04:23:50 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36951584654sm2476249a91.7.2026.05.15.04.23.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 04:23:50 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Fri, 15 May 2026 16:51:19 +0530
Subject: [PATCH v6 04/14] dt-bindings: media: qcom,venus-common: Raise
 maxItems for clocks and power-domains
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260515-glymur-v6-4-f6a99cb43a24@oss.qualcomm.com>
References: <20260515-glymur-v6-0-f6a99cb43a24@oss.qualcomm.com>
In-Reply-To: <20260515-glymur-v6-0-f6a99cb43a24@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778844197; l=1499;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=/DvZZLK7RoXoyIRcMfNXJX52GjyEq7ffyO8JhHtrg7o=;
 b=6A0Jw3h5Vd94IDHzZQvQub5VJlKlGcYOvPs6oSe7K/94TXwZygg4g8Mq4ZD3MJ4wrbudfchns
 SFEp312OVgjC+7B71bLPg2CSrzm/xsca32YE+z7XutZ3KdXXazyB1P+
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Authority-Analysis: v=2.4 cv=D7Z37PRj c=1 sm=1 tr=0 ts=6a070248 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=xA1TQA8hIoUvplme17oA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDExNSBTYWx0ZWRfXyvO3DHaKdhg5
 ZBQhmj+qMLGErHRNWo2aCAhScGZvUdBwTumk7mZBNGH2F3tGlpQehAzZf5qDCGqmu809p6CJcqm
 cYDtv//j6D5jHSNRMUm3PbCCnrbXFxXjZpLUnT7zT4aIK2EnyLZaO88/U/f6WnumC8Eu7ExE/f3
 iUJTPn4oa/bQJuoBX07Ux7ROcnPfCvsp6XvxyPSHXcuuvs26oyIzaTacb8wfESN/I4y+vulJVGh
 9hW5sNReDwYOCBCJYHH1fbDB47vdJWDUJqT9mVUwwpRxLqfqktpjoozUYWpZiVe13Jrva68sWqu
 IuCHV2kYANj6NpUlLt/1AfaV0+N2nMlKa/pbg9vyqH3TNyqZNeB1IgXZhbjJn6eWRkCaFkBr7ze
 TnxnrpX+Qa9iz/wQGroiTioCmL2tCcQlE7z8AeX2jnfdOIvSEV9sSVmnwOKHxz8wbZjlbPkuKu4
 0X9JYSFaNLXAeSxMU1w==
X-Proofpoint-ORIG-GUID: FFQYXgsncFqqzFsFiLUmJ2zYHjEJQ3ey
X-Proofpoint-GUID: FFQYXgsncFqqzFsFiLUmJ2zYHjEJQ3ey
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 adultscore=0 phishscore=0 clxscore=1015 bulkscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605150115

The current maxItems constraints for clocks and power-domains in the
common venus schema were sized for platforms available at the time of
authoring. The glymur platform introduces a dual core architecture
that requires more clocks and power domains, exceeding these limits.

Raise maxItems for clocks, clock-names, power-domains and
power-domain-names to accommodate the glymur platform.

The glymur platform-specific schema have fixed constraints for these
properties, so the common schema only acts as an upper bound.

Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/media/qcom,venus-common.yaml | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,venus-common.yaml b/Documentation/devicetree/bindings/media/qcom,venus-common.yaml
index 59a3fde846d2..10716a93dd35 100644
--- a/Documentation/devicetree/bindings/media/qcom,venus-common.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,venus-common.yaml
@@ -20,11 +20,11 @@ properties:
 
   clocks:
     minItems: 3
-    maxItems: 7
+    maxItems: 9
 
   clock-names:
     minItems: 3
-    maxItems: 7
+    maxItems: 9
 
   firmware-name:
     maxItems: 1
@@ -41,11 +41,11 @@ properties:
 
   power-domains:
     minItems: 1
-    maxItems: 4
+    maxItems: 5
 
   power-domain-names:
     minItems: 1
-    maxItems: 4
+    maxItems: 5
 
 required:
   - reg

-- 
2.34.1

