Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11CFF35F5E7
	for <devicetree@vger.kernel.org>; Wed,  6 May 2026 21:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778102670; cv=none; b=DTouQ8TN6MZcnuT+AT23HRJ8A3Eod/Sf1uKRH/RvDD+9M86qgA/+jYJQGBGM3oX4h9j8sX1742R44KauuKlXA/62Syu9GeIupxe492zJF3PGrrC5fS0JFyV8XZoTdv6Xdx9nBEf1tJxbRpfP7KZhlsaMf+UjHs2MUYt86dYlb94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778102670; c=relaxed/simple;
	bh=LYkVKahq53YapfUpu0qbpOHikxCfXJwIJbTvq43xNhY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=gGjZSnwrSg/ebxVsa3enUAdVV1TBJYAufSOxWP+ZsckRQ5j3XnaDg0GUgT7pfVaVnc0y4bG4eBYQp0diiz55PisRBk+o48LZv6RsIP7i2fUkHi+5rScaAnwZZRnfrdplnU1GHgYiQ8ZCd8w18UbFbMiqTP0X/idL4GUzlMwMels=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b=wBLWbCBx; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b="wBLWbCBx"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-82faf871346so49561b3a.0
        for <devicetree@vger.kernel.org>; Wed, 06 May 2026 14:24:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1778102668; x=1778707468; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5HjpaqU+mw9KsrlzGy2BBS92EqahjZUD+cu7IARQAvw=;
        b=wBLWbCBxbq/pGPUTDjdGrpvbV08QPAuK54dnliOtOzJJUIM1oiN/+/D5L/EjfehVuS
         zkedGEZIxx6PVEkbPSP2SCIzHG6kfQ/G4uhwmjcBUbXt7YN8kdOx+4SZR1xPAznT8orL
         +kYyxA0wtS2mwPNYYRfsDd1r8t9zTSRjqhKvA2b6RpcOVJ2FkoVvyEKkU3QfCkJz6AaA
         bG0mVrsSvg+DYgWYpO86h3OTKzC+Rtu1cUYGv8uOume4IrwyIpqwqIVHc1ttyQWgG3xE
         2ZsL5uZ2ePnKY68CjKxFhIqwaPIDjpjj/jxJvBHIu4sKJcDzmpfJZmHlE6iDbZSaF9mI
         rkgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778102668; x=1778707468;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5HjpaqU+mw9KsrlzGy2BBS92EqahjZUD+cu7IARQAvw=;
        b=djtrZjlaA72Xy79DM+i1ms9QWkm90xJCVez2GzcWd2UY87XLoctKRhUFO3cFjZxFKH
         cmFHTZH5cTdy/1Jfe0E8ROUlTuze/55ZMS73aoV2d4QMFpI6UAGjBknEvokjWpjCXlyt
         u2Gx3nE+AANeZZF4d/orllWLSsGi0bPIrmgTgnNlfpr2IjSONE1Qe3DmsoxiEeot4/N5
         UwFTpCEyaf60ffU3ItXVSjbiCPdS7WN8OH26sr6B93+qANaAVPcoGn5lvsURNn+wsCG6
         uM1HH6yhSnYYVkuIX+LMzHB+/T8U7U/1cWgO1y5F6Kc5xl40HYEB5+TerX6EL3mwkTMd
         6A6w==
X-Forwarded-Encrypted: i=1; AFNElJ+yQz4+Xu9nXKMVqwiYAop9rR1viKyuJNQW93YSZBx+3voZsLaZNHDTFoudBMU54Gtebwq8VPqO5n0d@vger.kernel.org
X-Gm-Message-State: AOJu0YzJUnAHlafx4Hw13tLgUyA9MLQzGFhfl1/66R3H5zpL7AAr4tO7
	5q4Y3mQtwnwC8iPS3Snw3vkzSON7G1Hp+E9Po5KgwOxPiDjYaqSNGU5wNAh9YO3Q0MA=
X-Gm-Gg: AeBDievSw5er6IVp/RTpMIBdTz96WiaEjTcWpwMr894m8aBj6pxU+yLz9JfwUbgjice
	w5KxrRDzxGuM57q2RDRikuK5EJASdfevULlupN/5iZenzG9VFxKMS67V+c6dd31JaogdeRqA0FU
	G55yN7OSqrRuFDhPgggO9NVcYMljjf/46aa7TgQrnBN7VbbpGlSwyAXop2E9eWCpPn08WHN1C8g
	6Js0ynqiof5vrUU7o3DwUIcSCCpy7qmJWVtEKVhus2vVyyczCIxb+Uje3jCS7L0BTBHVWIIRMZP
	PRs5MOTbPyWULHupM5ieaYZDdPvr2mVGWql91bDTaaO5VZNvvUtWrKltCwntn1vR2VItBDfcHEm
	sjwoyIq1gC9LZIy6LimBbR3Vee4Nhhvg67ajicVACvfP2rHiv/Z5R/cys6eiD75o+drU0+hy6gp
	cXsMhbJjQVH5vckLBlwbPRyqs7BVpmcg==
X-Received: by 2002:a05:6a00:6de7:b0:835:443e:4bc7 with SMTP id d2e1a72fcca58-83a5c0c483fmr5052149b3a.13.1778102668521;
        Wed, 06 May 2026 14:24:28 -0700 (PDT)
Received: from localhost ([97.126.187.42])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-839659498f1sm8113521b3a.17.2026.05.06.14.24.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 14:24:28 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Roger Quadros <rogerq@kernel.org>, 
 Tony Lindgren <tony@atomide.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Christopher Obbard <christopher.obbard@linaro.org>
Cc: linux-omap@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Ettore Chimenti <ettore.chimenti@linaro.org>, 
 Andrew Goodbody <andrew.goodbody@linaro.org>
In-Reply-To: <20260502-wip-obbardc-omap-dm8168-evm-stdout-path-v1-1-d1e69c295c21@linaro.org>
References: <20260502-wip-obbardc-omap-dm8168-evm-stdout-path-v1-1-d1e69c295c21@linaro.org>
Subject: Re: [PATCH] ARM: dts: dm8168-evm: Set stdout-path to uart3
Message-Id: <177810266773.238543.5630091098339148154.b4-ty@b4>
Date: Wed, 06 May 2026 14:24:27 -0700
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2


On Sat, 02 May 2026 03:13:18 +0100, Christopher Obbard wrote:
> Specify the board's default console UART by setting chosen/stdout-path
> to uart3, so that early console output and /dev/console map to the
> expected serial port by default.

Applied, thanks!

[1/1] ARM: dts: dm8168-evm: Set stdout-path to uart3
      commit: b6aefeea7b4aa9158c1dcec8c050a678af7bf9b0

Best regards,
-- 
Kevin Hilman (TI) <khilman@baylibre.com>

