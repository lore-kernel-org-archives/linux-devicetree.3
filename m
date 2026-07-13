Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B97413DEFF3
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 09:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783934946; cv=none; b=A4NULhUgz9baHlu4rpgu52avkvkIENBc8amKl1dQ50TJ1wp6+JPqWuTsNGek8evpY1zjHp62vDzJH/3xlf8pcG/BEBlEabE1yC05unI+90ZBUiuYUHNyEzzaRNLyVXe9wF1IliSo0/z7YvfPXUwCv0d5Z6IR09fthWTNDq8eiEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783934946; c=relaxed/simple;
	bh=sJSdnjQ8F9thY4CJ2jAN6HxsC8VOY915E4kKmKwM0aY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lsv+aWUcTVuV1Hn7oQ1Zc7z2FEgEPkZZeWPa5JzBvegwgK62TYRy/PKKGjxUXaLM1JXjKG3d9n1yxkSWQnQ9lZr3mJm5a1wVuq7OdJVoNUy5ckMZ9EhoV2ljqVoJjqEhNsbqIuG6T8W4iPZmivHZ2rL6kcx2Eic4hy6l76juLZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jTCrrdwz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CICR5LM7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jTCrrdwz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CICR5LM7"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D6Nfsg469252
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 09:29:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ut4KOCe/6QCkbZVxR+fuKzOonTDjyvlhOXIbY6Oo+2A=; b=jTCrrdwzM7yV8DwL
	A59FJdHwl7m/4IMpC5V4jAtKgKbHbm/1w1YXzxMLjYce/VuikHJdsd173Zl53q6k
	8s9Mq2zLk4pCd0NVB3AYJjN+nINSdGB7hFhlkCjSPXehrpDXAJKHwsSDsQilB68B
	UulyMqIzHUEXL7ja1yVmaDIhXDC8/AmP5Wn11CRUpXODBc0Yk8iM+/hmSaZg59VT
	FsVgau60jwfv/Jij3NvaYvIN9LvsSa940QSY+PPWiC9S+4qIbkdVpivkWghg3l3/
	t6W7UWAtYSveMskhE2F/bVM65uDsrjpWqCBYdf5J/b71WJ1AaPkTUxXqsCxfQ4j2
	p5FYMA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbf485drv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 09:29:02 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38127ae6b99so3985127a91.1
        for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 02:29:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783934942; x=1784539742; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ut4KOCe/6QCkbZVxR+fuKzOonTDjyvlhOXIbY6Oo+2A=;
        b=CICR5LM7Wpq/A/OBOOmE0wSesM+1tfgUDoUIaG/MTWKZxuDrGBagaVzTvM1Q5a1xuO
         lDJtdUPKGN9u4RT9zkmOygUPe6N+2QusFLt5lGGWCX+afjL+5yQR7jMsRZ7qBEZYGDUK
         mcwkkrhQaEBjq3ZsIdqnkmnfXmsGSndOEx9+x/xrx6dNLuiBWoiCXHq2vPrczJd8E+1u
         prT42nLgIwmqdMM1/eEquPUTc5Vbdd9Bz7Oiwy+0VGmWBXkVgXkxVzmU8Mb2xhxrTDNq
         1SvH7DXVMbwlcK/XE3Wa9kT6uwk9HUO41REgAQ22tNgjtxDcijwtFYDxI96n+iuf/Z8g
         MHOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783934942; x=1784539742;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ut4KOCe/6QCkbZVxR+fuKzOonTDjyvlhOXIbY6Oo+2A=;
        b=G2DSF/4eX3S2+yYkR/WEc3cEbtDTTzX5jJLa21PbdqrcS2MbSrGiNYkxdZ5msBHnxs
         Wpmb1svdC/JeGkg2AuD749JK6Set5n824rqAVP48VE/jOBqeAw32b352UOpDyp/vMLdm
         wkMrUo+FpyKBnvBhf5Nlj+yQa8G9TsMTkze98cTGwXeq7WI8onJ83Cs7TzgPPApTLL5h
         K6Nc/p5t174ZuZdLtbJ9zfFUyXzPnT2d7JKjVbYS/EiNILNofO0S0OFKX6wh1kYbDYRu
         +iyhi1ESbm1siVWFPRKgIoaauWzTw9KlBq86iQQo9I8kOLCcAo6z9Jc9DrGR7nYtkSJv
         VnRw==
X-Forwarded-Encrypted: i=1; AHgh+RqzQ7oZ0q7dt4TU0nO9akBc43aTYGUtxub6H2rIT4Tx8mw7BB+zDwFqXNOmBIh9kW0YGdxoCMaiWXG8@vger.kernel.org
X-Gm-Message-State: AOJu0YyNLP+qdSKNZVsgpvCyi+x+k2vxEMD42ihaEXzW3mEnJKJkpBbY
	lj3PfCc4SsoY9haWbXWFiSh9dMWC7rz/KFwwildw1Wy1URoo4tMku22ATWBuMOSKKF0rfnSlQor
	HKDNbpI7TyR/kHthC7X4WGsfkX8p5BQQGo4+Pk4c/pE3rdyL+uU44nN2kk/6Jyvl2ORfe4qRD
