Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ABF93CE099
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 07:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779175082; cv=none; b=fcQV0OlCfHudT/+na7+c5ZV3uf8nPx5gHIzbi9miDaWu6ux3AgR4kSsaLDd3JUm0PPyk9hEvntw/lFOH7YbqQBHUl9kquV8jT8Pr1D5VWMBnhVgsD1kqwZsoLyVhW7kRIKvup8zk1siAACk9V5WYFNsY8gU8XCqzT3rGKEBdhUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779175082; c=relaxed/simple;
	bh=0qw8sjvHQWkUtwqhC0Iy/YAjFgGt6U5SN4bXTGV6RoA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fCg9nEe0I0X/U3MsgGcjYMT9UrhsZVyACxzuCFziN+E9z4d/LWOTqFJn2aPKUA4ZmSjfFQcevFywDSwQHHgAcrLRpNB7yryFdXdpvQiu/F+wCnxlT1mOZ1/qiRpl8Wbg3VJ0a3y/92Gw4FVA7VDZR/OrE+7GxyrUNdoKV8ohLdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IrSffWkC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Iw/r5vVH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IrSffWkC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Iw/r5vVH"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64J1Tf0w2975727
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 07:18:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DKI7N4Uw4WETmJ23A5GtCCRzZ+SnGo4KbGVS16i4NGM=; b=IrSffWkCNSvuKSc7
	/ToWHbA87iV34OXH94x2j+L+d0H+dcNvZ1cOzpij/ZbIwyTkElXhkPiuv2yyJbBv
	nWVbFi2XN/aZaMMjSDjZrHIXlmV2x14A2ujc1U5EgJg3LfYytpbMS6gNufBQSyJ/
	H+qweR6ZuMEpmGFJxYcDj6qUOVTgkFO2l6JlcPnsQheq4vzbk3KOESKTiDeBsA35
	WG96jV9SqgYYJLJie4cPrFlvZmmaYVpP4wjV0e5f1ZImHEXj8vJ5uOwe+7GuwZ9n
	OjNnUIHyhD4m3y8B/BvOGWtlonWHofXliBX9dECP3rPVreOn5CJwL07msB0pnVvk
	SCUwlg==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e84v4b5fq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 07:18:00 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1353a6f29deso3683293c88.1
        for <devicetree@vger.kernel.org>; Tue, 19 May 2026 00:18:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779175080; x=1779779880; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DKI7N4Uw4WETmJ23A5GtCCRzZ+SnGo4KbGVS16i4NGM=;
        b=Iw/r5vVHqpn3LvOTzo7kwZm8LE6eiOyjFSNnrbjyyVv8uSAZn//8naCt1lgowpvwOs
         KWPWvARQEUOzv5Sd0qTLEZg2QSUiJlLy6JkNYaEI46dWFVM275sed93SwJrA13bki/qm
         YvOHbF8uIkckDgNj3Ve80pz3qXb59pM8ygiEuh8yVAenNfkwZ8kq0m4GDjM8EZ+WG1Gy
         PMUK5aw0UIMv9sBz54htz03d3RYjIkghT6f/boplcOVMW0327SSfb2CFi9nQEJR233cc
         DtTCBh4QjYW5+0P10gZoVxpR7qujs2w5u9WvtQKjxk1cuIe5yqbn2KCao8GIL9EgWk9J
         33eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779175080; x=1779779880;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DKI7N4Uw4WETmJ23A5GtCCRzZ+SnGo4KbGVS16i4NGM=;
        b=SR2FudgfQvjZdAWziN7Qv/fLII5OHpVOB9WihHDpgi4p7fiWc7cKX/BQoHOpWfdZ6t
         NAuigFvXuusH9CjMWFqPY7k1DTqry6uUfFlIBM/K86F5QM4qBQ2i+s96U5IrO3g2kFJD
         Zy46NA1ml25c71rPYLBmlwMsvqUh1b2AJ6TKQuytgWOQSHB/b+Ws/NiFREJ637UYVTRT
         iXdHTW6sGx9K6M+ynMf2Mvtco6wwzHKACoisqWBRorCo1Vt35fHwW5d7KyjR+D5kkiFI
         rCVNwJ2qQ6nZ3i8g/FGMgfhPr3fCDcRdp2God7PLfmHpxBXmS8ScpSz5EUwUoU6ybclw
         J7cQ==
