Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A14D4219FF
	for <devicetree@vger.kernel.org>; Wed,  1 Jul 2026 10:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782901726; cv=none; b=lpRyMjKH92ydSrf14spFf5i+slS84ai7khf+wNkq4N4KXmqCYrlceYOfzROV2IbxdhoIJhBMAHUkTiuuCU8UY2Byy61viN8ST30qvSOlNswTfuG9IoKpdu9nouTXzvUyO8drpgYeWpA+0ghaB/oUQtSzul6Utoy3sXts7MMCb94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782901726; c=relaxed/simple;
	bh=XbWvniqK5aAu6rfptvx1k7eiiq//LDGyrr65CL07e9s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Di0sYCL1h1lOvoNHFD/Ih6e70u8tlDtMZYOwojmU0czSBBzzNQyzgpOZQabMkI9alwDi6PiHuUcAvpiB22bEAaTrsEaVMCYBMg/LRnxq2OQ7XK4l19pvbAFlW0BzZW82tlhePChaCnw9cMCe0nkBiJlK+mJgPyspSsQSPowN85s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EtD2x/Xe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FVkPmE49; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EtD2x/Xe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FVkPmE49"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661AGI1m793834
	for <devicetree@vger.kernel.org>; Wed, 1 Jul 2026 10:28:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ooj/Up7A/NW5XoMrilgJJres0a+mQsG4S39LwGCe+VM=; b=EtD2x/XesWdOD3Pd
	WwuiPpHROrQylbK+kgQTd1C85hRES6AVu6OJXnbivHFhnCVCZu1GRAdisBN16Tbp
	1PmsWA7rBYc/BewdOtK8ySrcStC4ped4fh98EOzVcySjedZs435MT8t5HWhFwYa/
	cYH276VwPC5eCl78uXmr/KUfF4W/LwLVOv12QtK/o2b0jpHg201D8Al/aTEqKlp3
	KxIdB9Mxezd9Ear8BDjoCHtphe8j39XCnpAMAq8oYTi/JoYTop1NWyFot6JpWe7D
	448uzaEMCJUBtAXR5rhk8pKSDsy7I9NxagU9ZCLP5PLpePUf/Sxgv0ov6KW93puP
	KcOuaw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f510ag25r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 10:28:41 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-37fec599568so664030a91.2
        for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 03:28:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782901720; x=1783506520; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ooj/Up7A/NW5XoMrilgJJres0a+mQsG4S39LwGCe+VM=;
        b=FVkPmE49R9rL6OoxmFkcChai4QKlEkRADRNCC4FjBz1taXSM9zwLBiG9Sj2dEj7GAD
         ThPA0l/Mi1ooRTcpFpvyer81kq2uBYzzLx6AXxNdf07tD86Ts3KuFGKRo/EuFJ4hzfcx
         JMyTyG1a3xEVwjKGXWPqHMDJ7h0Or+mLelf8f/ae/620y/HdlfeBcpiQZMjtJikCk0ES
         Ar7Sls+c4lPvLNs/ghqGPj5e+eqsS/FdhrQTdpe6BhDS9rZmLXMGgIQP/Q+Br439vB58
         TIAM3JV3i64DsMnT4JqHzrYqxasuutua3C/sdx9rPY2FQUhdsB2qo/yy8Vedks87e586
         5FRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782901720; x=1783506520;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ooj/Up7A/NW5XoMrilgJJres0a+mQsG4S39LwGCe+VM=;
        b=F74fqEA+aK5MfMsby0bYMAtQIaZcO+d6qnL3iox9ENPBkG3TwULtYDA9l2p9XriHgo
         3CLsfTT/AVvt/jBQ5kOWnjoL3UmmxN4k2QFAeddJTw7WnMY6B4gonQVmfjevLkMCIa9W
         3riNvGejwlLVLDNjP1w5Wm4tGdxpIcMMvQ792lsDbDCQhsRR099mArgSz5bRXH8Bfw+2
         aMdxbfnyk0Oci/hBk6UffgCX8cmfQr0LHmWqiRfOdwqhcTnIHTkVFTJA2sBdh2NJstUB
         PF2GGPxF4N9VMYb0jFxPRtCW+7mJ3T729uWWFj9P8y5FtpZJS9avGhN1GPcdzE7FnnUt
         03dw==
