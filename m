Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C84174A4857
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 13:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789047059; cv=none; b=Uoa7eEKuYqCkSMXB2XcKGSz12/9d1vJkKYHKdWh2KLksWNOfTPhZYxM9GizcubgPqgpeJjTvp3pXZnTINFm+9SThTRyg+Wa7v26i6vEVq6D3IB5Id1pAlosId9Pe2kJU85svLsAqsdB+t7dGSEu2KqHgrKs1+38CgrsqCQDd+DM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789047059; c=relaxed/simple;
	bh=XqISqFfLEc1XPNkt+ZZkl93gzud5eHypdyciEc4v9mw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bmUxRoM3Hv0TPFTBGaoFlBPxtP+ogr2CLuuARnISzHFD8IBLwgEcSiK/VXeCL4aZKiq/v8nMdVR+/lvBNBItaBLHO8xKEvTtvtOEMR0CaCjl6ADrpgDVO1J7YiMra6pRe/tpyTFNK+nVfAXfjYrxueT6/AaUz6Fy8PlzWEtFD90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T/6Ss/Hb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OlYsa4BO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T/6Ss/Hb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OlYsa4BO"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68AC7hPA1440574
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 13:30:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wO1J7J+9A7mDzAYE6uHLc+XSY3GlhO5Wh40S82NkGtw=; b=T/6Ss/HbYECNWo7Z
	StqgYvdfqkeT9Hf8nfZNVA7I7TMYMCzl4fTIx4Zwk8lRpe/R8Ld+6Vkb+hs+3udD
	OMDlAhBZOz5glqut5DIsd/ouP7eTj1rl6fC8SG6BUkjCiDuMBFMf870mjiCcobYb
	OtNiDgJIjvW3goowo/5hBblLHYzLrCLWZPKEuS4BmcCyn/A6an1kehhMpUWP4GKZ
	66U0fcaMgrGTGqCfcXi3r/y7NODzLYzmJ50ajA+0RwruoRpNcfUyhhDyoCnlUw78
	KxyNgwXAVPyr6gKb/qcQ/8idMmRhJwqAWMeEY6L/HkpUs/r9NwAFL+DXHkp1bl/d
	Od5gIA==
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkqsvsf7m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 13:30:56 +0000 (GMT)
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-6c07dcbe60eso35886eaf.3
        for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 06:30:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789047056; x=1789651856; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wO1J7J+9A7mDzAYE6uHLc+XSY3GlhO5Wh40S82NkGtw=;
        b=OlYsa4BOdYY9lve68hPSgxy0vsc7NttGjqNGaTV9dcJFG4q9/JB7KH7QvyE29gpdCy
         s8m9FaGRrLojNwbEG2QqsgIVozdVp8YdSFvJ11AEW70Apm1W/TT2AmHoxY/o7zak9sx5
         PdobQWjpPfIUfJBjno29EtYuAzEWywvH2m0pAMepqAEm6j72RWKYfYBQ1qeTNOjEqBn2
         6OB7RiMWKK5an0iA6PA2TgyYCKtAiNnI7DNKokuptD7bUcQuWR8F1AV8wtRDjEs7pJ/W
         PxCan81ktjD0KU5ikw0ati6ccKYr5gS9m4wEQImPrD2IMhis+CHTVMkKTWHhvrFvOvff
         SY/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789047056; x=1789651856;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wO1J7J+9A7mDzAYE6uHLc+XSY3GlhO5Wh40S82NkGtw=;
        b=C8hVMa57DBhncxs1cNYwvG6YNI+LKM/SNW08zFldcHtUN0grlyrcuVu28ZoQPvBfsl
         7Qu1u4wafTOxMI9NeF3/ItI4R6V/8VYC83DEpmXmn0ibaqdFDhy762WjFfPlYTd6Wu5T
         L23ZXlvAArdrDtYEOW3gS+WpPH2hflZJ0ZlFB5BKO5w2p5AsV772gd8jYunLliJZ7R7D
         J3bxm7sPwMINluK5GHgGmbBdGAEQ4h3BKy6zyTi5jICLH56B5mAoJFc4gY+OBHsgvbiO
         CWir44vIzb+mOy9boD7V8kvE/i2zzIVbFyrCT7yJVhvILZgVdgE0Qmn9ONPrfmtyH2pt
         2ZuQ==
X-Forwarded-Encrypted: i=1; AKwUvBxkvVmTTIQHt2dBS/2QcjZVCZq7he1kPiMB/0pCi0NEtgFOzDe+iACqkl1XVyu3cXmtO1LraBA+tb1K@vger.kernel.org
X-Gm-Message-State: AFuF++kDWZrBKKofBSLztFUcsTcL2xcbh/SZXkPLBTEIyisLpP/FImxM
	n/Em43CXpfBiV+szkugpzog5uHTAGPB+wBIwL1DxOYqEB2Rgem8GKh5/gTEOQCGNGa/e1qVQIdd
	116qZo++Ykvjl8mhPOztNEDo1CG+zfFwqsl1LEi/5XSOwEcDDezrbYmCJ0BRxZVAn
