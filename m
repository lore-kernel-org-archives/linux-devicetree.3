Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793015121;
	b=N7dyMSWg+RhEXQVLB/iazx5GoIhrO/dwmgAUKnY9KVYzITH7HBnzqjIPZou2E3iVT+5p
	 VKQ7VkJiyo66lus6KwVBODxkocg+SP0PsXBY7Lwlnl0uByvcznhlnHgfTB2I5BXHPLw/7
	 uIdEDi208MKV/KWVggT7pK6tX69bOBaNXHcR4uU9yxP/UhMooKHR0az9jZnbwsf+4jpv7
	 g3CqzjuIB4pyWSdJQMIhHkelD28ESv33fsAoGH6xcrpieaxx4g8ZvJCrXXHBcaWz263Pb
	 fyFlIAkoi4vOIg/tMuJbSeSislenhc1j88MxnftGW3YIdUJHAVLhc7nfEBcx9RRr+gA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793015121;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=g/Y6LzAx+mZUko5vnr1hIQsrUy3j7plCIhRTG7q2yqA=;
	b=e/cOlyNXQ7Hbk3b63wpxd+atJxjscwK1BXRY5sdPmGV489mo8LhAFlxqibDsKcBirICm
	 YRSFsHf7zK4Cdhl72OGrgMnDoxx4EC+rs6KuNFql2NUvFG1DYcNYSNq2GiwXFBkDPhuD3
	 emATB9XeQIP/AywsJ8UT2nVA9A6QkuAxm3nKwosa69Jsijs8aoOq9qT2gZbw7aqwQHY68
	 HMcX4nz9UOmdPpMx+UCv1P/DlLTTLdFoLsoLWlysnex6i2gUyTKN9cnI4N3u5ZxZ9zpxM
	 Pp+sZiUYOOFGihdfTm2qbq+ljyoY862AnOB88iNDtgFP+EI/IEiPTi2obqxGmWG2iYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mRku9r6w;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SQg0bVaM;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93E5D606A328
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 11:45:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93E5D606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mRku9r6w;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SQg0bVaM
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAt56c3034427
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 11:45:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	g/Y6LzAx+mZUko5vnr1hIQsrUy3j7plCIhRTG7q2yqA=; b=mRku9r6wnKvmJyE2
	UHPF/6O53+05xDrMXQWquEQC0tUYwSpeu7+92bMRrd/NXpEEMUPgulHOMFAdHaYl
	ZnVGZzTdVHxdRW+P7Mb/+krNc84iy4dyAEXdtDj1PJsayTJDhxTkbmJ+FTeLa+UF
	OyU4vjSYYXquH/z5ZTvT2h6ZwRJR3hOJNhLHpHPzEDhqPSYxCgu6gPcRUO6kWu3S
	O78aI2E42QXSDGQk3IMz+DDVwg7us3cZcgmjpBAlejglSjbpbCCvpZIsufXV6X/E
	mlkyVm8w9rqtkdk6l8hPLLpWFK4jqsk0JIbrOv6wruOgsItiyxBf6sbXp75wCtNf
	do6RYQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj56y07mt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 11:45:14 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3acc98e3b3cso2656751a91.3
        for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 04:45:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793015114; x=1793619914; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g/Y6LzAx+mZUko5vnr1hIQsrUy3j7plCIhRTG7q2yqA=;
        b=SQg0bVaMOuu0k0aDxlN0oiSNlwrLjseuq6l97xHiCJ7AZ7y7xEZjXHN4tNbM7b9omx
         4ts6xVVrkTppKqAvSPCTcS3EvjDNlUveZImDlEA1EUIAuD4AlKe4kgV2pFHP0YBviQFQ
         /A3TmoFo5wdnwtdD6f4xuV4OFxyeZ+gyDMdMUXds65ZiikxGJkLOjziExtxkWfQ9aoqZ
         kR9IpwNTLTaC9VBPP3tffIH94SmqTQJ0E/0xgl1k2IeDG/OyHpppdbkOQNHd5oUhVgqe
         y27jAwOhLzA6IWP7OkuSTBqB24ROo6m5EURjKG7N+Y9/8c0VvNZTuDUnYpH4Pqp2v4si
         drqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793015114; x=1793619914;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g/Y6LzAx+mZUko5vnr1hIQsrUy3j7plCIhRTG7q2yqA=;
        b=mRTaJf5PIzFzZmnPDDW6z4zXLtRZa6Vhqf4v925rW3/GGxfkA0K0ZJlCJBi681hMIe
         EARGFAc9mt/dV2nKVqzGkv9PI9Q9kD12/6wyTIGhIb3cJVH+RIOvo0Ck2C6I84mM+03L
         uNBQQsSfSOXGgv1W/0RH6p1m8oz20Ks8jFB+vFi2TpFCEmfxKyayiT1XvR1rnwijTqDm
         Qo2GvNndFpZINdr2Oa/hCcGC6Qb8sgDfm/cOLFvnL150fV5TEuGo8P/ts46616OBWh39
         w6xZls/B5unIPoxHcuFpYS7S74nvsCWvT3PF3qW1QzX+qHZ+mvp57Sjf82aO5Fi6Cw6K
         lUig==
