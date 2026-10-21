Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792549898;
	b=Z9bv1VOos8isLZZARjV28d51cbRm/UJyo71CRveA63ddE2j+QFmfEfqwmk9mevu7EQRG
	 FTS2SlaQU9TTrFn/PRTKVM2ExabUkVEL44GK71rCEg0kvoUCxgysfOCE1gAbg1gCSgKX4
	 SK7sYjHymaZQCqUvWRS4dCGpQJrK5NnmSstNb/mK1R6m4BlJ1Bf+LELr9rgpnetn6V+e5
	 DtEYED4r5WefdhgcIX8pcEl555+8+cmcNN7jRf8MTvkb8QNTJh5Gf+rCnilo5D6Wz68/Z
	 NlnFWtu1JvdaVopil0s0N6kZaUTa/tGSdG7ooShW0m9Vd/RziV3qP3UHSoLE0D/6w5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792549898;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=IPf7L65c7m++ph0yay7QXokNG5R3RgcbIuZvJZ5kiCg=;
	b=M8W9BrnEsFe4fHSvyiiYYwcm/67hO+Y0XvLiSMJ8oXAmrsmevY4qcdvAwAl7yWydd5U9
	 YI2C0/uXgqyjVQ79a5uGlEuISz7A1kFHi1SnLw2NCOppf//5iOvypoEo+449bYXE5i8gS
	 9D0NWmqkuoUkgLGYrEP68TZhbLmPBLMw9ea0Ipx8qDLJ0qLrkJfOdh9CkzGB69LVTSecA
	 xiuY2FsM5jZpmBcdatugqbMA3rL2XSrCbs/zEWiR1a3orHgAkFTMNEqOhAb/hTJDH/LYH
	 aTOHBLuZt9JLtQph93HWJJHsIBNXmbszU4RnHCEjGwGmCit5Yqz2e/RaE+KMsnRplDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MyGxdhF+;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="Z6txIfg/";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D945E606A31A
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 02:31:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D945E606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MyGxdhF+;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Z6txIfg/
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L2Eu8Z3469263
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 02:31:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=IPf7L65c7m+
	+ph0yay7QXokNG5R3RgcbIuZvJZ5kiCg=; b=MyGxdhF+osJcze3FTvgc7H3l8SW
	2fjo0VMd6xBtn5a1GtgOf5QFJQbE01LybwCVu2uQYDClZo7uODH/UuSQU4Xr6Pel
	jBIYY9aIVNtHpZq3iwpc4O4k4uV+Rpb/MYKo/c97mMt3v/0O5Sx65ADytrgW5KxZ
	pgCb0J1iQEDqTkRspCLCoCUrGFVmlunvNqLNjgD4Xuz0YTpG0ySB1HbhV7ykcFQh
	0nLIF6kxkWp5KUlt1Rur07CStr9DVsApVbUwAsfDCoAt6nm4ytS9sZ9BuOvzyds+
	jblu0gCpD47J3ibV+fGPwtt5LTWOAzghSXfMouiCsVyk+elsagtOruf0XZw==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4he7h2b61g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 02:31:37 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-169846a19aaso31976c88.0
        for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 19:31:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792549896; x=1793154696; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IPf7L65c7m++ph0yay7QXokNG5R3RgcbIuZvJZ5kiCg=;
        b=Z6txIfg/u65BZAec3WmNdyJ+UNhPBV+6e/SNPhXxQmtAZ2mRy3Vk7b6PGxQfVRHLvV
         J27IfxBYjIe7V5V8sSBVzovFmd3UapuBQy9A6e/D5q5mg4kj9TKfj/mfcd+ZrCgk+3PM
         /sic5RfAqxKph/uTa2sY0UwuAD8/FY245AQxWsVIJLGbcv5L6j89xWuRk2GhB6elapPg
         4cBbtXs136TC3nFfX/XszUPv8qXh4tS5k9eSowKeG4waZtDTVo1jQmA9e/DELCdViORE
         TxPz7Ii+8pVjXkyHdPOk9Its7OvQ+Rvzxj65U+JlpEognkiRkwQDzksHFpHBS6NyQssI
         2t6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792549896; x=1793154696;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IPf7L65c7m++ph0yay7QXokNG5R3RgcbIuZvJZ5kiCg=;
        b=K+7X4suXtPoZdSa0KVvfpT8Q1bDC57E+1dKxweuSmbFKhFtVTL7nohmBAjciPRYCdO
         /uAk+mWBk79hzRqilpu+00qdMmyUK2jDbiqDiEEdZKd5EKMbg+4n43bg9fg8Q3zy82as
         xQBd/Kj+g1SHVFySiW4UV7mKP8NiY0rXSlNcXlJ8thSrIvvzKbliHhLm13Wrl4Xx2IRn
         wIb9B62itwOtxzFXAY8ZW/gBo0JJU3VIdw2aqiaUED22nb67fw7OeuA8zWrkPcISS7me
         uTCsNdNTptBvGIsM4BGq6ZG/Ub/Uz3/5Z57BooMa22aaqABVOs/fzripct+SCtPdY4rk
         Dugw==
