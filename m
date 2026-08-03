Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DFDD386422
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 10:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785754010; cv=none; b=QKDqhMB9mTYKlkEsJlDXpuh5+mQ/Gl7Z5L33KuhJ1RKD2UJoyxHMZCUcht4qeSjWrDLIJPihnWGWsMgewp5ri4qGTZ+GXPUmrw39OQr6fhYdMGf29WOHIy+1hqa7JRTTqedNFjnsXb+KPOyIDvcBi0fOGDzo5qcw6opkZYAvxds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785754010; c=relaxed/simple;
	bh=RzZzUoksTyLUaZ3HmTPqKhP1G5gdxixi1IK+pyJmlYA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=egdsYtfTwWkNFMIOtEcr53aA+4mEAKl0ES3Uv+1Aw5nqYpmciJCiYCLOS6NBgfFSbX6rEh4BD6mtxWkoAg5xOtsVnK7phYZDeJj3K9evaqDv/gw0RgPIOdKzgocY3+xpWxXTByxkj7ja6RUeKnobBFVhvtjzWR66agpF9lG0tCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X42fcuKo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Bmi6K3Vp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X42fcuKo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Bmi6K3Vp"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6736kqSI4123749
	for <devicetree@vger.kernel.org>; Mon, 3 Aug 2026 10:46:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yjjxipkgqPbrhLPn/F8XjWgBBCUJN8NfplgkSR4d6uc=; b=X42fcuKoMVHItCkJ
	xEZ4XWjq3qW6uAC7zC5hzcx9/K58gvGEVbFFwayE3H9EQ35eloso+8J5xFhqvCH1
	OgEsguML8Zldmv79mec9HGGU1Fow1DCUQzEIdzvu1Zie2GZK4NVnXzyjimoq5IV+
	utX+Im/oXQhYuZmTG0sFD1W/soZ0p13C7WJQxMYEJJfZJvenr4hP0zOeb4oXymRr
	dsvNAh3bOqkt7+yzhU3Ng8ozieoeySMCGrRkEXSDgcuXPjJjtn0PrVGPs2u6JUYb
	q4/nPso/ZOoRbWMX5T20AoCJmMhksCLUHNwiLVlpC2NXbMPJfVLkahLebkrjqD20
	GFz8iQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ftp16912k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 03 Aug 2026 10:46:47 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cbb92868263so4256866a12.2
        for <devicetree@vger.kernel.org>; Mon, 03 Aug 2026 03:46:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785754007; x=1786358807; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yjjxipkgqPbrhLPn/F8XjWgBBCUJN8NfplgkSR4d6uc=;
        b=Bmi6K3VplQkt5eNtse9y8RI17HO10bIBM+XyweVC/yk8logtJaLLMbPuC1b+DIG8Ia
         uJz2rDAqZJDWpduZrerG62ar23oTNFltRhT9LEIMtA1Tkw24mSt3LcvaXSlE89/A9CmN
         ELo4M/ewQiL9B06JcWthGDAu03N2KMQvZ6tnHsK0/D3RbJqu6IAuCvNTnDT0X2SISbeW
         vtaPp8cbOthyRDwNrgl7nyLDozDMMs3lhx0PRBjBdyI7wyhNwNguwO/K77jz0DN3can7
         L8CA0ToVcjXGl9ofiUvK78OG4U5c/n4dhR+CnD+BkmZ/Mxrj6qHcicKL30fjdr3gdCUL
         43qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785754007; x=1786358807;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yjjxipkgqPbrhLPn/F8XjWgBBCUJN8NfplgkSR4d6uc=;
        b=WV8HdiYYcuhJ/S6rphamIJH/V93DUhIGPC5DbRAFwtUxtAf1rv5v8uBFNjzkWoeDBB
         /pQewPMJr995BWjOIuFwEKppYOPL90Ue/m6HMxtvnZBY2yBII8J7Q6UWu8DYB2lpWh9X
         jCitzJhr1595c8LMgniiMC+UcDJc2dggVbfW+f1GNMp6eo/pKzeZeCA448ZbYDRJ3ZGy
         vrQoFGie7ov/8up/KBJL15a213IXHk5Je+HivgMqdQycO3myaCDFwD//QFd7nsRmZA57
         2Vn55cpnW4OwloKugbWaOWVIdkK9jhAKIT7axUJ1zrRFngEYQuU3KwBFBSxOMLzIvTt6
         JiuA==
