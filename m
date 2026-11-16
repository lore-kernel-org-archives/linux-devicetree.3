Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794834335;
	b=BLS6PK5Q8N5itSjSNw5xNvjdLcZWvnpyX2dREQIDe0OUzzr+hoQY4q6uKOYkF2IQZi9A
	 i4YyZ6KAuwSt2AsROG4G9f0ZqTpruK1+wF5MxkKlCOpbaJYM9CVGMy+pRDUsqm8VIZTo9
	 QX+c6xglhwdTUG+oAsQljV1Pzw/u99T52IDSXoXDcLi+dlR88tkDmmDHnlR/jDsacaI7h
	 E7OlrG2EmpV9vjeDlG8Uy8grU10fLYTr/W0JSLNKypgL4XR1o5F93iEgCMbEjtwWIkqyF
	 cnDf+6BMrdha213Knr6e0Q+WrIKApjXNwam7d7kftEhNH89biOygdBbIXg1BLtj7GKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794834335;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=zW2/gkGq4nmG+GVOGBUwZNxbaEMh5XvK4WG9k00wmcc=;
	b=SccGvp+kPE35NIi8dw1eP5lKRmGLaVDtSVGVzbTVbpC6nc2rLR/HCwQnXbI1wY+RHDja
	 9beRqFQ1/OF1UfqhY5jwvAmkKBnAAdDxvFHG0lEWJywwei6tRVtUGMb1T0aCHMRLPYpGX
	 hMC5p0d4Ac66LSK2CaTU/Tcwau4fJcHy7nFkoCpUmppy0cZ7Gxh0ZGwJXo3vrK+qxUWhp
	 Sx9m1y/mtU7ZW2DnV02hlbN7riZ/xGyKf5MW0M7FXZ01W1euMoaWKcBc+OKJRMja7xAgb
	 7A/Fcvr21r1lcrQ86RiAIZ/FS8QsvMT8UiHCQdfmLncJKmiyie8fAiFpv73Rsi34p7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=L3GmjFWl;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Lfii+hLx;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99D68606A331
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 13:05:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 99D68606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=L3GmjFWl;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Lfii+hLx
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGC0oME3770454
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 13:05:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=zW2/gkGq4nm
	G+GVOGBUwZNxbaEMh5XvK4WG9k00wmcc=; b=L3GmjFWlrlFor7knkaJSvSL1Mgz
	wy9KTmcLH8qeGIj5pxlYkA7dhjUUOtg9XV5eohN858ApqQ/Dn8CFpCt45XBthQzO
	BuppHD0aBQHcn4Y0hs15MLcjq6B2EwqLS7G/Dm4vpCuH5Ce2DgNeOw6QA+205zZ6
	oxPWxjv7+8bGgpXfwW6c+LL0/GmLNxZQ3iu9U/ts5rKlI0XPF6Wi2bcGvgWWfvhT
	eMAkoVtMV7HSU08onQJ4F3utwbS6hgS3aIqjZajo3rIJzPUqdEVTlJn5wPYMu5AA
	oUKoVR5cTyIe/GoUk3Ml9CVjRbELPxNGggTzD0f8z7s0XVXILKZSxMLvJ5g==
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hyy6ggrev-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 13:05:33 +0000 (GMT)
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-8628955a085so4522159a34.3
        for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 05:05:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794834332; x=1795439132; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zW2/gkGq4nmG+GVOGBUwZNxbaEMh5XvK4WG9k00wmcc=;
        b=Lfii+hLx4Bmh79R1Gg2XUa2V+4en0kB0kW2Rn6lQe2HM0KFjizKAhaPz/fbfprkimL
         RTNBaqeKnJIQQmTJHKm85ORkJKx30VYtIASAR9ryUQVELMWRMNON1ZpSlK/uzVU8rtC0
         8Dh27eqchMBURzeqQxksgkUYQcP7DAMTOXYBvA5ybh4B///B04u49z7iRasxa+ZMMNRM
         ub9iCx5ostIYFkGGNlojYCWA/oDhq4K20NVeYZ5LcjPL/KxoMJaPg1kmctKY38mkcpRC
         1B1XoDq7mXLoBWeKCbAqSM7Ey41U4Jq2dMmI0gtHc7Ut/9mrXdzSEP/8uOqPcR/63UE+
         jjFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794834332; x=1795439132;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zW2/gkGq4nmG+GVOGBUwZNxbaEMh5XvK4WG9k00wmcc=;
        b=RuofLLabfC0gZg4H94uVGUbY1orz68Qci1VtHu3281LigTpUoNBJ8DdQrmRH3/o9fF
         AycJWCAkp1LvlX8IUx04CvVIO5LTA3CqGPAC1Omswekj/XfsYOBrhoWr4UBlyxlkzWwB
         2zqqJGPW6CxLPfymHyAlLeoaFoI9sqsq+4HG3tqtq770ljRexbV2EhD6XZ++yGZzKH7A
         ChDyu8uGN9Zi7QJVV5cvXy+zuT/+7YIRkEMamttJJGCc4xd8HjHbMrq8oTg/3lbDRCS5
         qa70Zy7Ne7v/eb7NFvYc2BwOQ49BVVW9phtlaHMFAtGRaymfS2bQnxogxv1IiRD3jHt2
         cF2Q==
