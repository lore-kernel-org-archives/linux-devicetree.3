Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 253B7414A1D
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 09:39:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783330803; cv=none; b=YzgidIbqtc1ob5T398J8GtvKgpm5NlSxHKg0NNlqzhkzKALnkAQvFl/rxzXtd56wGiUHTV5gERxUn7BQRRasIXoF1V3C3AxXgoKQzLr7834nD6q4Lf7EbAkijxlavybJzy7wncVO82hNwk72UraW/WsTzPHACd5oBy+Sv0bZdA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783330803; c=relaxed/simple;
	bh=LxlS3E3mNrtdxsceGqW1lsF8W4zsoxq5R9yc72NCSzI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Od+oJK2Jywjo3hZGcYn22PiqV7jCR6Bg2YWGruvvQM7jPxYJ2xMt0Dw8faFBEpI12E1n+huAmivVLXggMSdDuu/mGBRsRi9Ow3B5Nr5vIhfCRqDQPho87fMvWx1lKUOSj4oLuBpQdOD0FLGuFeF7PH/TfzhADflh417sqsevLuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M4chQsXn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VThkqbSE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M4chQsXn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VThkqbSE"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66694Erx128052
	for <devicetree@vger.kernel.org>; Mon, 6 Jul 2026 09:39:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	czL710Wv/g2HtcHzdNl50hDpmkXZJd2MNATcvBBHJys=; b=M4chQsXnhZVNE35h
	xsHoUunqMp8b3b5jcclfINFqLxKHdnrmcFIvTNMOS6MDRjlij2mgnYri2cTFrEgS
	sm3ENLE8OJoQ61jveqoSa0jCHZ/in8pqooRigKDMDTzR1e3egEf8Wpb9uUA21yFZ
	pCn8XMNTUEcrfVKFBLF4ethQnm1r4VdzhpOWCUzTllt6f66CPnf7Nml1glNSbDZ+
	QLc2ICx1ezpxbBqp06iNZyEJREBegIoZczc7teUx7u9UFzf0bs0Uj9UndaV1Th2w
	ypP+juozCLzhTOi/h204+mgz+eWbna0EAF5G8V2A7XbnY4MAcRo/fA8lGMTcFyQm
	syJ9UQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6srvnn9d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 09:39:56 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8ee2847cbd4so32734416d6.3
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 02:39:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783330796; x=1783935596; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=czL710Wv/g2HtcHzdNl50hDpmkXZJd2MNATcvBBHJys=;
        b=VThkqbSEZY8cVP5SVUTn3Fkr/7opy/DlFekigR9q2lEQ3qWEgm6s2k0Aln6BuL8hzO
         HL/MrMShWG2zXCKcuFUJvUIUha/He1dHKk7dMrMI+C4MUYd3dDoXUWU9K13CMGKizbWu
         2ls1qXqkpTH23wIMFya5dZNwD1jhzt8LKeaiLwy3y6x71linaGEAyxvuTTo6wLEW1hHf
         91tAQoqAUQD07jFQ9SBsqzzf6j9nAbnKc900F5d6/NRbL2g8XeQ3O77SaoxQJyhETS/V
         ixvpMd0+4y/4sU6l5kxtlaFQ5fZJMhoNRkbi2qb7ncTqizgMc8mDPvtcVxyWksRH3JnG
         CpaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783330796; x=1783935596;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=czL710Wv/g2HtcHzdNl50hDpmkXZJd2MNATcvBBHJys=;
        b=M79fp/Xx3yHxMLOaaqhlRmzRfKLlhv3JlZwcZNptF5FT2icbC56UR06ud5paKlZK+Q
         GZaa4qx0FJprZk1HpKGxWoFT7Ndua1NftdkiQ3RUnQPz59Z/7143iLcLH1uu6cYd6P9g
         9Oj+WYV/GnswH99prNGVzqCgwQEZ9z88B0dhsWpU2ipRDWDz/LtrXeiYmq1xIU6/4cws
         00YqkA9TUzHuYyrt0R2NtRfc6Ucbefg3ZAQHyuXCHdKDgLNv09bbCS2JXhca9bMWQyqN
         sxUmzBHz4v4YUW16EfW+6Ip62XZcvgvRYGWq2pQoECpDqDLKZ0gD500/w+nvauj7D4BF
         KcxQ==
