Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3AEF3B2FFB
	for <devicetree@vger.kernel.org>; Wed, 15 Apr 2026 13:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776260023; cv=none; b=ZEcIpiaeIZbjxJ57E0dswPbHdv+uHn0voOebdn5AIt0btK8cq7/v/KgXhUlv2+sH1fIUW11YzbZ+0wIBWlNbvTEQshuwlMQaWte7HRFiQ8YRdfWqvyQV0O5NP91R6seOCGfrzbwDqu1s8QG/kD15VAP07HVJTJR0dlSRL54Ceb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776260023; c=relaxed/simple;
	bh=I4o6YNZQCCaDb7FwnvdTnwLu74HAplwTsh6AV5Ejy14=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WBjeOsSOsTIBvWe10XK+d3kgnMElVp/+7GVgyxJ4qPLprPWcB8SWXEsgT4c2O1Bzu53t8I5rUdh3Gb3xROOA6FNFqv+CJmMwI+k/sDpyFZrcCy+jtEKSvOkpWVl7EMzAccKKm6tCVZFav5/Puh4MNhNktMUIYz+EmIsHT8zd6UU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SDsKW/Kp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fFiMD0eC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SDsKW/Kp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fFiMD0eC"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63F9IeJB1779160
	for <devicetree@vger.kernel.org>; Wed, 15 Apr 2026 13:33:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7F5UOICTtsxmRIry0+s2iVrQ8PV0muAPY97dOkWpf1M=; b=SDsKW/KpPp2Hiu6c
	gcdlLl9u8QMmW5CFpeGhhyz5jpTJy2XWToMecq5zeaaQjU0/f0eEMR0XvpxisL77
	zuOADmDSZKf59Dg9e6SL9qSr1z0y6UzEaO8IETn0jukdpIg/5Ek4RQs4ByH5JE26
	WgNZ/hlGS+qvPt04MhTgYT2Zi1J9FOSUqh4nvTtA4+W7rBt/1zSpGfyu6TcdvSns
	agkbxLJK+R+1IKQJP+PgWouGNswUmnydnKaLEL3Uu8MjGJ6Nd2cobciFY2sczZZI
	wxJUg8FpSdn+xP8yQQ2vWiS0mw8uXjunjxUW/OpMVbZk5t1Lgo8XB9/bG+52kU4B
	jrwBTA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dhrw03r9d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 15 Apr 2026 13:33:41 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-82f0f2b2641so3627243b3a.3
        for <devicetree@vger.kernel.org>; Wed, 15 Apr 2026 06:33:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776260021; x=1776864821; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7F5UOICTtsxmRIry0+s2iVrQ8PV0muAPY97dOkWpf1M=;
        b=fFiMD0eCPMi7PGifkpFjCPOIzf64YzZmmrEgWHb2Rd0cgrngJXr/dbzeykaLliUen0
         jh6YDj+jChX8rXi10sxeB/UaAfOUd16x7ysO0/0seNWuG66KPWpqwZw/aJKUIjS6CJ6W
         IpXVlVNykg3Geh20yXLGGhIKlywStItJZ6EOoHm7fUGWDDi3gQrqzGoJn16h07rQjSLv
         hqc7QX535isjwBGVwkS5g1RYJZ5BbAQEiIUXr6oCPdULbxTTSjRFs6PjGZflkbebRf4X
         cGL6d2hfRy/o4DY/ubYNGDKx8BTJLu5VT6eqSPvQM9vlc09IP4JRlagkBwmfhlP4vxrB
         wjHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776260021; x=1776864821;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7F5UOICTtsxmRIry0+s2iVrQ8PV0muAPY97dOkWpf1M=;
        b=adijEL13XsvZiSQbHGk/DTKTLv3QQV4uCr2VhJLOFZgPVfqXkgFkHIHwr9bLjjGNIb
         flkgQ7c/sL8elHhEedZCh92NyPPZ+v1/GqSRChmZl9qQst1w2T04yP6pbN4aWJLEVFr2
         XNdmFKNaDOPmO9X6v0lx+WMZTK3OcS2Fofe0XaFOie0ydTpUtnZTIVmuL0SBxRXG+UdR
         6si9nsOxXbMxK6ERWSLvu459vpRGIjWaJruWrCwARU4KfsxfYre+jHJ0BnUsOP+ANSqb
         IsbdX8fz7E3VOGangGAkDOYG18gwp9b2nuJLc5H1H7zp/NYyjq7PFNTjgYFIGaaaemRA
         D02g==
X-Forwarded-Encrypted: i=1; AFNElJ+ACv+DDlIAcOZOqsdHiDOcCfoT3Rt0MjXbtWuzlNOKOiDJvHbTMIw2BfGtq8xznR7WvYw9/d/KSzJr@vger.kernel.org
X-Gm-Message-State: AOJu0YwWCksPZSKpleTQhS6GclQ+Ywr4RIpBsYwagzr+cF2gt9D2kQhO
	zeIIReYMejUpcilpwJmtdYdwjj66gDqP6UmbzJ3U670mG0kyeMLyTpoyCskpcSUBWW+9Zs/yLqO
	W00Wn8vsWPWgv6hmW8HADdU7835nPASB9Ii+lOtSIGYzLerjCJ5rt+I/SAvB2BM0D
