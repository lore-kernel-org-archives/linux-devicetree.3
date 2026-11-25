Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795577144;
	b=WQwVQLBW4JduBs1gSVdM8Xcl1t7N5tcJzCRNsg5bbKRCi/88vX0UfEvgGZuTjd6q5aRG
	 OS8zEc7AmAAHTM998reeWETpnTEo46zdyfKy47536WDBlgv6erMwOpO/6tSPAO+Q8evYf
	 rWfGvmlqoHPwaLCOmEc8vIKWQQiCgWLbmHPjjoxUljOMyHYu/rmqUiC1AEuUZsLC8iVJF
	 WgLx94ELtcetBF8zt19ySCMMgMU0hX9XlexLFMwPD8OJ5aIpBDGx2XwFIAOl95IS/GhA4
	 hd25wdQruim/dxRC5fr7+MPDQ2+0R/VbRJVkW0GbQ0n9BtQUytzeOSx+Y4Z1L3UqPjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795577144;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Erz/TKreaWSzsVmwg1IKp2XgEiomse9OFwyTdzC5zG0=;
	b=LYBkJcxYcGsSI8D1TyptA/yNUVIgj5lYq3shwv2BbgcxdhlIebWJv34MYZ8QmjinZ/jA
	 S0D9Vxs+HL7bGl+d2+EVtg97tKADEWuUd35M1GrlBvaHUXso7YsPZO+ww/O7WQrSTt0Rc
	 CHepToezwObTWrtQBcWNc0sFSz2TLhxksDp8ZPFA45FKXyTOg63dYvUlaBj0yj9qkHRdb
	 3yroHepKv8dBuqgw5Khv4mUxuRxjWUJRi4m8RDj7e36tm1UAIPvqeQ+rkBvk67o1Ik6wp
	 QQ12i8s7VUHF8kq2qihlSs+I7HG+LbTVlpI0DEMZ1iE1gl2+LbHJt0f1iCLqs33aw4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=W8le7JiH;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=epJPL5gj;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08AC8606A32C
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 03:25:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 08AC8606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=W8le7JiH;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=epJPL5gj
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP2B6Tc2625886
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 03:25:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Erz/TKreaWSzsVmwg1IKp2XgEiomse9OFwyTdzC5zG0=; b=W8le7JiHltt8AMUK
	JegkdsWsJOUp9KWHiz9j87oiyV1gLWetiEM//EXrpQAfJdZ7MO6du4MlnaPkZDu6
	DKw7M8LmhW0ekovdNyHyBYx6IBojggPx9QF1msyC6ncFcA21evjwg/kNAz+2zdBD
	aevGyBvH5rIMuCU7WXwY63b9Gckxc0+JP3ugNmwP8oVswY+m/oc/rmb+WvmjKuFz
	gn8OhSt98H5u3hvzadFtvjK7zM09vHK96qu77JYQ2xhQVf8wegumXydWtGM2CIrp
	9ieo2IXPYeJtPn9JzHKdqpwDcyVUtXrjK/uuLG27ECbb40S4h3rzrc2PpYoPhwDj
	gcnsxA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5mc28nw0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 03:25:42 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8b930598cf0so8953963b3a.1
        for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 19:25:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795577142; x=1796181942; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Erz/TKreaWSzsVmwg1IKp2XgEiomse9OFwyTdzC5zG0=;
        b=epJPL5gjM+Pe8hbvqMcNiqgU71he4oqeMgGYImraCdxmt2SUtSB330MZQ9bKY6P6Qo
         uRV7OpZAyXguLTfk6uZ6hRhg1p58N3UsadxCxPRnBNRu5d+39S+LdLbaJ0tIyXN42PCF
         AYSpeS+pQhTEjNE/UfmbXVC5+QtGZAS7jzmet59TKw3RjyqZ+m36lYnSPD+t78asEPDI
         9HwQ+lInTERqNTh/hUutwnXvbV01HMznGrH1qvZUH6qtoCxiouQusyQj8UKV9B11MSji
         Eu8u3OawwwHt2GdjsvG4yyJCQet9mcj4Vx9DxdM0sHI0dzgclz2304UWCCYFXncN1+AR
         Qcww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795577142; x=1796181942;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Erz/TKreaWSzsVmwg1IKp2XgEiomse9OFwyTdzC5zG0=;
        b=VwjBm9Kg8YMEw6ddA/zDx4xMDwzO4gZQrPKGE/JBvgTjKdaUThomnYd/wmoLnywkwA
         1JRnpPoORlrM9vlszWcvNggEhbuHiaRVUWA8LUZ2Q5qU5ltv7NFicXJaxwLTXT7K/3cK
         Pltg0hBYt6pfB9k9sAyd5dQ5M9wV54Pe3wDHmiDzJXMAPvks4zVaYNKEx2/itJ7DZig5
         USO05HoconpKM5LjFjl8XmkgfjNYVgZvm58FSQWS2m8ULdiIg1R6/Hh119AhKD3dPvHB
         hjBLSRqLe2ebkvmpmjGsNolzk3mMyKjPeTPnX+S5ldqgTy89/O3JiojAuxYlTUXHrGKv
         aP5w==
