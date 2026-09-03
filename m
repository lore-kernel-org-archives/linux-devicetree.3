Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94600314B63
	for <devicetree@vger.kernel.org>; Thu,  3 Sep 2026 07:19:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788419965; cv=none; b=aQPuikfyb4WGiaFWkBIw5xfDiTxCKb7/LwEWIIWE527nfpnb5TCshUgZcba5WyJCHFDbHSmjE8fJMsAYTgyBvOG432B3L5sJp//FUGs2pxpYYmJHixtP7VJqOkgTSI3LnSjpKJbsSG/mxi2UwLaP2v70+g/5Ogvg8hxvEnC24wA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788419965; c=relaxed/simple;
	bh=To8PeeloAvmZ934Ch7WVJWVCgM1tIFQfjgNqR3WlU2g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=s7hRsdebZXeUBhM9I0jkB4ZyHHNHC5n8tB1w8ns30I1kflNZCm4zNJcmksN0GkL8odNtngqmnXNEWLPTJXHEQauKsnlDWybuZC9dgyssNlsmujjeHaeH9hKGJINuYnJ6TF3cHx5RJkc3SGVBgi2yMdWxB+UrO1VC42DzMsQdm6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Tl2i8pWa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gUGGWpTv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Tl2i8pWa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gUGGWpTv"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6835lMtB324636
	for <devicetree@vger.kernel.org>; Thu, 3 Sep 2026 07:19:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iZb96pkWUOLUETezKyay5lwdTNVTnCS9HTuh47NFSSM=; b=Tl2i8pWaFtTAi7s2
	Mgs4ln4y94NJJM/s5W0KVjvVcKBHEBQupApRJFUX1MsxngPUEulo1+iIJlYG6A8z
	eHaDKT4/Q0iSggC8p1Lf58kubnvE1aWZ+Ln04Sdbhg5JtuYpx2rBs9rj3qmZ0Eka
	hzY6xQAX30BFA60XymfyrpnoEgszFETwDocfx1NUL+xPbZLBIA7uMleR/hUsIX0F
	bfSEO73mtV3d3CrIM5C7dAqUhYYM6mHJcot2TtDLt76rwzMIr0mnDRELxEbDZmUU
	63Wlwkczs9VR2gdRoLZo6+WBCgT6eHUD7UaIfy6EiaRQ/4FJIuqRhbeSjR0dQKM2
	E3J45g==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gerdnb1rk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 07:19:22 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38dbf293831so4769398a91.3
        for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 00:19:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788419962; x=1789024762; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iZb96pkWUOLUETezKyay5lwdTNVTnCS9HTuh47NFSSM=;
        b=gUGGWpTvtA3rGA6VzYighHDn8EFU/wRp+QkQvuhZ4x0Z/1CmpBzbtBDNbyHo2thV2h
         iKQfEcytBNHrptOjcxx5WK/ESg9Lge0JQfBoS7ceCLyHoA8hiR4LERyRk47truoEp26b
         Bjt4aNxG+GYeB6uS9hcb8XCEKOHCJlBymTzZmF/fWlyLeEfVfMDKwat4Z/cx1OTX4pxS
         0Cs+JiBcIb8tDoAz6uIycCUBxVojQQOUwsW8vMbpewJSdERn13hMkX2gqeQTjvs2kDHD
         SvQp+0RL7At8bWIxYiU2RMjhjguW1SdjohHobxsSGxpeAixywrFQJX1NrOmGvz0nd422
         4A9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788419962; x=1789024762;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iZb96pkWUOLUETezKyay5lwdTNVTnCS9HTuh47NFSSM=;
        b=o5EMx8pz01tUtNdrnt1DI512nAcW5kUxlJ1TDZRCuixM3Nzw4iucz5YO5uCm9wIEU8
         5oqe8XxORQbflzaksY85Cl7eIvIuUrEsxD7n0CgXSsuUtouza6aijo2vjdpWKGEvUBj2
         8xQ74mHFtau3SVyhyOlI5iVsiFdNtbbLRmfUpIRHZcYWNuRWewzzWnEXcBSaQVhUBY8J
         KgV60muaMW0Lb1UXVYD/66mmJJF5pWgRd+mHI6ESW/yX7zWu/AVR8F9Pi4X+el57FO6H
         KN669DcV81v+cQ9FNC2qb2KkbtfcVyfGhgo9WfnpHo/ESa8AUS48tutzFzng20LzvYje
         a6VQ==
X-Forwarded-Encrypted: i=1; AKwUvBy9heixaCAIpHn23qqnk4mk/L/rg7+tGMalrKStbAcVpOe6AWzDxzMLsesjeAKeoZlv0O20TptvAalj@vger.kernel.org
X-Gm-Message-State: AFuF++mUcL8cK6cEHBQSsBTZW7PKnKkcyY7B0oO6tVH8lkEZGlQ8nXLJ
	GlIXmvTd0QNKU8Jbxno656ws24HDSFA2wfKQM9Jb28bE0bx5ZpPzc1iZ9GPPfAeYxrd7tGjbY5j
	+ERTlKNaC7WR2ceTd99n1BvSzKprB7AWAk0P6HCWcY/95E6lkf7IniiKr/5Fuo93q
