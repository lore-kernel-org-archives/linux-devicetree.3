Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B51F2DF142
	for <devicetree@vger.kernel.org>; Sat, 19 Sep 2026 04:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789793204; cv=none; b=VPmJY1rKQqULTY2U6/OhniNlUDToJQ6/sO1xxarRJW+5cgx4+CzCIjJDt67OnvsF5PfDUDi+QsviNq24yd/tnpzBrVT7nRPbqxY11WLE5ABtEHvxZGHh6RB2Pie0bDaLacH5lbT204c5skoa5eRNwhDLAEG2wjFBQHwsM9P/TUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789793204; c=relaxed/simple;
	bh=tlLqF6w9QXcYSTzDkuNbMIuf0cs24Ev6jgWtS3L26Ak=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qd4E8WrnWkdSbt2gIgEqXqmgo6Y8xz/cDAKK7CfQPF5P3suzvE3RfjKwJwri7Z562f2guSIqnB/bON4inufNjK2ZZMYYdkcIUyMzPcAjrEl/gUV4M0EKvWCbofzg7YnuaJROEC6+QvFJBmf2ByGPMfUyqNXi9+GKNGT2uHF6Fa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MKJKcR86; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BZcbuSWp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MKJKcR86";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BZcbuSWp"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68J3KYsM2454393
	for <devicetree@vger.kernel.org>; Sat, 19 Sep 2026 04:46:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Y/R/ApR5PBZXpZYbNopGHXN9RmfSHSNhVscg9gdP5Ww=; b=MKJKcR86dDrdd7EM
	pZ2ZF8ZW97AeMl6tJqDw1x+jgfwipPRw/m0G8/1ufRhoAbMDvJdxuwoo7R6ugfH5
	AKL/mKOjK9JAaW+qIyTVmoj7HaKO6ykFJVXW2QD9jbCTw1FiiUYBEghHniaNamb6
	2YyFZg1YxhmaUYEOAautEqA1DIp0p/RInBlDn0YCzCck/pmNItJJCb2kJ6Mfv/nc
	3e/nYDhgEShHPXcXmLcQ7oZDzw+dEHF9BsCd4JeSj7+6R+vTIP+GuVgPSnflcaCH
	gnIVxZPLyt7rpms0uE2ix7smG8bp8qwqAe4RQsHBDmqIZu3K2CXoEnPaqXvctJ8g
	7p4FMQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gshqfr7dw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 19 Sep 2026 04:46:42 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-395543dc382so1746195a91.0
        for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 21:46:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789793201; x=1790398001; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y/R/ApR5PBZXpZYbNopGHXN9RmfSHSNhVscg9gdP5Ww=;
        b=BZcbuSWphil2RK9OsbZYXFyI/kMasuVaGMetEGqK0kM1baWaOKydm/+2eoi1eGSAW1
         8/rj6vver6mfi5sLQO+deuWDkfF2qyoNL8sYT3G9CHWJPjP1B2vuOaDvwWOeICxOU+oN
         ODysZJB0e0h7o7GcImNnpUDUY1Fi0cI0VvfEtHbhggh+LhT4Jw+qFUGrbTzE4bY6iEC/
         umLDT6Bw8rIGZzGwIaFUUHv1XDnyK8qhj18ck2aCUdlFaZzW/WVB/lHd0bvAbyg8B73e
         CFej2SmJbUY5bCgAZotNu9ldG6aJHUO1T3Wz7jKzSdec8bWD1/zKvYIcdfCOCKsh0WJn
         wHig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789793201; x=1790398001;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y/R/ApR5PBZXpZYbNopGHXN9RmfSHSNhVscg9gdP5Ww=;
        b=QVDRrCi9TcJQlx4NMu4W1ZaCJVYhj/UsU5B4g4ay1Qi039lwrC+YM0sDMg0DIG7+hd
         2oTpAAk80e0MVD9A9q8lv9kNtsrAjreD+CPDm+EoXecn6dTgWuS/7BnxyFHaeywz049L
         wL6+vbApwBFlNelPCxiFPDBnvBl6wCmjZojtE4LzzmMyzEDRvpcyOzZKaM7SOS0luaZe
         9lodl2ckei60JEdEukYTmtQj0CQuc3QYcH01ma0deBz+uqqs1piszm+APp8QBjVw30Hc
         1kTdLfS24J/5s93idUwCsUR7cOdQ1YIXQoxZlOc3JukwNUlIXbuFbRXXW9VARfei7SQt
         iI1A==
X-Forwarded-Encrypted: i=1; AKwUvBy1w/bI0McdYjvYKOEgz9fPJmSE9i8xu/1b1AqStM9HNfQAryMlW3EKAGmCKQmc6uWOk4sXwOnsozvT@vger.kernel.org
X-Gm-Message-State: AFuF++m4PRy+97v0slrpNQJNcOtQfefGjn3blwkhpJo2bFGHsLCdCbwk
	2oEkwIHMYhpiWmOeNPih4JPqZpi9pipAJJ9Sxk+yFuH2veAz5vtWWoy60nWGSAZmij8gXLJMenO
	4RDsj7YuSVZpnXWv+EqkwMB/w/C861E2UQa3JUd7ZwnqSLEv9g3MdwSIE/1nr7VxX
