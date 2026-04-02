Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E84593C5DCA
	for <devicetree@vger.kernel.org>; Thu,  2 Apr 2026 11:45:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775130350; cv=none; b=U0nCfwCwHAMcnXzcQ4yrB+kzf4VkjzFhUs9Xlih7v7HD+7DOzIeG344UrsRv90EBZck6Zku5HfMv3M8jqsY7wcZpqVQ3VLkLxaucbiBu4yD2CqvVLTPGgXW8aDd2q3tGTK+I6e+Xyk3PnqVrYccPsAdsWHImhDaomfzE/ifvP9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775130350; c=relaxed/simple;
	bh=OSYiIDzE8fFUwsAtmPND8mFzvbYZFJ4yGb7DajeG4S8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ISFmMEwRTq14hoZzkbc0kptqgSaw/b9fjwPDdFsXF0tVX5R6/SRDHZWj28Lq+BLk7e+xk+Wn51k87DIeqLjbUdsufC340N40Pb7hAl9eoDpqRN1GIq6ytvZpOp79P4QO+oeI/P2ifcnOxkKmkYCooeQt6D+v9PNfn1Lc5dfC+7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BEu6OxeI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IwxwwwHE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BEu6OxeI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IwxwwwHE"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63271tc84009752
	for <devicetree@vger.kernel.org>; Thu, 2 Apr 2026 11:45:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fjEXJr0F4HC6Q4F02RHzTk7Jk/5DjDFjwD5Czl3FSv0=; b=BEu6OxeIhV6UtOVn
	ybxuwhoOGQdPzGM9P5Qcn6Nje1/7rHah7r/F/2cqtLzqs6GpTZwTjWwb9KhykaPj
	mT7BUpON/qObRwsdekQIEqRfaAd4ucsLFz5VyAYt9cg/tbCohQ/+XHoSqzEblwcH
	L4cDVDtFBJ6y+ZWZZmwmMemuBugNS+Oi9ht/+XJLupgKRalhTvymHdffHSc5ql9q
	8t/zmsumqxxHrx3k/yiHFNnYl/Awb4IB7TKNO1Evu4ikkmBQ2snXYWUbb0xqWURA
	f226PzR1BdKFzS7Z/0bwlXZXkpxf4TV6PskXSITW+PtUzCl9eCfsW5iuNH9UWU+f
	rA3Stg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d97e03u2t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 02 Apr 2026 11:45:37 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5094741c1c1so22110811cf.1
        for <devicetree@vger.kernel.org>; Thu, 02 Apr 2026 04:45:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775130336; x=1775735136; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fjEXJr0F4HC6Q4F02RHzTk7Jk/5DjDFjwD5Czl3FSv0=;
        b=IwxwwwHE+l/90VMVrxRmeipZj9h98pRB8Pp9kXn1BAj2bdrkRdt8zWSx8gOp5E7BYu
         PsZUqsxM3LssFaU86sHjmgIw/TaFLa+0QIhOR8yMukSFEED9NaU6zHoDq1J801QtTrU5
         KjyU5rpOdDIR0q+43oqViBRv7m+TQORUIruXut2wtJFhieBix4s3xXNJT8zKMY5Qbcja
         4/NfZt34juZHu6UM5dUq/zwpGiySJVj6qBr5/6sfdf6mHKaQ0AYg79NT+yvaYwM59Kfx
         PKxjxNI6ePBNHGkFVjO4ee6XC1e88CEsZv56NXR7goYREsIDTy0q8PduIIYEcqT9yloV
         oQyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775130336; x=1775735136;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fjEXJr0F4HC6Q4F02RHzTk7Jk/5DjDFjwD5Czl3FSv0=;
        b=YP99L+Y2iNRVFmTiTK6MNpIiZrrqzfgjHkkE3OPwUox7yvbkMEXO6FTFGa8v25rniF
         M6VZrIheSl+oXdsKJjgwdwOBAjPSokdFY/hYZv3sGsN7cePAV3AefaGZYVER+yu3LJtD
         sizf4Zo/u7bwQi63Uu1YurCYn0ChE9dhPFmKfPjUHZyuzCR586p8Eg4+TMmFZVg+3fPZ
         dVB3nhJFkgPPFNMw0vWQcpk8C1JvMEwgg0EB/3jpQTmnBEaFBKaSJOod//WWlomyjXgG
         eeenkCwhcuhV90KimMYLHyOJo2khHlWSZ8fmWAiQC25BB0UqOOt4Jxj7nRuU9nMpm2/k
         oSvQ==
