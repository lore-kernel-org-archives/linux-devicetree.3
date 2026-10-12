Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11F12442FCD
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 07:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791789832; cv=none; b=l5nNRxIx6c/5GZwu/z9PIbN7RWbgIoxhUojU/a6Kk2eLeCKSTntljEGudUfOIKXrh9Rff67/u4g7qvS7p9mFEONjCt5548t+Ht7azhYU7Dzg0OqIBvTfm9fDtXb5msmCyPG/zeSwsoinzuRW5s6wiiWd4x3eXh8/QkNZBupE7Sc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791789832; c=relaxed/simple;
	bh=OhjmlalEsnMhcYqQuD1F2lk7YTkFcmtIk+fKujO+9I4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rMpG9LyG+B0tis39FNA7PzE8/F13EP98ltF+FR9KUUPnSgaiC5/KaFVfX6Kimxh+/2426wNQKLNOHa7zjuOPsWCWcyAB4f+yGZPtteypFq2b3i7DlPyhHV/XW74uKgVymO4iSBGzdwohZ2/TLTujWxXsKOW4Zg6viTRSQP+kcLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aE63aQpc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IpgE0e8H; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aE63aQpc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IpgE0e8H"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69C55heG474944
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 07:23:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5tBJ/Ukh+ElIPjYmJlnxZawvlrcAASOH8murc/CTP4o=; b=aE63aQpcdaitsvT1
	dO127fuIsatnFAReZ2gVxC8BoJzW3mMk7cEfMiKv3Qvz0X6YZt2jeyTlaq0MXVan
	3lds7xeydRUObBAIzULDzf1+YwRIKQKaqT+0qRxp0S3Rf1hqx+Qw4fDbzcJZpr3H
	4hqiGwt19wH/+snwmtUVKihQemji3riZa8ktsedNO4FZiqSk8jx93duG9+F8aM5W
	ysBhIHy8jMXfcV6ffFs0rOh1i1ssUqYH3rxVS81Pi+l+3cYP6oAxrPJVNYn19B0B
	N+oOwQj3Smt9Wqhqnq7MatW6vA4PcY3YvZE75Kiu50CBLOso3SdMvxNAZkpx4U0T
	wpa+xw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h7en9w5rv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 07:23:50 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-341eff9e381so5044381eec.1
        for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 00:23:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791789830; x=1792394630; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5tBJ/Ukh+ElIPjYmJlnxZawvlrcAASOH8murc/CTP4o=;
        b=IpgE0e8HPqAgLDm8I264+Mwq1xHDnoe2tHzhofSUuL84xessOHwFRckGeuxsc7ETBp
         sjEmHBL45xn6KP5FjWLpktgyQtHe6PfHEBIiMsnX19wEuH7GHjVrBLKMVrvLPu4vJe2+
         GOnEcuqEHhxT4hq4ABb99s2Gs0y7xrgD2vpgzIdabZEMwHBKsjGG/0ZTD87LsDF32mDV
         hVj0jkVc1D14XHFzuHJlE26az2sQeTMo/ocIG0sbGiQ5JLLFd0POI6jKZS2I5StqgcGA
         nd7LYw9PfTkHj2ac14Gdv985b8ofZ1v/58LC+at7PlczAocZZ8ST4jZVWOWBdMhtHwW4
         KaBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791789830; x=1792394630;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5tBJ/Ukh+ElIPjYmJlnxZawvlrcAASOH8murc/CTP4o=;
        b=oTl7qSMdEvHZika9DyJxr1F0hhqXf46xAYxu3RV3yrNt7Tl+rsFrFstEPwSjQyOesc
         pxpVfHogG/uBp2u2ZfSc5RMbwz7HppZ53v8Cvs8xhKrWgN8Dvf1RiSKobT2FdkhHRclJ
         TqjImBCX3GEygnXjYl6MvFY0j6x7n5oYeUeGaduwFVUmh6YGz8AEJCFjSCH8YRVk/eKh
         t3jHfkb3T28MYeerSvFzWCRPp+FZH6uuNRh0V+9y+eymCoF8ZABG/c1UgzT+kJNRYqUx
         aJtoG1u5KW/+bUJwF44iWOj6dl2y77q4F573D6iSqDihbSVQBV1MQudakSQzDHFR3L21
         NPBQ==
X-Forwarded-Encrypted: i=1; AKwUvBwExirhhZ9tF0A/ZR+kdIOiVwT26NjcFvILJa7c62jxxMiO3YkYLpPFkSy4iQUyZuE8J/werofCzMc5@vger.kernel.org
X-Gm-Message-State: AFq9FYLxGD1OfdoAChKYprkOzHOPgeML1G+uGOz4uSr7Yt6WuBASLo42
	XTuA8E5bk7RnUHWYSM6/3q6ANGaFSV+eYf4pYIpxMwncTF3/YKk4F3VgZMnMvLaU2nOpkhQtZt2
	IDXuJcPiy+CYYLEK2TEnpDxNFOc+JoyU3zxaJ2IG4etNp0/fgk1pERr1ns4CD35AR
