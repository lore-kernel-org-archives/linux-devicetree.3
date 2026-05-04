Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D0E3390CB5
	for <devicetree@vger.kernel.org>; Mon,  4 May 2026 10:07:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777889266; cv=none; b=JeZwkLqchEJHBv2a7io+QaR6B7zUkZiVh7RYa1hawgWhb6kjJl94hskuc4QtlnMizvloqxZqIWwSnT65al8bXGrgtxZGmg547d1W1f5vpKSWEyO5FRjuUHF7QffaQdWaapUwG7xSxRsrNQ0fLADsS5IvTk/jwvPBatGrJ7VfhOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777889266; c=relaxed/simple;
	bh=trMfGHSt7GP5rCiBhDJR31ViCd04lGLClOnUXczfWAE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RlcGzbKv7heaEs0lrPu6yXqI8WxbS7vANEudZNBknANcdesZdyTNfGcExS9E7g7ktCPU0glvuXyzvolnYdM9EPwFsya0MR3kX5Yds+4nQEcSnTg21RiKMFq5uuYnYsrbOfLe4RSyr8uaja5pEbSRp/wRjeqa6WabJwb6bhVnThc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ihFTx8jy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y1L7zw+E; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ihFTx8jy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y1L7zw+E"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 644A6qbE4005827
	for <devicetree@vger.kernel.org>; Mon, 4 May 2026 10:07:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	e9LF3qHhp4wFXOMFNpxuXixlpOU81cJpAtSlm607/ec=; b=ihFTx8jy/PdoYsSj
	ghIk6DPBV/des2FzmEV18aNDI6iq8VZQVg65A5fWc8HniJ3YkuoDM2kaiQDxVQxW
	UXOSMQXZH+JCN2ouQEAvH7MYvbIefQ8+KK8hSWL+hhAMBKu4v4G6GwK4A3SnrniB
	8q3I6ZCAT+v7HxWtf27wbb9/q9f6Lus/Wd60A5vS7A733UjEaj0dUNhTQHck9dT1
	hspHILeIIzI7TvnpcJ9bNpymr8GvV8+QNgnWCIgMurQU4yW0nJkmoApltBxtpocA
	WldUazvwrA/cIId10xh4fK47Kuh8qYK+PUR5YZKjmksAo0OVaGMRTEULi+Tsq3xr
	/xOPNQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dxsdw0045-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 04 May 2026 10:07:40 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50da529ff48so93494051cf.3
        for <devicetree@vger.kernel.org>; Mon, 04 May 2026 03:07:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777889260; x=1778494060; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e9LF3qHhp4wFXOMFNpxuXixlpOU81cJpAtSlm607/ec=;
        b=Y1L7zw+ES3uU6NHmthwT1lNzFgqezoZl3GTcSNP8ikTphCfcYkUDZ/gGEohcRMHaA7
         VNHD+NIv1Dm4+BCwAjGsVrkHo2Wv1Y0kbmkuOCpUB7NhjIximQ8dy61Ws4q8Nqq1TDNN
         BqJQIIvUe8LFsMAryHCr4oqtDoCLaTUTPvic7MIbBXroE5YcnRez0nr15HZEshOddhnh
         I/vRK318hiM73ifujZzBa8TvrDIUGjqKKSgZr0BKi8nx6Ml1eVt3Yy3njK5GiBRjNCAR
         PB/Qw/GYTGAA4kGLX0rO+uJlnvYkjTo4Mps+zqjo/HXc2+McWch5zQozLh2xkQx9u3og
         yq6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777889260; x=1778494060;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=e9LF3qHhp4wFXOMFNpxuXixlpOU81cJpAtSlm607/ec=;
        b=rGuCqQ+VCo2QiobLJzWwjGTbxRcH5zpb9IGzFziJ8bXrn4ZLdftVQnoyGmIIEeULAn
         KAKuAztazuFgQZIvNIbGewTSDkApODQbiyzRlPmrJRtShiQxRL3UAI4i9ONATyrHRilz
         mYKgVSu7D2CN6kdrhFWFwjXyDmihtRWWSC2IaqmWFMDPWYYv3EzQ9UBX3UXEul2ysvPB
         CDRNJEPKWv1d23n+dfAdIrgHpU9LHUDGvQ2cgvyqXr4l4AovZFMpon3cz+0fMBiE/MZ+
         +O4Q3wdkcAvovG4wFJg8x3Sl1NnDQN9LekMZDJJsgsSk30KDYteNYwt2tpDZ/WH0H99d
         8wVQ==
