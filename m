Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EC853839B5
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 12:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779713437; cv=none; b=VNAl82FB9xRlc/+uBl7zIZ2oyVOUzsOvsOXAljItd13975MDo1UDdmLO8WmnTLzi6J/bdR43WwJdqO+Q43t3f7PNUxKgbO28TEE/gFMVeuR4bmbmxjv65SDpPtyIcazliZMPwIfr1QOXieRH7VFCJmH/VDVq52cA99VKtWGlmqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779713437; c=relaxed/simple;
	bh=0Frkhb5ER+1m5KgNQbdP8ycXkPjLHDxA2xf3r2hyTAM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BLEOxG94v5uGb/31UXKqi6YyY83zq01L8HPUQaKkzLFpqM0PGIQ4Iuv6E/N1Zyo8E/I477uyt84cWuU5VQ78iXh353fCYX+viSbaax7SQOkPXPi2a1O3FIswyHLiwWxHuWHaIY+2w/kb9ADPN02bXgKLOjFCWYUljrYnMdDBvU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yIxY8eQv; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yIxY8eQv"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-49041fb8c23so25051055e9.0
        for <devicetree@vger.kernel.org>; Mon, 25 May 2026 05:50:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779713433; x=1780318233; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5TsR1mX2wHDSgzQPfx51FzMucuFNRcZzEimrpeG8plE=;
        b=yIxY8eQv1zNZpTK9cX+t+xCVFvAIkajwDUJOEOPxmSg4NUh5fd2UjGCwvS50qsx9sw
         NZykrXPFGScTThOGNFFpUHKqCxPBqzxNY9LLh6utBzoh29FLkJxqLrlPdZd3uzwl0ad/
         zUK41dZ20AXxm/ZI0nBACI149mT09fQCBXjjlFicscuO6HhmktldWp+89jsqo2XWe1im
         Zh/TPDEeeySU9DSWusWnCNmFDrVTtguPl0NvmDIFmTYRu9OxZUxuNCeVSafu9RK53VBJ
         DwfnVJ1v9tgmY0YVoMVLwy3s9w6z1/9mwop91DoydcXpaHGh0yn2LCquwXD/hmfCu+K/
         Ebyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779713433; x=1780318233;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5TsR1mX2wHDSgzQPfx51FzMucuFNRcZzEimrpeG8plE=;
        b=UvLaCgbiahIXrykbKNxizc5J8/cwUqlIGahgINmwtvk6mmRSkFn9445udPm8HSjSAK
         iEJbmw5DCmkTn48CEGPl6kzwc892O0xjLGrGX90XKjj6XnhN09rP6MIhw0xaMYvzu3EX
         1LLGq+mffhHmMHdoOQLxnp+5rEceuJxkVc9GE2dqRDChH6CLowt78j30v/Ek2SUXRyXg
         aqeR3cyUmqEzzeGnrIEg/B97Z/mP8gtXQ4upIieqgRjKghCH/BGL/s5mcNga/bsIu52f
         1pU1wdckQeFnpBPYbzAb0pGlI1111b48OAkN4h6iOuYEDq+snN3nG/+UEAatgsgzlIQP
         XDlA==
X-Forwarded-Encrypted: i=1; AFNElJ/tH2T2uWyKcGewBKxVPEzgtXff8m0QG2w8PJgQ4sQPDOvt6APQoBkrbIvH6eonC7qJ1iEP3y+UTNr2@vger.kernel.org
X-Gm-Message-State: AOJu0YzZw0xwLoyFCNRYcuIcCcxKqTnSalMMJKlLZtHrv14+sQmaT2Ho
	7ZjsQTCgm9B8qoPw2d1AHlXRyMFNDVvYayLetKFRAS/NrEmQm0iLEbKdcwZeXtxIK7k=
X-Gm-Gg: Acq92OGTZHSf2EWwpgLmtWR/lEC/fDFXofTJd80QcHM+Bzd2UUVmgqoDLzZpfajUtNp
	qvIdngAKQaolKE+7B5/xrkkKeCC/18X6nXj7Tt0DhV/opBagKu/kAZ42UBOU4gqQpSgPksIVxrt
	3d9oiH5uS/MZeYDupDdvOhf0crgTYcUSPi3Mc1CIa+Ug8B37tAzpoDlK4dkCXeCaTIhnNz5rZet
	xAgSyKs6jNk4HZXkQ6hvjcpoZtXdxC4n3M3UOxLYIWpB7AGK36XyLqRnZQWIbFDpxLIHAniFQ0o
	iUZkiP3wErrbITgxDWyBv7pgvRbcz70McDozfIwtpUYVsoNN7/cVCv+47M0nAd2Ppgw1dlTCgGC
	en6uHDw4UdLdmKITjhuokONow6wvfdUWhm+QbR+hiGIlnPQp0xRC3jHqq8+TyoxSnDhWlX5LX7F
	nOFg8Wcm8uPYcYxsynGcMAIF59Ju7IVgT3vvZRfzmT1dl3FQ1vJ7EfUFSsiSFivLQ/oWGeLF0sp
	fstPcEZBDs8Qp1kqQ==
X-Received: by 2002:a05:600c:a30d:b0:48e:5d91:cfe3 with SMTP id 5b1f17b1804b1-490424ac7bcmr173716725e9.1.1779713433180;
        Mon, 25 May 2026 05:50:33 -0700 (PDT)
Received: from ta2.c.googlers.com (231.141.38.34.bc.googleusercontent.com. [34.38.141.231])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490454cfcaesm241824825e9.4.2026.05.25.05.50.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 05:50:32 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Mon, 25 May 2026 12:50:25 +0000
Subject: [PATCH v5 5/5] arm64: defconfig: enable Exynos ACPM thermal
 support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260525-acpm-tmu-v5-5-85fde739752e@linaro.org>
References: <20260525-acpm-tmu-v5-0-85fde739752e@linaro.org>
In-Reply-To: <20260525-acpm-tmu-v5-0-85fde739752e@linaro.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: jyescas@google.com, linux-kernel@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-hardening@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779713428; l=812;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=0Frkhb5ER+1m5KgNQbdP8ycXkPjLHDxA2xf3r2hyTAM=;
 b=ysDvGnb5sGnYo8XyHtqcLtMEVBuxYqkwONOnmQLPxdEJXX+Z8JRyBK2v1SJeQkFgvjbrITrcE
 +ypUtdm16g9B+l1i2lE9lC28ZQzQWSfcXVHHHo8co3aVihoSxuORly3
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

Enable the Exynos ACPM thermal driver (CONFIG_EXYNOS_ACPM_THERMAL)
to allow temperature monitoring and thermal management on Samsung
Exynos SoCs that use the Alive Clock and Power Manager (ACPM)
protocol.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index d905a0777f93..3fe76a4c2633 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -793,6 +793,7 @@ CONFIG_BCM2711_THERMAL=m
 CONFIG_BCM2835_THERMAL=m
 CONFIG_BRCMSTB_THERMAL=m
 CONFIG_EXYNOS_THERMAL=y
+CONFIG_EXYNOS_ACPM_THERMAL=m
 CONFIG_TEGRA_SOCTHERM=m
 CONFIG_TEGRA_BPMP_THERMAL=m
 CONFIG_GENERIC_ADC_THERMAL=m

-- 
2.54.0.746.g67dd491aae-goog

