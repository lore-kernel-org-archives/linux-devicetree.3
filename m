Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F07613DB311
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 13:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783086350; cv=none; b=Oa13qCzowQpmJL62ibcspPO3o/J5XoKF+vp/2JePyrJhgOozl7fLoRyYNe5hWJCZilWfqdPX3C4jqwh7M8/lR8KyjYkODHwo7+wnifmqcvNasB+lWMVKytCkmnGTApm64vHVLRxHeL56jdhIkoTqLHoj86fF2rboFWYGOG8nIzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783086350; c=relaxed/simple;
	bh=WoEsQQXEHcp3Z4NugaMqCjtqYrDzpmWHIggHogkIi2k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Th8NZ5gXQF0z6NRcMiLjSwAAUGgbhWIaPbi7BtgiL/8EKp+5DdukvWtMQHFpoAq2pumqQS8/F/LRnd7gLsFXiVhecpcR8JGccS9u+s2uriXAF7SCpAUsJ1pf47giZB6+fAT+fQpiUIjSMB87q8HXom7RMQ2lSfovzpdPf8YsK74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m3ZeXph0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MfzaYzDX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m3ZeXph0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MfzaYzDX"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663A34Z03773376
	for <devicetree@vger.kernel.org>; Fri, 3 Jul 2026 13:45:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Rc77KXcNF3bATkg/J0Hcy+3fqulP+axrKTzQn99rjZ0=; b=m3ZeXph0qWHngde4
	cyKZge+jjCK5fC4rR9gZXCNMwv//46MvW0g5T3GTreKkoX81ZKjiGv2oAyBuI3J8
	AWDZ7yFrfxrLeyTltJ6MAyeFz1owlPAK3WMFy1/csjR+M6n+ZtfDY620VL38nM2h
	dJzUsWvGIC8BIEz8vc5uDQBGjV449EYxd1mORNaVVPAgD7kyEmii7WOT6T9SJhFF
	Iqhv18Qe4JGzwPqYT5En9tvzwEm++OlruahreWLUcXWodo6IduWS6YXkoMYvuwbf
	uX59OIdL1VpqYEIRfNysL+zWXfKlJDhp6F4c49B1EP5NfVFsPBai7e+vDDgF4gD9
	qOUvdw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6b038u1w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 13:45:46 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e5e38fbc5so51021585a.2
        for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 06:45:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783086346; x=1783691146; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Rc77KXcNF3bATkg/J0Hcy+3fqulP+axrKTzQn99rjZ0=;
        b=MfzaYzDXh/mKrdEJnjOkXdyXxAVCSWQr34fv6GSTJAx3m1PEV+q9LDmM3roX9QEO+r
         Wr21a4BGCMajbUdW2UCj6gSvDlyh+T5vkoAsIOtIZ1sGLmT1PsYIlPt5WYZIZwj/e11D
         DdxSxo2J4PMotXmvXEDSV8O6XESSsHyTnX5oLNOsTHe0bx4UrUTjShLNwyHwPa78a3++
         pXOWRxdXtYawCHYswASLApm7Km39Onblk9K60wKcGRj5Ft1FWKis7UDQfZWbGYaMs7/X
         rSGuv/0pwWvia8dn1Q/MRwQcfAg+Xg79Z3acLyzdd2FlYzmZyXwSgjYAwQoQM0iQK63H
         dhdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783086346; x=1783691146;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Rc77KXcNF3bATkg/J0Hcy+3fqulP+axrKTzQn99rjZ0=;
        b=aKMrTQVP+pxzuabyX4HslTKfP6H6wWgX4xWHgmZfD1j+JBouICRIV/pC9YVhEnqhNl
         jqJNGMNzsnrWo9f3L9OwDjGZgQJbG5tbPq7ogZlMO2yleD1j8fNDRhhn+PwmGig1aDVi
         r10dzI++0g7MxIUbTkHtGF/R/8TW5CHYGesaWcUir/64CXpCiiG6Yin4N9kZNSUWxJUO
         GleR5Xx1ZtIeUj+hGa2Fhbm3QXwsqOj9OEEwQT/Xo1x+xsRCqipOOP0DEGgrh4tpQbgv
         PzwxAhi348hCD0Eu6gBmRbAN6wJvsBxoMRcLbrFXKAAElJDqECkLFvgnVYacO8JipkU8
         7qIw==
X-Forwarded-Encrypted: i=1; AFNElJ+bZWkdL/dQaznzt0mK6PRz5SN0LhOj/VfaHe+souNXejBIIbpWBBbG/Sw7aMg38XhxUOVL90HoEXNi@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/CuZHogTA5ojU4BMJ5qMWk9VO7i5/kEkRcp20HYFgoW7878uB
	seVKu9FzulA7aTYIsCb09O6iKQSxquDnof4UGs3ec8vpggL0uhba7XQhjHsGlmqPPKRorNo/A8F
	0zqfrIj7Hr5MdPEjnru2wT6jtnR/H21qegQ0TdA3/pp8FUqpgs8nq10PV92Pu9kgN
