Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7184F40A959
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 11:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784201488; cv=none; b=JI9qsF5jaGvbtBmZzSvvS8BF0fMuUjEu5GHhs0zQ18xWIqEDNuyereBFt9Lc4UvbKdp5J+VO+wMX3xF28e0dwzvjIjxg7n5BYfpNEtptI6aWTbq+cEns7oJJl0njY6ynv9xS6XRcBKpGBISmBwlH4OXweE8tumLYywJFE/zPpTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784201488; c=relaxed/simple;
	bh=X7n8M8+dMM6nnfDNfsirMu/Cn6Ph0VjIjs6wGdNplxs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=i31KBRbpdNADgv3RdsUYrunqZuN7hPxxpwSok8cfCvC/ut5mnlb+EL55mD9ZcIltnojcqt/e6YjYJEjwYLQCkX/wAx8p9lHd2VQHKiRlcfuOek/CqtOZlkJqEE/WRwELu+CBvDf9z1z6DcDKEayhE/J3Kg3oGbVljIL6uAje1Yw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hPQeft2n; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hahrX+XV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hPQeft2n";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hahrX+XV"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66G9rM1Z2099803
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 11:31:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Qdty0teDUjB0kKLUtuopZ2iQJL6GNrf6xRC6X0ENeCU=; b=hPQeft2nOTPnkp0b
	tWC45ca7/aFy/Dopm6euuaBmSvweITXvi00B8XDSZgpaOuKCr7vtY7itTRJjlkSJ
	bBsa4hL5BYF/+Ls3Y2P9/2lJD0uIliXYtq0F/NupYe1gTpe+gc+6ycABMgW6Z0IN
	xG+xKLbMHF6gqa9NW+diq4GsxxuCQY28OU17jntT9aa6jYtw5KAzQbHHnKyTjZdC
	Mr3V5Qn4Hz22XIBnHIy0GwJLltLf2TgRQT79gSQdKMsPXoGWoGxdKGT4RG/Ja0ES
	xpEOM0N1gqM/LgiDyQLydcN001Zvy9Pn0OjBU89P7EVQVTg2HnwBevZsFBtYPGsc
	qY02ZA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fed064522-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 11:31:26 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3823dcc1647so8599201a91.3
        for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 04:31:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784201486; x=1784806286; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Qdty0teDUjB0kKLUtuopZ2iQJL6GNrf6xRC6X0ENeCU=;
        b=hahrX+XVag7M2k1Gc4sHBJjk5xeMv8SHCKSXruOB1K7tgn/62c6bRvwQ4N3d8DQ7I1
         4sxChbB+hkAfN2ST2gKl+MM8Z5PLKGSobZIi2ezIucm+bL2+HM38MOea12TkUN4Euf5w
         scp2GLDR+ErYBrLCPJAZ+eZ8bwhTk08jsdayzhQ+t+miQkIn5ir74PWZbCrZhydeSfG3
         jHufZF+P1rXrENI2VGOK3RxlBOw3/vO8O7h1dtXWrsAQXySOQtlDu+DcjiDW9/GfufBj
         ygFLT2sDYs6I8mTHJNMl7EBaMbuvmJLcziCbHzyOLBc8NH0POBboRZdoQKYx8DiaZys5
         vkOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784201486; x=1784806286;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Qdty0teDUjB0kKLUtuopZ2iQJL6GNrf6xRC6X0ENeCU=;
        b=CPEvx7+W3nPWYCXxikHKByLeLIbqkx3rZXETTHIA5Lh0x4Z7ZrraP0P0dotjh/EPYH
         922XUXCfKjVLU+Q5nHmrhTuDu1a1EkZ7x+YfZqY1lCpOt4FRzVhtpFzsR9KgLUdxNR+O
         jVZo5kxKmM2WNb/Gb1wNW8xrnrWjNnZFHHFecviUDC46AfewxG3iE24U1eQC7dVmg8Zy
         YYh/kVFX/5c1YIxCEkbxgacoGqYl8j2D+w5EeGO6aDD4ehhJEbNIsnkwlayFFskz1Y8Q
         gBsecDmP9vrXVgkeAfNCpSSVLN/KPK2ma/DdqAox09zTJZ5FuyobpzBt2o7P2f8nBC7g
         IHFw==
X-Forwarded-Encrypted: i=1; AHgh+RqrM3+GOFRo5CpEtOC6BD+4OVYvXHCK/tRGRaF2svLptDuOYpIs9DgsjwMJ9HDjY874ibWujy03rk+f@vger.kernel.org
X-Gm-Message-State: AOJu0Ywj0YfkIUtYGTk0SYjha+LgrLV4PFfgTC6DynS2N7NLoikf4g8c
	KiocLrhaU/t6EjCeaxr0gyVopZ4+K5swVUi5jeEHD9A1j1Fug2ygWeEbwykHoIvOrn4dmH5djer
	0pJYMQ8UHu9KKlnZ1p1zPpmABJVjT4K3dPgO+QhDa9+EFkKcf9b0EwUvKQB3VsInY
