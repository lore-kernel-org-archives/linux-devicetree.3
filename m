Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794383546;
	b=n9N36P6Bgjs+8cBPOzqR4IyGUkKD6ApvjnlxnF+7mZGkzqN/GkUD4p2wzOQUF89E0S2L
	 cZOwQIWiKwxOvIfGHuHP/xdYzxAxF4EtuDuEhu5ZDxna4lZ5GpXdcReF4gNovSwDdLbKV
	 NkxRLkbxo4t/Jgfz1Gd/QMtyOZu/M7scu4TC0UJST+o5POxM5au1LBy++QPHFYuB8ftYR
	 K1pYv8+BUPTzlLDFL2C+A65mPbGcEr6hIh/GwkxgKlIWSyLSj62FuUHvdhUELqlRMmTpC
	 BsqPiDVjdt5aEM6G42hstxZ+4xgtmsDzFbLIZ3p3e6LMQxz2hzcJTlz5ZaGnoh6uBGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794383546;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=NiUenwkxDfPWvzPSwUjlH4d+jmHPRNZ+aPFjbhKqadQ=;
	b=QKoaQcO/WGBYWjRygm+TP0czEbax79XvT7rTr74vpUcy8v6SEAV3WjeN9LzcZ5qzgobs
	 aCfvmzeA09HseBrHaYN0uLa1JJk0b9Y2AilMnJc3tS6kxYlU5HXsnfsL510qPu+uRPP6E
	 A0rCDy0Vg2wVzooi+/kqUuL+I0CjDo+Ti8XiNjkAWc3YhAqZVRP+YorIGuI4/51e2cLgv
	 ImpAYgACogU86xG9+Jqbqz8BTfyjcAlaI2v8aQfvyZtOADnUSgBQAZcemPp0yD7KB+502
	 Zl5I4sScCvUCxA9HHnOIKS4LhTYj+EL5meEKXrk0zSrKO7+I+NunuYyAl0GYf0H0BSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=O0lOIfoB;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="A6go7/dj";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBC6E60A2609
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 07:52:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DBC6E60A2609
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=O0lOIfoB;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=A6go7/dj
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AB6Z9o4580879
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 07:52:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=NiUenwkxDfP
	WvzPSwUjlH4d+jmHPRNZ+aPFjbhKqadQ=; b=O0lOIfoBMLVHN11pfZZlIUhedkF
	y3F8rS0txSdOodupl77BBUsJSDPfcm+ZiT+kwTFn6Xk0SzV/9g9ZF/s21IpEw8Ud
	B5jMuvJbRiDva1jD9xOpK6cJTNqxBERxIWiWjGuV98W3w2QR8K8SXJDaVNflaEU+
	YZU8ih+eUkNQHSPQ25bbLAL4Z4QDN3WDd4grGe0P8H0zipaoYPOugXpgcZP/jmwB
	L4scgibmyFetg1WUs3q3UQnZF7Q41AphInwM5QTLtoGHaXxDw7IXD5i0yPeFfnTi
	x9eAKjjODMz5XFcuCJ2W+ZVFe4twlqjOjqHsv6c6R20G9l89WxvV8iZYArQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvk7pr942-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 07:52:25 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36f479b9819so5087736eec.1
        for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 23:52:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794383545; x=1794988345; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NiUenwkxDfPWvzPSwUjlH4d+jmHPRNZ+aPFjbhKqadQ=;
        b=A6go7/dj8VTd3c6YY+RxF7DM+PjShjloyMIyrAv63LgeI6Ut3i4sQm+n2fe5od+gsF
         lKWHajl9yuLUBlRzqFWlkzDlEiSdSsIyWo9I8pgLWSv8e3csiLcSZtEB6Xg2usW3yTpm
         msjQZo3/MR7skNPb45mOd4ly9SibAYYwfnqkMthEenGevpHmYhC23Q+NdfM+rYK3E/lc
         wrl+aynC2S3dCZ47XradP+Lwvq1ZDKLdVztlgERhA0PNSnvPnI3/iZbNDEWEUPPTsxoD
         l6o93b7lkxUzLNX/LZSQgrubeKu61MSAzVvjcLM/13kXiRsNAzBR00mcVbdMZ5+2UH+I
         eSgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794383545; x=1794988345;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NiUenwkxDfPWvzPSwUjlH4d+jmHPRNZ+aPFjbhKqadQ=;
        b=1bhWHOr5HJAqU9zJQe4nCRdrYEUp41/j4RtS+Fx+P7g5N/DaC8Ph+UPCx3r8Dd1nm6
         K8ziP+2N+dXG+5xSwePgds5BkzTmNJrXX1bhMz4buxikqArvLOyXrI0R46kvRlPORrW8
         xHLC8A14gBdUyUBp9GnsedqO1AMA6NL/tcrKQaA94FJ6T9B7ljBuShDPf1WbjxU4+WH7
         LMhdahaJgPJ2dCPnDUAR4mPBqMPOIym485+7aELzKQujBIoD4p1mW0r1oGxuhrurDq2H
         3tcLd1kdMKWPCApFVMeRhjnx+OWTJdBR/BvCUBdZabQMp0GfIkMVJgjKTUnD7DwYuW7+
         6rNA==
