Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E962C3CF97F
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 08:44:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784537074; cv=none; b=uSDRYaNld/KfkB+tIENrchENdPUeLO2gVfSWI7jM5qYi50wFmkhkrqDgMEKI1mpc0dKcAY6sdYVdoPoDAE3kNcUWWkhBKZLiG4tZe27nY+MdspBKpW6r1XnxwH0w1ENxc1v+RdA8diNSw5j6xJN6i+SPw7vWKGFnhTMUFDSd5+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784537074; c=relaxed/simple;
	bh=CkRJFqt/VW4m5qRKt2q/9AJRY0uceEXzVx2depa2iLY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JK3ir4gfd7VUxWPC8Nl/0swuGV0UihiR3F6M6kryh/4sIFsEuQx9GxjPkgWmT8WYIB+X7y5nqRgQ5m9IIrmoPJnpfFbioysSu2UAOmuPW0Ogj0yRzBKSG8TQGh8hXEQNQm8dfIrisMAYViRmB2/xcrYBtELw7P9iC68NX6IGWb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G5EMX6kO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a35BNwUq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G5EMX6kO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a35BNwUq"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66K6Rhob1774854
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 08:44:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VkXDOit3nwajTguZN8vv2bM/CQEmbAdHLSUwzgdY8fU=; b=G5EMX6kOszp6qT4f
	i6TFmF88Dm9O4nVjVX6WKgYrCeJEWu+LGDKHg2Q3ROF7X2lc/jwsBwMEKdQO/4iU
	CaGBecUpcR3qUG8Yspc1CGdZRVITlKKAl9L4wadNoRkUDA7bCPfd4No/PQCTANgS
	1ItBRafETSIQw9Da4DwYOu3f9beZDVP5kF++chY2/4cTOSTUFOzBJwFxYYuVbBhu
	S/wzCWV9QMlgduOEmCM3PfrM4nbczhJ7cOV86+UjMn8fMKjB1EDi8Wbo6w6Ty+Uh
	OahbgMb9v7fM6ku1/kuwqM72Dh9EaQJ1EGwqumbUaH+l+S9Pc9+CiyElrx7AcCK4
	gztYXQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fg2af5880-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 08:44:31 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8fc92c5373bso184569066d6.1
        for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 01:44:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784537071; x=1785141871; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VkXDOit3nwajTguZN8vv2bM/CQEmbAdHLSUwzgdY8fU=;
        b=a35BNwUq63fULcj+oKk5E7dTWUl0j5CVTR0GE2Y+0GbEZuF0K5r2CmvWWzZcBpNFGG
         65h825klkpqNiwz2mVcKqZo8HhtF72VZ6FGlRhG22lcjDnRB48JgHHXULq+Au9T/Tzec
         diqhaeEnmRIk5Hfj9ON0MI7BkYgHo2252JJ17PngzTFBOynb8KANjTD9mI54GHlGIMKw
         tSnvSHf9T4017o9VLXmIVsbEC3+HzsutbNwLJi46uognAvJ1cLCCp+jLOoHaIbpwcf2+
         f2WUuSJT8JUanG2KIWakSZ+BaEvjIy98YNd8OgxlZiOkiaprC/FK6N1vEMOoKce19BQ/
         qvkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784537071; x=1785141871;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VkXDOit3nwajTguZN8vv2bM/CQEmbAdHLSUwzgdY8fU=;
        b=h7TnrhrHFHVBAsbDgHa+tFJaX3+yKY9E/Xzipzc3uMAK5erWMbTivZGW7MBOaIsaX6
         RVaMAllX+/tX0vW06C8dO4AtZX43SGUR/UyDJwIZsG4Wz25rt+rlZ1FTKb9niUs7bQGl
         /n69DZwCAfuwmflGhSQuI71rkpwEaOYNDrPehofUGyCbJpZ0VlKd3R6VZXt3gFx7Eiuw
         h2kgHkPKsWUC3UOg2zNp4LvpIkRuPNFxT50/RpfaDGGUOvU9DqacJb3IghEbV7VfEfg8
         puuy94s6q4pEUqK7ST3oKnVx66hs5PqNhbXva8k3nfK4w3pgbtuXZJ8URKQ/4W+pWz6a
         ofzA==
X-Forwarded-Encrypted: i=1; AHgh+RpERLo8vS2Qbl0aEhuB3P/JagejgARYOw+3CSwex/hIm+pc0qMRNz8mutxOalolYMu1Dzo+hbnM6WVz@vger.kernel.org
X-Gm-Message-State: AOJu0YxNLFBBMtL0Vv4+sVGXrRRH4Fax/Vk3a96dH/V71NrbOfzCA66J
	C9jupH28atIaVNtx0o7fliggw/q1aqlC2KSfb18NjQrwhGArizl3IljGugrulPc6XXlILLY2JQ4
	psTi2mXYTuHopM8VNRDP3NtYW5tMlwMHgsF5rIgOqtTlG4ikFklTfEYgPCIEC8l/7
X-Gm-Gg: AfdE7cncwjv8pbx4gpnxk7QKYmvz2gxMareRrBK2BuikQ/3CmuC4UR7bUN5rlSblj6K
	hc+g2ZkMQdBJKZO+FdMxNxfonl8qSeB0N8sl9Vjt0LaTfMkR6cXX2GywOtVGUJjyITfgXQsFLP6
	QYCPijcuJ+6Kd1UCGwGADInVkYcVKAA4sQFY/NHeliTPptCPIGGUMHIxidpKsTbCuL7NbrePiK4
	7DVbqvcwpuM4nFT2lnpoRE3+lQU9KfE6O9tubkEe7H1rlPCcBJxnW2shN2+mGz68hbgf6rb1k4L
	LXNU19vSTtPM7Q1V56Azu/lQxlvfwixrqUMO7JyGvHt8gkNA57HX4jalvlNE2kZpEvYDrKpbXVB
	qyW6WnU9V1Y2HRsRkQF+cO9RuKIXHtU/ZHw+w2FU0DOPiGnslsWbd7hMSijPbNA0=
