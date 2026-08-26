Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BD663AAF67
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 11:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787743531; cv=none; b=BrVahDbARngQJhdR87Ja/Q2IP1cmk1zHqg3GuRL25rKw4TBrUkVguz4WbGoKqt7mynfUAjbqSVGoHV882ZhLSNx19PnJri++Q3LkEQ8RtOHI9+YgJ9f7xQYdjEjkkx3eVeUW4EqBFhbYuftQaUFFnL5EZobmLhEdXXffeYnQ8es=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787743531; c=relaxed/simple;
	bh=lauNDcSBWQEB1wpFy+AKrjX9jNDv3FsK+wo8UDR/TnI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=r4RwVY7reIfQjQYENlMwCV2zUiC86lRd07mpugwfSIxjJ3Jy8N7qUaFDDvwCQQDLZlJXc3bJ+14b0racwg/Pfll2C8xhL3ttWk9AjYwKPb4zHCQAVvvqGeh48zpY9ZDp5vD9aDDBpS8XD3jjlCNzd1cfPeyL65EgrEvA84IL/Qc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LAJzcWD+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SOdWqsbE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LAJzcWD+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SOdWqsbE"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67QAHZpj426089
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 11:25:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=G3M3L93eTca
	TF53MYwAS3m+w9XsXTZ8SJ58vsMx8Ofc=; b=LAJzcWD+kDmXUz6OrJXo/Wl3rOb
	OK0ATnOwD8gS8bYCHwnhFJLz5zMPdQDPoQbTmyNN432cm/R38Su3G75R04M7HbmQ
	trEdcabPYjrWYWc9y5VjPOhyJVbeevwvH2HTltGmZQgtxxb7EpmdAj3+Lj5PF4WU
	LxI/5IIXc446dZuizSYAr1OMtFn2AotNCHjLcyIdE83vLDZsvX1uEAW33rxTfG5H
	2gzLFazTzw8U4IBfFLAoDsXYAQR5N8HDMTFa2K3SrvAczo3AW7yLY54c9yCviNyt
	vX4mnVoMneMuD4+MG3b2p9p6r/CVF+Sx6prUbJ+leLcAcd3HYWU+lxRDidA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9fceumab-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 11:25:28 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38ec0f510a9so2560325a91.2
        for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 04:25:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787743528; x=1788348328; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G3M3L93eTcaTF53MYwAS3m+w9XsXTZ8SJ58vsMx8Ofc=;
        b=SOdWqsbEN6O8B09SjrD1gXi8Tsdf0QVk21R5lErgzc7ElBVXUirlbVFUxby9stnkzE
         qEqM5efXa7jfmeShry8/mx15QgxXOS4uv30fBib4Q+EZEYimfkwR5EpI/LyhGP6h5zgi
         oWsR5ASbXdlLU2dDtLjgE8qDOuENPCt4sgaTEGVJmWpHVQkTeOZ4jqRy/ZBtWReqBFcT
         +Y6TP0A7kms2EvSIGBcInqExZufrVlvdY7VmXk9MYtyEDg/SKw+MFiZyWSVmVUU+SF7C
         uDlbG/CfZ+77raxjXHZE+g6xtKWI1670+paU4/yhcbXQ56FXBMbhgnaGol4wQj9tkas3
         6Vyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787743528; x=1788348328;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=G3M3L93eTcaTF53MYwAS3m+w9XsXTZ8SJ58vsMx8Ofc=;
        b=hb4fB5LiTBe6VLY88m7xK45bkPdS1rpmR0F8cP1YmfLinwOtghYLZTEtd8dOn8eR3S
         MgswJHeyJnwyonimLGPwcWzOXJxynZw6GRgT9kwNmoGYJmU8Y+zSv9OGtnAob9T9XUYK
         XYB8mozk/NKFzqe3m0UyiElLDsKoetinvu4a+k4VjbJ3/pzZymUu0kgZs9sqjeG+Wz3o
         De9ZiUk/j56uq7LMkc9uYXoA0b/qm6ylzKAz90Yss4RnIS6cIIYncFt9UoZou6G8AneT
         lpBZi9VKsrtqRjfZtDI5sOtPKK7FVnjtgMJZ05IpPHpPZuX9BqQTOrb72Cig6IvUOJDr
         vh8A==
X-Forwarded-Encrypted: i=1; AHgh+RrF+w1rwcXTWchA37ewbHPea6/Lbor16XObR2Y+NLwEujJlhsTgmjxxD/knhJpY1cQZ7UDJGHxPV0jb@vger.kernel.org
X-Gm-Message-State: AFuF++m/fErhn6r1ypj4Dmb0XuKjRacvdXUoVTyS7sXvaixQzbCCn2tJ
	tAHJEhhH0rKjAU55F71D7t7hqX9GJXgsyIA9VpCEAoik5qzPbSLwLvfWZzMICYytkrweFod5zCK
	r3OlAKkWZpEjNq6zV+4gVV8uvevQ6DFsG8Isyoxlh1nbL4N/Cg+SMU/x1/7vMLU3C
