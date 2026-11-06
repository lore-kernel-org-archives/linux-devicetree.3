Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793973354;
	b=evqozQBYrVKWNf8W7vRfTP7KmubwAPvA9tNge+jJMK+lmOKbfGD4yG+BTliSgSMNqAsn
	 h8jlieUQh9vE2RxnCSzh3l908EFK9TF/DNNyCYFIKzrUD14KHeFmZ0Jmv/dodCJvMcbQ9
	 14qFg51T82HFBmGjjizgGU9hxTOBFze+s9Z87uHvcCZp8kRi1MvlQqdyoeyAe+0zpEEWO
	 Osy66cW8XxbVcS3LGuXivKVlIhsCU3h6TFInQUdnI0G96E5O1saNHzk8NPeuBhCMpj3PO
	 rHNcHLqfAhXVSEFeC58K0qLDpOmg1GWbKciZli0RyYP8CRh8ypa3qHaxPUpfvqurVxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793973354;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=+i3zCYKlwVyXIoRDbAyxopCOyrLllPYMgSlhQAZy5Ic=;
	b=khxFhUDpWxrWRcSClhnOy0u4ByKVLVqbfu4BqRuwrEuJ+bsv52fGoWOYLREzjVpq4Mgh
	 PQY7Ju7PN480PRXtEOU5TGmGJ24Ts/BPySVcQHct52XezKdVqd466Oj13T8/yvXH3HBoI
	 H96U5qhcYTYBwdiZSsS40z+mVxI5+KbR7W5y1wxLfH3DFOoLbxLIqSE23jHCzdJIw8eSU
	 4IKYEjb77NE/IKPsfEChmtCrJxyLdGfSb0c/AztsgW70vDi9BdbxRqXujbcl9iNfn3Xn0
	 yM0JCt5It1LPpE4Zk0xMS1qkZwgK95bxSFuZQ8/YORRme9x1RCwNSWHrrQY3dPZeqRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dyvZCes6;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Bya0wzpK;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 798716082BFD
	for <devicetree@vger.kernel.org>; Fri,  6 Nov 2026 13:55:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 798716082BFD
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dyvZCes6;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Bya0wzpK
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6DoT0i4089120
	for <devicetree@vger.kernel.org>; Fri, 6 Nov 2026 13:55:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+i3zCYKlwVyXIoRDbAyxopCOyrLllPYMgSlhQAZy5Ic=; b=dyvZCes6NiGDy9LV
	nUkUVCjJMmXfm323NRoS1JsUVpuUzvl9IIm9NBvE8Hiz8T5hMLIfx5h/xxxg7Q0R
	pY2BwAAhJiN48FdCL8uA9uLulO22LtIkJol+K8HgXsIhmimsFKfUtdsoMCx4TapB
	/YPhMV0I4poiY5Q6eon8Oy8GEhwUoAqvROaaEiavncEeVdn0peOD4XevxC+WUpEs
	08ikHwCorLjGCa6Geltc30VsuA0MLAv7mZmD7nqXjmcRlbbC8yNt2u2WYJVwtLNm
	Cea9hRIJNWnegv78qXy13PyjUtzWkRXR8OeYeOs9Var6JVqvjvOnmV4wsD74/VAY
	FxgVmg==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3pa3085-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 06 Nov 2026 13:55:53 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7cc175cb172so646120137.1
        for <devicetree@vger.kernel.org>; Fri, 06 Nov 2026 05:55:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793973353; x=1794578153; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+i3zCYKlwVyXIoRDbAyxopCOyrLllPYMgSlhQAZy5Ic=;
        b=Bya0wzpKbjPI4Jgj/mA4MdsxvNQSLMPoN/y0HUEsm7etdHwmm82oIrqtzXJdkmNs76
         rbUjCCHwBnRBKLJca45tci/2OXGnSKvoRow7c3TdQ2s/LAXHhW5tdfYIkhXW6tdnZsKW
         q/9DbaYlX5YFnCD3NQ63zQPJuxVDXKeLUbLEiYa/uz7E7R43oYEh/2pyFCq8HlEzqqa6
         XvYOIH9x6qBfXeN+GoXpFOIMps2rbKcMuy6tYbfx+uc3HKqswM5hc0IjiMshuHBpDPQb
         wJJqmvETKwo5+QSGrBSC+1J7LEw+VpQf3cT7sOYEh9aBeh0rotKc76tT+gXoYq0miXFR
         DEMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793973353; x=1794578153;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+i3zCYKlwVyXIoRDbAyxopCOyrLllPYMgSlhQAZy5Ic=;
        b=PMzsxe8+zQQ/fb75q+Tr9KiERhhX1X2IImk2ZiIDbI2ZZleZ2ir4oj6XbWGC1xcJOt
         +YbRfo0XOQ6UyQTAgOtxdVJ6k8W/2+ZxhBhNL4lpnDVWTGsQNqEM4ncObyUqgSzndCDa
         X6MXf++0dUftHVGTm/kBxQ3kt6p2klWvBxAxY0ycPmnXS1vOq22tNt7WX6kJylIRCa08
         vNc75HnFEjdwUCBpe/ge1efIrIeJLvJhnoZWlKLgeOj78g1kM8J6ccRWbsjM66V5HJfl
         r6wCEy10eqnWwsOkPKRYdTks6L9DSD7H0HW/5Oazo62N2X5qAbs1LGiJwZK9Opgs0Y7j
         RIiA==
