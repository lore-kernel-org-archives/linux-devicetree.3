Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50C7E30F7EA
	for <devicetree@vger.kernel.org>; Mon,  5 Oct 2026 07:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791185089; cv=none; b=d4rc9Uc8MnnOIzZh9BS2c6Txu9TEPjsly5FJTjwqKKojhIUGU/rUfK8X6QHAWz1Wr6vJbzJv5DqfH9zbxDg8+x18ZbA2F36KNV3QYSKv1CiwWgxZxegHclPHUe/dzUJJuiXHiOLjjaae6QRBqqcNtNhTHGkFMucPybIuRYhX2zE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791185089; c=relaxed/simple;
	bh=GzWzFpAa/mVkpqK2itZgfHllvdg0sj9Od9l5xCjY1dQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=t+r8cJAfe+wsaR1m9AJaPHlA0y0V5E1QtK4WdTnL0I8C1O0yxPNukQrrWBoxequbiGwKajQGY5QBVh0nNHCii9JwamWxOA7TZb3SM6QllkzyBldt1Tev606t9n99OzcaxH7yjs30kHOKjITLwzj9r27dA5d5i0N+ooO0c8Ii7U4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JioyAYkJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OVgK4ylx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JioyAYkJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OVgK4ylx"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69510D8W787389
	for <devicetree@vger.kernel.org>; Mon, 5 Oct 2026 07:24:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	V0KMvSzLsthB7rRatilMFr5VvRODHVlblv8W8R1UUWk=; b=JioyAYkJQdu3jO2e
	i3S+TJExvCGVTrWISwvMO8aSYfvJbLzsGS73dADHsghN0AdzYLh8gCZrNb5XprIr
	FfNDI0ZDYDimD9ODAZBczR93hvrx61q40HhudbbWMDzt3VBsjTVTghHB69hRiNpg
	ag9fy41DQIEccS/Y729yG8pv9NDaupgE0C8Hb75svA1O4EmGBgz2PFZoZRxDXC5A
	yl66QHz7jYYglTj7gjNgUf/n/6nx6VueevDTaTQGwJSDT6l9TJEg1mOyBWZC2NUP
	ESauN2L6YU8CWBMoM54PqJ13LC2j5n5NXWvOBXTOKPRlptz+FGwJlGlrBPhdeJrA
	tPWG2Q==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2spa4wse-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 05 Oct 2026 07:24:47 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-398dcfabbf8so2454510a91.0
        for <devicetree@vger.kernel.org>; Mon, 05 Oct 2026 00:24:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791185086; x=1791789886; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V0KMvSzLsthB7rRatilMFr5VvRODHVlblv8W8R1UUWk=;
        b=OVgK4ylxrEzaX9daBGQdvdxF7R6PXxsExcy6jvd6BzhLuy61lpWfV7wcKP1o0+mjNB
         I8+VaV0VFEV4TKlpAP8Lmv4XTOJu+0nPO+K2GOxRx1Vsny0WaubGMpWz+4H25LpTAYd3
         TQ8Kv9f+0Z13mwi69Bxmq8uebvLLEzSOshNUDQ5CWlyM8dXQ4XL1PZtDCaYG9/oqOBPv
         OwXyPMF8LcwwmPppDqPR5LOErQ19WAhQMCf3NA/npvK9A8+bL3QbqXwi1sSBBFKlSqvv
         89Wwhsq6zsr/FRfIM2YL9pl86kRDNUh38/6fu7pEJTRP3iYdWHy9nl5Q/+88Q2hxtrF3
         89ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791185086; x=1791789886;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V0KMvSzLsthB7rRatilMFr5VvRODHVlblv8W8R1UUWk=;
        b=Y3+IL1swKqhP2xsVU7zYn5XRff/sk+U5vWOM13180wzIVWhI3LKUC7BI8YvDgLzR8o
         XVBB+B556hezCK39LC7xYByGRTPsIhFgLckOiv9DZDFl/tNfBKUx8+2bxgulNNr9AIIG
         8pZfjqD8dQOEo6NnTBEPC8TwUmC4nqGRmtXIL77BHpZahs+EkLVVzFUDzdiZYm9v0DWR
         Fe+q/kiIhtag4pt0/xJ5c9ykJiGN1l5gh/4m5bKk7qlHGCiu1440RjZrfPr4EW4pLpzG
         XgQX2UNwh78WbrAje6F8ozDf47szE/hvKAAUDXverIRt+Y22RnTFDxzUXwsGFgBCAMjq
         9trA==
