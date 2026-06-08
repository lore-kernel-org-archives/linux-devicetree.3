Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7342372066
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 13:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780924295; cv=none; b=pxpeIK1CWahO23zh1LDVLztxslgtyP6x4D8qrWr0xPCVu+DtXTryK1DfXrtWI+NiPG4XWOAV5H2F1VySpWIqkBvzPdGKtaJtnQ91clbj6wXKW6QT3a0jgQTjE3K+9VpotNg7PCo/vZcxHm0gbR/lsuxqQ8th1jpEl3sj3znFZaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780924295; c=relaxed/simple;
	bh=O0ITinEiBDoqyNtfUbyM/puvl4+BRtjPN1CGKUba4DA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CoN/LK76a/GG36r/XbfQOyYDj7oQ/dnov3Sjqya3tQ7te0rR+czbYoDIQH5Q99Ydz7HyTQmCPn+8CsNdwqfnuISoUFCTSS7PRLN5P+vglhiyGjNtY64fgd6ZOG3NjBBNMbwory0lvB8ekysF4g4B9uSXaGsN6CgvXBMA5RxhDJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o5oGz40H; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PTo0uW1T; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o5oGz40H";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PTo0uW1T"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658CThfC3658215
	for <devicetree@vger.kernel.org>; Mon, 8 Jun 2026 13:11:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gl6RrGCb/bv32859x3E1VYQ4SH2J4WZy2L+TCOfEc9g=; b=o5oGz40H352MsgMN
	lAGVwq5cHkQYe/rufKWn3mKLn/McLh+Ttr3fg07QKGbWG82iIbu4t6kt9f+bx1WS
	l4GCCPfsMMod3+s71eI+8hjvVcyQfo8MS//DdqAZ829L2yIE9JfkEhufcaTptKNB
	9hULS23NTGSlvTFCNivNlSYckS0QGLjJPRAHwOGMv8Xf0j+R7eS7c6dkTTtQIaJB
	ivz77YT/DtvS3qcpt0YD85ScItCac2D5jWIz7eC8MgLDJNZQmHLWQ42xwdhw9unH
	hhkaGXEepEhBU7ZyTXjvuqsQgkWgdeLk0M3Z49Eth9KA5gcOOUxjkENxsJxe6Arv
	WGNCeQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4enwsv868d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 13:11:31 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2c0c272e532so45647465ad.1
        for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 06:11:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780924291; x=1781529091; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gl6RrGCb/bv32859x3E1VYQ4SH2J4WZy2L+TCOfEc9g=;
        b=PTo0uW1TsOTFZclWmo7FBoRu8jKUO8hUdXfqEV5qFDRp1eiPVmuMT/0qxkopCx7kWa
         +s9fJaWRe7lVYHySMawS+W1yv+RvngqOg5q8bVRF381AzBG+5shLRmo9s4lZ1yPp5wCA
         7lb0z4VH6Y0sYgt9I1QhFVZ8H8AE/WWokVxiMMRHT5qkKImjtnI3VqeJfhvK1Q1WiAYz
         /G01jHSRZne7rkgjkMd6/dWwSChkxvrCDGPcLJZTeHja5NjnIg60UxdTdru/9Du+CESK
         BNI1ew3VkSmM9rFtW7mQzGxmRJxK1YIsn9Jwl+f40IB5JM5MWiHEp8u47AozOEcRL/Zi
         l8IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780924291; x=1781529091;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gl6RrGCb/bv32859x3E1VYQ4SH2J4WZy2L+TCOfEc9g=;
        b=Q+4nCbAqASVGyjiSTteRBlSMlxVgfi5UEg27K1EA3gOY77nNseRKY92qKPh6JGSdEJ
         pFAeX/YnwGTjKWacH3AIQ1oXwMNKhKG4GOHA66re5pn12fBZ+gUZuFQhb2Ny6Ygj+LV4
         ZWFlfvZzbnzHmKEbIdBpsegQ85zwSo7xVW+iHLiiItpQ+6LzAguGAdpzMQGkzf+0f8zI
         O1dZjhzuQcin6Av0O036GUPQvlR8n+HJAuxzZN47iKBVN0fGiZ84+y3tZ9AB2SiEBnBR
         lB9yWJW1+p1XDyu7jLfLz7w2wm/tpBIbMEWbDBcxLuBOnkaTzfoi9NOX2D4eUG7DnMnk
         S00g==
