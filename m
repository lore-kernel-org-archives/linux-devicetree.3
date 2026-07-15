Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 611333C3BFE
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 07:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784101369; cv=none; b=chELk2kB8rBG8BAyuj2sD9uOCxyjfQJ3eYHZ3z4GDu9pU3+nBDuzOzfrKs3YdN4C6RfYcg3yf5cjYkg1cCEGlh4T1pGpG4y3KcOZCKbAPV8eF1K+c8YAsOTe79PG5xVUA8MLJc8NjSZboarf1MT1JEja0ypRl9lY7AIAfXBe1PU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784101369; c=relaxed/simple;
	bh=JavzIoARy+ghtdbaLpTk2KQN6M0TF78WaJ7b0GcCGNk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mYcXUn28b0IOnzU3AAQ/y9Wg9QyE8QwvE265c+B9qbhAag5YlUiq9bdk3EQcRiNRFrrpqgFFD14GVFW6K39sujFvwEzsFjkoGtmRRpFQoOzmfsDSQyrASla4/eeETwhE+jFGLzbs/cmiwcQLswEPVJ/Uyg3ojfun9AtYboqikSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oy8AevXN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bAbIgFtC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oy8AevXN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bAbIgFtC"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66F3lcZe2597027
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 07:42:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hrQhzCTgkaQMU2fKeLMo35UyvbwinUgYcusy9CpvFUQ=; b=oy8AevXNB0LSISVb
	cX6v0nR5GMqv5EloE3yVpCLVujCK7v/D7N+usuLNkH325G5Fr5DVdnJOvKtoVwFT
	yME+mwOGU/+OKc/3rCTfwVq3d+TKFBIGPNeHJH+BJ8dR51KFqtb1tJipiMUZCZrU
	qbQDbVSzSUl19M9BCDIUHeXLge/kmAUyR10a+sesKw7hrHEq8AX8WRZOB8L40VIO
	91/A42gGSTB7vJECXJaG96fqQ1d4BOM4LCivw/c9JsuKfMj/ovw5fMcYR3ZuvIT7
	NNr4wbWqo9Cj7quPVEgZPal9Q5pjfiJaUEwWaAW4JNvsl2Q0dOOCzrm2VInbLyen
	4iV8iA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fdmjq3vp1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 07:42:47 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c88aab7c1fcso12411876a12.3
        for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 00:42:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784101367; x=1784706167; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hrQhzCTgkaQMU2fKeLMo35UyvbwinUgYcusy9CpvFUQ=;
        b=bAbIgFtCzmdEDhm9qlWkNeJaGcSq8oEdR290TqJjQC/VweUCCszm8T7LypMWJ/cZGD
         q1bCFNyw7IPfWm/XJY3WUaPQAmU38w2qTWx7EsQfVz0bTD6i+oDmK2B7tKPoSKc2K4lN
         p133AFPVk6Lvh+UiSUCvCD8kHZHktFgT92MNnVr6B0S6u179S8FjWW0qKzDDfgAda4Gl
         zSglTvn2uns3mrDZXAyg/ojciflMeknp+ig9/DMw4nibb5OfJGDgjTh3HnWBg2nZNals
         MTnOkCLVwRdDAs1yiYnqJohbDlHW0IYoFooI1QxN0RYy3uul1opxCBBcZeJYgDz3ON9t
         czrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784101367; x=1784706167;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hrQhzCTgkaQMU2fKeLMo35UyvbwinUgYcusy9CpvFUQ=;
        b=QdaL2Z45oUI9WI7R2gx0BZGdzJ7UCkLK56tFmyno/HdV8Y6XTgfVbEDgJYU8xMb4jN
         aEh26VAYgzVlvX3QINAx3OHHo8hTXlnacOZC3W4dWFgUMvIyClS6ZlS8GbuGfPU+citc
         aTUx2omlPxbkA3see9HwzFM5Bra8TZydC5Ebe4fwp8RHfovTzz5GNaGP/1R6j4aM2BNc
         nYvF3lDM6uisHQJIandBhBTXXrhoyo0lJb/XeYpw8EDFw9nvRECIqSQFgudQzWDhkCX9
         JwpRFk0WYKvuSvyOOC4+40Z4Q/p8RY3lFEA8TRQaS7xDz+TJlJDYVhWczPUdP7TBdboa
         pl9A==
X-Forwarded-Encrypted: i=1; AHgh+RrX89lkrFNyZT4bEwDzeqKXkuc59V/M6Lj033P1AihdmNNFsr1+LGdYyPaYtUvL5QU/utNlH3iEf0kU@vger.kernel.org
X-Gm-Message-State: AOJu0YxLJ8/MBYavBR+9XbvR0bY9hE2SU1xXAiPjSUe2hz5nOhUL4Fgo
	e7Bp3oM0IF2UMM7tGCVQ51rTBN2qa8ZjUZ96jJslfiD5DC/BwKue1kNJSThnwhk3YmEyteWofRO
	iFjF5KsDsy97zGRBmQcqPV6yqiuuz/u6znUiUlSkUBs7c4nl5BsVo3o7tcBKgOR0x
