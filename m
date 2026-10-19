Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792428395;
	b=17ZDzpPVxGYxtnGkdRBtULZNzyVMC6X4OpcExl/ITb46K2BhQD0slFByMtqwLgqBKtM7
	 EUH+vJlocwxAJuWKluCTDz1H9LrTa5Mm7Dt9HGi5MPwILLPZDIP+HtCG5GTOpQhQnacZQ
	 e7RN0NVo8IWjgvHOYrmDMJRrey3PJqAuwhz5JOPC464j62bZYs/fLG2ankCFiQAU8k/bs
	 3/mRl/S66lVO779ooVsD/zSPd3Z2gZQsqlOznLgcAtMHwQBvBE4MBuVuGBlo79Kf0CY/H
	 L6XGZNzlYbWC8v+x1cF3opleEzeE/w5kmzmpzCkW8DFVEQtIqoDxmEUTTOHbgr/n8zA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792428395;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=hebtPO5JWaFqiDHPGNPU2T+9bnoIHyDDr0H0tLrI97I=;
	b=b5rWchH3kVuYhIq8pmY2BrZ7idKB1zQ3kqkvaKKkX4n+zM7Pe4FwypiD5sNpVO+42sKW
	 XKBs6tOXfyut/kd/25THbx+mh34jNZBiBYdqrYLsc4rgDA7px+9RCWcbpF9jlKdNki2jw
	 IssTzZYEHQczMAZS9aJMytu8l5ymrEMr1WE3GBJwersCbtsHsIgLxabQ7QFiqCZb+Odst
	 39ZA76RoCjtwsXNzgDQaJkHYviO8cWfnPASCs1fPbwVnH57dc2DiT0VykaH4zwuz1Cj6B
	 2oSzYnm2b7BfWzAntfg42Dm3HqQuMg4mANks7GCPL7es6mIeC1Rfkwo0iXM6d/kPaQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Mz7CgNs9;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fuXLmgD2;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA26960A263E
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 16:46:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA26960A263E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Mz7CgNs9;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fuXLmgD2
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69JFP93g3115048
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 16:46:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hebtPO5JWaFqiDHPGNPU2T+9bnoIHyDDr0H0tLrI97I=; b=Mz7CgNs9zSBOxPXF
	SKljQOXDULC+KrDJAuNHf09hNnJgVDAJ9yksW3yLFf5VWyjh1FkkPWiPYWAWQKoR
	WGSvaA9M+w0DpBZmyLY5Eb5cQjK3S+EyiJK5jUtbaswAPGMfSqNY8sZglnEY2Y+0
	j0c2SUjOVWgT7Qf6ua4VXxMLb1MPcLkL6PQWuvqhFyMUAep3sWUw+0o4vV4F+nch
	D04Fg4tEwyNM90Y9cJmDKFzeIKylXX1jTla9h0hnZozslnUa4NN9AbP7anMGfsdU
	cYmwt26AvNOzCIpjmeqU56ukYFB6/hMJHKHH7ONbQxCokHMKJrFJVwVjyr9U/DQA
	GKPrhg==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hd5w1bt84-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 16:46:33 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-151ba226e1bso3680401c88.0
        for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 09:46:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792428393; x=1793033193; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hebtPO5JWaFqiDHPGNPU2T+9bnoIHyDDr0H0tLrI97I=;
        b=fuXLmgD24aMTYrnlB/u4T4f9N9mMotk5ac3w+7vqTHnCpNBTu53DIS/hAoehmA6+RO
         dnVrHUwyWxhTIxvGhnWdVBAEYAzIUZzuO2TOZSSD3r9TcUPsWXukuT1V4V1c2W9mw8/T
         eQLWK79ocxTo31ZTwnvWK1UZc5EQUtXo0RyrVBFWrdUPq8zhmfRNw198NaGB/sRu5hO4
         j/dbLiNkiYHBPtnrW6FWZ7jkZ+xnsk79IIeU6M9CALqr9/v1OslMmYjrtthoiMB0eNC3
         Oz7FNxBQjA+v2RlB1YLzCYpl/TItiUrN3i90pEak5FoC+F2tsO4xLPsNexyLcuRsMmgX
         IvVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792428393; x=1793033193;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hebtPO5JWaFqiDHPGNPU2T+9bnoIHyDDr0H0tLrI97I=;
        b=DgNWHp0QjYTfA46/2Wlznona9eEfYOChaePwJCUf2ocAlJCgNhIqAfh7ZHYoSeA997
         tbIz7techynXKrx2mbZRxZlWLJAjQ7Ps9OxZp+S6cjHBKznaxiD10zNMP8JqQwdisHaC
         dec5IYagTM3k8UkPKvNwCO9wIySMUlQRszm/w9rMzBJZQkBArIO382RQ1RVgCkQ4+9AO
         yAJdM20GR5ZMh3CgEMgNE72MiT1/+bqJaAOoSk7Jtl465/iL8q0XsUFlZvP4e8aimIzt
         JHTsIM2/wVMAvVQH/3THjtHFMrWtCcTo9XKlJFfKPqdrpKvym9MylpJXaD2l9R8fULIW
         636A==
