Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B78354C9560
	for <devicetree@vger.kernel.org>; Wed,  1 Jul 2026 16:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782921683; cv=none; b=PyEHlpj7w3lVJXhaWwybtSMR9waqhu+w0dlTeLbnbydpWkaE5KTrmObyb0BOp1Q9qtTFmXI8Gd5a+PhnJ/3dRSiSEBAnYW1g++ryW9JWjGnf+VNBC5k1BS2AIouz3+6L/nXxEJuLSF4I7b4s3qIEAQMseiKrmUPLSB/lu3XWV5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782921683; c=relaxed/simple;
	bh=WoEsQQXEHcp3Z4NugaMqCjtqYrDzpmWHIggHogkIi2k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=btdehTwDYXbL0FJKhbAI7Cv4FFUML0MN+azfPuflwABXUyNH6Bg8g8O1GY/C7LHTDfTRB5+iFOPuehlhGrFzOj4lZfrurXlcY0RRLFLlubr8M8pG62prSp1Iy21e4EnDeNfFbKLRAD6aqZiJVS6775RsTWzgInyyWJBJ+Q7h7Eg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Sq/4TlU6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jF70/2De; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Sq/4TlU6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jF70/2De"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661Fo8Lt1428897
	for <devicetree@vger.kernel.org>; Wed, 1 Jul 2026 16:01:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Rc77KXcNF3bATkg/J0Hcy+3fqulP+axrKTzQn99rjZ0=; b=Sq/4TlU6exhyzy+K
	qT9msILIdxixfLAxMRh0G1xJpAKvzWs+ZtpKWxy3uGndIQq5dUiSP6UBO4SL/Pij
	Z1jGh2bARokNq8G9wo5OP2turSINkMs51RaXW6y8CCNSEptt//shZHZFk+wgSfAy
	AvDvzofP45s1zaTXy5X1MKQH2r0Z7Id+XYNo9uSQqmGEWPua5QqEI8GfW7dtdRIl
	iji3q3edsCaC+54kQGJH2rv8D1nHj+89qG3sTtg6c9EHnu1toRLWSuucWo6SBHxU
	L1RYwdkd9PVMqapCHK/tRDocDlc1CHAjWB/DsLeETtI9XYrVe3ixT6G6u2JHDj4x
	D6AxDw==
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f53q08naa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 16:01:09 +0000 (GMT)
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-7e74781faaaso1281784a34.2
        for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 09:01:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782921669; x=1783526469; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Rc77KXcNF3bATkg/J0Hcy+3fqulP+axrKTzQn99rjZ0=;
        b=jF70/2DeBisEdEjdvqAbvIXVLcj9pmhfTmlLj9jbjLevltW68YJ3v4IRQdon5O2i4y
         +xaJeZplRGRJA+S0qmqkSwp+g8237VfcCZ09O53UESCtI1+ptLN2Uy/2u7JQ5bIfv8sS
         TfPMH9EIoEYXDRkVpd30kr/tQVQDSagg+ZEkU3DYtYbxmLkekJv5+sGgoF1LPQbiY/Kr
         C/uvDc3k9ibZHNTReQzQxL/opffsRs0SQK7NP2zMYnYZGmS8Fdg24KRZWvrPNkhxQFFV
         NWn5lib1Xzcde9LLFrALgsT0tdpFx3wi8uoTr/J/4qnHv8lFWcnFFCCNolXaEXFGd1Q+
         6M/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782921669; x=1783526469;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Rc77KXcNF3bATkg/J0Hcy+3fqulP+axrKTzQn99rjZ0=;
        b=Eo4eOodP8+K+HDehdPqzjr77A1668CTpbD8QiFV9jaoEv6jPQ5olaevMApGMxkwbx3
         oY+tZIfFguAApXfu4GtLqVi4xPQgC+dj1Mn3OnksY9MwmJfvEdCQGPXCpeBE8N1hGRju
         XDei2LV1SWYbHxeuYdTnZCUQsqbREwZ1Kkq4VZ67x5KXkjMl8Eab243YFDX95f9cRxXS
         ZMMSLNdBYhvBt/yUiJ4Q2zm8q/IrGf47q70CjsohiBd0J7esQBcEhwI5fLLcMFBlxD7X
         9l3/gndtGmFVUmE7uJrtMpxGgh/2Wr+Z2Wy8n4UtkT6QgP9YCUb8vdaMz6TtlIE9XzU9
         8t2Q==
