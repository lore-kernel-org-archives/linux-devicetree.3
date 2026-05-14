Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35C953DFC6B
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 14:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778769278; cv=none; b=Jdkh7LgoLUbswofW0/cej3xJwtr9qXhmBktQOmPeckmALFngf1fbR5o3SOIYykGd6IQqQUKdaPZhwrKxVP3ld7UcpggTd2ybKf4LC4JeSkXtVCpF6IIBu2J+ub0PpT/uV4h7sJ67NUCp+40feOBRj0XN4IwrfjwUIAeOdpv+wFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778769278; c=relaxed/simple;
	bh=Z4ZuPORDaKmwW4HgxyAXr2NET55WZqUTE31cMVs09oQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Gef0S780Pubj6liWKiTCO7vtody/jpE/54anccov5I83vyoTzkknEjrwNmCtg7/Jlq524CNEv4FsLSreIeovbmtNdZ+m/0AQjfK+nEdCTM3zkaLhenNtjrtXwrM/LYV4FA3sV6q2BJhLTSil06HaLBGmZz5Qf87iaiPh74o9smA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GMboUtuG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UZ/TG+ab; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GMboUtuG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UZ/TG+ab"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64EBeSEr2554515
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 14:34:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NzWlaO04yyHlsdDuTucopP+bIfNJCQRkBOIVvtEthBc=; b=GMboUtuG1xj1VF/0
	LZjDrzXIme3PohyrPVBtWygHkd5e3XWG1qMA6PRmHGw0B2XxxfhtErGq+3LOjNNy
	m5sqPOp2CSljODTxNyal4QUAhiREKwpC/LauH25c2jTwP0GU7hHP8DxOJyIySNtu
	JHnpaMLhaw97ZIKe0D0S7CJyplUgi6avGb6BF7Ds+ZxFXxWBgBfWg4Gg/ratDCOv
	dmYOh1dYR5NlkhV6f/nI/GiqYWiGiXPgb7aK/rZ95+P37kcCWLDACoPVZFZA1rTD
	rDii4jX8gUC/9InqVgYyF3Mfa7zUHgNR6yzKy7NUW0SlOmg1UdWQ9PyUA4eZ1KgL
	o4+y3g==
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5b0bs7w2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 14:34:36 +0000 (GMT)
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-479d602f323so14152516b6e.1
        for <devicetree@vger.kernel.org>; Thu, 14 May 2026 07:34:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778769275; x=1779374075; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NzWlaO04yyHlsdDuTucopP+bIfNJCQRkBOIVvtEthBc=;
        b=UZ/TG+abXwZ30W2QXU4FIN1urnqHAWF5YxPXQdGLsQQDIJnmzme1/MQrm4z/Dujey5
         apNHUn32mEPmV3KkbccPNuCLjXiwaZFMRgYkIQeMvAfYnNrKoEavXOJy39e/rbtOdLTI
         u2tuE+VH/KfXyE0rhz22kRCsEvxED0xJ2ZESgfP2SZtOci1h4a+kWar9sWeJQcuF9xuS
         S2jQNMeWOGARLxhaeBVFvSnoshWNbBEUCiCF2MQnZGaSZf/oBKdHwlo9+DSB9xdCEd7i
         QH2x7PwDKdN0j+MZPq01i6RFJ5GTIeek5AmbyktjzfTqLPS4FC+B5yTxY9iiA5qr5u14
         WAog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778769275; x=1779374075;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NzWlaO04yyHlsdDuTucopP+bIfNJCQRkBOIVvtEthBc=;
        b=V6+HYYbC3v8dV16PSJzkCjcigPvp7VQiG1Zro58g+JCcLUenECM7Dq+C33mhQ0bs98
         UCpxsp9zK/C5szb0st3lwXaY8OUa5SO6CEGoWofaiM5tn9GUytQpLB9SHl5HsI+gT/lD
         0zUIrNF53czw2KsjKJ85XSuhb1DMhBzQNBpi6W1Hg/ADlVp2OhQZjNwBVtyX1IZ1ZRYp
         Bv5dtq+YdpFCu4lx8wjXyeCRD0d8OIERfSbejkCwGQ3TEqEMl5Rvl2bpztId0ji/99P1
         Yi9lEL0XZtXrgnpND/FWIhJl1uiojYNG4/IbJQAPuoIGksGmRTn/HrRjhAVEMJRj/jMG
         wSyg==
X-Forwarded-Encrypted: i=1; AFNElJ/Q9JVksAYv0wlMtyvSFRom/S3q52PzSZ3E4IqtL/tXmYYoEXs0qL4kmws2tm/5Phm6o/2x8k+XMQae@vger.kernel.org
X-Gm-Message-State: AOJu0YwV3CVp+cuM6SR4ccqIOtEkoOHi8FwZkZ1TPaWGGKGkbzhTKWSP
	2Q5mV6F0gwMuFYrWhDmsf1Bm1DFwma/PM2ohnSfAFjGhaZz+o9Hzy8lsGzRmJzMFUZNFL9kaOdg
	3Mz/Th3vl5BmDq9gnKY/BDSULaPYICGn/tbwJ7P6U7ZrdSbozfZjNZ+OnX1m2K9nA
