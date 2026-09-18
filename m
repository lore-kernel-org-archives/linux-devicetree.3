Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EC15515983
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 17:32:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789752784; cv=none; b=cir0X/b/VJqv5GVPoFjztdAjPxC5IAJ7DUSrLmQR8nFL+XszMQZTQrC6B3Y6YZfGSlalA8dQhJeHITiuY9QIKQw4Pc0f5ACdREjIwPd7w6IdArYWQw86uP4l3GZcVUFM7hbDdqoJG+6Dnta2DKnI95ijL1Vsz+GuP0vsBxyFYdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789752784; c=relaxed/simple;
	bh=BbX8RY98cbW2glkwb44ypYKnRm3un42mGYq+Qy76YHQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VMudjK9kBMRSISsBH/AydbLnnnXqCAFq+nMpDhHhW6nJ+n/4o8lNsS7HhXX/0GlC3PDUK9Ba2FrjufwXgeM+4GLMqyAx70F4r0uC3p8hEUGEIC/2/qJ9HwF6D3oiJLf09ECtfHMyoruU6mIWnyLOM9sFZVV51wTM/6lYnDYZspQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=y2ChOQ+A; arc=none smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="y2ChOQ+A"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f13d77so1154820e87.0
        for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 10:32:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789752776; x=1790357576; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=huJxWlT708nmfTDdQjHUmTyeWJoEnSNCINl2pfaGmoo=;
        b=y2ChOQ+AY9RtVgYmjjKnALppolchZAwSFw3WhQfCiRaKb6kAgHsMj4Y1EDN3ERhCFG
         Ef6C4Ezr71iykpTxmzzm+oxU9XNInHtUSP3Yd+3WEoZhC/B58+Hua1G/q4BXY18+etEX
         pECH1ph74m15GanTmaNpelLj+mDiRYpzXORCnspI5RvvesHF9Y0AoOVUA403qPgpAt9o
         7RidKx80IQmmLsKhGDo+lfet8eTbmaIkLk792JA+qrZ8BlH3ed9dOaYmdRkGOiMGikfQ
         uKeqVW1mS/Zohvbv04iOEYbgD/zf/EhX6iLJfEqVkSpH0AZRciZzrdQm5P626YR3o6xj
         VmhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789752776; x=1790357576;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=huJxWlT708nmfTDdQjHUmTyeWJoEnSNCINl2pfaGmoo=;
        b=WTg5/+7fT8ZDr40Ri01aDqVC6/yNuA+J7vkgbIrb4sAX627sjXwUW0E1QKtuJnr4zz
         SdNTAEPKXDBE9Omv6GnlCvvQBIag/xMBc6HAJg6e2Jlr7zrOdk88a9/nwRa+WXdgFRJl
         oSIgyohG63t9xsbfLpCcbkKtaCk9eTI16q66gRMHJgqX1IZScbesFR0e8JnNvT02tWLY
         P1kWU4t9+v4tJnK3lQvit2YIREDUhyh40xyq7RnzF9OpxToVpfMNWYTEtQbGUs1qmCCi
         ZEcVEv5RAFDOneyeVdUwhqa8a7LovM6c0znoRi5gFiSTnxtjqNkpB9tdOoGTPLarniOv
         9sGw==
X-Gm-Message-State: AFuF++mgL3XRWFSiByaOnFg1x2Rv4G11fKruJasuzF/LPXSX8B+6GZiP
	/l5QsOi9jUy1Qk3HVPmocJDlUFhM31XI6bjdPbJDj5Abt0fsNBClS4/UflMQda6V12Tfe8KWlb8
	n6ZzLFv8=
X-Gm-Gg: AYBFou03JGzv1TT1TENmMFjJ3KFS+HOHV+cwrevw/kC/qEcVh/Lkx4+KU83V8w0M3ew
	ZCPky7cC0CUG2KT4UxiJCmVT66eHASr+O33RjzDlGc5zEM3BYm9w4SoMMBKN/x3vgmHqLnWysKN
	0da6ME7u4zC1ui+L/4R1fj9RDag0QtJ9TfWZtUjjVhJX2HGhPlERfyX1BkdSmgL9e+ejEa4EWD2
	LV3fiHYBjTSjQBL9dqqN/2vbQZGkH6bINukGmtIH7Z85p2asCSVSVE8DiEnpf4Z2rXF4Yi81QKc
	ofPmlT08N3XZHHualC9ckZZjYbWwuLTapQnitHo7Jg6FHEN4eaGB+UKJ9ohKXjG3jMl/EMm3Jo0
	hBJ9+HtcYBNHb8duoUetoCrpEuTc3/8+JpKM7V9jJbA2yUnfPooQ75sQXNRu8CBZ4OGSBnqbxb+
	ic17NDWpJtBEJxaAyVwHDq/IQ7vYAFqDakjPPMQm03211XYRAaz2A1/kjnl0k5SUEgu4DrA3MfR
	GtrqsyquyG9TRaqUzfIFQrvx40sKo8CQBFhGbXSiK4aWv3zyGaRaV0QNvOcKTjCjg==
