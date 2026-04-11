Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5199354AE3
	for <devicetree@vger.kernel.org>; Sat, 11 Apr 2026 12:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775909466; cv=none; b=iRWiyaUs/gf/N808LpHx/lhVdelJbEKEoeRFASf1uPqx/jzrd7QNPSofOVmRjGLoFWqD13MhOYXgwpRXdNTrln06UpSsBHUJgntpAxndFaYcStcMFt9gKhks/ZqcYD2XrfkNYGqWJq5oVq9j0CK6NMtDWF9xwGQWnGgqMA2ZO4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775909466; c=relaxed/simple;
	bh=Z9LTIc7mkl8iWxx7biEWKT9WKaSV6D0MGLZPFj17wto=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HVls+oD9GJ6sudm7/he9burA7ffCWgDaMvOCQoH8RU+v8pdEELn+oQjCxkx7RF4d4/HTtn8S8X7tx1n+xzR/EuRxdr898ctm6N7xEb6CfCBXyvcg98d8rFNjAHvRafYTSHizQ+78VjVoTJ7VtU8gZ5afDDAZGosJzv7V+AA5SXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EITOwlpg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EqToP9cG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EITOwlpg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EqToP9cG"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63B43Q5x2737016
	for <devicetree@vger.kernel.org>; Sat, 11 Apr 2026 12:10:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	B7mkAgduLRIwjHS7HjVchMyGBpOAMFCr+vZmhtUZ640=; b=EITOwlpgdnKjwFHO
	48WMXU3hvSeIN3rejsMYcKnMxz2l50VMm8YQVqgvU0wV6X3D3cszHRmijJJEOPWL
	SjUxUYP3d9ZY105unmjjfJrrgXmgaGIGCVfuxoUo5t9MMAUh89nUqGkjMSLhO1Kb
	KlWSGcgYL6kiwTeah5Uf8gwiShYV+mkWKIhls1Rk3OJmEhZXNKDLPyW5BhVfU0pq
	3eJcjjj0a6CDhvGA5yGld3cB6Nq3KZcgD8Z/BPwoCDC7kmAgMip1MRrfwS0bs4oS
	mcWrRUdGScta5liECcLCqY3VkdVlRa2HJ2l2IZuNSqr6LapYKPKQcFOZ+s/OIpod
	kH3q0Q==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dfexcrn0p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 11 Apr 2026 12:10:59 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50d890580e1so56896901cf.3
        for <devicetree@vger.kernel.org>; Sat, 11 Apr 2026 05:10:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775909459; x=1776514259; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B7mkAgduLRIwjHS7HjVchMyGBpOAMFCr+vZmhtUZ640=;
        b=EqToP9cG6F6i77yxV9TAzwHwMoSfnfL7awKFde3nF/VDxtGBhCMvOK+p7kYyPTy4aC
         arE5Yj7iwLXyyVjFKkd1LS6EE4c+caabbwTSPGKr/nJeevvQRu36GTnseAFZRmjWoPVu
         6qvfn5QQBtFcLfSfAmisVTl90JHlRsIfS0WudunrxKT06Aeztu+ePiolnoFZsTyLcqrv
         B76Yg0G+hrT+NEganjcvtTneaVVsSxbGZ+QSvtohEVJ6HkzFaFZHdkhioxJGLifQdt0W
         yQsu2EIR3D9W1vJdXRNjGyvvLKzB6PsWFcv4lrQv4su8n+6FiY3mjwgGHOXBdleyMXcd
         jYIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775909459; x=1776514259;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=B7mkAgduLRIwjHS7HjVchMyGBpOAMFCr+vZmhtUZ640=;
        b=s71LQHehhpiriTus1nOvpYASi9APfuKocV91+VylHNC14okQlBz/ArKz3X5b00ls0+
         QbECwbc8ryxce8nHoaX7TPF+Tr4ftbkNfrkwJE0pAPOFvwOpMDnTB8yUCnCcoedYVVph
         5V9ns6nYQyiuiqF1ogOdbAKQVENcJLomxyuzTEUIp8lSjpvKT4x32MLy/fDTZyQnWQaM
         wyDVLlSABGHv7Lpi9yCGDO8q1eBg1MeKG0P9P3PtnIdhLMarpXGjqs6fFmdLPmjyaYhB
         tNWcfxDqUgNOGRUA98tMMHySPCwuqoaAkEQWFQZ2+KP2It4hjxierd+RA0vEbt5QRByW
         0xLA==
