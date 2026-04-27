Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 631E03DCD99
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 17:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777311417; cv=none; b=MyaYwGwrz1YgKzfPWw/G14l01CXU/1vKsVwZURIHHuhKx7jppKhR+xjyJq8I5EP8sK3WXci+O6ABgsjWkYF4u/xgl6cmnJIkRUWzOPzUHUwnxYLisU3M/7iTdWFuF4hy5ZholAzKwQTVZazjh4aS74xfPR9SOGVO9rpyvzc82l8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777311417; c=relaxed/simple;
	bh=lzFmHffITL4MZ7Zhg3ubOyGGeoOeSnOg+B50ouxJsO0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lS9jKt+jT4RjU+TR5psdxKbD7/sfo8pF7ZZLcBdZjJd9sdPp7JKf2bAEk2MZgFLBpd6IZ1HdNtTa8znWVTv+lFsDg770BGC+EyISEhnXf+ghCT4FoenJG/Wc23cMEwcbQSPY2/UQbyxzVWyM4IpDUOqniD5zunaqmVE6NZL7N+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oNmIGO0/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UjxugvnD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oNmIGO0/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UjxugvnD"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63REJ3cH2914399
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 17:36:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	q/yZ4bIJyOI7G4zqRHN1bsvi00G0rNpCoyBy2l1oBTs=; b=oNmIGO0/RbQPH5mY
	JAzuBa9qDcZ5+3btq1ypb+yXum2qudj6qLr/7W3ovxv71MyXPsqvLIaQX6+/tglJ
	7Yv/ed3eh84VHBS8J51wBfNertGUzw893ZTwItDPNZwWNAuXITblVhFsD1rGsrHr
	2n2Satt2oMFq5AxEDc0HgSF1z+rVFvdfmB9owAJAojCgfofdRqfqYZvYFd4QrhbZ
	+r9fayRmSH+2CkqgKYmypRQGy+V8eFWciJDGhQdjwwD5vU+B+w3l5IjC5Wlv0D3r
	3LfakyVZATidcLQxflcjm9rYRmb7cdz+tJBWpGNB2RIOG5K5KY+HPHVcr56O6nhN
	ARzzEg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt26xjmqg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 17:36:55 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b2d0c1ead1so195306205ad.0
        for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 10:36:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777311414; x=1777916214; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q/yZ4bIJyOI7G4zqRHN1bsvi00G0rNpCoyBy2l1oBTs=;
        b=UjxugvnDCpdw2hjcD7FtmB6Cn+JwnRAvQof9tjS1MwPjjyccpT9Sg7+REZV8c+GsQm
         FhYtN3StaIp5/BlG4qe0KXygiaRrtgVz5VAGd9ZXwfclDrNVq2oyYyt8xJCbj/bY3qlJ
         ew+E5WmVyLdPlswIIWT6RjCWF1BLTEVvuOBCmR61XvvLxBmFzJYtCNTPEEYT3djaIbym
         +XCWIAuQoIt9JBf69FqOfoiB2NCgOHAeIUMES8eDAaRpHi2nxi9lfBQ0Q18ZJsLBMJ1f
         x/jxG8JVdfduBYq5BRCEURAuTBRlaCfb9ReFJVrY46ARgm0gDbLfVoAfBpLesdT2MxQl
         0feA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777311414; x=1777916214;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=q/yZ4bIJyOI7G4zqRHN1bsvi00G0rNpCoyBy2l1oBTs=;
        b=Nt/ra0RZFLdmz3oUHLRnNuTbYUowq+SRz3W6GVKU0VJsXi8n4HwNqIriqQS92Iwd16
         vz25QxVVNsYXexi/KlDSAvkrU1/cJojIikRNn/UQsMpPaH9p0wD/iH1Vjp9R4OfP8O66
         FCWuHUOVJgnqp54MH2L6mpLdknQrMFHjDuY7CCN942J6MX6QDHGoWzvg7cb+y4BvDJ+W
         QV8B+Jxcd0VDOgQN0LRZbmxzMFEKxWvbgsREf4r937u9lGiiqdU/r0D4pOcHxPKtE6y3
         oZ243TAVThTf2EE4rupBV5fRNU3CY8278XxndfMWPh8dXq0mVC/VTR3Ce5sfwW1WG/2M
         q5rw==
X-Forwarded-Encrypted: i=1; AFNElJ9TJk/kKT9cHze31DDM1KYKXz1kaVGXm11FOKdqbeGvW0p/vIfaI8rfGEGabTKQIfvje++v1SYWseHg@vger.kernel.org
X-Gm-Message-State: AOJu0YzxYggZAMWuzwgDTKyhZicjE1Fho8gFNgZ31IbrFH+vg3Bp5yyx
	eD8hSuWVYOnqW6xh0PmHFUHrbj4MEwiSoHtQBCN0xJs4iutN2IJOjfdOwx4DpDsIYI/YGjJ3+Go
	BWG4naLN/dYam5SPcQs1hPcvU/iVMJu8VQOQcKLF0YAZ/BOQxEh2jslj6oOd729kx
