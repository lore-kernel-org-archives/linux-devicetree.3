Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87412457E65
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 08:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789459882; cv=none; b=aNHSa/BUh6ayulq4IftVU9h1g5UMpoMRsaX27arw3WQuUk4gH3tKaSUhX8FOOcBTY4oxTqxktmGqnPzF8JP2nXIITZ5aBzIzELDy2kMwfMqInxdrRDmHee/A1Tucc8C4RPRTeaWevsh5SVqt+Uak2nMYec86wuDIisg+N4B5wpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789459882; c=relaxed/simple;
	bh=HmeR1l9JD8JvYgGsyzO5QvZGodxO5bhsmjCW69cOhmI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ahoLJNIyjeYAWuh4XbReuM8a76rCrW7jxt4ima22gaPzMdOUN+Csf6KnQsBlI2/Zi81fcOrm4/Pnv45u8akeB7Zkd41JKNXqjSF2BJ/XbkbJOuA/ugBbVDHYaYkxHROVMqkKWPycqYwmZe5dcFprqD45cxI7h8bq1R5r7wD09Mo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aIi36j+s; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GiOxeSKb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aIi36j+s";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GiOxeSKb"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F6ZBob2983706
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 08:11:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vjzv0biNUKG1BiKaowTeTkIFJcvCjq/9OvYidNdvtc8=; b=aIi36j+st9gZVvrb
	ErRGyNU2eK7VVNcvwRmJfRH3OVuvPJBZSAkW0D6VKkHd/VLe4cVXZ62PoK5j+qQi
	p6jIe82LCC4eXs9e8GHxFwrW6RMos5MaQPCst/4Jy3grSoV84Ha9rgWrr1Llk5a/
	Eoq1ckVcKvoXat70WJNoOYz5EbUUg8hVDKMP/baeeCeI3R5hksYOIf8jg7xmfTPj
	+KcjWcetp2ZJKR3lOe6d52h0V4mE6S1f89AI25CWOgYqViIjBxm47zuXztapeQ84
	S0iqQth2ogLPEimVfGHNZi8jJkyzwfjbRQauEC5eLOJ4p8PeMdilgYRnpLa244pX
	lbm7Ig==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpnet3768-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 08:11:18 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93a2d361e1aso309768485a.1
        for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 01:11:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789459878; x=1790064678; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vjzv0biNUKG1BiKaowTeTkIFJcvCjq/9OvYidNdvtc8=;
        b=GiOxeSKbpiAkbTZw5QLwKb95ImXSD55kWeWjqydT4ck2KPt91QmgxSM3FZyeeeBe+E
         TmaXLDdOVAjLLcUzk24C9+QqnR4L0Lhh8iFIEHHV2b+VqSWyQA6U8rvmlKNH1yfg0XB7
         n6d6LfeI7K5AXhG7xNTnzr2Mpj1CxSz47BT1xHSuF1l0hsq2WrzvNXYZ8+JOyYhu/JXe
         RuKZu+JbfGle7XwxysLai34X/6BSs6fl/xh5HYc/5gnUD7W4jCfKzkU2DLsOJ6nCi+NG
         haGWmeQ0cZLk9UYkZPUuS1J5IL+epPmBnQFlIFD8k/fb8AwgusD7O1xmgUdDOWIks983
         VrnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789459878; x=1790064678;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vjzv0biNUKG1BiKaowTeTkIFJcvCjq/9OvYidNdvtc8=;
        b=zEtyerIj2lZyhEQGjRe534gXQ6DE8tmIpibFkfzNQcxloZ50/H8dkVRPht7jhOOVb4
         c82b/sn2FXL7UdbGy370PdyUkK6nfAtAHsXtkNfr0xOePWwZZfHU5jy7w3zpEZc0xFIe
         vTajgUK6xX+NgEm3UIdSJfzxDDHlk+y672FRE49UjFVUpGEmto12zsRy6ny2TAJK45uA
         U5+fOS0jqZxuXY8VSCjbXF5EEiMuEmjez/RqOqaH7GGaOIOaKhOq4aK8x3jPjhoMYhcQ
         uwqebIVZxhqBvpxT3s9C67zIwba5dDRK+gbW6bkh58bZTI8lVYQ+p6aj8frGd+Xyo2cn
         GgFw==
X-Forwarded-Encrypted: i=1; AKwUvBx9z/Ithuf3CGS6+tPXHIpNjgeOuUxYlC/7+Jl82FdtPgom2d32BcWMJ3o1EitMUuenQou/G8kxTYOY@vger.kernel.org
X-Gm-Message-State: AFuF++nWo9IrKBQqmsDgyLHW6HRyioQicw+LWAlvtFZx06o4X66j/Pw4
	CyWoojKoPImaFEUUo+U3fhOd73uT/dQfFb2XR8pKS5xrzCXmfsOuGAbI70WPoDXLKsqwZZEynCa
	TZzZ47wlHWopVMV3DGXJApIJqTbxifCBqMxmJV837kdoeYPnLzyHdiUU3xtQ4hZJNc5ChIZDJl+
	s=
