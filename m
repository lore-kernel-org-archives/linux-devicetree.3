Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8012B34EF0D
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 04:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784261939; cv=none; b=K2gerqyn6+BgiXR/64SGyo2gGVUlquR/bNgi3LSDlDCsVwLO7NXZNhS3j2iRMxR34aWG89VPzK+CqF+u7vd2eebmGhQIpSuOd34UMqG6CeiljFZJkRNUpAocLsKNkYBa1Gdd4CajR53RrBL8iYNhYTPbEJpsiUDxXKs5G4BjIWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784261939; c=relaxed/simple;
	bh=ftDM8hNVXPkWVFFsKQ5hIHSeH3CS81Lz3eNrhHOYb9s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RoncUSPXvLljr+Xu1gW8548sHsH52m0Gn9gGzl7E0z0jPwcusz2cYEhlb7LMXQsnNK/gSUyINuQY/vjEbVFlMWHQuFXhcSYmItqpdKed9x27CUGK7GPZVdPUXBHkta93ZPoGNb9rnrBgOtw3D68vgyF6c2oGojvtjATzMd6N6+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Dq+hle3o; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cnVqofnX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Dq+hle3o";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cnVqofnX"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66H33dhu580712
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 04:18:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zw+vgKN7Lvk5G/phJVRpy1VAlPvPjA+zRvXD3MgsP+U=; b=Dq+hle3olzGHpbbt
	Z5DNx4sHZdgS2Ip6cgt/egWmKKsJlNb9TPZ+OHIkK2Wv0lm9pnxYAo6UDNWgUH01
	aMdgHN7Io/R1XN1NgNz472dNyMslfMhvNpTRdFuZaOl/x00BVhO1oagz+vHENPiI
	4qo/8iG/iIthVcPExBf6xN1fN6ZyadkSNWU3H8lB211NYjedIHCpw6Qo2Ev6wnId
	1bmX+YnsLkRkAoOD06sUuIuQeXfJlmR8jCwb+jWheA1OhOehURYFauazXERweumr
	I+Ng6xG+UWnuvVZKKQDH5jHbVxBJxIOK0l5PO9c9o/EowBlwFIMH9ysVdNfTC6GZ
	bpo96g==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ffbqug9nw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 04:18:57 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ce7dff6253so7963905ad.1
        for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 21:18:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784261937; x=1784866737; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zw+vgKN7Lvk5G/phJVRpy1VAlPvPjA+zRvXD3MgsP+U=;
        b=cnVqofnXO4yJjKBf8w2AEXVssWij5jjHS6ktoTpowz2PxdNCwadE3y2OtC7S7Rj/OG
         V8zdDq/k8vRDgW/pR6cN7D5ecni3hEcJiQESf34WtPhtwItVkCJBdKdxHsnKzjo9vdWU
         JO51RJnQdMw7NjQuwctsQA1prMPYlxOAK6bNvTl5eQVE0Ce7PjWBF7ThafVVdZI142R1
         CUYYIk0O5mmwAedNfUOjZWJo97R5VP2GxggvrqKFrz6O9oFWI0fwcfPeQLBUSn4hq/Aq
         JNsgiOoRogmLnahlPCMtRlJUPHZ5zEADAH4hEgLZBcol/ROFNHcPb/vTC9fQ0W9YikzI
         GAOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784261937; x=1784866737;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zw+vgKN7Lvk5G/phJVRpy1VAlPvPjA+zRvXD3MgsP+U=;
        b=sBT/3w5vJY/tcro+b0V4OjFc96tjQKhZ7kle0S0hz2BX9n/jf32S+mHVI+N4Il8n3V
         DWa/5kp6VppuhFiaop9ubqMpKP0S+CFifLsJYtEqU/fpMeq8YZIgiNkDHdyRxamYnuPd
         vI6ONvwTCZsz4bmv0ebmW7hL9hUa8iEOlX069gxKyzFVLWhvgKQHnKiJQbIpelgCzXHG
         bV3Xu/9uw4RZEMY7SpWzjWWLKew66cZBRtBSbY8cu0vWuwEeWr+B9g4MJxcKdBaUAUis
         DBwvCjpUEgdKbB6N7Zsla17r6HaZW+y9GXyipJpY4evhGTdqdvXv5bVwjPj2FfgIl3hO
         ZJhA==