X-Forwarded-Encrypted: i=1; AL+hErECJilDsCg+Musy0LERSYPyNJ4pHUa4XT0RShjWufbMZnWeyk244DadtZA/jgUY+XsnnGQ1vEN2Dm2P@vger.kernel.org
X-Gm-Message-State: APuU4Z9ok7Xck1ZaKgPYI1q6vrpwvAtoZ0pDyhIKu/+UCs6dTaHCu1R9
	W5NJzZ0Mkpzub4VXghZir7o6xFmETbcf16soHjJ+KpJ9XLoeBr9GeJkPz915kfQ4Tv+MGLVLADB
	OF/UVt/6Hyj/yCRfoSZCWRXt78TvE8AGN1QQQZA5YIL2soMtQKlG1Qt7NVqzVIKCC
X-Gm-Gg: AYBFou0onF1Fklg6EaiiOl4SXpro+lglWtu6/OLu5rXkUsTg7VTAfElxfZIDg+Iag8l
	fJwsIrCXcPvrAOxWyrv3vUyzvMHWiLrso+QunzWeXQ5TE6eJZTIZy43iobrMpXXNGm3VjC0y7cF
	twrPrWCiuh+HmTX0OQSG2bUAbCM+ojBv3i8Mn+/7dEVQfmd05jGasBK7qZSinzwheHuFYuc0G8A
	u1/xidlP6gJMH/JOjQmQMDf1U1+7AcSoJ02SzhJwfKoTLPT6QhYo7eE1fkNRuZTiLOIETBoWmPt
	DJV0dJlgHe1vIcNaf6NnsD2V4ZJoBDO9h2fSUO74P4U+5NFqBtUMajHaq+Ns70+oXE+AbI8GgxB
	Jy8aubEsUs09WXPqaTFawV12dNguvELug9xr0SbMucMovBUOqQoW+gnQSw5IpCffmwT0ofn72Lc
	oQ
X-Received: by 2002:a05:6808:3c48:b0:4fc:3dc7:66af with SMTP id 5614622812f47-56e63794f3bmr8293788b6e.10.1794834332451;
        Mon, 16 Nov 2026 05:05:32 -0800 (PST)
X-Received: by 2002:a05:6808:3c48:b0:4fc:3dc7:66af with SMTP id 5614622812f47-56e63794f3bmr8293762b6e.10.1794834332061;
        Mon, 16 Nov 2026 05:05:32 -0800 (PST)
