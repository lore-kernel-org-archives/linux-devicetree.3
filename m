Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33255357D1E
	for <devicetree@vger.kernel.org>; Sat, 12 Sep 2026 21:37:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789249072; cv=none; b=OnRL9dyyHGeSDa5HxUAUrPgHZVpD7k8UZSBflPLFsPWFFGovjBKWJ1CqUlIg/GkeAOI9RVkG1/vNxrfMgu/i+LNnAySSnGy2EBm3WblSWqSxTQWSCleuWV6PV/NlMVBelPwfSavlKdnU3ineytJA4LrzO+PcOCKuEnUQPBAycQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789249072; c=relaxed/simple;
	bh=/wP/ifaUlX4YnTsryPY8ZpP52sJzH4xKyqmqoOC+tAg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nEZT3XFoYBCZMjCYWKZEjjLRhVbr7EHZzEhRhfeZUFZKhfqaO2QlDFtTyBoYbvHUcWZr9zWewtadzU6SX1OQeKIwHVDuLrSBz6RnT7+GzGpUFRsEiG93hFFttR4VrCQ1Za1R+/LUcFtKFG6dtieRpbQLN/XFup33LCeeDNuho5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ndeU6AQ7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XjRi09to; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ndeU6AQ7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XjRi09to"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68CI5OaR2997307
	for <devicetree@vger.kernel.org>; Sat, 12 Sep 2026 21:37:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UUSdb7GhbdJGsEth6SJ34W7vHVCnsU2vlRUxl4txdnY=; b=ndeU6AQ7n14Bm5mH
	uJt6386T+qEQJJC2L5Gd9Leqq1nj0ruFP/MhVVh5kSw/ovQwySCS+NeNbuHdYjUN
	7SUXyuZ4LWPh/YQB/80XuMoOI/XywhqY+C6BErsAXVLjA3v9gYxLjFk+6baVZyPp
	0A7espEo49jT3n4e22ZyNWhwUf8eCIX9WN6CAvokR6vuGOyv6zUmOIcVsHpbXZ7S
	wRk3fhv6exKGOE5POE7Syb9xHXhkIWriF1oTt4AM8e32nTlNXY0O5sHA6XkHAUHy
	ql1MGqcwfoArTJUEz8kBSsUCmrow8hsa4UI6AELmzRPnMebPHyT437XOhYoU5KFS
	NHIMDg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gn018hv27-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 12 Sep 2026 21:37:50 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cfc52ddc55so29244395ad.3
        for <devicetree@vger.kernel.org>; Sat, 12 Sep 2026 14:37:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789249070; x=1789853870; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UUSdb7GhbdJGsEth6SJ34W7vHVCnsU2vlRUxl4txdnY=;
        b=XjRi09to/gXPZVl2/z4hnpLFpT5kNDIGS5LW9OLNEMOhOBSdnw42ZOCqyt2wTXxPlu
         Z7T8T0QsSwhrKLDBLR7YWnpiWL5d8aU4IZmqp0XKQeANq2C6gcwvzLnNTthvemcKdASN
         l8lFtHmhnoc+SApn1pYUtPhc/eZ5h707tIz7D6Mu2CDcWutmlsDyQPwbd5UKj1wnvDW1
         HOJ/OY91lvEkDxVV1pEXuprv/aLdCBL/D37pQ0WCGbKcdQ/TRI5WVbMeBzg7Om7MpjUI
         i7eaBDh7cco/w5Q/hJ7CHpX16nkCC4VXW42KOqR5MSKBFZad2Mxmeu9bhJvsa7aWmlR8
         2NGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789249070; x=1789853870;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UUSdb7GhbdJGsEth6SJ34W7vHVCnsU2vlRUxl4txdnY=;
        b=lkwkQWnIakrAJNgGmP9QR4utYVJU1/b3k7nXrDUxMTAaIC4Xw1i7fLY3guNvKqMk4H
         4CycdHwYs9wZoZDjNmsL3WUueZcrOiNMCD3OHsRseiKY/VKNVTxxMcEcMAA7LyPg5nBF
         9AYbU4qamWB+joLHegSyyprS+K1wgFFA/HrbLjZ4JxP6lWk47tkiB+JpswWP88tvw+s/
         KVZ/icoaHZJTxAvCOZN4DA3t71qsMki3UynbIpjKKYdesRMgYbiyE+wPjBVllj7S/rTw
         DGgIgiAZ7JDzxDq0UyxzsFp8ljnSFbm6vZGm7EyWefaKS1y5Hs9aCCKU4QXM5qvFz7jq
         I/mA==
X-Forwarded-Encrypted: i=1; AKwUvBxTxVzqfhWftQuGxV0KPyqsqCq+btxBhFsBpLJh5R/SrnLzOss/f6wmqp+vSzaBCIvaYX5VaWmxDPK0@vger.kernel.org
X-Gm-Message-State: AFuF++ltfURCUERwLaSuwjLSzqfROv9rqcWNBTcbFxZUvba62Z6Owu4W
	ONeCE+frO0G46DF77nYobM2XiQ0H2+a/T+sgflUxcaG97d4CkTNDZJ2tOf6BBBnLnDfmJTY64rx
	BIVCf6DwN/nAvPPib+91krkpVXtiv2KX4NkUXS8NYA0BrzTHw2ivm2lzH3egEuMym
