Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B65AE3B6C19
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 11:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787743516; cv=none; b=QMpJSFyAF0Xm/NBwh+x6Lb1+MKuIQwkQx4Lhv1U+/n2Qy6SNIbW4KjE1G0dllGqvwhFXqCtPK44DjVzEHWv+vDpYLptLpgKqEyfhBNfXCUH1KeCduvKn2DSPvlRYT+TKbyDLZWKPSws9f6FoPO1ntszHgsVnbKTD6lQxJk6i9YU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787743516; c=relaxed/simple;
	bh=s5UHW8nUbq/7hgmFCDIKqkQC1x8VXgcvo2BrY87L9/w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=acgs4FvM11iyTLJlN+MqPBXkCkcjH/pfg7DhIp3mjUNkPor1NcRMjM+qgBU1mDCzeu8mPPLEAhm7SmVaDuK+X32KSvAKh8e+LGonKhKlb/stI3f674wD5/Pp9mlnECudbphSGTq5dSWFUuNN09AzBtJ6g3TPhysEoB/qruAjabg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GHT+zt3W; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WZAJFvqD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GHT+zt3W";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WZAJFvqD"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67QAHrNk3649646
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 11:25:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=vSpMK4EcLgv
	jhrVHZv48Tx7awWhR/G6iWmu1dCEi58U=; b=GHT+zt3W/jsfOKnHfLV5wDaIXhk
	EKIlTFW/P/bf0gZ8zyNEDyb7mVR/0WqkuVgyuwkN1PBCUU5Nje/2RPOFU2dAiGsv
	Y97xL1496XW0GoFRcoai9m8oYrFajkO8lxazeTVlYeRrTVZ/R74srwFxSpPjdOu/
	RfQj6i3UrCbT40QiUbDKQNai2hC9osCylb29HXTdImTlyyyM2GdstotXHkQktjd8
	RQ9oBTvSgGdmQlDHmJfDIx8cX2IDbLDaJX5vUR5sfqNOd5XRUG/OlsO8it4JlP2a
	SLwHcObQQrZlmC6HOiIkHmviNwiIISyMQurb7WOkoHFVaxklf+KWRPrav9Q==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9uthrvr2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 11:25:13 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38e25e4b41cso1760763a91.0
        for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 04:25:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787743512; x=1788348312; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vSpMK4EcLgvjhrVHZv48Tx7awWhR/G6iWmu1dCEi58U=;
        b=WZAJFvqD7MCEyIfTFDlVo8/J0Y7bsAn6m8DjNyUYCtVcw2wfwMABBgKvOnpGnmhUSC
         Zq0WJgmGH9tmsm70uN1r4GrpkSxQnyGNUxOGQ0T+UZp+G5Cgs39A3vZQUHL3s/FaloNO
         GztRLlfkOiFO3Cn+ybF9Y1YQ67DFlDLFWctBHhVysOKfi5LdKOr8tYDW/2pmptRFGKG3
         2lRzQwTxBGR/cel/pVKypZ5e1oM7obtolid0192kyi2h/ONwn2Uy7AryB7Ieb1enka36
         oG06vn8uiR2BGUaDptw4DU9njoZAwvtMq2MnLIcEqtr17rSqmpAfcRqj3CBqznKAsxWa
         VJSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787743512; x=1788348312;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vSpMK4EcLgvjhrVHZv48Tx7awWhR/G6iWmu1dCEi58U=;
        b=ZqxX8oAtd0/jrRDHr+9fz+/MNedl/LFL942EqM80UnOhNWQG5K3Ygp/7BaWYUTo3mQ
         QYu4sMggVGVDcqDa7hZCGIqAHWSLNbvi748xZYvy0C9XKFFX1DKW1NnK6hDYPUD8IsPp
         xF7VtAn+mfosgE6+sQvsqHHz39/tRWDq6WRDAfFcZQFLXvUXLcezI6L7YbSG/Z4xss8U
         CxeadPYs8AERA3F67LsWl4rW7qFwUuzuW06LJUveO4KoIDdhY5vKLuiCbCDU8EYwgQRX
         VF/WPp8UvsC81V3Jycc9qHerp8i2XEeEQP20KXlJPbaHtZsphfIg4VzFX6dliGhubXQi
         K9oQ==
X-Forwarded-Encrypted: i=1; AHgh+RpZ20rOV1yw+629DwVVhullA1SmQ4mWpsUvyATGCM8VYpHlotmOPIUtt1fuj+r2tXWkEFwSLjHQ0BYG@vger.kernel.org
X-Gm-Message-State: AFuF++nj3xxaEuKI9V0IcnPFSID/znpRYVzN1oKAd6ZUIiNe92IMOH4Z
	2PsWiNlslf18QvcfH/taj8GmyUgiyG5oxcaFb8P2Yy5EsCIGu9SG1y+veNm8P/6ezfpzad9Tbi1
	Hgx/ZknXG9GBVEGgZePzitkVOaZRRVhPOBZh7C8xeyZ5pTrx08R9g9l2YKWE84UH4