X-Forwarded-Encrypted: i=1; AHgh+Rp8zAXVfP4yBp3kfm60XB6Yd2PeBMLWUFFJVXTokk9T3Q0Xt0CVGzmopfI4/UEC9WghFSFTnQt7hRAH@vger.kernel.org
X-Gm-Message-State: AOJu0YwMzkxyT8WCEHZuh3UDvg7CiZNCT6rJNKkCRk1gt4G/3Up+wGes
	5BKDnVWAhF846+LcTQs2SM/oG1VAShwHjawLXIm1JnFWB4YRyztZTqSc22vs4yRmLHJOw6DNfbp
	+TAebhScdUGv37Pzt+/tLAwu5PD9KazDmR1SdwQ9klfnTR/6qe3owZbtIHVWh1Dre
X-Gm-Gg: AfdE7cnKkwuZlDUtKAIP49Oo6AsGLBhd0qEgLGiCQ/BAnP0uhefkqaqkv9/at3UViY7
	cEU3qgXm8fx+njpo37KMSa7Z4t14Bjd4/swlcwOmeV0aUPrHsgOG7/9Xt0gI+x4v7kJrcW/JDcT
	xetZQbHS+S48i7yNW6ueTFX/bmphTz61e/VGJ0guAMrqIPg0iIeiorBL5yDWxAh8m7/mk5+uBXf
	YhsbIeqZE1CwyVtqoa6duI+c2sXNfBxxChweMvefu8bWU3mR/NXgcfwfoYt4KwSselngpNWj13Z
	zhYPQJNGvDw07GWv9i0NAIxrX7LkdzPL9UDdJg7xMaxvNrXsymeYmVhIYg/1jRdq+p9suLHYDmr
	R1k4esXlCKafiS+aUZAl485vqKPZCbBo=
X-Received: by 2002:a17:903:1ae8:b0:2c6:8d95:fd7e with SMTP id d9443c01a7336-2cf1f256703mr65842635ad.6.1784261936921;
        Thu, 16 Jul 2026 21:18:56 -0700 (PDT)
X-Received: by 2002:a17:903:1ae8:b0:2c6:8d95:fd7e with SMTP id d9443c01a7336-2cf1f256703mr65842405ad.6.1784261936488;
        Thu, 16 Jul 2026 21:18:56 -0700 (PDT)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13ce2cd6e6esm875300c88.13.2026.07.16.21.18.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 21:18:56 -0700 (PDT)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Date: Fri, 17 Jul 2026 09:44:44 +0530
Subject: [PATCH v3 1/2] dt-bindings: clock: qcom: Add Qualcomm Maili video
 clock controller
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260717-maili_videocc-v3-1-6656694b06a7@oss.qualcomm.com>
References: <20260717-maili_videocc-v3-0-6656694b06a7@oss.qualcomm.com>
In-Reply-To: <20260717-maili_videocc-v3-0-6656694b06a7@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: wNFGUInGlGm1vtxN4v7fbs7UT7GsJCIX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDAzNyBTYWx0ZWRfXw2K1fwEYKTc+
 tgmbCWhffWuLVix/8TYjjMj+2sd+TCBRCs4bqDYXzwBwg8NM1JBRFsckctC9DLYLUFf2DCTdL+J
 9TJcU53p/ZzeATapkpW2ReIpcaXTDd7L0ZbltXNftGxe+rb0/feV+laKk6MbydJjIgNr5zCQotI
 yHzKAZRYjVvJrgtDx/EfvUvlTcqAHVBVHwdaHM06GIWLRUycIJoYhQm3XoSRhsDItEfFllWKk4b
 tQcP3icHWffFdZ2D7n7P+caD451BSyKKLXKKr1IszIC7UkBxwM5wlOjSwKd1+jgxthuO3lLufya
 8oBguzrSYX9gUdcXxpFvKvem5cmvx75Gwsdx5C2T9kv1RYKnF2eXWNq6TupsUD9eynwcuYuMVgO
 ORPAf5eQi76vxDiEBLsMi0DZXVeQUWZ4/hJeJxKOsRjaSxNP+/QosW/8PF3oKquy2sOYlius1uL
 F4Egq0piR7bACHsZ4Gg==
X-Authority-Analysis: v=2.4 cv=NZ3WEWD4 c=1 sm=1 tr=0 ts=6a59ad31 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=_g2Ecp_Vah_XpkdnnNEA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: wNFGUInGlGm1vtxN4v7fbs7UT7GsJCIX
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDAzNyBTYWx0ZWRfX1T646yg1K11a
 1MYsdTVBH2IMRmNf0dWmKaPFtX5WRolvPUY6e3BM5iYuVfB65CDjkLCRQ+h1TBybzBO/E6yrf+9
 Hbnyu5o/vouPFU8ByHgasvMBJMLNOxQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_01,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015 adultscore=0
 bulkscore=0 phishscore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170037

