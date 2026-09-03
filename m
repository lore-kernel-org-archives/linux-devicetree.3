Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48CE734D4D6
	for <devicetree@vger.kernel.org>; Thu,  3 Sep 2026 03:16:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788405412; cv=none; b=IA3yg9yQM6YwNK3mAMrrurh5wW2SXomfGlN4W7TAaT02m2VMoJWt2VKkiZKPbDjvRdumFBy7RK5Yh1um9eXKY7ELXmFQ1gcnImT7MubQXhR9B6C3ZpSIaF5ahjIu27bqSFAIbJyspZnDbH4jFVn72DVNx32baPzkc3uV4tASlCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788405412; c=relaxed/simple;
	bh=/GmG2lNFZ6OJbWK1fHpz+vsHNX23AQ1RbWgGtVFqtiA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NzirLPI4WSYP+xD9Hm1V5/+XO+qX3aGIz6ERT1qUF3eGyr92veJRjBu5rrzd3aYMedRemAmrn10TgCEoW4NkfW2KTpTmXmZK/uT//xKkXk/RojhpchQRt9UHoi7cZWXlhOFtO3sVw9QCfD9iT47P+x9LEB5TFnqqyFa+l56enas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n2vrlneL; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n2vrlneL"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cc1d57602e8so1965421a12.3
        for <devicetree@vger.kernel.org>; Wed, 02 Sep 2026 20:16:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788405410; x=1789010210; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fJpu4x+o7ufVQL7Dk6JIrixaD1SGR2kHU0bAvSvj9sM=;
        b=n2vrlneLv14/3wRHm/HaPyjNyuFDiE6SNMqj/dPoaKtcIvgApgCjT44I4+Z+5OLcOU
         GBIHG2NBHDhCSTEYXv5YGXrior/VFOUK9Z9M6jL6xHHrh1yj091T2+ZV1usekhlGgCX8
         bDsUlUaKrQsR4uIwu1RHSOmwUiZql6VfTkRb3ApIYwdqyZv18bSFs4wM67qjDmCIzWCo
         9nNCdYKGyXSJDASBNqjQKGqqk/GSCjglObUcL04zsBbVU8zK31w3ASBMe3uR3lHNSMVc
         f0RjLsNN5Yp/keHt95Lf1hjvTfbYhUos9m60zebiqT5yYjovSC4Nln93S8ZMzNNj1htu
         a5hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788405410; x=1789010210;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fJpu4x+o7ufVQL7Dk6JIrixaD1SGR2kHU0bAvSvj9sM=;
        b=hBFO5eDBga68d4DnDLdIVAqvPxKgHW7vja8iT91bXPlSQZ6jCpJITB5sQ6NZ+zSJxM
         ooR+rf8bZbYGTzPJysVs7ZFOf7frNY8Wy+eU6id2W5kr2iLrm5Q457Sgnxbe94Do2xYX
         18Am0bAPiVHGTeNV71F+7rIT7DOi/tooUjU21j+7UOdkIGs663ktai+1VmOfHVie006W
         VxImGYsDyhJhqr9s74gOlT93BoIAr4CWLQjIad1bC9MqOpm8pHCLjYPZczzzuULCoXlc
         lVSLnoy/gL/8n3ruWzCUPoDWam7ot5as+oh80vcflBWfgIpXKFw7FESVCci62GH39+Jk
         GYIA==
X-Forwarded-Encrypted: i=1; AKwUvBx1aLKbJjQ/oTKoIy8VcTztl6j+p1QpPaPLu73Qc3X0/8vHNlVFU13/azBTzaES+E9nAnzXtzLMWP6A@vger.kernel.org
X-Gm-Message-State: AFuF++maKJg0wtilpwgqFXBtqN1f20BNGEpZ/VT8SQnF/frRqMgek4u6
	PS8pJOPz9JKm+rD1goHlrzkjT2m27DCwnYjkZ/hZEc5ttI/FSxJX50tw
X-Gm-Gg: AYBFou1FtuzcK1d2Ap6ZiKTlreT0GuFw6PNtf+6i6ZW+s9Bm3ETMTTaaeJiG39u4iDy
	jUFcUV45vonikLfg588PuIhizr7Rv2uo8HyC4/mffduXZgdZVpXOJ3Opc50y+8vc+IvkHGvSS/4
	R3Z0xD7NPlN2Kod1M3TPWGalTH0FC+oe6g7CLE5WXnDs5xg9JPxNI50b93eJIQKyaVF4x42jzVt
	eWp3o05tYk+ZQZXqq1lHndUG7bPX6SrffLM3vVK4Qx2+bT++oqufFIpH4rK2RE9LvV4yBKjH4xR
	JlL0phkTdApgTpfCRupMT/av+vkcYkC6z75CvvMvcJmUYc5fZVKZRW4GMNE6U4d0+uib1khqVgl
	4Ke6EOhGWRCVPi75eLLCFO33caEsIHBLbMjatFlDSaWz6NEfnojO5aD5924A2SQ8zfwfvlf9IsV
	U7uNP8kZOm3W6JTP8JevDbSuX+ZReseCFywb+0OkiDs/tfgSjrDfJUrIT+OFy8smO/GCJpV+5wL
	xQ5izeudBoDIfM=
