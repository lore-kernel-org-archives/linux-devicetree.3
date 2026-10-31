Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793456723;
	b=SWC1PdY6EWIJ+EUxnRHASFrmUtXtCXp5uUtAHUS7RxZQA+IniutJ4uiR4RiLqOvzmy9d
	 941kg/rGGkSYf1hnJp2UzNJzr9rFPr1c3PWTRQ5utqtQj/FX17A+QJfeAops8qqZUpOiE
	 FcN3oSeeulY+eTK258Fe1JeujUPVRuQt4cigzlM/S6Snfu9sJ6Lv/51tcDLhlB5G703J8
	 himh79wqne9uzogH4Hfv0lvR3qv2Kz3d6AGioxPek6GV2+MoWz6loYVZEubG2p6ek35Oc
	 unzf1JnzFiyPAQ1vjXdtq7PYiLR1voPZwt0P8xPLrW3V0G+wPzvtntNX9B2R94WC6ow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793456723;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=1uIfte2UHyzL3PVKqzp672nDxeBEEXuRD1Dgs1tW2y0=;
	b=pn+ny98Gw0mzUBbx4oqIxZQ11hQepQjZA6AAyTtWDZhFhvYckUgVU4F7WzTCrUbXb1l1
	 oZ1TTt5MbZ4J0ctt9TH81x+gEX0yNtKX5PPH+EIVv87w3z8T+XofK0SexiCCGJd6c+Miq
	 eIzsRNQQ4Hh4pawBG4Q9gY92edbUgUiBzOikunVQfjnNkAdsRt6NoJa7RBT6VVhd3o/KD
	 5sQAcFwDArGkw+Ep6tXDOt1Fdvl83Ibcc80sC2JZD+ZpzUdjIauW/wwqdWa8OLlH/F5B4
	 igwn+HsL5CmbALIAV2BhQntpdHdT5VNUEbTpNq94FUbr08hi1VAatS4c7Ly+uoIZ9sw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NTQI0OQO;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bsb+ONc0;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74A46606A327
	for <devicetree@vger.kernel.org>; Sat, 31 Oct 2026 14:25:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74A46606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NTQI0OQO;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bsb+ONc0
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69VD05x01233054
	for <devicetree@vger.kernel.org>; Sat, 31 Oct 2026 14:25:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=1uIfte2UHyz
	L3PVKqzp672nDxeBEEXuRD1Dgs1tW2y0=; b=NTQI0OQOlsqFt1vvRumZyTlDdB2
	iROByswjnbYdROK4c3v9MnOZsZ7d2jv9PII6Dr4OgNHvlaPDBNMuVmVBiRcmrXW0
	cKtV7S81lv3Hs4jnI2kJP4Dj0GE/s03rU4NiqHrCSGGVEzviRfACFBxXqvKbHB3C
	9r6sKRoqTZgsQZkLtbJZFCFlfslS9zGoxslW9UrQpOygy9EDheN+jaRILBQws8Xm
	XgPAwxA1zcIIE34+hkiqrkXqeU9ypVc6XwtovnKuEXCNdCxDqqU963Q0put6ud0J
	p6e+5wZromGudGN8ljm2v4Zcg6lojft0RGu7KLfNUuFxDRqDwvceHl34ohw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn9m9938f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 31 Oct 2026 14:25:22 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso3707839eec.1
        for <devicetree@vger.kernel.org>; Sat, 31 Oct 2026 07:25:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793456722; x=1794061522; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1uIfte2UHyzL3PVKqzp672nDxeBEEXuRD1Dgs1tW2y0=;
        b=bsb+ONc0hutBwpLrIzH1YDT3QbRUd7COJ6TZ5rMf1RnOPtqj4FPsk5gVbjBUgzQXz8
         ye5BzK4MDorGYLUlu+ABJJnlKd5TI5exDNueCvE5+as8Ox9pGFNYEfrYP6+akTeo0bGh
         CKs8H7YXf0AXDd1x21aEIXpdxbbvAFcbW/2ia8Www03yohvqe6890BY7VPpJU9ZRQi3r
         4DZJZhvQKzvP/1H0lFJrITBk0/bcbviU8kjkvQU/jMuNlcaxD0Ntt5UoCZcSZ0x74qbV
         n3xDCZfRsM2FgeKR9GB02vFP0IM1I4yUZVT7NLrKscgHAbRh2167lYN7h1mEJq9A3KJb
         61RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793456722; x=1794061522;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1uIfte2UHyzL3PVKqzp672nDxeBEEXuRD1Dgs1tW2y0=;
        b=xIq8MASIY1/pPtu9q6UttaHahCmBhOeSDKPSv+veeTwMfxU+0iZkvDc7bT8N5OBFHp
         cfCF4udR2KXNgdXvs3rU2qdS9zVZLRSE9gxxiuhV9JgMUYySCyOhwQ4TRRwwgNOpOq82
         5HFqO9Y41musMf3gtGsXvRTWNaa/Xl+IWhn6JvEsTNrTyel3VBD+OtIfDeUDKvNTZMct
         L9eoqagx3M2Gvx8Ru3Pal9/11E9zTU2qoSBLOjn9JRmoeK7h4SlaTZboXse+XnFPJR8d
         x8yY5MdT1TsU+wr/DHKx2to1UOIY+VdbiZ0M90p9GLajeZqOpT6trNB8JGtSx2a83ZpO
         8oxw==