Add device tree bindings for the video clock controller on Qualcomm
Maili SoC.

Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
 .../bindings/clock/qcom,sm8450-videocc.yaml        |  2 +
 include/dt-bindings/clock/qcom,maili-videocc.h     | 50 ++++++++++++++++++++++
 2 files changed, 52 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
index 1e1fec1cd7ce96f103348baf85341e775fac690a..910c6d5672b8657f161058c4ceba98637c299b73 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
@@ -18,6 +18,7 @@ description: |
     include/dt-bindings/clock/qcom,glymur-videocc.h
     include/dt-bindings/clock/qcom,hawi-videocc.h
     include/dt-bindings/clock/qcom,kaanapali-videocc.h
+    include/dt-bindings/clock/qcom,maili-videocc.h
     include/dt-bindings/clock/qcom,sm8450-videocc.h
     include/dt-bindings/clock/qcom,sm8650-videocc.h
     include/dt-bindings/clock/qcom,sm8750-videocc.h
@@ -29,6 +30,7 @@ properties:
       - qcom,glymur-videocc
       - qcom,hawi-videocc
       - qcom,kaanapali-videocc
+      - qcom,maili-videocc
       - qcom,sm8450-videocc
       - qcom,sm8475-videocc
       - qcom,sm8550-videocc
diff --git a/include/dt-bindings/clock/qcom,maili-videocc.h b/include/dt-bindings/clock/qcom,maili-videocc.h
new file mode 100644
index 0000000000000000000000000000000000000000..f8461048b04d43cc39606b415273c17eb5106dcf
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,maili-videocc.h
@@ -0,0 +1,50 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_VIDEO_CC_MAILI_H
+#define _DT_BINDINGS_CLK_QCOM_VIDEO_CC_MAILI_H
+
+/* VIDEO_CC clocks */
+#define VIDEO_CC_AHB_CLK					0
+#define VIDEO_CC_AHB_CLK_SRC					1
+#define VIDEO_CC_MVS0_CLK					2
+#define VIDEO_CC_MVS0_CLK_SRC					3
+#define VIDEO_CC_MVS0_FREERUN_CLK				4
+#define VIDEO_CC_MVS0_SHIFT_CLK					5
+#define VIDEO_CC_MVS0_VPP0_CLK					6
+#define VIDEO_CC_MVS0_VPP0_FREERUN_CLK				7
+#define VIDEO_CC_MVS0B_CLK					8
+#define VIDEO_CC_MVS0B_CLK_SRC					9
+#define VIDEO_CC_MVS0B_FREERUN_CLK				10
+#define VIDEO_CC_MVS0C_CLK					11
+#define VIDEO_CC_MVS0C_CLK_SRC					12
+#define VIDEO_CC_MVS0C_DEBUG_CLK				13
+#define VIDEO_CC_MVS0C_FREERUN_CLK				14
+#define VIDEO_CC_MVS0C_SHIFT_CLK				15
+#define VIDEO_CC_PLL0						16
+#define VIDEO_CC_PLL1						17
+#define VIDEO_CC_PLL2						18
+#define VIDEO_CC_SLEEP_CLK					19
+#define VIDEO_CC_TS_XO_CLK					20
+#define VIDEO_CC_XO_CLK						21
+#define VIDEO_CC_XO_CLK_SRC					22
+
+/* VIDEO_CC power domains */
+#define VIDEO_CC_MVS0_GDSC					0
+#define VIDEO_CC_MVS0_VPP0_GDSC					1
+#define VIDEO_CC_MVS0C_GDSC					2
+
+/* VIDEO_CC resets */
+#define VIDEO_CC_INTERFACE_BCR					0
+#define VIDEO_CC_MVS0_BCR					1
+#define VIDEO_CC_MVS0_CLK_ARES					2
+#define VIDEO_CC_MVS0_FREERUN_CLK_ARES				3
+#define VIDEO_CC_MVS0_VPP0_BCR					4
+#define VIDEO_CC_MVS0C_BCR					5
+#define VIDEO_CC_MVS0C_CLK_ARES					6
+#define VIDEO_CC_MVS0C_FREERUN_CLK_ARES				7
+#define VIDEO_CC_XO_CLK_ARES					8
+
+#endif

-- 
2.34.1