X-Gm-Gg: AfdE7clHORSnrQhgnOD3APDRy/aAl6tTsA6FzfnX9zgfUVj+KmJ1WRd797EP24DE9Qm
	JtkYkiFKyAAq4QQShDnwqTyU8YxYNhF5o5FWeh19vegr+nmK9JTa7qulkCeFEV3ytgZXjTEZAMb
	Ho8FpM2jU6C8prqqeHIjPY2C72q+st19L5XwzgAz2a6t4THhVGcqeX/urYmceE3YoBnwU5TxXQC
	X+46PdqdIad+sIP5IXeBpBO8Z5CzsEZ1avrdNJtxhAb9Gbw9IGsLsBpYC65H1ZVcZ7q5slHNr6u
	eusUPmbcpdIFBXUWEmQ8Sj3RkpY0u4DDjfyT8HJ19EBqbbUJCUbR0BwstLS2FcJNr5gE0VkUgQf
	zwQZRt6rm9X2JN4RzCKUT6s7E0UxejK0ACs3JvKwIiw==
X-Received: by 2002:a17:90a:e70f:b0:37f:fda5:8d98 with SMTP id 98e67ed59e1d1-38dc7e28254mr5920225a91.0.1783934941811;
        Mon, 13 Jul 2026 02:29:01 -0700 (PDT)
X-Received: by 2002:a17:90a:e70f:b0:37f:fda5:8d98 with SMTP id 98e67ed59e1d1-38dc7e28254mr5920205a91.0.1783934941389;
        Mon, 13 Jul 2026 02:29:01 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311935fd091sm47495569eec.24.2026.07.13.02.28.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 02:29:01 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 14:58:33 +0530
Subject: [PATCH v5 2/6] arm64: dts: qcom: shikra: Add CAMSS node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-shikra-camss-review-v5-2-db53be15dc4f@oss.qualcomm.com>
References: <20260713-shikra-camss-review-v5-0-db53be15dc4f@oss.qualcomm.com>
In-Reply-To: <20260713-shikra-camss-review-v5-0-db53be15dc4f@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Suresh Vankadara <quic_svankada@quicinc.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783934917; l=3937;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=sJSdnjQ8F9thY4CJ2jAN6HxsC8VOY915E4kKmKwM0aY=;
 b=ExFXa4TwS4p+Rvq4zfW1IXT0AAGbxMEnwbUW7xnnh/d6w+npzuOOhBiCrxSUD2EqJgB5h/BMV
 fnHIzCQvvCWDxJkkjK+Jp1iZmGkEPftJMA3LHQu5V7XmifTM55C49uD
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDA5OCBTYWx0ZWRfX3rnmyFDUEZy8
 NQF5LCX0hnrXoUygNzjNq7vMRi/xtZ5nhuloVIH5oGOVBqW/N4SPZ48fUaoH9GQaySKDFm6+pY3
 +7Oy4iF+DRycqrtmrLfkrq5Ud12IxNo=
X-Authority-Analysis: v=2.4 cv=OsJ/DS/t c=1 sm=1 tr=0 ts=6a54afde cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=ahKksh3eZu5pIVwncigA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDA5OCBTYWx0ZWRfX1Om3GtEsKK6l
 edh3Jtcw1Qln+mOCpk5IB8lYA0QcnADUyz/2w9fzFgntq1WyUXZoVgeIQdtCdo2axw6gvh+eGr6
 EwenCFIJmW3sRF115M+VxGYu60pxLM8Klz/WSSNioHGGaKEIykiDj5wZa9YNuo46M4NfQ1mRzWY
 8KandY0EStM/YdnPHQ7waEqKXMLolosuRiZPigvxAHwygLf5m//pUrZw3SY3hYsUjw8TmPbLW7R
 E161kFemFviPkQCN5UnDUeQj6zk4IiGkaglLR6kGcsNtIPXpNMu1Gbygt2kHDQp9iuR2s5x49BY
 5SphBJA2IGCI7gXihnrQnWljfRGteLrmu2v0tYZR+bQeAchIfRrCiQD6xDnAn2nYV4EV8e07eTF
 rjZx1ZLUGcyYbtCd2H9sFAU3oUuQl/ir3DzepHot0M8VZuhn49d6EE+9JPnH4aSadZ1JQislhrA
 8yle7rrczvkCjdxS+Cw==
X-Proofpoint-GUID: vUAYF0hfEKgdOBc0bfUuNsKzP7u90TJ2
X-Proofpoint-ORIG-GUID: vUAYF0hfEKgdOBc0bfUuNsKzP7u90TJ2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 clxscore=1015 impostorscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130098

