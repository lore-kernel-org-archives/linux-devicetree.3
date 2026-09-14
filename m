Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70B4B490C04
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 16:58:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789405131; cv=none; b=UP7dRSsOV9kJA/COwLFtbk/GKvlvCCnvReubSro7HwD9XQti5xxz43cGsPRyqglH/zljxIWowNCBIn3eQltxw5TfIwIrDQKA6F6SrRg522AXjeWNaDl7pY5vzckuJcs7vYCN19XT4NvvYy9iISx7XdIFW5yVTP4epMf16NWvx1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789405131; c=relaxed/simple;
	bh=vQZJxL2K323Aqi0Kksky+b29VDXNl7ZpFQVdjp4dKvk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Y4DjAu7Ru8RrQMnqpqgZDKurqYZmd61e3r6E3CuRM+Ewaaq48u0OnDNFGw6L1oGy3JTmtnhSod/T3SVPi996zbtAfPh4j8gwhYs8w4uvhiRAhUZb0mJb3GexD0ZcX4RKlQjRou0Usr4PDWfAidzRAR20/TbizgX0RNQOHsUMEYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=N0Erb8jU; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="N0Erb8jU"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-47de0093c42so3341920f8f.3
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 09:58:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789405127; x=1790009927; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/eFndhQmJL2HLUXXHwE0V3+xvGtq4NGEK5ul7Tv7r5I=;
        b=N0Erb8jUYdWjUEi3FT62R+vexD8p65HxHbCIxlEfeWxOOubvsUiKr3O7juwlGMPLav
         dWwLasoiPhJkiQ+peDezDyWdP9bb/SvhXw+PyY9z5BYgLKHFth//AhIJKyhTIX9j+bkD
         JCYxWWNVuIOXKwqW4DOxvHfKmDqyawmD8FSMW7umwzr/NMmMmM6yP2eZ8J/Pu2JaVnpu
         qcR6ebpQm2+Dp0EA4nWo+vCcNCUXDCH03DH5X8EZmXHAHkFPThxjmBMTzF1uwvc7RRyV
         CAr+28nU+Es8bxFR3vt2a2yJgi40wFHZ5OXb1rYzlLdeBe6nz6S1EQY0ED7ZeK544ZVN
         xIJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789405127; x=1790009927;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/eFndhQmJL2HLUXXHwE0V3+xvGtq4NGEK5ul7Tv7r5I=;
        b=nuKVvdWSaMhytZgO5/tqOzXKcqq6GJ/FYI0GCV7bQ9eZpm9VGuEd3VLQp54XeHFtoX
         8IyVFghtlEqgerr5Pa8+k3jlZ668LtuDfdFES5Ro5AEYi0s4cZEQavWQN3aglNfCWtui
         DCBxOW1wkqS57CjFJl9+W+0MZekLbewzIIWYtaebHyJ1ItybYKxxYzZFsCP5ihwjFT/n
         S45gdawZ8PlQAjJBMdqRNxPBPYhaEbehgdtCWBGHq5fHUFAoyCNT2mGdvDN5IOKxbb45
         XyjpWKK7ULTbDnDf5K/Yab2Pjnud/dSAx3HkQDHAOeK9iqn+PeSDU653WJESfokVxiEN
         KaJg==
X-Forwarded-Encrypted: i=1; AKwUvBzernx+j4zhxS6QUMDkI35V5KlSld6b/Zv6Pp/y6iI/G6GoZtNtlZ+SAVhci7R6pR+KynOiU4cEy0sC@vger.kernel.org
X-Gm-Message-State: AFuF++ncGBrFKBSm4xySz49kJJ8haie+KblqBHcG1WhLknanyA+htLZP
	nbT9fRjx3/pmSca03Hmpec1qgElil8wpgM/0N7lYoRP1gkyfnv/fw1fGTmZq2yrkt4k=
X-Gm-Gg: AYBFou1Genf3Xl38mbc8lP0iTVPGajvfPIhFAu/aSZEtVwkeFiGyr1pA++GS95aJfDt
	RRMinCLRCVQN/7BXKSdXzEp9nHTWRYpcMegGKLmFtri/t3uY/8BZWUVwDLGP1R3Df92Lhcdz0U3
	aLDy+aSjfP8qOMooX1TOLAZKH+SPCzT4r4O0JYFwXjIpjLfuIawC9h1qZlfeTcC9R5GRJ37HMxE
	pjc+gy6QeV7OciLFoyOIRTAkT4KJ2NCDfwoBxG5NfgKWLAVuSgCQxVFUB6c1G0Lvhk6NlhRpUQU
	LpjZTytebuSUuACC8boDvi9WiprwSUdo02XTpJ5uiCMssWNAX52YrHKDyQ3AxE4BzVELOd4Tr5O
	vEMe8KWsanqhzchbju/keO4LmclGzDwB3US/7kXumUfMzWizpMhyGrOaWD8llIXybZGbn5UiNRa
	RXE57X+rDtNn33AZDuNJWSxXJYIYPsxP5UIXZdXn33GuwPy8b6M5MWqPik4WQ+f4NAE12h2K7nw
	o5BUBzW5rosqNQGmIyQ7ByjTgvnB9peqfk9+LM8MHDeMonJUNykzBTd13kGaFk=
X-Received: by 2002:a05:6000:471a:b0:486:f506:2fa8 with SMTP id ffacd0b85a97d-48702ac2429mr4455498f8f.18.1789405127590;
        Mon, 14 Sep 2026 09:58:47 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.85.166])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb32e81asm29636198f8f.7.2026.09.14.09.58.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 09:58:47 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Mon, 14 Sep 2026 17:58:45 +0100
Subject: [PATCH v4 2/2] arm64: dts: exynos850: Add acpm SRAM node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-exynos850_sram-v4-2-253871de0f61@linaro.org>
References: <20260914-exynos850_sram-v4-0-253871de0f61@linaro.org>
In-Reply-To: <20260914-exynos850_sram-v4-0-253871de0f61@linaro.org>
To: Sam Protsenko <semen.protsenko@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>
Cc: Conor Dooley <conor+dt@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3

SRAM is used by the ACPM protocol to retrieve the ACPM channels
information and configuration data. Add the SRAM node.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 arch/arm64/boot/dts/exynos/exynos850.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos850.dtsi b/arch/arm64/boot/dts/exynos/exynos850.dtsi
index 911643008b9f..2128749d7647 100644
--- a/arch/arm64/boot/dts/exynos/exynos850.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos850.dtsi
@@ -176,6 +176,11 @@ soc: soc@0 {
 		#size-cells = <1>;
 		ranges = <0x0 0x0 0x0 0x20000000>;
 
+		apm_sram: sram@2039000 {
+			compatible = "samsung,exynos850-acpm-sram";
+			reg = <0x2039000 0x30000>;
+		};
+
 		chipid@10000000 {
 			compatible = "samsung,exynos850-chipid";
 			reg = <0x10000000 0x100>;

-- 
2.51.0