X-Forwarded-Encrypted: i=1; AFNElJ9mXjXgFa/pNWGQS91iz55pwW+/+nwFiF7MJTuzeAQbUgNuUzNhe4p8jWxk2F+uQgTVZ5NzHR+kLzGX@vger.kernel.org
X-Gm-Message-State: AOJu0YzfCer/Lc/38Llb9J1ecrKsdIgKp+GqzJ41lTWoARjPJ5m6nQ4L
	84PpRgE4ZAppeMZz7ZnFmmNJcZrz/k+gCGkfmeoLcfNEHJaHbXwvwrMkXEhF9jqwNb0im2FT0ut
	nwKKJYS4ClF8fiERkm4oCG560YR5zUrOkitN2BGHhtKMqlABKbvgPDDmcOzN23VBS
X-Gm-Gg: AfdE7cmoquE01Lu13RVwwD9BBvUbMsW+o0WWERtdA+MGbtebbO/g0/bjbVcjkIlpMrn
	BTBkTMsfF+0g5Wfa4ik1mypRj3JVC3qPoT9YY33OTmO72ULrEjJvLAJvzqstIO5dKyoXnLXgds0
	7DKeT1KUw/YuR2qiV4iSvz0URFxYnOLIbBD5mSqbpHymvIaG5hAAVRkfB0oJG5wIupng+f53FE1
	zjT031GaqCuwAMWPESpO/DxVrEjzQ9ulbwY6o2/QPpIosJjJtMvIsMHoUliTZuFS3BMcwzFVGdu
	C9CknubFKM3P0UTvW/slmWE8HjiYYU0ag6XA8vjIZ1Ro+J+v1JjIP4AAMMVGfFB0P2hNX5q7ImJ
	LNV0S75FPle5jzIPzoWV7Lc6AV8cN74aTEls9zqMatVL+vDQlP/QjMTSHtG8ybDuw1ZrT6ShCYB
	+5PHdQc7qeTZW+bd8aulPDSt/fMIogQm1XgqlvgLXRZHYaMOqU+LmLWTYaF0yfrZY=
X-Received: by 2002:a05:6820:200d:b0:6a1:50eb:2113 with SMTP id 006d021491bc7-6a309b97f95mr1372367eaf.72.1782921669029;
        Wed, 01 Jul 2026 09:01:09 -0700 (PDT)
X-Received: by 2002:a05:6820:200d:b0:6a1:50eb:2113 with SMTP id 006d021491bc7-6a309b97f95mr1372277eaf.72.1782921668477;
        Wed, 01 Jul 2026 09:01:08 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:809d:5d56:19d9:ff8b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1288d19e03sm296613066b.4.2026.07.01.09.01.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 09:01:07 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 01 Jul 2026 18:00:33 +0200
