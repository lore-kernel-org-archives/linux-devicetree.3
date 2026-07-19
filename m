Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F89A22579E
	for <devicetree@vger.kernel.org>; Sun, 19 Jul 2026 13:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784468282; cv=none; b=jaqiNf2qv6rEg9pdd8FOrGxyt3prvYJ6KepKbEf8EgCGk9oTWqpP0B3AVzD8A/7lqYB+M6OnVB6YD4LXax+1Ixbl0J5R+WuBnkFK8toNB3WizLCzJ05v0+d18K5wHCBo5SE5pIGarecefmabZrZyh+Ip/VSUzjlfPlF5jYAPoDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784468282; c=relaxed/simple;
	bh=V7cQtYXT1oLCrxYl9d+RloU5vz4sOIsuAqfNBNM2KV0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cYFPa3T9qRUO2+qwGLCCioj930i1k1o2iCTbFm0xH/VG/wQoSwrgIeA6YTosrKk2jX9XWNCXKtWGRsqcasvcLKkuj4OjL4ZXkHOhYbIFLaNfQoXK39PKpEFYTRzEE6y0TMG024Le19ortAswBoGr4V+YXwUCL3O5QnJXxZkHwW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eTMzCwCt; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eTMzCwCt"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-49545ba3d4eso14849995e9.3
        for <devicetree@vger.kernel.org>; Sun, 19 Jul 2026 06:38:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784468279; x=1785073079; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=T8M2tiw5eOuKti96JSxIGvzIRa/bxVJzwY8EbOmcsNo=;
        b=eTMzCwCtgF9/h2/FlyExr5UYUbp5NnPMkR485TxUTkdS7FdGYY4A8O/bTQ31EKJWF+
         JziCB/7Jk2JDYa5Ya1E01kL8l3FHaydlPuguW8VO4oikLGmr9omdhJWqUyo7+xol7rpJ
         9Bu9KjNmkNAw7l7duQinyIA/hXrnUQ1r4imwYMVCnnpOojMlPTqioh2YFZMAFAjio0Ga
         f4SjWMQ3g8Y4dB77P2Sfmxw+50xqTee/OfGcdrxPEKGvqpaAdoFv+ZbDxsf0yxtnG6EE
         PSTM/Gq3w2bVsWNLVfugksnNVlgBtzTbp3TX5NkZY+eTRJOZyC3EdxoIShxGThTJCJuB
         zgBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784468279; x=1785073079;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T8M2tiw5eOuKti96JSxIGvzIRa/bxVJzwY8EbOmcsNo=;
        b=gPl/NpSh9IdabjWGva9n5STeSKuX0pthasSkWzMCExkLsQ3+UjBA0UnBOouUIgM53F
         xiaS+XI9Y9ujJaoj70haeiwK+olUvUy/ujL1qJK4XH6u5pl8A0KGhbDyHPlx4Hlnvw5k
         q95JK2M65jsV/QdgEIjYl/aG1zjhmIpdKIU4QEzVvRc6H4OMeUZ6cjwJmzCup9Vs4DFT
         8CqjtxiQP9LN/qmDQ/IsvXxRaJf2AoqL00dAzlgCEJEGlfnok2mY0hoEsU+t6Cw41xqP
         8CQlo8fB6et2Ep7Gnq49E8GUGcBZiqm4vTmRAviHqWdSXP4vviAlVDcBOewVctD4Vfi4
         rfTw==
X-Forwarded-Encrypted: i=1; AHgh+RrrGlPTu//VZ6/FREvzAxmBm+L5+Srfy+lC7hI+v1EyCrdcmYeWFca/pgW+RvtHZ9bxg9aaAzRwXPE9@vger.kernel.org
X-Gm-Message-State: AOJu0YxCFqmpP7zwkHtKDmzjM7KeHEQIBbYL6p1l4uYt8ORonofekZtS
	R2XB+U5gO1oD0yX+ksX2RRVr5OQ2Ctrz6JkwGFRM5p5LV6i6WcRwp8f4
