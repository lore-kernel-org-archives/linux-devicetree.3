Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21DA338398D
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 06:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783924454; cv=none; b=trr6nzPeq5g4ugEieXsQeXYL0tFZ89qUmqeIRQn5wTAtU1yNo0dyisbu/x3EShxmt4FlQPZdRd6SvyOEwke7ks2VhzqO9v6ZSprLB7MyV/PnDFe1ke7T61v7D5kwcljDzBWmcABRQ6j4c+miiHLA8UkVl3zbl6sRcqCIb1Fus84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783924454; c=relaxed/simple;
	bh=5ed2Z4b5MzgIXc3lyqVCLUWh/UljZ9Hc0R5ig7HqXLQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HB8QqVOJeAh6La0B/uv+TgFzLsPh04Qgd0UmDdTMbtXrfWiBckcMXLEKnpt2zxl2vXSyyNI+63y7eUeD/uZrwGgBhCIhcvOXkGkYZnOIUbmigXScljTt2rZ1gLytAE89CCKM/2YWgG0QJf2lL02a5Rz01af+kYY2pKpHCQXYaYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PWR8CgSA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fHiCBD2H; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PWR8CgSA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fHiCBD2H"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D6NiLW507094
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 06:34:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WMtXhS5u4DhJRt7XmSA7LtO8Au7WP7/Pe+XKvX2m29s=; b=PWR8CgSAxzBbF9fB
	VJ1HPO8D4NxQRpXKWAiZ72d7+HsLaUjA87wmkFDcdr2VMuZ2IW0NgzE+9Ns/7xXr
	TySpQJiOZA9wn7+z+4qmcIdUNrXmWoT1ss/etTb80v/5AJSEWHczmC4YBbsvpgFI
	dcP7HIG5SwZqjt4uVuu5CFtJA5hoYjZWIYaXPRmCSxQhbsTMekarFXCsCPWvNOkN
	WB/tIwNxQmrKqNalIv5pkIXEeeQaBxglxiJcya1eKPFPRERlGyLWIgEwyD44eibs
	bRD5cIl/WNOhekMBF13+Oz8baKmUiKxUmyFHXJHsN15Spb76+/LZOXVmJU4TLF60
	pOoxdQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fctc8g4u0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 06:34:12 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-ca7c1e22995so2061375a12.3
        for <devicetree@vger.kernel.org>; Sun, 12 Jul 2026 23:34:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783924388; x=1784529188; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WMtXhS5u4DhJRt7XmSA7LtO8Au7WP7/Pe+XKvX2m29s=;
        b=fHiCBD2HqrtdG9KUPd/xJve0Dje2TxyS7UOXbtGn0t/0A7pI5he3L1NdNCo3NfNvWg
         pHCxKWkPPj/vQ/ZoGDKSPujfULBcd/P9Jo1Y9UOwf9Ls5xlAPYI1q5+Hrr/GLNSXOOCH
         tS4b1zYK7HpIqsCYspDiUKbcetOJxeOoGrJcDYx8i3WpVOMDdt0RLZBWjRmc2n9K4Jb9
         WGxjJj4LGJ9XFLW5hAt+AP6Xj5klWrWoaGbSuer/m9gqmVOgSZzzk73jnjgSkrp0GpnP
         q1W6Pzx+h9dkDo0GECH1GYnqLN7dBPUnyolCj4AdNXAMWLnl3GsnG0Y/nJC696p1YCac
         Dsyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783924388; x=1784529188;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WMtXhS5u4DhJRt7XmSA7LtO8Au7WP7/Pe+XKvX2m29s=;
        b=o9OKYJRgFXOyU+sJVAucolVAL1hFH32d+EGrfNIABpKMlCQbrgmzSyrt3Nd2ZgoBch
         xmawVDNgOgb8iwx9HvSSPsY0U2DUkGji81iQIPFzcFfFvdDRLppP16s7ED4br8aE7ZtS
         K3TFHGE1b2xlvzXwdEI/r+mp2kFWRVanCTgf6ruNzh4qVJ6nHdVqReYmmBvEQcZRcrj8
         htieYPkgWZlPzdmxTG9MLwNh/xVzOp8GQQJTQIK8rWrwmX4LeKdjfbC2WD7UtR3NLPbE
         Unoj3wagVINWZDqZNL844j8ene7d/SPKRTJWOgTQrFWUmNgQwoTjnIiuji6KxqxW71y7
         /n3Q==
