Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793973349;
	b=JV2ale9b45DfY5/sx7uLhzHPNavkuaAQcTl/iIPRwbvwdHy7rHxOD2beyeB0LJyw4pq/
	 v75sIFhIbjbRvWIY/XajqxLvXXXJYHjL0xhqMtHmETQePKyNV2LAHc1l5Ak4UVl+tg+AP
	 u/TepWQSoiRC+VmWkhrIFjo9coHTMwHeUSmAbOZD/Bf73i1DMu8k6dqye9e8Be8/4kxVv
	 nQkuJFXLE5mM3E3ORkrDH388g/s0wm8pdj1xSynEbmPGbxcOrVTc9wT5Es93hfBtJQiQU
	 h6QbK8SmPtNLQXqPlKbbVwORSXg7SCFtu7ESFymKIsLVZGNTu/vSlLanopUyg20RgXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793973349;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=2Yqb8w77911HPId3dxP6CpINfJB91u8DEDhhhf4QlPo=;
	b=jsH5xMAsEcp+XzSYIPq4d1W1I7+DWLecsMC0S5ErTgLu3ELbti5MVF5ekrvIUGs+4Wbk
	 TXSqXhH3S+JGB2+hCOEwQLDYPcOJJcO1s+cAYRDEuT5tL2YVvYIRivPQBoLkysj8zPW3X
	 GAk79qADuiMB2xhfCGEvPfPJwc2OCYgU7V0/IMoWXhh4JU9EK5FyuR3XMlgsv0iuNXhLs
	 /l6+G4giWRRDY0Rk0iII1zXvncvjpeE4DBeqMOVpzBdznSNQkOucJr9re4OVvyo6vBBqC
	 p0rpBmyNlgGDjnYwQkXXhr79rgNtmN3HgC8Sp353BPSP3lmUOI/mUK1Ys8duldFhmMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jxn+JniY;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gV0rs5ID;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8964B606EE83
	for <devicetree@vger.kernel.org>; Fri,  6 Nov 2026 13:55:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8964B606EE83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jxn+JniY;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gV0rs5ID
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6Do6693173681
	for <devicetree@vger.kernel.org>; Fri, 6 Nov 2026 13:55:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2Yqb8w77911HPId3dxP6CpINfJB91u8DEDhhhf4QlPo=; b=jxn+JniYsCFj/stj
	xvpwoWFejI+khyaQAgnagsSgozbS5/h+auWYJnowJ+fdG6dAiTBwal1ofcS2T2GY
	jS0dimesCc4n4jd9/FaiknhQHNPTVkxiB2yN0iCdIgzBrCj9/AqO90VntzO6yzaz
	LaIdPMmDdBTrCQCFIRq5EStU0xISBiQXSCZTGGKMA7NR+akVt4ceP5zaosWEJb1u
	+tpR4xz2r52PeUATkkvI98LyP8kYifR4eWVU9KhN85EKiQzvIyY0IXjlqljttF1u
	zMZUtGSFzqN6rW2PzcVgtZUGtdXUHcGltgDDqhV/+SQ5fLtHcRWHwGlgYdOIl8/6
	P6CXCA==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3p9b37h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 06 Nov 2026 13:55:48 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-99939c0007cso34341241.0
        for <devicetree@vger.kernel.org>; Fri, 06 Nov 2026 05:55:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793973348; x=1794578148; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2Yqb8w77911HPId3dxP6CpINfJB91u8DEDhhhf4QlPo=;
        b=gV0rs5IDq01G2Doh5Xat4k5dbAE3lDAi/ifbWFOSAY89u1OJk5kPb+iMYkzPncisl7
         grAQIfuDZpScOYqmzTfkRLfci1dc1kYRtfkHFMmEVUkIgGOs9gD3iiaSiTTGchnv3DIA
         ZwTrntWognJ6O17mJBNaw7RFO8CGUrf/WwL+L7chqwAroutnGoHOkd5wghXBFarz7ahe
         FjNJtHipXLuE1qewmKvXvx742lH/80baixYNX+iufaRz/+NOU/H4sqPXVkLHVVGeOR5u
         gzjhu3vy5Q4sq3L3FBKTjS/bYAH5y/nT+VG0Xv20hyZpBZWgDZLLQ+gKta9/oxATP3s2
         0GIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793973348; x=1794578148;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2Yqb8w77911HPId3dxP6CpINfJB91u8DEDhhhf4QlPo=;
        b=JYZNJzHTfvJ2fE9nxuPMbI7fNgG5WqrwkNq/EmuoBqqCYBm9Qq0V6ShlK2yfQb8EFg
         5eFnOPBzMObgCpfV+j6/xEog65E7Fm6K2hTlDktM0FslDuYpxFlkU2JnnxDkInr6MwNv
         Ge7KfwjxIfQTZaoZNg63zC+FZw8lGMjSukpoBs8B0JQpbHQaC4TzXFnbQOca0ArM3EOD
         udpzH3e+V/UgwOiUOuIJMvIl/3Y3BO2lx0lSYzolyV4Q6L5Jhw5drvfaFR7Q100uhqNk
         sm4NljzHVpUeC96bfx3ftokKohbkSt75UJbEjFVOLgq5Em3REJYN1iVl7PHOmrBkVRO5
         ShSQ==
