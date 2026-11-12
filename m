Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794458229;
	b=tEDrtUO9GKyX0TFN2w2y35L4Mq3Eu5ew8Abh2YsTmWaCM6zxMxg0Mv764h7RmIhAaoIV
	 e3Qm5vs7CRQUIWye8p4fjLPbIGf4FJvj9JCqJdiO62YqwHNGLC75gRtYSc2Y6NUm1xeN3
	 9Y8F8FEDw/8eOFmWPDt91pYkg2V6UL4zsHXFzQn8FW/6tqT6CLctZXMUq+Ih/VFhaezEI
	 lRCFykFG+Pz8V8phZlWUfd1D/kuStk2bTrExpMbI+GubX/bqfxArd+OZc982mxGC5fGZh
	 uAf4LdU1MIoVrc1vR+TW4NV3Gee3n9nKr5GQR+Kf552xJfuB03Qp2To8Oehcx8PHTeg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794458229;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=xc+dUcV2Z0iUpYUcIR0MrpJPt3cjmI+/DiKVoWU5iI4=;
	b=EyvfeRfGSNX5E8me+7eAMo8rMuIXkAGnWgyTYUQSZRRoVWJTCxhtgtJvB60Yi2/xSaZw
	 kh5eCIYa0wu61NKIyaIV3S8LwiAptdmldKwdb5lvBV6QPZ916N8LQqjxlPK9EddNMr7Ly
	 pDk3IN20yOYygAqpunLnNq/H6hdPid11cd9Swa7n+fyNNAYNsRSom/ZXA00JSjssbr8yK
	 WlBHzCZmhBrk/iborr5QRk0O9TqvCRPpW0lDtg/hc3xO7Ke0ZTrY56+8Cs41gCwkSjwe7
	 a8i1k1cl6IIAo0rnUwi4BKRUhjOsF9c4XRLNW1ozPdemyqcRmh4GeqBbzyvyENePEOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JiUW5nH6;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=awj2mZix;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75CBA606A8A3
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 04:37:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75CBA606A8A3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JiUW5nH6;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=awj2mZix
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC2ZbYJ2514242
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 04:37:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xc+dUcV2Z0iUpYUcIR0MrpJPt3cjmI+/DiKVoWU5iI4=; b=JiUW5nH6QF8Bg72j
	Y0mJjxcl0hRiZ9UCxgcsak2E7A6vE1Vd36XXK7I5uRY1HRlqb+IuVYj25sFwep/i
	VGa/8sjZdtMj7o17B29n2zMtWQOoQdJg430JAzXBvQ9FWfriidyIvplmZP2Aw4DE
	QUWLV3zWmK63E6IOODTnLswl6MQHIMg2O5EVTlUlFiZPosGP4SOPRZE5lvWW0wE3
	7duMRfDi6JPVnSl/xM7uTsTAbY5yuMrzBX3FHPQf8J7r3qqp8vIcvLq5xyQWk3s8
	Urb2HJ98Mb1SMMSh3EOUmVya2bY1hgao6yxSWWgybMAr24YzaxNxWC/otjh9AOAV
	gewm2g==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvwm1swjs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 04:37:08 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3724667bc16so327343eec.1
        for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 20:37:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794458228; x=1795063028; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xc+dUcV2Z0iUpYUcIR0MrpJPt3cjmI+/DiKVoWU5iI4=;
        b=awj2mZix+clYa14MQ62RYXc9pjuX6vADvRsDKNXtO4ikdUffjiw7zwY+220oyw+YMW
         3GtqrzkFD9rr0WpKx9y/E/aWX7Rw6GCTZR0Vr+pCO1zIfiY+zNxwrE71BukfRZQU5bmn
         PqMVnlQY+KdYV3jnpUn7Z09AueRzR9+mHrICFWPz+jiImfJdIlOO4jffiLrER6tU++2I
         vCWK16lLAWx462e/fpFaqm+nFag0ZCmsMTa7EM3KwcoljGbEslGVb2zbueKF56VSNb1a
         rc2pfEyLz+OGNPizHf56ga1DTceWL3Z7hU5YPmgXUoYr+/N6G9DzkAuy5NoNdc0O6FkL
         mohQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794458228; x=1795063028;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xc+dUcV2Z0iUpYUcIR0MrpJPt3cjmI+/DiKVoWU5iI4=;
        b=nOjQ2oIXpFoe5RmKVUHGYOn/Ik7qO/f3MfyO31oMCgmD62ZnMwK0xRz1tIgLXNgPLE
         /pxdO6qUMubtGmVtp+3Fl7tPVq5S2hyDWfPayiSicVGPjwg0yHKxfz0Lki1PYTdp4LY7
         7lB45ww5OMbypO+L8C1j4vodE0lFuqcL8hThVtZTzFU2NNQGw0cqQRdvaWBDE5JF890o
         WTBKHgo/REkNF2rSMyS4NjDUKgnS9DU/700tq+GQTdDsVNjL9BlSetwa/hCAnWSCLwyn
         8KK8wAf2ZWJtUBxpYBhaANPI/QxdZWwHEPMIdpZEO097d6Qi3TMIj5wZYyafxazZDeXI
         sATA==
