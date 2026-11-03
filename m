Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793723839;
	b=D4O3l4J62YQNAPQfT0Ea/ZMG123myxlmEFZIz9PRJbD0+Q9ZYh/mV6KsCGg92IKsi7Eq
	 eAT4i4oRpZdUo/Zk3oVVidUSO6zkcMFMP/xEDjP+Q6PEpb8d4OeIWdYBVleoXGav2h3cy
	 ezzvC6QlOYNruqEYzgqZ0IyxuaAStEb7NiaKTfAIVPDtm1WyIo4pUAAAO5JWE/V8/kPHh
	 VjmedOSY1HYuWkWYhui9BwU43wblC1SJUwxz4w30oRq19yidd2itEod6p+ow/gqdp04Za
	 z+hAQhZYsXo/h0Hs5kSDmqmDzuX0I9GKMFvVT34vmJa5g+t25rhp0+gbegv4+0yOs2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793723839;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=Jpxt/nQGal/nc4TuRsev6IcXoTzVp5Y6wAOXrs7jBpA=;
	b=nHcN5CocN+XOgKrlPOak4hDLfxawNW38OznLs/qDuciJKOxfpHPZYpn/6ft6pvUQJkkI
	 mK2orjmc3KARqB/V9eUQIY3TlwtUhuBwYgWwkFbZanQbj/2Yw8adzsx3H68U12swoLPDN
	 cH+hIY+aXuCR5RrBTv/DpQvdFSBxBZaqrhYNJLH9Kymx6IQHJnbhk1hM/8WjuAtf91O6d
	 5eNIGnOtx0vwJEKj1od/HhIs2Cp6zrxiy3kAu/hkS97iu+8ZrHOTxAiPKK7R7TryfDPcE
	 drTKx5spIALQvrAGkMwEJiDv3Jbc8i4F7DyDltSY7q5p1CGpk6aUr1PIqhlsRs/bz8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 347BB606A328
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 16:37:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 347BB606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48e20ed3b9dso3866986f8f.2
        for <devicetree@vger.kernel.org>; Tue, 03 Nov 2026 08:37:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793723838; x=1794328638;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Jpxt/nQGal/nc4TuRsev6IcXoTzVp5Y6wAOXrs7jBpA=;
        b=X5+nnW9INCpCtU0UNvvtngxMHaV2koU+13raWxsfOcXtAkw1/v5rAxh8p+hU7pi8hu
         rT8pJlKfq6PvtIlj34/EO6OhPUIY8dzgQnjbekRuFv5NM1PSWCa8qzpWL+U7rZBVCxTk
         gta0wQ1J/Ermk+Lq2ma5iiLoviqs+QtaAVjOQWmga6ZHU9NC4ypi4MdXo+eqA0iD/a1c
         jd2DZD44826clGprD4/3nJ7AzZE2HoYfAFcSnBBPNXjyQF/vIMy2/imd8DIT2nzS8f+N
         zev30sfz0vhM9vCutljQLSD4LvSEcOb51IdW+6W05meZOkys18QHrtCMAUJPloStcbUR
         ew7g==
X-Forwarded-Encrypted: i=1; AKwUvBw7j2PLLhKyql23tPaR6gNeKkn/CcfVFWd+S2FNnx7QnokBuspVsrQIcaXiJ3N2BcbpeZhgv3fW1VhL@vger.kernel.org
X-Gm-Message-State: APuU4Z+lEtWNNvyJ85vbvNBMr2rPWCMgpqBrjrinQ23GT5wY4kJ+Wi9x
	XUBEp0k3GnfK0vx1tNyGOZ9pae8eU3P3LzvTii065gNBphig/COd19eh
X-Gm-Gg: AYBFou1cdyXN650RwA3Ub0sc8XXY1ZKKjLfXbuqcQ5haudVYgaZOZH/Z+8vzbyDBLi8
	UGskSNyxqgKGekc+lxDxs7JZhx5j4upAfdJjXDWbYTSYhy/oy+FGqpPFkLoe8/2FiR9REhTiC91
	5l6SgmjtyHoIA0xgqqxOgNMZvuysslVWsfpC6Y7WY+tyt0VCkUHEM4cTxMg88eENWkiL4Qhvw43
	4Em8oiiP/UBiWKlrvMqyGAHQw0BcvTFPCTJo6Tr2XOErf2rPqfbqaj2GBwxZKhF9frin2OiI33z
	ZHTSFmaKYfb+CuYDxcYMMbye+7bn8Kl9MRfKd72NslD4W2KDdXIXT5qPURnzkPAHRN79zjfOG30
	6B+57CdUnV4yX//rAIod7ptU6n3CZhIuW2dWNcwIvhHT5efjNDmxz/6kyKf6qhraSkkhZU+qpc2
	7kyfiWVcrk3hXj+VF6v6bXa8nTMByOSDX725iV68JxmVsTrf38+KE8lxeVFPeIwnPGW7/kzcdfB
	E0WVjeDp8EmbztvLrSgMhto2rzOiuKZD95Vrlg+dpCaVXndgw1HOoXXCKaPBLtCxa3ale4VIx4o
	k+kEdTLTP0uoaiPie/n3DKxAH4jbxhmRNr3aYGYNDPE0MG00USCsROUGxXEk563A94XhGju0uRa
	8NG67BbPxn06Q+MovCtB8MXY8NA==
