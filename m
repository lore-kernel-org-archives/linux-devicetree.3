Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AED11451987
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 16:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785515450; cv=none; b=GTpjRm8L3eGpGwM1VEgH95C+P2S+uctSR08va4bDWtJokplKm956+KGTurBNgBfByQDzOHLIWtkN1CEUW9FTxiB6K2MuCBq8i/KxpDlIXNb6wWNjw3XCBG55tr4mrB3d9mpckJpsy3HpymUady0tAP49KrY45uF/TkHjHUdgUCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785515450; c=relaxed/simple;
	bh=w35lwaZM5Jhv5tWlfxuQgAkqn1ey5k+A/02M2sV6IqQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=pBPpiQTGkpgXozDcG1sasR6OexiAYZlx0nrh/0iRkZZzPGkhuuso7D71aTihmA0S0UYgJxQ0NPrPO417Vc/TkvoSR/4RcU22K2NhOQYvt7PcIXIek2nNcr7uXnCC26MHmsSZIzu21I+2WOIILNJ4KWEuN8O8HqdQpXXKp0+YMoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=Awsyaxfi; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="Awsyaxfi"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-476a130c138so1453413f8f.0
        for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 09:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1785515446; x=1786120246; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=B01D71Y0rA5zgk1TYOrIFEwTDt7QQ32kG9Mc4Wkc7Jw=;
        b=Awsyaxfi3zyDGyTgYhX0zFV86wpnDNb68K8rwbrQ5ZxVR8w54qnBlQo9UMiutEU4L5
         pHSpDfnWh8/sM0PPqq86haNWdO9zOamICgDFYJ8+xRAIi24JqN9jMWGny7LMLC/nvS4X
         TAw93zJ9wtOG85tW0Ja8bNtpqUYv+SWSbQ+WM5EDpTeCf0qJ/+4vVrriukVTgOfxYmY6
         9HtuWM9ttAAZ+MLWkfc9ow9yGMg3IbIbEHq51I+dDXtXBA+ow5NpjqWUDRx5ShWqf1IH
         NeqVOmZ1l3cYcpEEeqGtWxVob632yvDu6g15p+pQtCudal8ikYwJ3JcJa+FSZVvvKBtz
         GV8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785515446; x=1786120246;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=B01D71Y0rA5zgk1TYOrIFEwTDt7QQ32kG9Mc4Wkc7Jw=;
        b=SdMWYv5gol6499pGyIjX3tjkAQtTmtd64xTG2MbRHI4vJI0QNEHVtIS56w9yH4aDUT
         Gdc0xHmlVrG1h59i51D/nZBJ23O18bCAcwmHtq8dfaMO3oja/zlwGnSqDhCWJdYtEm+u
         mBHgJjkp2cJcAHCJUX1PYQUjIonZlu1rUDjIyR4kV8KdDyjnHwXLS1Dt+dBekd/HXH8g
         EIjM7wQNqZHEHqMDePyLRecsWNXjiKQN9L2hIZmxgba/pec4dXKz8HIRJg0ziDbSxQO/
         zzmefHsyvrK7oFiCpsZwr6eXBeY0aBzsOowglKLgCg3we7C0trjlepL4DazGc9JZf0Et
         TF5g==
X-Forwarded-Encrypted: i=1; AHgh+RoUEeO9cD8MgRTQGmGQCFwFt+/3I4qmciFDZSk8D7uO47+yUloGMrQV9kaYfiODse0nhlwmoP5NMX3L@vger.kernel.org
X-Gm-Message-State: AOJu0YzvKRoW2wfGShy9iS5KzBlr/ZtTyVBgISiPF4T4/Vr+0bB6Dfhw
	+Hp/MFDvVK2QAKj+Gc4MRqNFRNGp033ob13z+V8HQg6Khom1pRyoGqv6tsxKPiElytg=
X-Gm-Gg: AR+sD11898wbI41ER70pK0xYgd1IFpZSqolTRgdyhHsjWUcyaMTv19n7D10EyznbBhB
	GpKVFjGMidvBQWWkeOUY8IhrmLrquYQSr6MRxokQcO1W1YWbjTeRDrrVzrdTNXx5BZCzKUyFag/
	tgA+sKfTbg+SwEc5+7EUoP7L2vmH9AGbxrFFiPKOgts6KwtKzrt4c2ZvUm4W4musLd9S0Me7wPP
	i5x4NPGMMGYuqbOIzMtbiLW9u/1ruGI81uyf+68md5me+W2sRdm3/x6mP1+QoJcv9yS5Yd8Iwuq
	J0qSvFLTZ0SfC1SArG3Z7T7cSuKcjLrjfUqs0MkRB4VhCJF5xGlHJ80wBc2YUQwtn/pPu/lvtmI
	B1ZvSvjCJD5V9nr/sVjRSRvXWOknva47PSkIU3uBu3s7mOKK11KwAGt3VXf/OF+csOOPohKTSHZ
	IywSuGEtDv16JwdTAtAlbDpTXSAtDswGnKy5giLZD62bFKtEz24QpxZQm5yA==