X-Gm-Gg: AYBFou3rncsDZpH0/roRdk4/sOSABRhbPIzDVw36JrcODxnnQa+LHbv38FORJDG8lsq
	pLuOL/dyMmkGb1EHOEvMEw9uY/T8JF00lwNCfKUg9CU1NZKDGLTMj7hSGASCjuhRmtLBeP5SOl0
	OAd+5rCKWcw/ZmSBTflSY7XgytvWWdMj/h6aRFto4l+o+bxxxs26nm3MKNWq3kRRKbAjyOU6meV
	hQTfPIaJQQOHW4QQJWCfHsF2JJ9WTP8oozPJuOEChUOV25p2lZtNbv12BXuE/sXaYekAnrwDEXS
	0Ps4Kf4QLGXx7Hi3J4NiwYH8PvuTmc6V5X4gPzB5CHYz0wGweVJIR19miBb0dZp/3miSEp3pzeO
	XQcasPD9LFI2IeOQvZy8oaWnRUWpk8/UX
X-Received: by 2002:a17:90b:4c4c:b0:39e:6c68:1555 with SMTP id 98e67ed59e1d1-39e6c6832camr3756830a91.29.1789793201032;
        Fri, 18 Sep 2026 21:46:41 -0700 (PDT)
X-Received: by 2002:a17:90b:4c4c:b0:39e:6c68:1555 with SMTP id 98e67ed59e1d1-39e6c6832camr3756798a91.29.1789793200461;
        Fri, 18 Sep 2026 21:46:40 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144d55bfec0sm3839771c88.7.2026.09.18.21.46.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 21:46:40 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Sat, 19 Sep 2026 10:14:56 +0530
Subject: [PATCH 2/4] arm64: dts: qcom: nord: Add iris video node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260919-nord-iris-v1-2-94428761ec06@oss.qualcomm.com>
References: <20260919-nord-iris-v1-0-94428761ec06@oss.qualcomm.com>
In-Reply-To: <20260919-nord-iris-v1-0-94428761ec06@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789793184; l=4050;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=tlLqF6w9QXcYSTzDkuNbMIuf0cs24Ev6jgWtS3L26Ak=;
 b=+cY/lhenbatPwgXJXmRJgHjDySrmkIAWt5YVpn9ggxtuHYzcwac9/UJbtgghe3ESWlzyUTKHE
 nYUjWkd8Z+hDeKQRLM9917jp/8/bc1WLtEm6GB7hPbNCrTe+SRW+lHa
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE5MDA2NSBTYWx0ZWRfX/M7lbM1wIC2F
 YMaTPUwqehiMz/mGr5dhp25H+XFZd/MJB8ZFM1yCbsKUeCfSdDFVxyStg/Z0BRZhX6c5NKq0ClD
 G5vaECNBmzCgegLjNl5kUUp2lrAa1Mv7aFYa1DucHV0j2yGa1nxGmDgOJ2pRUEIJLWSGO2cuudd
 rWtzRw8+HjRh5edy/aRmqsjTtImth14ImMgIwRHAuvm/vn+9yVnjaYUttCBegPkr/LcC2YwOhuv
 7c70ztujieYuMYnArKHZPKdsHTUja9D+y+3liW0wsqmKVqM5FhT9tJLjt9oWIi8Fa0po7h2J6Yw
 NACTbLDaV2wxAgAeOCzxPgtg1Nr9j4F6vNkCSuhSvdrBkmPTcOPJJRmnt0GRl4nPzx78BkC3pUW
 c1vfOJC2qS8Lq48c8wb+wKJ2Ny+OdtfKtSZKXXWRQ/9Y5vwLUaLHTUkm5wRJpi6D/hiGSJ9YhtG
 5jaspr8G7wkOJxCktiA==
X-Proofpoint-GUID: PDl8jkX0S0Ln-_m1lOronmHPowGQB_jT
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE5MDA2NSBTYWx0ZWRfX1cHdf4E9wKtB
 hmxgBj6blTlp6dO+2O40d0utup87Xari2NLN0nh8XuZe3UQW98dbjgxuW5GdV3jOu1lgIohaPJF
 TMuf1C3K7OZ+RTYNABUJJQEPjPL2JXY=
X-Proofpoint-ORIG-GUID: PDl8jkX0S0Ln-_m1lOronmHPowGQB_jT
X-Authority-Analysis: v=2.4 cv=XegcX455 c=1 sm=1 tr=0 ts=6aae13b2 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=TA5iZoVXvLOV3mFXX8QA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-19_01,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 adultscore=0 spamscore=0
 phishscore=0 priorityscore=1501 suspectscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609190065

Add iris video codec to nord SoC, which comes with significantly different
powering up sequence than previous platforms, thus different clocks and
resets.

Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord-embedded.dtsi | 114 ++++++++++++++++++++++++++++
 1 file changed, 114 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord-embedded.dtsi b/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
