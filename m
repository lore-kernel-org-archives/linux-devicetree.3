Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C4E43932C9
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 09:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785750409; cv=none; b=JDZTcYScsqKsbrMsT5TrCWcK4ipHuq72AIx9V0KrPCnB36SVTtyni/1Iw1JqPAzyL11su12fabKgXVIp+foz8j0YnvZXG33eQa2//aTZMJFyCsNRmLfUcQxLVVVGQzypmGDEMBq7+yoAjA7/IraCbC1lkmP/FptY6PRlAygPxq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785750409; c=relaxed/simple;
	bh=OJwAm/Vozmf+aVTmHqCY4oum1OVPcZBckomX6WcElq8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Z+1brmOt+NzCUccGCo85wVFsLg0IPWasyYOG5vChIxkGHVy41NFldyePPcrsjtS+32y+HAdw3eCi8EQT8riuqxGDTRz2yQ2AC337KjsEUJwWNaVLulEAs45+j0Pzjbj1G93lGFR3xoK8Ot1imB2/XcEndQGSkzjTpEEDlFOiYf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QrS8cyTe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LxinmNUe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QrS8cyTe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LxinmNUe"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6736Et7K005446
	for <devicetree@vger.kernel.org>; Mon, 3 Aug 2026 09:46:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	o/+3/8QxNTkVS2/4tc3nfViSHcapFtRLbeTLF1zxXN4=; b=QrS8cyTeGtmmLJpw
	VZ7FRl0hxHBX+kaoNrTzcTE6OBufJsUH5AVMNCJExi2+0kpen8ylUY+VcIoc+IYU
	hX/uh5ma9MggKifQCrcpyP185ySGaVIGtz0XxmvecLbD0Bh5/LMftrGyYGZuwQH7
	4g0uC+4PsN5AA7+jRVVnxkLxL0gENilXwGaaf/8UqVBTc2pAiYxzfmN5El4LS/Mb
	hsa4A73b/GE6bRunzA75dSlcr0iZSdheaykODVXs0+mrTQHuUaQiM6NSbyb5ut+5
	fDEd+YgXjAaINpxdoVef/ZbfOHO5Y+4PmZU3RLWF08D5ai+FBR0/G5CFaxWSTVbU
	QcW1zA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ftnj78w1u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 03 Aug 2026 09:46:46 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38f5ac7354dso5928666a91.1
        for <devicetree@vger.kernel.org>; Mon, 03 Aug 2026 02:46:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785750406; x=1786355206; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o/+3/8QxNTkVS2/4tc3nfViSHcapFtRLbeTLF1zxXN4=;
        b=LxinmNUeghnsjdABF2zRd0hUS17ZE+Xr588hHzNPgCnj3h5r8CU61WbFaH6f5CwGBP
         rygQDqFKmBnt6PjlE2SA65eGDdfH206GTtLzrIGhPcc2JVUIHkgBopbX0Zx1F7gCCNRJ
         G4KjhUzCU+AXOJsCmYCV4O+kHGNUdPGkF/urOciyST95x89+daoAIAtqV5AbI6mEYXny
         jgxlQtdDeOWL/8Mv37mHWZCoyRh4r1HDwD4XA5PQ1RW8WnPSLngMBgELcSFNyks/ffk4
         F+9k8OyKeTcThwukDgPNCjTjPx8cy6+KpDLh8a/yn1Yy+Qlx+v81SHlRxHKd8NPgPszR
         wnwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785750406; x=1786355206;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o/+3/8QxNTkVS2/4tc3nfViSHcapFtRLbeTLF1zxXN4=;
        b=EJcaRvCFSifZ7JnlQg94K2hncLa3HtlN2Di4pPzLm8y1vVENLrZ0YTTjEm67zckVWv
         1OktipeuqJMfvi3FHR3KxIsX2BqP+UUtEycayNmrRqqFmKGHRppemzVE1R3RXjEXWhlj
         2el56EOu2ziyktQujOMc1CCOiunTXaT0fZ7YURx8M+J6E5rzLoQidSA4UdC+Xp6d19u6
         9dcCVtTFfIUsg3LluirlQNryzMZPr8L5pzsP0JW8eVJjbtqNC0S8bUwKhHMkeIq4bRv0
         mUGHuhD/tQhY8qbAv4nm2H0T0t0FgdQgNzX2KKprauz5ZrIV/1Q1o5efJqy9SlMWHPfn
         UNXQ==
X-Forwarded-Encrypted: i=1; AHgh+RrKU6xhYS/aIcw6qrRbKvBKTvgbmjgC45TlVwWkESqHLrp6b0mwLs1xvX+d9gGcfJgWBnv/3ZSWxv1o@vger.kernel.org
X-Gm-Message-State: AOJu0YxbQuod5UMg5PGwi6k0BMSkeiIDz+Z4fN8j93C9gwzfayqe1TBX
	F7rL2Min+ikRZAnaHV3FDzp5U15Q+KjN6g+W/bPLgoTo5IrhFFSp/rnaqcRKWM4ARH3EP4vnpCt
	MONSthGhtz25ohz3SH3TARpnxWGJ761XjrpmOI23riH921NzDBZMXs0Ijs2GpCuoJ