X-Forwarded-Encrypted: i=1; AHgh+RpstnbPVtvJF92k1HN0LwCMerePDo3n4/2fDyElKkE9h9EThL9qJoTeTh+kc8n4Rubkya51RAPiYPc9@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2Vsp6hRVsLIMijvLJT6qBsM478u3o4OHjT8sBIynnAvORHLJ9
	UybWjvH+HOugh95dURZsBWhlDOUxWWQcFY4Ms88wTp5nNVquU+KYaozZRz2gxVFZi1THNF2vBth
	szVzCSYoyMp9D8v9Y3csEqS68Ue2MA2Deg2k1LeN4gmGq5E+lnLNlLSxu+smLinI9
X-Gm-Gg: AfdE7cmdP8ITZieqwQCUep/vl3u9BnvVD/HbVYxl6wz0JmrUPAAaNGPGvsnlAa/nYOf
	89edxp2scA9g9NwrZe1yw9Q2b3f+duaIO2IS74lt3OR2MuSGWt7w928F+kSVBkr/oKgXackQw3u
	FGVfgz/4g8hgPwVUcwZRzdawdJu5QrHKPHYzu9BFR6EJlfReDtRIpYCr5F9ReMUUkFVBYEpqT8K
	AHazm3u6+25rq5Co6Qpi7wkj28r5vzY/cMZ5VgE08Q/lLdTOx8oym+A1b/NvsJFQpOtD35yES1F
	WvzurJ0SNY1GbSaqdKhk8kU/QNOI94+XhDELehGPKMM67E28NXxCszFO/u7MTIX64QOSyZZ0hLT
	e0SfIrMFpLTgkkND/uL01KJxUH/UOu07r+1I=
X-Received: by 2002:a05:620a:4609:b0:916:14f5:8866 with SMTP id af79cd13be357-92e9a3869demr1295854585a.16.1783330795917;
        Mon, 06 Jul 2026 02:39:55 -0700 (PDT)
X-Received: by 2002:a05:620a:4609:b0:916:14f5:8866 with SMTP id af79cd13be357-92e9a3869demr1295851385a.16.1783330795470;
        Mon, 06 Jul 2026 02:39:55 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493ccdb566csm259144095e9.7.2026.07.06.02.39.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 02:39:54 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Mon, 06 Jul 2026 11:39:44 +0200
Subject: [PATCH v2 1/4] arm64: dts: qcom: Use hyphen in node names
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-dts-qcom-style-checker-v2-1-90c781ae0417@oss.qualcomm.com>
References: <20260706-dts-qcom-style-checker-v2-0-90c781ae0417@oss.qualcomm.com>
In-Reply-To: <20260706-dts-qcom-style-checker-v2-0-90c781ae0417@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5522;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=LxlS3E3mNrtdxsceGqW1lsF8W4zsoxq5R9yc72NCSzI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqS3fkE6txADvQHBX9mcSFfbDwsqs30PMgHuRbK
 MtFOcheUOGJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCakt35AAKCRDBN2bmhouD
 17+5EACB4xSEBKH+pXnF2ZaSBerU5MoZLRTtsr1YqyDCuAsH3V4uAwXmHlh4qq4u6f4JqAQMpk3
 nqS7Judr+nkWRlNa1aIY+3jWtIa1zPk0RgjA+he9peZ2jae1nuGbnhQ07jf36i6x+MC3EfHDNR6
 /6Y504LiAqEkp5QMaWpEl6EnK5I6GcsYKHHdz1fGwbjzmCeTKkku91ioP+TE12npa2LvH2RwWZ9
 gGhuGOJrxk6+8mEJPF36dyf+kbqBH15Rh08gYW3mS1pofTXWjeDHvx8dC2rC7MZEe9FHgfARosc
 OREift2XS+E1mRESvBeGEI+pi2Hgw1O5Lv4UgydeKKo9NrG3zxhrNEYPvP0v4pfJ90lBFxs/Uxl
 DO8T6lEUONbNh/szFDgQn4zgY+eO0qhFns8XJKs8E/3POdmBtAGw3YpIxUcbG+/bUfLDmO+GNLd
 cM1hbASUQWfF+uPcEHnqt5f2PX3iXcVI/bSCiVVurizHvh3F9VOY3ZVAn8ShT1iPVg7UpQ45P36
 Wa8PNoS1NNJvI1Fyt47OaBSGOZ4rT5Vb0nvZqfi43rAQUDGEal2IqRwc7vQyA05d+LiNzL1Fl5D
 aI/DpKv8BZrIFN0OaltHOPCU5G8qIba4KGhE0Iv9Lyo9DpbSKO2G+1N6Jm1ZUcIiUmO6egJ4DMd
 wEyBdpnNtrgOtXw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=TcamcxQh c=1 sm=1 tr=0 ts=6a4b77ec cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=hdEaa9rgLK1xy9maSvcA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: rMr3HRHsKuztPSsPkBzezNSxWOI624VL
