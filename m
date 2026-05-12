Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66CE939AD30
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 13:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778591391; cv=none; b=d4NYasEJBIKsQs+sZrr4LbOz7rnqgomLLhVT0aGrq5Gra5SkAbUGvNz/AF9H7Q3timINpnSErL+z0PrZF2bF4vZtkR2dC1wany+7Mm1i97ZTNfEjCiT998pX7gx+b+pfe/9YYqk4idjs/YBXL3SuOQ/jXw3UqujRRcwx4LovN3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778591391; c=relaxed/simple;
	bh=rhMmplJZHjgETELIHxU/vsgM7ogB40pqy4Io3V4J9OQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BmrFjnm8oxciWVnnqsd6YsUzvssxP437ZzHTIcYrH89/fWZFb7tWjPYDbeEHDVzTDPrx3PrwVKkj6p1WeC9amlfoRzIPKExA9VWJGxf/o/7YUVn4vERIyruleIDMxqF2xT4pX9JXbLP29sUhjbWhXuSUH6Dd3RdSZ6Kp8yyokkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JF2HxnMR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WvofVfg0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JF2HxnMR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WvofVfg0"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64CAUIZS3444396
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 13:09:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vg2olHTvJC2jVplGWI7geGXgqDGD1iMXEsGdv1h+2cY=; b=JF2HxnMR58UIChx7
	boV/d+PH7KnAkp/oOY8T5K5gVTsFtqYIwz2qwUe35kMJ1A3nOdg7e9hFMfRp7E0W
	+ycKLKfsRnGbO/8OQwDuni9hVjASi+rUhU+N2h3Rhgzlh0GzMBWDhdV3sio/GPLq
	+XH7eOqtHwIYn6t6twCJBmpGGMPxZhbvtZT/FD4lhcdD6iZh8d9sdQ7JyXO09hN1
	f/IgHNIEVIykV+FX4m89B2xMyvHcsZb8dkoyVgQNde+3F1nKnUGDvnkHkC25WoGw
	lfW6II4kMZ9HHNBvISFPAFN4whFxsiY9oi2NGuXSdWDJKe1O2lb7INsGP6vcCoFx
	H6D7hw==
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com [209.85.161.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3nv0kc97-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 13:09:48 +0000 (GMT)
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-696906ddd6eso197529eaf.2
        for <devicetree@vger.kernel.org>; Tue, 12 May 2026 06:09:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778591388; x=1779196188; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vg2olHTvJC2jVplGWI7geGXgqDGD1iMXEsGdv1h+2cY=;
        b=WvofVfg05SbzQfnAfU0mMeEYX/r8IO4XyKtRVhXUuEKHa2/VqfMhNyFgRpnzCq/oXy
         WbB5tkj3vABq732W5ZS2Iv/vBBrXgmguXHU/j7XPNo+/krLkBSxeqZDRW2/tqBlFrnCy
         JVzdPw+5oZHIeq6hiT3lxpplVS1v0icHeCrAvJZ9H7EbGKfo0Y0rEyvt/Ol8ijAwtz8V
         lFodD9bbC5cbvanuODmOH8zvnK1hBx8hj4tWo5PMCWTHdqlniXpt12LcGeX0sQBd80jw
         uy2gMLYYgOAg4gUKXuP3Y5IgWrJxe15Dn5bJfNBZThKXudRaNI80WwfpWJqyhCHGeVT3
         ckCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778591388; x=1779196188;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vg2olHTvJC2jVplGWI7geGXgqDGD1iMXEsGdv1h+2cY=;
        b=Y/wqa/LJSOzVZ8CznQqIfr+wpOx1WT9Q6kwgbLlZ7A16bQfvfY2LKl7bqNPHyNTaUK
         5aoto+7P3btukLuZReW418+/eA7Kr3NxNh0ygWAXuO9k0bftPYK9akQ2/EB8dg+MVml8
         u4w5Bp23bSrKLTnBfb3mfSCMv+XMwBxqpP973ZOlsnxq0l/Ot2uB5Qlhdr/vVc59FNqx
         phEREVhmv/DxcbUh6O4L0YYCdVkQqDhErmHG9WLtDgU3he3dilzSZrFW8Kq3VzzNuD0l
         /2ClJTK/qPDSdmU60pc+zbROCrwLsU4NsK0Jk8ad3boLF0IG7Ih5VOCSI1bNKA0KbXss
         6D7w==
X-Forwarded-Encrypted: i=1; AFNElJ+PAQu3AX/Gnn+voqor8Uyl5pKjLK6qdrB+rypOn2j7A5+KPJq08tFADdc1vhSRzwVn9cKDFang8xpU@vger.kernel.org
X-Gm-Message-State: AOJu0YxQc0HHBf2mZlfnH0khRpeIGEhdPPE5GEltO8rs/4RaIVz61nYx
	LpoiIlo4RyloeJ2rCdD+tgUeB+L8rdDZzVnUN6KKqk72+dxJBmKKImlt1sSiGh1Hok0XD9YZk8/
	s9xpkQMk5HB+6cYAge6ePPLXRDBEP/v2LgiKHC8DyVXi+95AGUPNOdPu0b4E/7AQE
X-Gm-Gg: Acq92OEpaqNcICpHqiC/wpz7lMTDeDsUC28mRAPvBYQJBVXO6YT2lIJQvUeyQMUE0Vv
	sKFrYbI5VcspDTHFRCH1sCscuYEPkR0xUdp3KfB6mdm1IbltnsOazNiHZ7DSux60xPiKKp8UXat
	9+7ZCvyN4LnBPi26RAHtjjb0TpACPU/iU3dyRIRlywEqVXACVydknxFsGMmrawHpi5MwzDQPQdk
	o2AftXW5/FUYfUPM6dHRzSjRetODScVv96MvedTsxDhg23X77mbdhYyI3K1u7aPfRLBAY8obsNM
	v1wpkZ0ncuud3Nk1jCHQ1gf0qeqlpfg3liAKyRls/HZjNLXRlHKKndJMPutWQyX/YEbIG8QlwBh
	CnlgoeTQC1crcKqsrwNV56DrOKKUKW6rv/Y4zIwCqhw6y7oKpV3CIZ40mt6cQfPb0rx1Z19qNSD
	fry/8I9b7lK1DsdZawq1rE/kkDZ1SSqJeGoS8=
X-Received: by 2002:a05:6820:4c87:b0:69b:544f:c172 with SMTP id 006d021491bc7-69b69d88340mr1522221eaf.25.1778591387650;
        Tue, 12 May 2026 06:09:47 -0700 (PDT)
X-Received: by 2002:a05:6820:4c87:b0:69b:544f:c172 with SMTP id 006d021491bc7-69b69d88340mr1522190eaf.25.1778591387074;
        Tue, 12 May 2026 06:09:47 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-393f5f3a8e1sm33739451fa.15.2026.05.12.06.09.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 06:09:45 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 12 May 2026 16:09:31 +0300
Subject: [PATCH v5 3/6] arm64: dts: qcom: sc8280xp: Add Iris core
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260512-iris-sc8280xp-v5-3-8cc251e83b58@oss.qualcomm.com>
References: <20260512-iris-sc8280xp-v5-0-8cc251e83b58@oss.qualcomm.com>
In-Reply-To: <20260512-iris-sc8280xp-v5-0-8cc251e83b58@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bjorn Andersson <andersson@kernel.org>,
        David Heidelberg <david@ixit.cz>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Johan Hovold <johan+linaro@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=4755;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=gBq7lynhN9JvmvojL1BqehFO5JLgP9wZqWKF6N8gCwU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqAyaUOTKE74jqWbO2+WR/hxv7t8zwBF3hL4El7
 lD/ZztO8x6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCagMmlAAKCRCLPIo+Aiko
 1bL8B/9TyT6pcGVSpALZdJ8bTxNEdixTvjUbVo19IXgBcK2Uk6HiIDz0yQX9PwOFv12m7EIFaHl
 WQzi8gyBxBaUWtWA7aEx7cP7tpPytyThloNezdGvcRYgGnxcQTg4+R5WK6ohEAGq27hmF8KIWtJ
 u/5yC0YjLVnRw0BI+oGCIti+zM+Q1cjedHn7Gxib0sfL8WDWEEs5z7CZmQ9p/9w4EYpW3evcXwF
 x7dFAmHm9XgtOIHXBCdnpbmQ3Q83Fo/q0QK3wsNRGPK6+oWErqG4bWnnpxmJuW/WPTHXd/VqKII
 4ZBtX/tmQSgbB2rSWWiHcR1Mr+bN1n/vNgzc9oCs9j4Kimoa
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=V+xNF+ni c=1 sm=1 tr=0 ts=6a03269c cx=c_pps
 a=wURt19dY5n+H4uQbQt9s7g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=Z5etVbCIt5GNeBr577cA:9 a=QEXdDO2ut3YA:10
 a=-UhsvdU3ccFDOXFxFb4l:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 5zenIjH_8eGH0Et376eXzJ9c8plzTfDn
X-Proofpoint-ORIG-GUID: 5zenIjH_8eGH0Et376eXzJ9c8plzTfDn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDEzNiBTYWx0ZWRfX/o0extsh074c
 alDR3m25bnAfZ96JS6FTVFRzWDNb9fhWfAlogJDbNPx2aTLchpRnSWCfwm019IXb5GDkTNT2nvf
 s8YT0J6ox2w6DAXsRcsR9vc8klkRhKbgNC3oF2VLA5/tpEibHTrJAJASiiFxXYK5cFm2MCmmUt8
 FKAhRWvwKFaEWVyqjNdy41eytsfgSVRuFV/Rns6la3i8SwIOhWBayeAMBktGzJzfdQZTEcWMYH4
 kVBuYPWywIQruF2pe6Ed9xuxQnwn6xhu1n86OjxcIxTYnSsEvfzyQZVFSVn2S1k6L/f0Q1T7OdP
 /pEEGgg0GsiZqpGHP1hAILvLdDKyA1eFvrpkImm2arT67b+6R1ky02ZrinPbQLVoZwPW6IwrSx4
 uq0Iq5ESJviXEWQLJy3MKF0jpobuaViEqAMYRcwNqdZTwnkVrE/UzIdQK+nzwj2IVjGbZc0w4q3
 nWxwv0evzHwgWL3sT9A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 malwarescore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605120136

From: Konrad Dybcio <konradybcio@kernel.org>

Add the required nodes to enable Iris core on SC8280XP.

[ bod: added interconnect tags ]

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
[ johan: use sm8350 videocc defines ]
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
[ bod: dropped video encoder/decoder declarations ]
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
[ db: dropped llcc icc, switched to sc8280xp compat, corrected OPP table ]
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 99 ++++++++++++++++++++++++++++++++++
 1 file changed, 99 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
index b09bc6f3b518..4f540f2a0fc8 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
@@ -11,13 +11,16 @@
 #include <dt-bindings/clock/qcom,rpmh.h>
 #include <dt-bindings/clock/qcom,sc8280xp-camcc.h>
 #include <dt-bindings/clock/qcom,sc8280xp-lpasscc.h>
+#include <dt-bindings/clock/qcom,sm8350-videocc.h>
 #include <dt-bindings/dma/qcom-gpi.h>
+#include <dt-bindings/interconnect/qcom,icc.h>
 #include <dt-bindings/interconnect/qcom,osm-l3.h>
 #include <dt-bindings/interconnect/qcom,sc8280xp.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/mailbox/qcom-ipcc.h>
 #include <dt-bindings/phy/phy-qcom-qmp.h>
 #include <dt-bindings/power/qcom-rpmpd.h>
+#include <dt-bindings/reset/qcom,sm8350-videocc.h>
 #include <dt-bindings/soc/qcom,gpr.h>
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
 #include <dt-bindings/sound/qcom,q6afe.h>
@@ -692,6 +695,11 @@ reserved-region@85b00000 {
 			no-map;
 		};
 
+		pil_video_mem: pil_video_region@86700000 {
+			reg = <0 0x86700000 0 0x500000>;
+			no-map;
+		};
+
 		pil_adsp_mem: adsp-region@86c00000 {
 			reg = <0 0x86c00000 0 0x2000000>;
 			no-map;
@@ -4182,6 +4190,97 @@ usb_1_dwc3_ss: endpoint {
 			};
 		};
 
+		iris: video-codec@aa00000 {
+			compatible = "qcom,sc8280xp-iris", "qcom,sm8250-venus";
+			reg = <0x0 0x0aa00000 0x0 0x100000>;
+			interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
+
+			clocks = <&gcc GCC_VIDEO_AXI0_CLK>,
+				 <&videocc VIDEO_CC_MVS0C_CLK>,
+				 <&videocc VIDEO_CC_MVS0_CLK>;
+			clock-names = "iface",
+				      "core",
+				      "vcodec0_core";
+			power-domains = <&videocc MVS0C_GDSC>,
+					<&videocc MVS0_GDSC>,
+					<&rpmhpd SC8280XP_MX>,
+					<&rpmhpd SC8280XP_MMCX>;
+			power-domain-names = "venus",
+					     "vcodec0",
+					     "mx",
+					     "mmcx";
+
+			resets = <&gcc GCC_VIDEO_AXI0_CLK_ARES>,
+				 <&videocc VIDEO_CC_MVS0C_CLK_ARES>;
+			reset-names = "bus", "core";
+
+			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&mmss_noc MASTER_VIDEO_P0 QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+			interconnect-names = "cpu-cfg",
+					     "video-mem";
+
+			operating-points-v2 = <&iris_opp_table>;
+			iommus = <&apps_smmu 0x2a00 0x400>;
+			memory-region = <&pil_video_mem>;
+
+			status = "disabled";
+
+			iris_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-240000000 {
+					opp-hz = /bits/ 64 <240000000>;
+					required-opps = <&rpmhpd_opp_svs>,
+							<&rpmhpd_opp_low_svs>;
+				};
+
+				opp-338000000 {
+					opp-hz = /bits/ 64 <338000000>;
+					required-opps = <&rpmhpd_opp_svs>,
+							<&rpmhpd_opp_svs>;
+				};
+
+				opp-366000000 {
+					opp-hz = /bits/ 64 <366000000>;
+					required-opps = <&rpmhpd_opp_svs_l1>,
+							<&rpmhpd_opp_svs_l1>;
+				};
+
+				opp-444000000 {
+					opp-hz = /bits/ 64 <444000000>;
+					required-opps = <&rpmhpd_opp_svs_l1>,
+							<&rpmhpd_opp_nom>;
+				};
+
+				opp-533000000 {
+					opp-hz = /bits/ 64 <533000000>;
+					required-opps = <&rpmhpd_opp_nom>,
+							<&rpmhpd_opp_turbo>;
+				};
+
+				opp-560000000 {
+					opp-hz = /bits/ 64 <560000000>;
+					required-opps = <&rpmhpd_opp_nom>,
+							<&rpmhpd_opp_turbo_l1>;
+				};
+			};
+		};
+
+		videocc: clock-controller@abf0000 {
+			compatible = "qcom,sc8280xp-videocc";
+			reg = <0 0x0abf0000 0 0x10000>;
+			clocks = <&rpmhcc RPMH_CXO_CLK>,
+				 <&rpmhcc RPMH_CXO_CLK_A>,
+				 <&sleep_clk>;
+			power-domains = <&rpmhpd SC8280XP_MMCX>;
+			required-opps = <&rpmhpd_opp_low_svs>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
 		cci0: cci@ac4a000 {
 			compatible = "qcom,sc8280xp-cci", "qcom,msm8996-cci";
 			reg = <0 0x0ac4a000 0 0x1000>;

-- 
2.47.3

