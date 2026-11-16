Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794870009;
	b=ngfC3t4FYPneMDCOij/6ta3ieDKerpn408+lgjkCYax72C3AcMyQP888DhtDObJeUigG
	 q+Nn/KtJy6kNggbyaZFBEF2+KLdZrt8VIb2LBopMtfjDjawbAjjX+qtIh+Q9/OVglqxe5
	 ndd/ALy+tUgWdGs9sODZAQXmGnr0v5AGe7u/Mi71RJnqSHdmWKVZUUZ63DuNygQnghTad
	 R/s+dTe7/zdapv6FCQZQgX8QCGLbwvSOQ+Ca91QbO78U+m6uBXDPEsZ4NEA4dF34JbGXI
	 C3DltO8K0Z8ornjpjMFricIT+JQiqZ4oz+7PGGxTfW8Adtk49EPLl2YHE3J3LBXYG6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794870009;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Subject:Date:
	 Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=WUolhYDZbslOOIbkyOEoOPPNwXhWzrlgPsJ43aUqTJk=;
	b=s/tS+feYv/CWepTeCxB5DMql9dK3tBNxVDed5VJ1L0h3C6CMNW9Ui0bJEycW9uk1rrU3
	 vdSwyA0YJgr+593G+7P/9Ecw7MXtWISuDR2b3rPpvTjAScqD6rNd9uv4EIlZKH8Ll23lZ
	 w+tbYv+eSDzP/Lh3DoTHgap+i/jp2o08frJbqqGP8K3Q+OVg2/X9XrfDB0UfAkZ3eZCtQ
	 Mpf3sIvPu4zgEHib8imv8nS/Fd+U2N2gz2m1aAusVaHf3Bqvb1AzFQz0uvF825wvdgM3M
	 oeQaeHkmPaW1zIJ7OT2JIJnSk5SDJFoDh2+clOXTBv+0mV3WCr4ENRXrVIMXhyXkzvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=telaak.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.128.175
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A84E8606A32C
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 23:00:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A84E8606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=telaak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-8b4d6981c67so11763697b3.1
        for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 15:00:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794870008; x=1795474808;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WUolhYDZbslOOIbkyOEoOPPNwXhWzrlgPsJ43aUqTJk=;
        b=EMXV0CqG+idDEZY1D+ZT3CmQST6w79kcdKR9Oay5PvMDPHVnAcx1xqJPbf5I7utbYI
         WwVcicjRz7VKrfcxcqD29Jd/5FoUqlteZ6awgEjtT1Nhv3AiP2Uu5gJVet3WmDw2nDnB
         TgvBZVkdGF7rpOwilFFdp354NkcX/W5YShrWLderrpt8h5FnpnQdYcLRH024axkP0Yqv
         3aEnpMpovgIFV5Vp9X2UYYnTEP+Y7rzSCLr5MuQvf484cn8523zNv/YgwFVwbyI48Wte
         r7FLYgi839C1Vtr2UL4Olk6ztceaokv0i5j/RTA0JYXB2EwdNo67ldxzkk3ZlhAH40Im
         hfGQ==
X-Forwarded-Encrypted: i=1; AL+hErEHMXiGogRQsQU/gGCBi8kFmmuSo6zPU561gOoAu3OVQgHICg7IbIvgignhRTHxteGNWmKsp0m7zJrg@vger.kernel.org
X-Gm-Message-State: APuU4Z8jSvXOQD54e151Odf5bCTwhuohu7ReqxrtiNbO29dPfxDyPabt
	Z1O/Zz9L8VZWi6hNvGrcS2lU9upFrZMNX3ipQODuJffYtKssCCxVDsP2Xp1sSsxTdpY=
