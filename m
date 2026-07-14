Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 407A5306B0A
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 05:00:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784005202; cv=none; b=Qva3pXg0cqBsu/RPLrBVJuOxk8DIdZHY0ZUStz9sFP1US1o5MIUzfcWFjo0xNN7MUsKLa2WqOuUYbxtBkchYz8FmbCt/D1zi1sSjDKtYydac8AV7UPfvHnaDeA45G4mJNsE51T187uOb71cQh32DVdk9LsR6k0byDk7h0hvaTE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784005202; c=relaxed/simple;
	bh=Xv3av/rD+ldK9r9tj755nWcpZGWPEFEhsHdy0UkmLVg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YeWfogeu3lPkVYsMtOnjsKbIM+45DMxNa9DdkXWkwsCoquj4uoIaPYv5SmTRghZp4oCz+TBzGpBxMyAukGQa1gFeadEEcytxVGrW+1mwV0REOpcYQVp/0+OEBYqsDl9vU+JWcNLpDrR6qRgaaJId74glskkidEgAMu3Yvl8YVDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SYNmoun7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VZSlPEaH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SYNmoun7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VZSlPEaH"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66E37wif3276746
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 04:59:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gTDbhLDusd8RpoV9P1sSM4e1vQjmi4jllQGShEAZJQM=; b=SYNmoun7qemFTD5t
	j1Woav0E3B5VW+31/xgc31/hvKXz2/W+O1YZqr2eBpnvfFj8T8pS2tPPd4hG/wF9
	PC+RkOStyz89tvIxr+Y59moB2mfKqU/2RINAsKx12VUBrWQRvDZHiIcFDkpD1/Pa
	t1ymKVbLfZ8i8/PiGmHmrkEGUrHcsvWTJdushwyIOVne0X5F58jspcpE9VmoSHfM
	vyD7n5gB/2LVCXJIqM5rq6e4+rH1hm5soZx3LE/9gOWSfhYIanMV62oik1fyuLke
	UPivTvv5u+sJ7gAQhquZWP/79fPi9keuIVyU1Nu8hSML0wTljHdwYVkj8ewE/nVN
	MdIhXg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fd7gvh8d9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 04:59:59 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c85798977dcso2999186a12.0
        for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 21:59:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784005199; x=1784609999; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gTDbhLDusd8RpoV9P1sSM4e1vQjmi4jllQGShEAZJQM=;
        b=VZSlPEaHh/Zqqlg/Q31O2GovpxjOI+1kgDzQNmegC1y2yNQ4V40Ezh8+gd3WKcvQWM
         5zPow9a/+5LRWk46v5ngi2wkFKB8xdOekEaEB92un5iC6oYFR5FxcSRjFyZ1lT1GKNr4
         Yw1AJklmkrDq3kRAw/d57KD2L+alDStPHstm0XL+JSqbD6Gd6aQDuBB9i/xDKb+5nD1p
         dX+Hea3Ty86sxsft/aw3qsaLiWdM7LQE0NcE3l5ODB3cw0KkS4Vuq/Q33lZssx2A8paz
         mt3fslZR23W3buB6d+SWbfZlEoc7jXhwYf4i49T1b5mkbBkAUvaoE4Wbim6+upy8z7kK
         kjdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784005199; x=1784609999;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gTDbhLDusd8RpoV9P1sSM4e1vQjmi4jllQGShEAZJQM=;
        b=ducB+o8RMf1etVZLj+DSlin+nYNySDmi/6ITfSwrH/KwahGieaw/360sVUu2dBoZY6
         NgaUEX/HEyzwhm6NlTT12EPZ8TtpCD5BsnTu8fY/8aDpTLb6ZMe3hEWHXuC+vk9gg30Q
         hl1tWPZF35xMsNCZX9Egx+5giXQYMD1a09E7zEJfKeyxtleaqWRHWeL9TSEFbufUXJBR
         qA2uz24j/xJxRvtmSwTwnPZvSMVrUMuF0fOSW3Jb2uY9pRtpeUvKXLCpQWn3YU5Q1OlP
         HdmZYAaAVYZH7XNEuZXnXKSxZ4C8HhpCkgZjoiLQZTvbU0NC2NMNgOnfzRDBl+wPsrKK
         WZ6g==
