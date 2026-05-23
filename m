Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 925B93806D2
	for <devicetree@vger.kernel.org>; Sat, 23 May 2026 08:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779526526; cv=none; b=R2naBglfs+cT2i0Xeu4AA8AJdsizfn1yhETANQQ7OOHlO5nqex2AYG3+vg5Xbi9KRQl77vxgNhsdWVjaAYMRVM7g3JFvvZypIaa5zPsrjqiuR7h9Kadi95jP18+hZYs2C15Xii2QvjQA7bGhAGRlIL6IC821Cm9nWCZ+U5rb5VM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779526526; c=relaxed/simple;
	bh=DGIj2GYDkot8puf3FcE+/w7IPaWQUlBilG1+iCjOjGk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=DeP2+dx1BM6X3k5Nczs6DJK80ahv7LpzWqAK4Fuz9U5jo/OYWWwIqetopijk7Zy34rShjTS+46X1PcPvtJeessvDQQw9fIyoY6G+mkyussV9QHn06v0EOGOj38v5S0G1GM8vGMaAgFIU5oefalF1tjAWZuf6+7EkbikCDbrY7C8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hjMl1UO/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eYmPttDT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hjMl1UO/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eYmPttDT"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64N51fqs3287015
	for <devicetree@vger.kernel.org>; Sat, 23 May 2026 08:55:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=UesMeb0m4oi
	qpOYD5Rx5P0rAutPaEL4veXBJ3rzm2k0=; b=hjMl1UO/cZ/P4idsczMoxV/aF40
	VN672IUHXpN0IGD7hxGsBjpBJkwvxoKcmFgPHpnzaYsROq7xc0bdodI+SVzILUmO
	8tLOXqLxM1+JFU87JeRZDeRpHRUmzE5zEwCxfRgMAhW48w7ZXKprNAGjO0N17E0G
	MbztmrfOPx/eB99GI9b7y2iPAtFoC/yXemZM3PtuR6Zt/wIkLj4HP8P1I8DwZJY4
	x2OoRcIPbwXxwo6JR33cetc2xkPmKs7s86Y1KO6L98noyAnt6ZzOeBfI7WZDKSZt
	2flIavtpEmpCFpLDPxVqswpbPhxxDZcgg1lvrsPZvr6OkOVumvCbkipzfmQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eb386gpk3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 23 May 2026 08:55:23 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b9b8137828so81976905ad.0
        for <devicetree@vger.kernel.org>; Sat, 23 May 2026 01:55:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779526523; x=1780131323; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UesMeb0m4oiqpOYD5Rx5P0rAutPaEL4veXBJ3rzm2k0=;
        b=eYmPttDT0s+nMbwqVC4WOA2j/h90vQhaRyu5mojmM0tBtoY3sM45yTAbF7b7RWi5b1
         Eb5VpS+2wO2EsFpQivSlGExbOJYOCgVP6GeJ1K0sQrJV2LBwTn8kcgI2FcuNt5q0rLWw
         tjtKIHJw6SH5AnmMqM3GlQxl6Gk3y32/o0M5mKa/F32310czWQ177DqDlh1C489l7klJ
         wNshDe1oCaN6a672TYzwGDknGOhG+6qsmgxbD/XhqSQISBzq2+F/Y19nshIBhimBVP1T
         DIcJYMbVPZmzxmnwXVP02IIrfHmmY9tWuy5u5glbb8kEhk08ZKsNsZWkQr2bea+1VLZR
         CDew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779526523; x=1780131323;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UesMeb0m4oiqpOYD5Rx5P0rAutPaEL4veXBJ3rzm2k0=;
        b=OVNXRBHkzs62g9FBRWX+550HSl5maJNWp/OwxTWFDBJl8t88NGQ5tvceAV3XczlQnu
         zwAc1kz2SfHpgUnoU6aJgcdTB+/1SM5r30GS38C5EWxDp6rDlongciCwC8pKRf4XshAf
         nwZqdex2W9NR4sbyDxcOBb6pEZaPFckdPCrt7I9kWGnZs2G2TgJX+amZoQutjoKNILp2
         5EUWjXOq5dW6Hjlq380MkvhizRhabeZ0lKFpOokGsUBjGTeTYAZp1zWCnR9goJR4aTc5
         hL5I4QwqVvKgVexyN2yByEPk8rdmIzqvdya/7Ka8uYZKxLvtHL7f4V3wzpXjoW2cv4nj
         SRTA==