X-Forwarded-Encrypted: i=1; AHgh+RqiuItcnkLfnQQe1wW+IaV/MlU0KTDT9Tbe2uYlk7/yJ4wRazbvy7CQC3p3gTrgJrvA34E2BU4byNHH@vger.kernel.org
X-Gm-Message-State: AOJu0YxOfSt9hHpPoWl592hy9UpwCNvglBAn4Cw9Emw3Egz5irescvDD
	LI9fPtjTiz6P0J4+cA1P4/y2PAYjszZbQzips+tfuczmvzbWlIMh1RHpRG2tqIzDRGsmTn+3eVD
	PZjtvkMQrWyPtMYXkQAVbqbvatBdwQ4GhhsAJHrPv5yVg0JVTUagZH5CsWvayDo98
X-Gm-Gg: AR+sD13CSOILhF6MYL7tf+snCBekIZW/O53eYXp5JUBfnTtmiCQEnnaO+mx3TaUELyw
	IDyx4vFNoxBcK/OFI2LnihG1+sSRKPjRUxS8doj7Q/Vp+2Ej2giy8Zrqo1s+4u6FU1y287B7cvk
	SEDNW5XvMc9wkVGRl1ULChXUnaFBXe7KrrEQQnUIpOa7Rl6G9bTO1HLUysRvNWmx/y//BU8DHiM
	aKCACpsiYoArNhldXw34/1uskwbdyiHOWaLzyapw9m1RNvwXbZcMWGi6gAanbY8b3Efm2JvhEs9
	TjyWLLW46utA9J/sVPL1A30dddu/t+B5MIhVO2GxjLOphwZ2idseG5EBSRDW6xTXqds0BF5uDUW
	hoeqjasyRUa9JdtjeZlU0UMyAVuefSHXK8aC8qiR9hwGE2irLwi0f+W1afbKxBjZe8m+zq8phDe
	FzLCzfT67ir1aueUwQJQHEXwj7dfjN1w==
X-Received: by 2002:a05:6a21:7a4c:b0:3c3:834e:89bc with SMTP id adf61e73a8af0-3c92a864c8emr9306683637.50.1785754006406;
        Mon, 03 Aug 2026 03:46:46 -0700 (PDT)
X-Received: by 2002:a05:6a21:7a4c:b0:3c3:834e:89bc with SMTP id adf61e73a8af0-3c92a864c8emr9306648637.50.1785754005965;
        Mon, 03 Aug 2026 03:46:45 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13fab4e506csm29993730c88.13.2026.08.03.03.46.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 03:46:45 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Mon, 03 Aug 2026 16:16:10 +0530
Subject: [PATCH v14 4/9] arm64: dts: qcom: ipq5018: add nodes to bring up
 q6
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260803-rproc-v14-4-a1f87b0b0ad2@oss.qualcomm.com>
References: <20260803-rproc-v14-0-a1f87b0b0ad2@oss.qualcomm.com>
In-Reply-To: <20260803-rproc-v14-0-a1f87b0b0ad2@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manikanta Mylavarapu <manikanta.mylavarapu@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        George Moussalem <george.moussalem@outlook.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDA5NiBTYWx0ZWRfX+m4ZNVU+eW1I
 6hJJFmYaENKvQ+3Osw2vY14+JAkq5xhfaeXWswMz4S1uy6QYCYG+v/E6B4fGQXM/dgK5EMFcLl2
 asYvyunKzQfA3ND0d7YpGT8CoX4cruoSBytEFIqqvrQLad/jGM9poE1oHgA/XNJiWfsk+g4um8x
 F9DiT+GQ6raNzvwyMQOHjH17KXUhK6cpuu6g82H5+E2RIjjrNhy81KND2DD8NU6e7FfvLv7iqvn
 jLTcMORIHLcr3i8wdXiert/BMls9t+HmLRG8AbMUm8Uilg8PUgd9Z9zlMGK+lTrHXxMx7jRIldp
 /PiFp0mkEfTyguBZJXO7tQtcsQkFbLLF2IF2SFLlYI8cokqRULKlJJMO8U6YWdB1jfuyBXN/q2I
 C1qVLkZLtEALSHxzQCCS2XBpRj922HQxyGVRbXlQBDJJMFWsq58nbIy58PWnMJo4qPV4uatm8AM
 2NfYPHVZfhxxOEiFJcw==
