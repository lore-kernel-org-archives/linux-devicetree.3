Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793714129;
	b=Jmkep+XlJ7I+l0dxyAzD7ti45oHoBY9J5u2Zg/9MHUbHFfu8qQ1BWeqbbWEuqUirLbwK
	 fNJlqDgwbq+eRUKuGM+zYF2u9WorG5SW3KGmlL0eEggPblSadCfxCwor6Mx0sbDRStiO8
	 Vjs0J9ylDUH9s5mDjsCRA58wen2YiqedO7i86Y8q5Po66eukysx6EH3Q6yfgwPnBly1Uo
	 JQ9eHK2p+DGBzoP6lyNqHA459r720SaNFW+T9geAJ9Nh0nKuU/lipSOAqApT6EyjLHYTH
	 Tl7/qUt7aZF5VIC6mX1AAo73wSO46SDV2yixXOV5Itkgt1wLhAB1rm+xlqx5gnRG2aw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793714129;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=RGGoVzwW2HDCBFK5VU/M78LyYufR0TxxxGZE9yW4Y+4=;
	b=EXzHfQXv/wE6AlsLv5C5MSU+Kml0GJcnVIzeG3BWavtSvfxuPNODyJPbkkuPUB5tnXIA
	 WSiaSk2FV/KMTM4uOEuNr5AaYS0ij/VuUTm0Gmpn760QpXhIWhAIXCoAoOOusO5XnfJ57
	 6mEOpqDegPCFuKzDKt4YtXIUsf/CjnR4l26rFoF1Xsun6hH3c1dk8PYFqMdFiRP72IQmd
	 QX9eFY486cVee8KanpZ7hyJBGzpzGot4Zbb8Zr2qFNQ5tPJmyS8aQdhydJtKg1DhwCaCb
	 JgKvtqKm8b3iHXqSoP+OCf5gJaWGvZZ5b9xZsnJZIbt7U1kli3ETAcWSizpK8rqX+8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZUyVn7yx;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OalehvIf;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 564D5606A33F
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 13:55:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 564D5606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZUyVn7yx;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OalehvIf
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3DZA8k3612386
	for <devicetree@vger.kernel.org>; Tue, 3 Nov 2026 13:55:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=RGGoVzwW2HD
	CBFK5VU/M78LyYufR0TxxxGZE9yW4Y+4=; b=ZUyVn7yx1DGfe8xEYm54nuNmeO3
	MFJZ56jKEdaT56voVowdDVggi/TdxMyHa6ZKws21z+vasBBKIMp/OXs8b8Gfng3Y
	wSkhLXfEaj/52NAxU4UkzNQMKCQnAbU/nWpwWDmIN5hNae4TAVP46buxP+oYO8hk
	XtM5mGvJ89tQfRThyGOU4GXcxcJRYU/G+iMt1Fgm3d0xa4sZChMclkS85pAR86lE
	q4v0/FBGZZUsyi5FY6nxDeJeeHoDUOfzk6O9BAMX9hSs+RA/1RfKlZOi0SUj5ukL
	UozxWlTg2TcHEWGmlyvqHHhthfkTxcqRKWr/X3C/a/EUVYfv/riZhAM7mdQ==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq6m9ahsr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 03 Nov 2026 13:55:27 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-14373747468so5530603c88.1
        for <devicetree@vger.kernel.org>; Tue, 03 Nov 2026 05:55:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793714126; x=1794318926; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RGGoVzwW2HDCBFK5VU/M78LyYufR0TxxxGZE9yW4Y+4=;
        b=OalehvIfTb0t6VH0bxbF9A1MkUdfbbsNSO/Gkhup9pHKCtSMXyqVOu+ajkx7FY69Pc
         kNBBQXIdjUtkizRodLXFO3z4ptJ1najvNWSD8+R/TbSPqvB7IQkRTBFrNXNDutC+Scxb
         KbHw/Go+tVA9Hoq3UvpLIKl2z9gias7Wtz7AcjhWA8dSqhT5THYahEAAQ92+qD8lOgto
         LhMzEVaKkImuYo9kpuV1hdJ/azGkLpDvZgx68QOPA2BdU42i4PYzyTLTcaYsFJoweqrM
         509J8pITrc+Cq1mWnKD3T148QcxriVuAc4B8dYvfboCTL8zWgABOOK0NLon9ohDyJBct
         lMWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793714126; x=1794318926;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RGGoVzwW2HDCBFK5VU/M78LyYufR0TxxxGZE9yW4Y+4=;
        b=MpVSIdusep1Utr9Hg1+P/ZwE6oTRpoUHJqubW8RJFrfIuHrSZdS+0C2VVxAVETStvA
         oDIzB5PQqwfs0WRwjZJScxz2myBcQafgPe92lQMZxkUef+HnY+5Cx3+ux615NnPqFyvd
         WiSz/v8F4mPp/6OR7vwWKrV+1W9ct4CKAx37uRroGKs/VGE2rmRxhI6g4fSUrT7C0Xpm
         fKGvd8SdqDDZkgvFXW+CrdxH6FBsn8BxUtdi2E9N1bne7Bt/L1RjlBGr2rhqzMo9aLs6
         BwStwaDI4sUHfLCqrBdOkRNwscSoa/+x7lAbrcD8wiMusdkFZ4gxbK7sG2Rd1Y7k1CJu
         OC1g==
