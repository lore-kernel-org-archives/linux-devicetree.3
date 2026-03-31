Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 715F23CBE65;
	Tue, 31 Mar 2026 08:02:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774944152; cv=none; b=Ah4ngBcB1AEAx90eNdh4L5mU5NB3qLMaxt5mtqUDFoLDRG8STi1Cpfl1b2T/e5QtpK6AewKFq4ymaZHmnpJiZwggX28TAeKJkGNJ49ot/NSqzucYW0V+rIrki7duUDq0XSQxclbtjGncqjndMxl7ljbQI5DMkn6w4h8NCR6f9og=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774944152; c=relaxed/simple;
	bh=PHDS2VPVRfSiE1Ru3nMVenx5VOLgrNd57TaF4gFMkw8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=g9uZSBLIYYJ02uvdIKtBmvzv4SJR0QfoM5XMwPhfyfbR8FoLEyb2seN1uLxv8wH53/4+l2a/wtXHG0hVuEDyC76VuAVTlJ25+DLbnJai/OXi4zW2sqL6naNRvYsYSCDB42e2wFDD6dHOCBXFzyttnEJiPpnpmTVNpxQtMAWYxYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jCKeezCV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jCKeezCV"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 01E7CC19423;
	Tue, 31 Mar 2026 08:02:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774944152;
	bh=PHDS2VPVRfSiE1Ru3nMVenx5VOLgrNd57TaF4gFMkw8=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=jCKeezCV7gOu8EsUna52MOAbD/vJd6+TOoiXmoWUVdUwQgQlSB6e77O8yhHFpGo6W
	 98/nqwfP/inkJf+50mikcI3Lj2ivG0kYl7uIbh5s/ETVIqPike6C4VyZzAVbR/cR9R
	 pg7KSc0lh+bk1z/HMqrA2Yvb6xkzE0WlFEISgQQ3j/Oet7jPC3T77+S3YmQTtpxTLk
	 C9Hd2y0FrqFuqFcudJcKWmio64F4totGu3+uJIn1fnHOQLMGyO/ilk1ltchMQQpUJs
	 hl6uqrHroubCY4cZVzGnMbQxmbDfrtYGHwrfLqEFkpFf8O2k7hTnrSCjVy1y/cfm9/
	 Bas+84KuZ31RQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB251FF60D0;
	Tue, 31 Mar 2026 08:02:31 +0000 (UTC)
From: Carl Lee via B4 Relay <devnull+carl.lee.amd.com@kernel.org>
Date: Tue, 31 Mar 2026 16:02:28 +0800
Subject: [PATCH v3] ARM: dts: aspeed: anacapa: Add eeprom device node for
 NFC adaptor board
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260331-arm-dts-aspeed-anacapa-add-eeprom-device-v3-1-2bb2226fbb4e@amd.com>
X-B4-Tracking: v=1; b=H4sIAJN/y2kC/52NOw6DMBAFr4JcZyN/+Mipco8oxeLdBBdgZCMrE
 eLuMTTpKec9aWYViaPnJG7VKiJnn3yYCphLJdyA05vBU2GhpW6lkRYwjkBLAkwzMwFO6HBGQCJ
 gnmMob9E4BlSIPcsWTdOLopsjv/znSD2ehQeflhC/RzmrfT0RyQok1I202ijJkts7jnR1YRR7I
 uuzWg0KrHIdEdd9Z+mv3bbtB6vL7to1AQAA
X-Change-ID: 20260309-arm-dts-aspeed-anacapa-add-eeprom-device-a1aabe06a35b
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 carl.lee@amd.com, peter.shen@amd.com, colin.huang2@amd.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774944151; l=1502;
 i=carl.lee@amd.com; s=20260203; h=from:subject:message-id;
 bh=tK4ZlqqLdi/4bQSFXDH6JCKjm/zDadASdjOjaR1GT4A=;
 b=SaG/KqMDLIxRikW7LI9c8QOG9XIn/wzre1v8BpnxvZL8oSWTfadp8FR8SP4Lf7sUfnMLULhG0
 NjbP5yWI7GmC0NzJJoaRnpZ72jo1n6xtViWE2VC6hqD6/Q/kYVsRVaK
X-Developer-Key: i=carl.lee@amd.com; a=ed25519;
 pk=pyq7QaQvoxMg806KVkRwpCbiah+7ncWr4MBpK1AEyjA=
X-Endpoint-Received: by B4 Relay for carl.lee@amd.com/20260203 with
 auth_id=623
X-Original-From: Carl Lee <carl.lee@amd.com>
Reply-To: carl.lee@amd.com

From: Carl Lee <carl.lee@amd.com>

Add eeprom device node for NFC adaptor board FRU.

Signed-off-by: Carl Lee <carl.lee@amd.com>
---
Add eeprom device node to store FRU data for NFC adapter
board on Anacapa platform.
---
Changes in v3:
- Fix node ordering to follow ascending unit address
- Update commit message to match actual changes
- Link to v2: https://lore.kernel.org/r/20260309-arm-dts-aspeed-anacapa-add-eeprom-device-v2-1-91c7dde4b79d@amd.com

Changes in v2:
- Remove PRoT module eeprom commit since it is already included in another series under review.
- Only include NFC adapter board eeprom node.
- Link to v1: https://lore.kernel.org/r/20260309-arm-dts-aspeed-anacapa-add-eeprom-device-v1-0-45092310e0e6@amd.com
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts
index 2cb7bd128d24..57fd81e931d6 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts
@@ -824,6 +824,11 @@ nfc@28 {
 
 				enable-gpios = <&sgpiom0 241 GPIO_ACTIVE_HIGH>;
 			};
+
+			eeprom@50 {
+				compatible = "atmel,24c128";
+				reg = <0x50>;
+			};
 		};
 	};
 };

---
base-commit: a0ae2a256046c0c5d3778d1a194ff2e171f16e5f
change-id: 20260309-arm-dts-aspeed-anacapa-add-eeprom-device-a1aabe06a35b

Best regards,
-- 
Carl Lee <carl.lee@amd.com>