X-Forwarded-Encrypted: i=1; AJvYcCVZYJ8NCOUW1utUp0eYbW0N3GLEkirnXFPhfMvCWceTCIypSfEQ4SabbbZExc/OHePodX85qrVd3MYt@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+gnIS5yPVNzlBuy4vpxCDbfOeI55FIMjMNlroRgFqXLVTjuIi
	Cm+jaynmHTx9tLZqifdQUdUihvZS6OiDmVJrj0dULzPbAwXu/lmPOddQ9z2XQ1RrbLQL+r7yuBw
	PtCXjBV7c/YLJiTcxhqzGOiXE8jVDWqC/9MPoG/DWt40I7Q5RFybwgUnQeAxh3leS
X-Gm-Gg: ATEYQzygZlqoB3XwttivTFTvMYNElsNkSvokZ9B35X1t8eyUi+GJCLBkhOYkCqdNw7W
	ee+tQCjg9rBPNSMUpMFukQTSbb6KwaPj76ukgNBVksLc42velIhuMVvbzQMdPvh794ErN5NiBAF
	x8Gj/3/gxY1mhfuwCxBTT9dad0rMopbacxScKSKqtB8gcF+ssgTU30cllOZd89asP4y6GD2smSS
	ujg7Bd0uezJrz+lSU9Ugz7GXNdqmd3e4nucrJ2JeTZ3vH89OogwKUtMGLu3KvzlhAMaLb7cKGcj
	/CRXne4cw7xV+bbVeLZN/hvsStJFMbzY/oYDENB/KLas52pZm4nyRYLDtJ3u5d0Wa3nAUu3gWBf
	XDxHkHerxec17VKqa5HnHIeDGaP4Bb/ItF0vnMmdwLqyZ
X-Received: by 2002:a05:622a:4cc9:b0:50b:34b7:fd62 with SMTP id d75a77b69052e-50d3bc9b7afmr99636391cf.25.1775130336219;
        Thu, 02 Apr 2026 04:45:36 -0700 (PDT)
X-Received: by 2002:a05:622a:4cc9:b0:50b:34b7:fd62 with SMTP id d75a77b69052e-50d3bc9b7afmr99636061cf.25.1775130335826;
        Thu, 02 Apr 2026 04:45:35 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4888a567bfasm141614635e9.0.2026.04.02.04.45.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 04:45:35 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Thu, 02 Apr 2026 13:45:16 +0200
Subject: [PATCH 5/7] arm64: dts: qcom: sm8650: Correct and complete DP
 address spaces
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260402-dts-qcom-display-regs-v1-5-daa54ab448a3@oss.qualcomm.com>
References: <20260402-dts-qcom-display-regs-v1-0-daa54ab448a3@oss.qualcomm.com>
In-Reply-To: <20260402-dts-qcom-display-regs-v1-0-daa54ab448a3@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1431;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=OSYiIDzE8fFUwsAtmPND8mFzvbYZFJ4yGb7DajeG4S8=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpzlbPCq4EdW4VK0PG9hS7Lfp8GCKRWpwjyGJkz
 DrL8xD1mwiJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCac5WzwAKCRDBN2bmhouD
 10rsD/46sDP1SvW14VneXhdhFq2Yx9hTKb6M4RTb0WOKEfN50oAZXorC5sgx+igbQ9NOCmq29fO
 F651NLWxQs9zSMsuO3OTL1rRASw+cJEOb1ZrxczC73QSaXxUSP9IB6flZk6B27CEhu0IcKMzfGw
 1bacLSR/LttUbQTHTG0L8EA4wDzq+mQtkskyttQzIQACVs+GPZhTSPTJ5fwgmnuAAAvCclJU330
 EgsxS7gYH8qlmo0nBR6GtMoqhAKQIBWSGersgaKY/qLpXf9Rq3HkQyVBaA9RE6tvIVnX1tdvCKJ
 Z/j4qoKs2q1XkQUKH5LBPM0mEZcsi4W/Q1kEZTkJeN4bzei5A3P7dd5s5MCvmxbsBY2GD5cJKEX
 ZT6k2JB4N/DoPXYPZ1X1ta1yWMpnsJ2qcXNZ8xI1HMe3FiJ9LcDNQfjDqP7I772ZNEC2OaMUA0+
 NwssXDy/hXc+FQHe8/ycNtRcV3KSXdYWWB9KMNN9tQZCGCiIecZyJhe7kfvP40Jctm1dRsZnO4U
 FpddiagkIX7loOZwoBMjtlGP+UwbXtSsvjqSsfM7wiHCTLJP7uTCdbMLOOTPgtzKu+GkIsQNV/H
 T0UIwE5+klodEsW6oy59+CeSPidfDhOQLSgAcBsXo4yBn9bAewUk9LqyZRdkvyPJNKdoNqCguPp
 ompliKxtQ8A0htg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=fdGgCkQF c=1 sm=1 tr=0 ts=69ce56e1 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=RMXozov3DQQ1vOc4o_QA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: VuMmReSv0RAu2f4cDu2lY4HpZfKUg0O-
