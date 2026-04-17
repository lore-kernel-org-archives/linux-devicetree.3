Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89F0537F8CC
	for <devicetree@vger.kernel.org>; Fri, 17 Apr 2026 23:16:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776467800; cv=none; b=LRNKi7QQyI3slG0kA2fEzBlGXKIVsImbjoIixoNlGTYWFPdWNH8+GPQkoczAobXosGVmTqQH4ejAALUf4ACfhq3USYBzK1HbBVOQbbZMLxTy54A238lZpRs7/iaKn7Br+SjGIy6MSDND62fyXV4d8eqIwR4kBgCgh6KK1s4TyGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776467800; c=relaxed/simple;
	bh=QFyGUBjpv4MqdXiM8mWmHDArDsRkJpFYDlFfKXrJ+qM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tNRc/6OuX8C4yLXaN6jJ0r+qr7YX5kmKs1PGYlhtwncCxQ/JoetPxmwpg5f1ihbyWVdVRAe3gkyOTbJaIzmlu5ugUFDmR3wrOzcDESrNgvJrTNvKWBk4uLZ9IrnrcgM2DQ4mlhP8bbdqggH+RPiV3xDT1ktLd2+m/Ln9sRbcpHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EKfs5IuE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Sdz4JUp6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EKfs5IuE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Sdz4JUp6"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63HG4GEG4068664
	for <devicetree@vger.kernel.org>; Fri, 17 Apr 2026 23:16:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	k/MReTiZ3YyWJtzTaefEwes+g38rRRobC1lXjVxZm/g=; b=EKfs5IuEqeYFGoiH
	VpEIJMmAG6oQaB5BWZ+EBd67Afhq/3BWr5T7r4KpAlw+ChVQGry36vHXnztX1glq
	s5zrcMXHC0p8fVoIuHPXqXq0eoOSLtQql50DMgH5bm0aLBS3cL/AK5nYDr71sTNR
	/hJ2q6kqfjaR7vEWFTNgz5R9LZtBYjpD+Ra8uGq48qisCmZLsnLWQR0MR0jIkKIm
	Q94qGYAAKNq8LtKnqfAZvK+QhBxkzC2KMqEFds8lze/eXvYjzzpuiSBymc4hmNH2
	0/D2DoTnzZ5nSrqE1yZKafELNlkp51PptJ0R9ZWT1qgChWlB75sKWTyG9FBjDl48
	aBod3Q==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dkhpu2kmf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 17 Apr 2026 23:16:37 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50d58bed44aso18411861cf.3
        for <devicetree@vger.kernel.org>; Fri, 17 Apr 2026 16:16:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776467797; x=1777072597; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k/MReTiZ3YyWJtzTaefEwes+g38rRRobC1lXjVxZm/g=;
        b=Sdz4JUp6QQvmDgH462bEt6X1wptPpubfaBQzPyAo7RTm9TchMau1mOh5P27MA/lWJp
         QvkfiMUBhbQwgOunT72WNqSFjBaWDvT24MFoOQaD7bvy4vO/yebpw7xPuN69HpvhRzob
         HhClOtsQ4gyMTkpvc+6az+IEmW5S3qq22QAAv5Nh4lLUdaZtSwrv+ZdXPMNiq5bGzCYR
         xmfz5EYE8EQkm8C5Y667s1sHklXoew8JVncR7O3AE1QbUnv2urAsWB0tyNDz98ordRTa
         8PRX7fIWDJEmK2qwCmDOKlkjkl6HrgRiwuYOsZxwa+TIs/ZtmbcxPqkKxr4yZa8073nY
         OoKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776467797; x=1777072597;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=k/MReTiZ3YyWJtzTaefEwes+g38rRRobC1lXjVxZm/g=;
        b=Jxxn7rpPq7bTgUdNYdDtXuqtm7IbJsADI7sh3LUlvKRoRxqOV6hkJg2WWbNFdz1s8m
         Y2hyMswmB4U8sMFQzXM4jJIzeP88p/c8Xo993ia+5Q96DYoM3OAyKPuUFebAqLe9geYX
         C2B4kBCIACPZOheqsOhRN1qYht6CDdv+Z0h+h26aYtk/eYDqGkOx7tmr/830F1nnfke3
         uKyKyGJu3kiApTZKQM75MUe347ptCI357kHg7HukPEPxq8KuvTXa9Ikhefx3pYbf51wP
         FQrOwKXk4EoyvnhHNYvY2LpgfIktfNRwGeqU/oSoJCdhS8toaNNGdAMjTAfwWfAxog3R
         vZfQ==
