Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11BF13F9F40
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 13:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774358050; cv=none; b=TvkrfpNwMzwsWUsSdTsY2AX7gTcCprRjmanuDOCkiY9cW/Fq1SkmCTtmrIQEmEKzVtaOlnzo5GOARbJX7GNSNDtxLqPQAIlQHw/xZkqug1kRkGJ1vTgEsOVfFmQkUbAXhHTNvTyUwIsxREEpBjRkK/8ikoD37VwgUahLMEZQSkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774358050; c=relaxed/simple;
	bh=A0IQkyvp9VZJjwmAmBglvF2YtSzqW/Om3BUQHbt+9PA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dMlBOZ5jUh61V8wc/+QuqqiJpClvq7HIMffWsY7xP7MdJw+vF1w/bzZ7O4FxYvwENk40b4lZ2n3016VJoJ5Que4xJx2HVryk9X89K4gbQ/aywOYTYCyLJdlVgFahLqulAPa8FIrI0AqY8ODcHXX+rjFt04PyfnO2xR/sAcL6ERc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HR4b3+2P; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RsaW0L21; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HR4b3+2P";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RsaW0L21"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62OAI3vJ1762120
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 13:14:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	p49DQ9JYh9TPZn7lluAR8uoK85UpgfGic+fiunj6Xfw=; b=HR4b3+2P4gKKefGr
	xyShQ1hJ/vEW7utNLGRNfCoocYVUmJDLJ6+g23HRO0T13hb3f28D9H+zp24iWTHk
	Tql5ZLWwbEy+2rMpxv4tIQx3xf0AOIFIp8/cs4A22XYBuePjYvPVXU1ULJnSpOZ7
	AgUnv9RnNcc0j0arpshTYwO63JSh5R8pTNNlE5aJL3VxlKbYed1jhAuiuVxW6IHT
	62UiKkrwTT8dNEj+D0kBEHLeMtLH5FsbGglYajc/IcsrMO+m6XMkhIgVAyn/73sp
	1IF6GxMXzWjtWEifHlStpLKgXJX1akLb8RvB6TX6JWvVxzFPcKWFyrxPs3tdYP0G
	OkqikA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d36f0cm81-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 13:14:08 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8299499d587so978837b3a.0
        for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 06:14:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774358047; x=1774962847; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p49DQ9JYh9TPZn7lluAR8uoK85UpgfGic+fiunj6Xfw=;
        b=RsaW0L219XzTUFKaRd/NP1q/12Va4A3uyi45VKX97fRUypVMLpmYsYs2u3ktuczBCU
         /StwyyCoojvXeSeeaOKLZEwnAvesmBz/fhpuf/YytJIEkQ3HUzkV66eUrcrBQK748nHP
         0Jj4JImjebbZ6mDE/llj2i8Z7MtDMaccvXDl0koXaT6D8fI4JiFErJTtY+DiETsPyuwX
         Wa8ym3NAWiMlMNGYFQ0qpQc2Rd0Y20B8spMD/kt5yRKp9FU3g2ZdN45WqkTElOMTe9BX
         ezVbwpRm8N7drgrlyTwMHQv9dkIzMppZtPHtApBqlzqN0n2Mi0tnhBVdyqtYeckLWZgc
         25Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774358047; x=1774962847;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=p49DQ9JYh9TPZn7lluAR8uoK85UpgfGic+fiunj6Xfw=;
        b=dtG47WbJuBrpVDIrLXTGPj1N0k85DDKAWuGC0l8EE/hpBTDZxeKV0fH1N7+nhJA42D
         7MaALcGBOBZRNe8KorfeMaMqictUd6pHuv6EFY7WjJvtu2lsdLNJjPyUWZlPaaor/qFY
         x3rTXmdAacSNTY1x9L6Zlm6Q40aLZYdkFzK6VrTeaSzWpu+rpYTCbw3KLEB38Wc8I9GD
         xyjb7plhoSe4ns/++zaaHIfBhI0LO1aWc07RBWxecIzdBQdXF92u6v2EoKO8AjS3XBfV
         SnPrZrGeUkuy4DxtwsIpir25QVISmRq6Pwm2B7lC/LeIPf6dJEJF3XuY3mHngDWRiWk4
         2uOw==
X-Forwarded-Encrypted: i=1; AJvYcCVTOlPCX3x0IlJlD8e9djuGy1LEGmO12hwj4xWiJjZbiBWwYUlVG8rCCQzKUozfpuuCgzAp72yang+h@vger.kernel.org
X-Gm-Message-State: AOJu0YzyWipAS7u/2xwA/4dk6QCEch6UKJYuBLLZR2XJZbIXEwMNNDPh
	mW+yM9o1sIfmRDE6oT0hrC4vIAWzuUQil0BwJpIXPVbMRLC/wZPTH2FKBatU+STlWkoMT551Jqn
	28YlVccM4W701qV9JD1eV49LJVnYBovG9OIXf0vqvoflBDdb6IP2sxplq6ZSP8Wu8