X-Forwarded-Encrypted: i=1; AFNElJ8UDFvql4bTW6kojq+feaYaQ1rKE4XyCvvyXtC1G3UAUKrex/uxpd/mtS7UPxxI0QGErUMW+wr3/ies@vger.kernel.org
X-Gm-Message-State: AOJu0YycKL3897weaCY7OUGzkpHYopgI7CEPT9GrtPEOai+GgOemWh4v
	2q0VQncyeCsaDaj2Q3T7rnwnOtxFteYsPhc9sZblFoZ2MpH4ZzvRPOv54m0Wu71R7QxOT2WUiHG
	34dXCsS+heV2vZq4INklW1Vu6vEjm0clFHtLXo/Lt4RqzdQeupOEjt97O+Z7vG6BN
X-Gm-Gg: AeBDievYYK+6vcUMkRfMxR1oM6GRaPOlw7y0K6C1yRRKsigb6HxRMFJcAZxqQMKtmMW
	0F7Go696nyJXjfNnBBtlzR/7IFqTwMinPo6apQeCGKDa4x2tKgPszc7aZWgKZZvSXgolDnSE7Hw
	48Yutpab+VgI0lnMvCRojcn3L53AI8HXx7XDLCexzNLedMbNf7xv+RX+H1xcaJOyalCrRA4GOjL
	DjcruDkeAuj/jRpZwr2GoG5J6oktIiRAxYciX7W/xbFp9U7ljrzz4cA1p70T1SGNdZvQiRgiAOo
	Xpr7GuZ5VJWAqqP3OdXGX2Yd6Z4dtyP6UXkCnfN0mE6Q0paXud4jRxWN78wayLUyhNKmyXFfm7L
	J56E8vxfUOs0ZwxhhpnM4EK6Hy3eT49j0U6XJ6RVI+UKpt8NWj7VkpIoFUeuwbw==
X-Received: by 2002:ac8:5749:0:b0:50e:5cea:a519 with SMTP id d75a77b69052e-5104be0e3c4mr121964421cf.12.1777889260367;
        Mon, 04 May 2026 03:07:40 -0700 (PDT)
X-Received: by 2002:ac8:5749:0:b0:50e:5cea:a519 with SMTP id d75a77b69052e-5104be0e3c4mr121964061cf.12.1777889259804;
        Mon, 04 May 2026 03:07:39 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:56cb:50e1:b507:63d9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-44a986aac01sm23400860f8f.31.2026.05.04.03.07.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 03:07:39 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 04 May 2026 12:07:25 +0200
