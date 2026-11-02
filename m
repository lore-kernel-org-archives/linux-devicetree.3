Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793634816;
	b=1nlegidL4B58m/stmd2jax2LzCtF3CqE5djU/XzgbDfEyunnyHsykR5j+5en8D28b6by
	 lcNijKVz9CKiSm4N0KVa1eFtdn4APXby+2NgLNgN+9Q0DUTqaFUUJ//s49FFM+6UHETMP
	 t8xesYmYLBnI/20f84Xyyv9OiwW2vOeFFh0oZZE/X3kTiw/kwrX42uYqmYu6zxCJfF2xW
	 QuvvY8RShGjOQbgWUFc+gKclIGF+ZUZiFrPawiia7qslH+csmGrpnWcNqaugGKwa394gg
	 dU/qeENKoQHHZV2IICghqxil7Fzr1e3B1X4kJxvBKfw1AW18gvHzu/KNd2GoCWOr1Fw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793634816;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=/DSZu+jbu0jZeeLie9bN2MaVWrbMxbYdgLjXWmOrZjk=;
	b=g/S4Y37S9tbSA3KzLSo6m//OO4Lo3+nBvKGWO4aJqI3y2gxRheCGN9mqwnkUsDRzJfjj
	 6FOQx5twGs9hvqYZwq0yjidtrGiXZugiJZoDvWIjQCzAQiTNAetgCQyU8xHn19KqkalFB
	 8hnKLHkbfY2wfs+my9R6ZlDjWy87v690yZtuvo1QLS8C6947q7z0/gUsGCsYlv9niKpL6
	 UMmsKC5LxVk/BAEfQ5tXwZZAQ38e0kGf/J/DTVqXdlwG/EpmiD2nGXR0TctsJTOumZgoL
	 jSSSutuzJHu6AbJ0WgWgU5t+/sowrYeR2KnPaA84rcMqzsHDqBK9q7AcYBWghdMjOUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="lvZUvyh/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VRElx68b;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCC3060B4275
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 15:53:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CCC3060B4275
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lvZUvyh/;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VRElx68b
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2DpRcI846152
	for <devicetree@vger.kernel.org>; Mon, 2 Nov 2026 15:53:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/DSZu+jbu0jZeeLie9bN2MaVWrbMxbYdgLjXWmOrZjk=; b=lvZUvyh/4y5sbOXg
	zTDlK/T81S2vA2XvHRTKpYgzmJNOxFk8WmQjV//HFH07iH30e36PEgrzYHni4ieL
	R/z8DgNyJqOiNzjqePLBeIXv1HBZp7drIrcJItLfoWkEwvakS6hU6aqj7K7G4qnu
	6YIdJAybxD/vs6VST/oAe8IlO21U8JRLe5b2EwvSWaAZlYjzIpbwLqRtey5r6rdQ
	ezpBsYODYWbhzWT8P51CTKTedoZRmG3cXWqxY9UBCsPw4pcgX+LExFvs4VxT1lTA
	Wu4keEGUwEPa/T2epOv4v1KoSEnmyktEYyVm5EhgXMAmwuyvu3BM5CPm+jxJYxF0
	g2QIkQ==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpmf1tg5b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 15:53:35 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7cc06b9ca9eso579289137.0
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 07:53:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793634814; x=1794239614; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/DSZu+jbu0jZeeLie9bN2MaVWrbMxbYdgLjXWmOrZjk=;
        b=VRElx68b2ro3YuLyW3vcW/wMsbk9Skc8D2JYROIFf71AzaD4JztdTzK0fVG8B7IdSY
         qqM4PH/3lU99LmHZtllQc171TiB4zLffUpiXdxPJSMQeF7cl5LMTVaWk7vLzrwb/dzQR
         9iIy52tNV0WO9kB4BSe4fMLskU5XCtsMFtqNPfQ8WDeD/9WIdYDjkAi4G4p9FWj/vgu8
         73GFlWviaPQ3Gxjr3n5h+pvrRAmCch6fhQxLhiP9egukpi65rfrgf3Z0z2oU6ZT+wSBO
         c3slcWZ2B+eobKIckzCh12w4It5FLwV3GeGQx7IblWuZJwN4kJYpY+kW3kzP2jzORQfA
         30xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793634814; x=1794239614;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/DSZu+jbu0jZeeLie9bN2MaVWrbMxbYdgLjXWmOrZjk=;
        b=Yb1BuwMmGl+G/MKnlbzy9tB7XyvuQZsPIFgNMEIWAUj9CcQ6InUdSBaLF+VLqCqTG/
         tlK5VEuT471ic/lynn39dUtf3SFqVsHU0uJzr/L5fUoOjbooYU1iQM/4sO1HtwhTJay8
         g02FhPXwTuL0NggXYLvf8rUSliU1hMctcZjjITVvch28izVTzwP1mlfpL4bvSvU+0UY4
         dxfv1ISqmRB/TA5AyyBf1KJtDpDAzj5bL5qvMpVNOZAVJLi8jFS4YlGX+uRPeiqdAYj2
         CG4fL8u+6FCDK7vZYhXVMGgn5iCJ+EaTrD7KTBzBDk1Mx5yOZsRw3Cp4kIQW5N36NnIR
         N+KA==