X-Received: by 2002:a05:6214:4689:b0:8f1:f379:6b45 with SMTP id 6a1803df08f44-907785338abmr140180496d6.56.1784537071137;
        Mon, 20 Jul 2026 01:44:31 -0700 (PDT)
X-Received: by 2002:a05:6214:4689:b0:8f1:f379:6b45 with SMTP id 6a1803df08f44-907785338abmr140180056d6.56.1784537070722;
        Mon, 20 Jul 2026 01:44:30 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9077871f650sm87061716d6.45.2026.07.20.01.44.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 01:44:30 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Mon, 20 Jul 2026 16:43:55 +0800
Subject: [PATCH 3/3] arm64: dts: qcom: Add INT2_GDSC to MDSS on Kaanapali
 and Glymur
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260720-msm_gdsc2-v1-3-4687866d6cb0@oss.qualcomm.com>
References: <20260720-msm_gdsc2-v1-0-4687866d6cb0@oss.qualcomm.com>
In-Reply-To: <20260720-msm_gdsc2-v1-0-4687866d6cb0@oss.qualcomm.com>
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
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784537040; l=1802;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=CkRJFqt/VW4m5qRKt2q/9AJRY0uceEXzVx2depa2iLY=;
 b=eO1BQJDBvohcpLmoA6yL3Gujad6n9t74NuTPvHvef9LaH2vI8y8J2BlCtKOHVgqLCUIXL+afi
 Q4EaqItvlTbCCPXaBrGHnoOCal7EAG48XFCNy2Z2xbcjdSsLTrvOIuN
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDA5NiBTYWx0ZWRfXySvtdiKZgjNS
 NEyfl8cM09XmH3ZJsoLsQBmbReulrbSFs5E4BzSsRqLPVSx4s8KLU4vj02QOxuD2hLPwV+XV68b
 fRmuWk3gYb6BAsB/+Dy8ee0jOxRGDQg=
X-Proofpoint-GUID: mTl6AdS8GuFFnRIy4e9udR-PH6k_n0Bf
X-Proofpoint-ORIG-GUID: mTl6AdS8GuFFnRIy4e9udR-PH6k_n0Bf
X-Authority-Analysis: v=2.4 cv=a+sAM0SF c=1 sm=1 tr=0 ts=6a5ddfef cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=BnhMQQodrXrB4p16wh8A:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDA5NiBTYWx0ZWRfX+NFNEde4mpyd
 GEbU77xoAezJc24X2YUBEfJg/pt17Ywpvf4FFgu8TBad+pm3tyUkT87YDBK8rP5qXNCLsh7Q+Tn
 ZEw7hz8dcSoXEa2ZXVM6T9Tlr26Xc3/UtVIE23rooi7JhR2U2fb07dV2cGbXYrzfujguqpHxVXQ
 ym59Nmtym+iFPJHDeSI7bgvEEN+7nwSIpeFZ6lQFwqUbodCw55ZndCQqUkmnKy0R8LlZEKvlt3M
 I8fvQBzWhInkzpvGiWDW1Os9viATNANkU8kaza19s1zbe/zBNnmEly+CpV66ZtS099smi6T/i7I
 Jc7KFJJjb8/amd5T3fP7dxYDZMoCfoQaaZYyP98Cq3a5+dRvw1pFILYtgMuQDUB814LeqFuIQjQ
 KBGDCSmU8MtKv8X/EuwRDMkUqi76Rq1oPlku/nj0DX4x8UaXF5TW+kit/vqCHxaLnJfL3G4Y095
 OVE1mLxD6CWoS1Zlk/Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_01,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 impostorscore=0 malwarescore=0 spamscore=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607200096

Kaanapali (SM8750) and Glymur use two display power domains.
CORE_GDSC powers the main display hardware while INT2_GDSC powers
a subset of SSPP blocks (VIG2/VIG3/DMA5/DMA6).

Add DISP_CC_MDSS_CORE_INT2_GDSC alongside the existing CORE_GDSC
reference in the MDSS node on both platforms and provide matching
power-domain-names entries for the display power domains.

Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi    | 4 +++-
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 4 +++-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index dd80da14ab10..1e447c1d69f7 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -4898,7 +4898,9 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 			interconnect-names = "mdp0-mem",
 					     "cpu-cfg";
 
-			power-domains = <&dispcc DISP_CC_MDSS_CORE_GDSC>;
+			power-domains = <&dispcc DISP_CC_MDSS_CORE_GDSC>,
+					<&dispcc DISP_CC_MDSS_CORE_INT2_GDSC>;
+			power-domain-names = "core", "int2";
 
 			iommus = <&apps_smmu 0x1de0 0x2>;
 
diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index ace19b8b12d7..ae851adec5a6 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -3581,7 +3581,9 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 			interconnect-names = "mdp0-mem",
 					     "cpu-cfg";
 
-			power-domains = <&dispcc DISP_CC_MDSS_CORE_GDSC>;
+			power-domains = <&dispcc DISP_CC_MDSS_CORE_GDSC>,
+					<&dispcc DISP_CC_MDSS_CORE_INT2_GDSC>;
+			power-domain-names = "core", "int2";
 
 			iommus = <&apps_smmu 0x800 0x2>;
 

-- 
2.43.0