X-Forwarded-Encrypted: i=1; AFNElJ+ZXTVxHQtkDROjetylFcWlDJWeaiTZkrxv/xRuHp4mfzVbWhycEFld7q8e1FuwCLb7w2R65lY1c9vD@vger.kernel.org
X-Gm-Message-State: AOJu0YzsizxbGf8SVzrRTPBYGbtGXtv/O/TI2BI/B7wbqDyIH+SCPym5
	bkP+GcFbjGNnkjDycwBhhcgGkZNSmMJOxslXWf47IUaUGk+gLN7y874+R0X7sGLc7kYdv7Qjmf4
	RQC9oQTjw0ClFo1oCFGG67y9xBChFLLnMf+ggo5IoYF50bvECdeNLLFGXGvP/Cnyk
X-Gm-Gg: AeBDiesJ7qp61y+Lj+IvvjkS9JdSyl7eX0ioUteXgtxR/mgx19ILFysOW1QOJvU2Sjq
	r4urOVIu5ewvVsz4wYxQ5pOHZ9eRMKBs9xJljUKO6ZGalxlX3irEDMlwvH/5syNHX7jnZW+7uLR
	LO0lyU6pfqH+csSAQ8vQfWF2Z+Uz2YUPhvAZrBxLI0YG13pTH99Q/brukwn+wshbioqN815ibFM
	p24uznqLNspNTAnWmuSA7JfBYdLIwfwkgfptTVKeLIFdIS/zgoe4rquno3k5yThw92j35dCXY+3
	p3kDGzUBkwKfqAMKPGDJplY42sY9lZgun0SdNZx9oYKSu5MytEH/kdRhs9MG+iWU0asNIrJZgAo
	pDvEw0IgMXz05tGlFqcznuPewHayTfPt4b7s2sH+xmxZmkg+eBWkAdU5ZwX8Q+FJAihcmQzcC3N
	h9WFy7VQ77tI7bZ8i3ZEjjTHDLcPKsxtGkYs2VFdL24/ui9g==
X-Received: by 2002:ac8:7f16:0:b0:50d:7135:5631 with SMTP id d75a77b69052e-50e368281ecmr75066851cf.6.1776467796871;
        Fri, 17 Apr 2026 16:16:36 -0700 (PDT)
X-Received: by 2002:ac8:7f16:0:b0:50d:7135:5631 with SMTP id d75a77b69052e-50e368281ecmr75066231cf.6.1776467796412;
        Fri, 17 Apr 2026 16:16:36 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4185ad12asm815695e87.1.2026.04.17.16.16.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 16:16:35 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 18 Apr 2026 02:16:22 +0300
Subject: [PATCH v4 3/4] dt-bindings: gpio: describe Waveshare GPIO
 controller
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260418-waveshare-dsi-touch-v4-3-b249f3e702bd@oss.qualcomm.com>
References: <20260418-waveshare-dsi-touch-v4-0-b249f3e702bd@oss.qualcomm.com>
In-Reply-To: <20260418-waveshare-dsi-touch-v4-0-b249f3e702bd@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Cong Yang <yangcong5@huaqin.corp-partner.google.com>,
        Ondrej Jirman <megi@xff.cz>,
        Javier Martinez Canillas <javierm@redhat.com>,
        Jagan Teki <jagan@edgeble.ai>, Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Jie Gan <jie.gan@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=3635;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=QFyGUBjpv4MqdXiM8mWmHDArDsRkJpFYDlFfKXrJ+qM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBp4r9Iv5xhufaEtYkC6QvNv+yB79Xjg8tcucfbU
 GPpWXq7U4GJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaeK/SAAKCRCLPIo+Aiko
 1QZdB/0Xirv0hja+h/Eg/Im/1sajcD2PL4HsG86Wjhg1rSgIoZlF5In2wlN4qEL4vWYsVMEttQa
 GuVRQfn8ZmQgIZeL3X4omDRYw6THCiyRf//j2VpVlrsYVGVpe91zhd380Lu5MNeZC9CXgkXs76W
 mmvX/I3QVYVICneKBYxiBtOF3VPi54RApWS6/vFWw7rCXV3tw+OCLlcvtBrbKoy6d8bDzt7nLNF
 Qwtaevb2ikOh2d3QaLzFVSluoYI6Ji6Ah8ZfvbYx9BlsAmyy1Kj3pn3vntdMLjoxOkZIvC4N1Vz
 Z8py20gICNPtXnkD1WNp8bLxJoK+9Kk9HJjA6hLvEkFZkK/i
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=Kd7idwYD c=1 sm=1 tr=0 ts=69e2bf55 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=gEfo2CItAAAA:8
 a=XYAwZIGsAAAA:8 a=EUspDBNiAAAA:8 a=ClTKKeZw4Bcbv9k5X4IA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=sptkURWiP4Gy88Gu7hUp:22 a=E8ToXWR_bxluHZ7gmE-Z:22