Subject: [PATCH v4 1/2] dt-bindings: pinctrl: describe the Qualcomm
 nord-tlmm
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260504-nord-tlmm-v4-1-ccaa731ee8b3@oss.qualcomm.com>
References: <20260504-nord-tlmm-v4-0-ccaa731ee8b3@oss.qualcomm.com>
In-Reply-To: <20260504-nord-tlmm-v4-0-ccaa731ee8b3@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6088;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=trMfGHSt7GP5rCiBhDJR31ViCd04lGLClOnUXczfWAE=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBp+G/lntquQ/FJlrPT2ekNP4Wlia3Jwa71xuKBD
 JtT9StovxWJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCafhv5QAKCRAFnS7L/zaE
 w75GEACoRAvsFoAA+ft0q9vYNbjklsu0fLsrse0mjySd7qXxrVhCRS1gkrGYOwz83y15+BCkaAA
 oMnY7oJt+33SL1v9EX6kGT/fmYIyg6vx67Sqa1tYWyFI59vwWd/y4lZbpMsVJ5Wr4Vo8C85jgwz
 vWx/ZVIzMyyqtjfjvxmKkGcFTjLp6kEx44RlUkcXCM3UL7XRm5KixM6oj9UFgszu3lE8mK6oK58
 akJFOfXSCVec2/6Eb4ES5SS728bQY4UILGviMwuFa5qAYeutn41qAq8jk15/1bgIEQFAPeKj4mu
 i2wDe0Bz1jQdCRiBedP41ql3Kov/PdYu9yGbhVqUKrFUI6YpwdzBhDX00YrvYAkWJyPN/4xr1jz
 fVcdpE76seMhx08QF2uabR980ebynCPas7eIBXdzoONGglUPoQlnUtjD3zyFPt6nBCfwRKf0PcT
 VxgveI2aDZgLyesUI/cSJkqtsBbppirov9ifUacpEx6Syf3nLpGXZtd6B5tP4OL35Yfnuq8+uxc
 K9Xl9rxCAe+qOUOVcxulOGKtjy0qg4rOz5Uj++xwFtVbBFVZI2zQPi7zmTRc4Ceutts9apirqFw
 +o+QwTe/bNFDx2Xr+0ADxQc2DsVkvH+00EEpm6iOs44BrZyfHbaUGW3NuMjDz+t2Mq9T3nmlYH1
 Vm8QyII3jh/Is+Q==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=a7AAM0SF c=1 sm=1 tr=0 ts=69f86fed cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=Ou3KgfM3KP2cLz_BwJkA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: clZYEZEUFMhdMrmKGacAVt5GaZULnDlb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA0MDEwNyBTYWx0ZWRfX0kffhR46jk94
 RgyLljviCblFZU5PWf7zVPPyOeVhEk1YvlDN/A+LPWwrvU5bjyxEJrsASS2jTKg+QoOwaRHS7Qg
 O+oIvB+3IJuPT+xghaqhpYauNmD8lFcA7Uwa1QCVhMt9Bhuz9mG1kWUbAe3SHrN+r+yvdszj1GH
 wOECMROwMwOx5MXChd3cJKlrZ/wDcJwFWvhfC3m4VMAnR5z+hwkPum5V1Y7rKtcb7XiJciVgxFU
 aPEvbt2MuVvIbNe1SGX+/Bd139jFkVCXFqA9OujHfjabUAxEFPngXy6jwkKhcsu2TmOGg2sOzcg
 ChgFBdCnqCL80htq/mtDnBMItNISQSQ20hm8g23WNa/d9d3//g5ZWak7C35fj020YU9jtPJloJS
 oexD/Cvy2kQHi/E9pYFOZVstaOSRB+jeRpRhvkQkw/FYG37DF/nEmu/nF1xlxx/7D5yWag1YmyF
 Xvs+QGF2Volir0wuaHg==
X-Proofpoint-ORIG-GUID: clZYEZEUFMhdMrmKGacAVt5GaZULnDlb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-04_03,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 spamscore=0 adultscore=0 clxscore=1015
 suspectscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605040107

Add a DT binding document describing the TLMM pin controller available
on the Nord platforms from Qualcomm.