X-Forwarded-Encrypted: i=1; AL+hErEFr5jaOAFn2NjPNoCRXF8byU/uCu5xfQnLonD2nu8Y1tMYPqT2H/ZyeU8C9AxEUWXAtl64VQsG7o2U@vger.kernel.org
X-Gm-Message-State: APuU4Z9z2Gaytcy6GTxofQ/b+1uzfdxE3jD2KRg3HsRhI/+9E2lZN0b8
	0mSrP95IK2y9olgAXP+F5hGqkHIGFuiB8YFzaUMzhb2lw2+vLdsuGHMVetT97GeMdpa34jINHAA
	eWhwv86x7jM+4VQnkgEcR2eqRKsbwkV8wAlditKX0RX85T6HgJKfUZwAtub8zCWIK
X-Gm-Gg: AYBFou3QswxkFiKOpz4AWQr93hTV0vNpOq8tfpKi/s19c4uCuuE/dpHrY7dV42RQS8/
	oztsoibKsd+CE5hRNJEneR/C+vqacV6BdLPjzwsz/kjrciFPxeotuR4Oyp+FM9HUvieOq6Ioy22
	5GguzceGglEwLbGncO6V9FSMC0k9qk3XyL07l9OZuB0O3Ar9Rq7ZvJQxLVaJ/D3KyKdaFBjPs09
	f9V5luAoRQc5jnehuI2JtfVUk/aRbrftJi9qsCmKPBjUe7wXWcsvLGw6T/ONgpD6Afcsgi8wyi3
	5Ducibt6ndHYWoqXsBCxQWCBbUfp/F6gnvy2uqbcLHFdriSDYNzbV9StJ86k6ByGRHwYd1x26wF
	Dnhiab31loHKPcYTAWfwVtmMdnF7a8In1jQn9W/9BTNKT029Qfh9XnbwroJo7x1vQtJlMAb+nbT
	fNM1YdfCke6VynFDJ13CKbQ44QAJ6qI2Zg
X-Received: by 2002:a05:693c:2291:b0:36c:9af3:22eb with SMTP id 5a478bee46e88-37686e2ef3cmr2164424eec.34.1794383544361;
        Tue, 10 Nov 2026 23:52:24 -0800 (PST)
X-Received: by 2002:a05:693c:2291:b0:36c:9af3:22eb with SMTP id 5a478bee46e88-37686e2ef3cmr2164398eec.34.1794383543873;
        Tue, 10 Nov 2026 23:52:23 -0800 (PST)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-377531d3287sm187032eec.0.2026.11.10.23.52.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 23:52:23 -0800 (PST)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Yu Zhang <yu.zhang@oss.qualcomm.com>,
        Shuai Zhang <shuai.zhang@oss.qualcomm.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v5 6/7] arm64: dts: qcom: nord-rrd: Add WCN7850 WLAN support
