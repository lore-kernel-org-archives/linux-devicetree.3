Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794538239;
	b=pXg/qFI9Ar0vwDYbSS4kNMExmpztZ+3A0rrGT7D4/v48Dd5nzJSIotcterWloBiy96Og
	 vxZsLflZfYjQXpuWDwoTUhLJ5l1HlVjZhBTgjhSig6A40K0l114By7v/H6Y6YnX1hojyd
	 CAlJ/LMRH1m4XolOoCd1+V155mCrM3k1+fO5cdSNpHi6iAElCAJyIHCB2GKdVpG53aLD/
	 aJnXB5H6zgtasOwIflRDglVYGQk7JdIchlg541QQODyKZRSkgnJqIDhAk4X/LJxFOBJHU
	 286Tyi52N26aCqWeq3AYbANs0bshPjXhScv8JOBh3biGB91cYfycR4E4aQLj+OWt+aw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794538239;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=g0+lG/T+afF4ySmlryIDom0iKLYnuD7FP3qAhyNGYbE=;
	b=K42tNRCkwhmf+UGyfRdXC1wfxc6uPNAielRHl8yMj0coB0LY6xwBhK1LxBY1wdl/rhac
	 huIIArk2RFzjddL82DUCZPT0+6MeYntmli0w0TBmV9kS4sgDRw4AUq8Pscx4pWHgpCaqJ
	 fpIUH9HHeTHKKN/FhvAss5M9+/7i6fwZcvEj4KYYxavsjvRaGVjzuVIZzNs1MHyde8z9f
	 XDTNJk2KPDwMEQ8kY8GRNZ2em7meUwa4UnnaHkrrhyVBPBPB87yQK6h9kLju/piiVcK7E
	 WQvm/6tKAWctCDVtkNqM2g/1GWJ85fDw+m30rnxYsW3eP6pQpcK4SoB4ey3lV8kobug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dMaPPvCh;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HMIY8L5r;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F79F606A331
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 02:50:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F79F606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dMaPPvCh;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HMIY8L5r
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD2K5nV2636692
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 02:50:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=g0+lG/T+afF
	4ySmlryIDom0iKLYnuD7FP3qAhyNGYbE=; b=dMaPPvChjPIWoGHE0eNbrKwZq4Y
	Rj+KhWx6ukFPAMbnpJ97J97ve250cZF8L17bcLjLyWFvlq1LNrmLXFqdiXr3B4ew
	ustXxhpuy6W01y337tQJRng3EDzf+m/afUxgIiCknQx8MsjY3XqZ2u8yKi1eUrFC
	A8ZR9Or+E629kp1UlSrwAK9sCg4CffflQlxH7xRbisZL9WFA5QwExUCriJmBuHz5
	0c3p9JVUL7lbg8LC7i0WJnEqSJdktT59vUluLU5PPSMK0AeOOaPqaDrhNJs7yQ9N
	5iFtO5cAGQybaOxrS9MYqTSxdN4k9XXeGUllfkQygsAvlzT1lWHrFhI2vjg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw6re4amy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 02:50:38 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cd60e4e8bc3so334651a12.1
        for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 18:50:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794538238; x=1795143038; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g0+lG/T+afF4ySmlryIDom0iKLYnuD7FP3qAhyNGYbE=;
        b=HMIY8L5rQTkrLfl354ACvCphqeTBTrMppMstoN67WwX9jhOUs8gucPchMbbq1GovXA
         8KBJ2NrLygq9wa+17Gbf9xPXXzYUpwKKFFcz6Bqvc8W4RhzSeInAYualuvGt6GeJMvdu
         xQdaoF27qttC4i4FD2tVuPRRKE/qRBi5UaBgH+77t8pPnsxhQhPxgFNgo8AgMBqzxbyb
         YOJPov4zyndTx4DhM/mFnapB40WOH3s77zGR5YgmZmW4SdXCf3McGd6ljfJWwTtNVt7m
         QCRuuqEn+Z/CgFx3o5AQSvcrkezmWznb5nfUg7c4ZBBOvgJqJ/nT1Bkfm5CSTCzmgQ+G
         fVnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794538238; x=1795143038;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=g0+lG/T+afF4ySmlryIDom0iKLYnuD7FP3qAhyNGYbE=;
        b=tAdCDI7RlFu78yiFYAZAoeiBbI636Gxjo/LURsmlRGTNzngLpzgGQU4TT8gUdyh1SX
         E8kqjxkcMVU7s2TMZVi4OC1jUr+cCVBG75L6EV6rDJXbFAIt9r6YA2HtLp2SHuLnBpKC
         FB/NvjBqIX6aOqW4cLXVboc/19nlfFVn6KhCjpiDy9v/LSJwueJ29vMnJ3q5m+QqBfGf
         QfMgZtgZ2NtD+bTBrblRp514A9FY0ogeFRbupdlOSmeRFuNeacVOXlZSMQYcYN5ltTI7
         1egIuANIpu56t9JFPODBdogrKUlRZbtWIvYxJAR2A3v18I8NutGH1Zh+xfhRnvuu5bAF
         dqtw==