index 74f4e6be8652..03f827f3e5fc 100644
--- a/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
+++ b/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
@@ -1428,6 +1428,120 @@ camcc: clock-controller@9ce0000 {
 		#power-domain-cells = <1>;
 	};
 
+	iris: video-codec@aa00000 {
+		compatible = "qcom,nord-iris", "qcom,glymur-iris";
+		reg = <0x0 0x0aa00000 0x0 0xf0000>;
+
+		clocks = <&nwgcc NW_GCC_VIDEO_AXI0_CLK>,
+			 <&videocc VIDEO_CC_MVS0C_CLK>,
+			 <&videocc VIDEO_CC_MVS0_CLK>,
+			 <&nwgcc NW_GCC_VIDEO_AXI0C_CLK>,
+			 <&videocc VIDEO_CC_MVS0C_FREERUN_CLK>,
+			 <&videocc VIDEO_CC_MVS0_FREERUN_CLK>,
+			 <&nwgcc NW_GCC_VIDEO_AXI1_CLK>,
+			 <&videocc VIDEO_CC_MVS1_CLK>,
+			 <&videocc VIDEO_CC_MVS1_FREERUN_CLK>;
+		clock-names = "core_iface",
+			      "core",
+			      "vcodec0_core",
+			      "vcodec0_iface",
+			      "core_freerun",
+			      "vcodec0_core_freerun",
+			      "vcodec1_iface",
+			      "vcodec1_core",
+			      "vcodec1_core_freerun";
+
+		dma-coherent;
+
+		interconnects = <&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+				 &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
+				<&mmss_noc MASTER_VIDEO_MVP0 QCOM_ICC_TAG_ALWAYS
+				 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+		interconnect-names = "cpu-cfg",
+				     "video-mem";
+
+		interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
+
+		memory-region = <&video_mem>;
+
+		operating-points-v2 = <&iris_opp_table>;
+
+		power-domains = <&videocc VIDEO_CC_MVS0C_GDSC>,
+				<&videocc VIDEO_CC_MVS0_GDSC>,
+				<&rpmhpd RPMHPD_MXC>,
+				<&rpmhpd RPMHPD_MMCX>,
+				<&videocc VIDEO_CC_MVS1_GDSC>;
+		power-domain-names = "venus",
+				     "vcodec0",
+				     "mxc",
+				     "mmcx",
+				     "vcodec1";
+
+		resets = <&nwgcc NW_GCC_VIDEO_AXI0_CLK_ARES>,
+			 <&nwgcc NW_GCC_VIDEO_AXI0C_CLK_ARES>,
+			 <&videocc VIDEO_CC_MVS0C_FREERUN_CLK_ARES>,
+			 <&videocc VIDEO_CC_MVS0_FREERUN_CLK_ARES>,
+			 <&nwgcc NW_GCC_VIDEO_AXI1_CLK_ARES>,
+			 <&videocc VIDEO_CC_MVS1_FREERUN_CLK_ARES>;
+		reset-names = "core_bus",
+			      "vcodec0_bus",
+			      "core",
+			      "vcodec0_core",
+			      "vcodec1_bus",
+			      "vcodec1_core";
+
+		#address-cells = <1>;
+		#size-cells = <1>;
+		dma-ranges = <0x0 0x0 0x0 0xffe00000>;
+
+		status = "disabled";
+
+		non-pixel {
+			iommus = <&apps_smmu_1 0x0940 0x20>,
+				 <&apps_smmu_1 0x0944 0x0>,
+				 <&apps_smmu_1 0x0960 0x20>;
+			iommu-ranges = <0x25800000 0xda600000>;
+		};
+
+		pixel {
+			iommus = <&apps_smmu_1 0x0943 0x0>;
+		};
+
+		iris_opp_table: opp-table {
+			compatible = "operating-points-v2";
+
+			opp-240000000 {
+				opp-hz = /bits/ 64 <240000000 240000000 360000000>;
+				required-opps = <&rpmhpd_opp_svs>,
+						<&rpmhpd_opp_svs>;
+			};
+
+			opp-435000000 {
+				opp-hz = /bits/ 64 <435000000 435000000 652500000>;
+				required-opps = <&rpmhpd_opp_svs_l1>,
+						<&rpmhpd_opp_svs_l1>;
+			};
+
+			opp-480000000 {
+				opp-hz = /bits/ 64 <480000000 480000000 720000000>;
+				required-opps = <&rpmhpd_opp_svs_l1>,
+						<&rpmhpd_opp_nom>;
+			};
+
+			opp-533333333 {
+				opp-hz = /bits/ 64 <533333333 533333333 800000000>;
+				required-opps = <&rpmhpd_opp_svs_l1>,
+						<&rpmhpd_opp_turbo>;
+			};
+
+			opp-560000000 {
+				opp-hz = /bits/ 64 <560000000 560000000 840000000>;
+				required-opps = <&rpmhpd_opp_nom>,
+						<&rpmhpd_opp_turbo_l1>;
+			};
+		};
+	};
+
 	videocc: clock-controller@aaf0000 {
 		compatible = "qcom,nord-videocc";
 		reg = <0x0 0x0aaf0000 0x0 0x10000>;

-- 
2.34.1

