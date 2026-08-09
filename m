Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CABB305698
	for <devicetree@vger.kernel.org>; Sun,  9 Aug 2026 14:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786284512; cv=none; b=nfmPb+TpZ75ZKQ7o8KgeFxOk6zIEmnw9nsET1sbU1VPEHlSERWms8G+R2QRLrYmzol3YEbIC7Dkxvg4f0CyQhs3BFn6rKlzmR4+8538VwP4FJtxO0/iW+8HzSxVHpaxtsw1CcOIG6cY9QQNzWskaELOGRf9J14CpxGa8QZklYfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786284512; c=relaxed/simple;
	bh=JavzIoARy+ghtdbaLpTk2KQN6M0TF78WaJ7b0GcCGNk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TN8VHeYoyEb9zhsTxMotK4Wb5iQTP2myx2eH2Q2cHH1/pKEu1D8wMDRpCRfbdpzAnMkmtZu9bZi8L6sEETi92OtHMnUKuZtSkNWWDpVVTqBU2j6eprbKzw99JOKfqZudEFiCzB9QykzAPLcaUbF7g7chKfupiICXpeDynpMGBic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P4pQOXcv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hCM4Ygdf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P4pQOXcv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hCM4Ygdf"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 679C2ZIp2732552
	for <devicetree@vger.kernel.org>; Sun, 9 Aug 2026 14:08:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hrQhzCTgkaQMU2fKeLMo35UyvbwinUgYcusy9CpvFUQ=; b=P4pQOXcvxcMlPcd8
	wxd4iJKtf7OEyCIrS4v/ZbOEP5oYqnoOBR2yfR7h6wUUtpu4a97DJgjDen2wOkr6
	xHfMQCOJsloPcUD5yi09yjAerx5QAbfWCzAdN2eCn88uc6CgsZRtJeiMZDdzZxWk
	qf+bbhcQSC4RvLgWFRfnxUqRsK4AqEHaJag/JTiIy55M0hF1RK/cXnv+DwBUhlbS
	0no0tQcBIfsCtIWUyW3S52DoUB1sLU876632NV2AIUOSy85tfern1/X76bLsCrPf
	x8GfZuGmDO4SfOlTBmYbugE4DKADTI10Q7S3i9T9SJTEkItHEDRr0NdEjXtlUyU3
	pEmYTA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fwvp1jx43-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 09 Aug 2026 14:08:30 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cca5e0a0c9so24698455ad.1
        for <devicetree@vger.kernel.org>; Sun, 09 Aug 2026 07:08:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786284510; x=1786889310; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hrQhzCTgkaQMU2fKeLMo35UyvbwinUgYcusy9CpvFUQ=;
        b=hCM4Ygdfxqmoxa7M+PIK1Ja9tvSZoND8liainvWiUL4tQD/qi+T2j6IIAWqDupXWnI
         vZUoMf5VG97NepKusZQMbZQ8EdbkCrmGJ4R6R7/8Ha5R5/FvOWvAC8LsrULz+2sL80hF
         j7Wqb5/ojaZSq0dZupko6pWmym9kdB+0N2Y49E/wZ+TqE1tsOlcrMYmNCO+g2C53clQj
         0AF7ejhmhRCyJ0HfGJG8Bny3bsZYyYDc2J13+YhfJtGlflFc0fQbMolmXUhc3jVlay4j
         71X7TUh4WSunygnn6OP/Ksx1BdH6NyPsM2RMUs/D8gyOvoGEBvCV7xBtjsl8TqQTS5zB
         RWLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786284510; x=1786889310;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hrQhzCTgkaQMU2fKeLMo35UyvbwinUgYcusy9CpvFUQ=;
        b=dmOMKsalXwOqZpaoLeKnt6Dlxi1FHni+zdFe1o3vYzt3JfYbtARcfNQ21il2LcHyO/
         fg2zDQoqZ72rCgmPonqaivsw0qSxCizQl0SA7h/wfxBnaWMR98vbL5BafN8WNyo87AB5
         uPfzPOlDI/yCkLxkBqSGj40aVEZnYpv1sT9i6VlRUMNjDlD+XMByXajK+74oTOgD1gmV
         R8NowhgLogOxe+HxSNXw/9J3j+PNbU5cM9IFki8dOI5WVbHzjRAwBymFUisrMIEh4CZl
         QiJUWU02PW6NFjx51b+8fEUGO95ZWf7YJdNVlGk9B4v0/EuGP7+mv6Ht327xyeOQ8jcH
         LhJg==
