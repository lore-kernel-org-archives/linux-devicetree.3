Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A40CB41B352
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 12:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778675636; cv=none; b=lk7E6Px21t4JL/F5esb/BMWZ/j/jDByHZBDEiZ7QLD9Gh/ORt5sxNau3jC9CJCvHtIbBqUfqPuwbMZJTcXh/yR/VyWAmZSC/PcswpF5PwPFiX/b4cm4YbAsFetG1xnVBHdpCQd4x3bgRn2dHuO6AkuZ0bnqi/r7U+ejVpPbIXoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778675636; c=relaxed/simple;
	bh=EIygU3vCTkwfK3dz5GTNUFb7Hw7qKz71CS++iTBAljs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nbu1b9ZiYZvpH+PLtIjnERBoNgt3BoB9U79txsoisQVAK/sp6+wUsa1fvJC01DyzeHsrkqiFQIKR4xkos162MCwavJpJKxYyBKrBlYpxmc93s/Bl+PHSPM5kKJrBivFnMJ5HIrvZMCOg2hdfQlPYO0xQsfKAxyTZLPNwHSyz7dQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RDrLK7um; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=drhHJvpC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RDrLK7um";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="drhHJvpC"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DAVKn22321247
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 12:33:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dNnn47QLbPTOUAelEfRJQYjrcBHj/Gefhyt++TJkVL0=; b=RDrLK7umwPf0pgmu
	UR8/uiP+GlVSfU8JiG4EtTSkW8bnDLSN1R9NI8czJMz6FPBb+iTJ7skQO5SQeo3y
	8Nw5XSjaFwX60dmaiNdx4swRj4ehsIgP5dc+CnHWuUFha9l+GD8tpPuZ0+ugZOZ4
	nKEZ8iV8Zo2lLlse106gXIvDIbwXBwiCIBuVLIBBteMDBfk5llzLp+RivVYF8s8a
	BxixtRcDMrcKmFNBt56WVmcPDZXHGD3sc2flkQFC6foDja7CTSrVFpr+MLtbpwvt
	5z1UaPqjoeL+MhX0UoDl0jHrTPDeCl9Qn70gWcHRuxHfdYy+UFL1iz2leqJ7zZ/e
	P/hHCg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4hgu9wb2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 12:33:54 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50f13da9684so55474261cf.3
        for <devicetree@vger.kernel.org>; Wed, 13 May 2026 05:33:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778675634; x=1779280434; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dNnn47QLbPTOUAelEfRJQYjrcBHj/Gefhyt++TJkVL0=;
        b=drhHJvpCueTu3HktwNtLsUjI4VshCfmWqwFOLUFskmyw5vuPzZG1P6+85/RzcGeKp3
         g/HkO45rep1bRky6PiuOoaCEhcIUhn7Rq60eBcWDxqgoBoC4IsHc338hD/8gPwI4UIZq
         oPoKwQRdk7DtzqR1Yr5HhEsYToVYvq8udv80JKwv0P9kc8I/tEqB9jHBZJKAojkE/WvD
         m1+atw/fkjv30jNMWuPlyXBVmYRcExL2kDKoixXLzZQTdwaR/VaLsLO+88J79PFkR30K
         dMs/8OHD29rgsG3BHAkRmHDiG14SjncpKDwgRPyTT+A3XcDGGggE61BNXRQjaYHkL/ri
         1QAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778675634; x=1779280434;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dNnn47QLbPTOUAelEfRJQYjrcBHj/Gefhyt++TJkVL0=;
        b=HC9XIG2l023xiTRp77SHBJDOeC3yna7Qsvxc/2FsPXVjf17huP+CeRCw1yvfKYWU0V
         FXt1+qPofj5cWY1toSzuGaYRVYs2qEeXjaX5BVV+kTebe302ee2CGBTWugVK4bABJTWh
         fINtXFV6n+icvPoKKdK3LbaDkkVpL0Zu9ti84RwFFGmhmnqpu4b3owaNMMEyYZ5OdwE0
         2FKSDSED0DXxoP1l4ScTQLLrV0K8xrQ6TIkfCZfnj4SqXpddR3T0d810+/D7pEUY799X
         TR/yqNK3Rdb3lyJmGSJz5gU3Mv/Cw5+zuGVW5WA5cZyzH9m65mXkUvY+8KIKokg3PDjB
         ZAvQ==
