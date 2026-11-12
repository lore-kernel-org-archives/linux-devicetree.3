Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794458206;
	b=miGYyQLne41FEzpJLTyT739gayVrkoHPqFrzh8YMVT8GDjD7TAZpgDFccCSCtfMdxadh
	 yjZCemx+blZ5UtJAfCs80CP/FZOjOEviq539zrCaawHQGZnsIZwZ0+HJpIE0BHzi8DPpL
	 ik3XY5+lqUOw/0EJ19hPt8kzGqPUd/U66Xqap8Oh+8WbIP9M+K/Z/CtBBywjPIp2mXs1v
	 zVDMu1IsvnwRb0LVn/XkEIq5c0dqFLKT9Ab0ifATLQ+Ag8uL3Yfi89BDBh+dseILj+OYN
	 MguvfZ974zvNpUgNlialm49eQ/YGjHPrlopvl2faMl9xKNT/jsSpQTkG6tfq9FnEOdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794458206;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=+2ZSITN8QVFN8u7SjoWatnG/X14VppTdO3JKgnYuibM=;
	b=Ou6+VvSoXDLGj4T3657988BG5ZNvp6gxXqcHiJnEQhDPt0VghaxDSenW2OilTUtUmICt
	 cOuvrTA0g2kXy5u7RZM7sq4vY1gson1Lrdarw53HMITvy0l3ZU/daHVD1xL5Qodek6MTK
	 c42UztSkEb8khJxNcXMyzdV3Lq3piDF0dXDb4Hx+WeKwiLsbGUpNFi2yaXrjzCbJ0NLVy
	 4ebNLMF2as/GuhBeMpRvunKcm1TaZyvo+Z+zmgQ3GTEsciEKgAQncpIyRjuBrDcWI8NL1
	 +4ldMCji/zvWCsdRArtdB2uvjixtMG2lvYRq0iXfBJsAtMO8o9W+Ia7n65Ym6tnKzmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=haHgWDJk;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OlGQgZP+;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5EC7606E929
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 04:36:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5EC7606E929
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=haHgWDJk;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OlGQgZP+
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC2ZacB903604
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 04:36:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+2ZSITN8QVFN8u7SjoWatnG/X14VppTdO3JKgnYuibM=; b=haHgWDJkNWeyovMM
	x1+9bm/akHpzvlMlvandBQuEx8aj1bJk2RvGjgFv6Rq2mY870NSyozeqW/PCgJtp
	FTnNuVL2gu2kI9njYXhaAPZCQfHtQHiMkiQcuXYn4uRCXO50Wyq8KVgc+/Hmw1il
	Bij++h46yEN3YQU/n58kafaU1riqrcP2zLnNOWLFwREQFfh91pR9LwpB6bOXxbed
	7sHW2cMcdPobiM2nqBahH/fqg5AFXRS0jPF2ZbACelw7exTFFyxDDV0/iOAQKfmS
	Vj03jP/VKYCThI/G3zmHnPrF2bfpp7HEsNibBoGpOA9lSdt2rS0aFu0CtsJ59tr0
	4I7fGQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvt1uay78-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 04:36:45 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso7247579eec.1
        for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 20:36:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794458204; x=1795063004; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+2ZSITN8QVFN8u7SjoWatnG/X14VppTdO3JKgnYuibM=;
        b=OlGQgZP+6xBczfa2+UbjISiRxgue9tm81wJBUjqxexCXEbDRSHC7/Ad/ZuN92e/nNu
         +aimK5NZufm85PLk4PGcCXiJNE4NdxH644uYiEI/sEaUn2q6GpyQTEIypisorYyru0Vl
         whkUHvzGd97ic/CPb/WZaMSzxq+j+1pWwadas+ELmISCuoOwgyUybXf2X2UgRs85j3Hj
         1K1FzYJTX0vCVilPnseAYEc85EZDFDcMu0ylbX2pOtsH7mwEODJyQQHjPyCmv3i2y8Lc
         zNINEhgsALUlV16hgCCBksdkZtWVbhHxWJCUmHkCIXYmZLmdJ4iIyd28cUkP5MfcI8Mn
         xzzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794458204; x=1795063004;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+2ZSITN8QVFN8u7SjoWatnG/X14VppTdO3JKgnYuibM=;
        b=dtPUE0YVaHdIcOEaW8u+uOaj3dtBtlmQAhJjaiuvszFHJukbS7bbkhKL+nmym4Xg4j
         cy7VdsuuJP5cD+NA0kvSak320/xAv7LlW/e2cyGoR11wQ0O3CFMIte6yu1Up7aTnC6i2
         r1Jb4MSWwbRJVVgDsPeXAwjI88KgVtovP6lI7unRQ1wQFDRCWbaawvCZsacsPJDYaWFf
         HsOQwKWpeUtuxfvs9cf5Frorg02UkFoqtX0CGSdlhdeIzo6wU3f7sh63vGO1+GVanbCA
         qCTFORrJpnarDgN6NQ5t7BUZoaEoQr9O2rTZkjcz4arxseYh8lccj33XPnCt8FlR3//b
         qV4A==