X-Authority-Analysis: v=2.4 cv=Wpob99fv c=1 sm=1 tr=0 ts=6a707197 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=UqCG9HQmAAAA:8 a=EUspDBNiAAAA:8 a=bkM7E5Y1nIw_8vhdTpAA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDA5NiBTYWx0ZWRfXxZAn2sDpOUU4
 TKNVcvb3aiZqQhj6/oBIInFxE64/Pe3lMFVWcPOTeKTwvOjOCj90VRp+S7H0BUO+erS+dP/LXNa
 ffHkLdUD3IdpK9BUoNAIZnxi4jkoNbM=
X-Proofpoint-ORIG-GUID: o1-ruobC1335tIxHhXPPm3EwNMI6RBoc
X-Proofpoint-GUID: o1-ruobC1335tIxHhXPPm3EwNMI6RBoc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_06,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608030096

From: George Moussalem <george.moussalem@outlook.com>

Enable nodes required for q6 remoteproc bring up.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: George Moussalem <george.moussalem@outlook.com>
[ Change 'qcom,smem-state-names' order to resolve dt-bindings-check error ]
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Tested-by: Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>
Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq5018.dtsi | 66 +++++++++++++++++++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5018.dtsi b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
index 4fc627b47fe7..82af532bff38 100644
--- a/arch/arm64/boot/dts/qcom/ipq5018.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
@@ -158,6 +158,35 @@ tz_region: tz@4ac00000 {
 			reg = <0x0 0x4ac00000 0x0 0x200000>;
 			no-map;
 		};
+
+		q6_region: wcss@4b000000 {
+			reg = <0x0 0x4b000000 0x0 0x1b00000>;
+			no-map;
+		};
+	};
+
+	wcss: smp2p-wcss {
+		compatible = "qcom,smp2p";
+		qcom,smem = <435>, <428>;
+
+		interrupt-parent = <&intc>;
+		interrupts = <GIC_SPI 177 IRQ_TYPE_EDGE_RISING>;
+
+		mboxes = <&apcs_glb 9>;
+
+		qcom,local-pid = <0>;
+		qcom,remote-pid = <1>;
+
+		wcss_smp2p_out: master-kernel {
+			qcom,entry-name = "master-kernel";
+			#qcom,smem-state-cells = <1>;
+		};
+
+		wcss_smp2p_in: slave-kernel {
+			qcom,entry-name = "slave-kernel";
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
 	};
 
 	soc: soc@0 {
@@ -734,6 +763,43 @@ frame@b128000 {
 			};
 		};
 
+		q6v5_wcss: remoteproc@cd00000 {
+			compatible = "qcom,ipq5018-wcss-sec-pil";
+			reg = <0x0cd00000 0x10000>;
+			firmware-name = "ath11k/IPQ5018/hw1.0/q6_fw.mbn";
+			interrupts-extended = <&intc GIC_SPI 291 IRQ_TYPE_EDGE_RISING>,
+					      <&wcss_smp2p_in 0 IRQ_TYPE_NONE>,
+					      <&wcss_smp2p_in 1 IRQ_TYPE_NONE>,
+					      <&wcss_smp2p_in 2 IRQ_TYPE_NONE>,
+					      <&wcss_smp2p_in 3 IRQ_TYPE_NONE>;
+			interrupt-names = "wdog",
+					  "fatal",
+					  "ready",
+					  "handover",
+					  "stop-ack";
+
+			clocks = <&gcc GCC_SLEEP_CLK_SRC>,
+				 <&gcc GCC_SYS_NOC_WCSS_AHB_CLK>;
+			clock-names = "sleep",
+				      "interconnect";
+
+			qcom,smem-states = <&wcss_smp2p_out 1>,
+					   <&wcss_smp2p_out 0>;
+			qcom,smem-state-names = "stop",
+						"shutdown";
+
+			memory-region = <&q6_region>;
+
+			status = "disabled";
+
+			glink-edge {
+				interrupts = <GIC_SPI 179 IRQ_TYPE_EDGE_RISING>;
+				label = "rtr";
+				qcom,remote-pid = <1>;
+				mboxes = <&apcs_glb 8>;
+			};
+		};
+
 		pcie1: pcie@80000000 {
 			compatible = "qcom,pcie-ipq5018";
 			reg = <0x80000000 0xf1d>,

-- 
2.34.1

