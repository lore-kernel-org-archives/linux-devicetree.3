Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D71A2406268
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 14:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778768953; cv=none; b=r2+wpWpLYEvTxekQ7wSwTW0OPbzoc1cCFtDlkZSEu+sb6SmKabXi/kBHejnK1el3RMX9ZyQq8Y2ykevCmeCbDayDi0qm0cyKsiPidyky/97Qt50VhKAGf2tU0N55AVylOcN7Fl2PsjveOeoRr7Xf3SlvSiMiU6+TRwDEKOxUVQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778768953; c=relaxed/simple;
	bh=fv/5hA6B5h6bSFJ3jKPW5Yj8V7+yiEtiEsQ3Jf2Ak5E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qjSIKtTdODGyuZtYyH+fCBkaOZ6dowskuNg3kVdcIaW1bL0ucDQo2Cb7wWPXm+oW2l1Zruuz03AB6zf0JrXyf+EDaW3HsIVi1DvpHLUtMAU9wlyW2Z0NvNceCO6UEyk9DV4DUFIhjdqj6FvWpZmvdb+G2JaW07n7KWo06xwpxf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i/7XF9ck; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iEdYyYl4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i/7XF9ck";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iEdYyYl4"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64EBeSQi3891239
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 14:29:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	o6KLS8vHiombqosDZEYpdFeq0nG5CyaHud+DvpMo+CE=; b=i/7XF9ckTQVND/dC
	TYkq0l/GzJfcDmNbkYBgu/dmSahdZq+voxXEMKcAkQ9jb3/EwuGoHCDIB9g3hBoL
	q9hjln/GwV1tjG2/W5JoAHU0+pq9IWdB/WR93kiDXc/zJZWyhGwH2aTxEy0ZaFvS
	rPqIeaNy31v4dslLkEQWftw2+af/NBnBK70hNs7ebp06nZLJUVKF7AXg6Jdk/NN8
	5cms4Qk5F2qvkU1BJ4CexyQUXHzxVce0pkvKcF3umunCg1TvR5t2qS1jiqGF8xps
	BX2OmFHWyceJkJzvPJRDywNzES0NDADXC/Wo0ktlcdA7dcPe4HeFe67OTqd7xfSi
	BDLE6A==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4v4tvd4j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 14:29:11 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b7aba0af02so84354485ad.2
        for <devicetree@vger.kernel.org>; Thu, 14 May 2026 07:29:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778768951; x=1779373751; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o6KLS8vHiombqosDZEYpdFeq0nG5CyaHud+DvpMo+CE=;
        b=iEdYyYl4lphwBFbtQ1IbURYtbPQF+A18cAGAxmobfi4MON7iuVyDf/sJS5bWGjaE8A
         +JV45Bzl9MX0uKlu3XIPiVioGg5jYH8j++5pP8VZNjYG548kRbLBmITO+GKJfFndO3k/
         NZnkrea54xyHWMspgO8fsVcneA+EI8wAoJAEkVsATu8oHH5mFMcMkRwuOeFHfEhjH106
         LVp/GxmsgRPSaGciWHSJY4SLkfN/odIDqm1MOv7D5HRir/F1OaJIXrKo06usyV+p8qkB
         BrahTJxg2ubHs7LVNSY9K+qpazL66qnRqkii6KpQ1BU2AlmZT97nBF3AGFsuut81hLwi
         VRLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778768951; x=1779373751;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=o6KLS8vHiombqosDZEYpdFeq0nG5CyaHud+DvpMo+CE=;
        b=nmqTX4p2YcE2U74sbN8vWyK+hkiSUFf9zsLwbaKDmOXtogJXcWJN+uztiqTj3+XkgP
         t3UiOkrW0NuevqBaUTMLbtcL32lA9t5/RBdKFqPmKz4AygYedDd1qTOj93yzwx/Xd8FO
         hIu60iJt+aT4KOHbDeOyMDGdKbkXUcmquigQjgEoFAYJR+1EWSYNvdXEjO4k8px7QpKB
         j7G9tOO52Knb0OQoqp7tJxPNSPyEiDGz+yGfjODsrozDgaTuvJv7yEvGnOXLU1GMqFIx
         tz1wgXwZaMYu2N30U4EK8LSlRpLh/wbcatccqoILBLRKkkwXg15S6W4ukxci86oZX+AN
         Z8sw==
X-Forwarded-Encrypted: i=1; AFNElJ8RMpu/99HmL2KGv345QVRWUSoK0ZCHWEkmPbraBgophVd6nidMjQ6yvdAYhwb/waSg8A8cUTTOPFWN@vger.kernel.org
X-Gm-Message-State: AOJu0YyOqg5qecsyYYi87IY81koD1QffnC0gEGH76cz2Oh4R/TNFMZK1
	yjR+Tgy4EjKdvY8WRCdrD80pjEcJck8lRgV+eGq6Z+n0BmyuOW84AS/UxK8treoSjKNP/JyXxhJ
	rC5uYzLxdTP1rN+n16qQKb0ysL1Vp+aYY83kGfS9YKPD8Nycqq7t1/ogRZccq9vBX
X-Gm-Gg: Acq92OF4bXL4DQNObf2PBtfueJQrk/IkztUMj92gDJBUHJtFP4yV8di6FeOWEjS57+h
	3qkGgh+KCi3sXBjcS1pSTKAUbzmBwffwZQH4uWBxBGAEhwzLda2A3NKBN6JonouOPBJ6MZRU89H
	I6rrjr+uasGBPRFER7H+3sqrvMaXqFPsdSN7/pUBZeCGviVh9Wa4cpqoopQemQ2eO2FmBFU5J9s
	qh9sN5Dq229ckH+MClWPTL9dGlxPmfHoIXERGt1WRFaMELh08xjllpe6FikGNxGCLBCFuutQ46+
	ucTOH31pCdxylJglKsJGuazDWfqHu9KGOn8ToYyM3yt3Om4ZxTop6A3VEN82EpzmCenHkfn6Izz
	KHSesRrVk5s+EcHR0Y/E4FvB/hGvFt2nzwpN7doMfE6KmGW5MpLUQ2cQ2pA==