X-Forwarded-Encrypted: i=1; AKwUvBzYxqiesCaETkVXAz06BL3gY572E6yMR4DW9IRYKBHAEh5z1bBtCwDlqqSvZdGufRgO1skqqtPJvf6l@vger.kernel.org
X-Gm-Message-State: AFq9FYJOa4yCuM527fQixVYsqlad2sTDkezGkkGSknaG2K/U7WYX+j/A
	H8S1yHWionR1Yolm3q3RoII7wzf1vE/FGLS0cU12mX5kgWVbpEaSC9un+2wzMJU+ERPgxneX4WC
	UHEuWOMrQ9e3FXHu0XRCKpGjrufpcY7PT+SMq1ZRYcsrv4gsi53X1Dh+J4Ne/03XX
X-Gm-Gg: AYBFou09vef69fcRMCRjpo4cEAl4WXx9csXout05sINaazbUoNkq5a34BwVjF0HmDn8
	kO2N8Bim7audFH0SBWUiAi+NN5sX71YoKjxFqBcKC1mmk+fYA3YXRuyXZCoPxTQtlAWWvDOcirF
	j98OhdmarUo1xRhUxyXwrJP0TtjxTk/F7NDEvcaUMTdMi15CrIfq4zbbDYf3GbAY0TSyh3+kk8w
	mpwp67D48UlENf+hev0hvezz565fvveonpqKUGPiy45FkiSVxqeGlzYH1/N6rl0eyfbnGNcAabq
	ZH6UU73cfWa69pwQB2fU4Ksz2ZIsY76bCKhn9GaFKscSBGtd0xIk3Iivu0Q27F4YBvDp2LYCduz
	qm64Wss85q+IJNLkkHwvUxq6hIZehTOVUaLHqjRHJgWnn93Tv09HfYB9vHsBn07Z/YRG2rSZ/Uk
	AcKTJZV+jOvWu2ymRk4CBetlBpIl0ODWpM
X-Received: by 2002:a05:7301:1a15:b0:355:fdc0:a811 with SMTP id 5a478bee46e88-36a42493bc4mr6951867eec.37.1793456721972;
        Sat, 31 Oct 2026 07:25:21 -0700 (PDT)
X-Received: by 2002:a05:7301:1a15:b0:355:fdc0:a811 with SMTP id 5a478bee46e88-36a42493bc4mr6951838eec.37.1793456721306;
        Sat, 31 Oct 2026 07:25:21 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42935b4asm24968586eec.16.2026.10.31.07.25.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 07:25:21 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Yu Zhang <yu.zhang@oss.qualcomm.com>,
        Shuai Zhang <shuai.zhang@oss.qualcomm.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH RFC v4 6/7] arm64: dts: qcom: nord-rrd: Add WCN7850 WLAN support
