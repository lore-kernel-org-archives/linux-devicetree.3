Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792569467;
	b=AaKqFZhwCq7fhjsTi7zb6exWE6VLeQMs/lFg6HBWOY0QccHukw/SpU3FP44tjS+Erq26
	 DPve9ca5EGw3JS24dqiQySmrXGco/eQw3grDqHg/CqyNRDxypY/Y+kpcVcNm5B+heADbN
	 NVhH9Z/ThKdJO9LnHahHLwCoWi+Yt+Z8Xh8nxz2obwiuf5utv7pNSmIfPTrP7jh68cDQY
	 /0D1GqJz2Dib988txtTbpoNAGe3itW3BZLhHUU+A6vL7gJV3H7q/+LM6qsPx4xZd/LDpf
	 7fF6b3aZnqG57dB0XjwB0AJxYA3/JxptPtoB+qc6HsU3S/LnToP8kOzYj9Kj0273wbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792569467;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=UUSdb7GhbdJGsEth6SJ34W7vHVCnsU2vlRUxl4txdnY=;
	b=whsByCk+1gIXqfS073hQKOueo6nlfjWXz7ngbWGOWmOU3J0fuutaVBnfpW8g61ZBKdJA
	 TjuQg6UTwH7ET+Go+1tqZLQoMZlah6XEKwZD4a3kdXKfFVPiT/yb1MSQ0qqne5OafSC2i
	 Kv3omc/J3IUqxPOaMLzm8M4C3EHxqAN2nyoB2HJvSErQB3H/yqAghvAEhELGfqcflAHzC
	 EoqxbQ0NbTvrT336ECn8N7lHj183M9Pj7cglqNdxYN/clhsArVkgWQlN1XVkCZlOtSu4f
	 0xrClvYsoq/2ECUuXcAc5OnxC/S0fAswyq+QuucDeADr3nSw/L2rhHbI/8oyxVuMWig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BtRAEGJ3;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LHWEpBPX;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16699606A320
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 07:57:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 16699606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BtRAEGJ3;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LHWEpBPX
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L6a6XD3989346
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 07:57:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UUSdb7GhbdJGsEth6SJ34W7vHVCnsU2vlRUxl4txdnY=; b=BtRAEGJ3m/gSrMkN
	CjYqTKQLf1HMYVC4H9SvxL/OIOeiYUFZx3hkxeiSk0mMpmdhVmqsiZpTdYNNqVD4
	7MGUDBiORePjw/Fm6R3rjJjyJ0Ezb81emwdQUGmAW0rYZ0Zv/LC6dgeJhb/kj+xT
	0RdNSPFOuOjKPOgpwW2x9dFO3kbheXS1PQkzw1GE6VCUEoDD7W166rgxOdKbE/y7
	egNQNhnbmMYN6UlkbQBapf1mY8TAi88qsjAQDB6HN3flbd/G7yKLD+3Ts3lgGAiq
	CBLN3uYKahCslmV6+To7cYuv33pf6/HbkDnsf3S0FxNiRNzcWWpUexiJ9H41Dbwp
	PmGb1g==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heh5r1sfj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 07:57:45 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-341eff9e381so1152485eec.1
        for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 00:57:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792569465; x=1793174265; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UUSdb7GhbdJGsEth6SJ34W7vHVCnsU2vlRUxl4txdnY=;
        b=LHWEpBPX3+ERwu15hVWVBq6i84t5vS+AsfuhjKv0lf0rLj+v5nKcPJkmdh0OtExNHa
         ip8lXOS+hh7wF0UQuY1AuHdVjCaQ3KqLNW0UtD7lPAL61oBInsIB5Xhzjp8OzGX0sx3v
         pE+sF0+DGXr+jcr6OyvQ47pvWed6jsKnGSvqOIu2kBz0mLjCiU1m6iuXYdRC/4PZrwur
         t6QZk+iwrrceQCvwJ++pgB9B/gGRbht5nnO23UIsBJeE5b7lmF4MiCG1yFyc6YVNc2nB
         OFBwTdI25Wdc3lbLfIHNHLuGHiCHrcMxQ87/sc0oQC4DawhIVCYarUaC5SacGWaGokwO
         iD4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792569465; x=1793174265;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UUSdb7GhbdJGsEth6SJ34W7vHVCnsU2vlRUxl4txdnY=;
        b=mmQhWXBxamnrHUaamDn8px27hEFih3TSEG1OBoifch+ag5CyWMrk2iocmAPBcYx9ki
         oXWgfYQqcqpSBiVly84AVe37Taqby5wBIiiHgAHbLP/u+JsncbSJYXF6+Q/BGUAiz+HX
         mjLlGH+tAirdPU3r5KMRnPkowYAD+tGHY6jpCf3qVjV75c42lSmaNIh5rpfAWPrGUZg1
         rFLhNg+jFWTLEfKqPjapwgszXjAkNXL7Bh+OsHv0Ip86jhC5Wob04+dPM0/5eQGk/xR2
         gzBq8CavRBPDPJpoW61iS7LtRQkltz5r5aO2RbrLWJCO0cv+GgTU63pYfI+MGK9JE+ng
         aVDw==
X-Forwarded-Encrypted: i=1; AKwUvBxgB3CLxJve6t/SanRmMP8Q8Yi1uW35VLmI/DF3UTWKYUoWJ7s01Ie4E2lsTWm28EzaBL467oIo+Pkk@vger.kernel.org
X-Gm-Message-State: AFq9FYLM2aL/0nEfTCYhoW90qrynlHVmG1h9lnuygHYuWIWanTTal+QL
	STsi6YA+8XXKFak+vrUdVXtookxiPEOBrx8PuPlqmhqpOrds/UcISaCREGeOqODFmKyuMgVgYN0
	SIPBsPuRlrmObmFq4Vt9AwMSJ3hyPloFcoasq44CiEmNrYEtcMDtcrnPoMm0xMmNd