X-Forwarded-Encrypted: i=1; AKwUvBya6Rte+j8nbbfkIMi60HayyewjR3j6TDVmR2M8CDXooJaTQGBIoDgegPdYfg3dASv/H4fjVh7epMUi@vger.kernel.org
X-Gm-Message-State: APuU4Z862EL2PX+VmZVtVMZ9uqRlkpJicLIoqLNs2cOE4fMeGYWJ3h/i
	AqygMXAIzdnnx4sS01isPhimuj6rM2csnpz25Vzm3ID9n4sxpgkZFT77U0r8bBKZTB9hXI0eqiO
	5MYQjvthfhB6AAwHGQPGur3HeljG+xfOwC13f/WG4NS2QXVxV/IPMQ2HEGOih7Onr
X-Gm-Gg: AYBFou2Yv2q6dtlFehFThBf24U3jFprWU1MLr3AjCFx/D8HsGn8vn0yx/9FNiCRuwHY
	H87/zrlkyzSEKWeGLdSHRnf8QsdJRuFUaJ4iuK6vZ3qQnpBtJpqkr+Rma1wCTMRPnESZwglCzfO
	IaKBXAMjuY9QYXidlCmrpqF5AoA/GYlhhtS4HaDYpWo/VYB419qID1lFZB7RrCuvapK6/X/XrBf
	RHOYiq43mWkpyHCmCK5vQ+UGs7/Os6D2dmlKfmc2MTKJO5LPlPvPFAQb0ddEuZAoZeqxlvR0S+V
	tcbcgYDM+e6xfOCEhDgpUReRs3dK4vsZejgR57X7NkmFcTnrbDJ54q5VyqJGR5u/Zxq5waP9jfE
	PgvYcqRNMJ28TzKQhKECT7tvFzTO6MKCNilMZAM9l2Q6goYcOZIGtQZI/f95DxpdGEYADkVEg1p
	Jq21PEvb1oCXbxhXJPuW6IRC76POhjwL9Ef+aAJ3L8N36l2Z//vUIzUlgPXW519wFql4aFh3qvC
	Z29pJ2OtQhRkmrklE1mhMfMCVMZ
X-Received: by 2002:a05:6102:3346:b0:7c4:a0e4:1a79 with SMTP id ada2fe7eead31-7d2a15c63d5mr1179450137.19.1793973347583;
        Fri, 06 Nov 2026 05:55:47 -0800 (PST)
X-Received: by 2002:a05:6102:3346:b0:7c4:a0e4:1a79 with SMTP id ada2fe7eead31-7d2a15c63d5mr1179438137.19.1793973347028;
        Fri, 06 Nov 2026 05:55:47 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:f048:3e89:c517:10cd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d809df2dsm3963256f8f.51.2026.11.06.05.55.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 05:55:45 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 06 Nov 2026 14:55:23 +0100