Date: Wed, 11 Nov 2026 15:51:40 +0800
Message-ID: <20261111075141.3710366-7-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261111075141.3710366-1-shengchao.guo@oss.qualcomm.com>
References: <20261111075141.3710366-1-shengchao.guo@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDAzMSBTYWx0ZWRfXzZQn9dPTiYUq
 GcJ7E9tE1pZtg0McceMopvhG8B5jYoHyVvnr7hYAwq9VHfkapsyPLxIImoPEGivKBuupFj637El
 LozGJIwpe9VOgg73Hh8b4ntGm9nH++0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDAzMSBTYWx0ZWRfX1y9AZLMfKhsx
 MK41vJE1Asy+ZOEkP1piN6T+Sxt+MX+kGVG2QD+vPIJ4WUe9rcHS27Ry04VttZ8PFTiAI4RZgll
 7NwsVkIfrNb6GEZ7NdfEP8hDjCYFVTcT8Wdxf9hCItu6Tn9m8mvUE1DUPNZmdHQ6sD1WM4SFTpx
 wG1CpWINPllPoOblu3bJGzprJoRGLE22hq1ewJ0cimfv9mamJvnRuRmxwHZ+Znrk4Ee0ySwXoBs
 MzQFAqSVNd26by0lwhBD30QTg9ldtdqrSnrgvJbIV4jtsTWsuelidoaQsSNmoJ1/2z8dH1z6ekx
 idzQge1tZ5z/aBjwi/L3H/htgg6FSO9ZhxtrrdN3GsfueH7+r67m1VLwiuFdZ4s4UReD3vfiUFH
 nRm5aJF6u6YsmSFQZdUxcrO4tocS/K7kQB8XtUHphckLs9L1f1nA/cjdsCUDiKMRpSK6p13GfJ3
 4nucrRlccKUWv4qn9Xg==
X-Proofpoint-GUID: bfeIcu7Zmn7KsQUu090OC2r0Pl2cwJc-
X-Proofpoint-ORIG-GUID: bfeIcu7Zmn7KsQUu090OC2r0Pl2cwJc-
X-Authority-Analysis: v=2.4 cv=BpcIUoX5 c=1 sm=1 tr=0 ts=6af41eb9 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=fkhy3qLzDainn0cAaKQA:9 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110031

From: "Yu Zhang(Yuriy)" <yu.zhang@oss.qualcomm.com>

The Nord RRD carries a QCA6797AQ (WCN7850) LGA module on a
connectivity adapter card hanging off PCIe2.  Three PMIC GPIOs gate the
module supplies: PWR_CORE (pmau0102_e GPIO6) enables the DBU_CORE_VL,
DBU_CORE_VM and DBU_CORE_VH regulators feeding VDD_CORE_VL/VM/VH,
PWR_CTRL1 (pmau0102_e GPIO8) enables DBU4, which produces the 3.3 V rail,
and PWR_CTRL2 (pmau0102_e GPIO7) enables the 1.9 V rail.

Describe those rails, the WCN7850 PMU that derives the chip supplies from
them, and the PCIe endpoint node consuming the PMU outputs.

Signed-off-by: Yu Zhang (Yuriy) <yu.zhang@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord-rrd.dts | 111 ++++++++++++++++++++++++++
 1 file changed, 111 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord-rrd.dts b/arch/arm64/boot/dts/qcom/nord-rrd.dts
index 98dab85de64d..b23c1a81a376 100644
--- a/arch/arm64/boot/dts/qcom/nord-rrd.dts
+++ b/arch/arm64/boot/dts/qcom/nord-rrd.dts
@@ -53,6 +53,102 @@ bi_tcxo_ao_div2: bi-tcxo-ao-div2-clk {
 			clock-div = <2>;
 		};
 	};
