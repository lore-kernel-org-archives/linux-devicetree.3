Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62D2D3D5C1D
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 09:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784884583; cv=none; b=SZvLVygVb7UvVdrpNxB3hxXRKl6fuLrb+nDU56jPHAGo67PEMOtEdOklZQc/vBsdxisGHrAardTwCHkrXk031HFgGT4zSwWlPBHKFLGyviDs0XRg8sjwlD+rf8EkSUYJnyXAR7BI7Wj/2Irwcx9qoQq0TSMpQ07QCwoopDT6G6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784884583; c=relaxed/simple;
	bh=teMAPguyylPaCMYb5vDXceBt5uTOrTz7cewNFhv91cI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=tmV2NoQo6qe4cUhnfWPB1o4Ph9mliOTJC/1ZOEodrhkDfUyC738W1VnoI8oj28Tcgq2/kqrPO4+yKsdM5jOjrH+yZT75cOrLAYZC8udT/Bv0ZZLVcxT/SwVxLBgN20ZkfAriJRO9mhRcTtZOJbt5DHr36y8vv7HoNFSNHHYBtZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X0RXY89s; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X0RXY89s"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2cf110997efso556395ad.2
        for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 02:16:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784884582; x=1785489382; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=SlKvVsAZdZyNcMm228zHcviyjmOcHXNmz+JngmFmwiE=;
        b=X0RXY89sHfMshCrLv/pEb7lHmfhU83DxfdOY6kDu0EL+Nj7N5vgaRGWsZ6pmatxwsu
         KC9eBDy5Z8BE9tDTDeDTpR0GqVEs/FJeWUK611ood5aX02eKSRXwqu/iOHn7FakeIJqo
         vySSxo3173kKrJPzjrd/mY9M+cIMSH7Nf7u0OrP/VCEWXQ0upszCj5tyEMNhH7jdxcNV
         rdkYL+cqA149CUJrl4zLf+7UciEkb0twzdlvWwKj1AfvWZjiR2icGy/lFNMVc9sv42ye
         Gej8j8rRLkwLmKAGD/szAmD3JJGjY4xpCQlPY2SxdkYwrdq2s5HgtP65h9JhirIc5Imm
         hxNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784884582; x=1785489382;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=SlKvVsAZdZyNcMm228zHcviyjmOcHXNmz+JngmFmwiE=;
        b=J408M2Ju38rD0vgyETePGvn0kAlpBIuXKIEC4BO85i2t0DJj70Je4e8MEeBiZgm9bC
         A2eEr2kOCjap5dIh6cUJy98Wk7TRSkv0+DG9gQds/cUsFDA2gGcGgtYIBKLUl8VmtZc6
         N2EHK6+btEB8nFonv2sa2bLZ0oytNXFwMdtheUob4xQ0YmUx1flG4jWw25IC917pfRII
         f08YXyo0/zmu9shPYna+TMRQJVSNp62DFscCQ7CeYLDe+VOBemXbq1bGlsPUnXNjyvDz
         oMYSeYD7WoLPAl4HGpWTT7ge3qS6dfTLe9PYBCwNBSpz6vXUv9QD3fGchj2yxEgRl/BL
         krkg==
X-Forwarded-Encrypted: i=1; AHgh+RplDTg7BvCCOqIRPO+dQbSj80g7PRssB+atgWQ0CQ+wnkj6GrJWRzFqrpKdk+l5Gq5XjB6BhoUZHGKw@vger.kernel.org
X-Gm-Message-State: AOJu0YwYkU+x0WMBbUMx8f7xdnq7cOXUIWFA0FtUPoSC6Zc3ADCEFOHL
	ioBFC8iqcVZxH1TKmk5S+HDVl5nPKuFa3Va7V3Y7raJQ2iB0PAIQWovq
