Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793956912;
	b=Yq2vfpsqhriwJW0hl+BVbyjKRZjgyVDanKasvBXRWkTazowDwMnkNzAL5dFfC/JyOE0K
	 efDp6C/zN+dmTDTyFXpSodjPPGfzZhfez8ny0rKzouMuqBRBMZHaPVm7mxASf9VPMaVuM
	 cYA6FHB1W6WZPoEiUUxLInTPPhpkQzyJiAeV+JB0THPprR9oTIh04Bhs4Ty241aprx8lX
	 G9R2Wc7mrhETtf+xe4HOOz25u8GrjHpwjD2/OuV8v2YWMAo2ooTCRdUb2Ug1NgOT6KR0E
	 Goq0PKESsNCy9xc0p5241K3b6ppqQHorKmfS7nignSYTZBfoQKEt5J52UWATMW+C6dQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793956912;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=/kpOyvftGfgApBEnhOqKSrtQQtbSnux34PBpSu7+OQU=;
	b=mqd7EUSgq28zAYoKetSfr3qtjFL3F+HSHWibrg7Gf2C4GBCYTKUTwN4licSQw4y+VJSW
	 ANi9MCXEe4eoA2jEDVPOSQu10/enYyLoas/iYhyoCxvrfar0rMsVOzszMO95uRkG1Y2+M
	 y6gIYMj1EWlJeeIrfHd2xrAbVX8crXaRQJCFkMCZp8/TVF9xTIV6LCIjHp00cLazQmjQt
	 9fj3un676ZX7p8yE+FAWz0M1hjN0zVoSZsfX5d9GwU0uCV0lVCi2nc3HdxTJr4uXd+OGP
	 J+BAAdXJxyB9Q3uidGDcMbPr/3UpaAb8vRYMZXvLSfKSRe90y0uxp9hpGjNKaWdM+jg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Xo1JhVKX;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LSDskfeN;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8A92606D82F
	for <devicetree@vger.kernel.org>; Fri,  6 Nov 2026 09:21:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8A92606D82F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Xo1JhVKX;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LSDskfeN
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A67RIJQ1679453
	for <devicetree@vger.kernel.org>; Fri, 6 Nov 2026 09:21:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/kpOyvftGfgApBEnhOqKSrtQQtbSnux34PBpSu7+OQU=; b=Xo1JhVKX77fbpcrO
	aera62y9qKBPU5VpNd/JzPwbOb8Nn07lhqzhDBCtvdEUogEyP263nIpZ9T7iYwFM
	OObAR4Q8cb0ViJS+90OiMmNVjqHg2K9nNujTx13txPnbpqrSUWTUZcdMCuTKQrau
	hHJ+zuEFabU7cDEHBQt8PJ2fV4mYMj+DooKeoVKp6byhGGRO8MQBsBqy6uO6zx0m
	27njwpooKpfnjL3wAAllP9/pkrTFni6itZLzOW3q0KLViN97CX4WntUs0u0Y4pDM
	/XLeTd9ND0m8ZzKEMluxOG6+8ZfBxg+XenS5p4Cd41OpcbHxDi5Vr6sfJfwclCJ8
	UwnzFA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3pca2r2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 06 Nov 2026 09:21:51 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-341eff9e381so1004992eec.1
        for <devicetree@vger.kernel.org>; Fri, 06 Nov 2026 01:21:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793956911; x=1794561711; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/kpOyvftGfgApBEnhOqKSrtQQtbSnux34PBpSu7+OQU=;
        b=LSDskfeNl3peHJLEKbnjlMaPX88OOoSx/SPIKg3FHptlz4UswbpnLOWBkdO+GhDYFZ
         c26g0SMGYxzWdEZQvqcqEYjw11tND1WnsXuwUDWqopcUPGDvBv+3GFL5wnMVS4I0Mjms
         1T1vzkzFeNwtVLXy9CxXKtHZsyRd9xKRKCaTRrTmM+1XiErXXtKwXWPZ6UUiZxttJTDm
         GGmXkhuHV6OAVsWjo9z+QGLFAscF4j4PDbXFKLGuHBbFMNIAHt/c8X3AWi+UYVsaFMYj
         NL/GmkPGJ4Ba02G1tqStM308ew1QdIWXXky+b1qMGHZVDWcote8uBIPfPJg24fkMwGmZ
         QzgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793956911; x=1794561711;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/kpOyvftGfgApBEnhOqKSrtQQtbSnux34PBpSu7+OQU=;
        b=rcZP4BPVcZ9qPV9JL15CU8dkGtE748GVP7QvodD2MEsVGWJrS4AC0DOGY77kDC6xV7
         6Ngfy+fcslBIAWf2AzY+6jEH4lTeY7/s0qrnkGRuDULlaLTcGBnoAzWJ9V91YQixl30T
         wacZh1DriJUDJgtoXWCJ8uy25pEJR7B3MPkZJb/fqXtlv50NDEaxf0OEkfeXCIY6W9OR
         +B0yrAjZpeAos8szqV1ptdwW2k91NOJwSIvdhGubLedZIqMTKxdMzNovECH99ilWqO/V
         KfRgAG8yCnpz7Wa/rrzPi6ezkoxSA6EB/cdDH8xpZwgjFc32reLN60Zf0VmY2qcGjy0Q
         3WMA==