X-Gm-Gg: AR+sD11eeweH/dX/zal0SbETQDcZFajR5Vja2eOywtDTEcIXcPtjMULbozxoH4d170o
	UEojqe9N7DJHgJMezhq+9B7dY8qEWN0uM0q2Rs9xqOoVWZm1J+1efhXKKKhUsru8BcQ5axddLh/
	PW7Hbt2cPBypbayS3EPDsrF9fFpWkDLqf/CjWGXaH7FDwV9pRGPAcNS8ZKD6BRPtgp3sqokUtU0
	MnNsyHSV5KrkwXEMWg/abMNlfuNL3JJj8urOf7oBN00pLTnQ+p1wWQzi+q/xHBpccaveYd/T96b
	5emXq+gU0komId+mRWUIWq3uD5Mjijoj2GjhiBzMGM8ku7livkPEldebZJzd+f/Trc4VcOKJzDv
	J3EmnpCFwOMDl3wDzfI4ej9ztNGwg4kur/44=
X-Received: by 2002:a17:90a:d2c7:b0:38e:75f3:ad4d with SMTP id 98e67ed59e1d1-3966d1f21d1mr14435624a91.7.1787743512347;
        Wed, 26 Aug 2026 04:25:12 -0700 (PDT)
X-Received: by 2002:a17:90a:d2c7:b0:38e:75f3:ad4d with SMTP id 98e67ed59e1d1-3966d1f21d1mr14435509a91.7.1787743511876;
        Wed, 26 Aug 2026 04:25:11 -0700 (PDT)
Received: from hu-mchunara-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39645d31e8csm7521016a91.9.2026.08.26.04.25.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 04:25:11 -0700 (PDT)
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
Subject: [PATCH V5 1/3] arm64: dts: qcom: monaco: Move eMMC CQE support from SoC to board DT
Date: Wed, 26 Aug 2026 16:54:54 +0530
Message-Id: <20260826112456.482982-2-monish.chunara@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260826112456.482982-1-monish.chunara@oss.qualcomm.com>
References: <20260826112456.482982-1-monish.chunara@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=EMA2FVZC c=1 sm=1 tr=0 ts=6a8ecd19 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=aGigY-oVRoDAAVteN7sA:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: N7nHsE5GFE-7R0pwRh7wxjT6MdoL6LFs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDA5NSBTYWx0ZWRfX+gT2kwCHMUtB
 mlYX2v0v4lYBIoj/2J7oVuvWR4BgvbXGkzOrgYP5T/jX9IQQ3gVuEMwzDFvTdNkgWtsOESJwIXj
 ia0hNTwd8jHL220e89BVpdX0tAjfO56S1VZfPW1ZkBxvooq4NboFE0uvjtIJWHe1umGN/N3Kgsb
 Ieq2RRhsAiPrDo3KfzxQJnvJcJrdpgmzuwotK9MK3lvQPuFsNHHnksL/FqGLBQhRVA/otzr4HvV
 Bb/+yFt+EwQgLaLgK0iJzob7y3CngbY9v0WRLCQUJ0qdMe3n5TJYWcqi/DDvBnBG8PM1D80uaJv
 2QTn7L/SSWqMyxxjo+SLKYTPUexCzqMt6fngmov1JvQVPN2ITd8GUvhjdmg7ZOkOmYm0e/iGyVx
 jTHufLnj1/m39juNkYkq+KMAiAyqyy0tSGU3v8U7S68hHkDRvTszdXWYWzeCLkJ3+1DChcNOfuS
 4jU3rAb3lwSLoYF20SA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDA5NSBTYWx0ZWRfXxne0w8SsCD88
 JB4ONCyQ+mJ5XczSeFLp3bGsysFh6jRa2yo/TDDh7gXFhYntujzGYMVgMc/RuLDL2GUlBGiX8nE
 mJX5A8Ojv6VQ0CZEuLn/+UD50XPvg1g=
X-Proofpoint-GUID: N7nHsE5GFE-7R0pwRh7wxjT6MdoL6LFs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_03,2026-08-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 adultscore=0 malwarescore=0
 clxscore=1015 phishscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260095

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
index 36af1ad2105d..a489932c7b1d 100644
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
index cfe39f923224..1c6d2c31820d 100644
--- a/arch/arm64/boot/dts/qcom/monaco.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
@@ -4842,7 +4842,6 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 			qcom,dll-config = <0x000f64ee>;
 			qcom,ddr-config = <0x80040868>;
 			bus-width = <8>;
-			supports-cqe;
 			dma-coherent;
 
 			mmc-ddr-1_8v;
diff --git a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
index 1ff39530ea3d..4f9710587e71 100644
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

