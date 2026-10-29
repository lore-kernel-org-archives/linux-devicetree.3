Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793245675;
	b=phwqnspnfWYvUIDRXxw5gR1dhfyvI/+MxChSoonpgqyQFCQRtjhs9V4Hl+7fZ38cUNqh
	 WvR1W/S6JUMg53Pz0WwpBUrIBr4s9xZm3G+dM6MjP7VryiD/358diyEt0KFLXYTm39JkW
	 OtC1Hko7VEZ3+Z69clxIW5NWIaS9AoLVNoJxDoEL+Gp+3AhNbA90qkePhw8JIdcQsfbZ8
	 rF0JtTFvk0wEaKiszY15sace8PadX73mJonnliD54VKShEnRzYqJKXrb78NHl5oOmXa8l
	 WwwwWvWnU/dOnFOZreU/Gy4klz9bAkBCMlY77QACpZRsMh0p0S8F69P2An8o02to0fw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793245675;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=6hP61S7FMd5GBi62j70cBoRA5yujIbmQxVw7ipJnZtI=;
	b=5gCza+8cbn4irqgaupT9IwTDe1kHv1NSvnn9u0zjUMQLGKnjUCpMz3LijkfLTORF9JI6
	 IuqKTINqUojpW3tusQd8paqKZ1xn9YI89URboJzEUL+Ugf0ESxyfLwF6fuspay5xa8UD9
	 NKTtFdZPNEzJftdOni195dX8hWGLx9bBZubLbII8dbnXUMFFMOpuExHoRaFlsCbtz9oDS
	 knQ9OwFeBh3j7q3bEBwfhhUmVqBsRIwr8bqXRQPNgiQKAo2AL3IBUCVaf8bccMVfOYk0u
	 K55aGrTtHnAReIqrXyF0eUDr5CCjhi/uJQoSqD1/4jGIrDWJFm+1ZqJQehKNxEv89bQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=J0tPRhy8;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="JusMrOf/";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 894CF606A325
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 03:47:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 894CF606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=J0tPRhy8;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JusMrOf/
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69T1jRqo3375192
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 03:47:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=6hP61S7FMd5
	GBi62j70cBoRA5yujIbmQxVw7ipJnZtI=; b=J0tPRhy8CaAl8ooOBFWVnzurNGt
	BKfn2yiERnUIorCj97MDw4tmgyU8ziX4DajoQeyqkx4q6Ttr8FiNG+xRawF/p0ua
	CTWuYrSd7u79ta9kZM7DG+Of+kHLJaWxvzNIGuotqmVHubzt/6beU3HF2d0Xif0P
	Um5kllTU3rWO67nuTEAKMC4f74Xjpp5MS8DtX9tcy11EhQMbYijuM122805mahom
	mE6ZTBdM2qxICC3q4Iw5rDlaSCWrL4luy85Ci0RUyMnE4it+1c6L5VdDjJiLTAPz
	oksDLopluV73z/ZN4tfkXxsgYQ2llMNcIgCt03ODxc3HeVJD9LF2uXZm/0A==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hktmp8rty-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 03:47:53 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-36a190c53a3so543867eec.0
        for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 20:47:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793245672; x=1793850472; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6hP61S7FMd5GBi62j70cBoRA5yujIbmQxVw7ipJnZtI=;
        b=JusMrOf/svvFirohhFoIGRAUa7rBR4qeX+p7uE2YQP80EcC01mtneGdSK5ORbY98VA
         yJ5w3IulqMxotnoHb4uW1uyEBCBb3/Du2roZfFVK8+9mD3IEwgwR7CSjyzyWuriNLrTj
         IYhoLEOp33COk4ExHIpjY4Y7bQ87WkUXWdSzeIrA95wcff468ZeLIFd4Rg9YYTScGIU6
         FT79eTtw2SHjTuMeZQOnG9o6t9AcneIQEG+O3dOimbTjp3YtP2GaWxYpz8u/7/zdlu7J
         zPD7cW8ZlUidxR7yUxcD6do4rgbkN4m8ZhxVNqw6uHRbl24YSH0ijSkDlf/rdMx+8j7I
         wYDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793245672; x=1793850472;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6hP61S7FMd5GBi62j70cBoRA5yujIbmQxVw7ipJnZtI=;
        b=2J3B+bz6gDRfHJQrioDVilIOY3mjSxzwRku3kPwcO/wbaDUuGOZMABaVteoylH4vnN
         EbyGMnsKFxYiqE2GQ6oRU7tIMSgCJN+HESMqOFGFvwfcAawvOoHJ/MEiKt945P0F1Bhe
         EKw+219yIFJGqX5Ach2h+rSrTX9h8OijW35mHupewv488UjfVTyMkl2rnMUCor8ZBkgB
         jsjRC1ZX/tXtbY7UpQPMmntIjlK1NSnlwv7oHhOQAWSiBC/eQUr7HIY9a5V+LELEPwNl
         nK7lGbdpeztqXgAp1riNvY5DacaPIVV1aq8dkceakK4h0+HwreTWAH37ihgiGKal7EQ3
         Shhg==