X-Received: by 2002:a05:6000:615:b0:47f:762f:32a9 with SMTP id ffacd0b85a97d-47fd72a8f3fmr672008f8f.12.1785515445887;
        Fri, 31 Jul 2026 09:30:45 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:d00b:bc94:65a:a73d])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47fd456262bsm5900050f8f.17.2026.07.31.09.30.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 09:30:45 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH RFC/RFT 0/2] net: stmmac: Add support for Allwinner A733
 GMAC210
Date: Fri, 31 Jul 2026 18:30:25 +0200
Message-Id: <20260731-allwinner-a733-gmac-support-v1-0-d0a8732bfa82@baylibre.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKHNbGoC/yXMzwqCQBCA8VeROTe0f0iha+ADiLfosK6TTdi67
 GgF4ru31fHjg98KQolJ4FiskOjJwlPIoXcF+JsLAyH3ucEoU6rKanTj+OIQKKGrrMXh4TzKEuO
 UZtSl7XrSyuuDgSzERFd+//QzNPVp39QtXP5Dlu5Ofv7asG0fT1HmGogAAAA=
X-Change-ID: 20260731-allwinner-a733-gmac-support-163bde10c152
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Richard Cochran <richardcochran@gmail.com>, 
 Maxime Ripard <mripard@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1899; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=w35lwaZM5Jhv5tWlfxuQgAkqn1ey5k+A/02M2sV6IqQ=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBqbM2wWoLP6AQ9cI4VA8q5m/5+1cKrwSXpM2W6M
 e/cJohJsgKJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCamzNsAAKCRDm/A8cN/La
 hVL6D/4331XwVduIAIJWF+PeOpvRZZDsSD9BtI2hgcNm6X2vDunqVGtocqmr56Jkh2ndnuyheam
 AFy0FMb5r1OfNFGb4MM4mA06458dALYQ1wwTE2cJm2MfDm84tsnEs8wZE6Q+4FJfOalOsTvRJeA
 FnZq8tRRhMa8DwM+lqd8jiRwOrOWoEXqZWh/6GAufDFGT3Kdwsff+h7hBT6D2SYixP9xdOHjaMz
 hEBBm20A+US5YRsSqVpNiplu5yQcPU1yjOoSIead3uK7OW7L/fcfkYraoH+R/8OTrneEMY8l4si
 TobSWyrQJYZU2N9pASoqLqHs0YECoOJ64Ip6U2LAv0t5PzG96h9tVr0bpSUfBcaf39VwIKfA3ys
 dD2ewdOB80Uz4FmanIWRFHcQRlbLFxvcy/4DQzDjIShGbrbo5p5Wrztv0vf2phHY7lDlUtTTLwA
 Tz5u/7zqA0l3ElKWPlugOpTWx3lOmcOcuSY1kKb//Yn5oiv4omwKcMN5PYQZhy6gygtDowA0uVT
 dAcbNSws2YqesuL60imTCz0PgGcWrz3yQV717FFKg7rSdBodLwXwA9D5M0pvaccOmz+SQgzxAMg
 E+7rQnDLEnEiSIGlV+warlyT649gI9lDTHgmDPStcy0IR8EawQlVN+SMzvFSm9XG9AKMlsVxJ24
 Q1BqcpuHSlezGCQ==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

The A733 GMAC210 is a DesignWare MAC 5.20 with an Allwinner glue close to
the A523 GMAC200 already supported by dwmac-sun55i, but with a few
significant differences:

 * The glue configuration registers are a dedicated MMIO region of the
   controller instead of a syscon register.
 * That region is inside the controller reset domain, so the reset must be
   released before the configuration is written, and must not be asserted
   again afterwards or the configuration is lost.
 * The DMA channels have their own interrupt lines.
 * A PTP reference clock and an AHB reset are needed.
 * The controllers do not require a power domain (AFAIK).
 * The TX clock delay value is 5 bits wide instead of 3, split over 2
   register fields.

The DT changes for the A733 and the Cubie A7A board are not part of this
series and will be sent separately through the sunxi tree.

Tested on a Cubie A7A, RGMII with an external PHY on GMAC0.

Full disclosure: at the moment there is a problem with EEE/LPI while
testing on the Cubie A7A. If the device stays in LPI mode long enough, the
link sometimes (but not always) goes down, coming back up when the device
exits LPI mode.

I'm currently working around the problem by adding the following
properties to the PHY node:

	eee-broken-100tx;
	eee-broken-1000t;

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
Jerome Brunet (2):
      dt-bindings: net: sun8i-emac: Add A733 GMAC210 compatible
      net: stmmac: Add support for Allwinner A733 GMAC210

 .../bindings/net/allwinner,sun8i-a83t-emac.yaml    | 130 +++++++++++++++---
 drivers/net/ethernet/stmicro/stmmac/dwmac-sun55i.c | 145 ++++++++++++++++++---
 2 files changed, 242 insertions(+), 33 deletions(-)
---
base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
change-id: 20260731-allwinner-a733-gmac-support-163bde10c152

Best regards,
--  
Jerome