X-Forwarded-Encrypted: i=1; AFNElJ9WNOIBoy4ocE5FskmJGZjGEOayDBcAcG/v3lNQQsixBGQRKJ0veR3nrt2l3oe7RW/JIDKb39lxmtuQ@vger.kernel.org
X-Gm-Message-State: AOJu0YxrWt7szKkrxhUNzqMBEHLDllcCgTCjIXjA1zwT/t6B5Gcou46c
	NjSNpCHii1gv0G74iuaYY10WQ2Rtl2NdF2aRxcfHvXjM7elF9/aM70wFE7UCQpzJvfdKFn062j2
	gUss/xNvxl+JavLGCU+ssiGxO2grblbdUqcSoxb0sBe8F8Ntexf+VqJppk2dKnTMv
X-Gm-Gg: Acq92OEOzKA1ktSC5c260mSnhB80G79wvZc9toTsk2u4sD87tQQBw+6hlJk+keuhIDT
	PrTYBBzn3SB+nDokp8uXLc4ZNfK38tpe2mcRN7dUh5SSU2CPN4LQXHBsPc+DNYIg3TrYSd3xFv/
	7xqMqLysi3TILbcdyD1+7m3EKXoA+pBbCXFLMOHEQ1UkLWZ+NcEbu8aVdKIbBncipBPnz1GIlLP
	QZ1KQUJcjixTTysOWKRXxBMJleGORoxgWMUjiDqUW/yGvR5Gu15oNj6sAnnVVv5GJy5PbwB3fJ/
	+mUlZ6L5aer3oaM8DIjlfO10Rt2yl0GLBc1y2E4ILQy6bI3ihUjnYEhT3TQnXhTCuZkOu2ZUgLI
	1t621MfUad8hfirgTWm+YUevdKGkzjEUZ5rqbavw3kEjUsGMYiV225L9UhhmVz4mhlSPibxTw0s
	RUU6v55NEivefm3U0C8xA9w6qNxXgCzQ5W8t/b
X-Received: by 2002:a17:903:15c7:b0:2bd:8938:b811 with SMTP id d9443c01a7336-2beb0700897mr83310715ad.34.1779526522565;
        Sat, 23 May 2026 01:55:22 -0700 (PDT)
X-Received: by 2002:a17:903:15c7:b0:2bd:8938:b811 with SMTP id d9443c01a7336-2beb0700897mr83310475ad.34.1779526522008;
        Sat, 23 May 2026 01:55:22 -0700 (PDT)
Received: from hu-sibis-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb56d68adsm49105395ad.32.2026.05.23.01.55.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 May 2026 01:55:21 -0700 (PDT)
From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
To: robh@kernel.org, srini@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, prasad.kumpatla@oss.qualcomm.com
Subject: [PATCH V9 1/3] dt-bindings: soundwire: qcom: Increase max data ports to 17
Date: Sat, 23 May 2026 14:25:09 +0530
Message-Id: <20260523085511.2532669-2-sibi.sankar@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260523085511.2532669-1-sibi.sankar@oss.qualcomm.com>
References: <20260523085511.2532669-1-sibi.sankar@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: JM5QradhGCfdUY_OkjX2hwiRK9jBlANK
X-Proofpoint-GUID: JM5QradhGCfdUY_OkjX2hwiRK9jBlANK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIzMDA4NiBTYWx0ZWRfX9y+lgVyEy3FC
 VnwbyZdLNEs23dEZs0PC+wqWW7m/rhbQ8xlu5QKtqK3zoKLRFpKjfla3h6QKOdmbznhbImVJ2bY
 4B6wfkystrXIW7whLUBxvz2pWtftyVL/nnDgtmUyEO9ycfCMFNJUNyXDGVHmEni2x4j65vss7L5
 9kghVku+mb0KFAU9l28Uch4HpBP+P1WC3Mo5/AhYWOlRWHhqrrccfCe2lAjlq2CNnR9rb4NFDp9
 rKZiCsBbA8RZLhK0VpNBRUDHGau8jFwmtGcykmx11ltTTO6Kvhq5HyOIoj0BRnCdF6AkWd7RbwH
 Wb5RT2Lk+L0oYbijy/z8k4m4aNYBA1wbBm95JgZ7zCp077Cvl4k9Zb+mnMJfDxnNO/cOW/sxdtF
 GF5CiNxTySfbCxuLBdJLVJR2bzXlzViAng3Wxx1BQ+boZPEw57QLWNrHJ/cOaWywQ62R/jGdflZ
 lF07IRyfMIDuk4yu1zQ==
