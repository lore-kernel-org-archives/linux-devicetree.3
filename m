Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793953554;
	b=VW5We82y15Y1luIdykjP46VL5Phmz/GNzK8OX678/p+z1fDKOfi/udaMv2Uin/8h6WiW
	 7IBskF/SupZaws6NVLRI51A9LIrHMcet0v35tZmJ6nf/YVKxiiP3s82TjXj3aUN2EssGP
	 sRJqS/2PWAPY4/OIq8ZoeALgjZISrxKuHQ2TFdbvvhGVeTMV8G7OcDiixs7uDMkdglVkI
	 TLL8/MsxRQe9WfqfQtR2iRN0LwhMYLRhl7s+ABZLgi5+CSkUL1RgM8K0KEeVkTpIMax7y
	 JtBy5c7rzCbO8NibKaD3A/Tq9s9WxGueVIknooluz+ZUvgnR32WnivjnU6rbtGv/xlg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793953554;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=uDpQkXtjRd+YyxjvJI6u+sQZ6QgWckPPm+f5ZddDO8E=;
	b=fTfsq57VjLWgno6kOLOfGxmI2bcS5ltdP0aT3xD0NOtXCvEyLhPp9tFRpJ8O2SioCFa1
	 bpV/q9DflQ46YsPB42bA7qr6qbIuAwS0wSxV/Ot9TIs9yoi0e6iq4qsyAxMHK1J6RipiQ
	 ZCf+LWZgl4n74Q8f8Xn5DM9j788q1OLbvi4CHWFXYN6VlnmwuFcRBVh63U88/1jZDZDIt
	 MaAw9/LYc5YJy7pmeM6byD7fKqqOvYNiCPOH2EK7vJbAYfZVRrIQ3mlV/xGOor/gcdM07
	 N7WGVSwjia6+5VjdYXdbM2P3V0Ms6HfvM4kZTizfY77SihwkXdSGDiJYM46xn6ak3zg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cx8CPTlA;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gKChNoW3;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A77C606D802
	for <devicetree@vger.kernel.org>; Fri,  6 Nov 2026 08:25:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A77C606D802
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cx8CPTlA;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gKChNoW3
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A67RQaK3301565
	for <devicetree@vger.kernel.org>; Fri, 6 Nov 2026 08:25:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=uDpQkXtjRd+
	YyxjvJI6u+sQZ6QgWckPPm+f5ZddDO8E=; b=cx8CPTlAqC+vM0l/uY805tndufC
	7Am+LQmUIpCOG26X8gi2y8O3Ui52v4ZluzLHh6SoDUZfHUyEZUfn4AIFWC6DxwF6
	gev/nq32AmRH/35JHx7cgsxj3PneJu4Dl8Vv5GFszBgWvJA3s74xKxQnCx6sOBBi
	k5ATO/6ZIs84EcT8vlb9bHsKkd8TQKWRqN40vhWVcBpQSwQCE87qN2sZSbggIXdH
	a9lha3tU+n2eElDYERBnLLSoypW5vD5qPLwSAxokkRTkpiH5qrpqRn3mw26qydEB
	py2B3yFdzEy1m2Rwtw3QWFz5d4CQbWjShe7CmKPjwCfHF/AH8xgAYq5zlUg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3pa1w1s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 06 Nov 2026 08:25:38 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cb71b1443so84192385a.2
        for <devicetree@vger.kernel.org>; Fri, 06 Nov 2026 00:25:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793953538; x=1794558338; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uDpQkXtjRd+YyxjvJI6u+sQZ6QgWckPPm+f5ZddDO8E=;
        b=gKChNoW3sP9Xwp8EpcV6u1LavTJkIC495j1wUelu/uqQ4e2eABkod1jc++VMExr44c
         /hZh2GORJY19KhH57DaFJHgQk24CiMIxhLAIKoSEEWkZJb/bjBRneeArce2kRlYWshy5
         /AmHgNWAtU7V6C1RgpuZMFQtpq9XSZoOLfG89dx5SWvXiQpE6GdsuLySmDBaYBlPWzrO
         ADGbh29oZduK0Yz8XQZajIi1vcgqWOL3W6F6qxZSx9dV78siAFRy77pR6SkQCzGFvPLg
         pVxRlmzfvhTvswlWQODh6yCILNVqH5SxS2gCDGkOL6olySOac3i4lWO4SSV3zI7wHfkv
         o7kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793953538; x=1794558338;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uDpQkXtjRd+YyxjvJI6u+sQZ6QgWckPPm+f5ZddDO8E=;
        b=0foYjmZUYIoJbUueu5ooknAgmDrRtNAIyV8o2Ilf9JCsjhsc8QEgpIRu3UrdJ20Ntt
         EfkwJNhdu8nkGRLScOm9s2rfrjamzh3L3ewkSolFGvYfORmsFzksHPJzzQUtH5cRFLS/
         /cMnt1/Ri+eShqKt8qEEKpYtYV2nK9bzoOLZ+MumMiQqjVsNqtiMktgHSoeO7V0/FEoL
         UtnbXax0/E7TqIHJSlg/ro08nH0ci1M9CrICZleOBQUpezpuatwTW9TAxiPr2jqNiXMn
         qNR0fghI53lVy0OzkPIEoIqlVrJeKNFD679fdT6jseazM7Ebx7dDsBVYWEMolXoYbA7O
         zGkA==
