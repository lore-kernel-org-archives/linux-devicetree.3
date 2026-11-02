Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793634814;
	b=CmyRNa3LEhE4Fqmayc4AanVQVh7oHXvRy2ePDmROvkLw2P63LeVrc0hdPbOEzpTRa7vx
	 vIMpcutKMQyEkAqAbQp8fYcfnoR1MIMpThxn7SD+Pv9cKRz+tvCUjoCm4ePRqBtUuLLsc
	 Q0DJEp7HkdyTm6zX/eXlON61t6LbrLGCLzC1heas/lGxyACoeRdFGTmPV+AhPD0CQlATk
	 7QAKGqxbyVEjTdevTwXOK8oaQjo8FuZtSgZS+hITkFfmR3qwRWFxpaW8FmbaPSuaGMGU6
	 D+ToNiZJwIDkM9059AedQrC5GHx6jBidfSa2bcmxwOOMC9W5Okmj0e2VioX665SF7Vg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793634814;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=2Yqb8w77911HPId3dxP6CpINfJB91u8DEDhhhf4QlPo=;
	b=flI5UJfaOU4JFvOVeEpuplaH79C61sWcX9GBt4qebK1urXTW2LRODEGLIdHE+6fXuflf
	 0lH7widwHUXdYv3AhmjpntjfihL3tAhjkl/3cwNb18woEovhfg//kK5GQXCf+H/073dJY
	 kzjA1XscUaf4m3Iw/TOVWpLl2VBUpC7NpV1rDmECpu+HlpRWRb+uxCDz1ZX4NASRX2aoA
	 2uDIksBQ0ylMTvb5BNYIHR4YaaFOkGqyiyCGG8zuduFngwSJWxI9FDwJXhEr+UgiRwiSh
	 CTeFdeZf2KduCG+23HBKaNzo7iYG80BBF30GIAUtVIGel7Q09UdfE1c4ry+vLbgq+7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=G+CObwbX;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Wcy6Ufrk;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CA4860B424B
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 15:53:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1CA4860B424B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=G+CObwbX;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Wcy6Ufrk
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2DqCYF478257
	for <devicetree@vger.kernel.org>; Mon, 2 Nov 2026 15:53:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2Yqb8w77911HPId3dxP6CpINfJB91u8DEDhhhf4QlPo=; b=G+CObwbX/Gmg+pZ4
	fognyXMh0IC2dT0SEtBOqA3W5rLWfbUixeNS9VHb+YeFE6zdOuzltBj9CJT3qljG
	Mbxn69/NvckEtVEAEUO2kkgzYKZpEU0Kn7almUd8SSgVKMVICe/7IEhwCGSWe/8m
	mj62r7hQfvurb89H6G27Qg42J2ABelwBTrtz0wmPAyJZqOl+QE/Y4nefcTbtrS94
	DdRyPHFlUnDSvwScaNjfDRvrHCnH1DbJORSFHqBK3pT5hDnYfCfR48BT92VfvEpl
	j4AZu5yP7YBs0DIuX7N+1TfVlgzLzCrR5YguDrSMjIn4/8kcbUaHYoArTNyzttJC
	zOyeVg==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpph19ypn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 15:53:32 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7bf45382794so2772360137.1
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 07:53:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793634812; x=1794239612; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2Yqb8w77911HPId3dxP6CpINfJB91u8DEDhhhf4QlPo=;
        b=Wcy6Ufrkq+Y8ltAuJRUPYHqbcZlRyib+cZCa9vquHjVuSTGSbjie5a8kkJVezRbM3d
         xA/65zZT03Z/Bdq8WnDne9w3POonpbzgq2v8GgAR1v2V3y0N4ztQh2Hys7DQfh1rNaby
         n4gHT9HEtBrodrCgYRVgYyCQdlamAQqudS7syI3LP6H2BVM05BIkFvR7LIk7kE3khfuQ
         LoI92P42bgVMplpVvO6MdKUmQ5hAJft2qQ4K1woV8sbq4v2xflBHGVv+XGQPMlm5x88a
         IKC8JJNo4cSwTeVz9s8YhqINGc2wIeWnOxPS7k7FpE/q5HkjpDPKxIFmjR63p0hDs4v+
         KnaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793634812; x=1794239612;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2Yqb8w77911HPId3dxP6CpINfJB91u8DEDhhhf4QlPo=;
        b=cFGjPMhsf1JB+daKTg/m9AXT4zIx+QDz+n8lR3A0HkMkp6kfSvRd0XX1ynMiKdq09V
         /ZnFQjhSuxgQ7K9E7Np8R7mTK7QQgl9NyYcro6luRm00jpy0HwAvkYdbnWo6mm0PSy0Q
         O8HQrhwFZX5DsBK4ARgGUVbpJ1pmEmr3OsVT5WXM+LSJ5MOiEXHYIlDt2+tpq6DC4pqx
         Jjw0isw2cbT+gyO11J35fJ+3V7CrmrpR3iQZrx4KYjNaD0Vx5Ek8rC0zFKc+Ws1Te6wA
         mHwPkKBOLhajBzEPAUGHBGJ+J1yDZVU5//htCQ0w520le46vi2laAJxlBEElNi64ZXEa
         apSw==