X-Gm-Gg: AYBFou0dBoNigo9v4P5zdbvs95zkAoC9gOjfKxFD3DsKxQDAnk0nLtK3BdSEtaCif7O
	ko/5BqYEwf7cDupunW1rnwzo5roKhQ92Edowlmx1TEWV0uCmztBXNS1HVPHnxQ3oxl+Y7Gc34yh
	32fQ+6nIlWDLaYl7mMa8NBQyd/K0k0pBUfABBvsv2PZLuSJApX0Ckg1D6Ku4TLs8MxMVpUkHwi5
	AxZISFTonw3+8xoOTHaku3uCv/ir9nB6vzXTE1B6RYcS8wTPhsusTSDWtwllV9C8E2SQJ7cn4AC
	eahJsDVhDDcHNEMH+iSGemdlK7+vItKCWDTm7+GOw2M0oIMEnZb8lPwBjAmcNpeCsEslrAlhcRW
	5gtkCamj4pRqOm2FqG+LAJIJL2P9w8Hk4
X-Received: by 2002:a17:90b:2688:b0:398:bdb0:adb7 with SMTP id 98e67ed59e1d1-39aee162e08mr17802130a91.16.1788419961972;
        Thu, 03 Sep 2026 00:19:21 -0700 (PDT)
X-Received: by 2002:a17:90b:2688:b0:398:bdb0:adb7 with SMTP id 98e67ed59e1d1-39aee162e08mr17802062a91.16.1788419961576;
        Thu, 03 Sep 2026 00:19:21 -0700 (PDT)
Received: from hu-afaisal-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14319983842sm3992468c88.15.2026.09.03.00.19.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 00:19:21 -0700 (PDT)
From: Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>
Date: Thu, 03 Sep 2026 12:48:54 +0530
Subject: [PATCH v5 2/2] arm64: dts: qcom: shikra: enable ST33 TPM
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260903-shikra-dtpm-v5-2-e8ea3ac8a135@oss.qualcomm.com>
References: <20260903-shikra-dtpm-v5-0-e8ea3ac8a135@oss.qualcomm.com>
In-Reply-To: <20260903-shikra-dtpm-v5-0-e8ea3ac8a135@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788419950; l=776;
 i=khalid.ansari@oss.qualcomm.com; s=20251105; h=from:subject:message-id;
 bh=To8PeeloAvmZ934Ch7WVJWVCgM1tIFQfjgNqR3WlU2g=;
 b=3NNTKCMn3hLsF/wntuQnfGkeGsCzYsg6+y2/YeysHkYPZ/tPFpMHFVG/JCyxj89KA6rbZed6j
 Ud5A5RfXSN/Ad6tDiiialvkrcvyaNyfPZnahI5tAq7LWi+FUusR0Jhi
X-Developer-Key: i=khalid.ansari@oss.qualcomm.com; a=ed25519;
 pk=eBXrIUgTWV0cgG+GsNeZPPgvj1Tm6g9L2sfcoxMGrKo=
X-Authority-Analysis: v=2.4 cv=YcmNIQRf c=1 sm=1 tr=0 ts=6a991f7a cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=YSeSwzeZyu-nVJi06OQA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA2MyBTYWx0ZWRfX6KAy1f5WXD3I
 FgL44BTftHSSHqunGAo4wKDDDSdV+h6OWHhXL3mILVM+2uRzXaNlRTY42LTnoQvm788OGSCB5Gz
 p3GwR7dK2UamNL1+GcA2aC56prKXEKQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA2MyBTYWx0ZWRfX8MJC5G3dL65r
 p3X3A+OPOztu1mRvJGmcvLqshtQjzHAl7n3/k3sWKDRPlTYKuV8XPrjh0c5OgoNOY51obae6Gtc
 U7jSNWrAysdo8qfMpIlefZ9p+DUrYob2kqvYxZJI7gchezRynZmGrPA4igPKz9JSOh91Mtb3YKF
 G+8hUPojoWmwiUJdBGgC8rOcsMyQvmJAIlmn0HdOh9JaQzjgZC12bpvtChCdAzmySNADPI/uZNP
 ttQvJF1c52Gwz+ldXIn6SKg/BNWtfI5sh9ez1BOx1WT1XBSkxMBjQZgdsz4o6S/kVOwBTsMQ656
 WOTCO4ifhPNDen08uQIa+PvR23kV4tdvVi3MY+C2woVxnK/af1S0BxBhbRut2d0Q++jSvA44hTg
 sOhBeh7wF9amA4OYp8tYv+P+9opiQKSc8k9cYUIHSH6oz8BbJTzWz6Lp4ah5VQtWU4FeBFMK5Cq
 PfgKLPcga3LqJkWN0WQ==
X-Proofpoint-GUID: uh7dW89WKiMDpv1NuhEIZoEauYeB7pvR
X-Proofpoint-ORIG-GUID: uh7dW89WKiMDpv1NuhEIZoEauYeB7pvR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_02,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 adultscore=0 phishscore=0 impostorscore=0 spamscore=0 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609030063

Enable ST33HTPM TPM over SPI5 on the Shikra IoT EVK by adding the
required SPI and TPM nodes.

Signed-off-by: Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-evk.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-evk.dtsi b/arch/arm64/boot/dts/qcom/shikra-evk.dtsi
index 6eb4184f7642..c073e45781a6 100644
--- a/arch/arm64/boot/dts/qcom/shikra-evk.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra-evk.dtsi
@@ -9,6 +9,16 @@ &qupv3_0 {
 	status = "okay";
 };
 
+&spi5 {
+	status = "okay";
+
+	tpm@0 {
+		compatible = "st,st33htpm-spi", "tcg,tpm_tis-spi";
+		reg = <0>;
+		spi-max-frequency = <20000000>;
+	};
+};
+
 &uart0 {
 	status = "okay";
 };

-- 
2.34.1