X-Gm-Gg: ATEYQzw5zsQ7yWz+aejxRCepQun2x6oCFaUWECGWvT6q8I0O7LYfT0ZEIBNOKvwObXz
	AvWXEShcI88suT1gvBVpVtkgFYxzeCddngsGVDYq9iT6+6IuozQR+w1RgE3fABIaRkqToF/dhWd
	RAkHSSnH9aU0N1dPMxm9LV/JX1AXyC5PTSNHav5eFsrq2vwp0gQhcPZL3GrbkMuyoD60Gr07SpB
	1q1jUcBCjLRcxbXwS7uDBCZ1kQjmowWXQ0m67RGxdVwGipoWe+i79kK/LFB8MU9Jk5qDXTwpD9r
	/tYwvLuXzY2+m5awJUvNbY7UzZm0YJx8og65pd9CPNU5W58luDUdJoB/znR7qGhlzwxHATGEJF9
	PzFc27a7to3POWfpvSTF8RDblgzENnrU6PpO/jMBgDFUR2BAEX81mmOUkag==
X-Received: by 2002:a05:6a00:3021:b0:827:32d7:6690 with SMTP id d2e1a72fcca58-82a8c247b32mr12915549b3a.13.1774358046946;
        Tue, 24 Mar 2026 06:14:06 -0700 (PDT)
X-Received: by 2002:a05:6a00:3021:b0:827:32d7:6690 with SMTP id d2e1a72fcca58-82a8c247b32mr12915516b3a.13.1774358046441;
        Tue, 24 Mar 2026 06:14:06 -0700 (PDT)
Received: from hu-vdadhani-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82b03be3396sm13517528b3a.27.2026.03.24.06.14.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 06:14:05 -0700 (PDT)
From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Date: Tue, 24 Mar 2026 18:43:22 +0530
Subject: [PATCH v1 5/6] arm64: dts: qcom: kodiak: Add QSPI memory
 interconnect path
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260324-spi-nor-v1-5-3efe59c1c119@oss.qualcomm.com>
References: <20260324-spi-nor-v1-0-3efe59c1c119@oss.qualcomm.com>
In-Reply-To: <20260324-spi-nor-v1-0-3efe59c1c119@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774358020; l=1216;
 i=viken.dadhaniya@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=A0IQkyvp9VZJjwmAmBglvF2YtSzqW/Om3BUQHbt+9PA=;
 b=4XndccXI+zSN2z8Oy7LANASK9ox/cowRjbMa+de4SmBbO7qZSU/bgr3Pa93WWU73f2MQaIZO5
 hfD2tVEEqyqAtTeysI7pogjR5ugjlWMG29C5n89CvHGIpjmgMlSkO08
X-Developer-Key: i=viken.dadhaniya@oss.qualcomm.com; a=ed25519;
 pk=C39f+LOIGhh/02LQpT46TsUSXRvBn9qXC8Xb26KJ44Y=
X-Authority-Analysis: v=2.4 cv=b+q/I9Gx c=1 sm=1 tr=0 ts=69c28e20 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=L5xbH5DL_T0GcX1SYtwA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: rFGO_pCwja1LGRiTcxoX15NZk9uRz37p
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDEwNCBTYWx0ZWRfX78zG2ZL6rnGa
 LB9erCakVPh7qhmCeYHvZzALyBa5WD2f4alO9NAgGfSwaVp2EKf9whR4bLXMllo434zwE9s/YL+
 hZjkHtyOdjF+m4qxslt41eYPyh8Gk/qyzIRSWlMyQPwr3bN0B2CDb95jcnVZ+Yx47kniDinvQr9
 PZmLw0erd6nnjYRnSK/OALuKr+qtucfrDdXDV1xtyaYV8Hkexillr7WPns++iV6utmVKzK5rK2A
 aK5yEGRQhj1f3A8L843xM6um3HuOafNBh7JJjYYwdlcaLI7fyvedjjVVaPx9L7UZoNw+hV46htX
 zH/243WXye0ffsVWwrlqWv3HfX3JGPO5Nl9/yVemEyasCXAkmHMSj3kMaHzIbYfYJRMF7KQFnvZ
 tbHKl+JXTi2bIzF/qzP47sATs5/wiWHPAft4zxg2vlJ7RnGCkisyjoq/gm0f8shzgprWOXl24Lw
 79MdQ67WfbxP4RCB9Pg==
X-Proofpoint-GUID: rFGO_pCwja1LGRiTcxoX15NZk9uRz37p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_03,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 adultscore=0
 malwarescore=0 bulkscore=0 suspectscore=0 phishscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603240104

Add the missing QSPI-to-memory interconnect path alongside the existing
configuration path. Without it, the interconnect framework cannot vote for
the bandwidth required by QSPI DMA data transfers.

Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kodiak.dtsi | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
index 6079e67ea829..9a44bb3811a7 100644
--- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
+++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
@@ -4312,9 +4312,10 @@ qspi: spi@88dc000 {
 			clocks = <&gcc GCC_QSPI_CNOC_PERIPH_AHB_CLK>,
 				 <&gcc GCC_QSPI_CORE_CLK>;
 			clock-names = "iface", "core";
-			interconnects = <&gem_noc MASTER_APPSS_PROC 0
-					&cnoc2 SLAVE_QSPI_0 0>;
-			interconnect-names = "qspi-config";
+			interconnects = <&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QSPI_0 0>,
+					<&aggre1_noc MASTER_QSPI_0 0 &mc_virt SLAVE_EBI1 0>;
+			interconnect-names = "qspi-config",
+					     "qspi-memory";
 			power-domains = <&rpmhpd SC7280_CX>;
 			operating-points-v2 = <&qspi_opp_table>;
 			status = "disabled";

-- 
2.34.1

