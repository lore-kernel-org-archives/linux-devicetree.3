Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE19049B5C9
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 18:45:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790102705; cv=none; b=Yc8P5V1VKNhUrQPh8E1HyWgY6fPhbMsQ6RbrSDycORWlPu1Q0jMMDAlwuvmU9lu8RR829WwX/q0XQ45f4fvLLxwGjcCo5NPh4Sz0S+h0+VLc3We5mCmT2EjrGlQxFDCS965bCU7Xo9BvFZPZWawur0+ilvlUGeAooT464OHAZIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790102705; c=relaxed/simple;
	bh=IHl96VfDfSLC8aLKVP1o5N9BHbNNzUMjoemjAMwnB/4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HJumobjLHAYeBL5yjcWZKDFy3fnY9KiYcDodOSqGq1S+YMMEwL94i98qNhTPa26UCDYFfZPSRnRkBxPfezJuHnx6BQdALNIgL/39b1HFm+NLDlyhMJX97NUciG4w+nCEWfsXsQjE7M1F23Ka5S1y13fVaBs8cNcAqCsFwuUwoNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FfqWqFB3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CLqJ8NXP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FfqWqFB3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CLqJ8NXP"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MI6rSb178647
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 18:45:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=eEmsPPYN19I
	2pfZSXr0Sunn8u9Ec3DlWKgauxQhoZ6M=; b=FfqWqFB3ULldsfn+q7fem/Pbrq9
	x/eu+G6pJGRmDai0e7nNnha634ATzEsQb9o/9mISrYBVq0V3WPqscFv21CRLfTEb
	emS+cV3LVV1sUSm/UECict73J8jl0/QTTY9KBEhcIGb+q+VwIuEKrg+99dcRclW4
	2z51dsmdgQH7bclEIa3ZVcHAyOZESA6g210xkidhb8qa0j1OlyS4AGsYHP+RJtP1
	otXdlDWPUC9AVNDvOvLKZ/XUgT8mJtKTyvqmZ1RvWouNCrEkcqr3Of1BVa6VYQ0n
	7LSHUh5bRQ/wiyFAimKqiCxhO4fUeVIbvq5swLLqo7lZ2sXXASE8/BlFgNA==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guuec1cr4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 18:45:01 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5c8337b12d0so130759e0c.0
        for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 11:45:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790102700; x=1790707500; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eEmsPPYN19I2pfZSXr0Sunn8u9Ec3DlWKgauxQhoZ6M=;
        b=CLqJ8NXPUJ+VHYixExMTi0A7o7xCByrNvUKkJje2jh3QUObfW/8j7qvAM6/PUJ1BQn
         M4Sr1GddjUsbssV4xE+WKytp6BMVFR1JoE+dKGpXKGlvOt95RlPRvytWVFjnxI+pzIpv
         jDzpgbo6+Istj/A0b2X520jZo+PqoCd7cigNHcwxJFrV8H6uAPlLoeBU89aUVTn1qNuf
         kyf/61DPrskNxM/Ca7YQdS/UzwVgJw0eNpCUL6rJaSkj05Q2Sxq1128oVm7MnO5wUEJ+
         VdY3Sqt5xa9ijZFzpkcmYx5qsukJ1nHE7IwqV+jo283cm9y9OPX0WPa107KUEWh3+QfE
         aWVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790102700; x=1790707500;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eEmsPPYN19I2pfZSXr0Sunn8u9Ec3DlWKgauxQhoZ6M=;
        b=avbvplBrMEvJ78FHoazQWPqiCIhJcx9ss4WHx+ErBweubBf6RtLbrzj1a9YvobguA9
         49zZ0k9bByV10cJwoHWX1QVKye0TIoWvxVRhTGzq4vl62nfGxpTqMcqsAiRVKmBasCNu
         2qcW64Bod0QGX1G00OyYPts6At0c3kuCrhIvAipBv3A8neeaHhmZ6+2lH9P66IN1Wj+U
         SCje1SB/PRTonRSNop2wev+7w2vKPkGqXfZPoReoboa769YVzOtGJmJS4DwZ+2RoUl5A
         5HTN62PsMPlY0D3Jm/8v4G1Zli0ojHA1MgHuYkJdIvzdhy2VxNq+PZ7jnEFJ8IWsYDtC
         n1ZA==
X-Forwarded-Encrypted: i=1; AKwUvByCFHT2pPhLI1LC+yRRzt30shaK+ttIWlwpwv/JDws7lj+m8NL3KEur3oInZ1siEqwxqRtH4MvreNfT@vger.kernel.org
X-Gm-Message-State: AFuF++k9KHgaRUf6WRntpKEVAjgL6U3tA88N5/zvxUpSDJ4zZVqGLO4S
	mEIO4vQG8JVrNjImLq1mkURDKrlwbBzSLOszMt5mzcmjUcWPtfFNYmJoPRh24SH5B+9Eb7fPc2N
	/XAr6f2SwAJ2VZEJEEmutKclEvN0H7STpF5ILxqdbuLrRtWE1888bMy4+cn7JQ1R4
X-Gm-Gg: AYBFou2lqOPAdyWH/gp97n8HZu4Gq+YOPD1YcTSohqoBH5i2oGa+9cVtKpXc1VrO2IB
	lgFJ6v2XZGkaXHPb3Qig2ZLPGWQJXxi16/6BjIlOGKSv+9OVw3Rl/G7LzANWo+2tgE25J/4L0tU
	mJe82m8bUwUVgprwadmO9PtjCL9moUGPPSYSYr4oWCf/IEkAuHhaFkOs0K5VxjNgdR/8S61ot+v
	Y950SRaBmRIAyMROjb60TnYMM32poxe0nIX9eF4j1S5hxX1ogTQ+yzuxrK40F0rcQYNfKFzleJW
	lvqOUo1fM+UlNUZuDWaMQq8C1JzmAyirocSUkU1kAzulGtGJILZ7BpwDEF+NrslT3M9ZTacKmyh
	z+PhO1/4Y8bvflFV+4Ii8lfbGCKSMMaH3jyxbSQu/6MMfNZVLtAAjVcZ6IxYuqWam