X-Forwarded-Encrypted: i=1; AKwUvBxGto5lzrTQpEYBXnnjr98sfNTrRkCX37/Tp+eLFZ9+QydZHehkk++dzuf9DtSm+TqTmvZbSUWY9jmd@vger.kernel.org
X-Gm-Message-State: APuU4Z+n0v/ZSuVqJAVpru/mPfRTRHykjclR+wHTPJa4NR68bU6Gy3yb
	q8w2R85UdUufYAnzAwUsKTOfEtOgZU4ZHYkcWIvzflMCzwQrPZUov3dbyQ6tWPbuG8JqmVbFZQC
	2A4f1Z4JapOM0J+HM/uMZDKGONzq7w9n9A3NxpdNBc73F2tgPPTeHdvDy8+7Nnj4d
X-Gm-Gg: AYBFou0HoaNI/jBZi8GngbbWf5KQBljtPOOQNLjGUymnTYlbbSIoT1iD+5qlJxFfg79
	snbjyjNCUsdsLh5B72lXQDW7hBsIZ+fzfCKN2JUFoVdOnRWxFdrgiHKctJBsJQlIZGv+7Tcg2qs
	CocxBpjowzmmHyHF7bnI1HgRYFDkSrJ+/eIPxFHQ4jfmZ6hQxXmgcUFnEz+ZwTkbbgwqFJVYSQH
	384/3VMC8TddgPP5TKvmM8+bGgSNRt/ZUuHsEf0kDxcfktNoBUWjq8+6DGXWFkp0E6DAaf+SYjZ
	xFs6lLfpC3bzADfoQZ0zAwV8Q5bUCTTXrYaOIBDYa4dbo90W/YtwJGNRt4BBAjZAnZIRhV+8jQO
	WEA6I3QyX+qrwvZHyVSLr4qYwqE/+cmPJeppUajKdJXj4xkn0K2nymtBPnkY6ahnokEi6MTFtrR
	s6H6hO96ILbpq+zN9wPJt76SnOQ4RlEIrB
X-Received: by 2002:a05:7022:eb42:20b0:190:3950:43e2 with SMTP id a92af1059eb24-1ac5a0b8867mr19874626c88.8.1793714125888;
        Tue, 03 Nov 2026 05:55:25 -0800 (PST)
X-Received: by 2002:a05:7022:eb42:20b0:190:3950:43e2 with SMTP id a92af1059eb24-1ac5a0b8867mr19874579c88.8.1793714125241;
        Tue, 03 Nov 2026 05:55:25 -0800 (PST)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac1a9e2ed3sm41634001c88.19.2026.11.03.05.55.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 05:55:24 -0800 (PST)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Dhruvin Rajpura <dhruvin.rajpura@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH RFC v2 1/2] arm64: dts: qcom: nord-ride-embedded: Add PMIC ADC thermistor channels
Date: Tue,  3 Nov 2026 21:54:44 +0800
Message-ID: <20261103135445.2049110-2-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261103135445.2049110-1-shengchao.guo@oss.qualcomm.com>
References: <20261103135445.2049110-1-shengchao.guo@oss.qualcomm.com>
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
X-Proofpoint-GUID: M6BeCJARPsxHrcw89G4glBkIEXWy5yCB
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA1NSBTYWx0ZWRfX7YBn+aWir9xh
 0bFtZs8Oi3N7/FHqCwQcws99G3lxJbejPYr5/iOoNBCSNFsPyeZwThF0DO9v77polW4Iw+e8pLg
 2ZClD3mWZF/H8u4mKXrgAU+q6EOV7kg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA1NSBTYWx0ZWRfX7enwv1wR929Z
 NPPRbNmprRkRqAe4WZylkGJ3MbFukAXDtRqAsetBCq5eX52x3fRtTzJsL2WNy1uwZnGchoaxBTf
 5l/UTJGOz/Y3k5GZC1DCRcrWmvyTUxTjmug4aIg90IonBPP+UsrK84Ww0K4gAwXwhJLZpXAnKUI
 d5vX3G1sa+6A4nnvtT3Ls//zhyKp4GC5JVBElQ8L9//8xP2YcPX1pSrVLBwT/eKDC+I58JYg5zD
 PMZYt65qb9TEkMHEblSwGxt0ekt/r6oEbBhZ5TYkc8lImQsXlSW5mGWVsl/JWKpdSN8ybLQvj5D
 khxDaZi34FOYpGkvnzhziNxuugBrxZ1e7o5kRQtiemwFsa3MkAxJK0752mKA7fUwbURgmfU1iIi
 WDax+a3LO+Q4siKGgzAavhX/fPC0I+Oh2lyWPb5zkcq2hZpa1A+Rdp5Bd+xGiOi0C0fT2mjQc7b
 Njr2dUXclMaMNYyER6w==