X-Forwarded-Encrypted: i=1; AJvYcCXG6XXWyp4BAKPk3VUjDz65XRI2LsHcnROsrc1Cn41X22vK2t3844PxsvxrjxderCUZI2QPuGh9bnGY@vger.kernel.org
X-Gm-Message-State: AOJu0Yyo1z0gEMoYXyCOcDtElmtzb+0bKcR7IGOlvUMGCWX4CTI+dPTB
	44tyEnhrpgVXH3d4fJCgxukGhuDxNtAkdo3Asp2vP34J0Wg1AkyTRjLJk4IsILDDP8qfkEv4zy0
	Vdj/c1CWKk2uzsVy8arCgSP3CmYSD9ds4WmKmdE+iG+DrYnApBDdy47oqJPwy3Cfs
X-Gm-Gg: AeBDievMQDIRPhNA5BHTi4755zLAdINvwxPGjgXrg87jZhWh7GLJ64R732k7N5YBNFW
	cMarA/pDPdPU1oglwHKmkdeGm2mtejiO98wUdjQacFjzmGT0vkRPkTmZFSEhEL23Wbncgm6FYTm
	M78q1Khonvd00imd0zCtu+Vdf0+NUxzW4UIuJiKLNeocvYfI5q9Dt1EklOYuxPzprE8DoVTwXe+
	jDbfpFJwLEp7zbS5c+j9X40IIn4lG7wUfhHBW4JbIEhaT5mWqOITTuNyFQjSjCOYxht0d9LLqz7
	8FaO89BoAH3/aBuOFInsrPdWW/MxebFPcadHDXKldSMdDuUoFOMI/cScx/60/zPXpF9SwL/OFTW
	lE8RFkFzsfBQZ8b4ucBW4A4yfyu5ng7+2VWovHkUlVj9NIbFtCZSCXlhC/l7gvXNVMzpMC+Yp6N
	+4yQNATOmaJ/yFAbfaFcpQ/kgB6NJErLNDkPE=
X-Received: by 2002:a05:622a:59cd:b0:50d:8b40:d97b with SMTP id d75a77b69052e-50dd5ad8ef6mr101502061cf.17.1775909458963;
        Sat, 11 Apr 2026 05:10:58 -0700 (PDT)
X-Received: by 2002:a05:622a:59cd:b0:50d:8b40:d97b with SMTP id d75a77b69052e-50dd5ad8ef6mr101501651cf.17.1775909458536;
        Sat, 11 Apr 2026 05:10:58 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38e495b4e73sm11906291fa.41.2026.04.11.05.10.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 05:10:57 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 11 Apr 2026 15:10:25 +0300
