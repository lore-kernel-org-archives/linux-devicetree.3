Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2A3E3D171F
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 10:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781779113; cv=none; b=Y/awisyJfW8MbMdYYpfqdR21XonisLmo04oZtcg/ob5+l8i5794tpG+oHECMlTIcOJwMXjZmzelldbMepK8cIsvTHR6RKI5y1Km6oMJKR8rSHsd+4IzPR5D/uJ8m8BQonKp+Vev9QdbQGKDpKWJz5a4CyEONA8vP7p33rza/rFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781779113; c=relaxed/simple;
	bh=eSkFI5t6hprmrdXrRPzVamv5V/JatdRl+BeQjBKafZs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pexkw2+A4tGhz/uqjnkG1du5go/ybq67pvpk6roRtSd/vTsBzyxNbXN8Ey2DD7T9/xLqL/dEnzYDcxe5UBbP882g2f2Z3OvV/ErmVH1MAN/Zog7oj7+6S91+ofrWYMmV0/mRu+9VKEJ0XEBTJJXt7/7K2b3V6ANN3XuPGh+0npg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gCIVh2UU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XSU6psx+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gCIVh2UU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XSU6psx+"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65IAQuuV1539479
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 10:38:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yf2jlXAbj2YnI2cYC4j4v6Rq+TD6gPSztRDJGC/3ss0=; b=gCIVh2UUD2Pk+v0O
	+TgJONgNUEOqfeodq7EsS2O98qXjeGrV2fHX3YB7Clifyuuf8NiKbcC8F7znvey1
	lBqMH9Q0l3UMPm/HeS4sMeGppcrt1y7U0J6IM0xHvyALGAzh65AYy/eRJ2+v3h70
	kXO1SPkvoW6wyyKCFwwkZt7BF7s8WtUPI646Fn1WrlLmU4bECOLetGhwr9+j2iUY
	6JXNHlsB+SDbGCgpPXp9i6WTz64Y1+BGgEgfc4U2xSM0m1lumEZ3YAu49MzXQWJb
	s+4Nmw6AtXmCBWPl7CWjrcu7FaVWn9b0iTKV965AZKPRFYEEjTbXSVHwGs1NfTGh
	ggMHVA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eux2jv58j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 10:38:30 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-915d3261c5cso187741985a.3
        for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 03:38:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781779110; x=1782383910; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yf2jlXAbj2YnI2cYC4j4v6Rq+TD6gPSztRDJGC/3ss0=;
        b=XSU6psx+THw1fiBPN1dMldLnvC+il3ZNdKUOMA0jwnVc88Gf5eux7N6dYGcubvbhgT
         2kKN0WarZBljT4fX8GiTBx5c43c/U5ysnGAor+t9Sx21Z10pLDXKHNNXl4xZVtTLxyla
         KeT5zzxfxg37o3CPpyzUK0WTj+c0zhnLR4C5J04rdpqoV8Zcs5KFCBrp33NTxuihw8pp
         wxxfxkUbzfWpcltv9xSiSuvNyDVvNSsWCEr5y+fWKJz3eyYrQT5Cs/bbtfrpzSu4rtIg
         eAOY8bL4dXUTdsSBd4OyO7MJzl+KyoBorYxjVqbr0FC5w3owDtA26ZEvGwJS2SmNL7ch
         WuEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781779110; x=1782383910;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yf2jlXAbj2YnI2cYC4j4v6Rq+TD6gPSztRDJGC/3ss0=;
        b=cxUF66AkxyVdyL2FjKLtwN6gIqtlz7SSFpDH+6+s0nUebNGcgfu7QWcACklKiIUqsg
         PWeiSU2fV7tFItBfSxnZ69C6SwJePPsjCuyf/Z/uhlIwA3lwFxv9jP63tO593cb+DLx5
         pEukE77PfRliF/GjsTbMYLBuv4sFnaqvLIBfcZiix+ZWcDC2Zlwsl1TfYhfVc1N9jDi6
         TMUiFB5aoNiRem2m3J42lUxoUTtgbj+uex//ZnjbCwBVu1v1DfDru1pmGONx1MttO0w5
         lDDyNkxoDEFUouc1jcY1MSGEXKPGdosnKEvvyAol6HB9g/G97uisMK/AL61H5vCgak0A
         zruA==