X-Gm-Gg: AR+sD12qxJG3vUks0+rynS9pljTXBtJisJkRjUiSIDM6iw1d8LU/aIUHU/GsFn4YTiY
	zqFKhumD2ZJDqjf2MCN2MNjyixbrmytL3EcSSRIoh8c38IwuPBv9mpjUgsfOo0ME57bqi2SsxLr
	54RUTYfHrSMVW9sIqydLM8KSXqtRA8QBWCkcxYW2pLmUzHgEX/xwo1l74AiuYo3DS8NT5rEopUh
	bzR3cqELbWMeZ1WEDb3cKu/n5NMCAC+cqyxkmVaDTyr/vwEnGQm1bfmArs/QAvxMd1Wm3hwcnjx
	eO1dnj4zpG1jKscnbDWpRyjRDFnSa1b3bvnngitqll5mEXlIwIF5rm7JanojYMk7ZqnR0EDhmzw
	ecqjuFJf3NYsrhs83XJ2lSPmBGkvOvGXbBk1c
X-Received: by 2002:a17:90b:2750:b0:38e:2c8f:a01a with SMTP id 98e67ed59e1d1-38fbc42c3a1mr7728793a91.11.1785750405828;
        Mon, 03 Aug 2026 02:46:45 -0700 (PDT)
X-Received: by 2002:a17:90b:2750:b0:38e:2c8f:a01a with SMTP id 98e67ed59e1d1-38fbc42c3a1mr7728767a91.11.1785750405386;
        Mon, 03 Aug 2026 02:46:45 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38fb2be6c8csm3660671a91.13.2026.08.03.02.46.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 02:46:45 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Mon, 03 Aug 2026 15:13:43 +0530
Subject: [PATCH v24 12/12] arm64: dts: qcom: Add psci reboot-modes for
 talos boards
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260803-arm-psci-system_reset2-vendor-reboots-v24-12-889281373870@oss.qualcomm.com>
References: <20260803-arm-psci-system_reset2-vendor-reboots-v24-0-889281373870@oss.qualcomm.com>
In-Reply-To: <20260803-arm-psci-system_reset2-vendor-reboots-v24-0-889281373870@oss.qualcomm.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Andy Yan <andy.yan@rock-chips.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        John Stultz <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Lee Jones <lee@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Sudeep Holla <sudeep.holla@kernel.org>, Ulf Hansson <ulfh@kernel.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, mfd@lists.linux.dev,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Song Xue <quic_songxue@quicinc.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785750274; l=1558;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=OJwAm/Vozmf+aVTmHqCY4oum1OVPcZBckomX6WcElq8=;
 b=JT9H0YmF5yLeWr/AEcg8+MJ7UyCAiqsbYnspRpD92XUQxxYXUDNXtMj4+2agXuu437sW8T4nT
 RMamNuCOjdDAy6VL5p10AWng8umeH3A/HICOVzaWNLeNSbuCV0twLTi
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-ORIG-GUID: KuPZSED8udGpf01ypICzQRniha84-h_4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDA4NyBTYWx0ZWRfX2Ov/AHLCL0xK
 1ZXxAlkUfeDu7aOGw+IalUkll0Hw1SP0wFDn9Z6nANHH2m+KdugpU/7ekl+MKpm1r8QI+gcJGXS
 d1R9qqYsGABgHeEOQa0sbUaYe+y0pf4UQ/eGlryx15pdVwW60jGfPnt7t+1JmDdbFfybfO2Yfwh
 RWw8CIL3q0LuztP8m0Ob5nnnu6bOXyr7vFCpkltoCp5qz3gJwo2+yCMQeaDFdIT1mP4JXclkmjT
 1L065FTTpH6FUTkcLwi4PfaYM+hzp0pM5+5gPQHj0VB4QlieetBhMNcdC4L/OCKDMpmGvZDrqR1
 UCsy5I2r+GrkIjDwwa+9BkRnxnt76gcKoY/lTnEKyUYi2TPa1+uxNzYzKnhnQ3RZ7TOYrbpnQm7
 PN+G9v+msoQPgxH9BvwgeUVnIK6odJwCv2b06eayXsi0bGnSYVNpvrsApXXcpRNVWxEFlcdC8IV
 NAhN+ER2ajRTv3yIygA==
X-Proofpoint-GUID: KuPZSED8udGpf01ypICzQRniha84-h_4
X-Authority-Analysis: v=2.4 cv=PqSjqQM3 c=1 sm=1 tr=0 ts=6a706386 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=bjH5yOvFM8yfI_BY5k4A:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDA4NyBTYWx0ZWRfX/fX48O1HOci6
 Be+pyMIcpofTjV8LRFziZbcIy3yuTwSgrCFvVqi+f8aLAdEEaLlI4mSV+q21xp44KwLXw2xm8cd
 vdAcft8b6RkxPXbCodvb+CX3lM8Xxcg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_06,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 spamscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 impostorscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608030087

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
index 047b4efb04b9..48d3519f50ff 100644
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
 &qspi {
 	status = "okay";
 
diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
index 07ba5733ca92..113f10775991 100644
--- a/arch/arm64/boot/dts/qcom/talos.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos.dtsi
@@ -581,7 +581,7 @@ pmu-a76 {
 		interrupts = <GIC_PPI 5 IRQ_TYPE_LEVEL_HIGH &ppi_cluster1>;
 	};
 
-	psci {
+	psci: psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
 

-- 
2.34.1

