Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795452193;
	b=oxB0YX437ecNsHU4BjBz89Wg4oZgwCOpwsFUfEdc1N0RUloXSfmTlhLL0U+34M0I8oHC
	 IJUOtFxtEidfvMsfrzdDRZg3ponLWpP2MFIT3SO5bw9txrZYO010Z+YJLPZ/Tzh88D1SA
	 mkHH7ThXaZ/iRg5QEwgAGymkirLWjhzvFUP5Rq7okSE+l571zAtIGxTmkEzXP1pb7uFjg
	 kWSRX9zbmtJIsRACpTSvAda6EebO+q9V+xyfm6acSvXFjg2BV+pvRf9zbWkkiwJTd3ZdH
	 h5xX0YVFg8ZhqfbwFyhsl4vdJSc1JIJ4RSHoH5NPjWctjH5DKN0kllg+yr/45QzIUwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795452193;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=4dujEuBXbtdpkxlaf3V6YXDJHRlkRou/+U38dB2bzLI=;
	b=ztY4QaFJcT5f3NxK1DyzY+tC869WBR7gkLdijs2Q6q/csLQXECnvsFgNU+84Jw368mvE
	 xWEmW+yq9PEYn4BRUyti25XIt7bDBWwpPR7ASEDj6LWOi9IywmO5k/ZrpiTuorjyC73OW
	 oTERpSpxQvflFNFp6L5l9XlDewGDzZLGtvvMrTn9BYlqvfHWhUYhRf37Fbx6Oe4U/FLgD
	 g4yXZSdXzyMuvvOSvM4Kp/l3e70SehXUYDkWAglCvVw8Qvifb4aui9z+mx8bRLVncU1lo
	 lR+XZ2UsCgjTSve4OhGalR4CuLh4KeArZ7794qipgN1v3vRSsZDwegUmfg+jHRStrAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BJxLbydi;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=d9wepR5N;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFA53606A68E
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 16:43:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CFA53606A68E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BJxLbydi;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=d9wepR5N
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGGr1e2769122
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 16:43:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4dujEuBXbtdpkxlaf3V6YXDJHRlkRou/+U38dB2bzLI=; b=BJxLbydiFh36cspL
	sjkt6M6rN8VAnIycKHiGxY9g2lFI+mhGFgkLoxusd6OBXjQJhbKnpQYGvXqb5JsB
	ONVkCBLGcpewlx+PPz52uWazm9Vmn0QtMSE+lUZEm0d3xdqGGDEqpSKzdu+NDLy5
	x1STtGIlRK83phRttxuFZkmP8Oh20GPlJ02HU4vUkXO4IJZLawe3flwg8/VswFyu
	9ZRNmjziL6T66mowY2aLoUzUwGxZWqUCLOZOVUbYj5C9GfQ2OSxEGX/XgpCcA7Uk
	NStCa6Er+pOIT8Zdr8e6fB6Tgr/RKAiaXeYMsjtG4K/NhdwC8K4JrBBljHjwXw5D
	CNB7Pw==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g1pacep-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 16:43:12 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-990835cec5aso2254695241.0
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 08:43:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795452191; x=1796056991; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4dujEuBXbtdpkxlaf3V6YXDJHRlkRou/+U38dB2bzLI=;
        b=d9wepR5NDCKmoeZcLD0kH9eyIiTwFA4e8UgUGQ5IuHeGgLASnlzgnwlSHL+b13YiHz
         XOBimlr0zEryQpQDjoV2GNeGulSoJufsW/X1WLP2F3YuwN3BpCX1CJABqQsZZ1SUANsE
         spiuAw94zoRLPhDE9ddaunkvGh8i/C5St09hCqLd+eCoKsNx/2sOChVhgaf9ICw+uAV5
         nzxYo3yLUPd1FtjeoPGM8m0cf9iHtVbXbdDVlt9TtC/vJuqPtWmdUAp57qciKA613a70
         PMc9XoKvNINxF16Ohqg4C01PEnJ/85xmPGGuVx5jr5rNfZEar+0ejdVgcqEQegiNKJDQ
         elrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795452191; x=1796056991;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4dujEuBXbtdpkxlaf3V6YXDJHRlkRou/+U38dB2bzLI=;
        b=R1eI6KFJyvG6xttBOB5hERRTvNoGVhJiMkmrZ1WBQ+Hin+DdA48Ab0Nt8z7KxbGCSK
         ldWtiFOix9FftfHi1kG3Q4vdii/XX/cJ/1vY2ejWRWYe4DUULTytvK4tzUnUAr2o/QKm
         wAuydg8Ea50cJGrTWfSI0x54YlpyW0lhTSTuHDiUuZ73kK9rmmrUMdtqejawMqlduKKG
         wjzNE5+JiDmY1gSgbMmpoWbi7iI+o/mu/+Jp/9trsYUZ5MuTOctG2kovBWYMRNHoCbhh
         U8fiW+hVGqNw3FO5LVJDMvTe0s+9RkUN2nUHWCfC3IZdaV8bXZysDkn9V46/KFx6R16h
         DAMQ==
