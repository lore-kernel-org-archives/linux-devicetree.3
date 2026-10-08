Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A17FA47ECDD
	for <devicetree@vger.kernel.org>; Thu,  8 Oct 2026 09:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791450894; cv=none; b=Z7UlAXruKRwZCvLAmdZndZOcdkclGcX5pVvM/zomCHyusza5SFzhQnn7wt744x4mG+o9b33YvnKvxyVz+cap669iy+twsBpB85vGkBzTiYqHrBYbHIgaR9Pw/WPN+Zg/cUHEcG9SJ3G77LsYOZDiXIm2OS5s+pWlIWIc0w/54SU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791450894; c=relaxed/simple;
	bh=GhFRqakdXxPtxTbtrzN5urR2xQCR8Jnvt7LGgpDDpaA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PMsp0vHop/i6WM0ct2Nkm937zB6mRIg/Owdp+Q9HiVx8mbmW/xnf9As1sy2R7Cx1Ed81PZ6JExZqGO70UUzt5ZsuHvHpnLR+Q26NVkRFrAigrSREjtme/6qEoSLC0qRJ7Yd7M8Yjoqp/R9ExdFrjYCehE/lzyC+kDf9rUVPSKw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ou93vlmP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EQOj4mne; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ou93vlmP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EQOj4mne"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6987KBOb2189934
	for <devicetree@vger.kernel.org>; Thu, 8 Oct 2026 09:14:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3qcHgeO1xfv6UWffh/524xIdjtA4+f0IFUNruW8igoc=; b=Ou93vlmPSAyQ0wpi
	kuwT9fWWnsTwkxEzmwT/Ggopey4PYwVGeweLFP8v5PuZUbX8PCeoVk/pTnN/g4v2
	pzx2Vl+nKirvxLXX0G5wswzr18K4AcM+mPOalJw/4KdvhSRK0cpCogW/NCF7sdWz
	OKPfZfO3oV9MidGKxzgxGrSVxpxBUmShP1MEal/IkIOIaSGLppfpOwhqiTok9+8t
	WFqW7oHL78scZaJZ/oHur3WlHxsrESLp7hUvEXY42VDUr9uqTr0U/i/QoA/lVE8Q
	8x4M1Trh9XYD1BBiQveNO7PvHAIDZKbJVnNxZW6RVlyC9NsSlZsD6CGMFTshyX9z
	fl9ZHA==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe3a2ua-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 08 Oct 2026 09:14:49 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-147be78cd56so18241639c88.1
        for <devicetree@vger.kernel.org>; Thu, 08 Oct 2026 02:14:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791450889; x=1792055689; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3qcHgeO1xfv6UWffh/524xIdjtA4+f0IFUNruW8igoc=;
        b=EQOj4mneZgnIjatJ83rMaYF2nenbQ5g7keIcwLlONFiPZlMHngdWFwRf2jSmeQu2vp
         wy7E54Mg/e9JdAZyNQqsOxPcwYaShpgIdf7xb07cSS8aBCg4pFA78vz28R4oIPONiXzx
         uPPi+9gzoy7NzCawh4drawPjua0Sl1pLRPCUPhVfC56tdBYnvqELmIzKnW8rtdIFce4m
         cr4cALmX6Xg3otC5eLMs/z+5nbVmUuZuVoq303Pce01LyeLp52n6hYoXg7hscUoKBt0S
         HzMrR4RpCf1NiztvCOKBhHkBFv2wv4Y+t5H3JeyG6+Q3Rh+Sm98iFA6RQt6PImVWGROT
         s25w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791450889; x=1792055689;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3qcHgeO1xfv6UWffh/524xIdjtA4+f0IFUNruW8igoc=;
        b=yQ7jTBBAZ/m5QEwpQaJr/3nB4pY9E757iUyjKDF1NpveRdpUmQ4aSdvR7pPlr3VP9D
         FD78RFi34Y40G17CpsTNgJ5It99HAnzMdSSqOBuGSfpqkrxgKlylq6yJeYCjjymzCRdx
         mtsdBsiCjURah0XLMUDokU5MQzPNnOxi0DUP+EbEofrOZjHYat6FqBmSz4Zq/q12p6HF
         s9xU7r3KOgtgjvtiC9mxSYwoX7ajNbaDCPUlF4RMp5Pr7OC/XSiaKZKSpk3nKpqLSShz
         82iptXoMr7SAXY+q8fGPpvKa5LvrnETC67HWFMC5eNQ6AMnrrfu2yUTWZBbWhUrMAp8T
         YXcQ==
X-Forwarded-Encrypted: i=1; AKwUvBxFATN03H8Ag/oirqLsdLfiqDCtlSRROqJASLYqEAcoZpE1pb9K/wGUUgkZCG9hAOTJ+xvbGiyPdcNw@vger.kernel.org
X-Gm-Message-State: AFuF++mK4GtxR9IJy+bwXtA1POkwxp/VSUh/ygo4ipcalWYuvikhU5M5
	Oq2HaEbsVklTu5m5sgKAAUVyyzVQrFdeQi6BcHZDwicbtnP0tuYXAo8nLmWhCkcNUENFhCH6ciV
	xCwwT0dnIBcdHjVEU8odU0JASpkLwnKsg255J0gwxBqDdaaHVnDc8CPEyYtAmwo/f
