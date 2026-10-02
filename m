Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87B9A3F210A
	for <devicetree@vger.kernel.org>; Fri,  2 Oct 2026 06:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790922622; cv=none; b=aaFY/kYzF+toPbe0D4m3EfI9kGJ/coG4XBthyuTSubCO9aMFUyVIpFUtQdSnRstUm2/BUiT4JbmIlz/qrdKVZJC6MhC2dM0nPHR509jAbqpU7yIUz5vsUYqjIF2HjzGUpWzZZCvisudq9CG5OKrNfYf00oBbT3vmGK6D09umP60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790922622; c=relaxed/simple;
	bh=Z1/5o4RAsawBPWmbuQWta9W6Sxz3I4lPmR4hBCTFPDQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WoF/RGaPI2zdPaDFgbSX6EaS3MnmuhCUw2Ch+a/v3fWaut+sWONtUdirp9o5QZgw55X3BkW2mSXPemnGF4ntJwvtEN+MM4RYkBUfdvLPR+LeVDDtudguhZbnA+QmZeP+mkxS91aIyC6Sxs9w4kjh6T5UXw2EXJgPuZtqgS2KEcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RpNYyUWW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VKgRfejN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RpNYyUWW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VKgRfejN"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6925j1gn4019809
	for <devicetree@vger.kernel.org>; Fri, 2 Oct 2026 06:30:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=AUVkIsWMw0dFcQIEGk+xgcjL36OGBgewX3H
	KO4TNcdE=; b=RpNYyUWWV76/CZ45UrJvQOahkxFYX6gC6ZsqM1GgZyVLb9QSO6J
	TlYoLePwdcO45gnQbBKw4jfbygXjdWNO4ZIkursTG17KCiqK8UbBAPNgmc9MVUcq
	SIEB0d2CwF5JDRXH4FJ1I8en0zZ3zpiVFL2nmEpT8/VQrJfSmTSYMQHHL7fbcOey
	P1ZbwIlVWhu4Oo6IyDdLXWz/xm0vgwFOOE7CjaGz1340BFFok5jn3Y+OxKTiJsfX
	DWGgGqUOSjCPBMI7r3zq2zYClDlPAUCQn2dVNqdRMVAtx3k3B3u/JIef7yFL/ztO
	UPpQ741liGrDwlfQasJmGiGPsVpmphwE88A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1rvqbdr3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 02 Oct 2026 06:30:20 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93a082c014aso389485685a.0
        for <devicetree@vger.kernel.org>; Thu, 01 Oct 2026 23:30:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790922620; x=1791527420; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=AUVkIsWMw0dFcQIEGk+xgcjL36OGBgewX3HKO4TNcdE=;
        b=VKgRfejNZVB2ipfh2tiyGr70xrnE523Vj0jvNwIVZBMvOEZYdLE9g4WYu8ZmY9yKWT
         kEG3laqQZBYoExUib824VdMJnfXIwTVAc7NOFMb8Z5A68qtQ/BpxfTNZXVn5V7ay0G0S
         QxhLOCsS1A3071XRWiN/odW6kgxMRn1qfXc3+R9hTInVwWE6d+QvvRjPEed8YvCNgWym
         pah/ggHMGV/UN2jKEjw0MbrsWaCB7mVitRnktuCedRBXIQ5TWzwgFc5sV0xBU2os8rT6
         WVqjbWhjl1vw1X0mmVpPaRS9uJY1Qk5RczPMl30cOzSP6jaSWslU8NU0u5slPShxNF7+
         MvkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790922620; x=1791527420;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AUVkIsWMw0dFcQIEGk+xgcjL36OGBgewX3HKO4TNcdE=;
        b=BU9FAhOJbu7r1fEX1LSDI/2z5wGvKe00Nspiov7QhTAkbi4f86ScuGGtrVL7BuvMtx
         Jc9gQDH/WL7GCNasCiJtZ6hfGq7bLFOzT8y/8YgH3zOOZiXa/LtaVQyInECxi6tjdn81
         nZ91keddRJHtD/Lm0eVswZAs3Vlxbxw8YQIC+4rvkFua6uHbGmVnUcExA2OBrmaMlYx7
         t0pD38b0Ulc2WFX0yEk708/hwaQ89zW7D9sL/0gkNDM/d2BAqE1mcH90v4ucubMCbgy1
         zOqH/3fDqYxik/g8FGTaswkAfC0aq05wPyRISqXGJlUabevu9ycnQfFhjVS/j0vc+QYl
         yeuQ==
