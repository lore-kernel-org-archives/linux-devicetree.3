Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794900803;
	b=C/vsy/HCh8t5IEw8QGvQbUdkAp/0aYfOVEiH0dDGq+xgEWcV1a0cM1RXxg2PcXsHm1vu
	 uc0YiZhpF5NNKbYycQDbr41Voa3AcDT9O5IQ9XO8Vq8LJrCD1VLhMOVbygXnWUjMPuRyq
	 KPV3M6MFl4vWBh7RY97cwzV5o5+ObCm2Q5VuYMegNJdycWRslbROLaZvDYCr7g6P0CFe3
	 BS08QixlKHNGP0v2W8AMJKuR6GlqF+EglSPeaMjnQ71AuzUbqYKGaJFHg1GZA1UvojNFS
	 xuwsoFmq01EdDnGwBYKd4heyWQ4pBLHcSLo76dO4jbHc0XZsCBIk95fxT2XoEPRxLCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794900803;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=g0+lG/T+afF4ySmlryIDom0iKLYnuD7FP3qAhyNGYbE=;
	b=zhDr/pOpk6yqkWLBcmJ5/tMtyzd0HHsv/ypKQFWuKmqUbzGpxbe648rxLpw06tqoL52V
	 BHYy9zs8g5bAn89wym0oJVrA5xDeqxU4HJ85dte5sLTiRg9QztYCu0ipD7U62+lBH+6bZ
	 bzFXDeYBzfdNZe9y/wHVIDRFf4FGsThosMWaO+zHvq3IEbI39Io8sT/sMxjlcEW34eyKG
	 20Y7LUBH3L/c8Yg00dmn1vQf1NMSVcoFAJYHLUJEe6Zdfn00ggTLSzC5mZ1jYcXux8B7Z
	 cloja/2C+l+eUkkgawam+wducSCPxU54LhYdryltbqH+hPGYv6dK1ysyL41JWF/fqsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AIA0+3yF;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KY+yerfM;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0FA9606A329
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 07:33:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E0FA9606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AIA0+3yF;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KY+yerfM
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH6LgJ13980592
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 07:33:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=g0+lG/T+afF
	4ySmlryIDom0iKLYnuD7FP3qAhyNGYbE=; b=AIA0+3yFYr6iy7Nswix4qKnXpl2
	quVLQcOVke+g2SmYUuONiFX0dvabXwBiROhLFNlGVLcX7J2p6DVOW3Af70XuT5mu
	4m0lwP97HIRmsWf+PFZp8sos+Hc93hsYrDt3hqvqWNTQvU7TjeB+bQ8b9w9mzSsW
	2JRKWSthrWNA5eai8dKCfk3UBzMokuQt/C8tsjj6oXqCMsiTL5EdrZ3Ymrwgzqq3
	QIff81j1r9HOTjcYktoo0IfGymZcT5PkxoKXU/qE9EnG0uVKLd3A+nQAtL1xWCr0
	zPT90strtf9YmpraUhJqKnrLy8rV1BQk9kow+AnBcr3gYpwFZ9NHaCsKY8g==
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0hkd0882-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 07:33:21 +0000 (GMT)
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-85c1135c289so3031797a34.3
        for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 23:33:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794900801; x=1795505601; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g0+lG/T+afF4ySmlryIDom0iKLYnuD7FP3qAhyNGYbE=;
        b=KY+yerfMymD5JUs3uFHHEgNhBZRwCpSzintLTSl2UecT5IQWaz48u3eHX1smIHLenm
         9q7Y74H69GjyQzq2V81SFvMpyQ8iS0i9BEpiowwlcwGHX8VTYNQnb7i4f+g3syAtFwFA
         CpNdol+KUz7EecN+EKCKVhuO1Saf2DqYGl3OV231aA+ErcrV1II5stLf3gl79irpL8hy
         d83IUoAg92+6bdOCEyHW0i4/bKsIdC25lvBLHmzOQYJm6maa74criu5bah5YLsAlZRlT
         JTbp0sHnnhHnUW1vkrp9EEqWTX1hLHZ5oJBxqgKDWfOL9ISZ2Ke2Z7dmLaTFRDvl9f6j
         RHhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794900801; x=1795505601;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=g0+lG/T+afF4ySmlryIDom0iKLYnuD7FP3qAhyNGYbE=;
        b=yzcTpPY4fPSaywUJmT8n42ldNgQASZlbiEp8otPKh3jfI5ykxzkup8rQxF4Ev4HNc6
         +y8rLVoYu3NeaqTz8WghVcWfZTaS8hAPN2gDj6m4cf5QiRZyC+9haVSeHJJ7bb3lO4yd
         8Z7vzzQAAxcW5KvMYYp8YSHDrSlKJEQoAg9HFnLwgEpzzoFaMCEVa/iTAxoo0E0nXwzx
         Qgp/mJ2fGlR8gSFowxhtYie6CBSPivKyD3B7QHdizL+DrrJXR3xOZ/sCaXz182mIbxBf
         FTWQH2gXz0wmOBrOnA1T7dRRoRJ0+gQ6iaQpvljBYFYQV+G0LIPSHWfy1b1EmqmmvWD8
         NpSA==
