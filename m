Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793873007;
	b=YLiT6Cc3ND30opN33+h1sjqcCC/hjomnCncBDRBXhQ062dkyXgm0ra+r8YdzHXiGaI3L
	 fC0zA0KYmi99I4KWUnszA8RaCNtcgBNkuSjjDei4Do60Qziz+P+MEEXRACk9X+YkXrP8E
	 e4NXXcu8C8MbE4JFwPKtS9GG8DEJ9YLphRswVc15nYjS4/UOH6zu554enAqf9ZUnYitJO
	 0sXWdJ98MVSi18MZ8GwkmPdoBesQHFca9XH3V+xO8fkhMDzk5ugo7nKZbBYYGeYTLF201
	 qy/5k/BL6rzbIVoWFxJgpCOSktFUKffNBoi0dYkH0+dSgt3JjKCUsX5MFLHvaq45Vbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793873007;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=R6cyamQMSGS+vKmEK5CyaNiN3MV88pM7I1W9QX3v1mg=;
	b=A2wBzNYYTy5QWgjzA2dS6rbXVjYcWN5BhB5CzcL9cBIi3rjNh75OzX3sC/3dbjiwERiL
	 uFCRvx6greM7sSAXR2O55g1G6O0MsxXfWovasIxR16RXkbxM95hbTRo5mS41VpBgRfPXd
	 Fyt533Y74rpUXgGFtD7xUDFl4UeOYH9vAGW6PnGGhrK3VaHmbdyo50jTHeLzAZHuHWu4D
	 sLSQRjBuBNzAbn6/xUPfj3TxH5zdtBghvv7lPDqVcMpZ8vvcJs7P0xsNXiY2anpvOkH0V
	 6BV0NkIU8xOOVv079plGkCSevbLDsN8ZT0arUrdB6YGfod+IhVlcu3h4LFCI9USJz8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A018C606A326
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 10:03:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A018C606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4b4571ff080so17807315e9.1
        for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 02:03:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793873005; x=1794477805;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R6cyamQMSGS+vKmEK5CyaNiN3MV88pM7I1W9QX3v1mg=;
        b=BwhGPVGHxkhF7l5kc0rXxvke8Q9APn6pZtAgeC/3uExCVMjfVyChUELNzbDhiJd6yd
         2W8nu3uHs6yQ3GKjMaFIxwYFzEd3hDUdTu+GDFFATA4SzyymfTdOLy/VdNkt3gNhh342
         g8k7UiaFsG3qkfn6BTD3tBL2DmirKJ9Dds3S+ZPRUPI7BLOg1FrBeTB6hXcOZ6QYegyF
         KmZXVMd9UMuhCgYW3774yKFqPhk41AVr7yYG+x+9BjSD/MfuHNgQ35WZ4kPvqVbf7GBR
         qHQYCAYnCJeNupeSEbFFgaKfFLnCxmOUZA7ak8LCmeQr5EDvIBpF0Z92YzqqFeux8yFQ
         gm/g==
X-Forwarded-Encrypted: i=1; AKwUvBwis3FFZ7qdY/vJBTXpCs/9+ONwjK6oqwVMn+uOiSAUx8r9el8Sd92SOcISfg7D8Kl4Zlopim/zRO54@vger.kernel.org
X-Gm-Message-State: APuU4Z/Ttr6u9ZWlqYFIC/1tZfNQrM2goLSiH2xhMe0OhDliVWuPRmxU
	8Olky7Ap47s1jdLc86m5uFwN4kwA8J5Z8CWlP8/qzPjjkXq918ZfbxClCfNfYvHlfpc=
X-Gm-Gg: AYBFou1ysk32hoUboY6ctW8C7S9vpXYkwZiga/qyNtoPghBnKZsVYGfA4P40MOC5v0d
	l7qYHtzUsKe2Nb5teNBOS4pRrTOat4laetDcRs9zGIN4nRQIQDJMMQ1mlnI5pHOD22nLU5xMFFU
	+Aj6ugffDq7/XTOVWCri1rtSm94MrHvm8f/0VBTN1vNHN4vMYapSPcW/L0est83MzuBTQeJhKLs
	DeJykEk6W1x7BxquDLHELz20Wa+1S++CfD6wFs/jNlxdRQf0F5lx70PdGqkpFV4YhFqwjnNM3Hu
	j6hyqHgnslJKw1xCBVwpovVleeQMlIOCKGkmgWTYu8yb7rwZsL4QGkHNPfKFGJ4EKTPG4q0hzXV
	qBlQmESodlcz9gdo2mW/+LG9VtzzagJXBMf15We62brW6qspczCjQOlGKGM5fkoG6Pymg7+raUL
	L0uLTNByI9Rt8Etj2BvcxvjQWRTlovPxnRRfzCmmJFXq/CLaDCCbPQH3cxie1Tk+yXhIXPsca6u
	mcg9gZx6eEfdu0h0qpJlz4Mob8jgwQBM5JcFZiHr7BIvtRQKJLrf+7AKdmUx8puEH8ioIUlE6bK
	qPuabPb15NS7rnr5qe6+dshdrJdV7znNV3JhqmWQm+iaJns+Y4IYzTOAKANVDOtzkmz8vt/a9FT
	kfUflm8uOlJxAG7hHOA+E0B/WZw==
X-Received: by 2002:a05:600c:e547:10b0:4ad:5e09:ae43 with SMTP id 5b1f17b1804b1-4ad5e09ae61mr211533235e9.29.1793873004567;
        Thu, 05 Nov 2026 02:03:24 -0800 (PST)
Received: from threads.localdomain ([90.254.187.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b43342773esm53455775e9.4.2026.11.05.02.03.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 02:03:23 -0800 (PST)
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
Subject: [PATCH v6 0/7] Add ethernet support for the Amlogic T7
Date: Thu,  5 Nov 2026 10:03:15 +0000
Message-ID: <20261105100322.37816-1-tanure@linux.com>
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

Changes since v5:
 - patch 2: the T7 block follows the Meson8b..G12A block instead of
   splitting it in two; default: 0 for rx-internal-delay-ps on the T7
   (Sashiko). The explicit false lines stay, as asked in review.

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

 .../bindings/net/amlogic,meson-dwmac.yaml     | 78 ++++++++++++----
 .../amlogic/amlogic-t7-a311d2-khadas-vim4.dts | 23 +++++
 arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi   | 90 +++++++++++++++++++
 .../ethernet/stmicro/stmmac/dwmac-meson8b.c   | 61 ++++++++++++-
 4 files changed, 236 insertions(+), 16 deletions(-)


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.56.0

