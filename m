Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 281A5377A8D
	for <devicetree@vger.kernel.org>; Tue,  4 Aug 2026 12:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785847242; cv=none; b=VsAPW1ZSQjlDGFh4fxTRaRk4UISwgqjybdRRnuwOfpkrZ5EjIoYtS/ftjb84Eegprl+J8KzfNCEjkVjKJvm1BMpY0S52qHYed8FLikEEgLifL2iEhoY5FKTyVLphRbcivVBR7XbEA58Czcfy4YwuebG8qrJdFzW5IiK7guBKo24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785847242; c=relaxed/simple;
	bh=5+KnzCHZJ45AZvVjq5WBE2SpjZCA2oMXzpynQ2k37B4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=keceSotnbN3mxl82LzU7LnSNlFpYD4Zgxu2FixL4Ut7OoyH5iU7w9KQwrONwDw1gwwO1mSYAj1K1C07tJPJa0/+ThWJizWw0FMWvQcwXQYfXZtSQ9/Ayg2OE+CrrNOkDsV5mZAfYlXrZroN+YMQmmcRKxIfriUcOtLk5AtNxeds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JsDfSfMA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Na4A1XPJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JsDfSfMA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Na4A1XPJ"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 674CXKJ73829920
	for <devicetree@vger.kernel.org>; Tue, 4 Aug 2026 12:40:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	O3sv1TXFds3gvAa+8gtPweNejRKPUVQ/df8YKZPqTho=; b=JsDfSfMAKusW8G+z
	K7FyPWTzZjc5xhF4Y5ShLPRxMNmyHzANfmHwc/ZDMlS4faoN576WSt8rNHPVyM4i
	SXmp2aUsJ2QNH20wdrOZIQfG92RkUlr4GfxL4tgRGKvvzL7kOyKdNyVCyduZYmpY
	KyyU8T38DZOxdGHOYpQsEs8eCNFLREtj8Fvee1hagcK6GM77cb+u/qs1QkGjCSB0
	PFBt9ZyfArLPEihGnDjLMpK9TmVmLjhvRVitpmVecboV8kTKHfcNVaKKJLB7Mt3W
	0W0+O9MkbYCcavp7xFSRSWjnQWGW9LIAS8i2lEUd1wYXhCyRzc1DeYRn8ON+aEIh
	yHfYjA==
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fty5sc6sv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 04 Aug 2026 12:40:39 +0000 (GMT)
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-495f637105eso6884350b6e.2
        for <devicetree@vger.kernel.org>; Tue, 04 Aug 2026 05:40:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785847239; x=1786452039; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O3sv1TXFds3gvAa+8gtPweNejRKPUVQ/df8YKZPqTho=;
        b=Na4A1XPJ72MCEuaf7TXOApoHdy06WSw3G4viOtCX6V1CF6auZ9jRBzJmftoj1rS6Ij
         ngPAuZ3oCgdECX+Rw1aGlZOO5p4PJ/2qiO08NypNCdlYuxkS2gRlftg636pypMOZaazR
         yxnCoAUqog3vdnmyIP0ZRjOcJ1JysqeMNpzY0tZk1nGDUvX5noZCKO4hATPnlyI+lPim
         kjdDZunS2LP0PcfAEqPHWWRonIrT9LCj5a0t7pdvBcEESNVHDacJIiyQKm/3QiHjUBFp
         69pR8n2aT2fwAzB76d0Zarm+CSiBjlf5TJ/U03Dbe8NZtksZOYVhPSAW2xnnz0ksoraA
         mKBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785847239; x=1786452039;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O3sv1TXFds3gvAa+8gtPweNejRKPUVQ/df8YKZPqTho=;
        b=hyFmGdxBggm5GEa9P0wpQ1grWU8a+q2UYwUfUCns+mjEGJNOZq3As7KKURI3p1d9Br
         xdiwLSlKUj/eBsJ6ai6+HS8A6imf/W+ZaF0evbBYmpGXVSjxQYiwWRXWSugMdBHvg2aK
         LyWHLyHXn4oPrBlV12KD90ecqw2CM/MHKe6KJzqWIlTLzswNHGOj9kL+Rbk99NzA77m2
         byWG4yBzKsRy3GyYyAKFYOX1w8C8IhZhLQuh6Iz4GV0lcz+X6qpoGk7eD019kRHuyW+y
         1Wnz3gDIUZe9av9vR54JesTZoeek5g1EdXpwRkFxUP7CESikUNpLI5Up0gScRnkRKppB
         gbLA==
X-Forwarded-Encrypted: i=1; AHgh+RqMZEMcWOgPwBogYXMg7jZ69gjmm8gqIen2OtN0cM3mntXwLOp+TnQowaIi1NQbTHvujjs4wn4UBb54@vger.kernel.org
X-Gm-Message-State: AOJu0YweyatP8kNqt7ciGiOWKOrOmrcwq1qpvDTaat7z0hYjWREp7x66
	J+i5twQoo/hN3QY4kH7HP7Wto/48bgsV5w1ClTcbVllZqfEL/coITLKJW6CLQYZyNTrS1O5U8P1
	01uySWWxTm3HTVfWVBmHQQxQQc9pPDA1QT6qOaCPS9rAB2sFGqiGjn+pa2giKErAs
