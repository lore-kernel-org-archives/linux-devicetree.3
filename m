Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6778238910F
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 18:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784658628; cv=none; b=QoHfc/IWhfNpCNPitspld0ush4XHsOCF0KZLIGZboU6dwMeNFECcYnhmoYHKCIUWLnb1TxhcwZf6WniPl0A86ApbmMEpM298GCjQj/4HsJubcn+q1Bzx8qYaiyZmQEfNqwduTe405lr4RtUjWxJ/j6fZ6YrIdhDi1cPItsx2lwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784658628; c=relaxed/simple;
	bh=b9a5PaQwulyMEAGyhvU2MKGjOkiNZX2HfYvEScduVOc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VINyLSWLp1Ciheok884j+wSywWTPJM+QM8UGXnMzcGb9XJ3cmOqG/Wc9vFP/dGwdMQBqA8J15Jd5YCb6LNbXV1n8VbMNhRCeHAQyJ/PwOZMcypL5EDu5RhF2VXkFVS8KAZoeMYWuPbcdE4TBRmtbN0XklwLYM2aWDcwMjqAEHB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G/S1bGuc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZbKbor4j; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G/S1bGuc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZbKbor4j"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LHR8Aq2375959
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 18:30:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZcUSVHAQLB4Oa1L/bcj31gQ2efZME1ZB6SptlHBUYCw=; b=G/S1bGucD1G9eFFd
	tiNX8qpo8d0VxDbmgwy212f5p3jw7+nn2/6Z06gFy7JNgNDvVArvDF2VHmta6LFx
	wHEV0u4TWqf05VdLs2CLwqi5J442E8SGXAmHBtQHCX5pu6CTcLTZvHit7MVOBU6G
	YsJKLmD7wHjM4KCVKzr90jh/oZjxNKkGIIC9VdOK/c3nmZ9Xvhg1Sjvh6Gppf4kp
	ALdaDi9wChncqRNLZNtkS+h30VKlhvOc5TWrdbdQgJMRfoquMYMluL9oavU6mbA9
	GHWblzPlYbNSFC6nTYI6C/858NwyQ75e6Gbx7JybKC6bvPKHn1Bc38Fd92krr0xV
	V84NwQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjd6a89u8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 18:30:25 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cb5cc1e13f8so4883729a12.3
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 11:30:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784658625; x=1785263425; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZcUSVHAQLB4Oa1L/bcj31gQ2efZME1ZB6SptlHBUYCw=;
        b=ZbKbor4jyEBd39nWJn5rMQ0RiHbH+VHa53il5m2fi+3yw/ALDDNdJSAbeyULvNSf+c
         19dB1IY7hYjFgjGHHGX/hl0o2R5mANBC8Z8Kmc6tKgMSJVYTJkZB3x8qjRWx1YvcKMrz
         4XL6ddGmuAEcG+niJh6g+jo0nVazeRCnq4nR9xdErBHAkDv9vqOtbDksDLkBjQkNJlwj
         zqNyMb831P8g4Fmu6xtl9Deqk+7Gr+/2XeYRnMp+4lOl/hj8aTKgIGVcu0SLDAPYCzPy
         KWwT0sTa4NzRWojueapdCJHwmge8g83LbWkunuNjLqKrFuhJj4LOBhkkcUCpLnwsQjGJ
         JtvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784658625; x=1785263425;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZcUSVHAQLB4Oa1L/bcj31gQ2efZME1ZB6SptlHBUYCw=;
        b=PNIZ6Wl8l9rqaDmy561BmYEEfk3aXWZ2YrmzX6B6dCnpDMd7T15WL/YX1PxURs7Wi5
         MLYjS26qfQe42j5lte8ZKOUQQHLrXLWFrTBpaZ073OEi+k3dgKuVeFWhzBJSirt9PNpc
         2Jvj0LJ1j9+n7hz3ebX9t9ESM1sZJlewRCe7zHNP/Ms26t2k+4v61KqVjquayOSjpVM2
         GMAqDyw/dydXraXGVPgqbmzHR2x5EDXoinFo/wcTSAUKf13wH7asgxc0vHi3nw2tzVFX
         4FSScLM8Gx/whybP2odFFdFUTs2f0QT/Jq5ugGRLp40fNwkmm3ep3OgqPqHm0UhrOPC1
         4yMQ==