X-Forwarded-Encrypted: i=1; AL+hErGoI9Gbdtr8rawjtktU6Cirt8RvQ5q70diVFD0RBRM3+YSoTgfmEIep95Z74MHZQyn9T0JcNAxAV3Df@vger.kernel.org
X-Gm-Message-State: APuU4Z+XYgEr7yY5h73HAiHgsdoB+edSrCb0dP0L5KTI4JhDx9Bb7Z+u
	fnlPfOh+l7bcNHYY37yxP5qQ4an1C4C+gruRH4qRh2xs5NiIZdUjulZM8NKaJTDtypbaog2RlU5
	46XExCuPTYmx5N3eiHD35TNzIXPcUa53gtwatBNdVSNCtRCvMbQ+cAmwb5RyDja6h
X-Gm-Gg: AYBFou3nYcswEtaeu9WFTt5lV3xqkuE9UHwopCF1zJ2kXaZtI6pzGPo97iYObyUE+tW
	TM2ipd/Do/mm0ARkxkWymiGA179fE0SY7LEngvwBLSOIC23BmtyoVjmpjgAfGqac2LX722XZawK
	Xy+WqfUSYRbvpURFH2E7jkHCWPB1xJ1lLncikAQUDssJPY8/erWu/o5/4gZ76LdI5sb5hwJLrN2
	UtPNvD93IJNGruFEfNdScOMFqv5qyPy0sEX/ZwrvcQs8L8lUr6dRCiGWS1F19+MTEjFJuwGqqro
	0JCC0Abo+wlIWNgrLUFis3/2g4KRrLosweMpLJLDSjK/rwvtblUerYsGRda/WrSSb2jd7PuWgMi
	3xYqZV9d9V2MZiKVYEFcs+Fw4ao6Z9i2wFxwvLcP2X8V9HrNLMm1nr2l7JWZ9Vq/KvkSwHukfRN
	62RkJPYHa1uqXVaPUAeNYAbM21QgTPZHJ9Mq0I4VzPnM/4Y8Cw5lGZh+RPayN9y/Q6yZNPZ1JFb
	gveBEI=
X-Received: by 2002:a05:7300:c00b:10b0:36a:647b:2d7a with SMTP id 5a478bee46e88-377db7c8ac3mr1612426eec.0.1794458228081;
        Wed, 11 Nov 2026 20:37:08 -0800 (PST)
X-Received: by 2002:a05:7300:c00b:10b0:36a:647b:2d7a with SMTP id 5a478bee46e88-377db7c8ac3mr1612403eec.0.1794458227377;
        Wed, 11 Nov 2026 20:37:07 -0800 (PST)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3751fe2ff5dsm21856793eec.5.2026.11.11.20.37.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 20:37:07 -0800 (PST)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 10:06:29 +0530