Co-developed-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 .../bindings/pinctrl/qcom,nord-tlmm.yaml           | 141 +++++++++++++++++++++
 1 file changed, 141 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,nord-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,nord-tlmm.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..4bb511719f3130fc208011b4a8b45f4cfcde8c9b
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,nord-tlmm.yaml
@@ -0,0 +1,141 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/qcom,nord-tlmm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Technologies, Inc. SA8797P TLMM block
+
+maintainers:
+  - Bartosz Golaszewski <brgl@kernel.org>
+
+description:
+  Top Level Mode Multiplexer pin controller in Qualcomm SA8797P SoC.
+
+allOf:
+  - $ref: /schemas/pinctrl/qcom,tlmm-common.yaml#
+
+properties:
+  compatible:
+    const: qcom,nord-tlmm
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  gpio-reserved-ranges:
+    minItems: 1
+    maxItems: 90
+
+  gpio-line-names:
+    maxItems: 181
+
+patternProperties:
+  "-state$":
+    oneOf:
+      - $ref: "#/$defs/qcom-nord-tlmm-state"
+      - patternProperties:
+          "-pins$":
+            $ref: "#/$defs/qcom-nord-tlmm-state"
+        additionalProperties: false
+
+$defs:
+  qcom-nord-tlmm-state:
+    type: object
+    description:
+      Pinctrl node's client devices use subnodes for desired pin configuration.
+      Client device subnodes use below standard properties.
+    $ref: qcom,tlmm-common.yaml#/$defs/qcom-tlmm-state
+    unevaluatedProperties: false
+
+    properties:
+      pins:
+        description:
+          List of gpio pins affected by the properties specified in this
+          subnode.
+        items:
+          oneOf:
+            - pattern: "^gpio([0-9]|[1-9][0-9]|1[0-7][0-9]|180)$"
+            - enum: [ ufs_reset ]
+        minItems: 1
+        maxItems: 16
+
+      function:
+        description:
+          Specify the alternative function to be configured for the specified
+          pins.
+
+        enum: [ aoss_cti, atest_char, atest_usb20, atest_usb21,
+                aud_intfc0_clk, aud_intfc0_data, aud_intfc0_ws,
+                aud_intfc10_clk, aud_intfc10_data, aud_intfc10_ws,
+                aud_intfc1_clk, aud_intfc1_data, aud_intfc1_ws,
+                aud_intfc2_clk, aud_intfc2_data, aud_intfc2_ws,
+                aud_intfc3_clk, aud_intfc3_data, aud_intfc3_ws,
+                aud_intfc4_clk, aud_intfc4_data, aud_intfc4_ws,
+                aud_intfc5_clk, aud_intfc5_data, aud_intfc5_ws,
+                aud_intfc6_clk, aud_intfc6_data, aud_intfc6_ws,
+                aud_intfc7_clk, aud_intfc7_data, aud_intfc7_ws,
+                aud_intfc8_clk, aud_intfc8_data, aud_intfc8_ws,
+                aud_intfc9_clk, aud_intfc9_data, aud_intfc9_ws,
+                aud_mclk0_mira, aud_mclk0_mirb, aud_mclk1_mira, aud_mclk1_mirb,
+                aud_mclk2_mira, aud_mclk2_mirb, aud_refclk0, aud_refclk1,
+                bist_done, ccu_async_in, ccu_i2c_scl, ccu_i2c_sda, ccu_timer,
+                clink_debug, dbg_out, dbg_out_clk,
+                ddr_bist_complete, ddr_bist_fail, ddr_bist_start, ddr_bist_stop,
+                ddr_pxi, dp_rx0, dp_rx00, dp_rx01, dp_rx0_mute, dp_rx1, dp_rx10,
+                dp_rx11, dp_rx1_mute,
+                edp0_hot, edp0_lcd, edp1_hot, edp1_lcd, edp2_hot, edp2_lcd,
+                edp3_hot, edp3_lcd,
+                emac0_mcg, emac0_mdc, emac0_mdio, emac0_ptp, emac1_mcg,
+                emac1_mdc, emac1_mdio, emac1_ptp,
+                gcc_gp1_clk, gcc_gp2_clk, gcc_gp3_clk, gcc_gp4_clk, gcc_gp5_clk,
+                gcc_gp6_clk, gcc_gp7_clk, gcc_gp8_clk, jitter_bist, lbist_pass,
+                mbist_pass, mdp0_vsync_out, mdp1_vsync_out, mdp_vsync_e,
+                mdp_vsync_p, mdp_vsync_s,
+                pcie0_clk_req_n, pcie1_clk_req_n, pcie2_clk_req_n,
+                pcie3_clk_req_n, phase_flag, pll_bist_sync, pll_clk_aux,
+                prng_rosc0, prng_rosc1, pwrbrk_i_n, qdss, qdss_cti, qspi,
+                qup0_se0, qup0_se1, qup0_se2, qup0_se3, qup0_se4, qup0_se5,
+                qup1_se0, qup1_se1, qup1_se3, qup1_se2, qup1_se4, qup1_se5,
+                qup1_se6, qup2_se0, qup2_se1, qup2_se2, qup2_se3, qup2_se4,
+                qup2_se5, qup2_se6,
+                sailss_ospi, sdc4_clk, sdc4_cmd, sdc4_data, smb_alert,
+                smb_alert_n, smb_clk, smb_dat, tb_trig_sdc4, tmess_prng0,
+                tmess_prng1, tsc_timer, tsense_pwm, usb0_hs,
+                usb0_phy_ps, usb1_hs, usb1_phy_ps, usb2_hs, usxgmii0_phy,
+                usxgmii1_phy, vsense_trigger_mirnat, wcn_sw, wcn_sw_ctrl]
+
+    required:
+      - pins
+
+required:
+  - compatible
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    tlmm: pinctrl@f100000 {
+        compatible = "qcom,nord-tlmm";
+        reg = <0x0f100000 0xc0000>;
+        interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
+        gpio-controller;
+        #gpio-cells = <2>;
+        interrupt-controller;
+        #interrupt-cells = <2>;
+        gpio-ranges = <&tlmm 0 0 181>;
+        wakeup-parent = <&pdc>;
+
+        qup_uart15_default: qup-uart15-default-state {
+            pins = "gpio147", "gpio148";
+            function = "qup2_se2";
+            drive-strength = <2>;
+            bias-disable;
+        };
+    };
+...

-- 
2.47.3