X-Forwarded-Encrypted: i=1; AKwUvByl2OWMptwrqeyl7l18f503Bzu39AvFxvfZw7lafWXSg9satjdqi6zP16qa+9ZtquOphxkiPduFMm0M@vger.kernel.org
X-Gm-Message-State: AFq9FYKjewovK0m1m7m5xqOgbJkRoDZdjoEOgSFHVi2OYbW+dM/Zt2Og
	Oi1nQKLQ+A1TbLu0H5IRD482+N48bvaeUQVG/K8Ha7QkAIBrhHiuWZ6zyPKpsErltZNHQ5FhWoU
	Ue9+vAQ/8YjJoXMh5h/wsPg6kJw9BT6S2d8TTCzg5C5uuOHnXZejJgg9/ChdKuZq2
X-Gm-Gg: AYBFou1mN/kffh6f7oZdMYgDSe9ZtU6KxsEPC3tdC9Xv5KBYpyysQuGf7DurH2KddZA
	TPtsuKD0Fi/bm1eDPLSG0o3wk6XmcN9cLH3rXP/giiO0Sqf1aA0n7V6GFi7WvKY9jSzB3xlNJMy
	K37ajVwwHOy1/ccxSqsnrvWdi8Sl1fbywEz4UiNNFLNDrU5aoNHlMGIKQOboVSX8ceW5EHi7ydL
	TqIH4eLUpWjd5LSXkLHO8hDobzEwMpytMtZTM6j5WLhivmN5eP7ECkokdMT97CDv+OM57HhMNCN
	OghCywSk+unMr8Vi1EI/dGOy2PFJ7XLx6BEGh539Z4OO2dDJNaTLJag8118oDHqmCqoQy+Jw3zQ
	sWlX4FN8tkAcYYVL7F8bb4SLyF1Vle8efjCk=
X-Received: by 2002:a17:90b:57cb:b0:3a8:92a3:8baa with SMTP id 98e67ed59e1d1-3adeabde80bmr5885517a91.27.1793015113342;
        Mon, 26 Oct 2026 04:45:13 -0700 (PDT)
X-Received: by 2002:a17:90b:57cb:b0:3a8:92a3:8baa with SMTP id 98e67ed59e1d1-3adeabde80bmr5885470a91.27.1793015112630;
        Mon, 26 Oct 2026 04:45:12 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebbb1a13sm7909588a91.2.2026.10.26.04.45.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 04:45:12 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 17:14:34 +0530
