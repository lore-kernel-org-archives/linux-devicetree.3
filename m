Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EA66437465
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 12:42:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784896950; cv=none; b=ppMIrEUcoqUrq0U8TAobPoCocCyRb28ynmmyCRarB7rJYRaMO3O0HMf0dCm70/JzmWVyu6VgBXnL3+eTmSfSTn4zG1NNoDKJWPDRIm+ZflxWPVIZ7080SaN1juw/70xGEKf30B64/jaaPx4gjbOqFSaJ6WIZOg3Mb/P79JQUrF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784896950; c=relaxed/simple;
	bh=nQqUhgXotRWdDq54ePC7kIEiXg5TaW0gtufA0bIJ2aA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ule/lwWcl7lEnKz+NDJ8GyguTp3XwO33PXJcM9b4mXn/SiV/poZtUEJQ5Gywm3XflZ8Q+ynTbKiCs81j+LnR9h9w1kWBKieMGFsv5pWXcXRPGQ5eAfTJV4EQBV2As3hWAzJk0Kbj9+Ftb6jKY4h0kMrX6Dz/Q3t1emtnL6Iv/IU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KTUTpT8g; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZtgSw7Vs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KTUTpT8g";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZtgSw7Vs"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66OCgSnk3077461
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 12:42:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	y4lXwyJTG2HDGVz+oUq0CyFvnXZ7CyF+uIjGoUXBxT8=; b=KTUTpT8gAyVcf54E
	us/May/CgCWFJvev0ICg590O7U09/mpxAFnTj+XAa5NoeWXrqhi7xbQR9937aH0/
	zY1SFWLdIJQ0b+3YUCeObhZNpOPIOJpyrXDzjOJ360gRJfYdNMoLNNBL+/GvXAFy
	ROM9/DlHysn3e9A14xaHaE2fc1T6b7KjrwHkQuHz+r2a4oxxwMbLAa+CM6Hdp52O
	3BNdXrpcJ0ZHSCVL6I7Pf7MKS319Vf4DN2So2zQIz4J0VbURRxpBkzSpa8Oj7CPX
	sSTcp1mH1dRzzjNYT0a9YPwQ92xwa4byQ6NN7DHxKvQH0/crfqf+h5oyODF++SnN
	b8ZCpQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fm0p51sgs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 12:42:27 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5283fa0656dso30415191cf.1
        for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 05:42:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784896945; x=1785501745; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y4lXwyJTG2HDGVz+oUq0CyFvnXZ7CyF+uIjGoUXBxT8=;
        b=ZtgSw7VsrKpANSedir/lwmv7y7QXlnm9vln2jWUWa5Va3Jp8n+r1mS2IeiJMnp5vdO
         qZuqlygji7ewy6XCz4g/JLFl+Xr41cpzB7I5w1eu8n8cgZIy/WwyzCy/g5LmkE6x8a5R
         hZ1gQ124QJjCT2x+7QoiNGQ07Fh6DZ2N48T8sSrZZwY120c/hO5MaZ+IfEM3C2+9crIK
         2Po+1SitW0pbF0AY06vmFAhbh+s0TkAwfIh2Isw5QgKIq9Js32nwyWY8tQFcYEiNj3FS
         /QfE66j0lXWVKc5eFja0fR5Jf5HI0/pJa1tscG6ntroUVrdVQ5hnCgXBTOhguzmjz365
         9kNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784896945; x=1785501745;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y4lXwyJTG2HDGVz+oUq0CyFvnXZ7CyF+uIjGoUXBxT8=;
        b=B/kLMmdUT71W9oFHP/i0p5153TJjc+6HfTh9K/nZYNxMJ1IrEAClLyXQJSzkHRUiUq
         gN1p6IR2+mDsZsYwcziqLeAMpkFRF/ABSMu4aWZik1JSmpWXq38ySySckgJa9oSSNNir
         HR9cn49Bs7ukHPH/gitww/bTLP8g+m6kCe2UXdf/9ud6wYfzujW66iEU7T7rVHhtuzN6
         O5aSLfEmqqp213NQrglfrCxVPKHUsuPReTyZc/Qk1DyumJafAZSKr+XKxqZFWvPUF+s3
         whAK7GkxV//lFRf/d3VgiviKIHWRr3puAz1Yk0jjWvNlAcQb6+ZL109egqHkAkV43LZR
         4IXw==
X-Forwarded-Encrypted: i=1; AHgh+RqyiPnnfjMd7kCTd1imLDI/13bQpStg0ofc9p2wKuJUnEqfoaL9lQteJIwQDp597MjKTkLJMTuKudZI@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7EN8rx0JsX5YPAv4CaFlyeCiJUAILWY3BnXwsnAgZGDZai+se
	EoARunbEXo3KgyTpGrbs+T7ueAc5DC4qzlPrYE+ebl7DDLbKz2tTmoNDIpGl8vlUQGnR6jvmJrw
	DE6uROACsTBVanoXl+8akxpKMtbhRaE5M3t3fcsQT1Tm8S1HDQjWS1VVvBIg1yo1X