X-Forwarded-Encrypted: i=1; AHgh+RqQeSy/e5YD9ThSboyF4K1AJgAnWfWvMOmmDX54MCX6g1BhaI2o7DPqNry0luQaGoBvny4hILzgX/H/@vger.kernel.org
X-Gm-Message-State: AOJu0YzhJbkVbb6bvC/Uy0mxzXZcaL1jPUGdJ0Ce9fzEtUClamFCI8UP
	0XTllu4APaMB2bGn32pUPnKoDC28yAFXB0oxLYFfsF7sM5TfGy/eQieLP8Ti3XCsS0hQzoTKWJb
	FtAsiiz8FQuZNCSD6J8bUK/Lvb0C57mpD9z7SeeItsVxRoDudVBnQK6pH4IVYDVua
X-Gm-Gg: AR+sD13kziIL5fkebB8pERp/bMKMcoTqUaIgBJm4xzH89kZQdQrN+r2hzru6v87/a2B
	0AmjFjFIqXKM78Z6OOSLGTkLiApdPxRvDd/3WBBdPk4NJvqOYZUA2YvzqvVXVLi38WbD9YpCyGr
	X9q8J7olum5xc6ShB1sPaTKGGmfnNk/ZX36jtkRFF6O2QAD7ePbglI1e8LdlKz02LEfPQeOj8C9
	LgG4FYqRKkP3/NR9djqtggFfYkUDN8YfZwWbfkC7hBnaByFQcXf4hpnG8zjsG046rQk3v6aQw5h
	jsMdjIqFBzwVD4pqSfggpgttDR70pmLkEoUJUr/pjvG7xxB5/b+U2fcocU8AO8shedsXi6Sgfrg
	O7WmC1jxtzcBVZyXbss4jcEB92W7Fwb6Rhag=
X-Received: by 2002:a05:6a21:7d06:b0:3c0:b3f7:e5c9 with SMTP id adf61e73a8af0-3c3ad8b2ee6mr21172114637.36.1784658624672;
        Tue, 21 Jul 2026 11:30:24 -0700 (PDT)
X-Received: by 2002:a05:6a21:7d06:b0:3c0:b3f7:e5c9 with SMTP id adf61e73a8af0-3c3ad8b2ee6mr21172078637.36.1784658623979;
        Tue, 21 Jul 2026 11:30:23 -0700 (PDT)
Received: from hu-manafm-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147e1ca3efsm1185298eec.30.2026.07.21.11.30.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 11:30:23 -0700 (PDT)
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Date: Wed, 22 Jul 2026 00:00:06 +0530
Subject: [PATCH v2 01/10] dt-bindings: hwmon: Describe Qualcomm BCL
 hardware
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260722-qcom-bcl-hwmon-v2-1-febe2805e17b@oss.qualcomm.com>
References: <20260722-qcom-bcl-hwmon-v2-0-febe2805e17b@oss.qualcomm.com>
In-Reply-To: <20260722-qcom-bcl-hwmon-v2-0-febe2805e17b@oss.qualcomm.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mfd@lists.linux.dev, Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784658613; l=4042;
 i=manaf.pallikunhi@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=b9a5PaQwulyMEAGyhvU2MKGjOkiNZX2HfYvEScduVOc=;
 b=QiQ0MLK5GUhNM2tIBS1ztLjCQ5D7VflfHlSxdo6Ptyg7kwhU4B/3wF22jwBQWDnV4Xogoe3TF
 EIAlnYKZD4nAI1U+VYOL6mXNnnywMwvKwWyUfuG+nEZeAwfw/eGQwdh
