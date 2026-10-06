Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD8B63DB980
	for <devicetree@vger.kernel.org>; Tue,  6 Oct 2026 20:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791318346; cv=none; b=Ac5UyeE2hT4lLwckSjbZaou20Ap18l8LkcjFgEO2TFtCXBIJngZO53PG1hgXVi9N3CFZTj5IsaIFT2GQttvMDn6+l1aI2cdNFSLMAQTF6jrMF2c8TOgEabt6fdQYXLLXIUhw9T2FkNBT1hXVchIbNUTsnVHtpxSMl3OVoxSjv34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791318346; c=relaxed/simple;
	bh=pzE7TBtHaXQdTUaCA18apuhFLo+Jj6/WeoKJzFQFzDo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=swyTOHp+xFynDoJAEn6KtTRHNLZYvwreu4ooIs5A3XcYpCdQfeseieZu0RvngYyyDgG4d4ioUGUABcaMQExrinR1UCxMECEgDoCsa0hfv1xCalIKs0V6wWVUnPxM32yxzIG4cbRQIPjwbpeOjxnINn2jJSYDu7TchbNMtqU5Yuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=pv3mBLFV; arc=none smtp.client-ip=209.85.161.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="pv3mBLFV"
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-6cfed5dd083so2512782eaf.1
        for <devicetree@vger.kernel.org>; Tue, 06 Oct 2026 13:25:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1791318342; x=1791923142; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=emWWp9zQLotPqVu53IbNyTMqcxVh3ZiXLOMaxjjb42A=;
        b=pv3mBLFV1EQTkaSbSZ+b/uWicHwkrUTMbW8a3zPXDnImVsQPqgtLTjRtBlq+KGzrDS
         GpTO91z8ZKe1re9GktA6/GqsFqgrRwfWjAcJUEpGkUPA29MUb6AUH64LN/WzCzDTvrH0
         X3DQrP2DpKdr+kOZFh1fjUS7hhSo9aB1CyO/+YSktVMeHXTcBcD5Z4Lvhc6qYMwwIfq/
         36J8YpKEdo9/A5KYDM96wj682Lnxtv/8aK/x2UhGDhVWgifDvZNmOI0VAtSjKUcTw9y4
         DFLwPUCo3LQFkzKNkx5iKjHkakaF8/oZJv2mTSupeZh9pCIuvO9ibsFuUlYNwvcg+NM8
         mz4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791318342; x=1791923142;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=emWWp9zQLotPqVu53IbNyTMqcxVh3ZiXLOMaxjjb42A=;
        b=cKKbdQugYGeh/o/sQmXD7qeeMF5BIY9ESrEE90pqPdro5qQl3oRR7O0+Nv98l7bAuq
         x6GaDXsxkXzdhuCMooL1FvdcGXWy2lL25bMUhWHtJt9eVtmUdB+QshAa+WKcRzwLpm7t
         epoJrkuKxxDbQj60+mXG7LLieIQwS/4Wec8bGsxqspueVIU7kc/lBvJv2/u3wr7MA3s3
         8TMO53G1p7FawzMySms3X7RG5iRGhrxfqI2VzrG/eGM3gWGT1ZFQB7/JQi/BRZxpq3YH
         nrGEb431tFWrX+AKErGpkeU7y/egPoZEQP+psA7J0oEjjame2+faS7w4FXMW5mMqgrJy
         6mgA==
X-Forwarded-Encrypted: i=1; AKwUvBy8Gc2YTXmqBZqeU2c6hTJRhlftJHcZlvAnRHDcE303iVf5Ru847GGVdEr6Zak98b8LSbPokP9AzBlj@vger.kernel.org
X-Gm-Message-State: AFuF++kXOmpvQ+T9JtGIRaCsTztyfyAW0sCDr9mckjMSkyrcThASCA+i
	hDYDzj/ra65vXzPbtJO164iRoKKNh5EF4B7bYVs6dk3WcB2M3x67TmTNgKoHpCMzfF9qMbdP7oK
	fygBW
X-Gm-Gg: AYBFou3fWKs9bJzv85sD/PpCbf2t1ZypoFU85iVzkTrvHcav1LNK5jf4LWCL/wsjEwQ
	CXkizEzk9dKWt+XvnDsqOJ3nDR8dRltAii8ZA6tD1kEHhLjdcqPq4qjTLBvaL0Uk7oYqBURusY3
	kR+ZV4v1i4mzWzulQuHLfjRP49jQCqVMLfDrPSUPyquQJpyXZSZDDKTgqlriWMKluRbShofS7mj
	Z44v3VVsznAbzCgVeMUUdFZ5wZ6mR7FRJpwdMD5cEF/pk6l0rZVqNRKBz3N+Uyw9UMLwZ1eE1As
	C0BcBrBBEUJF5Hq2+K4d0QcI6OAOrCZ8E+ZBF0o3+wCCaHrycT94bZTFD+l/bb141WHIq2GNZLB
	YCwWHMSTei3qcfLHJJCzKZ1NX6IS5rVFvn+9MmHupphOR72EOpgzYFmZmnzX7gjUZMgu9Bm7S5P
	5iO9FZkwEmbQUPxCdjUpArOgWyI1hf/RekhVWBN4YRaaW/1mNFjXp23rf2UQyPKPUrqxj1qWQJV
	g==