X-Received: by 2002:a17:90b:4d08:b0:38f:de97:b06 with SMTP id 98e67ed59e1d1-39aede9344cmr12447130a91.5.1788405410279;
        Wed, 02 Sep 2026 20:16:50 -0700 (PDT)
Received: from d.home.yangfl.dn42 ([2a09:bac5:661d:3050::4d0:16])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08c397b1sm2244114a91.8.2026.09.02.20.16.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 20:16:49 -0700 (PDT)
From: David Yang <mmyangfl@gmail.com>
To: netdev@vger.kernel.org
Cc: David Yang <mmyangfl@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v12 0/5] net: dsa: motorcomm: Add LED support
Date: Thu,  3 Sep 2026 11:16:21 +0800
Message-ID: <20260903031630.356840-1-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

LEDs can be described in the device tree using the standard LED node
notation. Currently, only parallel mode and strict 1:1 mapping (i.e. the
HW default) are supported.

v11: https://lore.kernel.org/r/20260831044818.4103477-1-mmyangfl@gmail.com
  - handle one of *delay_on / *delay_off is zero
  - fix error path for yt921x_led_setup()
v10: https://lore.kernel.org/r/20260816193905.218112-1-mmyangfl@gmail.com
  - new patch to fix lock status check
  - LED control block redesigned
v9: https://lore.kernel.org/r/20260726162731.1005803-1-mmyangfl@gmail.com
  - LED initialization sequence adjusted
  - add DT description
v8: https://lore.kernel.org/r/20260725045008.858692-1-mmyangfl@gmail.com
  - limit the led port number
v7: https://lore.kernel.org/r/20260723195335.806002-1-mmyangfl@gmail.com
  - rebase
v6: https://lore.kernel.org/r/20260709014812.1158178-1-mmyangfl@gmail.com
  - per-port initialization support
v5: https://lore.kernel.org/r/20260707064752.1030345-1-mmyangfl@gmail.com
  - improve trigger selection
v4: https://lore.kernel.org/r/20260703165241.542195-1-mmyangfl@gmail.com
  - fix some reg op typos
v3: https://lore.kernel.org/r/20260701155519.273212-1-mmyangfl@gmail.com
  - fix null pointer dereference
  - support polarity auto-configuration
v2: https://lore.kernel.org/r/20260629183137.541341-1-mmyangfl@gmail.com
  - allocate LED structures only
  - eliminate double locking
v1: https://lore.kernel.org/r/20260618202716.2166450-1-mmyangfl@gmail.com
  - set up polarity correctly
  - do not set up .brightness_get() to prevent dead lo

David Yang (5):
  net: dsa: yt921x: Check lock status with lockdep_assert_held_once()
  net: dsa: motorcomm: Move to subdirectory
  net: dsa: motorcomm: Split SMI module
  net: dsa: motorcomm: Add LED support
  dt-bindings: net: dsa: yt921x: Add LEDs definition example

 .../bindings/net/dsa/motorcomm,yt921x.yaml    |  23 +
 MAINTAINERS                                   |   2 +-
 drivers/net/dsa/Kconfig                       |  10 +-
 drivers/net/dsa/Makefile                      |   2 +-
 drivers/net/dsa/motorcomm/Kconfig             |  17 +
 drivers/net/dsa/motorcomm/Makefile            |   5 +
 .../net/dsa/{yt921x.c => motorcomm/chip.c}    | 228 +-----
 .../net/dsa/{yt921x.h => motorcomm/chip.h}    |  15 +
 drivers/net/dsa/motorcomm/leds.c              | 666 ++++++++++++++++++
 drivers/net/dsa/motorcomm/leds.h              | 118 ++++
 drivers/net/dsa/motorcomm/smi.c               | 180 +++++
 drivers/net/dsa/motorcomm/smi.h               |  61 ++
 12 files changed, 1108 insertions(+), 219 deletions(-)
 create mode 100644 drivers/net/dsa/motorcomm/Kconfig
 create mode 100644 drivers/net/dsa/motorcomm/Makefile
 rename drivers/net/dsa/{yt921x.c => motorcomm/chip.c} (96%)
 rename drivers/net/dsa/{yt921x.h => motorcomm/chip.h} (99%)
 create mode 100644 drivers/net/dsa/motorcomm/leds.c
 create mode 100644 drivers/net/dsa/motorcomm/leds.h
 create mode 100644 drivers/net/dsa/motorcomm/smi.c
 create mode 100644 drivers/net/dsa/motorcomm/smi.h

-- 
2.53.0