X-Received: by 2002:a5d:588e:0:b0:48e:6652:fdc9 with SMTP id ffacd0b85a97d-48e6e4f54f1mr28922601f8f.17.1793723837259;
        Tue, 03 Nov 2026 08:37:17 -0800 (PST)
Received: from threads.localdomain ([90.254.187.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71a4d3e9sm29044772f8f.6.2026.11.03.08.37.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 08:37:16 -0800 (PST)
From: Lucas Tanure <tanure@linux.com>
To: xianwei.zhao@amlogic.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	davem@davemloft.net,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 0/7] Add ethernet support for the Amlogic T7
Date: Tue,  3 Nov 2026 16:37:08 +0000
Message-ID: <20261103163715.385394-1-tanure@linux.com>
X-Mailer: git-send-email 2.56.0
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

The T7 has the same ethernet glue as the G12A. This adds the binding,
the driver support and the device tree nodes, and enables the port on
the Khadas VIM4.

Two clocks are new. The pipeline stage between the controller and the
DRAM has its own gate, which nothing else claims. The glue registers
sit in a block gated by sys_ethphy, so far claimed only by the MDIO
mux, which probes after the glue is programmed: every write to
PRG_ETH0/1 was lost. The T7 node lists that clock as "pclk".

The delays follow ethernet-controller.yaml: phy-mode is never changed,
the PHY adds the 2ns, and the T7 accepts only rx-internal-delay-ps, as
fine tuning. Its TX side is a quarter-period phase selector with no
small step, so tx-internal-delay-ps is not valid for it. The VIM4 is
plain rgmii-id.

Tested on v7.4-rc1 on the Khadas VIM4: 940/941Mbit/s with iperf3, no
CRC error.

Overlaps with Xianwei Zhao's "[PATCH v2 0/3] t7: add some nodes for
Amlogc t7."; I will drop or rebase whatever overlaps once we agree.

Changes since v4:
 - patch 4: the old delay code is left untouched; the T7 only gets a
   callback of its own, and the probe parsing it shares validates the
   RX value (Andrew); no NULL check on the callback (Martin)
 - 0 accepted for rx-internal-delay-ps, the T7 joins the G12A list
   (Andrew)
 - comment on the deprecated vendor delay properties (Andrew)
 - the MDIO mux and the on-chip PHY bus start disabled in the dtsi; the
   VIM4 enables the mux (Sashiko)

Changes since v3:
 - phy-mode untouched, the PHY adds the 2ns, rx-internal-delay-ps is
   tuning only, tx-internal-delay-ps not valid for the T7 (Andrew)
 - 0 dropped from rx-internal-delay-ps (Martin); vendor delay
   properties explicitly false for the T7 (Andrew)
 - init_delays callback; patch 4 renamed (Martin, Andrew)
 - VIM4 without tx-internal-delay-ps, the PHY TX delay works (Martin)
 - Meson8m2 moved to the dwmac-3.70a list; its boards warn in
   dtbs_check until Martin's dtsi patch lands (Martin, Conor)
 - the delay table in ethernet-controller.yaml dropped
 - Martin's Reviewed-by on patch 3

Changes since v2:
 - T7-only delay path (Andrew), PHY mode from
   phy_fix_phy_mode_for_mac_delays() (Maxime)
 - tx-internal-delay-ps checked against the hardware values (Sashiko)
 - vendor delay properties not valid for the T7 (Neil, Andrew)
 - no max-speed on either PHY (Andrew); VIM4 PHY interrupt on GPIOH_6
   (Sashiko)
 - the T7 node owns sys_ethphy as "pclk"
 - no longer RFC; Conor's Ack dropped from patch 2 and Neil's R-b from
   patch 6

Changes since v1:
 - the driver honours the generic delay properties; VIM4 moved to
   rgmii-id with tx-internal-delay-ps = <2000>, Neil's R-b dropped

Lucas Tanure (7):
  dt-bindings: net: amlogic,meson-dwmac: list the compatible
    combinations
  dt-bindings: net: amlogic,meson-dwmac: add amlogic,t7-dwmac
  net: stmmac: dwmac-meson8b: add support for the Amlogic T7
  net: stmmac: dwmac-meson8b: follow the generic RGMII delay rules on
    the T7
  arm64: dts: amlogic: t7: add the ethernet pinctrl nodes
  arm64: dts: amlogic: t7: add the ethernet controller
  arm64: dts: amlogic: t7: khadas-vim4: enable the ethernet port

 .../bindings/net/amlogic,meson-dwmac.yaml     | 88 ++++++++++++++----
 .../amlogic/amlogic-t7-a311d2-khadas-vim4.dts | 23 +++++
 arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi   | 90 +++++++++++++++++++
 .../ethernet/stmicro/stmmac/dwmac-meson8b.c   | 61 ++++++++++++-
 4 files changed, 246 insertions(+), 16 deletions(-)


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.56.0