Date: Sat, 31 Oct 2026 22:24:32 +0800
Message-ID: <20261031142433.1212809-7-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261031142433.1212809-1-shengchao.guo@oss.qualcomm.com>
References: <20261031142433.1212809-1-shengchao.guo@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: 2I2WdnJr0CcJ3J76YoQL0MRsMnrdboDo
X-Proofpoint-GUID: 2I2WdnJr0CcJ3J76YoQL0MRsMnrdboDo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMxMDA1NyBTYWx0ZWRfX6w7wvIKw9J3M
 DpDTLcssA0BFkYMokcWwfjgpqNLvL39Ts+HbxIYelrbBy9niP8vXhWuVQA/Nn6Qp2JEd/rZ414S
 5+gRK3BuV0u+FMo7tdugHh5IxDnK/htk/tzjlUoFTdhXPxz804JX89gcjnA25ZGalZs3vAvAkhn
 VOUc4MjrEzhILMkHwCKCVf4m0Yx2TeuM3MIFsgJ2xu6sAU3xsBOcD6W4eG/1qQ5dlNC6Fxj5PoZ
 G+2UGSmuTuBma5TpcsODQL15sgN8o0hUVw4Q1bygYf8Zg0yJ0Vrr/dlrCjR3fMmyzyq8ui9rnru
 b83id4liJYzo190a1e8GiREG+m8n537yV+j5WLOQA1D5Q+M5VhSfl+IRVJR8rwjWRmBl9m/8cl3
 gtcdDIYqhJwLEwv9elXrJZWac4CtoMTKJTcyzIgigMqVFPiLv9KLE5AYUkOfNlawx6ppI7shbZE
 xXRnXJNqeUPXr/RlDzg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMxMDA1NyBTYWx0ZWRfX2Bc835Fv03RH
 csj1hz2oVP4UJu2eAUEn5b0kNGE6IIY3uJYMvc1sBbAfcr+91bwdF/6tAcLOvCgBnOGWuQ0a/fr
 sHde1HbN6SqSzgUhBz1CEoIAtIK9muM=
X-Authority-Analysis: v=2.4 cv=cfVHPXDM c=1 sm=1 tr=0 ts=6ae5fa52 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=fkhy3qLzDainn0cAaKQA:9 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-31_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 spamscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2610310057

From: "Yu Zhang(Yuriy)" <yu.zhang@oss.qualcomm.com>

The Nord RRD carries a QCA6797AQ (WCN7850) LGA module on a
connectivity adapter card hanging off PCIe2.  Three PMIC GPIOs gate the
module supplies: PWR_CORE (pmau0102_e GPIO6) enables the DBU_CORE_VL,
DBU_CORE_VM and DBU_CORE_VH regulators feeding VDD_CORE_VL/VM/VH,
PWR_CTRL1 (pmau0102_e GPIO8) enables DBU4, which produces the 3.3 V rail,
and PWR_CTRL2 (pmau0102_e GPIO7) enables the 1.9 V rail.

Describe those rails, the WCN7850 PMU that derives the chip supplies from
them, and the PCIe endpoint node consuming the PMU outputs.

Signed-off-by: Yu Zhang (Yuriy) <yu.zhang@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord-rrd.dts | 111 ++++++++++++++++++++++++++
 1 file changed, 111 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord-rrd.dts b/arch/arm64/boot/dts/qcom/nord-rrd.dts
index 98dab85de64d..b23c1a81a376 100644
--- a/arch/arm64/boot/dts/qcom/nord-rrd.dts
+++ b/arch/arm64/boot/dts/qcom/nord-rrd.dts
@@ -53,6 +53,102 @@ bi_tcxo_ao_div2: bi-tcxo-ao-div2-clk {
 			clock-div = <2>;
 		};
 	};
