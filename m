Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795596147;
	b=F1jbLZgBNSrDIMOcc8Hl8JXVFR9vyEbS8stnrK86KNrfocWk9IrRCNPsvAuYWewfhWgB
	 PnT4RN7YX3Ptr2MysuTWf5HqPAp4vyTS+1y5E0sM8wsX/mLiqoBgFKnNMqwafdeCJw9cM
	 LW4yD2MA7+v68+n9Ma9pjYk61RQ9ROttVR9yB/9IVAukvHLJZ96T4MB/n4FzoYGWnzDvz
	 9NPDZCfIgfavumvUfZflMuHVCQCr5/35KoLU0eYqd8UQSaSLKj7v5Oh+D5Ax9kZGuhGRX
	 9Mi0swMoyXV6HywA6621wBHsgXQO588+rct6GdlYDvWxLYDuYjI/mT3Gu+D9NlWoHyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795596147;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=e7HDHkfEFaERbfFKtJdW1zcvY6kQYZ0C1Tsrbx9wAOc=;
	b=SY5rIk+TVQh2J/FWixXILduM3vIhW0FjetPiLvuSSP152aIiAk9fpygoac1p9BFr2shA
	 kk/1k1Wa24diTHWl7QxbBBmDVkxBbspm1mDYlRii5+bK21trnsrRZuYieFG2GXIz3S+8s
	 bMA0mxtb8ZfrpROjWmAnfwlZ3d6k1dXBTrrJeWh/5l818V5h2h2rV8G6aK5Wd1wqmIZXD
	 K4rIi48gFg3Ajnk5LHvY/s0jTMI7XaGYo6cYVH+pIScaKvB25sta5Pumz8XqQsYsM7BT1
	 Z9T2PUuSZyJXWOUqzSKWgr/HGHbz8IoJ+PwOexn3HYq1ZbQblLEuSXdEjdMMzu3ycHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nApjQyHv;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZK0etzbN;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2FE9606A326
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 08:42:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2FE9606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nApjQyHv;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZK0etzbN
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP68iYd1861076
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 08:42:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=e7HDHkfEFaERbfFKtJdW1z
	cvY6kQYZ0C1Tsrbx9wAOc=; b=nApjQyHv4oT9quenBBxIxAKkLHnWQKSUGWcOgy
	70+5rJzsyMIZef2Iow0pmyL7v0pK7fYsfos/HpWxv0RjRzZrHmQrGvUhK3STudC2
	cKrKLOeUmcsGqQ5QL6nIgD+pqzH69Nf9OCMP6SL9S8RUWL86q5i/skwo4+CzwkGK
	C9z2xzKlbFfpkhCuKll+Swfvj9fCfS77kPsh5TZTzf4e24PRAbUtfNOnAe8vuWhV
	DUccSqrGSAtGdEmrfAqPR6FL1yomAcQbS7XMFc+5DR9JzURzl5+ddTwQyWQDeZIV
	CaHUGuTSs2SuTXtks+K707i75rOui/1NJvAVdid4Y8mrZ3iw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5nu69j2r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 08:42:26 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2f02547a462so9633355ad.0
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 00:42:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795596145; x=1796200945; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=e7HDHkfEFaERbfFKtJdW1zcvY6kQYZ0C1Tsrbx9wAOc=;
        b=ZK0etzbNwQQ46GnyPAxJbh4Y0W6GFIrA8Km3pjSAhpX5opYkOfuQYahI6SG+NKj9oe
         3IxUhx+/jGA3p2XWJ1XKJJSXWleh6OoinRl3QVW8IIhWA03xp3yxaKfJ5V7RAOup7tQQ
         KTyqpbWX6N1fuFNwV/IFbfvG0SMre9JC1IRYHrDJuuf10MjayitDHCYHma9tEtLngC/t
         7tMBy/90h/BlvGv2817VIg1DXMCAOmWx/NrY6XJlrsZWMpYjll7wDQ00vRWaNOwcalaZ
         a/Q5PPsd5kErCQpQpGnWfUTfAZHqDZGgQ5SCIFIExDKvuKXdNd7lUEFl4lhx8j9fXAAZ
         vNBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795596145; x=1796200945;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=e7HDHkfEFaERbfFKtJdW1zcvY6kQYZ0C1Tsrbx9wAOc=;
        b=iOkf68kLyLgL2ZJsQiuSbt5hQ/JQtnY6uvislqN6pf/povE4hymPzL+DAsjY+LPlZ5
         oQUr0IohaAiF3pqARrAP3ShyXYaR0f05x5T4ELpIhOj7ykUESYtn1963rZdDuulM8QPt
         v0rde6lOId68X9PbbpIcPFUt/IzOZ1/w3GiSUFGyqeEg/jR38BEB1a4ehxaHM2eKn3an
         MObBUSWWMfa+Qf6fP7glF4TqI1omNlUirv7snLRwb9KUI3ui3aLU+hVMfRUzT4KLUhRT
         ll4iEkRFQzfxNonevYnO/sNlVa7kHgTTrczOjn37hcw1ZtfdOQZLquVt675K1v7NEr1u
         fMhg==
