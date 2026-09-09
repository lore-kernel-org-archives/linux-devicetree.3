Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 729EB382F33
	for <devicetree@vger.kernel.org>; Wed,  9 Sep 2026 09:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788946859; cv=none; b=D1EWtA5RM/wW6gB0IY8LaWlu8weJ92eBblJ88Y5RXLpb7oP3UX/2PXHGPrEKDlpjWUspEk7eiDKRk6JRZLPrG1T1yY38jcsDH/Id1xAtjj7nV3bLLK4YkhL0xDAMXK9YjhMgNFOe5vLJCK+BWLYaGegHB0iTWVIg6u8WMqk9uHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788946859; c=relaxed/simple;
	bh=/wP/ifaUlX4YnTsryPY8ZpP52sJzH4xKyqmqoOC+tAg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mPR0V5cO9upc7+LYMYtagUez55Kqye7lw0N96z5IngckuPVK0Rli69dPkTkPSWGd4CXlfuwzr/G4KCOR3S7fJAH1A+UcI6TUGpW8asWDWwTg6ZRgI05PeP3Fx/wUL5PpkLgCpbNXh2JzfA0EviM4oA2XCkXr0uvXwSq8zFr4GkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P8u6g5Fn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CmE0UUU3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P8u6g5Fn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CmE0UUU3"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6899W1nK3771143
	for <devicetree@vger.kernel.org>; Wed, 9 Sep 2026 09:40:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UUSdb7GhbdJGsEth6SJ34W7vHVCnsU2vlRUxl4txdnY=; b=P8u6g5Fna+xdaoG1
	1zetweKKwfz/m9PXotDa1trmaHCdi1jp6rEljhmnjS3qi8HFZmsbHLL61QmSg6SU
	QFl5NaGoJzyREUuHrq98XI3tS3OMyPuf5LrFCZ5PHKGperRoXIJ1YYfKSmrhkr1B
	xTzTqPr7GUTJP0hxj5j+RKTFtjPnyHggJCHdgUNshqOQHz6abDqle5Liej1qCC1z
	WQoFPHstQo16cXozehVj3evMrE2qlOHBPuQn8n7gC8qzWNpWN42zIdeQ/JaL+Ecw
	8GxCp9kbyLnOuFjxcZ0eFkEAtxQEnMNO1LpO6e7ry6/NVa5Z6I6B31kL303w52Oz
	9YlFfQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjywr1apq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 09 Sep 2026 09:40:54 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc435388657so4036479a12.3
        for <devicetree@vger.kernel.org>; Wed, 09 Sep 2026 02:40:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788946854; x=1789551654; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UUSdb7GhbdJGsEth6SJ34W7vHVCnsU2vlRUxl4txdnY=;
        b=CmE0UUU3Ny2RbsnUQzODuptTRQPHvzrlaSXR0zlAg2lNp9Du+GjsYEUpVzRgwbeCII
         mgYHndV6E+AgDRr7AHoRkmVhoApStGTBMjCbwAinZhxTYuwOi2SoP0L9l4pnd7+wOg/2
         8Q30VEWYGw96o7hzN0wPFhh7FfYrucxEMQe20GCiqmblaMV86EHJn/RQz0EASRTYN/kg
         etGA6Tbp6M/uBJrus9+TsG/H+7at/+MqO1pEarrfnW386bKSQ5JoKg/Eq32z6lnOIQC1
         +oGclj9U10UxPai7ddnElP+P/ln2Iy60rsRh9snJiefR7ROkgruf/Y9p+5nB8mY8yvAD
         FAlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788946854; x=1789551654;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UUSdb7GhbdJGsEth6SJ34W7vHVCnsU2vlRUxl4txdnY=;
        b=Fg08Mouza2JPohTF/qAKD/zsfCfovPJHfp8QpgjV6ylZ6+MvTEZIRSdM/tVwZ6yFP+
         tStsQGmT6jNdlcK7AZ88p75dSSUufPRtXpLxvwBcps3Dbx1IpERMmqshCAmM8X0BBgCe
         d2kUNqqHEI4my5RCJAwG1MVI6LnF27Svryasb1YW5B/roaNc4AUsWL9G607H3a8eZBQg
         t1NnbEqMTySjpTAA/dh4UOLzQs74xFDAIr50O3xqRVJ5pH1Eo7EaVXpmnAhtHuUwfV9c
         bnVaK4fWH6N+x6WBUwk6t9Q9FSu7dM4RrL5DqZSJzDUK4uzOuCP9J6+kHG3IOAqVu+J6
         /KGw==
X-Forwarded-Encrypted: i=1; AKwUvBxcrg2cg92KP2b5/ZOkpRwzFosezU+2C56RUX2a3Hvhj0ZRJQFUQ9zi5/yAk5LOMru15i2DcfEJmE/r@vger.kernel.org
X-Gm-Message-State: AFuF++nkd5g70HZQt/Zxtqc+uD0roQhayyRHc9d6h2DJJZxdNflJ4ICO
	UrC7NO1m8c0buf+gNZlYVCbr6px1kjJkMBIA200wCqQolMXvZ87EVojbyM4iFKj80yMgGhGp9G5
	7pLMvRoKtiifeMjPbOXbsnz57nI9mPBlXzhV/1cIiJ+6Cl5zxLnucUtGIPJd6v573
