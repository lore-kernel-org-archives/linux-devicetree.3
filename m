Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82C9D4399E0
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 14:06:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787580410; cv=none; b=S0+diMttsvU12lRxd9q2oBt39umEcwEbkMi3F8NDO6ZQQJsSCxew6QBkTpUdOLZaxuDcTIy0LsbqWhpRrccpri0m5q4MdxbiEAG3M24bxRaLgO9zPDpEX+ydABdUU6J5Jd5cWnBu/jBJ2bcKcjBUVDqWfWh10iPshVUSmZ4kciU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787580410; c=relaxed/simple;
	bh=/wP/ifaUlX4YnTsryPY8ZpP52sJzH4xKyqmqoOC+tAg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QA+StatyeNoMtJCXEZlRWKAbqi28g1LOZPpdHGIgdQcUgYYy2AuD0GQEUVVRADMmu63tJAEXd8RSdXUGWcweHzMToJRExxeH9trXnR44mDAx540CdKhi+ohRO/XzfNdJt0HOPetkARu82clQHNY2ZuH4amlycx0TJAoXA7CqkOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QkT5+lOA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V9fF/MeZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QkT5+lOA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V9fF/MeZ"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67OCuvTW3053464
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 14:06:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UUSdb7GhbdJGsEth6SJ34W7vHVCnsU2vlRUxl4txdnY=; b=QkT5+lOA8FSLRxeB
	FdxM+927evVxTNxodgZXEuTq+mcLFY+awBZPbwTToS/GMv229y8AJEH7bwDJMpj7
	UM5dyk+y7ULRhS2TGKZlSGXMZfYxpqlz1xekBC9+egBo7mW4GrX847BD+1X1w8OL
	3ym0ZxgUM4jgRlKZCGZkiyfGVQXVsM0PUWx1qx/u27s3/qhObqEkd3UbFzAgNiZs
	aYTA59nDYuSNL/NLrFmRkJAHVtOI5Apn2crqVICrI9zzLWX36kc2L6f0VTH3Z6bF
	6xbB5v7NAXHkvVqtgFX4vFsfe3ahTaGvHk6mCaynA21/LyQaVUcjpEh8nw90kHza
	dh+JsA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g88k7k4cu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 14:06:45 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-84a67b16217so6027273b3a.3
        for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 07:06:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787580405; x=1788185205; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UUSdb7GhbdJGsEth6SJ34W7vHVCnsU2vlRUxl4txdnY=;
        b=V9fF/MeZ7BaP29HoocDTe7CgYSmZyyTt4YvQSBH/GtxCiUo37vHGdhQuiHxJ5B3CLm
         cKmConUhtpSfYkYoBe18yI9bPvDxARDtz+CYey7iSbLT1ewlRLf0wo4OfqGxkQ71y43+
         5V1e0qym0WQ1EGpndn5AT80SH+arIqKHBCCq5mKkq7c2woKMY/7v5ODygAhpAGY6TC3Z
         JcxJkhS53oS/boUz2f8bbUJhQ+JFx556bObGJRzX6bi2EKYog50HdEWmcea4lvTBAqp+
         7mc6Szr+YAm/YO/R38d4O0GGzS4UNo1qJ0dS4KA+fov8b2bMBxrXKU6gFtS3hjuYfhp5
         WhTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787580405; x=1788185205;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UUSdb7GhbdJGsEth6SJ34W7vHVCnsU2vlRUxl4txdnY=;
        b=jZntkp/X2s6hWzc/xxM/AiUbVok+4lJaKD6U5NGuV2Au1UoTWj/ztV2keBLdJwglTi
         u4nnwE/HizUV4q2blJG/LEtEhODfoEIMbfRtIdwhwxzoBBnlYce339PD72ISt4A3GE0/
         oPivPdHBqE92KjWnEAZVdAYXUwRyxg9use4PVb/QSgGKYb9amwE7N5gpsdWMTYf31HXC
         3thdmprTyc9iIcKrXqgQaH1/9vBIuDz7ap19CZoBYOgaTvtbiJnfhInhwQA0iPa1D4oL
         Wl6MSY9JGMy8m1TatekwOnCPnbTDka+/iLtRLmdSINW7V+oWynq7+k4FQ2CgVWnJiFMe
         jnMw==
