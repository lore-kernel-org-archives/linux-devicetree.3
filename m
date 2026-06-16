Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D5BE3859D3
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 20:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781640899; cv=none; b=DwIpvxjSUTYw2ayRNE53KE1yMKnb0PNNt53BuloYH44V3eNgQtAm5MP22e7UUfZtlvoCxcjCj4K+hMl9SCsMpyt7lBgqrM6fryd/3DyxX2f7FVGEGTcERoKdaNgrJ8KUwauhOqRl9ReNXe/N88GEhPM2/uVDCR3OhWah68wZZg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781640899; c=relaxed/simple;
	bh=ODwdSoU7cqmB/7e1YsfTUheHlnTIX2vwYFihEXMDSfI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=cd8kLoB2bD4CIGwYhF9gucNgsDwf5m3719KsD1VHe5VRgeI3KieEIPT9DatjcQQNNxKyJj0YEcLv1dlOsmVF9zqhcUBrvRIDtHKxXVdTc7WSt0+r2qbgBvDd5GNKi8d6AG0vGCgdSO0zn/KL1qagJHvqcJf8butF9C6Y7b/z6Zw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kc4G34iS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZcMzzF/M; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kc4G34iS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZcMzzF/M"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65GIORoO3965418
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 20:14:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=BNn1Y3z1D+8
	dRX7RzMyWh4L6G1MgZA+3f5EQFzZKjbg=; b=kc4G34iSWLnifCCD9JjC2kiZsdN
	j7Or0ZlNU/q8wkev6/ydsUG12zBM5aJi2ghtuzfWBRQe629OahN5GfNrP2WAV3Xc
	Fq14YvS7bc7T3a1I5Jx2XTwDg5aWbWRHrHUPC0UC8kho80xW0dzROJh10Qx1UJ76
	JkFXgLd016k8GluUXdIcA/tKPbybMMx3+4a29neTIwcQFwXm4AbqDd4SPmxfyVoH
	OdRTz6qq2TN4xMAHm8Cz/Ovz4YgI8haq5lCzHY74gQuKVWOjdMElnCX3vm5Sn86b
	WrA63AGRAk6xcl7g+9GuuckQo9B5RMGDaRZhJ7d1gT8dAhuK7PHM9dbWazw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4etx8kcmht-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 20:14:57 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2c0b1bb53a8so1234065ad.0
        for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 13:14:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781640897; x=1782245697; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BNn1Y3z1D+8dRX7RzMyWh4L6G1MgZA+3f5EQFzZKjbg=;
        b=ZcMzzF/MYMJ/hxats3rF8BWCLM9olqUC7TqjyXZ37HZ/cSlAqWRphsU81xDSk5t1XX
         gyUl3f0dBpxLn9BHgjut4QoY86UTR+zxhUa6lv13tFV+++ISv8r01GU0HHVoflG9jdGN
         qrAIslTylfS/B3WhOPnnDLtCiG5B4E01SfgDOq8tXS+3aDQ6uXcW7t8oqqRtDV9PGM2d
         Ruyw+JD1owH6oSYghqqBwf7Y13u+/5g6rYli6Nx69174e/8WLhiPiUSPgtYbztbujhd/
         wOXE0K6nC7G4PjUSPcT6UTb2SvPOMH+rlpDq7u+98wp5gCa3/l0XASv2ZpmXN0K1Z1IG
         V1IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781640897; x=1782245697;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BNn1Y3z1D+8dRX7RzMyWh4L6G1MgZA+3f5EQFzZKjbg=;
        b=SNGykAfhecaYdMXUndBP9Cm2CuocdotNxdnb5x1RS0UnEaC5ksonduCn4nd0RM+tRp
         cS9kLYDJ8O0v33pHaEaXLkrHj+0DTVOxBP8MA6sugZJj4iXpPBaaXD7bGrWryqoqAdVo
         9Y+jKU0aeP+DXR9eKVFnNgs7WB6y+3+xV69Ddj8FxMrwhXDSudbWTHLlr9wnLm3GnDyW
         mCujTqyyNDE+Eez4bLCRICooI6bmQTMlHxiU2d2ngCcBT2Rgl7oUF99gAwBxqtrh/Y8Z
         DEO09+JjG5z5DkTbetC5byRtZMdgMFBYvcaf3mKo1FF90FiYo2JAChdVFSoQxt1E1UOH
         +R/g==