X-Gm-Gg: AYBFou3xMzT51PVJb8tNpxLwghINkCk0pVOG2vV6em8sX7++Na62aDKcsNuzpM4LGQc
	bU4PDOm+lCbqDN8b5M/pcOz9zctM9yBpSw+XFlOrP+6TNk+Xe3dI0i5cTM+pb5mG0af67/mxxMs
	VmpnhUxizuoG1+ZkA7NgNoQKv13YKf3nd6Y0FMrMt3i6/zah2FitoRnH7+172e/3FdL/8VfnanI
	/jvAKtpN7m9/mgWBpCMtbVZlkJ5Qvfeiiofr1fokeS4UaTAC7TW8J5h3VisZlptDLFFpTWPCifE
	cbBdfDaKyrzuTlHcE3VqGZn2Q7+fIh+QratRjc2I+3mi0vkEU8f1FpjnPZLHzZug/4ymkj5W7wd
	cngaEo6XOy5+crevw1ZkjdSrPDIVSeYUkSSwqzGWfCJ9T1TvEn9v6PMfS3D+MJ6jDFsUefrt1fX
	dqkGKzuS5PrskgS/14ZaesC8hZVVf6
X-Received: by 2002:a05:701b:2803:b0:16a:b995:dc7c with SMTP id a92af1059eb24-16ab995dd20mr12636762c88.21.1791789829561;
        Mon, 12 Oct 2026 00:23:49 -0700 (PDT)
X-Received: by 2002:a05:701b:2803:b0:16a:b995:dc7c with SMTP id a92af1059eb24-16ab995dd20mr12636741c88.21.1791789828935;
        Mon, 12 Oct 2026 00:23:48 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a1becf08sm29748733c88.5.2026.10.12.00.23.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 00:23:48 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 12:53:10 +0530
Subject: [PATCH v7 10/11] arm64: dts: qcom: ipq5210: Add SPI node
 definitions
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-08-dts-v7-10-77bd3d68d850@oss.qualcomm.com>
References: <20261012-08-dts-v7-0-77bd3d68d850@oss.qualcomm.com>
In-Reply-To: <20261012-08-dts-v7-0-77bd3d68d850@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=Woe+otfv c=1 sm=1 tr=0 ts=6acc8b06 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=ll64UZJxbc1SGzsXvscA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: pPx-7PHIUK-wBoGh1P72alOGvfiobtPL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDAyOSBTYWx0ZWRfX/JLDFcWNJ6Tg
 iwIhX/HNcW7qL1jzlohVb+eq2A2nEx9ViN4dORX8LrTCycUQB5uZyYPEiqkSxS9UsdPdqyCkeUz
 VKpBVuVGadNmJ+kUld6jZlFqA11G0/Kg9tccW4e1Oo3v+h5FTyO5G2nYknYox7EWST3Ig836PSc
 SgF9HwwgFefQbX91qZdQT9AgvUQAT47XLhliG6nwc/ozkJ0XFlFm7aXihKE5M1H8rhQDy8Cbhlk
 d5RfdojBDQsEevb8zL+ETb0Vu83sHlIHJdgj7FmEKeAd+jnDUShJ4xFXjtUv9bVFBSsBLgMFnrY
 elaYcuPUOpgl6evT/tY+QwsOffhBkiszRb6EpPFjambexpHPZvIZUYDaWDqaJjLtyF9r90W5Pc7
 Ak3Mj6O6/c3it9+fAXMVqoVu6bQqBoMJrlv5cKr67Ib6S8tA4u9+cVZI0S07YDr9SFXPqphW2Q0
 gLcZGigJwPgS43hifuQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDAyOSBTYWx0ZWRfXyZ4MnfxLNXUM
 ts0GyCfWnL41UNcdQEBcxlgCdiO1Iv4L70LYZcMJTjrgmcH/xD3n2L6BII2HGou5EmxYLMAb31D
 HNoMEqyUkO7LfLcnr4wpe63JVzB4jlI=
X-Proofpoint-ORIG-GUID: pPx-7PHIUK-wBoGh1P72alOGvfiobtPL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_02,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 priorityscore=1501 phishscore=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120029

Add SPI node definition for the QUP SPI blocks present in IPQ5210.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq5210.dtsi | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5210.dtsi b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
index fdfeedcf5618..cf1c9898ddb8 100644
--- a/arch/arm64/boot/dts/qcom/ipq5210.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
@@ -418,6 +418,19 @@ qupv3: geniqup@1ac0000 {
 			#address-cells = <2>;
 			#size-cells = <2>;
 
+			spi0: spi@1a80000 {
+				compatible = "qcom,geni-spi";
+				reg = <0x0 0x01a80000 0x0 0x4000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&gcc GCC_QUPV3_WRAP_SE0_CLK>;
+				clock-names = "se";
+				interrupts = <GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>;
+				assigned-clocks = <&gcc GCC_QUPV3_WRAP_SE0_CLK>;
+				assigned-clock-rates = <50000000>;
+				status = "disabled";
+			};
+
 			uart1: serial@1a84000 {
 				compatible = "qcom,geni-debug-uart";
 				reg = <0x0 0x01a84000 0x0 0x4000>;
@@ -456,6 +469,19 @@ i2c1: i2c@1a8c000 {
 				status = "disabled";
 			};
 
+			spi1: spi@1a90000 {
+				compatible = "qcom,geni-spi";
+				reg = <0x0 0x01a90000 0x0 0x4000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&gcc GCC_QUPV3_WRAP_SE4_CLK>;
+				clock-names = "se";
+				interrupts = <GIC_SPI 142 IRQ_TYPE_LEVEL_HIGH>;
+				assigned-clocks = <&gcc GCC_QUPV3_WRAP_SE4_CLK>;
+				assigned-clock-rates = <50000000>;
+				status = "disabled";
+			};
+
 			i2c2: i2c@1a94000 {
 				compatible = "qcom,geni-i2c";
 				reg = <0x0 0x01a94000 0x0 0x4000>;

-- 
2.34.1