X-Forwarded-Encrypted: i=1; AL+hErF0bNnvR+8vQgBSXyes3jyMIAEJFL6Eht62XkJBARMZET3VH7d8eyRCqhk/LKPWeVzPfwnLibhTc8hI@vger.kernel.org
X-Gm-Message-State: APuU4Z/tOzxQSrWvjekj/3qpsPRnnz05qN5IooxZvpPdNG/b2c8eC8bt
	A1N25r1aT8jepNUlqlf3EvUaCJHoAHyfiRtNuEmsVzrnMCBeDulFzova+4ABUJkr7ENse0idv56
	/WuxB7jEvg3qNfJLB7pMT6yxLW268n0kR7aC+RtTY/kh+K1uhbs6dC+Imnt1lfIiK
X-Gm-Gg: AYBFou06SKHimFp4CI1BIEDH0egMBaJwaQR3rsxTfop4mfTE83oxMJxxcG4GlEiHaPA
	lwbUjT0K4vSicmgp3aZseWF4nSPSqVd9lphg5yvmjyXCBtnx7whjg0ebtGQ0BsCt4Qxmorl+gQu
	72ikyYCjZ1yaH49yCMwxh9vLzTsBCRwwbGZGjMC+8qd55s593twOPCGtvcAebJ007zr3wOlL9rQ
	FWbUWRZDRmshAg55it9inbMcyBtbmrC7OrTGSAktdOsYt1m9XM7c5ENbUqdsIBCFe/NfKTafTRu
	zLqEssO7+VGoirisV/H8KBMnosMx7Bszef3qlZcziVVGEwDR8dwhoFaSgEFU6bjvZmtANnRyh//
	AFugK2pw2j91R4fgbkqLGOX1C7BXru7e+cb3cFPVB8HUxDmj7cdBKyTAGwTelA5JWB6OaAmPx96
	yv27tQ6wstT16lHHXzWTCPJBG0VqUnoal2zQ==
X-Received: by 2002:a05:6830:34a1:b0:862:a48e:24d2 with SMTP id 46e09a7af769-862a48e257dmr9070438a34.15.1794900801212;
        Mon, 16 Nov 2026 23:33:21 -0800 (PST)
X-Received: by 2002:a05:6830:34a1:b0:862:a48e:24d2 with SMTP id 46e09a7af769-862a48e257dmr9070422a34.15.1794900800721;
        Mon, 16 Nov 2026 23:33:20 -0800 (PST)
Received: from ap-cloud-sh02-lnx.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-862c67db8basm4944508a34.13.2026.11.16.23.33.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 23:33:20 -0800 (PST)
From: Songwei Chai <songwei.chai@oss.qualcomm.com>
To: andersson@kernel.org, alexander.shishkin@linux.intel.com,
        mike.leach@linaro.org, konrad.dybcio@oss.qualcomm.com,
        suzuki.poulose@arm.com, james.clark@arm.com, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: Songwei Chai <songwei.chai@oss.qualcomm.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        coresight@lists.linaro.org, devicetree@vger.kernel.org,
        gregkh@linuxfoundation.org, songchai@qti.qualcomm.com,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v19 1/8] dt-bindings: arm: Add support for Qualcomm TGU trace
Date: Tue, 17 Nov 2026 15:32:58 +0800
Message-Id: <20261117073305.3854951-2-songwei.chai@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261117073305.3854951-1-songwei.chai@oss.qualcomm.com>
References: <20261117073305.3854951-1-songwei.chai@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=eqFKXYpX c=1 sm=1 tr=0 ts=6afc0341 cx=c_pps
 a=OI0sxtj7PyCX9F1bxD/puw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=gEfo2CItAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=N3VNWiZ0WD7Ir0aJMQYA:9
 a=Z1Yy7GAxqfX1iEi80vsk:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDAyOSBTYWx0ZWRfX3CqOn12IJPe7
 C2grU93+wT2jq3duuMzqSTyoz0i9rgWnxzaT9+HbTOiY5U/3R2uM8uIsbgfDOTxkK2aBei36hGu
 t+DMcimATgzvSgUyd4ca/WIJQyDdCb4=