X-Forwarded-Encrypted: i=1; AHgh+RqvzfZTzTB/wH+2W6V5Nz+lS21nqzTY4rLvK7MCkdVLuFx4vBUIc1PBMEAUUZfJ0pn/LXxMD5d/NmO5@vger.kernel.org
X-Gm-Message-State: AOJu0Ywd5fVYwBRGNkKllxY4Gas9MR5dji59u0nP/UOparDeeRyhzHtr
	PZrbbPskFEE6v7rAjFUpHxLsvjyVC+fVXgT24yjYY+AqDbHA6HhyLITlGNxMumpDb9wbC5K04UC
	xa4Nyh0XgEeOTZiTg/4OXn1GnWU4oQctFNMmgutkqm218286cgKdXE6QkaAYsoYFt
X-Gm-Gg: AR+sD12HWSGHTEK3FiuGb5nPlt1iurov3IiIey8vENs/i+CARomGPr9aywLCF14s3m6
	8OauV2JN+Wm9Uu/n0tphMS6DZbo5/Fd0GKHwlnom48CP9N6M/YDU7j09FyCe4XyKfz7PiHXltNX
	UbZ067BPJO/NPkL7VEGaDgwJVfxFsbDEqvcELAbDJFl3VKKgR9y0U6ogpxdTVTehIjqkCzKZ7uH
	EY+/EY58gHSCqcQuQpADvPGgcA0UeBx2uip8jNDf5xFBg4REN3r7N1h/9fw/UOXyT+9oyVubLFK
	yCSD7Os4jMPkeFwYrsYdl/IjATC8G3HVWz0Mf7+KdUj1cg/9Rw91WakbWv5zZMVPW15d5IowBms
	bZuBiZT72zoNlEJ1EnvE=
X-Received: by 2002:a17:90b:1347:b0:38e:9045:babe with SMTP id 98e67ed59e1d1-392823376d5mr14889766a91.7.1786284509676;
        Sun, 09 Aug 2026 07:08:29 -0700 (PDT)
X-Received: by 2002:a17:90b:1347:b0:38e:9045:babe with SMTP id 98e67ed59e1d1-392823376d5mr14889703a91.7.1786284509239;
        Sun, 09 Aug 2026 07:08:29 -0700 (PDT)
