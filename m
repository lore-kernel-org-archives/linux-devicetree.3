Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2EA83064A9
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 17:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784049509; cv=none; b=ip7OfZTb4Qinq3K6/DH2xLcvMOTDHyTEtOWhnP1hqsgORsslj5XLWl4q+dIS98LWfdL05cmQFzol930lUFjgKcyvZ7MIcwfeSDOj7YcmDTK2oQ1rvUeZc2ebBQzaZxmQIxe7WD0iG5P4Y7N7KtDbj/LGyiauhdOZ/WBO9/fQC60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784049509; c=relaxed/simple;
	bh=PUOB/WUFiDir0kcvDNojilOCna+Is8nt41EZNien9Ag=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GwLlZ4OGASbRn2Svql2Y1elOtrdfK5SNiFqPx/UlmQlPbhdmDNWee8l9XP22Ymb65zDzHfHcLpUhPwsSMdqtbWMseOAWG5wVzJF9UE6nM2zHBaZwmgCcOHFVmWFS2+6MjQAFgEPJTUKP1TFqq3/t1dgvmxjjDI9KT3/KJZtXuC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pj+DyRlc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZveenGZc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pj+DyRlc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZveenGZc"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66EG6lTi1096990
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 17:18:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gG7R/01sqhJDRepizNPrgnwNsv/MIBa9LUQwgiZjRW8=; b=pj+DyRlcHZB4KDEq
	Nyo+dST9tBKMJxKuyLZw/7K/s+E12bczgmD6bODwSreG4Wpw6AYDFsh2+Td6Mp6P
	hZitrFRK/qLghv7wFT84ICnhwGMiAA63ohKh/UT5d9NUyp4HcKDSP+QboM9XTXCn
	zZ+NBRYMTwwvXETcg7d4GLFQn/TcF2vpAIGiM10kMbydWocyBVolvscpk9JxqOuY
	S7kZehoVzaYWPY9+U9kMWfRBBDxKbOV/GuD1oMbcfJ4UIC3vZREWVhnDVKEoxrgm
	vqjYIoJjWqtLRrF/UjWvrw08745qbHrfaDNkEjn3QUbVJmxv2umFvFm0qIiA+PXB
	RFEy/g==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fdnnqs3wc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 17:18:26 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-848474825ffso1890818b3a.0
        for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 10:18:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784049506; x=1784654306; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gG7R/01sqhJDRepizNPrgnwNsv/MIBa9LUQwgiZjRW8=;
        b=ZveenGZca4o/kC4PMlvnA7txYltNShO/OO4T8JWNGtSNwSUFetbi8HSJXdvLQrEsuH
         5iFgaPeqNuDJYtCUD6DQKPCGyDl0Wk3jYcGKyLfpmapraGISXAZbm3m9g33LctZC9Y2g
         jh34FSwf0yeEefPl87aQqf4/ZXmfjivIzyDquXx/Cga4UA79hfAQWCWc/+QZe78BB2Oa
         wmUNi+3/PBrhYTbbXKaKihtHpkgLHqvdvGUorFpPl8OQsmxl9b1khuT5N097TZcn75oJ
         H93XX0J3HQlD+hCtFQFPx73jnvbVcmQ5Ql2EMB+y4152FnBEapyoTI070066WTcke46Z
         ViYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784049506; x=1784654306;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gG7R/01sqhJDRepizNPrgnwNsv/MIBa9LUQwgiZjRW8=;
        b=cWXOmOQiLY8YYWhLuRpVtz3TDw/r6/dF0JYJKo49L2wBw3QHOORhswR+wsnQCIMLy1
         kOVR1n4SrseuW3ep+iHv4ZNsVWZoieTpOELoN7bq4U/8IMH/gkftrJpS/yi5qzIKA+IK
         SSQJaOJ3geBQjER32/HaRLjEkrYg6FJFfAFXo1LlD7swgJkgB8FJd/Gkgc//+jRnOmJL
         umwMu/E4BUAVyU/+H7rZ6LTKmuqC5mcgTdpjcsh+F9IDlczV3qEHo3NL91MR51mVXhd6
         Ufz8ttklwI9Mqnod5/H4MJ/alroLVQQr0KMM4c96mUyiTEgPmTajN4Mcer4cZit3q3MM
         o3cg==
X-Forwarded-Encrypted: i=1; AHgh+Rqb1/UY0GeduqQv0J8J9OAXBMTjWBvmb96+MdAZCXDyE+V5kbKiLK/shCnVhuQIbl4ufRsld0lyF9Ij@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6Ymj2EzQaR9iFW+kLYgZHwVwx8r58Sn9rtrdL2NJMLcFIwpV0
	BM/G1av40qLWFZswBlyLYTXK61KfCzmPZmiDD0zSl1Tf34bRRurIP0shbLuc3Hvk3lEZXpudAV6
	5gCR0NhanBz2JyWEx/3nwf5t2q9nfN01kTHY85w/IQYdgIlPoGrpz/c6F+wQIMHiI
