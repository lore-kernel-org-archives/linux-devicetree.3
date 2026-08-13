Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44C5F47427F;
	Thu, 13 Aug 2026 12:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786622401; cv=none; b=YtNpiYD8q5iQg2HMexmhGDiOhY9oBKnj26+tN8GsoIn3eEju/A8YmYGZGl8EuZ9eUs4/Rwi8xPApXRLFQGyMxAoU//8Tl2OuwLM0lkRIfXKk2SW7f2UfooOX5JlsdetfaxJT5gMj+eC4/UOxZLcEE1uGzn0kkbWsgQXKRn1DyEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786622401; c=relaxed/simple;
	bh=295IKqaeCumSuUEaZhnHHBluCh18/amZPEFle+tiP3I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XVKBLrzNKGmDaIADaNMFI6GzBnOeYNPDYP9fF1oQgTmsA94+YvHK+3fQleXSToGFMOChVgHTTuZb8cnoHsM0CgJ1dMn2Q4k4JAtNPXMbEtycjBnkSKn137go5uLNexwZ/+cq0nEmAyT7RCm4SZjYNd4emCniDcz1wm02g/17M5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YxGcxvfC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YxGcxvfC"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 70437C19425;
	Thu, 13 Aug 2026 12:00:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1786622400;
	bh=295IKqaeCumSuUEaZhnHHBluCh18/amZPEFle+tiP3I=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=YxGcxvfC2rGJ4++Ys4Sll/sqCSngCdT90KsuytGLQZ9Wd7sb2cORCGbenG497jNwa
	 YsMg3AuIVKsoeTjjTG8AamXwlgz0YQ+Y1PdYodVNSWBD3sNkNjUiiQRqhcWjnSUa6a
	 B8SPMnPIsNKsctGVWFt+AymfeIvgpjRQ+xSfKkwbhXbIyeGW3rndKEwsKaCSnK16D9
	 lfDb1uUYYyOWQKC/T0Aq3SElvy+lWtOPGApr14Bu0OSr343H72q24XFjKVnlhL3ZKD
	 707ZW9xUVIYqDxgXs6lnnqQQX8+0mIgiWzhooVeTUr9v/v78FV885D2eO09c1DE2Sz
	 IPmPN5JPEemoQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E0FFC5DF6B;
	Thu, 13 Aug 2026 12:00:00 +0000 (UTC)
From: Colin Huang via B4 Relay <devnull+u8813345.gmail.com@kernel.org>
Date: Thu, 13 Aug 2026 19:59:42 +0800
Subject: [PATCH v5 12/15] ARM: dts: aspeed: anacapa: Add SPI flash VCC
 supply
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260813-anacapa-devlop-phase-devicetree-v5-12-c7058f63dc67@gmail.com>
References: <20260813-anacapa-devlop-phase-devicetree-v5-0-c7058f63dc67@gmail.com>
In-Reply-To: <20260813-anacapa-devlop-phase-devicetree-v5-0-c7058f63dc67@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 colin.huang2@amd.com, Colin Huang <u8813345@gmail.com>, 
 Rex Fu <rex.fu.amd@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786622378; l=941;
 i=u8813345@gmail.com; s=20260202; h=from:subject:message-id;
 bh=f6LU0FAv4z223NfwbW5+xtWf2s69Q4QEuw+6jPL4YpI=;
 b=hxmqSUUNDPFUSi5olnMyqpzfvJ1Z1bOj6dU+/km8oNPb+g1XvRmOkm/uKa1kUDaYRoIa0YqE9
 2aaFkPODsyODkknuDeC+bw75S52+eNE2N5JNs+wP2WhQZQqClhSoVSv
X-Developer-Key: i=u8813345@gmail.com; a=ed25519;
 pk=Zlg0WqpCw4qbswOqamTBTXIchwR/3SnYZpy7rjaGMdQ=
X-Endpoint-Received: by B4 Relay for u8813345@gmail.com/20260202 with
 auth_id=761
X-Original-From: Colin Huang <u8813345@gmail.com>
Reply-To: u8813345@gmail.com

From: Rex Fu <rex.fu.amd@gmail.com>

Specify the 3.3 V auxiliary rail as the SPI flash VCC supply to
avoid using the dummy regulator during device initialization.

Signed-off-by: Rex Fu <rex.fu.amd@gmail.com>
---
 .../boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt2.dts | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt2.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt2.dts
index f913fa3f622d..cb4b815f1803 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt2.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt2.dts
@@ -27,6 +27,22 @@ / {
 	i2c51 = &i2c10mux0ch0;
 };
 
+&fmc {
+	flash@0 {
+		vcc-supply = <&p3v3_bmc_aux>;
+	};
+	flash@1 {
+		vcc-supply = <&p3v3_bmc_aux>;
+	};
+};
+
+// BIOS Flash
+&spi2 {
+	flash@0 {
+		vcc-supply = <&p3v3_bmc_aux>;
+	};
+};
+
 // MB - PDB
 &i2c8 {
 	i2c-mux@72 {

-- 
2.34.1