X-Gm-Gg: AfdE7ck3vLuZJaMKLKxz5N1iiGIx2yIiKfCg5CVWWaSo8sDxPppw2Pk24/zrOrmw5LA
	UGYx+MASZmlUMK3ps6k2Jf3kZyqTgy824bbt3rNUAOUPFlr2thsnKyUoIBIN9+6yMiJuqpkLNDz
	WK1eNRMbHSHGZnF4OSwKZbrqvqCNpweBAEz8kIg/s5z74rYX5BGhpf54X/VeWMWlMYXCzTnEYf9
	428fTUfkN+b+gcAMlm07EFkPHG/MybSG+9vxDHSXaSMASlYmofVMVnZzQaCTxyuEkNA3nD4sbm2
	ESeCPxVHJAowJGDU+V8LKlM8W71HfrwpeWEG3ebVLtimbUagvw0amDCYZYbK953TYV0k0E7mLz9
	haFv3+3z90321bZ2VcJ0m4aU/ZxubkJl5lhTfHLIMYUZE3LvMlSq+xt9/ABYnMINzavkCpnZhZ1
	m+GZ3IHYjBsii8d+oc0gTxtO6XXKvgCEvEssAAedpnAAU7
X-Received: by 2002:a05:600c:48aa:b0:492:6efc:7c60 with SMTP id 5b1f17b1804b1-4954a516183mr75623815e9.28.1784468278420;
        Sun, 19 Jul 2026 06:37:58 -0700 (PDT)
Received: from localhost.localdomain ([188.26.50.240])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-47f63edda9bsm21807179f8f.31.2026.07.19.06.37.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 06:37:57 -0700 (PDT)
From: Eduard Bostina <egbostina@gmail.com>
To: Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Eduard Bostina <egbostina@gmail.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Roger Quadros <rogerq@kernel.org>,
	Tony Lindgren <tony@atomide.com>
Cc: daniel.baluta@nxp.com,
	simona.toaca@nxp.com,
	goledhruva@gmail.com,
	m-chawdhry@ti.com
Subject: [PATCH v2 0/2] dt-bindings: input: Convert TI Keypad Controller to DT schema
Date: Sun, 19 Jul 2026 13:37:28 +0000
Message-ID: <20260719133730.3551691-1-egbostina@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The first patch converts the TI Keypad Controller binding to DT schema.
The second patch updates the OMAP4 and OMAP5 device trees, which is
needed because the schema requires the matrix properties.

Changes in v2:
- Added 'interrupts', 'keypad,num-rows', 'keypad,num-columns' and
  'linux,keymap' to the required list.
- Dropped the '|' from the description.
- Added the DTS patch, so the OMAP4 and OMAP5 boards still pass
  dtbs_check with the required properties in place.

v1:
https://lore.kernel.org/all/20260708123252.1768355-1-egbostina@gmail.com/

Eduard Bostina (2):
  dt-bindings: input: Convert TI Keypad Controller to DT schema
  ARM: dts: ti: omap: Disable keypad and enable it on the boards that
    use it

 .../devicetree/bindings/input/omap-keypad.txt | 28 ---------
 .../bindings/input/ti,omap4-keypad.yaml       | 63 +++++++++++++++++++
 .../omap/motorola-mapphone-mz607-mz617.dtsi   |  2 +
 .../dts/ti/omap/omap4-droid-bionic-xt875.dts  |  2 +
 .../boot/dts/ti/omap/omap4-droid4-xt894.dts   |  2 +
 .../boot/dts/ti/omap/omap4-epson-embt2ws.dts  |  2 +
 arch/arm/boot/dts/ti/omap/omap4-l4.dtsi       |  1 +
 arch/arm/boot/dts/ti/omap/omap4-sdp.dts       |  2 +
 arch/arm/boot/dts/ti/omap/omap5-l4.dtsi       |  1 +
 9 files changed, 75 insertions(+), 28 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/input/omap-keypad.txt
 create mode 100644 Documentation/devicetree/bindings/input/ti,omap4-keypad.yaml


base-commit: 0718283ab28bc3907e10b61a6b4be6fefa1cbb2f
-- 
2.43.0