X-Gm-Gg: AfdE7cnQgUeNeOSC5gI95s4GGyciL0y1rqkM8JqbKwuD/F3ZBSXZQoJdiIrWf2R8EXk
	WgYkBfIb2i7sGX6AOcA+zDPhpYGApNRhT342YkXE+qW79bZdr6SAUebtc6LWUjdDPj/wBAIHCrP
	t8Emp5DWGx2KCkupsvGPLHTX991VxC6faaCwQtckb+AjUvYcNngLdxaJKnZVNs/tvWqdCjNrL0+
	iFYtbsx/4r36P9/hmm8Z0uaaPp+Sylj87+NdmoTwCK4GcFAOgCTHBjQ4dtfIWKfkX5FKOTpLI75
	+H5hIo5brae6rPEV2T1Ejo33eaX6o8UfcyYr3ekig66mLZs3hzDddH8IeRxMexnVp9U5oPUB3YU
	bHXMl1BZGMDrSVoIbPvGU6oS4AGHYzg==
X-Received: by 2002:a05:6a21:6b88:b0:39b:8905:4e13 with SMTP id adf61e73a8af0-3c356f75e9cmr6753656637.6.1784101366919;
        Wed, 15 Jul 2026 00:42:46 -0700 (PDT)
X-Received: by 2002:a05:6a21:6b88:b0:39b:8905:4e13 with SMTP id adf61e73a8af0-3c356f75e9cmr6753633637.6.1784101366495;
        Wed, 15 Jul 2026 00:42:46 -0700 (PDT)
Received: from [10.213.109.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca5af7d58e8sm10921751a12.2.2026.07.15.00.42.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 00:42:46 -0700 (PDT)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Date: Wed, 15 Jul 2026 13:12:21 +0530
Subject: [PATCH v4 1/4] arm64: dts: qcom: pm4125: Add VADC and temp alarm
 nodes
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260715-shikra_adc_support-v4-1-5e07b6d21429@oss.qualcomm.com>
References: <20260715-shikra_adc_support-v4-0-5e07b6d21429@oss.qualcomm.com>
In-Reply-To: <20260715-shikra_adc_support-v4-0-5e07b6d21429@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784101358; l=3268;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=JavzIoARy+ghtdbaLpTk2KQN6M0TF78WaJ7b0GcCGNk=;
 b=c9rZgnxZkorBvD/E85VNY3RxRUY8iuaqbn8uR5QIEmbZz64gE8NkFsn160wML2HVcfZG9tNVS
 usbtQcjVrkLCyG58j8XH7XOZtZGUOSGsMY4ellWfzgVYSvSbILk+jle
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Authority-Analysis: v=2.4 cv=LqmiDHdc c=1 sm=1 tr=0 ts=6a5739f7 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=32WKvE36LqkSdRhMvAkA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: rcZmjjlEkZwnbdEyv08r9RC2rUn3SSKm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDA3MyBTYWx0ZWRfX0TBoRwq5hpS5
 /cOzocOGt/nOKcy6JEFpURJ3i/nQvmFYlHkd/8Q/85xWPz3ijDd+HIXCH7wNj4anDb3g9+yXmL1
 iSBLqm+ovDWpZ7EHvmvjxDl/JLf9i2MC3Es/cEIbRgy2x5HJ6BSdCuY89vRgt/rjyn0OlfonTGG
 XiQdEIKHbMhW2jeAXim/XFFMFzVp6Fr8zcgKeAJTqMAJZGidl4iDUsyPeEohpudQdnEpGJ+GDzX
 BJl8pmChS8LeVP53RzoqXpzroeE9X+SiNbu3QBPrq+BgxLZyEiLA4pgsXO4Bj0CeBP6Vx3Coe9C
 Gf5FiuNndUDFMhuR4B0kcrEisPciNQjGVFyEt0iK9AmY+ltQumT7SMUekC3yQUmLWEaikOf7QYz
 5qzPp6Z9k2zO7oK2qAt0oBxNsmkOiL9LLJ0IvOxNRwKskT9p4eU15ZZU2Awz6BX7wzdtnXpU4BQ
 gdcR/Ih0UJBC29bCmtA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDA3MyBTYWx0ZWRfX39xHyNFl6u4Y
 69zq7GWbvpwQxDrsm4iaRv8G9z2nYBHU4nMSorAHIabeZI6kV5HsGgDkQNsj3dQe8tU5S0amJCL
 xqwqmSYdbYNLKa0nxyzogFAE/ofSQFw=
X-Proofpoint-ORIG-GUID: rcZmjjlEkZwnbdEyv08r9RC2rUn3SSKm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_02,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0 spamscore=0
 bulkscore=0 clxscore=1015 adultscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607150073

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

