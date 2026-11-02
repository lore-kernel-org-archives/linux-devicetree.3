Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793628255;
	b=UAuUuMnndCiXHo2Fmx93cYx98eueRBuUMZP+eRBJVhI+ZVWF+qh0CX1p7s5G3H9gZOYu
	 lCEr47wuYbaP7O7QrWLlHGCgGraF9gtZ6bR0WFkhoVNSYCdqfqmv3SE3gZ/Q7r0mhuwBK
	 MsdcSQeyokbVhnlCfJTkSWJ5Zz1b1e1bgg7rIMDKuL+G6vsqUnr/uTD22DQm1SqYYYZ+l
	 KfBshMzDPZoo1YC6go+aqCJNK8+xQYBk9zEbmdzS2yTUAZ/0yfEwi/gfgwS35Clc42n+3
	 WUu1qSP+2ZMKVsFSSbf03VPBEzmBvihmWBo8o2S4utAs7Y+v1PtVlSX++ML0OAMZ17w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793628255;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Dag14m3h5gt5hwrihR8wyiBARY23IaTWQ9lhSc65Xxg=;
	b=YGG/ump9bxdQsFYOk2ZCzipsAuWdW07b3qxYYlFPGs1Z9572XoJlg/Qrv3woZ9nRQ+4f
	 GO2krItxAAbn+KkfNsnQneBonjHRx2Og0l1Dn0OTEi+lXsmruFlz3DByY2BfY7XaGxvmn
	 5404rU9sHzB5aFppjU4w8DehDuDzqxZdUiK4azqlacfzJ41HELQ0+VwHv2XTAwhhPQDYJ
	 C0loS+XSm3/9bV2WiZIaVyrb856A8DCRrvmdrZyI+YqxaeYK09JWMIwwZ8EBtSP9j9SY7
	 JWH784MqwRhTC1Lu7klNy4dbuECphrXS1CLS9LenA17lDAjSYfq/4o23/zObo283Elw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AmGnfcRi;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PCu3lvAc;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72EB360A260E
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 14:04:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 72EB360A260E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AmGnfcRi;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PCu3lvAc
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2DpOqA3715852
	for <devicetree@vger.kernel.org>; Mon, 2 Nov 2026 14:04:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Dag14m3h5gt5hwrihR8wyiBARY23IaTWQ9lhSc65Xxg=; b=AmGnfcRidw1WtTb2
	/QPiyYNMjZPVGchsRWQhON4B9Pv3fhbtVlN7nwekiFs5KCThHj8jidECAxqnQjnT
	rV/ttEOryTo4DSdlAnDPHqyk726P9FAYQShHoqpKV8w+zn1geS/zUCi0w8APOG0G
	EyapIi8V9k+WrPCSl3vvZjQe0qVL3oo1EQUsd6084zPRsiG/QJtBPj0Z8Tr6E1Tv
	nfyAcJpwV289YSFhWrxB6a9rYLLGIfW9YEC8TVmj7iacdc6IsZF8TlnfTggPEZXA
	trcPOQb9qn9gRRc7ma6ImIYjUHyeRpICYf6F6eA8BcZnod7jPwdkHwjnN2x3gwHS
	aJ2aLw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpka6248e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 14:04:12 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cd61bdc8683so1544277a12.3
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 06:04:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793628252; x=1794233052; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Dag14m3h5gt5hwrihR8wyiBARY23IaTWQ9lhSc65Xxg=;
        b=PCu3lvAcU+YdJuK4r/F+Ab7Dt8yEM8k/WzlSEBXFoQNNHAcDXWgYJImJarjsnGfx30
         cNJu/BeOex5Osl5YQA8twYGTQKoDG/Ljxoh2dSnBdZ6bEEHjJHHL++ebwWUX4VcA8GHi
         oBhl7JkzCqjOr3W8LnfD4xk26f0UFDs+e7zkOFV1pId1fI9I23ZEUFcCf6opq7mNIANZ
         arI4VufbHE0n7pqfXr2hXdlKHgb0adzBFxVxz8ytQfJSM8JaY/hjWYDUpmU57PJY6i/T
         jZZacXYLrFnlf58eeHSQfqfLngDhjrnURr9tNOz0KTjzAk+oUFwEvWVQDyQI6y5K2rkN
         qrNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793628252; x=1794233052;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Dag14m3h5gt5hwrihR8wyiBARY23IaTWQ9lhSc65Xxg=;
        b=cdyuQoV+UavVkAhw7Hg9fcZBJNw3Womskq5sj4hepm+S9y53umsmsXNkdzGxW0jE5+
         nNyVzzE2FtNKHKPmQaDvkxzvtel5BXXGsoMvp2y4GGWaz/TziMv5froVHmpy6lhFj8Lo
         OqFMz/nWtH26uog8KD3BUGFnkzrRrdjS9y4Bqrjfxn+wvjrH3sHgS+3EZordepRe79Ij
         ouuvqIm+iEF2DzglUpV5Q2EpHYqHyc/QQVOiywrDpK6RUdJVFPWzTFHKexws3gdXndAh
         WlQ5qk6qqBKN58Ff70fxdLp4wm2sd6RXplR2TFFSW5Q018PynAxjetucvg+2kcbTPwvu
         quvg==
