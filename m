Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C9643CA4BD
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 12:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777294024; cv=none; b=e8vREIOmPHrkJDB/0mAmUd7b5M1t1fMKiS4nMyUcAYLbR+tt3ejfScWND+cqPXx57Jg5jrO8HUH2a2drx85gDF+jJYAF/uXNMu4WZQF+XR34Uva7Jpxr4zWsxwbGx8HAatiwxye1WiJKd3hQI61ZDVpbrw2GIfz3+ubReE2+rDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777294024; c=relaxed/simple;
	bh=keJ16zCRgQ+7YWtz1ydY/Dm8A91/0/g1XPoTpBY7qXc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BYiawyrgrghq65T9kbVbD1G2U3ai7rYQs4VqNXJaDSK5TUwwz6feafA/PlvaErciql/HAW0cb0mdKxVe/TvlyCHPnHDU3JmOOk32C5pYmSVu1ocAHAJBYx9UaVkRoeBbr844Ok6QNJQMZAne4iYXKgVlkUYqfs6usAzlcvSMCks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ar8oH8ll; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GQqkeyqt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ar8oH8ll";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GQqkeyqt"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63R8TAK4665646
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 12:47:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	npU9buGBkOswEXBY2Iw0wFN7bz1kBrMayAzI2eUT5/o=; b=ar8oH8llepQOZxd+
	UTZpfHbUkAWmyjaA22ALnke7mxRsIOez0vBkv4ytx7Pm5HnD9weTiQBtCGEwavQv
	3gB90EB61foqm5OwruI+oCn5fKivfKbwV/eBIfBDBeN/sCMB0AiQ2zX7qBpykMGY
	uJ96dToVNa9/IrP+986kQja56/lEWU+5fhAx+CCiWCvHY3uvuivDVjan83DNRuiU
	eP2P6hkrt45LGz7vQGboiofcIPOzXborTKPSuEjCCvQpAEgKsqYkpysyo7UHuf5W
	dmxVvrFKsWGqO3AFTiLIv4z07bTNJT8OGyUGljdD1WCOM51uHzPbnnu9EFK5TVbf
	jev2vw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt30n1d5g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 12:47:01 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50fba8d8c40so105589501cf.3
        for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 05:47:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777294021; x=1777898821; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=npU9buGBkOswEXBY2Iw0wFN7bz1kBrMayAzI2eUT5/o=;
        b=GQqkeyqtFeC8NuDhyYoEhBhjyUFa1ANEEQNUnO9aj8MNxkLHpQxkPzngr/4h0kJoex
         3SLvNZ5EJza3mJzvepOcoZ3ubWf9ichIq6miPoQYrtnI79rf/4/LSTP5ViHsO41gzkBA
         2vraUZF31iuYp4coo/CNotQRcsmFkBMngmUuGUI7vlocHGpSjEQLHUqRjtse/0nDTkLW
         c5HYxxuJ4a97yKo7nEvcW3pPXlOcDylGQJruWjVmI+kTqW6kta0ozVxNMfufyD3OXGse
         pbRoP+fTsDpA8htUFrlPiC+8pRBR9y8LWOC2DfYvBLg1UI1U3tiBFTlswmR9P+Glgvv+
         7EGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777294021; x=1777898821;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=npU9buGBkOswEXBY2Iw0wFN7bz1kBrMayAzI2eUT5/o=;
        b=pWDvefnW9wpMIgg+q20YHBWZ3thuUEDWOcvdJQfeHX18ZbfcqBs4lvhyUqHZYek7Rv
         X4TrOxYZ0xazl7SRBfXo0U1gNb3mwjqLOetMBH87M8Nj6KjTCcPqPcHovYG8TlCMCMWa
         jKToeFhTpmxPz9PqYIJOPbVz+LWxcSaECKVBclQTc82CYn16tsjHCyek9RmcSqNEqQ4V
         rWIwz+6w69I08JGGHEQf7UDn68a2sECTBnejUoZrX53+faWHSZQ5+SfFgF8X8QB3Grnm
         jDViSObnHx2hyA1Q9Yp+tc4T7gxGUXbUSRF9SROACBNPToW59QK4flrCWaBee78W0ffD
         KULQ==