X-Gm-Gg: AYBFou32NppP7W/WLIoE9FJFJTGzgjQv0MieTeYO0oUh6KfknEhfIK8UFApo/bxiwhh
	0d2Graq/jAV5PIi7dIJTrinyvtS4feL8rsd2iayyzRFh6NmibNytYR7TraOoTgaiTshRpG30JU0
	Bmad/iRp6jH60g8IHn3p2OREqkvlMtBPNWSSIpfQM1U8kOikhMNuLu5z0RgVC4Q+6FHdKHeeAMp
	+yZ6sU2xApTX1xyLae/UVe3Ek8kJnAz1Oz09inaXVw8KNnPEXNTavRDXS8J+2RfNoLWM9SLXplm
	hqO4b90yVKRg1KVE/hrmDkWXlNs+5n+ilwIM2uGhX07dQXREnaRU7WclK8B5hRsI9wXgbC2C85J
	LIX+TkKhTlTpYJSbH/AYpEtEskg==
X-Received: by 2002:a17:90b:2e0c:b0:38d:b36e:9813 with SMTP id 98e67ed59e1d1-39b26169b1fmr51191006a91.11.1788946854008;
        Wed, 09 Sep 2026 02:40:54 -0700 (PDT)
X-Received: by 2002:a17:90b:2e0c:b0:38d:b36e:9813 with SMTP id 98e67ed59e1d1-39b26169b1fmr51190960a91.11.1788946853579;
        Wed, 09 Sep 2026 02:40:53 -0700 (PDT)
Received: from hu-mdsor-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3342af0bc08sm42929198eec.17.2026.09.09.02.40.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 02:40:52 -0700 (PDT)
From: mohit.dsor@oss.qualcomm.com
Date: Wed, 09 Sep 2026 15:10:32 +0530
Subject: [PATCH v13 1/2] dt-bindings: bridge: Add Lontium LT9611C(EX/UXD)
 MIPI DSI to HDMI driver
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260909-lt9611c-v7-v13-1-aec234483725@oss.qualcomm.com>
References: <20260909-lt9611c-v7-v13-0-aec234483725@oss.qualcomm.com>
In-Reply-To: <20260909-lt9611c-v7-v13-0-aec234483725@oss.qualcomm.com>
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
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788946835; l=2049;
 i=mohit.dsor@oss.qualcomm.com; s=20260808; h=from:subject:message-id;
 bh=ut+CndQz/jrWa/IvwRM0rWOCvN47R5Wgsw+GSTdue28=;
 b=1Zrm1DWc9VDm4EiTRoPkODjI+IN+ghKTwjeCXg9g5LbLQ6g4pHs6BACxqX5PTZXz1RuR1CItp
 7UF5lIJV6uKC8ckskVI0aBQBp0KanSM6SdRVh+n1d6MbRfufVYmXbU+
X-Developer-Key: i=mohit.dsor@oss.qualcomm.com; a=ed25519;
 pk=outHVBN53JhozDw1xkj3G1qrqqE5scMBP7M4WL3aHQQ=
X-Authority-Analysis: v=2.4 cv=a4YAM0SF c=1 sm=1 tr=0 ts=6aa129a6 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=gEfo2CItAAAA:8 a=Kz8-B0t5AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=SdC2vBNBQt3qShdCGKMA:9 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
 a=sptkURWiP4Gy88Gu7hUp:22 a=RuZk68QooNbwfxovefhk:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDEwNyBTYWx0ZWRfXxc2tHs311XtA
 Pkcnxpf5gOWV/yefgJb1ZtR8cItg2VP+zVgfs4/bwEnaalnLTYWHPUoUo921pl0sTW/SwkodkXv
 YBgqLTo0i7ZOnR7wezB3Xe/rfMDHQredOndnDLxwoXyVM/3NfDqLQj3p01abJg12Q1aCJj+8R++
 Z4pMLiS68LyHsfGnhIzZASc2gqwpVz2r4qE1YgABv9CoBNPnboPYopeMlDBazOCjJd3/Kt0Csth
 B/ErMdgnHDbFdZOsHD6QvBhUJOmiXrOSnX798gP0HlZo/V6TxxmVCGO8IZYG+7d7lhYmJs8hsiD
 Gy518nIPgfAeIjDHkGXczm5fjxZ5XuNainKP4fjpQTKZ4EbRtZ+eNuy9T8u7X2Y3SW42lICbJcu
 z6XGyn1NJ78uWKGYB9UnNhyk41o0gNGALY5Bu9PpCD1dQh5Cn9r/RDPWMXwa/gNEp6XlLqJTHAh
 5sgkVWnqzenEmaj6/DQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDEwNyBTYWx0ZWRfX9imvvcJ7scI5
 94Kuv5RqF1d8y6OR52PlPq6W/dIbaK95NoeNLK9R2TCNt5Xkip/+5uyhxFwk73XAQ8vuCc0AaaZ
 2ZUp/aiG2/oOJE7qD22VcP8xoNUDyiQ=
X-Proofpoint-ORIG-GUID: cpo6ly0xobmTEy8hQdsv5rTJZc2wf3qz
X-Proofpoint-GUID: cpo6ly0xobmTEy8hQdsv5rTJZc2wf3qz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 clxscore=1015 spamscore=0 adultscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090107

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