Received: from hu-akakum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56e6fc3eaf6sm9895641b6e.5.2026.11.16.05.05.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 05:05:31 -0800 (PST)
From: Akash Kumar <akash.kumar@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Dmitry Baryshkov <lumag@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/2] arm64: dts: qcom: talos: Add graph port placeholders for USB Type-C muxing
Date: Mon, 16 Nov 2026 18:35:19 +0530
Message-ID: <20261116130520.1763088-2-akash.kumar@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261116130520.1763088-1-akash.kumar@oss.qualcomm.com>
References: <20261116130520.1763088-1-akash.kumar@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA1MSBTYWx0ZWRfX5rLcpVB+RZdw
 OYjh3EmnpYEHj/ETtSKzFz9eNBNy3pmwQtiwEseQoA/R8XQ4/8qczX3GafpR5cKvCpdssUn59aR
 ndW88a0ds2AfEXnlyrzBHr2hwENPSamuOmlZXLICi0osse+UJnZuxLarRahk6kzwcoei5IvhMuU
 yUL31DqmDDbcFg1OexGr/RPTM565+HqPEkTWMgQ13YvUdVkEw8GMYTr8DyNFmjVcurs49H2419G
 ONmPlWGiEEuSrU8oNx2IjVRs6NFllxrpfZ+PFGI6f6Hb+SpPR1QL548K82Cqt72FsNuDGczWYl1
 a5WAMGEcq0Ka/cE9Asj5jCublkCCF0cajmcyRo8onXYO5qHetRm3X4/w6cHqSI8G7iAPHs+0zsd
 BGv6zvMQRgcxlFVcdE9D/bLJPUlGbz0nzbG74M2Ba1tYdqSSysv+HZdDwe1zApSeINmLMmzQuxj
 SWDHF/TLgI5drANnPHQ==
X-Proofpoint-GUID: xXcu-dxDSn038g76IxbBFG3xG_8XXA5W
X-Proofpoint-ORIG-GUID: xXcu-dxDSn038g76IxbBFG3xG_8XXA5W
X-Authority-Analysis: v=2.4 cv=D/DSufRj c=1 sm=1 tr=0 ts=6afaff9d cx=c_pps
 a=OI0sxtj7PyCX9F1bxD/puw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=OnC3CdEk30aKpSFVcR8A:9 a=Z1Yy7GAxqfX1iEi80vsk:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA1MSBTYWx0ZWRfX5F5mmcGK3H/7
 enDaaRMu1x0sRSPSEjqSx7xRzqjtiOiFi3lf/CERFPd0r2IKHcRzSknBKAfpAxm2IXTr9Ir4xdz
 5AMiUnzD+WUOQ0uNy34cCpGNC7fRNLw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_04,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 clxscore=1015 adultscore=0 malwarescore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160051

From: Akash Kumar <akakum@qti.qualcomm.com>

Add empty port/endpoint nodes on the primary USB QMP PHY (usb_qmpphy)
and the usb_1/usb_2 dwc3 controllers, along with orientation-switch on
the PHY. These placeholders let board files wire up a USB-C PD
controller's HS/SS endpoints directly via
&label { remote-endpoint = <...>; }; instead of redeclaring the
port/ports structure on the shared nodes.

Signed-off-by: Akash Kumar <akakum@qti.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/talos.dtsi | 35 +++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
index 1d74e459f892..04636fd88807 100644
--- a/arch/arm64/boot/dts/qcom/talos.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos.dtsi
@@ -5078,7 +5078,21 @@ usb_qmpphy: phy@88e6000 {
 
 			#phy-cells = <0>;
 
+			orientation-switch;
+
 			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					usb_qmpphy_out: endpoint {
+					};
+				};
+			};
 		};
 
 		usb_qmpphy_2: phy@88e8000 {
@@ -5163,7 +5177,21 @@ usb_1: usb@a600000 {
 			wakeup-source;
 			dma-coherent;
 
+			usb-role-switch;
+
 			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					usb_1_dwc3_hs: endpoint {
+					};
+				};
+			};
 		};
 
 		usb_2: usb@a800000 {
@@ -5220,7 +5248,14 @@ usb_2: usb@a800000 {
 			wakeup-source;
 			dma-coherent;
 
+			usb-role-switch;
+
 			status = "disabled";
+
+			port {
+				usb_2_dwc3_hs: endpoint {
+				};
+			};
 		};
 
 		tsens0: thermal-sensor@c263000 {
-- 
2.43.0