X-Forwarded-Encrypted: i=1; AFNElJ/UF+rsCeKOTw2EUob6YR+22iw0dKc6erPK0lXtjOF+Sk27GPCetWjiAjnjaUXOlBsl/iXrPZ2RoHck@vger.kernel.org
X-Gm-Message-State: AOJu0YxHAHMb440e1wpDJjqw/gu3CqwRL7hMiTF1DgR/U2relieNVFQE
	ILGEIPefs4BYIFNCCt6d7pUi5KBl9i+u0FF+UVsMivkezTmJojfCrsf5kTHm66+K61xxj76a1f4
	6qOK9rvHsRS4YSqzdfZWnbvNkA1ziepEnXe5ZblDtpCdlaAaWBuIGKebZtTAYqMiX
X-Gm-Gg: Acq92OFgDseHSFheU3E4llit8YTE5tWcRFAkZNDPfDFkilLqzoERPd98oHlEucOhlKY
	3pS4TI6Luwe6Rt+RGOoyXaeXGzvFgimUwG010j6crlOgTXiRk0RMt272lVd4meG9O8/p6/GsoBY
	BcbJqvBz6xB3qTOv72Lq15D9Y83HJFP2ZGUdMeu2Kgqbtvvtt9730R72YMDb8JGG3VkrEMYGWl3
	1wkRnudKfY3j7wLD8AIP9paeccA2emWCDf7vcPeKV+Z9SZK25Zl/Tr2vW/ELbWXJRddIFz/meG2
	mQvHRE/DE0HeQKu5iatb/Q9He7gYqmjhnwGadbo8xgJy1s97Ccik8zN5b+JEjP9wfhD3UrnPjiZ
	wbAJCaKirhC0e67xYYrUE6J5U1MyMubwrhtn7yS6x/lUUdwltDn/S5dAQ2axkrQRqjAK63Yjnmk
	T7
X-Received: by 2002:a05:7022:41d:b0:134:fc38:4e5f with SMTP id a92af1059eb24-13504943039mr8921485c88.22.1779175079812;
        Tue, 19 May 2026 00:17:59 -0700 (PDT)
X-Received: by 2002:a05:7022:41d:b0:134:fc38:4e5f with SMTP id a92af1059eb24-13504943039mr8921472c88.22.1779175079212;
        Tue, 19 May 2026 00:17:59 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-134cbed2232sm23323747c88.7.2026.05.19.00.17.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 00:17:58 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Tue, 19 May 2026 00:17:56 -0700
Subject: [PATCH 1/3] arm64: dts: qcom: sm8750: Add camss node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260519-pakala-camera-v1-1-b6d897864916@oss.qualcomm.com>
References: <20260519-pakala-camera-v1-0-b6d897864916@oss.qualcomm.com>
In-Reply-To: <20260519-pakala-camera-v1-0-b6d897864916@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=VJPtWdPX c=1 sm=1 tr=0 ts=6a0c0ea8 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=T-Dl8XKw7-qrnIs-YWIA:9 a=es2bXTfkhrpURJIW:21
 a=QEXdDO2ut3YA:10 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-ORIG-GUID: CbIujA32Z7g7Q5u1BgbJ0oJwcrmsCD19
X-Proofpoint-GUID: CbIujA32Z7g7Q5u1BgbJ0oJwcrmsCD19
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDA3MCBTYWx0ZWRfX+fGQDxVoEhw9
 Jp+o7Ku2N0aWju6YGuEC5/8LOKuv7tBM2k1r+3ms8FdyY2LhasI6ENUMpCLheVp4OqfkrDAVXtD
 oH9kj+B8Z/SiofUVJaN0EBGd6NLdKhH7pvmcTTcxNjhXtvkMXTnnmaJOqc6qucaEZXpxp41w1Tc
 xiiItHkK1AliMwObx3D92f6C3ssGj30mloTseLsWjpjiDZwpjGAXbmahO9FuX/i+MbHNtaM3pTi
 VoHjHlpVweO59Y/WQsshvE3Z1VSfI2Ta7OaKYAjKxo1G/zVQsgbRMeJn12uHtFXzSMrO+6vWCqu
 Pfo9nZ/HbU/vFIgUPZcA6DaWRI2dszqpG9yML6+4fzidGoaUMtahppNCITwr4YVQSakvXFULPHF
 oc2oFga4H4P8e3nMmKxZGZKQiArXfNUGmMIiyowmI/O2WCEyz0Z0e3Lpldqw9OG3uCd+ZJhm6ws
 DylaLw9snicFCpuU+ig==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 malwarescore=0 bulkscore=0
 spamscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1011 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190070

