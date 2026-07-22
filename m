Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 395CE345ED5
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 17:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784741073; cv=none; b=flJNikE43Y8FwmLp8bM8xrZ3LU3x+zRxvqpWww1XgG0gmJBTzL5YSRjKoH/PfS+P8j0TtsKZpDQsYVozVfK47A0YQYTNIVYBq/B/G927ihp4wnJWKQHre5EbqfmSTkST9z6C8twhCNz15WVs4b9ZnbTqJL/ybB4F1SOkPof82Y8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784741073; c=relaxed/simple;
	bh=YqaZmXNCJsa9hbmdcHJkPagq4EM1gKIfp7+IQsL2QJY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HyYXsJVLlUPI5idssG2Oy0fZk+Xd9d3U3daezLAHoFGs+kSVF2ChKpucoWFHmW8dttEefEG2rs0FuPsW5WuNPJdw/uA6dhGG1H1zjwdma6kHi3X6pwZ0UV7Bii2MEMY4l9WkkG9BJazTfmN8P6rB9I4WAoK4w/Cf+5fqHMZYTqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PDlyXNns; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PDlyXNns"
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-80a123ef90aso87885707b3.0
        for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 10:24:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784741070; x=1785345870; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YqaZmXNCJsa9hbmdcHJkPagq4EM1gKIfp7+IQsL2QJY=;
        b=PDlyXNns9twVX3mMwVe8g4pJTmdAf1KOzl9ILK/+BQQuW8tgltgV+fsR4gy4DEwa7o
         WocDpImDxo9wGfcQy/bcTU5Gz21AbYTjpcExXYIxnm8lSiWJthBYAoVdHvPF/GhzPoE7
         /yOc69pr8CHxTo51/CgjRJUlxZGfXGh/YHho4hta8Uj5gR6NqxOduFhH7wWxNC6qNPea
         VbOp21WfJLO+0sEOadUteHP9k0R7B4ku2CxUG8GLJqANKbOlt+KthgcX2eL+LsgkN82/
         qAek69FTLxj8ruaU5WCpgonQj7YKWWLZCxDHE4e10PhpneDMqnvdUAKcQHKoMRETJrmG
         k+Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784741070; x=1785345870;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YqaZmXNCJsa9hbmdcHJkPagq4EM1gKIfp7+IQsL2QJY=;
        b=EP9tJv2P0UZpruBMqqnc05CUtOQgspvYCf97x7s/ElKPenCxAsYUsNeplgcgnGKf8+
         C2tWKSP3Ymb+NyFrGBXK1xg7L/yT1vevFAoydJgGVOQ+tmR7dbqLIN0S4Eu8NMzMm1qI
         ModM7BKFmfHdTwjbbvZGlBdWYS/2gv6DaUMIZnPnHAN9koLiMSEaX/xx9e+uo8uGh9sT
         mWZtiVOpgAeCdXJnR85pvaTwhtacc+tVU55XGWHR4LbISmkSowYgLqQoevgTrNKfEvMV
         SR767sKjriYEL31iOmUfBYcaxJ2HyUIdAsK/sPFBg9oAODn87RMPszeHRt3qTrthpeWt
         WMbg==
X-Forwarded-Encrypted: i=1; AHgh+RpPBv6wss2/O+87R5KwzmjDkC8UUnOVuqFcGFPlcv9aSvsr4G3Fut1DFh9iotX3x92mCqva5NWh5cGl@vger.kernel.org
X-Gm-Message-State: AOJu0Ywgqi/H99der22dpgWz0PPtk7ZdPqadznnp6/FjjTNctqAZN4OH
	SHMenGECRI2ixyPH7/1cjk0HA/IJjgeafpiXcAoP3yTBjEXnquD/Tvmr