X-Forwarded-Encrypted: i=1; AHgh+Rpk4MHILWcuCEJ8FQFxLOxlJ1jafIoewr/FVxwWDn9+ZZNIQdbSaVIKYC9lyFUCm3N2hwX8B1jH2eVY@vger.kernel.org
X-Gm-Message-State: AOJu0Yxc3/qSCT1ovk2xA8pdbFtSgRj+eY/filQ3sN5DRsbnzcgu+G3B
	WvaZHkY6tQP8bxk5uSA3OXenEGpVaMJktV8eaoEWefSItXGtIrZo5RwdtKhJYQCRinKNsCEOeXf
	szzgWZeLtb5OW43NZvoZhzthjbvdFDf18XsJ0ckxhZEEPtnp8oAhL0+eiqxkfmms=
X-Gm-Gg: AfdE7clwxHpbtCoaviDNi7fL92nLDk16+nIYX35BqlNZn6+7PBfKyXlpKdjkdffUmKj
	A9ch1X+p4aH0GWlHypiqOawHiuMDigkcURDXGb9jkSBVbw4QQYaVBEj4XH2F3b21lYQRWuklK+d
	v8J105PE+PRspUqsVM6rRqX8jRxA/8jQ1HOdnOolWxDFso6ZCnt0EN0PGcfrTmaN9uvPKx0LUlO
	O233sHvQ0qxs/JPdm/bPeaEZ6p4dGXOZB0IyvCWU/6lhWwgkv7Mh3X/9XL7brNE4sH+sAGhkRmm
	oQw6qKYRGxyktgevqG0ukkSvkv2eoINofbxpi0XuOc0XT9Ve+/ID6cduhioXyschV2hjgzX2zwF
	FYsnPBksSJolestSP+tuS9SteF4v5OCfwuTmrZWHI
X-Received: by 2002:a17:90b:4ace:b0:37f:9ce1:cdad with SMTP id 98e67ed59e1d1-380aa1d944fmr1094908a91.27.1782901720471;
        Wed, 01 Jul 2026 03:28:40 -0700 (PDT)
X-Received: by 2002:a17:90b:4ace:b0:37f:9ce1:cdad with SMTP id 98e67ed59e1d1-380aa1d944fmr1094877a91.27.1782901719916;
        Wed, 01 Jul 2026 03:28:39 -0700 (PDT)
Received: from hu-kotarake-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38095d2a0f0sm1658103a91.3.2026.07.01.03.28.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 03:28:39 -0700 (PDT)
From: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Date: Wed, 01 Jul 2026 15:58:05 +0530
Subject: [PATCH v2 3/3] arm64: dts: qcom: Fix pm4125 vbus regulator
 compatible and constraints
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260701-add_pm4125-vbus-reg-v2-3-6bac2bac7131@oss.qualcomm.com>
References: <20260701-add_pm4125-vbus-reg-v2-0-6bac2bac7131@oss.qualcomm.com>
In-Reply-To: <20260701-add_pm4125-vbus-reg-v2-0-6bac2bac7131@oss.qualcomm.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, jishnu.prakash@oss.qualcomm.com,
        kamal.wadhwa@oss.qualcomm.com,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782901701; l=2118;
 i=rakesh.kota@oss.qualcomm.com; s=20250919; h=from:subject:message-id;
 bh=XbWvniqK5aAu6rfptvx1k7eiiq//LDGyrr65CL07e9s=;
 b=nN3MA+CXKlKbMfwqHM9cHSjQHyL4Q0nAw7uGZ2Yfw9Y2vGOwsEed06/BehPsC/3IUgtjpH8/M
 JSM5/F54BgaDNumBf4W6wT6nHMxRCDnOpSTr6XGTaPkzCe08A7U+aoL
X-Developer-Key: i=rakesh.kota@oss.qualcomm.com; a=ed25519;
 pk=dFhv9yPC8egZglsSLDMls08cOvZKZkG6QQn1a/ofwNU=