X-Forwarded-Encrypted: i=1; AL+hErE0EVQ5/pJiAo3hLPwb80R7wfGha9T99I7DAutQl7RX5oKMkne4G19xSzyRzyFc97k7ZCaj8kBDT1Zf@vger.kernel.org
X-Gm-Message-State: APuU4Z91r+LTYlHfMpQoLAlhdPvZePQ4jrhOhESM0BPP7devO+NCq5Le
	4R/RCcJJgGO2eJlCxFCNM+aah8xn0U7/nH18bZGNR9koJlNciBimY5WN3oxGS+xb2OSupNG9h4A
	iBTjb5oHuo3x6wQtlvZxFhRyh7+7MUpIBejIo+O24Ohd9GKdpkz5anuk3k3gNsGEv
X-Gm-Gg: AZFdTZdrzAQEOr3w0PcXFwMOD3z3UcY4+EoGHbgf6VGyP00Vk07//L5DqBGEo7TWH+T
	9d8Gy3aQfISQxXAF04TRhRiXApMFegbt0uo24AlKP1QykHbVjvfgcYqDph5ij75dqLBg3zCiOM5
	ytWG57iLj8TbOXtHWlqhBtjlFyNJi4XCmYx4ZATlvSq0Te8aTSLTY76/JDb0XJz9XkYFTNlOJqX
	JzjUnKjM92tuptxehX/W1q4gLJ0JdXVpXuxl7E3O5OOU5tyQr6WoPiFM0iogw2+j20kiCAaD/vR
	8DoqHt7B1K9nmLbwGM+tveM2BzEpY41lQmeR/ADDkU9UMzKE+10B+jlxwsuWJqSj3ZppRzKftDM
	nOpa+4ZeE2bGFOH7NnYsRiGquwzgD3BwFWw0AZr3dEEgqwNSMzUSYKocrJ26AS7DFvFpGXe2+nB
	ep8naMYvQ=
X-Received: by 2002:a05:6a00:1748:b0:89f:d449:753c with SMTP id d2e1a72fcca58-8c87b4efacdmr16716543b3a.10.1795577141865;
        Tue, 24 Nov 2026 19:25:41 -0800 (PST)
X-Received: by 2002:a05:6a00:1748:b0:89f:d449:753c with SMTP id d2e1a72fcca58-8c87b4efacdmr16716518b3a.10.1795577141435;
        Tue, 24 Nov 2026 19:25:41 -0800 (PST)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8cbe173453dsm4762399b3a.25.2026.11.24.19.25.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 19:25:41 -0800 (PST)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 08:54:15 +0530
