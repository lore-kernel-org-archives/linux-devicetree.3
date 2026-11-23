Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795467316;
	b=yuSU/0SF0uT2vd5sm8a3gCPBuPkvLHyTJrZhqsZzpBvACPglf6Zx2s6G1/NbKiC69wAU
	 Z+J7pyqnlTQ+wJUK3pzufyy6sXqx99SLtEwKuzyNnv2aXg1m9ipexuTvsyxbGPCwWHyjY
	 NOtYUBmpcowSHTq36xcXG3NIFcjrvm+mhYp5KPJLQxAY5IShekduP+MWZ7RAaRsw0Tbc2
	 otoivSc0d8PeQ1L8czEhn0s4LGKA46Wz5+mT1s3ekZic5xZEFNfIfrlE7cquL0yxP5ik9
	 Ei42jugbmhA8p4UpdrGW3FhdCo3BsPCRfWa2lBIK5kknYZ5QquWsv7Tk8CZYcjR8yfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795467316;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=hZa6xQX6xlTYdwDzFzhntlqX7xZbBxURFfm+Q4ccyBs=;
	b=OElCplaxs8gEHPDe7sAczsLRIvRk22dicsA1J3+9NE0sUYpgAKadT+qkDmrE0J8MVZB5
	 TPsoRqjrSjvXs8UVV4lHcEvhQD09P4uXPU+3xWoafbDdHtoU8KvFE0Tzbmo8uWrRfh2Tz
	 cr9xptPWxMDMVRIsaXa7IVmjPbwkiwuk+SfNfeI7/LIK+8H5i6TLhtjy4m+M76JztDK0W
	 p7KNFuxy1RE1isHQcJiVBlWGm5rdNe8l15lV6GePAurApYV83cv8DLi04A3uZhKYN4mvf
	 lssR3vQb7VQySgRAnLcDiPgSsSvbObrANao8j88lzNbQ9GTrRzQzsYYfQNyW4VTQNoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QXiNt9oM;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Dym+IZCd;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1598F606A680
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 20:55:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1598F606A680
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QXiNt9oM;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Dym+IZCd
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANJuVnH720778
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 20:55:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hZa6xQX6xlTYdwDzFzhntlqX7xZbBxURFfm+Q4ccyBs=; b=QXiNt9oMEj0pLkFN
	L0LOpDZDLGuObJIIrJ81O2FypGASQAIhqE81QVk8MT4wMNfn1PxLkL2Ag45cxaww
	tTTA3gNkYE5icDZJELAyeK+pzfjnqVr1E3OoCcv2oj3drHg4vCKGSitTWenLP5qK
	eL+6yUKW5pMwr7kpL5IY7fXPDf8LXw0B2vqnTLi4guQ+XzDncp7kW40xq4lNrm4+
	UwM5Zqji16ndZS7cg1BJqwPZXPHUK64mnz9bpYLaDRGYJBY2mEuCCrCm7fXIW1Ou
	DzH8Qj39TtoWGvEMY1KXz+0BKGKXUtOdybtW+64XoWgVe+etecormu5eYCZoeuVd
	UW9DsA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4ukqgafq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 20:55:14 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3854627c1c8so5564653eec.1
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 12:55:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795467313; x=1796072113; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hZa6xQX6xlTYdwDzFzhntlqX7xZbBxURFfm+Q4ccyBs=;
        b=Dym+IZCdvRhMxRB4sy0ZQgpUSwB9pwernxOfBe0EWBB+8ULxwHlfGoxdorXYYFqlj/
         i06ltXsHBIt5YJBrR+NTVPVbddW9G8SlU9PEK75ZLT+8szbkj8tusAfhqizMdeb4uXjN
         T2a7uT9NjJx42INrQvcLI5WaMlN6Ein/ihPeQNQsijwLrYf7y+onJQClJh4trH5UemwQ
         p9XzCJ5Op6NtKAdTp2vlJsFozE+9Bg2RzTY/QRk3IWjjZe0XsHWZIy6+EpV5M7rBUt0h
         4tFy/uhp7vEuksI5cxl7mKOBmsvsSkw2dVY/DmiC/fGSAb0tXzu9H1JnPclcoLZ5hgjx
         WKFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795467313; x=1796072113;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hZa6xQX6xlTYdwDzFzhntlqX7xZbBxURFfm+Q4ccyBs=;
        b=gkSUYS0rwM4xKZrFZJr/ylH+SnbVNnWSe/MbLYkEM2knkp7pkY3W6NykX+wScvGYrs
         QGaYHGZON/C/6/WPbyzcQ1STyDgKsDuvL8uH5IIxj5E8dOVGmBZcn1oS7XbBJHgq3vTg
         B0fviSJhICqH+pnsfjOsNa/rTA6PuFlqc4QagGLwF04LpB3fzYQv4TGALUiYXPnaScH9
         0ciUQqYx4D5kdt6Qv7Km8cHsIWLrtpTkn0X5WtU9d9rKEjYqwzwoCbfdSIusGqOaiT+B
         WTOkFpFRDfHVvahZRczVSMg8AnRNtb1dnPZq4G22/wKf7sfnIT9pVP/uhl2CBb3Jv2E7
         Fnww==
