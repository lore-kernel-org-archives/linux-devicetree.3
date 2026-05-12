Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC91C38888A
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 12:27:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778588835; cv=none; b=RssBFs9lZ+1p0sfxw5Vv1uvlBl8V3ckkXx7I5ETB4bVJ+4l3CBgCD2m+yMKyW7bLr5F+jlvojvEml9TuIAVYyfE+xTDY0/pWlsy5Vq4svk5l0vCkQCBNsU1Z7cmugI1xQLZ4mqDF20+1NkNfXwI4VjiAER6Bo0qntfEhe72BQ24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778588835; c=relaxed/simple;
	bh=ClceAYiJ8whQgLN7bPe85GMULVLaGBTfiMaFdDN9qOs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=q9wzalRTYZ6fqXOqo4QWGqrpakiYpwSQgW6gtrusl/bni7qTGM589IJOYN5hWHJkd9Cw7PbTzL0KjJLy5PhiGwygAMgP5fcQyphQnBKRtEwnM97mDpJGEQFU0G7miJxQLmeDoY+8fL6YrS4jVCkaIW9s4W3gFMnzaUiA9AYRxqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mNk2qYIC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WsY7W/tp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mNk2qYIC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WsY7W/tp"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64CB5PAA592121
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 12:27:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qoxhWK6IHb1qi1sBgTOzXLNliyxQUEnjKfKgGROIUJ4=; b=mNk2qYIC3QK5vwls
	0CBJ4Wko46o01EP0uDzirG5ivct5/P63neyv1Qs61+ZQXbppJ9QvutMs/Yax3Vdz
	KSSfW84NCrGVnEQ+ZPry8Z596hQlBO60r+bpjDrEMfC4SbbYCzV1a8AkB20nx7EL
	pRMxFD/i8pHaSzH11/DHv5FPDU09z3xs+Aj2G8EXCB3AhIn7HyO9yW9CdrDTJzg7
	WH8B6vrnoP8U6U/8D6VWuZhDlwU3Q77T+ydC4uJ86qTtrEZMRhyc+OpKMovdb6Pm
	8O6RgfvV6Kj84NNYv0IEQPM+NI2BmQEolQw0Lo6hQo/i2KzgOEhVTditVaZcFjCj
	/PjMGg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4319rbsg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 12:27:03 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50da529ff48so132161471cf.3
        for <devicetree@vger.kernel.org>; Tue, 12 May 2026 05:27:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778588823; x=1779193623; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qoxhWK6IHb1qi1sBgTOzXLNliyxQUEnjKfKgGROIUJ4=;
        b=WsY7W/tpT2HP8kr3S7IU/3sq+F3Eljvz44SdG9jvaQYP1+CX6njv71Kutfk5UbZs8V
         RQ34QmAbhwjJNlAzyuIkXoiCnWqENIDlCFxCzHpFQoILrgeZMKbMMkljrhZKI3uIweMy
         CPSdHX/dgcxy2VSPKjsuDs0wePV7O4LpHZT6xcO6camzaJpm8TNZnVoYkhgQri3zOc6p
         o7r/vmF+NYBmM9Bvak/NmZDs5JtZrz+FGWArrRedxFc0meAWaAdAiAml+FIZ8lxMj1ed
         u3J5GgpHxyGfO9fcxdkNEto4ybL2ruGC6euS9OfW2Dz2VzjIGGdvbiqb8ooLUWLJWlyN
         PWPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778588823; x=1779193623;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qoxhWK6IHb1qi1sBgTOzXLNliyxQUEnjKfKgGROIUJ4=;
        b=TKL0VDUSkcfSVLFwJaDmO8qaqlEUstSXqA4dPMFYGYbctid9djCRZzVB8iOy+cmc8u
         6VVnIMCpux1Tgte3Nm7bpwLQpPGAyghByEMqnrMzqK15rOYRkZcCeYB4q3WO2HrNpA/C
         ckZ1TngxeuOr1pFUXlorCMs1m9/w2Vl/7JncUuW3tslzROwVREpUySIVysgD1fJE3Uf+
         eNP3c0mptuuJ+S+g42m2vVl0ylDQoJn2G1WPze7lrl3fONy6CNvk3x53l5q0UueRejRf
         62MQJx/ImdcETpOTYnmwi+Wzd+EkkpqRHrK/wq2prGH/KswHreh/N0pTg/uBdV9o0FIj
         1DYw==