X-Forwarded-Encrypted: i=1; AFNElJ9kfs/SMH5pmZ7nyaSTlaXh6LyW2yI9qDzQPTLUeRwC3w9DlZZri99l2AOSvr0Mp+ky7NyrhVP1aXOM@vger.kernel.org
X-Gm-Message-State: AOJu0YxqAF/6IGOleHE1Km9TifUN6eyYmSd8XO+v4tywKUWOO/ecMhaJ
	0l6PbznM60FfREG5ALwQIVVLG1BcAPZ9GOQvDXewqJ9HVz6OXd5NfDvF2DJj3tm7lkBNUtjHdaD
	OY3uB0dCT0DIuygUStKs8dPyV5uBYlyv3lndMdVxWcfo8hfY6VugPJs8neTIHBeuTbrdMgHMQ
X-Gm-Gg: Acq92OG3zezONX+186sBmEB86vaInrGHMP8JwNt9P6g8sM9wEyb6uIZaWM3uJGWBF8g
	ELsVPlwCfCa+eQCQgFU4vQ6McDTHtm55ReQhsgCRbCdq4xpB7PSz0tcsuhcV2NLLJEO0h3mv98t
	YBr48aRY3eabVR5/GwXpFl5sh/b3gSXW0XJ1RJCPynKPg9SSAgHKh7rx6cPgs7l7+lPJSwEtGqE
	3BsvtzowPnFENnBOGhGpPHwNIDQAMSuIMio0qgYrZeCfRgr0RKsUxRwSkJ7m7Jq8R6bJC8NZwWM
	nmJXdfduf1yvzG4TxWPi4nnO+NqamdyA3OZsAoXFAPyBb+veNjTnji8x44cSbn9HTsprCWxDfaU
	JNrZWJc6Ax7OfjjupYRakMV+I3wpNtQ==
X-Received: by 2002:a05:622a:1a94:b0:50d:83a4:2995 with SMTP id d75a77b69052e-5162fe99d66mr36488091cf.21.1778675633573;
        Wed, 13 May 2026 05:33:53 -0700 (PDT)
X-Received: by 2002:a05:622a:1a94:b0:50d:83a4:2995 with SMTP id d75a77b69052e-5162fe99d66mr36487621cf.21.1778675633035;
        Wed, 13 May 2026 05:33:53 -0700 (PDT)
Received: from hackbox.lan ([86.121.170.241])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e8f410d9fsm58873115e9.6.2026.05.13.05.33.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 05:33:51 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 13 May 2026 15:33:41 +0300
Subject: [PATCH 1/2] arm64: dts: qcom: eliza-mtp: Fix the debug UART index
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-eliza-dts-fix-debug-uart-and-more-support-v1-1-05814d24f4cf@oss.qualcomm.com>
References: <20260513-eliza-dts-fix-debug-uart-and-more-support-v1-0-05814d24f4cf@oss.qualcomm.com>
In-Reply-To: <20260513-eliza-dts-fix-debug-uart-and-more-support-v1-0-05814d24f4cf@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=2183;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=EIygU3vCTkwfK3dz5GTNUFb7Hw7qKz71CS++iTBAljs=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqBG+pdDK/3r3A2VDmgT4lHC45hbk/Q3SYQh4Tx
 U9g3NRCZBWJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCagRvqQAKCRAbX0TJAJUV
 VnrSD/0QEhJfq007kGGIoR1eWxcxeRZWe0geUHmdx2xcSxGVvme+oJ/Zf3Nc3m4pRBdr+FhseyC
 iK5+JpNacDo28VfxFcVGxRCsz7CsbuKgMliBV2n53b3DvcinExdpcq4zHFkYsmUV5r3WHRkH+jy
 gLLUzpLIIpaeJaNNV0sVa5j7O/BLckkihTCCqYAtI0MnnwVG+BGO0cXVvsAnNv8wxRngwQRmOWi
 mGRixWVjEWnfhNR6d4b+t7qWDfY93PgiDXRcMPSFjadnLuJhapfyzOrD/y/XzSBqBg4V6gjNWU7
 171Vr4eZ/4CTuLgG8Y4yp++9s0w7qVydupGypKlAs1W3PnlMu9dyNyTbLc7dfO9CqnabCQIp2GX
 TGl0qm18SxHVjvDHndh4tqFWxkYfOl946e4PZDyAppyOrx/uymakY0muamHOUoFTOH7c0JY73Co
 RysnGrZ5QK0HtL8OFumZaTJOBVqRcFHK3x8NvQf+QH2EqZy/SRFPkOUPWu5tQtWD4YO+1z7EIu3
 Mhvceo8++9Wh2t+b2nsPTqZ5WLYBRev2EPmx4LkB5UiJ+EDak35jn2JMopQjcdqo3LhYJ1OvjNj
 VCvFe/YxPuFdWNdC3hgoMRV46wAxB/u6q1SYYXNeqg7jVQbA7MidXgqY7jhvw4t6ECIdv4fMN1x
 ox/86QpuS5pD4HA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=X4di7mTe c=1 sm=1 tr=0 ts=6a046fb2 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=NtgjAHhJo3Q0P2g9Zl9R/g==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=_2YC0VPWfGMhjcoLmTAA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: SRDn-DPdUekaL_g5lpo9Jcl7t26xmbnS
