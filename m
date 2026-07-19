Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 901A63AB5DE
	for <devicetree@vger.kernel.org>; Sun, 19 Jul 2026 16:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784477327; cv=none; b=IPzHeXoYcAypH1qHjjYvdEUlpEp3tpwEuR+goyIBvLWVuSlADjaTiSchs1UcS6bvTYXMrQdQ19+lcDcMBBVemTHVlI6377Z3c0BM2pHaMHBTlk4BJVZ7gneDBXKQCtC1WtiZ988a5yZK1siQIuBY7pyhuZMHaLKo+cUgUDE6TpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784477327; c=relaxed/simple;
	bh=bp5/WqpWPLQgy2pXRRsH7ccX72vtmxF9z0GVNhvfBrA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=WQYnvTQ3dkhSKB0ryClBjFWK/imE7lfmZq44ZjMKipRu/LUiMmaqgDip/91OMWPqHomvNw+xVk+ylibaDd2KGEMgS7B0epY+IELs2UqErHXsslFKprkp0Y4vX09u6EY6mF0BB21ZIfJzlR9PT07zEOgJXu1wkdXJevrNyOCpJok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZFq78QpF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W1j0CsZU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZFq78QpF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W1j0CsZU"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66JDwEPe3543383
	for <devicetree@vger.kernel.org>; Sun, 19 Jul 2026 16:08:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=b9HBBlmunR9lfyZiinpzds
	QJIbq3Fu17PZFWAaYhEwk=; b=ZFq78QpFXh8cPiLzhvbxPg6xaa3vFngtNhtmp/
	Dez4dNkNui34P7VwJkl6OQa7lUxxX5owhK7jYVJ8ZZ3xqpKCY+5D5tvxqRwEUxY5
	7mnEsYxlMW/bW25OgQWwz7NX46mfDwCUnfpw5YD/FDa+LVjVyFPumezT4ab+ahU0
	oAde67m6dbS9HE2okHwAHMn4xAYPX0Kt7TTBq5UxXa57COb7OZKmqNykyP1RW0GN
	XzQU35nsP7Uaotm3wf60j8jhndkKyQbcexaWeWCan2roU2lWfs5TMHHd4QZZ6eF0
	cBXcaqFCqUu+SRiZxhabFbWK/4rnk2dV/gtfDuVy6+inLe6g==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fg2s7tyhc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 19 Jul 2026 16:08:45 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cf2308ef97so8222995ad.0
        for <devicetree@vger.kernel.org>; Sun, 19 Jul 2026 09:08:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784477325; x=1785082125; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=b9HBBlmunR9lfyZiinpzdsQJIbq3Fu17PZFWAaYhEwk=;
        b=W1j0CsZUcDGmZTpBJRyS+DVH7ESqEZjPlfrl37sBLSAAqPqqH3Tl0NfnKcHU2M93Jx
         AJo769UzkrcPvOUR5V0EyclBZJLtMUw9QbOmg8SnV0/mpSmQ45H1ZQh9COpbJi+XfJtY
         a73FG6VStf6jGRG8QXqLNN02AjeOt0X2EYOYswiXSogUHhBNVFSNoAhc+0jY57bWQnjx
         +9bIt2LLYnPBIJ2+2qF3HxTKxiWqBTVLjs0fojFRkBcSb/8j5Dn/YZoKD2s+A90OY22y
         Mq2NlQ8qLIuWToYcISaOV97thjQXVTDkQP7wzys8dzkOqSmXMWQgtUvP0qAcmychRmDJ
         wCXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784477325; x=1785082125;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=b9HBBlmunR9lfyZiinpzdsQJIbq3Fu17PZFWAaYhEwk=;
        b=NhU/cBGKRp2qn3LX8rNIQ2imnjNEy4L+5UGGTq+25JpXca/iDkxYrnh2Gjue+ImaXb
         lpllFjWkdBiwrKI/yPykWApxRMfzNahPAulKMH/nv0Eb/tvpRRAV9znOzBsPD/lMqRxi
         CVzjMs8QX7TjWG1YN6c48aBpGB92xgLw3BRya88RQX0uCkIoBZ/COblpQgeomBVvM4ko
         XeVWfEFAPXFXAZoaXbAiYnEQpAyhcPPezTtpTL3HOR9cwFb6Y0+w/+knpf1l/EcR/MeB
         NEfczDOfgWO3sdaECOP7Gy19L1ycwIjAQDONIw6pwAipuqDGKLfag5PqPLg525YLqArC
         bKPA==