Add node for the SM8750 camera subsystem.

Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8750.dtsi | 203 +++++++++++++++++++++++++++++++++++
 1 file changed, 203 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index 70830cb49e73..8ed3d8c791e3 100644
--- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
@@ -3032,6 +3032,209 @@ videocc: clock-controller@aaf0000 {
 			#power-domain-cells = <1>;
 		};
 
+		camss: isp@ad27000 {
+			compatible = "qcom,sm8750-camss";
+
+			reg = <0x0 0x0ad27000 0x0 0x2b00>,
+			      <0x0 0x0ad2a000 0x0 0x2b00>,
+			      <0x0 0x0ad2d000 0x0 0x2b00>,
+			      <0x0 0x0ad6d000 0x0 0xa00>,
+			      <0x0 0x0ad72000 0x0 0xa00>,
+			      <0x0 0x0ada9000 0x0 0x2000>,
+			      <0x0 0x0adab000 0x0 0x2000>,
+			      <0x0 0x0adad000 0x0 0x2000>,
+			      <0x0 0x0adaf000 0x0 0x2000>,
+			      <0x0 0x0adb1000 0x0 0x2000>,
+			      <0x0 0x0adb3000 0x0 0x2000>,
+			      <0x0 0x0ad8b000 0x0 0x400>,
+			      <0x0 0x0ad8c000 0x0 0x400>,
+			      <0x0 0x0ad8d000 0x0 0x400>,
+			      <0x0 0x0ac86000 0x0 0x10000>,
+			      <0x0 0x0ac96000 0x0 0x10000>,
+			      <0x0 0x0aca6000 0x0 0x10000>,
+			      <0x0 0x0ad6e000 0x0 0x3000>,
+			      <0x0 0x0ad73000 0x0 0x3000>;
+			reg-names = "csid0",
+				    "csid1",
+				    "csid2",
+				    "csid_lite0",
+				    "csid_lite1",
+				    "csiphy0",
+				    "csiphy1",
+				    "csiphy2",
+				    "csiphy3",
+				    "csiphy4",
+				    "csiphy5",
+				    "csitpg0",
+				    "csitpg1",
+				    "csitpg2",
+				    "vfe0",
+				    "vfe1",
+				    "vfe2",
+				    "vfe_lite0",
+				    "vfe_lite1";
+
+			clocks = <&camcc CAM_CC_CAMNOC_NRT_AXI_CLK>,
+				 <&camcc CAM_CC_CAMNOC_RT_AXI_CLK>,
+				 <&camcc CAM_CC_CAM_TOP_AHB_CLK>,
+				 <&camcc CAM_CC_CAM_TOP_FAST_AHB_CLK>,
+				 <&camcc CAM_CC_CAMNOC_RT_TFE_0_MAIN_CLK>,
+				 <&camcc CAM_CC_CAMNOC_RT_TFE_1_MAIN_CLK>,
+				 <&camcc CAM_CC_CAMNOC_RT_TFE_2_MAIN_CLK>,
+				 <&camcc CAM_CC_CAMNOC_RT_IFE_LITE_CLK>,
+				 <&camcc CAM_CC_CSID_CLK>,
+				 <&camcc CAM_CC_CSID_CSIPHY_RX_CLK>,
+				 <&camcc CAM_CC_CSIPHY0_CLK>,
+				 <&camcc CAM_CC_CSI0PHYTIMER_CLK>,
+				 <&camcc CAM_CC_CSIPHY1_CLK>,
+				 <&camcc CAM_CC_CSI1PHYTIMER_CLK>,
+				 <&camcc CAM_CC_CSIPHY2_CLK>,
+				 <&camcc CAM_CC_CSI2PHYTIMER_CLK>,
+				 <&camcc CAM_CC_CSIPHY3_CLK>,
+				 <&camcc CAM_CC_CSI3PHYTIMER_CLK>,
+				 <&camcc CAM_CC_CSIPHY4_CLK>,
+				 <&camcc CAM_CC_CSI4PHYTIMER_CLK>,
+				 <&camcc CAM_CC_CSIPHY5_CLK>,
+				 <&camcc CAM_CC_CSI5PHYTIMER_CLK>,
+				 <&gcc GCC_CAMERA_HF_AXI_CLK>,
+				 <&gcc GCC_CAMERA_SF_AXI_CLK>,
+				 <&camcc CAM_CC_TFE_0_MAIN_CLK>,
+				 <&camcc CAM_CC_TFE_0_MAIN_FAST_AHB_CLK>,
+				 <&camcc CAM_CC_TFE_1_MAIN_CLK>,
+				 <&camcc CAM_CC_TFE_1_MAIN_FAST_AHB_CLK>,
+				 <&camcc CAM_CC_TFE_2_MAIN_CLK>,
+				 <&camcc CAM_CC_TFE_2_MAIN_FAST_AHB_CLK>,
+				 <&camcc CAM_CC_IFE_LITE_CLK>,
+				 <&camcc CAM_CC_IFE_LITE_AHB_CLK>,
+				 <&camcc CAM_CC_IFE_LITE_CPHY_RX_CLK>,
+				 <&camcc CAM_CC_IFE_LITE_CSID_CLK>,
+				 <&camcc CAM_CC_QDSS_DEBUG_XO_CLK>;
+			clock-names = "camnoc_nrt_axi",
+				      "camnoc_rt_axi",
+				      "cpas_ahb",
+				      "cpas_fast_ahb",
+				      "cpas_vfe0",
+				      "cpas_vfe1",
+				      "cpas_vfe2",
+				      "cpas_vfe_lite",
+				      "csid",
+				      "csid_csiphy_rx",
+				      "csiphy0",
+				      "csiphy0_timer",
+				      "csiphy1",
+				      "csiphy1_timer",
+				      "csiphy2",
+				      "csiphy2_timer",
+				      "csiphy3",
+				      "csiphy3_timer",
+				      "csiphy4",
+				      "csiphy4_timer",
+				      "csiphy5",
+				      "csiphy5_timer",
+				      "gcc_axi_hf",
+				      "gcc_axi_sf",
+				      "vfe0",
+				      "vfe0_fast_ahb",
+				      "vfe1",
+				      "vfe1_fast_ahb",
+				      "vfe2",
+				      "vfe2_fast_ahb",
+				      "vfe_lite",
+				      "vfe_lite_ahb",
+				      "vfe_lite_cphy_rx",
+				      "vfe_lite_csid",
+				      "qdss_debug_xo";
+
+			interrupts = <GIC_SPI 601 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 603 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 431 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 605 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 376 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 478 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 479 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 448 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 122 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 89 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 433 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 436 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 457 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 606 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 377 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "csid0",
+					  "csid1",
+					  "csid2",
+					  "csid_lite0",
+					  "csid_lite1",
+					  "csiphy0",
+					  "csiphy1",
+					  "csiphy2",
+					  "csiphy3",
+					  "csiphy4",
+					  "csiphy5",
+					  "vfe0",
+					  "vfe1",
+					  "vfe2",
+					  "vfe_lite0",
+					  "vfe_lite1";
+
+			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &config_noc SLAVE_CAMERA_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&mmss_noc MASTER_CAMNOC_HF QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+					<&mmss_noc MASTER_CAMNOC_SF QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+					<&mmss_noc MASTER_CAMNOC_NRT_ICP_SF QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+			interconnect-names = "ahb",
+					     "hf_mnoc",
+					     "sf_mnoc",
+					     "sf_icp_mnoc";
+
+			iommus = <&apps_smmu 0x1c00 0x00>;
+
+			power-domains = <&camcc CAM_CC_TFE_0_GDSC>,
+					<&camcc CAM_CC_TFE_1_GDSC>,
+					<&camcc CAM_CC_TFE_2_GDSC>,
+					<&camcc CAM_CC_TITAN_TOP_GDSC>;
+			power-domain-names = "ife0",
+					     "ife1",
+					     "ife2",
+					     "top";
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
+
+				port@2 {
+					reg = <2>;
+				};
+
+				port@3 {
+					reg = <3>;
+				};
+
+				port@4 {
+					reg = <4>;
+				};
+
+				port@5 {
+					reg = <5>;
+				};
+			};
+
+		};
+
 		mdss: display-subsystem@ae00000 {
 			compatible = "qcom,sm8750-mdss";
 			reg = <0x0 0x0ae00000 0x0 0x1000>;

-- 
2.34.1