X-Received: by 2002:a17:903:120a:b0:2bc:78ec:54c0 with SMTP id d9443c01a7336-2bd2ff2a51emr89626785ad.31.1778768950480;
        Thu, 14 May 2026 07:29:10 -0700 (PDT)
X-Received: by 2002:a17:903:120a:b0:2bc:78ec:54c0 with SMTP id d9443c01a7336-2bd2ff2a51emr89626035ad.31.1778768949767;
        Thu, 14 May 2026 07:29:09 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5c05ffbesm28566485ad.27.2026.05.14.07.28.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 07:29:09 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Thu, 14 May 2026 19:55:54 +0530
Subject: [PATCH v22 13/13] arm64: dts: qcom: Add psci reboot-modes for
 talos boards
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260514-arm-psci-system_reset2-vendor-reboots-v22-13-28a5bde07483@oss.qualcomm.com>
References: <20260514-arm-psci-system_reset2-vendor-reboots-v22-0-28a5bde07483@oss.qualcomm.com>
In-Reply-To: <20260514-arm-psci-system_reset2-vendor-reboots-v22-0-28a5bde07483@oss.qualcomm.com>
To: Sebastian Reichel <sre@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Ulf Hansson <ulfh@kernel.org>, Lee Jones <lee@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Andy Yan <andy.yan@rock-chips.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        John Stultz <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Sudeep Holla <sudeep.holla@kernel.org>, Ulf Hansson <ulfh@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Song Xue <quic_songxue@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778768806; l=1676;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=fv/5hA6B5h6bSFJ3jKPW5Yj8V7+yiEtiEsQ3Jf2Ak5E=;
 b=DTfcdvmuHlaXJOFI959VmgqyKdy4KwC74h60uKvEJMgANVtVK6agBUfCB1qK6VdTsL7mvl14J
 T3zgl6il8yIDiXblCoQ5QJIMe1V8sJGmhryAweJi3aC5fMddvtrdDHs
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Authority-Analysis: v=2.4 cv=XIIAjwhE c=1 sm=1 tr=0 ts=6a05dc37 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=NtfjKPfcWimlndMDSJoA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDE0NiBTYWx0ZWRfX2vRnDqAzwWqq
 QYe7z69NjLcGNtLDoHCgNbV55BiAzQHCzRIRpW6UlcGKGhYjmlOHEfizAVpAFa0HTRDNeLLsFSE
 nCR5xNW5m10RWsBjoO5c1bTv6Qi1l3nxxptr6NVAHt7/6dT99qzNz29JWjs5fPc093Sx3hSmKio
 /5Sw61a/6E4WYr/CmrSxMzyOMHEDPgP8XAL2aCjstB/EPzNMdO8pUnASejfqm4ed6kFeu8GK4DA
 JGvbye3FkYAYj1088cx7mLVAyUx60vyoVTPnXHSa6ZiiSDTXCl1w4U5lo0+1MBqbFjFOTatEEcM
 +dc/WBdGRM5cxq1ADH52vpTl8/ui29mt5+aOHwgc0f165tBZrusIR+S3Dd1etb1r4uhhiXE+t/Q
 lK3ho79w1/jCcrDpuQabDYdle6VqSiiElJELGbYwRG5aRWEs3xLIub03MDWKyJo5z2xWH4NeUiV
 HJCMvH2VRo98UhOHsBQ==
X-Proofpoint-ORIG-GUID: sVaswx_5GSdwhVmUu0Gabcq27aRzUr5A
X-Proofpoint-GUID: sVaswx_5GSdwhVmUu0Gabcq27aRzUr5A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_03,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 bulkscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605140146

Add PSCI SYSTEM_RESET2 reboot-modes for qcs615-ride, for use by the
psci-reboot-mode driver.

The following modes are defined:
- bootloader: reboot into fastboot mode for fastboot flashing.
- edl: reboot into emergency download mode for image loading via the
  Firehose protocol.

Support for these modes is firmware dependent.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Song Xue <quic_songxue@quicinc.com>
Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcs615-ride.dts | 7 +++++++
 arch/arm64/boot/dts/qcom/talos.dtsi      | 2 +-
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
index 831002789838033ff6c4135f2d558a0af0d3ec83..ad488570135591eb7a9e5dec5fb1924163a159e9 100644
--- a/arch/arm64/boot/dts/qcom/qcs615-ride.dts
+++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
@@ -498,6 +498,13 @@ &pon_resin {
 	status = "okay";
 };
 
+&psci {
+	reboot-mode {
+		mode-bootloader = <0x80010001 0x2>;
+		mode-edl = <0x80000000 0x1>;
+	};
+};
+
 &qupv3_id_0 {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
index ff5afbfce2a4744777829a1938754f02a5f6cb5c..83ba8d3bc40731f54d71b6892045bc1dd15d320d 100644
--- a/arch/arm64/boot/dts/qcom/talos.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos.dtsi
@@ -560,7 +560,7 @@ pmu-a76 {
 		interrupts = <GIC_PPI 5 IRQ_TYPE_LEVEL_HIGH &ppi_cluster1>;
 	};
 
-	psci {
+	psci: psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
 

-- 
2.34.1

