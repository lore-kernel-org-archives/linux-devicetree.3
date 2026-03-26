Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F38D13B7779
	for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 09:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774515999; cv=none; b=hUcoJMKlU7wNZC+jpEXkphFyTAokvq7SYs9r9Of1ffBAO62B8QDmChXh7/ySOFXZZuWivGaV/0Glehzv4PnBkpVYCeiHcgGy/Yg6mNRV68RU9iZ0t8c8gRRAZexnZqXbFqOr8vuVxoDLpZ2cd5m94HKEzpo7sc5JwVkKgU+j4kk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774515999; c=relaxed/simple;
	bh=SFtRV6uGPjFWwt2dvotphXcNlqN5L5KCJkqsMmHEk5E=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=kc7tYkIYTEHfWfi0339eh5OjXRBkdq/986AsR3H5aKB+JSgO9OdlVPdNt9EV/KJGw0GQ8O5nyweaUQw8B4pZSmc0Zya6pbEqkUnEXOXXWD0HfrADboNAlpxkUwwboNEvzdp0/ATGBLsFXfixPsMxzY5VH3hi34TEhKlMsyaqPSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PJJM+PHt; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PJJM+PHt"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-486fd5360d4so9235705e9.1
        for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 02:06:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774515995; x=1775120795; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1sq2P0HkEGVyLD86Q+rD29RmS9E+DZcdoWjOdX4Q/j0=;
        b=PJJM+PHtojS1pGdzhbcV5BKZd1X0fV6rGQ8/IjkrAuV7y/d9LM8pgIlNyNFx+Dz5gc
         YJ2EkQ2Vv+2bCBIAZk6qdO/PQyroGwAe3lG3HHRv+wAcj5wWPy27AvGElb4KbKQWU+OV
         SWpkf+i257oMlsqORxPgls8O7eqCGxqYEKmoDmpBBLCKh6pzy3tW7hgDgHxsLHQEMmch
         XrZbcilEPPUqvQmrJSStM8OCfNb+bT9G9HlXW2G2eFwan2ckRT/alKG7H20gO6Lou1M5
         EPCYaM6MgcfgrMFOcPATLBWnQAwIYDfJQk49FoRdOM7t9PY4dlTxRFzxxDz02lNvVlcf
         gN1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774515995; x=1775120795;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1sq2P0HkEGVyLD86Q+rD29RmS9E+DZcdoWjOdX4Q/j0=;
        b=Em3f4p5p66OJzLxz5N542HGcNcBJXvyHJHt9EkDWM4T8SxjTYwzurYTj1rRLrZbamV
         TnO0znunDfGQ6LwA6hfGDouQkXqcv2v1r9sS9SABepi6RTz1DHEPPsHm7mNqFjsAeNz5
         SWdNGTBU1Z1RfHZ//kVVYUNWY1E/LQceEuNiMfSbSx0mlUIOPCJNBFXEm2DToPULbe9x
         GsXe6VK2EHDl0yJQJDbkhmk9coTtkuFemdCZ30IPEXs0EFtUNASjPwbFQKZ6tOtjcemG
         j8+LjqvYHvxZ1ZNizBvJgZf8cgnHRuJChcHU2i4n1pszKow0G38xYlAl88X8Bg7Rpfe9
         q2NQ==
X-Forwarded-Encrypted: i=1; AJvYcCVLruZC0xbhytTA2N1yJknvba3XM8EB2pBa1dUqRZkFE+KkdRmirNASYZEyVIbkUOj9vA7pQ/h/lo2A@vger.kernel.org
X-Gm-Message-State: AOJu0YyNsokpfFmRSujtdLqVJhzJwfGOEnL1+noIXLIrFa9PyHT9W8+R
	XQz3s1tSU+chwlq4t3eTlcxriZn28nYVwTpzkJydEDzLR6ZhtFZVqhVNESZQFjBTQps=
X-Gm-Gg: ATEYQzylZGVpXg/96ey5c/pGJCSr8LEvXhnevMg2gZzYS+4/SnkdYguwDym9XR33hQo
	BsffSMEATXJaLGsWtafXMjGKdhQ3qS3FvFyvXeHGJddzHnDtTyOFHydXoGbqSLTq2hxnlp0dQp1
	WXx42kZ0OVCJF+IjDgcB7qONJiytVmw062xzX2tAO6KhH6Xkfi0G1a/RsrH8TEByw46Iht5DVM7
	Akan2g8HxG2Z+v0PGSv7ov2HgA3urpiUJ/kr5rEvPcC2JZOBoq8i8upyjtbaenf0845S/LSh0NH
	T08lF92LhhtATY4xGFonS3Nu8g1kjmC3grd0z0yet55ICklVUzmUCbP9xtce1kipj48C65P7Z9C
	Po2/XC5wBaU4KkSHkGd6pyJg/z75lgN35NC94AcBvZy3ZLY1X/FAvt6fuMxDozsvjKZI5OHYmMJ
	PIHhiMSiLoHj7rZsXHn9fCCFX7slqMxRhJfuPE6dBgsEwI
X-Received: by 2002:a05:600c:3b12:b0:485:3f1c:d887 with SMTP id 5b1f17b1804b1-4871606dc4fmr98188405e9.26.1774515994012;
        Thu, 26 Mar 2026 02:06:34 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4872090368dsm14726905e9.5.2026.03.26.02.06.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 02:06:33 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Ronald Claveau <linux-kernel-dev@aliel.fr>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260305-fix-amlt7-gic-dts-v1-1-5944415c74bf@aliel.fr>
References: <20260305-fix-amlt7-gic-dts-v1-1-5944415c74bf@aliel.fr>
Subject: Re: [PATCH] arm64: dts: amlogic: Fix GIC register ranges for
 Amlogic T7
Message-Id: <177451599311.122020.5478331004952016731.b4-ty@linaro.org>
Date: Thu, 26 Mar 2026 10:06:33 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3

Hi,

On Thu, 05 Mar 2026 23:11:25 +0100, Ronald Claveau wrote:
> This patch aims to fix the GIC register ranges for Amlogic T7 SoC family.
> 
> - Context
> Kernel log shows a warning about GIC
> [    0.000000] GIC: GICv2 detected, but range too small and irqchip.gicv2_force_probe not set
> 
> Using cat /proc/interrupts command shows GIC as GIC-0
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v7.1/arm64-dt)

[1/1] arm64: dts: amlogic: Fix GIC register ranges for Amlogic T7
      https://git.kernel.org/amlogic/c/dbb92c6f1ecd0dcd76a3d1002141f340737f55f2

These changes has been applied on the intermediate git tree [1].

The v7.1/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
for inclusion in their intermediate git branches in order to be sent to Linus during
the next merge window, or sooner if it's a set of fixes.

In the cases of fixes, those will be merged in the current release candidate
kernel and as soon they appear on the Linux master branch they will be
backported to the previous Stable and Long-Stable kernels [2].

The intermediate git branches are merged daily in the linux-next tree [3],
people are encouraged testing these pre-release kernels and report issues on the
relevant mailing-lists.

If problems are discovered on those changes, please submit a signed-off-by revert
patch followed by a corrective changeset.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git
[2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git
[3] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git

-- 
Neil