X-Gm-Gg: AR+sD10HmRftIpq/1eSl0HnjjzgsDpXSZShB5O7/CqZ+rpgX8pzX/MEm+b5ZQe2pElb
	aTdMZNJiHSep5WXooNVH0XwW9hdfIjrdqqUaJF/IDm0NOagEsrgA5Oex4PoqhMQ885fANrsF1FM
	mAAQhxyUMEwOafOhR44Wtw1OmYQoZCuGILjeXLEW+SdSBcIRkZ4CLyef5pFUTJKxJLbCtfuqg4Z
	7hE54wrMsfFC7Jw2dZjsCQM4lzNCFw7KOBQniXkBWBWgLP1FVZ5ltSWG55eRlnvNfVo05xKehaR
	5CGUVhhPESQdboh+ABhG58sv5jJm4fdB7IqM5pZhn9kEjYDgDs44KOm4B7w+qG8/wLLy2Us4Zsm
	wYa0EicuZpsj+sqZZ+To0ezXXQw==
X-Received: by 2002:a05:6808:1795:b0:495:c607:b13d with SMTP id 5614622812f47-4af5dfd1567mr18513200b6e.2.1785847239094;
        Tue, 04 Aug 2026 05:40:39 -0700 (PDT)
X-Received: by 2002:a05:6808:1795:b0:495:c607:b13d with SMTP id 5614622812f47-4af5dfd1567mr18513183b6e.2.1785847238702;
        Tue, 04 Aug 2026 05:40:38 -0700 (PDT)
Received: from hu-mdsor-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4af58f7238bsm8204962b6e.18.2026.08.04.05.40.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 05:40:38 -0700 (PDT)
From: mohit.dsor@oss.qualcomm.com
Date: Tue, 04 Aug 2026 18:10:14 +0530
Subject: [PATCH v9 1/2] dt-bindings: bridge: Add Lontium LT9611C(EX/UXD)
 MIPI DSI to HDMI driver
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260804-lt9611c-v7-v9-1-3423a76856d3@oss.qualcomm.com>
References: <20260804-lt9611c-v7-v9-0-3423a76856d3@oss.qualcomm.com>
In-Reply-To: <20260804-lt9611c-v7-v9-0-3423a76856d3@oss.qualcomm.com>
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
        Jessica Zhang <jesszhan0024@gmail.com>
X-Mailer: b4 0.15.2
X-Authority-Analysis: v=2.4 cv=SPJykuvH c=1 sm=1 tr=0 ts=6a71ddc7 cx=c_pps
 a=AKZTfHrQPB8q3CcvmcIuDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=gEfo2CItAAAA:8 a=Kz8-B0t5AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=A7cOQzBelK9jzjY8NncA:9 a=QEXdDO2ut3YA:10 a=pF_qn-MSjDawc0seGVz6:22
 a=sptkURWiP4Gy88Gu7hUp:22 a=RuZk68QooNbwfxovefhk:22
X-Proofpoint-ORIG-GUID: zGuDAGrK9_UMKnQ4byj4-0KGw8wwRyX9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA0MDEwMCBTYWx0ZWRfXxzx4wvc2v192
 fugJUal3a0F8XQhyARh2+pHpp1vB0qCIZTiiTx0QvnaUeoNOPX3EqPMSLhnTUNrs95ZS2TdMeVg
 1YBwg/i8EOzBSCBlvM4NBh1cF8CKn02oA3qpkPw8K5OD8QGVIw7Oiv+3SpWKqzK4L9PHZDTMwLt
 BoZi6Xe+rr7jyyhbBGaQai3+OcU3jHDrsHhTm7L+Gp7lqutuzqblaruA6+4hwu/5O8yssp6s+S0
 5lgoIVQavHC4xR6VYHeEiHqI9amNEvpVSFZir88Wmn1ucZY0dEOK82SBJ+k348pAgWZNL6vivRp
 KA4xlax8gJ9ToKCqRJsy4xT8GwjGAVz3kMeQJXkyANU1Kcpe7iRBL0EVoI1ABZV0jH+v7WcYQJS
 Z8wQkTrlv9ltSOUFI7606V2461PsfU6FKjZBdDo7WQNs0xciITcUZJ3x7pFcd8baFeBzXr7LLsK
 /aQcL2HtqSqmaUeziKA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA0MDEwMCBTYWx0ZWRfX9+LPgdoLYgrg
 i9RT1G5iq7RAQGU3CyByHA1A4X5ew6+Qa7f6rssNJWZOnUr7++otKNQjuel3+dO7A4w95JZpcvi
 i6uXq1cp3ocvDFKE3AmgXRQXilWHhr8=
X-Proofpoint-GUID: zGuDAGrK9_UMKnQ4byj4-0KGw8wwRyX9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_03,2026-08-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 phishscore=0 adultscore=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608040100

From: Sunyun Yang <syyang@lontium.com>

LT9611C(EX/UXD) is an I2C-controlled chip that Receiver signal/dual port
mipi dsi and output hdmi, differences in hardware features:
- LT9611C: supports 1-port mipi dsi to hdmi 1.4
- LT9611EX: supports 2-port mipi dsi to hdmi 1.4
- LT9611UXD: supports 2-port mipi dsi to hdmi 1.4/2.0

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