X-Forwarded-Encrypted: i=1; AKwUvBySDVa7rfGPrlzl8IrrVhZDnfoI58s+qzRTmIElXPncy4VAgazWsgB+go2SIi3BA8gPzfEa2ncEw3ln@vger.kernel.org
X-Gm-Message-State: APuU4Z8rqciEFceAAp3zSgtjYM5zUnm68u7KyDMuuqV0JewHU3ywnbCX
	Ee3+HxLA7N95axrVb+MBKNS48XeFRiNJ3McMDr4v39t5mq4fKufUy5Du4q8l0zw8tr/nhvhFNiV
	7kWYt3yORj7mOqRLlPbEQz495jpW6PxTzNIFRck/HN8RnrCisCQsDccQ/pyqfnEAU
X-Gm-Gg: AYBFou0hqqJjw6I6gCBhfEPHgnKrnt67MvFJtXA+VpfKbbd5KWXVAYWVBjAyoQfpsvm
	bOQHk33H06vlY7oJTAxhC48mPYFKhEGZ5VKMrU/m20KvBq4LilxoLZdgxvnJNgbCl0ft2fhrOjG
	WQ7+nt1k4SAfBkNkV+Y9YOe/nl36tCWtOe2wQFTOJcjXPgaCvqsA7FnJ+pL3L7eA5eJg1qGntCK
	uM+z4HkqWVnpA9OaGeIf0mGcS6WzWkmVyw6ryFLMD5qiiXrSLkdwi4Q6OhUswKaS34npvdriiNW
	RRolTecElVV7WZV2Au9MJVLER6yhritWDgcWfCvDmroHpRmv+kFWR5iTHTQe75UX9V3KakAw+ex
	tkEmH6CgwuewADdtSXunYHZcFl1WNLl2BIOc4u62Yp+F5kcxXRpHHgaSv1g+MVyra+Tcntmch9e
	5U+kpBX5Ks5MS+yyRK2p1u5cEcaU8Cyyo0t37Bj4iDBxZsXJ/7snszx6yA/KLxJRLcPAasuNfnP
	hYSm/1Ya68nusAfnYwJvS6yGb7V
X-Received: by 2002:a05:6102:14a3:b0:7be:37d8:1567 with SMTP id ada2fe7eead31-7d0725cefa6mr4035695137.10.1793634813800;
        Mon, 02 Nov 2026 07:53:33 -0800 (PST)
X-Received: by 2002:a05:6102:14a3:b0:7be:37d8:1567 with SMTP id ada2fe7eead31-7d0725cefa6mr4035677137.10.1793634813226;
        Mon, 02 Nov 2026 07:53:33 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:f048:3e89:c517:10cd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b8a7d1sm20700323f8f.38.2026.11.02.07.53.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 07:53:32 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 02 Nov 2026 16:47:39 +0100
Subject: [PATCH v12 8/9] arm64: dts: qcom: shikra: Add OPE node
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
Message-Id: <20261102-camss-isp-ope-v12-8-702254689feb@oss.qualcomm.com>
References: <20261102-camss-isp-ope-v12-0-702254689feb@oss.qualcomm.com>
In-Reply-To: <20261102-camss-isp-ope-v12-0-702254689feb@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: KjZm99I4BiRChHWj4N5ha_Gi5z_2OQAN
X-Authority-Analysis: v=2.4 cv=bNaDs/+Z c=1 sm=1 tr=0 ts=6ae8b1ff cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=EzCDy3pf2FPqfMyO2-oA:9 a=QEXdDO2ut3YA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA2MyBTYWx0ZWRfX0X5BryKzuW1N
 SiTh7zEesKkHwYizP1O+FYY9IAG4o5zwwVeJyrzPSojiZHx497tZwWz8hfySUw1sh6JU4oS9oHA
 OvaL0KwQJFBunUA5VED1DYImAzgcZkgkYsBjNv+opf/Qh6fxcIOZQHob03cEgGwXD0jW/bWTwan
 76PPaRJkVAco1vF3EWsFHT8YkcHS6dMhoeuC/cDrs46nt1UB9MVvilebEgxc6SRoTBrN4LRijmQ
 TkV4OWSZ4DiarTtcmNHfHWJGF0SG31gqOYrdObFQzb5FarKYtC5ycZP+HhIHZF+Uv7eMDmMqh8W
 7aRkPGoBbzpPrTHfVp4poTAqJIy8b3wrP8bH/A7PrvwBHYyxb5alXWoNeTay4Zm3NLmaMTrEJ1P
 3EaMj85acrjmPyu1GVfjC+iMAofSZw8JDCxDul2HYjwExTsd15CU2f22NgkthDeYGVt/TfKCZyh
 eUsDdVzbXQcoKsWmgOA==
X-Proofpoint-GUID: KjZm99I4BiRChHWj4N5ha_Gi5z_2OQAN
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA2MyBTYWx0ZWRfX3EbEM0fa3Fkg
 QRGWmNpYOUY85ZDqD2s0HtikaevNdsjMXZq6jbRV2Fhc7u9GUpztYF1LIouKn8KlXWrxZ++2WP2
 TwnDcAFQmCnc+eIQb7WSqmLcXul7YIM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_04,2026-11-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020063

From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>

Add the Offline Processing Engine (OPE) device tree node for Shikra.
The node describes the six register regions (cdm, top, qos, pipeline,
bus_read, bus_write), clocks, interrupt, interconnects, IOMMU mappings,
and OPP table.

OPE is a memory-to-memory block with no board-level dependencies, so
the node is left enabled for all Shikra boards.

Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
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