X-Forwarded-Encrypted: i=1; AHgh+RrjkRjSuwvSAGIHq8yC4JzELv3dpoeKRvFg5N2w8ojCFZWnB2FSZ7Y1CvjMecrtZqEcSBA3hWbuasUc@vger.kernel.org
X-Gm-Message-State: AFuF++nmaRHzzPtD7SK7QD1/BNQrLRjtU5Z0PGDzGElxJhM3XVAV6Qk4
	5ln216AulvZ1coCwnVgIWui6MoZl5XK/uHS2d7bYwYuJNDIAUWHbEUcH2rza04EHBthimdqSkDs
	3lGhYQ3D9EyKzxZzN7EprRhQkZvm+XthDk0YTRk5V0wrOsCaZd5RFrjIh/AtUcCPM
X-Gm-Gg: AR+sD11q8aEpVr3OvyFHsGqnK6VUrY6lbZZL9ttClli6PECZFj3+Am5GbMEwj4ZMyL6
	Hen/046rGm2H9pur1BZX19I+j4wtTIx9XjITrY8dCHBcqOSqjVE9URf3krIPxe7t0BbijKX3YoL
	G8rNIYj/g0U9YeFOJuJHwwhPQQgyqOumsqWSIlqqsLsOIiAG01p6wax0ypZvDCy6O+rlmmTG1wj
	I1gSJUUUyLvhHSiJS9YJAnPPsTAnblhhj3n/mLc3abtWebPhmqxXZpQKMyjCv6nB2Sk8EsS94xr
	zUtfwKVSuN/BGhpTRMGAM5bBtlQ4Ed2nAbvQiPXmQsLgxL1YP6LduR0nOz5mWW/KgNWGz2rcepJ
	I44wJJEaJsmJwZhoky+fKAXsjqQ==
X-Received: by 2002:a05:6a00:138c:b0:851:b007:2fe0 with SMTP id d2e1a72fcca58-8520b9c6d39mr29528178b3a.1.1787580404656;
        Mon, 24 Aug 2026 07:06:44 -0700 (PDT)
X-Received: by 2002:a05:6a00:138c:b0:851:b007:2fe0 with SMTP id d2e1a72fcca58-8520b9c6d39mr29527999b3a.1.1787580404037;
        Mon, 24 Aug 2026 07:06:44 -0700 (PDT)