X-Gm-Gg: AR+sD12cUUauhFhAw3mc5EfMu7rceo/NC1TF3H4DTZtXL9iOJ+BSa03vytQywNJ0/ch
	bg8EQ6nbJ8dCEqAGuvGWDGWcNSzXUCQA5lshA6xV3DeMSirbbwKtlTtoscpFtZpHlcsZ2Y+baju
	Ft64NJ9C0EyGQHVy1B5LxjGoh392Lc0wmKV1EbVC4symt0qFgJDjmGuLgoEJyCL0C+LZ/DuCNbh
	UJOEM6ZA4SjeR5/4wDOEk6qbW7pxMi/NHAlzckM0ebOi3VRuFfBQJQXt5xJ4U+wiRzfZkINx95z
	PSo+adOKdJflBghv3xgbgZ4sH5bRpCACney4brl+yaWv8OUr0WDBDgpqoA2ZL/oST6M9ijh7oL8
	sZuBoipyNpBUBSgTqW0P4KwxgRCOolMalChCDAUsN9Vn+aDeCPFCUWs14bvE2joK3OuIxcJHcsu
	w813muXjBZGv/Jw3cK5LIL2LWilwBDOi/SPbXukQKjmovK7CxHQA==
X-Received: by 2002:a05:622a:2290:b0:51b:f992:9e18 with SMTP id d75a77b69052e-5295d270a1fmr4294011cf.2.1784896945365;
        Fri, 24 Jul 2026 05:42:25 -0700 (PDT)
X-Received: by 2002:a05:622a:2290:b0:51b:f992:9e18 with SMTP id d75a77b69052e-5295d270a1fmr4293691cf.2.1784896944965;
        Fri, 24 Jul 2026 05:42:24 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:48e:a2cc:6c4:c92a])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1c32ebc828sm352591166b.43.2026.07.24.05.42.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 05:42:24 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 14:42:13 +0200
Subject: [PATCH v5 5/5] arm64: dts: qcom: agatti: Add OPE node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-camss-isp-ope-v5-5-e70ad4fa39ce@oss.qualcomm.com>
References: <20260724-camss-isp-ope-v5-0-e70ad4fa39ce@oss.qualcomm.com>
In-Reply-To: <20260724-camss-isp-ope-v5-0-e70ad4fa39ce@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-hardening@vger.kernel.org,
        devicetree@vger.kernel.org
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=Pq6jqQM3 c=1 sm=1 tr=0 ts=6a635db3 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=1BEw5LmG3YzgyHxDt7YA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: -lv0jTIGhL1j733zojViKg_VeEfSIt_y
X-Proofpoint-ORIG-GUID: -lv0jTIGhL1j733zojViKg_VeEfSIt_y
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDExNSBTYWx0ZWRfXzcCA6bO6/PWj
 4sDShidLPV7XM/TEYSZh4p/omWCVO6i9+xO4BvvyiGax3hqzjgFylJy+CJzOeCAMsmdES0UwaRE
 GrNhDo1xAzeuIXnKigxYnyAXfE+DqB0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDExNSBTYWx0ZWRfX8+bMiCRPddR6
 sCCnxuR+Vt4A8ZvreF5R2zl2itF7DQtoWfU78U+FiOsezjZ4LosX4MLnFYdCd2LW80H7LQyqRG4
 Jrdzvtvwy21blZ2RUK7lzYxXFqKGa9iKpRt0Rw71PJUImM+EFEU7Jpb7upZ5ArqB0SA/ePJ3/lh
 jhoTh8uHKT0T+mWv9oKwiCN1OeBrN4TT0pANGmOjT1xu3wCNRG1Svlo4Dj0g8r/bXDR8+Xgdaog
 qyN+LGBnJEW/gX3zzoeBIm1LRjaOxvK3KVjbG20Wzupp84f0+oPiZWlduzHeKqUVWUbqrkAA1Vz
 84ZugbYIw4LIZul+JOQtpd2FjlpwA82WXk96qWGgQuUQJ3IBp5AagCJxOLSn9IQ19GwJbDu5RAS
 POiUbQaE8Ka1IqvdCUQ2/iuPhqTludr29nDijpmuI3qPXN0I5hIrG0/Lhcb9S3XlrdtrEhdKH3Y
 5CM1k8aTWFTFoPTeggQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_02,2026-07-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 lowpriorityscore=0 adultscore=0
 bulkscore=0 clxscore=1015 impostorscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240115

Add the Offline Processing Engine (OPE) device tree node for the
Agatti platform (QCM2290). The node describes the five register
regions (top, bus_read, bus_write, pipeline, qos), clocks, interrupt,
interconnects, IOMMU mappings, and OPP table.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/agatti.dtsi | 79 ++++++++++++++++++++++++++++++++++++
 1 file changed, 79 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/agatti.dtsi b/arch/arm64/boot/dts/qcom/agatti.dtsi
index f9b46cf1c6462a89784429565e1636ce2ba68d73..33c4a8a58e3a70edef5314438414d2632632e291 100644
--- a/arch/arm64/boot/dts/qcom/agatti.dtsi
+++ b/arch/arm64/boot/dts/qcom/agatti.dtsi
@@ -1935,6 +1935,85 @@ port@1 {
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
+			status = "disabled";
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

