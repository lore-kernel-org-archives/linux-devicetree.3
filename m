Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793570479;
	b=vhw7vkT9Yc9JY66QqdbFaNcRk+Y2V9APmYM3LaCM1xtCTMlHw1O6ImJ6E+lk8VR4pq13
	 mr6kF183KzKLIVpPSQ7taY2txF8/N1juAw5ZSld7R1kYQR9AiUUafZHgtkoOv7WkXOW7+
	 NpNTw1V55C2nbF+AwpsfOMhS7dJry0+6SILQoEsGY1xF2ElaZJlVW0cba6ZDpI9+g5uVp
	 rewfgfrwazU1oBXnSSHVNdiuTD1K0u0hCrklhw55N/TrHC9x2oPGeBFO9qWnhM7Xo55k6
	 U3Zr6zzrYaMjgmKdRpCJVuMWDj4etAAFLbYTpuL6Gbh7MDPCFjCEovMEFQ+rkY/e2yQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793570479;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=quzs4cuXQ6oSVRVc8mAHwUC+GulCZQ01zMhwZ7y9w/Q=;
	b=wri6b9F68eYxDump/gLKYWEefc8059fKwL0GKZdC/fOKI6K8LuvfNx9FWzP56ZQEWDLK
	 5GMUDYU7wCZowVHMqiN+dVZnLAXGMKpAna1z5fSmt3/psRJEvLm8D/m+rIjh7nLDxeUhp
	 ClWSs8FZt/w9AE6EgrF/1ppTIOFhNO1Iib0PnRI6MMxpVPWiNp+iiU/jkwFWh3Za42GKX
	 PyiPUi2QvIVmVUXliGZueSGiMUl1AnknTjQo9sqHTnKsDtzI51D/LC5GHRQH1w/2E49XU
	 kEBcpYVLkh+0X0NzCg2J3WHBvXbTCCHK+glyzoj1PZmtrsCWKWtF1EFCrgyP/m+w3Hg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="LzSO5V/0";
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 416EE606A32C
	for <devicetree@vger.kernel.org>; Sun,  1 Nov 2026 22:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LzSO5V/0
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793570479;
	b=syemfE78zFYAemAf8FJBk0Pz6oLCb4MmmMoANwliIdvXPZuIag0ho4HQrs5j5rrJKlq9
	 5TYHI8bAhyjjqsvtkv/XoeWREAJZQdlPsOJkmgN874C9OPHyVyypKaF/IwTsS1B+QQotP
	 /D6Stac4zAk7Msk8Q08z22+TUDnUcndsfeiiSiqIma35F5bDyfwTFf3vMasQhXt/7agpO
	 FHYTYJ/G7GL3p8Epue5GJukL0yqm3kiOxYr9E+h468TRlL4/Y5wNl66SMtitQA6O6VRDt
	 VI1XtUlWVPa897eI8kgoxU/fQsYJ5w073+d/GW3Vyg4PTLPzQ0CKoU1eCdwUgXivedw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793570479;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=quzs4cuXQ6oSVRVc8mAHwUC+GulCZQ01zMhwZ7y9w/Q=;
	b=Twh5PFScHmBA3dFhj0FiwKfvoO5BIg6BrDV7utIVsIZtNG9aHq33dwlchvlBIYxDiEqt
	 fE/vrV8I5Du8AngKvYbx8wqlhaVpxUsgwy7Xr76/uiKuQFKWpvHcXMD/aKT0jFOZJ/Md5
	 UpPRE/rDk3id6qgACCOwr53RjcbKQzOuzAADyNEaE2x2pOXS68hJsSN1ceCBtmZanS1YL
	 FL3HNUXoJS50FHZ2LjE6rAnkBsTuPmYIKa9eflSQWtrrLb2ilRvdPEC/BekAGEKy/pHQU
	 9TDAbqEos+1sodpIdAkcY0j0b4TUDE3bEfoPlRd3cf0M+HP3wkO/iEfqiqTTbGHKIiQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 987691F0093A;
	Sun,  1 Nov 2026 22:01:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793570479;
	bh=quzs4cuXQ6oSVRVc8mAHwUC+GulCZQ01zMhwZ7y9w/Q=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=LzSO5V/0mdImRx9gVCx3Crp1LASVj/zSP08Flon+6qQe8kFu8CCBxjdQcsNZoHN5Q
	 A9NAR3QkKBrI0lWzvA+0tD/LSCqSdwkOomBZUs66uymNNFQHZS6Mhbt2q+tQ/2Rg6q
	 rWhRok28MJegUcMtiyNiKW5U057pooNxKm11bUfZW/dm6CpeeQEca15fJpbNf/Ua0a
	 W/1nBZWUvWE5x+KXqJf0tqHtUthFzChAGVH5p+QzYrAh8tXx4ME34JObGam9EA/WGA
	 y/iuD9sH6Tdrz1hRcpH/mFiIMy2dPqGN5ZNKeaKe6TnVTZdRNIv4hl7ErESAD0U2m6
	 rQMysJtcLfrfw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id E7FD246290;
	Sun,  1 Nov 2026 22:01:16 +0000 (UTC)
