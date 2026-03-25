Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3871234888F
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 03:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774410856; cv=none; b=TUdN53o4bJoeMG9Ss2e7NrWqmCp7iXP77OjT0QxHD0jrqYI0h2GgFGPZp/tQvuQwSYsAM5YSKjjvZnzjH6HiJP1jEdOj5Nrl/0gilLfFVnNAZqW7POw+bf/VnehlvRdWoeY2anAfzBF9J2vZI7Z6NIcWQ3pIh2AKVBdNICMq7tY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774410856; c=relaxed/simple;
	bh=icz9D1nxb133mkMj75IAh7jgTfSViv/krznwx07hW58=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=U5+5j+mEMuc8N58CMWAfJlhMLbqJQyclAQ8KKRx4jREVs88Qy7AfDBH2CRzQyTIqb54msXqZmv8qXzuo9xTBcktRJXwPk/pXbvXjY6ZYKBOZimX2sbx71tnveVi63BnJowa6uw0J9YldjvtjV7Lnaf9wZfnlcZNTFaL2bqgrkck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JKXzV0Gd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OxBm5dD8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JKXzV0Gd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OxBm5dD8"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62OJDjrR3984433
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 03:54:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=22yY2F/7WYB
	VxuHqS7ff5XwOR2N3SI2/M1bD0Dzv1m4=; b=JKXzV0GdAwtP1HFLnfadqbL44Uo
	jpkQrRAvpL17QfAkydK1MvRHMEoal0Bvg/OtXvWJI2sMN20v+LbYerma5CzqyYRO
	9hambebMcWKhct9gYpzm2NJ9VIM9CGOj+iKBv6HZ0uIY4xeIOFT/so6QASQz01Nf
	+V2bXE5UFPuo48ehswqjm4CYi1zaC7TrtffdfEeuD8GtbcnQQVvsOnR44nCjnemI
	Bta4JPG170kc8hC5MENoK+pcXs0aeDRi/krM2U0GBooJqYoEnqdU/fRAGf2EpOir
	7bFJPpjnnRJ5WTM76Hobxjj8CkG15r7N0VfWL24XXVmhpAkz+hTBizs5nwQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3p8344s8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 03:54:14 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-82c2054b584so15558941b3a.2
        for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 20:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774410854; x=1775015654; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=22yY2F/7WYBVxuHqS7ff5XwOR2N3SI2/M1bD0Dzv1m4=;
        b=OxBm5dD8mKjV9Q2W9XCaix9jnlTmg4Of/sEtviDhb22AGBCWrPRqnkTSuZtkFVpOLn
         WUXh5bH3SNTfPcmdbGYBZwaNvfnfUhLm1LrrbZSzg/Rqcbe/1IWPLPng8oJ2ZFc74lQ1
         62uxQcZkIPRk3cTE8y1NgKcHaZr1mZqDT55Sm8Dv/ew4qrDust31OuI+DOfnOOt/yuc0
         1B/4XBc4N+glZRomUXMkZM9cINky4GdP22WG1kKKaMaftpNW+aOOwTr5Z7s4vjBHNhhX
         NKfn1KzwA9A1TVKB+2SZKV2yHAqnb1w5ABN4aflXfaIHZk0OVFn9fjWdF89weKot+Hnz
         iegw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774410854; x=1775015654;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=22yY2F/7WYBVxuHqS7ff5XwOR2N3SI2/M1bD0Dzv1m4=;
        b=DCo2ftnO2RkHRkCqOUUCw6kl2m6wx/WYpA0PRvMGW67NcieoCjdSM1XIq26S/AcLjm
         3k7C5qJjsYewWNplgYGvDe5AE33v0Ykb5FElc3itO8qHQzOIyKCQX98Q6lCo1+tLBrta
         TcpRhwpkqfqtFtRVtTaxJ1Zpw2TzJW0aNRIFWuef8CnEIUj33yMVMYqr+VGygxtU+rm5
         5ng+avTOh0vc3MFOUR6wCk8qXeT1ZEifM6JCBfW3ENjUJJEPrHvrpwcmd8TFOJJC73BO
         dEjONuuMiRdFPvXzqCfQiE/VpjeZd9YjKseROBg2tlLIO6eQaVspEi6QM0hlzftIoJ5u
         JXtg==
