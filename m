Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793173482;
	b=3jzLJFBxuRzJPV2zeyQMYoX7pIpGm+3k2mWMHx8qBOEgjZ5l1kX/Eh4JZ7RPwvOiaFef
	 QObiclpq2iA4bKtZTN+yxF3WIK5+JeWblRTbVkpkD15gjqAP6lKZhKNRTcWmkYObPHnNX
	 e4LIBcoPKA/Sb58zBDWnVfPr+UTzulfL4PRHOoph8WkWwRhxJoeOG3IdUW3hyPM5jO5+Y
	 EURTC5M9+nplO1Uzsq987cSOPqECJKR3CNqsCudJZC3xmD1JHZL10lERh8VWPa26k7olr
	 u3JqzUP1DfUz4EnBMxn739+vw58pBmKmdOdFo3apecMrjDWr9YDACO9/9AcZzTKbL7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793173482;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=9PPD/mUgGF3odbO9HUc+ZEDM/rOsDf1Ah7YKLsgVXgQ=;
	b=qunS3czfWPkU+4FNI+eTECoUdC1PsBIp7KeRvWEF8O1laMHJu7/QtmisXmumYQo9WwPh
	 QyiPF+4VTIFGl4IChNv+Svl0wFfxrJW2SJw3whbkMrbJZOds/2EpnJn7HAsB/i3M9JU4k
	 Fm0os7UHN4vAQhg/L9PdCL+IYpQ46UuQABzUU/DNdYIPpScFRytfMZKSHSvNeQ72cjdfX
	 2oRoBL0l3BoB2E1IjYU0knqjXexUOyIfLCS93WCkVPP9Yt14F4AUR0v9PgYcj1vpGHwuS
	 x/FQhciWP2DvrkGce2r2SyLrSRIOlUTQaMC/rj2aFXFol5tF8lXkRWr2E6DbIBO+Vvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amarulasolutions.com;
	spf=pass smtp.mailfrom=amarulasolutions.com;
	dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=o+dQgdtT;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCAD8606A31A
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 07:44:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DCAD8606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=o+dQgdtT
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-49d05d51553so4030375e9.2
        for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 00:44:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1793173480; x=1793778280; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9PPD/mUgGF3odbO9HUc+ZEDM/rOsDf1Ah7YKLsgVXgQ=;
        b=o+dQgdtTPUArIk8G4DW9Oqsp764+f8J6aW0ayYaDCegAjgvjAOMBnfqzTJSmDzmm9n
         i+NZAC2XlxKHwZKwEPJ1B5aeJF5Pg1JAVxDHGVWJXAXwG7tAR4hxMgaOdwgppP/CRpck
         ruDoRW+vGo3C1vOq0mA/5x9Lp++jUhBtyGI18=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793173480; x=1793778280;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9PPD/mUgGF3odbO9HUc+ZEDM/rOsDf1Ah7YKLsgVXgQ=;
        b=G1hQL/dLJQGFUEqhBOnjgGZ78HNpo2kyRNKAitsf5d7KZMlNQvyXiIMJa780FU5Hm+
         jwAzWxoiSZpN0x9ofZFIWkWC10o49tCW1hOyVTyTiNMQi+/6e22GIlJMgqHDa+rTT2cP
         6C121wAlODzxWngnOYcB573riOIXiJ03YKrmOqUD2qxJLsa7zJ1xE8CPBvtjuiMydV9n
         jr/1Rz7XDGY0OVuPBE5G2N2bro+TiRgNm9NFULZLpr6YI8c0Qy72fj863erN+0TucgcX
         N3g8bSBDPzDtw2pX4sPbKFhiKY8+xY22k1RdNNZdUC7Y54qjbhipqZ3fY0ABbdPpCcRh
         v7bg==
X-Forwarded-Encrypted: i=1; AKwUvBznd4lnvjb1aVCLXYnI4AexFUevQ2BYVu/YddrkFVBKa0yW8SIazdGekBGSuJhBAqJg9/+6fad2cFob@vger.kernel.org
X-Gm-Message-State: AFq9FYIAfx7brv0qVR8cMnDbVV2Jg2tyj5xHwIrRXA+lWtAKaF/9xhbu
	kysWiz1YINkQbSz2Lliipr+fNNtQ9dnYunS7aGmAcNf3UPckGSyFVlarziEKXwZENeM=