X-Gm-Message-State: AFq9FYLDgnd05pltSDHct+rKfgAnS7R4bB5ZG+VjRP5FyjHRcCclkzyK
	que7+C8qrTJGM+UOhMVEwjBoWm52toTfps8OIZiQylZEkf2RMAfpipukvjiuMkZJgBiNQ5OZGgM
	I5LUTcrUJKBxwWrm1EdUSkMz7ohaiwvJbdLRGyJ7wV0VI0idClNETz+UacwFMuUxU
X-Gm-Gg: AYBFou2CsWee1sFxFq/qVNtCmNRSl3Ec7RYl2RPeJO1O089pbAz0+ZC/fHH0PgzgqTV
	sifyjQxz+UxPWsPueDR3ns3XAp7K1rM01ZkEJGPXSd8l3o/tbKChBLmVlkRG51r7jjcK+GMqfS9
	mkRMT9HyzmIpULHEMyjySochwQV4+OHvyVJMoU0ziA8iazE9qGh/klf3hv11F+BnX3ZyYdmQxGo
	YDCQYPl+FfctQ1f1gPSjceO1KLL7BlzugTtmxrODZXxr1KuDpvPDiDPP/AXWAhBpMXknnncRkrK
	Jy/jfKEUh4eFw3XyARSrTjogrj5YJ4TQeNxYFoeWtBtE7FlrTOXNxM1jyw96WYWcVOk4v9pKVrh
	Xj2rRwIkbkcTjmqPhJA6XSWLdbqQu9Ir9qXfgHWohHWeefiFhSHyOIY9ROhJAs95s1XeHVRfLC+
	+IMwoKcguzol/3KufBTSJhezicP3ux1wrEKlA=
X-Received: by 2002:a05:7022:302:b0:157:cbf6:89c4 with SMTP id a92af1059eb24-18514350f17mr18556601c88.26.1792428392661;
        Mon, 19 Oct 2026 09:46:32 -0700 (PDT)
X-Received: by 2002:a05:7022:302:b0:157:cbf6:89c4 with SMTP id a92af1059eb24-18514350f17mr18556562c88.26.1792428392111;
        Mon, 19 Oct 2026 09:46:32 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-18314b16f57sm30379415c88.2.2026.10.19.09.46.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 09:46:31 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 22:16:17 +0530
Subject: [PATCH v3 2/3] arm64: dts: qcom: ipq9574: add support to get
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
Message-Id: <20261019-imem_restart_reason-v3-2-e6b1ff5de841@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA2NiBTYWx0ZWRfX37RXGEToW75z
 UWzktwVmotR43iFy0rfgBKw4fPXdNGpZEz1E4NQogm+dmwL101QL5UIme6nfZEc3VrP2o3pMIAE
 ZoHY13AD5k03mCbd5sPtrgBLOdWBAow=
X-Authority-Analysis: v=2.4 cv=KuPYSmWN c=1 sm=1 tr=0 ts=6ad64969 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=WbeaI0-OC7IQdSlKmUMA:9 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA2NiBTYWx0ZWRfX26C+sF5sxfBZ
 pMSqMM4/03w1+pl+Sb7EGk4mniEeD3sYhxC/EHRvx7ccU/Jzf5X0/8aoq0D3XILuclmrBUcqPl5
 Nd/FIEiKB3/MOwX4Vbr7BuMAb3B6TxegCvc+6QGrhSNS3KPRlPDr+Ue3VshDXFwEYZOUkFioMlC
 8qW/rfe21ziYO8zcAKdbBKlWOxbMZARrqAdH1z8O7blIRGMqkqx8yMncYnnI6O2hFTv7kINOF+J
 RCfUzeMpaMSXIkYn4vTxfiTWioSXhpsYUibNMweRFlmmTVa4jNCxjn+QTcRuWDDrnCj+KO7o7iN
 layJUsFqU3fzzSetPfwhC3YT4Z73B9qPe5nfq/psvRaTdsI7QK+cgw7f+Z2Q2LeVK8E0I91pznf
 reUVKg5S/lQl/yQiCfsJHEbHHehWmuIYXS2ozJb+ZVNWxKsUl89OdIvuMlDySEsSegXAn/seZRh
 6Sb2yQSyepgDVYzLJNQ==
X-Proofpoint-ORIG-GUID: QhCw2c9DTIkDz2zpxjrmobwZmeVFjoLi
X-Proofpoint-GUID: QhCw2c9DTIkDz2zpxjrmobwZmeVFjoLi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_05,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 suspectscore=0
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
 arch/arm64/boot/dts/qcom/ipq9574.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq9574.dtsi b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
index 771a59585645..e1908f01851d 100644
--- a/arch/arm64/boot/dts/qcom/ipq9574.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
@@ -757,6 +757,21 @@ usb_0_qmpphy: phy@7d000 {
 			status = "disabled";
 		};
 
+		sram@8600000 {
+			compatible = "qcom,ipq9574-imem", "mmio-sram";
+			reg = <0x08600000 0x8000>;
+			ranges = <0 0x08600000 0x8000>;
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
 		usb3: usb@8af8800 {
 			compatible = "qcom,ipq9574-dwc3", "qcom,dwc3";
 			reg = <0x08af8800 0x400>;
@@ -847,6 +862,7 @@ watchdog: watchdog@b017000 {
 			interrupts = <GIC_SPI 3 IRQ_TYPE_EDGE_RISING>;
 			clocks = <&sleep_clk>;
 			timeout-sec = <30>;
+			sram = <&restart_reason>;
 		};
 
 		apcs_glb: mailbox@b111000 {

-- 
2.34.1