X-Gm-Gg: Acq92OFPNypSPzWaEP8vB+8uZR1u5CHiOkIEYRWIya8eznv6H25CPKjs2EICqK/weFw
	YRhQdy1btHRTdUkqYXvGUOIuu0HNLVwlUL5zuJcjyuEedArYXN+ZjlMxHh6KXdoFLrTiXDghryN
	rswRhYyIS/Pj2VZXBVqhUrSubYO2YLgKKzuDJ2IBeEZUba7X1/CHuMP9FiH01oQcTI9laL6wyTo
	2ISxfzW+oeD6mjsMpyjr7mLdSjWL9alYws5rMNt0p1g+S7YM6P7jycZBkag2bYOrdbJrBvF2srW
	zVoxeTnP7TULJ9I7I04FYAyPRkSdAbeiZHlCD4N6u0NuKOA9H3wZjXadsPNj59pkQJIB3UgqY3s
	gMLWUPf+ZfDH2LAdoq4B2v12hSKAGNcGQF2ztPyTH8uRF+JENYRKx2XsnL11YPqCEF5FG
X-Received: by 2002:a17:903:388c:b0:2bc:e62a:979b with SMTP id d9443c01a7336-2bd30333de6mr84520075ad.30.1778768919644;
        Thu, 14 May 2026 07:28:39 -0700 (PDT)
X-Received: by 2002:a17:903:388c:b0:2bc:e62a:979b with SMTP id d9443c01a7336-2bd30333de6mr84519645ad.30.1778768919132;
        Thu, 14 May 2026 07:28:39 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5c05ffbesm28566485ad.27.2026.05.14.07.28.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 07:28:38 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Thu, 14 May 2026 19:55:51 +0530
Subject: [PATCH v22 10/13] arm64: dts: qcom: Add psci reboot-modes for
 kodiak boards
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260514-arm-psci-system_reset2-vendor-reboots-v22-10-28a5bde07483@oss.qualcomm.com>
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
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778768806; l=2313;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=Z4ZuPORDaKmwW4HgxyAXr2NET55WZqUTE31cMVs09oQ=;
 b=UV3YrYW7ea7IDtY3mvFFnc3oM4mTHIzbv8vLk9734m6TdveIxgUI2VsXxYkgt6YmsWwQrXH5O
 7md8+BNAZT/DDonxcGbchOqjnzcHx957S4NDCLNDmMDE+9AuEo2Hg+C
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDE0NyBTYWx0ZWRfX/RB+0OmpV9pu
 dr+DfG8tMqDcxzJnZX45d+vshitTMEmMCsSrobk/ysVVt3VQAHLNIlrFeBjiGiDgEHzSsyqmqXz
 p83tCDIpRDHaw6MZMbGqzDW8uJV8CVwyvJNYq4Uj1NDFXSeVGAqnE7Y18o++pB5IJB96lMNx5Gs
 DmzbFySHfJ+h6S6NAOWMOB36XxuXclWtk0BzTALHZUTLK1P1O6jUvOvodfWDSl+JBNbso+jkUHC
 6NWLBVuE4tF2DB87HWRRmYduCdZe4pxUEJw+spnEnXcvggER0m00nqAE+Jeu7gKWBRkIL9f1tZt
 uvz/w5aGjX0uobLjRixTFOhsNYPNTcrD7f+P41HLwARY6tddYBcpVMYQSCqIIGp3sgzSd9bCP8i
 Sd72UaFyPIKvS4ZB2uzrZFsD12zZ+LydJ3q2bryx5NEs7Y9yRC40+ipO9e1dXoaTqflF+VK3xQP
 RWrC5TcFFSFaN2/FhHw==
X-Authority-Analysis: v=2.4 cv=b+2CJNGx c=1 sm=1 tr=0 ts=6a05dd7c cx=c_pps
 a=WJcna6AvsNCxL/DJwPP1KA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=t9IVmYW30V31rltyR78A:9 a=QEXdDO2ut3YA:10
 a=_Y9Zt4tPzoBS9L09Snn2:22
X-Proofpoint-GUID: 4ndxOuFftDZY29OhxJWm05A7iV71k1R1
X-Proofpoint-ORIG-GUID: 4ndxOuFftDZY29OhxJWm05A7iV71k1R1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_03,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 suspectscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605140147

Add PSCI SYSTEM_RESET2 reboot-modes for qcm6490-idp and qcs6490-rb3gen2
for use by the psci-reboot-mode driver.
The following modes are defined:
- bootloader: reboot into fastboot mode for fastboot flashing.
- edl: reboot into emergency download mode for image loading via
  the Firehose protocol.

Support for these modes is firmware dependent and not available across
all kodiak based boards.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
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
index ceb68a890bf401ca1d0c787a801d6b192f4e0743..f4af4d1e9bfcee0bbeca892d5386bcec5663c20a 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
@@ -1096,6 +1096,13 @@ &pon_resin {
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