Subject: [PATCH v14 7/9] arm64: dts: qcom: agatti: Add OPE node
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
Message-Id: <20261106-camss-isp-ope-v14-7-49c426cd2715@oss.qualcomm.com>
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
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: uxFIZ0kPqLq9qZ4_pArrm_zBZmmhexTe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA1NSBTYWx0ZWRfX9JguTc+2lyGK
 ZQIxyaSGgRLCXsi5/8fuF6DNrtZ5FD2DemuFSAnaSSJlXQM1/jc92OrmJvSfFtPYK6agdouSviV
 K14wQ1ArLkRAjHOVDXmASlg4DSY+lGBJEAvL7pZTiyi5DvLK41+A2PoLv92RKvEroBNrxVLXHBZ
 evmGoKpJDgM/FTBsigTtqYpElqqXqqdTU+CxzhYZ+PlVlqwPGCPFTQWPhSCHOHLliUm1ND7os4B
 Zzlp3c4wRhY/qbKcRs6vT/WXfZPdHvVAis9ZiON0ckzN2gQg6oADgrKlh9qKd3HnaTdmRz+LTRk
 8fFh6jPKax6se4bhRrVJU/ThrM03UBm8gWBVvxGMU/dmHuEsrdzjtVaZHs/UnW5WfoXBlZFSSVC
 YrB1oztAoFtJlsSqvUcd+u3x331c5PjAlQD/mjb5YXjvzK8hILyfKbCdkWvBYaUDtuxB0wsNgkx
 JtJYSK8f0BEEKSX+ylQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA1NSBTYWx0ZWRfX7TPQehgeyCOp
 gqwMXAQdbQCY1useyJQlcdFnJe8JJAqzwyHUfskeI80Y+pDcNj81got1OSPadsB/vaUxkyhNadJ
 BApzUlegh4YFOiFl7iOiMTfjwj/nL/Y=
X-Authority-Analysis: v=2.4 cv=WMzqzXsR c=1 sm=1 tr=0 ts=6aeddc64 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=1BEw5LmG3YzgyHxDt7YA:9 a=QEXdDO2ut3YA:10 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-GUID: uxFIZ0kPqLq9qZ4_pArrm_zBZmmhexTe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060055

Add the Offline Processing Engine (OPE) device tree node for the
Agatti platform (QCM2290). The node describes the six register
regions (cdm, top, qos, pipeline, bus_read, bus_write), clocks,
interrupt, interconnects, IOMMU mappings, and OPP table.

OPE is a memory-to-memory block with no board-level dependencies, so
the node is left enabled for all Agatti boards.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/agatti.dtsi | 77 ++++++++++++++++++++++++++++++++++++
 1 file changed, 77 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/agatti.dtsi b/arch/arm64/boot/dts/qcom/agatti.dtsi
index 32d185d0526ffe109d83fe92d9c54f21bedbbcfd..dacb551fef530b73ca5265eb6aca39b807e82382 100644
--- a/arch/arm64/boot/dts/qcom/agatti.dtsi
+++ b/arch/arm64/boot/dts/qcom/agatti.dtsi
@@ -2026,6 +2026,83 @@ port@1 {
 			};
 		};
 
+		isp_ope: isp@5c42000 {
+			compatible = "qcom,qcm2290-camss-ope";
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
+			interrupts = <GIC_SPI 209 IRQ_TYPE_EDGE_RISING>;
+
+			interconnects = <&bimc MASTER_APPSS_PROC RPM_ACTIVE_TAG
+					 &config_noc SLAVE_CAMERA_CFG RPM_ACTIVE_TAG>,
+					<&mmnrt_virt MASTER_CAMNOC_SF RPM_ALWAYS_TAG
+					 &bimc SLAVE_EBI1 RPM_ALWAYS_TAG>;
+			interconnect-names = "config",
+					     "data";
+
+			iommus = <&apps_smmu 0x800 0x0>,
+				 <&apps_smmu 0x820 0x0>,
+				 <&apps_smmu 0x840 0x0>;
+
+			operating-points-v2 = <&ope_opp_table>;
+			power-domains = <&gcc GCC_CAMSS_TOP_GDSC>,
+					<&rpmpd QCM2290_VDDCX>;
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
 		mdss: display-subsystem@5e00000 {
 			compatible = "qcom,qcm2290-mdss";
 			reg = <0x0 0x05e00000 0x0 0x1000>;

-- 
2.34.1