X-Forwarded-Encrypted: i=1; AJvYcCXBObrnuFTHF/xGcefzQSDuOniAz5cfXhYgdtte5+xOh81nfwanj6Jznf6G/CywImsflAw+9y+6F6l9@vger.kernel.org
X-Gm-Message-State: AOJu0YyFi8fjv7oAvxiADETkwksttSe2EVifdVpCqfFmzJr799dpxmgE
	YQX+A9y5qMMLUqiFmoqPVkLqCjUVzXIcrM4gcUkNtJtW2GAqkrpqDTRSLBZamu+B2tZdQ9Np1YN
	1AMgY2x89vznjM73dxBSShyetNOjym6fjVzX18A8IanxcUiMbFkMKJPsdVDVGkPGK
X-Gm-Gg: ATEYQzweD5YnrKIogb7oqUZYpwUKcaRYy4VAI1yzD6WODrnWZM+5814PIr4fqPoLucF
	O9HwCFrOvBMQmLwSHpGY65aL5vYbWZ26TC3EQ/4UNHxYV25r6Ua3OrEGeEtZH3nIDBG37bTzvaC
	6rZESEPs4v+sU4duWuIHDIeSb/pnq9ZIzJy5djtkNz3+qeB2/057hA2UlNYC5tu617pIkEyVvCJ
	ZPmFXO1esoJXfQFdNqDU+J3XquQ8loNVPSa0NpA9hsYxCkcqeS9JlmI6GeQJCq8lf5c1Jta63n2
	KCwPtw4rabtFp73iXeRSBeSuGtMtPAOBcS9EALRpFijQsP5yzmfIVAdwiSmLMI22Vm6g9h00FhI
	5g5nA071S/bGjsRg4ALhlZkyaAXrcXUMkDWiGltt/FRFTicbhqY41jNuQ66UdB/Mtuk5Za/54/B
	KAczyKVU8O7EpbkoBpYX3sd8KCsVsJ1IBOAtds
X-Received: by 2002:a05:6a00:8c10:b0:82c:65df:299b with SMTP id d2e1a72fcca58-82c6e0e508fmr1766430b3a.37.1774410853869;
        Tue, 24 Mar 2026 20:54:13 -0700 (PDT)
X-Received: by 2002:a05:6a00:8c10:b0:82c:65df:299b with SMTP id d2e1a72fcca58-82c6e0e508fmr1766414b3a.37.1774410853377;
        Tue, 24 Mar 2026 20:54:13 -0700 (PDT)
Received: from hu-sibis-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82b0410870csm14220689b3a.52.2026.03.24.20.54.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 20:54:12 -0700 (PDT)
From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
To: robh@kernel.org, srini@kernel.org, amahesh@qti.qualcomm.com,
        krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH V6 5/5] arm64: dts: qcom: glymur-crd: add Audio sound card node
Date: Wed, 25 Mar 2026 09:23:38 +0530
Message-Id: <20260325035338.1393287-6-sibi.sankar@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260325035338.1393287-1-sibi.sankar@oss.qualcomm.com>
References: <20260325035338.1393287-1-sibi.sankar@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDAyMyBTYWx0ZWRfX5AO/yIO2Ah70
 jGxCzB6jwpjMiQmdS6Hu3wNu6RSCQBgwBFLqK3HslXIIpxRYv4M11PjI5kcJvB36y/P/+I7zu7L
 nqEjgTPF6RIarCLYufDebjNLe9uvF66/A4xCup/qFD3VBuzG9zudHTa+rkDsbyTW0iFci5oDMKL
 xp28rKEreZeKPGmZXsehN+pdqF3aQ2rc1tj0GCHpxWdHfbTpWNNcAjxvLL4QdL3wooNldUYPAlO
 R/Yn9YzWrymYun7Hq4HnXupEIcL1uN4k+lhAyWSpGFHegpkxN5swTu/hYRsrqXz5qySMuY1JtRo
 SeqRT8P469YUehJAzKypS8NYPXEuJdfwMUaYkS0JdTjMNvMVaiwTs8saCalhHoMVZJD2ZQLf5jr
 f2C4FbM3NGJwqI19TChEhMMEnLU4pYzSAxeMUETKmofCUKjLGfAGeruHfc2OlRKhPAykCzdLgEp
 A5aX5wXBf3J8bux/goA==
X-Proofpoint-ORIG-GUID: QmhgZ9dR0-ZqcYsA1cEYWDrBy7GLA2Vy
X-Authority-Analysis: v=2.4 cv=F6hat6hN c=1 sm=1 tr=0 ts=69c35c66 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=Q9KsY8QRZZO8mUXd1LsA:9 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: QmhgZ9dR0-ZqcYsA1cEYWDrBy7GLA2Vy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_01,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603250023

From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

Add the sound card of Glymur-crd board with the routing for speakers.

Add device nodes for the sound support with WSA884x smart speakers
and playback via speakers and recording via DMIC microphones.