X-Gm-Gg: AeBDiesdyHCd7vfbthNNNas+hGuFvOp9tcS6TsR9+4Qe3g1sRMFmeaZgxjCMxwONUFp
	OdHoBOjphMY/jdf4o7QzP/tI+EXxigLkC2ubItwJZoQkRipUipweJRzbIC8BWdlQlr8c4IsHzBh
	nWeXKgndqtTkLKlVvLtvgRDQ0wd+iOUJL9hV03bEDdhak5HYmKnUb+xm9UnB6UhqWA/08Og+Lxp
	JpRkDd0oySZ2lnJ5pNsvuVCHyRIowwhJfCsYp+pvLbq54otbkiu9zL8/sWfpUvhr8o+/JXRLyy8
	dDVSzICkaAIJmVN9mlaQPhmiFGZAlgOjeOFGhjIjNzJTYWgBoim7n6sBrIXDV4E3YQrnS1B7ieC
	vNAY19Jlg3XkOT/V1VkvYFqFr4ho5Tgw3HwVTyTDP9FSmBAmV9xSdRMlZi5lBXAs3uhyf
X-Received: by 2002:a17:902:930b:b0:2b9:5d1b:73da with SMTP id d9443c01a7336-2b97a9498d1mr1240415ad.30.1777311414266;
        Mon, 27 Apr 2026 10:36:54 -0700 (PDT)
X-Received: by 2002:a17:902:930b:b0:2b9:5d1b:73da with SMTP id d9443c01a7336-2b97a9498d1mr1240115ad.30.1777311413824;
        Mon, 27 Apr 2026 10:36:53 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b97aca8369sm329115ad.75.2026.04.27.10.36.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 10:36:53 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 23:04:50 +0530
Subject: [PATCH v21 10/13] arm64: dts: qcom: Add psci reboot-modes for
 kodiak boards
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260427-arm-psci-system_reset2-vendor-reboots-v21-10-dcf937775e73@oss.qualcomm.com>
References: <20260427-arm-psci-system_reset2-vendor-reboots-v21-0-dcf937775e73@oss.qualcomm.com>
In-Reply-To: <20260427-arm-psci-system_reset2-vendor-reboots-v21-0-dcf937775e73@oss.qualcomm.com>
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
        Srinivas Kandagatla <srini@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777311301; l=2240;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=lzFmHffITL4MZ7Zhg3ubOyGGeoOeSnOg+B50ouxJsO0=;
 b=98cReqLFE1VvbI3WMdumayFbZvKuX+6jokI+ZbKawI/g6LlmRmm1VnxCiGnVLXZwxNIU5qBGG
 YfhdC626zMjAwn8yAogRwMIqB5/RL9mpWKk8xilVRkbwq7id7zsCDrI
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-GUID: Pj1JIjf9ZaEwcsX1Vf_2u0-WG_1lhMHr
X-Proofpoint-ORIG-GUID: Pj1JIjf9ZaEwcsX1Vf_2u0-WG_1lhMHr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDE4NyBTYWx0ZWRfXzRoS3ZMtKbna
 TOfg/wmL8UZgGDFMiK3BJLvXaxeM3+pivkWubVmW/SZ5cFbR+Q2Q/nGbOBrw4K+K94yBj/LEWjB
 aRM3fCWKOIa04VGQsejLFyo/4gtOfJM4Z1Fcz871Gx95bNC4WQNEk/ntGkj8A3rMgb9459Fr+Et
 vPjdnZTLKdjUANR57RS/eZlu8CsGHE7rx9EfY6r2EG/TdT+W+O/lRqghN/0MvTXmUoq2wPeK3iY
 o6PFhkrKTc94eF137x0sTPOV2SCMMM3Q9/oM+cCBxvxA8siF3v5Vb0wDaEm/+alM8ASaetenzcg
 6scBHMiaCi5mfBoJwchZ4oPFn47ct+S/3VjZX/DrMyvdIwAeGwsTsrt5+8fPf2/x8HGhKkNYh2v
 M9DyiG65C1/eH+17T9PzA8Mz5h8gIds+yz3d9pdce1SU0aW6bDu9euudHoUoU3xZ5CeTvbsFe3m
 nIAKC1ECtTN6dCoQW5Q==
X-Authority-Analysis: v=2.4 cv=FM8rAeos c=1 sm=1 tr=0 ts=69ef9eb7 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=t9IVmYW30V31rltyR78A:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 bulkscore=0 phishscore=0
 spamscore=0 malwarescore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270187

Add PSCI SYSTEM_RESET2 reboot-modes for qcm6490-idp and qcs6490-rb3gen2
for use by the psci-reboot-mode driver.
The following modes are defined:
- bootloader: reboot into fastboot mode for fastboot flashing.
- edl: reboot into emergency download mode for image loading via
  the Firehose protocol.

Support for these modes is firmware dependent and not available across
all kodiak based boards.

Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kodiak.dtsi         | 2 +-
 arch/arm64/boot/dts/qcom/qcm6490-idp.dts     | 7 +++++++
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 7 +++++++
 3 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
index 988ca5f7c8a0ec5196c88881f529236c321ad617..72bcc732ab7b64288e1848edb8a55e2c7fe34f98 100644
--- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
+++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
@@ -863,7 +863,7 @@ pmu-a78 {
 		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
 	};
 
-	psci {
+	psci: psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
 
diff --git a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
index bdc02260f902bd37242ba96b90a858ff091e0c80..b7a0b53476395c25f264f2808176588f5943c4c7 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
@@ -786,6 +786,13 @@ &qup_uart7_tx {
 	bias-disable;
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
diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
index e393ccf1884afde7816739053d41ca789acfca91..ec614003bd83664b5485940edd366c9ddbd57340 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
@@ -1088,6 +1088,13 @@ &pon_resin {
 	status = "okay";
 };
 
+&psci {
+	reboot-mode {
+		mode-bootloader = <0x80010001 0x2>;
+		mode-edl = <0x80000000 0x1>;
+	};
+};
+
 &qup_uart7_cts {
 	/*
 	 * Configure a bias-bus-hold on CTS to lower power

-- 
2.34.1