X-Forwarded-Encrypted: i=1; AL+hErEEyvQkAbowRo/f51J2gr/eit1N3pH/f1+2pGS0Zyg5uf9BR9MIo9NmZ0F4uXR3aTsXKvdGmKPj2rSB@vger.kernel.org
X-Gm-Message-State: APuU4Z9ULT3W5dVzFGt+uo/bRIJUptIHdHSOYWQzQd6FGy7t9L61HZyH
	4z9Vr/N+QIfjo4TAlqV3uvmyASvKxtyX1QhABcmCNPgUC2GuYkrREu8ure7sEm4FvanYERWufOi
	NZpKEje09U+YAkN9o60QS5VnDsdBh11j2YAShnvu164jUpkESBOkPL0PuTzHJWCHX
X-Gm-Gg: AZFdTZc6LWX+NiBpImd9CwsdaBYlS2vk0aGCsUDezItX2cfjeSNLVVcJJ0PZXuBAXG/
	GXZnBYX2JpoglCjY82Zd9iYuwaX7fUYPhYO9mJnsEr8bjP8rhrP8JTzpjNLp0E/Y76UKcLIhlQN
	CIGg+X5VtYdsmD2PStMmJ4pL7TUubZysFdxcS2MEZfLUCJWPtnac9cDLW8rvE5O0Nhq4N96H1d8
	VNOCKMvNopWIsDIl2TQAD1muaU+U8eYsnKvHXrRFR6jFsabNuV9DTRtSo3KrgDg6vS/EdFl9m/J
	BZ2k1DhkDSDMeL47M4T2xy7bCDYLC8fT1bQZwitLVkYa4vrpo1FwLdBqZFMERxRCeREfbcVDxvG
	yQiK43ggpN9vZaheE6rLyIaBY4AVnUdph8yYjBKul6rs6hbCEENXWC2poNsRrmqsjxAGZrouc31
	6IvCIPTDDl
X-Received: by 2002:a05:7301:7107:b0:386:b494:8642 with SMTP id 5a478bee46e88-386b494879amr3280333eec.13.1795467312422;
        Mon, 23 Nov 2026 12:55:12 -0800 (PST)
X-Received: by 2002:a05:7301:7107:b0:386:b494:8642 with SMTP id 5a478bee46e88-386b494879amr3280297eec.13.1795467311875;
        Mon, 23 Nov 2026 12:55:11 -0800 (PST)
Received: from hu-manafm-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm44209077eec.26.2026.11.23.12.55.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 12:55:11 -0800 (PST)
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 02:24:41 +0530
Subject: [PATCH v5 01/12] dt-bindings: hwmon: Describe Qualcomm BCL
 hardware
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
Message-Id: <20261124-qcom-bcl-hwmon-v5-1-747d5383d538@oss.qualcomm.com>
References: <20261124-qcom-bcl-hwmon-v5-0-747d5383d538@oss.qualcomm.com>
In-Reply-To: <20261124-qcom-bcl-hwmon-v5-0-747d5383d538@oss.qualcomm.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>
Cc: linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mfd@lists.linux.dev, linux-doc@vger.kernel.org,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795467299; l=4396;
 i=manaf.pallikunhi@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=Gu1GpC+38HITi2Er9kUG2koMItBv0WwtKRBZ8DxvpQ4=;
 b=Spbejpz/DzxBNIumdqXhcY1cns0HOwt8l9EmATBgk7HpDuClz1ZxfP6Z0Wp2ogKQtV1Mpm8qu
 bWYnfeY2/GYANhoiYy9eR9GYJ4/X6rJA8hCPhbhF11cKueaKOJapzMA
X-Developer-Key: i=manaf.pallikunhi@oss.qualcomm.com; a=ed25519;
 pk=oZ3x9jh+FDyPwxHmCbyzEMQHMzKqrH6hUbbL7dEBe2g=
X-Authority-Analysis: v=2.4 cv=Wu++otfv c=1 sm=1 tr=0 ts=6b04a832 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=gEfo2CItAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=fehuZy28kGTF_x16HkYA:9
 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA4MyBTYWx0ZWRfX4ozg856111Dl
 R5z05J1WqgnFxB5Pb1RGXEsc0+QBKHp01NS+tvP3RsYE+r1L+FywhQ/6y210Q7NLGtWi0X/Rz/5
 VNmRYaHxzk6zuefQEls9G3zh4Aa98Q7e2f4cvKJ8N7kkn0AJSMMFv+G4FC4xXgCteyqMZXgkxQc
 6zJbMGA9LtXBlKRMUu1njMVc+mFFYxqVY7WLTgc2MWwlRFHWJAXZL3sSMPpqmpuEjAa2r7bTVNI
 fdkAZj5FE/mofF7T5aLF27lnR6r4diAh+yTyGit7jJSzGwA8yKZzmkChY9mWzFwPjsteDXvUvBW
 Xqf4IoRlJMke9ESD/leAolj5t+8Ux3HU1ui3HOAAxtXE9F1EqS5D4gMD3hnIht2HMwSaCaR0jVF
 V1n6lqoCrBVF4LQZ5tsZeH1E8JGWfaTL96r8WB7MVwZnl4+Dw+K2SheChA9D+++szwh9DA2HAjs
 3Ahq7MHL92eDorrVr6Q==