X-Forwarded-Encrypted: i=1; AKwUvBwDzsZmvDIOS5rAPsJ0fEah8xSpa88qVw5SbRGN/DMWujklx0PQ+b2Gj5vnHTfR+iJ2oD26diUhBRRx@vger.kernel.org
X-Gm-Message-State: AFq9FYJicnM0RJPjBGI0ZUlbSa/gqvoXQ0pyrap84wBFGRowqLxi0zWg
	223fnNjBvXZ126zwufqsNbXe8E20iE3hzpddwJadXSEQQ+fE55pZRBfQVLN8YlxFYfDcvQjvE1k
	iAuvoY+qChN/KseukCgQgZoOllyVjFUlWjbNWm8GuCB+z9CXP8Kgpa7tlI1OUJaqc
X-Gm-Gg: AYBFou2b+fF1OjovNIwzXEI0TIaFBQgprMgR3kbNg/GzhHoGA+g1ReTBNDkbtrmHoyx
	fCdSQb/LvPbMm5pwUO7JjRYWdEP1kRhzdcTpEXuzqtRmSfVrXnhunl3PLn0wh2CuPYF26/IgW4A
	Z2SgcjgqEo2NBqVWWXQSZagEB0FvFyuIKG2tKwETcQNetmcQ66+dGBOoWgYxwVdiPuOFYz0duFI
	HtQstPYqiiTOhwa1aGHJAjfZEv0TXCMSU2/p1N1rGRB13IPHkdK9+cZ6BJMHWortxXR9Rn3i/rZ
	HqK/ZrcGVMs0G1rb4Ur6lBxxNipZdUytC3pUMU6pfoHQl9ObGCQ1jnsw1G3Ox3e6FeF6kFv9ngP
	cgRVbyxsW2N4QAG0EQ/d4UB3UEkhC6Mad9dI8XYdPIicrAru+3tXKtiV+ckY=
X-Received: by 2002:a05:7022:b054:10b0:166:847c:f162 with SMTP id a92af1059eb24-190a8a84d84mr934620c88.45.1792549896477;
        Tue, 20 Oct 2026 19:31:36 -0700 (PDT)