X-Forwarded-Encrypted: i=1; AKwUvBxZuwWM+9ULkGsXftcpDOedFs96TVP/xUuGlr0Ypj3+rBEptcDlYAGxkPMrdttvF1TV4QWmcnnGEbiv@vger.kernel.org
X-Gm-Message-State: AFq9FYKBAwVqoopqsMCy0B0UdMyOBcn+xzghWOx57ad+y0Ps+D4m0EuL
	tBiGhuyYEv2dGePMkizQqUL9294xPit1cSq3Xa8VOV4VvKVw0s3v9dtpceHjgNaP5+XR7yRg0cf
	ppnJnimnBQCIcvNZ10RpkNAu65A3+ahGS9U0m+cQ0tbjoQcJWuA4ob2ge7GTWSq0V
X-Gm-Gg: AYBFou2M+Ch+pHor74F57L+VgnQ3D0mXstEsAXp0bYVM8PPoGqDiOgLy2kZLNPcb2aL
	hjVIAwcStlbxhpt7zJIDIq1dh9JW2dM9of2cYeMiPX0U4QVWljg/9WJwoNyLRSmyge9xPS5PEH0
	btmkEEiEdmAURuA4H7DWL3v2aUf6XWBrNTTtIszcm1sOgG0Cle1BCDZG/Mb+c3XM4aQAyGCgjky
	42tP96oYYjoFVVWwnAuRZJRNBl1Bxn8QN1aP4cnVjQn9iLOAZn4XYJv9yVAgGvlsXD+bMv63gXJ
	wWW6Pf0/7cC486VqjW86v4iAIy8YoPGw40LWabJbO9M/5mbygMi8zSxUDKvMNMN3xbMhqe3bWh0
	oIS+8pCfRJKIQyHCSwwx70iJ4vqhR18dFH05fXLzP0Hh7yd69TIDLZSQDnL/86bK9J6n12zObf4
	R0jmJAtV+qa5Zj8fd01L8L5DRlCL1qyRai
X-Received: by 2002:a05:7300:6a9d:b0:369:f644:fac0 with SMTP id 5a478bee46e88-36a2fd70ff6mr1788184eec.8.1793245672378;
        Wed, 28 Oct 2026 20:47:52 -0700 (PDT)
X-Received: by 2002:a05:7300:6a9d:b0:369:f644:fac0 with SMTP id 5a478bee46e88-36a2fd70ff6mr1788155eec.8.1793245671804;
        Wed, 28 Oct 2026 20:47:51 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a2393cc86sm11064286eec.19.2026.10.28.20.47.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 20:47:51 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Nabige Aala <nabige.aala@oss.qualcomm.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH RFC v3 2/3] arm64: dts: qcom: nord-ride-embedded: Enable eDP0-3 display output
Date: Thu, 29 Oct 2026 11:47:27 +0800
Message-ID: <20261029034728.633495-3-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261029034728.633495-1-shengchao.guo@oss.qualcomm.com>
References: <20261029034728.633495-1-shengchao.guo@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDAxMyBTYWx0ZWRfXwMFuIrQiPTO9
 tq7xeLb4HJjEsnyNHLFD8q8BLVCq+pcNqVW9v329XJbT3S8sz8qTKxjw6CNFG20wnRbZtk9Tn4G
 SqJKOgSv2T4unba/nqrF4DYH4oT2B5qaYy7HcY0grmPRFTQ0zmBgnMD61DWa+PJAeG9yK8PYIdi
 hbP31d1jenXPBX6PtoTQngVHoulng+zHWthAFewNsAMKQuh4+tboSAyA0ZAq6BtV+ZATPmvn1DJ
 0E15CkIE8xZtRM8/n83uuf1Gb9zPyhHaSrK/dOtpO8VR4RfbMIciWXx+M56h5m4umNVgeXqEDHl
 zLUag+i90ipc9jjgTwUrDqSzLKzTakbglZewDRDwp8m5/iqSJj0vDHF+jeFddq9IhjJD5nc2GSH
 ea/28BiwIx6VWbSOuKKf3cMEVqwqjMVwdwoY9j7E0EKYwOK86ayphpvq+wj8wLeQemiZEtJyDIw
 4MRiZHsr/K7Q+Xw0b+Q==
