Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793742261;
	b=jvyy3ZuG8isOVtBD0Ryi4GsP7wBbKgnAkoRBwOb09Ht+6whBa7WYt9ijGNldTO7pnPxC
	 WmCzE4nOe8OdSne4f/IGV+KU/6Tz9hkfw0Lo4/qs379qcqviA2CNl25GNz578+K1cazRp
	 2Q2qWoKhZEL+eBtfvnUKujs95BCqBWNP2neo90QCaxQsD8QUoJ7fBcKwS5oYIjuiFnAgS
	 1/E7hkvz1gZ01I9Aod73D8FFqDQcZcIEm26TYWwE/v62ybO3SPy1Z7iVlWhNHtAUVDYYy
	 WLI/j4g4AIl61CLidyet68FnVpNZemdeukHZGlZYZRcATrC/+tdSb2bTChALyMqh28Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793742261;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=+++IlRx433pq80T1LDRVDnLL2Oso/QXyI+O9jAXqPXg=;
	b=A2sCMvIjuSF6vy6wfJnH50J5PjlHDs/CP7bfbB5VBxvuIoaWV5YU6JHM8i7Wlk2HFYHR
	 E6+dupoIECe2IAiPGGuUkpyx9AydBehwkzlj3gbzmEsK9H5ajNMjrjeq39jbKJHMEJPB6
	 etkc/OA7sEqTWSI1uEAD02oOqHv8LHxTJzIlgwiWIlqX+qwWxars5Ix5t7V4OUsMrp42+
	 snv4y0q0QQk/3BcV15SsoYcAQ4UNEHL4GW/1L4ztP14zZBH4ElJaOIjmqWIT9RJlbrPqJ
	 d6OOSU0LJfaRAvGCrjQ+ifjfaswHItYB4bYlOVxESBhHXtEFJ58XYDkexdGVGQvLJEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=g9ml9lev;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KGIfBCtA;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B727606A328
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 21:44:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B727606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=g9ml9lev;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KGIfBCtA
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3LL4hx2944192
	for <devicetree@vger.kernel.org>; Tue, 3 Nov 2026 21:44:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=+++IlRx433pq80T1LDRVDnLL2Oso/QXyI+O
	9jAXqPXg=; b=g9ml9levk01tTILlao9CA8SRgQa9XKCvYOA5mJX39srXFuPMF2g
	lX1lVpSADQnqSE5AQWPZoPd5juDE3cEbEgfhhn45IBCmiHc43eDM04TDRSD+PV7k
	NsmsoLSd9fB1y/iHO6a+LiVwAGcy99u+5dfTXbvw5Gc0WLdJv/WHMP808xbgBaR7
	/TiulbR2XN3rcCGntbZfFq5GokWP8HWQ/Objqa0sZlOSyeMU3SkVndUL/4uwoiIE
	Z9A5AldIrugJejiNlw3cMruNILm/WVHAFvrXPeyti6zEj+g4QGSGl3j1faJqPIbr
	w+OHMyRf+idKiV//+HlOWAHH2tcn4uuXhnw==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqmjbrskg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 03 Nov 2026 21:44:19 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7cc3a482af7so18531137.3
        for <devicetree@vger.kernel.org>; Tue, 03 Nov 2026 13:44:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793742259; x=1794347059; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+++IlRx433pq80T1LDRVDnLL2Oso/QXyI+O9jAXqPXg=;
        b=KGIfBCtAsbboKNLLsM1SpboHeWjCcpEg+YLaEshsPx0tl5RuTPV2nhdGVwuldAs4tr
         ojafqci46vOMfS024H8KjtqCBTZ6769hO+0O6hkjXnnDNL77LesOukZro23tcZGDORQk
         tMiBtHTAVRA90XUXw59ZPRXRX0n0GUtryqL5epNe0R2CDsz6Vhk4SVnAxMJdaqgYuJNJ
         ieNVeF08f9vm1q1vnx1i4leFRb36g9RF7BSf2hrypMvXtmLxJKKIfzyCeet/fDNhr8pK
         ZKnIFD1yM4UCPNX7ztmJ42y+SXWsKnXJ8PfEXctA0p/cSsD3P0t8X7xtVCxWJ3JrmB2M
         G8Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793742259; x=1794347059;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+++IlRx433pq80T1LDRVDnLL2Oso/QXyI+O9jAXqPXg=;
        b=QoJiDA/aJ3PjxODjpcDrpBf4zzw6f90eTHmI3mM0fWgxW6p6KOeY3vmh2oUNx1ZpVi
         gLbulJnGtp4Z7foC17BePhUOI7b/eGvqTHy42AfpHliCN8akz8wSpQSMh2mzuccLviEx
         Eiz1nUG31Qul6FZl1vuHIMCdPDHoSabqZV4v5enBHaScsUVGeWn3ZO4b3KMfMJz1Y5tc
         1fGEkjiXPz52U4MGv8SqfvJa1/bDvLm27v9bMYXqcnUyTuOB2NUYYeTLkKYn1MWudZ4H
         /LrhywNBvXxr0hIEZv2oDrETdE1yjpcw6KW8tDhqmyTIlLzHTAe1YX3ZaQvYcr0xjnVz
         AmVg==
