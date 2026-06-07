Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E27B72C0F69
	for <devicetree@vger.kernel.org>; Sun,  7 Jun 2026 16:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780848378; cv=none; b=C1a6gyiUAoBUXlAMOoM6FBIgh4YmaJdsmn2Vd28Ge9oxkA9IjZqBE4wStBAzPZXbWDvia51VeDSjsQ0CHDTvsVZKMaWSesq7t/OsyMlBHQWgI4MfjdamPx216BOW5Gnw18GGLoKq8XIVoFmyhd9+7Cpx7y3WHP/ow5D7ysxKDSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780848378; c=relaxed/simple;
	bh=1mj1GKKLxRXyhNjrEyGQbAylo9aW7O+mzSISPYCCv8g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QrQHjZyfOiPjGWD+Cy3kmj+sgBdvahUXBHVD33J+cRZdrS3Qu1ncQMG/gd3wngHV+NWVk3cLN7Q0ws1GLDZXZ23XXRFChvM/EHESb6P0ESEU2zaimqHaltKXbwzqd8HR0YsSrZbEyeHIIsGaBPw/8iZnxeMZ0YIsrYX5PVmiLzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eSpQyy3I; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eSpQyy3I"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-c8573e75425so1296362a12.2
        for <devicetree@vger.kernel.org>; Sun, 07 Jun 2026 09:06:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780848376; x=1781453176; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZixtqWHrB57YQGe3UnYSG0Ka4Wp9atQ9CHPm9ciBvFE=;
        b=eSpQyy3IEMF32gGhwH+h4ijiDRfLSa4odsWaKzK8zlP12oLVoQHV4HJwr21gdeKXkA
         WUylJjpHnyHgYshQc2O4cyFEWpfr3jaHCrgHEv71/E5eBwRKLfBpNiJXyNqSI302E8FN
         nFO33yMEoKlcctGskmsCL0WxjCZTLq7r8ob0duBJdMiuQDzt0iLrxAb96lA41k2kl4Oz
         iNrizNVPfFJ4BiV3PSDOKsNgwyUxwjjUVxByjdzBjUIZhpm22l5gIlvE+jemE259/ufJ
         /hMI7xpf2FYqP+CAc7TFj5Ta66sEx7t7FZxd8l5gGMV8VP395ehREpaCw1U29rDbgyax
         PKmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780848376; x=1781453176;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZixtqWHrB57YQGe3UnYSG0Ka4Wp9atQ9CHPm9ciBvFE=;
        b=DuylkAAXxcHGz6ruQ7hrVIxEQa6PzHJTZxTs2TT6bxBoHDbMaX+KtKCr8vOZaEQW8j
         Xr1tlZaabzyAQWsizhqepfJXxgSZyaySKaMaJVmPIQvpcVb8USz6BToRuH9zzOpG/dXe
         iJFHXdbRC9CeRmB/oDDz+F+Oxw6BTDgV3V7iEXiJKgKu7CKpeW4nPu/fTqBk+Q1e5L9W
         w3kzJLZX3ioFSgVhzXmZcEvGpObxc6rf2jyTLFIyHt5p/4fom/TOvwQeDuQQ1WRxYX57
         RHXv5q1g9T5KNsHo2tSm7BiIJ2GqDP/hmZKXCblpXrnheBVuwJpvTVvThfAlSzfYDOnG
         hZaQ==
X-Forwarded-Encrypted: i=1; AFNElJ8m9wKvIGI6/Vs7mK0ZwCQYw1t2j+lvJ5ZCLnM24VEqcqsRxHAaJ9gmnp4DH4mdW7MxfxeVDWkK8NaK@vger.kernel.org
X-Gm-Message-State: AOJu0YxKk77fxY/QxZn8bkIbQHXfG14rEgp17dcIemEozpYTRDo9BCHX
	h3mDb5LBVqL3ZlmNDMEs2DXRTxW+PbvKVVkHbCWqksRmrKkQiYIfHM6g
X-Gm-Gg: Acq92OGXzBAet0IZaycP5cVU3VdBJBsiaWqtq23Gwkkdp5haktlPfRmZvHUfexDNhsi
	vZXNTXk5qTugLQCvYMs4HDSiKAPyiy3cHdXNoXg0rjhRoNqyGygpmBS35qFal/ylf+kyWiPU6xd
	XlD2zzOd2l6OthwE+W2czdOJb52A6USsKDlYah47g2nHJrAEhCGBQs2jedcaihfpHqb3ABUliry
	24QCkXISD7WV58C58//0vJCsNJvkdDckVQ6sFRp8t4/5k4+3Tz2NhVz5x9x6lRP2Bt81FhcLMwl
	5S0qbMSAXVzSdVvTSbTH+niWV8VSxanJrSwMUNCXUbHi1zd+TF81/KyZWJw86lypxxLTUuyG/Er
	9HokwtM+rCVZlsDU7Bjsu8osDTSZDhU8VfHU2CAbKb5T+mYXq7yvMw3o4AS2+JovryJqVBgMyEe
	zfv+MsGdHu0PFxPQYPx7AHDvlFGhXmPqw=
X-Received: by 2002:a05:6a21:685:b0:3b4:8663:7e18 with SMTP id adf61e73a8af0-3b4ccf92383mr14930466637.28.1780848376115;
        Sun, 07 Jun 2026 09:06:16 -0700 (PDT)
Received: from nuvole ([2408:8448:9020:52d:18d5:d85a:8989:26c7])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85df03498csm14857134a12.1.2026.06.07.09.06.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 09:06:15 -0700 (PDT)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Pengyu Luo <mitltlatltl@gmail.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] arm64: dts: qcom: sc8280xp-x13s: Use predefined MCLK pinctrl
Date: Mon,  8 Jun 2026 00:04:34 +0800
Message-ID: <20260607160435.36546-2-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260607160435.36546-1-mitltlatltl@gmail.com>
References: <20260607160435.36546-1-mitltlatltl@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Now that the predefined MCLK pinctrl configuration is available in the
sc8280xp SoC DTSI, switch the ThinkPad X13s to use it. Drop the local,
duplicate MCLK pin definition from the camera pinctrl node.

Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
---
 .../boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts    | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
index abd9c5a67b9f..5d652be69e44 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
@@ -674,8 +674,9 @@ camera@10 {
 		reg = <0x10>;
 
 		reset-gpios = <&tlmm 15 GPIO_ACTIVE_LOW>;
+
+		pinctrl-0 = <&cam_rgb_default>, <&cam_mclk3_default>;
 		pinctrl-names = "default";
-		pinctrl-0 = <&cam_rgb_default>;
 
 		leds = <&privacy_led>;
 		led-names = "privacy";
@@ -1552,13 +1553,6 @@ cam_indicator_en: cam-indicator-en-state {
 	};
 
 	cam_rgb_default: cam-rgb-default-state {
-		mclk-pins {
-			pins = "gpio17";
-			function = "cam_mclk";
-			drive-strength = <16>;
-			bias-disable;
-		};
-
 		sc-rgb-xshut-n-pins {
 			pins = "gpio15";
 			function = "gpio";
-- 
2.54.0

