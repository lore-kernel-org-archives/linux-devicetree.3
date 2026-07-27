Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 485E641C2FB
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 14:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785164087; cv=none; b=WnDgEX5h9APsqNxF7forMp6R2aZZqetsW3PT6yQJZ8JB0CNSVUaqNUvyvD5AAgK1OSEprHcrd+Mwp7kjF0Na0/yJhzb6/Tht25ZQn/14mk4UdmOyulG+jZ/HFJGcT3nFPJIc3Ph+urqLHXqw/SxmlDTUdtIYMLjlXZaXl47sH4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785164087; c=relaxed/simple;
	bh=0Rq8D/NoyC39EmLSzNVbHI8oYiwR5Wkjwf+f9tdSuzw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=i8cJjm7FBVqhnby/q5GESpWaleKKq5LoMPQk57M7wbyYuM2km/ANyVKeshzP3MPoGBEs07KCYaUGIzUhk5IX6KFeyX3xa0qUdAo4XrRj7mdFDlEqg29tKXzLXAdNjoiCDMOxmifrrtsOP8Di77GbNLlOyueGQok9ei/AEA/6+Hk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oXw+hvbg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ssw1z9XL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oXw+hvbg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ssw1z9XL"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66RDlixU4061200
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 14:54:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hKaEQZIQPMdPO6UTKBRGpr3T8o+KrcRClYBwgH8RUsc=; b=oXw+hvbgdRd/UmoD
	WmxZM7QP4OtKvON32kiP0Y2RsK4RLE1O4w67ezHhHmnRLUKhyT7l2QK4xGbryt5M
	9/yejvf/a/ijo3x3huZjTyYUVkmqa4efN6rij5QfCTrh9bTQgu8gZ96ZHu2h4Ggs
	0+O5LhhYStp1XyjHpusoS5AfOWtHmJcsL1CEr/8RMvEE7kL5tZFva6WbyQal/cUj
	YD3167WZGbUvbEv4+ZEmvwN8pJ1FOeBmocHOWuMX5ik9DsBIX7yVUH9JDw6w0NuW
	5QaF2Y4OO+DHV5lnLo+r+m42r16wJ6rJzqQ4JjTxZcJbjxaeW5QOvc/9H+9uCNGN
	UM3RZA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fp4mq19bb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 14:54:44 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8efe7db1c42so43924306d6.3
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 07:54:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785164084; x=1785768884; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hKaEQZIQPMdPO6UTKBRGpr3T8o+KrcRClYBwgH8RUsc=;
        b=Ssw1z9XL2LS5aoY+J8hCBvPIVy9dNDhzhbcSbZK2CYToWIhz/pYB7U8I+xxsdWGw2b
         l/MKGcFGQ31Gy8J+MLjmyPdskkkXc0etbjkLOn55zolTRBeJc071rvyEZnM+/3b0LLFV
         LARh3rQyFqpL/otWcRiAYXxFy+dfzAVLw3Wm6PqSGzKLw9uZP1847eaq6LkdSfNpoBvj
         QWgFwBOWWcKexOTuWrJnGceWAY2Lmkv/BBUCsnRmTuyBfu+6IPyimTcygBB0A0m6QGT/
         Eo3M27AgnQbqbqxL+1PKZZ+7tiKc1CPxPftmSRRUb8HtyUWdRodbhxKHcKqoFl2lPe7O
         jAGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785164084; x=1785768884;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hKaEQZIQPMdPO6UTKBRGpr3T8o+KrcRClYBwgH8RUsc=;
        b=fYKw1F1EsI9q8Qp6wChrxMRnez5DfIx4Iy5om9ZwUPO6JcBVTezI1xblvUF6o4wTdK
         +MosCzCxgdLff5FyJ+PC5MIrNnyrF9cuyao6XdBdXPkrsq/fXHywZFtCcNP0tdaJaudy
         QHgWCu6dsBnJUpfYspnpRwdpV+L2soAff0+9CLZ8yqAuKeDR/v4E11V6mZu7EU6tcLdb
         C5Pm4MIcosiEZbXbtgONpl5q2WG8PRBkQRSTRy7jbJkI3LbcR4pVBQcT6vGPYooD8Z5R
         1K/INO7qb4daasfe/cZvbA64FBr4S2PgKb5Eo0DRWgrobU4OFqpGvAphfk/BDfYZASv7
         UaBg==
X-Forwarded-Encrypted: i=1; AHgh+Rq3dUE/pYcSBm3IiMG/gKFudHCM2skqkjK0j1BgYbIOxvEggiwvj4DEQdTPXA/IMj0457ATV9Kv4iQ6@vger.kernel.org
X-Gm-Message-State: AOJu0YxR6tJGLwlux/YdTTmac2MU6RNzAzLgrHtXcwkMwDjpGjM7GB0J
	1gadrq4ZXtiqV0MRBzQbbqtntkO3yp2jQvoigBoj/bn330Kf/nL+pYHu3IN6ng/gGdzBpm8zEzR
	OgeW+xJ7u5vn5lEP4NUBxCaWBV4Cz69FIkomAnuTW3JVkbS+nlV703hj8VVnrbO3R