X-Forwarded-Encrypted: i=1; AKwUvBxyEqS459linZGj9LjhqIEe/xMqU7dj5oSws+ViFbUGPyfRjtCa+P/7Rbdnx3pNPSiAEOvVTcxhgfS2@vger.kernel.org
X-Gm-Message-State: AFq9FYKg2PfE5M+UO5QGvXAVjuXtzV+1x2SoMqGV89BDI2iOWi1VyVg4
	s/1w1E7vZ15+GKVuSIEKSXYkZhdIh3rbYkPV2V1VMeNqX0GvwNjRLvC9mGpfsTHrwPWB8me/FxD
	3Pr0vqjgv0qUfV8SYq8LEef4F4os+rgLJH1SvdSpKi1pYPWkSbtOEhSDkhoavzHaa
X-Gm-Gg: AYBFou2tqq13zm54eB7c1m5SJ6/Ppa4CU55QIrGS6hI3R5gcGQ/j3NhdSGfQUEtWW1+
	QVHRq82asB1/dI8LgnTGgXwurEs06cUOJuwm7rUfdzWFAlncxR9PXVO+I2bGijuQ9iP6EADFoCy
	ZP67vXYWdtH1IXX4742wgPcx2G4XMF9jWeEf2eYj1LXafeXx2qK7v3ByhY5Ts8n33UL4B3Dx02r
	TToM+UUYPnDVzzdgkEMcvVJKvITy2CujupFICa/gW9MwBfIgFNpGg6SJj9dNz0xO3Rh61yugjkJ
	DK3oa5nYn9fVlzU7Q/2jK61EJ8r4c4NJ82FQqU1aY7/MmmvlHKQlLJPg7C65MGw5XIU2Q00McyQ
	DYPtDuzGKc0wmC/aN94MMhhrrwc3ojZORiXY=
X-Received: by 2002:a17:90a:1506:b0:3a7:9adb:2a18 with SMTP id 98e67ed59e1d1-3a79adb329fmr3032558a91.62.1791185086143;
        Mon, 05 Oct 2026 00:24:46 -0700 (PDT)
X-Received: by 2002:a17:90a:1506:b0:3a7:9adb:2a18 with SMTP id 98e67ed59e1d1-3a79adb329fmr3032532a91.62.1791185085659;
        Mon, 05 Oct 2026 00:24:45 -0700 (PDT)
Received: from hu-bkalkond-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a78e4f3911sm9901421a91.15.2026.10.05.00.24.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 00:24:45 -0700 (PDT)
From: Balaji Kalkonda <balaji.kalkonda@oss.qualcomm.com>
Date: Mon, 05 Oct 2026 12:54:26 +0530
Subject: [PATCH 1/5] dt-bindings: display/msm: dp-controller: Add Kaanapali
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-kaanapali_dp-v1-1-6faeac3a6d59@oss.qualcomm.com>
References: <20261005-kaanapali_dp-v1-0-6faeac3a6d59@oss.qualcomm.com>
In-Reply-To: <20261005-kaanapali_dp-v1-0-6faeac3a6d59@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Balaji Kalkonda <balaji.kalkonda@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791185070; l=1609;
 i=balaji.kalkonda@oss.qualcomm.com; s=20261001; h=from:subject:message-id;
 bh=GzWzFpAa/mVkpqK2itZgfHllvdg0sj9Od9l5xCjY1dQ=;
 b=F0QT1yp2Viq4LAlgWRSHhvhMjTJ+g+n3oKrwjm2SXdjNKzrBNl3f8R+7CveNVgDKY0NfKM5TN
 ay9pTrDY/mWD7mYUoOARSEkseOF2JgxbJ0Q5VwMw7wAMtANqLf8nO1i