X-Forwarded-Encrypted: i=1; AFNElJ9DLWXwyRCt22vIqNhVsFSYUr8L3cGYrmUagso9JIGXl73PbR2rkaGuDBm2xzjSM+zPepJq5/pIatGh@vger.kernel.org
X-Gm-Message-State: AOJu0YzMAZhFvnQwCJARqoQALZ6Qh7WObRa4z6FhYJrKySk/EQfDCFKL
	1CKsxPfrFaLqCCbunaUIh+sB5qAdsUMq2mvlwQI7fTOv9mN5BHwTLLFSZc3PezEnBEoygMdSJQW
	+1g8hp0UjvtIztUKiMKLjBnaihdrdH7u6ouxtr8vC/rCGPtuereQGma6F0rB7nrS/
X-Gm-Gg: AeBDievk15pyJV/vxCfw3vjH2LglhrBATTsd2pQpYY161u6SQkp8vVW61Y7lje6ibgX
	Im3s6Or03EOGd78qKGUGeFQY7n9FHfq4SrJlHawfipiln8Tws3saHqPeBzvRVJNepRPjiQqacxH
	Gm4/HvqAcvjcjp0XbmATWjvz+x9uquWDmHYGRjJ655fTwWvrOegqvw7vbUirSUQhzpbHDs3cta3
	Z8VKcN+/JSSieDNXY/Ip9TVKXYvvh8/Qrd2V1dL7Hs4PDHmIAQlnthtfYZx/nXV4jw1Z9oN8/O2
	2hIrSvOD23gVA1iKsOC73kmn8dA4BO72JH5gYnmjQPPkHmEIPIpdSD88bb8R9e81+0o5l1KfAIW
	bStwBRLy/ugYc2PZ6i+0r1Kvy2s8WYNmb18zRVSs88Il1amsPlbXd3EqYqaTTB2+oYuiDz3VawO
	BhoMh+QF+CmHLYc/aXm5JjGnjLZ2A=
X-Received: by 2002:ac8:5890:0:b0:50d:6ee0:3822 with SMTP id d75a77b69052e-50e36b3c598mr624428611cf.4.1777294020684;
        Mon, 27 Apr 2026 05:47:00 -0700 (PDT)
X-Received: by 2002:ac8:5890:0:b0:50d:6ee0:3822 with SMTP id d75a77b69052e-50e36b3c598mr624428121cf.4.1777294020214;
        Mon, 27 Apr 2026 05:47:00 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:653f:4d28:6a78:a6ca])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba454d1bd19sm1091496866b.37.2026.04.27.05.46.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 05:46:59 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 14:43:41 +0200
Subject: [PATCH v2 14/14] arm64: dts: qcom: agatti: Add OPE node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260427-camss-isp-ope-v2-14-f430e7485009@oss.qualcomm.com>
References: <20260427-camss-isp-ope-v2-0-f430e7485009@oss.qualcomm.com>
In-Reply-To: <20260427-camss-isp-ope-v2-0-f430e7485009@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        devicetree@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        kieran.bingham@ideasonboard.com
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDEzNSBTYWx0ZWRfX69AEsVadZTK2
 uJXlYHDhGJ4k60bEcNOR6ggycGq8Id/CfOgA74rYMJesJQo6Wr/jN0XtOJtf/EKnB4XCaYfbKYU
 hY06/J+1ImLUK06Lp8FV2Ri2T6FACDab/1Hg0bT3WBbTAtVDm15P1Nb835qOEcadssl8WA6L1SW
 jI6/aZfAPMT7QkpqNOkWjyuIib2SMi8fY0dsScR9I+TlsH/kJrIbgOxrRxOu19DBWgJsZjGCBxz
 S9w1TVxXTfkvCYgChBbcet6pNHhTAubXyGN7HhOL4K/fqBGd/dpEbTjNU1vxt5jKpGht2Ao5i6V
 IT68BAWlqUMqXI7SXH9VOyZx+qQiWvhElykJq8o7+HpbPFa1KizzWhcjlm5lXeGdRxEuGXhKx+u
 R6rHMUWlt1z9DGsvZocjRQHjBrrXX0G56ex7HUxLDpJn/cCEXU1LIXEmI+JkA4H4WcrABsjcI55
 eSKH/MvszEHWSMMM/hA==
