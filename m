Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795329983;
	b=hvUrX54XJSb5QdOGsNv7LH+uRvuC3TBO7puj+9G9r78Q7wtKzow8B8SJR3RZa5Ki6vsG
	 BwRtir/2cuN4TuuqlM2PkTvOBflDXjQosBB6Ws4Uue3dyqC5ri8QhyZGVujVuCaX37mjY
	 VUrpTJnjg7Vjo8URvH1gZlhEwpufz0BFaULXVR97yCwD3zx48+lVBliqW1AqhF4Oh9L2s
	 6whfgUDEcs24YcEXMV9T2o0Lu/zrL1CdkSXhvuyZr3nDqvUo2Jwo5RI3ZDofWRHGAA3E6
	 i0IeIlnBj3pVx+VKcKI4T1ijygz1l8cTfTyx5TkIUju1uwyD5XBtNd5bLhAuhaQGk7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795329983;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=T2hwzlMo9LCIhFKqcy+WnAbtHTyj+Ik0hC26DXdFkAA=;
	b=tD4GwTP4p9EEl3aCiekjq1qaWLBleADh073hMAOVtB550Fe5M+C4LaT7pbhcaC9YObvZ
	 C4IwZEkvlegQu9yqDQNby+O3Ooh+n8DlzBzbTZlFQUUxTiSZaIv7zKvCShRwca68gAEGd
	 rHab3WZFYksxcKIXa9AtHpwB2hsUGxPOk7qOIOJqEZrtfLO3BCKA3nGbKt8YTLiZB7MvB
	 SQq2J4s7NUn1xplIQ/HWbmQBkgnNQsIMrTugOmXgT/tm31IxtyfG/Hdp795gyAq6uMMi3
	 cm+zEnZVcyOW8nMZ24s3uTQWgtkB5s9R+FfsZwXMQ7YfUe6AjKx6y60lxffiwDc3TAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LsfZZWu+;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TK61b0c8;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FD3C606A681
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 06:46:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9FD3C606A681
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LsfZZWu+;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TK61b0c8
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AM3kBtT4034211
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 06:46:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	T2hwzlMo9LCIhFKqcy+WnAbtHTyj+Ik0hC26DXdFkAA=; b=LsfZZWu+YdfgIrH2
	Iegjwju0OOrYTkgJLKR8LbyqlXyDGSDloEDfcc5Tu91EUl3+CAakESqAG2TdEpCa
	9+lYy8oHhAlDTUs+Qdz9TH4Nx9OBNWaZ4A2g7m5TPGfaQIVf1OePi7ShwRkWenFN
	d1UtK8PvUkRSDD7Sm7IkMVQigJ3KT9w80lF9ThAYSVcu53nuhZTUtSo2NLkuqFxp
	AkpEUnz7V/FSpzjq5HMmQxmolRNA5QUqO0K8qEQxdvmjxFytJFL02IzH4syCIuDh
	GoZbyaHBwIMp/SOFyZsfmwMfuBjtfFMug2Ydn9vFyxg7sZ8hWVhparVv533OdLl5
	ARP/EQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j32w02w95-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 06:46:21 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-370230d93efso7494250eec.1
        for <devicetree@vger.kernel.org>; Sat, 21 Nov 2026 22:46:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795329980; x=1795934780; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T2hwzlMo9LCIhFKqcy+WnAbtHTyj+Ik0hC26DXdFkAA=;
        b=TK61b0c8iBVlnbrdhc8BzLOSPoDhu6Md2Ytf9hBXeloBPL0VUwORqibZiGAcmv8fFO
         7W/Pl3Kgu2+Fxluyy0IovggQgjikgc9uOmqMQnomCoAUiUxyzefykUkaTkO/n2XqJwVe
         sEuBhgc+EXAQCwy6jjdtm3RVIYDwlDkshtA8R6K/TOChSERgB/P+y45BB8ekMssbtQb+
         xFu+sbP/2wKAC+ZW5HDoyr1cU562pDKuP1SvH0BIrndMCKTdGoVDcbZgO4TYhLQbxw0x
         y0soU3SD/lt5rhmllR9A9FjVtetR4lKf2Vg1JPaGgQDGJQE5tyFsVdrzNpLOEz5GtaZ4
         +bQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795329980; x=1795934780;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T2hwzlMo9LCIhFKqcy+WnAbtHTyj+Ik0hC26DXdFkAA=;
        b=H/TY2s/B3y6d3ZWnWjQVmZ1Xrq4mJIJdEAgB62w2XKKo2/W5l9KSCtePmJLAi2UaO7
         Z0lMARxouhl3QWGyp5wif2MtX6B2cAvQL0ElV9289/xokgkAN26mmIE995dlE2RoH9R0
         2WQoOvEh94YXEOKtuMt5nPVMRUHXeg1nZVaSz6sYx/fDJhiF4ehUnvP2EzBNKd9/47TH
         oJKNwsAMl0HvaFI3F1t97ebTJ9x3d6+cMwx6peSW6Zj4WWoPm/EYF+3wFm/MSjR1beTe
         vM3o1xTnSPWf+tEL8Wjcv3yoKXGsXvj3fMpqxQp+8fTX4rT/ZRSVD5pRpyIyAfq8Wvwt
         2iQg==