X-Gm-Gg: AYBFou3S+M4QjV7snk7NpG1LJaJ9HPw5bpAW/9a/clJ5mHNwq4HiOe/HchNYwXZQod5
	tMEofjiuPJwuSOIptIHP+2ap8IHitzUiFuT3CXEUZuPIU35dAff3F8wqHNYzZ5FTQpcPHtx28Sv
	7WczAV+8Usmr39fllJSFCJrTV0+kmi/SG+vR5d/xnDIxTEEqn67DtA+4IBlI+QF/3STLwV+JLsL
	7ZUJxo94yfzvWa3HsnJo0k6ScMZ9oxhNPXD+QBDAPl6/cwKxDm0GYjX4Xwcr7vJg2grMJc1WWSr
	gbQks1Vi5sX8+2p879rnz4YxF0fYD634SRXpOADJKxgQF7RAoMimIjjOGZCfY3Gub9hUNvO+dku
	SAikayQTWT2yphKY1JWCXO2iHUug1u3fvNig=
X-Received: by 2002:a05:6820:211:b0:6b7:83d6:2926 with SMTP id 006d021491bc7-6b783d62ecamr20460914eaf.41.1789047055656;
        Thu, 10 Sep 2026 06:30:55 -0700 (PDT)
X-Received: by 2002:a05:6820:211:b0:6b7:83d6:2926 with SMTP id 006d021491bc7-6b783d62ecamr20460880eaf.41.1789047055187;
        Thu, 10 Sep 2026 06:30:55 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-338f7bad290sm21568614eec.14.2026.09.10.06.30.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 06:30:54 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 10 Sep 2026 18:59:14 +0530
Subject: [PATCH 25/34] arm64: dts: qcom: sdm845: Move PCIe phy and GPIOs to
 root port node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-root_port-v1-25-90a252ddbbfa@oss.qualcomm.com>
References: <20260910-root_port-v1-0-90a252ddbbfa@oss.qualcomm.com>
In-Reply-To: <20260910-root_port-v1-0-90a252ddbbfa@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, konrad.dybcio@oss.qualcomm.com,
        mani@kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789046944; l=3776;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=XqISqFfLEc1XPNkt+ZZkl93gzud5eHypdyciEc4v9mw=;
 b=FQfFgZNU6HPEO//qk2F1KQYb+FNX2WZ02MsC9oIFwanstgnRhY7nTmOQc1p4Ka/gADMkliht9
 hRSfRAerlOlByxBl6AfGKaZpJq/MNbOhA8VTZhHbGIT5RQbOoRvLULi
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Authority-Analysis: v=2.4 cv=DdOCOftW c=1 sm=1 tr=0 ts=6aa2b110 cx=c_pps
 a=V4L7fE8DliODT/OoDI2WOg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=qQkGquXN9PvF_GGjQ98A:9 a=QEXdDO2ut3YA:10
 a=WZGXeFmKUf7gPmL3hEjn:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDE2MSBTYWx0ZWRfX0pXaOm3oxzZA
 Tyta9OTFdQRW5ILXuT8EuzhTvQQFSt6PNcyXMyyqkgoOicXaj2UaCXtm7Un3u3pqsu3gm2UR+Es
 x0Sc7FJ8Rt2DdAauMfCAkrHhSe00Hhb5CG9cuo6WVJ+1iQSaKRHd7zbx3cHTmlXOZEa9iQ/LZdw
 r14HeGzUED2UJ4emoKpA3SbzNunO+b/UkthdLLIpiJ6kznKQCrW4bv3OpURDA4DeQW5mJddrd3E
 lxeP8NmJDpDqc3eTgTiBSS2TAbkBIerIVjV545knTrAJicW6sf7VFNE5bRDUdJiIh02j3F2F1qH
 up3IRH88kvJpC8quJ6xSZxDYsRomVM5On04BX6PQ4ES60a+8KirL1xXkhr2iejEbBnnoGN48APy
 13H/SP/NGyWThSnC6slqL3ORZ8HiqqXjPCg1j5vsZdU82yDvkseqGUyWFcWt0A7yPRIFiYuhBWE
 XRB2kKsLZtUcaeErFYg==
X-Proofpoint-ORIG-GUID: 2z5N1z9_LV7PhJZ15eYvQ9pces0Q5Pq6
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDE2MSBTYWx0ZWRfX9/6ZmiB+CbLt
 WDWe/OUqdRoGdY1shsfGQ9IUMl+DVQ6aOMe50s31IEFKArDLsIVzEXYawJwvWlsEDMhwm+qhYfl
 sqwbWjhvwoneA8a9FHGAg6zGopqCNXM=