X-Authority-Analysis: v=2.4 cv=C7B8WgP+ c=1 sm=1 tr=0 ts=6ae9e7cf cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=TEmDzvwZ9EAiO1TzxhoA:9 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-ORIG-GUID: M6BeCJARPsxHrcw89G4glBkIEXWy5yCB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_02,2026-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 phishscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030055

From: Dhruvin Rajpura <dhruvin.rajpura@oss.qualcomm.com>

The PMAU0102 (Kai_MV) ADC5 Gen3 controllers only expose the
REF_GND/1P25VREF/DIE_TEMP calibration channels, so no board thermistor
feeds the thermal framework.

On Nord Ride, three Kai AMUX pins are wired to thermistors: Kai
instance E's AMUX1 (SDRAM3 THERM) and Kai instance I's AMUX1/AMUX2
(SDRAM1 THERM, UFS THERM). The remaining Kai AMUX pins monitor voltage
rails.

Mark all Kai ADCs as thermal sensor providers in the PMIC dtsi, as it
is a PMIC capability, and describe the thermistor channels with
qcom,adc-tm and their thermal zones in the board DT, since the wiring
is board specific.

Signed-off-by: Dhruvin Rajpura <dhruvin.rajpura@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 .../boot/dts/qcom/nord-ride-embedded.dts      | 84 +++++++++++++++++++
 arch/arm64/boot/dts/qcom/pmau0102-nord.dtsi   |  8 ++
 2 files changed, 92 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts b/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
index 49635695f832..550cd7fe0ac1 100644
--- a/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
+++ b/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
@@ -53,6 +53,62 @@ bi_tcxo_ao_div2: bi-tcxo-ao-div2-clk {
 			clock-div = <2>;
 		};
 	};
+
+	thermal-zones {
+		sdram3_thermal: sdram3-thermal {
+			thermal-sensors = <&pmau0102_e_adc ADC5_GEN3_AMUX1_THM_100K_PU(4)>;
+
+			trips {
+				trip0 {
+					temperature = <70000>;
+					hysteresis = <2000>;
+					type = "hot";
+				};
+
+				trip1 {
+					temperature = <90000>;
+					hysteresis = <2000>;
+					type = "hot";
+				};
+			};
+		};
+
+		sdram1_thermal: sdram1-thermal {
+			thermal-sensors = <&pmau0102_i_adc ADC5_GEN3_AMUX1_THM_100K_PU(8)>;
+
+			trips {
+				trip0 {
+					temperature = <70000>;
+					hysteresis = <2000>;
+					type = "hot";
+				};
+
+				trip1 {
+					temperature = <90000>;
+					hysteresis = <2000>;
+					type = "hot";
+				};
+			};
+		};
+
+		ufs_thermal: ufs-thermal {
+			thermal-sensors = <&pmau0102_i_adc ADC5_GEN3_AMUX2_THM_100K_PU(8)>;
+
+			trips {
+				trip0 {
+					temperature = <70000>;
+					hysteresis = <2000>;
+					type = "hot";
+				};
+
+				trip1 {
+					temperature = <90000>;
+					hysteresis = <2000>;
+					type = "hot";
+				};
+			};
+		};
+	};
 };
 
 &apps_rsc {
@@ -366,6 +422,34 @@ vreg_l3l_1p8: ldo3 {
 	};
 };
 