X-Forwarded-Encrypted: i=1; AFNElJ98IZVxoQlQi0jtqlHdl8CWkM+IVWxCDRD9BDeJ6/tQuNxmCJMukGWebgBcuXhnjrvDv3i7BwN36Cel@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6MoiVq0Kw1a2ltW3C6IHZO63gM1udevQ3Xfo95J8TyK8v3iRI
	R4cwKNWj4xM897XuL4c1Rg37Iz3KiSx3Mb1BZzhfNB0/aeGRGpX9Ny1aArpQxF5MUfCm2PYFjUN
	wyma0D7cLrAIYD2Yc4juaHyqLeSDIedCVfUsFtu0kb39hEXSDVA3Jd3TAZzFtxEsl
X-Gm-Gg: AfdE7cmeA7XXI8ZiX1qrtkKhkoWw6u77SsgAn05YMK13FIg33wOq8HNYz3aGxwCGFDf
	TSFT0yoDUHoZ5hBSdeP2wrRkAfWiM1Vvu/6AYsZ04L0rmKaKhDFsHtT7JAiwaJ2rt/c/WDkIXB3
	JDK538/NdOeYnlHCjtGgSV27P87dzpsDsUfz137OQR54Ie4yrD6z0J/1BQM9L4r1ArEYEHq/y+I
	WcjRf/QB3k2bYf6ZV9Tw3vbrUrNFuh17aNYnmguf8dXM7SEZRzknSppPuE4K6OT9gieRMDhMdFG
	x5lseAFUhlHWQBsz5ZVO0w+35YWdTODPeXBRVGcCmS7+HkLk3DdcHEt7lcsIOpEKZySVcDkx8iZ
	yGvx/UNIUSOpM+cFyNvOsXwNr9V8RubnSdWARf+UikplUYpPBNPAwmJGMTA==
X-Received: by 2002:a17:903:37c5:b0:2bf:1aa9:6c8a with SMTP id d9443c01a7336-2c6bcfd164bmr1794755ad.12.1781640897295;
        Tue, 16 Jun 2026 13:14:57 -0700 (PDT)
X-Received: by 2002:a17:903:37c5:b0:2bf:1aa9:6c8a with SMTP id d9443c01a7336-2c6bcfd164bmr1794565ad.12.1781640896810;
        Tue, 16 Jun 2026 13:14:56 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c4328abe7bsm136385985ad.49.2026.06.16.13.14.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 13:14:56 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Harendra Gautam <harendra.gautam@oss.qualcomm.com>
Subject: [PATCH v1 2/8] arm64: dts: qcom: shikra: Add QAIF CPU node for audio
Date: Wed, 17 Jun 2026 01:43:09 +0530
Message-Id: <20260616201315.2565115-3-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260616201315.2565115-1-mohammad.rafi.shaik@oss.qualcomm.com>
References: <20260616201315.2565115-1-mohammad.rafi.shaik@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDIwNSBTYWx0ZWRfX0rsh0dBJpVpT
 gAIAc+Xtnrd63xlLe6ad9iIDV5/nBvwYgihh7fkuSK5LJUigYKUS6reT7sK1xNsHe2xkikerPC+
 CHcHlGLmLiTV72J3EN8iXJgajJtgf6ViignMD66YhVekk+/IgkeUcbRoHYK9uRhAbdpA925ZGAP
 CgDGhdSIU6B4MG3MZ4akD3yaddZmv0PB2qqTHbzZ4NJTMlPbpE+8ZM5s9p3Du6JdSoG77xdYUvx
 5/3W3ZmIMaZHZBYSgWzQGaEkZN5wBUJxgTcEGc5g0VudrYM458LSBO26X/nde021CKsog1B99nI
 Fism17IVVLhlc69yZxonEFCkTDfg2Hl7Hmf13o/N2HZeuirdycTO365s9B2mgDOUfUi0ZlT3EvG
 iXdA0E1idmHGUV4TPLScZKY0EjLzvMtEt/3EqF4E0gCZDlAnrsMhJOftVuwDFqi5EitsKz2Le54
 qy0p9sQMvfPbWJW3tWw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDIwNSBTYWx0ZWRfX8OboL8O2oWOY
 IZ58XtUD2xa0YTRktj7mCYMGdkm5R7rHiZ1N12JtHYDHztOSZxEo2yJDgeSwDu6pBpeJv3Mhgzn
 TgMj17fG9WDbeV1gz3M/AYD/btQ2Kzs=
