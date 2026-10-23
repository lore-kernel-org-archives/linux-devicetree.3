Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792768192;
	b=ETM7d/Y+Bo3XazvTGzhzs1tNx98dqpK/Ib0H/Z4aO6hUICSZfW5pz4DlaW5Uw3MmNS9P
	 g3h31wQsnLK918Zj0TUv+XBD2lJZzva4EgqlzhPo8gDZBcoSVloWpiosHJy9DOqJI9tT1
	 DtXhGGYtM6OkmdNGcJQ4yLKVXpY1Ketf/ompMmnwsukvNhCcZQnH9Nx708OkPv/tktWFR
	 Sl4HJV6tytrTQuZcpQ3BhY9MM28vBGtf3ctDujfQM8kcqoVpG1bJmXePBG5tw2dSwB9+B
	 76ZzIaccczdjYd7V0iWWm1iyNeiyWDk4p9w+GdKGd7bRbN/E+A98B1JyejpT82MbYfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792768192;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=posbByi2C22vAqDX2ezu/Vx97adQ0JmvEhOqcNgZPY0=;
	b=zoI9b0JDR/hDkhuRYsCMUa7UIdOvqka9kmQabvikjWhZmhArQf0ST7pT7xsMR9Lv4DUp
	 i+LrQpPCtbBB+xPamN1Z0SP6A/iWHRL/+H+/BajoJZRJIoc7J+j/laoI0juHIpyTlsTGs
	 w+GMt6FeyD/nmowkp44m2Y0DV6/XkJpgvl8WahEPSYWpKFFOT2tzODE3lYWC/4m07qb3O
	 tP8AFYsiE4DlHM7cDIEM1RWfTFTCqfHNrNLkMaMcpPE1dx/SzAwQXStxsJmPNpbz1tJwx
	 UEp2N5Vqw4UMFy3T08o3BnHj0ln8utbi4RYwGxYGBKMyVUho9EY4C32cJhM7B7Uguhg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="k1gQCA/N";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=A1d8bkNn;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 147AA60A6F44
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 15:09:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 147AA60A6F44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=k1gQCA/N;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=A1d8bkNn
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NE5vwA2109062
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 15:09:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	posbByi2C22vAqDX2ezu/Vx97adQ0JmvEhOqcNgZPY0=; b=k1gQCA/NeRRM0N6X
	bs7GqQN4v3pJZ2NXvC3FNKBxnn7bSUXLLsq84ULAf8uR6U4QfiyHOtUrDI84YLVc
	2Qh1YUmERppSR0THsNUXXzC5IVcWU7l7cFD+Lfs8NV+OTYWHz646ITwqGtk5llVS
	cVjGihIH5zb4edMp2mBbKaMRzljxozQiT+nIzpGyvp+GnlA8ci8E8z3NIpCE2yWn
	71pUOGy1zOLTx0Sb+YH2fhgrgkm0l/LgszOfzOtGhZ4dNnjf2Cx1IlICDYjkLoPe
	uyx3zadceXQyBayASCbhEy5JbIdCPdEkoxgRfV+UJyRu3+xsVLR9dS6jE2bvYL/H
	LX7baA==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqms47ss-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 15:09:50 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7b206156cc6so884520137.1
        for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 08:09:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792768189; x=1793372989; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=posbByi2C22vAqDX2ezu/Vx97adQ0JmvEhOqcNgZPY0=;
        b=A1d8bkNn4ZRwqMGIGJx5IXqEut6BUQhxl43tFro+K37vTm7HBY9NoVndns/Nw1l53w
         4OztkQAfJeM1zDl9pGlgiMuJjVJ9fP/JlYKNF+SG9/4b9DdcZHsm//JLnKo1bZfFfhZU
         cKLHfAc8v2ppLynI4sXBiaBO/EsGXstW5gu0XUay4bFSLhlTMPsXrTGF8LxX6m1arhZt
         zPa2mAvadxwbr+WADRWGR1RquaDYTV8xwdOvli8xnERl3VqVRXEMtbkiNF0dnRgl5Pkr
         Jm8vSkfAl7B/n2tVMspAU6ie8Is+UL67YykxUovYpI6pEMQtjPps+6nMVHyX+Y/aOheb
         NjhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792768189; x=1793372989;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=posbByi2C22vAqDX2ezu/Vx97adQ0JmvEhOqcNgZPY0=;
        b=tIhGHWyblZsq2qfJIe9w6tgfFGZ6zzDf1O+T6vlZXiKq8VU10fyp7kVd1y6/nEjVlG
         SVol36qsog+MTYaMf8XwxtOBCFLO1ldU9HjAWALG2jSCGWw7RbeENQk5iO2tMn2tfBv8
         qTXU5fSwaA7mNFbc6iNw/UeMK2F4fXg4hg74voojRnBS6PwANAy+00MDAz3JNGtfXJVk
         53jTiHdGipyyqsKIfW2SjxE176uoTZsZTtO2uqBno9Ca5wcFGb8/KGuOgkk/RneLgaea
         PJaOYCQ7i9t+lzf7uX9fr91sXk+ElO9zlGhfj5BfQAnFrCATS8w8bbmCalvLtVp4xqlb
         nDhg==