X-Received: by 2002:a05:6820:80c8:b0:6dd:696d:b245 with SMTP id 006d021491bc7-6e7a7185793mr353926eaf.53.1791318341561;
        Tue, 06 Oct 2026 13:25:41 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:500:372:3180:ce34:1fe7])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6e793f68bf6sm463442eaf.8.2026.10.06.13.25.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 13:25:40 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Subject: [PATCH 0/4] drm/panel: himax-hx8279: add VDDP supply for Startek
 KD070FHFID078
Date: Tue, 06 Oct 2026 15:25:00 -0500
Message-Id: <20261006-panel-himax-hx8279-vddp-v1-0-50d884b42aae@baylibre.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMTQrDIBBA4auEWXfACE1qrlK68GeMU1oj2gYh5
 O41zfJbvLdBocxUYOo2yLRy4SU29JcObNBxJmTXDFLIoRdiwKQjvTDwW1cM9SZHhatzCa9OGzL
 eS6sUtDpl8lz/5/vjdPmaJ9nPsYN9/wF2kTCEewAAAA==
X-Change-ID: 20261006-panel-himax-hx8279-vddp-5dabebff2c99
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, David Lechner <dlechner@baylibre.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2033; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=pzE7TBtHaXQdTUaCA18apuhFLo+Jj6/WeoKJzFQFzDo=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBqxVkes7QQS6aQ71ndy4RUpYujm7OFMzt2sBzSY
 kEu4bXRqfeJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCasVZHgAKCRDCzCAB/wGP
 wGuSB/44mamJHa1OYsjk/6qCu9iX+nj2K3lZ+OPUrj2F/Tu1EPxYNTztwaI0acbMEtPAOin2fWA
 A8UERPrClUfDtJtQXleqD4fA4k4PCtaUDej9JuJpGH0hwuJm7y/s8SLzyqYDDgx8vj+fMDE9xFQ
 C8DBJBTejRaGWQn6OSrJ+aTu4QkEVuoMCMsKtLs3rsvMgLVaPz0bfKummw3fPVfhnIuG1Wqf9CY
 BQAhcSUE7ntQRjbKr1VUnFFZ853aN+Zvq9RG4Yd/9n8KBIejxnfEwMHGgMxKOb/oI4bLK8v/o7E
 n5On7Txi/XfsGkgGSlQtP53KKDh5xDd6iYFUeK6QSIK21wJa
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03

The Startek KD070FHFID078 panel has a VDDP power input, which feeds its
DC-DC converter in addition to VDD and IOVCC. On the MediaTek Genio 520
and 720 EVKs, VDDP is switched by its own regulator, and on the Genio
1200 EVK it comes from its own PMIC LDO, so it needs to be described and
enabled. The existing Genio 1200 EVK device tree also turned out to
describe the panel supplies incorrectly, so this series fixes that too.

Patch 1 adds vddp-supply to the binding, required for the Startek panel
only, since it is not known whether the Aoly panel has a VDDP input.
Patch 2 enables the new supply in the driver. Boards without a
vddp-supply in their device tree get a dummy regulator and keep working
so nothing breaks.

Patch 3 adds the property to the Genio 510 and 700 EVK device trees,
where VDDP and VDD share the same VSYS_LCM1 rail. Patch 4 fixes the
panel supplies on the Genio 1200 EVK: its device tree pointed vdd-supply
at the VDDP rail and used the backlight (VDD) switch as the IOVCC
regulator.

The Genio 520 and 720 EVK device trees are not upstream yet; U-Boot
support for them is being submitted separately and uses this property.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
David Lechner (4):
      dt-bindings: display: panel: himax,hx8279: add vddp-supply
      drm/panel: himax-hx8279: add the VDDP supply
      arm64: dts: mediatek: mt8390-genio-common: add the panel vddp-supply
      arm64: dts: mediatek: mt8395-genio-common: fix the panel supplies

 .../bindings/display/panel/himax,hx8279.yaml        | 13 +++++++++++++
 .../boot/dts/mediatek/mt8390-genio-common.dtsi      |  1 +
 .../boot/dts/mediatek/mt8395-genio-common.dtsi      | 21 ++++++++-------------
 drivers/gpu/drm/panel/panel-himax-hx8279.c          |  3 ++-
 4 files changed, 24 insertions(+), 14 deletions(-)
---
base-commit: 5d7b464a4f517d1db533b1b231f42ddcf4e1dff4
change-id: 20261006-panel-himax-hx8279-vddp-5dabebff2c99

Best regards,
--  
David Lechner <dlechner@baylibre.com>

