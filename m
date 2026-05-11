Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D37603BE147;
	Mon, 11 May 2026 09:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778492880; cv=none; b=u7xAH/c6e/ZRlMZS41roO/ypA4YPL9Ykaq0NiLpttup3BqlTdEIM6vdZkJugPkCjCB+rP7jeqfDVbsrrMx96wCHfCI+ZH+kY0w0S5MLFjzVSXq8HT405ranlleSWLUlIcjS/giMlg/ESH2uz/AlUm+ivoCFjnlpxX4gvGOzPA70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778492880; c=relaxed/simple;
	bh=D4cEEwP+Pw2JC+uqCH7D0mOoSaD3yW1LgWxT8p0r9d4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=EpRBzNwM1iUXGgPh5ObsTfRD9FaWfqSPIbpTR+m/+Nykv43OXf9kTK9iBCAN13/h0Zq+ngSGVrHmDCI9jfpg3HMZqwSkrV246ObN9TTwI26kiknm6F034Vskic6gz+Ubrl7z7o9n+9/mtiPEb7YVT4losuQ2G126L7p2YUSMlVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LoldjdEo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LoldjdEo"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 70B1AC2BCFA;
	Mon, 11 May 2026 09:48:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778492880;
	bh=D4cEEwP+Pw2JC+uqCH7D0mOoSaD3yW1LgWxT8p0r9d4=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=LoldjdEomdcXhZsTCmbS+yxoyWhyPMpSy4xF0MTG/tlAsQfy1nRzFTP8rSvUFLwuU
	 OvMPu54qeLCV/1j1y//ApfxX2OCwmjBNNPnVjTdSNDF6rsg1lJtyVSSGer3/FxXPhn
	 CzQCBLuNTD2oGyON4oY25lXUxRkxkx7acyzbHKAKR4uAFm9zavvE1yBSlxtTlnZi/p
	 URsAs0TXuU0hn1//BfvC6QhkKlZsWZLfV9KHOb0Cuc3DYxLNB+SGOU3A4V8SkwFLH5
	 GOfsoTDjcKp3e6uCdwRQHLiD2zSG0pCxYewiox1/z5c6HDNxclWFY3dpa6yjQlAWpI
	 D9X0Z8V7b7jCA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F08CCD3427;
	Mon, 11 May 2026 09:48:00 +0000 (UTC)
From: Colin Huang via B4 Relay <devnull+u8813345.gmail.com@kernel.org>
Date: Mon, 11 May 2026 17:47:56 +0800
Subject: [PATCH] ARM: dts: aspeed: anacapa: add JTAG CPLD TRST pin to SGPIO
 map
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260511-add-jtag-trst-pin-v1-1-b0be2f7b2da5@gmail.com>
X-B4-Tracking: v=1; b=H4sIAMulAWoC/x3MTQqAIBBA4avIrBtQsR+6SrQwnWpamKhEEN09a
 fkt3nsgU2LKMIoHEl2c+QwVqhHgdhs2QvbVoKXuZKsUWu/xKHbDknLByAFbI5feD8aSdlC7mGj
 l+39O8/t+z6YwNmMAAAA=
X-Change-ID: 20260511-add-jtag-trst-pin-540b7d84ae2c
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 colin.huang2@amd.com, Colin Huang <u8813345@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778492878; l=1269;
 i=u8813345@gmail.com; s=20260202; h=from:subject:message-id;
 bh=bBz3YS2LvMQAba2/yKKCExHR35pJbolOWMc0cULsHQc=;
 b=7eqrmaxmn6l4gBcvbL2EZFv54EpM2ExzQR73yUeUFlCbjQgpzwSnkXTmVVMzLP6g6IACqMNDx
 USyAryJvHoVAj1X87q8+El6BZfM90iU21bwytKBspw7Ok3OtcRg0YIX
X-Developer-Key: i=u8813345@gmail.com; a=ed25519;
 pk=Zlg0WqpCw4qbswOqamTBTXIchwR/3SnYZpy7rjaGMdQ=
X-Endpoint-Received: by B4 Relay for u8813345@gmail.com/20260202 with
 auth_id=761
X-Original-From: Colin Huang <u8813345@gmail.com>
Reply-To: u8813345@gmail.com

From: Colin Huang <u8813345@gmail.com>

Add JTAG_CPLD_TRST_R_N to the sgpiom0 pin name table on
Facebook Anacapa BMC.

This exposes the CPLD JTAG TRST signal through SGPIO,
allowing proper JTAG reset control during debug.

Signed-off-by: Colin Huang <u8813345@gmail.com>
---
Add JTAG_CPLD_TRST_R_N to the SGPIO M0 pin name table on
Facebook Anacapa BMC.

This exposes the CPLD JTAG TRST signal through SGPIO,
allowing proper JTAG reset control during debug.
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts
index 2cb7bd128d24..9a43e0c87257 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts
@@ -882,7 +882,7 @@ &sgpiom0 {
 	/* C0-C7 line 32-47 */
 	"RSVD_RMC_GPIO3", "", "", "",
 	"", "", "", "",
-	"LEAK_DETECT_RMC_N", "", "", "",
+	"LEAK_DETECT_RMC_N", "JTAG_CPLD_TRST_R_N", "", "",
 	"", "", "", "",
 
 	/* D0-D7 line 48-63 */

---
base-commit: b333a0f1c857411d83a02aa6f1d9ecc7666d6179
change-id: 20260511-add-jtag-trst-pin-540b7d84ae2c

Best regards,
-- 
Colin Huang <u8813345@gmail.com>


