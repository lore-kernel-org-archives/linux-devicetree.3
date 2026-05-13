Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B395E42847C
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 12:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778675845; cv=none; b=VBuu8NN5IqtNXNTBzfigYr9nZDfgwEtwuOVIHQbF7HyDJhxtSixF7T79BPg6mO1r6Z+BCV9Q2Kf1DSq38YmYaCr7y3+h6Wh6xcYtFlQI7ePlHFFG9a2i4EuJdbfbkLIdec88X116FZy7MpCGYaCPBPmr+46npN7Wec8K26zHZnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778675845; c=relaxed/simple;
	bh=2Hl09FruWGr6pjACeuq5DjMb5si4CPaD6fjJlZmzP28=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FGE4dlUGlP3ZzsWQ0uMojt9yJ2hSgh6GgW8srIqA9TarekPfQRcLN9VuKI7g7yJZqWoGrq65Ekr1LpngUZjsRJMD+3UUtY05w6jOAvibkIAeclWMtHm/xSnY+T4ONWWWWbyq9dLvjpyIodmkxNWeLs5pGJ8ycG0zc9lScs/0v30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sHCKKF+C; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sHCKKF+C"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-44c4cc7c1cfso5530101f8f.0
        for <devicetree@vger.kernel.org>; Wed, 13 May 2026 05:37:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778675842; x=1779280642; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fYtiwDmtrVbl/hGmqfQch4eP6KggQ9xHSeI/NuJ3fwM=;
        b=sHCKKF+CnBeOZU4CM4myHpo3qOcyrTUnKID4fu9N8Fs9OosM0tLLyRZAmOrEr0Yurd
         +n2q4ZQ8Fw79aDTDymyZXM6ihIbVsINGOWw5vnSLipjPBlSxpZrfH0E5hhAVs0Au1c/2
         NIhmMi5gR2974Ig+07p8yTflS87Xt6GEHGLSkDHVozJiFjPrrvaBOHHKXpViSXd3lfqF
         6A/BUP2vAtQhjvnNesfpnTP1NVlS2Aj7BJbKEZzDxgpjYw61Lr3x9iaTkQku/yXinqoo
         C1n0DW51CalgKSA7TjgcHhemWl3m6+JsA5Ac94LeWxanlFK9V1DfbcT0ZTftYYd6rGdV
         +71w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778675842; x=1779280642;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fYtiwDmtrVbl/hGmqfQch4eP6KggQ9xHSeI/NuJ3fwM=;
        b=WWjfnUoTYypkIEbqUSwKYIoB71LoVTseQxbjtJ7wA4juIzxQUvo1Cv0oRAop91rgxt
         e+UD0VKSlqI9Wsz3yamPTUyeSnslGSuYPoGxNLnh25GURjlqYnuyE4cFCu8qi244cGdE
         0+JCVYs0L18rUzAVYXlz71SBWR4gAJzWzmO82AX9cqdaWDN2Kl40CNpd6/LEOy32nd5g
         HrXj7fvIA+vz+ypZxty4CIyvRveLKU3gxC39l6Z5McDMKGZ/DkH4JYrsmGGD/Rd4vlZ4
         OfJWn2JrxaTwwPsMxWEt1HEOzXet9uVz4tZMEAhgz3PozAtJedGyUBl2kkfJrSynEKQD
         HikQ==
X-Forwarded-Encrypted: i=1; AFNElJ99R0sxmkLBHhVeIiOI1l68RmmUFPFt3fyTf6ZEYjU2GtsZD6cJ+2XvoumOQwmMJXblirfGje+VqGU6@vger.kernel.org
X-Gm-Message-State: AOJu0YzmnUmhXl2fLIaHdHEp+ZVMRcsaKZgRO/rwiJAsZ4Ll7Rp6jqas
	X4eGmtQ2BBPBsWp5o1EwynhMyu4Zix3IBA6z0BgdmcfsMuwr6qY+oJg5g/ojxD7XX6U=
X-Gm-Gg: Acq92OHvLgEDIreLi55t0M0mGCIoZrd0CXa+jZ4Tt9oTU17h+4azCGswgJyD4Ki0V3M
	IsFYXSYLEdUOQs9rj7m/mrp39i3LAJS3zeIEn1RvNWJzFbkNW+ESpBDcUAkq5C3RkDXS6Td4t/2
	W6we00gnZwVrAhBRwewqwewXze6f861ubGCw9qrGFSnw++rAo9GHUM9Nb25HnBTIwj9B16g03jh
	SRF32e3nsfmZj7Q82A/uAh8fVM2661qmMQqz9jtxHPk9pdNO1xOyxqOCRlT0s/ubuh+bjTXjlqk
	vBuNw8SW6PlTpFcZ/8oDJQN+nH4GFIM2dyYkYq0vqrIn5YtlscUFeVSzxJuPbD+dhSFR7i+f1qw
	ZBY4QFNasdwT0bBWzdl7GDPlF3Avh4Zjk/P7ln6F5x4IvtEXvOdeeqtozT0DFVjU/P7r4l7EPnz
	veu2P/KalScBzV8QfA9RmpC+xu5HsupTMgSVziG0I5py/oGyIjQxXhWttnq79PF41HGzR8qyzGe
	fEQBaGiMp/+uru3
X-Received: by 2002:a5d:5f90:0:b0:43f:e94a:e773 with SMTP id ffacd0b85a97d-45c79f297e9mr4410874f8f.27.1778675842151;
        Wed, 13 May 2026 05:37:22 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.195.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4548e4bb87bsm38899725f8f.2.2026.05.13.05.37.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 05:37:21 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Wed, 13 May 2026 13:37:17 +0100
Subject: [PATCH v4 5/6] MAINTAINERS: add Exynos850 PMU entry
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-exynos850-cpuhotplug-v4-5-54fec5f65362@linaro.org>
References: <20260513-exynos850-cpuhotplug-v4-0-54fec5f65362@linaro.org>
In-Reply-To: <20260513-exynos850-cpuhotplug-v4-0-54fec5f65362@linaro.org>
To: Sam Protsenko <semen.protsenko@linaro.org>, 
 linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Henrik Grimler <henrik@grimler.se>, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3

Add Exynos850 PMU entry describing new file
drivers/soc/samsung/exynos850-pmu.c.
Add myself as M there since I contributed Exynos850
PMU support and intend to maintain that.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 498ca30a00c5..60c25fed8ffa 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23645,6 +23645,13 @@ F:	arch/arm64/boot/dts/exynos/exynos2200*
 F:	drivers/clk/samsung/clk-exynos2200.c
 F:	include/dt-bindings/clock/samsung,exynos2200-cmu.h
 
+SAMSUNG EXYNOS850 PMU SUPPORT
+M:	Alexey Klimov <alexey.klimov@linaro.org>
+L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
+L:	linux-samsung-soc@vger.kernel.org
+S:	Maintained
+F:	drivers/soc/samsung/exynos850-pmu.c
+
 SAMSUNG EXYNOS850 SoC SUPPORT
 M:	Sam Protsenko <semen.protsenko@linaro.org>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)

-- 
2.51.0