X-Gm-Gg: AR+sD131y5P/EEbdmuM7vWsMZsQtu2wpM225ZJ6MFXHBvapKbhxlxgnLGeHmVnLXXza
	KsfoK2VNyJvJiXgXBbFO0L6m0yy+2j3ONceJ/1qgXfzCbT9Qc+NSDhrZ5292gL4rpxwVKSn7dZw
	sDU3YVjT1/mZY2Sv2IJrJYqJkYC876p2N2i6Z2f6sB6N2VIH9nmmlGHif42VuDibpp3YQSGt77U
	WJS9sRTcJc/5Q04NhSsbciQy7X/UrQRSuMncI4i0X7fHxV/6D2djiMORBeNcqwcmjE+VRPQsNMZ
	JdEShn+Zfr6EPPCocQpQTdjIVB5vzqqsXEyX3VWDIAnJ64OekmleaJwnGE0uBkCr7FcGj78iy6O
	hmxpd3cZmb9yI1Oq2r4hi5FyH6Q+GqEZN4b6JLBtxAASV9pswjx/zROaFPSAgTrkBo47yuhI4vZ
	qLIooZNgXbF70AmMU6Ezv59i+f27jjIh/9pYU7fhrjhkQk54B7CoSu
X-Received: by 2002:ac8:5cc9:0:b0:517:5b2c:6aae with SMTP id d75a77b69052e-529ccb0c3camr12391311cf.13.1785164083529;
        Mon, 27 Jul 2026 07:54:43 -0700 (PDT)
X-Received: by 2002:ac8:5cc9:0:b0:517:5b2c:6aae with SMTP id d75a77b69052e-529ccb0c3camr12391011cf.13.1785164083047;
        Mon, 27 Jul 2026 07:54:43 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:61cd:dcd3:c61a:ac3c])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69fb594622asm3027582a12.26.2026.07.27.07.54.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 07:54:42 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 27 Jul 2026 16:54:36 +0200
Subject: [PATCH v8 4/4] arm64: dts: monaco-arduino-monza: microcontroller
 LEDs
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260727-monza-leds-v8-4-6e7e93d44dba@oss.qualcomm.com>
References: <20260727-monza-leds-v8-0-6e7e93d44dba@oss.qualcomm.com>
In-Reply-To: <20260727-monza-leds-v8-0-6e7e93d44dba@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDE0MCBTYWx0ZWRfX8ES4c7i/4GyH
 UoopblbTLZO9Gs6JP6y5gj+NU4ox/dbIAm9dChRGC4/F48nEfOSK+T0byXSuz4hAMwMyqpuL38v
 3PCr2LlazfPiOlyVBMpB2iXevPDXrJQ=
X-Proofpoint-ORIG-GUID: 1tKFZ3-MpTlwTxJcpeeXbfawYeCx59H8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDE0MCBTYWx0ZWRfXwl56aAfTsfng
 sKzCRD53XaQBlc4uEK7tLcWK+7LzJBcn96kg68dbronT4zATSrkFlkxPmRsysHda8JDAL1O9+tU
 ijjwmTGFTaIBe0nLMmCNNsAL0gtHMhm5wvNUPRQe1T4/bkNHeiXz4/Ipdfo1TexijImH8A4EuJn
 Q3Nqw4pZ5KgoZO8xYTXnBvhOy22FE/I2iLjjUdz8Q+nTqzPxAUDHqiZA7IazE+eFjbn/EkU8vdI
 WsgeST36STLQHCz0cseRGb9JfxErY0sKZDBPrKTwWauZkwlXFNc0bfN/ws/oMelKCigFdH2dOKw
 dsnfWuDGMeBqR0m0EexFrkKH1EbD/Py+tQjJxZoaHtf/Zp0RsSL8jGo8Tw5JFYIWkPHO/6cmnml
 54CxldOOfqu9Zqg8LvSNTlnwvw9J7jF/NqXCDp9/ZKioRLDRURl4ZiiaCCZUQBi6vD/jPAKPAZR
 UaGGirmjG6UbugsaKbA==
X-Proofpoint-GUID: 1tKFZ3-MpTlwTxJcpeeXbfawYeCx59H8
X-Authority-Analysis: v=2.4 cv=TemmcxQh c=1 sm=1 tr=0 ts=6a677134 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=1BEw5LmG3YzgyHxDt7YA:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_04,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 impostorscore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270140

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