X-Proofpoint-ORIG-GUID: SRDn-DPdUekaL_g5lpo9Jcl7t26xmbnS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDEzMSBTYWx0ZWRfX0XcXU1MyUVE9
 Gf1cagZEIZHsuTxZEO56AzhIdPVnIFtdDMB18BuiINKYoz+JXJQajMLeXLNDbtMaBtuW/HPmFv0
 oWjEHhvSI2OypV5qv9/9lgUPJFp9ewyMXqMEAZnXUNaK+lbT7pBt3q00l8KuhpB0Ke5uiCE8ufM
 P64GK4X2XRpbblL41f+x6SDr0oFvLjBVOrOXjy8ybG/81glFp4BB3fTmpWd69gRrF6yg7WdAEpT
 i/sO3JCAftDeMZpj+upRkXyzt5NfQhTxyabWjGCwb2JlwHAl5Nt87E4NnaUUDRV1ZG25OCpjBTo
 ZQ6NAxCNzR0enCV9YEk/A1LXt9lZklULXaWh7IdQ7b7qqtKlT68b4TE7hvus70FUiiPQBdTqKIx
 NWouUSNxO6ytAJDwNKR7akjzKG1mzM9W8umrV7Nl9y2goXoD4eCVoolyoiuJ5w3bCjZKem7FQK0
 97tFHyeeXkLOIaUc9iA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 phishscore=0 malwarescore=0 suspectscore=0 spamscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605130131

The Eliza MTP debug UART is QUPv3 WRAP2 SE5. The existing DTS labels it
as uart14, but the serial-engine index for this block is actually 13.

Rename the SoC UART label and pinctrl state to uart13 and update the MTP
alias and node reference accordingly.

Fixes: af20af39fc09 ("arm64: dts: qcom: Introduce Eliza Soc base dtsi")
Fixes: 2a5d4fc6f3f7 ("arm64: dts: qcom: eliza: Enable Eliza MTP board support")
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza-mtp.dts | 4 ++--
 arch/arm64/boot/dts/qcom/eliza.dtsi    | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/eliza-mtp.dts b/arch/arm64/boot/dts/qcom/eliza-mtp.dts
index 912cfbee552e..1374afd9d14e 100644
--- a/arch/arm64/boot/dts/qcom/eliza-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/eliza-mtp.dts
@@ -18,7 +18,7 @@ / {
 	chassis-type = "handset";
 
 	aliases {
-		serial0 = &uart14;
+		serial0 = &uart13;
 	};
 
 	chosen {
@@ -506,7 +506,7 @@ mdp_vsync: mdp-vsync-state {
 	};
 };
 
-&uart14 {
+&uart13 {
 	compatible = "qcom,geni-debug-uart";
 
 	status = "okay";
diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qcom/eliza.dtsi
index 0fb153da4dc5..73211b4a17eb 100644
--- a/arch/arm64/boot/dts/qcom/eliza.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza.dtsi
@@ -679,7 +679,7 @@ qupv3_2: geniqup@8c0000 {
 			#size-cells = <2>;
 			ranges;
 
-			uart14: serial@894000 {
+			uart13: serial@894000 {
 				compatible = "qcom,geni-uart";
 				reg = <0x0 0x00894000 0x0 0x4000>;
 
@@ -695,7 +695,7 @@ &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
 				interconnect-names = "qup-core",
 						     "qup-config";
 
-				pinctrl-0 = <&qup_uart14_default>;
+				pinctrl-0 = <&qup_uart13_default>;
 				pinctrl-names = "default";
 
 				status = "disabled";
@@ -2039,7 +2039,7 @@ tlmm: pinctrl@f100000 {
 			gpio-ranges = <&tlmm 0 0 184>;
 			wakeup-parent = <&pdc>;
 
-			qup_uart14_default: qup-uart14-default-state {
+			qup_uart13_default: qup-uart13-default-state {
 				/* TX, RX */
 				pins = "gpio18", "gpio19";
 				function = "qup2_se5";

-- 
2.54.0