X-Forwarded-Encrypted: i=1; AL+hErFvNqOWjX7NCqmsxKciqYnEOGNAyQG2hPjW/8SsK2FHkz12OgZde0sERQGiaxcVhnezEWN0FHRCrMgr@vger.kernel.org
X-Gm-Message-State: APuU4Z85IoB0vA1VVEu0kLqkqOkCEpq1eNYuP77XFgYvceq5jWdOPeR5
	qEmqOYWLI81nbrnjIKjSeSYlG4EkkuA445JIKCCov5sQfLtfVlDi19sAtWNTjg6ZjYZXnjMwBpv
	XT+1kCv8wuWTXsrMDypBMSnyxuj0wi+K26XiefLy39jR3M/on6vQF8r+g7aIAItu/
X-Gm-Gg: AZFdTZduYgwm+Y11TV4yT20JRwEw+IPy7i2KWbjJ/8NdnOiJObmKGZYdIe+tJw9PNSx
	sw6SBoR4yiQDcPZCYIQNhXxuGrZdbozI0gLlOOwwZeBLvNw01bJqzR2qC0U3ALVkbtSNe8F84N3
	Rt7IRI/dgWkgL4fYU1Ve+Z5LiUFV0al9ZH/6+5X2vIn72+E34eXTSo1BI9GQZJ4VUD0gD941XRq
	oH8E+SHUMSzg1d4G725DXv810i5YCdFEVPukb6sK0QuciVi/BgS3BZlOWStiy8F3iAsvzT+fS52
	vWQ3wTm8GBpHJkzZgMxdEmSbhqlfGwOh422G9pVpfWAM8ZalXIs0cStlcTaSS4IdfjUFloYGyeE
	D+S7uxBBc1WpsC4f6TQOGA6JPv6LlU0GDCGYpxPkDYqA5PlrpMVfDAl8t0PP+a1cOSHkpn/Tftw
	JyHl5iAKHj
X-Received: by 2002:a05:7300:8288:b0:384:f214:a408 with SMTP id 5a478bee46e88-3857044f2ffmr8905147eec.38.1795329980517;
        Sat, 21 Nov 2026 22:46:20 -0800 (PST)
X-Received: by 2002:a05:7300:8288:b0:384:f214:a408 with SMTP id 5a478bee46e88-3857044f2ffmr8905121eec.38.1795329980032;
        Sat, 21 Nov 2026 22:46:20 -0800 (PST)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566cd40c5sm27598615eec.10.2026.11.21.22.46.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 22:46:19 -0800 (PST)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Sun, 22 Nov 2026 12:15:54 +0530