Subject: [PATCH v12 8/9] arm64: dts: qcom: glymur: Add iris video node
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
Message-Id: <20261125-glymur-v12-8-5c34dfd73fc2@oss.qualcomm.com>
References: <20261125-glymur-v12-0-5c34dfd73fc2@oss.qualcomm.com>
In-Reply-To: <20261125-glymur-v12-0-5c34dfd73fc2@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795577086; l=4448;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=MebE4ri6RP0U9cmAhNt6gjsjcHyTYxkK1wQgrGzXkyU=;
 b=+7RFuJjpDffUB0PDvKDLPhKmonL0WHF1M0PNM6U6o2hyKv2laLXgH+EvdNfGBxdBc17n1Ukp4
 hvRhIxxpD5HDvv2Zj7Yip30TnCAAb4JNlmbgMCnXeFAyX3HUfYCslnT
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Authority-Analysis: v=2.4 cv=aPJlOr9m c=1 sm=1 tr=0 ts=6b065537 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=XTetivXjGLQkQF9siiMA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: v5edy5pgnCSCpkVE-gWB62NAbuTPgs71
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDAxMyBTYWx0ZWRfX6i4KvN111MLn
 YSCAcqp7qepSBj2LiXyZdIBZjoCdtuDWpyZHP+onSY4WOdj0l1HleF80sSi7/TJqR91mHsyxyxk
 cFuuteFVENfyllzT35JtMlaEko6lSHuKw9uOo8EeJ9ETjy1RLeeimfKzJWzSPfijk48TpAT7tpR
 U/LaVNHCzicGBWhdWyC+ki49/5MTYYRCYGPAamJs+85ADV80C59rn7hSbOHQKgvCE6kRjMerogW
 fafKS4KFSld8UDYIxIcdvcgw8VnUhdoqkqr4DFgrnN13W/CaJ6xfBTIiovBjA3YyX5ImPvUzyUb
 1yeBQ+2doNpamFp/YkWF7Qa4qZTktBPRR6bfV98fXv0dfGwOtPLHsXFXurfqkMAoVG/BCJEf78y
 85qrpxubokzvAXQhqsTgu41vgIhwNKxV3heRz+11lS6SDN7YquXWTFsqejBkvpioI2rW8WA9Cdx
 j2OyPhRJbvS8154mPCg==
X-Proofpoint-ORIG-GUID: v5edy5pgnCSCpkVE-gWB62NAbuTPgs71
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDAxMyBTYWx0ZWRfX2jqwxvH3RjhL
 VHWGYg1DH31O/zkeIYlZvtZLaSUlO/GHQpy1nz30dSsGy1NGky/h1MJ7w39qer+MiOYzb014Tnk
 lIMSVJMbgLqWkdxNe+5/Z18EPgU61DI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 spamscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611250013

Add iris video codec to glymur SoC, which comes with significantly
different powering up sequence than previous platforms, thus different
clocks and resets.

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Tested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 120 +++++++++++++++++++++++++++++++++++
 1 file changed, 120 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index 165dfa11f17f..ab2b499c1049 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -5926,6 +5926,126 @@ mdss_dp3_out: endpoint {
 			};
 		};
 