X-Proofpoint-GUID: 2z5N1z9_LV7PhJZ15eYvQ9pces0Q5Pq6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_04,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 phishscore=0 malwarescore=0 adultscore=0
 spamscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100161

The PCIe phy reference and the perst/wake GPIO properties are
per root port and belong in the root port node (pcie@0), not in the
RC controller node. Move phys and phy-names from the controller to
pcie0_port0 and pcie1_port0, adding labels to these nodes to allow
board-level overrides. Move perst-gpios/wake-gpios from the
controller overrides to the respective port nodes in the board files,
renaming perst-gpios to reset-gpios to match the binding used in the
root port context.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts | 13 +++++++++----
 arch/arm64/boot/dts/qcom/sdm845-mtp.dts    | 12 ++++++++----
 arch/arm64/boot/dts/qcom/sdm845.dtsi       | 14 ++++++--------
 3 files changed, 23 insertions(+), 16 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
index 3e636926231d..27a0b90d2b7a 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
@@ -618,15 +618,17 @@ &mss_pil {
 
 &pcie0 {
 	status = "okay";
-	perst-gpios = <&tlmm 35 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 134 GPIO_ACTIVE_LOW>;
-
 	vddpe-3v3-supply = <&pcie0_3p3v_dual>;
 
 	pinctrl-names = "default";
 	pinctrl-0 = <&pcie0_default_state>;
 };
 
+&pcie0_port0 {
+	reset-gpios = <&tlmm 35 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 134 GPIO_ACTIVE_LOW>;
+};
+
 &pcie0_phy {
 	status = "okay";
 
@@ -636,12 +638,15 @@ &pcie0_phy {
 
 &pcie1 {
 	status = "okay";
-	perst-gpios = <&tlmm 102 GPIO_ACTIVE_LOW>;
 
 	pinctrl-names = "default";
 	pinctrl-0 = <&pcie1_default_state>;
 };
 
+&pcie1_port0 {
+	reset-gpios = <&tlmm 102 GPIO_ACTIVE_LOW>;
+};
+
 &pcie1_phy {
 	status = "okay";
 
diff --git a/arch/arm64/boot/dts/qcom/sdm845-mtp.dts b/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
index c66df45eee64..0080000a1839 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
@@ -508,14 +508,16 @@ &mss_pil {
 };
 
 &pcie0 {
-	perst-gpios = <&tlmm 35 GPIO_ACTIVE_LOW>;
-
 	pinctrl-0 = <&pcie0_default_state>;
 	pinctrl-names = "default";
 
 	status = "okay";
 };
 
+&pcie0_port0 {
+	reset-gpios = <&tlmm 35 GPIO_ACTIVE_LOW>;
+};
+
 &pcie0_phy {
 	vdda-phy-supply = <&vreg_l1a_0p875>;
 	vdda-pll-supply = <&vreg_l26a_1p2>;
@@ -524,14 +526,16 @@ &pcie0_phy {
 };
 
 &pcie1 {
-	perst-gpios = <&tlmm 102 GPIO_ACTIVE_LOW>;
-
 	pinctrl-names = "default";
 	pinctrl-0 = <&pcie1_default_state>;
 
 	status = "okay";
 };
 
+&pcie1_port0 {
+	reset-gpios = <&tlmm 102 GPIO_ACTIVE_LOW>;
+};
+
 &pcie1_phy {
 	status = "okay";
 
diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index b1f6782a3ad9..cb7f93b02b5a 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -2395,16 +2395,15 @@ pcie0: pcie@1c00000 {
 
 			power-domains = <&gcc PCIE_0_GDSC>;
 
-			phys = <&pcie0_phy>;
-			phy-names = "pciephy";
-
 			status = "disabled";
 
-			pcie@0 {
+			pcie0_port0: pcie@0 {
 				device_type = "pci";
 				reg = <0x0 0x0 0x0 0x0 0x0>;
 				bus-range = <0x01 0xff>;
 
+				phys = <&pcie0_phy>;
+
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;
@@ -2525,16 +2524,15 @@ pcie1: pcie@1c08000 {
 
 			power-domains = <&gcc PCIE_1_GDSC>;
 
-			phys = <&pcie1_phy>;
-			phy-names = "pciephy";
-
 			status = "disabled";
 
-			pcie@0 {
+			pcie1_port0: pcie@0 {
 				device_type = "pci";
 				reg = <0x0 0x0 0x0 0x0 0x0>;
 				bus-range = <0x01 0xff>;
 
+				phys = <&pcie1_phy>;
+
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;

-- 
2.34.1