X-Developer-Key: i=manaf.pallikunhi@oss.qualcomm.com; a=ed25519;
 pk=oZ3x9jh+FDyPwxHmCbyzEMQHMzKqrH6hUbbL7dEBe2g=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDE5NCBTYWx0ZWRfX+0UD//GGGqbQ
 EzLqqBAez/VbEBiZA/aDHdrEHlMa0jIh5V1qPOhJ6s+MlIj9PBqAs0EWAkkh874CWKt2JaXsKW5
 qSQDecXNiAKqZ9F+K6uuxI2C9bdbtUo/H4LR2oLp7ZnOL/hwA3W43sBaBzTKd5r+ZTPN+W7WWD8
 QCVNKXffwNuBGzCHW/vVbvkzdNubhPH0dtVUzTrud++Z+w5qhHqcy9sVLAQeU5Wb9lUOuyzsqaq
 RzI93hwnaVhG5iVobaz7karhrOsMg6ZrMUXLwpuWj6RSGFrJE8BkyuvGKo9KhCUASSqFBONwCNp
 /qfAuEvoa002z0GEMjtqk9g+IPsv+vUyIzRMjS+U+0kDVYBLMIlvSpzHhL0CaXYZLtoGAYBCU0y
 bGClc7zfTsQdS2DYOI8b+/dGxlBxWmFjSW6tjL3FXsyEvfbSlbAUmNlHm+mWSl8ABdwFNIaf08g
 VA+muOIuRGXzAHemuWw==
X-Proofpoint-GUID: BhplmjESbiGkWKutdRFkE4tI7kaspyTe
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDE5NCBTYWx0ZWRfX7jvBa9XS9cfy
 IINDGkRCBB2iPwC+jwq1qsEp6vgNMr7bu87JdMWeZBxu8vFyUvOjK+1eTKeCMlkqbg+3H3KaRw4
 cAsruQJk0V3BK4I5JzBMUf5Uoao7eQ0=
X-Authority-Analysis: v=2.4 cv=HvJG3UTS c=1 sm=1 tr=0 ts=6a5fbac1 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=mxz9luGGJ82e2KvUXckA:9
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: BhplmjESbiGkWKutdRFkE4tI7kaspyTe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_03,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 impostorscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210194

Qualcomm SPMI PMIC BCL (Battery Current Limiting) is a safety feature
that monitors battery or system voltage and current to alert system
for overcurrent or undervoltage conditions.

It provides:
- Real-time voltage and current monitoring
- Configurable thresholds per channel
- Hardware interrupts when thresholds are violated

Add a DeviceTree binding to describe the BCL on Qualcomm's PMICs.

Add sensor type to SPMI device list for BCL device.

Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
---
 .../bindings/hwmon/qcom,pm7250b-bcl.yaml           | 64 ++++++++++++++++++++++
 .../devicetree/bindings/mfd/qcom,spmi-pmic.yaml    |  4 ++
 MAINTAINERS                                        |  7 +++
 3 files changed, 75 insertions(+)

diff --git a/Documentation/devicetree/bindings/hwmon/qcom,pm7250b-bcl.yaml b/Documentation/devicetree/bindings/hwmon/qcom,pm7250b-bcl.yaml
new file mode 100644
index 000000000000..3c069e94a34e
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/qcom,pm7250b-bcl.yaml
@@ -0,0 +1,64 @@
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
+    enum:
+      - qcom,pm7250b-bcl
+      - qcom,pm8350c-bcl
+      - qcom,pm8550-bcl
+      - qcom,pmh0101-bcl
+      - qcom,pmih0108-bcl
+      - qcom,smb2360-bcl
+      - qcom,smb2370-bcl
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 2
+
+  interrupt-names:
+    items:
+      - const: max-min
+      - const: critical
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
+                         <0x2 0x1d 0x1 IRQ_TYPE_EDGE_RISING>;
+            interrupt-names = "max-min",
+                              "critical";
+        };
+    };
diff --git a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
index 809be2756a0c..3caee21a02ad 100644
--- a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
+++ b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
@@ -190,6 +190,10 @@ patternProperties:
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
index 16b73f5825d6..1b178d3a91ad 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22176,6 +22176,13 @@ S:	Maintained
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