+&pmau0102_e_adc {
+	channel@444 {
+		reg = <ADC5_GEN3_AMUX1_THM_100K_PU(4)>;
+		label = "pmau0102_e_sdram3_therm";
+		qcom,ratiometric;
+		qcom,hw-settle-time = <200>;
+		qcom,adc-tm;
+	};
+};
+
+&pmau0102_i_adc {
+	channel@844 {
+		reg = <ADC5_GEN3_AMUX1_THM_100K_PU(8)>;
+		label = "pmau0102_i_sdram1_therm";
+		qcom,ratiometric;
+		qcom,hw-settle-time = <200>;
+		qcom,adc-tm;
+	};
+
+	channel@845 {
+		reg = <ADC5_GEN3_AMUX2_THM_100K_PU(8)>;
+		label = "pmau0102_i_ufs_therm";
+		qcom,ratiometric;
+		qcom,hw-settle-time = <200>;
+		qcom,adc-tm;
+	};
+};
+
 &qupv3_0 {
 	firmware-name = "qcom/nord/qupv3fw.elf";
 
diff --git a/arch/arm64/boot/dts/qcom/pmau0102-nord.dtsi b/arch/arm64/boot/dts/qcom/pmau0102-nord.dtsi
index 47ea145f4abb..26c4d126a23b 100644
--- a/arch/arm64/boot/dts/qcom/pmau0102-nord.dtsi
+++ b/arch/arm64/boot/dts/qcom/pmau0102-nord.dtsi
@@ -31,6 +31,7 @@ pmau0102_e_adc: adc@7200 {
 			#size-cells = <0>;
 			interrupts-extended = <&spmi_bus 0x4 0x72 0x1 IRQ_TYPE_EDGE_RISING>;
 			#io-channel-cells = <1>;
+			#thermal-sensor-cells = <1>;
 
 			channel@400 {
 				reg = <ADC5_GEN3_REF_GND(4)>;
@@ -84,6 +85,7 @@ pmau0102_f_adc: adc@7200 {
 			#size-cells = <0>;
 			interrupts-extended = <&spmi_bus 0x5 0x72 0x1 IRQ_TYPE_EDGE_RISING>;
 			#io-channel-cells = <1>;
+			#thermal-sensor-cells = <1>;
 
 			channel@500 {
 				reg = <ADC5_GEN3_REF_GND(5)>;
@@ -137,6 +139,7 @@ pmau0102_g_adc: adc@7200 {
 			#size-cells = <0>;
 			interrupts-extended = <&spmi_bus 0x6 0x72 0x1 IRQ_TYPE_EDGE_RISING>;
 			#io-channel-cells = <1>;
+			#thermal-sensor-cells = <1>;
 
 			channel@600 {
 				reg = <ADC5_GEN3_REF_GND(6)>;
@@ -190,6 +193,7 @@ pmau0102_h_adc: adc@7200 {
 			#size-cells = <0>;
 			interrupts-extended = <&spmi_bus 0x7 0x72 0x1 IRQ_TYPE_EDGE_RISING>;
 			#io-channel-cells = <1>;
+			#thermal-sensor-cells = <1>;
 
 			channel@700 {
 				reg = <ADC5_GEN3_REF_GND(7)>;
@@ -243,6 +247,7 @@ pmau0102_i_adc: adc@7200 {
 			#size-cells = <0>;
 			interrupts-extended = <&spmi_bus 0x8 0x72 0x1 IRQ_TYPE_EDGE_RISING>;
 			#io-channel-cells = <1>;
+			#thermal-sensor-cells = <1>;
 
 			channel@800 {
 				reg = <ADC5_GEN3_REF_GND(8)>;
@@ -296,6 +301,7 @@ pmau0102_j_adc: adc@7200 {
 			#size-cells = <0>;
 			interrupts-extended = <&spmi_bus 0x9 0x72 0x1 IRQ_TYPE_EDGE_RISING>;
 			#io-channel-cells = <1>;
+			#thermal-sensor-cells = <1>;
 
 			channel@900 {
 				reg = <ADC5_GEN3_REF_GND(9)>;
@@ -349,6 +355,7 @@ pmau0102_k_adc: adc@7200 {
 			#size-cells = <0>;
 			interrupts-extended = <&spmi_bus 0xa 0x72 0x1 IRQ_TYPE_EDGE_RISING>;
 			#io-channel-cells = <1>;
+			#thermal-sensor-cells = <1>;
 
 			channel@a00 {
 				reg = <ADC5_GEN3_REF_GND(0xa)>;
@@ -402,6 +409,7 @@ pmau0102_l_adc: adc@7200 {
 			#size-cells = <0>;
 			interrupts-extended = <&spmi_bus 0xb 0x72 0x1 IRQ_TYPE_EDGE_RISING>;
 			#io-channel-cells = <1>;
+			#thermal-sensor-cells = <1>;
 
 			channel@b00 {
 				reg = <ADC5_GEN3_REF_GND(0xb)>;
-- 
2.43.0

