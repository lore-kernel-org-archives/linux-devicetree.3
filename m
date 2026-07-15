Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A3BD318EF4
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 13:44:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784123081; cv=none; b=a5Iovl2DCwTpIDBNr4gch7IrZn1IuYOtQfUSnW86lXsX/IFodxax42xKgJ3biO6kb+/6/a4m16QSYMzN9uU1fkIrJpg0bE+sC4Fq5AJAFCvrGBRl54TC1OEs4UXGEOo0F1c47vi7TOOjHZF3zYq2volO7JB/fVcTJdsNxihSUmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784123081; c=relaxed/simple;
	bh=0Rq8D/NoyC39EmLSzNVbHI8oYiwR5Wkjwf+f9tdSuzw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=f4HiTEnOv2wxjtz2x2PLgtCh6ixGkozx+WKc7dM/xa7HiDJPC7qOTFs3kxqEgR8kakbTB92i6obBjyKSnp9yK27pxCpfAmspRhu0/b2vl0zGztcErPbrPsIIMYDu8qXr2mjT59vGSOBuHTR9DhbFFuPnYqsWZYz0tvg0AD/0/NY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RhGtwxgK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cFmVx+0y; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RhGtwxgK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cFmVx+0y"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66FBdRED3697847
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 13:44:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hKaEQZIQPMdPO6UTKBRGpr3T8o+KrcRClYBwgH8RUsc=; b=RhGtwxgKt6MHOu/5
	R9FHBAr0CD0adw43yh37Q/Fj2Tby6L7uKWob21vjo5r3LCqse4jAJfWz5q/o4xdE
	H6tXjj9itjuu3l/5OqKtChciciMfetQ+hLAWv6lh2GRo1eqkPJ6PVMdxUHti4Eyh
	YxG+s6+NgCx/N04nrxr+Q15nB09OONmFoxUN5ezBpVC748FLPfqZYYpcshby/9Qt
	NHbOYVh/AUnhB2AwYzFlaKikyn+EzCWvObW3kIH0qpyOgT408F3SYFZma9MjV2mg
	H96qBgje55XWHHTzIxlH/cfEcHEBOemA2wQiOZL8nM1KJzC/jI7VH2mSrM3gAOhj
	arxWAw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fe03vjjh8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 13:44:38 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51bf321d786so27070481cf.1
        for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 06:44:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784123077; x=1784727877; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hKaEQZIQPMdPO6UTKBRGpr3T8o+KrcRClYBwgH8RUsc=;
        b=cFmVx+0ysPl5TOYsAsz6+95hB2DDDUP4gzlW/sUH3K3WJwWtoSUG4ioLik9xPe/EOz
         FYe6hQh4GvriPhqHF7FERB21q8bPU+UqlWkpdeD1F7tvWg2UtApWFlrscT2ofSCG2paz
         vCPICl4bAZa8ZohA1AlZqefd4LImdRuxLNZIyKFgntVw/pPoKsF7NG0z9NtbvVSa62do
         3GZGeecNyVGf5zR3lnaMA0rd3I9/j1cVp/OKumYWpgrw5/fi6YLmxPimNQSHVlnYJ1Rw
         Kqg67XM3A3kSOFgWrBmEN0He/AXcUMoSHA1IQzdi1AV6jsDZdKCNGDAE3jITLsVrc8Y8
         IgFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784123077; x=1784727877;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hKaEQZIQPMdPO6UTKBRGpr3T8o+KrcRClYBwgH8RUsc=;
        b=eqJayg9uZSqldEJ5OnzMOa8O0o41JmgaANhr5zVU5nkBI2Vyn0RhcyDPCvMyr+x6th
         WV5z6mK1sM9V+WWxmJ4f0Gg0C2uOOjM9tzlC3KrekWu5OHwdKfDYFDetE19H5+UYUcO3
         jOI8R3flhNWFvMIOInqoryZQR1BUFaBg+p/HGMQGSepGn/PydYxjYPVndKocNPPgSNJi
         sP+tk0N+nwrBzqzL4yvSd0yvHN1diYMEG1BuoYT3aQN/mT0NyDg2SL5EmF3F/zvpbJeA
         ZZdSn7g0NbcbSO0U84BKy2x6+IIogg+1OPVc2/VN6XFC/USnoDcdBJUhSjsK/DlIqTQB
         Y81Q==
