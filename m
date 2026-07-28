Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 295FC42378F
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 11:09:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785236983; cv=none; b=iN6hyZnrBbxNokCtU10TfF9Lyvz+RRYrW2nbfGwSKuJz2zdJw/eWTACstPIRS+f8yzwc9n9w026IAkT/RTDsaDy4JbvmdT14Ri2hkkA+L/o6of5Vj99f8gsX8TNAWgVgcxumE9cM+DnHANrS5ljUA/qk7cFngfNh1LtC0hMyLO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785236983; c=relaxed/simple;
	bh=X7n8M8+dMM6nnfDNfsirMu/Cn6Ph0VjIjs6wGdNplxs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TvQrirPmnGBb4YNdnRtPI23zTDO1i974zj+34QDZXCgw3PJdngd+104ozM9P2FoPVLs+pfQUSyJTmsRw5fG1k+ebJGour1vKPfpP9BKooA61YySE+obJYOm8wvnTHZAmu137bVMQ/OQkj//nMbW1G86ZlV5u0My4I/QoLFdjzO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h8nD3wLX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=etT93aSM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h8nD3wLX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="etT93aSM"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66SAgWMl2861388
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 11:09:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Qdty0teDUjB0kKLUtuopZ2iQJL6GNrf6xRC6X0ENeCU=; b=h8nD3wLXi/Qq+Cx0
	CzkJL7n50Hk856KMJwvsuEBIdFmMLkmq3XvhOabt3ZJknNZuFJb43cSKevDYYfD5
	cvRdUXr3O7GQaU/pogA4NPJuBob2X4sE1ccOf5ZN7XngDEerbtYLJpMBzA5KZCrq
	ouXIKXpy9xoU7ZGEr+Se2OuIsG0wskZPxsuePGb6nMeMXhW13TX+iyL9yZqXY/PM
	8Xz391EGSdlUuhcxWFyz19gC0p12Q7HuHxGFat2hM6SIRXd1olj+QMlmf28vjZFP
	VEVMFCNTxw/iOFdLpCidu3/+35DJL2nzWQCQGhSbIoSvpQfYWwOfJSFwDecVkfAw
	UJQJUg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fpmy11ne0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 11:09:40 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cfa4e4684bso102240185ad.2
        for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 04:09:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785236980; x=1785841780; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Qdty0teDUjB0kKLUtuopZ2iQJL6GNrf6xRC6X0ENeCU=;
        b=etT93aSMFT3n4H0fpTkz5C4gLVs0ibT142ZXseN3sCW1ophwdVGZMbHAa5gupreoZF
         1gT6kX4Le2H53o3V7ehrO/jQNS+7RtBPopJR8rDkmpA/ttBttLMM42BczyERr2/bx/lX
         QCL5PiAOpzWWr6O5uYgW202+3RPBeIuCfKdGxsijMd5tYqFo1h92x66aaSBw7vwebbV9
         VGWir9k7he7as7/K+tXlnByeuJ4/08vZw9HlqKulOmusudP3j5jioiX4uF+JDrVEz+vK
         gBx2+yc8FpYkMezkcpD3e/WmOCOzCbzhw0kHehtmGF+sDPx/8LHjC52PmTZiAQE3EUoU
         mePg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785236980; x=1785841780;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Qdty0teDUjB0kKLUtuopZ2iQJL6GNrf6xRC6X0ENeCU=;
        b=FfnY2Hgvmlh14pO8ZRWRMk7uzHrwlOku6JMG9sCbKEdy8a/h3Qo4RrNf0g3uqSQjBf
         nvsAwYuNMlYMY9DIeF85AlIZajEdmKit1FuyQVAyETCCSwyz/68/6kvusEN8gHzMwB7J
         5Komt0AZdSX6YV5zaWrxHNcC1deqa3IWdyqBOM2x8g0mJMyMXOlnXnGqhnoNSx+o/eeL
         AluJ6cACjW/7ASdPRHqVhK1+byqs7fX+YsPvR0UvJBIJdUTTZWmdvTkhJP0Rdt4jDcDI
         D4Mzvr7y62PZ0jOrv6VPA3fnuqAfB4bNc1LxfGXFoJsNYwe3mPs6LwtyTCRB4Kxq97Sd
         A3wg==
X-Forwarded-Encrypted: i=1; AHgh+RppzKlygIcuSljrLmnqTHem7EwpsWLT0Vtljh9wO+hnu/1tuInAsoFsMrtlJqhhaSq8bYA2jHICSftu@vger.kernel.org
X-Gm-Message-State: AOJu0Yy67MiFGw6lqeC+HTdQet7pDmvg9ykQbxpXr8fSUY2Kco6dLyw7
	/hlRJdTtu4hpCCb2zq6u6NRbmGSjgCF7vZ/KBgeZR7pPd3x+Mu2PCSQswTnJ5SwKkprteSZdamZ
	yKDjO/3uZyj+Op/fWIP43G5mY3BKLKlPtqUf5WlXuwMtk3kp701T6TOYqn182VIBn