Subject: [PATCH v9 10/11] arm64: dts: qcom: ipq5210: Add SPI node
 definitions
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
Message-Id: <20261112-08-dts-v9-10-c34de4f78fbb@oss.qualcomm.com>
References: <20261112-08-dts-v9-0-c34de4f78fbb@oss.qualcomm.com>
In-Reply-To: <20261112-08-dts-v9-0-c34de4f78fbb@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=KsnYSmWN c=1 sm=1 tr=0 ts=6af54274 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=ll64UZJxbc1SGzsXvscA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: KOLlA5-4jjyMkdQ7GlZLwgCSlJGZrFyb
X-Proofpoint-ORIG-GUID: KOLlA5-4jjyMkdQ7GlZLwgCSlJGZrFyb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAxOCBTYWx0ZWRfX+44N+n3MLXfV
 w5GDmYmRY6plI7bAv8k8dF6MeYKkERU30m0c41Ll4TJD0VrFADt84ll0qaooBabgaZfVC9btG0t
 1opatyfzf/HNryBwcjkjkeCTo0VVqvaNxZrUP6lKPL+E3geaeQBthV8D9AjNMWVBJ1uktVYvTIn
 lsYRdyNXTFRVaDiJqMM6xwpXHgVH2RwPp00IOXOHfPtcya3diBec+rZ5+R0GdsOWZ1tlzzPZx25
 /VOT+8J9HZaPXHt47Y5utUE5CTnMk4G2uJfNI2NBvDPV51cr/9mwbRaL4SWsdEG+8lSTN0Gct2N
 gFGjBd60w6FuiPV3PRGApPWfO1rrvTOXVSJfcJ5ogE5IISSiGK2XqR6mA+rVIkZzHMf11XUgKmk
 oVtbIOQM7FHZDDdkIFsvJxflc/PIslONsNZJsUnJZsL1WAHmLoB7a9LZmoHDs1pM4AEhi71oBAm
 AU+Rzl79zLzNK7YqRsw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAxOCBTYWx0ZWRfX4ppIo1KbqF6c
 GDnVYPWRUbIvSHxK/9b2pQleGnF1ik3MfFCeqeUU2o9Vw9tXZSpssuBr4kyZaQ9igIMUgczbrgH
 LR5zKoNS5ljiSSYFux6U53TxNT9fakw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 adultscore=0 malwarescore=0
 spamscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611120018

Add SPI node definition for the QUP SPI blocks present in IPQ5210.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq5210.dtsi | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5210.dtsi b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
index 36f874e57b42..052c2f3df94d 100644
--- a/arch/arm64/boot/dts/qcom/ipq5210.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
@@ -181,6 +181,14 @@ opp-32000000 {
 		};
 	};
 
+	spi_opp_table_50mhz: opp-table-spi50mhz {
+		compatible = "operating-points-v2";
+
+		opp-50000000 {
+			opp-hz = /bits/ 64 <50000000>;
+		};
+	};
+
 	pmu {
 		compatible = "arm,cortex-a53-pmu";
 		interrupts = <GIC_PPI 7 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>;
@@ -459,6 +467,18 @@ qupv3: geniqup@1ac0000 {
 			#address-cells = <2>;
 			#size-cells = <2>;
 
+			spi0: spi@1a80000 {
+				compatible = "qcom,geni-spi";
+				reg = <0x0 0x01a80000 0x0 0x4000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&gcc GCC_QUPV3_WRAP_SE0_CLK>;
+				clock-names = "se";
+				interrupts = <GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>;
+				operating-points-v2 = <&spi_opp_table_50mhz>;
+				status = "disabled";
+			};
+
 			uart1: serial@1a84000 {
 				compatible = "qcom,geni-debug-uart";
 				reg = <0x0 0x01a84000 0x0 0x4000>;
@@ -495,6 +515,18 @@ i2c1: i2c@1a8c000 {
 				status = "disabled";
 			};
 
+			spi1: spi@1a90000 {
+				compatible = "qcom,geni-spi";
+				reg = <0x0 0x01a90000 0x0 0x4000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&gcc GCC_QUPV3_WRAP_SE4_CLK>;
+				clock-names = "se";
+				interrupts = <GIC_SPI 142 IRQ_TYPE_LEVEL_HIGH>;
+				operating-points-v2 = <&spi_opp_table_50mhz>;
+				status = "disabled";
+			};
+
 			i2c2: i2c@1a94000 {
 				compatible = "qcom,geni-i2c";
 				reg = <0x0 0x01a94000 0x0 0x4000>;

-- 
2.34.1