X-Forwarded-Encrypted: i=1; AKwUvBzMZl2zW7DOsjBgwjzMCNnbQ8+EpX4wGh0eLJvxuxzvdPYNCEkoNbZnmg4JFr5yPBX9Ign9T72YZB7u@vger.kernel.org
X-Gm-Message-State: AFuF++njp4XhCYGXV+0fauxrfMr+ayxpMLb/vVRMX5/4ByVhutvx7s0n
	hneBJk0hcYc7uG6lXLZxvN9R80mdAB/fWNr73CVyU9zbPpEQuZ+A21l56aj28D4OmYcNeGeFMah
	VvQao1UI0easF7/LANS0DQyAwHKFv1LGtpRidnvOu1MHZFn2RhnawRcBZl+qwKehK
X-Gm-Gg: AYBFou3hkteJKosUlcOH4Hc62n9k7AcUK2MrLCMauoK7jy7LCfgdAgPVXelbpp/Igp2
	/I7X/kSTXRqqrUxSgwhzUpQvjKfy8leusIyuyEMWgd4bVer6NhZQtPz1GOQSo9PqvWiz9JQxX8/
	/EVWS2iYxBEVSgYXGM/DiGw7rkFHJDSU/FeR4MzKHcAqVUT6yGcTD4H1n/Z3bm9fh0jpaJ+gyOy
	Y1WnzhdTh0p/4jAgcXoiWyqyDYwqOMC1c7OQRdOhWDd9UMK9M892WtwVq2P1fVqSkzX4/V/qupJ
	N072JllMX9XcpUANLXFj97m+VKrefx59nSs4Y916I1I9WWlmOVpq2oDUsO2V6ZVqmNZ3WjkDWVY
	01Tt1MDxr2zYXqwU=
X-Received: by 2002:a05:620a:7088:b0:93b:d88b:ee01 with SMTP id af79cd13be357-93cb5c4dd5fmr1081006785a.34.1790922619660;
        Thu, 01 Oct 2026 23:30:19 -0700 (PDT)
X-Received: by 2002:a05:620a:7088:b0:93b:d88b:ee01 with SMTP id af79cd13be357-93cb5c4dd5fmr1081004585a.34.1790922619171;
        Thu, 01 Oct 2026 23:30:19 -0700 (PDT)
Received: from quoll ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b38104c09sm3361558f8f.32.2026.10.01.23.30.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 23:30:18 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>,
        Santosh Shilimkar <ssantosh@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] dt-bindings: arm: keystone: ti,sci: Correct reg and mboxes constraints