X-Forwarded-Encrypted: i=1; AL+hErFyPXVnOEz8MgL1yA1FNkEdSkVoyUIgsGaD1PA9TE5vOeoI9oC7c/IKwhDzCJ7tpuSGSsuE5F8eTNf/@vger.kernel.org
X-Gm-Message-State: APuU4Z8LWTF7Df/PViVpeqUV/GUgJtKMyVKLp0wlElZ/DQsk+23/vL2u
	G8sod/BMeYQg/OBlZLt/NNmvk11mMqoeL/017WZ23vPvVQ1RAJqvE7DqFxfWPP4n6luRQENlTfA
	OPcaNavd1QNcFzsPF3F4LSISFwfdR6u1QCPBJ1d+8DLVhbu4cbCXRqtn7fsRoju9/
X-Gm-Gg: AYBFou0AonF0D9UfloyZfrCKKFY7bpM6zE2WIfG4o+QoNhPOpQg/1zLlIp1YpoNJG81
	tTQfbGQqL9hWgPJGXmVy2ySZ6CZYWGZNknn3HY40loRFpdboW+o8VBvd7rEPHw/Th7yhZEJyFSd
	CaEM+dkZXsE4zCc4kpZj8vARRJcRL2IL31rFbTZOuD54VduKqxlP36B04E58wya7atLHeT/qrI6
	lOwh5qF2w3JiYSOc4t0zr8RJzQ01gjW3M+FdIzmSdJ9Ha55SgVdncmxlhgJ6f1qqHvDe1PyBj0y
	ht+N24KoudHtY2r06wiNfcDsGGaMvnXwzVSwpjgcYamAMviysA7tQ83CXndNkKYUPEaGK6UwI9b
	msU5CXxgoXl7gDWHg9mfRNV693ntGUse954Rk/63MdoPPfVFOPiwTdZWWMHMYVkxiXt3Ib0Q9uB
	ksTlMQtC8PmRJsoY6hwEwEg7ZWRc8qJeFYxVoTYt4QaEbXNmkwOxS9okfiIpweO97AnOpnK72Pa
	uZKaVw=
X-Received: by 2002:a05:7300:d18f:b0:366:703c:5ef8 with SMTP id 5a478bee46e88-376850cefb9mr4226705eec.7.1794458204424;
        Wed, 11 Nov 2026 20:36:44 -0800 (PST)
X-Received: by 2002:a05:7300:d18f:b0:366:703c:5ef8 with SMTP id 5a478bee46e88-376850cefb9mr4226676eec.7.1794458203695;
        Wed, 11 Nov 2026 20:36:43 -0800 (PST)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3751fe2ff5dsm21856793eec.5.2026.11.11.20.36.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 20:36:43 -0800 (PST)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 10:06:23 +0530