X-Authority-Analysis: v=2.4 cv=PJY/P/qC c=1 sm=1 tr=0 ts=6a116b7b cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=BZ2PEOZbcBSxFJMT2ysA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-23_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605230086

Bump the maxItems from 16 to 17 for all qcom,ports-* properties to
accommodate SoundWire controllers v3.1.0 with 17 data ports.

Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
---
 .../bindings/soundwire/qcom,soundwire.yaml    | 20 +++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml b/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml
index 9447a2f371b5..8e6973fa229c 100644
--- a/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml
+++ b/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml
@@ -90,7 +90,7 @@ properties:
       or applicable for the respective data port.
       More info in MIPI Alliance SoundWire 1.0 Specifications.
     minItems: 3
-    maxItems: 16
+    maxItems: 17
 
   qcom,ports-sinterval-low:
     $ref: /schemas/types.yaml#/definitions/uint8-array
@@ -101,7 +101,7 @@ properties:
       or applicable for the respective data port.
       More info in MIPI Alliance SoundWire 1.0 Specifications.
     minItems: 3
-    maxItems: 16
+    maxItems: 17
 
   qcom,ports-sinterval:
     $ref: /schemas/types.yaml#/definitions/uint16-array
@@ -112,7 +112,7 @@ properties:
       or applicable for the respective data port.
       More info in MIPI Alliance SoundWire 1.0 Specifications.
     minItems: 3
-    maxItems: 16
+    maxItems: 17
 
   qcom,ports-offset1:
     $ref: /schemas/types.yaml#/definitions/uint8-array
@@ -123,7 +123,7 @@ properties:
       or applicable for the respective data port.
       More info in MIPI Alliance SoundWire 1.0 Specifications.
     minItems: 3
-    maxItems: 16
+    maxItems: 17
 
   qcom,ports-offset2:
     $ref: /schemas/types.yaml#/definitions/uint8-array
@@ -134,7 +134,7 @@ properties:
       or applicable for the respective data port.
       More info in MIPI Alliance SoundWire 1.0 Specifications.
     minItems: 3
-    maxItems: 16
+    maxItems: 17
 
   qcom,ports-lane-control:
     $ref: /schemas/types.yaml#/definitions/uint8-array
@@ -145,7 +145,7 @@ properties:
       or applicable for the respective data port.
       More info in MIPI Alliance SoundWire 1.0 Specifications.
     minItems: 3
-    maxItems: 16
+    maxItems: 17
 
   qcom,ports-block-pack-mode:
     $ref: /schemas/types.yaml#/definitions/uint8-array
@@ -158,7 +158,7 @@ properties:
       or applicable for the respective data port.
       More info in MIPI Alliance SoundWire 1.0 Specifications.
     minItems: 3
-    maxItems: 16
+    maxItems: 17
     items:
       oneOf:
         - minimum: 0
@@ -175,7 +175,7 @@ properties:
       or applicable for the respective data port.
       More info in MIPI Alliance SoundWire 1.0 Specifications.
     minItems: 3
-    maxItems: 16
+    maxItems: 17
     items:
       oneOf:
         - minimum: 0
@@ -192,7 +192,7 @@ properties:
       or applicable for the respective data port.
       More info in MIPI Alliance SoundWire 1.0 Specifications.
     minItems: 3
-    maxItems: 16
+    maxItems: 17
     items:
       oneOf:
         - minimum: 0
@@ -208,7 +208,7 @@ properties:
       or applicable for the respective data port.
       More info in MIPI Alliance SoundWire 1.0 Specifications.
     minItems: 3
-    maxItems: 16
+    maxItems: 17
     items:
       oneOf:
         - minimum: 0
-- 
2.34.1

