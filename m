Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792590182;
	b=joPybteoXNf40rj/O3LeTE7L23L0qp8ERforh4a7/YGIxaChqiRnZlCFnQJgwGA91wsn
	 1989bR95+RMrl4gQJco4jF0eLvyRkHXvia07altC96GrOv/dLxIOs/s/pMhm+CSq460nk
	 pdgukUQXhzzYdlr247niZJo/wWL7GWCaGa30Lcwz7QVYwbFMZ0pglNM+igmNzeavg3qdY
	 scoJcQX0MoX6/PgNOP0EXu+s1QT9G7NF5AROfxDX/tNm52F/VKddyaAV2/KX9TVGKaxAQ
	 9fRaAOISffoah5/9q7ZWA+TV0tLKqASuPjTch9uhHZIfUzduAGbC+LFIR4fS4444D8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792590182;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=zF9NZ8zldpsm3Sxh+HJmBn1FGdadQNBwM4F0LpqXvtQ=;
	b=3iOdJ/1b8290hAHybcSEWK63HFAuFOUaehpH/KH88p84LujuqCH/DfO6BcnaU6t5GhR/
	 SRBMwUBHXtEDg/gLaJl7NWD9QP+/CzaUKGaIp+J7jfaVVOcRxJvgndgpPi4H6pQ+Ao7gQ
	 4tszIdeZ6lFYqFNw9IJURg4/w7X7pUBsGuPQ9lljsHhG4gwh2DDSIIlkrNAcpG9TX+2SL
	 GsLuHRyB2C3/v+5gY4BFBMo1WOz8EUvmhugDX50FB/NmoDZR6nvF2Bj0JVp3Soy9MR4/C
	 rV9oaDwEHEy7DYuVC1Bqphepgjanuc2MwBLaRLb5hvuHSVOH6/6FrX1uM3W0lxb5UUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pLF4V1yV;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QBdOHoOv;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 882E2606A319
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 13:43:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 882E2606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pLF4V1yV;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QBdOHoOv
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LDHOKS4038146
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 13:43:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=zF9NZ8zldpsm3Sxh+HJmBn1FGdadQNBwM4F
	0LpqXvtQ=; b=pLF4V1yV5SxgrLhU4KqgqrqQMMYHGCxNNptCrHC5dd+Xd4YH1zP
	oR+maJjpJ8yn7+UUPCoN36mMMwmUcoDOSDe66fr0EqxqGfNut5KG0CXaaD8ExdI7
	WzbKVxl9FrHLmxvv11Rf/kObj9/7cN1xs6OPdALcPiWQ96ml9/3YrxD7bnYi0jXd
	t++kBG0DS2u1jY8SGS7S9oSTEljcouD7ppF3ob8R/jieXQVjT3SwRHIEJ0wrUX4U
	lSJeO7siafAOCqkE2jRWA0sna0HC0h/zjHmD+wCGZOinlMgiRc0awmyFC00X0vt8
	/MUFJOJ8J9JMMNYXdgZN3B4n5hEIVQGfbFw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hex5883pf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 13:43:00 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cb93c874bso343956585a.0
        for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 06:43:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792590179; x=1793194979; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zF9NZ8zldpsm3Sxh+HJmBn1FGdadQNBwM4F0LpqXvtQ=;
        b=QBdOHoOv6yLG1bEOrNEqZYxU5EZzTYYwBXPUs+IWZtSyoesj+MRovjtbgjoMVOvUSk
         EPM7cDyY6kJybeYsY73hFG1gy0K/DZ9YyZgQzkpTxYqoycSKWmamL8Qo91HbbpbULvWh
         Mda59Vmi12GWlMxuBra1CWsRG7HUvNFonf+oKSgUFcjK+Nta2dd0O9KWsiNplYVrCEmv
         QoxtN7PpkH0Qt02pKr8ftOi+QTsl6kScHVGZd5NedNdUt3SdZY2bqJnADyf8yD8LtRUT
         OzvITQhuTbxgvBBx2zrOJp8csNqryrbsJ8pfLiZeujA43Ohsi1H0ilhIruWDUjQ0uBa0
         4JOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792590179; x=1793194979;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zF9NZ8zldpsm3Sxh+HJmBn1FGdadQNBwM4F0LpqXvtQ=;
        b=oaKRiK1Ia1qI0Tx3LGwyxGoJyApSQAijE3BjmQmDF/nKgOAwZdwlbTlH4iLx/P6oP9
         AR5Vf7dkrapb0kLWEhFtkLreItbhEP3KwUE0i+Vj8iSmQhYwySVZ3mkpx9wpQmlAkpZs
         B0jF8R/rmhHc+JCnG9O47OCDUOaH2/4G0Kfki6bJqj+3PMA8t+RhD9vc1hIwRRuhAuei
         t96jzIAzUQWy3yj1df3Osixbrgk7YVwg1azkPH3NERlaU7K6eyePfVzGYdv74AWgyjqE
         5UkDTCClHOgG+Ex1y3k7yAXtMBWwCqiRMgoLke15qqNHeuvnuursxgC1dXYJ26+B05i9
         lfZQ==