X-Forwarded-Encrypted: i=1; AKwUvBzLGuGvyqFs58VkaimHyIGzbrA9v856/kt9gbLcbDVZGivA6oZdHSoaleCJn43S9mtA101BMh3AuktF@vger.kernel.org
X-Gm-Message-State: APuU4Z/HFOSG7ZuIL1zRmrfX8LWrySprl4A6OOpZgE1kw4Wu3E8oSVWf
	TTymOZDhFwmqVy5vnvJ5GjVSjfKZsMCOeUivSQPK+BjantpJGpynn6/0ArGj7QNdrUZ+Xuc4lqZ
	9kfDLBNeYcnsTvSdDSBD0kOVnnxeJs+fhzJCFikGINnsQ2Yr7Y6SAS7seGkreyQgO
X-Gm-Gg: AYBFou1fgUzDtfNJy5D2WGl2EymP9Viako4aPgdGltGD9iVsIFp+lJ9BTkIVVuxfxnb
	3L1GoSI07+ySvu2p2I0P8am0SjwdUKBlaZVndoA1sEobhzKGdhOB/rLI+KGQvW0XDx9KrR9c0CH
	9X5HBsRltKRTqXfLip67T2IEKJWwqZJwCraPDgmx+MvNvNIKPPDqfSxOx4g4oVSKE6qfGzAWbCS
	zejQmzp0+3aWn9lv8heDMi3oZY+rnNuAiLI4Ozi5dZiRimh70u20jbhmjJiZ0G1fZb8lnF+DCaf
	lEzwQ2LSuzYFPIjtKr34qLK9cTLyR98USqODAZIVuxfpZyz+fmE78+bUmRjzawly0jFisToKxzV
	L7lExBXfBSDsD8IRF2HvX9bNgmJ8/9+wtI6XU+LXOMS84bsttqpgxLPYCLTWEMqkF6mLkcHjz8w
	UW
X-Received: by 2002:a05:6102:3ec5:b0:7c0:cdd9:31c1 with SMTP id ada2fe7eead31-7d072615564mr6302506137.12.1793742258819;
        Tue, 03 Nov 2026 13:44:18 -0800 (PST)
X-Received: by 2002:a05:6102:3ec5:b0:7c0:cdd9:31c1 with SMTP id ada2fe7eead31-7d072615564mr6302499137.12.1793742258366;
        Tue, 03 Nov 2026 13:44:18 -0800 (PST)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:eeba:6d3f:bd6f:18be])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fece99a5dsm181674f8f.21.2026.11.03.13.44.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 13:44:16 -0800 (PST)
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: daniel.lezcano@oss.qualcomm.com
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-pm@vger.kernel.org (open list:THERMAL),
        devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] dt-bindings: thermal: Use signed integers for coefficients