X-Authority-Analysis: v=2.4 cv=crYOAF4i c=1 sm=1 tr=0 ts=6ae2c1e9 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=F3f4s1Zse-zWnPoJeOMA:9 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDAxMyBTYWx0ZWRfXxV0tPHK8b4t8
 k1gWqdBEQMNGTJkRu0iG6yIODXbWmUvtBDupW1zOjTnW4bfLp60lPiM3zt1a0DsNLliR0PqgQX5
 tCKK5q4LvzLVwZOQabeWGe1wTc/6Sic=
X-Proofpoint-GUID: QgT-tWqiml7O5cGXEZFjzRrCdi2RF2eg
X-Proofpoint-ORIG-GUID: QgT-tWqiml7O5cGXEZFjzRrCdi2RF2eg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 adultscore=0 suspectscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290013

From: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>

Enable both MDSS instances, the four DP controllers and the eDP0-3 PHYs
on the Nord Ride Embedded board and describe the eDP0-3 connectors,
their 4 data lanes and supported link frequencies.

Signed-off-by: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Tested-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 .../boot/dts/qcom/nord-ride-embedded.dts      | 124 ++++++++++++++++++
 1 file changed, 124 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts b/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
index 49635695f832..cb1d436644c1 100644
--- a/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
+++ b/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
@@ -53,6 +53,54 @@ bi_tcxo_ao_div2: bi-tcxo-ao-div2-clk {
 			clock-div = <2>;
 		};
 	};
+
+	dp0_connector: connector-dp0 {
+		compatible = "dp-connector";
+		label = "eDP0";
+		type = "full-size";
+
+		port {
+			dp0_connector_in: endpoint {
+				remote-endpoint = <&mdss0_dp0_out>;
+			};
+		};
+	};
+
+	dp1_connector: connector-dp1 {
+		compatible = "dp-connector";
+		label = "eDP1";
+		type = "full-size";
+
+		port {
+			dp1_connector_in: endpoint {
+				remote-endpoint = <&mdss0_dp1_out>;
+			};
+		};
+	};
+
+	dp2_connector: connector-dp2 {
+		compatible = "dp-connector";
+		label = "eDP2";
+		type = "full-size";
+
+		port {
+			dp2_connector_in: endpoint {
+				remote-endpoint = <&mdss1_dp0_out>;
+			};
+		};
+	};
+
+	dp3_connector: connector-dp3 {
+		compatible = "dp-connector";
+		label = "eDP3";
+		type = "full-size";
+
+		port {
+			dp3_connector_in: endpoint {
+				remote-endpoint = <&mdss1_dp1_out>;
+			};
+		};
+	};
 };
 
 &apps_rsc {
@@ -366,6 +414,82 @@ vreg_l3l_1p8: ldo3 {
 	};
 };
 
+&mdss0 {
+	status = "okay";
+};
+
+&mdss0_dp0 {
+	status = "okay";
+};
+
+&mdss0_dp0_out {
+	data-lanes = <0 1 2 3>;
+	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
+	remote-endpoint = <&dp0_connector_in>;
+};
+
+&mdss0_dp0_phy {
+	vdda-phy-supply = <&vreg_l2h_1p2>;
+	vdda-pll-supply = <&vreg_l1h_0p9>;
+
+	status = "okay";
+};
+
+&mdss0_dp1 {
+	status = "okay";
+};
+
+&mdss0_dp1_out {
+	data-lanes = <0 1 2 3>;
+	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
+	remote-endpoint = <&dp1_connector_in>;
+};
+
+&mdss0_dp1_phy {
+	vdda-phy-supply = <&vreg_l2h_1p2>;
+	vdda-pll-supply = <&vreg_l1h_0p9>;
+
+	status = "okay";
+};
+
+&mdss1 {
+	status = "okay";
+};
+
+&mdss1_dp0 {
+	status = "okay";
+};
+
+&mdss1_dp0_out {
+	data-lanes = <0 1 2 3>;
+	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
+	remote-endpoint = <&dp2_connector_in>;
+};
+
+&mdss1_dp0_phy {
+	vdda-phy-supply = <&vreg_l2h_1p2>;
+	vdda-pll-supply = <&vreg_l1h_0p9>;
+
+	status = "okay";
+};
+
+&mdss1_dp1 {
+	status = "okay";
+};
+
+&mdss1_dp1_out {
+	data-lanes = <0 1 2 3>;
+	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
+	remote-endpoint = <&dp3_connector_in>;
+};
+
+&mdss1_dp1_phy {
+	vdda-phy-supply = <&vreg_l2h_1p2>;
+	vdda-pll-supply = <&vreg_l1h_0p9>;
+
+	status = "okay";
+};
+
 &qupv3_0 {
 	firmware-name = "qcom/nord/qupv3fw.elf";
 
-- 
2.43.0

