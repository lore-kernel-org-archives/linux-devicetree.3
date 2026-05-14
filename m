Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E8B13DCDAB
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 14:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778768933; cv=none; b=YY1BIRCUOKt6ehD0BuA6S0QJyHIgCDodVjB83WAzJqmP7ovYGDKRlFY6//zEdI4JQ8hDNFC7ppO27GtazwTTfcHZlDj/cavS0UShxbn23+nCdBlye7PKhofS7tBxsxZQPn8OlRA6W7oLkeBmLbiuOEXnKocX+DYI4bbmZkIchqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778768933; c=relaxed/simple;
	bh=hQWk5GnSgPwZS2e2a67KLI3RcOaWHf38dgj5HvuzzxY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Vt8MnU206phVb6OOFGgPcIY8NYRIyT4eK/5jGcA2ON+tAWOsLKNXUkPDrojG8+CjLEm0IYtSrHhxG2felGLMeRhfcE/ISBVUFJ/AlTxz3rhh7MJhUSRgAgMCxGSJkA8YEKyRi4gT5WUwLrxezYBjCiw5525+D3FyuLdkRgXN1N8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gnaUlrBt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V2Sq7VMw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gnaUlrBt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V2Sq7VMw"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64EBeQGt2841036
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 14:28:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Z3gmXevIZBqHz/6HbBP+YQLOenk6XainQhMGwbD9zac=; b=gnaUlrBtcmS0yLMj
	vnRNkqwnm2zN+h3FF5X4ixzhDVvpd0mG6TP/s5+7fOYUaDQZRnLmj4VvKeKKpoor
	op+2LjuHq6qdeQMCZuiU+0S53gGhSsTFWqqA0mGixkqkZVw/2Iwo3KQh0y+IPAWk
	ATJ96uE57gT/luf7y5L/5DGSAdXu7nm6ttZ17nhyo7g44pryVTy0uJNfUr75tmG3
	0oI71fdz4XFj2csQjgQGHxshAoP3Sc5CWVps31rAs8L3XSiO26Yrc7aapFcpxDU0
	+QpKtMxx/bLpQhrWpXP9d5gSgb5F6JTht42+rejUgKDiQMAEOMAHe8ojhNEAhS9T
	jQd+TQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5899st3x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 14:28:50 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ba3245a43dso73544425ad.0
        for <devicetree@vger.kernel.org>; Thu, 14 May 2026 07:28:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778768930; x=1779373730; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z3gmXevIZBqHz/6HbBP+YQLOenk6XainQhMGwbD9zac=;
        b=V2Sq7VMwpC8x3jANRCDeUxejcU36ry6+wC8p3xmajwW6a9w1xPzMQrhSugBFQmAOP6
         DzCYLgH+6i5OJqj26pfVRj8D/nf2nbE/QEJu5yUDdyN091AJyLPybfsM9yjUpSYFaWN4
         aaDQvferhYxTbrx2di5A8OqQIGAe0Eu3XjaM8jZV21MWNgPUkJ7kEEJcAkQ9zXXWndRb
         Fc+HFD5XPl+sSSf8nB4HpV7PWcfi8rBhI7man0DEOc1RIBg1Ua0GHUyAMdSBY990bRdZ
         3Tz7L7i/1fS7/HYoIQO4h5/JIz7vx8fNV/WruF6h5jqIsq1wry8I1OmZcDLmBydAWkLu
         R7fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778768930; x=1779373730;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Z3gmXevIZBqHz/6HbBP+YQLOenk6XainQhMGwbD9zac=;
        b=lIGYrpVaV/VRp5tJrDHuyAXfsH5q+bWJPqrPeufj8L5eMEQnP6E/5feou2gsjQClzS
         Y1SDaMzsH7XezYaNcKEb/IhAFpiVvfP9acfp39xUf6Z+Hjl6fkONijYSgATPeC2edZMF
         BxTIcqFCtAl3zGhWO1Hhzw7XQ2hDVUzxP71gxfA27n789qm+uwWFivxXODQ8fUtepNYL
         ZasBaSg7n4O34GGcYo1bUGJC1kqgWj6xp3g6Twc9dYfazeu01xe1BLLq7aOhvvo4wWOO
         nkVrLfvz0x/PSzC9T55gGTSJ5qImXdXtqOuiInMCF+CaH8+Gq6wgJX0iEdUdf8CQfkr8
         KrqA==
X-Forwarded-Encrypted: i=1; AFNElJ8sSIaGDWcuPP/9qImnoCvdAtnrfZyQqyBQqvTOy5C4OpXUQqh0jm4iAqlX+IMOSp7k8sLioFYZ3RIs@vger.kernel.org
X-Gm-Message-State: AOJu0Ywtu2WKYdwrc2dWFHGa53NQfDB7++rX+bDaNfU0TGmMic1/feLv
	sHmmLG1YWY4ox28vHKaJBlrZHWVNKCVbfCJxzj4a8yAHKs1lQXkEoz0Gr233oZLUb+EjzppfuWb
	9w945cLQivYU3W6oqvQ6nj+7MShiWswnKrWRRmaYCDBbP8dr3FIYfb+pMNfN2gxN2