X-Forwarded-Encrypted: i=1; AKwUvBw7D/TaNJhqKgRZP089ZPG3UFNdJPC7yuF/H0PA72W9YGYkan92zqEexT7vu8pakkHgdWphaj+VVSIg@vger.kernel.org
X-Gm-Message-State: APuU4Z/kS4T+WWxb+qHGVxXgBFk8TViDi8ueTgZm69iiaqiNvJE53xEL
	4H0b5mFuck4a9nZyIG+fdoZKlGVXrZJDTezBG+jnRpgIg6to4mXuiJ8NAs3vGJVfnNFsE8Nd36D
	nBhsaQr+/u7ylBt6FoEv7FtmzaE0oZFBnFT9GFBoW09BIo6JXNifPzIiP35Z/RWy0
X-Gm-Gg: AYBFou0WSZ8M30CdoaA8inBYfImnU6IBhjXsqEbT3H5SyBvyht+HeUpiWHdInQEqQVI
	HQ5DAU22Od/Yh7Pzw9r3r6GBEZC5k/U1apuq9ucCBVSjb2YujWV9Y7KgUe3q79yEONyqHdaUMEK
	Thw2iR7LemGve+aPbm17Tj3HpCjNL0SuIKaIXYT38yXgHVGYqgWbGn62ujeFqSMq0/ECymULklB
	VGPZuRxHmLj35Bjvi7eItmJNhsJWNZdMzlD624ZHGFqZ2vtAI6/em6fWqAoEz4HAQtGoIfukTDA
	2Er6Bxr9/DruTrMw6aa//UIz4UOia/YzcPoznMzDz5jSUX5hU3cUaNkmJ4yB22e63XjnG0BigQa
	ogcBFHy6BZ8j+p/ycu+JqmRWDAyS7MooeCZORYkHAoAwqdIh566Df9usDghY4KPJlOoOR6Oykuv
	b8EeP0qQ7gUFl79Ey6xuyUv8PL6F0saJHi5ueSaAUVB4p2FZbZvIVE6X0dAjQD3gG4CQ6QclsiN
	ucpPGtQN0IxjK/8S9SMRpyfbIH7
X-Received: by 2002:a67:e712:0:b0:7cc:226a:f977 with SMTP id ada2fe7eead31-7d2a1700630mr1387932137.36.1793973352453;
        Fri, 06 Nov 2026 05:55:52 -0800 (PST)
X-Received: by 2002:a67:e712:0:b0:7cc:226a:f977 with SMTP id ada2fe7eead31-7d2a1700630mr1387915137.36.1793973351926;
        Fri, 06 Nov 2026 05:55:51 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:f048:3e89:c517:10cd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d809df2dsm3963256f8f.51.2026.11.06.05.55.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 05:55:48 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 06 Nov 2026 14:55:24 +0100
Subject: [PATCH v14 8/9] arm64: dts: qcom: shikra: Add OPE node
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
Message-Id: <20261106-camss-isp-ope-v14-8-49c426cd2715@oss.qualcomm.com>
References: <20261106-camss-isp-ope-v14-0-49c426cd2715@oss.qualcomm.com>
In-Reply-To: <20261106-camss-isp-ope-v14-0-49c426cd2715@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-hardening@vger.kernel.org,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=PLeaavqC c=1 sm=1 tr=0 ts=6aeddc69 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=EzCDy3pf2FPqfMyO2-oA:9 a=QEXdDO2ut3YA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA1NSBTYWx0ZWRfX0WeTcxZ0bHCT
 GoJwoWW7gKZeDCFlEYpoMEXKidcKMK2zh7eM2XmvijEbpCRYFKTVBrn/MLJgQdlF2c+7ls0CxtG
 lVX90opj6tYUG9Ifv4/UtC60M1EftzQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA1NSBTYWx0ZWRfX8zxTg77ecrWP
 Tinl824VHrdi1fRgajlSBRMPEepQ1FshqYnw0Vpc7TyYSCHVL1tqCE7howe7BGmzTZh8Ww9vTT0
 DgbUS04TXTsnO4AvNis4RVyFcheQnv8c9J6tcWLzyMGawVKBlknJETPHdyYk2jRjAznMrO7LI/o
 dT7twQ8CnVuBGo3tBJw97nz8CzXOLCSjitLD/Qs05RlsMRRbBbuFIAfN8bLcKsB446hb/0/0kb5
 qD1HoxaDuNKeJFv4fkPdc7eLjnaW1H18Olv64788fpwmV/x+R1msk5kiA+72bGgxfM1f6YDvCfy
 sn/FpnZ2GiGL0NhoQGTsP41M6wJr7W8i1OFOIfqaKWxlnNlpEBIN/6NesiQ2l1Biy4V32F7zJHR
 UxOnqqj+9tl5VWB0PhfC4nYdnweffkl3EyXFG97pWrPdGOMCnhpLBWNSmL/gYkP2D0eHj1dIckf
 iko06IqvIgOBqWfYnEQ==
