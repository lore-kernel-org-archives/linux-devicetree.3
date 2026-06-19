Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D2973B47F7
	for <devicetree@vger.kernel.org>; Fri, 19 Jun 2026 20:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781901573; cv=none; b=DLhECwjMcF0aorLooG9GrXch98Ugw7PwOSntHQZhbvJrlLG/woXndr70k/f1DjhFERPt9jvwLnwBN2tEj+kFjBX03WTtYWk5HCqNBjgDd1Kbc5egnjzDhSJPW4UPaMNeNyjgefoZazHrvRKuf10Flr8S/6AQcYIU+KtVY1oP65A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781901573; c=relaxed/simple;
	bh=703nbJ9+AremmpLmpfLaXhNDAPkhsejmF/gbf10YyyU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iLiXkducpH+cDbxYwyYPU3uT+prQJb3At2+a2aYdCUXTYlxdxQKXRVgGilJcdTpY1qi9YZw7XPxN9ssKiZSN9cKGcO1AezXsSp1cZyxeJdBfXYkEI/lKWSl34FN1eBl19wFmp2t+8LCOKcRsYv99vFORMvNOYE70h5z1wBIoLWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JH8LdBdN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=URZQ8S7R; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JH8LdBdN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="URZQ8S7R"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65JHVs2n1311045
	for <devicetree@vger.kernel.org>; Fri, 19 Jun 2026 20:39:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kVaKYynhspx2lTK7GMhim3cT5wvFl+yF3CrSCp59GD4=; b=JH8LdBdN4cxkZhqY
	WLjU25+wJmXS2Oym5uzycc29yXzLsKA6XH54ohHdMA1/Bt8GupVLK4dRcspva8O8
	rMEnxgeee54pHFH/TKdNMMZ2tO9Hhh2J1MwG1stGyqkwp1g14YoAYA+a8LfaRg5Z
	9/agjZZcu+DJYj56cFUJYvk98xno7aKw/naElE3LBZVJ5m/kDDG2mI/TWCHdvEOr
	U1ATF4R60Li616Utv3jOSOLneHvW1vS7lu+6tZjve1QaIdiZiC5dJJ/c8PUIRfmX
	a9lotuTeM1Fby/wwN63dE3//JswfaHgX/FXL3qiZnPJgFT2mQKzCkz2Jm/T6TRVc
	iPDWAA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4evp6scy8c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 19 Jun 2026 20:39:31 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8421ffff8a3so2788950b3a.2
        for <devicetree@vger.kernel.org>; Fri, 19 Jun 2026 13:39:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781901570; x=1782506370; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kVaKYynhspx2lTK7GMhim3cT5wvFl+yF3CrSCp59GD4=;
        b=URZQ8S7ROCIKIEZ+KjwOcFwYo74289NYZbaaJKYxXLSNoETDkXPHEsiE9SnEwbnLgm
         sdBh1gM6wZ7/Qexjj1niB0k6suopFxALRJ4a6jI/0UKV77DhsWC2MH5Dz84JYboc44o+
         mhXlWqKCHyOQ20iV6wXUm/ApTNfBayujBMXC860ohQZ01ZtX1cjIHHQPZEzNkIqsleqs
         gnwVIUJ06PvxIJ+oAJAaidLDjot25i2mpOx9YHgVuECpYtVRxZmvJpqcu6MH9udkNJ1Z
         bUZO5BZJDR5uJtHdvpF2p0I8vLfaFY2ULZbKLWjRrbdAZ3fMY5/mQu9hSuJWkozRARVW
         wJaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781901570; x=1782506370;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kVaKYynhspx2lTK7GMhim3cT5wvFl+yF3CrSCp59GD4=;
        b=nnXFULFjT2CZqWk8LrK+JI5Y0dYXjSqezVx/XQU7gayD1nrnT9qkqjP3fdD73QsQMB
         wHXJktk3x6zeruBD868kldZVZ3FOGnuXlJzC1S0g7puJHI48XC6nrUm6n4fJW/gmTrJD
         iTnezTmlH57Qi7yozrtCE6eB9smdpAnM04UH+ddhL8TS2o7pUUf1dzSvsAMJ4juTOI+n
         jz309h3AHUXeGjA2bGtXZnnieur5/Tkyoz0y/W9jXhZP8ov7WxlXGIBKEV+UcHrDbWcU
         aYpuFiDv1CdCgl1411sbmjr19wmo/z/TtXhxjRwF+uSCjAPFKQAMfV7U312Ts6WlzoVJ
         Rv+w==
