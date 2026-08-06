Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DBAE43848F
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 10:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786012486; cv=none; b=sXusjrMe8CxxbYXwTdDFFnf6iOSfb4bKwbGsHPV9xR/TIAEFOG32wgJbRM6sNlJKbhRQd8QZ/Ux7ll6DQxEm5S/rBGQzGGWXN93afLrnTjya24wwaxH7/oTlPwkID89Zj76DmLhP6w10ANJGP10yRKD6R4Hpzn6MPAWyV9xqO50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786012486; c=relaxed/simple;
	bh=ajWKSb18ow1K9X/7qdr7eRnazLDVnHG9HgkLtV6v9dI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gEZHgC7tXbZ2XcNXZkWtkHHp4g15kl+q63Vcc8KA+g3hhC9v5C+Ln8UhTJyo8HV+0atslifS3SKMTS7wAWqZqPJoxxZFKHLGQkU6Hs4AcRhBOOcfFDEHstQ/QhPtsu/4n03QrjdqhkXK/Zq54qm4QFdDzEyStvY616+YK//15H8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kIUVcA4U; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c1oCVS38; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kIUVcA4U";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c1oCVS38"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6769nfB12724665
	for <devicetree@vger.kernel.org>; Thu, 6 Aug 2026 10:34:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0+DaEi9tZFH7+WbTZzJJhm6BRZ00c9mpRzL/KVHxRUA=; b=kIUVcA4U5LN0GORQ
	4c2QAL9bZIUlCdPy0vuK5NqcfVguc74Fu7TSad1DKqkpZnHTJPcatgLn4GRNew8m
	fE9Us1/QLcWbWxI+qV30l+/LoTeVvHW/JS478vl5To43+xfdyZadRRVHCYwP7ikL
	bYVVgfmy9YaOipko4t4vOR1g6FQetTC9vz4QfElTo/1B30D1DWWAolUNCWIC5x56
	2rthSH6OG+WmH9V8zQFomyMDkZqIWZDTxTtK+0ddOmFnS1zr8sDT2DWOPeZVyh4q
	lNwAyMAps3U6Gjif9FDg7zpJMEcR9EKKigmZqnAVAMiRkCYwvB3/1zGnzZnYZgLH
	UaT2gg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fv9dmkqv8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 06 Aug 2026 10:34:44 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cbb467e56aaso2262100a12.1
        for <devicetree@vger.kernel.org>; Thu, 06 Aug 2026 03:34:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786012484; x=1786617284; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0+DaEi9tZFH7+WbTZzJJhm6BRZ00c9mpRzL/KVHxRUA=;
        b=c1oCVS389fpADEMmpb5tFZJtZqStKH2I73z5YtRNl+r7uSJAayiAHwmMegzLbkVlKd
         DAYMOYFlGcSQ9G08RCOyL/4pxXlS88S4ZPDFeeBWPjPISUr2B7UcMHprTwRILJD289K9
         waqnwPew62Xmud0ZpI5xSCuWdwtlVgeJxO3ArZLlmfW4giKSqYzesCuOth0to5E2oR02
         taqLIqfZ5oTaUY1TA0T2obJ3miDNeig/c5f3oCGD7j/9xb0fIEV0UeI2etjds8a+t1eF
         8Oonm1MWHREBlYuA/PSGOJV0UfssPyAznEYgDfsktE++iRnjxbh3cww+dyPe0gnrv/3J
         vd8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786012484; x=1786617284;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0+DaEi9tZFH7+WbTZzJJhm6BRZ00c9mpRzL/KVHxRUA=;
        b=Jtg3TJsHtUP3KmecqYnd8KTlXCRtmuselAGu7GtH9QjTyDZomdn4ClLlY3Ed40EkNS
         cQ75RG/f+APGYMq3b/F6yHJBKbpwFsD16na7Ng5kdhNu/BR2BsrXCdEjEqMvctySZX5Z
         FM3XQKvzEsX4D3a5QaFePyUTGwSMLqwApMeXV2KszvzcKa/0wZcRncKLpjKW4wfRitQ1
         ZwMqqbS7YEIb5W2AzwIZBIxlrOzaRQZnE4sf2Od8nQHR3xKHu2DVDKLlBaejtEFuQmr/
         GhOy/XGObqKtgbWJPRuR0UGlHV4TXHfx6/dsgmQTOkKXrOVeU8kzPDYH+2xsNQL9uzr7
         HyIA==
X-Forwarded-Encrypted: i=1; AHgh+Rr8gsqU5qbuYB4u+rA+L5HuDkng/yDDOTuLcj/US2NPKu0Wt8hp6RfYd3kyY1A6k7whtF8P8JYUNxjr@vger.kernel.org
X-Gm-Message-State: AOJu0YyrFsD/thNfMqoK3/svCDg6TYZTwRifa/KHRBOAftg1Z7iRD0nT
	bm3dHyHpi6GUaUVOcLdt4jULUxzncYScnXY+JbzMt/cJfvNdKFMNpfaBYKCKturq3R3zgYdmGH6
	tlIlCKmofFW7+wiW1Ce9hcV6/8HKxsnIiOed1hSRVMmb9ee1e26dHWF4PFe1o0SxL