X-Gm-Gg: AYBFou0FgJXQm6YIZFsubbvcaqKTVqcJlLzplFso1e08QjV0TS1Ts1/+cyuLhoWpixm
	d/yYCGy4BQtQskNt3pJWl57TNX5BFfU6vlEgJ7j23zExaJmUwoINhz8fGZu6mK/ItHEOxSzkG4s
	en7k9+xjLml3/GYGkOvvvnwU4Z89vrObYX3DJWOQm8F0v+ys3gLxm+XXxjuvQo+iZDPzdMIEyNZ
	C+NyP0EtKDF98ZCjMPVASRZRUbBMyUozEa1tYIVfzuIjPBLoGOrF4TYhgLJPzqh+MVp136mzv8i
	CAi3/ozPfrClbAJIHDr4ufL8zq3TwQIc7Dcncdpr8lIXg7VjNG2utI4iZoZ++UhYncWGXmyG5Tx
	uh0sUhyATP+A0HkQJA12DL3y4yfXt/fCDUAoMgpEuW5gbAtVxyHtG6O5svOPQ36XAYSPyDXAXdo
	6L31fkf0L4Hs/ejdOIjvmoN0F3FPVG1WhGDfjm4A6V01La0JImQO0=
X-Received: by 2002:a05:620a:31a8:b0:939:e650:c80 with SMTP id af79cd13be357-93a29a9483emr898344785a.39.1789459877692;
        Tue, 15 Sep 2026 01:11:17 -0700 (PDT)
X-Received: by 2002:a05:620a:31a8:b0:939:e650:c80 with SMTP id af79cd13be357-93a29a9483emr898340385a.39.1789459877157;
        Tue, 15 Sep 2026 01:11:17 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:7034:b557:872c:5602])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e7d292d3csm48847885e9.4.2026.09.15.01.11.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 01:11:16 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 10:11:10 +0200
Subject: [PATCH v7 7/9] arm64: dts: qcom: agatti: Add OPE node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-camss-isp-ope-v7-7-77b13d131d3d@oss.qualcomm.com>
References: <20260915-camss-isp-ope-v7-0-77b13d131d3d@oss.qualcomm.com>
In-Reply-To: <20260915-camss-isp-ope-v7-0-77b13d131d3d@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-hardening@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDExNiBTYWx0ZWRfX+9DhssKm0fxg
 DGSB9S7z3oQQsGVrVD44Ev1kH8c/xYUMkN/mCvBVmreThX1FKCNUbPvultljzKGhX1MqLlEQ93D
 0BBd378sR9zI6vywGSg/hH0o9v9t524=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDExNiBTYWx0ZWRfX2Jg3JKeZFut7
 mjJCoa0/uRQA+zNCDmGfEERQQX5VzbyjC4hqTkmYxrd2Ccu6h6DAzOGGsTJndonejqp4bBAXRkc
 m1bGTVC0o6tupKkYuUXMP/lQJefcGj2rTuwykzbqMq4w7Ye4Iw/o0P2nCg5brkozJGKheWJkT4b
 L8Lz99gi2hvrw7srpotHAbCjN1RBSRJ2VAy6+gIry7EmTEx09j6zfseyP8pv1EhixrVavxoLVZI
 1Kj6wHcil+2oH3F7tRQevS+pAtBbplb2ocbo9klLfTRznBacVUyMXORulMLXC4H8pZBE8iYd+dH
 EhlxmNY19yaFZmu2zaUEVuXM1ovHNtPnr18pqgNQSJwzObKgOgPRo655ggjHRa0WCk6ls/cQar7
 tkM6dZ4+N2jn8jeBujHfvKrRwhZWwlq5mJvKN89xX8uYClyXrnJ5bnP7vTlAoczhxkZs84FW1WV
 dn/TW4qeOY6ZFh/UpGw==
X-Authority-Analysis: v=2.4 cv=PKKaavqC c=1 sm=1 tr=0 ts=6aa8fda6 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=1BEw5LmG3YzgyHxDt7YA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: AP2wwXUP2bEAgmhbLnON_fZUyecbTFEF
X-Proofpoint-ORIG-GUID: AP2wwXUP2bEAgmhbLnON_fZUyecbTFEF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_02,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 malwarescore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150116

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
index 397d61a8a27c2505833466bd349acc27ef4ffe0c..7746c58b5b1cb25206e72b888b7559cfe27553b9 100644
--- a/arch/arm64/boot/dts/qcom/agatti.dtsi
+++ b/arch/arm64/boot/dts/qcom/agatti.dtsi
@@ -2020,6 +2020,83 @@ port@1 {
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