X-Forwarded-Encrypted: i=1; AFNElJ+nJ6EviuUqtLwotlM4s1q6AN3SS/TucSCM9CaDnmhOVQnAaqNcCphRAVqKf1cMJrdHsHztI0gCKieH@vger.kernel.org
X-Gm-Message-State: AOJu0Yzc4c3h5u5HAILsH0WkTZq/kVBwr2SDoi/8D+0ZG3aPIXJ+l8JH
	eMMmlywKnorxeO8zO784SI7m7KNxTj7a+FYPueuttN/oPtb+WeijAJVBIDPtP5xz3V1lQdrOq4+
	FCS4klu8RnBqFTI4LO1ZHG6cNl9X29uL41sKCw13HGRsVC2V6tH50V0GLrrgSIcCf
X-Gm-Gg: AfdE7cnG0uBk0qxfaBrUWUioqs6heA/33h5ZD7D0EYJ2oDsllmx/6aPuybzdRnjxzzM
	FzPeMJxKamV5cBHC9TylQ1jgE1H3xXojyv+s/xE+rrDzInz7zsRk1QRlM5LSTzbQ6KOYcRPJ/Db
	P48epUxsbk8YyxfrwLdG5kQVN9baNVIuumzwhFkQUmZA/TwP2LLr3kZE6VPVbWYSUy3a5UI/FH0
	OrONLIjOxXSpWVRmATnYYesQT6SgrLACtFUqYAlsDiQWrLfmUU+BjUR7nzZG+cs2utvB9vXR7nf
	eIR1ko2gJQj5PwmteB10p2p7qy7Iikoy2fCL0Atgj5WCpn7QlwM+l1BdsfJh3gGONAF2+nj8nlb
	Xz477pyX2uwC94TKMiUtTMzmHqmgC5Fj87x8kbyc/wIaLoA==
X-Received: by 2002:a05:6a00:c8b:b0:845:1715:3b1b with SMTP id d2e1a72fcca58-8455616a5a6mr4495605b3a.35.1781901570168;
        Fri, 19 Jun 2026 13:39:30 -0700 (PDT)
X-Received: by 2002:a05:6a00:c8b:b0:845:1715:3b1b with SMTP id d2e1a72fcca58-8455616a5a6mr4495581b3a.35.1781901569661;
        Fri, 19 Jun 2026 13:39:29 -0700 (PDT)
Received: from hu-manafm-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84564ecd779sm94190b3a.53.2026.06.19.13.39.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2026 13:39:29 -0700 (PDT)
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Date: Sat, 20 Jun 2026 02:09:08 +0530
Subject: [PATCH v2 1/3] dt-bindings: power: limits: Describe Qualcomm SPEL
 hardware
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260620-qcom_spel_driver_upstream-v2-1-a3ee6837c18f@oss.qualcomm.com>
References: <20260620-qcom_spel_driver_upstream-v2-0-a3ee6837c18f@oss.qualcomm.com>
In-Reply-To: <20260620-qcom_spel_driver_upstream-v2-0-a3ee6837c18f@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781901560; l=2547;
 i=manaf.pallikunhi@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=703nbJ9+AremmpLmpfLaXhNDAPkhsejmF/gbf10YyyU=;
 b=+ZgHbBUKa235ZUbytlgNLfOf/qZmqEFOG1cpz5nUuF5rRNTu9E2ny3p5lRwn2iQ/OQWOd3atE
 NhECZb6q6N2D16SQMNyYMVxeJy1Zy10xk69myketaGkJRz8GBVMmSmR
X-Developer-Key: i=manaf.pallikunhi@oss.qualcomm.com; a=ed25519;
 pk=oZ3x9jh+FDyPwxHmCbyzEMQHMzKqrH6hUbbL7dEBe2g=
