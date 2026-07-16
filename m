Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BA5142BE9F
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 14:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784211919; cv=none; b=sYD4GBNhbwB1/7l4WThJtMXDE/I2Me1XRuXR1pw8m9rvWDarbNLyH/P/A9omB5QcPnf0a46Dts3eCwrj5Was3KF/adaoAfJ4bTyzn6SGoRQwrx1R3EXvOc6ODuB6+x32WLWQu2Pqcj9BV4Nt7Jv2wqkfHYsM4R3soH/l/B/T/t4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784211919; c=relaxed/simple;
	bh=RazDyYcRTpYvB6tN8BOMuESdMJqcv9UjMOcxxnLk9OQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=EuHrqMUbDTzHLlOMZwrvp+hJa9ZVTUidL9fXTfEDDHuq8Bep/TLoK56OR0xRHCUPcn7VXtABB4j+vUvGDAxLmL42J2YtdrRnlO1ayGqmTJBUrAYycvFaZWbxU44zw2OFOV7wwiQcEGLf4Qw9EyN0j5ISVVfIUztUnd4WfKNM0m0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S99uWYLq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=byuhL2UR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S99uWYLq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="byuhL2UR"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66GDJknB2721629
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 14:25:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=xDTRrQhVy2n
	0dS+vLF9igjtRuFmthcZmv4jK76MGlF0=; b=S99uWYLqgFtAwtqz7tpv4yB4L6A
	/3bbgrFtbrpi7Gejek/oeILZiEkZFfi577cC7Qm3m46NiWxXudcwUf1boK+pm9mV
	Y4iSFUsSX6dfdAKv8A4f3l1ND5kOU4GT+OcnhqVWuUItf1Vpi63uH7MW2xL1laL1
	tVcwT6gKEQyq6ShWMDjN01lL2W+O1cQs/r3Ugn94uwXEowyXfCply65Bpz242vsE
	mIuboupZES7mFjiwW3YFM0DBBbNDVuBh+Jp0Wf7zEHxyWV+Qw1pLGf7+H+HtvaJn
	X5Q5vzUAn648tSIQzf8A0ynKw+o++4FXGMciyAAK9VhJO3WfnTz+Q2vs4kw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4feehvcarn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 14:25:17 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51bec738909so57545761cf.1
        for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 07:25:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784211917; x=1784816717; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xDTRrQhVy2n0dS+vLF9igjtRuFmthcZmv4jK76MGlF0=;
        b=byuhL2URc80SBvHaVx1LvGXxstzurBhx+pp6TbLfe8S947J7USJ9JdT3hks2Jfwd3O
         rvohK4SikmK2cplvEezBXnTELMdNYLJRYA93bg5HKtq8qNu7UUzvTGqbI2GmcjV9VDgn
         btlFJMGypsFiFTIlyGdnFmndgXn1l6n4AyZd59NQYgeOjYZ8ns1c7YgI8ma62BuFpiSH
         VZKji20bHu8mPq5nNgNAr2VLFPh5xUu3s1FnVGjAD9pT/G0QUPgsID1bm50nOhanHSPB
         uRbwdN0DqInz+zCrQ9HzcMtp2KFV5ll4uSClRY2rc8XT5+0QyA7F+as6Sx/OCRRwgHbU
         ywKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784211917; x=1784816717;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xDTRrQhVy2n0dS+vLF9igjtRuFmthcZmv4jK76MGlF0=;
        b=Gw5kJ6kCcYuQ4Mijfd5NgAEU/PRi7A829j2O2agz9AWgaOeCbRfoC9a9p6UcuFYNSg
         zzYAWHmGyhJuqkU5Nz/UvBJoO1yUOJFxco18H+EEEK5bt6HsAbuAlGiEkxJZi4LXjsUX
         upKoAYYO42RmtcgGIIureVEtzU4XvDCPUQUzWnz7eKJbCVPt32qt1mgHImHe0tUm3b+s
         B3+6Uui+KuqWdOBf8keGFvgCXXhxJfYktIA2jrfUPJzozSyfVZrKbqZVeEgnw+ghQmCW
         g47HcmNlDSif4pBppxnXeEYKXhDYyTw/V33aaW9eL24kKiQR5ALhHuLk9R25U9g2PKMn
         au5w==
