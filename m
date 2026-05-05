Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 974C4481FBE
	for <devicetree@vger.kernel.org>; Tue,  5 May 2026 16:52:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777999971; cv=none; b=maBG2jFFAytKsDGMUWvcV1lR/kE/mPq2d/PHU+MgjV3c3gt3dKzAhwC3/ywc+aio6gycfXy1+FtSWlDX+krVGlMzXhxk4n9JG/8QVqNQTUlJAW/rk5l+WvZijIIkQ0uTSsE8Wx+5CDF0v7E6udA3NjNMdV/ADVIEWLo5UcTFlzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777999971; c=relaxed/simple;
	bh=Uy45pCjpPeeuNDhKg0dzbRSP55OqbZOrzQT7aVDR/oc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pxEm6Ci6wIoxRsH2UYbvSV27c/3BYAPf/fSYx2i9QUWpdBR7vUBYah5ENrYl9rsdIJdsbcWqiNmk0n5aAWrtsPM2KQR1mZ3zydJp5G4BW4w61DpofCRDTuxr9yOQORsHubRvg76aINvmfR0toWdA30B+cwCAbcB99dRRJg0OuqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tT6snsA3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tT6snsA3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AD9BC2BCB4;
	Tue,  5 May 2026 16:52:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777999970;
	bh=Uy45pCjpPeeuNDhKg0dzbRSP55OqbZOrzQT7aVDR/oc=;
	h=From:To:Cc:Subject:Date:From;
	b=tT6snsA3UR8645dy8SL2WuRvtEdwbs0owuBANHJ7aCnMXwoI2UhJ+wsjyHUOl+pmq
	 rKJQzhjLShcOhy+C/FkF1GmC0U3RIjGv2mMKr0MlIfD9qWYXWIltGuUk2ATcFlNqL+
	 1O33UMz2j2I+BKKYCH8Tut/GRJNxlNy+GnIVXPuLADIyeOJ/adaPRpCM1sq2Kj9NkE
	 fRHf0URJlrx6YvvI44c7mcv64NyutX7PPaFLNDvfkv6O8xY82fKndwfv0llAXefBPZ
	 Gea5rrxVd1aodJsf8LeR17wSMN1u+Dcydei/LNmrC/HMRY+LySNXrV+HEREASYFPlL
	 wmJ2YNULWuvTw==
From: Chen-Yu Tsai <wens@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Chen-Yu Tsai <wens@kernel.org>,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH] arm64: dts: rockchip: rk3399-nanopi-r4s-enterprise: Fix EEPROM compatible
Date: Wed,  6 May 2026 00:52:43 +0800
Message-ID: <20260505165244.1902-1-wens@kernel.org>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The EEPROM used on the R4S (enterprise) is the 24AA025E48T-I/OT from
MicroChip. This is a 2-Kbit EEPROM with 16-byte page size. The latter
half of the EEPROM is read-only, and the last 48 bits contain a globally
unique MAC address. That is to say this is not an ordinary EEPROM.

The compatible for this type of EEPROM was introduced later that the
board. Switch over to the correct compatible now that it is available.

Signed-off-by: Chen-Yu Tsai <wens@kernel.org>
---
This should probably not be backported without the matching changes
to the DT binding and the at24 driver.

 arch/arm64/boot/dts/rockchip/rk3399-nanopi-r4s-enterprise.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-nanopi-r4s-enterprise.dts b/arch/arm64/boot/dts/rockchip/rk3399-nanopi-r4s-enterprise.dts
index b76f98962076..e366f1a04b32 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-nanopi-r4s-enterprise.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-nanopi-r4s-enterprise.dts
@@ -16,7 +16,7 @@ &gmac {
 
 &i2c2 {
 	eeprom@51 {
-		compatible = "microchip,24c02", "atmel,24c02";
+		compatible = "microchip,24aa025e48";
 		reg = <0x51>;
 		pagesize = <16>;
 		size = <256>;
-- 
2.47.3