X-Proofpoint-GUID: M18YZ2eE1RQlhOKKfRnP_eaKG8ZKWSIx
X-Proofpoint-ORIG-GUID: M18YZ2eE1RQlhOKKfRnP_eaKG8ZKWSIx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE5MDE5OCBTYWx0ZWRfX6EarCDr77YGy
 Zr6ZJfz3rNUWWrUQVE8JBtvslBMOtQito18T4piyTIKFLBtthgOxudi/8mQ/ELK+KofmNM0vC9z
 aG7HtPLojEYpLe/lhyz3ciNW2r029zy4qsh6QLsbIWexIyAlnTEVXgmxAIpBn7/yLr1JBT4gjYz
 koImcwB6B+Yzl6HfXGWtYrORfByL7ku3Fd/aFYIQjeL3j9pX/mzB/KjYriYETN/5R8qPnImw+Mh
 KiXt0d2VjCLyjwDwGxp8kZIqh0MU/HfXzjcAYKEjIdIxFKXyViEm2yMXK9DneQQLDy6+72PugeY
 R2GcCVQs3IYGsB8VTNrZf709KwrLRT98iiMwcEQJHZOphzwMB2ZK+RYdstpjzjOpyCD5Hrk9gDc
 YIU2AW5YDZk8fgoUiDkCO7nNFaMvrMgRH1oWkuDI9YMdYKmud9RSLKuzuBZRsWzGJprz2t3epdN
 EpUOXSRafIzwAbzcM2g==
X-Authority-Analysis: v=2.4 cv=H6LrBeYi c=1 sm=1 tr=0 ts=6a35a903 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=j4VyU_MS_U4jYmp-Sq8A:9 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
 a=sptkURWiP4Gy88Gu7hUp:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE5MDE5OCBTYWx0ZWRfX2BRVBBh9MWu3
 EF2ayTBU2GnFPFA0c2ZgIIsk0pj1Vq44fcSywP1NyjmUt9DbMBegwKPjggARsY+5fk5eJ9TtQc7
 298GQWa6BU+GBW5+ctNI8g2Huw+bw1g=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-19_04,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 impostorscore=0 spamscore=0 suspectscore=0 malwarescore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606190198

The Qualcomm SoC Power and Electrical Limits (SPEL) provides hardware
based power monitoring and limiting capabilities for various domains.

Add a DeviceTree binding to describe the SPEL block on Qualcomm's SoC.

Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
---
 .../bindings/power/limits/qcom,spel.yaml           | 47 ++++++++++++++++++++++
 MAINTAINERS                                        |  6 +++
 2 files changed, 53 insertions(+)

diff --git a/Documentation/devicetree/bindings/power/limits/qcom,spel.yaml b/Documentation/devicetree/bindings/power/limits/qcom,spel.yaml
new file mode 100644
index 000000000000..4c6e6cbfbfe4
--- /dev/null
+++ b/Documentation/devicetree/bindings/power/limits/qcom,spel.yaml
@@ -0,0 +1,47 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/power/limits/qcom,spel.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm SoC Power and Electrical Limits (SPEL)
+
+maintainers:
+  - Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
+
+description:
+  The Qualcomm SPEL (SoC Power and Electrical Limits) provides hardware-based
+  power monitoring and limiting capabilities for various power domains in
+  Qualcomm SoCs.
+
+properties:
+  compatible:
+    const: qcom,glymur-spel
+
+  reg:
+    maxItems: 3
+
+  reg-names:
+    items:
+      - const: config
+      - const: constraints
+      - const: nodes
+
+required:
+  - compatible
+  - reg
+  - reg-names
+
+additionalProperties: false
+
+examples:
+  - |
+    power-limits@ef3b000 {
+        compatible = "qcom,glymur-spel";
+        reg = <0x0ef3b000 0x1000>,
+              <0x0ef3d000 0x1000>,
+              <0x0ef3e000 0x1000>;
+        reg-names = "config",
+                    "constraints",
+                    "nodes";
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 3dd58a16f06a..c63f147e8c54 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22233,6 +22233,12 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/power/supply/qcom,pmi8998-charger.yaml
 F:	drivers/power/supply/qcom_smbx.c
 
+QUALCOMM SPEL POWERCAP DRIVER
+M:	Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
+L:	linux-arm-msm@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/power/limits/qcom,spel.yaml
+
 QUALCOMM PPE DRIVER
 M:	Luo Jie <quic_luoj@quicinc.com>
 L:	netdev@vger.kernel.org

-- 
2.43.0