+
+	vreg_wcn_3p3: regulator-wcn-3p3 {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_wcn_3p3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&pmau0102_e_gpios 8 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	vreg_wcn_1p9: regulator-wcn-1p9 {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_wcn_1p9";
+		regulator-min-microvolt = <1900000>;
+		regulator-max-microvolt = <1900000>;
+		gpio = <&pmau0102_e_gpios 7 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	vreg_wcn_core_vl_0p95: regulator-wcn-core-vl-0p95 {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_wcn_core_vl_0p95";
+		regulator-min-microvolt = <950000>;
+		regulator-max-microvolt = <950000>;
+		gpio = <&pmau0102_e_gpios 6 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	vreg_wcn_core_vm_1p35: regulator-wcn-core-vm-1p35 {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_wcn_core_vm_1p35";
+		regulator-min-microvolt = <1350000>;
+		regulator-max-microvolt = <1350000>;
+		gpio = <&pmau0102_e_gpios 6 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	vreg_wcn_core_vh_1p95: regulator-wcn-core-vh-1p95 {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_wcn_core_vh_1p95";
+		regulator-min-microvolt = <1950000>;
+		regulator-max-microvolt = <1950000>;
+		gpio = <&pmau0102_e_gpios 6 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	wcn7850-pmu {
+		compatible = "qcom,wcn7850-pmu";
+
+		wlan-enable-gpios = <&pmau0102_e_gpios 10 GPIO_ACTIVE_HIGH>;
+
+		vdd-supply = <&vreg_wcn_3p3>;
+		vddio-supply = <&vreg_s3a_1p8>;
+		vddaon-supply = <&vreg_wcn_core_vl_0p95>;
+		vdddig-supply = <&vreg_wcn_1p9>;
+		vddrfa1p2-supply = <&vreg_wcn_core_vm_1p35>;
+		vddrfa1p8-supply = <&vreg_wcn_core_vh_1p95>;
+
+		regulators {
+			vreg_pmu_rfa_cmn: ldo0 {
+				regulator-name = "vreg_pmu_rfa_cmn";
+			};
+
+			vreg_pmu_aon_0p59: ldo1 {
+				regulator-name = "vreg_pmu_aon_0p59";
+			};
+
+			vreg_pmu_wlcx_0p8: ldo2 {
+				regulator-name = "vreg_pmu_wlcx_0p8";
+			};
+
+			vreg_pmu_wlmx_0p85: ldo3 {
+				regulator-name = "vreg_pmu_wlmx_0p85";
+			};
+
+			vreg_pmu_rfa_0p8: ldo5 {
+				regulator-name = "vreg_pmu_rfa_0p8";
+			};
+
+			vreg_pmu_rfa_1p2: ldo6 {
+				regulator-name = "vreg_pmu_rfa_1p2";
+			};
+
+			vreg_pmu_rfa_1p8: ldo7 {
+				regulator-name = "vreg_pmu_rfa_1p8";
+			};
+
+			vreg_pmu_pcie_0p9: ldo8 {
+				regulator-name = "vreg_pmu_pcie_0p9";
+			};
+
+			vreg_pmu_pcie_1p8: ldo9 {
+				regulator-name = "vreg_pmu_pcie_1p8";
+			};
+		};
+	};
 };
 
 &apps_rsc {
@@ -415,6 +511,21 @@ &pcie2 {
 &pcie2_port0 {
 	reset-gpios = <&tlmm 8 GPIO_ACTIVE_LOW>;
 	wake-gpios = <&tlmm 6 GPIO_ACTIVE_LOW>;
+
+	wifi@0 {
+		compatible = "pci17cb,1107";
+		reg = <0x10000 0x0 0x0 0x0 0x0>;
+
+		vddaon-supply = <&vreg_pmu_aon_0p59>;
+		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
+		vddwlmx-supply = <&vreg_pmu_wlmx_0p85>;
+		vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
+		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
+		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
+		vddrfa1p8-supply = <&vreg_pmu_rfa_1p8>;
+		vddpcie0p9-supply = <&vreg_pmu_pcie_0p9>;
+		vddpcie1p8-supply = <&vreg_pmu_pcie_1p8>;
+	};
 };
 
 &pcie3 {
-- 
2.43.0