X-Forwarded-Encrypted: i=1; AHgh+RpTBj04YyySEOlL/3n5tHW4UbZzJgXzuIXg/D4kM3S/f8yPx3YxjjQgNpB6kJw+VmaGF7xWQtFc2o5a@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+uvshwbxBU30eJAMWDEVoirmnyCN4DNGaZFQ/PBheKJ7bXgdt
	HQXfSTjF7LH8ivvR6n9VCuPp14TpVbGkagpXSSk1GBGkW+DF91/yJF8NMdhI5O2OgoW01xbxmNY
	8fl+3PKR7WtBspnc32HHUBVXV+k2EZuVaOy8LT/n5AKbtrkw8VXTk+p9L3JWWty6P
X-Gm-Gg: AfdE7ckNG+Qd3yxetgJZBJ30czz6oi2hWvkZ+Ki6b48CGazEBryFfg96qFwT5gR5E2b
	r0F0/b8Vv0hMWF6L9YuMtLPw+CArDLYTVEVSkaA+nbpryyTTafub45ZKX+QfuSXOVaPUDjLkyqF
	w4EMXKffIJku08SUrP9bMLKU22T7ewLyNmBGBxJc+nGSSXppFP1izGJsg4sOH53FrJkuFV6tGRS
	xo7nEQMUoVDEPB+De9sPTMfQx8+5TZL+yG5PKBayZtyMUHs1x0B3FzsRPOXn+RTJAnuWH5wpjfw
	TrLIBGiPDhXr+fB/db6wtueVKpYafIcCLisdZ9hLuyi8GZtKA8SfuFD+OpuRurrUPJSiVZgUzv7
	JPvlAQiPSB5vDpGWjM4rpphGcsWonhH3J36c=
X-Received: by 2002:a05:622a:2c6:b0:517:8a18:7624 with SMTP id d75a77b69052e-51e423527e5mr114668321cf.3.1784211916552;
        Thu, 16 Jul 2026 07:25:16 -0700 (PDT)
X-Received: by 2002:a05:622a:2c6:b0:517:8a18:7624 with SMTP id d75a77b69052e-51e423527e5mr114667341cf.3.1784211915519;
        Thu, 16 Jul 2026 07:25:15 -0700 (PDT)
Received: from hu-mchunara-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49541eb0343sm62091975e9.10.2026.07.16.07.25.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 07:25:14 -0700 (PDT)
From: Monish Chunara <monish.chunara@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sarthak Garg <sarthak.garg@oss.qualcomm.com>,
        Pradeep Pragallapati <pradeep.pragallapati@oss.qualcomm.com>,
        Nitin Rawat <nitin.rawat@oss.qualcomm.com>,
        Shiraz Hashim <shiraz.hashim@oss.qualcomm.com>,
        Monish Chunara <monish.chunara@oss.qualcomm.com>