Subject: [PATCH v4 v4 6/7] arm64: dts: qcom: shikra-iqs-evk: Enable sound
 card support
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
Message-Id: <20261026-shikra_audio_dts-v4-v4-6-cfebe0809467@oss.qualcomm.com>
References: <20261026-shikra_audio_dts-v4-v4-0-cfebe0809467@oss.qualcomm.com>
In-Reply-To: <20261026-shikra_audio_dts-v4-v4-0-cfebe0809467@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793015085; l=4348;
 i=mohammad.rafi.shaik@oss.qualcomm.com; s=20260424;
 h=from:subject:message-id; bh=wm7yS0gZUJpW3AMWVZW8HSsAHuJEx1vpq+RHBpsBEN0=;
 b=Lx4TqibAcuQAYCNW1ngW9NxdsDjYHb6LfUNmWsJq2zvWe2v8YZt7HDb3lQXw9JCKxj+3FN+Uj
 3NIr0ONm0mTCfRxc2Oj2PsOuKf9DFOOHcn6obqO89TihspcxKXcnOG2
X-Developer-Key: i=mohammad.rafi.shaik@oss.qualcomm.com; a=ed25519;
 pk=KZedmYgMGYOzuTpLGv56tdrL+pTLDP8pdmfQ91xemiA=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA0NiBTYWx0ZWRfX1K/imiaywsa9
 ct0eatXFfeLuJyGyHeSIAZ5jsWh6c816m1Mvnco/+e/uV3WWgMcSTvqp8qsdYWfeRSxy87WCqA6
 VLyxV7F9O32keW8ruAWz86/9DLGTUW8=
X-Authority-Analysis: v=2.4 cv=eMeGH3p1 c=1 sm=1 tr=0 ts=6adf3d4a cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=gAFAZ2oFMDLOpEcE9BkA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA0NiBTYWx0ZWRfX9fD0Bh82UKYv
 SJsQHe96KzmZZtz5P7xo+2CSoRVuu8w4cnQoqLyannlhP2QsOpEDX4+rLVYq4HNJcrBs72A6hBW
 PtdFzWj4Lw85jBjBQYenjyoUbdnS5E/wZ0iBwjjQNDJl2xKUvEA1agFsQC5dDmZMBZzRoMcx/+T
 IOTYQSGL8qkxUx2WgGMi44gMeJ4lcIwtBLjuP4F9smh4ynoHvIwqup+P3JSUMAl0YGh8Zta2otr
 tlzKJREFTdROi9C+/M1GxzEJpRi1zac6BvAmUYB+AnRJBQBhoKuBE0DhrMpRZRdjsoYNA5IqQ9p
 lXaR06aw8+rxcyy8c05MrJXhbjZ3De8/RZZbAzRQytjVKAJSGxYHY+in9PdsWiEuWrD2DpBq0Bb
 2AD4jUa0VH3AXOGGAL6PBjYJdPPFtXHE2OdLIKmJ2mxQPfvu+hlDUq+2YW61aF9OoSco7ITxTjV
 OVfgQJQp+CtfC6BEw1A==
X-Proofpoint-GUID: Uoc3bm00PdfSL6464QGrG7yktY9DLUVQ
X-Proofpoint-ORIG-GUID: Uoc3bm00PdfSL6464QGrG7yktY9DLUVQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 spamscore=0 phishscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260046

Enable the IQS EVK audio card using MAX98091 on I2S0 for primary
playback/capture and VA DMIC capture through q6apm backend links.

Add board clock and pinctrl states required for codec IRQ, external
mclk and digital mic routing.

Co-developed-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts | 159 ++++++++++++++++++++++++++++
 1 file changed, 159 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