X-Forwarded-Encrypted: i=1; AFNElJ/GSfejLLTHIs540mDtrxqNTxpGuoZRsgdg8C5KUDePB32Lzf3FYBHskd1ljdboR5BgnJ9LHMCWYINe@vger.kernel.org
X-Gm-Message-State: AOJu0YyKHPVj5rHGFKdGbAPiEj39krxdqw5aslJgyaNPkTHkPXtjhrm7
	QvUJ3JT3NwubnXem/y79WsvVnH7RfJ9Cc+M/jXUXWZ9dOzrH2VcXAytNqkKdWXRBbmjymqAc9E/
	lzNghGtL8Ge5suriFyOwEyRvuaPb0k6LxAZDY8wH1DcolWu3fDQc5bfWCvk5yheDm
X-Gm-Gg: Acq92OHFih0wgx/m6hvdy9ITVNpKAANjMFSOhp2+BTBmZVm0rZSRuBla+Gu8enL/veN
	qN7CglWQzdvdaw+c0Sy7JxviRFUR7jQ6so86DQplHvWj8rVXuZKaHGG2dFZpwPj8yOWGgxeCkBa
	oelVQDOAvECbabDiBQTABdolT8rDgzaqbSd0Pytu/U6tEolESpXGvRaNH16G7qosbwHQwBcgzwq
	da8AOnrKT5Kxs/igK/xjAy1FDsTcM/rVEexTs4HH6NG2lljCExhtGFOitmgy1UqOdrIrf6ev0Bk
	UfkHYIzXDtuGA+TTqkP98agUaoxkjgtg8MD16fFbfYMkrANIGxYg4rthcJ59cSG//mUQN/SUQ0Q
	Ke0rscUlCLbwmVbDtFdK6qZSIPMj52AM+Vrp0TkHjIt9bAsE=
X-Received: by 2002:a17:903:1965:b0:2be:1c3c:72ba with SMTP id d9443c01a7336-2c1e80edc5bmr166945045ad.32.1780924290423;
        Mon, 08 Jun 2026 06:11:30 -0700 (PDT)
X-Received: by 2002:a17:903:1965:b0:2be:1c3c:72ba with SMTP id d9443c01a7336-2c1e80edc5bmr166943945ad.32.1780924289731;
        Mon, 08 Jun 2026 06:11:29 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c1664ad172sm185235845ad.83.2026.06.08.06.11.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 06:11:29 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Mon, 08 Jun 2026 18:40:28 +0530