X-Forwarded-Encrypted: i=1; AL+hErFpWX/NWgk4D6n6jahqLKTpW1P1NZveSnDv9EowQ1/Pj5Xw6xRVnymvm2alqobocyq0K4KbSek+an/q@vger.kernel.org
X-Gm-Message-State: APuU4Z/zxzPKNb/rrXCmHELoI9dBrOxzONxJ8lBJjtLaOaW0z9o7bFHJ
	HLVX6ivWh8AZiB7aD4nl24v7GZDCZXO6+D+ef7cr8eMpKAXco5a7iIDb9ydbYMidIYE+UFdniRY
	8tLK/DcEH713t8G9VneyGRA0ZFn/oir2HTNz91UJfc0EQ6vCX7Cpg9tDLZVpeouQ3
X-Gm-Gg: AYBFou2uuyaFHqNAiUJyTJGRF3HlE6a9qRbfxS4DbMYFUP+o/VbUs7pCAVbTOpkJ5W/
	UPkZjx8v3p6pOWvCyRIjZuXYqsvzCswc6YHszD1GghGqKBE5ZfELcYNpA0YWEVQOSzjFQSRJYRu
	OBsbjtf4ACDVvJyGwZf3SwNz+q5VoGGcU51tBiDxpFDUJ8dTega8TiOlcmdSSHFx3enSu+ecvWH
	zxU/y3tczgOgnTzY794zsi7QLtkchPN8063b5TNz5bHpQRLnT7oLWKcaUKEZZ71OgWPdT8buzH6
	0w9PazTjpP7NOrvfqo1MqBbvMvu8Q24LdLHieAb9qbQeJUsepAitzpBQUoy1P7vfsiT9ULbufSz
	OOdLvJEn9bmDhMXomAle0z3PVwtBQlOI9nXnfFGYkJUk8c1C+6KNmYWeEbekWPXi+HUauFhQ+pH
	m4GlyZwQTOXVOvvv44n+S6eNAUklGIZD3O4xTg89ACMyO82VHAjpaKfVtPrVyiZlwsUu6dWuxci
	NODPA==
X-Received: by 2002:a05:7301:4d0d:b0:36e:ff7e:e57f with SMTP id 5a478bee46e88-36f75e28a16mr2454535eec.19.1793956910667;
        Fri, 06 Nov 2026 01:21:50 -0800 (PST)
X-Received: by 2002:a05:7301:4d0d:b0:36e:ff7e:e57f with SMTP id 5a478bee46e88-36f75e28a16mr2454512eec.19.1793956910018;
        Fri, 06 Nov 2026 01:21:50 -0800 (PST)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa96fe226sm4903912eec.12.2026.11.06.01.21.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 01:21:49 -0800 (PST)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Fri, 06 Nov 2026 14:50:59 +0530
Subject: [PATCH v8 10/11] arm64: dts: qcom: ipq5210: Add SPI node
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
Message-Id: <20261106-08-dts-v8-10-d91401955039@oss.qualcomm.com>
References: <20261106-08-dts-v8-0-d91401955039@oss.qualcomm.com>
In-Reply-To: <20261106-08-dts-v8-0-d91401955039@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: yKj2hfpBsckPwlU9qeTnAlSlChnDjb2-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDAzNyBTYWx0ZWRfX5O495pIMD1YL
 8ql8o1ibl+7KrQHvKMoF8iaH6rk1SdkW5lJVFbJlBK7iaIk/EqtGyfJMUsloGSoKx/q6TYiuzPj
 fnwB/q0nL5vNCHTlOqaBhNoLDY8Yzob5i8n7Y1rUxDOCR5a4hIqAlhsCSlYZaJ0AMYEX8gWhq48
 iP87QCOV3vlpGswZZIlkfJNcXFZNbnRd+ZeSn6Se/TS2Y7c/DKQ/ULm7YHBGZ6nQd8lK6Lulho3
 J6JYJqNkuSCuLZhVN3EUimyNZAmr5Y4ep4Oc0yF4CuWDFL/OPJq1QmNTjbdJuuDiwnVNeCZsVxd
 ftvUVr4HmwfeR0kOIR93U3ymSRuRRsHXc54He/s2QfJhE6UI9nblIuOw4bcJ/NZ6QMd9qvX6l5k
 tZn8nsovu4766befL2YraMIXd2fLxPE6TwiT1pkHlbO7PEhGnPOD4oKp7GZy2ETB7ejBPGzgs+U
 1iWLPEyU4ObreJF68pw==
X-Proofpoint-GUID: yKj2hfpBsckPwlU9qeTnAlSlChnDjb2-
X-Authority-Analysis: v=2.4 cv=TI3Q2Fla c=1 sm=1 tr=0 ts=6aed9c2f cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=ll64UZJxbc1SGzsXvscA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDAzNyBTYWx0ZWRfX11NosC0qn/lz
 aaDOQGGjQ0VhIVHwd2fMZBLoxUIrv1SwBtpG8TLbK5GMxXmvREyR8WdGaUZ/xEy0FW+INBkqGje
 pM+zq1yubj+cq1awDCkxqzzBM73v32Y=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 spamscore=0 phishscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060037

Add SPI node definition for the QUP SPI blocks present in IPQ5210.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq5210.dtsi | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5210.dtsi b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
index 35cd55881969..61a58fd5d4ce 100644
--- a/arch/arm64/boot/dts/qcom/ipq5210.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
@@ -168,6 +168,14 @@ opp-32000000 {
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
@@ -434,6 +442,18 @@ qupv3: geniqup@1ac0000 {
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
@@ -470,6 +490,18 @@ i2c1: i2c@1a8c000 {
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