X-Forwarded-Encrypted: i=1; AHgh+RpPER+rReKQ5v3J4UQt+QEnCKzl+NetH9CfdJOCQk2DV2QfAcE72PFDzz030EK8HrJU/85e+9hcihLk@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9vd5YgQ2kz4f6UH+6hlHR10VYC0wtwFbYeelLL4V88QkZhu9K
	zoVxuPb7QKUZRRkO/uFpOVHK0ogfRccHbV0E79YqStNyLAC025qlShU8K6X+5JiUDJoOfZNA5bU
	/7KugWzl/0iJEgRyTTScyMHiQu8XM2+NQr0n8ybwqNt7A0UT2ivlaggCZ1q92Yrp4
X-Gm-Gg: AfdE7clLZx77I9NzrsJymKj/CdvAhRpzChFwK5O9BNiMsdL+TjcEWJSUPwnfop6l8dI
	+bRvsSaoANbXJ1Iyvhi3RTj7oKO2NKfy/t7VkGFbS4AmiyYTqKyHLreXqM94IIFVwXWyZiu+BdZ
	7URX6EuRftPtVFOfE58fgrksv+B/uQEEk2b81ldOGj9hXvC+zJCKnwenz/pytDmozmYslKSd/YU
	D0IMWKojctzqiCsdHLD1P3ozIxcf8FzYvfjgtpqqFw9uIA164sXB8s7mO/4g+Enhv2uVHIWmH3B
	wo0bycWORwblcpxiDBAphnJOsCKJK7gvX5x37Ln6V24zFGejd+y/grm8ZdYmFu1wLSwLOQgKo2n
	qCEHhz+nX8/wdlOIEs9uTDNylZZ6/MrzUAIodw9Udeb3NeWBg4snMHMJIXdVqsw0c6c5RWTfTPt
	h4Ifgp9ngjtkaXByFhyXG4
X-Received: by 2002:a17:903:1a84:b0:2cc:e648:7e0c with SMTP id d9443c01a7336-2cf34a310a0mr93399195ad.7.1784477324808;
        Sun, 19 Jul 2026 09:08:44 -0700 (PDT)
X-Received: by 2002:a17:903:1a84:b0:2cc:e648:7e0c with SMTP id d9443c01a7336-2cf34a310a0mr93398925ad.7.1784477324306;
        Sun, 19 Jul 2026 09:08:44 -0700 (PDT)
Received: from hu-vishsain-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13ce2900a37sm22285199c88.0.2026.07.19.09.08.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 09:08:43 -0700 (PDT)
From: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
Date: Sun, 19 Jul 2026 21:38:36 +0530
Subject: [PATCH] dt-bindings: display: panel-lvds: Add boe,dv215fhm-r01
 compatible
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260719-b4-lvds-panel-doc-v1-1-6a18c213c2f6@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAIP2XGoC/x3MywqAIBBA0V+JWTdg9qJ+JVr4mGogVBQkCP89a
 XkW976QKDIlWJsXImVO7F1F1zZgLuVOQrbVIIWcxNwtqAe8s00YlKMbrTdo9Ch6M2glNUHtQqS
 Dn/+57aV84eEEeGMAAAA=
X-Change-ID: 20260719-b4-lvds-panel-doc-cb503c4ba2be
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Thierry Reding <thierry.reding@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Vishnu Saini <vishnu.saini@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784477318; l=1994;
 i=vishnu.saini@oss.qualcomm.com; s=20251113; h=from:subject:message-id;
 bh=bp5/WqpWPLQgy2pXRRsH7ccX72vtmxF9z0GVNhvfBrA=;
 b=3bMWpFZrQHB5QjA+biDYkLxUYMywl4LFwZz2AC+u/HTPjis87uhxze2KQt7PLBQrx0erTFGgU
 G8tqMl04kGLANzjHUfJ4eYPOk+KwEAekTmTy4WBoz91JsLCOjWHG1IS