index 5df30ad8211f..473dc18b7958 100644
--- a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
@@ -23,6 +23,120 @@ aliases {
 	chosen {
 		stdout-path = "serial0:115200n8";
 	};
+
+	sound {
+		compatible = "qcom,shikra-iqs-sndcard";
+		model = "shikra-iqs-evk";
+
+		pinctrl-0 = <&i2s0_default>, <&ext_mclk2_active>;
+		pinctrl-names = "default";
+
+		audio-routing = "IN34", "Headset Mic",
+				"Headset Mic", "MICBIAS",
+				"DMICL", "Int Mic",
+				"Int Mic", "MICBIAS",
+				"Headphone", "HPL",
+				"Headphone", "HPR",
+				"Speaker", "SPKL",
+				"Speaker", "SPKR",
+				"VA DMIC0", "vdd-micb",
+				"VA DMIC1", "vdd-micb",
+				"VA DMIC2", "vdd-micb",
+				"VA DMIC3", "vdd-micb";
+
+		pri-i2s-playback-dai-link {
+			link-name = "Analog Playback";
+
+			codec {
+				sound-dai = <&max98091>;
+			};
+
+			cpu {
+				sound-dai = <&q6apmbedai AIF_MI2S_RX_0>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+
+		pri-i2s-capture-dai-link {
+			link-name = "Analog Capture";
+
+			codec {
+				sound-dai = <&max98091>;
+			};
+
+			cpu {
+				sound-dai = <&q6apmbedai AIF_MI2S_TX_0>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+
+		va-dmic-dai-link {
+			link-name = "VA DMIC Capture";
+
+			codec {
+				sound-dai = <&vamacro 0>;
+			};
+
+			cpu {
+				sound-dai = <&q6apmbedai VA_CODEC_DMA_TX_0>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+	};
+};
+
+&gpr {
+	status = "okay";
+};
+
+&i2c3 {
+	status = "okay";
+
+	max98091: audio-codec@10 {
+		compatible = "maxim,max98091";
+		reg = <0x10>;
+
+		pinctrl-0 = <&max98091_default>;
+		pinctrl-names = "default";
+
+		interrupts-extended = <&tlmm 28 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&q6prmcc LPASS_CLK_ID_MCLK_2 LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+		clock-names = "mclk";
+		assigned-clocks = <&q6prmcc LPASS_CLK_ID_MCLK_2 LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+		assigned-clock-rates = <12288000>;
+		#sound-dai-cells = <0>;
+	};
+};
+
+&q6apmbedai {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	dai@153 {
+		reg = <AIF_MI2S_RX_0>;
+		clocks = <&q6prmcc LPASS_CLK_ID_QAIF_IF0_IBIT LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+		clock-names = "bclk";
+	};
+};
+
+&q6apmbedai {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	dai@154 {
+		reg = <AIF_MI2S_TX_0>;
+		clocks = <&q6prmcc LPASS_CLK_ID_QAIF_IF0_IBIT LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+		clock-names = "bclk";
+	};
 };
 
 &remoteproc_cdsp {
@@ -89,3 +203,48 @@ &usb_2_hsphy {
 
 	status = "okay";
 };
+
+&tlmm {
+	dmic_eldo_en_default: dmic-eldo-default-active-state {
+		pins = "gpio71";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-disable;
+		output-high;
+	};
+
+	ext_mclk2_active: ext-mclk2-state {
+		pins = "gpio110";
+		function = "ext_mclk";
+		drive-strength = <8>;
+		bias-disable;
+	};
+
+	i2s0_default: i2s0-default-active-state {
+		pins = "gpio105", "gpio106", "gpio107", "gpio108", "gpio109";
+		function = "i2s0";
+		drive-strength = <8>;
+		bias-disable;
+	};
+
+	max98091_default: max98091-default-state {
+		pins = "gpio28";
+		function = "gpio";
+		bias-pull-up;
+	};
+};
+
+&vamacro {
+	clocks = <&q6prmcc LPASS_CLK_ID_TX_CORE_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+		 <&q6prmcc LPASS_CLK_ID_TX_CORE_NPL_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+	clock-names = "mclk",
+		      "npl";
+
+	pinctrl-0 = <&dmic01_default>, <&dmic23_default>, <&dmic_eldo_en_default>;
+	pinctrl-names = "default";
+
+	qcom,dmic-sample-rate = <4800000>;
+
+	status = "okay";
+};
+

-- 
2.34.1