X-Forwarded-Encrypted: i=1; AKwUvByRbLl9SoVR5aEolPvYyPXPl5jvJENDF9WeVYihiiw5mPnt1eIMCfQxq7aU00eIa8W4FWS1CsTtGE8Q@vger.kernel.org
X-Gm-Message-State: AFq9FYKILN9Kwh8LYk//hMIT/CKn4i6NUl6wM5MPOcFv63gNZBFMdmlu
	uKFmCvo2Z0q5f979+C5I6rVBLLzXFUZW0beUhVT3jenDeqz/Rh2L6gcNl6bOpG5xRjR2VAxt/eQ
	7N2fCkWz5D5f7x+Mp8NxuPFtMwsrBs0IZeASPIHnrCsOvZ2ggo1sz6nFwLLKeDvL3
X-Gm-Gg: AYBFou3kFULGopVtj9luzlgyBZD2QS+1yHxt/iJnAk3GBMCx0bORBZJmc0oTlJQZRjm
	0MxtJqbdr0xHP2Cs1HUB2WoexbiAwmR/zZlNirz3eukuYk4B4rTWL0+GPnelk4o/32VtSJxE42K
	2pipEeG/3ZWmD6KtLsf64QYL9c2hwyA97mG3+KXDsagyeYO2+wHaHiDYR+LjVmaj8W6sRAAZwJG
	gCdYSyDE0TqESh0IfwBYjAj+VX0D3VjLvCLG6kepigI9zmOIOHbxO3rz30SWnk4zZNKsgF+x5+S
	gFoQTbcnPb74EqotkSwuD5j8EeAtmP7eJmS6vgzfwEQNUEj06PnyN4Z0uY8YZfiUMJQmECa54+R
	Yjd/tnFF3m4jJc+zV+aA2ESFGgX8R05e30S+TvZMNES4lgZ5Y2N3SUL+IniHPMykIeHxlyu4a6y
	g=
X-Received: by 2002:a05:6a21:496:b0:3e1:7249:e265 with SMTP id adf61e73a8af0-3e928d46829mr7631056637.27.1793628251828;
        Mon, 02 Nov 2026 06:04:11 -0800 (PST)
X-Received: by 2002:a05:6a21:496:b0:3e1:7249:e265 with SMTP id adf61e73a8af0-3e928d46829mr7631011637.27.1793628251158;
        Mon, 02 Nov 2026 06:04:11 -0800 (PST)
Received: from hu-ahari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8aad77fd956sm2286942b3a.3.2026.11.02.06.04.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 06:04:10 -0800 (PST)
From: Anjana Hari <anjana.hari@oss.qualcomm.com>
Date: Mon, 02 Nov 2026 19:33:41 +0530
Subject: [PATCH 1/2] dt-bindings: mmc: sdhci-msm: Document bindings for
 Nord SDCC
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261102-sdcc_scmi-v1-1-244dbd893051@oss.qualcomm.com>
References: <20261102-sdcc_scmi-v1-0-244dbd893051@oss.qualcomm.com>
In-Reply-To: <20261102-sdcc_scmi-v1-0-244dbd893051@oss.qualcomm.com>
To: Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Anjana Hari <anjana.hari@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shazad Hussain <shazad.hussain@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Nitin Rawat <nitin.rawat@oss.qualcomm.com>,
        Ram Gupta <ram.gupta@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-ORIG-GUID: nPuAJOaD6HNurUtqSU98FluR0VcC5KaI
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA1NSBTYWx0ZWRfXwN20IDtv8v2C
 Epy1gfcGMuf0IoJgQMaig7uml+3qdWmgaU+54kOHH3DrA/mhN/RNs31As0QLt+MJmEgHnMjo46G
 3W85bvp1M6gXNJtwl07hMkYyhxX95eI=