Co-developed-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-crd.dtsi | 110 +++++++++++++++++++++++
 1 file changed, 110 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
index 690b90e3d6ce..88a5c63e8ac2 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
@@ -118,6 +118,54 @@ vreg_wwan: regulator-wwan {
 		pinctrl-0 = <&wwan_reg_en>;
 		pinctrl-names = "default";
 	};
+
+	sound {
+		compatible = "qcom,glymur-sndcard";
+		model = "glymur-crd";
+		audio-routing = "wooferleft in", "wsa wsa_spk1 out",
+				"tweeterleft in", "wsa wsa_spk2 out",
+				"wooferright in", "wsa2 wsa_spk2 out",
+				"tweeterright in", "wsa2 wsa_spk2 out",
+				"VA DMIC0", "vdd-micb",
+				"VA DMIC1", "vdd-micb",
+				"VA DMIC2", "vdd-micb",
+				"VA DMIC3", "vdd-micb";
+
+		wsa-dai-link {
+			link-name = "WSA Playback";
+
+			cpu {
+				sound-dai = <&q6apmbedai WSA_CODEC_DMA_RX_0>;
+			};
+
+			codec {
+				sound-dai = <&left_woofer>, <&left_tweeter>,
+					    <&swr0 0>, <&lpass_wsamacro 0>,
+					    <&right_woofer>, <&right_tweeter>,
+					    <&swr3 0>, <&lpass_wsa2macro 0>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+
+		va-dai-link {
+			link-name = "VA Capture";
+
+			cpu {
+				sound-dai = <&q6apmbedai VA_CODEC_DMA_TX_0>;
+			};
+
+			codec {
+				sound-dai = <&lpass_vamacro 0>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+	};
 };
 
 &apps_rsc {
@@ -364,6 +412,12 @@ vreg_l4h_e0_1p2: ldo4 {
 	};
 };
 
+&lpass_vamacro {
+	pinctrl-0 = <&dmic01_default>, <&dmic23_default>;
+	pinctrl-names = "default";
+	qcom,dmic-sample-rate = <4800000>;
+};
+
 &pcie3b {
 	vddpe-3v3-supply = <&vreg_nvmesec>;
 
@@ -478,6 +532,62 @@ &pon_resin {
 	status = "okay";
 };
 
+&swr0 {
+	status = "okay";
+
+	/* WSA8845, Left Woofer */
+	left_woofer: speaker@0,0 {
+		compatible = "sdw20217020400";
+		reg = <0 0>;
+		reset-gpios = <&lpass_tlmm 12 GPIO_ACTIVE_LOW>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "WooferLeft";
+		vdd-1p8-supply = <&vreg_l15b_e0_1p8>;
+		vdd-io-supply = <&vreg_l18b_e0_1p2>;
+		qcom,port-mapping = <1 2 3 7 12 14>;
+	};
+
+	/* WSA8845, Left Tweeter */
+	left_tweeter: speaker@0,1 {
+		compatible = "sdw20217020400";
+		reg = <0 1>;
+		reset-gpios = <&lpass_tlmm 12 GPIO_ACTIVE_LOW>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "TweeterLeft";
+		vdd-1p8-supply = <&vreg_l15b_e0_1p8>;
+		vdd-io-supply = <&vreg_l18b_e0_1p2>;
+		qcom,port-mapping = <4 5 6 7 13 15>;
+	};
+};
+
+&swr3 {
+	status = "okay";
+
+	/* WSA8845, Right Woofer */
+	right_woofer: speaker@0,0 {
+		compatible = "sdw20217020400";
+		reg = <0 0>;
+		reset-gpios = <&lpass_tlmm 13 GPIO_ACTIVE_LOW>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "WooferRight";
+		vdd-1p8-supply = <&vreg_l15b_e0_1p8>;
+		vdd-io-supply = <&vreg_l18b_e0_1p2>;
+		qcom,port-mapping = <1 2 3 7 12 14>;
+	};
+
+	/* WSA8845, Right Tweeter */
+	right_tweeter: speaker@0,1 {
+		compatible = "sdw20217020400";
+		reg = <0 1>;
+		reset-gpios = <&lpass_tlmm 13 GPIO_ACTIVE_LOW>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "TweeterRight";
+		vdd-1p8-supply = <&vreg_l15b_e0_1p8>;
+		vdd-io-supply = <&vreg_l18b_e0_1p2>;
+		qcom,port-mapping = <4 5 6 7 13 15>;
+	};
+};
+
 &remoteproc_adsp {
 	firmware-name = "qcom/glymur/adsp.mbn",
 			"qcom/glymur/adsp_dtb.mbn";
-- 
2.34.1