Date: Tue,  3 Nov 2026 22:43:57 +0100
Message-ID: <20261103214357.2700244-1-daniel.lezcano@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: bcGOpjkBCroA36GNKYIhJ7RKUq0kEtCB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA4NiBTYWx0ZWRfX1bcByqU4XXLb
 YYvXmL3rsrkbxqaPbKI4L4ShaFV+3IopLBNiH1IoRj4z7gZXn8Z7GBwtDZOe/aNNcw1f7mHWLkx
 DIUyVt1wgVoTdVpzEM6ei6sJWU4XPN9VwDxpC3auGJgG826VUxRE1JhZwGW8f7dO5Aaxh4Twyz9
 MGmiF8nGZ+ulMSjtqTbvGVt7ofR949Kcm1EDpu+NFasiin6xY4jc2tfbRGuXY301BsPh62jVNRZ
 j8GnmQx7h5t0IJEOAbFCE3ff4pQtVk4yxnwRXeLYDWbVjNyDW6N9ah/b0W+W+QsEPMgevlAH2SQ
 taF8Uy422Jx/Nj2TvXpXBMCgsAo6p2RbxW9DNTbczqRxEKbZQNhapJv/qgQ1l8FQ1CjzmZPBLgs
 W+hfyRD5ycO8XxGatProd07D3M/64wWEka8kLFj9DOe/UAqTuTnRd7itcZeDYGvpqVjlY0Y0yHh
 6e8KjrQ75TmM76X5Y6g==
X-Proofpoint-ORIG-GUID: bcGOpjkBCroA36GNKYIhJ7RKUq0kEtCB
X-Authority-Analysis: v=2.4 cv=NMhAaE6g c=1 sm=1 tr=0 ts=6aea55b3 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8 a=W5l6zmR3omWN6YeRZy0A:9
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA4NiBTYWx0ZWRfX9Z6nVcYWWSUQ
 rIGgNpCHOAg/8SnLB8WWvgDR98W3BVX8wR7idvF+qL65WhSnv4J4R/Ocpj22jzKLFpDgijH3TyB
 y7xUWre91qMPXe8xmJX4T66pJ+2O8Vg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_05,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 suspectscore=0 phishscore=0 adultscore=0 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611030086

The coefficients property describes the coefficients of a linear
equation used to derive a thermal zone temperature. Both the slope
and the constant offset can be negative, and the thermal core stores
them as signed integers.

Existing Device Trees already rely on signed values. OMAP4460 uses
an offset of -9301, while OMAP5 uses offsets of -1791 and -2992.
Broadcom platforms also use negative slopes. Declaring the property
as uint32-array does not represent these values correctly.

Change the property type to int32-array so schema validation decodes
the cells as signed 32-bit integers, matching their intended meaning
and the thermal implementation. The cell width and binary encoding
remain unchanged, preserving compatibility with existing Device
Trees.

Fixes: 1202a442a31f ("dt-bindings: thermal: Add yaml bindings for thermal zones")
Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/thermal/thermal-zones.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/thermal/thermal-zones.yaml b/Documentation/devicetree/bindings/thermal/thermal-zones.yaml
index 999ad40a20d5..72e419124f98 100644
--- a/Documentation/devicetree/bindings/thermal/thermal-zones.yaml
+++ b/Documentation/devicetree/bindings/thermal/thermal-zones.yaml
@@ -101,7 +101,7 @@ patternProperties:
           thermal zone.
 
       coefficients:
-        $ref: /schemas/types.yaml#/definitions/uint32-array
+        $ref: /schemas/types.yaml#/definitions/int32-array
         description:
           An array of integers containing the coefficients of a linear equation
           that binds all the sensors listed in this thermal zone.
-- 
2.43.0

