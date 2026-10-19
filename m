Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792428400;
	b=CVMQDj5G38cxWK4ucbEbSskaAWWVs3jjbCaUHP8mioq1oozR/S0cOVogSFR6esP4VocC
	 zrNTS3TsbjlhhJLfWI92ZtDl2eVzW2bLUFOOcY5nVGqV7VlcSTeH51AMAyAMtlNjdgh6r
	 XSPji/HWeGhJz+Y8G+bAnM177s8keAq0Z4dz230xAzBoWSE99hKMLQqF52sFpcdjmm0R3
	 /NXf5Yi+onIx4LYYfb+gcgcY9Ql8zmxIDwUT4Z2ZcEYxHM/a2571uGxXH2G1C8Kiwyvmc
	 mVvb94swerJJJiIQrDf9H/IzuwL1aMD+DZPUJUk1Z+PHsHUMsExJf0x6lhRQgpjEHEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792428400;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=LCB12u/eYnIgNx+afjUtJRsI2c6eqFrAafZ5xx6S5qg=;
	b=iWhk1hsP+ZpN8Hg9aG3LK2B2QO3uiYDLAkY7aqzdgteBrDTX7gGngIHOpZO9fda1DiQB
	 jiGx9LUNs1EFBKYGsAH1Ysz0jO+8TvZGvrWQ3x8MD5P/TwaXfUClaw0gy99Kd/niW5oAo
	 2Mz12QIOKiwFr470RidXk8GDuxG6wpNhFqTCHDO5pJIV+SNG5V/t3JU9e5SkfSaT+3mN7
	 4HKAFLwXoOD303aoAhOfGUCByoDjcuBIjxLCpT2bFlXL9vaHk6c1Z1f/tDrVx63BcW05z
	 w4E/zrpWYLYe+REhLAIWCKZsSL/GjU61MkfTif5uv5aNxxNbD3e+wds75DH8q4IpbiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Eesuay6R;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gtfKn3OM;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2777F60A3817
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 16:46:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2777F60A3817
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Eesuay6R;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gtfKn3OM
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69JFPFU33675097
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 16:46:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LCB12u/eYnIgNx+afjUtJRsI2c6eqFrAafZ5xx6S5qg=; b=Eesuay6RDDnwsxRu
	K//2N/OLOvTUdpIAZ7xVQsuBo3GJQhS2EuIbDFJfATY9kTIImguf6/BFWjM/Qt/w
	wcrAuUnRGseAPTO45fQO/qGWzjBpq9QWWZeZI0rAMJADTCPTdQ+5LHlkpwDwZ7Ji
	fwKtuPJrmmYq7BC+MinxkIrTVD8vQK7/I97vlCu3HKaO7EHqypjcg9VkwFQrsTjJ
	2Ab6ZOUL27VIAhFK+k/XcyvO7bNLZaM4SDo8Mcp9PG6HilMHntvKm7ibe1EohqBR
	5M+h01suJoDX92i2wivjNef1LEndoqi8McuN/3lrsMt2ig+eTM3baL33tu843vcD
	fHCdyw==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf48j6q2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 16:46:37 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-151ba226e1bso3680510c88.0
        for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 09:46:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792428397; x=1793033197; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LCB12u/eYnIgNx+afjUtJRsI2c6eqFrAafZ5xx6S5qg=;
        b=gtfKn3OMiPvQw6ScF222fuO2mCS9rT06UhvsBuiolLs4bdfWsHAkWszGL7OlkoojUL
         CiNqnn18S93M3KMxCmqlFlFrMrUJ88d4kJSnWKNEFRwkK+vB+IO4FnbtP7VS9Mh5Jy+c
         KBqqV4mGS8rkwA0Fhu/xorz09D7jxMjU2xYBhVjnqeVJmBwpb1m8IwRACqK2L0xTZUyJ
         1sF5y/fmGc4z/kMBN62YhV8C0pPlQ+/stG7JgVAiZHbhi7HezIuasJOm3Ymm1zdiVpft
         Z0lcqn9TQ6mN8KzCvfZkHqLdcTt/AN3KhSaEHvDJ17FcknEMxciFGg0uEcUr0mlUyVEE
         baqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792428397; x=1793033197;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LCB12u/eYnIgNx+afjUtJRsI2c6eqFrAafZ5xx6S5qg=;
        b=Wpmyx1LnuiEx91ImsB5J0lBgcQKuRUIVFTf/V6nzrylbbN9zhzdqsXESylGPHVydiQ
         bZj3HROssKUjN/k31eBvsFGqL2QN5PESXhQMRQrvBZHmcnfWaOq+U/Mnrif1wrTtgtZO
         5wrLUY9/Hejakzj64ZjjSLRdBeiPNJZ2ZxktOGrLt+zBvHiGcC2oCP4FPPfIRGcaDbgt
         M424nK4gR6bH/8vh8Dlq/PiOO0T2PeFcGq7JNnoZnbW2wrdQGYmmWBIh86N59e6APfXL
         4QkN/dcV8VnYEbduQnA/PF0lhcurHoSxSo8NMESb086S4C+K7UJ9+a6Lk5DSDk5TtXmf
         SjVQ==