X-Forwarded-Encrypted: i=1; AL+hErF0Vdrl7igtn+cafBhOIk6oxRz0K4/fbEg9XGJXXVYUOnfAX2VHSCRcqMwTuLSxheJrw9ZZ5I57KMUK@vger.kernel.org
X-Gm-Message-State: APuU4Z86aGf+oP90POtGcjYwOnIBJA42Svrug696ui5i9zyL9kk4Ffrd
	+eV5aMmlwZSzNzOZAGrY8Ive3hxZ1ns/BAdhWTj0UEltE7B36amYYa4Q2oyNW0HL0yIZkwYS6m3
	ceLxjL2GngDjNJnWG0kwd9gWhOepzQlntQR8e/pGWBYU3+3Fru4F1xrbxKD0QsV+Y
X-Gm-Gg: AZFdTZekWaGoMD+we9JRZd3UOE1wzY2juTbIyrFuyyNsgxCuNDQ+dIJZBms/Fhhrorm
	n/8wNBZoSSrRkhlMiHUhYqNqsoQJzcBjhgtkvNyDPOGKDQYQikAliYwdUutJAY5onvCq8F6ztkh
	bT2lg9tk4NcLtRc7Da1XKj5OKcMtNAhvjDyphdqMMYHONLBc8QE9cJnjWW/rc7J9vb3VMkMdRtV
	ia54+LfjHEqK32cTqy0bZDkeElOsSG38cMJnVgw5o1qWu1KCyuYQR1LWxsR8EerWUdXqJIe7JB1
	/Ls7pgioGPXPA0u4j1A2TT0jiLm4s3hdcD8ucdNCMLMtU0dKGtOdHtpcsK5SXfT7UVnBd//ujQb
	4CESZAIIHwFroOa+r1M5ln3Z8j3eUYB81ZtoyHusnKKlSIv6/lNDdnyBBRpPCQ0RGhuKCNcYn1Q
	MDg2dbyMs72LQycCCCtPuxRs8qabUb0cGQAvNHO5rPlXMlaSBjCzFikLh6vxy/AlsfG1TliFgPd
	qiiCd4YlgmFxvSpsFXeEbKQERpDKg==
X-Received: by 2002:a17:903:298c:b0:2ef:ee1a:1383 with SMTP id d9443c01a7336-2f03f1b9c1fmr277187085ad.3.1795596145321;
        Wed, 25 Nov 2026 00:42:25 -0800 (PST)
X-Received: by 2002:a17:903:298c:b0:2ef:ee1a:1383 with SMTP id d9443c01a7336-2f03f1b9c1fmr277186845ad.3.1795596144891;
        Wed, 25 Nov 2026 00:42:24 -0800 (PST)
Received: from hu-vishsain-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f0457fd68dsm73406645ad.39.2026.11.25.00.42.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 00:42:24 -0800 (PST)
From: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 14:12:03 +0530
Subject: [PATCH] arm64: dts: qcom: eliza-evk: Enable DisplayPort over USB
 Type-C
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261125-eliza_evk_display-v1-1-78a56df97a26@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAFufBmsC/x3MTQqAIBBA4avIrBNyqIiuEiGSUw2JiYL0Q3dPW
 n6L9x5IFJkSDOKBSJkTH75AVQLmzfiVJNtiwBo7pbCV5Pg2mvKuLafgzCUV9q1ZbN1hQ1C6EGn
 h83+O0/t+RQCI92MAAAA=
X-Change-ID: 20261125-eliza_evk_display-1285afd0624e
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Vishnu Saini <vishnu.saini@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795596140; l=2278;
 i=vishnu.saini@oss.qualcomm.com; s=20251113; h=from:subject:message-id;
 bh=md3a/tWXidSrtndwE/grT/xgj6VRbQKUgkD8FPHLiHs=;
 b=rZ0JlKg/QwlQFNNkOcJB15TZyqaJgQllq5ji8B5n/msQDeGRb/aVzD9joizCD14HESs+CzoQM
 qkMLoCwZjIIBIaZ97pRsc7+TERkil+yOaEODce6RJqSSojpk+zOBRaB
X-Developer-Key: i=vishnu.saini@oss.qualcomm.com; a=ed25519;
 pk=8hlXlF8j/3GeOaDK3w2LYhkv9FanCQru0c7kRH/It7k=
