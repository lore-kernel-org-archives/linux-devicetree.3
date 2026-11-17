Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794903870;
	b=5UgN2mZnFEr/QRNiGCtDbceJQJmYcxql0El84RVepe4uqYI/xBHOKtdVXHICJ9/5RStN
	 ntIE2HgctnDMhLBPw6uRlEcIvUzHM938F9h3T9BCQ55vPZvc1xYblaOK2iA8JkqEqZjcv
	 ZrJMsLjvshtx9vVzmwoTSEXIfObiTg9TxYmbq0Y34MNbH87foUXqOcBok6tiMbRth2/Dg
	 2CYIOa7J8pBwoMPu4+G4hmJAkBvriIpqTWS5tgqrtXmtXLxWn8DFYgEY9UUO3lBASTXCM
	 zL/pDX6zaVG0ZomtzhQe1HoftlTYnnqphcp7DYCRFjHnLKmOlR44y8K+7/07lH0qhCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794903870;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=xw3xnb7M3ni/K395S76W5M9HsZ1EBFx8fzPBd64UQdY=;
	b=UI/ptv+MYv5xIzsKqJkho7r5kGEpESIeYrLaZND6MSlAahcPd2cybl4TvviH9HFLsuQD
	 ARtGYl0lh1ebdOA8OCqdS613+g0r8lTKfLUsOfBQNuBSQa9IOSss9QHBCLXZgn/liZlWG
	 ozreWVAEZ5qCwm07eWiU8Idfgd5fWNCCMr9+lItaaA1E/8mGZ26LOJ3E7/pNTWhyNolDR
	 +FGwHQ19gSNYR4HIxYhvnnBW15wq+X2W/xVFCA2CwsTIVG9bmihI4QV7dMbT/sQDRhDf5
	 2L5G1A9rfU650weiaPxmHv88SM1MukaWgM94imDPxZMHtSXYTSb9o8UhWO0pIJpIRNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fairphone.com;
	spf=pass smtp.mailfrom=fairphone.com;
	dkim=pass header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=SHbfSFnd;
	arc=none smtp.remote-ip=209.85.218.53
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0BB260A2600
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 08:24:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F0BB260A2600
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=SHbfSFnd
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c50cc8e0f84so310739366b.1
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 00:24:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1794903868; x=1795508668; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xw3xnb7M3ni/K395S76W5M9HsZ1EBFx8fzPBd64UQdY=;
        b=SHbfSFndESk1yY8b/OsbMm/euo3XP110OsJVHrsLsdYSpOY39tPL6ns+z+sdP0oJFk
         khgUnzyP3YKajHvNhpszCJiaRzKRtMHkVX8NHWr2m6xdTSFCkJU4ClvYmgNS47iMqn4G
         MHFIuQFpZCo4vBGjxab09RtA+7HfZ2oVkncRvzSkTZ6cfeuB7KTtE4BuPY3EDJRdjcQy
         rShqUqiojPjqHm1NaYlFFxn4ErPnsIL6rn0ToRgLYlEY44TbdaQYdlDTMUIDSsEtNCTE
         K//0K3ZfoWwvtEJJmfmTtkf3aQ0EqnWbrYdeUoEqBUPRYmpIiWaE/5EELg2nOLU5GFEt
         jkew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794903868; x=1795508668;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xw3xnb7M3ni/K395S76W5M9HsZ1EBFx8fzPBd64UQdY=;
        b=ld4CXcgE0MmtrHJcM/Wc4hsDqZZ6i2MCHItYWYUpyuh/1uCN2Zu2bGnLhRBQNuvFPK
         QMwTPjGp7D+rMDnGN/lcbWlnbHRum39IS9vTc3QYyrg/XLd0f4WpFdRWvPe4ImyeJFBw
         kMk+Fuyk5uWopAQNB/8DvHXIDOAs6yIa6OqUp0E+PCgnUENcz5kMWliCDBKE1cyV038L
         jzeyNrSIFHV6Nwi3ixF+ODlkVjJMGI3O8DsODDHLHqCoyVnc7szUn7LzcEJVpR15osFs
         DnTtOiJuH4c+6dPnbyzz847ZpvfVe7FdNPXvGRCwA7ISpa2VjM9PnNBMQgAKzHh9ge3c
         ph+w==
X-Forwarded-Encrypted: i=1; AL+hErGSOWW3hoFEzE1d02+MC2+KpDGsd8zwiG9TiOkm+YcbQvO0Rjj7bNJJJOxddbAAGWXk2x9+bz7aolxg@vger.kernel.org
X-Gm-Message-State: APuU4Z+DzEZ1hvQEuoc3blizjURpzKf9DRjpul1ZfJl7qmHB3j6RzFPP
	upLOvj+g25LBgna1ix+68toZo+4TSBKGMnczojXNat2kEOIupilCgXEhdEwURpC6ZhM=