X-Gm-Gg: AR+sD12ukV7yg8+Vu5C1Sf9DpZaevisJl8Tr5EvCa85wsCYX4b1xSj5mz2tvoPoJYX5
	12L1bfM2M/P8dxsqgW36nCANiUt8YwuwYjSGK7ATut0R9i+MIUf8y3whKuQj9WplUde/vLNNDwM
	jmm3D/I3zZyaCEvrZW6nxBNOK+QL7ugxz97mCHEog5QT93G5CkiVRSmyMMSyigfu8LXlo18vaHv
	Wus8hvbdIMSFFUNPNAu3PssjJIQUrcd1C7ahhMmfsgfihfoZutjtJJ+IKZ+YtSdEtfXrrEFnGCO
	s8tYAMdcB/takJn2jPR7jzwockIXPNyBd2tNADVT3uQRdDkXfvCieofT8ocDEEQqG0uQXTMduT2
	XA721JGt2xgIb7bfXqdLFs+FM
X-Received: by 2002:a05:6a00:a247:b0:845:4126:222b with SMTP id d2e1a72fcca58-84f2e00ea1amr17821001b3a.28.1786012483556;
        Thu, 06 Aug 2026 03:34:43 -0700 (PDT)
X-Received: by 2002:a05:6a00:a247:b0:845:4126:222b with SMTP id d2e1a72fcca58-84f2e00ea1amr17820877b3a.28.1786012483038;
        Thu, 06 Aug 2026 03:34:43 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f45389e5bsm1141098b3a.1.2026.08.06.03.34.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 03:34:42 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Thu, 06 Aug 2026 16:04:08 +0530
Subject: [PATCH v10 03/10] arm64: dts: qcom: milos: Add power-domains for
 camcc and videocc
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260806-eliza-mm-cc-v9-v10-3-6ba52dd14343@oss.qualcomm.com>
References: <20260806-eliza-mm-cc-v9-v10-0-6ba52dd14343@oss.qualcomm.com>
In-Reply-To: <20260806-eliza-mm-cc-v9-v10-0-6ba52dd14343@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Authority-Analysis: v=2.4 cv=TJR1jVla c=1 sm=1 tr=0 ts=6a746344 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=zrNp7rCLQDew2w7GYOsA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: rPTA7sTwozCt5hmdJUEzufYXE6qyZ_Dc
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDA4MiBTYWx0ZWRfX+WYA4nXB0MD2
 gLfJty8E6VmZ/13Fi1K2c1FDR3WLcQw9/5iwyAp6qa06A1fuMELusEl/R9MHZPY1C1HuPjWVk6Z
 PyzB2/G1QVdHo/7048O7i2zuXGFPslI=
X-Proofpoint-ORIG-GUID: rPTA7sTwozCt5hmdJUEzufYXE6qyZ_Dc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDA4MiBTYWx0ZWRfX3epVVuynOZ/M
 BCdAfaiZFtRX8j1at5w2EZO6NzL9f07FotS92VkP0eMmfBmMKTup6nj21OVdF9SUth8+hSuVgWV
 8jMAjiGH5LsW0Ae/MJX8sRLVaX8VQrJOAojULjsBWLclfrlOG+BkKmljFbf1qUeGwxhpP2P+8yP
 sAwyAT0PLvTapCo3oGPNxAq0l1XVi8Ejmllm0fmY1GGAwhXDz3aDzs1T33pNDKI8RqMcLl32Z8E
 UOO+vH7q6fpN/8Zmako4fCJ1qBT+V+OAPJpmWKYvp/KTdfaf50nehM/+VfRfvHGqsdU0l2m4Ch3
 QZeBOqvu69VnVVviNw4EYO63trfPWmYd/+TIvhk6cpqKXUXvCZqVm8kp1yUYx/mgYaUZdg67qz1
 ce2vTKGZ9uUFppeDN6/1bR6SCdHj/18T9Y+Gs2CfYFfRFWTlnh27eIlfVjQYn09fKOY12za4Kvv
 FAlW7gssuNwWLKc6LMw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_06,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 phishscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608060082

The Milos camera and video clock controllers operate on the CX and MX
power rails, and require these power domains along with their
associated performance state votes to be specified for accessing the
clock controller and its GDSC. Add the 'power-domains' and
'required-opps' properties to the camcc and videocc nodes.

Fixes: d9d59d105f98 ("arm64: dts: qcom: Add initial Milos dtsi")
Reviewed-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/milos.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/milos.dtsi b/arch/arm64/boot/dts/qcom/milos.dtsi
index aad8bf6789162f5dcabbb7d4a8efe180f86d4b46..f3af1d759e09837de457522af47c74431e8d3fdc 100644
--- a/arch/arm64/boot/dts/qcom/milos.dtsi
+++ b/arch/arm64/boot/dts/qcom/milos.dtsi
@@ -1949,6 +1949,11 @@ videocc: clock-controller@aaf0000 {
 				 <&sleep_clk>,
 				 <&gcc GCC_VIDEO_AHB_CLK>;
 
+			power-domains = <&rpmhpd RPMHPD_CX>,
+				<&rpmhpd RPMHPD_MX>;
+			required-opps = <&rpmhpd_opp_low_svs>,
+				<&rpmhpd_opp_low_svs>;
+
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;
@@ -2031,6 +2036,11 @@ camcc: clock-controller@adb0000 {
 			interconnects = <&mmss_noc MASTER_CAMNOC_HF QCOM_ICC_TAG_ALWAYS
 					 &mmss_noc SLAVE_MNOC_HF_MEM_NOC QCOM_ICC_TAG_ALWAYS>;
 
+			power-domains = <&rpmhpd RPMHPD_CX>,
+				<&rpmhpd RPMHPD_MX>;
+			required-opps = <&rpmhpd_opp_low_svs>,
+				<&rpmhpd_opp_low_svs>;
+
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;

-- 
2.34.1