Subject: [PATCH V4 1/3] arm64: dts: qcom: monaco: Move eMMC CQE support from SoC to board DT
Date: Thu, 16 Jul 2026 19:54:43 +0530
Message-Id: <20260716142445.2767955-2-monish.chunara@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260716142445.2767955-1-monish.chunara@oss.qualcomm.com>
References: <20260716142445.2767955-1-monish.chunara@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=ZpDd7d7G c=1 sm=1 tr=0 ts=6a58e9cd cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=aGigY-oVRoDAAVteN7sA:9 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDE0OCBTYWx0ZWRfX/FiW9qCGMzyn
 aF0DtUatPPk60Vk6Syrh1MHJsOdodIfn4br/PWblkz+H9d+oEMtg+zxlGNG+1xpmfwkRMH3buhc
 GBr+0lwekDkVcxKFZoY4DYtiOrDjXhNv57ehmDQzBO1Y3dpDtdgCCbiXS8CaMyL3votu9k9FOu3
 KQ86l15Scso3ZPpbBsy/uYPjlKUTHFjlKLHpe3Llc4iySPCW9TNaoQe1yEck7Uqtp0IlaOlwYNR
 37tKrIDGXedSGtPkAUwBORB7DtpCLj0ydkoE+Q1L8bY1BLI1msBmavvAuQN6MKCbRcaSSDmQ4Wm
 XRYyFaLWzttMBe9TWCujbeMxUfvT0x4Sd7IbWxQp7CEYXtwLai12I1/gaSxgvVqv/pJReFc4z4U
 GDP+2NHLHK+ITTtZS4JBY4hKh9i05mhJ/fZTJpGH3ftH0UNjBAbq2w0p9qgTg6zD/cZrWpXUQfZ
 DFS1t68aTVwa/HRE/6A==
X-Proofpoint-GUID: lbddmoelOHH5X4VoGxpJ9UNtU3KqgBdi
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDE0OCBTYWx0ZWRfXweFmxF02F4KT
 gP00FqurFIB/1SOygUXcaKEQkF10mAtJJKOfdhz9oRcJWUSYtKN+mHc3a/wbfJtgT03eO7xOPP+
 XrBp1iIO5iIxxUkmHVHW4Aoa07Bbj7M=
X-Proofpoint-ORIG-GUID: lbddmoelOHH5X4VoGxpJ9UNtU3KqgBdi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_05,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 phishscore=0 adultscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160148

The Monaco SoC SDHC controller supports both eMMC and SD cards. However,
the 'supports-cqe' property (Command Queue Engine) is specific to eMMC
and conflicts with SD card operation.

Remove 'supports-cqe' from the SoC device tree to ensure compatibility
with SD cards. Simultaneously, add the property explicitly to the
qcs8300-ride and monaco-monza-som board device tree, as this board uses
the controller in eMMC mode.

This ensures the SoC definition remains generic while enabling features
correctly at the board level.

Signed-off-by: Monish Chunara <monish.chunara@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco-monza-som.dtsi | 1 +
 arch/arm64/boot/dts/qcom/monaco.dtsi           | 1 -
 arch/arm64/boot/dts/qcom/qcs8300-ride.dts      | 1 +
 3 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/monaco-monza-som.dtsi b/arch/arm64/boot/dts/qcom/monaco-monza-som.dtsi
index 9b5ed55939b8..6b146fdd6ebc 100644
--- a/arch/arm64/boot/dts/qcom/monaco-monza-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco-monza-som.dtsi
@@ -275,6 +275,7 @@ &sdhc_1 {
 	mmc-hs400-1_8v;
 	mmc-hs400-enhanced-strobe;
 
+	supports-cqe;
 	no-sd;
 	no-sdio;
 	non-removable;
diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
index 64fc0d592282..ca3a1e845a76 100644
--- a/arch/arm64/boot/dts/qcom/monaco.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
@@ -4841,7 +4841,6 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 			qcom,dll-config = <0x000f64ee>;
 			qcom,ddr-config = <0x80040868>;
 			bus-width = <8>;
-			supports-cqe;
 			dma-coherent;
 
 			mmc-ddr-1_8v;
diff --git a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
index e9a8553a8d82..3090eba0317a 100644
--- a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
+++ b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
@@ -719,6 +719,7 @@ &sdhc_1 {
 	vmmc-supply = <&vreg_l8a>;
 	vqmmc-supply = <&vreg_s4a>;
 
+	supports-cqe;
 	non-removable;
 	no-sd;
 	no-sdio;
-- 
2.34.1