X-Forwarded-Encrypted: i=1; AHgh+Rqaf0CZn9JKFWXnhOCdxiLamwxY0R8d8XCdNsKkZahILgtAr5LDfCgAWtGW1DhrkJOdLhriTRtVhW9i@vger.kernel.org
X-Gm-Message-State: AOJu0Ywckt5AxjeDACjIGolGrNoTsC0tKUrzWLsx1iiZJfwHGo8FN1Kx
	OhWuggqly8rGBGHqWWwX6sFvcaRSYLRSL6o7ah5TpncLffGePhVdYwGc2d3/eN3PfMRpmV8Fwgp
	JhVN9Y2pSo4K9TJqnNdaUPc0WROyBeYeTxettoeSIPtVV/pTFrmBKikmVLh5ftAvk
X-Gm-Gg: AfdE7ckvmt4mrG8rAOHRowoL4K7zMnmo84JJzc1wXHH9po9Gy5PPbQLNqEMgcBFnm3F
	SByO4wqXyL13o3ZZXj4YIuMJJeyN0HebM3onSI67JH22Bmy5hPXsXtKy3dbjwgWNn5PIyedcaBp
	PaI9ixd5roqXvrYR9FACuHRZkO4NMPfz/t2KtTJgrdfdhNTNIDcjeLJ+BmOYX1QVSR6Qb/UmTCz
	rGdTp2uejlL3s83dQsYzrvIRN/queNFX7TJjKLbncc4A5hUVjrlct65WnYPik8rBg23+1z9ka9M
	IAMqArJ5gY2jF5pgM7OoHXw0w3Ku7uIcL3aVdBFjXuXOkdjlqhVnaic0mO1P8cWCead2prOoSam
	zkYuewNP83Zk52g+CTa0E20Y6oMgeZGSX0+c4WhVGVGzbxKAklDdE6KIcxRDToVuy+lBceMl9mX
	PtWIUTIx3FMSso74DLVylAqIVv/GUOGSDuNZSUAeon
X-Received: by 2002:a05:6a20:3ca7:b0:3bf:6222:2e7e with SMTP id adf61e73a8af0-3c110009447mr10312890637.4.1783924388469;
        Sun, 12 Jul 2026 23:33:08 -0700 (PDT)
X-Received: by 2002:a05:6a20:3ca7:b0:3bf:6222:2e7e with SMTP id adf61e73a8af0-3c110009447mr10312858637.4.1783924387998;
        Sun, 12 Jul 2026 23:33:07 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b87b92b27sm25435361c88.6.2026.07.12.23.33.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 23:33:07 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 12:02:21 +0530
Subject: [PATCH v13 5/6] arm64: dts: qcom: ipq5332: add nodes to bring up
 q6
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-rproc-v13-5-41011cbcda3e@oss.qualcomm.com>
References: <20260713-rproc-v13-0-41011cbcda3e@oss.qualcomm.com>
In-Reply-To: <20260713-rproc-v13-0-41011cbcda3e@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manikanta Mylavarapu <manikanta.mylavarapu@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>,
        George Moussalem <george.moussalem@outlook.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: RORGnMZAg0zp8ZsKOHSMLKUekOwbpgCK
X-Proofpoint-ORIG-GUID: RORGnMZAg0zp8ZsKOHSMLKUekOwbpgCK
X-Authority-Analysis: v=2.4 cv=UtRT8ewB c=1 sm=1 tr=0 ts=6a5486e4 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=UqCG9HQmAAAA:8 a=wvtPTOKNElVcqRjrzWMA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDA2NiBTYWx0ZWRfXz3+rvxYSUXME
 T33X5cY4aeCb/P/u3Of44TkF4YIJrWTx68pJ2+DKOkcBUIMcqIyxw9rrSWrF9niENeD0YlPH5UP
 PCyyeITJB3Uf1eT98kctuo+fLRWsJS4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDA2NiBTYWx0ZWRfX+7EUIliB+5RH
 SfZe4KPVms8QcmYz4iWXwksQdGr761hr6uWjkBlwWyDCHap8WXEm4HubfWfUzI1g1ZBkLwfsU7P
 arHxEWR0mIJffVuQH3kjnZ9tD+mEBHCCxdSkWExQQBTEv7teoPnMKACyx4gSlk3XyCSakpI9LB7
 v52SjAsLO6g85UK0Yj+MwjCU5uDjN6b3408SVBPKXy9n50E7xyINvguq82bR3ORDJHMGfFVdhFI
 lTKM5g67ILPVvb+Nt/5uJS/hqVL14Yb/uw24Wqyqzj5FeV8u9niv+TDZnXt5vP7Pm+AyWPEs/PQ
 pi2/wmcYdPZQe0YFFAedv9cMjQxByCvQNHLXexi+706Z8IJl9ZLWDepBR30SBgJpKlBra9rqa7i
 QGdx4XMVGbaWG6Fp2OShUV4XdcshaNK9HaeswiM93Jxl4gSSWxu0MRjEMw/ck2TevIov/HwayL2
 1h9+Kf7sU+6qw2ujGjg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 suspectscore=0 bulkscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130066