X-Forwarded-Encrypted: i=1; AHgh+RpkxITfMOmyMXtaBaE0pqBzv0QpGWeiKOdcK8PKhtilj7kf9Id2p3I24ecwFYW235e6OYinv95zft41@vger.kernel.org
X-Gm-Message-State: AOJu0YzOLfsIyLoofSKO11tefN3N3PRaqrLy3/uNkJZ1eWL2o67N2s9y
	3V+7KLxlW7fzv8mmeJFRIfKPKW7ducITp2UZ/jPTmHRohZCW48ILsslPrEOpdOsSc0bApq1jhvk
	aQRJ7LzJKjxb3Bdb9aCOJbDfaJojEFQE2HC/25/e/pqH892lf6iGo3jF+AQnLRSgr
X-Gm-Gg: AfdE7cnOSW6zOkFBSy0CuyS9FYM2vM++DKxpqotigGcmUyJVb6gFuK7StdGn4bBB9hS
	ZIMLHpSLZZcFyyKR1+zVSnEMPE4UYgU/bA3XDMGOCK5AcFmKlcg7bnpWEHAYYCR5+NOX3sYgd/y
	Nz86xjuTJr1ZQrO6Q5pasaZ+r6TVQCrK+Av0CtfeTMO6LmWj9I8LvhLCsaBjkNdPMLjXhvpeubR
	x6xKdg9uXjREUtTivNR8pQKzpmxmy0chNLhL5xo5kOt/LqDFY9fnZGDpG1EOvtbZd4sWsfHrcv+
	tmEKQNMHTcLU04+46N9CUV2PQ7F6b8/gvtroilreOtztBXYkH4j4yCtO7dhY9XGHMeFvt4xTe2r
	RSput4JNjySNJ9wBMC2oor1b6KD7uV8eacFqzFZKmiMA+RfqCIGmfT02EJ1BC4Gs5LFG3j/C2/N
	D8JdqK81rZ356erPSzCI9KAw/5L2pyml7yW0UKqezgBRBurJWjpaRV5a3AxSC+VA==
X-Received: by 2002:ac8:5710:0:b0:51c:15c5:2bf7 with SMTP id d75a77b69052e-51cbf05b838mr164820531cf.12.1784123077388;
        Wed, 15 Jul 2026 06:44:37 -0700 (PDT)
X-Received: by 2002:ac8:5710:0:b0:51c:15c5:2bf7 with SMTP id d75a77b69052e-51cbf05b838mr164820171cf.12.1784123076851;
        Wed, 15 Jul 2026 06:44:36 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:751c:d61c:c91:60dd])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69cd28a17d3sm3041215a12.12.2026.07.15.06.44.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 06:44:36 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 15 Jul 2026 15:44:30 +0200
Subject: [PATCH v6 4/4] arm64: dts: monaco-arduino-monza: microcontroller
 LEDs
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260715-monza-leds-v6-4-d1724bb7fe3d@oss.qualcomm.com>
References: <20260715-monza-leds-v6-0-d1724bb7fe3d@oss.qualcomm.com>
In-Reply-To: <20260715-monza-leds-v6-0-d1724bb7fe3d@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=Ife3n2qa c=1 sm=1 tr=0 ts=6a578ec6 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=1BEw5LmG3YzgyHxDt7YA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: 2H24Z3DX6rB4ChMPWzrSxubGwMcI8kAs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDEzNiBTYWx0ZWRfX34ZenyageQNf
 uC0pvMkhQ6Wl1s0OX6wwO4WBIJ49bdmgwrWn3uZY9g2D8ZjyhLOfisd+bFXClptH6gFfVzIhlCK
 e10PFL3Xut7uXysb0ngo0LngYAatFW8K9yBycvQKhFSG+zY/xnuTQvT64j2jfIw1lIBRfnx1Njr
 b1Y2spFfpRiGHJW950+G8hiCdDTkfeTnCjSB/9OakxpBznpFx/LlZYdaWei4WmqLftiMAVbUF6E
 iw432ChnkVU7Kq3MQTMZdhcWKxM2HSHDESIVfOaT7oQkuwyCjVH6f7eJkYAloDUf2lrlvCjeuqz
 5R0czfITLar+hKc1DZFF6cXkN86a0pSYwoCClkR4FVfRAWOZEWlTscNKYKm2Ucngklgei5OysQm
 4uIZU5eDsIIeusc1nNicrqERg65U1C8i94NhmcgoUeMs4nKUHUukUtDLqjw3A2RdaMoG6EkW/3F
 uZu7Ym9MYbEYmEk3FxA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDEzNiBTYWx0ZWRfXzBzmn+2vbWGd
 Zqib9XJU5MnJV1E9jWQMCoB/VKmxVEogH48Rmh8XF4dfuC49pdqkmCYKzeSLzBM17wBZC3jUyYq
 mceniBX2MBXMwzlJ/kxC95C+kulkeLs=
