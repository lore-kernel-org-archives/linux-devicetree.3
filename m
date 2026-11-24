Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795527030;
	b=p17YvrCSjk63VEiEKTwQ653sIX1HpUqjkFAgr5WIlT8MJ1CxXG5pLu9cfug2oXwO0+Ea
	 zejFHkXej0p00Zd8prM8ErXHkNnKXlXXX6Vuy3CPWx5C+PmHb/oodtE6jkTb4dH4lhLJx
	 fx7gFjv4xP3/0UXD+JiLMD/7k6o/Qzb21Z8EUS4ZkuQ2X8r4McQMYgET4Z732fgVhoJJi
	 8UYqQj1pZSMpe6FF3yNe3iCzI5woct/pLMkc9Yfr43LoM4Jfh0MoPKB+4yEmUqNJFE/Dw
	 lQkQokOCJ8afNiGFrVMkyjj4XJ29t5zFbs3T0YrgNKrE6P2WiM3n5B40CW0UxIy9ZfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795527030;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=kSz60ixsAltKUoHcGmsZcg9w8jYAlOU9XrNtf1Gkbcg=;
	b=ErJJA1PEdhijFoLIRbSkwmN4sA4Vaj1mDmKPZ0Jz9g4qnlVEpPxvfVaofxFd1O23llbq
	 5qviC4A9rL9f62nqlYp6xXZzTdZw7/ZgygjaVV4B5VvCyGCkwq0xGrf8j76tbPdW/XGak
	 YbsHoAdzr3HNndNamje7fbnGZuwb0pKI/AjlwS0QIRRP/SB6nqlKqEW6XqSEa7hUTNVeB
	 tVjUtiIkpW9GPv08fmzdmmDu+5y7Xa5VsVUvclAQrO4sWUec1Hwjp4CclzQr0GqfRou7n
	 tdNJxuwOv8qnGzz0SZKBw/geJM78chDzsBn+DIKwbHneTeK58VdJ9vgc7yi6SVRfa4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Es++B80a;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dpSpjJOe;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0176D606A327
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 13:30:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0176D606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Es++B80a;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dpSpjJOe
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOAujQ1601625
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 13:30:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kSz60ixsAltKUoHcGmsZcg9w8jYAlOU9XrNtf1Gkbcg=; b=Es++B80agng9b4xK
	ONkCQxh9pzsx+/pQab8RJwmpKobkSUCgzn1sIKMLspxYqdeT3xQMAsqSj3Ka/BWx
	JOXvxtkCPF63QvyuOTVGhvHWzAgqVK2MX2xak8Zq2VCw6P3N13AoBi0eDVsdGpyz
	mCI6QVNHPKpCzCuk9e0HhY4Y8hwzmLC9JKR+xJL3z1Oz1kWAGevHTT/rJO48fMs1
	9GTxrn+pHirk/9szYcloPhmWwKIxQtL8ihT0GNV8zMr+zlZ7M34bPnzxXwFlDOU7
	3unv2BsoGKxBhB81xpzOwC03sxkbAIbtkk33dk0hKsQeg0N5Y9UGAWpedK/YF/cz
	zK/QUg==
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com [209.85.128.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j50ky2uhb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 13:30:29 +0000 (GMT)
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-8b39978cb4dso11885397b3.1
        for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 05:30:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795527028; x=1796131828; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kSz60ixsAltKUoHcGmsZcg9w8jYAlOU9XrNtf1Gkbcg=;
        b=dpSpjJOey0Z+wQUUVdfGa/Vyqhj9YxfodK83Dh/xqFTi+f7Q5IYufwM/fBHLA5rgAU
         JDb6cGWVJuE81OYyunvOYH1CrjcAJgpTALRmpNDfgl1DmVSR41WEikS6EqF2tP16o9Vt
         T07ha9xSc8HHWqZrXYhCZRKDrEwQCRVqjbVGxb1nASXov5ag2re9ax+MxwqOOddI2x6E
         SB+X7wRT1rq+HJCT05T5WTH1X6N/rDCHLosWqQIShgWf4h2vPy1QOQLOwM6aKEVG7xHF
         VYB7rRSKRVQ2dR5LbB92QjQ0c5RehrxCkBG4WXzVJkbzOpNEzSawXxIy4Fa5XMruCrTq
         tLZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795527028; x=1796131828;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kSz60ixsAltKUoHcGmsZcg9w8jYAlOU9XrNtf1Gkbcg=;
        b=nCrpq56B+gkS3BJt7TUOEU+80YDKCdokd3jIyRMBx0qR+a2hfLeVARekD/KyAzNboA
         i/fWGFZBB4uLYLL+X/kp4Y3VNhwjhIZWl8NXd8Z2yI0BPnScWrfN6jmaGGGh4lPYlXcj
         tCjjarXdDi+wttc9NYn8Ijo32Zwqdij0oXLf07GEF74y73OsBco2vNJVTK9uXX6XwocK
         DF9G7BdAOEbHfrk/CvX/JlHKgJbdllKPhAVG3AWx5QzPZrgQm68SJhywpYQFi+M9wCjD
         ATV6CpMa/HTHN0GAuiXJu51x5zDQICtG3jilDAOGVYmvk2pumxBdzn0IeDl1mVUGQLkm
         dMOw==
X-Forwarded-Encrypted: i=1; AL+hErGKeG3tD6JHGV6TTF/nihGKhFcm83clVbMefLPHVgRPT75T/Qy4ChY259/qmyb1tmtqn65Aky+VFyZs@vger.kernel.org
X-Gm-Message-State: APuU4Z8qI8xALKBLm2e+bJ8NNuCFqHgsdLS1UQg/Rt6p83gySB0IZ6tH
	sOtIVmqQcuW8+XXQRoMlD2J7t8kEHi7/3OJD6jbR9LMd0tkOA+/3gg2VwHadl5/wTXAOj1M20EU
	ev6/jga0K0mv/mgzHsGFBiw+XRsJAQ3+t/ViJYcIGGSO5AX1MMLmQjCdULDzIJe0RN5janTF3
X-Gm-Gg: AZFdTZe7FWxjBs0z6I4L8nEMB4CmBei0/+05h5qA7EcbEcoXR3q9X6rhseBHGydtHRE
	CPxIyrpd+823TR5k124pdlp1U4A00Pl3Zwo5K9NUrUprVFJNEgzDvR2fRzybgHUp9xc2vGH00+G
	SphtvRzniQB8H+A/GEy67ugREeb5JNyP13AzsSk6foFv1VMC6yuET9wH86E8/muXAJj77SGnPUN
	IFE/LWmUko5uy3p0057rj0tmLFLi0m1dyOdWqPSYLazNYskpRKY+zbHvPlKmb8ArNr+0n2vBpAk
	HVW0C/i9UbrJSzyvqNm/OEeqD5CIVDnUiuVEaVmoMMvXfC8KYlDnxPE2W6y8k6iFd90U/gmFQWb
	Em8PnB4tW8ioyUgab/K7/UMcYVe82TFQBfDzYROkuvdoIgSNkEEiNC3qzAM4cnsa9p5UXKEL6oB
	duBNNJOUo=
X-Received: by 2002:a05:690c:a0cb:b0:8b5:136f:220d with SMTP id 00721157ae682-8b52045f53dmr79114857b3.3.1795527028108;
        Tue, 24 Nov 2026 05:30:28 -0800 (PST)
X-Received: by 2002:a05:690c:a0cb:b0:8b5:136f:220d with SMTP id 00721157ae682-8b52045f53dmr79114357b3.3.1795527026873;
        Tue, 24 Nov 2026 05:30:26 -0800 (PST)
Received: from KDYBCIO.eu.qualcomm.com ([2a02:2a40:15fe:b200:a546:3db2:3be0:87d9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4b1ed8b6a05sm11659080f8f.43.2026.11.24.05.30.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 05:30:25 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 14:30:16 +0100
Subject: [PATCH 1/3] dt-bindings: clock: qcom,gcc-sc8280xp: Add USB4 MISC
 resets
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
Message-Id: <20261124-topic-8280_usb4_clks-v1-1-be083a711eb4@oss.qualcomm.com>
References: <20261124-topic-8280_usb4_clks-v1-0-be083a711eb4@oss.qualcomm.com>
In-Reply-To: <20261124-topic-8280_usb4_clks-v1-0-be083a711eb4@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795527022; l=1650;
 i=konrad.dybcio@oss.qualcomm.com; s=20260604; h=from:subject:message-id;
 bh=3V1LwUrzFtkyX8gsvhaGuSuz2iOQm/r4ACIfiK+B1oY=;
 b=NX4lpesLNZvAs+Xf+UDl22Mo5N4iMOBqSM8KmDwtc+vwj2rxivqoMW9H1PGp4Wazl0+hH4Y5N
 cu2kme1L4iWBr1TNvuDcKZjJKHNqn4t70iuWHdKILWG+VCpSI5c7YCF
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=SGRRMmlLTuP/lGKdQ0f4KPvxn8VVsXtXaTpdGc8i82c=
X-Authority-Analysis: v=2.4 cv=Y+ptIReN c=1 sm=1 tr=0 ts=6b059175 cx=c_pps
 a=72HoHk1woDtn7btP4rdmlg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=EQwe2IC4Xa6s3jYMUEgA:9 a=QEXdDO2ut3YA:10 a=kA6IBgd4cpdPkAWqgNAz:22
X-Proofpoint-GUID: fvncNEqSiPbuKqx7JSfaSjThPZ7ElXPW
X-Proofpoint-ORIG-GUID: fvncNEqSiPbuKqx7JSfaSjThPZ7ElXPW
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA1MiBTYWx0ZWRfX9wbx+lEQrz2g
 aIyZ+HLAMKu1c7V6ZjrfyV2FAu8Ygr4uGsdEa0Y4gjyRD1dW1cMn9853WAo8lUAgHJniv+hi9rs
 Kc3/LfI0wqkUgz6rV91nDYz4TA4hjJw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA1MiBTYWx0ZWRfX86DpOG29RmuA
 G+Hkd7XQcV7vhAHK9HSlUIxIIjk4gvogWigoD2T7nslJ/Yp73oqNbxF9jkj7pQ4vmwjtNO2mDPV
 jDwrlBJuZtZ5ONKuVquumVkzrY2S6LzYMvRt4T0EM2mvZ1IlxeIsMuBvxPKQeMANMV8b3X7IFCS
 gu0UJzi/3hjRxB4yegVasF8u/mQwIWvJoIK7azjrJUBoFPi0fWtKLzXSgzAXM76wGF4fXzAaXLm
 LlfnEf9Kmp76EAJC+mmwiRzRcHLyZMcokX0wYRPs6LM/zj0UmiGYNNw9EqG9ho+la4iDzo7kPDj
 99T0lAHWGituukdEeuVS/oqNiZlNm/LNuMFO1nl+BUq2AcUHASh46yFaK4LChs2/i+TdIjk4Wyr
 N4K6lqq4wEU8x9A4Mdpll0hCmWrsCn3wYb7ST+nyr4kCs0yBkfZOAQ0vYBtjX5jIRUDj0hyFRAc
 mtuf95uzRyWgHVYhA6w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 malwarescore=0 adultscore=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240052

Some of the USB4 resets were not initially described.
Add indices for them to allow extending the driver.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 include/dt-bindings/clock/qcom,gcc-sc8280xp.h | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/include/dt-bindings/clock/qcom,gcc-sc8280xp.h b/include/dt-bindings/clock/qcom,gcc-sc8280xp.h
index 8454915917849da3498e4f2fcb551d2730b62f42..649c4d841f3c41b6f9dfbceab3ff74b27fd77485 100644
--- a/include/dt-bindings/clock/qcom,gcc-sc8280xp.h
+++ b/include/dt-bindings/clock/qcom,gcc-sc8280xp.h
@@ -478,6 +478,26 @@
 #define GCC_VIDEO_BCR					76
 #define GCC_VIDEO_AXI0_CLK_ARES				77
 #define GCC_VIDEO_AXI1_CLK_ARES				78
+#define GCC_USB4_MISC_USB4_SYS_BCR			79
+#define GCC_USB4_MISC_RX_CLK_0_BCR			80
+#define GCC_USB4_MISC_RX_CLK_1_BCR			81
+#define GCC_USB4_MISC_USB_PIPE_BCR			82
+#define GCC_USB4_MISC_PCIE_PIPE_BCR			83
+#define GCC_USB4_MISC_TMU_BCR				84
+#define GCC_USB4_MISC_SB_IF_BCR				85
+#define GCC_USB4_MISC_HIA_MSTR_BCR			86
+#define GCC_USB4_MISC_AHB_BCR				87
+#define GCC_USB4_MISC_DP_MAX_PCLK_BCR			88
+#define GCC_USB4_1_MISC_USB4_SYS_BCR			89
+#define GCC_USB4_1_MISC_RX_CLK_0_BCR			90
+#define GCC_USB4_1_MISC_RX_CLK_1_BCR			91
+#define GCC_USB4_1_MISC_USB_PIPE_BCR			92
+#define GCC_USB4_1_MISC_PCIE_PIPE_BCR			93
+#define GCC_USB4_1_MISC_TMU_BCR				94
+#define GCC_USB4_1_MISC_SB_IF_BCR			95
+#define GCC_USB4_1_MISC_HIA_MSTR_BCR			96
+#define GCC_USB4_1_MISC_AHB_BCR				97
+#define GCC_USB4_1_MISC_DP_MAX_PCLK_BCR			98
 
 /* GCC GDSCs */
 #define PCIE_0_TUNNEL_GDSC				0

-- 
2.55.0