X-Proofpoint-GUID: LvurQJD6kY3aKSKQSImr6_syvPAIZJd2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDEwOSBTYWx0ZWRfX8BixttYX+nvg
 jIk0nlaDiAqusf2yew7r0vZsgXTi2ILqGs+5vi7tAfLmU/Wg+tFVFQGPpgrRybGIzPm8BRomSl3
 Ln3mq/3V5S2QePHnN54s9qpUADmsCMoZXR4wyQy9S3BIm847OypYMVgHdGmlQpKxQL9dYE73QQ3
 bVVl6vz+4t5NHDNR5hI+ItR8XkEUBzaknqItjuxmnyPW2CPmoeWpjAbISa2RXCb9EWd162YXhTo
 V5LWb2pL2/4+jKAjiYtFCotqF95Y4612wRYB1pVN5jjm7HgqI9T21EMiEuURyiqKIolaTwewjsp
 TnuYYgWHBDLG8N0ibaOs6Sgq7MGkZroNgnO3ZsOCwtVBmw7hXnok1tePDUzK1zlqRDNpWunJbjy
 JEOq7FfmB1ytWvQaAfs0FaiR49+wMatOCNnhv7ghSnzB2nAEOLy/Ppx2fkpxS6fum/DRHYn811L
 GNNv1j6jxVrP7iMT3vw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDEwOSBTYWx0ZWRfX0ijaxpBP+Ezn
 6kYHqlpzrw/DXomrhF0sBkuOLQOsTExMYgb3YUrP0VGimood5huDwGbsZXbfZRbQJx8vu+JYilR
 4sTDRrJ5Py+ReOOo8Vc6aRXGQjUVAq0=
X-Authority-Analysis: v=2.4 cv=JpXBas4C c=1 sm=1 tr=0 ts=6a44ebd9 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=MBrZzK6-3DAqsS7rxpgA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: LvurQJD6kY3aKSKQSImr6_syvPAIZJd2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 malwarescore=0 impostorscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010109

Remove pm8150b fallback compatible from pm4125_vbus and fix regulator
constraints in qrb2210 DTS files to use microvolt instead of
microamp.

Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/pm4125.dtsi               | 2 +-
 arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts | 4 ++--
 arch/arm64/boot/dts/qcom/qrb2210-rb1.dts           | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/pm4125.dtsi b/arch/arm64/boot/dts/qcom/pm4125.dtsi
index 542e8fe030da40dfefc7b744dcc30133fdb35e74..3dc8d667d091ceb4267081d32b7aae983fc25071 100644
--- a/arch/arm64/boot/dts/qcom/pm4125.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm4125.dtsi
@@ -37,7 +37,7 @@ pm4125_resin: resin {
 		};
 
 		pm4125_vbus: usb-vbus-regulator@1100 {
-			compatible = "qcom,pm4125-vbus-reg", "qcom,pm8150b-vbus-reg";
+			compatible = "qcom,pm4125-vbus-reg";
 			reg = <0x1100>;
 			status = "disabled";
 		};
diff --git a/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts b/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
index bf088fa9807f040f0c8f405f9111b01790b09377..2b50f3f577577d30a87fcb6466c7d7690270aaa3 100644
--- a/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
+++ b/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
@@ -235,8 +235,8 @@ &mdss_dsi0_phy {
 };
 
 &pm4125_vbus {
-	regulator-min-microamp = <500000>;
-	regulator-max-microamp = <500000>;
+	regulator-min-microvolt = <4250000>;
+	regulator-max-microvolt = <5000000>;
 
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts b/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
index 4ace2d6c06ceee74ced7c8cf9b341089b689f703..3cb8c3c090fff2524cd3655affc012d714629138 100644
--- a/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
+++ b/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
@@ -433,8 +433,8 @@ pm4125_ss_in: endpoint {
 };
 
 &pm4125_vbus {
-	regulator-min-microamp = <500000>;
-	regulator-max-microamp = <500000>;
+	regulator-min-microvolt = <4250000>;
+	regulator-max-microvolt = <5000000>;
 	status = "okay";
 };
 

-- 
2.34.1

