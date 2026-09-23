Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0983A519DE7
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 16:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790179247; cv=none; b=uiLCyVgmNOaVdzCRM3yDRtyvR+64D8jYgHhGieuPPBdA3tX7D1GXpGMSF7izIvLeN6JA+n+NxTTo4xv8eZLpP7pqCs0t1budf0Ep3HpqpkgXIAqHPWb19aPgi/sZFdd4WXFTJe828+MbRya2uTREl9Vps3yRHUVds4T1mCxTSgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790179247; c=relaxed/simple;
	bh=HmeR1l9JD8JvYgGsyzO5QvZGodxO5bhsmjCW69cOhmI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GhQ8axF07VgCKWxdLL7gEyyXcjxHW/REX/kgYY7OvWH52PKCmOPijMYgbzdBTwTxdi6qupTmhpaXnNn2A1kOcZIkNLdQl55EHmjeg4t1l8JGLVXO0ouKlCksrFpLIewa1W1728RPnH2XNytZGPKyQUYvmOCIK5wMHTNRvbcnKJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UuHl/btS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FWY0RTVP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UuHl/btS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FWY0RTVP"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NDPGcB2698196
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 16:00:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vjzv0biNUKG1BiKaowTeTkIFJcvCjq/9OvYidNdvtc8=; b=UuHl/btSwfLQIat4
	GxaElALrjsyayQ4rLRlSnJdnQ47rmQyvTcZhrK446sMpnREICbQvwOneUAR6appf
	vzq7qDQfKCs9BBiK4R/ajdlwq+I7e8SaPZGpJvTcdV+MtO/V7s4k90D3K/gatzWb
	O5TXDqEXImYanFikX6MTWbY7+KsiZV84t/CM4gMJvd2QBuum/vhvs4UOcy7kKf8c
	jIoOcNPSQMrLOJZkeMZQ8j0l+mW3xH4ZQ6WLbXWb51dsZ7NTA2B4Mbf+v6lORjXN
	QCNt74+bFfBCNf0kKwWGDZ/BVCCf9eBCKXyitVZK3kZ93QSU1jM1kmE2CBeDK1KO
	0gc1nw==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvfmwgpjq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 16:00:43 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-982a948acf8so500767241.2
        for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 09:00:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790179243; x=1790784043; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vjzv0biNUKG1BiKaowTeTkIFJcvCjq/9OvYidNdvtc8=;
        b=FWY0RTVPfq1E79DbVc4gJQdZITG+XhyPgLbmkOzDeFYpQjxM5qR9EIoEyH16MMzBbp
         Taqc19Ntke1VdU2qr9icI9K18wPKzsQNACKZTwv2hEreqS4c3C6xhRjav3KSEaZjxVeu
         c/HgDS0egXtK+VzAP7iu9gdIECUqc3iL5NTTfWnaBE0cZpwLVrlj36iw2zp68PejHy3X
         lCXdhrGa4VHCvuozPOhZjjv6SX8FLRldl+4kmSwfQRljOB99tBX8iKl5jw5H8leE1J00
         qMxon7VUJ/5ZYH0uutVzH74P3tuiAR91aa6u4ymNdJkwFJvF+LLoHCPtaIdKfq6gCaHR
         BrGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790179243; x=1790784043;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vjzv0biNUKG1BiKaowTeTkIFJcvCjq/9OvYidNdvtc8=;
        b=LIMte3UZ4gvN3hfnew1dxu50H7q/qAy5xGu1mVCnSRnts4AmvFFHXqqyioF88vRVP0
         R6gD1YKUkdFyyfKOkFpcwXPZ3kjH71dCIOgUxHI1eYwUAzIW3n2ra0shXBP+e2KifcsS
         8t0jC99JunAmdbHYuadACevzGDc+NtqhhOprPqo/lgv2BLJ5wL4MA09ujQARz732C1ab
         miNhiHMz21D/9JuWyvkiEr7jY1ujv+pC3KlIwilzceB81srGETVz5McH5V1atMHwwpXI
         MOHsjxMFK01XnWHi8Vvm5AImCaPqMwn02K+qTkkxYbqQs5enzjl7qG2HvVmvB+w+HJrf
         y94w==
X-Forwarded-Encrypted: i=1; AKwUvBzL9J1hwMLmoKN7p5HMjMxwR51hWMn3vOfGPikJBfavqJkH1bIuKtl1DbOdFznliLUHH4EpsQ9ERToM@vger.kernel.org
X-Gm-Message-State: AFuF++kWqASkhYCxqIib1lp8FTSkgmBC7X+SycpkqtDCJ4dcEDG1Vp1Z
	t4VUMNTUBwSlPYVskxFtw1OWQnpYl3ddgopmKuWayu4lMmunHufwzYK9EUjZWbua8uq9iLhatE4
	JfDUhIRokeyxwEW6K7qGCfZ55OWn3npMNQEk0H6/YneYvSzVwV9tYCInT/CIDnjhI