X-Gm-Gg: AYBFou1GaKU34BWusCM7l7eVZBltDw7QV1Lp02uQ5X+UkzmK2d8HXOSFBwWWKu/mMou
	HGmrfjlvmhjg7rS43wiIMKxxQMI0IDh6UBdTncbI56drcNVT02d/7x+1+073fSrucsV2s7THDNq
	I1q5q8t3h9G5x5ocRgHxYzXjnQY1jWvM7trHvwO9c0k58Kt8b5KNcfayu3kKlcf6B12AhsBSrtW
	ZZaogFe0D4GPGZmOACmOxL6BS4yI2xqSVyM5J+LDMF1NhyO44AcnbDq9snD8R8WoLqLwClmjffA
	p9fr+s5GrUu5Ti4vnS5J/FXq3rT+NzyLIhg0FnsHkiyk9TmKoHfS3j5LNwkUGkEvs6h3BapHeAN
	nnbTNTotF0boxVRJjTSXFSFLpdU+sfh14Q1uJ9pGVY+VPxrjP820NBQl3VgGE7qFnz4KBUYRYrI
	CNTOqxKCToiMgnF4jHw4Rp7otzwpQdZ2tSRxOkxf0TzKNgbTLVa6x7qygSrSEosLGexaIROg4V3
	Bj60M31hYSQNQlPaamlQPoU5nCByyayGf8jtAZltxT5+z5jFiurOIitQmer2zpjV+EEFZinOgOu
	taDgSdEcfEFdv5+OiOwcp1R3OxtR0D+3ghGOuaHoEyeIf0pHh3RuOGNvdpXGFst4TSPdmGXSWQL
	5dgN6GHUUN6/oW/GqiGW4Qe976Dec79LY8k1Wg/Gouz5pNhp2hm5G+L9mLvfyR09q6LjvAY/xpn
	S+Mum99HI41183x9BgTAjoP51MOeVbr1VvA8jGvJur4N+D6ho=
X-Received: by 2002:a05:600c:608c:b0:4a1:dadf:9876 with SMTP id 5b1f17b1804b1-4a967016833mr27902555e9.23.1793173480359;
        Wed, 28 Oct 2026 00:44:40 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-79-14-29-58.business.telecomitalia.it. [79.14.29.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e412cc164sm25324882f8f.7.2026.10.28.00.44.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 00:44:39 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	michael@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Brian Masney <bmasney+clk@redhat.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Tero Kristo <kristo@kernel.org>,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-omap@vger.kernel.org
Subject: [PATCH v3 0/3] clk: ti: dpll: switch spread spectrum to the generic framework
Date: Wed, 28 Oct 2026 08:44:06 +0100
Message-ID: <20261028074436.1958132-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The am33xx/am43xx DPLL spread spectrum clocking (SSC) is configured
through vendor specific DT properties. Since 7.3 the clock framework
provides a generic API and the assigned-clock-sscs DT property for it,
so the series moves the TI DPLL to the generic configuration and
deprecates the vendor specific properties.

The last patch applies the configuration right away, as the clock
core skips set_rate() when the requested rate is already the current
one, e.g. when the bootloader has set it up.

Tested on a BeagleBone Black with equivalent parameters, set through
the deprecated properties, assigned-clock-sscs or both. The dpll_disp_ck
SSC registers are programmed with the same values as before the series.

Changes in v3:
- Deprecate the properties instead of dropping them
- Keep parsing the deprecated vendor specific properties
- Skip reprogramming only if the configuration is already applied
  to the hardware

Changes in v2:
- Check the DPLL lock state instead of its parent, as the reference
  and bypass clocks can be the same clock

Dario Binacchi (3):
  dt-bindings: clock: ti: dpll: deprecate the ti,ssc-* properties
  clk: ti: dpll: use the generic spread spectrum configuration
  clk: ti: dpll: apply the spread spectrum configuration right away

 .../devicetree/bindings/clock/ti/dpll.txt     |  9 +-
 drivers/clk/ti/clock.h                        |  2 +
 drivers/clk/ti/dpll.c                         | 20 +++-
 drivers/clk/ti/dpll3xxx.c                     | 98 +++++++++++++++++--
 include/linux/clk/ti.h                        |  9 +-
 5 files changed, 113 insertions(+), 25 deletions(-)

---
base-commit: 65ba8f34ec886ec72b2c07ddc8cf3d815c32869d
branch: am33xx-assigned-clock-sscs

-- 
2.43.0