X-Gm-Gg: AYBFou359lJV/JegKh9Ch04aYnqhFIDcnJJbBPqHAQWJq9SVIvxOCMM+cOqlYVRMq3E
	V9B+rrO0vPHIyRf0Zo7mwP57Gkv14muO70/DWS5silYvATnk86vboMzCdFIajr57TMuKpPhZ0YB
	BAZzviwnyaSDfR88K7kh6PLeq9jnkwkV9HYADp64HpIa5DgRMLgySueUiDd3PDijfTuQQKYgEOF
	dcPeDFVEI6qTgOh1MFp+8a45OvFPkZP5huDF7CL9yOdcFhMjxoFTRKS2A/PSo5bfz8knEyWiTpJ
	prGF1FH0BZOHIbFc15q81YCukcKyqQqym0XnpXF4r4aSOGlI2EYzkShkYfxmmedGlpGDK67lKXf
	RLLosLymBEaYkISDa/+iFIHcJ
X-Received: by 2002:a05:7300:4627:b0:35e:da0a:75b0 with SMTP id 5a478bee46e88-3674e164a78mr2283875eec.25.1792569464680;
        Wed, 21 Oct 2026 00:57:44 -0700 (PDT)
X-Received: by 2002:a05:7300:4627:b0:35e:da0a:75b0 with SMTP id 5a478bee46e88-3674e164a78mr2283854eec.25.1792569464146;
        Wed, 21 Oct 2026 00:57:44 -0700 (PDT)
Received: from hu-mdsor-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36741e71eaesm10244209eec.26.2026.10.21.00.57.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 00:57:43 -0700 (PDT)
From: mohit.dsor@oss.qualcomm.com
Date: Wed, 21 Oct 2026 13:27:18 +0530
Subject: [PATCH v18 1/2] dt-bindings: bridge: Add Lontium LT9611C(EX/UXD)
 MIPI DSI to HDMI driver
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261021-lt9611c-v7-v18-1-4978b94896f1@oss.qualcomm.com>
References: <20261021-lt9611c-v7-v18-0-4978b94896f1@oss.qualcomm.com>
In-Reply-To: <20261021-lt9611c-v7-v18-0-4978b94896f1@oss.qualcomm.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
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
Cc: Mohit Dsor <mohit.dsor@oss.qualcomm.com>, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Sunyun Yang <syyang@lontium.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792569448; l=2049;
 i=mohit.dsor@oss.qualcomm.com; s=20260808; h=from:subject:message-id;
 bh=ut+CndQz/jrWa/IvwRM0rWOCvN47R5Wgsw+GSTdue28=;
 b=BJvp6vToztQ5YRn9Fv08ZCiWFwNdk3c/ERO9nL3RNMq+bhIwSWIAbBQzaiSLe28miYMqKNVad
 2yII30O5k6sDq6pLqpuXHAK0AiYjYpna3Xb2DMeCCvjcTERj327FLY0
X-Developer-Key: i=mohit.dsor@oss.qualcomm.com; a=ed25519;
 pk=outHVBN53JhozDw1xkj3G1qrqqE5scMBP7M4WL3aHQQ=
X-Authority-Analysis: v=2.4 cv=aI5lOr9m c=1 sm=1 tr=0 ts=6ad87079 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=gEfo2CItAAAA:8 a=Kz8-B0t5AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=SdC2vBNBQt3qShdCGKMA:9 a=QEXdDO2ut3YA:10 a=PxkB5W3o20Ba91AHUih5:22
 a=sptkURWiP4Gy88Gu7hUp:22 a=RuZk68QooNbwfxovefhk:22
X-Proofpoint-ORIG-GUID: n5flEYj7z0tssa2K6uLio_mRO_vvUoXA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAzMSBTYWx0ZWRfX2x1D6YTZ5BSy
 Sj1UF/PuK7bM5nGETetk2Y84wIsDS+q/J/VUMMXkxc9HEaGocaV85WKbRY7DO+dyD7yfk28T29+
 D6vGd2IjO0zXuWOewbYUjwSToj2ImN2h/yjPBA1cVEPn8G4yqincsIXndNgImXjszotJreC/P6l
 jyGMZnaBh7d9+rdqzRiWu7wAV4YUki1jt05yfU28AZUiXC1YR9P0MZJuUraVXJPe1mP0y2JBBMy
 2urjVDNrk+qNqHUfer9EIEJ/iyf5Sd2QH8NzxvSdzhBincjXjNgw8TQpnbO9BzI8nBvXQhMAxFH
 RmEpEsyfiRXYg3PVmGEgmFreJZkYWo7Pfq/mCd8O8sWfOGHVo4i8SPUcovi1GAXYUbfN8sXOO1y
 3oTfjaepNlEMISrFmV4KSWXardXVLl8b1QL4qSIbIz7y9zc0vvLknxB9AYsYSIfAnXLuDMg7UWU
 BC3KD5RIgrBMaYrVGMg==
X-Proofpoint-GUID: n5flEYj7z0tssa2K6uLio_mRO_vvUoXA
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAzMSBTYWx0ZWRfX7URI/c7S/usA
 46YE/LlwVJqeWbBSQ4O0IjTrOwsRYvHg85uBNVSdFG9kdhJCNNV5DuXizSljJrcPESBuNNrz2Nb
 AkrMyDOypw0/eH74NV3wtRguIIvPHfY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 impostorscore=0 spamscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210031

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