X-Forwarded-Encrypted: i=1; AKwUvBxPZigpg0lahNwWStkTqtuENnVBpfGA6p5i7gX1xcLtvEbdw7xaoJC19Oh8gCn1zx8YdJAwMP3I7sH4@vger.kernel.org
X-Gm-Message-State: AFq9FYJ4XKVYyBGEVpq++0j8L73vOJMBVblpKyzhgYoBHKD+5ZjlGFuX
	V/RETwvGn/OmYMTg2SQ01Hghhu5eJA13pLerlxuOus294VazVEXSBER04KifLIHgRw8qG9xO1et
	Fl4hc7E7fdJgqoy2W5TF268Skxe2HxtetiT/er3B3VYIzkrTdZp5Cb3x3HL+cI+Vf
X-Gm-Gg: AYBFou23wzktUxlQ+5yFU27CTbeD8QA9yR+1mkYquWsCHzOxo+xnlXa8rdA55Rvx//r
	6yMvCC+NAtmpbsa4ZFv0b4Y4DhAK6XJhekE5xt1NinaEihvOierbmQ5GnbmCf/9KQR0xUfcL50D
	Hbf1x5aR5e5krGsR7JIars67OciaNL4o2jcTdWvz3Nm3ND8mQU2H5vMzdSAnuwkx69VUr/Dx3b/
	MIDt+lJhkum/gTSPaDYfKHWDhEb4AAN16ighPZHbvHBW7SZGPe7lMXgyMb1K7GeYlW4zDz4qgAc
	bVUiL4FAWVad/z6xDsQSuifjwsPNq4z7uM7Ncp7eRcLfqa977XuAVPGPJm8m8ga5ltOjRk8r0JA
	dhPkuckW8esDKyuuTxDsPu3s8J5ZrECUTpsE5+TO8zUx6rkmK0Xy9GJFWA09fypXoW38HbN9MsO
	5DwYeIISvmknw2/u18HP3BKG1U+MaiDZICocD10jBKIFx5aWR4PFo=
X-Received: by 2002:a05:6102:5706:b0:7cb:fd69:4155 with SMTP id ada2fe7eead31-7ccc2ffad08mr1256687137.5.1792768189273;
        Fri, 23 Oct 2026 08:09:49 -0700 (PDT)
X-Received: by 2002:a05:6102:5706:b0:7cb:fd69:4155 with SMTP id ada2fe7eead31-7ccc2ffad08mr1256668137.5.1792768188810;
        Fri, 23 Oct 2026 08:09:48 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:d0fb:daf1:3106:3697])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3d4040d3sm323962f8f.27.2026.10.23.08.09.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 08:09:48 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 17:09:19 +0200