X-Proofpoint-ORIG-GUID: QiJI764dYSlomThRPSetyuYGNVKj6K1b
X-Authority-Analysis: v=2.4 cv=dZawG3Xe c=1 sm=1 tr=0 ts=6a31aec1 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=u7cSe3xy4d7cT3VL5CEA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: QiJI764dYSlomThRPSetyuYGNVKj6K1b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_05,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 phishscore=0 priorityscore=1501 malwarescore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160205

Add the QAIF CPU endpoint in shikra.dtsi so board files can connect LPASS
front-end links to backend codecs.

Describe the MMIO region, interrupt, IOMMU mapping and required clocks for
the QAIF block. Keep the node disabled at SoC level; board dts files enable
and consume it in subsequent patches.

Co-developed-by: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
Signed-off-by: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 46 ++++++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index bc4ad2bcbbec..e58c87fc8cb0 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -2017,6 +2017,52 @@ dispcc: clock-controller@5f00000 {
 			#power-domain-cells = <1>;
 		};
 
+		qaif_cpu: audio@a000000 {
+			compatible = "qcom,shikra-qaif-cpu";
+			reg = <0x0 0x0a000000 0x0 0x20000>;
+
+			interrupts = <GIC_SPI 331 IRQ_TYPE_LEVEL_HIGH 0>;
+
+			clocks = <&gcc GCC_LPASS_CONFIG_CLK>,
+				<&gcc GCC_LPASS_CORE_AXIM_CLK>,
+				<&audiocorecc AUDIO_CORE_CC_AUD_DMA_CLK>,
+				<&audiocorecc AUDIO_CORE_CC_AUD_DMA_MEM_CLK>,
+				<&audiocorecc AUDIO_CORE_CC_BUS_CLK>,
+				<&audiocorecc AUDIO_CORE_CC_AIF_IF0_EBIT_CLK>,
+				<&audiocorecc AUDIO_CORE_CC_AIF_IF0_IBIT_CLK>,
+				<&audiocorecc AUDIO_CORE_CC_AIF_IF1_EBIT_CLK>,
+				<&audiocorecc AUDIO_CORE_CC_AIF_IF1_IBIT_CLK>,
+				<&audiocorecc AUDIO_CORE_CC_AIF_IF2_EBIT_CLK>,
+				<&audiocorecc AUDIO_CORE_CC_AIF_IF2_IBIT_CLK>,
+				<&audiocorecc AUDIO_CORE_CC_AIF_IF3_EBIT_CLK>,
+				<&audiocorecc AUDIO_CORE_CC_AIF_IF3_IBIT_CLK>,
+				<&audiocorecc AUDIO_CORE_CC_EXT_MCLKA_OUT_CLK>,
+				<&audiocorecc AUDIO_CORE_CC_EXT_MCLKB_OUT_CLK>;
+			clock-names = "lpass_config_clk",
+				"lpass_core_axim_clk",
+				"aud_dma_clk",
+				"aud_dma_mem_clk",
+				"bus_clk",
+				"aif_if0_ebit_clk",
+				"aif_if0_ibit_clk",
+				"aif_if1_ebit_clk",
+				"aif_if1_ibit_clk",
+				"aif_if2_ebit_clk",
+				"aif_if2_ibit_clk",
+				"aif_if3_ebit_clk",
+				"aif_if3_ibit_clk",
+				"ext_mclka_clk",
+				"ext_mclkb_clk";
+
+			iommus = <&apps_smmu 0x1c0 0x0>;
+
+			#sound-dai-cells = <1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			status = "disabled";
+		};
+
 		audiocorecc: clock-controller@a0a0000 {
 			compatible = "qcom,shikra-cqm-audiocorecc";
 			reg = <0x0 0x0a0a0000 0x0 0x10000>,
-- 
2.34.1