X-Forwarded-Encrypted: i=1; AL+hErGi9g6r/cZO8hS0OfYF+f8CaUVhdRI/bP+tOgLQGDELPJooD+JFoOCZ6bqAAG+8So5zNm6USJsIJcA7@vger.kernel.org
X-Gm-Message-State: APuU4Z9IhZMm3FQsR6ftpYvBfkT1fghzMS3K8xOGXD+8yAd4KUHrGIQL
	0dfYVk0I9tnjJW3/F1b5N8uG564pOhsfV9sOC8et9IDr+hm920qi0UcVzDkafNxS9qHk09VNs22
	a1HDUEdGyHMOItUe4rTQX4+Nfhll7XTYlCI9qDGoOvxsblYKRMvippPnPbsrovEH1
X-Gm-Gg: AYBFou21NItR2UNwAAz/lpfL3ii/l2nJ50fznhT5mJOig+lhmf5oU/H6m+cLL6gqBAx
	7SYjUeVZE/ysMg0+LSsvkjqQGHTGsh53JmF7su+bRPDMWt1dCRznl5CYLr8ap+9Wyz8ojgUE/jC
	BrhXbdo/SiIgfB6BpJS2rLvPo3YyAkUT7NK+fQ7hWeZvW6UqSucervp88h7jjuSVe8y6Z5vLi5q
	BMzzib7OehMxTL+ggqNpNA8dJmFt6j8tYUxkNQYUKqLGtf5J48QUXX80NVQqaZDE7Y/xFR7dWzR
	OdRAyRcldf35LiurQgLuB/6GkOJB0QFkAO2SAsT8lKC6FeZC5Gxmazx7RqtKCOX6A9t8PeGzlhS
	gEfaLMtRU0RsyzdO1i1JwWRKOnruqRG/bK3kmV3cSuHwp1U5XZ35JsspILjRkp8FvuNAh147Ytn
	dclbW5wgk=
X-Received: by 2002:a17:903:3845:b0:2df:4dc5:e12e with SMTP id d9443c01a7336-2ee0decfddbmr10972675ad.27.1794538237718;
        Thu, 12 Nov 2026 18:50:37 -0800 (PST)
X-Received: by 2002:a17:903:3845:b0:2df:4dc5:e12e with SMTP id d9443c01a7336-2ee0decfddbmr10972345ad.27.1794538237107;
        Thu, 12 Nov 2026 18:50:37 -0800 (PST)
Received: from ap-cloud-sh02-lnx.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ee0fa0b3c6sm3044435ad.68.2026.11.12.18.50.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 18:50:36 -0800 (PST)
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
Subject: [PATCH v17 01/10] dt-bindings: arm: Add support for Qualcomm TGU trace
Date: Fri, 13 Nov 2026 10:49:26 +0800
Message-Id: <20261113024935.3173715-2-songwei.chai@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261113024935.3173715-1-songwei.chai@oss.qualcomm.com>
References: <20261113024935.3173715-1-songwei.chai@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: 4sMjNdP-eDVB6hlM2cBpW0mgQ5LQDevP
X-Proofpoint-GUID: 4sMjNdP-eDVB6hlM2cBpW0mgQ5LQDevP
X-Authority-Analysis: v=2.4 cv=NJhAaE6g c=1 sm=1 tr=0 ts=6af67afe cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=gEfo2CItAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=N3VNWiZ0WD7Ir0aJMQYA:9
 a=x9snwWr2DeNwDh03kgHS:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDAxMCBTYWx0ZWRfXwE8vtZ3BGo5q
 WVIhmIMKW8DdUqkEeFwxvPu5K6tcdlfdnmZnOrlHwMl5SfPysIS5z7XKWXphyDIh8WMtFFV53tA
 IscPs0ECLlj3RNGl9dnHh4q48H7O/pM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDAxMCBTYWx0ZWRfX9rsMTmh93KXR
 hB+JTUwxXkJtQ0wFS0s294kkQZB8nLsL+HgJm+rX80j50txIxrxC6GoU3qDTI7sALRg6z1p5B4l
 8cxAWFWKr9ncOU42+dGCskv/0jWae9/8uAFJXNDduW3H0IsWmS5Nx0m8ifeMlgb6UTwFXQjDuAj
 5JI4nNKyJGx+oSKVlAD/DedGvtQWBCU+doQXQ0y8oFUbmsQyGjW0QRejQon0u3mDAVNwYjQBRJT
 5NVrdMaQNBijKS7qXq8PpbFndOQT3XNvNLKkShtkwAizgtoHdok85szzf004vAzDs5oupBAnpoZ
 G9sQycryKhiIzbDqfjHpPuspyri8KtR5G7rG6EMTpK12mWa2w7U8jZtA1V8qG7wJYPE02zm02mW
 dCgDwmSuFc5ixh8eeaNaCE0wk3gHstclVgDQtSMt4FXUc77xs/I+SzmZkewKo9sqNeM+RZ8xTq4
 oRT1iST8Fm6nSfqKZfg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 spamscore=0 clxscore=1015
 malwarescore=0 adultscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130010

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

