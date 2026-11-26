Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795680816;
	b=3iOKzJYLAM37jSWBnqA7EVHQqq+2VNQW6rzfOaXnRR7gvMFX1blquBhr9Ivm+h5eYzgi
	 jtweJsJBpiGVvA8V2FKBxKuepirke1jsymAZ4uTHc8slUKZexLrTvECO7YltOcszBFbzA
	 R3c1dM+ttbcntw7uh7o6JhqhcVtK9E8kkqaID2G/JcKn8NaFI153/NtMHpXk+0KK8qH+1
	 nuDav18d2jdEBfN/eyWOHvA7MiIp1t2Dvag0fG850uLET2JEYOpZMJ6tt7eLZMB6/d0Cm
	 YRWnT/XKT+dgUQ4nxDHS+fGe2O8NiXPC47BnkCHtW6obUeBHSW5yqCu5vduZmY6YtsA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795680816;
	h=DMARC-Filter:Received:DKIM-Signature:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=6g3oE9O+R1XLM2iPW2rgKpt+xVr7YudApomdQV3VjNI=;
	b=BK3TQfqiwOR+/Z6AhQIZTzmfIvV7PRae0+Rt7WZHdy6dnf798w1zRAAMGxmnlwY2VoCV
	 gDAIwBITuEPpoLmxT7tN9FwtFqL/At7Fj87NGHnwmGIQYndiGQcywOcjQpFYEUH1RnATq
	 czV9ZiiH4XV3B6wr9DsuFOKq9muwg2hSAGUw+VO1yKFPw1jNdR8OPgTdAfwCAVe9JI8PJ
	 yc7z5AJZlJgid2II0AarxcFPUswTtfovg8P5aV2fULuUQQNux/B5qi9ryOBkloaxK/lHh
	 dbKm30cOVMOb+fyQCdQxUz8ds2AacKe9zAd8xPtELHx33u8G82pE0lsWQODnJYWP9sA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=VaChOyNm;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56BF8606A33A;
	Thu, 26 Nov 2026 08:13:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56BF8606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=VaChOyNm
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id EEA722007F9;
	Thu, 26 Nov 2026 09:13:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1795680812;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=6g3oE9O+R1XLM2iPW2rgKpt+xVr7YudApomdQV3VjNI=;
	b=VaChOyNm2kcnPPsZ1Aiy8Ct5unwUo2JUhuvqE8zoEuN6Owv1U9HxDKhF6ioKzhCTg9Scxo
	1v9u4D2MRD04yIjgxpHsK1zxVoXBhkoQhme+cpDpy6295EhUEV8vLbTcIZUWG7UEU2ARM7
	pNSambJRmoLqzFzS0u2tQ9yCdyi7XDLeurKllioe9JcOIcWyPWlKRWSstZLx4+SbDLH04q
	wz+Z9ZRLnNq8/raVUbW66tS22xqjDk/Dgq3zYIlrfh6ZcLai1nHUxNtvA0X4nqHvkyZJEx
	+xXHQl8Z7eAe42HBCuOp+0fzNm2WcWGprBiwRMyqU4GY/CkEmAmCrAoBPjHKVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1795680812;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=6g3oE9O+R1XLM2iPW2rgKpt+xVr7YudApomdQV3VjNI=;
	b=bdoE4RfamCaVUsrpHNQXaIP1I+QYHfDE7pJGSwUZqcMyrfrVF6Lu9vFzogUCh92+t/bTCO
	6GwVN3roFKmEaZxsuq5li/qqyWOWVHPgxr8yIzmeWtqZo7voJOClmJbHmjS7EI0uRqQM0j
	+4MgMpF1vHZCrN5eE/GSgRdFyW5JKX5YdrddoN7GdJON6qGxt6H3MrZAouJbujtg0llYpL
	U+wKCSkh6eaKCeVJa2JIHHE1+6qHUdzhkJ15wFqUjWPJdNUSsdPk7ekm6Mce5yokBRr3R8
	68LMQAPk8DqUELZAas6bqsSUuj6YcO2yqiggYJad6KKIH+FjIG7Uds2mJnbW3Q==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=relay-from-drehscheibe.grey.stw.pengutronix.de smtp.mailfrom=f.diener@pengutronix.de
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1795680812; a=rsa-sha256;
	cv=none;
	b=Pc/hlvVTnnuCUiZbjJwl5iri5rLz4BGCx+sNXgz+UXOltekFitRqoh5Dd8RYayLmXhtIod
	UC5VyEgl6HXkoiE8eryW/3pWVQJkgoVcl2srOfd9L1PPi2cTF2zaiEetDhgsyXECMNjlWN
	EGqZRpqyqsEa48w4xgcL38X59mmvlQl05fE2DA3oPuY++Um50Q0xWa8eIKgS2nLtlRnCCy
	jeJLWZ44NFaHl4iVHpREnly4oGi7IWi2KDBBjXxd97HMhTSbK2glDP5OdSVNRLS6Y6jEsi
	5VpQQTCLOh51w+h85eDsumvNufJsGuWSrYMazWBRoyEWXBh1Y0eHHaPVIbKN4Q==
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.2])
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <f.diener@pengutronix.de>)
	id 1xWUbk-001XUF-1C;
	Thu, 26 Nov 2026 09:13:32 +0100