Received: from hu-mdsor-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8520f17f7d6sm2146599b3a.61.2026.08.24.07.06.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 07:06:43 -0700 (PDT)
From: mohit.dsor@oss.qualcomm.com
Date: Mon, 24 Aug 2026 19:36:27 +0530
Subject: [PATCH v11 1/2] dt-bindings: bridge: Add Lontium LT9611C(EX/UXD)
 MIPI DSI to HDMI driver
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260824-lt9611c-v7-v11-1-eb4a79cb597c@oss.qualcomm.com>
References: <20260824-lt9611c-v7-v11-0-eb4a79cb597c@oss.qualcomm.com>
In-Reply-To: <20260824-lt9611c-v7-v11-0-eb4a79cb597c@oss.qualcomm.com>
To: Sunyun Yang <syyang@lontium.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Mohit Dsor <mohit.dsor@oss.qualcomm.com>,
        venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Authority-Analysis: v=2.4 cv=b4iCJNGx c=1 sm=1 tr=0 ts=6a8c4ff5 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=gEfo2CItAAAA:8 a=Kz8-B0t5AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=SdC2vBNBQt3qShdCGKMA:9 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
 a=sptkURWiP4Gy88Gu7hUp:22 a=RuZk68QooNbwfxovefhk:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDExOCBTYWx0ZWRfX+++NQVcOu61L
 OadS6TIUR42PYETZXnoXWVU6ZZ5b+2iMpOXWzJgCSODKE7WRrM8jmGFLNN6UuadFAGm7I55VQR6
 FdlIG9VYIP5dhIL0Os+FY5B7C0qN/rg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDExOCBTYWx0ZWRfX/yebTx48TaJs
 IzLnV6gkJd5snwufknl+Hgwr42E/H3qminH+bVGDnDnj0JEoXLHskgYutSK9gYC5fYRTib3q/T8
 4xkjDq6JrDgVxBbQpLUvCvlXLUAV9esEbCtmjaijkvTlr33IAhUA9TVtVZtRxpQyp11RMUirJEc
 85lDHUunI48UzNBwO3iB1YrfTvTZ4U2ZtyD1UOwHrWcqaZeH0todDhR71gt7b1NSSqgCs0M3r+f
 Dcz/qByqYFOW+lb1hyJWbM8c3ADIM0IBtl9R4ktoz0KeTRHdC5Jlb9w/HtikO37ZGTLm2L3tJ+o
 WtLg6IG4j5ecYv0bfmrExv7BmLMoXzuAf+GnXoodWbM7AGYOwqdCt0EHUcxgQ4Zs5QBpFXvVWk8
 flr+99VmTRYeeg/pIxThxEvL5ZHXjOypoLuaIQQh9lrcg/mqaIoTrnCmxwwUJ+VNqNzuSFSq3rG
 TcnoONjuyEUvyTdZMgA==
X-Proofpoint-ORIG-GUID: dZrcXyqn7TtoT75dGXzLCUGm6AfxL8Iy
X-Proofpoint-GUID: dZrcXyqn7TtoT75dGXzLCUGm6AfxL8Iy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_04,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608240118

From: Sunyun Yang <syyang@lontium.com>

LT9611C(EX/UXD) is an I2C-controlled chip that Receiver signal/dual port
mipi dsi and output hdmi, differences in hardware features:
- LT9611C: supports 1-port mipi dsi to hdmi 1.4
- LT9611EX: supports 2-port mipi dsi to hdmi 1.4
- LT9611UXD: supports 2-port mipi dsi to hdmi 1.4/2.0

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Sunyun Yang <syyang@lontium.com>
Signed-off-by: Mohit Dsor <mohit.dsor@oss.qualcomm.com>
---
 .../bindings/display/bridge/lontium,lt9611.yaml        | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/bridge/lontium,lt9611.yaml b/Documentation/devicetree/bindings/display/bridge/lontium,lt9611.yaml
index 429a06057ae8..194aeaac601f 100644
--- a/Documentation/devicetree/bindings/display/bridge/lontium,lt9611.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/lontium,lt9611.yaml
@@ -4,19 +4,23 @@
 $id: http://devicetree.org/schemas/display/bridge/lontium,lt9611.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Lontium LT9611(UXC) 2 Port MIPI to HDMI Bridge
+title: Lontium LT9611(UXC/C/EX/UXD) 2 Port MIPI DSI to HDMI Bridge
 
 maintainers:
   - Vinod Koul <vkoul@kernel.org>
 
 description: |
-  The LT9611 and LT9611UXC are bridge devices which convert DSI to HDMI
+  The LT9611, LT9611UXC, LT9611C, LT9611EX, and LT9611UXD
+  are bridge devices which convert DSI to HDMI
 
 properties:
   compatible:
     enum:
       - lontium,lt9611
+      - lontium,lt9611c
+      - lontium,lt9611ex
       - lontium,lt9611uxc
+      - lontium,lt9611uxd
 
   reg:
     maxItems: 1
@@ -78,6 +82,16 @@ required:
 
 allOf:
   - $ref: /schemas/sound/dai-common.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: lontium,lt9611c
+    then:
+      properties:
+        ports:
+          properties:
+            port@1: false
 
 unevaluatedProperties: false
 

-- 
2.34.1

