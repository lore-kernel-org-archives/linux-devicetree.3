Received: from mail-qv1-f98.google.com (mail-qv1-f98.google.com [209.85.219.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C4673D994
	for <devicetree@vger.kernel.org>; Wed,  1 Apr 2026 01:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775005635; cv=none; b=gg4J45GmGDFnwxquRWMy8aNEb5VfnTjEutddHKpEPvZwCOXidL241PLB6CDjlMgd3c7H107OW1M7bXFCCvfXxE4ZuG7q6QbA094OD5tpHrkJ8blxllkk9IrTssVQAWZGxKftIviLrCxTSG1dSNIzlcKBqh7BTcouvGiVpuXSAds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775005635; c=relaxed/simple;
	bh=nmpffVr1ddnUBluqFttiTj9kAP/yyikUvrgSsTApo3M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Cb1JfP59t4klz5qSkWgH8X30Kp7myBsP8nuwl4QXPDKLtya9QJcZYrvSy/BO14NG0BSOj4vEL+KaDW1o4yMKcmexdL0k6+YIudGAK97S2yokIemNT4k3SukN0RFY4iFlo/aGrfT00NfNC0buFSbhwWwJ9eyl2WtJ04sPtywRN9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ausil.us; spf=pass smtp.mailfrom=ausil.us; dkim=pass (2048-bit key) header.d=ausil.us header.i=@ausil.us header.b=kYkilypr; arc=none smtp.client-ip=209.85.219.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ausil.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ausil.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ausil.us header.i=@ausil.us header.b="kYkilypr"
Received: by mail-qv1-f98.google.com with SMTP id 6a1803df08f44-8a05c18d3e2so4698736d6.1
        for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 18:07:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ausil.us; s=google; t=1775005631; x=1775610431; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1OvbiweTCjhtUC8AZj2mAbljTB73GnHpwQYyOLsvAGY=;
        b=kYkilyprptEVqqPqoy68kQJW7kvC0r8Snn/6KPjPfJ4TF4QSdQkcgk7UWocZv2I2oy
         4wD2y61PCBdVKpRo61r7k7zYfBfHsgitDQlBu2Q5FpP4pgEyiqjRjb/3wJzq5+U6V3VU
         05EdkFRNK//CuTEpHxDh6mShvnHdpxwKHdrAf07NBjD7MeAJauBYcFQizkALL53pPDVA
         Rn1qPxnqEl0/zAeP6DJEtW5hZf/CxHonjbOSK/GhWw+dtQEu0vDCB0cHSzsZYMnwna1S
         CLYPT3vyV2Ztlf1XbrKqo6edOanUNUqV21NHamW98W0HqYpy58yd4PbIO/nSEnqbTYHP
         oz5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775005631; x=1775610431;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1OvbiweTCjhtUC8AZj2mAbljTB73GnHpwQYyOLsvAGY=;
        b=Qgl50s3u7feFtdavd3Cb2bI5i/C2vx/r0Za1oJl0N73Zu3kdafKqVQ62FbhsjzrMD+
         LrTkGseaNw631kQ2dgXnsNrI+ecx63Z4mRV0TfwIYlUVkDvUltbvs3mG5JYr7azRCNUp
         JOj/AJwcAJSs70KjIJ/7oaXQAyj9AF91DZVEin4DH1pHQda1gnSA1oL9+/T8OoKS/5HH
         y5gBcgHNB1liAdW0HwGNCDE6qiaWACRRBT3YSZpwL6MCi8MmHqudSJKYRPP5UpP8E7uN
         AyU5nNNwrZrd4vIgL/96RLdPrduZDBTizXY51/3ho/ManimbjqPzlhTW4jTtFmoZNcYp
         C10A==
X-Forwarded-Encrypted: i=1; AJvYcCUGHPjft2TZwzFrkgPAqcWRJBlLcqVPsG/WlbnfKN+JrPAbpefUiRGWpg0REhj78QRng9bsZnVV/aKE@vger.kernel.org
X-Gm-Message-State: AOJu0YwHPAFzG7lafZf7cxCgoayOnnyPElQm+Vjx09xLokeN92mMR3z8
	s2S0S7u322JuUxwWzQ1sa7AaiII5OQ+7L0qKM3fgk9O+T4SUKjxuQ9o+5Hf8t3hdQ9kjV9xVqib
	6wFYIqBP3FG4oCR+Dmma33g8JD/wkbIslzpMc
X-Gm-Gg: ATEYQzxZbf5g/ZNFKmsbcykiqqbHoP+TXUc/S8Kj5hsskhz7/o8npbIb+8deXmzhBS6
	cdkbBs8xvKMTlZoXjWSAWg+lu9IFf71QgdQmYHNkG7nlRr89zPx+7m+c11n8G9chlZqenFFjRJG
	IJFSoBPx0kqQrFPbLFWa3tDq6QI+AuNb+zXcdii3roA63/IoQHpayqkM9w/071Z+pzn6SksY57g
	B6iCjMLI6CI+UH5UgV19ayApRh0OzqpjspyqydOC6NT8Im2mCDuRv9SPlTH/elL6qLVEl121rBk
	fFSRU0CNwAzvd7x6iN1eozRkM21JUWkxm5U09NwIiTrKwwZPJ34RcO+pgheYFGJK6j2FiGNaGMu
	dWl8yhkSPFXPOAldPOCx31t3Lr/QMSUqMQjJVtHRZO2Yt
X-Received: by 2002:a05:6214:4412:b0:89c:8769:1e50 with SMTP id 6a1803df08f44-8a4430c6838mr23940876d6.16.1775005631508;
        Tue, 31 Mar 2026 18:07:11 -0700 (PDT)
Received: from ryac.ausil.us (207-179-239-100.mtco.net. [207.179.239.100])
        by smtp-relay.gmail.com with ESMTPS id 6a1803df08f44-89ecd72ecd5sm14105766d6.15.2026.03.31.18.07.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 18:07:11 -0700 (PDT)
X-Relaying-Domain: ausil.us
From: dennis@ausil.us
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: FUKAUMI Naoki <naoki@radxa.com>,
	Hsun Lai <i@chainsx.cn>,
	Jonas Karlman <jonas@kwiboo.se>,
	Chaoyi Chen <chaoyi.chen@rock-chips.com>,
	John Clark <inindev@gmail.com>,
	Michael Opdenacker <michael.opdenacker@rootcommit.com>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	Andrew Lunn <andrew@lunn.ch>,
	Chukun Pan <amadeus@jmu.edu.cn>,
	Alexey Charkov <alchark@gmail.com>,
	Peter Robinson <pbrobinson@gmail.com>,
	Dennis Gilmore <dennis@ausil.us>,
	Michael Riesch <michael.riesch@collabora.com>,
	Mykola Kvach <xakep.amatop@gmail.com>,
	Jimmy Hon <honyuenkwun@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 0/3] Add support for Orange Pi 5 Pro
Date: Tue, 31 Mar 2026 20:07:04 -0500
Message-ID: <20260401010707.2584962-1-dennis@ausil.us>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Dennis Gilmore <dennis@ausil.us>

This series adds initial support for Orange Pi 5 Pro. The network
driver was just added. The only thing missing is the second HDMI port
that is connected via a DP to HDMI adaptor


The series was tested against Linux 7.0-rc2

Please take a look.

Thank you,

Dennis Gilmore

Changes in v5:
- define a connector node for Type-A port, and list the regulator as its VBUS supply explicitly.
- Requires https://lore.kernel.org/all/20260217-typea-vbus-v1-1-657b4e55a4c2@flipper.net/
- link to v4 https://lore.kernel.org/linux-devicetree/20260310031002.3921234-1-dennis@ausil.us/

Changes in v4:
- rename vcc3v3_pcie20 copied from rk3588s-orangepi-5.dts to vcc3v3_phy1 to match the schematic
- use vcc_3v3_s3 as the supply not vcc5v0_sys for PCIe
- remove the definition for vcc3v3_pcie_m2 as it does not really exist
  as a regulator

- link to v3 https://lore.kernel.org/linux-devicetree/20260306024634.239614-1-dennis@ausil.us/

Changes in v3:
- moved leds from gpio-leds to pwm-leds
- remove disable-wp from sdio
- rename vcc3v3_pcie_eth regulator to vcc3v3_pcie_m2 to reflect the
  purppose
- actually clean up the delete lines and comments missed in v2
- link to v2 https://lore.kernel.org/linux-devicetree/20260304025521.210377-1-dennis@ausil.us/

Changes in v2:
- moved items not shared by orangepi 5/5b/5 Pro from dtsi to 5 and 5b
  dts files
- removed all the comments and deleted properties from 5 Pro dts
- Link to v1 https://lore.kernel.org/linux-devicetree/20260228205418.2944620-1-dennis@ausil.us/


Dennis Gilmore (3):
  dt-bindings: arm: rockchip: Add Orange Pi 5 Pro
  arm64: dts: rockchip: refactor items from Orange Pi 5/b to prep for
    Pro
  arm64: dts: rockchip: Add Orange Pi 5 Pro board support

 .../devicetree/bindings/arm/rockchip.yaml     |   1 +
 arch/arm64/boot/dts/rockchip/Makefile         |   1 +
 .../dts/rockchip/rk3588s-orangepi-5-pro.dts   | 320 ++++++++++++++++++
 .../boot/dts/rockchip/rk3588s-orangepi-5.dts  | 184 ++++++++++
 .../boot/dts/rockchip/rk3588s-orangepi-5.dtsi | 202 +----------
 .../boot/dts/rockchip/rk3588s-orangepi-5b.dts | 181 ++++++++++
 6 files changed, 700 insertions(+), 189 deletions(-)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5-pro.dts

-- 
2.53.0

