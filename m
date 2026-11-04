Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793825996;
	b=opRdUnyntbuieug8/V+iAQkB7KKuyGRijj4G+qVn35wspkSH+b8YJQPAboJzf3q1xp3z
	 aBGtMf8Gmo+3yHI7dEPcZQddyXeBU4Vyjq/Au+m+OAR4brY+f58kP/GEO4qz1vGcf601X
	 AFzvzxaWxPo6LdiXB+KtucDkAV4RH9NdJRNhN5/3ahsfbmsoaOvwdTqjRH6D588D8ggIV
	 YZVzWbrSDtPyfwYwtwDff/uD8w2gG/3VLLjU02tnZSe4Zpky+L3IBvHZGXiqACGqa+9rC
	 QTs13JZwA99mC+llxg3ft1fkMewnev5dlEsOHM6jr+3LtVZCwpP4DdTALEkrZaEmGHA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793825996;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=EpQL+OHqTCtkBFVrQrejkxC6YKtDRrsLtpauU5x5BPE=;
	b=QSgG89Ix5Y2ZlXVlB6aXK/PUKyCgXHebkY8Dwt6/AMb2Tc6bxfuFtzq6+qbzGb9KKOMG
	 GwFbSqvEcFDckHHp3h2XktNmZU48IctIo+FkNmP1IkRTvxhN9H/XjqwZfSM/sfB2wr/VJ
	 qHUkHJBjvuSGckKiiXidN5tWDlbi3c/r1G8Xgoqc9xviyz5CC1LJZu9xmO8ixoAZ67cmI
	 ASApABv4PMTk+NsVgXlI7jaQL+E5yMo6tY7Tu107oIzLKdOFJzfE2xZ+bRIVY4GfO2+YZ
	 0D45AyK1pTuI/bErJeFPKahhfNvieo4PSj1yt90DDP0tgoRUStbHkw93ofeRrymrvHw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="bF+lscb/";
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E37B60E752B
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 20:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bF+lscb/
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793825994;
	b=E+LHQzD6ZLAuqnXPSzYux1uEuvcI1tHMyPCB3sG8gMuoIxsTLwzyX0aNOMuEfyHtUpZ4
	 t3NSHHSndrnG2eZrDcPZ2IV7iGMQGxzH7UEkH9oaxbgJydYAgEGIXPrPSyomEYWIrqIMQ
	 +AqTNtohKeghydVcL6Q7ObnbgTRcFLlWnxvY5QMDu8N6lC0prg+xXaSg0AjU16C05d0UP
	 lsHyAyWi7Ztsq7qbqo2l3rCinUsEAHpci4gJL6gdanmP0i/me8zXyaMDUuX2nua0vza9Q
	 EtmiK4BgJhJn/I8g5eSAwYyiKrXCpVGz+wePEloIfoTSDlwj/aLjOmsZi2Tn2N32VAA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793825994;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=EpQL+OHqTCtkBFVrQrejkxC6YKtDRrsLtpauU5x5BPE=;
	b=ZeIGFah9fqcJTVdhb2WOZ1g2ZBJQGAQRdEFNNreKF1OmNGHu8Do6up0plUgffGeVvGpy
	 qEDqyiituoT5X1gIBjPUfvPGeo0pPnr2bJ3LelcSN9S20sxS88K0PvhIepgiweHPIWY1/
	 x0rULK46Ql/WX7PIQpp3QJ/MRWnH2onIrJg74Dcbm/x8xPWoLRLn7e8RIog5sZ3Gk1K0R
	 iZO7VNd2gALCh6GohOGWvV2ccmdyMtADFgxLqln4pD69VSBK7dg/NkX4vw+kkNMEctPxo
	 DW3iCVQp0+25IuVyB1BakcKhzebOslhGAu6Dmgvfk6snWotOde2T2aq1r70528lhYoA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8ABE81F00A15;
	Wed,  4 Nov 2026 20:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793825994;
	bh=EpQL+OHqTCtkBFVrQrejkxC6YKtDRrsLtpauU5x5BPE=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=bF+lscb/TglwD+J37rLjnStkT6+uryFAkA5T18h7pp8h+Tmk+3EYLIHym9GR9QdzV
	 iq47oLEp6LGZNZl2DUpPDVyluPZWYJM7WRPnspgix66+ZwvFwOKBV+riRNWUITykq6
	 Coh4iZTboETZ6qgkSO1Bfh407ZZvGA9JfrIdJJpmeCfFcfto+Vcihcc7HwlzqqaFG9
	 dO+/glmjW9O1nkH67nDoL/PTXkhHqdqOvUCq2QUcxRYAxvILIM+rLqbYa6bHRdbyHm
	 WjxF0kn6nkR759z67U7oy/z/nA71KCjulxBh7c5z9A5UKFhJVEXcOmlphflLPMNKtE
	 0g92cDR4EdgAQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id BF07A46F9D;
	Wed,  4 Nov 2026 20:59:52 +0000 (UTC)
