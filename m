Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57FF5346A0D
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 14:01:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787234485; cv=none; b=UDPac2NDaxsHtlFxsIoR4lLimAs8a5KLSTGrCoLLZ/YmON7DxLSp3tQrOVzi5MN74fpLNCZ/W/JI+Y6AEzAL7Sq3NcPfwpBxR5b38ihyPJRp0QAb2W+/mphUz7Axw7u/G3aw/pKv9X5+LwshCDtBK9RmB/m/nhBjNpD/2AKdubA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787234485; c=relaxed/simple;
	bh=A2VFtAAu1+hhr925EcEt3otzqbqApHxmFMxqu1c6scg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ZaSbfVSTkCWcPpJ+SisJ37VZqW8Jgk+xq5RC1cIUuRssuoiUQY3/B5SVuI5nxbQBnw3hIpfuWTfzKW/HvJAeOnEwFA4rUKgVeV/jyNnHvf0dIRe/j+e4zSSxo09BaoZIyIPVdJFYPOMdU02FDHH/xOcfod1DT2SJLErn7RqWB3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iGbzID4y; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iGbzID4y"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-499b2981a7bso9366015e9.3
        for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 07:01:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787234482; x=1787839282; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=WUT4gJuTXpaAq3LMxd9C40AoVdjqOX0m7pjXnk2O4Gs=;
        b=iGbzID4y9UnV6SaMLjmwE00ABEnaNQJ/5S32bOvxOJ4b24in6PFxZj2eyB4B4Oxv0d
         mSKs9REEtqsMsW695tnXZv7MiJpdqKwDk7bh5jOuypCfkLbvt7GYlQ5RjK9efYk/o0+D
         grIKeiZr/MLoXwzTgxrE7XgTrHS5S9s92ZaZED55NbswO7v0SCvX9p3Uj+GVhJcWFClO
         cIhuDAqcmcLap4Dpl3VILsw62uyJoWx+07tGTPSOAtCSAweisQP/92GMMkw/EujWbdnN
         r+RvkNVjVKeVuGBKEsrTO5USbriVcmsiYAaYYENHFOFKhEPWeu3NcNiDmh0UbAXgzNMw
         RcZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787234482; x=1787839282;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WUT4gJuTXpaAq3LMxd9C40AoVdjqOX0m7pjXnk2O4Gs=;
        b=ppqxto2aPkM12+4Cww83gZlRvDbSoLjvZQ2krCJ4tZjCdOL6LX2CCrjjYLXiXV6LCf
         6crYMJmsI5JLgnnr6oHUQ+mImBNTbUZ9wK7r0CuxpqVmilRloN/t3tw+l0sLH0aV0Bm8
         QUBDq04xyg4jEIUgDVbeVXGQxd1XSoVCVpxtFHa1Gd6xR3e6JfH2bD49pLxwKz0Anq90
         wsMIRM0Df3xuyOoCPwFEKrpmrwL81zM5GYdG8NX74CnyuTFcxd9nwfJqBcTAb4nHhyWB
         m6d6VyLpQW6jp8nm+3uBE3EYz/zWWovPqW8tOR1i1HCUwlnMQlywqFeUyuLBVb85cduN
         sfmg==
X-Forwarded-Encrypted: i=1; AHgh+RpuuyZJ4vs9+HIB3DtrnJvJZvX3eDSCKSAWEru5lpaOB4qsjXpFPGZIN6k1swcSLzDKAkmtphVTcJ6/@vger.kernel.org
X-Gm-Message-State: AOJu0YyfaNOEgylVCAiJhb1KPYHbKB1dRiX3CB2iV41zQR9XfpTSn/vw
	nprrucHBNr7u8EWWkTjW7xyDI3XI3RO7ugyii/gy4/O3ZjHIJFstRjnXL2/xik47