From: Joachim Eastwood via B4 Relay <devnull+joachim.eastwood.gmail.com@kernel.org>
Subject: [PATCH 0/3] arm64: dts: rockchip: Add NanoPi M6V2 board
Date: Sun, 01 Nov 2026 23:00:51 +0100
Message-Id: <20261101-nanopi-m6v2-v1-0-e401ea64b394@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMTQ5AMBBA4as0s9akbaifq4gFNRiJVlpEIu6uW
 H6L9y4I6AkDVOwCjwcFcjZCJgzM1NoROfXRoITSUsiU29a6lfiiD8WN7kUuijKTmEMsVo8Dnd+
 tbn6HvZvRbO8C7vsB1h9Jc28AAAA=
X-Change-ID: 20261014-nanopi-m6v2-c6d0708951e7
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: Shawn Lin <Shawn.lin@rock-chips.com>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 Joachim Eastwood <joachim.eastwood@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793570476; l=1695;
 i=joachim.eastwood@gmail.com; s=20260701; h=from:subject:message-id;
 bh=pJ6sMrN48cPu0hMmZhmjBx3CU89+Wvf5/R4Y847eZW8=;
 b=H7wcfuRARX4ueHIDrdbfxZGohp3+1hq4nqIAMBVoJ+QHNY2o13nvPvJODZxVBH5BHCwKypWPo
 GG0j5nwo9BbDHtu/Zz/Ay4XFR0Qm3BY4j/gJV/wIW1hS2wC3KxVduv1
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
Patch 2 changes the Eth phy to a generic compatible in DT.
Patch 3 adds the NanoPi M6V2 device tree.

Patch 2 is tested on M6 which has a RTL8211F phy and MV2 with YT8531C.
Note that R6C and R6S also have RTL8211F phys so this test should
cover those as well.

Note that this patch set doesn't depend on the "NanoPi 6 series fixes
and improvements" patch set. The patch sets can be applied in any order
without any conflicts.

Link to schematic:
https://wiki.friendlyelec.com/wiki/images/b/b6/NanoPi_M6V2_2603_SCH.pdf

Based on v7.4-rc1.

Signed-off-by: Joachim Eastwood <joachim.eastwood@gmail.com>
---
Joachim Eastwood (3):
      dt-bindings: arm: rockchip: add FriendlyElec NanoPi M6V2
      arm64: dts: rockchip: rk3588s-nanopi: switch to generic eth phy compatible
      arm64: dts: rockchip: add support for NanoPi M6 board

 .../devicetree/bindings/arm/rockchip.yaml          |  1 +
 arch/arm64/boot/dts/rockchip/Makefile              |  1 +
 .../boot/dts/rockchip/rk3588s-nanopi-m6v2.dts      | 90 ++++++++++++++++++++++
 arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi   |  2 +-
 4 files changed, 93 insertions(+), 1 deletion(-)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261014-nanopi-m6v2-c6d0708951e7

Best regards,
--  
Joachim Eastwood <joachim.eastwood@gmail.com>