Subject: [PATCH v2 05/21] dt-bindings: dipslay/panel: describe panels using
 Focaltech OTA7290B
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260411-waveshare-dsi-touch-v2-5-75cdbeac5156@oss.qualcomm.com>
References: <20260411-waveshare-dsi-touch-v2-0-75cdbeac5156@oss.qualcomm.com>
In-Reply-To: <20260411-waveshare-dsi-touch-v2-0-75cdbeac5156@oss.qualcomm.com>
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
        Bartosz Golaszewski <brgl@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2190;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Z9LTIc7mkl8iWxx7biEWKT9WKaSV6D0MGLZPFj17wto=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBp2jpF1TANS4p4rX2cYweDRiiHMA7RoKoPoC9QX
 c6o/e1yVUaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCado6RQAKCRCLPIo+Aiko
 1WtSCACBJdPTyjoXeeXSRIv58J/lofWPnpp5jcJnhszneW6J3/v4wsakJe1FN4+zbnjl2MKC33B
 3+lRHRCxFd8vDAnxX/Wq1+XDBWttO/OaDi6H3XkM+sVPw9Mv1IjZG9gz/MJEQslATnIDIcS0qwH
 gi15MoN40fxlT4HKJcXm3zy2OFJkRtCW6hXWSc9rxGFEtPQ6pDHqGB+/P0tQ/XqiFFQBAQuP7iT
 0GkJp9b9LGX4casWhIoZLMNZ26WsXarMBsGL/Wjex9ATiKgCQVDH9BpwtYZBQ2RcY475rEMhOwq
 bzXo9vmAyMLfZt5hPeVTyuZamNjIyXMFbFa0vU1K3JyeZY3a
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDExMDEwMiBTYWx0ZWRfXyOwhD8TIF2Va
 +o4pjJd/kEfEDsSzcg+gwbIu8lwPtlg7laAQ6WCVRUtNH9pbzItp/s/IjiPtjDdt/s+EBWh211u
 XwqWhkgvugLJGmXt87E3HQfd5GN0597b/SuyfKYPkxohq4jPWrS6qy86r3dbLrITGucbVJeBW28
 2l/88kKZ8nQSjqTeZpEO/9Ot25DauCMBN89pAI6O686IqMTv+Gxb9YvQtihCdJJkNHZA8e6zQtu
 ITAvLdNdOL0oq7rjo4n8fo36w+i62VJ9KyBGG9u3tRbW1r7IfApODtXiVWXKTHH+/tlm36/klmf
 CFFgtu0L9CLqZNvRLyipcWhlyljydDXYPOezhZ+sOK1pLXghfjIofVkHB85ti4Y1vGr1eZeltL/
 NQb+noa7eyAR3FWVfdBpLUMM0IyAk+IUBo3p1c+djCgO1dhy2F8zmNw/NbtVTkPx018eXUEM+i0
 NKhitvIh7XDjwJ08AUA==
X-Proofpoint-GUID: ogqjIZBZmjUhiwMP-OejUnJm4RHV16qY
X-Authority-Analysis: v=2.4 cv=MqliLWae c=1 sm=1 tr=0 ts=69da3a53 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=QaDNpyu5kUm-e7c-h_IA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: ogqjIZBZmjUhiwMP-OejUnJm4RHV16qY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-11_03,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 impostorscore=0 bulkscore=0 suspectscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604110102

Add schema for the panels using Focaltech OTA7290B controller. For now
there is only one such panel, from the Waveshare 8.8 DSI TOUCH-A kit.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 .../bindings/display/panel/focaltech,ota7290b.yaml | 70 ++++++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/focaltech,ota7290b.yaml b/Documentation/devicetree/bindings/display/panel/focaltech,ota7290b.yaml
new file mode 100644
index 000000000000..f2f6e254b7de
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/focaltech,ota7290b.yaml
@@ -0,0 +1,70 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/focaltech,ota7290b.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Focaltech OTA7290B DSI panels
+
+maintainers:
+  - Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: waveshare,8.88-dsi-touch-a
+
+  reg:
+    maxItems: 1
+
+  vdd-supply:
+    description: supply regulator for VDD, usually 3.3V
+
+  vdda-supply:
+    description: supply regulator for VDDA, 7-10V
+
+  vcc-supply:
+    description: supply regulator for VCCIO, usually 1.5V
+
+  reset-gpios: true
+  backlight: true
+  rotation: true
+  port: true
+
+required:
+  - compatible
+  - reg
+  - vdd-supply
+  - vccio-supply
+  - reset-gpios
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    dsi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        panel@0 {
+            compatible = "waveshare,8.8-dsi-touch-a";
+            reg = <0>;
+            vdd-supply = <&vdd>;
+            vccio-supply = <&vccio>;
+            reset-gpios = <&gpio 1 GPIO_ACTIVE_HIGH>;
+            backlight = <&backlight>;
+
+            port {
+                endpoint {
+                    remote-endpoint = <&mipi_out_panel>;
+                };
+            };
+        };
+    };
+
+...
+

-- 
2.47.3