X-Forwarded-Encrypted: i=1; AKwUvBy7qahGY0x+IZVNb7GhzN+h4GC4/BzGWEB2uyDLw1uKKTf0xJQ0yrjS7UcewdFZjYW2tanWWKgZecCp@vger.kernel.org
X-Gm-Message-State: APuU4Z8qxJ8ZCnx9MEztamE4ZL4030tuCWxbVjWZuojfAL2UdVi36HTX
	wX5L86TrGEuzJKsaaLPW86dolJaE4NbK3roJ5VwHvR0me9Hk7CET2Qr7x1eXBeh9RmTwtMU5RER
	IRpT3ADxWXDU1hGApBxBM/AMb2gbMbhSKZfTKvfu6ty4IltTlZICknr22GLASzeCa
X-Gm-Gg: AYBFou1d0S56pebR9MazFXuHy6UWFbA2w+uQnanc0mkfWTrKpNSn9Qms4nbEpi3Jabg
	GWTw8VfkcwvlR+GNPBwsSEMuhk/Zueabuh1W88Dd5WT0DLGRh/VuMxy0Pl9veLYQXZCBJ3Icsbk
	Fvfg+uL+9gz4TMcvZwnmiTrbrGHGfruYsJmsrm7WitUJ1TTksZQ2NOgWnt6Xh71f/MuNWIQIA2B
	OwTWAHJPlxpMdZsBIcfTGJy9JaJj4vnr47IqpxjX38TYVSE8a4HsLV1Bkvu6wyyNacCuPhcAqNC
	tUQ+EovWjL3DQMpmkYCb9xBysEW9hS4giVTQF8IiCLe9eQVCQLqRg+fGXRSeQPlxwLyypc86/Qp
	bfnzgm1IvHgjP2zCI25mEIrDmgQQSDZTDcVk7ALBHbh9pelvPtvhefmzp+5wWQgLM4lYe3acHAA
	==
X-Received: by 2002:a05:620a:2701:b0:93f:2aa8:c555 with SMTP id af79cd13be357-945f35ba1a3mr242600885a.57.1793953537718;
        Fri, 06 Nov 2026 00:25:37 -0800 (PST)
X-Received: by 2002:a05:620a:2701:b0:93f:2aa8:c555 with SMTP id af79cd13be357-945f35ba1a3mr242598085a.57.1793953537221;
        Fri, 06 Nov 2026 00:25:37 -0800 (PST)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b56ba6bc36sm130723255e9.0.2026.11.06.00.25.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 00:25:36 -0800 (PST)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: linux-media@vger.kernel.org
Cc: bod@kernel.org, mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        loic.poulain@linaro.org, dmitry.baryshkov@oss.qualcomm.com,
        gjorgji.rosikopulos@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        atanas.filipov@oss.qualcomm.com
Subject: [PATCH v7 5/8] arm64: dts: qcom: sm8250: Add JPEG encoder node
Date: Fri,  6 Nov 2026 10:25:19 +0200
Message-Id: <20261106082522.1448390-6-atanas.filipov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261106082522.1448390-1-atanas.filipov@oss.qualcomm.com>
References: <20261106082522.1448390-1-atanas.filipov@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDAzMyBTYWx0ZWRfX79CflKGrIoXA
 3bWHLJyWJEWGQlZBZcidEmdeck6fgr4kTJxEjFdzVjfVXsUPu1QV2NYZ3JwGPyFAvn4bQXUvpMX
 tNYqFh0SYMW1+Rg7yhsDSp+gnP+zeavWIk7uT+3trFHnXHoolbXAc2+aAOfowPmtgmN3sEHLbEM
 FpKeNiTibaSexMPIcfsE0hOwys41kdiKVI0QIjH0vkNZldEDRk3VVKEYarhr8tPOcKkBrnwDBFJ
 yuc+sBNHXbWrKHq4+aEpYBTgc6o5tL98IZLSYrjfHn4T1WkkbT07wq8tzyv3vg2SgLSztOELTX3
 SGn0DzMrqaKbGrH3x4eOg+IUlTdq+5UVFGdrv5Lu4MLsBXk/Molyvh9afK6AHmklpWNKKkwNilB
 538ANARLM+Ms1qE+MYPWLXBJlQ3D0JaNzsWkC1PRlTFFkHqs9B9J6UwWgawZQAA4AxMXSQ3xaUa
 dOfLv9sg4Rxg6TFyHrQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDAzMyBTYWx0ZWRfX9xlCey3/VzwD
 b2YiewL5hzHla0jnM74co0lTxpJTU3ypOEsgxsZlqL56jGXEgXJ5P9jBk0EdesIlt8baFAbqjuM
 ladnbQWHqoiGztk4XtdliC+HHGQVwSs=