X-Gm-Gg: AYBFou1ZW2MrAJNz8RvRYFdlOxVsJUKXMBX+z3Y+/ApL6RnY+Djy65SDsbRPNfaO1pz
	KN5nu0sKYRd6VLPyngCEijFzVXDZa3UsKMXVjIHudFvMe4A9OQlmMg9mgazFUK9cZfhDKqvK/y3
	liPXlfViHGqiz4HAYvYVnDZkRoBKRGz9rBqIW+LhiSzvsh65zOgN8TqjhbwP4StntE5+oHlwASc
	psfbrquaYTyUqIf9ScsF24ZjeU5dXG+kRbByxCqSVSzXRjwfKB3SCxN+yAQLZJnO1jUDH0/U1dx
	3Usz0kFJ7X+0aa+nEqIe7KHQKFITYpWMPgLybqGVKG2lDcpWJ27t1jli9v3dmodNAE55Kr1EZHY
	Y0G7Im7t92ZNalom7nxv2hJN9ilb0TGSsMU09RdHV3jnbcnMwf+5j/XuSjOTI/12RZtm32cMYU3
	Civle8g8FpUe1Ejq6bZDxsH4mJpVxw0hXCDPEjN93LF7LAAit2Tj7sA2dHJzVA0Q==
X-Received: by 2002:a05:6102:2928:b0:7a3:4e75:d1f0 with SMTP id ada2fe7eead31-7ac1c7902b0mr2848905137.23.1790179242997;
        Wed, 23 Sep 2026 09:00:42 -0700 (PDT)
X-Received: by 2002:a05:6102:2928:b0:7a3:4e75:d1f0 with SMTP id ada2fe7eead31-7ac1c7902b0mr2848869137.23.1790179242480;
        Wed, 23 Sep 2026 09:00:42 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:d5b5:76d2:82e3:e5fb])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fde197466sm80739325e9.7.2026.09.23.09.00.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 09:00:41 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 18:00:28 +0200
Subject: [PATCH v9 7/9] arm64: dts: qcom: agatti: Add OPE node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-camss-isp-ope-v9-7-86a75dc18b83@oss.qualcomm.com>
References: <20260923-camss-isp-ope-v9-0-86a75dc18b83@oss.qualcomm.com>
In-Reply-To: <20260923-camss-isp-ope-v9-0-86a75dc18b83@oss.qualcomm.com>
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
        Bryan O'Donoghue <bod@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-hardening@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA2MyBTYWx0ZWRfX0g4z2BMftvj/
 dwb0+k+zUXdMOpDR8QLGzX2yrWUuKqnZgH2XZ3RAHrJwDSjmQE5klZxEWvpm94b9lg8FLXCelkK
 KMlcUhTjB85/W0qFQIQg8F/Qdg5S+jLiJpUIGw6v4cHuD3C/1dEez4gOQFg9jFPTw/eOT+zC+ti
 HKtTSfUu8MRHjN5t6Oo6DyrSvFqJkTt5FKdPqHfxAu3oTnW/utKRYrYYz4yBVKXUnItNzRsLOSV
 LkpB5o/wgN0hUcJFwlPxI4UMuFV5gTxuNL60p9uyAocnGASGvA6A4WoPVyZXNB7Xi76irgdg9cM
 eH6kO3rpueHT/PGgTUIyZ59t5Va5RwLEiAa9ecXNJ4dftGuqobcNxj/4Nr004dUdiq1AVt6NeJd
 uoe26sBDBt0mvlThDa2wuyqTFTiJiL7IazlxJSuHTuJVnfp5u0S+eGlpHKG1/95PsZcBTpm7YJc
 eVLgFL1lJPJ1C3j1zYw==
X-Authority-Analysis: v=2.4 cv=WK/qzXsR c=1 sm=1 tr=0 ts=6ab3f7ab cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=1BEw5LmG3YzgyHxDt7YA:9 a=QEXdDO2ut3YA:10 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA2MyBTYWx0ZWRfX43srZFm4rwAf
 +WaFLbnARGRNrkHH9ghYctAdHnBHoxOsGfpilyV2ppV17Xh11/GXd2AosYTkt/LBQtnwcAOl0Iv
 CiuPnsFfcR1uXgENwXxnunDHi+N3Uho=
X-Proofpoint-ORIG-GUID: NVMszQD4h7WxZOvf6QoxYd_8xzDnfbo_
X-Proofpoint-GUID: NVMszQD4h7WxZOvf6QoxYd_8xzDnfbo_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 bulkscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609230063

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