X-Gm-Gg: AeBDietLJj0heVBgiXlEyfxLtDKmw951LlgbKYtflJ8q0Xo1iq4FTXZkxYtxAlmwqz3
	xpeFhu+FpKjUsORvIHXK8SUYXhIwkyFL1wI7ZROBxZGwYOld10h3ETjjNW8oEPsdQL0DzqCRdNI
	1LBUAof2JWsmnInBNNVSFNk6xdk2ZeFYoXjPjfA6GkHwiVZ3YCKxywyjdKDBBJvd14VtB8C2DY+
	SE6ZRnoTzfeynMhvrb6PvSsnbTtGI/DxqxFPhCBTGozD+IobneJW/wo1aSH6BGFmlo9tT5qpVeD
	GrJndnXzlRoenBzNMgWCoZ9zhpSRn/BzplS+5pZ8PpBlPTYZBSPlwwQpo1g9LuksqrGNo/VXnm1
	BumwmsDoCZLlCwEzfoSKKILrJ5UkvxsvlQbwmBE8JaKr2BotYXJivVa+5+KnN5Y+D5b2M4jedvX
	FRdEhcXDRqf1yP8ja9Cj+qc89htlf0tZQuwlOHhiaXfOPIJpMimRqpwPcu
X-Received: by 2002:a05:6a00:12ca:b0:82f:5a4:aa46 with SMTP id d2e1a72fcca58-82f0c2b510cmr20023783b3a.44.1776260020553;
        Wed, 15 Apr 2026 06:33:40 -0700 (PDT)
X-Received: by 2002:a05:6a00:12ca:b0:82f:5a4:aa46 with SMTP id d2e1a72fcca58-82f0c2b510cmr20023750b3a.44.1776260020056;
        Wed, 15 Apr 2026 06:33:40 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f6b95f222sm1602774b3a.29.2026.04.15.06.33.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 06:33:39 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Wed, 15 Apr 2026 19:03:18 +0530
Subject: [PATCH 3/5] dt-bindings: qcom: add IPQ9650 boards
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260415-ipq9650_boot_to_shell-v1-3-b37eb4c3a1d1@oss.qualcomm.com>
References: <20260415-ipq9650_boot_to_shell-v1-0-b37eb4c3a1d1@oss.qualcomm.com>
In-Reply-To: <20260415-ipq9650_boot_to_shell-v1-0-b37eb4c3a1d1@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776260000; l=821;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=I4o6YNZQCCaDb7FwnvdTnwLu74HAplwTsh6AV5Ejy14=;
 b=MbkKPCyBgmhldJHygpwYuks7foIDBOHg1RVVxuqEr8gDG7kUTI/LJsPukFs0Mu8/nD3ap2blg
 O0rJ6nvQJZ/D1R5etryASFhnBuwgb2K+ZJoTjKLQeGDyME7vAoKE7Yc
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Proofpoint-GUID: IuGndKjyOspB3SU-N2LWgRVaRi1gxBrw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE1MDEyNiBTYWx0ZWRfX6qieiEIiA8xt
 DhiaV2YwBeYzDTcjcockdJiFne5i4dff0qDALiJgjpmE4U3Sa0KX3YP68ZgnQPSFvhVkUHzFKVl
 qirTYDK5INPYy4f9pAKSmjzsA5IwYaan5T5jhhrUhWg0D/V5uJ2mj+pZn+ikwjD5QUuDRgQ2nHy
 DToJ6eiiBw7fO5WgK/AhtWCRNr0cXp+U4CwDC1hRIcRdTYDZ8tSDWOzDKAhukyNgWZLHlFcXks7
 IItnKyc2SjRBsOIjg08Mp7TGYAmMoxPVJi7K5x6xhaxhhvh3hF8TpGgJrBLB6TVrtl2gPukvwm6
 MzfMwUJzbgKnzBHrMQkUhUhjOElP57MVTsxS+cft5ZP4lmubixXVdv1Vbyl5bI/K2jcGkIj7NnG
 /3SXRHsRSXrCIYX1A1sCJ81qlEdbZlTJGTmKxlu4r25QP9++AEhRNiyFsqZmZM/I2P4Gld6WKdm
 BcGq3F7WUD2bb6UnkEg==
X-Proofpoint-ORIG-GUID: IuGndKjyOspB3SU-N2LWgRVaRi1gxBrw
X-Authority-Analysis: v=2.4 cv=YMGvDxGx c=1 sm=1 tr=0 ts=69df93b5 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=w0Gmm53Jqs2pEdcyGHcA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-15_01,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 phishscore=0 bulkscore=0 spamscore=0
 suspectscore=0 clxscore=1015 malwarescore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604150126

Document the new IPQ9650 SoC/board device tree bindings.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index b4943123d2e4..5d0855765fdb 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -365,6 +365,11 @@ properties:
               - qcom,ipq9574-ap-al02-c9
           - const: qcom,ipq9574
 
+      - items:
+          - enum:
+              - qcom,ipq9650-rdp488
+          - const: qcom,ipq9650
+
       - items:
           - enum:
               - qcom,kaanapali-mtp

-- 
2.34.1