X-Forwarded-Encrypted: i=1; AHgh+Ro7W1y1i8KUOQCbhGyZM2Yqs6a2JvLHxFTm2JIN8AHnuSXvPU5U1irBp8jzMpJaTgDcOvEK7S3oBIBp@vger.kernel.org
X-Gm-Message-State: AOJu0YyRDcJVvTupynlEFDpmOA+Xfxcp0kA3ch12ili9EGtQ/NJEvXhK
	R860GCO0ewSkaEJU3q/FTA5/MgwvtMVMsQUAVyM/F8cilBJFkcAPvXijpi3PYsKz/m6TR3f15Cw
	rBjEkK8nz8bulGxCX2eYavPyQLq74emEjVMJPZGap8Iy5TnmGAyI6kxOiZRkfa8cH
X-Gm-Gg: AfdE7ckXBC5rSE1nwaJozaIRuzEZ2E5IPwCca/ZgOgBd/lyWadkmA/q9bUJetBHDu4l
	cwX3VVhHfiVwwNk/a3Skie5Y7a8prSVS3YQqXNGssHlEWk7cZfPnwz6mYK39iy0sH5hY7sQVTlm
	QLMnR/t1mUsMFcSimPtJnZTH/ZsEb433pGZ/vfzZTa3YLDq/kJqUuLbmtwG5LGoNeh0yg5mUjp/
	GL4rxGdPyEAbhoZCQoJ8txZcjkgUf9WTGUzST7zte9wR8/IE21Tl/W3ZnC8c9he2GYEtKXyaHUP
	zMp5xaNXua2xiRvFFtF7yakYABIv6dCi8xyt6vzFh2qrZkjFfDxqB/BMsSHpaElmYHw8mUYVXlT
	Up8dIO+/SXGIhmQ2N+4bgHEjRpqyvJir1XWpcx8qf6ztEn7wx5NjKOM/mOQ==
X-Received: by 2002:a05:6a21:4902:b0:3c0:9c19:65a7 with SMTP id adf61e73a8af0-3c110a258f0mr13160905637.63.1784005198672;
        Mon, 13 Jul 2026 21:59:58 -0700 (PDT)
X-Received: by 2002:a05:6a21:4902:b0:3c0:9c19:65a7 with SMTP id adf61e73a8af0-3c110a258f0mr13160873637.63.1784005198151;
        Mon, 13 Jul 2026 21:59:58 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3120c8e41fcsm41874021eec.15.2026.07.13.21.59.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 21:59:57 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 21:59:42 -0700
Subject: [PATCH v9 7/7] arm64: dts: qcom: mahua: Add QREF regulator
 supplies to TCSR
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-tcsr_qref_0714-v9-7-373670ab15f9@oss.qualcomm.com>
References: <20260713-tcsr_qref_0714-v9-0-373670ab15f9@oss.qualcomm.com>
In-Reply-To: <20260713-tcsr_qref_0714-v9-0-373670ab15f9@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hardening@vger.kernel.org, Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784005189; l=2520;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=Xv3av/rD+ldK9r9tj755nWcpZGWPEFEhsHdy0UkmLVg=;
 b=N/46vvMiqukbaDa4T1kM6laO+YMYxGuFC0jiMaamitPYKZoKPqpNGc3elJ1gCm23KOpz/+5TG
 M4x4Evx8G9iBQBQp9SkmxZBOpQJFWB6TVmodGftRYjRDO7YUyzOZ7i+
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDA0NyBTYWx0ZWRfX7Ik73aFAt/Q1
 eYtyLp0feVkm/RC2ovZMBW65BlCo2XeBLa6LB/B9gvOVdXJQ1AKytXByxIsJuEuXYZ0crGK83Xp
 IgYzi331w5PMCzyye9O9X7g8nJcjFZFZ4qj5n+C70fVP1H8vA6NIBDtzhjaGL81/AkQTiWw7FXR
 nowE4iv9QJS4bOpWrqTVc4p3w2wjubac/EUeoQ08/Zg/GvYTcUMktUsEqNAAT0JVHRFbkokxwII
 IlUuDYDnHl/OpOgE6FRy5GmfTT8tqUPwYa1UmJ402InQ4vZtgJzmTS8dxcNsyf/YmDvpHBQxbcG
 KAwaGahN6CvNV+Cdu0H2iHUd6O9RmnMwlY8TrXTyb2I1N/AuGaWQ7MFsl6qkkjQsfcHG4A4LQNt
 UWDOnX6UXFdNGOOkpOWQkL7aaP6dpQV6QFt/T7C6zBRpBbed733KjjMmJCO1SXk34+vtjIByN6r
 R808n/3JsczND05GRjw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDA0NyBTYWx0ZWRfX31GnNIBkTyTX
 FdvRli3opSK8RU5zH8HAUZQs056IyELBvOmgbanzvqhWHsaF/Pqq/iHFzq6WWlPr8thYgH7C4qM
 //saBDADu9MlA7ZbK+CwlxJ6+gISkMo=