Subject: [PATCH v7 9/9] arm64: dts: qcom: arduino-imola: Describe NVMEM
 layout for WiFi/BT addresses
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260701-block-as-nvmem-v7-9-3fe8205ef0a8@oss.qualcomm.com>
References: <20260701-block-as-nvmem-v7-0-3fe8205ef0a8@oss.qualcomm.com>
In-Reply-To: <20260701-block-as-nvmem-v7-0-3fe8205ef0a8@oss.qualcomm.com>
To: Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Jens Axboe <axboe@kernel.dk>,
        Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson <jjohnson@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Saravana Kannan <saravanak@kernel.org>,
        Christian Marangi <ansuelsmth@gmail.com>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-block@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, linux-bluetooth@vger.kernel.org,
        netdev@vger.kernel.org, daniel@makrotopia.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=dtnrzVg4 c=1 sm=1 tr=0 ts=6a4539c5 cx=c_pps
 a=7uPEO8VhqeOX8vTJ3z8K6Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=1BEw5LmG3YzgyHxDt7YA:9 a=QEXdDO2ut3YA:10 a=EXS-LbY8YePsIyqnH6vw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDE2OSBTYWx0ZWRfX9PinfcPvapul
 I4cimbysnCQAKvQQ0cnCJob5SEXxN/l5AwXpnRQhudD6K1iWW8Rl9jsTL8yruepQbzPCwLV6r15
 0Ik/ZoIrFYCBgGnavVLexfEONevR4429xqhOCY7Q+COzR3sBkr+oBd1+7gVSopCkBwfEzl92niY
 l+f9Irm27kb5Uz3I7U5RonjJa0QG3GIjxiN8cI6PQyShOj32mSGaE7PF2/BccVeNoVyAtWP4tI1
 4oHVCZWgJ+jnLWMDl/oMvWNSKWUzqsoYAZA0XKFfhUPMI66JiH8ps6HqElP4mG+S/gKZ6F8UgPZ
 4QBF2OtbbnPoENnSPr3ZIRJrjHELpbapvndrK0zJtcAPEeiOCbr9Iqf97wME3mAylaTL5lxpc7U
 Vmi00mbCeUSG1KMOK5ebV3GfBCIQ4w==
X-Proofpoint-ORIG-GUID: bDD_FXdILMznVahu3t71fFJTARDNIj9O
X-Proofpoint-GUID: bDD_FXdILMznVahu3t71fFJTARDNIj9O
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDE2OSBTYWx0ZWRfX0T4Uckg7tWa1
 3MjMSMoRZoSbyDgyBfTFju9tb3j4zlU55Rmzi7t7YkeFyqt/SkZ88iFeo2HEpZc+cjPsyl789H+
 vy/fzqDHT6pSNwvNrpi3cZD47/ebxs8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 bulkscore=0 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607010169

On Arduino Uno-Q, the eMMC boot1 partition is factory provisioned
with device-specific information such as the WiFi MAC address
and the Bluetooth BD address. This partition can serve as an
alternative to additional non-volatile memory, such as a
dedicated EEPROM.

The eMMC boot partitions are typically good candidates, as they
are relatively small, read-only by default (and can be enforced
as hardware read-only), and are not affected by board reflashing
procedures, which generally target the eMMC user or GP partitions.

Describe the corresponding nvmem-layout for the WiFi and Bluetooth
addresses, and point the WiFi and Bluetooth nodes to the appropriate
NVMEM cells to retrieve them.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts | 32 ++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts b/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
index bf088fa9807f040f0c8f405f9111b01790b09377..38839b8a361e76f6c1989924b16095b9d8815f66 100644
--- a/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
+++ b/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
@@ -409,7 +409,33 @@ &sdhc_1 {
 	no-sdio;
 	no-sd;
 
+	#address-cells = <1>;
+	#size-cells = <0>;
+
 	status = "okay";
+
+	card@0 {
+		compatible = "mmc-card";
+		reg = <0>;
+
+		partitions-boot1 {
+			compatible = "fixed-layout";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			wifi_mac_addr: mac-addr@4400 {
+				compatible = "mac-base";
+				reg = <0x4400 0x6>;
+				#nvmem-cell-cells = <1>;
+			};
+
+			bd_addr: bd-addr@5400 {
+				compatible = "mac-base";
+				reg = <0x5400 0x6>;
+				#nvmem-cell-cells = <1>;
+			};
+		};
+	};
 };
 
 &spi5 {
@@ -512,6 +538,9 @@ bluetooth {
 		vddch0-supply = <&pm4125_l22>;
 		enable-gpios = <&tlmm 87 GPIO_ACTIVE_HIGH>;
 		max-speed = <3000000>;
+
+		nvmem-cells = <&bd_addr 0>;
+		nvmem-cell-names = "local-bd-address";
 	};
 };
 
@@ -557,6 +586,9 @@ &wifi {
 	qcom,ath10k-calibration-variant = "ArduinoImola";
 	firmware-name = "qcm2290";
 
+	nvmem-cells = <&wifi_mac_addr 0>;
+	nvmem-cell-names = "mac-address";
+
 	status = "okay";
 };
 

-- 
2.34.1

