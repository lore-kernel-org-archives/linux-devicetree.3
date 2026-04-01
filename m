Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A63C37DE9F
	for <devicetree@vger.kernel.org>; Wed,  1 Apr 2026 07:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775028415; cv=none; b=h+/z1EPOZW9HG5p73s2t8RrZcZKgpJgQHB2dFFSp//17iY7H37EsDtpJ/Fi8vbrq+yGvFWubnBF/9fVoowBmVhdFeHYsKcs5NhZtSDW3EWwzQrIam1VTFNs9b8vmLHiaGY3RlKP8bHxPzyE5eGAoZUfoFs/oN2TXg62Quc9c9G0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775028415; c=relaxed/simple;
	bh=W2l9B2OwEz4Zivn64VXFY6OgAvWjgIUZq1Hf1pqff4o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RDRzteKr7TRPl3XdTmDofGMrVVkwVoJ920Q+OUpZ4o0m34hhxljBtMIYq+C9tg0UqczBs95BQfZ57OGNn4oLU8YFKKYneOEGSr6wG4PVjaZPJOEI056c48CwmTB4eHLVefnTAPniQ/kRYZVeCadDLi/XpA0MoBxwiey+lvnfG8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eyosuL/u; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AFBdqSPg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eyosuL/u";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AFBdqSPg"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6312IxOb1005237
	for <devicetree@vger.kernel.org>; Wed, 1 Apr 2026 07:26:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4tuSg4uKpYZ3ltK87EQx0c6H4sS4d6Dc+WdX7+gIALo=; b=eyosuL/uMdllbuoG
	OoXppU7EyRulzXAUy4g1IxpXBgRZ7mqTI9WNAzDCVx1Sg3n3TbIJIjzsBOtDx9/S
	UFiHtgNg7Fq7HBZrUshrXV+r6kbRb2eoHTf7ccch2MLJLE5C7rRKJNm3A+UTlXId
	14Z7nHtTCFkw6Fun9+o+xr2p++DDyIdamIlrCtdSls6IdkMoXBypdUgyfyH3v7/O
	WlfFLT8c8lo+c80/dTKtwyD/L24uBA9s5VX+f/yxA5GnHIawewCbvnZ5bqNcOCrT
	asmSA4TKsxypBcF1R+cD2W13YVkos0/gaDPFpyRtYhxMiAsONdBwW/5eqqa6uUEd
	hSkfVQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8tfjh338-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 01 Apr 2026 07:26:52 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b4b81c632so210616851cf.1
        for <devicetree@vger.kernel.org>; Wed, 01 Apr 2026 00:26:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775028411; x=1775633211; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4tuSg4uKpYZ3ltK87EQx0c6H4sS4d6Dc+WdX7+gIALo=;
        b=AFBdqSPgSI0jfFJkH/IBiDA9HA9/MnJesaYRLtDUCwoACWV1tg2+2kpgcVSUJ7HxOU
         lL3sSnicZfKIG7bORjD9XXP75ZWr0FVqCck+lCsYBJtZtQc8yGXOD6gs39Q08ho4ueD5
         GI6XL4Fd6xAjmK4y5nr5ZP4OCPkO9yBWt7H45w7yYvsQ32LUfs5svryCOTCG/lIzThyQ
         8kcdkR2NhVLv6Wj/1tT4RhVudNdF70p7+pt/eCOnV5LQH+7grgdx54tOA28fQdhWx36a
         WVmsjREDH2ecezCPcRAVN3kez4113n6CPujLObQ7M+VZSqUioOWuXjMK+hCjjYonAxan
         Dr8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775028411; x=1775633211;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4tuSg4uKpYZ3ltK87EQx0c6H4sS4d6Dc+WdX7+gIALo=;
        b=I9pFY1AqANeb+TlLZOvvBaamL5PvUFOhW+eyMglAfjhayeH2j7z+6ELy+4MTRdanNO
         DYa0bYhkylZQa2KWiq82c1XdAKK3uCs2r5SP3mAC6w5g+SuMBpZpPzEFV1l/mgfx3x70
         zDmQLuwHT4QER0pw3oLREbGj44uv0mr27SBdAmeDGFPneUh3afR+lIo/SY3WsNC7fJD6
         oJ6rQ5uKAMlEDpIsrlJB7YxdB9rK9XeFIiDp2OKLbzs6N/Z9HYa/FpU+FgLFX4qtz3Cg
         pVSx3WjAR9AnbvfKnr76BO8zr7eu8WnIXZAJYr4f+vP4hlmSbVNif5XllRcuDlkxnrXv
         l76w==
X-Forwarded-Encrypted: i=1; AJvYcCXQ0PCILEe11lViffe4i5hDIrepKOJTN2fuAK31F063+6A5mcFKO7wftqr6044E/OlK5ND4eUy+zs0W@vger.kernel.org
X-Gm-Message-State: AOJu0YyevHawjcmRA4Dm9wVv+/7vde6LkcYuaZZWpYAYpEnWE+uyG+mV
	fHEM9HndSWbs80r/tG4SLwWXw8buufJ/uNSjOvY5sTq0CviLvB+CZI4Bs540q3FZl4fcnpBfluq
	Dnl0eq/4x4gdAqiEYxnKfJ0nlBjp/XDNt1hQHsr8d2Uh4rmwrEalqpfWTAWqo7gLh