X-Gm-Message-State: AFq9FYJx6vso6FnKesM8xca+l/kJ+iGVA0/VpHdLjfSWs7npREte3IF9
	skRDDdIFhaFwM8Qp/4GbCft4BC5t6BY8C8arLCp05u02OnB6+c6gMLWOZbwB+apcFPMTthzh/Mk
	ZwjOvxfTdhBLcPcgEP8sAJIt1EPXUk8i/Ao+06xg/TU2AsyOPaHgedaQDTfdL2Hs3
X-Gm-Gg: AYBFou3psmdRJNe7BKx7RWycPxM1CQnD1Wpb0x30pv0dtTtrhTmKhSXdU5rMT9tvZbd
	bESqIc2R0XfS+AxElZ40iyWPVR6gP+v3gMG8VMJaXGxWIbmB/3du2Y6lfuvAhebf1RCTHlem8kQ
	8xG3A7jHfJ1LwLFihEkSjknHyGQNV3yZojBKKarDZ6LkvkokIUXNbJvNlncycM23IRRGLMG+iE8
	6mTW1XffovqMzmFOM6R8O8lr6tPdoVlrqdJ/wvigdYszHYWfrCLBjUqx+/Ny0/D3Q56TZgxoWkX
	akUk34+F0yEYhjFqsmSTUEWZ4IbHth3LZbXUJvlzQJsfkObfP5m2rwZwrFwfw/EhDTspB09j+3R
	PYa0LPYExU9Voi/01S2RnulXzf/eHzNd/b4nZSMs1Y6A3NsMJVd6EsHbJMrzCyjsdVJef15U7Gm
	jelsfXxOw57nwxowJqX/nHuSWbPCGInwFuEpc=
X-Received: by 2002:a05:701b:4201:20b0:168:6ad8:e89f with SMTP id a92af1059eb24-1850c22369cmr12825690c88.3.1792428396929;
        Mon, 19 Oct 2026 09:46:36 -0700 (PDT)
X-Received: by 2002:a05:701b:4201:20b0:168:6ad8:e89f with SMTP id a92af1059eb24-1850c22369cmr12825650c88.3.1792428396320;
        Mon, 19 Oct 2026 09:46:36 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-18314b16f57sm30379415c88.2.2026.10.19.09.46.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 09:46:35 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 22:16:18 +0530