X-Gm-Gg: AR+sD11IXBzVyx5dAp2x/qI9u3ADQF1IZP6SsCw8D4Ry/HyInOkAUgRpMgkfllrDnuc
	0hSoEoEP4EPHDlOULluuHo2fHiNpsiTeYVIM6Eqql2tZXXJQ2x28GmgVuXXMsEYScL7/Pccz1cw
	VhBmHovg2akkr/+EwB+ANsHeulAaj2tLlo29LWOjAISeoX2mOSSKRd2nOy+/LU21MOz+/W++qzj
	lbURYhUG8PWxliujijyXqlGANGOIhG/Ty9MyO9emugQDjXBj2WCpISi8NjgmeMYgabnEnyRPRYS
	PCT+Jt97FQ7HoE8NMMswYcsutzryvNmh6j91kfZMRtH3IJXSgS1QnwkgrhVeMWgHuoKkpb6F8Y1
	zPWh8YInaeLpAqKYWYdINDZJBM+K+AX9+y7r0Tt+dQE1xqNx+O4MMdMzUp+E+vRkUozRR1sLaj9
	OSOHPru4AEhUcNEbWNW+wiYM6IeU5XBXYkxiaG
X-Received: by 2002:a05:690c:a99:b0:81e:66a0:136b with SMTP id 00721157ae682-81f33cb39cdmr14100257b3.31.1784741070165;
        Wed, 22 Jul 2026 10:24:30 -0700 (PDT)
Received: from localhost.localdomain ([2a0d:3344:2841:7708:a101:2b8a:f76:a00f])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81f33f35417sm16652167b3.47.2026.07.22.10.24.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 10:24:29 -0700 (PDT)
From: =?UTF-8?q?Juan=20Manuel=20L=C3=B3pez=20Carrillo?= <juanmanuellopezcarrillo@gmail.com>
To: andre.przywara@arm.com,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: =?UTF-8?q?Juan=20Manuel=20L=C3=B3pez=20Carrillo?= <juanmanuellopezcarrillo@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] pinctrl: sunxi: A523: fix voltage withstand encoding
Date: Wed, 22 Jul 2026 19:23:56 +0200
Message-ID: <20260722172356.2509190-1-juanmanuellopezcarrillo@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260721223956.13665-1-andre.przywara@arm.com>
References: <20260721223956.13665-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Andre,

Tested-by: Juan Manuel Lopez Carrillo <juanmanuellopezcarrillo@gmail.com>

I hit this exact bug on the Orange Pi 4A (T527) from the Ethernet side, so this
confirms the "reportedly Ethernet" with a concrete hardware data point.

Without the fix, GMAC1 (RGMII, YT8531 PHY) is RX-dead: the link comes up at
1Gbps but rx_packets stays 0, so DHCP never completes and the board is
unreachable. The PJ bank rail is 1.8V, but POW_MOD_SEL was left in 3.3V mode, so
the RGMII input thresholds were wrong and the MAC never saw RXC/RXD.

With your patch applied, RX comes back: the board gets a DHCP lease, and a 500 MB
transfer lands with ~365k rx_packets and rx_crc_errors = 0. So the CTL_INV
variant fixes it the right way, at the driver level.

For transparency on what I actually tested: I applied it on top of current
mainline (torvalds 248951ddc14d, v7.2-rc4 + a few). It didn't apply cleanly there
— it looks based on a newer pinctrl-sunxi tree — so I rebased one hunk (the
BIAS_VOLTAGE_PIO_POW_MODE_CTL_INV case in sunxi_pinctrl_set_io_bias_cfg()) onto
that tree; the change itself is unchanged.

FWIW I'd independently reverse-engineered the same inverted encoding (bit=1 ->
3.3V mode on the A523, vs earlier SoCs; the BSP calls it "power_mode_reverse"),
so this matches what I saw on hardware, and I'm glad it's handled generically now
instead of my board-specific DT hack.

One note from poking at this, in case it's useful for edge cases: on this board a
few banks behave specially — PF is the SD UHS 1.8/3.3V switch (best left alone),
and PB/PH take their voltage from VCCIO rather than a per-bank bit. Happy to test
those paths on hardware if useful.

Thanks,
Juan Manuel