X-Proofpoint-ORIG-GUID: 4MiF23a87k0gjIPvK4yXhSN0xhoQQOBe
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDAzNCBTYWx0ZWRfX/KVzQ9HDHZwS
 w7oEIpIMVlyU2NTbet2yzNDkiC9+N0+d/yLrNJg/oYiYEbVON8ql9hPqlGw1ZIF3tlldHwmq9Rw
 +kXfGITg6xXyqKwwRNcM3k9VhY+gEPQ=
X-Proofpoint-GUID: 4MiF23a87k0gjIPvK4yXhSN0xhoQQOBe
X-Authority-Analysis: v=2.4 cv=Vra2kO2n c=1 sm=1 tr=0 ts=6b069f72 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=csN_B1snO4cipFbdybkA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDAzNCBTYWx0ZWRfXxLZ4lbMuTv8u
 BemdWQJW3z0j7qr3TuLqyZtcOTD3l+b1j9L3SjJfmw/TFDndkF4jl68QOI8fshybI7SmEaWY2pI
 yhcLmqLhhiEHODcvHKCmcxkX2B+YFw5p/f6hGHLGtaI3GpeikpXZxhVNi7vg2TcvmAR2pFMIS4Z
 XlIMWD8+GIFgSZoO2EeEtspM1P56GTgGgtg/oTga5x41bH2e7w8067CIA5R7Hy+TEb0yCuGOWhk
 E5AWIZN8NneiXPhx7cdo7P0HKtKJpOeF8MX4Vz6Y/zw6xFp4IOZq/bJ1La2boNhvc/VXvKYlybh
 WuR9lNZkjba6VAyt/Mu7Dl+dDYQ6EnZAaVsGI06zzQz+8BPfBpk0JLstdheuM23cw962rLM67L+
 anqq7fsTFQZ4MysdE5JXV5Xg2mwc4FhuS7zfK9ZMhis94ZzWicxCrKsr0m+jp8nT1A5hCeiWJRG
 4e1Rl20PU5fFsCC4vSg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 clxscore=1015 adultscore=0 phishscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250034

The EVK routes DP0 to a USB Type-C connector driven by pmic_glink.
Enable MDSS and DP0, and describe the SBU path needed for DP alt mode.

An onsemi FSUSB43L10X on the EVK carrier card routes the DP AUX pair
to the connector. Model it as a gpio-sbu-mux, with enable on TLMM 177,
select on TLMM 178, and L17B as its supply.

Wire the pmic_glink SBU port to the mux and mark it as both a mode and
orientation switch, so AUX follows the cable orientation.

Tested with a DP sink on the Type-C port in both cable orientations.

Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza-evk.dtsi | 49 +++++++++++++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza-evk.dtsi b/arch/arm64/boot/dts/qcom/eliza-evk.dtsi
index 02e58a4bc91d..8c663ef6718d 100644
--- a/arch/arm64/boot/dts/qcom/eliza-evk.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza-evk.dtsi
@@ -61,6 +61,35 @@ pmic_glink_ss_in: endpoint {
 						remote-endpoint = <&usb_dp_qmpphy_out>;
 					};
 				};
+
+				port@2 {
+					reg = <2>;
+
+					pmic_glink_sbu: endpoint {
+						remote-endpoint = <&sbu_mux_in>;
+					};
+				};
+			};
+		};
+	};
+
+	sbu_mux: sbu-mux {
+		compatible = "onnn,fsusb43l10x", "gpio-sbu-mux";
+
+		enable-gpios = <&tlmm 177 GPIO_ACTIVE_LOW>;
+		select-gpios = <&tlmm 178 GPIO_ACTIVE_HIGH>;
+
+		vcc-supply = <&vreg_l17b>;
+
+		pinctrl-0 = <&sbu_mux_en_state>, <&sbu_mux_sel_state>;
+		pinctrl-names = "default";
+
+		mode-switch;
+		orientation-switch;
+
+		port {
+			sbu_mux_in: endpoint {
+				remote-endpoint = <&pmic_glink_sbu>;
 			};
 		};
 	};
@@ -491,4 +520,24 @@ m2_w_disable1: m2-w-disable1-state {
 		drive-strength = <2>;
 		bias-pull-up;
 	};
+
+	sbu_mux_en_state: sbu-mux-en-state {
+		pins = "gpio177";
+		function = "gpio";
+		bias-disable;
+	};
+
+	sbu_mux_sel_state: sbu-mux-sel-state {
+		pins = "gpio178";
+		function = "gpio";
+		bias-disable;
+	};
+};
+
+&mdss {
+	status = "okay";
+};
+
+&mdss_dp0 {
+	status = "okay";
 };

---
base-commit: 3191063649dbf7c0d0b768e1f3655e4c5fc6edb5
change-id: 20261125-eliza_evk_display-1285afd0624e

Best regards,
-- 
Vishnu Saini <vishnu.saini@oss.qualcomm.com>