X-Proofpoint-GUID: 98sqRYHTByzAcNsk_1ce9nf0mrI6H6Zr
X-Proofpoint-ORIG-GUID: 98sqRYHTByzAcNsk_1ce9nf0mrI6H6Zr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE3MDIzMCBTYWx0ZWRfXyqnz1y/UvsIk
 tZxEjAnd+alRi3wLzmTJyFmGLiOQxmXLn4KnR3Erg/nrnu6cFONkYfK1z9i7paFJb6WOjZ7tmTI
 7G4wttNfdusLQb0khMRqLF8I9CtPdo7GKetOXn/3EIxgXySwcBbg8C6RWkuheWFVMacZ1r2rz83
 f3GbUQO/pj6uO8bE70skeowdNNIocuVgysMeuFTyeWU3vdug+6rYHYopZYtURxKIe+R2dwMkTpu
 NfFcy/LwK/d6K2sZYHdewY4ec3bxXe/ocRvId3aNsLxY8hEbTE41yo9PLE7oyH4R1BiNVvNruHg
 tAaGp+IxPsh5hp9SaZ5GmCZshsKkDaRTQzB6woFDHBNDK6k3TLp/r7LCXNGJ6gDFKjcQOrwDT7w
 Frq9ngazMLr7nKyUEfNh626ztq2BOYyKfYUedbQqKjdsI9cLMgpZFHs947dM3L7gitsY8e5XmDo
 FA/s5z2VuKppXs8HAHw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-17_02,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 adultscore=0 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604170230

The Waveshare DSI TOUCH family of panels has separate on-board GPIO
controller, which controls power supplies to the panel and the touch
screen and provides reset pins for both the panel and the touchscreen.
Also it provides a simple PWM controller for panel backlight.

Add bindings for these GPIO controllers. As overall integration might be
not very obvious (and it differs significantly from the bindings used by
the original drivers), provide complete example with the on-board
regulators and the DSI panel.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 .../bindings/gpio/waveshare,dsi-touch-gpio.yaml    | 100 +++++++++++++++++++++
 1 file changed, 100 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpio/waveshare,dsi-touch-gpio.yaml b/Documentation/devicetree/bindings/gpio/waveshare,dsi-touch-gpio.yaml
new file mode 100644
index 000000000000..410348fcda25
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/waveshare,dsi-touch-gpio.yaml
@@ -0,0 +1,100 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/gpio/waveshare,dsi-touch-gpio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Waveshare GPIO controller on DSI TOUCH panels
+
+maintainers:
+  - Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
+
+description:
+  Waveshare DSI TOUCH panel kits contain separate GPIO controller for toggling
+  power supplies and panel / touchscreen resets.
+
+properties:
+  compatible:
+    const: waveshare,dsi-touch-gpio
+
+  reg:
+    maxItems: 1
+
+  gpio-controller: true
+
+  '#gpio-cells':
+    const: 2
+
+required:
+  - compatible
+  - reg
+  - gpio-controller
+  - "#gpio-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        wsgpio: gpio@45 {
+            compatible = "waveshare,dsi-touch-gpio";
+            reg = <0x45>;
+            gpio-controller;
+            #gpio-cells = <2>;
+        };
+    };
+
+    panel_avdd: regulator-panel-avdd {
+        compatible = "regulator-fixed";
+        regulator-name = "panel-avdd";
+        gpios = <&wsgpio 0 GPIO_ACTIVE_HIGH>;
+        enable-active-high;
+    };
+
+    panel_iovcc: regulator-panel-iovcc {
+        compatible = "regulator-fixed";
+        regulator-name = "panel-iovcc";
+        gpios = <&wsgpio 4 GPIO_ACTIVE_HIGH>;
+        enable-active-high;
+    };
+
+    panel_vcc: regulator-panel-vcc {
+        compatible = "regulator-fixed";
+        regulator-name = "panel-vcc";
+        gpios = <&wsgpio 8 GPIO_ACTIVE_HIGH>;
+        enable-active-high;
+        regulator-always-on;
+    };
+
+    dsi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        panel@0 {
+            reg = <0>;
+            compatible = "waveshare,8.0-dsi-touch-a", "jadard,jd9365da-h3";
+            reset-gpios = <&wsgpio 1 GPIO_ACTIVE_LOW>;
+            vdd-supply = <&panel_avdd>;
+            vccio-supply = <&panel_iovcc>;
+            backlight = <&wsgpio>;
+
+            port {
+                  panel_in: endpoint {
+                      remote-endpoint = <&dsi_out>;
+                  };
+            };
+        };
+
+        port {
+            dsi_out: endpoint {
+                data-lanes = <0 1 2 3>;
+                remote-endpoint = <&panel_in>;
+            };
+        };
+    };
+...

-- 
2.47.3