X-Gm-Gg: AYBFou2/wmbFu/EdozwPCDhNWN2nRhDZLx9nazf61v1Lk1w16yPHIW8aggMoFUqitkZ
	sa0DVJUmRN7bfYFNpPgML9vsRoLqg8SUL0hdRhSKLp/XKC8n57pXxdCJQ7ElhoQoLe0tLRRsQPX
	tkeNS36nZr9GkHKoLopPN2lk3CasnSTjBY//6HfdOQBoFq25AUSXPCPmc3pKobkvnoy3iTyFqSY
	Mo+K6Y8tswlx6RmBsHv9AjRXrqFxe7D9JbdR0UwW09przzyioUxT1uw1uwd4Veq+ejMgHRv0rtg
	O+xxt/YMZ3WNVAEdsN6VOAXt9Pi/vY92ryuuDY1oqPT3LpBN0iNsZIdK+60WFBOeaFOWK0spxz3
	erQrHbmkKJatEtkOgsDiixBPGVNUuDw5dIwjJ23f2vblXLoLlkzyxAZ9kSmP935IhrQyR3j0UlI
	DbnmgpcEOJc9ko5nGTHSmjz1sdrMaCgyjhBlxXmbdOA9w0GaAjjgZtmreU01oJDRh/qzrcpUccn
	fdnMAbu0KmzDaZdok0ealIHvc5/M5NYXIrL8NNggf2p47meg9AEJs3yaeUg+n69/aDPyAek6HQf
	hVF5Ey1gd/CH18AXN1PkffEqAdg783STexUIgABll8eIEKZQ3TvFVJ3iWdG3q3Ol05BSXaT8I5F
	rHd36apRAdAGyguuer9Mu1mUXCDpCToPu+mwso4Rs9O0AeruS
X-Received: by 2002:a17:906:7315:b0:c42:fc8b:6c7a with SMTP id a640c23a62f3a-c5096550449mr1132986666b.41.1794903868527;
        Tue, 17 Nov 2026 00:24:28 -0800 (PST)
Received: from [192.168.101.179] (2001-1c04-0504-7401-4b2e-1820-6d24-b264.cable.dynamic.v6.ziggo.nl. [2001:1c04:504:7401:4b2e:1820:6d24:b264])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b7c23611casm5616953a12.9.2026.11.17.00.24.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 00:24:28 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Tue, 17 Nov 2026 09:23:14 +0100
Subject: [PATCH v4 4/5] arm64: dts: qcom: pm7250b: Define battery
 temperature ADC channels
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
Message-Id: <20261117-bat-temp-adc-v4-4-14d5d309ebfa@fairphone.com>
References: <20261117-bat-temp-adc-v4-0-14d5d309ebfa@fairphone.com>
In-Reply-To: <20261117-bat-temp-adc-v4-0-14d5d309ebfa@fairphone.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
 Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Laxman Dewangan <ldewangan@nvidia.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Hans de Goede <hansg@kernel.org>, 
 Jens Reidel <adrian@mainlining.org>, 
 Casey Connolly <casey.connolly@linaro.org>, Val Packett <val@packett.cool>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-iio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
 devicetree@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794903862; l=1412;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=b7mnu5CgjN796/wKAPryTmfFj9uk8BxPsgl2XchGimQ=;
 b=IEavwQRoBZ9J/7BaFptQKLVBcbOzlROC3o7elEG/KJxaOX+vWhvHEkOrTZSwFs3fttmOJJc3Q
 PHcebENwoAHAURwSzKsaLbonycN9YknjNtC/PDT1eB5SmaSrhF3UTW2
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add the definition for these ADC channels to the PM7250B definition.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/pm7250b.dtsi | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pm7250b.dtsi b/arch/arm64/boot/dts/qcom/pm7250b.dtsi
index 43cab07126c5..91e83587adf2 100644
--- a/arch/arm64/boot/dts/qcom/pm7250b.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm7250b.dtsi
@@ -155,6 +155,22 @@ channel@1e {
 				label = "chg_mid";
 			};
 
+			channel@2a {
+				reg = <ADC5_BAT_THERM_30K_PU>;
+				qcom,hw-settle-time = <200>;
+				qcom,pre-scaling = <1 1>;
+				qcom,ratiometric;
+				label = "bat_therm_30k";
+			};
+
+			channel@4a {
+				reg = <ADC5_BAT_THERM_100K_PU>;
+				qcom,hw-settle-time = <200>;
+				qcom,pre-scaling = <1 1>;
+				qcom,ratiometric;
+				label = "bat_therm_100k";
+			};
+
 			channel@4b {
 				reg = <ADC5_BAT_ID_100K_PU>;
 				qcom,hw-settle-time = <200>;
@@ -163,6 +179,14 @@ channel@4b {
 				label = "bat_id";
 			};
 
+			channel@6a {
+				reg = <ADC5_BAT_THERM_400K_PU>;
+				qcom,hw-settle-time = <200>;
+				qcom,pre-scaling = <1 1>;
+				qcom,ratiometric;
+				label = "bat_therm_400k";
+			};
+
 			channel@83 {
 				reg = <ADC5_VPH_PWR>;
 				qcom,pre-scaling = <1 3>;

-- 
2.56.1