X-Proofpoint-GUID: MBvv9GQMIurV7h8cv86rSSx5JmS_r7oo
X-Proofpoint-ORIG-GUID: MBvv9GQMIurV7h8cv86rSSx5JmS_r7oo
X-Authority-Analysis: v=2.4 cv=NYjWEWD4 c=1 sm=1 tr=0 ts=6a55c24f cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=nz7bh4JJC2V4q-rTAcgA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_01,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 spamscore=0 suspectscore=0 clxscore=1015
 malwarescore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607140047

Mahua has a different QREF topology from Glymur. Override the TCSR
compatible to qcom,mahua-tcsr in mahua.dtsi, and wire up the required
LDO supplies on the CRD board.

Unlike the other PCIe controllers, PCIe5 PHY on Mahua gets its refclk
from the CXO0 pad directly and requires no QREF clkref_en voting. Hence,
point its ref clock at RPMH_CXO_CLK.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/mahua-crd.dts | 16 ++++++++++++++++
 arch/arm64/boot/dts/qcom/mahua.dtsi    | 13 +++++++++++++
 2 files changed, 29 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/mahua-crd.dts b/arch/arm64/boot/dts/qcom/mahua-crd.dts
index 9c8244e892dd..fa5229064b10 100644
--- a/arch/arm64/boot/dts/qcom/mahua-crd.dts
+++ b/arch/arm64/boot/dts/qcom/mahua-crd.dts
@@ -19,3 +19,19 @@ / {
 	model = "Qualcomm Technologies, Inc. Mahua CRD";
 	compatible = "qcom,mahua-crd", "qcom,mahua";
 };
+
+&tcsr {
+	vdda-qrefrpt0-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrpt1-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrpt2-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrpt3-0p9-supply = <&vreg_l1f_e1_0p82>;
+	vdda-qrefrpt4-0p9-supply = <&vreg_l2h_e0_0p72>;
+	vdda-qrefrpt5-0p9-supply = <&vreg_l2h_e0_0p72>;
+	vdda-qrefrx0-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrx1-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrx2-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrx3-0p9-supply = <&vreg_l2h_e0_0p72>;
+	vdda-qreftx1-0p9-supply = <&vreg_l1f_e1_0p82>;
+	vdda-refgen3-0p9-supply = <&vreg_l1f_e1_0p82>;
+	vdda-refgen3-1p2-supply = <&vreg_l4f_e1_1p08>;
+};
diff --git a/arch/arm64/boot/dts/qcom/mahua.dtsi b/arch/arm64/boot/dts/qcom/mahua.dtsi
index 22822b6b2e8b..e6c059708912 100644
--- a/arch/arm64/boot/dts/qcom/mahua.dtsi
+++ b/arch/arm64/boot/dts/qcom/mahua.dtsi
@@ -115,6 +115,15 @@ &oobm_ss_noc {
 	compatible = "qcom,mahua-oobm-ss-noc", "qcom,glymur-oobm-ss-noc";
 };
 
+&pcie5_phy {
+	clocks = <&gcc GCC_PCIE_PHY_5_AUX_CLK>,
+		 <&gcc GCC_PCIE_5_CFG_AHB_CLK>,
+		 <&rpmhcc RPMH_CXO_CLK>,
+		 <&gcc GCC_PCIE_5_PHY_RCHNG_CLK>,
+		 <&gcc GCC_PCIE_5_PIPE_CLK>,
+		 <&gcc GCC_PCIE_5_PIPE_DIV2_CLK>;
+};
+
 &pcie_east_anoc {
 	compatible = "qcom,mahua-pcie-east-anoc", "qcom,glymur-pcie-east-anoc";
 };
@@ -286,6 +295,10 @@ gpuss-4-critical {
 	};
 };
 
+&tcsr {
+	compatible = "qcom,mahua-tcsr", "syscon";
+};
+
 &tlmm {
 	compatible = "qcom,mahua-tlmm";
 };

-- 
2.34.1