X-Forwarded-Encrypted: i=1; AL+hErGJgn36iwrFuX2SYbjEkcjEUj9yEDMD1tklGVaELirls+On/vn4uO3l9Hteaq8PKKtVb2KNFHkXgwop@vger.kernel.org
X-Gm-Message-State: APuU4Z8lGTcaVPb/z5+RKU4U84bmqvKA4qoUR4gtHq9SwdTh4+6sn2r9
	ICpFsCrZkW7VzBnK2soO5Zm6uqw7Y8/Uq4UpWDkQngTBfzFot+0fNm89CestnZ4rhaIljokOSOU
	KlnP8zj+JoFnW8Moycs1oWPtpPwfhz0CGZpm7BHvNND28MncJY+i+fIX69Tc8wI4jb5dwfNAo
X-Gm-Gg: AZFdTZdayErBtB8VHwzS2CyGjRN7MUQkQxhAVdjKyogENkJCXQeXnpzM/3yCZOi3SPR
	enBCWdJksomdTdlX60Kw5cLaHQukoIRog3BI7gpBhSTHAO6wuwOKdbPO/AMR3vAojl4WUs5Bpzh
	kZoPrU5qsWVuHFHPrsFH1acv78Nke5gkjIxWi76LMUe/jwRr1SLJjLrGU4PU5CpYwQU/ZWFKIss
	lCgj2YdLn8UWEtPCXT9RuP0FiwRBUf/Ei8/R3/sfQDrwMXAMGG+2/b5lzXwc11PlVB1kcLkW2QJ
	3eb2xpQqmtfzhF/5W8+kTtmo1q3JVgnXUxFYPgFNIWBRzRrzS0UT2UY74pu/f8nOkDi/OtZR5v0
	mKwDT42W6pLAcVHmrf33d2jHfKP2WmdNY6z1AAg70Ya6DJiY+iR0B75bu6V4PG94XPz26IYlw6k
	E4k0UbjJKR1M/I
X-Received: by 2002:a05:6102:3913:b0:7b9:5abb:eb17 with SMTP id ada2fe7eead31-7d6db84e3a8mr4489897137.3.1795452191171;
        Mon, 23 Nov 2026 08:43:11 -0800 (PST)
X-Received: by 2002:a05:6102:3913:b0:7b9:5abb:eb17 with SMTP id ada2fe7eead31-7d6db84e3a8mr4489882137.3.1795452190556;
        Mon, 23 Nov 2026 08:43:10 -0800 (PST)