X-Proofpoint-GUID: VuMmReSv0RAu2f4cDu2lY4HpZfKUg0O-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDEwNSBTYWx0ZWRfXzDDJc1R+Rq0N
 L5F21f/vYsJpMy5nA6r2K7j5fnkZ56ESskMqjxJe39GsFdJ7+j0YSQl4R1kzwwfgHZp0SqJsdBz
 U7LP2VjzPzw3DUrhF62ea2Z0fyojePLLB6r+kN+OFYNN+KnD9GyclebgrCsa9JpJFM4uh0XcHx4
 8XXarpXvIip7d5kgjmTyW1j/qBaI7i2hyfmAILD6KZR9A52+KAlp/GlJ7bEpv70JlsVrjSgDHRb
 CYSNqRmGHOWiI6UadlTWNa1Dd1TJFbRBfM37s7v6fhYAEy1fJpfgYX/gRZa0jXGV9c7XpIiXELS
 UIMUW10o1JI2Tanl79+ZAKAdllTvrLj1jx2z/UdkxPgAVyj2pTArImr08PHycEm87qk+G0Ppq8S
 huYyqZGIEGZZuVWFqyaE/8FdDehQ61OMhE+7iU9HMqIR6uHprAkt0nqT2PV4m+bVC2LJn3WMs1c
 65aP9PIssSoiQEqGI7Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_01,2026-04-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 malwarescore=0 impostorscore=0 bulkscore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604020105

DisplayPort block on Qualcomm SM8650 has few too short address space
ranges and misses four more spaces.  Complete the hardware description,
which in the future might be important for full feature support.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

dtbs_check success depends on the binding change (first commit).
---
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index 1604bc8cff37..bc420a44f0b8 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -5868,11 +5868,15 @@ mdss_dsi1_phy: phy@ae97000 {
 
 			mdss_dp0: displayport-controller@af54000 {
 				compatible = "qcom,sm8650-dp";
-				reg = <0 0xaf54000 0 0x104>,
-				      <0 0xaf54200 0 0xc0>,
-				      <0 0xaf55000 0 0x770>,
-				      <0 0xaf56000 0 0x9c>,
-				      <0 0xaf57000 0 0x9c>;
+				reg = <0x0 0x0af54000 0x0 0x200>,
+				      <0x0 0x0af54200 0x0 0x200>,
+				      <0x0 0x0af55000 0x0 0xc00>,
+				      <0x0 0x0af56000 0x0 0x400>,
+				      <0x0 0x0af57000 0x0 0x400>,
+				      <0x0 0x0af58000 0x0 0x400>,
+				      <0x0 0x0af59000 0x0 0x400>,
+				      <0x0 0x0af5a000 0x0 0x600>,
+				      <0x0 0x0af5b000 0x0 0x600>;
 
 				interrupts-extended = <&mdss 12>;
 

-- 
2.51.0