X-Gm-Gg: AYBFou3+jOpYd/a7wB9YrgNMIXo7kBiqjSrnJRANPINnjboCDaosl38Muk7judY/GRN
	2hXRgEXdT//7AoUvyqaGWH9qRIG03LcY02fKZBr2CpOaPIUOwLLGx+8zzBbwtpOVcvjLZfo/bwA
	NDWjndmkrCYHCgJC/OXrLI5PifAEANSu9Uil0Bwm0/eyFkgjJYRcJo3Em5C0VlcSXFGzd20388/
	+/JjcyKDEGP1tOuLyFhN/oNYZg4D2AqGptAJezz1wrs3J8pyoau0hk3/J6LNKoRsu42cOFpWUJ2
	sVGznNKtxxhtjgHZbvnrH2FeDkdIx95LVDbn4gT/e1bgPEJt8xpI3WG8wfxSkOBISpI1s7iQaOx
	AmHKMIbWDfB+0006PZM2pfETE+kQOv51QUL2IK591eQN4j8yz0EV1sQJG5z8Ic8R2zmldmr/C1q
	zcKbZY9xlcx6jfMwX3EHITDVUg3wfR
X-Received: by 2002:a05:701b:42d0:10b0:14a:51c8:e9fd with SMTP id a92af1059eb24-1620693f02fmr5728548c88.26.1791450889084;
        Thu, 08 Oct 2026 02:14:49 -0700 (PDT)
X-Received: by 2002:a05:701b:42d0:10b0:14a:51c8:e9fd with SMTP id a92af1059eb24-1620693f02fmr5728522c88.26.1791450888178;
        Thu, 08 Oct 2026 02:14:48 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1615f1ac8c5sm24456045c88.2.2026.10.08.02.14.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 02:14:47 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Thu, 08 Oct 2026 14:44:24 +0530
Subject: [PATCH v6 04/11] arm64: dts: qcom: ipq5210: Add support for WPS
 button
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-08-dts-v6-4-f9c4ec8664d8@oss.qualcomm.com>
References: <20261008-08-dts-v6-0-f9c4ec8664d8@oss.qualcomm.com>
In-Reply-To: <20261008-08-dts-v6-0-f9c4ec8664d8@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=J4s/fwnS c=1 sm=1 tr=0 ts=6ac75f09 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=nVy4eOtUigsjo0hPaBgA:9 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAzNiBTYWx0ZWRfX2NLimQz/ipBd
 VyZJJiHX1QWcHk/q4B4vHAlPhwuB6imIqVyh26NrOZ9w/bHbPQumYpTZ0G7gZ/34kSu27EfvBPW
 eNG/fLB55I6T/m95JczWYD1aBqbDqr8=
X-Proofpoint-GUID: 0eOC52QYbLRk2aN8qbXdCwb2Nii8a8rS
X-Proofpoint-ORIG-GUID: 0eOC52QYbLRk2aN8qbXdCwb2Nii8a8rS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAzNiBTYWx0ZWRfX8c2NLQXMsuD+
 2CCqdiskaLfmgfoEq7sC+JMf6rNe01sqfgi0M/Lqof3vuMLsvVePiiERh83dnyS4LLgk9D9Sj6W
 bVm7gYATfRKbX6jUXm5AHjLh0F6Y3wPU6dTojH/osWwrzXWrhAwww2tkYdQWJVW3xT+9AeGCkyp
 TOz94Bb7YflwpsW4BTb87p7EjExphZ3P733kFQGDY6NOS4hs1L9PZeJFsEfQNV6+f/2DZnoOajX
 4yyjlTsKYIklHFODa4J5SX0++HSmyvQGSeVrmyggRdGkE3qmCNkjyRYiovQ9bPFNTnKoEw94i1S
 kJJ5ftDkUv99q8zhsd/PGxUIdAxH1O/6g+ThUjt+F2lqRyca3J2+dz5oc+3FUMti0L97V3VcIx8
 QV05yUYYWH+TVR3YEzji0VCTUDSy6RQuW70LBRWt/Y8+yCYVhUai/RTwI93fuF0Y62jJpEustgS
 RoSzmC8w+A9X0hYFkhQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080036

Add GPIO related nodes to enable WPS (Wi-Fi Protected Setup) in IPQ5210
based RDPs.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi b/arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi
index 30c8560822b5..9f493561037c 100644
--- a/arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi
@@ -6,6 +6,7 @@
 /dts-v1/;
 
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
 #include "ipq5210.dtsi"
 
 / {
@@ -17,6 +18,19 @@ chosen {
 		stdout-path = "serial0";
 	};
 
+	gpio-keys {
+		compatible = "gpio-keys";
+		pinctrl-0 = <&gpio_keys_default>;
+		pinctrl-names = "default";
+
+		button-wps {
+			label = "wps";
+			linux,code = <KEY_WPS_BUTTON>;
+			gpios = <&tlmm 25 GPIO_ACTIVE_LOW>;
+			debounce-interval = <60>;
+		};
+	};
+
 	vreg_misc_3p3: regulator-usb-3p3 {
 		compatible = "regulator-fixed";
 		regulator-min-microvolt = <3300000>;
@@ -123,6 +137,13 @@ &ssphy_0 {
 };
 
 &tlmm {
+	gpio_keys_default: gpio-keys-default-state {
+		pins = "gpio25";
+		function = "gpio";
+		drive-strength = <6>;
+		bias-pull-up;
+	};
+
 	pcie1_default_state: pcie1-default-state {
 		pins = "gpio29";
 		function = "gpio";

-- 
2.34.1