X-Proofpoint-GUID: d9PyUnXQEStabN4c_9bRj0ekFhxdqCaM
X-Proofpoint-ORIG-GUID: d9PyUnXQEStabN4c_9bRj0ekFhxdqCaM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDAyOSBTYWx0ZWRfX0jdYSg7D6QWQ
 aN+dhopT6RP9SOoIWtFoZN/DCrr6Cmv14V6dng5vWrdghZlWAngONV+hCxmBhh2hpnqsAS0E5bW
 4dasw98xFRzHRlHZRiwD87Ehuh1h5AtasRSHviUZgLfJXyswi5jEyeN98HCLv1yozWl6kotKqIv
 O32T2/D0R6pDGuMfdGGqtqh+Utqu1o9jyoWqgvpqhjZcfAMoSFRlbBjVu0BmNLwwl2Feb3ObDDh
 wVdiApwdOem5Qwhutqn2Tzy62xMbTsFBNXCnFLVg2LzR6bZ0SeoiM433ZCwt+CpsF2ZIFor2qb7
 5+mT+81XObJENWspGNQ7e84xRImcj8hslBmZ6saG7mbL+QvT747ryxKf8+iB2yvWF0ROIC4nl56
 h5huWRJvw0km8BtPUngR7d0KsfprQMzYhz6tyc0U+OMAJRLU0XIt7E6CWs9qJzh3IUxAXqFpWW9
 SxLCW1tx4AUaUTRYQBg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170029

The Trigger Generation Unit (TGU) is designed to detect patterns or
sequences within a specific region of the System on Chip (SoC). Once
configured and activated, it monitors sense inputs and can detect a
pre-programmed state or sequence across clock cycles, subsequently
producing a trigger.

   TGU configuration space
        offset table
 x-------------------------x
 |                         |
 |                         |
 |                         |                           Step configuration
 |                         |                             space layout
 |   coresight management  |                           x-------------x
 |        registers        |                     |---> |             |
 |                         |                     |     |  reserve    |
 |                         |                     |     |             |
 |-------------------------|                     |     |-------------|
 |                         |                     |     | priority[3] |
 |         step[7]         |<--                  |     |-------------|
 |-------------------------|   |                 |     | priority[2] |
 |                         |   |                 |     |-------------|
 |           ...           |   |Steps region     |     | priority[1] |
 |                         |   |                 |     |-------------|
 |-------------------------|   |                 |     | priority[0] |
 |                         |<--                  |     |-------------|
 |         step[0]         |-------------------->      |             |
 |-------------------------|                           |  condition  |
 |                         |                           |             |
 |     control and status  |                           x-------------x
 |           space         |                           |             |
 x-------------------------x                           |Timer/Counter|
                                                       |             |
						       x-------------x
TGU Configuration in Hardware

The TGU provides a step region for user configuration, similar
to a flow chart. Each step region consists of three register clusters:

1.Priority Region: Sets the required signals with priority.
2.Condition Region: Defines specific requirements (e.g., signal A
reaches three times) and the subsequent action once the requirement is
met.
3.Timer/Counter (Optional): Provides timing or counting functionality.

Add a new tgu.yaml file to describe the bindings required to
define the TGU in the device trees.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Songwei Chai <songwei.chai@oss.qualcomm.com>
---
 .../devicetree/bindings/arm/qcom,tgu.yaml     | 71 +++++++++++++++++++
 1 file changed, 71 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/qcom,tgu.yaml

diff --git a/Documentation/devicetree/bindings/arm/qcom,tgu.yaml b/Documentation/devicetree/bindings/arm/qcom,tgu.yaml
new file mode 100644
index 000000000000..76440f2497b9
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/qcom,tgu.yaml
@@ -0,0 +1,71 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+# Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/qcom,tgu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Trigger Generation Unit - TGU
+
+description: |
+  The Trigger Generation Unit (TGU) is a Data Engine which can be utilized
+  to sense a plurality of signals and create a trigger into the CTI or
+  generate interrupts to processors. The TGU is like the trigger circuit
+  of a Logic Analyzer. The corresponding trigger logic can be realized by
+  configuring the conditions for each step after sensing the signal.
+  Once setup and enabled, it will observe sense inputs and based upon
+  the activity of those inputs, even over clock cycles, may detect a
+  preprogrammed state/sequence and then produce a trigger or interrupt.
+
+  The primary use case of the TGU is to detect patterns or sequences on a
+  given set of signals within some region to identify the issue in time
+  once there is abnormal behavior in the subsystem.
+
+maintainers:
+  - Mao Jinlong <jinlong.mao@oss.qualcomm.com>
+  - Songwei Chai <songwei.chai@oss.qualcomm.com>
+
+# Need a custom select here or 'arm,primecell' will match on lots of nodes
+select:
+  properties:
+    compatible:
+      contains:
+        enum:
+          - qcom,tgu
+  required:
+    - compatible
+
+properties:
+  compatible:
+    items:
+      - const: qcom,tgu
+      - const: arm,primecell
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    items:
+      - const: apb_pclk
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+
+additionalProperties: false
+
+examples:
+  - |
+    tgu@10b0e000 {
+        compatible = "qcom,tgu", "arm,primecell";
+        reg = <0x10b0e000 0x1000>;
+
+        clocks = <&aoss_qmp>;
+        clock-names = "apb_pclk";
+    };
+...
-- 
2.34.1