X-Gm-Gg: AfdE7cnUvNRo2OujXNoxY+7S9bSJjauNT7gEAox7f65iuh3fTtuOqIbJAN3XdcpKWAv
	TtK43DSlAxro/g/8sRd/dWSkQgyPRcRZhSzZeRPSnD/2sLdCG5m9CzHIecE22hcqIsdXXxAtAMW
	WURnSH88ngybggNEnLQW/jBzzB3k9mt41r6Fu0TGKZcMVcIDt6MQJfnp1cgl+UxsgwmvPJxXNux
	xeF6uv7svUc6HkM1GtjV7cZIN1so7D0ckbRdnsVbkT6iBv8d/rbuU8zQGjIs0FuuNP91Cd5kLHp
	Pzi2FSrest4dAJisLQgwWqwss3/izF0N0+M83Tse4jDqlKpoMdC0p/PqY3q5FnCSHeCPob8OHdT
	y0VeBzDCKjFBtAK6NXNqWlV0W2g==
X-Received: by 2002:a17:90b:2e0e:b0:38e:11ba:992e with SMTP id 98e67ed59e1d1-38e2a06c078mr5841337a91.35.1784201485658;
        Thu, 16 Jul 2026 04:31:25 -0700 (PDT)
X-Received: by 2002:a17:90b:2e0e:b0:38e:11ba:992e with SMTP id 98e67ed59e1d1-38e2a06c078mr5841285a91.35.1784201485145;
        Thu, 16 Jul 2026 04:31:25 -0700 (PDT)
Received: from hu-mdsor-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3140e6f0dcdsm9720262eec.31.2026.07.16.04.31.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 04:31:24 -0700 (PDT)
From: mohit.dsor@oss.qualcomm.com
Date: Thu, 16 Jul 2026 17:01:09 +0530
Subject: [PATCH v7 1/2] dt-bindings: bridge: Add Lontium LT9611C(EX/UXD)
 MIPI DSI to HDMI driver
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260716-lt9611c-v7-v7-1-7553a14735fc@oss.qualcomm.com>
References: <20260716-lt9611c-v7-v7-0-7553a14735fc@oss.qualcomm.com>
In-Reply-To: <20260716-lt9611c-v7-v7-0-7553a14735fc@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDExOCBTYWx0ZWRfX9MiONQYoyz4e
 w6dSs8DQhxoiK01DDAbql8hqgPHqSWQ+xOjSZ1eVMwrEHWnyWtID68/UKLd43yUHzVTM7bbQUA/
 v/c8h9tCEZlIxvUmCPPhEIPC6JIKNGw=
X-Proofpoint-GUID: Tk7aipYoedd8H6pRArAA87425SlVaeZ1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDExOCBTYWx0ZWRfX6INm/oafFZZR
 /sFUzofz021yi9Dt7waUA/a8Vw6xWoA8I4BUvMuqR4gq1ag9afgJH7dFGKuGU9GvsCO+3C2eKII
 u2Pm8VabltgQc7kpqfmvYmsFftAaE/Qjt7XHsQ/WrYLP6tGHZWGhG9umVg3FqIRSCj71EBGY8IP
 jdgl6UX7xFAs+1TKbv6YILaz0o3WslaV9rIt+kE1K7N3sR++X8Rg1crvCU3nVsrggWRuR97bNVj
 olwaRJNa6C2sW91FPua+CvK7EZdZ6QKNwSDU5EMTRSZorGkUaepgmPCMnl4x3Z8Ia0DayFuzI0+
 D9WtPw/pLoqFvm19AJYfFNkXs8Km/fbwrvqp55oDAAAuXBKXV9r35euu7HmkqMgxeyidirosPUF
 ImUrM2Japv6GunLAVEeVEujTVL8/0WrsG3YRW+FLm6gJ5a2LybKxEH1Oqe5d7u4i3Qbxjhc8jvc
 FHen2bTO4ROOk+ayDNw==
X-Authority-Analysis: v=2.4 cv=Xb25Co55 c=1 sm=1 tr=0 ts=6a58c10e cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=gEfo2CItAAAA:8 a=Kz8-B0t5AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=dvh2RpXz9-UaKh2pYLIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=sptkURWiP4Gy88Gu7hUp:22 a=RuZk68QooNbwfxovefhk:22
X-Proofpoint-ORIG-GUID: Tk7aipYoedd8H6pRArAA87425SlVaeZ1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_04,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 impostorscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160118

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