X-Received: by 2002:a05:6122:d05:b0:5c1:781:7122 with SMTP id 71dfb90a1353d-5c9f15812c5mr813153e0c.3.1790102700080;
        Tue, 22 Sep 2026 11:45:00 -0700 (PDT)
X-Received: by 2002:a05:6122:d05:b0:5c1:781:7122 with SMTP id 71dfb90a1353d-5c9f15812c5mr813136e0c.3.1790102699722;
        Tue, 22 Sep 2026 11:44:59 -0700 (PDT)
Received: from debian (cust-west-par-46-193-35-178.cust.wifirst.net. [46.193.35.178])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4886876c500sm374681f8f.19.2026.09.22.11.44.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 11:44:58 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 2/4] dt-bindings: clock: Add LPASSCC and reset controller for Glymur
Date: Tue, 22 Sep 2026 19:44:23 +0100
Message-ID: <20260922184425.56114-3-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260922184425.56114-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260922184425.56114-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDI3NSBTYWx0ZWRfX+DvGC1HZ2aUd
 ntOZDk8b90tWp/+uQg3AXSdMoTopdr5NVkJrHCZM/NPAgEnUwBAYAsTkao2B3u6/aKl4puKb6vv
 NkfwHZRgU5eRUdfeFdC59ZtqmLGalecBqrhkieQ1eTvkKLzIIUveOX3GPkF/bovWNzDGv2XlM2v
 kKohOVIHZQGbECrJaKvyMuZCjMwi0bFH+31W8yVB9z1dZWxcQxwPlPbW2FcEegq/JX9hQqgRhQe
 LZGwVhV2Hvl0yZZBgUZ4nI+MPNIdyFRBLuMCATTpig92tyPMGgn+V6JPZikp6DM8IgeK+Ks8N8r
 0UcC33NvlkGUPILPSK13JQYmWr9J0ezCDBnxe2SOsYEGbixlH9VgPoWt3Un5K/bdVklJ5J2uy1w
 9emVHsxP87NPTyxK5HgjfAGKhlvhH49wyP63+1jQqBbEe2B3se9uMjNtrKfSglQzj9QvSVXM0D3
 koAb3/4gyqLVt5CY6iQ==
X-Authority-Analysis: v=2.4 cv=VKdIDNPX c=1 sm=1 tr=0 ts=6ab2ccad cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=Hji71o54RgNgZYqDgtlrhw==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=-l7Lzzg0JijIaF3KBckA:9 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-GUID: bbBhXMW403SxM9puLM4J6xE_QBNid59B
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDI3NSBTYWx0ZWRfX1/kuj1A/mwiw
 1yK8GQYSB9jL8Y9RzU/tJ4VsYfCYmDtLZMtF09bMyv++MlDSSX0GRuhzN0XU3XBl7aoPdFu8TQQ
 GBz4ErNPsX7ZZJE1JnTdhNlCgjaLJTQ=
X-Proofpoint-ORIG-GUID: bbBhXMW403SxM9puLM4J6xE_QBNid59B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 spamscore=0 malwarescore=0
 suspectscore=0 bulkscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220275

The LPASS (Low Power Audio Subsystem) clock controller provides reset
support when it is under the control of Q6DSP.

Add support for those resets and adds IDs for clients to request the reset.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 .../devicetree/bindings/clock/qcom,glymur-lpasscc.yaml | 10 ++++++++++
 include/dt-bindings/clock/qcom,glymur-lpasscc.h        |  3 +++
 2 files changed, 13 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,glymur-lpasscc.yaml b/Documentation/devicetree/bindings/clock/qcom,glymur-lpasscc.yaml
index c047c0174a93..916ab1b3dbee 100644
--- a/Documentation/devicetree/bindings/clock/qcom,glymur-lpasscc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,glymur-lpasscc.yaml
@@ -20,6 +20,7 @@ properties:
   compatible:
     enum:
       - qcom,glymur-lpassaudiocc
+      - qcom,glymur-lpasscc
 
   reg:
     maxItems: 1
@@ -47,4 +48,13 @@ examples:
         #clock-cells = <1>;
         #reset-cells = <1>;
     };
+
+  - |
+    #include <dt-bindings/clock/qcom,glymur-lpasscc.h>
+    lpasscc: clock-controller@33e0000 {
+        compatible = "qcom,glymur-lpasscc";
+        reg = <0x033e0000 0x12000>;
+        #clock-cells = <1>;
+        #reset-cells = <1>;
+    };
 ...
diff --git a/include/dt-bindings/clock/qcom,glymur-lpasscc.h b/include/dt-bindings/clock/qcom,glymur-lpasscc.h
index 3006b12e385e..3fc8e7313cab 100644
--- a/include/dt-bindings/clock/qcom,glymur-lpasscc.h
+++ b/include/dt-bindings/clock/qcom,glymur-lpasscc.h
@@ -13,4 +13,7 @@
 #define LPASS_AUDIO_SWR_WSA3_CGCR			3
 #define LPASS_AUDIO_SWR_WSA4_CGCR			4
 
+/* LPASS CC CSR */
+#define LPASS_AUDIO_SWR_TX_CGCR				0
+
 #endif
-- 
2.53.0

