Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 425362D0602
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 17:00:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783011627; cv=none; b=MespQBG24wt34OE+Eggpp0WoSpwvFEAKh+8hS+wxJshxpfZwy8J1LFYOGmyFMUevwJsZkh8IaOUYenzC7IVM4GzedB9iqIH/Gwpdibbz0CaNE3k+nm5yh5c8+th5xQnVbZNPymxOouZbYBv9iZ4qEcweUpGIIEgJXMFv7zDcxMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783011627; c=relaxed/simple;
	bh=yrCrvjHFqhQoi7ugBP7i0ix99Rxl2YLAyjImpsg79vM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gRN4OuaHvunU3fvcgf5vHdCkiHKlePuSZAP7Ic50cZDkz2NqUIVWk6JLuGclMzzzuIIJ5v18PlyYNJukcGwBpI8hlw10Sv6Bc+UDfHRWOKzcS7fcpseDTUYgbS3HZEM31KgbJq3nCNkrRDrxq2IfNRGtv4n52oWFSuIMoZtnWT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KkknvCCW; arc=none smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KkknvCCW"
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-8ee88fce476so18328556d6.0
        for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 10:00:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783011625; x=1783616425; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yrCrvjHFqhQoi7ugBP7i0ix99Rxl2YLAyjImpsg79vM=;
        b=KkknvCCW6rKmRQLC5ssCGlUsqXz2EqzCfFAk9FAavRI4ejk7D/gc/ET86SdxBR4wti
         hmRfG97JDRKow/DtNWDdSiGLpL3OLEfbvbDUY0Gy1TBptViH54QxIwH74K8dtYo8AL5N
         X6U2RWI3/hLSQixrSoyOT7RMq/buOFfeWsfpKMyNG4FfP3VGQpN4Ra/s2vRIjuUyeVkF
         F+TZZkcRU1O+CcINtAn9QiKP5Q9paHaJ3+IgCtBJ/s3EQSfSdA4j29qMJRbc2EvGSqBX
         lEYLDwJyqsFwS760yU7BR5kxiv/udQOXZWUVMJ/K/VtgvFWLQUp9rU2lmIE0FJ/KLuao
         4GdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783011625; x=1783616425;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yrCrvjHFqhQoi7ugBP7i0ix99Rxl2YLAyjImpsg79vM=;
        b=JvNCgsskCiRg3zu8B9cTlsCmaFc9VXu9dexC5YO3y3DvXgpmwF7pBuWsjF9CHxrEuy
         /ZEacmdLcUMhnqFPl/4n+o+REcXisqWNnXS07kf2TsuH6gH6Pnv/jCslnGGlAjgsFxY0
         3Re7Bws1BvaFjZjpHphQdMD0VWJMmJRUPpbjtFq28ISf9JeIW7Qy2C2AMWmf2bsBTprT
         +tg6egJPsLmTq/Ib+fvSr8kxFtKPJdOyf9HxE4qEFtpA51JxzzSQOUGV9e4kE18zgGs+
         kIXLR+8TT9lZa7bHzpVvFYlKh6QQv4SYbEirtD1GoeHuD3jSTKszhtBwCA06K4Zcb8P2
         6xtA==
X-Forwarded-Encrypted: i=1; AHgh+RoPqBH/zf0DlzmiHAWcrwfb6hDaHR48GYMgzASs5D0YbCmbqGEgp3i+wHskr9sXDr43s/OEm2MIb8hR@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0eT1LZFYQbGrIApppArxfFQpdQki2bQNxQPlM/cUsvwMPehYw
	KbAF8iU5gwH99Eb6ZRqllN9Jo8PgjCyG0qxWlFvAlCSWeFGBVY9TWYsB
X-Gm-Gg: AfdE7cnzFXYxWnNza6EjK/TRSf9lCZMg37/oQWKv4I2glVtHEHh4p+28Jhv/AWqEeXA
	0HXYoaBdS0UgJw492rRpMqc0SSaGp8+8BkeZHcpeCst+Y9F3Q+s4hHHx8LV+PgU4rA1aPuhwAML
	wMEhSXnzJy0wQQyEXbUC/MAIMOZyp9KpS2AJIHKpLCxztAzJwCrekuaqFSKKP1KQXKMMY4FFeke
	NGBo7MetB7fyTnSyhxv94U9Z8CGjNh33Nb6LliscF194Q7fYBq4RE/zaFUxQzXPTIWz7DX4Et/I
	oF2yFogFv3YrjNFKbwINdp1fP5pHL2B39ZVnbqh14j5xrf7MwYYLmxpc0ns4c/NEYIuE6Vm2x8E
	O6i/5Xrez0BybX8bD6iMxuE6ezDUOrf1qsXLv4unzMmGwKq79IsLeYqlvJpXqkaUpkV07QV67Xh
	l6AFa4EVWQ4bKYCA3WtAy2f6OONpPOmqWhsyp/yR1ZlkHQ7pFKvUZNNSB036Z2
X-Received: by 2002:a05:6214:2d46:b0:8f2:8b5e:3b98 with SMTP id 6a1803df08f44-8f3c63d68e9mr104833466d6.9.1783011625104;
        Thu, 02 Jul 2026 10:00:25 -0700 (PDT)
Received: from AMD.home.local (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8f46f30b94fsm30106746d6.21.2026.07.02.10.00.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 10:00:24 -0700 (PDT)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: Junhui Liu <junhui.liu@pigmoral.tech>
Cc: Andre Przywara <andre.przywara@arm.com>,
	Brian Masney <bmasney@redhat.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Richard Cochran <richardcochran@gmail.com>,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 3/8] clk: sunxi-ng: a733: Add PRCM CCU
Date: Thu,  2 Jul 2026 12:59:44 -0400
Message-ID: <20260702165944.828550-1-enzo.adriano.code@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260310-a733-clk-v1-3-36b4e9b24457@pigmoral.tech>
References: <20260310-a733-clk-v1-3-36b4e9b24457@pigmoral.tech>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Junhui,

Register check for the PRCM driver against the public A733 User Manual
V0.92, chapter 4.2.5: all 41 entries I could extract (13 reset-map
entries, 18 bus gates, 10 mod/mux clocks) match the manual's register
offsets and bit positions. No discrepancies found in this patch.

For what it's worth, we have also exercised the R-domain at runtime on a
Radxa Cubie A7S (r-ahb/r-apb0 rates with live consumers on r-pinctrl,
r-rtc and the PPU, bus-r-cpucfg via its critical flag), with no
misbehavior attributable to the PRCM model.

Thanks,
Enzo