X-Developer-Key: i=balaji.kalkonda@oss.qualcomm.com; a=ed25519;
 pk=U+unGox551qPLS2mzIlN+b5cHksxTMGPnDwePd6KEnI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDAyOCBTYWx0ZWRfX8iz/9TFrpYmU
 twguPBABqNFn1YLw+BpCNOPZv/MBLh13xHA8aCFKHVzu+K4wSi2jvIeo52G7EFp3GW+Aw/4+Ibs
 pf2/qboPqlmW9OZPxxfQCGV+PMapMl70vy/Dt2/EHLPc7JJrCVki5/aRtcCwYDNIbrM/GxYwsa4
 1k5s6pwhpgPXBIv+X7dnkSKZmiMuQZae3yg/0BssXOu7as1n0ip142t6elvQN7e07/aSGNfH9MN
 A2HeWBUHYb+ItI/+qYOQhgJc+Mbrgno5+isJcAkzyG7URV7vwU3X1Un8aBMxcQv2YzxaI/eoNwZ
 cSZATOUHUCLLEbyQjcHHcSHOI9EzcFtN6VIWqwToKQhK6bJ6Re/ahnVpiDlgr/csmqdsapbGNAo
 dsd8uRVvIfqtCDpyHWal27nKs88ObIRY+TDETdKuGlYK3fSAHBjt7+7AaFnVFMkMLNRf3APW2zy
 YGxGToeC5TAe+drz0NQ==
X-Authority-Analysis: v=2.4 cv=b7MncdGx c=1 sm=1 tr=0 ts=6ac350bf cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=H-7iiLwglXPwSBWBkKcA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: NM8G15nSxvsz4s9iKY27J8uvYTEGqqPY
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDAyOCBTYWx0ZWRfX50phrnzqF2YV
 Rzz6pZRngW8chAG/64oaiEQIO6+T90xU9yzQrYanbuWhBqgcoxvLN78qzyj3pBpSCoR2Wybvs1A
 gnpmefrDtFkzhdzYftpY6VeD5XjDdlw=
X-Proofpoint-GUID: NM8G15nSxvsz4s9iKY27J8uvYTEGqqPY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_01,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 adultscore=0 clxscore=1015 phishscore=0
 bulkscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610050028

Add DisplayPort controller for Qualcomm Kaanapali SoC which so far looks
fully compatible with earlier SM8650 variant.

Signed-off-by: Balaji Kalkonda <balaji.kalkonda@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/display/msm/dp-controller.yaml    | 1 +
 .../devicetree/bindings/display/msm/qcom,kaanapali-mdss.yaml        | 6 ++++++
 2 files changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index 094a6383bb77..8bb0f6e15942 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -19,6 +19,7 @@ properties:
     oneOf:
       - enum:
           - qcom,glymur-dp
+          - qcom,kaanapali-dp
           - qcom,sa8775p-dp
           - qcom,sc7180-dp
           - qcom,sc7280-dp
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,kaanapali-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,kaanapali-mdss.yaml
index 9f935defd6b1..83e3596ba0ed 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,kaanapali-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,kaanapali-mdss.yaml
@@ -48,6 +48,12 @@ patternProperties:
       compatible:
         const: qcom,kaanapali-dpu
 
+  "^displayport-controller@[0-9a-f]+$":
+    type: object
+    properties:
+      compatible:
+        const: qcom,kaanapali-dp
+
   "^dsi@[0-9a-f]+$":
     type: object
     additionalProperties: true

-- 
2.34.1