X-Forwarded-Encrypted: i=1; AFNElJ86zOTH/B8iRp8XS9eKjc9OpleugcvFf2lUs1doN04yGGioT+K5fqNPBayDpLISs/zgFGDWXEzA9n2l@vger.kernel.org
X-Gm-Message-State: AOJu0YwUsn0JvWnkAX8U4DGDYD27WeM1bVXBBbBn9FqhrFgHPJ1qYyYI
	WTsf7M7bNqRon3WPDPEp2fG0F9xla5v2z0GZS4dZtNeTYQr87oxtKciN7nXBGchthnjikY7tdgv
	4ZjaECmTfW4/T0oNkdV/jHPxtxX1Zvzbd5+5h+4xZPwpAY2apnFyzUUnLf7mmixUy
X-Gm-Gg: Acq92OEXB5hhv7uxLSzeE6UDszuasXTX9wqcb86cJ7uDs2GwUD9mPHqr7dsZtp/BaRK
	dHLPfW0cySIZ3/NkHQ0t+HEU1w0k3TFu/d3H/Oqm17/loGOIqi8Mn2AT2+ZkY4DjgCsmj6zSNwK
	0SqpBUtWdrcEnvHnMVPeqE3ISrcyIdxlOzzlwRE+YpzrAiJQi3+Z6HZ/cFKtroolfA7hQrgxaHE
	CaynCG4/bBX0AMcI98Vp56x3ar8A54IAjEm5MLanhteXghjSrIxM6SsxEErCDB1zGARXm7Di4qK
	cyIIrpDVSjBj7baRI5o2b55OhaXSPRNkb/FHHhd6w/0tmUJo7z1a6yFU3iJ0jlsW+uK4JjLYaSt
	uLzv1aLb59kR7fENZDY+fs7zOMXBlng==
X-Received: by 2002:a05:622a:4246:b0:514:6667:73b8 with SMTP id d75a77b69052e-514a0b243c1mr206769411cf.37.1778588823102;
        Tue, 12 May 2026 05:27:03 -0700 (PDT)
X-Received: by 2002:a05:622a:4246:b0:514:6667:73b8 with SMTP id d75a77b69052e-514a0b243c1mr206768911cf.37.1778588822453;
        Tue, 12 May 2026 05:27:02 -0700 (PDT)
Received: from hackbox.lan ([86.121.170.213])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e90681760sm43089135e9.12.2026.05.12.05.27.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 05:27:01 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Tue, 12 May 2026 15:26:48 +0300
Subject: [PATCH v3 2/3] arm64: dts: qcom: Add Eliza-specific PM7750BA dtsi
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260512-eliza-adsp-usb-v3-2-6420282841c2@oss.qualcomm.com>
References: <20260512-eliza-adsp-usb-v3-0-6420282841c2@oss.qualcomm.com>
In-Reply-To: <20260512-eliza-adsp-usb-v3-0-6420282841c2@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=2358;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=ClceAYiJ8whQgLN7bPe85GMULVLaGBTfiMaFdDN9qOs=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqAxyOT9QOjL+4Buc7hXYCls85cVYTu1bT/Vit/
 sUq586nHTKJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCagMcjgAKCRAbX0TJAJUV
 VnqjD/0ccTPopFmntkjZZQqDw8PmUqM9nlDWZPwfVELTO9PalOLzTlRAZwMxqnstWs9sKSaOVe5
 019P/njc5j5DZcxRj7iA+7rZyv+sJwcLdQuatNpfdJcbCJ8l0ahbSD3Ks7LneXJPaG3rAvLQx9x
 M+SLlCvkUGzOrhqYEXmhmzOhPkwf4TbPMXMKvie9orrtb0AeNog0C43B5pewyoO/lDjO3/RGrrJ
 /gUB7SNiu7+6U4UyvFidN2ffsrSB+6SOXIAeTMQiA2eRm5o1EpoIrx7u2DjoJPSo9qkrRPxjHWP
 ngWbWg2KO5F2xfTtyKYBoG0qCaKLLqm4JUMFe5QmXejmXJIddt1/rJu9N+jPFS4rhJhjmH966Zq
 kZgZqJQVhWcfkzKHhCDXmrdy6N3vagDw3v+23WNaRRbeDUiDnBbKPT2QgTXVKxPo27KG2aWmqBK
 Q4C9jTpQjXMGr7tiJbNu6wMdeaXGDbwiQJYFNa31y51zc9wE9MRAD5JOEjnaNd0lX9sakHp/yRC
 zczMiX8P7H1IEsEuSHSDKsg4QlUMeS7HwPSI0aeliKu3SqZQHnQB06r9H2KYXHbeKnJpA2kqs4Z
 022GnYuJ/d3aGOnXN2ll1c1Yud7AE/KM3KeZNF3+bzZemZRmzQ1PhnwJuzqz2/SXz3S80391zAd
 HIcQex2n/0JAC3g==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDEyOSBTYWx0ZWRfXwDhghGP0Hp8m
 NhQRH/4naFTsCDgf85tFFSamAzW+tI0BL2PtWSjGYTJCeskvct5wSKewtUZ2w++hWSWtqs9H2S5
 3rPel0kLpt8KHTzu6fUZ1bApAV/nJgKqo7UkxBwEpkyRDegKgnXJ48fg9aqiXlZ9AM5cCumjjIs
 q8sNIH3jlWeCF801hkS4w/Y2kSeE5YNrmg/q4uo9id68gVlOclpNZoy73nXowjI+mt+Av67inVF
 FOTEv2wcuYf7LO0wUqY01bkF9QFlKOsCMZE7Z+SK/t+l1yhLU1QDuMT3eeFWIK7bEt9jUB5xqZh
 VXwtkDf+0GVDsH6PlnwLQ3RP7NCZ87PfI1UbaWz+7aDuVgBrHXJg4uDqkpgqgDhgapREaJ00Ma3
 Hy0WCYw+7bpbKO/d0vKQ2Bh+Zp2Lmecgfyknmk6suQ5XabJbYkKZdh5OzWSzrps5dwfkCWUjaMD
 oi52ME7XC++C/7jGS4w==