From: Joachim Eastwood via B4 Relay <devnull+joachim.eastwood.gmail.com@kernel.org>
Subject: [PATCH v2 0/3] arm64: dts: rockchip: Add NanoPi M6V2 board
Date: Wed, 04 Nov 2026 21:59:20 +0100
Message-Id: <20261104-nanopi-m6v2-v2-0-dfcd8714f48a@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/1XNQQ6CMBCF4auQWVvT1lrElfcwLEoZYYy0pMVGQ
 7i7BVYu/+TNNzNEDIQRrsUMARNF8i6HPBRge+M6ZNTmBsmlFlwo5ozzI7FBJ8msbnnJL9VZYAn
 5Ygz4oM+m3eu947t5op1WYl30FCcfvtu7JNbdLmf6T06CcYaKCzRaNadK3brB0Oto/QD1siw/T
 kmd6bgAAAA=
X-Change-ID: 20261014-nanopi-m6v2-c6d0708951e7
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: Shawn Lin <Shawn.lin@rock-chips.com>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 Joachim Eastwood <joachim.eastwood@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793825992; l=1813;
 i=joachim.eastwood@gmail.com; s=20260701; h=from:subject:message-id;
 bh=k2DHblhEFj5w7haYS80AKB4LL0FpR8EBvvhmiINNXjs=;
 b=2UAY/XFiEe8nlaDhGsA7ktyvq+cTBT3Xo9QsZVDr4r05QeI4+dS7zrCOBQDYBxliFsbd+Pc9A
 90J9Myq7AxhDM6NhG2QhPK7hoY+XwoGAe7KiXPrWJpnpmMAbFNzGDnf
X-Developer-Key: i=joachim.eastwood@gmail.com; a=ed25519;
 pk=ZN/8xWtdYaSd5oEfloYSZ1a+/ri0n0VZqjlEeHlbXFU=
X-Endpoint-Received: by B4 Relay for joachim.eastwood@gmail.com/20260701
 with auth_id=846
X-Original-From: Joachim Eastwood <joachim.eastwood@gmail.com>
Reply-To: joachim.eastwood@gmail.com

This short patch series add support for the NanoPi M6V2. The board is
very similar to the original M6 with only a few differences.

Differences:
* New audio CODEC (Everest ES8389)
* New Ethernet PHY (MotorComm YT8531C)
* 1 extra user button
* Misc connector changes on the board

Patch 1 documents the NanoPi M6V2 board compatibility string.
Patch 2 remove reference to the rtl8211f phy from common dtsi.
Patch 3 adds the NanoPi M6V2 device tree.

Link to schematic:
https://wiki.friendlyelec.com/wiki/images/b/b6/NanoPi_M6V2_2603_SCH.pdf

Based on linux-rockchip v7.5-armsoc/dts64 branch.

Signed-off-by: Joachim Eastwood <joachim.eastwood@gmail.com>
---
Changes in v2:
- Fix title of patch 3 - Sashiko
- Fix I2S clock copy-past mistake in patch 3 - Sashiko
- Dropped the generic phy compatibility since it won't work - Sashiko
- Add acked-by to patch 1 - Krzysztof
- Add new patch which remove reference to the rtl8211f phy
- Rebase on linux-rockchip v7.5-armsoc/dts64 branch
- Link to v1: https://patch.msgid.link/20261101-nanopi-m6v2-v1-0-e401ea64b394@gmail.com

---
Joachim Eastwood (3):
      dt-bindings: arm: rockchip: add FriendlyElec NanoPi M6V2
      arm64: dts: rockchip: rename rtl8211f node on rk3588s-nanopi
      arm64: dts: rockchip: add support for NanoPi M6V2 board

 .../devicetree/bindings/arm/rockchip.yaml          |  1 +
 arch/arm64/boot/dts/rockchip/Makefile              |  1 +
 .../boot/dts/rockchip/rk3588s-nanopi-m6v2.dts      | 94 ++++++++++++++++++++++
 arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi   | 12 +--
 4 files changed, 102 insertions(+), 6 deletions(-)
---
base-commit: 80e2828a00ba4f472289a699727abfd72a31de34
change-id: 20261014-nanopi-m6v2-c6d0708951e7

Best regards,
--  
Joachim Eastwood <joachim.eastwood@gmail.com>