X-Gm-Gg: ATEYQzy6YPTbCCWlKWgTWRf+hBdGzBecvjmRzmowpS8uElpFj+sm4NhvOxAIThFVs87
	bLd93CcdAk1JeIGTJbBxfmbqBchSaPhNQfoAIKPu/iSGuzQ7S3XUZz5Uify7FxckfLaNM1wqCtk
	NilIv1kKi90Hrc3plEQww/vWBHY9yNaYIW+pMfSi9wjSYaGzvc5HdQ2KJDMELHnCoA6DJtGcZ0R
	vPJpcS0KFk+fB5PuJ6ZFW2nQkUVD81jVnUEukYZMMMpSbLeWni2Y+Ju03DCIQLVJj8DeZtgLbHK
	1FhskWBUdxGOVBTUMrgMdieKNwUFay6pHgJhIz4ULStGnnzhoO7vUQjBERPpGwzSjRK2Q2JlCzt
	uK0Jw/j6w7eA3T7ZhV3FUV9t6BQR0/GxyHT4QyMY2ETOQbTje1x31da09XNF/GHwoNi9yXhQVh3
	JIx0u+xgbXFSQoBHoWmdD+sESXbiVnoPzeVbc=
X-Received: by 2002:a05:622a:1a84:b0:509:cbc:127b with SMTP id d75a77b69052e-50d3bd5731fmr33063251cf.60.1775028411377;
        Wed, 01 Apr 2026 00:26:51 -0700 (PDT)
X-Received: by 2002:a05:622a:1a84:b0:509:cbc:127b with SMTP id d75a77b69052e-50d3bd5731fmr33062941cf.60.1775028410903;
        Wed, 01 Apr 2026 00:26:50 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38cb9f31972sm8638421fa.12.2026.04.01.00.26.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 00:26:48 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 01 Apr 2026 10:26:24 +0300
Subject: [PATCH 05/19] dt-bindings: dipslay/panel: describe panels using
 Focaltech OTA7290B
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260401-waveshare-dsi-touch-v1-5-5e9119b5a014@oss.qualcomm.com>
References: <20260401-waveshare-dsi-touch-v1-0-5e9119b5a014@oss.qualcomm.com>
In-Reply-To: <20260401-waveshare-dsi-touch-v1-0-5e9119b5a014@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2192;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=W2l9B2OwEz4Zivn64VXFY6OgAvWjgIUZq1Hf1pqff4o=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpzMirhSCbwfrsUoindh5tIcQpjN2BUzdd9VLtD
 N3aR28c0wqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaczIqwAKCRCLPIo+Aiko
 1ep0B/9Y4MLaoQn9Rs+aojsS9sQIFOYrYmuNPvJk/MBys5hamRAKdl8Ug9esCtE8LDpcO54zQgf
 8dwQKQv7MEmw9ymrd/RtBHQfwkXrdrBapeENdwYUIqxBPowWtbUB7uCnIn2LpKusg8zOs7OCD//
 ALY2OrArJG8tDkU3qH9ICtLT4Gya7cF7W1D0aemlxB84yeakbCGNBYECnmZUQchq1ZXiGvAjKMy
 uIvwL0DbQc7EABVZp2uiII1Ne/cgGor57MYp77DLY+zp2xoomZ0tSvfNntiVriQF0TGkPc+Qh2l
 ipCZylqfWFDSTXCGnc1R88jr2BwkVPa+8mWlQLNH02Su/m5K
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: qKbI4w8Ypcp1lAY080QRrEqTkf0ME_7a
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDA2NCBTYWx0ZWRfX1Zgasa4X6WxR
 IJ5Zpf9glt/Nku2jtKfAGGeYmPzG9fG4VlPvyZcDSdaTdpAzgwrJZD9C4yXr4THeluI6q5+y8xT
 KjpoEEUWuHFFx+fKn5V5SHBjrQ3S5Tnz7J8y/aK+Iu17XSyEzOqRXW6ekZeS5fd1Ewa7ZIQBG5J
 HlzvXsQ5JGLGpzWAT4wYd/jxZj8RlDKBhkpUHT1EqqQLohaj1oBXf/By8Leqc3tI4yfVo62/Q3g
 P3wTZ1bk0AQcgEsiZR3FStxr+gOyMuG/Ll+DW+j4R0kkorA/TkyyjFvu6ZeL0e7aiMy1rHjxCP4
 Td7Wkp9KzJhai4vctH9ruK4hbFTfvYDjHiIFUlA8yAILhMoRQ8W2lsuNpwpi4+PFwQVAEdFk6sQ
 ELIZy96zajGGhFuU8s2z47QraWbJ4m4KlVVljvyAX7aeh/mAXZ7JUi4YUEb5AUEwc6X42qqI4B1
 7qgnRXr62QXO+mvs4hQ==
X-Authority-Analysis: v=2.4 cv=fJc0HJae c=1 sm=1 tr=0 ts=69ccc8bc cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=QaDNpyu5kUm-e7c-h_IA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: qKbI4w8Ypcp1lAY080QRrEqTkf0ME_7a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_02,2026-04-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 spamscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604010064

Add schema for the panels using Focaltech OTA7290B controller. For now
there is only one such panel, from the Waveshare 8.8 DSI TOUCH-A kit.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 .../bindings/display/panel/focaltech,ota7290b.yaml | 70 ++++++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/focaltech,ota7290b.yaml b/Documentation/devicetree/bindings/display/panel/focaltech,ota7290b.yaml
new file mode 100644
index 000000000000..da5237404dc5
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
+    - const: waveshare,8.88-dsi-touch-a
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