X-Gm-Gg: AR+sD12glqdZB8ldDh+mCVP7bm2zYiZKQdXvdAlgfYBNO1fOwA8+J9EaDmdPVyLXB3D
	rm1MBr4B6MxOqUQLt/clXKffnfJYxG8gI+10wwX7hCq8l0Tnx+DP/i7VWbYrBxrFklEGszL6e1M
	UEDl13bCypHmECqAqt9984/LwcqFzXNuvi9iOoAoAZlj1NJfdhYiMnHDOLU7jAUGQtriWHc1UE7
	+pCrMi1D0eytgE+BCE6YFOAcXECCDIm+WrgTt5rE9uO0tCkQY/u1cHcAxTkCKOxEziuJiORtQtB
	cz3gJp0RYmdsjwN3c9uW6PM5iUKEqllkT02vUbYVyBx84Zwpw7xlbg7HKIQLIBYtuQ6V55u61mk
	gyb9ifNFLg6LFE/cKwHubhqmC6U9yi7GBl4PIZoLPGh1Jc+1y2SY/ob6TTQ9gE8uZu1sIgQOI8X
	tSCT8GuVir3R7iBzE=
X-Received: by 2002:a17:903:124c:b0:2cc:e648:7e0c with SMTP id d9443c01a7336-2cfa6f8c2ffmr56582265ad.7.1784884581649;
        Fri, 24 Jul 2026 02:16:21 -0700 (PDT)
Received: from [172.28.140.252] ([2409:40c2:5420:f772:24a9:f23f:ed43:a5ce])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147df097e0sm29005610eec.17.2026.07.24.02.16.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 02:16:21 -0700 (PDT)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Subject: [PATCH 0/3] dt-bindings: rtc: ti,omap-rtc: Convert to DT schema
 and cleanups
Date: Fri, 24 Jul 2026 14:45:51 +0530
Message-Id: <20260724-ti-omap-rtc-v1-0-ffef78853cd6@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMyw5AMBBA0V+RWZuEejV+RSyqBiPxSFsiafy7Y
 nkW93qwZJgs1JEHQydb3taANI5AT2odCbkPBpGIMqlEjo5xW9SOxmksVaELKSVVlEEodkMDX9+
 taX/bo5tJu3cB9/0ATNBdZm8AAAA=
X-Change-ID: 20260724-ti-omap-rtc-6a5c5888e7e3
To: Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Keerthy <j-keerthy@ti.com>, Afzal Mohammed <afzal@ti.com>
Cc: linux-omap@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org, 
 goledhruva@gmail.com, m-chawdhry@ti.com, daniel.baluta@gmail.com, 
 simona.toaca@nxp.com, j.bhargav.u@gmail.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784884567; l=1158;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=teMAPguyylPaCMYb5vDXceBt5uTOrTz7cewNFhv91cI=;
 b=MMq2SQq5KqAySM9j+WVtWXO35EXoE6FO1+qCVrYPLqIIoIh4B3/LC/xsN+5ZBGr/Ye2/oz9HS
 P5j/Y60+jAACNo5A8ruD3h8NYzbLjfk2tGzbZFltntTSL8rBncXjAgA
X-Developer-Key: i=j.bhargav.u@gmail.com; a=ed25519;
 pk=IqNDwUZKECEA+n8wXctFLBbYL9NhFstZNbOznm/nX1k=

This series converts the Texas Instruments OMAP Real Time Clock (RTC) 
binding from the legacy format to dt-schema.

During the conversion process, two legacy, undocumented properties 
were discovered in the upstream device trees:
 - 'ext-clk-src' in am57xx-idk-common.dtsi
 - 'ti,no-init' in am335x-shc.dts

Both properties are completely unhandled by the rtc-omap driver. Patches
1 and 2 remove them from the device trees. Patch 3 then introduces the
new YAML schema.

Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
---
Bhargav Joshi (3):
      ARM: dts: ti: am57xx-idk-common: Remove unused ext-clk-src property
      ARM: dts: ti: am335x-shc: Remove unused ti,no-init property
      dt-bindings: rtc: ti,omap-rtc: Convert to DT schema

 .../devicetree/bindings/rtc/ti,omap-rtc.yaml       | 129 +++++++++++++++++++++
 arch/arm/boot/dts/ti/omap/am335x-shc.dts           |   4 -
 arch/arm/boot/dts/ti/omap/am57xx-idk-common.dtsi   |   1 -
 3 files changed, 129 insertions(+), 5 deletions(-)
---
base-commit: 48a5a7ab8d6ab7090564339e039c421f315de912
change-id: 20260724-ti-omap-rtc-6a5c5888e7e3

Best regards,
-- 
Bhargav

