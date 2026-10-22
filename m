Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792699608;
	b=NqWKS2mkTUChW0aehRv168tS//8vOrQS6a9xr/7jNQq8gglXTEGTBxndThEJIbP59o9b
	 5f24ReZuLo1LEJtOtALTdlMO2ZNNgTRode7ZJe4JC4rChVsjUA4JTg6Inpst+XaPmBP/T
	 CPdcA3W04pSqMmE/2UyKTVFOcbH4EZBrF2FnQsdYWES4wF7iT7jPNmyctQ+L/S9Zu5ys1
	 VG6GOaRjlJI9WMKdCAOjbJCp00zLUBNxMwsRZ9mSUPzMDNyn89DIQVDHANWt/JWMRRS79
	 o3KlMY5cV350K4msaX+ph+lk9G5FL4u3HQxJbA6RdxAQOrIpNYEgGS+rJW29rrVNn2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792699608;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=XlLc/FPyLGvA2r8haINizk1+kzXPPQVxnilYmb128Q0=;
	b=N2ZbPck2oYKcNx4KwYqpRAkr9xUdvAaw3G2UqcIeJQ3O+dQLDhqKYb1nKKzAi97Ol5Rt
	 uZRhueAsod+U2l0dbx8nJPNWQmLrvnmi4puFHrOMOtm74HoX1bfnwZC+imWai9GaSzOes
	 +B5ZltwEJoE90EAXaO4nXoKzjcgc9CcD30MfQmA9Oc0XdpBOwikmfvSiTEAy1x0479Yjc
	 v1guNmbnJmFmPsl5JPiilZ0WiSl0j1gBUqkSXIFS2UQuRFXoufT5DC16hOlQRsGgxyD1a
	 HQefMx6pWS9w/CvaV21TOdIbD6epygo60HL6gYi2f7ui81RQhLzVuAVRe/Fp+QIXkPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14094606A31A
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 20:06:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 14094606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48df4f540ebso89476f8f.3
        for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 13:06:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792699606; x=1793304406;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XlLc/FPyLGvA2r8haINizk1+kzXPPQVxnilYmb128Q0=;
        b=ZJiYbhk7a+Ou4L9HiB8jVyNHmfOdQeyGmn+QVHKbLV9COV4hNt801HAyznFnbPtUUb
         h4XjNjWbzvXSspzcJ3mH8rjAkYgl1Z0cubOO23OifAVnMh2kconcasdBvSu0PIIN052/
         CURel0mHfCYF7ChK1fJYlFawFnyjilBdcuC5IGwHfE+1AFPw4EQmbDrw6sj7Iep4xSJi
         gSyy6h+J6w7u/YSlWL/Ezat149Q6itxuWnMvR90CtB8Y1E5xtxMsH5HrR5oIsy+nGQlX
         /Dh3gdKu7dvJuO1YXARZOX/dub5PfdMgVSaU0IHxk6qPm6KnjSt4bmqaFTnp/6E7P4I0
         VQ7A==
X-Forwarded-Encrypted: i=1; AKwUvBxZqyzqzfqVQF8TlLfGzGJYOPyxpRgzqClksAOWQMHhc+16pjr7fuJguJoXJZT1yQx0//yA+y0eoNOJ@vger.kernel.org
X-Gm-Message-State: AFq9FYKAIJ0pWgcdnpeCZli8Nr9dIehXVLX5OvuACVVGlqUcWx5PNoL5
	y4S+tqdcNOjQQF76lwL4XhjhTvtPgRhD34nDBTipIFK1GNTHKPDsBWWf
X-Gm-Gg: AYBFou2hPYtKB/LzyCMLW1dv8oOlvJJ0EcU/Fhwi3FfIyktazNDECRPcVyrGQPXt29r
	jYAf1E8jY4Lz+J+CS0Ni+JTo8kFhy8Tep0zkyiaCiswg72AX2cdr2FVhDXbTuNGQkVe4IO0oxV7
	Od/bYtdWI97Zb2tjACeJ6627kLR7f1xVt/dLFyP/KTfATv2/NWzCSjAnRDkYiPO1xWX6dPsOJ04
	HAG0YpP5CODEXJ45Dp4hDF8VTbBSQJD8LmYfmNtXUAkAck2v3L935AL4m+WOAiPolun4viThEk4
	TBXhzl/WrEL+9NojvmAJL2+6/29hj9IrOxVfpFcm4j2j8PSY5wvKmE4h/GyiB7OZM6cJLKLnkUN
	YbXgn1lGbN1jg/XKwLXw3xvLqBAyqsFvNsqVQy5aBTC4HrlNWBFll2Fey5aeJODoRPbNQ2yUVuS
	fn5QeSRXo5Jie98t6Jh9B9Ba8A+iNVb6QIlTqo7T25KtJUgCPSpn/mseZolHdKENUS5FEMByMdu
	0KCU77RKXU4ZEuvicVgzZblnL0tFJZVUS9C/CWa6GAJiJslfWXIGeC1x9sZI6vDCW+nf0xtRM31
	93l6V6mnEMj8Mgs=