X-Forwarded-Encrypted: i=1; AKwUvBxsEVZt3zHaBL8diQ2PiWnVe4oDQX1IptZrbmjOJ3eLm+DLXlHcxNsvak0Vm+cIH9lnITd+I51o/O1x@vger.kernel.org
X-Gm-Message-State: APuU4Z8T1h9nw+fYQqWdHXZmP22k4RKFasGlw6t9J6iCRAz5vCGwd+xm
	As1q8rAzKhpxTEziz6E0kgmJrpXZy1pi9emq+1egwJzPYQLPf8zA5R1HEkEaU3adUlcmvvZy5dy
	O8Y+/3dq7a5Cn9RJy89LzMgQbgT7jRx/Codi3Jd8OoD/ha2sc5/QCOb944KFaJZ2S
X-Gm-Gg: AYBFou1f3d1YhwfElKZgMGX3WbC2BDVnTN0Fd7t9fxe3MnoljCS8aqdAYnyNGeNVTQU
	6bKtX/ZwyEUmJaRkUTeAtXk/OItZpzbXu/RXTAJgPisp7yqXMb0KTYQFumh9YQN5rHhn69/NVEB
	WsMF58LYvc3OAS5sOtQw4zpxecgRNqWK7dzH2qkkhauN+2MlXb6cYY10PytUHaKybvylvswlg/T
	WoM2D91Wo57A3gmNz6iqYf4gQkajuqFVO0W7EYpxxo2FjAvZRBpL+LZ1QKD/pf0MjCFX+ttj50x
	G93b2iY9ADh/ymhJMXgGgcyLxpoJw4rQnK+w9CHXLUBikX4eqA+M0H70O1mjNdpZRtMnI8IcBJX
	WHCGHv7GOh8lOwFtN7S0Iwqr9OOZjFjXrgyuTYHQVekKoERLz2U+y71iVBJH7eefnAkIkc4iWbW
	YfHGVe4HqPtW1wZe0+AZYRWlIPjwIe94Ekoz60NXqtO/R2z3fPVcXOxaYRbaGQ6Y+Qh6Jzg1bLa
	91fN4Hpfo5KSuW0HQYHXAnbehPh
X-Received: by 2002:a05:6102:3ec5:b0:7ce:6289:314 with SMTP id ada2fe7eead31-7d07269900fmr4433990137.14.1793634812051;
        Mon, 02 Nov 2026 07:53:32 -0800 (PST)
X-Received: by 2002:a05:6102:3ec5:b0:7ce:6289:314 with SMTP id ada2fe7eead31-7d07269900fmr4433972137.14.1793634811366;
        Mon, 02 Nov 2026 07:53:31 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:f048:3e89:c517:10cd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b8a7d1sm20700323f8f.38.2026.11.02.07.53.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 07:53:30 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 02 Nov 2026 16:47:38 +0100
Subject: [PATCH v12 7/9] arm64: dts: qcom: agatti: Add OPE node
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
Message-Id: <20261102-camss-isp-ope-v12-7-702254689feb@oss.qualcomm.com>
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
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: F9hBcInK7zkbSnVDXWTAPLYCbMApEwGX
X-Authority-Analysis: v=2.4 cv=IruL47/g c=1 sm=1 tr=0 ts=6ae8b1fc cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=1BEw5LmG3YzgyHxDt7YA:9 a=QEXdDO2ut3YA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-ORIG-GUID: F9hBcInK7zkbSnVDXWTAPLYCbMApEwGX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA2MyBTYWx0ZWRfXxZwaR0jpMAPC
 Q4FEQnflHFP00YMhKUT1PXTq8ebKihm3YTZ6hc8KYYEgpmF6Vxw7deq6nhSuO3YBt/DdlBXTxzd
 l5ASuSAWZCWl3AmW5s49ww17FC1waX5M6QWt32BnAqP8Rvvc6StXo7eP8dKWvF7vS+0DhTWwZ0u
 HWbXGH+8XPbtMDDkkkyksYlCu6MBAwLpzdkIAN90dIgBxjUvRj4na1JxOIrTEeongFxbBKS+vMN
 AYCzHaMHbr4xUJ2l0AC7HpJ07wC1wbJ7TfnDHcBGoWKwW4TRA2FByKUkG52cqG8b2JxwDkVmcfL
 vvnGYYv+TTeDXaXod9+11ZJBzrn+ZuRIkJF3tegysuYHwOrDtxJJeod9r+g3TjZIoZNIO6Jicwp
 oqC4koxiOweNmAV0Hnmen2q1gJ3+S33ja1zILnUCUI2UiiWmgep9zlBfv4fatxAPFBQ60QUd7mY
 U2lIvUjX56ymoxlcf2w==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA2MyBTYWx0ZWRfX3VGAsEYS0C0i
 9v61uF/Egs9WQ51Nd9RQ9GvTElDiGuGKK7n2OaOAaLUG04sxwbmgh4HE8C0aFm7aMAeDIjYLych
 oGGvuFRnlYienYsATaNbYaXI2KlZdBI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_04,2026-11-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 spamscore=0 impostorscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020063

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