X-Gm-Gg: Acq92OEa2117NjevijcVRQ4FKoI5J3ffW1TxWBHeylP3ghHsJb4lkOXVsis5Zn4vA3n
	NdgBN+ZwsDWZ0yKZ38i8te23WhEKXQgNdUvSOli1mYuttC9U1F2h457NXr4g3iRc4bBGeyWjSmG
	/LowngGvYLqvZg+XCQQ5+KtyE6Yjcdh8W3jJCrMR6Jg462svPGpNyO3sQLklSTCssqd+1K7gteF
	bBI67ctxA4UklMGeSEb5ETD56lw9f6hk1J2WOApsjFoyI1rZEDtzETsIfbdXjiYiOUnNYRJbY6P
	6m3nZFJ8jo7WACRr7GNP88Nn3Fgop39fiJGfqw4qLhsKkEqvpF8xg1FUKF65t1vee2Gk1C4t0bW
	T3YElCVgXQ3RkxwiW3HlRDB7x2WorfWvnnHzUN7lurC9Am2LM8lWWNrHlSQ==
X-Received: by 2002:a17:903:fa5:b0:2bc:f3f5:a6c3 with SMTP id d9443c01a7336-2bd276f2a78mr89745925ad.39.1778768929782;
        Thu, 14 May 2026 07:28:49 -0700 (PDT)
X-Received: by 2002:a17:903:fa5:b0:2bc:f3f5:a6c3 with SMTP id d9443c01a7336-2bd276f2a78mr89745225ad.39.1778768929231;
        Thu, 14 May 2026 07:28:49 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5c05ffbesm28566485ad.27.2026.05.14.07.28.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 07:28:48 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Thu, 14 May 2026 19:55:52 +0530
Subject: [PATCH v22 11/13] arm64: dts: qcom: Add psci reboot-modes for
 lemans boards
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260514-arm-psci-system_reset2-vendor-reboots-v22-11-28a5bde07483@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778768806; l=2346;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=hQWk5GnSgPwZS2e2a67KLI3RcOaWHf38dgj5HvuzzxY=;
 b=8HTGNQ569NTCRAx7lz4yBrYgkXlEUi/4SOkrgYaKZRigAugMeSI6jpFJU4nygrEPOBC4fE1SH
 3jYOuzc8rIMDsTnHivJRdKPKjx/MAVpDeDU87PiKaiePS32/DUYOZ8J
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDE0NiBTYWx0ZWRfX3l5kzhXf+wRG
 zkkxkTKWj7UMfmgeK704GTOFT/Y5uyeVfXsliv5z8tPhIdXVejRYSvIPle7s/JsBg479yqnlV62
 vHumNxn3kH6ChUHb2dCwjdFaDjfqf8GflXzh6XSyfxDlowM8CKJimk1iHFgF6aSK3vZLUTYJ2+r
 5nMY+dN2FCq6ctHu9hWmO3duwPg3l2me50SloMvsUIwGUQkziJz8aKJij6AHLkHzW9bT7YUOHlz
 iOoO2QOHeqjpfTmvaALIxaS2FFEYPwNydeE4Pf+C+72oM46PtAD7tvsorIw7YecVkyq28vNfnkX
 x2PUd0ulOERTupnz+tn2jmpUFN98/ERElvmFRMmN3OLF+OBDB/tRm4P0xF+8YupXXtPZ8roJbJR
 b5GBwPQIcoagrOI3TC88yA045SNDjJhHWJbAkamQny+coP8NDgWEDZ6ZPLqQC1FYbAgv379yyeQ
 wEAkUaXpMg1+c4jUngw==
X-Proofpoint-ORIG-GUID: pA2XoKtYS563lILs48BmT5qfejhVcanz
X-Authority-Analysis: v=2.4 cv=N6AZ0W9B c=1 sm=1 tr=0 ts=6a05dc22 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=t9IVmYW30V31rltyR78A:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: pA2XoKtYS563lILs48BmT5qfejhVcanz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_03,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 bulkscore=0 malwarescore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605140146

Add PSCI SYSTEM_RESET2 reboot-modes for lemans-evk and
lemans-ride-common(sa8775p-ride, sa8775p-ride-r3, qcs9100-ride,
qcs9100-ride-r3) for use by the psci-reboot-mode driver.

The following modes are defined:
- bootloader: reboot into fastboot mode for fastboot flashing.
- edl: reboot into emergency download mode for image loading via
  the Firehose protocol.

Support for these modes is firmware dependent.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans-evk.dts          | 7 +++++++
 arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi | 7 +++++++
 arch/arm64/boot/dts/qcom/lemans.dtsi             | 2 +-
 3 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dts/qcom/lemans-evk.dts
index c665db6a4595cef441f4bd5ba21fe133652b97c6..8be0f50188839e6301e33a50948a523825fc5a6a 100644
--- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
+++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
@@ -758,6 +758,13 @@ usb2_id: usb2-id-state {
 	};
 };
 
+&psci {
+	reboot-mode {
+		mode-bootloader = <0x80010001 0x2>;
+		mode-edl = <0x80000000 0x1>;
+	};
+};
+
 &qup_i2c19_default {
 	drive-strength = <2>;
 	bias-pull-up;
diff --git a/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi b/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
index 40f88498999bd89e030a6685e6b84e7283e866c6..2a9ef170f654b1e270b1fa6d4b861dc0c4642760 100644
--- a/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
@@ -800,6 +800,13 @@ &pmm8654au_3_gpios {
 			  "GNSS_BOOT_MODE";
 };
 
+&psci {
+	reboot-mode {
+		mode-bootloader = <0x80010001 0x2>;
+		mode-edl = <0x80000000 0x1>;
+	};
+};
+
 &qupv3_id_1 {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index 84a1e5ebbf5e58b2fe11978c3af08cda614605f0..447d80aec5bfa1fcf11a933669f4740ef310c9c2 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -559,7 +559,7 @@ pmu {
 		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH>;
 	};
 
-	psci {
+	psci: psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
 

-- 
2.34.1