X-Proofpoint-GUID: yvk-ekYxqD4ORayCcV_glkWJUnGPu9G1
X-Proofpoint-ORIG-GUID: yvk-ekYxqD4ORayCcV_glkWJUnGPu9G1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 spamscore=0 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060055

From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>

Add the Offline Processing Engine (OPE) device tree node for Shikra.
The node describes the six register regions (cdm, top, qos, pipeline,
bus_read, bus_write), clocks, interrupt, interconnects, IOMMU mappings,
and OPP table.

OPE is a memory-to-memory block with no board-level dependencies, so
the node is left enabled for all Shikra boards.

Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Tested-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com> #Shikra CQM
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 77 ++++++++++++++++++++++++++++++++++++
 1 file changed, 77 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 2623e139196f6398c57b616879a37f84b83d59ac..b95ad1e61b9b4ecd29a1b7b7fb0c2c52ce31a967 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -2357,6 +2357,83 @@ cci_i2c1: i2c-bus@1 {
 			};
 		};
 
+		isp_ope: isp@5c42000 {
+			compatible = "qcom,shikra-camss-ope", "qcom,qcm2290-camss-ope";
+
+			reg = <0x0 0x5c42000 0x0 0x400>,
+			      <0x0 0x5c42400 0x0 0x200>,
+			      <0x0 0x5c42600 0x0 0x200>,
+			      <0x0 0x5c42800 0x0 0x4400>,
+			      <0x0 0x5c46c00 0x0 0x190>,
+			      <0x0 0x5c46d90 0x0 0xa00>;
+			reg-names = "cdm",
+				    "top",
+				    "qos",
+				    "pipeline",
+				    "bus_read",
+				    "bus_write";
+
+			clocks = <&gcc GCC_CAMSS_AXI_CLK>,
+				 <&gcc GCC_CAMSS_OPE_CLK>,
+				 <&gcc GCC_CAMSS_OPE_AHB_CLK>,
+				 <&gcc GCC_CAMSS_NRT_AXI_CLK>,
+				 <&gcc GCC_CAMSS_TOP_AHB_CLK>;
+			clock-names = "axi",
+				      "core",
+				      "iface",
+				      "nrt",
+				      "top";
+
+			interrupts = <GIC_SPI 209 IRQ_TYPE_EDGE_RISING 0>;
+
+			interconnects = <&mem_noc MASTER_AMPSS_M0 RPM_ACTIVE_TAG
+					 &config_noc SLAVE_CAMERA_CFG RPM_ACTIVE_TAG>,
+					<&mmnrt_virt MASTER_CAMNOC_SF RPM_ALWAYS_TAG
+					 &mc_virt SLAVE_EBI_CH0 RPM_ALWAYS_TAG>;
+			interconnect-names = "config",
+					     "data";
+
+			iommus = <&apps_smmu 0x600 0x0>,
+				 <&apps_smmu 0x620 0x0>,
+				 <&apps_smmu 0x640 0x0>;
+
+			operating-points-v2 = <&ope_opp_table>;
+			power-domains = <&gcc GCC_CAMSS_TOP_GDSC>,
+					<&rpmpd RPMPD_VDDCX>;
+			power-domain-names = "camss",
+					     "cx";
+
+			ope_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-19200000 {
+					opp-hz = /bits/ 64 <19200000>;
+					required-opps = <&rpmpd_opp_min_svs>;
+				};
+
+				opp-200000000 {
+					opp-hz = /bits/ 64 <200000000>;
+					required-opps = <&rpmpd_opp_svs>;
+				};
+
+				opp-266600000 {
+					opp-hz = /bits/ 64 <266600000>;
+					required-opps = <&rpmpd_opp_svs_plus>;
+				};
+
+				opp-465000000 {
+					opp-hz = /bits/ 64 <465000000>;
+					required-opps = <&rpmpd_opp_nom>;
+				};
+
+				opp-580000000 {
+					opp-hz = /bits/ 64 <580000000>;
+					required-opps = <&rpmpd_opp_turbo>;
+					turbo-mode;
+				};
+			};
+		};
+
 		remoteproc_mpss: remoteproc@6080000 {
 			compatible = "qcom,shikra-mpss-pas";
 			reg = <0x0 0x06080000 0x0 0x100>;

-- 
2.34.1