X-Gm-Gg: AR+sD13nL5ujgQP5UviSnVA9e/kR2LPFhWIj/4es1S6+PInPxojuzXPrR/fk5V+J0Ax
	lHUTZ23m4XU/PjVgaIHsB2VRSbk7DnY/w29jGSxg2m+SC/5q5O7Y2GEOrcd9HjMMUhk/GKv8fqy
	9EPFjNnWmegmR70cpcCAzTFFGgjNmo4kcH4UfCGW4BHr8OsSprHKv90KC2fI5jwKcL2iSMP31mc
	HgjxxdHOLxzyz1dnbekMBuMOw820R1N9A1ejTqEXsrB9bfpVTUd0/bhlgJZsTQOdfb2A1qh1gmu
	CFp4piBI9INgduEAK0wNrwoOLxsRUEa8RHGh3fwT7uosCRQz038sYX4fyanjt8Gm1uz6KKftogQ
	tKuy6OszUR18AYpvlu1i6K7uRJK0eY3XjmHREOfZNGlz0BrCCnuF3LA4qFqomzsYTvLbII2C54E
	JwTgmLMSIdOu1dTs4PKkZ/ojLKk7+Awc/vbASYUmyLEJkGR/KjR/6AyN/RP1VSmR1/1Jxhjgo29
	TqeScHcQWDBUz43mWAjPZ+xlbsoDjdWoip3g8OZaxvOtH6ync3SiTL8bg==
X-Received: by 2002:a05:600c:1d06:b0:498:943:ccc0 with SMTP id 5b1f17b1804b1-499aa1a8726mr195609195e9.6.1787234482269;
        Thu, 20 Aug 2026 07:01:22 -0700 (PDT)
Received: from [127.0.1.1] (lmontsouris-656-1-83-121.w82-127.abo.wanadoo.fr. [82.127.110.121])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499aa0e473dsm137978275e9.15.2026.08.20.07.01.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 07:01:21 -0700 (PDT)
From: Amin Gattout <amin.gattout@gmail.com>
Subject: [PATCH 0/4] phy: rockchip: add support for the RK3576 MIPI CSI-2
 DPHYs
Date: Thu, 20 Aug 2026 16:01:07 +0200
Message-Id: <20260820-rk3576-dphy-v1-0-70e25e8d5e78@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKMIh2oC/yXMTQ5AMBBA4avIrDVp669cRSyowZAgLUIad1csv
 8V7DiwaQgtF4MDgQZaW2UOEAeihnntk1HqD5DLlSuTMTFGSpaxdh4vJiMedipUUSQO+WA12dH6
 3svpt92ZEvb0LuO8HXXyln28AAAA=
X-Change-ID: 20260819-rk3576-dphy-2304f848215b
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>
Cc: Michael Riesch <michael.riesch@collabora.com>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-phy@lists.infradead.org, Amin Gattout <amin.gattout@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787234481; l=1144;
 i=amin.gattout@gmail.com; s=20260818; h=from:subject:message-id;
 bh=A2VFtAAu1+hhr925EcEt3otzqbqApHxmFMxqu1c6scg=;
 b=p6MTPqtWbWzGbCNQJGHAQWd3iNaXx9MMd+sTatZJKw+3c3Axcd4gzRri2JGsHa6YnJQDcHV/q
 mzW3yvAtTlcBY7O0NfD4aO+MjBLxC0z0JjUltOKdGQOQIulnEbBk3wB
X-Developer-Key: i=amin.gattout@gmail.com; a=ed25519;
 pk=MSIqDPkCOkwtyP8Fns1m+KFU9SgqoDl2mpLe18vL+hQ=

Hi all,

The Rockchip RK3576 features two MIPI CSI-2 DPHYs. The CSI-2 DPHYs can be
supported using the existing phy-rockchip-inno-csidphy driver.

This patch series adds support for this variant.

As you may have guessed, this is part of the efforts to bring the
support for the RK3576 camera pipeline (VICAP) mainline.

Looking forward to your comments!

---
Amin Gattout (4):
      dt-bindings: soc: rockchip: add rk3576 csidphy grf syscon
      dt-bindings: phy: rockchip-inno-csi-dphy: add rk3576 variant
      phy: rockchip: phy-rockchip-inno-csidphy: add support for rk3576 variant
      arm64: dts: rockchip: add csi dphy nodes to rk3576

 .../bindings/phy/rockchip-inno-csi-dphy.yaml       |  2 ++
 .../devicetree/bindings/soc/rockchip/grf.yaml      |  1 +
 arch/arm64/boot/dts/rockchip/rk3576.dtsi           | 34 ++++++++++++++++++++++
 drivers/phy/rockchip/phy-rockchip-inno-csidphy.c   | 22 ++++++++++++++
 4 files changed, 59 insertions(+)
---
base-commit: bd5f485f3f026225b86573e559af0b7254ef4184
change-id: 20260819-rk3576-dphy-2304f848215b

Best regards,
--  
Amin Gattout <amin.gattout@gmail.com>