X-Gm-Gg: AfdE7cnJz0EnjnAFG8N/iOsvpynYnX19J2IvfD9ejIqDHYJx2xu3TD5f2VIjNH3G9fa
	YwP4Vm6BYJ5SGjTXrPLE0obUQRokuRHujDRpdzOGIP/OdF642VG1qWf7/k1WlrYr3TkVywxEIEH
	2Ygql5M+CHBmxHKzjhuqACP6yqT74Tbnq8KMA4EKrSwekP7KU9/PT9Q10/l2rBnu/0Rx9Rbdfdl
	z+83Ad1WvBhCKoo5XYj+gDqkop/RsIc3LMitjNWQrkIMpBTYpkn6GzGnYrxOlUfeTaEKRvFN96w
	50JO6HbacVvyV8wIMbkmaxzg5A+irqV/6sNtOr9e6MDhOoM/4FPKuOBa3wvnhzutJQI9BXXr4py
	kH5ZiR6viCObao4Sq3hy5OtCfaFtmY6l7X0S1vM7zk43ooIacel8zPTa+ooyAAmEPe3tR2UL0Uc
	bE6FFzZcjR4gWn2KNOjgv6rdd6vHGrfPqco7IfW1+zyTxYjFruVPAHUkaTD+fUT88=
X-Received: by 2002:a05:620a:3186:b0:914:d093:abbe with SMTP id af79cd13be357-92e781d3eb5mr1407962485a.12.1783086345758;
        Fri, 03 Jul 2026 06:45:45 -0700 (PDT)
X-Received: by 2002:a05:620a:3186:b0:914:d093:abbe with SMTP id af79cd13be357-92e781d3eb5mr1407952085a.12.1783086345170;
        Fri, 03 Jul 2026 06:45:45 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:809d:5d56:19d9:ff8b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b6059e4csm286135466b.1.2026.07.03.06.45.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 06:45:44 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 03 Jul 2026 15:45:22 +0200
Subject: [PATCH v8 9/9] arm64: dts: qcom: arduino-imola: Describe NVMEM
 layout for WiFi/BT addresses
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-block-as-nvmem-v8-9-98ae32bfc49a@oss.qualcomm.com>
References: <20260703-block-as-nvmem-v8-0-98ae32bfc49a@oss.qualcomm.com>
In-Reply-To: <20260703-block-as-nvmem-v8-0-98ae32bfc49a@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDEzNSBTYWx0ZWRfX+u6oNUYA8JLJ
 5aF4K+RryB5It/WVwu8+/lXYYxP4/B/xS0mMewvDSSsfOdfcJ9lUVPW9GkE3ipcTTKhbgqaDJIM
 vwuiL/w4ThZEpjFIhX9HwZ6HqCIP5Vo=
X-Proofpoint-GUID: UTwxIw55kFU1zCZfQKI0aXBEHxMxqnEM
X-Authority-Analysis: v=2.4 cv=FoY1OWrq c=1 sm=1 tr=0 ts=6a47bd0a cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=1BEw5LmG3YzgyHxDt7YA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDEzNSBTYWx0ZWRfXzCgDf2P4vwZp
 L6kPCOg59Rc5OMkO91vOHiK3LkaI8X20Cki4ULRpbyZCpikLRCIvXVWoo2LweQIjy3+cm91JOZ9
 lD2p7s+lOAUQ6cLDzOEFUCN5JQEX6KTI6JcwGwTOGtQ1+CV61ZjN7QB8eF4YTMVaUIQy4yzYBW7
 kQ2yzifW23gDbm4Bb7HBiNDh5oqKPxO/WCCq06opxl87pgk0gPKuamH2YZlBvGG5e8IuNKpchBl
 v/8lb0QlYFpv0sXeK0x527lv9/CEAMM49Vol4HR6o/EGwe9k4yuZajmphywMABM4yjwhLW4OvSb
 1YYe7gzuzNqWKn3cH1AF2HpxXLa6S2jqftwglDfWJLr5ge+THq0Pm/kC8gOCNd2KCXjOyZpRfN9
 SnlCBHV9XDy2A8rW8VWlmnJnCWhtKsn3OlENBa8p9YFYZwB29NrFCC73W3hez3QZVxTvVYCeyWd
 pLeT6yLaK2zmqLaJhHg==
X-Proofpoint-ORIG-GUID: UTwxIw55kFU1zCZfQKI0aXBEHxMxqnEM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 malwarescore=0 adultscore=0 suspectscore=0
 spamscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030135

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