Subject: [PATCH v11 8/9] arm64: dts: qcom: shikra: Add OPE node
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
Message-Id: <20261023-camss-isp-ope-v11-8-0c2937195298@oss.qualcomm.com>
References: <20261023-camss-isp-ope-v11-0-0c2937195298@oss.qualcomm.com>
In-Reply-To: <20261023-camss-isp-ope-v11-0-0c2937195298@oss.qualcomm.com>
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
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA1OSBTYWx0ZWRfXzxv6po6hO7iz
 Vdf5POvW6blJJpSzPY3DHcg9qUAZG6XpBfQeu5AD4vEs+wy+gCkebVXTLFq+5H2avL/uFBLmrSE
 bUuutEBIrbYnyZhDsCCtZJqcQCwpieL3hSA7Of1ppBraybS3lJ/MCynL+bLxWVQsc439HT8lNtm
 AtZQ9+0CH/R7KKqHkxkPyzO6XeDX9aWFzDviBHjgINXTBJg30x67R6fdd8q/Jtds+pfnlRisLle
 pJa1H32pM8hXPq7+ku08xgpIhyMo5pUSElhZpD4wpdKFPb3q9SYkTXVRCaer6AQ8MQN9+gDTKDC
 nMWQ8JAFCZrSnv8qcIoh1n58oXJn2SzXY0jwJ39j2qutBwukl93nts1R1VcU3TahMFPd7Z905sa
 z7H9s2i4raUUBpQpyFhe9n+/iHwylSWcWXG9VzSRlkOmsP88mtayPWlT57u8HEeq0my5dmYDqOe
 WYDKtzq32y5GiVjeteQ==
X-Proofpoint-GUID: 9qYuERhw3iqJe2id9KwaQ2ywhsCQbb1H
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA1OSBTYWx0ZWRfX+oLjCyLjGpO4
 dI1T1lOoQ1k36dP8uJrsiuL5p86gPlZddIkUKuRlB4ypaNhbuaJvMPm2puFvDYiT6pnjankTo0O
 vgiRLtRjglAu8ejRqhBQ0VROb6JD8c8=
X-Authority-Analysis: v=2.4 cv=UdbE26SN c=1 sm=1 tr=0 ts=6adb78be cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=EzCDy3pf2FPqfMyO2-oA:9 a=QEXdDO2ut3YA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-ORIG-GUID: 9qYuERhw3iqJe2id9KwaQ2ywhsCQbb1H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610230059

From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>

Add the Offline Processing Engine (OPE) device tree node for Shikra.
The node describes the six register regions (cdm, top, qos, pipeline,
bus_read, bus_write), clocks, interrupt, interconnects, IOMMU mappings,
and OPP table.

OPE is a memory-to-memory block with no board-level dependencies, so
the node is left enabled for all Shikra boards.

Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 77 ++++++++++++++++++++++++++++++++++++
 1 file changed, 77 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 92d22e3b6931cf49f213d1807f78fc1a261f290d..5adc28e9aa64508366e6c7fdad191a152b8cb6dc 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -1828,6 +1828,83 @@ &clk_virt SLAVE_QUP_CORE_0 RPM_ALWAYS_TAG>,
 			};
 		};
 
+		isp_ope: isp@5c42000 {
+			compatible = "qcom,shikra-camss-ope", "qcom,qcm2290-camss-ope";
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
+			interrupts = <GIC_SPI 209 IRQ_TYPE_EDGE_RISING 0>;
+
+			interconnects = <&mem_noc MASTER_AMPSS_M0 RPM_ACTIVE_TAG
+					 &config_noc SLAVE_CAMERA_CFG RPM_ACTIVE_TAG>,
+					<&mmnrt_virt MASTER_CAMNOC_SF RPM_ALWAYS_TAG
+					 &mc_virt SLAVE_EBI_CH0 RPM_ALWAYS_TAG>;
+			interconnect-names = "config",
+					     "data";
+
+			iommus = <&apps_smmu 0x600 0x0>,
+				 <&apps_smmu 0x620 0x0>,
+				 <&apps_smmu 0x640 0x0>;
+
+			operating-points-v2 = <&ope_opp_table>;
+			power-domains = <&gcc GCC_CAMSS_TOP_GDSC>,
+					<&rpmpd RPMPD_VDDCX>;
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
 		remoteproc_mpss: remoteproc@6080000 {
 			compatible = "qcom,shikra-mpss-pas";
 			reg = <0x0 0x06080000 0x0 0x100>;

-- 
2.34.1