Received: from [10.213.109.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141019b4eabsm25489437c88.6.2026.08.09.07.08.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 07:08:28 -0700 (PDT)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Date: Sun, 09 Aug 2026 19:37:51 +0530
Subject: [PATCH v5 1/4] arm64: dts: qcom: pm4125: Add VADC and temp alarm
 nodes
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260809-shikra_adc_support-v5-1-bf6882d18bad@oss.qualcomm.com>
References: <20260809-shikra_adc_support-v5-0-bf6882d18bad@oss.qualcomm.com>
In-Reply-To: <20260809-shikra_adc_support-v5-0-bf6882d18bad@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786284499; l=3268;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=JavzIoARy+ghtdbaLpTk2KQN6M0TF78WaJ7b0GcCGNk=;
 b=hDWT6sqdbil+S9ewo3lYCahc24V8qxEdbQrMflav04GHDX2T0wXl2EiqUWIJaVgXYSiZK0fw4
 q/Tg5e7cxdzCLvavnCrBNKEe3iu40G+C0ZCDriRPgWieNF5Kq8IBN8C
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA5MDEyNSBTYWx0ZWRfX84sR5XxGG6UU
 tUplTDvrIe9OjboYqCUkX2ZTFmBxinvPZ0MRQiA5OCrbmazUn6g0Fj805+ny+WTYYnh3LdtFoe8
 ffVoshcKfrYxpnJKd9W/Gwrl9AGUxCdYulZmKaQagnKb37PNg+LLInwK21XGpm+ux39MFEwQcxr
 zOQNQCq8k9jNUwqlL8bOSZl+BT6eH4zX3dar154TKkNgK+pJaghiQX/Utzazo3wtmtdAZ3X9rnA
 oqDtqrram/Ln6pYL3Gnj8yn7/K5X+LVAI9K6Uiy72F6Xc2QmfblWtP9EXo74oktzIdoobL1vQDd
 2J0utVMTwHK0+EvshE62Wy4Qb+AAZi520Pbh6sIwYLKfA0KqqQQcyw2J7UCxUV6FCcqgW21eD7/
 3xfsiKH7iyMztOxLf9rDvALPVBxsl9+ZNAjwuwFeXMa+Q4QHt6tMM5JCCg8azTuzhZUCDZBeObx
 2WKSLKnK/wUw0MiRJMA==
X-Proofpoint-GUID: jKNvXGeO8wULOLOE6askOxCI4EbsVxDa
X-Proofpoint-ORIG-GUID: jKNvXGeO8wULOLOE6askOxCI4EbsVxDa
X-Authority-Analysis: v=2.4 cv=ebgNubEH c=1 sm=1 tr=0 ts=6a7889de cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=32WKvE36LqkSdRhMvAkA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA5MDEyNSBTYWx0ZWRfX0dmDoHwALsn1
 TL3bgM3z6o2Qy5i+uzXzvgO8IHxeF8S6t7Y5X6mb1SUY5ZRyl/tdbTCvBcila3TofMnlIcrFFSH
 sAEAT36PGVZfPWyaXbKaOfVk3v8iD84=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-09_04,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0
 clxscore=1015 adultscore=0 phishscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608090125

Add VADC node with some channels under it, for voltage and
temperature readings. Add temperature alarm node, used for
PMIC thermal mitigation.

Co-developed-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/pm4125.dtsi | 104 +++++++++++++++++++++++++++++++++++
 1 file changed, 104 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pm4125.dtsi b/arch/arm64/boot/dts/qcom/pm4125.dtsi
index 3dc8d667d091..77de9db8c119 100644
--- a/arch/arm64/boot/dts/qcom/pm4125.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm4125.dtsi
@@ -8,6 +8,35 @@
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/spmi/spmi.h>
 
+/ {
+	thermal-zones {
+		pm4125-thermal {
+			polling-delay-passive = <100>;
+			thermal-sensors = <&pm4125_tz>;
+
+			trips {
+				pm4125_trip0: trip0 {
+					temperature = <105000>;
+					hysteresis = <0>;
+					type = "passive";
+				};
+
+				pm4125_trip1: trip1 {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "hot";
+				};
+
+				pm4125_trip2: trip2 {
+					temperature = <155000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+	};
+};
+
 &spmi_bus {
 	pmic@0 {
 		compatible = "qcom,pm2250", "qcom,spmi-pmic";
@@ -65,6 +94,81 @@ pm4125_typec: typec@1500 {
 			status = "disabled";
 		};
 
+		pm4125_tz: temp-alarm@2400 {
+			compatible = "qcom,spmi-temp-alarm";
+			reg = <0x2400>;
+			interrupts = <0x0 0x24 0x0 IRQ_TYPE_EDGE_BOTH>;
+			io-channels = <&pm4125_adc ADC5_DIE_TEMP>;
+			io-channel-names = "thermal";
+			#thermal-sensor-cells = <0>;
+		};
+
+		pm4125_adc: adc@3100 {
+			compatible = "qcom,spmi-adc5";
+			reg = <0x3100>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			#io-channel-cells = <1>;
+			interrupts = <0x0 0x31 0x0 IRQ_TYPE_EDGE_RISING>;
+
+			/* Channel nodes */
+			channel@0 {
+				reg = <ADC5_REF_GND>;
+				label = "ref_gnd";
+				qcom,pre-scaling = <1 1>;
+			};
+
+			channel@1 {
+				reg = <ADC5_1P25VREF>;
+				label = "vref_1p25";
+				qcom,pre-scaling = <1 1>;
+			};
+
+			channel@6 {
+				reg = <ADC5_DIE_TEMP>;
+				label = "die_temp";
+				qcom,pre-scaling = <1 1>;
+			};
+
+			channel@7 {
+				reg = <ADC5_USB_IN_I>;
+				label = "usb_in_i_uv";
+				qcom,pre-scaling = <1 1>;
+			};
+
+			channel@8 {
+				reg = <ADC5_USB_IN_V_16>;
+				label = "usb_in_v_div_16";
+				qcom,pre-scaling = <1 16>;
+			};
+
+			channel@9 {
+				reg = <ADC5_CHG_TEMP>;
+				label = "chg_temp";
+				qcom,pre-scaling = <1 1>;
+			};
+
+			channel@4b {
+				reg = <ADC5_BAT_ID_100K_PU>;
+				label = "bat_id";
+				qcom,ratiometric;
+				qcom,hw-settle-time = <200>;
+				qcom,pre-scaling = <1 1>;
+			};
+
+			channel@83 {
+				reg = <ADC5_VPH_PWR>;
+				label = "vph_pwr";
+				qcom,pre-scaling = <1 3>;
+			};
+
+			channel@84 {
+				reg = <ADC5_VBAT_SNS>;
+				label = "vbat_sns";
+				qcom,pre-scaling = <1 3>;
+			};
+		};
+
 		rtc@6000 {
 			compatible = "qcom,pm8941-rtc";
 			reg = <0x6000>, <0x6100>;

-- 
2.43.0