Received: from [127.0.1.1] (93-159-22-70.cgnat.inetia.pl. [93.159.22.70])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513b00117dsm426725366b.80.2026.11.23.08.43.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 08:43:09 -0800 (PST)
From: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 17:42:59 +0100
Subject: [PATCH v2 4/5] arm64: dts: qcom: agatti: add the Embedded USB
 Debugger
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261123-qcm2290-eud-v2-4-9bfc432dee07@oss.qualcomm.com>
References: <20261123-qcm2290-eud-v2-0-9bfc432dee07@oss.qualcomm.com>
In-Reply-To: <20261123-qcm2290-eud-v2-0-9bfc432dee07@oss.qualcomm.com>
To: Souradeep Chowdhury <quic_schowdhu@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        Elson Serrao <elson.serrao@oss.qualcomm.com>,
        Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA2NiBTYWx0ZWRfXwM5OTdQQIMHz
 aANuo8tWSf86Ltk6VcrkV6RNsLjBE9zZTdzI3aVY7OTeVHFPQlBLOM1xDkPDvPor2aTtv+cxDBL
 W1FnWYjzp39QCd6ShZx4SO3/Lm/2Ty2y8fe95Jyj4sCLsZsWJXadsJMBrznRBoNgaPB3HOlcCuE
 C7rKMZY8N+P9l3fz7iXIKGg7acbG5COgSDZWBBwxl/Z9Ffwqf2HHK4biBfMvkS2l/5v1N56hXgZ
 LtLibTtua6g7CoD2gRm87eB5r/vWnIAsyMwznM0rO2nfKWYWWt9fKFrVivmHHTavo10EtOEKPjh
 o5cJtQCmiJtC6Sv1rjBv4pF8x0LbLc+xuwpSswWSROPK7/jSyCcjPoVDhX9xCH9Mm9SsftAGzHu
 hkmig3QcM8vVituhFJXXgaeLxW4yLt5IUUvRwdA+2PZss4+CL1Q1FvGL2GpA3Y5pD8p/u3bfSB1
 cilJkvt5z9LRatRKhuQ==
X-Authority-Analysis: v=2.4 cv=AeIkjHXG c=1 sm=1 tr=0 ts=6b046d20 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=ySe+0nHqNG5yihRO1pIWsw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=RP-5YM1mH3AJJUWU3rkA:9 a=QEXdDO2ut3YA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-GUID: jNeB3yl_OX0oZNMSh253EdfGYTkpQ9xz
X-Proofpoint-ORIG-GUID: jNeB3yl_OX0oZNMSh253EdfGYTkpQ9xz
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA2NiBTYWx0ZWRfX6Jq3Hj6cLhli
 uP5JjyMwMNPNgIUjzDLbumElQmnnfK9EnFqTGaSELWicm71X/wjOe97QR32BD9/g1cQ1YWKbaFX
 7NvxTjPkuAe3i0slf+/CG+RHao/MCnI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 clxscore=1015
 suspectscore=0 phishscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230066

Describe the EUD:

- its CSRs at 0x1610000 and the mode manager register at 0x1612000;
- TCSR_APSS_SPARE_REG1 (0x3e5018), as offset 0x25018 into the TCSR
  syscon;
- its interrupt (eud_int[1], GIC SPI 189).

Hook its port to a second endpoint of the dwc3 high-speed port so the
driver finds the role switch, while the board keeps the first endpoint
for its connector.

Signed-off-by: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/agatti.dtsi | 34 +++++++++++++++++++++++++++++++++-
 1 file changed, 33 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/agatti.dtsi b/arch/arm64/boot/dts/qcom/agatti.dtsi
index ea9b39b1ed43..ac7a653a6f03 100644
--- a/arch/arm64/boot/dts/qcom/agatti.dtsi
+++ b/arch/arm64/boot/dts/qcom/agatti.dtsi
@@ -826,6 +826,30 @@ gcc: clock-controller@1400000 {
 			#power-domain-cells = <1>;
 		};
 
+		eud: eud@1610000 {
+			compatible = "qcom,qcm2290-eud", "qcom,eud";
+			reg = <0x0 0x01610000 0x0 0x2000>,
+			      <0x0 0x01612000 0x0 0x1000>;
+			interrupts = <GIC_SPI 189 IRQ_TYPE_LEVEL_HIGH>;
+
+			qcom,tcsr-reg = <&tcsr_regs 0x25018>;
+
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					eud_ep: endpoint {
+						remote-endpoint = <&usb_dwc3_hs_eud>;
+					};
+				};
+			};
+		};
+
 		usb_hsphy: phy@1613000 {
 			compatible = "qcom,qcm2290-qusb2-phy";
 			reg = <0x0 0x01613000 0x0 0x180>;
@@ -1680,8 +1704,16 @@ ports {
 
 				port@0 {
 					reg = <0>;
+					#address-cells = <1>;
+					#size-cells = <0>;
 
-					usb_dwc3_hs: endpoint {
+					usb_dwc3_hs: endpoint@0 {
+						reg = <0>;
+					};
+
+					usb_dwc3_hs_eud: endpoint@1 {
+						reg = <1>;
+						remote-endpoint = <&eud_ep>;
 					};
 				};
 

-- 
2.53.0