Subject: [PATCH v4 08/10] arm64: dts: qcom: shikra: Enable CDSP, LPAICP and
 MPSS on EVK boards
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260608-shikra-dt-m1-v4-8-2114300594a6@oss.qualcomm.com>
References: <20260608-shikra-dt-m1-v4-0-2114300594a6@oss.qualcomm.com>
In-Reply-To: <20260608-shikra-dt-m1-v4-0-2114300594a6@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780924231; l=2571;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=jZ5sk6mDCOuUmvLcAvbMml5Kmz0BhTO2YLQnfm6VPW0=;
 b=iPU4VF9GBAJVNtLfvVcV5Bu20W5HoLd/rGWsPqI9feK38Il9JMxP7W8SZ7FTvIe7L7uvrec5f
 60iHI31D58ACiVfpxLBpVd+GG3O2i2BJLj56xerILcRwXBku0YoUQhc
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-GUID: XNtXbeQKaKGou_102RSSfCaREeQPv6wa
X-Proofpoint-ORIG-GUID: XNtXbeQKaKGou_102RSSfCaREeQPv6wa
X-Authority-Analysis: v=2.4 cv=dIaWXuZb c=1 sm=1 tr=0 ts=6a26bf83 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=nu3v8zf0uA-Bo5sjUnsA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDEyNCBTYWx0ZWRfX3nIEYt3lMYRp
 /YXXMM4UDV/6MYeRwM+ms2ZOygEFSIOrODHuNEZ0XbCUs7H5OT73UIriSeNzvf+mG8/yLfOn9IG
 ZBMKOcVzaEkwuW900lkoh9vgEI//MnvUJaqVgF7RTQNKYUKOXhKwudwhKKspterwi5pu4CgZIE8
 Vtt+UP120AHUM5jJCr1Eo6A1S+B5UOogPeO61AyKKEoSx+mcodgwR4zM7oVk9eBTZJ7gGO1pVxl
 JpxatHAeW/HIjSF4PWvKnuONk20ojW56q3q1nAggJ99GdoGh0KVbV7VLhik+9Q/FqgheqC8Ss/K
 JcA2tp130326bBlgNY01JnT2goD1yuAH+OgrgaWYFdWfbZQfjBi9T3xSiPVKKFpjx4wq3eb3SR9
 oPAZ/28XV7GwwU4e4vbMOCMBL6WqWuxQQ9eMVwKdpJG+Szp1wB/n+6/PaQB3nnrmwszmptS7zyL
 dcigQiKqgmlmZFHlEjg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_03,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606080124

From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>

Enable CDSP, LPAICP and MPSS for Qualcomm's Shikra CQM, CQS and
IQS EVK board.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts | 19 +++++++++++++++++++
 arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts | 19 +++++++++++++++++++
 arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts | 19 +++++++++++++++++++
 3 files changed, 57 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
index 0a52ab9b7a4c..b112b21b1d79 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
@@ -23,6 +23,25 @@ chosen {
 	};
 };
 
+&remoteproc_cdsp {
+	firmware-name = "qcom/shikra/cdsp.mbn";
+
+	status = "okay";
+};
+
+&remoteproc_lpaicp {
+	firmware-name = "qcom/shikra/lpaicp.mbn",
+			"qcom/shikra/lpaicp_dtb.mbn";
+
+	status = "okay";
+};
+
+&remoteproc_mpss {
+	firmware-name = "qcom/shikra/cqm/qdsp6sw.mbn";
+
+	status = "okay";
+};
+
 &sdhc_1 {
 	vmmc-supply = <&pm4125_l20>;
 	vqmmc-supply = <&pm4125_l14>;
diff --git a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
index b3f19a64d7ae..e62ba5aef71f 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
@@ -23,6 +23,25 @@ chosen {
 	};
 };
 
+&remoteproc_cdsp {
+	firmware-name = "qcom/shikra/cdsp.mbn";
+
+	status = "okay";
+};
+
+&remoteproc_lpaicp {
+	firmware-name = "qcom/shikra/lpaicp.mbn",
+			"qcom/shikra/lpaicp_dtb.mbn";
+
+	status = "okay";
+};
+
+&remoteproc_mpss {
+	firmware-name = "qcom/shikra/cqs/qdsp6sw.mbn";
+
+	status = "okay";
+};
+
 &sdhc_1 {
 	vmmc-supply = <&pm4125_l20>;
 	vqmmc-supply = <&pm4125_l14>;
diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
index 3003a47bd759..727809430fd1 100644
--- a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
@@ -23,6 +23,25 @@ chosen {
 	};
 };
 
+&remoteproc_cdsp {
+	firmware-name = "qcom/shikra/cdsp.mbn";
+
+	status = "okay";
+};
+
+&remoteproc_lpaicp {
+	firmware-name = "qcom/shikra/lpaicp.mbn",
+			"qcom/shikra/lpaicp_dtb.mbn";
+
+	status = "okay";
+};
+
+&remoteproc_mpss {
+	firmware-name = "qcom/shikra/cqs/qdsp6sw.mbn";
+
+	status = "okay";
+};
+
 &sdhc_1 {
 	vmmc-supply = <&pm8150_l17>;
 	vqmmc-supply = <&pm8150_s4>;

-- 
2.34.1