X-Proofpoint-GUID: 2H24Z3DX6rB4ChMPWzrSxubGwMcI8kAs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 bulkscore=0 clxscore=1015 adultscore=0
 impostorscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607150136

Onboard MCU/STM32 implements a led controller compatible with PCA9635.
There are four RGB LEDs controlled via channels 0-2, 3-5, 6-8 and 9-11.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts | 110 ++++++++++++++++++++++
 1 file changed, 110 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts b/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
index 379b796f261f4c8f6b7712c5d340b20be1b9217c..21e32df66667eab2f882731f6ef09b7b6e29e61b 100644
--- a/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
+++ b/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
@@ -7,6 +7,7 @@
 
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/input/input.h>
+#include <dt-bindings/leds/common.h>
 #include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
 
 #include "monaco.dtsi"
@@ -156,6 +157,115 @@ vreg_nvme: regulator-3p3-m2 {
 	};
 };
 
+&cci1 {
+	status = "okay";
+};
+
+&cci1_i2c1 {
+	led-controller@22 {
+		compatible = "nxp,pca9635";
+		reg = <0x22>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		multi-led@0 {
+			reg = <0>;
+			color = <LED_COLOR_ID_RGB>;
+			function = LED_FUNCTION_INDICATOR;
+			function-enumerator = <1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			led@0 {
+				reg = <0>;
+				color = <LED_COLOR_ID_RED>;
+			};
+
+			led@1 {
+				reg = <1>;
+				color = <LED_COLOR_ID_GREEN>;
+			};
+
+			led@2 {
+				reg = <2>;
+				color = <LED_COLOR_ID_BLUE>;
+			};
+		};
+
+		multi-led@1 {
+			reg = <1>;
+			color = <LED_COLOR_ID_RGB>;
+			function = LED_FUNCTION_INDICATOR;
+			function-enumerator = <2>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			led@3 {
+				reg = <3>;
+				color = <LED_COLOR_ID_RED>;
+			};
+
+			led@4 {
+				reg = <4>;
+				color = <LED_COLOR_ID_GREEN>;
+			};
+
+			led@5 {
+				reg = <5>;
+				color = <LED_COLOR_ID_BLUE>;
+			};
+		};
+
+		multi-led@2 {
+			reg = <2>;
+			color = <LED_COLOR_ID_RGB>;
+			function = LED_FUNCTION_INDICATOR;
+			function-enumerator = <3>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			led@6 {
+				reg = <6>;
+				color = <LED_COLOR_ID_RED>;
+			};
+
+			led@7 {
+				reg = <7>;
+				color = <LED_COLOR_ID_GREEN>;
+			};
+
+			led@8 {
+				reg = <8>;
+				color = <LED_COLOR_ID_BLUE>;
+			};
+		};
+
+		multi-led@3 {
+			reg = <3>;
+			color = <LED_COLOR_ID_RGB>;
+			function = LED_FUNCTION_INDICATOR;
+			function-enumerator = <4>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			led@9 {
+				reg = <9>;
+				color = <LED_COLOR_ID_RED>;
+			};
+
+			led@a {
+				reg = <10>;
+				color = <LED_COLOR_ID_GREEN>;
+			};
+
+			led@b {
+				reg = <11>;
+				color = <LED_COLOR_ID_BLUE>;
+			};
+		};
+	};
+};
+
 &ethernet0 {
 	phy-mode = "2500base-x";
 	phy-handle = <&hsgmii_phy0>;

-- 
2.34.1