X-Proofpoint-GUID: Q04qVx01nrwopq8mQMykoMfMWObsv6nf
X-Authority-Analysis: v=2.4 cv=bp98wkai c=1 sm=1 tr=0 ts=6a031c97 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=gcnggjyPzmaCdwFRn6A1TQ==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=4U6AihNozsKCruDMU2kA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: Q04qVx01nrwopq8mQMykoMfMWObsv6nf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 clxscore=1015 bulkscore=0 malwarescore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605120129

On Eliza, the SPMI arbiter supports multiple bus masters, requiring
explicit selection of the master for each PMIC.

The existing PM7750BA dtsi does not provide a way to describe this,
so introduce an Eliza-specific variant with the appropriate bus
configuration.

This duplication is required due to hardware differences in how the
SPMI bus is exposed on this platform.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/pm7550ba-eliza.dtsi | 69 ++++++++++++++++++++++++++++
 1 file changed, 69 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pm7550ba-eliza.dtsi b/arch/arm64/boot/dts/qcom/pm7550ba-eliza.dtsi
new file mode 100644
index 000000000000..2c386f16eca4
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/pm7550ba-eliza.dtsi
@@ -0,0 +1,69 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2026 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/spmi/spmi.h>
+
+/ {
+	thermal-zones {
+		pm7550ba-thermal {
+			polling-delay-passive = <100>;
+
+			thermal-sensors = <&pm7550ba_temp_alarm>;
+
+			trips {
+				trip0 {
+					temperature = <95000>;
+					hysteresis = <0>;
+					type = "passive";
+				};
+
+				trip1 {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "hot";
+				};
+
+				trip2 {
+					temperature = <145000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+	};
+};
+
+&spmi_bus0 {
+	pm7550ba: pmic@7 {
+		compatible = "qcom,pm7550ba", "qcom,spmi-pmic";
+		reg = <7 SPMI_USID>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		pm7550ba_temp_alarm: temp-alarm@a00 {
+			compatible = "qcom,spmi-temp-alarm";
+			reg = <0xa00>;
+			interrupts = <0x7 0xa 0x0 IRQ_TYPE_EDGE_BOTH>;
+			#thermal-sensor-cells = <0>;
+		};
+
+		pm7550ba_gpios: gpio@8800 {
+			compatible = "qcom,pm7550ba-gpio", "qcom,spmi-gpio";
+			reg = <0x8800>;
+			gpio-controller;
+			gpio-ranges = <&pm7550ba_gpios 0 0 8>;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+
+		pm7550ba_eusb2_repeater: phy@fd00 {
+			compatible = "qcom,pm7550ba-eusb2-repeater", "qcom,pm8550b-eusb2-repeater";
+			reg = <0xfd00>;
+			#phy-cells = <0>;
+		};
+	};
+};

-- 
2.54.0