X-Forwarded-Encrypted: i=1; AFNElJ/86VTE24ToQnGz2aRCKvE37dRt0iYXT2YGor6dqY71lGpCNg1qjk2I2me1ql8Zht5dpvLUsGRqpist@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7qLe5nB7c+DzicJ11iKywa2Z2CL4QqyOEb0T3UV8jbnY3fa61
	N4anwagwvKnx5HiX8uuqARhnq0kxhWSMQUpKZtcOi+GCpyW/fumv7jffAnWH0Zdc/v0ywHeuGrv
	QSlK9znLvHiUpkDbiKTw2qtvM5XY2KYjBaJNlMGO/SkI0bXhC9FUJx5MUyfYVIxU7
X-Gm-Gg: AfdE7ckv/IAkHdmXLTWptaK6u41g/xgAAG9wV9PtzGeGAoYhz9wQpGgVLVhObzp4dhT
	NZjbqdtfMFmYKYEV9D0A+sqREYQJL67llwtJMyKMAxljVAtzLA0WJxVrGpIeEPKNnMII9AF4hfl
	uZVKbB6hvsCKBLMAtI1zEXLCSjd8vnLP7lpd0vzGBGptSeH1tpkBvv8ODzEC2Uur7fo3pUhYYn2
	9p2t27G80MACMt2juXpt84LrzGBIIxdYU94/Gb8iVltQ/IcSgSSoVcFYs59orjCCXV5jVVjMApl
	4Bkr+M/xyFOOJJKXWRBnDRfOEJ+OVcQDZ9xxzE+vQ3lfve/9ICY6pfqJ9cY2i4M3iJewG1K1e6J
	jg4vpp2P77n90QBlDDktgdvS7k1MnSq7gZ7opZ2/Rb85gi8Gw9WnyIKKCADrBXv+Urqc3EPwzv0
	w5ZD8=
X-Received: by 2002:a05:620a:172b:b0:90d:c28d:9666 with SMTP id af79cd13be357-91d8aae0b22mr1344634985a.30.1781779110067;
        Thu, 18 Jun 2026 03:38:30 -0700 (PDT)
X-Received: by 2002:a05:620a:172b:b0:90d:c28d:9666 with SMTP id af79cd13be357-91d8aae0b22mr1344630985a.30.1781779109575;
        Thu, 18 Jun 2026 03:38:29 -0700 (PDT)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9161a04b472sm2029316185a.37.2026.06.18.03.38.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 03:38:29 -0700 (PDT)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Thu, 18 Jun 2026 18:37:43 +0800
Subject: [PATCH 1/2] dt-bindings: media: i2c: Add OmniVision OG0VA1B
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260618-og0va1b-v1-1-dda71bb83009@oss.qualcomm.com>
References: <20260618-og0va1b-v1-0-dda71bb83009@oss.qualcomm.com>
In-Reply-To: <20260618-og0va1b-v1-0-dda71bb83009@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781779102; l=4118;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=eSkFI5t6hprmrdXrRPzVamv5V/JatdRl+BeQjBKafZs=;
 b=+Gq58PPajRPg8IeHPL2PV0bsfTPsxhNKshWLiwnF/PCoIBUiAiz1VPU+xkufFeJZUGINirGJ9
 syG5hXrExYwAWgvLrxtZlKiQ2BQN5yzcUzRa0QqbhRl9BIFc0WGIb9q
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE4MDA5OCBTYWx0ZWRfX91BYPzACt4le
 orRffmOXs6DY1DvwSFIlGxdtaH6S0eokSgF1syPyza8PHHQWBGIT+3TgmU403yP+IbOdXitACWP
 LhDjlnnwP21XSfmecOjSD81ZuppWYYa3tYQ6Mx7RHIIy9rb85zc7lRlQmx732cONsvQPl+WHmoL
 FqLWK7Ij+cZ4tLnEIYBGt6kkg8NhrcnxBDiSEpM3rdecbnNfkCy8p3hSZRWj7ABrDYuaAyp4jRL
 /wqtNg6y0kwZdBZtXRBf5wnf24nsBwkGqUeNGJSOKJ9k64LIZuEHAM61a9+MgSCmOpxIKwEnzFo
 JvIJ56t2EwKzsJnMhOLOzxCn04582zqHug/9QLU7jGKCKJG9i1BawpUfvLCiqXhXZQteOsbvwA/
 BjjmOHmbH4nabDHYQ+oZXjwQTehq4BLQWBWIAQLvTMzr1oCZAXrwpuAqIfSHAxUaQCMsIZcpZ/4
 b+pG+dkdC89VIEhIR6A==
