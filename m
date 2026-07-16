Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D1BF38229A
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 04:08:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784174896; cv=none; b=fIIdY8N0wLKMzi6XIt5e5dIANI1c+qmm0z62nZesGqY+ChesMhl/AB7oG2HZxXaQF7304ScGFS/Q+3QuY2gjKUmiJTNUetIFBXXby11VBVheBsJtIPL4k5wVeqi8jPRCFc/fkDarOfQ48fUcVuS1o8v9azP2q0C8KvZqVvRwGDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784174896; c=relaxed/simple;
	bh=+pmmTLiXO5A66kPSR7UeCsqzMfxV/n2mPqjwEH6MHBM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pIHaFtjDD8I2pKhpblxNDyBVZlzpGI4rNh5qC+FOHCp/DhNJHu62TMTvVZ0wkOHViomBXpQ8lXrunh5TEx4giz80A9Uf8pjl4VLJeWOAnpMtzCNGlzUppFSQpqmFNT9CJpTVFlrkaj9iqF4ReNh4I/mR25Z5fdEZsIGfTTM4dTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KQsSGgd8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZGZ5Ytgh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KQsSGgd8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZGZ5Ytgh"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66G3wHPe1555966
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 04:08:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	E0OQcXH2gW0lUun2K3nUAVTX+Nh3eUWT3dg5jaBRZ7Q=; b=KQsSGgd89VWkG6Po
	1a0AD0yE2KkM3AcTJfj1yWUb44On1Oxg7UwZTmjO3Tu/4/lX8Nqq72hoIPdFALMR
	RW7jC9JKjBJ3+FK+itDWH5e6krPZIgDsrJYcwGjUoJiynESc6djqjOeixZ8NNp3j
	XgfjdFdlg2UfVbcneF8YCK4uAutDM1kYoa4MnfoKdf09oABcubSRed9PppiLjHQj
	ip1DcMGU4RpvvOdWyiXLZA1T9UUCGjk6x1vGdcDNWjwhL83lvQCS9B8KGh9eQg6t
	8SzOYOAyS9Z3ihaYH0ncWTW0Q/8ywu+SClqyALeR5w9vzvKwBdYGa2GRUOCh+RWD
	6X6BbA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4feefqhwkk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 04:08:14 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38e2237bc43so3705043a91.1
        for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 21:08:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784174893; x=1784779693; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E0OQcXH2gW0lUun2K3nUAVTX+Nh3eUWT3dg5jaBRZ7Q=;
        b=ZGZ5YtghDlbibZv/x75SgVWfsZad97A/9ygv4d/eiJkPQo2Dh85BKFakyLjpTp5I2m
         +MW19BnLyXp2KNqwU05ysrPK8+XmVgasIj5xc6gnaKIO4FdEDvUqTi3BqCAv1j+5WnqH
         jNnKaLw+0sbIvyG4dMj87TEIA4qlHN79bJjmJNOTUgVuO+8aotKUJ6ZCLBJ2KNbsngKV
         h9lsXaoF0n2uxyBaERBsXROjwmJO4NwdaqywdiScx1CBsnMngMt3zLHKwyJtp06r7xNq
         HS3BAuSZ9SVs61ze9cYOng0KKE8fBWev5ilW+knkugaOYhFTsEFfRhArEGkGlMFKHrCA
         Cl9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784174893; x=1784779693;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E0OQcXH2gW0lUun2K3nUAVTX+Nh3eUWT3dg5jaBRZ7Q=;
        b=Aj/qdhsr89iDDzBnJ7v8YJKg1Ib+nXHhr1kIniAoi+LJPabfmFC9zzPiVJm9X9Ihph
         oxOdcVVp+6Hps1cAWeRL67JMyJmywn3692Z2A9JIDSviapnQVc3SYIeqirCapeUt1S0U
         CP7Ybog1zvqCnRkeTPKtHwm+E44rvoeRjVaj8flRI8bpFjjUSR+1tMcThw2aYek74Sf7
         lyYBm5veWOhVvRLvnGGUAGBT+yrjnkwsqG0kRUO7Uga5xjNlSERnVv4I+3UBKrg8Yuqg
         OlFYDgu1wi+RwI8AysCqs5LbfFIvUeB+0pipOdTRoHH7QQtATqtH4jc2G3f7VdkPZemD
         SqUA==
X-Forwarded-Encrypted: i=1; AHgh+RoK6y29IyNevEj02lyCbgqFtrH+e+O2PUQujDSOgH3O2mNPAXXmadRb/QuKIbj/1rUUtMRuWNIRRnxQ@vger.kernel.org
X-Gm-Message-State: AOJu0YzYLddv5rM0GImAvi5bgmp4j4fBAOtHxP67RJSV0cI4ggQ9eE5O
	30CAm8RAMiNQJPcNKKr0Zgc8vAJrE9+U5poXSSZUsdY4ZnTZVQcY/3/ZHeQD8dbHoTBGv8kvNGV
	g18ESVGF2v5JI7IipqgOuU85aoryBnIwbn5aGwe+STZTA0KMMSa4bz7L2qv5CvL1HEns82a5Z