X-Proofpoint-ORIG-GUID: PQxI7gk49nI7OrdxZ0GK5ecy69S1aEG8
X-Authority-Analysis: v=2.4 cv=GpzXaU1C c=1 sm=1 tr=0 ts=6aed8f02 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=DnMRqvjp_ngGNQOL0aAA:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: PQxI7gk49nI7OrdxZ0GK5ecy69S1aEG8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0 malwarescore=0
 priorityscore=1501 phishscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060033

Add the JPEG encoder hardware node to the SM8250 device tree so the
qcom-jpeg V4L2 encoder driver can bind and operate on this platform.

Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 74 ++++++++++++++++++++++++++++
 1 file changed, 74 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index f975c2183269a..0ad0935d72b65 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -4480,6 +4480,80 @@ cci1_i2c1: i2c-bus@1 {
 			};
 		};
 
+		jpeg_enc: jpeg-encoder@ac53000 {
+			compatible = "qcom,sm8250-jpeg-enc";
+			status = "disabled";
+
+			reg = <0x0 0x0ac53000 0x0 0x1000>;
+
+			interrupts = <GIC_SPI 474 IRQ_TYPE_EDGE_RISING>;
+
+			power-domains = <&camcc TITAN_TOP_GDSC>,
+					<&rpmhpd RPMHPD_MX>,
+					<&rpmhpd RPMHPD_MMCX>;
+			power-domain-names = "titan_top", "mx", "mmcx";
+
+			clocks = <&gcc GCC_CAMERA_SF_AXI_CLK>,
+				 <&camcc CAM_CC_CORE_AHB_CLK>,
+				 <&camcc CAM_CC_CPAS_AHB_CLK>,
+				 <&camcc CAM_CC_CAMNOC_AXI_CLK>,
+				 <&camcc CAM_CC_CAMNOC_AXI_CLK_SRC>,
+				 <&camcc CAM_CC_JPEG_CLK>;
+
+			clock-names = "bus",
+				      "config",
+				      "cpas",
+				      "camnoc_axi",
+				      "camnoc_axi_src",
+				      "core";
+
+			interconnects = <&mmss_noc MASTER_CAMNOC_SF 0 &mc_virt SLAVE_EBI_CH0 0>;
+			interconnect-names = "camnoc";
+
+			iommus = <&apps_smmu 0x2040 0x400>;
+
+			operating-points-v2 = <&jpeg_opp_table>;
+
+			jpeg_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-100000000 {
+					opp-hz = /bits/ 64 <100000000>;
+					opp-peak-kBps = <262560>;
+					required-opps = <&rpmhpd_opp_svs_l1>,
+							<&rpmhpd_opp_low_svs>;
+				};
+
+				opp-200000000 {
+					opp-hz = /bits/ 64 <200000000>;
+					opp-peak-kBps = <524760>;
+					required-opps = <&rpmhpd_opp_svs_l1>,
+							<&rpmhpd_opp_svs>;
+				};
+
+				opp-400000000 {
+					opp-hz = /bits/ 64 <400000000>;
+					opp-peak-kBps = <978600>;
+					required-opps = <&rpmhpd_opp_svs_l1>,
+							<&rpmhpd_opp_svs_l1>;
+				};
+
+				opp-480000000 {
+					opp-hz = /bits/ 64 <480000000>;
+					opp-peak-kBps = <1095600>;
+					required-opps = <&rpmhpd_opp_svs_l1>,
+							<&rpmhpd_opp_nom>;
+				};
+
+				opp-600000000 {
+					opp-hz = /bits/ 64 <600000000>;
+					opp-peak-kBps = <1095600>;
+					required-opps = <&rpmhpd_opp_svs_l1>,
+							<&rpmhpd_opp_turbo>;
+				};
+			};
+		};
+
 		camss: camss@ac6a000 {
 			compatible = "qcom,sm8250-camss";
 			status = "disabled";
-- 
2.34.1