X-Authority-Analysis: v=2.4 cv=Fsg1OWrq c=1 sm=1 tr=0 ts=6a33caa6 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8
 a=mTQZ0Vat4jrIGxsPDm8A:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=sptkURWiP4Gy88Gu7hUp:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: vk5Eoz8E5MgRtq8P4Nobbo6Vgd6O6abw
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE4MDA5OCBTYWx0ZWRfX7WCFYZj8ZxqW
 aWW0MXopViS1Bz+0msrb+idbYFP/Op9Ls1JAtU+G9KTbp5mnnFWv0Zr+qWzysMudcwKbRPNBHdb
 POx7bxpuxb5rshE5aAGYsq7XctHp9Jk=
X-Proofpoint-GUID: vk5Eoz8E5MgRtq8P4Nobbo6Vgd6O6abw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-18_01,2026-06-17_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 suspectscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606180098

Add devicetree binding for OmniVision OG0VA1B image sensor.
OmniVision OG0VA1B is an image sensor, which produces frames in 10-bit
raw output format (Y10) over a 1-lane MIPI CSI-2 interface and supports
the 640x480 (VGA) resolution.

Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 .../bindings/media/i2c/ovti,og0va1b.yaml           | 104 +++++++++++++++++++++
 MAINTAINERS                                        |   6 ++
 2 files changed, 110 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,og0va1b.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,og0va1b.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..302afc41bb776f75c08b26ac2f04014f8cbea4fa
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/ovti,og0va1b.yaml
@@ -0,0 +1,104 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/ovti,og0va1b.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: OmniVision OG0VA1B Image Sensor
+
+maintainers:
+  - Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
+
+description:
+  The OmniVision OG0VA1B is a 1/10-inch black and white CMOS VGA (640x480)
+  image sensor. It is controlled over an I2C-compatible SCCB bus and transmits
+  images on a 1-lane MIPI CSI-2 output interface.
+
+allOf:
+  - $ref: /schemas/media/video-interface-devices.yaml#
+
+properties:
+  compatible:
+    const: ovti,og0va1b
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  reset-gpios:
+    description: Active low GPIO connected to XSHUTDN pad of the sensor.
+    maxItems: 1
+
+  avdd-supply:
+    description: Analogue circuit voltage supply.
+
+  dovdd-supply:
+    description: I/O circuit voltage supply.
+
+  dvdd-supply:
+    description: Digital circuit voltage supply.
+
+  port:
+    $ref: /schemas/graph.yaml#/$defs/port-base
+    additionalProperties: false
+    description:
+      Output port node, single endpoint describing the CSI-2 transmitter.
+
+    properties:
+      endpoint:
+        $ref: /schemas/media/video-interfaces.yaml#
+        unevaluatedProperties: false
+
+        properties:
+          data-lanes:
+            description: OG0VA1B supports a single MIPI CSI-2 data lane only.
+            items:
+              - const: 1
+
+          link-frequencies: true
+
+        required:
+          - data-lanes
+          - link-frequencies
+
+    required:
+      - endpoint
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - port
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        sensor@36 {
+            compatible = "ovti,og0va1b";
+            reg = <0x36>;
+            clocks = <&clk 0>;
+            reset-gpios = <&gpio 42 GPIO_ACTIVE_LOW>;
+            avdd-supply = <&vreg_2v8>;
+            dovdd-supply = <&vreg_1v8>;
+            dvdd-supply = <&vreg_1v2>;
+
+            port {
+                og0va1b_ep: endpoint {
+                    remote-endpoint = <&csiphy_ep>;
+                    data-lanes = <1>;
+                    link-frequencies = /bits/ 64 <480000000>;
+                };
+            };
+        };
+    };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 069b4aa6b523c72b661418d8f37cd214a061f9af..5aa846c8479b20651291d5bd2e316308310f826c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19886,6 +19886,12 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/media/i2c/ovti,og01a1b.yaml
 F:	drivers/media/i2c/og01a1b.c
 
+OMNIVISION OG0VA1B SENSOR DRIVER
+M:	Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/media/i2c/ovti,og0va1b.yaml
+
 OMNIVISION OG0VE1B SENSOR DRIVER
 M:	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
 L:	linux-media@vger.kernel.org

-- 
2.34.1