X-Proofpoint-GUID: URBuU6bZnliHJ-17_p2Blxin32MxSq2Q
X-Authority-Analysis: v=2.4 cv=efANubEH c=1 sm=1 tr=0 ts=69ef5ac5 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=1BEw5LmG3YzgyHxDt7YA:9 a=L3Ch9UzycIYwzZWD:21 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: URBuU6bZnliHJ-17_p2Blxin32MxSq2Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 adultscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 spamscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604270135

Add the Offline Processing Engine (OPE) device tree node for the
Agatti platform (QCM2290). The node describes the five register
regions (top, bus_read, bus_write, pipeline, qos), clocks, interrupt,
interconnects, IOMMU mappings, and OPP table.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/agatti.dtsi | 71 ++++++++++++++++++++++++++++++++++++
 1 file changed, 71 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/agatti.dtsi b/arch/arm64/boot/dts/qcom/agatti.dtsi
index f9b46cf1c6462a89784429565e1636ce2ba68d73..ee0fe1832248eed8405968bf05d4c73dd6e8d13d 100644
--- a/arch/arm64/boot/dts/qcom/agatti.dtsi
+++ b/arch/arm64/boot/dts/qcom/agatti.dtsi
@@ -1919,6 +1919,10 @@ &bimc SLAVE_EBI1 RPM_ALWAYS_TAG>,
 
 			power-domains = <&gcc GCC_CAMSS_TOP_GDSC>;
 
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+
 			status = "disabled";
 
 			ports {
@@ -1933,6 +1937,73 @@ port@1 {
 					reg = <1>;
 				};
 			};
+
+			camss_ope: isp@5c42400 {
+				compatible = "qcom,qcm2290-camss-ope";
+
+				reg = <0x0 0x5c42400 0x0 0x200>,
+				      <0x0 0x5c42600 0x0 0x200>,
+				      <0x0 0x5c42800 0x0 0x4400>,
+				      <0x0 0x5c46c00 0x0 0x190>,
+				      <0x0 0x5c46d90 0x0 0xa00>;
+				reg-names = "top",
+					    "qos",
+					    "pipeline",
+					    "bus_read",
+					    "bus_write";
+
+				clocks = <&gcc GCC_CAMSS_OPE_CLK>,
+					 <&gcc GCC_CAMSS_OPE_AHB_CLK>,
+					 <&gcc GCC_CAMSS_NRT_AXI_CLK>;
+				clock-names = "core",
+					      "iface",
+					      "data";
+
+				interrupts = <GIC_SPI 209 IRQ_TYPE_EDGE_RISING>;
+
+				interconnects = <&bimc MASTER_APPSS_PROC RPM_ACTIVE_TAG
+						&config_noc SLAVE_CAMERA_CFG RPM_ACTIVE_TAG>,
+						<&mmnrt_virt MASTER_CAMNOC_SF RPM_ALWAYS_TAG
+						&bimc SLAVE_EBI1 RPM_ALWAYS_TAG>;
+				interconnect-names = "config",
+						     "data";
+
+				iommus = <&apps_smmu 0x820 0x0>,
+					 <&apps_smmu 0x840 0x0>;
+
+				operating-points-v2 = <&ope_opp_table>;
+				power-domains = <&rpmpd QCM2290_VDDCX>;
+
+				ope_opp_table: opp-table {
+					compatible = "operating-points-v2";
+
+					opp-19200000 {
+						opp-hz = /bits/ 64 <19200000>;
+						required-opps = <&rpmpd_opp_min_svs>;
+					};
+
+					opp-200000000 {
+						opp-hz = /bits/ 64 <200000000>;
+						required-opps = <&rpmpd_opp_svs>;
+					};
+
+					opp-266600000 {
+						opp-hz = /bits/ 64 <266600000>;
+						required-opps = <&rpmpd_opp_svs_plus>;
+					};
+
+					opp-465000000 {
+						opp-hz = /bits/ 64 <465000000>;
+						required-opps = <&rpmpd_opp_nom>;
+					};
+
+					opp-580000000 {
+						opp-hz = /bits/ 64 <580000000>;
+						required-opps = <&rpmpd_opp_turbo>;
+						turbo-mode;
+					};
+				};
+			};
 		};
 
 		mdss: display-subsystem@5e00000 {

-- 
2.34.1