Subject: [PATCH v9 04/11] arm64: dts: qcom: ipq5210: Add support for WPS
 button
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
Message-Id: <20261112-08-dts-v9-4-c34de4f78fbb@oss.qualcomm.com>
References: <20261112-08-dts-v9-0-c34de4f78fbb@oss.qualcomm.com>
In-Reply-To: <20261112-08-dts-v9-0-c34de4f78fbb@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAxOCBTYWx0ZWRfX44SLIFrFkEt2
 agyJB9Jf7LN2fgQs6HwMhLjbPm+s5QGKGTbVkM1A4/z1EvYN7IDu9tvPuRLK9VTe3v3HCmZXpK3
 NvOP+pbOjIdt8lhE6VFBj8tDLtjPoZ0=
X-Proofpoint-GUID: aKp_FAgtNizyMSC0OVi0ACWvFexccBRz
X-Proofpoint-ORIG-GUID: aKp_FAgtNizyMSC0OVi0ACWvFexccBRz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAxOCBTYWx0ZWRfXwWtF2Nmrix2O
 tdBR+JveIZx/CCICMU1FXEWgXyvCF8tyRgbT5ettV1YnPjchPRhQ5UCQbwD1Y60AgHaaR6Vy22p
 NBnmflfIvLdGZxMRSLa41KQxI1mFVvSOLXddstjUp6ulzaIs/cXVlI9PVkMMGjO4i1awME0v+mo
 U7ABWpKvCHKyv9yvdrhElbEG7QjfPnZNG/J7LWj+Z4+e4mkfyl/R63bvXHiNeXhzeeWXKtcOl47
 rEErJQ5DHtjblc+ogtzdImYMU+XZJRvvzoHrsngT156cDcb95ktBatEFcXj0svYahCL2gwGIcWU
 EbYnKzFm4R1I1F0syxfjgLCqW6QnLl0wVZSEDxt/UCJSdud65q/HKXyxvnQLDidEw4rD+F/DxGw
 WOyB4Xc0WBjFjyOjzPnrc8OQOFtFBUKG6nvhLaLeaZ+GGzZG5KCi+ONpsJ0/Dt/deZEhIGil9eB
 DvwNwg4qgi+2oHNBcIA==
X-Authority-Analysis: v=2.4 cv=LvcHWXdc c=1 sm=1 tr=0 ts=6af5425d cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=nVy4eOtUigsjo0hPaBgA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 suspectscore=0 impostorscore=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611120018

Add GPIO related nodes to enable WPS (Wi-Fi Protected Setup) in IPQ5210
based RDPs.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi b/arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi
index 17daf277edbf..02fb76283f7f 100644
--- a/arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi
@@ -6,6 +6,7 @@
 /dts-v1/;
 
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
 #include "ipq5210.dtsi"
 
 / {
@@ -17,6 +18,19 @@ chosen {
 		stdout-path = "serial0";
 	};
 
+	gpio-keys {
+		compatible = "gpio-keys";
+		pinctrl-0 = <&gpio_keys_default>;
+		pinctrl-names = "default";
+
+		button-wps {
+			label = "WPS";
+			linux,code = <KEY_WPS_BUTTON>;
+			gpios = <&tlmm 25 GPIO_ACTIVE_LOW>;
+			debounce-interval = <60>;
+		};
+	};
+
 	vreg_misc_3p3: regulator-usb-3p3 {
 		compatible = "regulator-fixed";
 		regulator-min-microvolt = <3300000>;
@@ -132,6 +146,13 @@ &ssphy_0 {
 };
 
 &tlmm {
+	gpio_keys_default: gpio-keys-default-state {
+		pins = "gpio25";
+		function = "gpio";
+		drive-strength = <6>;
+		bias-pull-up;
+	};
+
 	pcie1_default_state: pcie1-default-state {
 		pins = "gpio29";
 		function = "gpio";

-- 
2.34.1