X-Gm-Gg: AR+sD10ey0pvr0UcN75uzk9DIVGQi520iSOjLu/unGb+d5++gJDx8e91lwRjNgh+88S
	MMM6QohDCzh6/wP6dKZ/EC3uMCwH9mOVjB5gB5+zGpVhmySdYYWFhfwHKIPsRGPxBF5pm0EN2J+
	1dSwPhTwKVSAqJvJeKeDT9l3JyvMQPWH3CGFGAF0NbA43b1qoB687QJfQqFqXSfqhQIuEqujAzf
	WEt2UZbHHQqMN7b7QeD0+1DBunsCRXuNV4Vd2fVWfRTt2Mo2l3A0f+iZvk/qGPGyf35hLoPO/jm
	/HK7+Hr/dYwsXrSug6YhQrp6WkPXxvOr7aNPkwCjc3FAPrNe2jkWTF5XXfr/GmABd16b8iMY6Xo
	u1sej8y97nVOHAZ6qRVxqhIehHFHmGvYYb4U=
X-Received: by 2002:a17:90b:2791:b0:395:7fff:a08f with SMTP id 98e67ed59e1d1-3966cffb1c7mr13910426a91.0.1787743526794;
        Wed, 26 Aug 2026 04:25:26 -0700 (PDT)
X-Received: by 2002:a17:90b:2791:b0:395:7fff:a08f with SMTP id 98e67ed59e1d1-3966cffb1c7mr13909934a91.0.1787743524543;
        Wed, 26 Aug 2026 04:25:24 -0700 (PDT)
Received: from hu-mchunara-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39645d31e8csm7521016a91.9.2026.08.26.04.25.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 04:25:24 -0700 (PDT)
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
Subject: [PATCH V5 3/3] arm64: dts: qcom: monaco-evk: Add SDHCI support for eMMC via overlay
Date: Wed, 26 Aug 2026 16:54:56 +0530
Message-Id: <20260826112456.482982-4-monish.chunara@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=a8AAM0SF c=1 sm=1 tr=0 ts=6a8ecd28 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=FLRs2unuW723IZJmkEMA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDA5NSBTYWx0ZWRfX+VWhoU/p5AkJ
 mpgh3EEBycqICR8p0ExqHjZWuYajX/gm7qGpnSIeAogjomaI2AB7rMAcTAIYUx8QkDiMTzSTOmL
 pFpQLs+hC2NHJHgK57kUVbrk2/KeNLg=
X-Proofpoint-ORIG-GUID: Epgaj9xBZ53NPFI33TyKVaBhurbqQr1U
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDA5NSBTYWx0ZWRfX9Zfp0YWtyVg+
 LAx/tMn+h0UVOa0f6IC8rfK7ilC1tJLKrM0iSq92elnPiVVJk8r0PGK6BXTz6knP64gJzskdHGl
 o5Kd1N2JJlSOnjZlcbqWRBqsAnkkls4VbIW0K63JukB63GreOwLRfnG2YK3qui4eWzRbCqpw6ln
 f76HDYTcCCOEGWziVikSFybcSL9wGyTWOqUp5xSscTVrJEnxedlaNSbwwS/02p/RENu0eWsYB/7
 NF7e0jY/BGMYdKcFGHG8c1OUy47276kLWPq4R4HoQuxr69R/PwlA3umcn8NoxUBnC/uLeubN5sp
 ehsik/bYWuCAOuCq/2D45CMbBmLjuEBarAUBxo6KI/4Dp8tkLuj5B7/mnEBzX/8W+PmRWsCYdYg
 W/kzRZ/ifqi1O5mb5nRFrPLfmDDwRl/C+kDxNJhmPgCORBJCXsr6EDp0VvSwQOqfYevcSyTUHkl
 8NfmGpLWauATC26Odpg==
X-Proofpoint-GUID: Epgaj9xBZ53NPFI33TyKVaBhurbqQr1U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_03,2026-08-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 adultscore=0 impostorscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260095

Enable the SDHCI controller for eMMC functionality on the Monaco EVK
using a device tree overlay.

Signed-off-by: Monish Chunara <monish.chunara@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile             |  4 +++
 arch/arm64/boot/dts/qcom/monaco-evk-emmc.dtso | 27 +++++++++++++++++++
 2 files changed, 31 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/monaco-evk-emmc.dtso

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 466d4b67f72b..9c1ed020f53e 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -69,6 +69,10 @@ dtb-$(CONFIG_ARCH_QCOM)	+= monaco-evk-camera-imx577.dtb
 monaco-evk-el2-dtbs := monaco-evk.dtb monaco-el2.dtbo
 
 dtb-$(CONFIG_ARCH_QCOM)	+= monaco-evk-el2.dtb
+
+monaco-evk-emmc-dtbs := monaco-evk.dtb monaco-evk-emmc.dtbo
+dtb-$(CONFIG_ARCH_QCOM) += monaco-evk-emmc.dtb
+
 monaco-evk-ifp-mezzanine-dtbs	:= monaco-evk.dtb monaco-evk-ifp-mezzanine.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= monaco-evk-ifp-mezzanine.dtb
 
diff --git a/arch/arm64/boot/dts/qcom/monaco-evk-emmc.dtso b/arch/arm64/boot/dts/qcom/monaco-evk-emmc.dtso
new file mode 100644
index 000000000000..6454efc03ddb
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/monaco-evk-emmc.dtso
@@ -0,0 +1,27 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+/plugin/;
+
+&sdhc_1 {
+	vmmc-supply = <&vreg_l8a>;
+	vqmmc-supply = <&vreg_s2s>;
+
+	supports-cqe;
+
+	pinctrl-0 = <&sdc1_state_on>;
+	pinctrl-1 = <&sdc1_state_off>;
+
+	pinctrl-names = "default", "sleep";
+
+	non-removable;
+
+	bus-width = <8>;
+	no-sd;
+	no-sdio;
+
+	status = "okay";
+};
-- 
2.34.1