Subject: [PATCH v3 3/3] arm64: dts: qcom: ipq5332: add support to get
 watchdog bootstatus from IMEM
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
Message-Id: <20261019-imem_restart_reason-v3-3-e6b1ff5de841@oss.qualcomm.com>
References: <20261019-imem_restart_reason-v3-0-e6b1ff5de841@oss.qualcomm.com>
In-Reply-To: <20261019-imem_restart_reason-v3-0-e6b1ff5de841@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA2NiBTYWx0ZWRfX+TSiyVymeAjn
 JRwubleBLyRtGDIjvZWvDy0mPRdNvh9Cr7xHVrdLzhDb2APCztHz9jcKfxU/mzofXBA7w93XMDk
 73bAxugk9Zoxam2920LUdK8Gan80zo/BlNJwdhM+//kGZzlatUXsI4qsl34xirVsuLcuhceLfUW
 Gpp91WaJlsuzCBxLZvU4F3TzASd+hL/FBt8RA8MtTpN9ZWPAH+jxDQnI+Khm0wL73ehdNZwvbPM
 ghnzWUlwXzSCPClXhHxCRrs2BZtI3RQJxSViXQvnbWotAVQxTg9ecaVUJF2DbyIwIaBUwI6FRnH
 kkT4oUb2BW2eS8u3nApPU2mB8jqOu17lsIxgcce1Bi/7ZrkKxFWafLcEZhp+Pqp1KtABmfafkdr
 /04i5kfU1BmH5KJ/8TVOab0iF0p5aE8qAfGRkGZufJtQ4BlAWDYoW0Wbmxl5b4kAXbMQfYQPQQH
 gB69Cq9V6wk+ozByxbw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA2NiBTYWx0ZWRfX2QcSLvQs1OAJ
 pzIiGOJr+TibFhp6QUfXzolLFZPXkEHtqKOe4NUBuQHpXaSB/kxU7AQcQqhCJNXnExUIBsectUK
 9HsRqvkxJzlUZ4G7bAJiddT3Vb/CGyg=
X-Proofpoint-ORIG-GUID: Pb_pqBkSFCXUIFNpmEd61eJBGEwGqGan
X-Authority-Analysis: v=2.4 cv=Qr/LTlyd c=1 sm=1 tr=0 ts=6ad6496d cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=WbeaI0-OC7IQdSlKmUMA:9 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-GUID: Pb_pqBkSFCXUIFNpmEd61eJBGEwGqGan
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_05,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 spamscore=0 adultscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190066

Add the "sram" property to the watchdog device node to enable
retrieval of the system restart reason from IMEM, populated by XBL.
Parse this information in the watchdog driver and update the bootstatus
sysFS if the restart was triggered by a watchdog timeout.

To achieve this, add the IMEM node. The overall IMEM region is 32KB but
only initial 4KB is accessible by all masters in the SoC.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq5332.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5332.dtsi b/arch/arm64/boot/dts/qcom/ipq5332.dtsi
index 74d9de8d7641..c1b083624696 100644
--- a/arch/arm64/boot/dts/qcom/ipq5332.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5332.dtsi
@@ -493,6 +493,21 @@ qpic_nand: spi@79b0000 {
 			status = "disabled";
 		};
 
+		sram@8600000 {
+			compatible = "qcom,ipq5332-imem", "mmio-sram";
+			reg = <0x08600000 0x14000>;
+			ranges = <0 0x08600000 0x14000>;
+
+			no-memory-wc;
+
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			restart_reason: restartreason-sram@7a4 {
+				reg = <0x7a4 0x4>;
+			};
+		};
+
 		usb: usb@8af8800 {
 			compatible = "qcom,ipq5332-dwc3", "qcom,dwc3";
 			reg = <0x08af8800 0x400>;
@@ -578,6 +593,7 @@ watchdog: watchdog@b017000 {
 			interrupts = <GIC_SPI 3 IRQ_TYPE_EDGE_RISING>;
 			clocks = <&sleep_clk>;
 			timeout-sec = <30>;
+			sram = <&restart_reason>;
 		};
 
 		apcs_glb: mailbox@b111000 {

-- 
2.34.1