X-Gm-Gg: AYBFou0eKxJJHTG8BWNH+qY3j38VZ+t3ssIFC24iyc0UjCkUHL1mqSHKBhbo63xvThK
	GoB4NzjHO0Wy1LA8rHF+4AsgFCz3Fs9r8AsurH2P76Cqo2ZS+QyK/7C29IsOe9Gwhhfllpx4Wir
	FcKBxir35xCu+w93zYV1eURNdTI1jODRnXYg0TrnD+y/resfjZkLEjRDgSiOsaJR9fcTP/H1Jol
	8doRGBMHAn6shAauC/Lz17KYUPwXD2/0L9rxIDvkTLltSML3LyPtAOrh4TTA3HUIgn/urTWebGs
	+jhk59RnajJRaUAuGq2bQNCGEubw9EXnwa/cc3b09VtcGmtMxtsFrY1lICuAGwIlrCIIfGNU0cP
	JXLtlHauLPBEQsTOK8bzHONXc6A==
X-Received: by 2002:a17:903:2450:b0:2d6:ff5f:eeda with SMTP id d9443c01a7336-2dd2a1f027fmr180077585ad.6.1789249069715;
        Sat, 12 Sep 2026 14:37:49 -0700 (PDT)
X-Received: by 2002:a17:903:2450:b0:2d6:ff5f:eeda with SMTP id d9443c01a7336-2dd2a1f027fmr180077375ad.6.1789249069284;
        Sat, 12 Sep 2026 14:37:49 -0700 (PDT)
Received: from hu-mdsor-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4f0feaasm14987841eec.21.2026.09.12.14.37.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 14:37:48 -0700 (PDT)
From: mohit.dsor@oss.qualcomm.com
Date: Sun, 13 Sep 2026 03:07:29 +0530
Subject: [PATCH v14 1/2] dt-bindings: bridge: Add Lontium LT9611C(EX/UXD)
 MIPI DSI to HDMI driver
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260913-lt9611c-v7-v14-1-534b43a07662@oss.qualcomm.com>
References: <20260913-lt9611c-v7-v14-0-534b43a07662@oss.qualcomm.com>
In-Reply-To: <20260913-lt9611c-v7-v14-0-534b43a07662@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789249055; l=2049;
 i=mohit.dsor@oss.qualcomm.com; s=20260808; h=from:subject:message-id;
 bh=ut+CndQz/jrWa/IvwRM0rWOCvN47R5Wgsw+GSTdue28=;
 b=JRLIa9O+Ei1CWlCfGQPz6+ldSMZTkwkNehDcLrQzB+KYZxgsyNjtmjulCQxx3H1ujtNe6o8rh
 fOVukMcWklhB2HVccFqqXiUWD16hRuhCc6yobWytRzDS+8pXh5vKbqF
X-Developer-Key: i=mohit.dsor@oss.qualcomm.com; a=ed25519;
 pk=outHVBN53JhozDw1xkj3G1qrqqE5scMBP7M4WL3aHQQ=
X-Authority-Analysis: v=2.4 cv=c4g+0h9l c=1 sm=1 tr=0 ts=6aa5c62e cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=gEfo2CItAAAA:8 a=Kz8-B0t5AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=SdC2vBNBQt3qShdCGKMA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
 a=sptkURWiP4Gy88Gu7hUp:22 a=RuZk68QooNbwfxovefhk:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEyMDMxNSBTYWx0ZWRfX0ePhddGX9Ed1
 rVbnuYAk99e+PkxnjCl6VX+RfhvlTQlihHuipW758gMcayeVTbYFXwbBrZE3860xwNLzCRjU0/G
 S0rZvAx2m6uoDg9H2rvooCyegoKbplY=
X-Proofpoint-GUID: bdF6XPRstvy-s_xCGIbRjHSz7imhpsxr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEyMDMxNSBTYWx0ZWRfX+aVVB2YrEpE6
 LGPIcuEA2REwcsXtzfXwwpA3s+Ol+8gx+wsFPyJ6zYERevj0fO83dxPJqTPZnp6ltr5RfMMLHeh
 W5WQW5FqSEqeeYTyPCHLad2NgAnj6yCprGeJW/rcXWuacyz3h8qO7FXF2m2QOyDFYs1EjSPAjat
 CCtI/HSXj+0nCT4O5442dzJyq0F65a4VHSOlevMWR+BqHVN4fwXA3ThYNBA1OSLcLtYjA5JE3EI
 8tSF5VMiqtsPfUXSYOEt/lTSkvaZxYOET+j97Lwhwmog3gIxuiACTr2OQPQ1+BGUh/TFdOCAdkT
 ymVb0i5LVp+WMCM6pSDynfQ+7Yy4OaTgPMnL8sx8w543HbFmgEDVKrlXgT3Wm7/bzHddt6bntDJ
 jjZe/0/Z10tPTUvwiTXIUDLT9XgPpVcKjadJKY46wSKbOZwRbM9ELxg1Ao3a9H7YdgPQDJqBYKx
 HF7Q3dcrR+V/mqUjV5w==
X-Proofpoint-ORIG-GUID: bdF6XPRstvy-s_xCGIbRjHSz7imhpsxr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-12_06,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 adultscore=0 bulkscore=0 impostorscore=0
 malwarescore=0 phishscore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609120315

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