X-Proofpoint-GUID: KklrejRMeXhwF-kpoWhKHnE9i2045Pct
X-Proofpoint-ORIG-GUID: KklrejRMeXhwF-kpoWhKHnE9i2045Pct
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA4MyBTYWx0ZWRfX65YSFpKj9Q6D
 YvXFPLcc7xxXEhV9uLoqf/ge6lUudYCPODSs3Kapxvalyf7exzcV87lDNoQEwaqk6OBL2Sb8Fjz
 UICLunLzIUJoa4Dj56bU7EwK25ylPTo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_05,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 impostorscore=0 spamscore=0 adultscore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230083

Qualcomm SPMI PMIC BCL (Battery Current Limiting) is a safety feature
that monitors battery or system voltage and current to alert system
for overcurrent or undervoltage conditions.

It provides:
- Real-time voltage and current monitoring
- Configurable thresholds per channel
- Hardware interrupts when thresholds are violated

Add a devicetree binding to describe the BCL on Qualcomm's PMICs.

Add sensor type to SPMI device list for BCL device.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
---
 .../bindings/hwmon/qcom,pm7250b-bcl.yaml           | 72 ++++++++++++++++++++++
 .../devicetree/bindings/mfd/qcom,spmi-pmic.yaml    |  4 ++
 MAINTAINERS                                        |  7 +++
 3 files changed, 83 insertions(+)

diff --git a/Documentation/devicetree/bindings/hwmon/qcom,pm7250b-bcl.yaml b/Documentation/devicetree/bindings/hwmon/qcom,pm7250b-bcl.yaml
new file mode 100644
index 000000000000..2bbeb35f207a
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/qcom,pm7250b-bcl.yaml
@@ -0,0 +1,72 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/hwmon/qcom,pm7250b-bcl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm SPMI PMIC Battery Current Limiting (BCL) Hardware Monitor
+
+maintainers:
+  - Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
+
+description:
+  SPMI PMIC Battery Current Limiting (BCL) hardware provides monitoring and
+  alarm functionality for battery overcurrent and battery or system under
+  voltage conditions. It monitors battery voltage and current, and
+  can trigger interrupts when configurable thresholds are exceeded.
+
+properties:
+  compatible:
+    oneOf:
+      - enum:
+          - qcom,pm7250b-bcl
+          - qcom,pm7550ba-bcl
+          - qcom,pm8350c-bcl
+          - qcom,pm8550-bcl
+          - qcom,pmh0101-bcl
+          - qcom,pmih0108-bcl
+          - qcom,smb2360-bcl
+          - qcom,smb2370-bcl
+      - items:
+          - const: qcom,pm7550-bcl
+          - const: qcom,pm8550-bcl
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 3
+
+  interrupt-names:
+    items:
+      - const: max-min
+      - const: critical
+      - const: emergency
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - interrupt-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    pmic {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        sensor@1d00 {
+            compatible = "qcom,pm7250b-bcl";
+            reg = <0x1d00>;
+            interrupts = <0x2 0x1d 0x0 IRQ_TYPE_EDGE_RISING>,
+                         <0x2 0x1d 0x1 IRQ_TYPE_EDGE_RISING>,
+                         <0x2 0x1d 0x2 IRQ_TYPE_EDGE_RISING>;
+            interrupt-names = "max-min",
+                              "critical",
+                              "emergency";
+        };
+    };
diff --git a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
index 7a889d888383..2c3b60437982 100644
--- a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
+++ b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
@@ -197,6 +197,10 @@ patternProperties:
     type: object
     $ref: /schemas/rtc/qcom-pm8xxx-rtc.yaml#
 
+  "^sensor@[0-9a-f]+$":
+    type: object
+    $ref: /schemas/hwmon/qcom,pm7250b-bcl.yaml#
+
   "^temp-alarm@[0-9a-f]+$":
     type: object
     $ref: /schemas/thermal/qcom,spmi-temp-alarm.yaml#
diff --git a/MAINTAINERS b/MAINTAINERS
index 9cd098f0d91f..36a470c859a7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23080,6 +23080,13 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/net/qcom,bam-dmux.yaml
 F:	drivers/net/wwan/qcom_bam_dmux.c
 
+QUALCOMM BCL HARDWARE MONITOR DRIVER
+M:	Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
+L:	linux-hwmon@vger.kernel.org
+L:	linux-arm-msm@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/hwmon/qcom,pm7250b-bcl.yaml
+
 QUALCOMM BLUETOOTH DRIVER
 M:	Bartosz Golaszewski <brgl@kernel.org>
 L:	linux-arm-msm@vger.kernel.org

-- 
2.43.0