From: Manikanta Mylavarapu <manikanta.mylavarapu@oss.qualcomm.com>

Enable nodes required for q6 remoteproc bring up.

Signed-off-by: Manikanta Mylavarapu <manikanta.mylavarapu@oss.qualcomm.com>
Signed-off-by: Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>
Signed-off-by: George Moussalem <george.moussalem@outlook.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Tested-by: Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>
Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq5332.dtsi | 62 +++++++++++++++++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5332.dtsi b/arch/arm64/boot/dts/qcom/ipq5332.dtsi
index 74d9de8d7641..0ecca5a0e68f 100644
--- a/arch/arm64/boot/dts/qcom/ipq5332.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5332.dtsi
@@ -159,6 +159,35 @@ smem@4a800000 {
 
 			hwlocks = <&tcsr_mutex 3>;
 		};
+
+		q6_region: wcss@4a900000 {
+			reg = <0x0 0x4a900000 0x0 0x2b00000>;
+			no-map;
+		};
+	};
+
+	wcss: smp2p-wcss {
+		compatible = "qcom,smp2p";
+		qcom,smem = <435>, <428>;
+
+		interrupt-parent = <&intc>;
+		interrupts = <GIC_SPI 418 IRQ_TYPE_EDGE_RISING>;
+
+		mboxes = <&apcs_glb 9>;
+
+		qcom,local-pid = <0>;
+		qcom,remote-pid = <1>;
+
+		smp2p_wcss_out: master-kernel {
+			qcom,entry-name = "master-kernel";
+			#qcom,smem-state-cells = <1>;
+		};
+
+		smp2p_wcss_in: slave-kernel {
+			qcom,entry-name = "slave-kernel";
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
 	};
 
 	soc@0 {
@@ -656,6 +685,39 @@ frame@b128000 {
 			};
 		};
 
+		q6v5_wcss: remoteproc@d100000 {
+			compatible = "qcom,ipq5332-wcss-sec-pil";
+			reg = <0x0d100000 0x10000>;
+			firmware-name = "ath12k/IPQ5332/hw1.0/q6_fw0.mbn";
+			interrupts-extended = <&intc GIC_SPI 421 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_wcss_in 0 IRQ_TYPE_NONE>,
+					      <&smp2p_wcss_in 1 IRQ_TYPE_NONE>,
+					      <&smp2p_wcss_in 2 IRQ_TYPE_NONE>,
+					      <&smp2p_wcss_in 3 IRQ_TYPE_NONE>;
+			interrupt-names = "wdog",
+					  "fatal",
+					  "ready",
+					  "handover",
+					  "stop-ack";
+
+			clocks = <&gcc GCC_IM_SLEEP_CLK>;
+			clock-names = "sleep";
+
+			qcom,smem-states = <&smp2p_wcss_out 1>,
+					   <&smp2p_wcss_out 0>;
+			qcom,smem-state-names = "stop",
+						"shutdown";
+
+			memory-region = <&q6_region>;
+
+			glink-edge {
+				interrupts = <GIC_SPI 417 IRQ_TYPE_EDGE_RISING>;
+				label = "rtr";
+				qcom,remote-pid = <1>;
+				mboxes = <&apcs_glb 8>;
+			};
+		};
+
 		pcie1: pcie@18000000 {
 			compatible = "qcom,pcie-ipq5332", "qcom,pcie-ipq9574";
 			reg = <0x18000000 0xf1c>,

-- 
2.34.1