X-Gm-Gg: AZFdTZfynjEW/1A3Gta3DeWqOHRXe3nRdtjGAvNgbfEgHAbhdqKLAXLb15nx6bZG52y
	cSkLihbaVuamZmErPb/9dtwEuU07xV4n6F8N59s8pbMJThnL+Pwjsa2ZTaEztd+QPY4uP/BnYte
	IpNiE8bIP0L99nkhax3Gh300IiJmG6ZtsEi64ExbNCrjydQqq1+C7c5TAvgVr4qIqUa7vsk1R5r
	4VO0CORBOoymSlTCsQYpWVCSTFYd4iP1sQR/2B+wI9qL4ONe8RaS94SEUeRwtdXPOEm+IFFdbFA
	2mutTHov9peFpH6q18i/B6UYjM0nnWWGX94sYT7TiB5hs0ggDMzRrkN2qjwl9VddaWqIpCR7E5E
	F1Kv5t1KRSB6LmnOd3NGURj5CchrLyW2KLrhxnXeKNFw+JyvFAnPwKp/3p9DgRfj9KppXx5hxWV
	CkbZSV0D9mT6nL8juogOKIMHlpdHXDKN3zZCSPc+Z6UZMzGBkom5+DzX76HXQupifv0dCjIGYI9
	mCHtWiTeXJM3tBUgMck4awySY1w+E4vpw4waObDUHPLxAYl4Kn+AHZNNOZczK+nuFJ9g0d+6vqt
	ogkUBKiefoakQMuhXaw9tKeVsvArl7hwDrt/6qx1p8K/vLDc9o5d8l3XBKJtgkRwkXY4s4iezHu
	IGFBOetdxuXpfu35YHumLauX3Pc4RNWsBVrlFl60o2jkLOJcpUeGaAA==
X-Received: by 2002:a05:690c:e3ed:b0:8b0:89ea:6aca with SMTP id 00721157ae682-8b4aa0d0116mr67609057b3.6.1794870007633;
        Mon, 16 Nov 2026 15:00:07 -0800 (PST)
Received: from 1.0.0.127.in-addr.arpa ([71.68.170.161])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b4ebc50e40sm10721347b3.17.2026.11.16.15.00.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 15:00:06 -0800 (PST)
From: Joseph Telaak <joseph@telaak.dev>
Subject: [PATCH 0/5] iio: potentiometer: mcp4018: Add Analog Devices AD5246
Date: Mon, 16 Nov 2026 17:59:49 -0500
Message-Id: <20261116-iio-ad5246-v1-0-ef6b7c06d4b0@telaak.dev>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAA/yXMQQ5AMBBA0avIrDUxVa24iligg7FAWkTSuLti+
 Rb/B/DkmDxUSQBHJ3telwhME+indhlJsI0GmUmNiFowr6K1hVRalFblxqAsjTIQg83RwNc3q5v
 f/uhm6vf3APf9AOCXSituAAAA
X-Change-ID: 20261116-iio-ad5246-8d4377128747
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Peter Rosin <peda@lysator.liu.se>, 
 Michael Hennerich <Michael.Hennerich@analog.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joseph Telaak <joseph@telaak.dev>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux@analog.com, devicetree@vger.kernel.org
X-Mailer: b4 0.16.0

The AD5246 is a 128-position I2C rheostat that speaks the MCP4017/18/19
protocol. This series adds it to the mcp4018 driver, so it can be an IIO
channel provider for an in-kernel consumer, here one that sets a fan's
speed through the channel.

Patch 1 moves the out_resistance*_raw_available ABI to the generic file,
patch 2 reports the wiper range, patch 3 adds the binding, patch 4 turns
on the vdd supply, and patch 5 adds the parts.

---
Joseph Telaak (5):
      iio: ABI: Move out_resistance_raw_available to sysfs-bus-iio
      iio: potentiometer: mcp4018: Report the available wiper positions
      dt-bindings: iio: potentiometer: Add Analog Devices AD5246
      iio: potentiometer: mcp4018: Turn on the vdd supply
      iio: potentiometer: mcp4018: Add Analog Devices AD5246

 Documentation/ABI/testing/sysfs-bus-iio            |  9 ++++
 .../testing/sysfs-bus-iio-potentiometer-mcp4531    |  8 ---
 .../bindings/iio/potentiometer/adi,ad5246.yaml     | 54 ++++++++++++++++++++
 MAINTAINERS                                        |  2 +-
 drivers/iio/potentiometer/Kconfig                  |  6 +--
 drivers/iio/potentiometer/mcp4018.c                | 59 +++++++++++++++++++---
 6 files changed, 120 insertions(+), 18 deletions(-)
---
base-commit: 94921bc9eb214f838481faa847cda5c42e486013
change-id: 20261116-iio-ad5246-8d4377128747

Best regards,
--  
Joseph Telaak <joseph@telaak.dev>

