Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792637935;
	b=GMadkm99W7R4HAQhRLAWrOGsagBU4Vf6RfldAoCS5qaU03U7KvcfwSENgE8h36UklUSZ
	 b6XfqIv5mCfiiuA63eC7JDJWpUiTlf+EXBaBaY2rGb0oC61ai6bIQso2Mi6zMrLqNsStg
	 ZrdSsHhJfTowAu9yLh2JA2ob8jwHhbttVVSo0flEYiZPwpFO50gZFG0gjffzPtgIwhpQa
	 BQfMARr0Y3fX1NGvebC4q1YmKUG41ioJnyXCOtCKZg/1YUqF+jBW1NT3tX343ek99EJzu
	 Jat4edb3aH/sod0V77iH132CUCZHdZSl5I1jREhwvDq9A/Rn6uEsC4SLVEbvph0UZzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792637935;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Jzi3iIHS+OZtD6vkcJ1pUU6mViKNGOUw7LaZHSgnXgo=;
	b=0AHxL8waoALoWjVDFtF/RBV97o+aqgflXdjJAqU4JOf3FO17G7aTKJw3SKL7TVqpO3XG
	 HEhL3wbagdvIOz8aH/R7WTNwR2QtVmzM3G9f8hOQ9xr5CcqgAZhZyhjiKcUBPGB7BJdaY
	 HMMiFCToYsGzuQ+A45toN/RwrCzOai+ju6ax0SfNH94KNDvxnhWYiFihN089bawqKrzXg
	 Q6El1qp6yhs1dG8e4RH97myIswRbOvpljrCoRyrTi7Bn7xxf7u5XDvmEyhNqv3qTzRW1R
	 KNRn1eCk6uFVT/jvWLk/017izRRNI6Dozzf/OgYmjAF/iSGXLTH5jHsWnWqa5h68fuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=NzXo8t5i;
	arc=none smtp.remote-ip=74.125.229.7
Received: from mail-dy2-f7.google.com (mail-dy2-f7.google.com [74.125.229.7])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F20E1606A31D
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 02:58:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F20E1606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=NzXo8t5i
Received: by mail-dy2-f7.google.com with SMTP id 5a478bee46e88-368c26de2e0so74852eec.1
        for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 19:58:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792637934; x=1793242734; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Jzi3iIHS+OZtD6vkcJ1pUU6mViKNGOUw7LaZHSgnXgo=;
        b=NzXo8t5ifh/oZ0ZB0teQvxguRb3keDNkTtp6XqT98DcO6AtQbgbTBgpQ1+ErNm7+SZ
         I7AUT7AQ1QFQ3VAFPTJ6lgFcM4zeX5hQNyj31GW15Qfzt3haZpHZTu9PGdhhMN7wXv9K
         7sK0og42EyQhg9Cgi0bn+2KMXpdk0mu3LTTm4NzEdYl+Hc7Eanw3VUGGFh6ff6b+2xiV
         bWA2F47VUVecdJYAY5hn5F8u5Y8Dkbn484JHRHowCRa6CyEEICXt6QKf0KVS632XLmeR
         vR6Ka7cm3IFxLwP67Q/Bilu3VvG+FJ3au1XSrteJ5GTapwNzXJX6nJaxtvmorxNQJqxB
         YV1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792637934; x=1793242734;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Jzi3iIHS+OZtD6vkcJ1pUU6mViKNGOUw7LaZHSgnXgo=;
        b=dLzZ+Iw63VJuKSgtHtV2Hv/1IN/BY5X1prTOu3eBCHdTObqlICptnT4pTEo9e5jyV7
         6nVHwFZTuczKKdEPEZB35lqxjAE4gj9mJAPPbLr1GOSQJ2QTouESxwbezisTD+8b3423
         iJG6UT6ihSZ21M+y8hB9Va9w29cThlIo/4tUKgsldjLK/42xA6MpB0hVLaak0KtuIbc9
         6U/dZhUC6Ct7vyyymPAiopAuwSP9sz+kgGczA1uTUevP+wf/yHdPgUM4EWUpvDrVWFM9
         Mctse3sklZ5jBVjYWNMDQt4iJposLyV6/Pys8cHF3twi+tuMpKoj5oDrM+QW20W6LQhD
         X1MQ==
X-Forwarded-Encrypted: i=1; AKwUvBw69wZ/ymLzod6ocj8BQ0r1lgmBL5BowpVtxu+fSI7SkyI98iQm5rr5+Rm7bOtxBjcsrKKiiRHPAujS@vger.kernel.org
X-Gm-Message-State: AFq9FYJRp3SQMiaxTsWb+0M4AnPakIOhtY6b3ilbJZkCARvuxC5/5DSL
	yiz7ts77th0YOgqSd+dAGOA2uS7gElO8XpSpbBklV+eE7fmuPjWalVV3