Add the Camera Subsystem node. Shikra shares the same IP as QCM2290
with two CSIPHYs, two CSIDs and two VFEs, but does not include CDM
and OPE blocks, so only a single IOMMU context bank is needed.

Co-developed-by: Vikram Sharma <vikram.sharma@oss.qualcomm.com>
Signed-off-by: Vikram Sharma <vikram.sharma@oss.qualcomm.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 100 +++++++++++++++++++++++++++++++++++
 1 file changed, 100 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 4e5bc9e17c8ed8914733ac9fdc9b69128b40216e..6335caca329808ee04d9067f1f95e8075e2fc3ed 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -604,6 +604,106 @@ opp-384000000 {
 			};
 		};
 
+		camss: camss@5c11000 {
+			compatible = "qcom,shikra-camss", "qcom,qcm2290-camss";
+
+			reg = <0x0 0x05c11000 0x0 0x1000>,
+			      <0x0 0x05c6e000 0x0 0x1000>,
+			      <0x0 0x05c75000 0x0 0x1000>,
+			      <0x0 0x05c52000 0x0 0x1000>,
+			      <0x0 0x05c53000 0x0 0x1000>,
+			      <0x0 0x05c66000 0x0 0x400>,
+			      <0x0 0x05c68000 0x0 0x400>,
+			      <0x0 0x05c6f000 0x0 0x4000>,
+			      <0x0 0x05c76000 0x0 0x4000>;
+			reg-names = "top",
+				    "csid0",
+				    "csid1",
+				    "csiphy0",
+				    "csiphy1",
+				    "csitpg0",
+				    "csitpg1",
+				    "vfe0",
+				    "vfe1";
+
+			clocks = <&gcc GCC_CAMERA_AHB_CLK>,
+				 <&gcc GCC_CAMSS_AXI_CLK>,
+				 <&gcc GCC_CAMSS_NRT_AXI_CLK>,
+				 <&gcc GCC_CAMSS_RT_AXI_CLK>,
+				 <&gcc GCC_CAMSS_TFE_0_CSID_CLK>,
+				 <&gcc GCC_CAMSS_TFE_1_CSID_CLK>,
+				 <&gcc GCC_CAMSS_CPHY_0_CLK>,
+				 <&gcc GCC_CAMSS_CSI0PHYTIMER_CLK>,
+				 <&gcc GCC_CAMSS_CPHY_1_CLK>,
+				 <&gcc GCC_CAMSS_CSI1PHYTIMER_CLK>,
+				 <&gcc GCC_CAMSS_TOP_AHB_CLK>,
+				 <&gcc GCC_CAMSS_TFE_0_CLK>,
+				 <&gcc GCC_CAMSS_TFE_0_CPHY_RX_CLK>,
+				 <&gcc GCC_CAMSS_TFE_1_CLK>,
+				 <&gcc GCC_CAMSS_TFE_1_CPHY_RX_CLK>;
+			clock-names = "ahb",
+				      "axi",
+				      "camnoc_nrt_axi",
+				      "camnoc_rt_axi",
+				      "csi0",
+				      "csi1",
+				      "csiphy0",
+				      "csiphy0_timer",
+				      "csiphy1",
+				      "csiphy1_timer",
+				      "top_ahb",
+				      "vfe0",
+				      "vfe0_cphy_rx",
+				      "vfe1",
+				      "vfe1_cphy_rx";
+
+			interrupts = <GIC_SPI 210 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 212 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 72 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 73 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 309 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 310 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 211 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 213 IRQ_TYPE_EDGE_RISING 0>;
+			interrupt-names = "csid0",
+					  "csid1",
+					  "csiphy0",
+					  "csiphy1",
+					  "csitpg0",
+					  "csitpg1",
+					  "vfe0",
+					  "vfe1";
+
+			interconnects = <&mem_noc MASTER_AMPSS_M0 RPM_ACTIVE_TAG
+					 &config_noc SLAVE_CAMERA_CFG RPM_ACTIVE_TAG>,
+					<&mmrt_virt MASTER_CAMNOC_HF RPM_ALWAYS_TAG
+					 &mc_virt SLAVE_EBI_CH0 RPM_ALWAYS_TAG>,
+					<&mmnrt_virt MASTER_CAMNOC_SF RPM_ALWAYS_TAG
+					 &mc_virt SLAVE_EBI_CH0 RPM_ALWAYS_TAG>;
+			interconnect-names = "ahb",
+					     "hf_mnoc",
+					     "sf_mnoc";
+
+			iommus = <&apps_smmu 0x400 0x0>;
+
+			power-domains = <&gcc GCC_CAMSS_TOP_GDSC>;
+
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+				};
+
+				port@1 {
+					reg = <1>;
+				};
+			};
+		};
+
 		qupv3_0: geniqup@4ac0000 {
 			compatible = "qcom,geni-se-qup";
 			reg = <0x0 0x04ac0000 0x0 0x2000>;

-- 
2.34.1