X-Developer-Key: i=vishnu.saini@oss.qualcomm.com; a=ed25519;
 pk=8hlXlF8j/3GeOaDK3w2LYhkv9FanCQru0c7kRH/It7k=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE5MDE3OCBTYWx0ZWRfX0AI9pW2VRQRf
 WlESZdUjOM0drBjS8mkVi+sr/VflIvIw0x/J6GOR4QmGKsn/B6EvIo2jFvraFB6UgVZqifAV5ry
 uX4HhzkRv332QyVKmQB4ekM4HovEcOH+o7BqMpUajYg1fC19I/EOo3s+Ffsw5XvzDKD+TwQWFt0
 uedtN+j3JH749veaflYlNGDPmdO06pWgBPGTOWrXxOy5C6ZAmMpr/dAPDonPFJfUSoGGYpos12p
 rJNl57znHvXFoZkGU5tsAFgbBgPp7Oh0K/4FimaAqBdGnNwJWYWbGWS6SwBj0MRmGSSAHWY626y
 ZW8o3kVZMMwJMotutp5/I89adLPntrMA2FRnWnhSqVqATJGMhCKq0o8Qx9XG1082yurx5LgB5gb
 BEKzkDBTkPhyj2PMF3kAWUgM+AZ0W6vpbRpRcM3L5tB83RtKZGm3ht37nNca29nZvWwnJsUVN1g
 hP2X1WMDAT3gWEn4ghQ==
X-Authority-Analysis: v=2.4 cv=eKsjSnp1 c=1 sm=1 tr=0 ts=6a5cf68d cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=mkfg1YK7THWIfyNcHdIA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: 2cFPBxYQdtUhB1JQ1bHLM0UyviCP8Fte
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE5MDE3OCBTYWx0ZWRfXyGCksv5khLDf
 piLYyr6aO2wcoUJMPl87vQH3+mEyy+F4H/E/xzUhAB7SmOXr4+muUOEI9TnYgdSN72yr8Pf9DPz
 Am8VymNwBxN2gDwGysAt58oDSTGRNFM=
X-Proofpoint-GUID: 2cFPBxYQdtUhB1JQ1bHLM0UyviCP8Fte
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-19_05,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607190178

Add BOE DV215FHM-R01 21.5" FHD (1920x1080) dual-channel LVDS panel
compatible string to the panel-lvds binding.

Also remove the 'port' requirement from the required list to allow
dual-channel LVDS panels to use the 'ports' graph topology with
separate port@0 (odd pixels) and port@1 (even pixels) nodes, as
required by the dual-LVDS binding.

Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
---
 .../devicetree/bindings/display/panel/panel-lvds.yaml          | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml b/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml
index b89f86bc0683..584818b2df6e 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml
@@ -58,6 +58,8 @@ properties:
           - hydis,hv070wx2-1e0
           # Jenson Display BL-JT60050-01A 7" WSVGA (1024x600) color TFT LCD LVDS panel
           - jenson,bl-jt60050-01a
+          # BOE DV215FHM-R01 21.5" FHD (1920x1080) dual-channel LVDS panel
+          - boe,dv215fhm-r01
           # Riverdi RVT101HVLNWC00 10.1" WXGA (1280x800) TFT LCD LVDS panel
           - riverdi,rvt101hvlnwc00
           # Riverdi RVT70HSLNWCA0 7.0" WSVGA (1024x600) TFT LCD LVDS panel
@@ -72,6 +74,12 @@ properties:
 
       - const: panel-lvds
 
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+    description:
+      For dual-channel LVDS panels, use 'ports' with port@0 for odd pixels
+      and port@1 for even pixels instead of the single 'port' property.
+
 unevaluatedProperties: false
 
 required:
@@ -80,6 +88,4 @@ required:
   - width-mm
   - height-mm
   - panel-timing
-  - port
-
 ...

---
base-commit: 104c00917264c5b9571072471e3a8689cd1a2c4d
change-id: 20260719-b4-lvds-panel-doc-cb503c4ba2be

Best regards,
-- 
Vishnu Saini <vishnu.saini@oss.qualcomm.com>

