Received: from mail-oa1-f100.google.com (mail-oa1-f100.google.com [209.85.160.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1AD21CEADB
	for <devicetree@vger.kernel.org>; Sat, 11 Apr 2026 02:47:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775875670; cv=none; b=u4WEzcI62UwPV48XwjL4hZonbm2dWyVNEwqVR3Z1HW5y7zSY33iNSh9yfI/jHR8KvBuy1zAYyabZkVCTabyxe9lS9xdfBltq5oDoMwrMficNTegP4MOtnU7bJ3CmALuFHDq/sFiWH9wMuIfdPX1Rju007o5un6FHrkWT0ByxO6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775875670; c=relaxed/simple;
	bh=mo4muP3avFuRWvPB7p8BxCx+tQx1OO+A5nKtrZU2Bwo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pN+BUVDkTcQBooq0D4TGcgRp/MEz6W42+dEQj764L6fxCrJTl9VrqMNXQFj5PiIZDuP9jmn7DTJrkAtv/4gEYDuM/zMkrekmbwu4mirzsh5FBI7byiqQV1yPtuKoML9eZW3j9jivuee81msos6jtHth6t+3tMgeH0dGfZGxA4ds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ausil.us; spf=pass smtp.mailfrom=ausil.us; dkim=pass (2048-bit key) header.d=ausil.us header.i=@ausil.us header.b=Ct6TooJi; arc=none smtp.client-ip=209.85.160.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ausil.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ausil.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ausil.us header.i=@ausil.us header.b="Ct6TooJi"
Received: by mail-oa1-f100.google.com with SMTP id 586e51a60fabf-4043b909ed4so1473675fac.3
        for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 19:47:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ausil.us; s=google; t=1775875667; x=1776480467; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8AO3/aAlun0d/2MK5fwm9gbSeroCU5cGcr9PM3HBALI=;
        b=Ct6TooJitNZbg8F4/FuvMn/gLpiYaExvYTDsVLuf7T455qT5vQWG/vbi0XJbPbz/0k
         +Tg1KZurRRsFNOqBzhraRPoXLISS99pp5k7t8Zzv5boVWOrnSudhL4dqXFNwmKrLsV8z
         +SWTFgLpNLF6XfoRMKo6exlRJI49MwzIiX17K/8d5i2vFk8qaxTRf3t0valYZ9s0FHJi
         NCOybRUbA595xmw+8dt6K5f7VXaqD3VIaZgfvSMYfl4dh/rFBhkevKqM8bUrh9I0GEb1
         Js9NLxA9ow1qotOiO+F8NSEAr2DIReh1lOv1X2Hv/Dv1Ywe0iOpsUPfw8CrAdTQf/Jh0
         jKig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775875667; x=1776480467;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8AO3/aAlun0d/2MK5fwm9gbSeroCU5cGcr9PM3HBALI=;
        b=NFf4m7ROhQvFpc3VT1wROl4Bai3KYE1Cbbi7fLR8wRXKV0sxP6qQfiEHzLY12UNPHx
         U70mbYWEGSPnVGo97ztlqizBjo0WNwxfC5CC1qvBADt3gibJ8lrnrRywXgQtSMlhf7Zd
         5TF83679dlMAyI9xG+FWQDXL3V8Q8KNG1+D/fwWj7aKwB/07leSLbuCvRzfMbo9S6kQZ
         SBkYck08jP+L+phqmVQw4K2/iZyD6ZslUaLeV8Rn4fXSNSoAZT444loIiWDGVl5Co7G1
         ZTJb8dMDFo2E/BLDjm6CKsVICYtmDhi4yOOWRpT4DvsfJx4EJDis1e+ocwhU6/rfIgpV
         1vDw==
X-Forwarded-Encrypted: i=1; AJvYcCUYKd8wW5Jhl720JBGXpXVPNfQlWsz1TmLw+kPiFuNAzDb/a1BP5+Tq4HEsqQYAhlU4bfY2+F1ZNocM@vger.kernel.org
X-Gm-Message-State: AOJu0Ywka4+gVk5rtyRKMvgdtaRHrDNeRrivGaRSXAP3H0XMHKR7ze+X
	ln+4rdf/esoNO5jl71DqX0k7LfJmAtEJCiz5E/nTcO4Y7ETeGEgm8qG8+JDJYhjhMiKwVxu5nQE
	C6YLyN47I5rU+M9BHelhWp67xayN8Vt+BlWvX
X-Gm-Gg: AeBDietJPSlRjoq0HUXtI/W4sbvzJXQC69fRemCTjxox4GBGjKa8qa0x56WI8cy0jZf
	BTsq+F/9gaE6yo7LJT8uOpwL0QK6BCg11LeHnnZFrW1EiyNkAIB+TVscxMfgOti64e3uQS2J7XB
	t7N/8O1DHEyxZWaFBYKPnCeYhnhZrowx3FYbEryck2q7jUklc71WsYWId/wlX1cu2kKQ/Xyx7T8
	0Qlh03K3aWfwlMG2h30sbI25CTxi7PwB4fqk1zdccy6TQTWLakHUr9Na7qjWvlJSvrbLUF+N1K6
	vKj/lsOZ8OwNaCuSLJfEU1q9NCIiWEmNwBM5so0qIR2kIWWjaQLn7H60Eupw+UU3Bn1TVH7Slt5
	sRgRFh+L7w7G3tsiaV379PxuUE4qu6GkNYscJmJyApAWM
X-Received: by 2002:a05:6871:2ee7:b0:404:16c6:40b3 with SMTP id 586e51a60fabf-423e114b119mr3123217fac.37.1775875667513;
        Fri, 10 Apr 2026 19:47:47 -0700 (PDT)
Received: from ryac.ausil.us (207-179-239-100.mtco.net. [207.179.239.100])
        by smtp-relay.gmail.com with ESMTPS id 586e51a60fabf-423ddd32ab3sm599086fac.16.2026.04.10.19.47.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 19:47:47 -0700 (PDT)
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
Subject: [PATCH v6 0/3] Add support for Orange Pi 5 Pro
Date: Fri, 10 Apr 2026 21:47:40 -0500
Message-ID: <20260411024743.195385-1-dennis@ausil.us>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Dennis Gilmore <dennis@ausil.us>

This series adds initial support for Orange Pi 5 Pro. The PCIe attached network
driver(dwmac-motorcomm) was just added.


The series was tested against Linux 7.0-rc7

Please take a look.

Thank you,

Dennis Gilmore
Changes in v6:
- Move the shared configs for the Orange Pi 5 and Orange Pi 5b from each
  devices dts to a shared rk3588s-orangepi-5-5b.dtsi to avoid duplication
- Remove empty ports subnodeis from typea_con
- Move i2s2m1_mclk pinctrl from &i2s2 to the es8388 codec node
- Add dp-con, dp0_out, dp0_in, and vp1 nodes, plus the vcc3v3_dp regulator
  in order to get the second HDMI port working via its transparent
  LT8711UXD DP to HDMI bridge
- link to v5 https://lore.kernel.org/linux-devicetree/20260401010707.2584962-1-dennis@ausil.us/

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
 .../display/rockchip/rockchip,dw-dp.yaml      |   7 +
 arch/arm64/boot/dts/rockchip/Makefile         |   1 +
 .../dts/rockchip/rk3588s-orangepi-5-5b.dtsi   | 192 ++++++++++
 .../dts/rockchip/rk3588s-orangepi-5-pro.dts   | 352 ++++++++++++++++++
 .../boot/dts/rockchip/rk3588s-orangepi-5.dts  |   6 +-
 .../boot/dts/rockchip/rk3588s-orangepi-5.dtsi | 198 +---------
 .../boot/dts/rockchip/rk3588s-orangepi-5b.dts |   2 +-
 drivers/gpu/drm/bridge/synopsys/dw-dp.c       |  12 +
 9 files changed, 582 insertions(+), 189 deletions(-)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5-5b.dtsi
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5-pro.dts

-- 
2.53.0