Subject: [PATCH v2 4/4] arm64: dts: qcom: nord-rrd: Describe the PCIe M.2
 Key B connector
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
Message-Id: <20261122-pcie6_fix-v2-4-2e0fe615d90b@oss.qualcomm.com>
References: <20261122-pcie6_fix-v2-0-2e0fe615d90b@oss.qualcomm.com>
In-Reply-To: <20261122-pcie6_fix-v2-0-2e0fe615d90b@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, alchark@flipper.net,
        linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795329956; l=2116;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=xSU3owBM0txchkN3zsSOuMouYuY186IHzX74a8nKw8s=;
 b=LYm+5o9UAUI8UWrXpqljfX6SY+ut9AqqZn291W8ecTKj0wkOtXq/jb1fUcTPjNXSwpQLR2gaB
 sbkBZnRlP2uDiMw/ZSgBxEKMOyxnuN4sk8q70Lr1TGFdxZA0ZaxVyJK
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIyMDAyNiBTYWx0ZWRfXzqhQgFpbs24A
 fCJErpq9XZhTLXBk4waZHj669o0c11fWw2cPuORQqnI2v6hwtfE5IOKSJW2sFcEMvdcagdxalUx
 31HCBgHlY6RN17cb1h6fvl9imTmqlrVaAVeqv8Qzf82VoabmvCVaXLYu8xTtqdw9lDnGJVZA/FD
 A2terUBNDfCVQKgoF8Ty563AzVT84AQiwneD+fnntcjClYyHbtGjlZWCLasWtfOmqCTsNy4emfk
 sAQqQQhvk7dH4/W21nbEbQbhygjoSmztYjFwoXF+0ccgpNDXdtWmefx5iD+n6ZTqZZqKojGsnKv
 uMZ0qHEbLvF8J7V43OB3zsAw7DyUW2Ij6S1MJwLWE/AL7aZgNB6BOYW2Y6oNyingiG9OxBAAVJW
 3o8WVj6hSFhLj5FhG/6oyrt145decaYOp0ELr/cADCo2GVCpZij1z9dmmm6vI8KF8fFYo30zxEG
 PgEt3Ucx02NzW900wsg==
X-Proofpoint-ORIG-GUID: cl8gLzzg-WHeIGtaylUeDopSXQ9eXeGj
X-Proofpoint-GUID: cl8gLzzg-WHeIGtaylUeDopSXQ9eXeGj
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIyMDAyNiBTYWx0ZWRfX0AgkrlrLvEfT
 CwanHw++nsKGrWJA4QFYrrbY/lfwhyxb+egF4nR9vVtnsB1+xCm+CkEjvaWXhgOxtrk7n9aBTvP
 R3l8VWYuXuG91/OdbowiHSebraGuJ5E=
X-Authority-Analysis: v=2.4 cv=S+dMU4sP c=1 sm=1 tr=0 ts=6b028fbd cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=bvY3E1ByFFb03tV5gjAA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-22_01,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 lowpriorityscore=0 spamscore=0 adultscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611220026

The Nord RRD has an M.2 WWAN slot connected to PCIe3, but neither the
slot supply nor its power control is described. Describe the slot as a
PCIe M.2 Mechanical Key B connector, so that the slot power is
controlled through the pwrseq-pcie-m2 driver and the PCI pwrctrl
framework.

The slot is powered by the vreg_wwan fixed regulator, which is enabled
by the MODEM_SW_PWR_EN GPIO. The MOD_FULL_CARD_POWER_ON_OFF GPIO drives
FULL_CARD_POWER_OFF#, which the Adapter treats as asserted when the
signal is low, so describe it as active low.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord-rrd.dts | 40 +++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord-rrd.dts b/arch/arm64/boot/dts/qcom/nord-rrd.dts
index 827d3ba3a238..59a0210e7fbd 100644
--- a/arch/arm64/boot/dts/qcom/nord-rrd.dts
+++ b/arch/arm64/boot/dts/qcom/nord-rrd.dts
@@ -100,6 +100,40 @@ vreg_wcn_core_vh_1p95: regulator-wcn-core-vh-1p95 {
 		enable-active-high;
 	};
 
+	vreg_wwan: regulator-wwan {
+		compatible = "regulator-fixed";
+
+		regulator-name = "vreg_wwan";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+
+		gpio = <&tlmm 54 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	wwan-connector {
+		compatible = "pcie-m2-b-connector";
+		vpcie3v3-supply = <&vreg_wwan>;
+
+		full-card-power-off-gpios = <&tlmm 53 GPIO_ACTIVE_LOW>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				wwan_m2_pcie_ep: endpoint@0 {
+					reg = <0>;
+					remote-endpoint = <&pcie3_port0_ep>;
+				};
+			};
+		};
+	};
+
 	wcn7850-pmu {
 		compatible = "qcom,wcn7850-pmu";
 
@@ -537,6 +571,12 @@ &pcie3 {
 &pcie3_port0 {
 	reset-gpios = <&tlmm 11 GPIO_ACTIVE_LOW>;
 	wake-gpios = <&tlmm 9 GPIO_ACTIVE_LOW>;
+
+	port {
+		pcie3_port0_ep: endpoint {
+			remote-endpoint = <&wwan_m2_pcie_ep>;
+		};
+	};
 };
 
 &qupv3_0 {

-- 
2.34.1

