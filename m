Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CBB83B42FC
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 12:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789475657; cv=none; b=JfvoFXTW7l7PEv+PPe62L8pLDyMCczjGe88bbj3ZVrfZWEH3dj8p0/BTCbR5j3arqgKD9giJiDvnoZN1jWcAqswLB2OqS2Z9TAbiqdSg6InIeEeHeauplDflN3qCIErHUD9rJNuvj0iIgdpd1rmXwHE3sNEd5bnuOTHrcC/hj2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789475657; c=relaxed/simple;
	bh=/wP/ifaUlX4YnTsryPY8ZpP52sJzH4xKyqmqoOC+tAg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=l3qMglVl7W/fwBpY5NVZr2kuCKPgrAGPp7y4YJmUSw+8s3ZNtEeFkVrejzpyMxMN1vvaj9n/qX0GPATUR/+qiFhSdbhGOqXLqTI7SpDxsfn8+WmgJ9HwsI+bFiq70VOWhBVvE1xlb2Tnr3M0hnH+xZU/bvS7OdwXOUGKmJYhKnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DXR+c/Nk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WyiTdpat; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DXR+c/Nk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WyiTdpat"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F9hG1P3317915
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 12:34:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UUSdb7GhbdJGsEth6SJ34W7vHVCnsU2vlRUxl4txdnY=; b=DXR+c/NkTVTzGySv
	K85gvrkKea5T+0Rsz0qACMz0ple9+iYwbNAb0O/h+UnNmoUf0C3OSqyAxcMJYF1J
	L+hCZpJvC2Et8rdpSBm9zZ8/jVysadIv6pLi8vcEwqo+XBoSYmIq/ndoXVXngn1b
	ACh8rCD8r6dhkrI6vY2oLIDCJwhbuHnjxeSYTehmfsDMhdprvb/nNQndZvOYaUeD
	fUOmdXrYYQStdrs0S59cpereVClilrb3PzNzlrLH/n42SzlY+hSZs9FeYhdEmFFa
	8LRPQiPzANq9+XhnzomR9dQqOkzmtVfv8RJlnZ1YCy4PyxsZNlLw4QVGE1xXES/C
	Kz0SCA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gq38e0t2b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 12:34:14 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-855315ccb64so4499652b3a.3
        for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 05:34:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789475653; x=1790080453; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UUSdb7GhbdJGsEth6SJ34W7vHVCnsU2vlRUxl4txdnY=;
        b=WyiTdpatqEkrpbzGFlvetHEBkDcAXJW07EIPBdY5vKa53iE1DxgaMfm+9EhfvgjnVT
         8wcfv+R02in5SXUu715H5R2Xj4t57lMdtivU3NeIYNOSkvTLC7KDwmwVI4YxD2KlBdGK
         6JVuDlm9uTW4XNEocG8+nDmPaxEVPkbgFqp59N/Mx6xVPfSXl4LDNkBO4mbChCteNo7V
         ZBCLzaoRmTwft6uprksCkSYqu9f4b3bFmkuoCGgvAsLwIUW6CPs08BHeLpeMyPQnYFqZ
         uHcflaZ1Fe2atlvQYuaSbj3ux0Cq+kDrX0YErY/7km/fl2e8c/o01GQPEUvNBQuoMHgD
         mB0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789475653; x=1790080453;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UUSdb7GhbdJGsEth6SJ34W7vHVCnsU2vlRUxl4txdnY=;
        b=kgEdgiylpnIXj4HVl6Af12iFTIAEqFlgggWXey/sVos7HtI8ebzjEZXS9mU4B13x9y
         yUG5VdXSnC+SXUPZx82qLIHqHTijvpbcVtBFoEM7YlOuI/SjuoYiX61mXbrFtWuWDETZ
         0yy9jUg5p9hFhjWZioBB9VGGIbtx6Ovwt/INTJaP2PeTJrkn4M+/hygLGSy0OaejL522
         TIIIfJwLZ7vHyYZQ0uFYzvQQlFxUocwdYEdBX6bDPMoJI9AVNO3eJHSvM5QkNWLjcWqN
         kmhDffkiDl4noCyFhJUuSWXJi0Ckvjkn49Ce4IKwzSfcg/WCMXzkVlKy0WrPE1/MhQOV
         Ik6g==
X-Forwarded-Encrypted: i=1; AKwUvBwLFXJpx5orgsB+i/KBDvCfNYw5AisR734TzoWVWnGG1dAujY+E3I1ulrXbpmuawvIherGpmXhpa8gN@vger.kernel.org
X-Gm-Message-State: AFuF++lsIdIB+42UDVevhAsFu5zDcGdzfVhG6S0X9GJz0Vz4Flec+cAr
	ARL2THKijeCcvDv2NqslYWSUHR11UeWYZFbGJAssGd4PeG4D8BINtQeSvEZK5fNzlopDDPdflcU
	ziUIP4EuqtZpTxeKlkt4FIV88L2cpE8e/qHiye3IS/gnxtsUPZDckZCXResRpBTqH