X-Authority-Analysis: v=2.4 cv=ZbyIpcVA c=1 sm=1 tr=0 ts=6ae8985c cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=o3jdfBYt8dMtDUvNEAUA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA1NSBTYWx0ZWRfX/enm9BMzbUlZ
 NFLwqus0s8QsWeAMN2T+LZqmOrxoIGT8C/mYanWrp2Qwwo+ya335D0vpZ3XwHHSToYiL2Nrfr54
 IPPIHu7UtYdjp3F8eP8RFbWebLh/+FdBGnN6ojO6Uq3uWIb7RMbYmuFT38rTVfqvla8yU0do3uq
 oJMOywsbkxBuA9URT+KWXr7EszDk2i1Ao+VnEFRTrNEeyUELQKF3HqvPRhlp9Wgb3EMKGkN6ssX
 2ESUcf1SFupbR75+MPDQVO0K4ijWi2mBL82tO3/j5DPYocfZJ6NFtzC8q1vNjQt3WlD7wg7g0ko
 6A9gyj60oFTImtrRCLJmAusa6WPuvj1gEQfvPBBLYUC87yX+liHvfREtU2IFFU2zsSaGaDde19h
 2Ko+IuNSpyNeiMk2c3kkEvtG7HBagOt2G9wBnF3x22G3ps4aM8xSkYV7x05EEivSBAU3ZYigEgD
 3Du8PnSh3N9sQpK5VPQ==
X-Proofpoint-GUID: nPuAJOaD6HNurUtqSU98FluR0VcC5KaI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_04,2026-11-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 malwarescore=0
 phishscore=0 adultscore=0 clxscore=1011 bulkscore=0 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611020055

Add Device Tree binding for the Nord SDHCI variant of the Qualcomm
sdhci-msm controller, where platform resources are managed by firmware
through the SCMI power protocol rather than being directly accessible
to Linux.

Unlike existing sdhci-msm variants, this binding does not require
clock, interconnect, reset, or regulator properties. Instead, platform
resource control is abstracted behind two logical power domains:

  - "power": controls the SDCC rail power state. The kernel requests
    power-on and power-off transitions via the runtime PM framework;
    these are forwarded to firmware as SCMI power-state messages.

  - "perf": exposes the supported clock frequencies as OPPs populated
    dynamically by the SCMI perf domain driver at probe time via the
    SCMI performance protocol. The driver selects operating points via
    dev_pm_opp_find_freq_floor() and dev_pm_opp_set_opp().

Both domains must be listed under power-domains with their names
declared in power-domain-names.

The compatible string "qcom,nord-sdhci" selects this variant at probe
time and causes the driver to attach the two power domains via
dev_pm_domain_attach_list() with PD_FLAG_DEV_LINK_ON, ensuring correct
suspend/resume ordering between the SDCC controller and the firmware
power domain devices.

Signed-off-by: Anjana Hari <anjana.hari@oss.qualcomm.com>
---
 .../devicetree/bindings/mmc/qcom,nord-sdhci.yaml   | 89 ++++++++++++++++++++++
 1 file changed, 89 insertions(+)

diff --git a/Documentation/devicetree/bindings/mmc/qcom,nord-sdhci.yaml b/Documentation/devicetree/bindings/mmc/qcom,nord-sdhci.yaml
new file mode 100644
index 000000000000..c512628617b0
--- /dev/null
+++ b/Documentation/devicetree/bindings/mmc/qcom,nord-sdhci.yaml
@@ -0,0 +1,89 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mmc/qcom,nord-sdhci.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Nord SDHCI Controller
+
+maintainers:
+  - Anjana Hari <anjana.hari@oss.qualcomm.com>
+
+description:
+  SDHCI (SD Host Controller Interface) present on Qualcomm Nord SoC.
+  Clock and power resources are managed by firmware through an SCMI
+  server, so no clock entries are required in the device tree node.
+
+properties:
+  compatible:
+    const: qcom,nord-sdhci
+
+  reg:
+    maxItems: 1
+
+  reg-names:
+    items:
+      - const: hc
+
+  interrupts:
+    maxItems: 2
+
+  interrupt-names:
+    items:
+      - const: hc_irq
+      - const: pwr_irq
+
+  iommus:
+    maxItems: 1
+    description: phandle to the apps SMMU node with SID mask.
+
+  dma-coherent: true
+
+  power-domains:
+    maxItems: 2
+
+  power-domain-names:
+    items:
+      - const: power
+      - const: perf
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - interrupts
+  - interrupt-names
+  - iommus
+  - dma-coherent
+  - power-domains
+  - power-domain-names
+
+allOf:
+  - $ref: sdhci-common.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    mmc@b84000 {
+        compatible = "qcom,nord-sdhci";
+        reg = <0x000b84000 0x1000>;
+        reg-names = "hc";
+
+        interrupts = <GIC_SPI 261 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 227 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-names = "hc_irq", "pwr_irq";
+
+        bus-width = <4>;
+        no-sd;
+        no-mmc;
+        non-removable;
+
+        iommus = <&apps_smmu 0x1580 0x0>;
+        dma-coherent;
+
+        power-domains = <&scmi34_pd 0>, <&scmi34_dvfs 0>;
+        power-domain-names = "power", "perf";
+    };

-- 
2.34.1