X-Received: by 2002:a05:600c:3114:b0:4a1:a39b:e75b with SMTP id 5b1f17b1804b1-4a211cb296bmr2188745e9.21.1792699606184;
        Thu, 22 Oct 2026 13:06:46 -0700 (PDT)
Received: from threads.localdomain ([81.79.62.202])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a2123a1797sm35965e9.1.2026.10.22.13.06.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 13:06:45 -0700 (PDT)
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
Subject: [PATCH v4 0/7] Add ethernet support for the Amlogic T7
Date: Thu, 22 Oct 2026 21:06:33 +0100
Message-ID: <20261022200640.3101932-1-tanure@linux.com>
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
plain rgmii-id. v3 said the RTL8211F TX delay did not work; that test
ran with the glue registers gated, so the bootloader's MAC TX delay
stayed on and the link had 4ns on TX.

Tested on v7.3-4494-g2a08195e4db5 plus "clk: meson: t7: keep the
memory fabric clocks running" (clk-meson-next): 940/941Mbit/s with
iperf3, no CRC error in 421k frames.

Overlaps with Xianwei Zhao's "[PATCH v2 0/3] t7: add some nodes for
Amlogc t7."; I will drop or rebase whatever overlaps once we agree.

Changes since v3:
 - phy-mode untouched, the PHY adds the 2ns, rx-internal-delay-ps is
   tuning only, tx-internal-delay-ps not valid for the T7
 - 0 dropped from rx-internal-delay-ps; vendor delay
   properties explicitly false for the T7
 - init_delays callback; the old parsing moved into the older-SoC
   function, marked not for new SoCs; patch 4 renamed
 - VIM4 without tx-internal-delay-ps, the PHY TX delay works
 - Meson8m2 moved to the dwmac-3.70a list; its boards warn in
   dtbs_check until Martin's dtsi patch lands
 - the delay table in ethernet-controller.yaml dropped
 - Martin's Reviewed-by on patch 3

Changes since v2:
 - the controller-side delays are applied on a T7-only path instead of
   changing every Amlogic board (Andrew); the PHY mode left over comes
   from phy_fix_phy_mode_for_mac_delays() (Maxime)
 - tx-internal-delay-ps is checked against the four values the hardware
   has, in the binding and in the driver, instead of being truncated
   (Sashiko)
 - amlogic,tx-delay-ns and amlogic,rx-delay-ns are not valid for the T7
   (Neil, Andrew)
 - the on-chip PHY no longer carries max-speed, phylib reads what the
   chip reports (Andrew); same for the RTL8211F on the VIM4
 - the PHY interrupt line, GPIOH_6, is described on the VIM4 (Sashiko)
 - new: the T7 node owns sys_ethphy as "pclk", see above
 - new patch 8: the delay ownership table in ethernet-controller.yaml
 - no longer RFC
 - Conor's Acked-by dropped from patch 2 and Neil's Reviewed-by from
   patch 6, as both patches changed. Patches 1, 3 and 5 only moved in
   the series, so their tags stay.

Changes since v1:
 - new patch 1: honour tx-internal-delay-ps and rx-internal-delay-ps in
   the rgmii-*id modes, and pass the PHY whatever delay is left over
 - vim4: phy-mode rgmii -> rgmii-id, and amlogic,tx-delay-ns plus
   rx-internal-delay-ps replaced by tx-internal-delay-ps = <2000>.
   Neil's Reviewed-by dropped from this one, the change is not cosmetic

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

 .../bindings/net/amlogic,meson-dwmac.yaml     |  89 +++++++++--
 .../amlogic/amlogic-t7-a311d2-khadas-vim4.dts |  19 +++
 arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi   |  88 +++++++++++
 .../ethernet/stmicro/stmmac/dwmac-meson8b.c   | 139 +++++++++++++-----
 4 files changed, 284 insertions(+), 51 deletions(-)

-- 
2.56.0