X-Gm-Gg: AYBFou184MumDqo01sHnPcU/v9FRWyKww62Nl/LO6atgNyCAkC9fAhL8WNRzJshDQro
	RIO/1t3+gW39QnQtGf7zcTaPZMaiF6lWbr+hNieOQ+vOeYr9edRqWBPSsE0FRe9BGmP2ita9LZi
	dp0g1v554d2yGiGb0L2tXQ22hD+4kQkW3FRJo8kw3O274TqFSoTiHUFN0hhrRkV9Yz4+LvVI/Q7
	8LhEG12bPpaChIrORY4kDbXFHDe0SIgM0Gj7yd78mQYRmCwnNElGzuCdgM4OBlhpW1DntAaIpCE
	Kw/uXcrB05IBOAj+87KpZiWTFj1tTcD2aX+BWXhY1VrE/6OQ4IpvgPEb3UkdO66Yz5yVMcFtpOM
	FzXIV6M4+IFkCV4cMrO+IUdLNGw==
X-Received: by 2002:a05:6a00:2e9a:b0:857:727c:a1f1 with SMTP id d2e1a72fcca58-87180de6625mr1343367b3a.19.1789475653301;
        Tue, 15 Sep 2026 05:34:13 -0700 (PDT)
X-Received: by 2002:a05:6a00:2e9a:b0:857:727c:a1f1 with SMTP id d2e1a72fcca58-87180de6625mr1343249b3a.19.1789475652642;
        Tue, 15 Sep 2026 05:34:12 -0700 (PDT)
Received: from hu-mdsor-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86b287c481asm6509975b3a.11.2026.09.15.05.34.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 05:34:12 -0700 (PDT)
From: mohit.dsor@oss.qualcomm.com
Date: Tue, 15 Sep 2026 18:03:50 +0530
Subject: [PATCH v15 1/2] dt-bindings: bridge: Add Lontium LT9611C(EX/UXD)
 MIPI DSI to HDMI driver
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-lt9611c-v7-v15-1-88f9e9387eab@oss.qualcomm.com>
References: <20260915-lt9611c-v7-v15-0-88f9e9387eab@oss.qualcomm.com>
In-Reply-To: <20260915-lt9611c-v7-v15-0-88f9e9387eab@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789475639; l=2049;
 i=mohit.dsor@oss.qualcomm.com; s=20260808; h=from:subject:message-id;
 bh=ut+CndQz/jrWa/IvwRM0rWOCvN47R5Wgsw+GSTdue28=;
 b=IAPO8LsTqDXbz6623zZAU4eY+YP8m1qcI6DLsM0OMc2Fy0L17AW7/y2t6XnOGW6s1jOqrjQRE
 MQI6XXwG9DuC5xHPZi98Luh5eDhpPazd1zQVhr1qqaExOIWwOTGilKS
X-Developer-Key: i=mohit.dsor@oss.qualcomm.com; a=ed25519;
 pk=outHVBN53JhozDw1xkj3G1qrqqE5scMBP7M4WL3aHQQ=
X-Proofpoint-GUID: MRaMJxmfTAWhFMUZQnhux-raIHO7RNqn
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDE4MiBTYWx0ZWRfX+MKVCv9rrVNU
 4RUXgQpT6BT6bK8yr/o7QoJsVMWClQXsBku66PW471WfLE/Ti7dKYiRfzAQe1w49oCklNmlAA0c
 6o4TRhvxuX4T5SQjEr/7Qiw/Q2NcERc=
X-Proofpoint-ORIG-GUID: MRaMJxmfTAWhFMUZQnhux-raIHO7RNqn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDE4MiBTYWx0ZWRfX7LWuGy2izkUL
 SHR+GSgvWS+BdckBgpSoZClOXLrW16wOr8t6MmqL0ROLZtT/1oVrDdg9f8+ZZYA0AjsqymCndf/
 M711oDn+QYfEbiJ58e3Yef+n5C6U7EPnPPWC45iHm59jevjSFbdRr1+LA3bydyRlyi/XDv3jnzB
 vnFMabbLmyEjLVa19dAW5fDbdLuCMOWOd8MrK8pBu/88ANcOcS6FMu/e0aIHBZjYCoFsCtuUNuv
 o31U1jVqzwqj0fvXbD04E1RelqnrwUu34/uf1uZJl2jAHpW+vIVBP9IweM18WOt+GfIQgVyC0vD
 mK8pX80qWWGHDNfy1UYIlF5TGqnrZUr+V1xxWPrTR+lrAJsDWPPwknlTKlE52vmZg07rccg3tUQ
 HcHAUzpEBocrb6KxkDSZ+mlglYN4xfmKuPCeWhrovqrbQpP3JoRXRjARtPitl53uGXUMPrOTSEH
 y7KDjwuNqc12HpzEEAA==
X-Authority-Analysis: v=2.4 cv=BswIUoX5 c=1 sm=1 tr=0 ts=6aa93b46 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=gEfo2CItAAAA:8 a=Kz8-B0t5AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=SdC2vBNBQt3qShdCGKMA:9 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
 a=sptkURWiP4Gy88Gu7hUp:22 a=RuZk68QooNbwfxovefhk:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_03,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 spamscore=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150182

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