X-Gm-Gg: AYBFou2AY5seGG+5+6iAEU3IuYGW7VHqXqbgsIKrNXwnFr1pDcQi5NuhmfthLYVVTdd
	OPAKyHzdsZ8i72o3fx8BGNKKt5LMyXbJGqy8XPDDcCpy628OiL1zTpnRmqveqr/wgDpRCSbofOL
	WjlTW/vqiiModJCVtafjovBeSHtsYn2RyWSaM05avddkFLM+fBzZiMdAgfgzgZczC0wG88q2Y+p
	paRtrCUKQqIj7u2/HRC99H314F13ZCdxmykEbxaYCrteIYNLQlver6Tx6OkAjX1t3/s69ScR4UA
	pwE+rc8shoXQN/064EtNeICmxD7sN2vBkj8ImMKtlCXenZ4Q+GlqwhSY3+dfHvlpvTd4YG6hMzH
	Hc0P8qY/AjC/MSMsJ0HalOhM37Y/uoG5SiuJIFoKwvOauiGoKhdF+r7yloICI7y4XtO1Ww5Jda1
	M+p6nmdf6/cc1ytYYlOdD1YSZ7WP0+9lvmUMqPhy0x6o7q8evmi9uLCisYmFHlC9dEYBEE/mqgu
	PfC7ExIRH+s5faTaa0PM8JloMYCxdyBfDvNXO6wdWwc2Fm4HULW8A==
X-Received: by 2002:a05:7022:ea59:b0:182:94d7:f76a with SMTP id a92af1059eb24-190a728a66dmr4591460c88.43.1792637933923;
        Wed, 21 Oct 2026 19:58:53 -0700 (PDT)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36740cc8c6dsm13029572eec.12.2026.10.21.19.58.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 19:58:53 -0700 (PDT)
From: Coia Prant <coiaprant@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	David Heidelberg <david@ixit.cz>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Coia Prant <coiaprant@gmail.com>
Subject: [PATCH v11 0/3] arm64: dts: rockchip: add RK3568 XPCS nodes and enable SGMII on Photonicat
Date: Thu, 22 Oct 2026 10:58:41 +0800
Message-ID: <20261022025844.150320-1-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
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

This series adds the RK3568 XPCS and fixed-clock nodes, describes the
RGMII PHY LEDs on the Ariaboard Photonicat, and enables the SGMII LAN
port on the same board.

Changes since v10:

- The rockchip,sgmii-mac-sel property on combphy2 is no longer set in
  the Photonicat DTS. The property is tri-state: when absent, the
  driver leaves the routing unchanged. If the bootloader has already
  routed combphy2 SGMII to GMAC0, the link works without the explicit
  property. A follow-up will add it once the PHY binding lands in
  linux-next.

- The RGMII PHY LED configuration is now a separate patch (patch 2).

- The SGMII PHY LED configuration on mdio0 stays in the Photonicat
  patch (patch 3), since it belongs to the port being enabled.

Dependencies:
- XPCS binding and driver (rockchip,rk3568-xpcs, XPCS glue, dwmac-rk
  SGMII, pcs-handle binding): merged in net-next and present in
  linux-next.
  https://git.kernel.org/netdev/net-next/c/5e91edfb0e45

- PHY binding+driver (rockchip,sgmii-mac-sel): still in review on
  linux-phy. Not required for this version to compile or pass
  dtbs_check; only needed for the follow-up that sets the property
  explicitly.

- Generic PM domain (genpd) changes: runtime-only, not a DTS
  dependency.

The XPCS node is disabled by default and only enabled on boards that
use SGMII. The fixed-clock nodes are always present, as they are
static clock sources.

dtbs_check passes with the current linux-next, since the XPCS binding
is already merged.
---
Coia Prant (3):
  arm64: dts: rockchip: rk3568: add XPCS and fixed-clock nodes
  arm64: dts: rockchip: rk3568-photonicat: add RGMII PHY LEDs
  arm64: dts: rockchip: rk3568-photonicat: enable SGMII LAN port

 .../boot/dts/rockchip/rk3568-photonicat.dts   | 68 ++++++++++++++++++-
 arch/arm64/boot/dts/rockchip/rk3568.dtsi      | 23 +++++++
 2 files changed, 89 insertions(+), 2 deletions(-)

-- 
2.47.3