X-Received: by 2002:a05:7022:b054:10b0:166:847c:f162 with SMTP id a92af1059eb24-190a8a84d84mr934602c88.45.1792549895958;
        Tue, 20 Oct 2026 19:31:35 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1903e02901fsm2395108c88.22.2026.10.20.19.31.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 19:31:35 -0700 (PDT)
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
Subject: [PATCH RFC v3 5/5] arm64: dts: qcom: nord-ride-embedded: Add WCN7850 Bluetooth support
Date: Wed, 21 Oct 2026 10:29:20 +0800
Message-ID: <20261021022921.2053957-6-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261021022921.2053957-1-shengchao.guo@oss.qualcomm.com>
References: <20261021022921.2053957-1-shengchao.guo@oss.qualcomm.com>
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
X-Proofpoint-GUID: XbqY_75Fe8TKC8AexTCaRlCGQoXgOdz_
X-Proofpoint-ORIG-GUID: XbqY_75Fe8TKC8AexTCaRlCGQoXgOdz_
X-Authority-Analysis: v=2.4 cv=EuJHPicA c=1 sm=1 tr=0 ts=6ad82409 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=zbc3kRkrEr7k9oJ_x3gA:9 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAwOSBTYWx0ZWRfX1+f1wms+ZbAD
 CZSc61c1rEN9J/vQfEIVuZejM/nxy5Ck45i0wzsjO5o/jZfSEW8788rkLw3lKkRoU91Hdnfb/ng
 Z4dnZc9GveiwLUfFSK4Q/deLEqtygOs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAwOSBTYWx0ZWRfX/2hLqn3lICiM
 v3rUJ6wsWDJ30KMxqd0lCZP1rh03MmMTAOBCGlPcB0br1BQ842/lIdSM0chL0nXSsCTHClcAtQK
 n24ldDlNP/fxMYDS2elxvQTw6uJHbcyQYBllWP/ie3UQOv8F/oajxTrl3Icv74ozuMfA6hHJqvy
 5AB0QZnwFgZDQJc5gEZALGhg6jmbUvVSZDC7TZD7B52nVrPXKKxACfC5BFygnPymFHokJ8XEbx4
 Ud5tNcGDeOQdSNGyZgep9kSgbA48xzQGSr8K07PKtilOQahUj2q/IO3+08ou7PVleUT/GQP1bBv
 Ue/BFtJp7854AebnzEurlEDgaANyYKvQeVx44zJO7yAu0z6GpLUjKcF0S33lTli0pwW/KS6b2Ya
 fkouEpwnV9GiRS5rV7RT6wPR8UghzYJkxKu8KsEGV6zis4Z32j/DEz/xC0tKwyejU0MjJJ91HuV
 KLTI4BLY8ZgFFOlPMCg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 clxscore=1015 spamscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210009

From: Shuai Zhang <shuai.zhang@oss.qualcomm.com>

The WCN7850 module on the connectivity adapter card exposes its HCI
interface on UART17, and BT_EN is routed to pmau0102_e GPIO9.

Hook that GPIO up to the WCN7850 PMU, enable uart17 as serial1, and
describe the Bluetooth controller consuming the PMU outputs.

Signed-off-by: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 .../boot/dts/qcom/nord-ride-embedded.dts      | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts b/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
index 916f583b882a..6dc405ed7ef5 100644
--- a/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
+++ b/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
@@ -18,6 +18,7 @@ / {
 
 	aliases {
 		serial0 = &uart15;
+		serial1 = &uart17;
 	};
 
 	chosen {
@@ -102,6 +103,7 @@ vreg_wcn_core_vh_1p95: regulator-wcn-core-vh-1p95 {
 	wcn7850-pmu {
 		compatible = "qcom,wcn7850-pmu";
 
+		bt-enable-gpios = <&pmau0102_e_gpios 9 GPIO_ACTIVE_HIGH>;
 		wlan-enable-gpios = <&pmau0102_e_gpios 10 GPIO_ACTIVE_HIGH>;
 
 		vdd-supply = <&vreg_wcn_3p3>;
@@ -583,6 +585,23 @@ &uart15 {
 	status = "okay";
 };
 
+&uart17 {
+	status = "okay";
+
+	bluetooth {
+		compatible = "qcom,wcn7850-bt";
+		max-speed = <3200000>;
+
+		vddaon-supply = <&vreg_pmu_aon_0p59>;
+		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
+		vddwlmx-supply = <&vreg_pmu_wlmx_0p85>;
+		vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
+		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
+		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
+		vddrfa1p8-supply = <&vreg_pmu_rfa_1p8>;
+	};
+};
+
 &ufs_mem_hc {
 	reset-gpios = <&tlmm 181 GPIO_ACTIVE_LOW>;
 
-- 
2.43.0