X-Forwarded-Encrypted: i=1; AKwUvByJwjvyZU38fIb44JOQrU+khBxlmWqmHMkwMtCNU49RnNgVdteKfuLXZhnnpw1K/G18bVNDsr0E2J19@vger.kernel.org
X-Gm-Message-State: AFq9FYL4TSKIsGq7yaxWLvOshAb2eB3rGUl81Bc3bXjuHqznHv8qU4Pn
	idwviD+6XMvPx+goZRe/GZwzuZToi8CQsklgaxU2WVBRtn+VPyjbO1shVLQUDVL3Nxfkkc57fFh
	p1OHdoaACVbZQ48q7MeUE14wbsrFnVQw6HKqsA7hwqpy/ZxO+FW2VYw1R1tOlWAPt
X-Gm-Gg: AYBFou18pVGbkkgULKAg30KSKdPLf0RbmvRlw6AIbbDw2TQLN73Zfp/APM0M5qUlVO7
	aG+AXslbAYu/RB5oZVIuQKvs7VEcKT3ZQL2E0HalamWz5nDOTQnRCKthkTsXtVxNM0XBdxnrEHa
	NVMXu6iCQcHukel9IytPLbeL4trify4MD5BuTmpIyaRWJVBvPE+LKdklbkp1dU72AS7ZI3mrQ5P
	SjZqvg5BBQavaQeRPK69Qt3gc8l2ax0Sad1R12hAZMSq2nXhbckDuYvi0t6xK0CFRJd5R0VzkKS
	fRB2K468hh+kD6MXUvLOv+UZaQd5fAH80ZqKeWjz6gNwshhcew37HbL3pZCUUIvR/p2jVNnoXqK
	qu7nTzAefmx9Y4TrnJ8b+zE9dwfLkXmbVjA==
X-Received: by 2002:a05:620a:1a19:b0:93f:36d8:5334 with SMTP id af79cd13be357-93f4c66bce2mr859700485a.21.1792590179471;
        Wed, 21 Oct 2026 06:42:59 -0700 (PDT)
X-Received: by 2002:a05:620a:1a19:b0:93f:36d8:5334 with SMTP id af79cd13be357-93f4c66bce2mr859695285a.21.1792590178874;
        Wed, 21 Oct 2026 06:42:58 -0700 (PDT)