X-Gm-Gg: AR+sD10iP/aBShe7qrOFyQPdfluVCZ4xp2RAqEBqoD8lP4rGFhKxZFb/0nPW/rIw377
	W5yGkOXkA4rCRx4DaZER2xxerw8Ex811mA32L7vsFPJzHJ1rvgqxt/q833jYw0LlAJdRZBz3kUT
	YaHTDu1eGHmBYY3XBQecEcHGemqykd0IYWt2+sO1+6/P2vGJ7bK3epP8VAq0wObnWaxGVsvjauB
	MZuGbewPunTsKCAW59rcRKFgo1UPtXyqxaviSMpozGBMS5uPdWqD/2mXDwZQsJOOv9X5JF/uVtB
	RlsjcEgY+cSt0yHLQsB6Xmt/w0UZruEo9Mj49yyPj89x2EZI7OlGuGtAeTcp9NkKP4bRPDgEZev
	CRklyWjawRc3Oi29BjCgOD6f9GQ==
X-Received: by 2002:a17:902:f705:b0:2c8:1c05:16bb with SMTP id d9443c01a7336-2d015f01a51mr20354755ad.24.1785236979622;
        Tue, 28 Jul 2026 04:09:39 -0700 (PDT)
X-Received: by 2002:a17:902:f705:b0:2c8:1c05:16bb with SMTP id d9443c01a7336-2d015f01a51mr20354335ad.24.1785236979254;
        Tue, 28 Jul 2026 04:09:39 -0700 (PDT)
Received: from hu-mdsor-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde7bc4f4sm50292145ad.39.2026.07.28.04.09.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 04:09:38 -0700 (PDT)
From: mohit.dsor@oss.qualcomm.com
Date: Tue, 28 Jul 2026 16:39:18 +0530
Subject: [PATCH v8 1/2] dt-bindings: bridge: Add Lontium LT9611C(EX/UXD)
 MIPI DSI to HDMI driver
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260728-lt9611c-v7-v8-1-bda216bfaf37@oss.qualcomm.com>
References: <20260728-lt9611c-v7-v8-0-bda216bfaf37@oss.qualcomm.com>
In-Reply-To: <20260728-lt9611c-v7-v8-0-bda216bfaf37@oss.qualcomm.com>
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
        Mohit Dsor <mdsor@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-GUID: 0oO670y3syy7mK-xvLoNFMjVYdXfJf67
X-Proofpoint-ORIG-GUID: 0oO670y3syy7mK-xvLoNFMjVYdXfJf67
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDA5OCBTYWx0ZWRfX7HDCE9nIoLFB
 RHV5U3/qPNir32LD0rLHktDDe4cd+PikIiN93awc9CyJ3SrDBqhaFqG9aGr8/2TvVE6Jbj6dkcf
 NlFoiQDRE2HwP/SNpKTFzSbTLE4Tz+Ibfa2YD/jWz9d7f144G/C1hEzJZpPAStNu4trT0n9c7Yj
 2BkYviNQHZYfeHdJ5wHKN4aGZGMUIojh3LitQtjF3FbR5mucbeyP2ZhxMEv/vMrhQmZwsW4W2q7
 rTjvXIoofv4xEyZ0xs2WfvesfV78B0OELbHngyo5+CRdPaiUVrGhOINMEC6LZYZK2Yx1dp1yAQs
 SoqzXDcgm7zOteqtUCFlkbkBXv+lgMHCZKOqvxdqNFSWdU6VQucEo1uyS6eTWIuWxLFQWMJn8Hk
 s1q1ZYA6G20d+6kDRW0kjy1YGLCdTz5Z78ERnZkbByOZ25dHSdOBWVkRnKO7lOwbWFEu9CV5v+q
 iO5XKclKOfh6MOJ3ocA==
X-Authority-Analysis: v=2.4 cv=PJo/P/qC c=1 sm=1 tr=0 ts=6a688df4 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=gEfo2CItAAAA:8 a=Kz8-B0t5AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=dvh2RpXz9-UaKh2pYLIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=sptkURWiP4Gy88Gu7hUp:22 a=RuZk68QooNbwfxovefhk:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDA5OCBTYWx0ZWRfX6rJG43qo9Yey
 IcY0nI3nuM6RHbEcihxiyud+eaaNjZ99ybhWskE1nYgw+TOAxnIBrOmPecujyef2CqWOBKfR5Gu
 Myy67yy/2aTYESRMzDzdTiUl+ScxQyE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_02,2026-07-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 adultscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607280098

From: Sunyun Yang <syyang@lontium.com>

LT9611C(EX/UXD) is an I2C-controlled chip that Receiver signal/dual port
mipi dsi and output hdmi, differences in hardware features:
- LT9611C: supports 1-port mipi dsi to hdmi 1.4
- LT9611EX: supports 2-port mipi dsi to hdmi 1.4
- LT9611UXD: supports 2-port mipi dsi to hdmi 1.4/2.0

Signed-off-by: Sunyun Yang <syyang@lontium.com>
Signed-off-by: Mohit Dsor <mdsor@oss.qualcomm.com>
---
 .../devicetree/bindings/display/bridge/lontium,lt9611.yaml        | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/bridge/lontium,lt9611.yaml b/Documentation/devicetree/bindings/display/bridge/lontium,lt9611.yaml
index 429a06057ae8..e0821a63d9d7 100644
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
+  The LT9611、LT9611UXC、LT9611C、LT9611EX and LT9611UXD
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

-- 
2.34.1