+
+	vreg_wcn_3p3: regulator-wcn-3p3 {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_wcn_3p3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&pmau0102_e_gpios 8 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	vreg_wcn_1p9: regulator-wcn-1p9 {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_wcn_1p9";
+		regulator-min-microvolt = <1900000>;
+		regulator-max-microvolt = <1900000>;
+		gpio = <&pmau0102_e_gpios 7 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	vreg_wcn_core_vl_0p95: regulator-wcn-core-vl-0p95 {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_wcn_core_vl_0p95";
+		regulator-min-microvolt = <950000>;
+		regulator-max-microvolt = <950000>;
+		gpio = <&pmau0102_e_gpios 6 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	vreg_wcn_core_vm_1p35: regulator-wcn-core-vm-1p35 {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_wcn_core_vm_1p35";
+		regulator-min-microvolt = <1350000>;
+		regulator-max-microvolt = <1350000>;
+		gpio = <&pmau0102_e_gpios 6 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	vreg_wcn_core_vh_1p95: regulator-wcn-core-vh-1p95 {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_wcn_core_vh_1p95";
+		regulator-min-microvolt = <1950000>;
+		regulator-max-microvolt = <1950000>;
+		gpio = <&pmau0102_e_gpios 6 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	wcn7850-pmu {
+		compatible = "qcom,wcn7850-pmu";
+
+		wlan-enable-gpios = <&pmau0102_e_gpios 10 GPIO_ACTIVE_HIGH>;
+
+		vdd-supply = <&vreg_wcn_3p3>;
+		vddio-supply = <&vreg_s3a_1p8>;
+		vddaon-supply = <&vreg_wcn_core_vl_0p95>;
+		vdddig-supply = <&vreg_wcn_1p9>;
+		vddrfa1p2-supply = <&vreg_wcn_core_vm_1p35>;
+		vddrfa1p8-supply = <&vreg_wcn_core_vh_1p95>;
+
+		regulators {
+			vreg_pmu_rfa_cmn: ldo0 {
+				regulator-name = "vreg_pmu_rfa_cmn";
+			};
+
+			vreg_pmu_aon_0p59: ldo1 {
+				regulator-name = "vreg_pmu_aon_0p59";
+			};
+
+			vreg_pmu_wlcx_0p8: ldo2 {
+				regulator-name = "vreg_pmu_wlcx_0p8";
+			};
+
+			vreg_pmu_wlmx_0p85: ldo3 {
+				regulator-name = "vreg_pmu_wlmx_0p85";
+			};
+
+			vreg_pmu_rfa_0p8: ldo5 {
+				regulator-name = "vreg_pmu_rfa_0p8";
+			};
+
+			vreg_pmu_rfa_1p2: ldo6 {
+				regulator-name = "vreg_pmu_rfa_1p2";
+			};
+
+			vreg_pmu_rfa_1p8: ldo7 {
+				regulator-name = "vreg_pmu_rfa_1p8";
+			};
+
+			vreg_pmu_pcie_0p9: ldo8 {
+				regulator-name = "vreg_pmu_pcie_0p9";
+			};
+
+			vreg_pmu_pcie_1p8: ldo9 {
+				regulator-name = "vreg_pmu_pcie_1p8";
+			};
+		};
+	};
 };
 
 &apps_rsc {
@@ -415,6 +511,21 @@ &pcie2 {
 &pcie2_port0 {
 	reset-gpios = <&tlmm 8 GPIO_ACTIVE_LOW>;
 	wake-gpios = <&tlmm 6 GPIO_ACTIVE_LOW>;
+
+	wifi@0 {
+		compatible = "pci17cb,1107";
+		reg = <0x10000 0x0 0x0 0x0 0x0>;
+
+		vddaon-supply = <&vreg_pmu_aon_0p59>;
+		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
+		vddwlmx-supply = <&vreg_pmu_wlmx_0p85>;
+		vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
+		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
+		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
+		vddrfa1p8-supply = <&vreg_pmu_rfa_1p8>;
+		vddpcie0p9-supply = <&vreg_pmu_pcie_0p9>;
+		vddpcie1p8-supply = <&vreg_pmu_pcie_1p8>;
+	};
 };
 
 &pcie3 {
-- 
2.43.0