Received: from juillet.box.freepro.com ([2a05:6e02:1041:c10:297a:d3e4:3ba8:fbfd])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1fb845dc2sm73536425e9.8.2026.10.21.06.42.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 06:42:56 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: rafael@kernel.org, daniel.lezcano@oss.qualcomm.com, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: rui.zhang@intel.com, lukasz.luba@arm.com, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] thermal: Share THERMAL_NO_LIMIT between kernel and DT bindings
Date: Wed, 21 Oct 2026 15:42:43 +0200
Message-ID: <20261021134243.35103-1-daniel.lezcano@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA1NCBTYWx0ZWRfX9IzQYLlQDA9B
 DJO8uu4Z6qdHBvF5IrVdIBl6CXor2rV9BpFjjCSEOKk+l/La5sOQuHPsssWdk/DBhXw0PBpS3bn
 uwgOp75y1WyxX0ZEn00941s0Ol1DPH4=
X-Proofpoint-GUID: SGoIsClU7OciSx00tZt-OooCspanVAtS
X-Proofpoint-ORIG-GUID: SGoIsClU7OciSx00tZt-OooCspanVAtS
X-Authority-Analysis: v=2.4 cv=Ku7YSmWN c=1 sm=1 tr=0 ts=6ad8c164 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8 a=DIsPBAb7muRbsDREbf0A:9
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA1NCBTYWx0ZWRfX2OB+CIaXWrPz
 SSLE59BN2lhz7wvPfVVLkiEl/prgSb0XUuZVlD8EkdZuUyadPQr872Yf6ti7f/sRsz/HXGTqFhs
 62va6P53gxxTJ66XRwjvG9LpZJe5NUSBeRnjQf07kJ/5TtBfWimVidprD4YUAiywHK4RfJ2dDgE
 nuR54hqgc7fI5dnpFAzUMXzWUBAZkxVVd+krCv/BB0eoWz43FS1gMHxGUZ+11kuIHogAVfecUcs
 YL9AszPucGsCO/otHk98c8WvUL1/E+3OoiuvEREWuwtsV3ewlJrHLmKCD2rVs0bnCQf0Wg4PhOP
 undpZewHhzbPHFNDM+RUqDvMJrlBDGid7/MweZGF88vnP8AI4QxmUelSvUxzC1JKZC2GOjRPbRP
 mpr9i5jCSbw1b/Ck3gnpHnyHhXHvQm02FBCwTIIbYy0IB1tlhn7IswBdsz/rsznc8RJ5RRg5EOg
 29Qk4amZh/QQbazKaBA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 adultscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210054

THERMAL_NO_LIMIT is defined separately in the thermal core and the DT
bindings, using different expressions for the same no-limit sentinel.

Define it as 0xffffffff in the DT bindings header and include that
header from linux/thermal.h. Remove the duplicate kernel definition so
both interfaces use the same unsigned 32-bit value while preserving
the existing DT encoding.

Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
---
 include/dt-bindings/thermal/thermal.h | 2 +-
 include/linux/thermal.h               | 5 ++---
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/include/dt-bindings/thermal/thermal.h b/include/dt-bindings/thermal/thermal.h
index bc7babb1a67c..018f75febb9f 100644
--- a/include/dt-bindings/thermal/thermal.h
+++ b/include/dt-bindings/thermal/thermal.h
@@ -10,7 +10,7 @@
 #define _DT_BINDINGS_THERMAL_THERMAL_H
 
 /* On cooling devices upper and lower limits */
-#define THERMAL_NO_LIMIT		(~0)
+#define THERMAL_NO_LIMIT		0xffffffff /* ~0U */
 
 #endif
 
diff --git a/include/linux/thermal.h b/include/linux/thermal.h
index 083b4f533933..a6f635f0e1f8 100644
--- a/include/linux/thermal.h
+++ b/include/linux/thermal.h
@@ -17,12 +17,11 @@
 #include <linux/workqueue.h>
 #include <uapi/linux/thermal.h>
 
+#include <dt-bindings/thermal/thermal.h>
+
 /* invalid cooling state */
 #define THERMAL_CSTATE_INVALID -1UL
 
-/* No upper/lower limit requirement */
-#define THERMAL_NO_LIMIT	((u32)~0)
-
 /* Default weight of a bound cooling device */
 #define THERMAL_WEIGHT_DEFAULT 0
 
-- 
2.53.0