X-Gm-Gg: AfdE7cltNRc5tdZHbIoHdHDNZL6oEDknqFdO7teXqPH4bo+DSgRFFOupnXrB41HfwKv
	bOchiLGyPZ5KX+t9TI/vUAVWqw2n8CzZces9NaLq2SCuBpf3gyXdpvdcSB4Z+Mc/Wz6vb0DHAkD
	7WCTY2xwHjBzeNlvqqJbra8eAIaWw86M6yVffBzeceo7+PQuTHxS8dTOGOECfD1yaj8sAGT9JFN
	TVjDvDQNbXGwxTsMrK22vHkgni9VM3z2kVZ+vT9efnMXUDffOBpNUmaC7AMjXuUSpSn1JbEczdD
	88xT4mZQXUMIfbJgB6lVHHwbJ73WTTmXm79Sx4EyL7m7WM1+q+C//Tt5tWVek+RgLJeQqVZNKM+
	4VwVbhn9c8lK1IBkKaH8qtZoLRMQQCb0=
X-Received: by 2002:a17:90b:134b:b0:37d:ee77:78ac with SMTP id 98e67ed59e1d1-38e17dce582mr9767455a91.19.1784174893222;
        Wed, 15 Jul 2026 21:08:13 -0700 (PDT)
X-Received: by 2002:a17:90b:134b:b0:37d:ee77:78ac with SMTP id 98e67ed59e1d1-38e17dce582mr9767409a91.19.1784174892679;
        Wed, 15 Jul 2026 21:08:12 -0700 (PDT)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3140e6a4779sm7623907eec.17.2026.07.15.21.08.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 21:08:12 -0700 (PDT)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Date: Thu, 16 Jul 2026 09:37:59 +0530
Subject: [PATCH v2 1/2] dt-bindings: clock: qcom: Add Qualcomm Maili video
 clock controller
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260716-maili_videocc-v2-1-7ed5ab140770@oss.qualcomm.com>
References: <20260716-maili_videocc-v2-0-7ed5ab140770@oss.qualcomm.com>
In-Reply-To: <20260716-maili_videocc-v2-0-7ed5ab140770@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=APNfGQ4N c=1 sm=1 tr=0 ts=6a58592e cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=_g2Ecp_Vah_XpkdnnNEA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDAzOCBTYWx0ZWRfX5kkM/jNPjMiz
 paMuCjfUIiwgIOaE5jvWPtQIr3pGKVnhjWANFrMki2Yp4w5Wb3EmxVZuuYIAlAx7/Geo9Qg+6pR
 Et/LDM+SnXsPog9uvHbuHYlWa/O8FHA=
X-Proofpoint-ORIG-GUID: GVYSOAm3Af3AUeW_zjd6QlcZFeiVS318
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDAzOCBTYWx0ZWRfX/xhWloJqbAJB
 b9Iuzl0VIag0/EQQi/l5rGkMa8QP1IU42w9ANSZWt2iyfeu1taRyz7kYE9jtF2xV3lf80Uqc1z0
 mHTbR0exwQ2cyjvi8/xeyrUCp8nbNiwSKT4zUK3qODhK+r1jyayYioHKJjwEpfxv0Whj6fQgIpY
 RPhClGzPwpnj1fpvl70vx+nUH0fVgkATxEF/stEhT0IO0ovjR4xJsh706GV+yPXDDM9Y1F3VIE3
 NFBRQnQ/ebMM0+NUM6xC+fq6Mcnj9PjAAH2Yt341rmDNZkcL/AsIXDAV7LN5XZ8Uh+vgFlIzvYt
 9Tvvq+eMm9L1rr58iCSIwiUreiwo/LIaorCTJsaiYXtUnmB3QvEIJ6Q7QS0tHrQBB0rhyOkLF78
 6LZNwabLr+5oILa/UMF/DNXBU0/b2WE53vCPSh22QoWjmdcfo3vfen9cyIbKa0LzQxGEHIeXrVC
 HvF9Y8rPUHFWgXKaGjQ==
X-Proofpoint-GUID: GVYSOAm3Af3AUeW_zjd6QlcZFeiVS318
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0
 malwarescore=0 bulkscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160038

Add device tree bindings for the video clock controller on Qualcomm
Maili SoC.

Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
 .../bindings/clock/qcom,sm8450-videocc.yaml        |  2 +
 include/dt-bindings/clock/qcom,maili-videocc.h     | 49 ++++++++++++++++++++++
 2 files changed, 51 insertions(+)

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
index 0000000000000000000000000000000000000000..ae52686639db3231b8705e28667d3a65192d4de7
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,maili-videocc.h
@@ -0,0 +1,49 @@
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
+#define VIDEO_CC_XO_CLK						20
+#define VIDEO_CC_XO_CLK_SRC					21
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
+#define VIDEO_CC_MVS0C_FREERUN_CLK_ARES                         7
+#define VIDEO_CC_XO_CLK_ARES					8
+
+#endif

-- 
2.34.1