X-Received: by 2002:a17:907:1c91:b0:c29:386c:58f2 with SMTP id a640c23a62f3a-c2a15e1ff48mr321275466b.38.1789752412145;
        Fri, 18 Sep 2026 10:26:52 -0700 (PDT)
Received: from petegriffin.c.googlers.com (116.118.90.34.bc.googleusercontent.com. [34.90.118.116])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a35701d8bsm902966b.27.2026.09.18.10.26.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 10:26:51 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 18 Sep 2026 17:26:37 +0000
Subject: [PATCH v3 4/4] arm64: defconfig: enable Tensor G5 SoC family
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-contrib-pg-pixel10-initial-dts-v3-4-c94e51140509@linaro.org>
References: <20260918-contrib-pg-pixel10-initial-dts-v3-0-c94e51140509@linaro.org>
In-Reply-To: <20260918-contrib-pg-pixel10-initial-dts-v3-0-c94e51140509@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, Arnd Bergmann <arnd@arndb.de>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Linus Walleij <linusw@kernel.org>, Drew Fustini <fustini@kernel.org>, 
 Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 soc@lists.linux.dev, Douglas Anderson <dianders@chromium.org>, 
 Juan Yescas <jyescas@google.com>, RD Babiera <rdbabiera@google.com>, 
 Brian Norris <briannorris@google.com>, 
 William McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-serial@vger.kernel.org, Peter Griffin <peter.griffin@linaro.org>, 
 Brian Norris <briannorris@chromium.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=787;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=BbX8RY98cbW2glkwb44ypYKnRm3un42mGYq+Qy76YHQ=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBqrXRYGuQ5/L4khzKLHRvREUl1l+2lwJGoJSQiY
 SGyFcbuWBCJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCaq10WAAKCRDO6LjWAjRy
 utArD/9uj3S4/40eqQyAQNg2mrd8YRRLVD2a+iFnXlDd04AKI6CyH9Aw39xkFrcjJfJ4hkBGr+C
 bq8pFZNwJu3DH6NN/ZgNqnsiuxemOfw/aUIO1dpSTeW6BvQla9JT3YBduKlaAStNeV9HLWE0cdK
 FGDB8mVSVVJ0j/jYlX3BOmNAium/Ewfw9PI0ALpuXmOJ60HZabfOMYnun2JV43MuRmmJx+smUde
 15IsHXU6GQ15cwQFp56h5tCUisTYD31g39lmK7iD0Qpwd6BC7U3SEFO1LiorExYEECyq9C7h+Mm
 ATP1VxNycE8kVWDXVD5BlcWBgeQeyqFLUcp0wexvmyoxLICWQGWrCCnipjciOVlKfY4Tc6OyEbG
 vrlzf1SPtQJMDhH9y26QfsrMaVvnVHHdMrhtrFblU/rHj/mP0MkdHSSktmN0M2Zw/iXgUpfbzBb
 Sgiz3ymLwkb57NgSqWh4ZEmseH5HGA1gI/D7/tMq3a35ZQZsASN2N8vyisAjaCNPSih+SmS0mfT
 RnVnZKuvriyPYy0oGMaosjltQVaBzFjx9Ok1WALSvawKVkVkIzo6Du0GkfXaO6QcdiwsAHRhkz8
 8q31d2t0PWWn05xdNQ7eM6h+2MYYbGKpYmzkwJcNXA6ObhSV2vGM73rn7RO/wrqM0hT1uhF5d2E
 A+fovbmpX/pet2g==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA

Enable the Google Tensor G5 (Laguna) SoC family in the arm64
defconfig. This SoC family is found in Pixel 10 and later phones.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Brian Norris <briannorris@chromium.org>
Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 982ea1758eb66..75000c12ead03 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -51,6 +51,7 @@ CONFIG_ARCH_BLAIZE=y
 CONFIG_ARCH_BST=y
 CONFIG_ARCH_CIX=y
 CONFIG_ARCH_EXYNOS=y
+CONFIG_ARCH_GOOGLE=y
 CONFIG_ARCH_K3=y
 CONFIG_ARCH_LG1K=y
 CONFIG_ARCH_HISI=y

-- 
2.55.0.1082.g2b9226bbc0-goog