X-Proofpoint-GUID: rMr3HRHsKuztPSsPkBzezNSxWOI624VL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA5NyBTYWx0ZWRfX4q2MKZ2v7QZX
 tNIAVzuWCuh+PJPS/pCoSEgdF9r2zXJxukjlxSfMPdaQSLN9zexaMqbfDDKtm9mnbpB3EwRtVNu
 9fyosdG3q64fXRglwtLUTJOpCcgq2OxGoZBkyGurgQeWs43UB4ckr1C3jvi2s74RX76D2upSYzN
 8YPEoJV0L533JzzLDVgEnailUK6q/eTWZax4l7wmdfTpSQeK8uDXGfJ4G3O40SznMA4M6zIbh58
 JnqqfcUmIJ5FWp9N7cljYWID/MJiv21qvsO2akSUV62DmvkVm2z69P7WNwuwUghc6SXaA/xwfST
 lo/2mPYRJTz4Fh1YjHghCdLqhDG86J6frXQNmK8KBhjcF4FQ693PQLSWzmD3YA7IHO2VX5rb7vG
 O/flu8PqSWXrbHDMOfgalrt6LPnyGI4u5BsbkElnQ7KdX/vImOddXXOubzkEONXYTvgRzkOb1Mg
 toVu0sHNCv6NH6QWFdw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA5NyBTYWx0ZWRfXzW5/cuQYRwcJ
 hMHDEgJMeDS5dYCMFhzFL4doCBjRnMDXboe34rDaj5G6iKYymemDoDhbP1VE5DI2Mr95kOJp0Sk
 7YWRBSwQJFANAoCJe1HzkU7hi/Ce7NM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 bulkscore=0 phishscore=0
 impostorscore=0 adultscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060097

DTS coding style prefers hyphens instead of underscores in the node
names.  Change should be safe, because node names are not considered an
ABI.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm/boot/dts/qcom/qcom-apq8064-pins.dtsi             | 2 +-
 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi                  | 2 +-
 arch/arm/boot/dts/qcom/qcom-sdx65-mtp.dts                 | 2 +-
 arch/arm64/boot/dts/qcom/lemans-evk-camera.dtso           | 2 +-
 arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi          | 4 ++--
 arch/arm64/boot/dts/qcom/lemans.dtsi                      | 2 +-
 arch/arm64/boot/dts/qcom/monaco.dtsi                      | 2 +-
 arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi | 8 ++++----
 8 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-apq8064-pins.dtsi b/arch/arm/boot/dts/qcom/qcom-apq8064-pins.dtsi
index e53de709e9d1..e95da761234b 100644
--- a/arch/arm/boot/dts/qcom/qcom-apq8064-pins.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-apq8064-pins.dtsi
@@ -87,7 +87,7 @@ gsbi7_uart_2pins: gsbi7-uart-2pins-state {
 		function = "gsbi7";
 	};
 
-	gsbi7_uart_4pins: gsbi7_uart_4pins-state {
+	gsbi7_uart_4pins: gsbi7-uart-4pins-state {
 		pins = "gpio82", "gpio83", "gpio84", "gpio85";
 		function = "gsbi7";
 	};
diff --git a/arch/arm/boot/dts/qcom/qcom-msm8974.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8974.dtsi
index 95be1d2e214f..06c0af0aa317 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8974.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-msm8974.dtsi
@@ -1866,7 +1866,7 @@ cci_i2c1_sleep: cci-i2c1-sleep-pins {
 				};
 			};
 