X-Gm-Gg: AfdE7cl6z88fCNSxao9FjoTxlaqNMB1837JfxAi0aH1UfEhaaaQbPbXtesNJXgMiefQ
	lmR9cZOv35MghmrRmkpfrkvWzEdfpPozfPQPFNDSlQ1EQ7ImOoaDpnqdt8ed1NMb8rdnP9W1ZuS
	A0QHDAyGrH4gDBhtvnsranmcH5szfcAJSpPtlO/diPPKkZEF4reMHo3TrUsfr+vutSw6GrM6Fvz
	kmudhPmMB4RByDPyM2Z/znRj19GWn+DWpXqH1FcNFrDbIDuJZtrC6DKYgBi98A3Pc6ZBlWVKYms
	mUQn9VrrNt2x3E7erA6elkgv1c/LkTCZib9ST8PusqgKINXpASVjkTk5Rnzcs9bUW/l432uDZQF
	66qjWw6MuBMLCj7VLcBmpBvuyIyZi8N0+m1EFe+mRTZZxlnA=
X-Received: by 2002:a05:6a00:1a87:b0:848:57f3:8f92 with SMTP id d2e1a72fcca58-8488abc3652mr12495377b3a.17.1784049505557;
        Tue, 14 Jul 2026 10:18:25 -0700 (PDT)
X-Received: by 2002:a05:6a00:1a87:b0:848:57f3:8f92 with SMTP id d2e1a72fcca58-8488abc3652mr12495342b3a.17.1784049505079;
        Tue, 14 Jul 2026 10:18:25 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a5bfcc2e5sm731773b3a.56.2026.07.14.10.18.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 10:18:24 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 22:46:38 +0530
Subject: [PATCH v23 10/13] arm64: dts: qcom: Add psci reboot-modes for
 kodiak boards
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-arm-psci-system_reset2-vendor-reboots-v23-10-e7453c548c21@oss.qualcomm.com>
References: <20260714-arm-psci-system_reset2-vendor-reboots-v23-0-e7453c548c21@oss.qualcomm.com>
In-Reply-To: <20260714-arm-psci-system_reset2-vendor-reboots-v23-0-e7453c548c21@oss.qualcomm.com>
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
        mfd@lists.linux.dev, Srinivas Kandagatla <srini@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784049398; l=2145;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=PUOB/WUFiDir0kcvDNojilOCna+Is8nt41EZNien9Ag=;
 b=KWNkfXMmKYthJN1uiFBbtCUXReE0eGK3H1pxspQgqexOI1PPkEewBDCDbvLzZhUdhh0OCxaDh
 BwcB08aHB/3DrxL54W/bnlwFFGWJlmFNQDZ+h9ABzFiYnUXo+kw1SS0
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDE3OCBTYWx0ZWRfXxBxNnAtAsZSH
 vPzMulazw5guPzKpG6a/46MmEy8uVFwA1392Rw2RZyZzweJqxGT2/P2KAg+I7fPHNHxEq81mJ/m
 U1JGVK6fJUc+opaU6Y+yv9Wm4JRCmD90MbkzzhIztgudgE9kpAakObABPsGlgIv41VfYRHTKwvn
 HzJEf/D5JWyX2X0yI7mNh/0qZ0eoeTl+ltRFcf3xJoV4I8cFaallGZxTsf3jyPSz7uDyt/a2/Yj
 Ackg53XRXYr6ob3Cg9cuiWlHpGN+lmgTAO5ccmwKlFF6J5Cn2ZPaTFJiS2d91L3F6oDCbls1ilZ
 5zRtb6B4jdTuFgtJ9V4o+mS8D73sS+rXhFsYFvvnd4s2v64mafiw7StdfuhRnsy4ZyY1BmPl4cK
 jxV1cMRnQlYPdLimhegeFlVSPQ4QFHcaqXumMHtjR/mNp6SwVF4bGOYM4NUNt5dK38868UyNZHL
 5s8eEqHX1plAWn/erEg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDE3OCBTYWx0ZWRfXyPN3WyYED83M
 gzbceEy+Z0TMBzRCEferIsm4ovUUbBV1rbuHO6iio7zKVKxH75zaIawgQkVRRR7cNw+zOAoD+Jh
 clyHbtkRIGb1p0KH/55E3E/EilZAGiQ=
X-Authority-Analysis: v=2.4 cv=U+Oiy+ru c=1 sm=1 tr=0 ts=6a566f62 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=t9IVmYW30V31rltyR78A:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: y9Fm-lfhELVnkC9jFcPUjNLAonux73Is
X-Proofpoint-ORIG-GUID: y9Fm-lfhELVnkC9jFcPUjNLAonux73Is
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_04,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140178

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
index 7e73348fe0d0..82713f49ba63 100644
--- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
+++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
@@ -866,7 +866,7 @@ pmu-a78 {
 		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
 	};
 
-	psci {
+	psci: psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
 
diff --git a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
index bdc02260f902..b7a0b5347639 100644
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
index e9a932c90d14..0dd67cae41ff 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
@@ -1105,6 +1105,13 @@ &pon_resin {
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