Date: Fri,  2 Oct 2026 08:30:12 +0200
Message-ID: <20261002063011.38972-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1048; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=Z1/5o4RAsawBPWmbuQWta9W6Sxz3I4lPmR4hBCTFPDQ=;
 b=kA0DAAoBwTdm5oaLg9cByyZiAGq/T3PIMt08WCCTfCYps6hW6Q2EK0e9V2qrHFO7b3EY+d8+d
 YkCMwQAAQoAHRYhBN3SYig9ERsjO264qME3ZuaGi4PXBQJqv09zAAoJEME3ZuaGi4PXYHkP/i9+
 dnDT3YaZnTceK720Db+Z8zIZlt9zhYH+1bhxl2BGH/BoKesyPjeGX/3El0EU+8OB30eL5Z3/JZW
 98/1XU5cqVVCnGLl5djI+04v7dnktQ42j8H24sp9lu9bCrkb25SOIMJPhmWtXRe+15WpvzlEeEq
 mxfcws9C42w1TqRkcdQAeV32wwfnFcgODjROS4n+/tM03mbz60Kl/YxHTr7v1NQJhO8OgmnnjI+
 w28huJs36Pb5UqEbylYpzEIfsxKTgjPmV9iC1Iga8bCZeLJkA+IFmojL9S7IE7QQFjdPvLKaKWc
 q1Nmgbdo90GOegRy6N9kNPQE0O4MKK0hnMo1OvsvEwSMpk2fHdGdhtw3msp3rV9hCls3E8kOkxS
 a59z1dRw3jpmvb4EXNMv8OgP7heaF4HiOqIerT983yJN31Z//yq0A6wru6U7ULTtGsd43SICO3/
 htsYZAY5Ow7PPjlUPG9XoUzL6MX/5w1FVRkCqcD0lZT8z/PK6HdcZkdn8liP/4y3nkHqqACm7gy
 Fz1IfjQhRkF+yNoJ/eRwzPIvJ+FhjpeIa0xfUTBaehCC0nyzc3qS6LK6FSP2FVzFA0zEWxILynU
 Q8OcK607OfS8Q6ulNRcve0nj+wNC6iaVM/osUB7XHH9LWIGa0LKXrDr7ZScmumJZYXcPp0lqspv cGtW1
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDAyNSBTYWx0ZWRfX+ov+9P8xAwDV
 xLEwfD2Une+9lMCLzNBidwdDj44CbEWRyLe/lCKvOnkl+elZtFpqFfd8M7M3fzy8VWOoHCmJrjy
 SnwqBdxW57eoDERymPifgKl5n9Exxc8pw46VFQtekwm1hiVAz/UVAHGoAARZ/tAfbuw1P0d5uCg
 h2fxsyNt8Go4OwAtT92EBsYbr894qH094EI+XTrd5b47PaGe9Iq8DzHhn6rQh/8KP94a63GzLGB
 KSEkF7ui41NZdUrNvhfFU/bSzVactHNOOavW54qRupAb4pP8gFUG3CcISdBT5Bn3aK/fjYG8JRY
 Vq030sjNWR9X+8huH3XZVAeGz7xDNlyqf20PTqpI0PtdzoUF/7sRUzhzsCx+FkExCnzjjqCLgQ3
 U5ktrEXtaVSvS/iBSqIJk0IBNHf4iMC93k75jAlz21CJBdBs2doRiijPEzlRjCYWDUPwblB51kP
 mH0yHQNwDhEMQH93y7Q==
X-Authority-Analysis: v=2.4 cv=JIauIMKb c=1 sm=1 tr=0 ts=6abf4f7c cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=e2KClx-4LWyga-VmItEA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: 7WDzq2GVHaJqcRcaLnedni238Tu4KLnI
X-Proofpoint-ORIG-GUID: 7WDzq2GVHaJqcRcaLnedni238Tu4KLnI
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDAyNSBTYWx0ZWRfXyda1oZQ5N3pf
 mchfJmOwB85/FTfW0onEvdDCiA4DwsPLR8c///9Hn3UphUUPr8yCid/gDq14s8uMCrEU50d8yM9
 4qmhyOO8+05pW1TAyfBkafrU6+GoLsA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_02,2026-10-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 phishscore=0 impostorscore=0 bulkscore=0
 spamscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610020025

minItems does not impose any limit on actual maximum number of items in
a list, thus it needs maxItems.  maxItems on the other hand does imply
minItems.  Add missing upper bound on 'reg' and 'mboxes'.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/keystone/ti,sci.yaml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/keystone/ti,sci.yaml b/Documentation/devicetree/bindings/arm/keystone/ti,sci.yaml
index 25a2b42105e5..052e23966a8f 100644
--- a/Documentation/devicetree/bindings/arm/keystone/ti,sci.yaml
+++ b/Documentation/devicetree/bindings/arm/keystone/ti,sci.yaml
@@ -48,7 +48,7 @@ properties:
     const: debug_messages
 
   reg:
-    minItems: 1
+    maxItems: 1
 
   mbox-names:
     description: |
@@ -59,7 +59,7 @@ properties:
       - const: tx
 
   mboxes:
-    minItems: 2
+    maxItems: 2
 
   ti,host-id:
     $ref: /schemas/types.yaml#/definitions/uint32
-- 
2.53.0