-			spi8_default: spi8_default-state {
+			spi8_default: spi8-default-state {
 				mosi-pins {
 					pins = "gpio45";
 					function = "blsp_spi8";
diff --git a/arch/arm/boot/dts/qcom/qcom-sdx65-mtp.dts b/arch/arm/boot/dts/qcom/qcom-sdx65-mtp.dts
index 07c10c84eefa..2c0590617ac4 100644
--- a/arch/arm/boot/dts/qcom/qcom-sdx65-mtp.dts
+++ b/arch/arm/boot/dts/qcom/qcom-sdx65-mtp.dts
@@ -55,7 +55,7 @@ vph_pwr: vph-pwr-regulator {
 		regulator-max-microvolt = <3700000>;
 	};
 
-	vreg_bob_3p3: pmx65_bob {
+	vreg_bob_3p3: pmx65-bob-regulator {
 		compatible = "regulator-fixed";
 		regulator-name = "vreg_bob_3p3";
 		regulator-min-microvolt = <3300000>;
diff --git a/arch/arm64/boot/dts/qcom/lemans-evk-camera.dtso b/arch/arm64/boot/dts/qcom/lemans-evk-camera.dtso
index 4600d5441cce..a4c6d39cf777 100644
--- a/arch/arm64/boot/dts/qcom/lemans-evk-camera.dtso
+++ b/arch/arm64/boot/dts/qcom/lemans-evk-camera.dtso
@@ -14,7 +14,7 @@
 #include <dt-bindings/gpio/gpio.h>
 
 &{/} {
-	vreg_cam1_1p8: vreg_cam1_1p8 {
+	vreg_cam1_1p8: cam1-1p8-regulator {
 		compatible = "regulator-fixed";
 		regulator-name = "vreg_cam1_1p8";
 		startup-delay-us = <10000>;
diff --git a/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi b/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
index 40f88498999b..cefb8ff00806 100644
--- a/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
@@ -63,7 +63,7 @@ vreg_3p3: vreg-3p3-regulator {
 		regulator-max-microvolt = <3300000>;
 	};
 
-	vreg_conn_1p8: vreg_conn_1p8 {
+	vreg_conn_1p8: vreg-conn-1p8-regulator {
 		compatible = "regulator-fixed";
 		regulator-name = "vreg_conn_1p8";
 		startup-delay-us = <4000>;
@@ -71,7 +71,7 @@ vreg_conn_1p8: vreg_conn_1p8 {
 		gpio = <&pmm8654au_1_gpios 4 GPIO_ACTIVE_HIGH>;
 	};
 
-	vreg_conn_pa: vreg_conn_pa {
+	vreg_conn_pa: vreg-conn-pa-regulator {
 		compatible = "regulator-fixed";
 		regulator-name = "vreg_conn_pa";
 		startup-delay-us = <4000>;
diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index 353a6e6fd3ac..e5a57a340cd8 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -1041,7 +1041,7 @@ qfprom: efuse@784000 {
 			#address-cells = <1>;
 			#size-cells = <1>;
 
-			gpu_speed_bin: gpu_speed_bin@240c {
+			gpu_speed_bin: gpu-speed-bin@240c {
 				reg = <0x240c 0x1>;
 				bits = <0 8>;
 			};
diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
index a350a8ba48fa..c50ce1843703 100644
--- a/arch/arm64/boot/dts/qcom/monaco.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
@@ -2927,7 +2927,7 @@ ws-pins {
 				};
 			};
 
-			lpi_i2s4_active: lpi_i2s4-active-state {
+			lpi_i2s4_active: lpi-i2s4-active-state {
 				data0-pins {
 					pins = "gpio17";
 					function = "i2s4_data";
diff --git a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi
index 7eecd9dc3028..70c130c5426c 100644
--- a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi
@@ -46,22 +46,22 @@ framebuffer {
 	};
 
 	reserved-memory {
-		adsp_pil_mem: adsp_pil_mem@55300000 {
+		adsp_pil_mem: adsp-pil-mem@55300000 {
 			reg = <0x0 0x55300000 0x0 0x2200000>;
 			no-map;
 		};
 
-		ipa_fw_mem: ipa_fw_mem@57500000 {
+		ipa_fw_mem: ipa-fw-mem@57500000 {
 			reg = <0x0 0x57500000 0x0 0x10000>;
 			no-map;
 		};
 
-		ipa_gsi_mem: ipa_gsi_mem@57510000 {
+		ipa_gsi_mem: ipa-gsi-mem@57510000 {
 			reg = <0x0 0x57510000 0x0 0x5000>;
 			no-map;
 		};
 
-		gpu_mem: gpu_mem@57515000 {
+		gpu_mem: gpu-mem@57515000 {
 			reg = <0x0 0x57515000 0x0 0x2000>;
 			no-map;
 		};

-- 
2.53.0