From: Freimut Diener <f.diener@pengutronix.de>
Date: Thu, 26 Nov 2026 09:13:28 +0100
Subject: [PATCH] arm64: dts: ti: k3-am625-beagleplay: Add EEPROM supply
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
Message-Id: <20261126-beagleplay-eeprom-supply-v1-1-19c543de6ab5@pengutronix.de>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQrCMBBG4auUWTuQBJXiVcRFmvytkdgOmVYsp
 Xc36vJbvLeRoiQoXZqNCl5J0zRW2END4e7HAZxiNTnjzta6E3fwQ4ZkvzIgZXqyLiJ55ehiezS
 9N7ENVHMp6NP7t77e/taleyDM3x/t+wcVGwHBfAAAAA==
X-Change-ID: 20261125-beagleplay-eeprom-supply-d2d840fa0d8c
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Robert Nelson <robertcnelson@gmail.com>, 
 Dhruva Gole <d-gole@ti.com>, Andrew Davis <afd@ti.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Freimut Diener <f.diener@pengutronix.de>
X-Mailer: b4 0.15.2

The BeaglePlay board ID EEPROM at address 0x50 is wired to the
VDD_3V3 rail, but its device tree node does not describe the supply.
When at24 probes, the regulator core warns that the vcc supply was not
found and falls back to a dummy regulator:

    at24 0-0050: supply vcc not found, using dummy regulator

Set vcc-supply to vdd_3v3 so at24 uses the regulator that powers the
EEPROM.

Fixes: f5a731f0787fd ("arm64: dts: ti: Add k3-am625-beagleplay")
Link: https://docs.beagleboard.org/boards/beagleplay/03-design.html#board-eeprom
Signed-off-by: Freimut Diener <f.diener@pengutronix.de>
---
The BeaglePlay board device tree already describes the 3.3 V regulator.
This patch adds the missing supply reference for the board ID EEPROM.

The BeaglePlay DTB compiles without warnings, and the EEPROM node passes
validation against the at24 binding.

Boot-tested on BeaglePlay: with the updated DTB, the at24 dummy
regulator warning no longer appears, and regulator_summary lists
0-0050-vcc under vdd_3v3.
---
 arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts b/arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts
index 898e4ca3fd87e..4ddd5e7b3843e 100644
--- a/arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts
+++ b/arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts
@@ -671,6 +671,7 @@ &main_i2c0 {
 	eeprom@50 {
 		compatible = "atmel,24c32";
 		reg = <0x50>;
+		vcc-supply = <&vdd_3v3>;
 	};
 
 	rtc: rtc@68 {

---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261125-beagleplay-eeprom-supply-d2d840fa0d8c

Best regards,
--  
Freimut Diener <f.diener@pengutronix.de>