+		iris: video-codec@aa00000 {
+			compatible = "qcom,glymur-iris";
+			reg = <0x0 0x0aa00000 0x0 0xf0000>;
+
+			clocks = <&gcc GCC_VIDEO_AXI0C_CLK>,
+				 <&videocc VIDEO_CC_MVS0C_CLK>,
+				 <&videocc VIDEO_CC_MVS0_CLK>,
+				 <&gcc GCC_VIDEO_AXI0_CLK>,
+				 <&videocc VIDEO_CC_MVS0C_FREERUN_CLK>,
+				 <&videocc VIDEO_CC_MVS0_FREERUN_CLK>,
+				 <&gcc GCC_VIDEO_AXI1_CLK>,
+				 <&videocc VIDEO_CC_MVS1_CLK>,
+				 <&videocc VIDEO_CC_MVS1_FREERUN_CLK>;
+			clock-names = "core_iface",
+				      "core",
+				      "vcodec0_core",
+				      "vcodec0_iface",
+				      "core_freerun",
+				      "vcodec0_core_freerun",
+				      "vcodec1_iface",
+				      "vcodec1_core",
+				      "vcodec1_core_freerun";
+
+			dma-coherent;
+
+			interconnects = <&hsc_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&mmss_noc MASTER_VIDEO QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+			interconnect-names = "cpu-cfg",
+					     "video-mem";
+
+			interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
+
+			memory-region = <&video_mem>;
+
+			operating-points-v2 = <&iris_opp_table>;
+
+			power-domains = <&videocc VIDEO_CC_MVS0C_GDSC>,
+					<&videocc VIDEO_CC_MVS0_GDSC>,
+					<&rpmhpd RPMHPD_MXC>,
+					<&rpmhpd RPMHPD_MMCX>,
+					<&videocc VIDEO_CC_MVS1_GDSC>;
+			power-domain-names = "venus",
+					     "vcodec0",
+					     "mxc",
+					     "mmcx",
+					     "vcodec1";
+
+			resets = <&gcc GCC_VIDEO_AXI0C_CLK_ARES>,
+				 <&gcc GCC_VIDEO_AXI0_CLK_ARES>,
+				 <&videocc VIDEO_CC_MVS0C_FREERUN_CLK_ARES>,
+				 <&videocc VIDEO_CC_MVS0_FREERUN_CLK_ARES>,
+				 <&gcc GCC_VIDEO_AXI1_CLK_ARES>,
+				 <&videocc VIDEO_CC_MVS1_FREERUN_CLK_ARES>;
+			reset-names = "core_bus",
+				      "vcodec0_bus",
+				      "core",
+				      "vcodec0_core",
+				      "vcodec1_bus",
+				      "vcodec1_core";
+
+			#address-cells = <1>;
+			#size-cells = <1>;
+			dma-ranges = <0x0 0x0 0x0 0xffe00000>;
+
+			status = "disabled";
+
+			non-pixel {
+				iommus = <&apps_smmu 0x1940 0x0>,
+					 <&apps_smmu 0x1944 0x0>,
+					 <&apps_smmu 0x19e0 0x0>;
+				iommu-ranges = <0x25800000 0xda600000>;
+			};
+
+			pixel {
+				iommus = <&apps_smmu 0x1943 0x0>;
+			};
+
+			iris_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-240000000 {
+					opp-hz = /bits/ 64 <240000000 240000000 360000000>;
+					required-opps = <&rpmhpd_opp_svs>,
+							<&rpmhpd_opp_low_svs>;
+				};
+
+				opp-338000000 {
+					opp-hz = /bits/ 64 <338000000 338000000 507000000>;
+					required-opps = <&rpmhpd_opp_svs>,
+							<&rpmhpd_opp_svs>;
+				};
+
+				opp-366000000 {
+					opp-hz = /bits/ 64 <366000000 366000000 549000000>;
+					required-opps = <&rpmhpd_opp_svs_l1>,
+							<&rpmhpd_opp_svs_l1>;
+				};
+
+				opp-444000000 {
+					opp-hz = /bits/ 64 <444000000 444000000 666000000>;
+					required-opps = <&rpmhpd_opp_svs_l1>,
+							<&rpmhpd_opp_nom>;
+				};
+
+				opp-533333334 {
+					opp-hz = /bits/ 64 <533333334 533333334 800000000>;
+					required-opps = <&rpmhpd_opp_svs_l1>,
+							<&rpmhpd_opp_turbo>;
+				};
+
+				opp-655000000 {
+					opp-hz = /bits/ 64 <655000000 655000000 982000000>;
+					required-opps = <&rpmhpd_opp_nom>,
+							<&rpmhpd_opp_turbo_l1>;
+				};
+			};
+		};
+
 		videocc: clock-controller@aaf0000 {
 			compatible = "qcom,glymur-videocc";
 			reg = <0x0 0x0aaf0000 0x0 0x10000>;

-- 
2.34.1

